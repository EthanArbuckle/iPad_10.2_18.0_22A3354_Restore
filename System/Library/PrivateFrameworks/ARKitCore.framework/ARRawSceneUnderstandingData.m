@implementation ARRawSceneUnderstandingData

- (void)sceneUnderstandingResultRef
{
  return self->_resultsRef;
}

- (void)setSemanticSegmentationBuffer:(__CVBuffer *)a3
{
  __CVBuffer *semanticSegmentationBuffer;

  semanticSegmentationBuffer = self->_semanticSegmentationBuffer;
  if (semanticSegmentationBuffer != a3)
  {
    CVPixelBufferRelease(semanticSegmentationBuffer);
    self->_semanticSegmentationBuffer = a3;
    CVPixelBufferRetain(a3);
  }
}

- (void)setSemanticSegmentationBufferSampledForDepth:(__CVBuffer *)a3
{
  __CVBuffer *semanticSegmentationBufferSampledForDepth;

  semanticSegmentationBufferSampledForDepth = self->_semanticSegmentationBufferSampledForDepth;
  if (semanticSegmentationBufferSampledForDepth != a3)
  {
    CVPixelBufferRelease(semanticSegmentationBufferSampledForDepth);
    self->_semanticSegmentationBufferSampledForDepth = a3;
    CVPixelBufferRetain(a3);
  }
}

- (void)setSemanticSegmentationUncertaintyBuffer:(__CVBuffer *)a3
{
  __CVBuffer *semanticSegmentationUncertaintyBuffer;

  semanticSegmentationUncertaintyBuffer = self->_semanticSegmentationUncertaintyBuffer;
  if (semanticSegmentationUncertaintyBuffer != a3)
  {
    CVPixelBufferRelease(semanticSegmentationUncertaintyBuffer);
    self->_semanticSegmentationUncertaintyBuffer = a3;
    CVPixelBufferRetain(a3);
  }
}

- (void)setSemanticSegmentationConfidenceBuffer:(__CVBuffer *)a3
{
  __CVBuffer *semanticSegmentationConfidenceBuffer;

  semanticSegmentationConfidenceBuffer = self->_semanticSegmentationConfidenceBuffer;
  if (semanticSegmentationConfidenceBuffer != a3)
  {
    CVPixelBufferRelease(semanticSegmentationConfidenceBuffer);
    self->_semanticSegmentationConfidenceBuffer = a3;
    CVPixelBufferRetain(a3);
  }
}

- (void)setSemanticSegmentationConfidenceBufferSampledForDepth:(__CVBuffer *)a3
{
  __CVBuffer *semanticSegmentationConfidenceBufferSampledForDepth;

  semanticSegmentationConfidenceBufferSampledForDepth = self->_semanticSegmentationConfidenceBufferSampledForDepth;
  if (semanticSegmentationConfidenceBufferSampledForDepth != a3)
  {
    CVPixelBufferRelease(semanticSegmentationConfidenceBufferSampledForDepth);
    self->_semanticSegmentationConfidenceBufferSampledForDepth = CVPixelBufferRetain(a3);
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

- (void)setDepthBuffer:(__CVBuffer *)a3
{
  __CVBuffer *depthBuffer;

  depthBuffer = self->_depthBuffer;
  if (depthBuffer != a3)
  {
    CVPixelBufferRelease(depthBuffer);
    self->_depthBuffer = a3;
    CVPixelBufferRetain(a3);
  }
}

- (void)setDepthConfidenceBuffer:(__CVBuffer *)a3
{
  __CVBuffer *depthConfidenceBuffer;

  depthConfidenceBuffer = self->_depthConfidenceBuffer;
  if (depthConfidenceBuffer != a3)
  {
    CVPixelBufferRelease(depthConfidenceBuffer);
    self->_depthConfidenceBuffer = a3;
    CVPixelBufferRetain(a3);
  }
}

- (void)setCapturedImage:(__CVBuffer *)a3
{
  __CVBuffer *capturedImage;

  capturedImage = self->_capturedImage;
  if (capturedImage != a3)
  {
    CVPixelBufferRelease(capturedImage);
    self->_capturedImage = CVPixelBufferRetain(a3);
  }
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_semanticSegmentationBuffer);
  CVPixelBufferRelease(self->_semanticSegmentationBufferSampledForDepth);
  CVPixelBufferRelease(self->_semanticSegmentationConfidenceBuffer);
  CVPixelBufferRelease(self->_semanticSegmentationConfidenceBufferSampledForDepth);
  CVPixelBufferRelease(self->_semanticSegmentationUncertaintyBuffer);
  CVPixelBufferRelease(self->_normalsBuffer);
  CVPixelBufferRelease(self->_depthBuffer);
  CVPixelBufferRelease(self->_depthConfidenceBuffer);
  CVPixelBufferRelease(self->_capturedImage);
  v3.receiver = self;
  v3.super_class = (Class)ARRawSceneUnderstandingData;
  -[ARRawSceneUnderstandingData dealloc](&v3, sel_dealloc);
}

- (ARCamera)wideCamera
{
  return self->wideCamera;
}

- (void)setWideCamera:(id)a3
{
  objc_storeStrong((id *)&self->wideCamera, a3);
}

- (ARCamera)ultraWideCamera
{
  return self->ultraWideCamera;
}

- (void)setUltraWideCamera:(id)a3
{
  objc_storeStrong((id *)&self->ultraWideCamera, a3);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (__CVBuffer)semanticSegmentationBuffer
{
  return self->_semanticSegmentationBuffer;
}

- (__CVBuffer)semanticSegmentationBufferSampledForDepth
{
  return self->_semanticSegmentationBufferSampledForDepth;
}

- (__CVBuffer)semanticSegmentationConfidenceBuffer
{
  return self->_semanticSegmentationConfidenceBuffer;
}

- (__CVBuffer)semanticSegmentationConfidenceBufferSampledForDepth
{
  return self->_semanticSegmentationConfidenceBufferSampledForDepth;
}

- (__CVBuffer)semanticSegmentationUncertaintyBuffer
{
  return self->_semanticSegmentationUncertaintyBuffer;
}

- (__CVBuffer)normalsBuffer
{
  return self->_normalsBuffer;
}

- (__CVBuffer)depthBuffer
{
  return self->_depthBuffer;
}

- (__CVBuffer)depthConfidenceBuffer
{
  return self->_depthConfidenceBuffer;
}

- (__CVBuffer)capturedImage
{
  return self->_capturedImage;
}

- (ARMLImageDownScalingResultData)ultraWideDownscalingResultData
{
  return self->_ultraWideDownscalingResultData;
}

- (void)setUltraWideDownscalingResultData:(id)a3
{
  objc_storeStrong((id *)&self->_ultraWideDownscalingResultData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ultraWideDownscalingResultData, 0);
  objc_storeStrong((id *)&self->ultraWideCamera, 0);
  objc_storeStrong((id *)&self->wideCamera, 0);
}

@end
