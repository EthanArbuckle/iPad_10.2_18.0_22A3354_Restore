@implementation MTLIOAccelIOHandleCompressed

- (MTLIOAccelIOHandleCompressed)initWithDevice:(id)a3 path:(const char *)a4 compressionType:(int64_t)a5 error:(id *)a6 uncached:(BOOL)a7
{
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTLIOAccelIOHandleCompressed;
  return -[_MTLIOHandleCompressed initWithDevice:path:compressionType:error:uncached:](&v8, sel_initWithDevice_path_compressionType_error_uncached_, a3, a4, a5, a6, a7);
}

- (void)setLabel:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLIOAccelIOHandleCompressed;
  -[_MTLObjectWithLabel setLabel:](&v5, sel_setLabel_);
  if (*(_DWORD *)*MEMORY[0x1E0D39EE0])
  {
    -[_MTLIOHandleCompressed globalTraceObjectID](self, "globalTraceObjectID");
    objc_msgSend(a3, "cStringUsingEncoding:", 1);
    self->super._labelTraceID = IOAccelDeviceTraceObjectLabel();
  }
}

@end
