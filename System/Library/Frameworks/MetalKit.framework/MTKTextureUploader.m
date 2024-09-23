@implementation MTKTextureUploader

- (void)dealloc
{
  MTLBlitCommandEncoder *blit;
  objc_super v4;

  self->_device = 0;
  blit = self->_blit;
  if (blit)
  {
    -[MTLBlitCommandEncoder endEncoding](blit, "endEncoding");

    self->_blit = 0;
  }

  self->_commandBuffer = 0;
  self->_lock = 0;
  dispatch_release((dispatch_object_t)self->_notifyQueue);
  self->_notifyQueue = 0;
  v4.receiver = self;
  v4.super_class = (Class)MTKTextureUploader;
  -[MTKTextureUploader dealloc](&v4, sel_dealloc);
}

- (void)finishWithCompletionHandler:(id)a3
{
  MTLCommandBuffer *commandBuffer;
  _QWORD v6[5];

  if (self->_commandBuffer)
  {
    -[MTLBlitCommandEncoder endEncoding](self->_blit, "endEncoding");
    commandBuffer = self->_commandBuffer;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __50__MTKTextureUploader_finishWithCompletionHandler___block_invoke;
    v6[3] = &unk_24C3D4A70;
    v6[4] = a3;
    -[MTLCommandBuffer addCompletedHandler:](commandBuffer, "addCompletedHandler:", v6);
    -[MTLCommandBuffer commit](self->_commandBuffer, "commit");

    self->_blit = 0;
  }
  else
  {
    dispatch_async((dispatch_queue_t)self->_notifyQueue, a3);
  }
}

- (MTKTextureUploader)initWithDevice:(id)a3 commandQueue:(id)a4 notifyQueue:(id)a5
{
  MTKTextureUploader *v8;
  void *v9;
  MTLCommandBuffer *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MTKTextureUploader;
  v8 = -[MTKTextureUploader init](&v12, sel_init);
  if (v8)
  {
    v8->_device = (MTLDevice *)a3;
    v8->_lock = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    v8->_notifyQueue = (OS_dispatch_queue *)a5;
    dispatch_retain((dispatch_object_t)a5);
    v9 = (void *)MEMORY[0x20BD32DD8]();
    if (a4)
    {
      v10 = (MTLCommandBuffer *)(id)objc_msgSend(a4, "commandBuffer");
      v8->_commandBuffer = v10;
      v8->_blit = (MTLBlitCommandEncoder *)(id)-[MTLCommandBuffer blitCommandEncoder](v10, "blitCommandEncoder");
    }
    objc_autoreleasePoolPop(v9);
  }
  return v8;
}

- (void)copyBytes:(const void *)a3 toTexture:(id)a4 bitsPerPixel:(unint64_t)a5 pixelComponents:(unint64_t)a6 bytesPerRow:(unint64_t)a7 bytesPerImage:(unint64_t)a8 region:(id *)a9 slice:(unint64_t)a10 level:(unint64_t)a11 flipVertically:(BOOL)a12
{
  void *v15;
  unint64_t v16;
  unint64_t v17;
  void *v19;
  __int128 v20;
  unint64_t v21;
  _OWORD v22[6];
  uint64_t v23;

  if (!a3 || !a4)
    -[MTKTextureUploader copyBytes:toTexture:bitsPerPixel:pixelComponents:bytesPerRow:bytesPerImage:region:slice:level:flipVertically:].cold.1();
  v15 = (void *)a3;
  v16 = a10;
  v17 = a11;
  if (a12)
  {
    v21 = a6;
    v19 = malloc_type_malloc(a8, 0xC6B31720uLL);
    reflectImage(v15, v19, a9->var1.var0, a9->var1.var1, a7, a5, v21);
    v15 = v19;
    v17 = a11;
    v16 = a10;
  }
  v23 = 0;
  memset(&v22[3], 0, 48);
  objc_msgSend(a4, "pixelFormat", v21);
  MTLPixelFormatGetInfoForDevice();
  v20 = *(_OWORD *)&a9->var0.var2;
  v22[0] = *(_OWORD *)&a9->var0.var0;
  v22[1] = v20;
  v22[2] = *(_OWORD *)&a9->var1.var1;
  objc_msgSend(a4, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v22, v17, v16, v15, a7, a8);
  if (a12)
    free(v15);
}

- (void)generateMipmapsForTexture:(id)a3
{
  if (a3)
  {
    -[NSLock lock](self->_lock, "lock");
    -[MTLBlitCommandEncoder generateMipmapsForTexture:](self->_blit, "generateMipmapsForTexture:", a3);
    -[NSLock unlock](self->_lock, "unlock");
  }
}

uint64_t __50__MTKTextureUploader_finishWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)copyTexture:(id)a3 toTexture:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  MTLBlitCommandEncoder *blit;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[3];
  _QWORD v20[3];
  _QWORD v21[3];

  if (!a3 || !a4)
    -[MTKTextureUploader copyTexture:toTexture:].cold.1();
  -[NSLock lock](self->_lock, "lock");
  v7 = objc_msgSend(a3, "textureType");
  v8 = 6;
  if ((unint64_t)(v7 - 5) >= 2)
    v8 = 1;
  v18 = v8;
  if (objc_msgSend(a3, "arrayLength"))
  {
    v9 = 0;
    do
    {
      v10 = 0;
      v16 = v9;
      v17 = v9 * v18;
      do
      {
        v11 = objc_msgSend(a3, "width");
        v12 = objc_msgSend(a3, "height");
        v13 = objc_msgSend(a3, "depth");
        if (objc_msgSend(a3, "mipmapLevelCount"))
        {
          v14 = 0;
          do
          {
            blit = self->_blit;
            memset(v21, 0, sizeof(v21));
            memset(v19, 0, sizeof(v19));
            v20[0] = v11;
            v20[1] = v12;
            v20[2] = v13;
            -[MTLBlitCommandEncoder copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:](blit, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", a3, v10 + v17, v14, v21, v20, a4, v10 + v17, v14, v19);
            if (v11 <= 1)
              v11 = 1;
            else
              v11 >>= 1;
            if (v12 <= 1)
              v12 = 1;
            else
              v12 >>= 1;
            if (v13 <= 1)
              v13 = 1;
            else
              v13 >>= 1;
            ++v14;
          }
          while (v14 < objc_msgSend(a3, "mipmapLevelCount"));
        }
        ++v10;
      }
      while (v10 != v18);
      v9 = v16 + 1;
    }
    while (v16 + 1 < (unint64_t)objc_msgSend(a3, "arrayLength"));
  }
  -[NSLock unlock](self->_lock, "unlock");
}

- (id)newTextureWithData:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  const __CFString *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v39;
  id *v40;
  void *v41;
  __CFString *v42;
  const __CFString *v43;
  void *v44;
  unint64_t v45;
  unint64_t v46;
  BOOL v48;
  _QWORD v49[6];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  v8 = objc_alloc_init(MEMORY[0x24BDDD740]);
  objc_msgSend(v8, "setTextureType:", objc_msgSend(a3, "textureType"));
  objc_msgSend(v8, "setPixelFormat:", objc_msgSend(a3, "pixelFormat"));
  objc_msgSend(v8, "setWidth:", objc_msgSend(a3, "width"));
  objc_msgSend(v8, "setHeight:", objc_msgSend(a3, "height"));
  objc_msgSend(v8, "setDepth:", objc_msgSend(a3, "depth"));
  objc_msgSend(v8, "setMipmapLevelCount:", objc_msgSend(a3, "numMipmapLevels"));
  objc_msgSend(v8, "setSampleCount:", 1);
  objc_msgSend(v8, "setArrayLength:", objc_msgSend(a3, "numArrayElements"));
  if (objc_msgSend(a3, "numMipmapLevels") == 1
    && ((objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("MTKTextureLoaderOptionAllocateMipmaps")), "BOOLValue") & 1) != 0|| objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("MTKTextureLoaderOptionGenerateMipmaps")), "BOOLValue")))
  {
    v9 = objc_msgSend(a3, "width");
    v10 = objc_msgSend(a3, "height");
    if (v9 <= v10)
      v11 = v10;
    else
      v11 = v9;
    objc_msgSend(v8, "setMipmapLevelCount:", (unint64_t)(floor(log2((double)v11)) + 1.0));
  }
  v12 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("MTKTextureLoaderOptionLoadAsArray"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v12, "BOOLValue"))
    objc_msgSend(v8, "setTextureType:", arrayTextureTypeFromTextureType(objc_msgSend(v8, "textureType")));
  v13 = objc_msgSend(v8, "storageMode");
  if (objc_msgSend(a4, "objectForKey:", CFSTR("MTKTextureLoaderOptionTextureStorageMode")))
    v13 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("MTKTextureLoaderOptionTextureStorageMode")), "unsignedIntegerValue");
  if (v13 == 2)
    v14 = -[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v8);
  else
    v14 = 0;
  objc_msgSend(v8, "setStorageMode:", v13);
  if (objc_msgSend(a4, "objectForKey:", CFSTR("MTKTextureLoaderOptionTextureUsage")))
    objc_msgSend(v8, "setUsage:", objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("MTKTextureLoaderOptionTextureUsage")), "unsignedIntegerValue"));
  if (objc_msgSend(a4, "objectForKey:", CFSTR("MTKTextureLoaderOptionTextureCPUCacheMode")))
    objc_msgSend(v8, "setCpuCacheMode:", objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("MTKTextureLoaderOptionTextureCPUCacheMode")), "unsignedIntegerValue"));
  v15 = (void *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v8);

  v16 = (__CFString *)objc_msgSend(a3, "imageOrigin");
  v17 = (__CFString *)objc_msgSend(a4, "objectForKey:", CFSTR("MTKTextureLoaderOptionOrigin"));
  if (v17)
  {
    v18 = v17;
    if (v17 == CFSTR("MTKTextureLoaderOriginFlippedVertically"))
    {
      if (v16 == CFSTR("MTKTextureLoaderOriginTopLeft"))
        v18 = CFSTR("MTKTextureLoaderOriginBottomLeft");
      else
        v18 = CFSTR("MTKTextureLoaderOriginTopLeft");
    }
  }
  else
  {
    v18 = v16;
  }
  if (v13 == 2)
    v19 = (void *)v14;
  else
    v19 = v15;
  if (!v19 || !v15)
  {
    if (a5)
      *a5 = (id)_newMTKTextureErrorWithCodeAndErrorString(0, (uint64_t)CFSTR("Failed to allocate texture memory."));
    if (v19 != v15)

    return 0;
  }
  v40 = a5;
  v41 = v15;
  if (objc_msgSend(a3, "numArrayElements"))
  {
    v20 = 0;
    while (!objc_msgSend(a3, "numFaces"))
    {
LABEL_48:
      if (++v20 >= (unint64_t)objc_msgSend(a3, "numArrayElements"))
        goto LABEL_49;
    }
    v21 = 0;
    v42 = v16;
    v43 = v18;
    v44 = v19;
    while (1)
    {
      v46 = objc_msgSend(a3, "width");
      v45 = objc_msgSend(a3, "height");
      if (objc_msgSend(a3, "numMipmapLevels"))
        break;
LABEL_47:
      if (++v21 >= (unint64_t)objc_msgSend(a3, "numFaces"))
        goto LABEL_48;
    }
    v22 = 0;
    while (!objc_msgSend(a3, "depth"))
    {
LABEL_41:
      if (v46 <= 1)
        v35 = 1;
      else
        v35 = v46 >> 1;
      v36 = v45 >> 1;
      if (v45 <= 1)
        v36 = 1;
      v45 = v36;
      v46 = v35;
      if (++v22 >= (unint64_t)objc_msgSend(a3, "numMipmapLevels"))
        goto LABEL_47;
    }
    v23 = 0;
    while (1)
    {
      v54 = 0;
      v55 = 0;
      v24 = objc_msgSend(a3, "getDataForArrayElement:face:level:depthPlane:bytesPerRow:bytesPerImage:", v20, v21, v22, v23, &v55, &v54);
      if (!v24)
        break;
      v25 = (void *)v24;
      v53 = 0;
      v48 = v16 != v18;
      v51 = 0u;
      v52 = 0u;
      v50 = 0u;
      objc_msgSend(a3, "pixelFormat");
      MTLPixelFormatGetInfoForDevice();
      v26 = objc_msgSend(v25, "bytes");
      v27 = 8 * *((_QWORD *)&v51 + 1);
      v28 = v52;
      v29 = v54;
      v30 = v55;
      v31 = objc_msgSend(a3, "numFaces");
      v49[0] = 0;
      v49[1] = 0;
      v49[2] = v23;
      v49[3] = v46;
      v49[4] = v45;
      v49[5] = 1;
      LOBYTE(v39) = v48;
      v32 = v26;
      v19 = v44;
      v33 = v27;
      v34 = v30;
      v16 = v42;
      v18 = v43;
      -[MTKTextureUploader copyBytes:toTexture:bitsPerPixel:pixelComponents:bytesPerRow:bytesPerImage:region:slice:level:flipVertically:](self, "copyBytes:toTexture:bitsPerPixel:pixelComponents:bytesPerRow:bytesPerImage:region:slice:level:flipVertically:", v32, v44, v33, v28, v34, v29, v49, v21 + v31 * v20, v22, v39);
      if (++v23 >= (unint64_t)objc_msgSend(a3, "depth"))
        goto LABEL_41;
    }
    if (v40)
      *v40 = (id)_newMTKTextureErrorWithCodeAndErrorString(0, (uint64_t)CFSTR("Texture malformed."));
    if (v44 != v41)

    return 0;
  }
LABEL_49:
  v37 = v41;
  if (v19 != v41)
  {
    -[MTKTextureUploader copyTexture:toTexture:](self, "copyTexture:toTexture:", v19, v41);

  }
  return v37;
}

- (void)copyBytes:toTexture:bitsPerPixel:pixelComponents:bytesPerRow:bytesPerImage:region:slice:level:flipVertically:.cold.1()
{
  __assert_rtn("-[MTKTextureUploader copyBytes:toTexture:bitsPerPixel:pixelComponents:bytesPerRow:bytesPerImage:region:slice:level:flipVertically:]", "MTKTextureUploader.m", 89, "bytes && texture");
}

- (void)copyTexture:toTexture:.cold.1()
{
  __assert_rtn("-[MTKTextureUploader copyTexture:toTexture:]", "MTKTextureUploader.m", 126, "srcTexture && dstTexture");
}

@end
