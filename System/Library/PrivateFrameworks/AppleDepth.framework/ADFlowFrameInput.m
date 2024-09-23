@implementation ADFlowFrameInput

- (void)setColor:(__CVBuffer *)a3
{
  CVPixelBufferRelease(self->_color);
  self->_color = CVPixelBufferRetain(a3);
}

- (void)setSecondaryColor:(__CVBuffer *)a3
{
  CVPixelBufferRelease(self->_secondaryColor);
  self->_secondaryColor = CVPixelBufferRetain(a3);
}

- (void)setPearl:(__CVBuffer *)a3
{
  CVPixelBufferRelease(self->_pearl);
  self->_pearl = CVPixelBufferRetain(a3);
}

- (void)setPointClouds:(id)a3
{
  objc_storeStrong((id *)&self->_pointClouds, a3);
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_color);
  CVPixelBufferRelease(self->_secondaryColor);
  CVPixelBufferRelease(self->_pearl);
  v3.receiver = self;
  v3.super_class = (Class)ADFlowFrameInput;
  -[ADFlowFrameInput dealloc](&v3, sel_dealloc);
}

- (__CVBuffer)color
{
  return self->_color;
}

- (__CVBuffer)secondaryColor
{
  return self->_secondaryColor;
}

- (__CVBuffer)pearl
{
  return self->_pearl;
}

- (NSArray)pointClouds
{
  return self->_pointClouds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointClouds, 0);
}

@end
