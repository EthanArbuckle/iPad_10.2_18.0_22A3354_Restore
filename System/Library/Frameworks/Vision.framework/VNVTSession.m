@implementation VNVTSession

- (VNVTSession)initWithSession:(void *)a3
{
  objc_super v4;

  self->_session = a3;
  v4.receiver = self;
  v4.super_class = (Class)VNVTSession;
  return -[VNVTSession init](&v4, sel_init);
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_session);
  v3.receiver = self;
  v3.super_class = (Class)VNVTSession;
  -[VNVTSession dealloc](&v3, sel_dealloc);
}

@end
