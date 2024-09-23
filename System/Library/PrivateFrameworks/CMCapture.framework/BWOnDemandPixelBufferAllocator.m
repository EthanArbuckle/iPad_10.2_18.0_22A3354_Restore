@implementation BWOnDemandPixelBufferAllocator

+ (void)initialize
{
  objc_opt_class();
}

- (BWOnDemandPixelBufferAllocator)initWithVideoFormat:(id)a3 name:(id)a4 memoryPool:(id)a5 additionalPixelBufferAttributes:(id)a6
{
  BWOnDemandPixelBufferAllocator *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSDictionary *v16;
  uint64_t v18;
  objc_super v19;
  _QWORD v20[3];
  _QWORD v21[3];
  _QWORD v22[4];
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "memoryPoolUseAllowed") & 1) == 0)
  {
    v18 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Memory pool use disallowed with video format: %@"), a3);
    goto LABEL_11;
  }
  if (!a5)
  {
    v18 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No memory pool provided for video format: %@"), a3);
LABEL_11:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v18, 0));
  }
  v19.receiver = self;
  v19.super_class = (Class)BWOnDemandPixelBufferAllocator;
  v10 = -[BWOnDemandPixelBufferAllocator init](&v19, sel_init);
  if (v10)
  {
    v10->_videoFormat = (BWVideoFormat *)a3;
    v10->_memoryPool = (BWMemoryPool *)a5;
    v22[0] = *MEMORY[0x1E0CA9040];
    v23[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "pixelFormat"));
    v22[1] = *MEMORY[0x1E0CA90E0];
    v23[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", objc_msgSend(a3, "width"));
    v22[2] = *MEMORY[0x1E0CA8FD8];
    v23[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", objc_msgSend(a3, "height"));
    v22[3] = *MEMORY[0x1E0CA8FF0];
    v20[0] = *MEMORY[0x1E0CBBEE8];
    v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(a5, "poolIdentifier"));
    v12 = *MEMORY[0x1E0CBBF10];
    v21[0] = v11;
    v21[1] = &unk_1E49FA5A8;
    v13 = *MEMORY[0x1E0CBC050];
    v20[1] = v12;
    v20[2] = v13;
    v21[2] = MEMORY[0x1E0C9AAB0];
    v23[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
    v14 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 4);
    if (objc_msgSend(a6, "count"))
    {
      v15 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v14);
      objc_msgSend(v15, "addEntriesFromDictionary:", a6);
      v16 = (NSDictionary *)objc_msgSend(v15, "copy");
    }
    else
    {
      v16 = v14;
    }
    v10->_pixelBufferAttributes = v16;
  }
  return v10;
}

+ (id)onDemandAllocatorWithDimensions:(id)a3 pixelFormat:(unsigned int)a4 name:(id)a5 memoryPool:(id)a6
{
  uint64_t v8;
  id v10;
  BWOnDemandPixelBufferAllocator *v11;
  BWOnDemandPixelBufferAllocator *v12;
  id v14;
  _QWORD v15[2];

  v8 = *(_QWORD *)&a4;
  v15[1] = *MEMORY[0x1E0C80C00];
  v10 = +[BWVideoFormatRequirements formatRequirements](BWVideoFormatRequirements, "formatRequirements");
  objc_msgSend(v10, "setWidth:", a3.var0);
  objc_msgSend(v10, "setHeight:", *(uint64_t *)&a3 >> 32);
  v15[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8);
  objc_msgSend(v10, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1));
  if (!v10)
  {
    fig_log_get_emitter();
LABEL_6:
    FigDebugAssert3();
    v12 = 0;
    return v12;
  }
  v11 = [BWOnDemandPixelBufferAllocator alloc];
  v14 = v10;
  v12 = -[BWOnDemandPixelBufferAllocator initWithVideoFormat:name:memoryPool:additionalPixelBufferAttributes:](v11, "initWithVideoFormat:name:memoryPool:additionalPixelBufferAttributes:", +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1)), a5, a6, 0);
  if (!v12)
  {
    fig_log_get_emitter();
    goto LABEL_6;
  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWOnDemandPixelBufferAllocator;
  -[BWOnDemandPixelBufferAllocator dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p>"), objc_opt_class(), self);
}

- (__CVBuffer)newPixelBuffer
{
  CVPixelBufferRef pixelBufferOut;

  pixelBufferOut = 0;
  if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], -[BWOnDemandPixelBufferAllocator width](self, "width"), -[BWOnDemandPixelBufferAllocator height](self, "height"), -[BWOnDemandPixelBufferAllocator pixelFormat](self, "pixelFormat"), (CFDictionaryRef)self->_pixelBufferAttributes, &pixelBufferOut))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return pixelBufferOut;
}

- (unsigned)pixelFormat
{
  return -[BWVideoFormat pixelFormat](self->_videoFormat, "pixelFormat");
}

- (unint64_t)width
{
  return -[BWVideoFormat width](self->_videoFormat, "width");
}

- (unint64_t)height
{
  return -[BWVideoFormat height](self->_videoFormat, "height");
}

- ($2825F4736939C4A6D3AD43837233062D)dimensions
{
  unsigned int v3;

  v3 = -[BWVideoFormat width](self->_videoFormat, "width");
  return ($2825F4736939C4A6D3AD43837233062D)(v3 | ((unint64_t)-[BWVideoFormat height](self->_videoFormat, "height") << 32));
}

- (unint64_t)sliceCount
{
  return -[BWVideoFormat sliceCount](self->_videoFormat, "sliceCount");
}

- (BOOL)usesMemoryPool
{
  return 1;
}

- (NSString)name
{
  return self->_name;
}

@end
