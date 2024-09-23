@implementation FPInFlightCommandBuffer

- (FPInFlightCommandBuffer)initWithAddress:(void *)a3 creationTime:(double)a4
{
  FPInFlightCommandBuffer *result;
  unint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FPInFlightCommandBuffer;
  result = -[FPInFlightCommandBuffer init](&v8, sel_init);
  if (result)
  {
    result->_address = a3;
    result->_creationTime = a4;
    do
      v7 = __ldaxr(&gFPInFlightCommandBufferCount);
    while (__stlxr(v7 + 1, &gFPInFlightCommandBufferCount));
  }
  return result;
}

- (void)dealloc
{
  unint64_t v2;
  objc_super v3;

  do
    v2 = __ldaxr(&gFPInFlightCommandBufferCount);
  while (__stlxr(v2 - 1, &gFPInFlightCommandBufferCount));
  v3.receiver = self;
  v3.super_class = (Class)FPInFlightCommandBuffer;
  -[FPInFlightCommandBuffer dealloc](&v3, sel_dealloc);
}

@end
