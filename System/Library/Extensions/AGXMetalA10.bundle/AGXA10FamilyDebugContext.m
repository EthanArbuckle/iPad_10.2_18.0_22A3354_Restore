@implementation AGXA10FamilyDebugContext

- (AGXA10FamilyDebugContext)initWithCommandBuffer:(id)a3
{
  AGXA10FamilyDebugContext *v3;
  _QWORD *v4;
  _QWORD *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AGXA10FamilyDebugContext;
  v3 = -[IOGPUMetalDebugCommandEncoder initWithCommandBuffer:](&v7, sel_initWithCommandBuffer_, a3);
  if (v3)
  {
    v4 = malloc_type_calloc(0x10uLL, 1uLL, 0xAA563435uLL);
    v3->_impl = v4;
    if (v4)
    {
      v5 = v4;
      *v4 = v3;
      *((_BYTE *)v4 + 12) = 0;
      -[MTLDevice deviceRef](-[_MTLCommandEncoder device](v3, "device"), "deviceRef");
      *((_DWORD *)v5 + 2) = IOGPUDeviceGetConnect();
    }
    else
    {
      -[AGXA10FamilyDebugContext endEncoding](v3, "endEncoding");

      return 0;
    }
  }
  return v3;
}

- (void)dealloc
{
  void *impl;
  objc_super v4;

  impl = self->_impl;
  if (impl)
  {
    free(impl);
    self->_impl = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AGXA10FamilyDebugContext;
  -[IOGPUMetalDebugCommandEncoder dealloc](&v4, sel_dealloc);
}

- (void)endEncoding
{
  objc_super v2;

  *((_BYTE *)self->_impl + 12) = 1;
  v2.receiver = self;
  v2.super_class = (Class)AGXA10FamilyDebugContext;
  -[IOGPUMetalDebugCommandEncoder endEncoding](&v2, sel_endEncoding);
}

- (unsigned)getLastStartStopCaptureResult
{
  return 0;
}

@end
