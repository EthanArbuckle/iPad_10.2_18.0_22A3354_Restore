@implementation MTKTextureLoaderKTX

+ (BOOL)isKTXFile:(id)a3
{
  uint64_t v5;

  if (!a3)
    return 0;
  if ((unint64_t)objc_msgSend(a3, "length") < 0x40)
    return 0;
  v5 = objc_msgSend(a3, "bytes");
  return *(_QWORD *)v5 == gKTXFileIdentifier && *(_DWORD *)(v5 + 8) == (unint64_t)dword_25462C7A0;
}

- (MTKTextureLoaderKTX)initWithData:(id)a3 options:(id)a4 error:(id *)a5
{
  char *v8;
  unsigned int *v9;
  unsigned int v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  unint64_t v23;
  uint64_t v24;
  const __CFString *v25;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t i;
  uint64_t v31;
  int64_t v32;
  unint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  _OWORD v42[3];
  uint64_t v43;
  objc_super v44;

  v44.receiver = self;
  v44.super_class = (Class)MTKTextureLoaderKTX;
  v8 = -[MTKTextureLoaderData init](&v44, sel_init);
  if (v8)
  {
    if (!+[MTKTextureLoaderKTX isKTXFile:](MTKTextureLoaderKTX, "isKTXFile:", a3))
      -[MTKTextureLoaderKTX initWithData:options:error:].cold.1();
    v9 = (unsigned int *)objc_msgSend(a3, "bytes");
    objc_msgSend(v8, "setWidth:", v9[9]);
    v10 = v9[10];
    if (v10 <= 1)
      v11 = 1;
    else
      v11 = v10;
    objc_msgSend(v8, "setHeight:", v11);
    v12 = v9[11];
    if (v12 <= 1)
      v13 = 1;
    else
      v13 = v12;
    objc_msgSend(v8, "setDepth:", v13);
    v14 = v9[12];
    if (v14 <= 1)
      v15 = 1;
    else
      v15 = v14;
    objc_msgSend(v8, "setNumArrayElements:", v15);
    v16 = v9[13];
    if (v16 <= 1)
      v17 = 1;
    else
      v17 = v16;
    objc_msgSend(v8, "setNumFaces:", v17);
    v18 = v9[14];
    if (v18 <= 1)
      v19 = 1;
    else
      v19 = v18;
    objc_msgSend(v8, "setNumMipmapLevels:", v19);
    objc_msgSend(v8, "setImageOrigin:", CFSTR("MTKTextureLoaderOriginTopLeft"));
    objc_msgSend(v8, "setPixelFormat:", objc_msgSend(v8, "determineFormatFromType:format:internalFormat:baseInternalFormat:", v9[4], v9[6], v9[7], v9[8]));
    if (!objc_msgSend(v8, "pixelFormat"))
    {
      if (!a5)
      {
LABEL_34:

        return 0;
      }
      v25 = CFSTR("Could not determine format from KTX header");
      goto LABEL_33;
    }
    objc_msgSend(v8, "pixelFormat");
    MTLPixelFormatGetInfoForDevice();
    v20 = v42[0];
    v21 = v42[1];
    v22 = v42[2];
    *((_QWORD *)v8 + 17) = v43;
    *(_OWORD *)(v8 + 104) = v21;
    *(_OWORD *)(v8 + 120) = v22;
    *(_OWORD *)(v8 + 88) = v20;
    v23 = v9[15];
    if (objc_msgSend(a3, "length") - 64 < v23
      || !objc_msgSend(v8, "parseKeyValueBytes:length:error:", objc_msgSend(a3, "bytes") + 64, v23, a5))
    {
      goto LABEL_34;
    }
    *((_QWORD *)v8 + 10) = (id)objc_msgSend(a3, "subdataWithRange:", v23 + 64, objc_msgSend(a3, "length") - v23 - 64);
    objc_msgSend(v8, "setTextureType:", 0);
    if ((unint64_t)objc_msgSend(v8, "height") >= 2)
      objc_msgSend(v8, "setTextureType:", 2);
    if ((unint64_t)objc_msgSend(v8, "depth") >= 2)
      objc_msgSend(v8, "setTextureType:", 7);
    if (objc_msgSend(v8, "numFaces") == 6)
      objc_msgSend(v8, "setTextureType:", 5);
    if ((unint64_t)objc_msgSend(v8, "numArrayElements") >= 2)
    {
      if (objc_msgSend(v8, "textureType"))
      {
        if (objc_msgSend(v8, "textureType") == 2)
        {
          v24 = 3;
        }
        else
        {
          if (objc_msgSend(v8, "textureType") != 5)
            goto LABEL_40;
          v24 = 6;
        }
      }
      else
      {
        v24 = 1;
      }
      objc_msgSend(v8, "setTextureType:", v24);
    }
LABEL_40:
    if ((unint64_t)(objc_msgSend(v8, "pixelFormat") - 203) <= 0xF && objc_msgSend(v8, "numArrayElements"))
    {
      v27 = 0;
      do
      {
        if (objc_msgSend(v8, "numFaces"))
        {
          v28 = 0;
          do
          {
            if (objc_msgSend(v8, "numMipmapLevels"))
            {
              v29 = 0;
              do
              {
                if (objc_msgSend(v8, "depth"))
                {
                  for (i = 0; i < objc_msgSend(v8, "depth"); ++i)
                  {
                    v41 = 0;
                    *(_QWORD *)&v42[0] = 0;
                    v31 = objc_msgSend(v8, "getDataForArrayElement:face:level:depthPlane:bytesPerRow:bytesPerImage:", v27, v28, v29, i, v42, &v41);
                    if (!v31)
                      break;
                    v32 = +[MTKTextureLoaderASTCHelper isASTCHDRData:is3DBlocks:error:](MTKTextureLoaderASTCHelper, "isASTCHDRData:is3DBlocks:error:", v31, 0, 0);
                    if (v32 == -1)
                      break;
                    if (v32 == 1)
                    {
                      v33 = objc_msgSend(v8, "pixelFormat") - 204;
                      if (v33 > 0xE)
                        v34 = 0;
                      else
                        v34 = qword_20AE4BF28[v33];
                      objc_msgSend(v8, "setPixelFormat:", v34);
                      break;
                    }
                  }
                }
                ++v29;
              }
              while (v29 < objc_msgSend(v8, "numMipmapLevels"));
            }
            ++v28;
          }
          while (v28 < objc_msgSend(v8, "numFaces"));
        }
        ++v27;
      }
      while (v27 < objc_msgSend(v8, "numArrayElements"));
    }
    v35 = *((_DWORD *)v8 + 24);
    v36 = objc_msgSend(a4, "objectForKey:", CFSTR("MTKTextureLoaderOptionOrigin"));
    if ((v35 & 0x400) != 0 && v36)
    {
      if (!a5)
        goto LABEL_34;
      v25 = CFSTR("Vertical flip is not supported for block texture formats");
      goto LABEL_33;
    }
    if (!v36
      || objc_msgSend(v8, "textureType") == 2
      || objc_msgSend(v8, "textureType") == 3
      || objc_msgSend(v8, "textureType") == 5)
    {
      if (objc_msgSend(a4, "objectForKey:", CFSTR("MTKTextureLoaderOptionCubeLayout")))
      {
        if (!a5)
          goto LABEL_34;
        v25 = CFSTR("Creating cube maps from 2D textures is not supported for KTX files");
        goto LABEL_33;
      }
      if (!_mtkLinkedOnOrAfter(1uLL))
      {
        v8[144] = 1;
        return (MTKTextureLoaderKTX *)v8;
      }
      v37 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("MTKTextureLoaderOptionSRGB"));
      if (!v37)
        goto LABEL_82;
      v38 = v37;
      if (objc_msgSend(v37, "BOOLValue"))
      {
        v39 = selectSRGBFormat(objc_msgSend(v8, "pixelFormat"));
      }
      else
      {
        if ((objc_msgSend(v38, "BOOLValue") & 1) != 0)
          goto LABEL_82;
        v39 = selectRGBPixelFormat(objc_msgSend(v8, "pixelFormat"));
      }
      objc_msgSend(v8, "setPixelFormat:", v39);
LABEL_82:
      v40 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("MTKTextureLoaderOptionPackedRowStride"));
      if (v40)
        v8[144] = objc_msgSend(v40, "BOOLValue");
      else
        v8[144] = 0;
      return (MTKTextureLoaderKTX *)v8;
    }
    if (!a5)
      goto LABEL_34;
    v25 = CFSTR("Vertical flip is only supported for 2D, 2D array, and cube map textures");
LABEL_33:
    *a5 = (id)_newMTKTextureErrorWithCodeAndErrorString(0, (uint64_t)v25);
    goto LABEL_34;
  }
  return (MTKTextureLoaderKTX *)v8;
}

- (id)getDataForArrayElement:(unint64_t)a3 face:(unint64_t)a4 level:(unint64_t)a5 depthPlane:(unint64_t)a6 bytesPerRow:(unint64_t *)a7 bytesPerImage:(unint64_t *)a8
{
  char *v10;
  NSUInteger v11;
  char *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL4 v20;
  unint64_t v21;
  _BOOL4 v22;
  unint64_t v23;
  uint64_t v25;
  uint64_t v26;
  unint64_t v28;
  _BOOL4 v31;
  char *v32;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;

  v10 = -[NSData bytes](self->_imageData, "bytes");
  v11 = -[NSData length](self->_imageData, "length");
  v38 = -[MTKTextureLoaderData width](self, "width");
  v37 = -[MTKTextureLoaderData height](self, "height");
  if (-[MTKTextureLoaderData numMipmapLevels](self, "numMipmapLevels"))
  {
    v36 = 0;
    v12 = &v10[v11];
    v32 = &v10[v11];
    while (1)
    {
      if ((self->_pixelFormatInfo.flags & 0x400) != 0)
      {
        v13 = (v38 + self->_pixelFormatInfo.type.compressed.blockWidth - 1)
            / self->_pixelFormatInfo.type.compressed.blockWidth
            * self->_pixelFormatInfo.type.normal.pixelBytes;
        v14 = (v37 + self->_pixelFormatInfo.type.normal.pixelBytesRender - 1)
            / self->_pixelFormatInfo.type.normal.pixelBytesRender;
      }
      else
      {
        v13 = self->_packedRowStride
            ? self->_pixelFormatInfo.type.normal.pixelBytes * v38
            : (self->_pixelFormatInfo.type.normal.pixelBytes * v38 + 3) & 0xFFFFFFFFFFFFFFFCLL;
        v14 = v37;
      }
      v15 = v13 * v14;
      v16 = (unint64_t)(v10 + 4);
      if (-[MTKTextureLoaderData numArrayElements](self, "numArrayElements"))
        break;
LABEL_35:
      if (v38 <= 1)
        v25 = 1;
      else
        v25 = v38 >> 1;
      v26 = v37 >> 1;
      if (v37 <= 1)
        v26 = 1;
      v37 = v26;
      v38 = v25;
      v10 = (char *)((v16 + 3) & 0xFFFFFFFFFFFFFFFCLL);
      if (-[MTKTextureLoaderData numMipmapLevels](self, "numMipmapLevels") <= ++v36)
        return 0;
    }
    v28 = v13;
    v17 = 0;
    while (!-[MTKTextureLoaderData numFaces](self, "numFaces", v28))
    {
LABEL_34:
      if (-[MTKTextureLoaderData numArrayElements](self, "numArrayElements") <= ++v17)
        goto LABEL_35;
    }
    v18 = 0;
    v20 = v36 == a5 && v17 == a3;
    v31 = v20;
    while (!-[MTKTextureLoaderData depth](self, "depth"))
    {
LABEL_31:
      if (-[MTKTextureLoaderData textureType](self, "textureType") == 5)
        v16 = (v16 + 3) & 0xFFFFFFFFFFFFFFFCLL;
      if (-[MTKTextureLoaderData numFaces](self, "numFaces") <= ++v18)
        goto LABEL_34;
    }
    v21 = 0;
    v22 = v18 == a4 && v31;
    v23 = (unint64_t)&v32[-v16];
    while (v16 >= (unint64_t)v12 || v23 >= v15)
    {
      if (a6 == v21 && v22)
      {
        *a7 = v28;
        *a8 = v15;
        return (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v16, v15, 0);
      }
      v16 += v15;
      ++v21;
      v23 -= v15;
      if (-[MTKTextureLoaderData depth](self, "depth") <= v21)
        goto LABEL_31;
    }
  }
  return 0;
}

- (BOOL)parseKeyValueBytes:(const char *)a3 length:(unint64_t)a4 error:(id *)a5
{
  const char *v5;
  const char *v6;
  const char *v8;
  const char *v10;
  size_t v11;
  unsigned int v12;
  size_t v13;
  size_t v15;
  size_t v16;
  uint64_t v17;
  _BOOL4 v18;

  v5 = &a3[a4];
  v6 = &a3[a4 - 4];
  if (v6 <= a3)
  {
LABEL_11:
    LOBYTE(v18) = 1;
  }
  else
  {
    v8 = a3;
    while (1)
    {
      v12 = *(_DWORD *)v8;
      v10 = v8 + 4;
      v11 = v12;
      if (v5 - v10 < (unint64_t)v12)
        break;
      v13 = strnlen(v10, v11);
      if (!v13 || v11 <= v13)
        break;
      v15 = v13;
      v16 = v11 - v13;
      v17 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v10, 4);
      v18 = -[MTKTextureLoaderKTX parseKey:value:error:](self, "parseKey:value:error:", v17, objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", &v10[v15 + 1], v16, 0), a5);
      if (!v18)
        return v18;
      v8 = (const char *)((unint64_t)&v10[v11 + 3] & 0xFFFFFFFFFFFFFFFCLL);
      if (v6 <= v8)
        goto LABEL_11;
    }
    LOBYTE(v18) = 0;
  }
  return v18;
}

- (unint64_t)determineFormatFromType:(unsigned int)a3 format:(unsigned int)a4 internalFormat:(unsigned int)a5 baseInternalFormat:(unsigned int)a6
{
  BOOL v6;
  int v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t result;
  BOOL v12;
  unint64_t v13;
  int v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;

  if (a3)
    v6 = a4 == 0;
  else
    v6 = 1;
  v7 = v6;
  if (a5 == a4 && (v7 & 1) == 0)
  {
    if ((int)a4 <= 33318)
    {
      v14 = 6403;
      v15 = 12;
      if (a3 != 5120)
        v15 = 0;
      if (a3 == 5121)
        v15 = 10;
      v16 = 70;
      if (a3 != 5121)
        v16 = 0;
      v17 = 80;
      if (a3 != 5121)
        v17 = 0;
      if (a4 != 32993)
        v17 = 0;
      if (a4 == 6408)
        v17 = v16;
    }
    else
    {
      if ((int)a4 <= 36243)
      {
        v8 = 30;
        if (a3 != 5121)
          v8 = 0;
        v9 = 34;
        if (a3 != 5120)
          v9 = 0;
        v10 = 33;
        if (a3 != 5121)
          v10 = v9;
        if (a4 != 33320)
          v10 = 0;
        if (a4 == 33319)
          return v8;
        else
          return v10;
      }
      v14 = 36244;
      v15 = 14;
      if (a3 != 5120)
        v15 = 0;
      if (a3 == 5121)
        v15 = 13;
      v18 = 91;
      if (a3 != 33640)
        v18 = 0;
      if (a4 == 36249)
        v17 = v18;
      else
        v17 = 0;
    }
    if (a4 == v14)
      return v15;
    else
      return v17;
  }
  if (a5 != a4 || ((v7 ^ 1) & 1) != 0)
    return -[MTKTextureLoaderKTX determineFormatFromSizedFormat:](self, "determineFormatFromSizedFormat:", a5);
  switch(a4)
  {
    case 0x8DBBu:
      v12 = a6 == 6407;
      v13 = 140;
      goto LABEL_62;
    case 0x8DBCu:
      v12 = a6 == 6407;
      v13 = 141;
      goto LABEL_62;
    case 0x8DBDu:
      v12 = a6 == 6407;
      v13 = 142;
      goto LABEL_62;
    case 0x8DBEu:
      v12 = a6 == 6407;
      v13 = 143;
LABEL_62:
      if (v12)
        result = v13;
      else
        result = 0;
      break;
    default:
      switch(a4)
      {
        case 0x8E8Cu:
          v12 = a6 == 6408;
          v13 = 152;
          goto LABEL_62;
        case 0x8E8Du:
          v12 = a6 == 6408;
          v13 = 153;
          goto LABEL_62;
        case 0x8E8Eu:
          v12 = a6 == 6407;
          v13 = 150;
          goto LABEL_62;
        case 0x8E8Fu:
          v12 = a6 == 6407;
          v13 = 151;
          goto LABEL_62;
        default:
          result = 0;
          break;
      }
      break;
  }
  return result;
}

- (unint64_t)determineFormatFromSizedFormat:(unint64_t)a3
{
  char v4;
  uint64_t v5;
  char v7;

  v4 = _mtkLinkedBefore(1uLL);
  v5 = 0;
  while (determineFormatFromSizedFormat__ktxFormats[v5] != a3)
  {
    if (++v5 == 105)
      return 0;
  }
  if (v5 == 1)
    v7 = v4;
  else
    v7 = 0;
  if ((v7 & 1) != 0)
    return 71;
  else
    return determineFormatFromSizedFormat__mtlFormats[v5];
}

- (void)dealloc
{
  objc_super v3;

  self->_imageData = 0;
  v3.receiver = self;
  v3.super_class = (Class)MTKTextureLoaderKTX;
  -[MTKTextureLoaderData dealloc](&v3, sel_dealloc);
}

- (BOOL)parseKey:(id)a3 value:(id)a4 error:(id *)a5
{
  void *v8;
  MTKTextureLoaderOrigin *v9;
  BOOL v10;

  if (objc_msgSend((id)objc_msgSend(a3, "lowercaseString"), "isEqualToString:", CFSTR("ktxorientation"))
    && _mtkLinkedOnOrAfter(0))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", a4, 4);
    if ((objc_msgSend(v8, "hasPrefix:", CFSTR("S=r,T=d")) & 1) != 0)
    {
      v9 = &MTKTextureLoaderOriginTopLeft;
    }
    else
    {
      if ((objc_msgSend(v8, "hasPrefix:", CFSTR("S=r,T=u")) & 1) == 0)
      {
        v10 = 0;
        if (a5)
          *a5 = (id)_newMTKTextureErrorWithCodeAndErrorString(0, (uint64_t)CFSTR("Unsupported image orientation"));
        goto LABEL_9;
      }
      v9 = &MTKTextureLoaderOriginBottomLeft;
    }
    -[MTKTextureLoaderData setImageOrigin:](self, "setImageOrigin:", *v9);
    v10 = 1;
LABEL_9:

    return v10;
  }
  return 1;
}

- (void)initWithData:options:error:.cold.1()
{
  __assert_rtn("-[MTKTextureLoaderKTX initWithData:options:error:]", "MTKTextureLoaderKTX.m", 519, "[MTKTextureLoaderKTX isKTXFile:data] && \"Function should not be reachable.\");
}

@end
