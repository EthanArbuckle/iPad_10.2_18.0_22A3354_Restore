@implementation BSUIMappedImageCacheFuture

- (BSUIMappedImageCacheFuture)init
{
  BSUIMappedImageCacheFuture *v2;
  BSUIMappedImageCacheFuture *v3;
  uint64_t v4;
  BSAtomicSignal *submitted;
  uint64_t v6;
  NSThread *submissionThread;
  uint64_t v8;
  OS_dispatch_queue *workQueue;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BSUIMappedImageCacheFuture;
  v2 = -[BSUIMappedImageCacheFuture init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = objc_opt_new();
    submitted = v3->_submitted;
    v3->_submitted = (BSAtomicSignal *)v4;

    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v6 = objc_claimAutoreleasedReturnValue();
    submissionThread = v3->_submissionThread;
    v3->_submissionThread = (NSThread *)v6;

    dispatch_get_global_queue(9, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v8;

    os_unfair_lock_lock(&v3->_lock);
  }
  return v3;
}

- (void)dealloc
{
  void *v4;
  void *v5;
  objc_super v6;

  if ((-[BSAtomicSignal hasBeenSignalled](self->_submitted, "hasBeenSignalled") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSUIMappedImageCacheFuture.m"), 40, CFSTR("work was never submitted to future"));

  }
  if (!self->_lock_workCompletionWasCalled)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSUIMappedImageCacheFuture.m"), 41, CFSTR("work completion was never called for future"));

  }
  v6.receiver = self;
  v6.super_class = (Class)BSUIMappedImageCacheFuture;
  -[BSUIMappedImageCacheFuture dealloc](&v6, sel_dealloc);
}

- (void)submitWorkBlock:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD block[5];

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", sel_submitWorkBlock_, a1, CFSTR("BSUIMappedImageCacheFuture.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("workBlock"));

    }
    if ((objc_msgSend(*(id *)(a1 + 16), "signal") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", sel_submitWorkBlock_, a1, CFSTR("BSUIMappedImageCacheFuture.m"), 51, CFSTR("attempted to submit more than one workBlock"));

    }
    v5 = *(void **)(a1 + 24);
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v5) = objc_msgSend(v5, "isEqual:", v6);

    if ((v5 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", sel_submitWorkBlock_, a1, CFSTR("BSUIMappedImageCacheFuture.m"), 52, CFSTR("attempted to submit the workBlock on a different thread than the initializer"));

    }
    v7 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = 0;

    v8 = objc_msgSend(v4, "copy");
    v9 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = v8;

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    v10 = *(NSObject **)(a1 + 56);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__BSUIMappedImageCacheFuture_submitWorkBlock___block_invoke;
    block[3] = &unk_1E4348DB0;
    block[4] = a1;
    dispatch_async(v10, block);
  }

}

id __46__BSUIMappedImageCacheFuture_submitWorkBlock___block_invoke(uint64_t a1)
{
  return -[BSUIMappedImageCacheFuture cacheImage](*(os_unfair_lock_s **)(a1 + 32));
}

- (os_unfair_lock_s)cacheImage
{
  os_unfair_lock_s *v1;
  os_unfair_lock_s *v2;
  uint64_t v3;
  void *v4;
  void *v6;
  void *v7;
  _QWORD v8[5];

  if (a1)
  {
    v1 = a1;
    v2 = a1 + 2;
    os_unfair_lock_lock(a1 + 2);
    v3 = *(_QWORD *)&v1[8]._os_unfair_lock_opaque;
    if (v3)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __40__BSUIMappedImageCacheFuture_cacheImage__block_invoke;
      v8[3] = &unk_1E43491C0;
      v8[4] = v1;
      (*(void (**)(uint64_t, _QWORD *))(v3 + 16))(v3, v8);
      if (!LOBYTE(v1[10]._os_unfair_lock_opaque))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)MEMORY[0x1A1AF63A8](*(_QWORD *)&v1[8]._os_unfair_lock_opaque);
        objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", sel_cacheImage, v1, CFSTR("BSUIMappedImageCacheFuture.m"), 72, CFSTR("workCompletion of BSUIMappedImageCacheFuture was not called synchronously within its work block : %@"), v7);

      }
      v4 = *(void **)&v1[8]._os_unfair_lock_opaque;
      *(_QWORD *)&v1[8]._os_unfair_lock_opaque = 0;

    }
    os_unfair_lock_unlock(v2);
    a1 = (os_unfair_lock_s *)*(id *)&v1[12]._os_unfair_lock_opaque;
  }
  return a1;
}

void __40__BSUIMappedImageCacheFuture_cacheImage__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), a2);
  v4 = a2;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 1;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_postlock_cachedImage, 0);
  objc_storeStrong(&self->_lock_workBlock, 0);
  objc_storeStrong((id *)&self->_submissionThread, 0);
  objc_storeStrong((id *)&self->_submitted, 0);
}

@end
