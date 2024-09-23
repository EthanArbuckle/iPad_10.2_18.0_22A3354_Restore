@implementation CFPDCFDataBuffer

- (CFPDCFDataBuffer)initWithCFData:(__CFData *)a3
{
  CFPDCFDataBuffer *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)CFPDCFDataBuffer;
  v4 = -[CFPDCFDataBuffer init](&v6, sel_init);
  if (v4)
    v4->data = (__CFData *)CFRetain(a3);
  return v4;
}

- (void)bytes
{
  return (void *)CFDataGetBytePtr(self->data);
}

- (unint64_t)length
{
  return CFDataGetLength(self->data);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  CFRelease(self->data);
  v3.receiver = self;
  v3.super_class = (Class)CFPDCFDataBuffer;
  -[CFPDCFDataBuffer dealloc](&v3, sel_dealloc);
}

- (__CFData)copyCFData
{
  return CFDataCreateCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, self->data);
}

- (id)copyXPCData
{
  NSObject *DispatchData;
  xpc_object_t v3;

  DispatchData = _CFDataCreateDispatchData(self->data);
  v3 = xpc_data_create_with_dispatch_data(DispatchData);
  dispatch_release(DispatchData);
  return v3;
}

@end
