@implementation HFMessageBatcher

- (HFMessageBatcher)initWithIdentifier:(id)a3 batchingInterval:(double)a4 block:(id)a5
{
  id v9;
  id v10;
  HFMessageBatcher *v11;
  HFMessageBatcher *v12;
  uint64_t v13;
  NSMutableSet *mutableObjects;
  void *v15;
  id block;
  NSObject *v17;
  objc_super v19;

  v9 = a3;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HFMessageBatcher;
  v11 = -[HFMessageBatcher init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_identifier, a3);
    v12->_batchingInterval = a4;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v13 = objc_claimAutoreleasedReturnValue();
    mutableObjects = v12->_mutableObjects;
    v12->_mutableObjects = (NSMutableSet *)v13;

    v15 = _Block_copy(v10);
    block = v12->_block;
    v12->_block = v15;

    HFLogForCategory(0x31uLL);
    v17 = objc_claimAutoreleasedReturnValue();
    v12->signpostID = os_signpost_id_generate(v17);

  }
  return v12;
}

- (NSSet)objects
{
  void *v2;
  void *v3;

  -[HFMessageBatcher mutableObjects](self, "mutableObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSSet *)v3;
}

- (void)reset
{
  void *v3;
  id v4;

  -[HFMessageBatcher cancelable](self, "cancelable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[HFMessageBatcher setCancelable:](self, "setCancelable:", 0);
  -[HFMessageBatcher mutableObjects](self, "mutableObjects");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

}

- (void)batchObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  v4 = a3;
  -[HFMessageBatcher mutableObjects](self, "mutableObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  -[HFMessageBatcher cancelable](self, "cancelable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HFMessageBatcher cancelable](self, "cancelable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cancel");

  }
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMessageBatcher batchingInterval](self, "batchingInterval");
  v10 = v9;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __32__HFMessageBatcher_batchObject___block_invoke;
  v15 = &unk_1EA728AE8;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v8, "afterDelay:performBlock:", &v12, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMessageBatcher setCancelable:](self, "setCancelable:", v11, v12, v13, v14, v15);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __32__HFMessageBatcher_batchObject___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void (**v14)(_QWORD, _QWORD);
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "objects");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setCancelable:", 0);
    objc_msgSend(v2, "mutableObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeAllObjects");

    if (objc_msgSend(v3, "count"))
    {
      HFLogForCategory(0x31uLL);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = objc_opt_class();
        objc_msgSend(v2, "identifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543874;
        v16 = v6;
        v17 = 2114;
        v18 = v7;
        v19 = 2048;
        v20 = objc_msgSend(v3, "count");
        _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@-%{public}@: executing batch with %lu", (uint8_t *)&v15, 0x20u);

      }
      HFLogForCategory(0x31uLL);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = v2[1];
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
      {
        v11 = objc_opt_class();
        objc_msgSend(v2, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v3, "count");
        v15 = 138543874;
        v16 = v11;
        v17 = 2114;
        v18 = v12;
        v19 = 2048;
        v20 = v13;
        _os_signpost_emit_with_name_impl(&dword_1DD34E000, v9, OS_SIGNPOST_EVENT, v10, "HFMessageBatcher", "%{public}@-%{public}@: executing batch with %lu", (uint8_t *)&v15, 0x20u);

      }
      objc_msgSend(v2, "block");
      v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v14)[2](v14, v3);

    }
  }

}

- (NSString)identifier
{
  return self->_identifier;
}

- (double)batchingInterval
{
  return self->_batchingInterval;
}

- (NACancelable)cancelable
{
  return self->_cancelable;
}

- (void)setCancelable:(id)a3
{
  objc_storeStrong((id *)&self->_cancelable, a3);
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSMutableSet)mutableObjects
{
  return self->_mutableObjects;
}

- (void)setMutableObjects:(id)a3
{
  objc_storeStrong((id *)&self->_mutableObjects, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableObjects, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_cancelable, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
