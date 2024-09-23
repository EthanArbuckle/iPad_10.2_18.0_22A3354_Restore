@implementation CMIMetalResourceCache

- (CMIMetalResourceCache)initWithMetalDevice:(id)a3
{
  id v4;
  CMIMetalResourceCache *v5;
  void *v6;
  uint64_t v7;
  MTLResidencySet *residencySet;
  const __CFAllocator *v9;
  CVReturn v10;
  CMIMetalResourceCache *v11;
  objc_super v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CMIMetalResourceCache;
  v5 = -[CMIMetalResourceCache init](&v13, sel_init);
  if (v5)
  {
    v6 = (void *)objc_opt_new();
    v7 = objc_msgSend(v4, "newResidencySetWithDescriptor:error:", v6, 0);
    residencySet = v5->_residencySet;
    v5->_residencySet = (MTLResidencySet *)v7;

    if (v5->_residencySet)
    {
      v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v14 = *MEMORY[0x1E0CA8F48];
      v15[0] = &unk_1E9513D98;
      v10 = CVMetalTextureCacheCreate(v9, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1), v4, 0, &v5->_textureCache);
      v11 = 0;
      if (!v10)
      {
        v5->_bufferCache = 0;
        v11 = v5;
      }
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)dealloc
{
  __CVMetalBufferCache *bufferCache;
  __CVMetalTextureCache *textureCache;
  objc_super v5;

  bufferCache = self->_bufferCache;
  if (bufferCache)
    CFRelease(bufferCache);
  textureCache = self->_textureCache;
  if (textureCache)
    CFRelease(textureCache);
  v5.receiver = self;
  v5.super_class = (Class)CMIMetalResourceCache;
  -[CMIMetalResourceCache dealloc](&v5, sel_dealloc);
}

- (id)getTextureFromPixelBuffer:(__CVBuffer *)a3 planeIndex:(int)a4 pixelFormat:(unint64_t)a5 usage:(unint64_t)a6
{
  const __CFAllocator *v10;
  __CVMetalTextureCache *textureCache;
  void *v12;
  const __CFDictionary *v13;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  CVReturn v16;
  void *v17;
  CVMetalTextureRef image;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  image = 0;
  v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  textureCache = self->_textureCache;
  v20 = *MEMORY[0x1E0CA8F58];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v12;
  v13 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, a4);
  HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, a4);
  v16 = CVMetalTextureCacheCreateTextureFromImage(v10, textureCache, a3, v13, (MTLPixelFormat)a5, WidthOfPlane, HeightOfPlane, a4, &image);

  v17 = 0;
  if (!v16)
  {
    CVMetalTextureGetTexture(image);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((-[MTLResidencySet containsAllocation:](self->_residencySet, "containsAllocation:", v17) & 1) == 0)
      -[MTLResidencySet addAllocation:](self->_residencySet, "addAllocation:", v17);
    if (image)
      CFRelease(image);
  }
  return v17;
}

- (void)flush
{
  -[MTLResidencySet removeAllAllocations](self->_residencySet, "removeAllAllocations");
  CVMetalTextureCacheFlush(self->_textureCache, 0);
}

- (id)getBufferFromPixelBuffer:(__CVBuffer *)a3
{
  void *v4;

  v4 = 0;
  if (!CVMetalBufferCacheCreateBufferFromImage())
  {
    CVMetalBufferGetBuffer();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((-[MTLResidencySet containsAllocation:](self->_residencySet, "containsAllocation:", v4) & 1) == 0)
      -[MTLResidencySet addAllocation:](self->_residencySet, "addAllocation:", v4);
  }
  return v4;
}

- (void)makeResidentOnCommandBuffer:(id)a3
{
  MTLResidencySet *residencySet;
  id v5;

  residencySet = self->_residencySet;
  v5 = a3;
  -[MTLResidencySet commit](residencySet, "commit");
  objc_msgSend(v5, "useResidencySet:", self->_residencySet);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_residencySet, 0);
}

@end
