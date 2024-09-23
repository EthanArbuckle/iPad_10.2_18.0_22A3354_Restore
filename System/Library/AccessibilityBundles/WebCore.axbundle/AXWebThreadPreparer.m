@implementation AXWebThreadPreparer

+ (id)sharedPreparer
{
  if (sharedPreparer_onceToken != -1)
    dispatch_once(&sharedPreparer_onceToken, &__block_literal_global_0);
  return (id)WebThreadPreparer;
}

void __37__AXWebThreadPreparer_sharedPreparer__block_invoke()
{
  AXWebThreadPreparer *v0;
  void *v1;

  v0 = objc_alloc_init(AXWebThreadPreparer);
  v1 = (void *)WebThreadPreparer;
  WebThreadPreparer = (uint64_t)v0;

}

- (AXWebThreadPreparer)init
{
  AXWebThreadPreparer *v2;
  __CFRunLoopObserver *v3;
  __CFRunLoop *Current;
  AXWebThreadPreparer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AXWebThreadPreparer;
  v2 = -[AXWebThreadPreparer init](&v7, sel_init);
  if (v2)
  {
    v3 = CFRunLoopObserverCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0xA0uLL, 1u, 2500001, (CFRunLoopObserverCallBack)_runLoopExitObserver, 0);
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddObserver(Current, v3, (CFRunLoopMode)*MEMORY[0x24BDBD598]);
    CFRelease(v3);
    v5 = v2;
  }

  return v2;
}

- (BOOL)preparedThisRunLoop
{
  return self->_preparedThisRunLoop;
}

- (void)setPreparedThisRunLoop:(BOOL)a3
{
  self->_preparedThisRunLoop = a3;
}

- (BOOL)preparedAnswer
{
  return self->_preparedAnswer;
}

- (void)setPreparedAnswer:(BOOL)a3
{
  self->_preparedAnswer = a3;
}

@end
