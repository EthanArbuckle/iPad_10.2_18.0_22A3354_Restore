@implementation IOGPUMetalDeviceAssertion

- (IOGPUMetalDeviceAssertion)initWithDevice:(id)a3 assertionType:(unint64_t)a4 options:(unint64_t)a5
{
  id v9;

  v9 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 = (id)objc_msgSend(a3, "originalObject");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (IOGPUDeviceCreateDeviceAssertion((_DWORD *)objc_msgSend(v9, "deviceRef"), a4, a5, &self->fSendRight.mrs_name))
    {

      return 0;
    }
    else
    {
      self->fAssertionType = a4;
      self->fAssertionOptions = a5;
    }
  }
  return self;
}

- (void)dealloc
{
  objc_super v3;

  if (self->fSendRight.mrs_name - 1 <= 0xFFFFFFFD)
    mach_right_send_release();
  v3.receiver = self;
  v3.super_class = (Class)IOGPUMetalDeviceAssertion;
  -[IOGPUMetalDeviceAssertion dealloc](&v3, sel_dealloc);
}

@end
