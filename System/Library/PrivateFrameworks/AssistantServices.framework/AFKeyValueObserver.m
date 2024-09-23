@implementation AFKeyValueObserver

- (void)dealloc
{
  objc_super v3;

  -[AFKeyValueObserver invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)AFKeyValueObserver;
  -[AFKeyValueObserver dealloc](&v3, sel_dealloc);
}

- (AFKeyValueObserver)initWithObject:(id)a3 keyPath:(id)a4 handler:(id)a5 deliveryOptions:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  AFKeyValueObserver *v15;
  uint64_t v16;
  id handler;
  AFOneArgumentSafetyBlock *v18;
  AFKeyValueObserver *v19;
  id v20;
  uint64_t v21;
  AFOneArgumentSafetyBlock *invalidation;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  AFKeyValueObserver *v28;
  id v29;
  id v30[2];
  id location;
  objc_super v32;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v32.receiver = self;
  v32.super_class = (Class)AFKeyValueObserver;
  v15 = -[AFKeyValueObserver init](&v32, sel_init);
  if (v15)
  {
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, v15, CFSTR("AFKeyValueObserving.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("object != nil"));

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (v13)
      {
LABEL_6:
        atomic_store(0, (unsigned __int8 *)&v15->_isInvalid);
        v16 = objc_msgSend(v13, "copy");
        handler = v15->_handler;
        v15->_handler = (id)v16;

        objc_storeStrong((id *)&v15->_deliveryOptions, a6);
        objc_initWeak(&location, v11);
        v18 = [AFOneArgumentSafetyBlock alloc];
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __69__AFKeyValueObserver_initWithObject_keyPath_handler_deliveryOptions___block_invoke;
        v27[3] = &unk_1E3A34080;
        v30[1] = (id)a2;
        v19 = v15;
        v28 = v19;
        objc_copyWeak(v30, &location);
        v20 = v12;
        v29 = v20;
        v21 = -[AFOneArgumentSafetyBlock initWithBlock:defaultValue:](v18, "initWithBlock:defaultValue:", v27, 0);
        invalidation = v19->_invalidation;
        v19->_invalidation = (AFOneArgumentSafetyBlock *)v21;

        objc_msgSend(v11, "addObserver:forKeyPath:options:context:", v19, v20, 7, AFKeyValueObservingContext);
        objc_destroyWeak(v30);

        objc_destroyWeak(&location);
        goto LABEL_7;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, v15, CFSTR("AFKeyValueObserving.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[keyPath isKindOfClass:[NSString class]]"));

      if (v13)
        goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, v15, CFSTR("AFKeyValueObserving.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler != nil"));

    goto LABEL_6;
  }
LABEL_7:

  return v15;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  NSObject *v17;
  dispatch_qos_class_t v18;
  id *v19;
  dispatch_block_t v20;
  void *v21;
  id *v22;
  id *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  _QWORD block[4];
  id v29;
  id v30;
  id v31;
  id location;
  objc_super v33;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if ((void *)AFKeyValueObservingContext == a6)
  {
    v14 = atomic_load((unsigned __int8 *)&self->_isInvalid);
    if ((v14 & 1) == 0)
    {
      objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0CB2CC8]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKey:", *MEMORY[0x1E0CB2CB8]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFKeyValueObservingDeliveryOptions queue](self->_deliveryOptions, "queue");
      v17 = objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        objc_initWeak(&location, self);
        v18 = -[AFKeyValueObservingDeliveryOptions qosClass](self->_deliveryOptions, "qosClass");
        if (v18)
        {
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __69__AFKeyValueObserver_observeValueForKeyPath_ofObject_change_context___block_invoke;
          block[3] = &unk_1E3A340A8;
          v19 = &v31;
          objc_copyWeak(&v31, &location);
          v23 = &v29;
          v29 = v15;
          v22 = &v30;
          v30 = v16;
          v20 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v18, 0, block);
          v21 = (void *)MEMORY[0x1A1AC0C3C]();

        }
        else
        {
          v24[0] = MEMORY[0x1E0C809B0];
          v24[1] = 3221225472;
          v24[2] = __69__AFKeyValueObserver_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
          v24[3] = &unk_1E3A340A8;
          v19 = &v27;
          objc_copyWeak(&v27, &location);
          v23 = &v25;
          v25 = v15;
          v22 = &v26;
          v26 = v16;
          v21 = (void *)MEMORY[0x1A1AC0C3C](v24);
        }
        if (-[AFKeyValueObservingDeliveryOptions asynchronous](self->_deliveryOptions, "asynchronous"))
          dispatch_async(v17, v21);
        else
          dispatch_sync(v17, v21);

        objc_destroyWeak(v19);
        objc_destroyWeak(&location);
      }
      else
      {
        -[AFKeyValueObserver _handleObservedChangeWithOldValue:andNewValue:](self, "_handleObservedChangeWithOldValue:andNewValue:", v15, v16);
      }

    }
  }
  else
  {
    v33.receiver = self;
    v33.super_class = (Class)AFKeyValueObserver;
    -[AFKeyValueObserver observeValueForKeyPath:ofObject:change:context:](&v33, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (void)_handleObservedChangeWithOldValue:(id)a3 andNewValue:(id)a4
{
  unsigned __int8 v4;

  v4 = atomic_load((unsigned __int8 *)&self->_isInvalid);
  if ((v4 & 1) == 0)
    (*((void (**)(void))self->_handler + 2))();
}

- (void)invalidate
{
  -[AFOneArgumentSafetyBlock invokeWithValue:](self->_invalidation, "invokeWithValue:", self);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deliveryOptions, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_invalidation, 0);
}

void __69__AFKeyValueObserver_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_handleObservedChangeWithOldValue:andNewValue:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __69__AFKeyValueObserver_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_handleObservedChangeWithOldValue:andNewValue:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __69__AFKeyValueObserver_initWithObject_keyPath_handler_deliveryOptions___block_invoke(uint64_t a1, void *a2)
{
  unsigned __int8 *v3;
  unsigned __int8 v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 *v9;

  v3 = a2;
  v9 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("AFKeyValueObserving.m"), 71, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer != nil"));

    v3 = 0;
  }
  atomic_store(1u, v3 + 8);
  v4 = atomic_load(v3 + 8);
  if ((v4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("AFKeyValueObserving.m"), 73, CFSTR("AFKeyValueObserver %p is expected to be invalid."), v9);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v6 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "removeObserver:forKeyPath:context:", v9, *(_QWORD *)(a1 + 40), AFKeyValueObservingContext);

}

@end
