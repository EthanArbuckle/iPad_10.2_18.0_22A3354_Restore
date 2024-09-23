@implementation FigMetalBufferAllocator

- (FigMetalBufferAllocator)initWithMetalUtils:(id)a3
{
  id v5;
  FigMetalBufferAllocator *v6;
  FigMetalBufferAllocator *v7;
  FigMetalUtils *utils;
  void *v9;
  FigMetalBufferAllocator *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FigMetalBufferAllocator;
  v6 = -[FigMetalBufferAllocator init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_utils, a3);
    utils = v7->_utils;
    if (!utils)
    {
      FigSignalErrorAt();
      v10 = 0;
      goto LABEL_5;
    }
    -[FigMetalUtils device](utils, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_alignment = objc_msgSend(v9, "deviceLinearTextureAlignmentBytes");

  }
  v10 = v7;
LABEL_5:

  return v10;
}

- (id)description
{
  return CFSTR("FigMetalAllocatorTypeBuffer");
}

- (int)setupWithDescriptor:(id)a3
{
  id v4;
  void *v5;
  MTLBuffer *v6;
  MTLBuffer *buffer;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const __CFDictionary *v13;
  __IOSurface *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  MTLBuffer *v19;
  MTLBuffer *v20;
  void *v21;
  MTLBuffer *v22;
  MTLBuffer *v23;
  _QWORD v25[6];
  _QWORD v26[7];

  v26[6] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(v4, "memSize"))
  {
    v8 = FigSignalErrorAt();
    goto LABEL_15;
  }
  self->_memSize = objc_msgSend(v4, "memSize");
  objc_msgSend(v4, "externalBuffer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "externalBuffer");
    v6 = (MTLBuffer *)objc_claimAutoreleasedReturnValue();
    buffer = self->_buffer;
    self->_buffer = v6;

    v8 = 0;
    self->_memSize = -[MTLBuffer length](self->_buffer, "length");
    goto LABEL_15;
  }
  if (!objc_msgSend(v4, "wireMemory"))
  {
    -[FigMetalUtils device](self->_utils, "device");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (MTLBuffer *)objc_msgSend(v21, "newBufferWithLength:options:", self->_memSize, objc_msgSend(v4, "resourceOptions"));
    v23 = self->_buffer;
    self->_buffer = v22;

    if (!self->_buffer)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      v8 = -1;
      goto LABEL_15;
    }
    v14 = 0;
    goto LABEL_12;
  }
  v25[0] = *MEMORY[0x1E0CBBEE0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", self->_memSize);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0CBBF10];
  v26[0] = v9;
  v26[1] = &unk_1E9513D68;
  v11 = *MEMORY[0x1E0CBC050];
  v25[1] = v10;
  v25[2] = v11;
  v26[2] = MEMORY[0x1E0C9AAB0];
  v26[3] = MEMORY[0x1E0C9AAA0];
  v12 = *MEMORY[0x1E0CBC1D8];
  v25[3] = *MEMORY[0x1E0CBC188];
  v25[4] = v12;
  v25[5] = *MEMORY[0x1E0CBC190];
  v26[4] = MEMORY[0x1E0C9AAB0];
  v26[5] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 6);
  v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v14 = IOSurfaceCreate(v13);
  if (v14)
  {
    objc_msgSend(v4, "label");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = (const __CFString *)*MEMORY[0x1E0CBC048];
      objc_msgSend(v4, "label");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      IOSurfaceSetValue(v14, v16, v17);

    }
    -[FigMetalUtils device](self->_utils, "device");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (MTLBuffer *)objc_msgSend(v18, "newBufferWithIOSurface:", v14);
    v20 = self->_buffer;
    self->_buffer = v19;

    if (self->_buffer)
    {

LABEL_12:
      objc_msgSend(v4, "label");
      v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      -[MTLBuffer setLabel:](self->_buffer, "setLabel:", v13);
      v8 = 0;
      goto LABEL_13;
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  v8 = -1;
LABEL_13:

  if (v14)
    CFRelease(v14);
LABEL_15:

  return v8;
}

- (void)purgeResources
{
  MTLBuffer *buffer;

  buffer = self->_buffer;
  self->_buffer = 0;

}

- (BOOL)hasCreatedTexture:(id)a3
{
  MTLBuffer *v4;
  BOOL v5;

  if (!a3)
    return 0;
  objc_msgSend(a3, "buffer");
  v4 = (MTLBuffer *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == self->_buffer;

  return v5;
}

- (BOOL)hasCreatedBuffer:(id)a3
{
  return 0;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)getSizeAndAlignForDescriptor:(id)a3
{
  unint64_t alignment;
  id v5;
  void *v6;
  uint64_t v7;
  FigMetalUtils *utils;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  alignment = self->_alignment;
  v5 = a3;
  objc_msgSend(v5, "desc");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "height");
  utils = self->_utils;
  objc_msgSend(v5, "desc");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "width");
  objc_msgSend(v5, "desc");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[FigMetalUtils computeLinearTextureStride:format:](utils, "computeLinearTextureStride:format:", v10, objc_msgSend(v11, "pixelFormat"))* v7;
  v13 = v12;
  v14 = alignment;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)getSizeAndAlignForBufferDescriptor:(id)a3
{
  unint64_t v3;
  unint64_t v4;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  v3 = 0;
  v4 = 0;
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (id)newBufferWithDescriptor:(id)a3 offset:(unint64_t)a4
{
  return 0;
}

- (id)newTextureWithDescriptor:(id)a3 offset:(unint64_t)a4
{
  FigMetalUtils *utils;
  MTLBuffer *buffer;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  utils = self->_utils;
  buffer = self->_buffer;
  v6 = a3;
  objc_msgSend(v6, "desc");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "width");
  objc_msgSend(v6, "desc");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "height");
  objc_msgSend(v6, "desc");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "pixelFormat");
  objc_msgSend(v6, "desc");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[FigMetalUtils texture2DFromBuffer:width:height:format:offset:usage:](utils, "texture2DFromBuffer:width:height:format:offset:usage:", buffer, v8, v10, v12, a4, objc_msgSend(v13, "usage"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (unint64_t)textureOffset:(id)a3
{
  return objc_msgSend(a3, "bufferOffset");
}

- (unint64_t)bufferOffset:(id)a3
{
  return 0;
}

- (unint64_t)alignment
{
  return self->_alignment;
}

- (FigMetalUtils)utils
{
  return self->_utils;
}

- (unint64_t)memSize
{
  return self->_memSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utils, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
}

@end
