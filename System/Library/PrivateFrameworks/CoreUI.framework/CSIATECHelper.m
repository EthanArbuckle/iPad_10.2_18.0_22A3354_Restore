@implementation CSIATECHelper

- (void)dealloc
{
  __CFData *data;
  objc_super v4;

  data = self->data;
  if (data)
    CFRelease(data);
  v4.receiver = self;
  v4.super_class = (Class)CSIATECHelper;
  -[CSIATECHelper dealloc](&v4, sel_dealloc);
}

@end
