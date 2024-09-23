@implementation BWDeferredContainerPixelBufferPoolWrapper

- (BWDeferredContainerPixelBufferPoolWrapper)initWithVideoFormat:(id)a3 capacity:(unint64_t)a4 name:(id)a5
{
  BWDeferredContainerPixelBufferPoolWrapper *v8;
  BWPixelBufferPool *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BWDeferredContainerPixelBufferPoolWrapper;
  v8 = -[BWDeferredContainerPixelBufferPoolWrapper init](&v11, sel_init);
  if (v8)
  {
    v9 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", a3, a4, a5, +[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"));
    v8->_pool = v9;
    v8->_semaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(-[BWPixelBufferPool capacity](v9, "capacity"));
  }
  return v8;
}

- (void)newPixelBuffer
{
  _DWORD *v2;
  NSObject *v3;
  dispatch_time_t v4;
  void *v5;

  if (!a1)
    return 0;
  v2 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  v3 = *(NSObject **)(a1 + 16);
  v4 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v3, v4))
  {
    FigDebugAssert3();
    v5 = 0;
  }
  else
  {
    v5 = (void *)objc_msgSend(*(id *)(a1 + 8), "newPixelBuffer");
    if (v5)

    else
      FigDebugAssert3();
  }
  if (*v2 == 1)
    kdebug_trace();
  return v5;
}

- (void)flushToMinimumCapacity:(unint64_t)a3
{
  -[BWPixelBufferPool flushToMinimumCapacity:](self->_pool, "flushToMinimumCapacity:", a3);
}

- (void)signal
{
  _DWORD *v3;

  v3 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
  if (*v3 == 1)
    kdebug_trace();
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->_semaphore);
  v3.receiver = self;
  v3.super_class = (Class)BWDeferredContainerPixelBufferPoolWrapper;
  -[BWDeferredContainerPixelBufferPoolWrapper dealloc](&v3, sel_dealloc);
}

@end
