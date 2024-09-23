@implementation MTKTextureLoaderPVR3

+ (BOOL)isPVR3File:(id)a3
{
  _OWORD v5[3];
  int v6;

  if (!a3)
    return 0;
  if ((unint64_t)objc_msgSend(a3, "length") < 0x34)
    return 0;
  v6 = 0;
  memset(v5, 0, sizeof(v5));
  objc_msgSend(a3, "getBytes:length:", v5, 52);
  return LODWORD(v5[0]) == 55727696;
}

- (MTKTextureLoaderPVR3)initWithData:(id)a3 options:(id)a4 error:(id *)a5
{
  char *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)MTKTextureLoaderPVR3;
  v8 = -[MTKTextureLoaderData init](&v23, sel_init);
  if (!v8)
    return (MTKTextureLoaderPVR3 *)v8;
  if (!+[MTKTextureLoaderPVR3 isPVR3File:](MTKTextureLoaderPVR3, "isPVR3File:", a3))
    -[MTKTextureLoaderPVR3 initWithData:options:error:].cold.1();
  v9 = a3;
  *((_QWORD *)v8 + 19) = v9;
  v10 = objc_msgSend(v9, "bytes");
  objc_msgSend(v8, "setWidth:", *(unsigned int *)(v10 + 28));
  objc_msgSend(v8, "setHeight:", *(unsigned int *)(v10 + 24));
  objc_msgSend(v8, "setDepth:", *(unsigned int *)(v10 + 32));
  v11 = *(unsigned int *)(v10 + 36);
  objc_msgSend(v8, "setNumFaces:", *(unsigned int *)(v10 + 40));
  objc_msgSend(v8, "setNumMipmapLevels:", *(unsigned int *)(v10 + 44));
  *((_DWORD *)v8 + 36) = *(_DWORD *)(v10 + 48);
  objc_msgSend(v8, "setImageOrigin:", CFSTR("MTKTextureLoaderOriginTopLeft"));
  if (!objc_msgSend(v8, "parseMetadataWithError:", a5))
    goto LABEL_32;
  *((_DWORD *)v8 + 20) = *(_QWORD *)(v10 + 8);
  objc_msgSend(v8, "setPixelFormat:", objc_msgSend(v8, "determineFormat:colorSpace:channelType:options:"));
  if (!objc_msgSend(v8, "pixelFormat"))
  {
    if (a5)
    {
      v15 = CFSTR("Could not determine format from PVR header");
      goto LABEL_31;
    }
LABEL_32:

    return 0;
  }
  objc_msgSend(v8, "pixelFormat");
  MTLPixelFormatGetInfoForDevice();
  *((_QWORD *)v8 + 17) = v22;
  *(_OWORD *)(v8 + 104) = v20;
  *(_OWORD *)(v8 + 120) = v21;
  *(_OWORD *)(v8 + 88) = v19;
  v12 = *((_DWORD *)v8 + 24);
  v13 = objc_msgSend(a4, "objectForKey:", CFSTR("MTKTextureLoaderOptionOrigin"));
  v14 = v13;
  if ((v12 & 0x400) != 0 && v13)
  {
    if (a5)
    {
      v15 = CFSTR("Vertical flip is not supported for compressed PVR textures");
LABEL_31:
      *a5 = (id)_newMTKTextureErrorWithCodeAndErrorString(0, (uint64_t)v15);
      goto LABEL_32;
    }
    goto LABEL_32;
  }
  if (v11 >= 2)
  {
    if ((unint64_t)objc_msgSend(v8, "numFaces") >= 2)
    {
      if (a5)
      {
        v15 = CFSTR("Metal does not support texture cube arrays");
        goto LABEL_31;
      }
      goto LABEL_32;
    }
    if ((unint64_t)objc_msgSend(v8, "depth") <= 1)
    {
      objc_msgSend(v8, "setTextureType:", 3);
      objc_msgSend(v8, "setNumArrayElements:", v11);
      if (v14)
        goto LABEL_22;
      goto LABEL_28;
    }
    goto LABEL_19;
  }
  if ((unint64_t)objc_msgSend(v8, "depth") >= 2)
  {
LABEL_19:
    v16 = v8;
    v17 = 7;
    goto LABEL_21;
  }
  if ((unint64_t)objc_msgSend(v8, "numFaces") < 2)
  {
    v16 = v8;
    v17 = 2;
  }
  else
  {
    v16 = v8;
    v17 = 5;
  }
LABEL_21:
  objc_msgSend(v16, "setTextureType:", v17);
  if (v14)
  {
LABEL_22:
    if (objc_msgSend(v8, "textureType") != 2
      && objc_msgSend(v8, "textureType") != 3
      && objc_msgSend(v8, "textureType") != 5)
    {
      if (a5)
      {
        v15 = CFSTR("Vertical flip is only supported for 2D, 2D array, and cube map textures");
        goto LABEL_31;
      }
      goto LABEL_32;
    }
  }
LABEL_28:
  if (objc_msgSend(a4, "objectForKey:", CFSTR("MTKTextureLoaderOptionCubeLayout")))
  {
    if (a5)
    {
      v15 = CFSTR("Creating cube maps from 2D textures is not supported for PVR files");
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  return (MTKTextureLoaderPVR3 *)v8;
}

- (void)dealloc
{
  objc_super v3;

  self->_imageData = 0;
  v3.receiver = self;
  v3.super_class = (Class)MTKTextureLoaderPVR3;
  -[MTKTextureLoaderData dealloc](&v3, sel_dealloc);
}

- (BOOL)parseMetadataWithError:(id *)a3
{
  const __CFString *v5;
  void *v6;
  BOOL result;
  char *v8;
  uint64_t metaDataSize;
  unint64_t v10;
  char *v11;
  char *v12;
  int64_t v13;
  char *v14;
  const __CFString *v16;

  if (-[NSData length](self->_imageData, "length") - 52 >= self->_metaDataSize)
  {
    v8 = -[NSData bytes](self->_imageData, "bytes");
    metaDataSize = self->_metaDataSize;
    if (metaDataSize >= 0xD)
    {
      v10 = (unint64_t)&v8[metaDataSize + 40];
      v11 = v8 + 52;
      v12 = &v8[metaDataSize + 52];
      while (1)
      {
        if (*(_DWORD *)v11 != 55727696)
        {
          if (!a3)
            return 0;
          v5 = CFSTR("Could not parse KTX metadata");
          goto LABEL_4;
        }
        v13 = *((unsigned int *)v11 + 2);
        v14 = v11 + 12;
        if (v12 - (v11 + 12) < v13)
          break;
        if (*((_DWORD *)v11 + 1) == 3 && (_DWORD)v13 == 3)
        {
          if (v11[13])
            v16 = CFSTR("MTKTextureLoaderOriginBottomLeft");
          else
            v16 = CFSTR("MTKTextureLoaderOriginTopLeft");
          -[MTKTextureLoaderData setImageOrigin:](self, "setImageOrigin:", v16);
        }
        v11 = &v14[v13];
        if ((unint64_t)&v14[v13] >= v10)
          return 1;
      }
      if (!a3)
        return 0;
      v5 = CFSTR("KTX metadata size exceeds metadata region size");
      goto LABEL_4;
    }
    return 1;
  }
  else
  {
    if (a3)
    {
      v5 = CFSTR("PVR header metadata size too large");
LABEL_4:
      v6 = (void *)_newMTKTextureErrorWithCodeAndErrorString(0, (uint64_t)v5);
      result = 0;
      *a3 = v6;
      return result;
    }
    return 0;
  }
}

- (id)getDataForArrayElement:(unint64_t)a3 face:(unint64_t)a4 level:(unint64_t)a5 depthPlane:(unint64_t)a6 bytesPerRow:(unint64_t *)a7 bytesPerImage:(unint64_t *)a8
{
  const void *v12;
  uint64_t metaDataSize;
  NSUInteger v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  id result;
  uint64_t v19;
  MTLPixelFormatInfo *p_pixelFormatInfo;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _BOOL4 v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v31;
  _BOOL4 v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v39;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v12 = -[NSData bytes](self->_imageData, "bytes");
  metaDataSize = self->_metaDataSize;
  v14 = -[NSData length](self->_imageData, "length");
  v15 = self->_metaDataSize;
  v16 = -[MTKTextureLoaderData width](self, "width");
  v17 = -[MTKTextureLoaderData height](self, "height");
  result = -[MTKTextureLoaderData numMipmapLevels](self, "numMipmapLevels");
  if (result)
  {
    v41 = 0;
    v19 = v14 - v15 - 52;
    v39 = (uint64_t)v12 + metaDataSize + 52;
    p_pixelFormatInfo = &self->_pixelFormatInfo;
    while (1)
    {
      v44 = 0;
      v45 = 0;
      v42 = 0;
      v43 = 0;
      if ((p_pixelFormatInfo->flags & 0x400) != 0)
      {
        -[MTKTextureLoaderPVR3 determineBlockSize:blocksWide:blocksHigh:bytesPerBlock:fromFormat:width:andHeight:](self, "determineBlockSize:blocksWide:blocksHigh:bytesPerBlock:fromFormat:width:andHeight:", &v45, &v44, &v43, &v42, self->_pvrCompressedFormat, v16, v17);
        v21 = v44 * v42;
        v22 = v44 * v42 * v43;
      }
      else
      {
        v21 = p_pixelFormatInfo->type.normal.pixelBytes * v16;
        v22 = v21 * v17;
      }
      if (-[MTKTextureLoaderData numArrayElements](self, "numArrayElements"))
        break;
LABEL_28:
      if (v16 <= 1)
        v16 = 1;
      else
        v16 >>= 1;
      if (v17 <= 1)
        v17 = 1;
      else
        v17 >>= 1;
      v31 = -[MTKTextureLoaderData numMipmapLevels](self, "numMipmapLevels");
      result = 0;
      ++v41;
      p_pixelFormatInfo = &self->_pixelFormatInfo;
      if (v31 <= v41)
        return result;
    }
    v35 = v21;
    v23 = 0;
    v36 = v17;
    while (!-[MTKTextureLoaderData numFaces](self, "numFaces"))
    {
LABEL_27:
      ++v23;
      v17 = v36;
      if (-[MTKTextureLoaderData numArrayElements](self, "numArrayElements") <= v23)
        goto LABEL_28;
    }
    v24 = 0;
    v26 = v41 == a5 && v23 == a3;
    v33 = v16;
    v34 = a3;
    v32 = v26;
    while (!-[MTKTextureLoaderData depth](self, "depth"))
    {
LABEL_26:
      if (-[MTKTextureLoaderData numFaces](self, "numFaces") <= ++v24)
        goto LABEL_27;
    }
    v27 = a5;
    v28 = 0;
    v29 = 0;
    if (v24 != a4)
      v26 = 0;
    while (1)
    {
      if (v19 + v28 < v22)
        return 0;
      if (a6 == v29 && v26)
        break;
      ++v29;
      v28 -= v22;
      if (-[MTKTextureLoaderData depth](self, "depth") <= v29)
      {
        v39 -= v28;
        v19 += v28;
        a5 = v27;
        v16 = v33;
        a3 = v34;
        v26 = v32;
        goto LABEL_26;
      }
    }
    *a7 = v35;
    *a8 = v22;
    return (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v39 - v28, v22, 0);
  }
  return result;
}

- (unint64_t)determineFormat:(unint64_t)a3 colorSpace:(unsigned int)a4 channelType:(unsigned int)a5 options:(id)a6
{
  int v9;
  unint64_t result;
  BOOL v11;
  unint64_t v12;
  uint64_t v13;
  signed int v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  BOOL v18;
  unint64_t v19;
  uint64_t v20;
  BOOL v21;
  unint64_t v22;
  unint64_t v23;

  v9 = a4 == 1;
  if (objc_msgSend(a6, "objectForKey:", CFSTR("MTKTextureLoaderOptionSRGB")))
    v9 = objc_msgSend((id)objc_msgSend(a6, "objectForKey:", CFSTR("MTKTextureLoaderOptionSRGB")), "BOOLValue");
  if (!HIDWORD(a3))
  {
    result = 150;
    switch((int)a3)
    {
      case 0:
        v11 = v9 == 0;
        v12 = 160;
        goto LABEL_86;
      case 1:
        v11 = v9 == 0;
        v12 = 164;
        goto LABEL_86;
      case 2:
        v11 = v9 == 0;
        v12 = 162;
        goto LABEL_86;
      case 3:
        v11 = v9 == 0;
        v12 = 166;
        goto LABEL_86;
      case 7:
        v11 = v9 == 0;
        v12 = 130;
        goto LABEL_86;
      case 8:
      case 9:
        v11 = v9 == 0;
        v12 = 132;
        goto LABEL_86;
      case 10:
      case 11:
        v11 = v9 == 0;
        v12 = 134;
        goto LABEL_86;
      case 12:
        if (a5 >= 0xC)
          return 0;
        v16 = &unk_20AE4B628;
        return v16[a5];
      case 13:
        if (a5 >= 0xC)
          return 0;
        v16 = &unk_20AE4B688;
        return v16[a5];
      case 14:
        return result;
      case 15:
        v11 = v9 == 0;
        v12 = 152;
        goto LABEL_86;
      case 16:
        return 241;
      case 17:
        return 240;
      case 19:
        return 93;
      case 22:
        v11 = v9 == 0;
        v12 = 180;
        goto LABEL_86;
      case 23:
        v11 = v9 == 0;
        v12 = 178;
        goto LABEL_86;
      case 24:
        v11 = v9 == 0;
        v12 = 182;
        goto LABEL_86;
      case 25:
        if (a5 >= 0xC)
          return 0;
        v16 = &unk_20AE4B6E8;
        return v16[a5];
      case 26:
        if (a5 >= 0xC)
          return 0;
        v16 = &unk_20AE4B748;
        return v16[a5];
      case 27:
        v21 = v9 == 0;
        v22 = 204;
        v23 = 186;
        goto LABEL_105;
      case 28:
        v21 = v9 == 0;
        v22 = 205;
        v23 = 187;
        goto LABEL_105;
      case 29:
        v21 = v9 == 0;
        v22 = 206;
        v23 = 188;
        goto LABEL_105;
      case 30:
        v21 = v9 == 0;
        v22 = 207;
        v23 = 189;
        goto LABEL_105;
      case 31:
        v21 = v9 == 0;
        v22 = 208;
        v23 = 190;
        goto LABEL_105;
      case 32:
        v21 = v9 == 0;
        v22 = 210;
        v23 = 192;
        goto LABEL_105;
      case 33:
        v21 = v9 == 0;
        v22 = 211;
        v23 = 193;
        goto LABEL_105;
      case 34:
        v21 = v9 == 0;
        v22 = 212;
        v23 = 194;
        goto LABEL_105;
      case 35:
        v21 = v9 == 0;
        v22 = 213;
        v23 = 195;
        goto LABEL_105;
      case 36:
        v21 = v9 == 0;
        v22 = 214;
        v23 = 196;
        goto LABEL_105;
      case 37:
        v21 = v9 == 0;
        v22 = 215;
        v23 = 197;
        goto LABEL_105;
      case 38:
        v21 = v9 == 0;
        v22 = 216;
        v23 = 198;
        goto LABEL_105;
      case 39:
        v21 = v9 == 0;
        v22 = 217;
        v23 = 199;
        goto LABEL_105;
      case 40:
        v21 = v9 == 0;
        v22 = 218;
        v23 = 200;
LABEL_105:
        if (v21)
          result = v22;
        else
          result = v23;
        break;
      default:
        return 0;
    }
    return result;
  }
  if ((uint64_t)a3 > 0x105050561726761)
  {
    if ((uint64_t)a3 <= 0x800000000000060)
    {
      if ((uint64_t)a3 > 0x404040472676260)
      {
        if (a3 == 0x404040472676261)
        {
          if (a5 <= 8 && ((1 << a5) & 0x111) != 0)
            return 42;
        }
        else if (a3 == 0x505050172676261 && a5 <= 8 && ((1 << a5) & 0x111) != 0)
        {
          return 41;
        }
      }
      else if (a3 == 0x105050561726762)
      {
        if (a5 <= 8 && ((1 << a5) & 0x111) != 0)
          return 43;
      }
      else if (a3 == 0x20A0A0A61626772 && a5 < 0xB)
      {
        v16 = &unk_20AE4B5D0;
        return v16[a5];
      }
      return 0;
    }
    if ((uint64_t)a3 <= 0x808080861726761)
    {
      if (a3 == 0x800000000000061)
        return 1;
      if (a3 != 0x808080861626772)
        return 0;
      result = 72;
      switch(a5)
      {
        case 0u:
          v11 = v9 == 0;
          v12 = 70;
          goto LABEL_86;
        case 1u:
          return result;
        case 2u:
          result = 73;
          break;
        case 3u:
          result = 74;
          break;
        default:
          return 0;
      }
    }
    else
    {
      if (a3 != 0x808080861726762)
      {
        if (a3 != 0x1010101061626772)
        {
          if (a3 == 0x2020202061626772)
          {
            v13 = a5 - 10;
            if (v13 < 3)
              return v13 + 123;
          }
          return 0;
        }
        v14 = a5 - 4;
        if (a5 - 4 < 9)
        {
          v15 = &unk_20AE4B588;
          return v15[v14];
        }
        return 0;
      }
      v11 = v9 == 0;
      v12 = 80;
LABEL_86:
      if (v11)
        return v12;
      else
        return v12 + 1;
    }
    return result;
  }
  if ((uint64_t)a3 > 0x101000006771)
  {
    if ((uint64_t)a3 > 0x5060500726761)
    {
      if (a3 == 0x5060500726762)
      {
        if (a5 <= 8 && ((1 << a5) & 0x111) != 0)
          return 40;
      }
      else if (a3 == 0xA0A0A00626772)
      {
        if (a5 == 12)
          return 92;
        else
          return 0;
      }
      return 0;
    }
    if (a3 == 0x101000006772)
    {
      v14 = a5 - 4;
      if (a5 - 4 < 9)
      {
        v15 = &unk_20AE4B540;
        return v15[v14];
      }
      return 0;
    }
    if (a3 != 0x202000006772)
      return 0;
    v17 = a5 - 10;
    v18 = v17 >= 3;
    v19 = v17 + 103;
    goto LABEL_59;
  }
  if ((uint64_t)a3 > 0x2000000071)
  {
    if (a3 != 0x2000000072)
    {
      if (a3 != 0x80800006772)
        return 0;
      result = 32;
      switch(a5)
      {
        case 0u:
          v11 = v9 == 0;
          v12 = 30;
          goto LABEL_86;
        case 1u:
          return result;
        case 2u:
          result = 33;
          break;
        case 3u:
          result = 34;
          break;
        default:
          return 0;
      }
      return result;
    }
    v20 = a5 - 10;
    v18 = v20 >= 3;
    v19 = v20 + 53;
LABEL_59:
    if (v18)
      return 0;
    else
      return v19;
  }
  if (a3 != 0x800000072)
  {
    if (a3 == 0x1000000072)
    {
      v14 = a5 - 4;
      if (a5 - 4 < 9)
      {
        v15 = &unk_20AE4B4F8;
        return v15[v14];
      }
    }
    return 0;
  }
  result = 12;
  switch(a5)
  {
    case 0u:
      v11 = v9 == 0;
      v12 = 10;
      goto LABEL_86;
    case 1u:
      return result;
    case 2u:
      result = 13;
      break;
    case 3u:
      result = 14;
      break;
    default:
      return 0;
  }
  return result;
}

- (void)determineBlockSize:(unint64_t *)a3 blocksWide:(unint64_t *)a4 blocksHigh:(unint64_t *)a5 bytesPerBlock:(unint64_t *)a6 fromFormat:(unsigned int)a7 width:(unint64_t)a8 andHeight:(unint64_t)a9
{
  unint64_t v9;
  unint64_t v10;
  unint64_t pixelBytes;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t pixelBytesRender;
  unint64_t blockWidth;
  unint64_t v17;
  unint64_t v18;

  if (a7 > 1)
  {
    if ((a7 & 0xFFFFFFFE) == 2)
    {
      v13 = (a8 + 3) >> 2;
      if (v13 <= 2)
        v13 = 2;
      *a4 = v13;
      v14 = (a9 + 3) >> 2;
      if (v14 <= 2)
        v14 = 2;
      *a5 = v14;
      pixelBytes = 8;
      v12 = 16;
    }
    else
    {
      blockWidth = self->_pixelFormatInfo.type.compressed.blockWidth;
      pixelBytesRender = self->_pixelFormatInfo.type.normal.pixelBytesRender;
      pixelBytes = self->_pixelFormatInfo.type.normal.pixelBytes;
      v17 = (a8 - 1 + blockWidth) / blockWidth;
      if (__CFADD__(a8 - 1, blockWidth))
        v17 = 1;
      *a4 = v17;
      v18 = (a9 - 1 + pixelBytesRender) / pixelBytesRender;
      if (__CFADD__(a9 - 1, pixelBytesRender))
        v18 = 1;
      *a5 = v18;
      v12 = pixelBytesRender * blockWidth;
    }
  }
  else
  {
    v9 = (a8 + 7) >> 3;
    if (v9 <= 2)
      v9 = 2;
    *a4 = v9;
    v10 = (a9 + 3) >> 2;
    if (v10 <= 2)
      v10 = 2;
    *a5 = v10;
    pixelBytes = 8;
    v12 = 32;
  }
  *a3 = v12;
  *a6 = pixelBytes;
}

- (void)initWithData:options:error:.cold.1()
{
  __assert_rtn("-[MTKTextureLoaderPVR3 initWithData:options:error:]", "MTKTextureLoaderPVR3.m", 160, "[MTKTextureLoaderPVR3 isPVR3File:data] && \"This function should not be reachable\");
}

@end
