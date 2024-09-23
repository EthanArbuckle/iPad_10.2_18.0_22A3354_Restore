@implementation VNVTPixelTransferSession

- (void)dealloc
{
  objc_super v3;

  VTPixelTransferSessionInvalidate(self->_pixelTransferSession);
  v3.receiver = self;
  v3.super_class = (Class)VNVTPixelTransferSession;
  -[VNVTSession dealloc](&v3, sel_dealloc);
}

@end
