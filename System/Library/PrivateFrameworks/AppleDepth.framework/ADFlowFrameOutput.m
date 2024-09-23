@implementation ADFlowFrameOutput

- (void)setDepth:(__CVBuffer *)a3
{
  CVPixelBufferRelease(self->_depth);
  self->_depth = CVPixelBufferRetain(a3);
}

- (void)setConfidence:(__CVBuffer *)a3
{
  CVPixelBufferRelease(self->_confidence);
  self->_confidence = CVPixelBufferRetain(a3);
}

- (void)setConfidenceLevels:(__CVBuffer *)a3
{
  CVPixelBufferRelease(self->_confidenceLevels);
  self->_confidenceLevels = CVPixelBufferRetain(a3);
}

- (void)setUncertainty:(__CVBuffer *)a3
{
  CVPixelBufferRelease(self->_uncertainty);
  self->_uncertainty = CVPixelBufferRetain(a3);
}

- (void)setDepthMask:(__CVBuffer *)a3
{
  CVPixelBufferRelease(self->_depthMask);
  self->_depthMask = CVPixelBufferRetain(a3);
}

- (void)setNormals:(__CVBuffer *)a3
{
  CVPixelBufferRelease(self->_normals);
  self->_normals = CVPixelBufferRetain(a3);
}

- (void)setFiguresOfMerit:(id)a3
{
  objc_storeStrong((id *)&self->_figuresOfMerit, a3);
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_depth);
  CVPixelBufferRelease(self->_confidence);
  CVPixelBufferRelease(self->_uncertainty);
  CVPixelBufferRelease(self->_depthMask);
  CVPixelBufferRelease(self->_normals);
  CVPixelBufferRelease(self->_confidenceLevels);
  v3.receiver = self;
  v3.super_class = (Class)ADFlowFrameOutput;
  -[ADFlowFrameOutput dealloc](&v3, sel_dealloc);
}

- (__CVBuffer)depth
{
  return self->_depth;
}

- (__CVBuffer)confidence
{
  return self->_confidence;
}

- (__CVBuffer)confidenceLevels
{
  return self->_confidenceLevels;
}

- (__CVBuffer)uncertainty
{
  return self->_uncertainty;
}

- (__CVBuffer)depthMask
{
  return self->_depthMask;
}

- (__CVBuffer)normals
{
  return self->_normals;
}

- (NSDictionary)figuresOfMerit
{
  return self->_figuresOfMerit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_figuresOfMerit, 0);
}

@end
