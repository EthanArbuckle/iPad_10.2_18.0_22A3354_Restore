@implementation ARMLDepthData

- (ARMLDepthData)initWithTimestamp:(double)a3 depthBuffer:(__CVBuffer *)a4 source:(int64_t)a5
{
  ARMLDepthData *v8;
  ARMLDepthData *v9;
  CVPixelBufferRef v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ARMLDepthData;
  v8 = -[ARMLDepthData init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_timestamp = a3;
    v10 = CVPixelBufferRetain(a4);
    v9->_singleFrameDepthBuffer = 0;
    v9->_singleFrameDepthBufferLock._os_unfair_lock_opaque = 0;
    v9->_depthBuffer = v10;
    v9->_source = a5;
  }
  return v9;
}

- (ARMLDepthData)initWithTimestamp:(double)a3 depthBuffer:(__CVBuffer *)a4 confidenceBuffer:(__CVBuffer *)a5 source:(int64_t)a6
{
  ARMLDepthData *v7;

  v7 = -[ARMLDepthData initWithTimestamp:depthBuffer:source:](self, "initWithTimestamp:depthBuffer:source:", a4, a6, a3);
  if (v7)
    v7->_confidenceBuffer = CVPixelBufferRetain(a5);
  return v7;
}

- (__CVBuffer)singleFrameDepthBuffer
{
  os_unfair_lock_s *p_singleFrameDepthBufferLock;
  __CVBuffer *singleFrameDepthBuffer;

  p_singleFrameDepthBufferLock = &self->_singleFrameDepthBufferLock;
  os_unfair_lock_lock(&self->_singleFrameDepthBufferLock);
  singleFrameDepthBuffer = self->_singleFrameDepthBuffer;
  if (!singleFrameDepthBuffer)
    singleFrameDepthBuffer = self->_depthBuffer;
  os_unfair_lock_unlock(p_singleFrameDepthBufferLock);
  return singleFrameDepthBuffer;
}

- (void)setSingleFrameDepthBuffer:(__CVBuffer *)a3
{
  os_unfair_lock_s *p_singleFrameDepthBufferLock;
  __CVBuffer *singleFrameDepthBuffer;

  if (a3)
  {
    p_singleFrameDepthBufferLock = &self->_singleFrameDepthBufferLock;
    os_unfair_lock_lock(&self->_singleFrameDepthBufferLock);
    singleFrameDepthBuffer = self->_singleFrameDepthBuffer;
    if (singleFrameDepthBuffer)
      CVPixelBufferRelease(singleFrameDepthBuffer);
    self->_singleFrameDepthBuffer = a3;
    CVPixelBufferRetain(a3);
    os_unfair_lock_unlock(p_singleFrameDepthBufferLock);
  }
}

- (__CVBuffer)singleFrameConfidenceBuffer
{
  __CVBuffer *result;

  result = self->_singleFrameConfidenceBuffer;
  if (!result)
    return self->_confidenceBuffer;
  return result;
}

- (void)setSingleFrameConfidenceBuffer:(__CVBuffer *)a3
{
  __CVBuffer *singleFrameConfidenceBuffer;

  singleFrameConfidenceBuffer = self->_singleFrameConfidenceBuffer;
  if (singleFrameConfidenceBuffer != a3)
  {
    CVPixelBufferRelease(singleFrameConfidenceBuffer);
    self->_singleFrameConfidenceBuffer = CVPixelBufferRetain(a3);
  }
}

- (void)setNormalsBuffer:(__CVBuffer *)a3
{
  __CVBuffer *normalsBuffer;

  normalsBuffer = self->_normalsBuffer;
  if (normalsBuffer != a3)
  {
    CVPixelBufferRelease(normalsBuffer);
    self->_normalsBuffer = a3;
    CVPixelBufferRetain(a3);
  }
}

- (void)setConfidenceMap:(__CVBuffer *)a3
{
  __CVBuffer *confidenceMap;

  confidenceMap = self->_confidenceMap;
  if (confidenceMap != a3)
  {
    CVPixelBufferRelease(confidenceMap);
    self->_confidenceMap = a3;
    CVPixelBufferRetain(a3);
  }
}

- (void)dealloc
{
  __CVBuffer *singleFrameDepthBuffer;
  __CVBuffer *singleFrameConfidenceBuffer;
  __CVBuffer *normalsBuffer;
  objc_super v6;

  singleFrameDepthBuffer = self->_singleFrameDepthBuffer;
  if (singleFrameDepthBuffer != self->_depthBuffer)
    CVPixelBufferRelease(singleFrameDepthBuffer);
  singleFrameConfidenceBuffer = self->_singleFrameConfidenceBuffer;
  if (singleFrameConfidenceBuffer != self->_confidenceBuffer)
    CVPixelBufferRelease(singleFrameConfidenceBuffer);
  normalsBuffer = self->_normalsBuffer;
  if (normalsBuffer)
    CVPixelBufferRelease(normalsBuffer);
  CVPixelBufferRelease(self->_depthBuffer);
  CVPixelBufferRelease(self->_confidenceBuffer);
  CVPixelBufferRelease(self->_confidenceMap);
  v6.receiver = self;
  v6.super_class = (Class)ARMLDepthData;
  -[ARMLDepthData dealloc](&v6, sel_dealloc);
}

- (CGSize)depthBufferSize
{
  __CVBuffer *v2;
  __CVBuffer *v3;
  double Width;
  double Height;
  double v6;
  CGSize result;

  v2 = -[ARMLDepthData depthBuffer](self, "depthBuffer");
  if (v2)
  {
    v3 = v2;
    Width = (double)CVPixelBufferGetWidth(v2);
    Height = (double)CVPixelBufferGetHeight(v3);
  }
  else
  {
    Width = *MEMORY[0x1E0C9D820];
    Height = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v6 = Width;
  result.height = Height;
  result.width = v6;
  return result;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARMLDepthData timestamp](self, "timestamp");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(%p): %f"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (__CVBuffer)depthBuffer
{
  return self->_depthBuffer;
}

- (int64_t)source
{
  return self->_source;
}

- (__CVBuffer)confidenceBuffer
{
  return self->_confidenceBuffer;
}

- (__CVBuffer)confidenceMap
{
  return self->_confidenceMap;
}

- (__CVBuffer)normalsBuffer
{
  return self->_normalsBuffer;
}

- (ARImageData)sourceImageData
{
  return self->_sourceImageData;
}

- (void)setSourceImageData:(id)a3
{
  objc_storeStrong((id *)&self->_sourceImageData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceImageData, 0);
}

@end
