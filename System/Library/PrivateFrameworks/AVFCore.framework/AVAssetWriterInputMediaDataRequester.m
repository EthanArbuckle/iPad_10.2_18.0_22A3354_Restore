@implementation AVAssetWriterInputMediaDataRequester

- (AVAssetWriterInputMediaDataRequester)initWithRequestQueue:(id)a3 requestBlock:(id)a4
{
  AVAssetWriterInputMediaDataRequester *v7;
  AVAssetWriterInputMediaDataRequester *v8;
  AVAssetWriterInputMediaDataRequester *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  AVAssetWriterInputMediaDataRequester *v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)AVAssetWriterInputMediaDataRequester;
  v7 = -[AVAssetWriterInputMediaDataRequester init](&v21, sel_init);
  v8 = v7;
  if (v7)
  {
    if (a3)
    {
      if (a4)
      {
        dispatch_retain((dispatch_object_t)a3);
        v8->_requestQueue = (OS_dispatch_queue *)a3;
        v8->_requestBlock = (id)objc_msgSend(a4, "copy");
        v8->_ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avfoundation.mediadatarequester.ivars");
        return v8;
      }
      v19 = v7;
      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99778];
      v18 = "block != nil";
    }
    else
    {
      v10 = v7;
      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99778];
      v18 = "queue != NULL";
    }
    v20 = (void *)objc_msgSend(v16, "exceptionWithName:reason:userInfo:", v17, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v8, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v11, v12, v13, v14, v15, (uint64_t)v18), 0);
    objc_exception_throw(v20);
  }
  return v8;
}

- (AVAssetWriterInputMediaDataRequester)init
{
  return -[AVAssetWriterInputMediaDataRequester initWithRequestQueue:requestBlock:](self, "initWithRequestQueue:requestBlock:", 0, 0);
}

- (void)_collectUncollectables_invokedFromDeallocAndFinalize
{
  NSObject *requestQueue;
  NSObject *ivarAccessQueue;

  requestQueue = self->_requestQueue;
  if (requestQueue)
    dispatch_release(requestQueue);
  ivarAccessQueue = self->_ivarAccessQueue;
  if (ivarAccessQueue)
    dispatch_release(ivarAccessQueue);
}

- (void)dealloc
{
  objc_super v3;

  -[AVAssetWriterInputMediaDataRequester _collectUncollectables_invokedFromDeallocAndFinalize](self, "_collectUncollectables_invokedFromDeallocAndFinalize");
  v3.receiver = self;
  v3.super_class = (Class)AVAssetWriterInputMediaDataRequester;
  -[AVAssetWriterInputMediaDataRequester dealloc](&v3, sel_dealloc);
}

- (AVAssetWriterInputMediaDataRequesterDelegate)delegate
{
  NSObject *ivarAccessQueue;
  AVAssetWriterInputMediaDataRequesterDelegate *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__11;
  v10 = __Block_byref_object_dispose__11;
  v11 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__AVAssetWriterInputMediaDataRequester_delegate__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (AVAssetWriterInputMediaDataRequesterDelegate *)objc_msgSend((id)v7[5], "referencedObject");

  _Block_object_dispose(&v6, 8);
  return v3;
}

id __48__AVAssetWriterInputMediaDataRequester_delegate__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setDelegate:(id)a3
{
  AVWeakReference *v4;
  NSObject *ivarAccessQueue;
  _QWORD v6[6];

  v4 = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", a3);
  ivarAccessQueue = self->_ivarAccessQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__AVAssetWriterInputMediaDataRequester_setDelegate___block_invoke;
  v6[3] = &unk_1E302FCE8;
  v6[4] = v4;
  v6[5] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v6);

}

void __52__AVAssetWriterInputMediaDataRequester_setDelegate___block_invoke(uint64_t a1)
{
  id v2;

  v2 = *(id *)(a1 + 32);

  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32) = *(_QWORD *)(a1 + 32);
}

- (void)requestMediaDataIfNecessary
{
  void *v3;
  AVAssetWriterInputMediaDataRequesterDelegate *v4;
  AVAssetWriterInputMediaDataRequesterDelegate *v5;
  OS_dispatch_queue *v6;
  _QWORD block[5];

  v3 = (void *)MEMORY[0x1940343FC](self, a2);
  v4 = -[AVAssetWriterInputMediaDataRequester delegate](self, "delegate");
  if (v4)
  {
    if (-[AVAssetWriterInputMediaDataRequesterDelegate mediaDataRequesterShouldRequestMediaData](v4, "mediaDataRequesterShouldRequestMediaData"))
    {
      (*((void (**)(void))self->_requestBlock + 2))();
      v5 = -[AVAssetWriterInputMediaDataRequester delegate](self, "delegate");
      if (v5)
      {
        if (-[AVAssetWriterInputMediaDataRequesterDelegate mediaDataRequesterShouldRequestMediaData](v5, "mediaDataRequesterShouldRequestMediaData"))
        {
          v6 = -[AVAssetWriterInputMediaDataRequester requestQueue](self, "requestQueue");
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __67__AVAssetWriterInputMediaDataRequester_requestMediaDataIfNecessary__block_invoke;
          block[3] = &unk_1E302FA10;
          block[4] = self;
          dispatch_async((dispatch_queue_t)v6, block);
        }
      }
    }
  }
  objc_autoreleasePoolPop(v3);
}

uint64_t __67__AVAssetWriterInputMediaDataRequester_requestMediaDataIfNecessary__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "requestMediaDataIfNecessary");
}

- (OS_dispatch_queue)requestQueue
{
  return self->_requestQueue;
}

@end
