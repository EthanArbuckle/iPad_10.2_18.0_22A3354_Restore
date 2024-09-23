@implementation VNVTPixelRotationSession

- (void)dealloc
{
  objc_super v3;

  VTPixelRotationSessionInvalidate(self->_pixelRotationSession);
  self->_pixelRotationSession = 0;
  v3.receiver = self;
  v3.super_class = (Class)VNVTPixelRotationSession;
  -[VNVTSession dealloc](&v3, sel_dealloc);
}

@end
