@implementation AFBBufRef

- (AFBBufRef)initWithData:(id)a3
{
  id v5;
  AFBBufRef *v6;
  AFBBufRef *v7;
  CFAllocatorContext context;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AFBBufRef;
  v6 = -[AFBBufRef init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_data, a3);
    context.version = 0;
    context.info = v7;
    memset(&context.retain, 0, 24);
    context.allocate = (CFAllocatorAllocateCallBack)cfAllocateAlwaysFailing;
    context.reallocate = 0;
    context.deallocate = (CFAllocatorDeallocateCallBack)cfDeallocateBackingObject;
    context.preferredSize = 0;
    v7->_cfReleaseBackingDataDeallocator = CFAllocatorCreate(0, &context);
  }

  return v7;
}

- (__CFAllocator)deallocator
{
  return self->_cfReleaseBackingDataDeallocator;
}

- (void)dealloc
{
  __CFAllocator *cfReleaseBackingDataDeallocator;
  objc_super v4;

  cfReleaseBackingDataDeallocator = self->_cfReleaseBackingDataDeallocator;
  if (cfReleaseBackingDataDeallocator)
    CFRelease(cfReleaseBackingDataDeallocator);
  v4.receiver = self;
  v4.super_class = (Class)AFBBufRef;
  -[AFBBufRef dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

- (NSData)data
{
  return self->_data;
}

@end
