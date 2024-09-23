@implementation AFNotifyObserver

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v7.receiver = self;
  v7.super_class = (Class)AFNotifyObserver;
  -[AFNotifyObserver description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ {name = %@}"), v4, self->_name);

  return (NSString *)v5;
}

- (AFNotifyObserver)initWithName:(id)a3 options:(unint64_t)a4 queue:(id)a5 delegate:(id)a6
{
  id v11;
  id v12;
  id v13;
  AFNotifyObserver *v14;
  uint64_t v15;
  NSString *name;
  id v17;
  id WeakRetained;
  char v19;
  NSObject *queue;
  void *v22;
  _QWORD block[4];
  id v24;
  AFNotifyObserver *v25;
  id v26[2];
  id location;
  objc_super v28;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFNotifyObserver.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name != nil"));

  }
  v28.receiver = self;
  v28.super_class = (Class)AFNotifyObserver;
  v14 = -[AFNotifyObserver init](&v28, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v11, "copy");
    name = v14->_name;
    v14->_name = (NSString *)v15;

    v14->_options = a4;
    objc_storeStrong((id *)&v14->_queue, a5);
    v17 = objc_storeWeak((id *)&v14->_delegate, v13);
    *(_BYTE *)&v14->_flags = *(_BYTE *)&v14->_flags & 0xFE | objc_opt_respondsToSelector() & 1;

    WeakRetained = objc_loadWeakRetained((id *)&v14->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v19 = 2;
    else
      v19 = 0;
    *(_BYTE *)&v14->_flags = *(_BYTE *)&v14->_flags & 0xFD | v19;

    objc_initWeak(&location, v14);
    queue = v14->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__AFNotifyObserver_initWithName_options_queue_delegate___block_invoke;
    block[3] = &unk_1E3A339B0;
    v24 = v11;
    v25 = v14;
    objc_copyWeak(v26, &location);
    v26[1] = (id)a4;
    dispatch_async(queue, block);
    objc_destroyWeak(v26);

    objc_destroyWeak(&location);
  }

  return v14;
}

- (void)dealloc
{
  objc_super v3;

  -[AFNotifyObserver _invalidate](self, "_invalidate");
  v3.receiver = self;
  v3.super_class = (Class)AFNotifyObserver;
  -[AFNotifyObserver dealloc](&v3, sel_dealloc);
}

- (unint64_t)state
{
  unint64_t v2;
  NSObject *queue;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  if ((self->_options & 1) != 0)
  {
    queue = self->_queue;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __25__AFNotifyObserver_state__block_invoke;
    v5[3] = &unk_1E3A36F78;
    v5[4] = self;
    v5[5] = &v6;
    dispatch_sync(queue, v5);
    v2 = v7[3];
  }
  _Block_object_dispose(&v6, 8);
  return v2;
}

- (void)getStateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if ((self->_options & 1) != 0)
    {
      queue = self->_queue;
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __43__AFNotifyObserver_getStateWithCompletion___block_invoke;
      v7[3] = &unk_1E3A36FA0;
      v7[4] = self;
      v8 = v4;
      dispatch_async(queue, v7);

    }
    else
    {
      (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
    }
  }

}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__AFNotifyObserver_invalidate__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_handleNotificationWithToken:(int)a3
{
  uint64_t v3;
  id WeakRetained;

  v3 = *(_QWORD *)&a3;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "notifyObserver:didReceiveNotificationWithToken:", self, v3);

  }
  if ((self->_options & 1) != 0)
    -[AFNotifyObserver _updateStateWithToken:](self, "_updateStateWithToken:", v3);
}

- (void)_updateStateWithToken:(int)a3
{
  int registrationToken;
  unint64_t state;
  uint64_t v6;
  id WeakRetained;
  uint64_t state64;

  state64 = 0;
  if (a3 != -1 && !notify_get_state(a3, &state64)
    || (registrationToken = self->_registrationToken, registrationToken != -1)
    && !notify_get_state(registrationToken, &state64))
  {
    state = self->_state;
    v6 = state64;
    if (state != state64)
    {
      self->_state = state64;
      if ((*(_BYTE *)&self->_flags & 2) != 0)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "notifyObserver:didChangeStateFrom:to:", self, state, v6);

      }
    }
  }
}

- (void)_invalidate
{
  int registrationToken;

  registrationToken = self->_registrationToken;
  if (registrationToken != -1)
  {
    notify_cancel(registrationToken);
    self->_registrationToken = -1;
  }
  objc_storeWeak((id *)&self->_delegate, 0);
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __30__AFNotifyObserver_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

uint64_t __43__AFNotifyObserver_getStateWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
}

uint64_t __25__AFNotifyObserver_state__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 40);
  return result;
}

void __56__AFNotifyObserver_initWithName_options_queue_delegate___block_invoke(uint64_t a1)
{
  const char *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  void *v7;
  id v8;
  int out_token;

  out_token = -1;
  v2 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String");
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 8);
  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __56__AFNotifyObserver_initWithName_options_queue_delegate___block_invoke_2;
  v7 = &unk_1E3A344A0;
  objc_copyWeak(&v8, (id *)(a1 + 48));
  if (!notify_register_dispatch(v2, &out_token, v3, &v4))
    *(_DWORD *)(*(_QWORD *)(a1 + 40) + 32) = out_token;
  if ((*(_BYTE *)(a1 + 56) & 1) != 0)
    objc_msgSend(*(id *)(a1 + 40), "_updateStateWithToken:", out_token, v4, v5, v6, v7);
  objc_destroyWeak(&v8);
}

void __56__AFNotifyObserver_initWithName_options_queue_delegate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleNotificationWithToken:", a2);

}

@end
