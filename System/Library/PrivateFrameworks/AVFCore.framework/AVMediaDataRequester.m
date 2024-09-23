@implementation AVMediaDataRequester

- (AVMediaDataRequester)initWithMediaDataConsumer:(id)a3 requestQueue:(id)a4 requestBlock:(id)a5
{
  AVMediaDataRequester *v9;
  AVMediaDataRequester *v10;
  AVMediaDataRequester *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  AVMediaDataRequester *v21;
  AVMediaDataRequester *v22;
  AVMediaDataRequester *v23;
  void *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)AVMediaDataRequester;
  v9 = -[AVMediaDataRequester init](&v25, sel_init);
  v10 = v9;
  if (v9)
  {
    if (a3)
    {
      if (a4)
      {
        if (a5)
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v10->_mediaDataConsumer = (AVMediaDataRequesterConsumer *)a3;
            dispatch_retain((dispatch_object_t)a4);
            v10->_requestQueue = (OS_dispatch_queue *)a4;
            v10->_requestBlock = (id)objc_msgSend(a5, "copy");
            v10->_invalidateMutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
            return v10;
          }
          v23 = v10;
          v18 = (void *)MEMORY[0x1E0C99DA0];
          v19 = *MEMORY[0x1E0C99778];
          v20 = "[mediaDataConsumer respondsToSelector:@selector(isReadyForMoreMediaData)]";
        }
        else
        {
          v22 = v9;
          v18 = (void *)MEMORY[0x1E0C99DA0];
          v19 = *MEMORY[0x1E0C99778];
          v20 = "requestBlock != nil";
        }
      }
      else
      {
        v21 = v9;
        v18 = (void *)MEMORY[0x1E0C99DA0];
        v19 = *MEMORY[0x1E0C99778];
        v20 = "requestQueue != NULL";
      }
    }
    else
    {
      v12 = v9;
      v18 = (void *)MEMORY[0x1E0C99DA0];
      v19 = *MEMORY[0x1E0C99778];
      v20 = "mediaDataConsumer != nil";
    }
    v24 = (void *)objc_msgSend(v18, "exceptionWithName:reason:userInfo:", v19, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v10, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v13, v14, v15, v16, v17, (uint64_t)v20), 0);
    objc_exception_throw(v24);
  }
  return v10;
}

- (AVMediaDataRequester)init
{
  return -[AVMediaDataRequester initWithMediaDataConsumer:requestQueue:requestBlock:](self, "initWithMediaDataConsumer:requestQueue:requestBlock:", 0, 0, 0);
}

- (void)dealloc
{
  NSObject *requestQueue;
  objc_super v4;

  requestQueue = self->_requestQueue;
  if (requestQueue)
    dispatch_release(requestQueue);
  if (self->_invalidateMutex)
  {
    FigSimpleMutexDestroy();
    self->_invalidateMutex = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AVMediaDataRequester;
  -[AVMediaDataRequester dealloc](&v4, sel_dealloc);
}

- (void)startRequestingMediaData
{
  NSObject *requestQueue;
  _QWORD block[5];

  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__AVMediaDataRequester_startRequestingMediaData__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  dispatch_async(requestQueue, block);
}

uint64_t __48__AVMediaDataRequester_startRequestingMediaData__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_requestMediaDataIfReady");
}

- (void)_setInvalidatePending
{
  MEMORY[0x194033BF8](self->_invalidateMutex, a2);
  self->_invalidatePending = 1;
  JUMPOUT(0x194033C04);
}

- (BOOL)_isInvalidatePending
{
  BOOL invalidatePending;

  MEMORY[0x194033BF8](self->_invalidateMutex, a2);
  invalidatePending = self->_invalidatePending;
  MEMORY[0x194033C04](self->_invalidateMutex);
  return invalidatePending;
}

- (void)invalidate
{
  NSObject *requestQueue;
  _QWORD block[5];

  -[AVMediaDataRequester _setInvalidatePending](self, "_setInvalidatePending");
  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__AVMediaDataRequester_invalidate__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  dispatch_async(requestQueue, block);
}

void __34__AVMediaDataRequester_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  if (v3)
  {

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = 0;
    v2 = *(_QWORD *)(a1 + 32);
  }
  v4 = *(void **)(v2 + 8);
  if (v4)
  {

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  }
}

- (void)_requestMediaDataIfReady
{
  void *v3;
  NSObject *requestQueue;
  _QWORD block[5];

  v3 = (void *)MEMORY[0x1940343FC](self, a2);
  if (-[AVMediaDataRequesterConsumer isReadyForMoreMediaData](self->_mediaDataConsumer, "isReadyForMoreMediaData"))
  {
    if (self->_requestBlock)
    {
      if (!-[AVMediaDataRequester _isInvalidatePending](self, "_isInvalidatePending"))
      {
        (*((void (**)(void))self->_requestBlock + 2))();
        if (-[AVMediaDataRequesterConsumer isReadyForMoreMediaData](self->_mediaDataConsumer, "isReadyForMoreMediaData"))
        {
          if (self->_requestBlock)
          {
            requestQueue = self->_requestQueue;
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __48__AVMediaDataRequester__requestMediaDataIfReady__block_invoke;
            block[3] = &unk_1E302FA10;
            block[4] = self;
            dispatch_async(requestQueue, block);
          }
        }
      }
    }
  }
  objc_autoreleasePoolPop(v3);
}

uint64_t __48__AVMediaDataRequester__requestMediaDataIfReady__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_requestMediaDataIfReady");
}

- (OS_dispatch_queue)requestQueue
{
  return self->_requestQueue;
}

- (id)requestBlock
{
  return self->_requestBlock;
}

@end
