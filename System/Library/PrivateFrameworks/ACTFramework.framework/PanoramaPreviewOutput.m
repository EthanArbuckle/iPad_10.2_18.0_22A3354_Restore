@implementation PanoramaPreviewOutput

- (PanoramaPreviewOutput)init
{
  PanoramaPreviewOutput *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PanoramaPreviewOutput;
  v2 = -[PanoramaPreviewOutput init](&v4, sel_init);
  if (v2)
    v2->_pixelBuffer = 0;

  return 0;
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (void)setPixelBuffer:(__CVBuffer *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
