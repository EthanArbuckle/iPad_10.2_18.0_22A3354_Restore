@implementation MTKTextureLoaderPVR

+ (BOOL)isPVRFile:(id)a3
{
  _OWORD v5[2];
  __int128 v6;
  int v7;

  if (!a3)
    return 0;
  if ((unint64_t)objc_msgSend(a3, "length") < 0x34)
    return 0;
  v7 = 0;
  v6 = 0u;
  memset(v5, 0, sizeof(v5));
  objc_msgSend(a3, "getBytes:length:", v5, 52);
  return HIDWORD(v6) == 559044176;
}

- (MTKTextureLoaderPVR)initWithData:(id)a3 options:(id)a4 error:(id *)a5
{
  MTKTextureLoaderPVR *v8;
  unsigned int *v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int flags;
  uint64_t v14;
  uint64_t v15;
  const __CFString *v16;
  unsigned int numSurfaces;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  unint64_t v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)MTKTextureLoaderPVR;
  v8 = -[MTKTextureLoaderData init](&v23, sel_init);
  if (v8)
  {
    v8->_imageData = (NSData *)a3;
    if (!+[MTKTextureLoaderPVR isPVRFile:](MTKTextureLoaderPVR, "isPVRFile:", a3))
      -[MTKTextureLoaderPVR initWithData:options:error:].cold.1();
    v9 = -[NSData bytes](v8->_imageData, "bytes");
    v10 = v9;
    v11 = v9[4];
    v8->_pvrFormat = v11;
    v12 = v9[12];
    if (v12 <= 1)
      v12 = 1;
    v8->_numSurfaces = v12;
    -[MTKTextureLoaderData setWidth:](v8, "setWidth:", v9[2]);
    -[MTKTextureLoaderData setHeight:](v8, "setHeight:", v10[1]);
    -[MTKTextureLoaderData setNumMipmapLevels:](v8, "setNumMipmapLevels:", v10[3] + 1);
    -[MTKTextureLoaderData setNumFaces:](v8, "setNumFaces:", 1);
    -[MTKTextureLoaderData setImageOrigin:](v8, "setImageOrigin:", CFSTR("MTKTextureLoaderOriginTopLeft"));
    if (-[MTKTextureLoaderPVR determineFormat:options:](v8, "determineFormat:options:", v8->_pvrFormat, a4))
    {
      -[MTKTextureLoaderData pixelFormat](v8, "pixelFormat");
      MTLPixelFormatGetInfoForDevice();
      v8->_pixelFormatInfo.type.normal.pixelBytesRenderMSAA = v22;
      *(_OWORD *)&v8->_pixelFormatInfo.castClass = v20;
      *(_OWORD *)&v8->_pixelFormatInfo.type.compressed.blockWidth = v21;
      *(_OWORD *)&v8->_pixelFormatInfo.name = v19;
      flags = v8->_pixelFormatInfo.flags;
      v14 = objc_msgSend(a4, "objectForKey:", CFSTR("MTKTextureLoaderOptionOrigin"));
      v15 = v14;
      if ((flags & 0x400) == 0 || !v14)
      {
        if ((v11 & 0x1000) != 0)
        {
          -[MTKTextureLoaderData setTextureType:](v8, "setTextureType:", 5);
          -[MTKTextureLoaderData setNumFaces:](v8, "setNumFaces:", 6);
          numSurfaces = v8->_numSurfaces;
          v8->_numSurfaces = numSurfaces / 6;
          if (numSurfaces >= 0xC)
          {
            if (!a5)
              goto LABEL_13;
            v16 = CFSTR("Metal does not support texture cube arrays");
            goto LABEL_12;
          }
        }
        else if ((v11 & 0x4000) != 0)
        {
          -[MTKTextureLoaderData setTextureType:](v8, "setTextureType:", 7);
          -[MTKTextureLoaderData setDepth:](v8, "setDepth:", v8->_numSurfaces);
        }
        else if (v8->_numSurfaces >= 2)
        {
          -[MTKTextureLoaderData setTextureType:](v8, "setTextureType:", 3);
          -[MTKTextureLoaderData setNumArrayElements:](v8, "setNumArrayElements:", v8->_numSurfaces);
        }
        if (!v15
          || -[MTKTextureLoaderData textureType](v8, "textureType") == 2
          || -[MTKTextureLoaderData textureType](v8, "textureType") == 3
          || -[MTKTextureLoaderData textureType](v8, "textureType") == 5)
        {
          if (!objc_msgSend(a4, "objectForKey:", CFSTR("MTKTextureLoaderOptionCubeLayout")))
            return v8;
          if (!a5)
            goto LABEL_13;
          v16 = CFSTR("Creating cube maps from 2D textures is not supported for PVR files");
        }
        else
        {
          if (!a5)
            goto LABEL_13;
          v16 = CFSTR("Vertical flip is only supported for 2D, 2D array, and cube map textures");
        }
LABEL_12:
        *a5 = (id)_newMTKTextureErrorWithCodeAndErrorString(0, (uint64_t)v16);
        goto LABEL_13;
      }
      if (a5)
      {
        v16 = CFSTR("Vertical flip is not supported for compressed PVR textures");
        goto LABEL_12;
      }
    }
    else if (a5)
    {
      v16 = CFSTR("Could not determine format from PVR header");
      goto LABEL_12;
    }
LABEL_13:

    return 0;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  self->_imageData = 0;
  v3.receiver = self;
  v3.super_class = (Class)MTKTextureLoaderPVR;
  -[MTKTextureLoaderData dealloc](&v3, sel_dealloc);
}

- (id)getDataForArrayElement:(unint64_t)a3 face:(unint64_t)a4 level:(unint64_t)a5 depthPlane:(unint64_t)a6 bytesPerRow:(unint64_t *)a7 bytesPerImage:(unint64_t *)a8
{
  char *v13;
  NSUInteger v14;
  id result;
  unint64_t v16;
  NSUInteger v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  _BOOL4 v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  _BOOL4 v26;
  unint64_t v27;
  unint64_t v28;
  BOOL v29;
  unint64_t v31;
  unint64_t *v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v37;
  _BOOL4 v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v13 = -[NSData bytes](self->_imageData, "bytes");
  v14 = -[NSData length](self->_imageData, "length");
  result = -[MTKTextureLoaderData depth](self, "depth");
  if (result)
  {
    v32 = a8;
    v16 = 0;
    v17 = v14 - 52;
    v18 = v13 + 52;
    while (!-[MTKTextureLoaderData numArrayElements](self, "numArrayElements"))
    {
LABEL_35:
      ++v16;
      v31 = -[MTKTextureLoaderData depth](self, "depth");
      result = 0;
      if (v31 <= v16)
        return result;
    }
    v19 = 0;
    v34 = a3;
    v35 = a6;
    v33 = v16;
    while (1)
    {
      v37 = v19;
      if (-[MTKTextureLoaderData numFaces](self, "numFaces"))
        break;
LABEL_34:
      v19 = v37 + 1;
      a3 = v34;
      a6 = v35;
      v16 = v33;
      if (-[MTKTextureLoaderData numArrayElements](self, "numArrayElements") <= v37 + 1)
        goto LABEL_35;
    }
    v20 = 0;
    v22 = v16 == a6 && v19 == a3;
    v38 = v22;
    while (1)
    {
      v23 = -[MTKTextureLoaderData width](self, "width");
      v24 = -[MTKTextureLoaderData height](self, "height");
      if (-[MTKTextureLoaderData numMipmapLevels](self, "numMipmapLevels"))
        break;
LABEL_33:
      if (-[MTKTextureLoaderData numFaces](self, "numFaces") <= ++v20)
        goto LABEL_34;
    }
    v25 = 0;
    v26 = v20 == a4 && v38;
    while (1)
    {
      v43 = 0;
      v41 = 0;
      v42 = 0;
      v40 = 0;
      if ((self->_pixelFormatInfo.flags & 0x400) != 0)
      {
        -[MTKTextureLoaderPVR determineBlockSize:blocksWide:blocksHigh:bytesPerBlock:fromFormat:width:andHeight:](self, "determineBlockSize:blocksWide:blocksHigh:bytesPerBlock:fromFormat:width:andHeight:", &v43, &v42, &v41, &v40, self->_pvrFormat, v23, v24);
        v27 = v42 * v40;
        v28 = v42 * v40 * v41;
      }
      else
      {
        v27 = self->_pixelFormatInfo.type.normal.pixelBytes * v23;
        v28 = v27 * v24;
      }
      v29 = v17 >= v28;
      v17 -= v28;
      if (!v29)
        return 0;
      if (a5 == v25 && v26)
        break;
      v18 += v28;
      if (v23 <= 1)
        v23 = 1;
      else
        v23 >>= 1;
      if (v24 <= 1)
        v24 = 1;
      else
        v24 >>= 1;
      if (-[MTKTextureLoaderData numMipmapLevels](self, "numMipmapLevels") <= ++v25)
        goto LABEL_33;
    }
    *a7 = v27;
    *v32 = v28;
    return (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v18);
  }
  return result;
}

- (BOOL)determineFormat:(unsigned int)a3 options:(id)a4
{
  int v6;
  BOOL result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  v6 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("MTKTextureLoaderOptionSRGB")), "BOOLValue");
  result = 0;
  v8 = 42;
  switch(a3)
  {
    case 0x10u:
      goto LABEL_15;
    case 0x11u:
      v8 = 41;
      goto LABEL_15;
    case 0x12u:
    case 0x1Au:
      v9 = v6 == 0;
      v10 = 70;
      goto LABEL_12;
    case 0x13u:
      v8 = 40;
      goto LABEL_15;
    case 0x14u:
    case 0x15u:
      return result;
    case 0x16u:
      v9 = v6 == 0;
      v10 = 10;
      goto LABEL_12;
    case 0x17u:
      v9 = v6 == 0;
      v10 = 30;
      goto LABEL_12;
    case 0x18u:
      v9 = v6 == 0;
      v10 = 164;
      goto LABEL_12;
    case 0x19u:
      v9 = v6 == 0;
      v10 = 166;
LABEL_12:
      if (v9)
        v8 = v10;
      else
        v8 = v10 + 1;
      goto LABEL_15;
    case 0x1Bu:
      v8 = 1;
      goto LABEL_15;
    default:
      if (a3 == 50)
      {
        v8 = 115;
      }
      else
      {
        if (a3 != 53)
          return result;
        v8 = 125;
      }
LABEL_15:
      -[MTKTextureLoaderData setPixelFormat:](self, "setPixelFormat:", v8);
      return 1;
  }
}

- (void)determineBlockSize:(unint64_t *)a3 blocksWide:(unint64_t *)a4 blocksHigh:(unint64_t *)a5 bytesPerBlock:(unint64_t *)a6 fromFormat:(unsigned int)a7 width:(unint64_t)a8 andHeight:(unint64_t)a9
{
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  char v12;
  unint64_t v13;
  unint64_t v14;

  v9 = (a9 + 3) >> 2;
  v10 = 2;
  if (v9 <= 2)
    v9 = 2;
  v11 = 3;
  if (a7 == 24)
  {
    v11 = 7;
    v12 = 3;
  }
  else
  {
    v12 = 2;
  }
  v13 = 16;
  if (a7 == 24)
    v13 = 32;
  v14 = (v11 + a8) >> v12;
  if (v14 > 2)
    v10 = v14;
  *a4 = v10;
  *a5 = v9;
  *a3 = v13;
  *a6 = 8;
}

- (void)initWithData:options:error:.cold.1()
{
  __assert_rtn("-[MTKTextureLoaderPVR initWithData:options:error:]", "MTKTextureLoaderPVR.m", 116, "[MTKTextureLoaderPVR isPVRFile:data] && \"This function should not be reachable.\");
}

@end
