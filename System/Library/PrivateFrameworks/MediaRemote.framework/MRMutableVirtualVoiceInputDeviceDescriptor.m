@implementation MRMutableVirtualVoiceInputDeviceDescriptor

- (void)setSupportedFormats:(id)a3
{
  NSArray *v4;
  NSArray *supportedFormats;

  if (self->super._supportedFormats != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    supportedFormats = self->super._supportedFormats;
    self->super._supportedFormats = v4;

  }
}

- (void)setDefaultFormat:(id)a3
{
  NSDictionary *v4;
  NSDictionary *defaultFormat;

  if (self->super._defaultFormat != a3)
  {
    v4 = (NSDictionary *)objc_msgSend(a3, "copy");
    defaultFormat = self->super._defaultFormat;
    self->super._defaultFormat = v4;

  }
}

@end
