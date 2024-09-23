@implementation HMFMainThreadAsyncContext

void __HMFMainThreadAsyncContext_block_invoke()
{
  _HMFMainThreadAsyncContext *v0;
  void *v1;

  v0 = objc_alloc_init(_HMFMainThreadAsyncContext);
  v1 = (void *)qword_1ED013250;
  qword_1ED013250 = (uint64_t)v0;

}

@end
