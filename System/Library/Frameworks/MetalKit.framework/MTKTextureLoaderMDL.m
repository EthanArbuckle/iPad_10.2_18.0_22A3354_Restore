@implementation MTKTextureLoaderMDL

- (MTKTextureLoaderMDL)initWithMDLTexture:(id)a3 options:(id)a4 error:(id *)a5
{
  char *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  unint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)MTKTextureLoaderMDL;
  v8 = -[MTKTextureLoaderData init](&v20, sel_init);
  if (v8)
  {
    *((_QWORD *)v8 + 10) = a3;
    objc_msgSend(a3, "dimensions");
    objc_msgSend(v8, "setWidth:", v9);
    objc_msgSend(v8, "setDepth:", 1);
    objc_msgSend(v8, "setNumArrayElements:", 1);
    if (objc_msgSend(a3, "isCube"))
    {
      objc_msgSend(v8, "setNumFaces:", 6);
      objc_msgSend(v8, "setTextureType:", 5);
      objc_msgSend(a3, "dimensions");
      v11 = v10 / 6;
    }
    else
    {
      objc_msgSend(v8, "setNumFaces:", 1);
      objc_msgSend(v8, "setTextureType:", 2);
      objc_msgSend(a3, "dimensions");
      v11 = v12;
    }
    objc_msgSend(v8, "setHeight:", v11);
    v13 = objc_msgSend(a3, "mipLevelCount");
    if (v13 <= 1)
      v14 = 1;
    else
      v14 = v13;
    objc_msgSend(v8, "setNumMipmapLevels:", v14);
    if (!objc_msgSend(v8, "determineFormatFromChannelEncoding:channelCount:error:", objc_msgSend(a3, "channelEncoding"), objc_msgSend(a3, "channelCount"), a5))goto LABEL_12;
    objc_msgSend(v8, "pixelFormat");
    MTLPixelFormatGetInfoForDevice();
    *((_QWORD *)v8 + 17) = v19;
    *(_OWORD *)(v8 + 104) = v17;
    *(_OWORD *)(v8 + 120) = v18;
    *(_OWORD *)(v8 + 88) = v16;
    objc_msgSend(v8, "setImageOrigin:", CFSTR("MTKTextureLoaderOriginTopLeft"));
    if (objc_msgSend(a4, "objectForKey:", CFSTR("MTKTextureLoaderOptionCubeLayout")))
    {
      if (a5)
        *a5 = (id)_newMTKTextureErrorWithCodeAndErrorString(0, (uint64_t)CFSTR("Creating cube maps from 2D textures is not supported for MDL textures"));
LABEL_12:

      return 0;
    }
  }
  return (MTKTextureLoaderMDL *)v8;
}

- (void)dealloc
{
  objc_super v3;

  self->_texture = 0;
  v3.receiver = self;
  v3.super_class = (Class)MTKTextureLoaderMDL;
  -[MTKTextureLoaderData dealloc](&v3, sel_dealloc);
}

- (BOOL)determineFormatFromChannelEncoding:(int64_t)a3 channelCount:(unint64_t)a4 error:(id *)a5
{
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  BOOL result;

  if (a3 <= 2)
  {
    if (a3 == 1)
    {
      switch(a4)
      {
        case 4uLL:
          v6 = 70;
          goto LABEL_39;
        case 2uLL:
          v6 = 30;
          goto LABEL_39;
        case 1uLL:
          v6 = 10;
          goto LABEL_39;
      }
    }
    else
    {
      if (a3 != 2)
        goto LABEL_25;
      switch(a4)
      {
        case 4uLL:
          v6 = 110;
          goto LABEL_39;
        case 2uLL:
          v6 = 60;
          goto LABEL_39;
        case 1uLL:
          v6 = 20;
          goto LABEL_39;
      }
    }
LABEL_27:
    if (a5)
    {
      v7 = CFSTR("Textures must have 1, 2, or 4 channels");
      goto LABEL_29;
    }
    return 0;
  }
  if ((unint64_t)(a3 - 3) < 2)
  {
    if (!a5)
      return 0;
    v7 = CFSTR("Textures must use 8 or 16 bits per channel");
LABEL_29:
    v8 = (void *)_newMTKTextureErrorWithCodeAndErrorString(0, (uint64_t)v7);
    result = 0;
    *a5 = v8;
    return result;
  }
  if (a3 == 258)
  {
    switch(a4)
    {
      case 4uLL:
        v6 = 115;
        goto LABEL_39;
      case 2uLL:
        v6 = 65;
        goto LABEL_39;
      case 1uLL:
        v6 = 25;
        goto LABEL_39;
    }
    goto LABEL_27;
  }
  if (a3 != 260)
  {
LABEL_25:
    if (!a5)
      return 0;
    v7 = CFSTR("Could not determine format from MDLTexture");
    goto LABEL_29;
  }
  if (a4 == 4)
  {
    v6 = 125;
    goto LABEL_39;
  }
  if (a4 == 2)
  {
    v6 = 105;
    goto LABEL_39;
  }
  if (a4 != 1)
    goto LABEL_27;
  v6 = 55;
LABEL_39:
  -[MTKTextureLoaderData setPixelFormat:](self, "setPixelFormat:", v6);
  return 1;
}

- (id)getDataForArrayElement:(unint64_t)a3 face:(unint64_t)a4 level:(unint64_t)a5 depthPlane:(unint64_t)a6 bytesPerRow:(unint64_t *)a7 bytesPerImage:(unint64_t *)a8
{
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;

  v13 = -[MTKTextureLoaderData width](self, "width", a3, a4, a5, a6);
  if (v13 >> a5 <= 1)
    v14 = 1;
  else
    v14 = v13 >> a5;
  v15 = -[MTKTextureLoaderData height](self, "height") >> a5;
  if (v15 <= 1)
    v15 = 1;
  v16 = self->_pixelFormatInfo.type.normal.pixelBytes * v14;
  *a7 = v16;
  *a8 = v16 * v15;
  return -[NSData subdataWithRange:](-[MDLTexture texelDataWithTopLeftOriginAtMipLevel:create:](self->_texture, "texelDataWithTopLeftOriginAtMipLevel:create:", a5, 1), "subdataWithRange:", *a8 * a4);
}

@end
