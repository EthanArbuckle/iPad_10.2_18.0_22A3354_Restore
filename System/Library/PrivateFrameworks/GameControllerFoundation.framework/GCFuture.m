@implementation GCFuture

+ (id)futureWithBlock:(id)a3
{
  const void *v3;
  id v4;
  id v5;

  v4 = a3;
  if (__creatorFrameKey(void)::onceToken != -1)
    dispatch_once(&__creatorFrameKey(void)::onceToken, &__block_literal_global_288);
  pthread_setspecific(__creatorFrameKey(void)::key, v3);
  v5 = -[_GCAsyncFuture _initOnQueue:withOptions:block:]([_GCAsyncFuture alloc], 0, 0, v4);

  return v5;
}

+ (id)futureWithOptions:(unsigned int)a3 block:(id)a4
{
  const void *v4;
  char v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a4;
  if (__creatorFrameKey(void)::onceToken != -1)
    dispatch_once(&__creatorFrameKey(void)::onceToken, &__block_literal_global_288);
  pthread_setspecific(__creatorFrameKey(void)::key, v4);
  v7 = -[_GCAsyncFuture _initOnQueue:withOptions:block:]([_GCAsyncFuture alloc], 0, v5, v6);

  return v7;
}

+ (id)futureWithLabel:(id)a3 block:(id)a4
{
  const void *v4;
  id v6;
  id v7;
  id v8;

  v6 = a3;
  v7 = a4;
  if (__creatorFrameKey(void)::onceToken != -1)
    dispatch_once(&__creatorFrameKey(void)::onceToken, &__block_literal_global_288);
  pthread_setspecific(__creatorFrameKey(void)::key, v4);
  v8 = -[_GCAsyncFuture _initOnQueue:withOptions:block:]([_GCAsyncFuture alloc], 0, 0, v7);
  objc_msgSend(v8, "setLabel:", v6);

  return v8;
}

+ (id)futureWithLabel:(id)a3 onQueue:(id)a4 block:(id)a5
{
  const void *v5;
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (__creatorFrameKey(void)::onceToken != -1)
    dispatch_once(&__creatorFrameKey(void)::onceToken, &__block_literal_global_288);
  pthread_setspecific(__creatorFrameKey(void)::key, v5);
  v11 = -[_GCAsyncFuture _initOnQueue:withOptions:block:]([_GCAsyncFuture alloc], v9, 0, v10);
  objc_msgSend(v11, "setLabel:", v8);

  return v11;
}

+ (id)futureOnQueue:(id)a3 withBlock:(id)a4
{
  const void *v4;
  id v6;
  id v7;
  id v8;

  v6 = a3;
  v7 = a4;
  if (__creatorFrameKey(void)::onceToken != -1)
    dispatch_once(&__creatorFrameKey(void)::onceToken, &__block_literal_global_288);
  pthread_setspecific(__creatorFrameKey(void)::key, v4);
  v8 = -[GCFuture initOnQueue:withBlock:]([_GCAsyncFuture alloc], "initOnQueue:withBlock:", v6, v7);

  return v8;
}

+ (id)futureOnQueue:(id)a3 withOptions:(unsigned int)a4 block:(id)a5
{
  const void *v5;
  uint64_t v7;
  id v8;
  id v9;
  id v10;

  v7 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = a5;
  if (__creatorFrameKey(void)::onceToken != -1)
    dispatch_once(&__creatorFrameKey(void)::onceToken, &__block_literal_global_288);
  pthread_setspecific(__creatorFrameKey(void)::key, v5);
  v10 = -[GCFuture initOnQueue:withOptions:block:]([_GCAsyncFuture alloc], "initOnQueue:withOptions:block:", v8, v7, v9);

  return v10;
}

+ (id)futureWithError:(id)a3
{
  const void *v3;
  id v4;
  _GCStaticFuture *v5;

  v4 = a3;
  if (__creatorFrameKey(void)::onceToken != -1)
    dispatch_once(&__creatorFrameKey(void)::onceToken, &__block_literal_global_288);
  pthread_setspecific(__creatorFrameKey(void)::key, v3);
  v5 = -[GCFuture initWithError:]([_GCStaticFuture alloc], "initWithError:", v4);

  return v5;
}

+ (id)futureWithResult:(id)a3
{
  const void *v3;
  id v4;
  _GCStaticFuture *v5;

  v4 = a3;
  if (__creatorFrameKey(void)::onceToken != -1)
    dispatch_once(&__creatorFrameKey(void)::onceToken, &__block_literal_global_288);
  pthread_setspecific(__creatorFrameKey(void)::key, v3);
  v5 = -[GCFuture initWithResult:]([_GCStaticFuture alloc], "initWithResult:", v4);

  return v5;
}

+ (id)cancelledFuture
{
  if (+[GCFuture cancelledFuture]::onceToken != -1)
    dispatch_once(&+[GCFuture cancelledFuture]::onceToken, &__block_literal_global_14);
  return (id)+[GCFuture cancelledFuture]::CancelledFuture;
}

void __27__GCFuture_cancelledFuture__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[GCFuture initCancelled]([_GCStaticFuture alloc], "initCancelled");
  v1 = (void *)+[GCFuture cancelledFuture]::CancelledFuture;
  +[GCFuture cancelledFuture]::CancelledFuture = (uint64_t)v0;

}

+ (id)allocWithZone:(_NSZone *)a3
{
  const void *v3;
  objc_super v7;

  if ((id)objc_opt_class() == a1)
  {
    if (__creatorFrameKey(void)::onceToken != -1)
      dispatch_once(&__creatorFrameKey(void)::onceToken, &__block_literal_global_288);
    pthread_setspecific(__creatorFrameKey(void)::key, v3);
    __immutablePlaceholderFuture();
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___GCFuture;
    return objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
  }
}

+ (id)alloc
{
  const void *v2;
  objc_super v5;

  if ((id)objc_opt_class() == a1)
  {
    if (__creatorFrameKey(void)::onceToken != -1)
      dispatch_once(&__creatorFrameKey(void)::onceToken, &__block_literal_global_288);
    pthread_setspecific(__creatorFrameKey(void)::key, v2);
    __immutablePlaceholderFuture();
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___GCFuture;
    return objc_msgSendSuper2(&v5, sel_allocWithZone_, 0);
  }
}

- (GCFuture)init
{
  -[GCFuture doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (id)_init
{
  objc_super v1;

  if (result)
  {
    v1.receiver = result;
    v1.super_class = (Class)GCFuture;
    result = objc_msgSendSuper2(&v1, sel_init);
    *((_DWORD *)result + 2) = 0;
    *((_BYTE *)result + 12) = -2;
  }
  return result;
}

- (GCFuture)initWithResult:(id)a3
{
  id v4;
  GCFuture *v5;

  v4 = a3;
  v5 = (GCFuture *)-[_GCStaticFuture _initWithResult:]([_GCStaticFuture alloc], v4);

  return v5;
}

- (GCFuture)initWithError:(id)a3
{
  id v4;
  GCFuture *v5;

  v4 = a3;
  v5 = (GCFuture *)-[_GCStaticFuture _initWithError:]([_GCStaticFuture alloc], v4);

  return v5;
}

- (id)initCancelled
{
  _DWORD *inited;

  inited = -[_GCStaticFuture _initCancelled]([_GCStaticFuture alloc]);

  return inited;
}

- (id)initOnQueue:(id)a3 withOptions:(unsigned int)a4 block:(id)a5
{
  char v6;
  id v8;
  id v9;
  id v10;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = -[_GCAsyncFuture _initOnQueue:withOptions:block:]([_GCAsyncFuture alloc], v8, v6, v9);

  return v10;
}

- (id)initOnQueue:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a3;
  v7 = a4;
  v8 = -[_GCAsyncFuture _initOnQueue:withOptions:block:]([_GCAsyncFuture alloc], v6, 0, v7);

  return v8;
}

- (void)dealloc
{
  unsigned int state;
  void *v5;
  void *v6;
  objc_super v7;

  state = self->_state;
  if (state >= 3 && state != 254)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCFuture debugDescription](self, "debugDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCFuture.mm"), 580, CFSTR("Future deallocated without finishing: %@"), v6);

  }
  v7.receiver = self;
  v7.super_class = (Class)GCFuture;
  -[GCFuture dealloc](&v7, sel_dealloc);
}

- (unint64_t)_creatorFrame
{
  return 0;
}

- (id)debugDescription
{
  void *v3;
  unint64_t v4;
  __CFString *v5;
  _BYTE *v6;
  id v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  Dl_info v16;

  -[GCFuture label](self, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_state + 2;
  if (v4 > 4)
    v5 = 0;
  else
    v5 = off_1EA4D44F0[v4];
  v6 = -[GCFuture _creatorFrame](self, "_creatorFrame");
  v7 = objc_alloc((Class)&off_1F03AA990);
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("<%@ %p"), v9, self);

  if (v3)
    objc_msgSend(v10, "appendFormat:", CFSTR(" '%@'"), v3);
  if (v6)
  {
    if (dladdr(v6, &v16))
    {
      if (v16.dli_fname)
      {
        +[NSString stringWithUTF8String:](NSString_0, "stringWithUTF8String:");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "componentsSeparatedByString:", CFSTR("/"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "lastObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v13 = 0;
      }
      if (v16.dli_sname)
        objc_msgSend(v10, "appendFormat:", CFSTR(" @0x%lx %@+%zu %s+%zu"), v6, v13, v6 - (char *)v16.dli_fbase, v16.dli_sname, v6 - (char *)v16.dli_saddr);
      else
        objc_msgSend(v10, "appendFormat:", CFSTR(" @0x%lx %@+%zu"), v6, v13, v6 - (char *)v16.dli_fbase);

    }
    else
    {
      objc_msgSend(v10, "appendFormat:", CFSTR(" @0x%lx"), v6);
    }
  }
  objc_msgSend(v10, "appendFormat:", CFSTR(" [%@]"), v5);
  if (self->_state == 1)
  {
    objc_msgSend(*(id *)&self->_flags, "localizedDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendFormat:", CFSTR(": '%@'"), v14);

  }
  objc_msgSend(v10, "appendString:", CFSTR(">"));

  return v10;
}

- (id)description
{
  id result;

  -[GCFuture label](self, "label");
  objc_claimAutoreleasedReturnValue();
  -[GCFuture _creatorFrame](self, "_creatorFrame");
  __asm { BR              X10 }
  return result;
}

- (BOOL)_checkFinished:(BOOL)a3
{
  return 1;
}

- (BOOL)_setState:(int64_t)a3 result:(id)a4 error:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;

  v9 = a4;
  v10 = a5;
  v11 = v10;
  switch(a3)
  {
    case -2:
      unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCFuture.mm"), 704, CFSTR("Attempted to transition to the pending state.\n%@"), self);
      goto LABEL_14;
    case -1:
      unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCFuture.mm"), 708, CFSTR("Attempted to transition to the running state.\n%@"), self);
      goto LABEL_14;
    case 0:
      atomic_store(1u, (unsigned __int8 *)&self->_state + 3);
      if (!v10)
      {
        if (!v9)
          goto LABEL_15;
        goto LABEL_8;
      }
      unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCFuture.mm"), 713, CFSTR("Attempted to transition to the cancelled state, but provided an error (%@).\n%@"), v11, self);

      if (v9)
      {
LABEL_8:
        unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCFuture.mm"), 714, CFSTR("Attempted to transition to the cancelled state, but provided a result (%@).\n%@"), v9, self);
        goto LABEL_14;
      }
      goto LABEL_15;
    case 1:
      if (v10)
      {
        if (!v9)
          goto LABEL_15;
        goto LABEL_11;
      }
      unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCFuture.mm"), 718, CFSTR("Attempted to transition to the failed state, but did not provide an error.\n%@"), self);

      if (v9)
      {
LABEL_11:
        unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCFuture.mm"), 719, CFSTR("Attempted to transition to the failed state, but provided a result (%@).\n%@"), v9, self);
        goto LABEL_14;
      }
LABEL_15:
      os_unfair_lock_lock_with_options();
      switch(self->_state)
      {
        case 0xFE:
        case 0xFF:
          self->_state = a3;
          if (v9)
            v13 = v9;
          else
            v13 = v11;
          objc_storeStrong((id *)&self->_flags, v13);
          __dmb(0xBu);
          os_unfair_lock_unlock(&self->_lock);
          v14 = 1;
          goto LABEL_27;
        case 1:
          os_unfair_lock_unlock(&self->_lock);
          if (a3 == 2)
          {
            unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCFuture.mm"), 760, CFSTR("Attempted to transition to the succeeded state from the failed state.\n%@"), self);
          }
          else
          {
            if (a3 != 1)
              goto LABEL_26;
            unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCFuture.mm"), 761, CFSTR("Attempted to transition to the failed state twice.\n%@"), self);
          }
          goto LABEL_37;
        case 2:
          os_unfair_lock_unlock(&self->_lock);
          if (a3 == 2)
          {
            unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCFuture.mm"), 768, CFSTR("Attempted to transition to the succeeded state twice.\n%@"), self);
          }
          else
          {
            if (a3 != 1)
              goto LABEL_26;
            unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCFuture.mm"), 769, CFSTR("Attempted to transition to the failed state from the succeeded state.\n%@"), self);
          }
LABEL_37:

LABEL_26:
          v14 = 0;
LABEL_27:

          return v14;
        default:
          os_unfair_lock_unlock(&self->_lock);
          goto LABEL_26;
      }
    case 2:
      if (v10)
      {
        unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCFuture.mm"), 723, CFSTR("Attempted to transition to the succeeded state, but provided an error (%@).\n%@"), v9, self);

        if (v9)
          goto LABEL_15;
      }
      else if (v9)
      {
        goto LABEL_15;
      }
      unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCFuture.mm"), 724, CFSTR("Attempted to transition to the succeeded state, but did not provide a result.\n%@"), self);
LABEL_14:

      goto LABEL_15;
    default:
      unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCFuture.mm"), 728, CFSTR("Attempted to transition to an invalid state (%ld).\n%@"), a3, self);
      goto LABEL_14;
  }
}

- (void)succeedWithResult:(void *)a1
{
  id v3;

  v3 = a2;
  if (a1)
    objc_msgSend(a1, "_setState:result:error:", 2, v3, 0);

}

- (void)failWithError:(void *)a1
{
  id v3;

  v3 = a2;
  if (a1)
    objc_msgSend(a1, "_setState:result:error:", 1, 0, v3);

}

- (void)cancel
{
  -[GCFuture _setState:result:error:](self, "_setState:result:error:", 0, 0, 0);
}

- (void)_observeFinishOnQueue:(id)a3 withOptions:(unsigned int)a4 qosClass:(unsigned int)a5 relativePriority:(int)a6 block:(id)a7
{
  char v10;
  NSObject *v13;
  id v14;
  uint64_t state;
  id v16;
  id v17;
  dispatch_block_flags_t v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  dispatch_block_t v23;
  dispatch_block_t v24;
  void *v25;
  void *v26;
  _QWORD aBlock[4];
  id v28;
  id v29;
  id v30;
  uint64_t v31;

  v10 = a4;
  v13 = a3;
  v14 = a7;
  if (!v14)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCFuture.mm"), 796, CFSTR("Invalid parameter not satisfying: %s"), "block != nil");

  }
  if (!-[GCFuture _checkFinished:](self, "_checkFinished:", 0))
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCFuture.mm"), 797, CFSTR("Subclass must implement %s"), sel_getName(a2));

  }
  state = self->_state;
  if (state == 2)
    v16 = *(id *)&self->_flags;
  else
    v16 = 0;
  if (self->_state == 1)
    v17 = *(id *)&self->_flags;
  else
    v17 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  if ((v10 & 4) != 0)
    v18 = v10 & 2 | 0x24;
  else
    v18 = (unint64_t)(v10 & 2);
  aBlock[1] = 3221225472;
  aBlock[2] = __78__GCFuture__observeFinishOnQueue_withOptions_qosClass_relativePriority_block___block_invoke;
  aBlock[3] = &unk_1EA4D41C0;
  v30 = v14;
  v31 = state;
  v28 = v16;
  v29 = v17;
  v19 = v17;
  v20 = v16;
  v21 = v14;
  v22 = _Block_copy(aBlock);
  if (v13)
  {
    if (a5 && v18)
    {
      v23 = dispatch_block_create_with_qos_class(v18, (dispatch_qos_class_t)a5, a6, v22);
    }
    else
    {
      if (!v18)
      {
LABEL_22:
        dispatch_async(v13, v22);
        goto LABEL_23;
      }
      v23 = dispatch_block_create(v18, v22);
    }
    v24 = v23;

    v22 = v24;
    goto LABEL_22;
  }
  dispatch_block_perform(v18, v22);
LABEL_23:

}

uint64_t __78__GCFuture__observeFinishOnQueue_withOptions_qosClass_relativePriority_block___block_invoke(uint64_t a1)
{
  return __GCFUTURE_IS_CALLING_OUT_TO_AN_OBSERVER__(*(_QWORD *)(a1 + 48));
}

- (void)observeFinishOnQueue:(id)a3 withOptions:(unsigned int)a4 block:(id)a5
{
  -[GCFuture _observeFinishOnQueue:withOptions:qosClass:relativePriority:block:](self, "_observeFinishOnQueue:withOptions:qosClass:relativePriority:block:", a3, *(_QWORD *)&a4, 0, 0, a5);
}

- (void)observeFinishOnQueue:(id)a3 withBlock:(id)a4
{
  -[GCFuture _observeFinishOnQueue:withOptions:qosClass:relativePriority:block:](self, "_observeFinishOnQueue:withOptions:qosClass:relativePriority:block:", a3, 0, 0, 0, a4);
}

- (void)observeFinishWithOptions:(unsigned int)a3 block:(id)a4
{
  -[GCFuture _observeFinishOnQueue:withOptions:qosClass:relativePriority:block:](self, "_observeFinishOnQueue:withOptions:qosClass:relativePriority:block:", 0, *(_QWORD *)&a3, 0, 0, a4);
}

- (void)observeFinish:(id)a3
{
  -[GCFuture _observeFinishOnQueue:withOptions:qosClass:relativePriority:block:](self, "_observeFinishOnQueue:withOptions:qosClass:relativePriority:block:", 0, 0, 0, 0, a3);
}

- (void)observeSuccess:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __27__GCFuture_observeSuccess___block_invoke;
  v6[3] = &unk_1EA4D41E8;
  v7 = v4;
  v5 = v4;
  -[GCFuture observeFinish:](self, "observeFinish:", v6);

}

void __27__GCFuture_observeSuccess___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  if (a2 == 2)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)observeSuccessOnQueue:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__GCFuture_observeSuccessOnQueue_withBlock___block_invoke;
  v8[3] = &unk_1EA4D41E8;
  v9 = v6;
  v7 = v6;
  -[GCFuture observeFinishOnQueue:withBlock:](self, "observeFinishOnQueue:withBlock:", a3, v8);

}

void __44__GCFuture_observeSuccessOnQueue_withBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  if (a2 == 2)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)observeFailure:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __27__GCFuture_observeFailure___block_invoke;
  v6[3] = &unk_1EA4D41E8;
  v7 = v4;
  v5 = v4;
  -[GCFuture observeFinish:](self, "observeFinish:", v6);

}

void __27__GCFuture_observeFailure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;

  v6 = a4;
  if (a2 == 1)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)observeCancellation:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __32__GCFuture_observeCancellation___block_invoke;
  v6[3] = &unk_1EA4D41E8;
  v7 = v4;
  v5 = v4;
  -[GCFuture observeFinish:](self, "observeFinish:", v6);

}

uint64_t __32__GCFuture_observeCancellation___block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (BOOL)isFinished
{
  return -[GCFuture _checkFinished:](self, "_checkFinished:", 0);
}

- (id)resultIfFinished
{
  id v3;

  if (-[GCFuture _checkFinished:](self, "_checkFinished:", 0) && self->_state == 2)
    v3 = *(id *)&self->_flags;
  else
    v3 = 0;
  return v3;
}

- (int64_t)waitUntilFinished
{
  -[GCFuture _checkFinished:](self, "_checkFinished:", 1);
  return self->_state;
}

- (int64_t)waitForResult:(id *)a3 error:(id *)a4
{
  int64_t state;
  id v8;

  -[GCFuture _checkFinished:](self, "_checkFinished:", 1);
  state = self->_state;
  if (self->_state)
  {
    if (state == 1)
    {
      if (a4)
        *a4 = objc_retainAutorelease(*(id *)&self->_flags);
    }
    else if (a3)
    {
      if ((_DWORD)state == 2)
        v8 = objc_retainAutorelease(*(id *)&self->_flags);
      else
        v8 = 0;
      *a3 = v8;
    }
  }
  return state;
}

- (id)error
{
  id v3;

  -[GCFuture _checkFinished:](self, "_checkFinished:", 1);
  if (self->_state == 1)
    v3 = *(id *)&self->_flags;
  else
    v3 = 0;
  return v3;
}

- (id)result
{
  id v3;

  -[GCFuture _checkFinished:](self, "_checkFinished:", 1);
  if (self->_state == 2)
    v3 = *(id *)&self->_flags;
  else
    v3 = 0;
  return v3;
}

- (id)_thenRequiringState:(int64_t)a3 onQueue:(id)a4 withOptions:(unsigned int)a5 qosClass:(unsigned int)a6 relativePriority:(int)a7 label:(id)a8 block:(id)a9
{
  id v16;
  id v17;
  id v18;
  _GCAsyncFuture *v19;
  id v20;
  id v21;
  id v22;
  void *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  int64_t v28;
  SEL v29;
  unsigned int v30;
  unsigned int v31;
  int v32;

  v16 = a4;
  v17 = a8;
  v18 = a9;
  if (!v18)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCFuture.mm"), 940, CFSTR("Invalid parameter not satisfying: %s"), "block != nil");

  }
  v19 = [_GCAsyncFuture alloc];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __90__GCFuture__thenRequiringState_onQueue_withOptions_qosClass_relativePriority_label_block___block_invoke;
  v25[3] = &unk_1EA4D4260;
  v25[4] = self;
  v20 = v16;
  v30 = a5;
  v31 = a6;
  v32 = a7;
  v26 = v20;
  v28 = a3;
  v21 = v18;
  v27 = v21;
  v29 = a2;
  v22 = -[GCFuture initOnQueue:withOptions:block:](v19, "initOnQueue:withOptions:block:", 0, 0, v25);

  return v22;
}

void __90__GCFuture__thenRequiringState_onQueue_withOptions_qosClass_relativePriority_label_block___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(unsigned int *)(a1 + 72);
  v7 = *(unsigned int *)(a1 + 76);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[2] = __90__GCFuture__thenRequiringState_onQueue_withOptions_qosClass_relativePriority_label_block___block_invoke_2;
  v13[3] = &unk_1EA4D4238;
  v8 = *(void **)(a1 + 48);
  v16 = *(_QWORD *)(a1 + 56);
  v9 = *(unsigned int *)(a1 + 80);
  v13[1] = 3221225472;
  v13[4] = v4;
  v14 = v3;
  v10 = v8;
  v11 = *(_QWORD *)(a1 + 64);
  v15 = v10;
  v17 = v11;
  v12 = v3;
  objc_msgSend(v4, "observeFinishOnQueue:withOptions:qosClass:relativePriority:block:", v5, v6, v7, v9, v13);

}

void __90__GCFuture__thenRequiringState_onQueue_withOptions_qosClass_relativePriority_label_block___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v7 = a3;
  v8 = a4;
  v9 = *(id *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 56);
  if (v10 == 2)
  {
    if (a2 == 2)
      goto LABEL_9;
    goto LABEL_12;
  }
  if (v10 == 1)
  {
    if (a2 == 1)
      goto LABEL_9;
LABEL_12:
    objc_msgSend(*(id *)(a1 + 40), "future");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_setState:result:error:", a2, v7, v8);

    goto LABEL_13;
  }
  if (!v10 && a2)
    goto LABEL_12;
LABEL_9:
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("GCFuture.mm"), 972, CFSTR("Assertion failed: next != nullptr"));

  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __90__GCFuture__thenRequiringState_onQueue_withOptions_qosClass_relativePriority_label_block___block_invoke_3;
  v14[3] = &unk_1EA4D4210;
  v15 = *(id *)(a1 + 40);
  objc_msgSend(v11, "observeFinish:", v14);

LABEL_13:
}

void __90__GCFuture__thenRequiringState_onQueue_withOptions_qosClass_relativePriority_label_block___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "future");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setState:result:error:", a2, v9, v7);

}

- (id)_thenSynchronouslyRequiringState:(int64_t)a3 onQueue:(id)a4 withOptions:(unsigned int)a5 qosClass:(unsigned int)a6 relativePriority:(int)a7 label:(id)a8 block:(id)a9
{
  id v16;
  id v17;
  id v18;
  _GCAsyncFuture *v19;
  id v20;
  id v21;
  id v22;
  void *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  int64_t v28;
  unsigned int v29;
  unsigned int v30;
  int v31;

  v16 = a4;
  v17 = a8;
  v18 = a9;
  if (!v18)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCFuture.mm"), 988, CFSTR("Invalid parameter not satisfying: %s"), "block != nil");

  }
  v19 = [_GCAsyncFuture alloc];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __103__GCFuture__thenSynchronouslyRequiringState_onQueue_withOptions_qosClass_relativePriority_label_block___block_invoke;
  v25[3] = &unk_1EA4D42B0;
  v25[4] = self;
  v20 = v16;
  v29 = a5;
  v30 = a6;
  v31 = a7;
  v26 = v20;
  v28 = a3;
  v21 = v18;
  v27 = v21;
  v22 = -[GCFuture initOnQueue:withOptions:block:](v19, "initOnQueue:withOptions:block:", 0, 0, v25);

  return v22;
}

void __103__GCFuture__thenSynchronouslyRequiringState_onQueue_withOptions_qosClass_relativePriority_label_block___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t v14;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(unsigned int *)(a1 + 64);
  v7 = *(unsigned int *)(a1 + 68);
  v8 = *(unsigned int *)(a1 + 72);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __103__GCFuture__thenSynchronouslyRequiringState_onQueue_withOptions_qosClass_relativePriority_label_block___block_invoke_2;
  v11[3] = &unk_1EA4D4288;
  v9 = *(void **)(a1 + 48);
  v14 = *(_QWORD *)(a1 + 56);
  v11[4] = v4;
  v12 = v3;
  v13 = v9;
  v10 = v3;
  objc_msgSend(v4, "observeFinishOnQueue:withOptions:qosClass:relativePriority:block:", v5, v6, v7, v8, v11);

}

void __103__GCFuture__thenSynchronouslyRequiringState_onQueue_withOptions_qosClass_relativePriority_label_block___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  unint64_t v10;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  unsigned __int8 *v17;
  void *v18;
  void *v19;
  id v20;

  v7 = a3;
  v8 = a4;
  v9 = *(id *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 56);
  if (v10 > 2 || v10 == a2)
  {
    if (!a2)
      objc_msgSend(*(id *)(a1 + 40), "cancel");
    v12 = v8;
    v13 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "future");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v12;
    (*(void (**)(uint64_t, uint64_t, id, uint64_t, id *))(v13 + 16))(v13, a2, v7, (uint64_t)v14 + 15, &v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v20;

    objc_msgSend(*(id *)(a1 + 40), "future");
    v17 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v12) = atomic_load(v17 + 15);

    if ((v12 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "future");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_setState:result:error:", 0, 0, 0);
    }
    else if (v15)
    {
      objc_msgSend(*(id *)(a1 + 40), "future");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_setState:result:error:", 2, v15, 0);
    }
    else
    {
      if (!v16)
        __103__GCFuture__thenSynchronouslyRequiringState_onQueue_withOptions_qosClass_relativePriority_label_block___block_invoke_2_cold_1();
      objc_msgSend(*(id *)(a1 + 40), "future");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_setState:result:error:", 1, 0, v16);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "future");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_setState:result:error:", a2, v7, v8);

  }
}

- (id)thenOnQueue:(id)a3 withOptions:(unsigned int)a4 qosClass:(unsigned int)a5 relativePriority:(int)a6 label:(id)a7 block:(id)a8
{
  -[GCFuture _thenRequiringState:onQueue:withOptions:qosClass:relativePriority:label:block:](self, "_thenRequiringState:onQueue:withOptions:qosClass:relativePriority:label:block:", -128, a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, a7, a8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)thenWith:(id)a3
{
  id v5;
  _GCAsyncFuture *v6;
  id v7;
  id v8;
  void *v10;
  _QWORD v11[5];
  id v12;
  SEL v13;

  v5 = a3;
  if (!v5)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCFuture.mm"), 1039, CFSTR("Invalid parameter not satisfying: %s"), "block != nil");

  }
  v6 = [_GCAsyncFuture alloc];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __21__GCFuture_thenWith___block_invoke;
  v11[3] = &unk_1EA4D4300;
  v11[4] = self;
  v7 = v5;
  v12 = v7;
  v13 = a2;
  v8 = -[_GCAsyncFuture _initOnQueue:withOptions:block:](v6, 0, 0, v11);

  return v8;
}

void __21__GCFuture_thenWith___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __21__GCFuture_thenWith___block_invoke_2;
  v8[3] = &unk_1EA4D42D8;
  v4 = (void *)a1[5];
  v9 = (id)a1[4];
  v5 = v4;
  v6 = a1[6];
  v11 = v5;
  v12 = v6;
  v10 = v3;
  v7 = v3;
  objc_msgSend(v9, "observeFinish:", v8);

}

void __21__GCFuture_thenWith___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = *(id *)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("GCFuture.mm"), 1048, CFSTR("Assertion failed: next != nullptr"));

  }
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __21__GCFuture_thenWith___block_invoke_3;
  v5[3] = &unk_1EA4D4210;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "observeFinish:", v5);

}

void __21__GCFuture_thenWith___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "future");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setState:result:error:", a2, v9, v7);

}

- (id)thenWithResult:(id)a3
{
  id v5;
  _GCAsyncFuture *v6;
  id v7;
  id v8;
  void *v10;
  _QWORD v11[5];
  id v12;
  SEL v13;

  v5 = a3;
  if (!v5)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCFuture.mm"), 1057, CFSTR("Invalid parameter not satisfying: %s"), "block != nil");

  }
  v6 = [_GCAsyncFuture alloc];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __27__GCFuture_thenWithResult___block_invoke;
  v11[3] = &unk_1EA4D4300;
  v11[4] = self;
  v7 = v5;
  v12 = v7;
  v13 = a2;
  v8 = -[_GCAsyncFuture _initOnQueue:withOptions:block:](v6, 0, 0, v11);

  return v8;
}

void __27__GCFuture_thenWithResult___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __27__GCFuture_thenWithResult___block_invoke_2;
  v8[3] = &unk_1EA4D4288;
  v4 = (void *)a1[5];
  v9 = (id)a1[4];
  v10 = v3;
  v5 = v4;
  v6 = a1[6];
  v11 = v5;
  v12 = v6;
  v7 = v3;
  objc_msgSend(v9, "observeFinish:", v8);

}

void __27__GCFuture_thenWithResult___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v7 = a3;
  v8 = a4;
  v9 = *(id *)(a1 + 32);
  if (a2 == 2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("GCFuture.mm"), 1074, CFSTR("Assertion failed: next != nullptr"));

    }
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __27__GCFuture_thenWithResult___block_invoke_3;
    v12[3] = &unk_1EA4D4210;
    v13 = *(id *)(a1 + 40);
    objc_msgSend(v10, "observeFinish:", v12);

  }
  else if (a2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 40), "failWithError:", v8);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "cancel");
  }

}

void __27__GCFuture_thenWithResult___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "future");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setState:result:error:", a2, v9, v7);

}

- (id)thenOnQueue:(id)a3 with:(id)a4
{
  id v7;
  id v8;
  _GCAsyncFuture *v9;
  id v10;
  id v11;
  id v12;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  SEL v18;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCFuture.mm"), 1088, CFSTR("Invalid parameter not satisfying: %s"), "block != nil");

  }
  v9 = [_GCAsyncFuture alloc];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __29__GCFuture_thenOnQueue_with___block_invoke;
  v15[3] = &unk_1EA4D4328;
  v15[4] = self;
  v10 = v7;
  v16 = v10;
  v11 = v8;
  v17 = v11;
  v18 = a2;
  v12 = -[_GCAsyncFuture _initOnQueue:withOptions:block:](v9, 0, 0, v15);

  return v12;
}

void __29__GCFuture_thenOnQueue_with___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  uint64_t v12;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __29__GCFuture_thenOnQueue_with___block_invoke_2;
  v9[3] = &unk_1EA4D42D8;
  v9[4] = v4;
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v11 = v6;
  v12 = v7;
  v10 = v3;
  v8 = v3;
  objc_msgSend(v4, "observeFinishOnQueue:withBlock:", v5, v9);

}

void __29__GCFuture_thenOnQueue_with___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = *(id *)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("GCFuture.mm"), 1097, CFSTR("Assertion failed: next != nullptr"));

  }
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__GCFuture_thenOnQueue_with___block_invoke_3;
  v5[3] = &unk_1EA4D4210;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "observeFinish:", v5);

}

void __29__GCFuture_thenOnQueue_with___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "future");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setState:result:error:", a2, v9, v7);

}

- (id)thenOnQueue:(id)a3 withResult:(id)a4
{
  id v7;
  id v8;
  _GCAsyncFuture *v9;
  id v10;
  id v11;
  id v12;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  SEL v18;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCFuture.mm"), 1106, CFSTR("Invalid parameter not satisfying: %s"), "block != nil");

  }
  v9 = [_GCAsyncFuture alloc];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __35__GCFuture_thenOnQueue_withResult___block_invoke;
  v15[3] = &unk_1EA4D4328;
  v15[4] = self;
  v10 = v7;
  v16 = v10;
  v11 = v8;
  v17 = v11;
  v18 = a2;
  v12 = -[_GCAsyncFuture _initOnQueue:withOptions:block:](v9, 0, 0, v15);

  return v12;
}

void __35__GCFuture_thenOnQueue_withResult___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  uint64_t v12;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __35__GCFuture_thenOnQueue_withResult___block_invoke_2;
  v9[3] = &unk_1EA4D4288;
  v9[4] = v4;
  v10 = v3;
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v11 = v6;
  v12 = v7;
  v8 = v3;
  objc_msgSend(v4, "observeFinishOnQueue:withBlock:", v5, v9);

}

void __35__GCFuture_thenOnQueue_withResult___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v7 = a3;
  v8 = a4;
  v9 = *(id *)(a1 + 32);
  if (a2 == 2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("GCFuture.mm"), 1123, CFSTR("Assertion failed: next != nullptr"));

    }
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __35__GCFuture_thenOnQueue_withResult___block_invoke_3;
    v12[3] = &unk_1EA4D4210;
    v13 = *(id *)(a1 + 40);
    objc_msgSend(v10, "observeFinish:", v12);

  }
  else if (a2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 40), "failWithError:", v8);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "cancel");
  }

}

void __35__GCFuture_thenOnQueue_withResult___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "future");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setState:result:error:", a2, v9, v7);

}

- (id)thenSynchronouslyOnQueue:(id)a3 withOptions:(unsigned int)a4 qosClass:(unsigned int)a5 relativePriority:(int)a6 label:(id)a7 block:(id)a8
{
  -[GCFuture _thenSynchronouslyRequiringState:onQueue:withOptions:qosClass:relativePriority:label:block:](self, "_thenSynchronouslyRequiringState:onQueue:withOptions:qosClass:relativePriority:label:block:", -128, a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, a7, a8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)thenSynchronouslyOnQueue:(id)a3 with:(id)a4
{
  -[GCFuture _thenSynchronouslyRequiringState:onQueue:withOptions:qosClass:relativePriority:label:block:](self, "_thenSynchronouslyRequiringState:onQueue:withOptions:qosClass:relativePriority:label:block:", -128, a3, 0, 0, 0, 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)thenSynchronouslyWith:(id)a3
{
  -[GCFuture _thenSynchronouslyRequiringState:onQueue:withOptions:qosClass:relativePriority:label:block:](self, "_thenSynchronouslyRequiringState:onQueue:withOptions:qosClass:relativePriority:label:block:", -128, 0, 0, 0, 0, 0, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)thenSynchronouslyWithResult:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__GCFuture_thenSynchronouslyWithResult___block_invoke;
  v8[3] = &unk_1EA4D4350;
  v9 = v4;
  v5 = v4;
  -[GCFuture _thenSynchronouslyRequiringState:onQueue:withOptions:qosClass:relativePriority:label:block:](self, "_thenSynchronouslyRequiringState:onQueue:withOptions:qosClass:relativePriority:label:block:", -128, 0, 0, 0, 0, 0, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __40__GCFuture_thenSynchronouslyWithResult___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLabel:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultOrError, 0);
  objc_storeStrong((id *)&self->_flags, 0);
}

void __103__GCFuture__thenSynchronouslyRequiringState_onQueue_withOptions_qosClass_relativePriority_label_block___block_invoke_2_cold_1()
{
  qword_1F039F7F8 = (uint64_t)"BUG IN CLIENT OF GCOperation: Operation was not cancelled, but block did not return a result or an error.";
  __break(1u);
}

@end
