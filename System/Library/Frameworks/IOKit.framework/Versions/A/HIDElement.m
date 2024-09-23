@implementation HIDElement

- (void)dealloc
{
  objc_super v3;

  _IOHIDElementReleasePrivate(self);
  v3.receiver = self;
  v3.super_class = (Class)HIDElement;
  -[HIDElement dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  return IOHIDElementGetCookie((IOHIDElementRef)self);
}

- (BOOL)isEqual:(id)a3
{
  IOHIDElementCookie Cookie;

  if (self == a3)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  Cookie = IOHIDElementGetCookie((IOHIDElementRef)self);
  return Cookie == IOHIDElementGetCookie((IOHIDElementRef)a3);
}

@end
