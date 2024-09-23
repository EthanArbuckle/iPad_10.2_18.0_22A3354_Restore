@implementation CMIBareMetalTexture

- (CMIBareMetalTexture)initWithTexture:(id)a3
{
  id v5;
  _BYTE v7[3];

  v5 = a3;
  objc_storeStrong((id *)&self->_texture, a3);
  -[MTLTexture pixelFormat](self->_texture, "pixelFormat");
  MTLPixelFormatGetInfo();
  if ((*(_DWORD *)v7 & 0x800000) != 0)
    self->_osType = IOSurfaceGetPixelFormat((IOSurfaceRef)objc_msgSend(v5, "iosurface"));
  self->_stride = strideForTexture(v5);

  return self;
}

- (CMIBareMetalTexture)initWithFile:(id)a3 device:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  CMIBareMetalTexture *v9;

  v6 = (void *)MEMORY[0x1E0C99D50];
  v7 = a4;
  objc_msgSend(v6, "dataWithContentsOfFile:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CMIBareMetalTexture initWithData:device:](self, "initWithData:device:", v8, v7);

  return v9;
}

- (CMIBareMetalTexture)initWithData:(id)a3 device:(id)a4
{
  id v6;
  id v7;
  CMIBareMetalTexture *v8;
  MTLTexture *v9;
  __CVBuffer *v10;
  int v11;
  int v12;
  OSType osType;
  void *v14;
  CVReturn v15;
  MTLTexture *texture;
  CMIBareMetalTexture *v17;
  CVPixelBufferRef pixelBufferOut;
  int v20;

  v6 = a3;
  v7 = a4;
  if (!-[CMIBareMetalTexture updateTextureDescriptor:](self, "updateTextureDescriptor:", v6))
  {
    -[MTLTextureDescriptor pixelFormat](self->_textureDescriptor, "pixelFormat");
    MTLPixelFormatGetInfo();
    if ((v20 & 0x800000) == 0)
    {
      v9 = (MTLTexture *)objc_msgSend(v7, "newTextureWithDescriptor:", self->_textureDescriptor);
      v10 = 0;
      goto LABEL_10;
    }
    v11 = -[MTLTextureDescriptor width](self->_textureDescriptor, "width");
    v12 = -[MTLTextureDescriptor height](self->_textureDescriptor, "height");
    osType = self->_osType;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AA70], *MEMORY[0x1E0CA8FF0]);
    pixelBufferOut = 0;
    v15 = CVPixelBufferCreate(0, v11, v12, osType, (CFDictionaryRef)v14, &pixelBufferOut);
    v10 = pixelBufferOut;
    if (v15 && pixelBufferOut)
    {
      CFRelease(pixelBufferOut);

    }
    else
    {

      if (v10)
      {
        v9 = (MTLTexture *)objc_msgSend(v7, "newTextureWithDescriptor:iosurface:plane:", self->_textureDescriptor, CVPixelBufferGetIOSurface(v10), 0);
LABEL_10:
        texture = self->_texture;
        self->_texture = v9;

        if (!self->_texture
          || (v17 = self, -[CMIBareMetalTexture updateTextureContent:](self, "updateTextureContent:", v6)))
        {
          NSLog(CFSTR("CMIBareMetalTexture: Can't create Metal texture."));
          v17 = 0;
        }
        if (v10)
          CFRelease(v10);
        goto LABEL_16;
      }
    }
    NSLog(CFSTR("CMIBareMetalTexture: Can't create pixel buffer."));
    v17 = 0;
LABEL_16:
    v8 = v17;
    goto LABEL_17;
  }
  v8 = 0;
LABEL_17:

  return v8;
}

- (BOOL)updateTextureWithFile:(id)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[CMIBareMetalTexture updateTextureWithData:](self, "updateTextureWithData:", v4);

  return (char)self;
}

- (BOOL)updateTextureWithData:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (-[CMIBareMetalTexture updateTextureDescriptor:](self, "updateTextureDescriptor:", v4))
    v5 = 0;
  else
    v5 = -[CMIBareMetalTexture updateTextureContent:](self, "updateTextureContent:", v4) == 0;

  return v5;
}

- (int)updateTextureDescriptor:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  int v8;
  id v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int *v12;
  unsigned int v13;
  unsigned int v14;
  MTLTexture *texture;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;

  v4 = (objc_class *)MEMORY[0x1E0CC6BB0];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = objc_retainAutorelease(v5);
  v8 = *(_DWORD *)objc_msgSend(v7, "bytes");
  v9 = objc_retainAutorelease(v7);
  v10 = (unsigned int *)objc_msgSend(v9, "bytes");

  if (v8 == 1280593218)
  {
    if (v10[1] > 2)
    {
      NSLog(CFSTR("CMIBareMetalTexture: Can't open BMTL with version = %u"), v10[1]);
      goto LABEL_17;
    }
    objc_msgSend(v6, "setTextureType:", v10[4]);
    objc_msgSend(v6, "setWidth:", v10[5]);
    objc_msgSend(v6, "setHeight:", v10[6]);
    objc_msgSend(v6, "setDepth:", v10[7]);
    objc_msgSend(v6, "setArrayLength:", v10[8]);
    objc_msgSend(v6, "setPixelFormat:", v10[9]);
    objc_msgSend(v6, "setUsage:", 3);
    v11 = v10[11];
    v12 = v10 + 10;
    v13 = v10[3];
  }
  else
  {
    objc_msgSend(v6, "setTextureType:", 2);
    objc_msgSend(v6, "setWidth:", *v10);
    objc_msgSend(v6, "setHeight:", v10[1]);
    objc_msgSend(v6, "setDepth:", 1);
    objc_msgSend(v6, "setArrayLength:", 1);
    objc_msgSend(v6, "setPixelFormat:", v10[2]);
    objc_msgSend(v6, "setUsage:", 3);
    v11 = 0;
    v12 = v10 + 3;
    v13 = 16;
  }
  v14 = *v12;
  self->_dataOffset = v13;
  texture = self->_texture;
  if (texture)
  {
    if (v11 != self->_osType
      || v14 != self->_stride
      || (v16 = -[MTLTexture textureType](texture, "textureType"), v16 != objc_msgSend(v6, "textureType"))
      || (v17 = -[MTLTexture width](self->_texture, "width"), v17 != objc_msgSend(v6, "width"))
      || (v18 = -[MTLTexture height](self->_texture, "height"), v18 != objc_msgSend(v6, "height"))
      || (v19 = -[MTLTexture depth](self->_texture, "depth"), v19 != objc_msgSend(v6, "depth"))
      || (v20 = -[MTLTexture arrayLength](self->_texture, "arrayLength"), v20 != objc_msgSend(v6, "arrayLength"))
      || (v21 = -[MTLTexture pixelFormat](self->_texture, "pixelFormat"), v21 != objc_msgSend(v6, "pixelFormat")))
    {
      NSLog(CFSTR("CMIBareMetalTexture: BMTL file is not compatible with the existing texture."));
LABEL_17:
      v22 = -1;
      goto LABEL_18;
    }
  }
  objc_storeStrong((id *)&self->_textureDescriptor, v6);
  v22 = 0;
  self->_osType = v11;
  self->_stride = v14;
LABEL_18:

  return v22;
}

- (int)updateTextureContent:(id)a3
{
  id v4;
  uint64_t stride;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t i;
  MTLTexture *texture;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __IOSurface *v19;
  int v20;
  id v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  CVPixelBufferRef pixelBufferOut;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v27 = 0;
  pixelBufferOut = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v4 = objc_retainAutorelease(a3);
  v27 = objc_msgSend(v4, "bytes") + self->_dataOffset;
  -[MTLTextureDescriptor pixelFormat](self->_textureDescriptor, "pixelFormat");
  MTLPixelFormatGetInfo();
  if ((v30 & 0x800000) != 0)
  {
    v19 = (__IOSurface *)-[MTLTexture iosurface](self->_texture, "iosurface");
    if (CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v19, 0, &pixelBufferOut))
    {
      NSLog(CFSTR("CMIBareMetalTexture: Can't create pixel buffer from IOSurface."));
    }
    else if (CVPixelBufferGetPixelFormatType(pixelBufferOut) == self->_osType)
    {
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __44__CMIBareMetalTexture_updateTextureContent___block_invoke;
      v23[3] = &unk_1E94EAED0;
      v23[4] = &v24;
      if (!pixelBufferLineIterator(pixelBufferOut, v23))
      {
        v20 = 0;
        goto LABEL_21;
      }
      NSLog(CFSTR("CMIBareMetalTexture: Failed to copy texture data."));
    }
    else
    {
      NSLog(CFSTR("CMIBareMetalTexture: Texture OSType doesn't match the file OSType."));
    }
LABEL_20:
    v20 = -1;
    goto LABEL_21;
  }
  stride = self->_stride;
  v6 = -[MTLTexture height](self->_texture, "height");
  v7 = -[MTLTexture depth](self->_texture, "depth");
  v8 = -[MTLTexture width](self->_texture, "width");
  v9 = -[MTLTexture height](self->_texture, "height");
  v10 = -[MTLTexture depth](self->_texture, "depth");
  v11 = -[MTLTexture arrayLength](self->_texture, "arrayLength");
  v12 = v6 * stride * v7;
  if (v11 * v12 != objc_msgSend(v4, "length") - self->_dataOffset)
  {
    NSLog(CFSTR("CMIBareMetalTexture: Unexpected data size for texture in updateTextureContent()."));
    goto LABEL_20;
  }
  v22 = v4;
  for (i = 0; -[MTLTexture arrayLength](self->_texture, "arrayLength", v22) > i; ++i)
  {
    texture = self->_texture;
    v15 = v25[3];
    if (is1DTexture(texture))
      v16 = 0;
    else
      v16 = self->_stride;
    if (-[MTLTexture textureType](self->_texture, "textureType") == 7)
    {
      v17 = self->_stride;
      v18 = -[MTLTexture height](self->_texture, "height") * v17;
    }
    else
    {
      v18 = 0;
    }
    v29 = 0;
    v30 = 0;
    v31 = 0;
    v32 = v8;
    v33 = v9;
    v34 = v10;
    -[MTLTexture replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:](texture, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", &v29, 0, i, v15, v16, v18);
    v25[3] += v12;
  }
  v20 = 0;
  v4 = v22;
LABEL_21:
  if (pixelBufferOut)
  {
    CFRelease(pixelBufferOut);
    pixelBufferOut = 0;
  }
  _Block_object_dispose(&v24, 8);

  return v20;
}

uint64_t __44__CMIBareMetalTexture_updateTextureContent___block_invoke(uint64_t a1, void *__dst, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8)
{
  memcpy(__dst, *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), (a6 + a7 - 1) / a7 * a5);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += a8;
  return 1;
}

- (BOOL)saveToFile:(id)a3
{
  return -[CMIBareMetalTexture saveToFile:withBMTLversion:](self, "saveToFile:withBMTLversion:", a3, 2);
}

- (BOOL)saveToFile:(id)a3 withBMTLversion:(unsigned int)a4
{
  uint64_t v4;
  objc_class *v6;
  id v7;
  void *v8;
  BOOL v9;

  v4 = *(_QWORD *)&a4;
  v6 = (objc_class *)MEMORY[0x1E0C99E48];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initToFileAtPath:append:", v7, 0);

  objc_msgSend(v8, "open");
  if (objc_msgSend(v8, "streamStatus") == 2)
  {
    v9 = -[CMIBareMetalTexture saveToStream:withBMTLversion:](self, "saveToStream:withBMTLversion:", v8, v4);
  }
  else
  {
    NSLog(CFSTR("CMIBareMetalTexture: Can't open outputStream in saveToFile()."));
    v9 = 0;
  }
  objc_msgSend(v8, "close");

  return v9;
}

- (BOOL)saveToData:(id *)a3
{
  return -[CMIBareMetalTexture saveToData:withBMTLversion:](self, "saveToData:withBMTLversion:", a3, 2);
}

- (BOOL)saveToData:(id *)a3 withBMTLversion:(unsigned int)a4
{
  id *v4;
  uint64_t v5;
  void *v7;

  v4 = a3;
  if (!a3)
  {
    NSLog(CFSTR("CMIBareMetalTexture: No 'outputData' in saveToData()."), a2, 0, *(_QWORD *)&a4);
    v7 = 0;
    goto LABEL_8;
  }
  v5 = *(_QWORD *)&a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E48]), "initToMemory");
  objc_msgSend(v7, "open");
  if (objc_msgSend(v7, "streamStatus") != 2)
  {
    NSLog(CFSTR("CMIBareMetalTexture: Can't open outputStream in saveToData()."));
    goto LABEL_7;
  }
  if (!-[CMIBareMetalTexture saveToStream:withBMTLversion:](self, "saveToStream:withBMTLversion:", v7, v5))
  {
LABEL_7:
    LOBYTE(v4) = 0;
    goto LABEL_8;
  }
  objc_msgSend(v7, "propertyForKey:", *MEMORY[0x1E0C99868]);
  *v4 = (id)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = 1;
LABEL_8:
  objc_msgSend(v7, "close");

  return (char)v4;
}

- (BOOL)saveToStream:(id)a3 withBMTLversion:(unsigned int)a4
{
  uint64_t v4;
  unsigned int v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  MTLTexture *v11;
  void *v12;
  void *v13;
  MTLTexture *v14;
  void *v15;
  void *v16;
  __IOSurface *v17;
  BOOL v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  __CVBuffer *v35;
  int v36;
  void *context;
  id v38;
  _QWORD v39[4];
  id v40;
  int v41;
  CVPixelBufferRef pixelBufferOut;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v4 = *(_QWORD *)&a4;
  v38 = a3;
  pixelBufferOut = 0;
  v6 = strideForTexture(self->_texture);
  -[MTLTexture pixelFormat](self->_texture, "pixelFormat");
  MTLPixelFormatGetInfo();
  v7 = v44;
  if ((_DWORD)v4 != 2)
  {
    if ((_DWORD)v4 == 1)
    {
      if ((v44 & 0x800000) != 0)
      {
        NSLog(CFSTR("CMIBareMetalTexture: Can't save planar textures with BMTL version 1, please use at least version 2."));
      }
      else
      {
        if (-[MTLTexture textureType](self->_texture, "textureType") == 2)
        {
          LODWORD(v43) = -[MTLTexture width](self->_texture, "width");
          HIDWORD(v43) = -[MTLTexture height](self->_texture, "height");
          LODWORD(v44) = -[MTLTexture pixelFormat](self->_texture, "pixelFormat");
          HIDWORD(v44) = v6;
          v8 = v38;
          v9 = 16;
LABEL_8:
          v10 = v6;
          context = (void *)MEMORY[0x1D824D210](objc_msgSend(v8, "write:maxLength:", &v43, v9));
          v11 = self->_texture;
          if (-[MTLTexture storageMode](v11, "storageMode"))
          {
            v12 = (void *)objc_opt_new();
            objc_msgSend(v12, "setTextureType:", -[MTLTexture textureType](v11, "textureType"));
            objc_msgSend(v12, "setPixelFormat:", -[MTLTexture pixelFormat](v11, "pixelFormat"));
            objc_msgSend(v12, "setWidth:", -[MTLTexture width](v11, "width"));
            objc_msgSend(v12, "setHeight:", -[MTLTexture height](v11, "height"));
            objc_msgSend(v12, "setDepth:", -[MTLTexture depth](v11, "depth"));
            objc_msgSend(v12, "setArrayLength:", -[MTLTexture arrayLength](v11, "arrayLength"));
            objc_msgSend(v12, "setMipmapLevelCount:", -[MTLTexture mipmapLevelCount](v11, "mipmapLevelCount"));
            objc_msgSend(v12, "setUsage:", 0);
            -[MTLTexture device](v11, "device");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = (MTLTexture *)objc_msgSend(v13, "newTextureWithDescriptor:", v12);

            if (v14)
            {
              -[MTLTexture device](v11, "device");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = (void *)objc_msgSend(v15, "newCommandQueue");

            }
            else
            {
              v16 = 0;
            }
            objc_msgSend(v16, "commandBuffer");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "blitCommandEncoder");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "copyFromTexture:toTexture:", v11, v14);
            objc_msgSend(v20, "endEncoding");
            objc_msgSend(v19, "commit");
            objc_msgSend(v19, "waitUntilCompleted");

          }
          else
          {
            v14 = v11;
          }

          v21 = -[MTLTexture height](v14, "height") * v10;
          v22 = -[MTLTexture depth](v14, "depth");
          objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v21 * v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = -[MTLTexture width](v14, "width");
          v25 = -[MTLTexture height](v14, "height");
          v26 = -[MTLTexture depth](v14, "depth");
          if (-[MTLTexture arrayLength](v14, "arrayLength"))
          {
            v27 = 0;
            do
            {
              v28 = objc_retainAutorelease(v23);
              v29 = objc_msgSend(v28, "mutableBytes");
              if (is1DTexture(v14))
                v30 = 0;
              else
                v30 = v10;
              v31 = -[MTLTexture textureType](v14, "textureType");
              v32 = 0;
              if (v31 == 7)
                v32 = -[MTLTexture height](v14, "height") * v10;
              v43 = 0;
              v44 = 0;
              v45 = 0;
              v46 = v24;
              v47 = v25;
              v48 = v26;
              -[MTLTexture getBytes:bytesPerRow:bytesPerImage:fromRegion:mipmapLevel:slice:](v14, "getBytes:bytesPerRow:bytesPerImage:fromRegion:mipmapLevel:slice:", v29, v30, v32, &v43, 0, v27);
              v33 = objc_retainAutorelease(v28);
              objc_msgSend(v38, "write:maxLength:", objc_msgSend(v33, "mutableBytes"), objc_msgSend(v33, "length"));
              ++v27;
            }
            while (-[MTLTexture arrayLength](v14, "arrayLength") > v27);
          }

          objc_autoreleasePoolPop(context);
          v18 = 1;
          goto LABEL_29;
        }
        NSLog(CFSTR("CMIBareMetalTexture: BMTL version 1 only supports saving non-planar 2D textures."));
      }
    }
    else
    {
      NSLog(CFSTR("CMIBareMetalTexture: BMTL version %u not supported (please use anything between %d and %d"), v4, 2, 2);
    }
LABEL_17:
    v18 = 0;
    goto LABEL_29;
  }
  v43 = 0x200000002;
  LODWORD(v44) = 48;
  HIDWORD(v44) = -[MTLTexture textureType](self->_texture, "textureType");
  LODWORD(v45) = -[MTLTexture width](self->_texture, "width");
  HIDWORD(v45) = -[MTLTexture height](self->_texture, "height");
  LODWORD(v46) = -[MTLTexture depth](self->_texture, "depth");
  HIDWORD(v46) = -[MTLTexture arrayLength](self->_texture, "arrayLength");
  LODWORD(v47) = -[MTLTexture pixelFormat](self->_texture, "pixelFormat");
  HIDWORD(v47) = v6;
  LODWORD(v48) = 0;
  if ((v7 & 0x800000) == 0)
  {
    v41 = 1280593218;
    objc_msgSend(v38, "write:maxLength:", &v41, 4);
    v8 = v38;
    v9 = 44;
    goto LABEL_8;
  }
  v17 = (__IOSurface *)-[MTLTexture iosurface](self->_texture, "iosurface");
  if (CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v17, 0, &pixelBufferOut))
  {
    NSLog(CFSTR("CMIBareMetalTexture: Can't create CVPixelBuffer from IOSurface in saveToStream()."));
    goto LABEL_17;
  }
  LODWORD(v48) = CVPixelBufferGetPixelFormatType(pixelBufferOut);
  v41 = 1280593218;
  objc_msgSend(v38, "write:maxLength:", &v41, 4);
  objc_msgSend(v38, "write:maxLength:", &v43, 44);
  v35 = pixelBufferOut;
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __52__CMIBareMetalTexture_saveToStream_withBMTLversion___block_invoke;
  v39[3] = &unk_1E94EAEF8;
  v40 = v38;
  v36 = pixelBufferLineIterator(v35, v39);
  v18 = v36 == 0;
  if (v36)
    NSLog(CFSTR("CMIBareMetalTexture: Can't save texture to output stream in saveToStream()."));

LABEL_29:
  if (pixelBufferOut)
    CFRelease(pixelBufferOut);

  return v18;
}

BOOL __52__CMIBareMetalTexture_saveToStream_withBMTLversion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return objc_msgSend(*(id *)(a1 + 32), "write:maxLength:", a2, a8) == a8;
}

- (MTLTexture)texture
{
  return self->_texture;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_texture, 0);
  objc_storeStrong((id *)&self->_textureDescriptor, 0);
}

@end
