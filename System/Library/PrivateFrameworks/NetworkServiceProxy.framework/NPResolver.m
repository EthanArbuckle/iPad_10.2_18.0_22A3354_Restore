@implementation NPResolver

- (void)resolveWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  dispatch_source_t v7;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *v10;
  _QWORD handler[5];

  v4 = a3;
  if (-[NWResolver status](self, "status") == 2)
  {
    NPGetInternalQueue();
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v5, v4);
  }
  else
  {
    -[NPResolver setResolveCompletionHandler:](self, "setResolveCompletionHandler:", v4);
    -[NPResolver addObserver:forKeyPath:options:context:](self, "addObserver:forKeyPath:options:context:", self, CFSTR("status"), 4, 0);
    NPGetInternalQueue();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v6);
    -[NPResolver setResolveTimer:](self, "setResolveTimer:", v7);

    -[NPResolver resolveTimer](self, "resolveTimer");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_time(0, 60000000000);
    dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x2710uLL);

    -[NPResolver resolveTimer](self, "resolveTimer");
    v10 = objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __43__NPResolver_resolveWithCompletionHandler___block_invoke;
    handler[3] = &unk_1E4137410;
    handler[4] = self;
    dispatch_source_set_event_handler(v10, handler);

    -[NPResolver resolveTimer](self, "resolveTimer");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_resume(v5);
  }

}

uint64_t __43__NPResolver_resolveWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void (**v5)(void);

  objc_msgSend(*(id *)(a1 + 32), "resolveTimer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "resolveTimer");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v3);

    objc_msgSend(*(id *)(a1 + 32), "setResolveTimer:", 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 32), CFSTR("status"), 0);
  objc_msgSend(*(id *)(a1 + 32), "resolveCompletionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "resolveCompletionHandler");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
  return objc_msgSend(*(id *)(a1 + 32), "setResolveCompletionHandler:", 0);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  NPResolver *v11;
  id v12;
  int v13;
  NSObject *v14;
  objc_super v15;
  _QWORD block[5];

  v10 = a3;
  v11 = (NPResolver *)a4;
  v12 = a5;
  v13 = objc_msgSend(v10, "isEqualToString:", CFSTR("status"));
  if (v11 == self && v13)
  {
    NPGetInternalQueue();
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__NPResolver_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E4137410;
    block[4] = v11;
    dispatch_async(v14, block);

  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)NPResolver;
    -[NPResolver observeValueForKeyPath:ofObject:change:context:](&v15, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

void __61__NPResolver_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void (**v6)(void);

  if (objc_msgSend(*(id *)(a1 + 32), "status") == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "resolveCompletionHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      objc_msgSend(*(id *)(a1 + 32), "resolveTimer");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
      {
        objc_msgSend(*(id *)(a1 + 32), "resolveTimer");
        v4 = objc_claimAutoreleasedReturnValue();
        dispatch_source_cancel(v4);

        objc_msgSend(*(id *)(a1 + 32), "setResolveTimer:", 0);
      }
      objc_msgSend(*(id *)(a1 + 32), "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 32), CFSTR("status"), 0);
      objc_msgSend(*(id *)(a1 + 32), "resolveCompletionHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_msgSend(*(id *)(a1 + 32), "resolveCompletionHandler");
        v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v6[2]();

      }
      objc_msgSend(*(id *)(a1 + 32), "setResolveCompletionHandler:", 0);
    }
  }
}

- (id)resolveCompletionHandler
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setResolveCompletionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (OS_dispatch_source)resolveTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 64, 1);
}

- (void)setResolveTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolveTimer, 0);
  objc_storeStrong(&self->_resolveCompletionHandler, 0);
}

@end
