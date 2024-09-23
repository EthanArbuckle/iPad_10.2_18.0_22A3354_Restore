@implementation MTLIOAccelIOHandleRaw

- (MTLIOAccelIOHandleRaw)initWithDevice:(id)a3 path:(const char *)a4 error:(id *)a5 uncached:(BOOL)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTLIOAccelIOHandleRaw;
  return -[_MTLIOHandleRaw initWithDevice:path:error:uncached:](&v7, sel_initWithDevice_path_error_uncached_, a3, a4, a5, a6);
}

- (void)setLabel:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLIOAccelIOHandleRaw;
  -[_MTLObjectWithLabel setLabel:](&v5, sel_setLabel_);
  if (*(_DWORD *)*MEMORY[0x1E0D39EE0])
  {
    -[_MTLIOHandleRaw globalTraceObjectID](self, "globalTraceObjectID");
    objc_msgSend(a3, "cStringUsingEncoding:", 1);
    self->super._labelTraceID = IOAccelDeviceTraceObjectLabel();
  }
}

@end
