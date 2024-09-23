@implementation AFNotifyStatePublisher

- (void)dealloc
{
  char *name;
  objc_super v4;

  -[AFNotifyStatePublisher _unregister](self, "_unregister");
  name = self->_name;
  if (name)
  {
    free(name);
    self->_name = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AFNotifyStatePublisher;
  -[AFNotifyStatePublisher dealloc](&v4, sel_dealloc);
}

- (AFNotifyStatePublisher)initWithName:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  AFNotifyStatePublisher *v8;
  AFNotifyStatePublisher *v9;
  size_t v10;
  char *v11;
  NSObject *v12;
  NSObject *queue;
  _QWORD block[4];
  AFNotifyStatePublisher *v16;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)AFNotifyStatePublisher;
  v8 = -[AFNotifyStatePublisher init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_queue, a4);
    v10 = objc_msgSend(v6, "maximumLengthOfBytesUsingEncoding:", 4) + 1;
    v11 = (char *)malloc_type_malloc(v10, 0xD0E670E2uLL);
    v9->_name = v11;
    if ((objc_msgSend(v6, "getCString:maxLength:encoding:", v11, v10, 4) & 1) == 0)
    {
      v12 = AFSiriLogContextUtility;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "-[AFNotifyStatePublisher initWithName:queue:]";
        v20 = 2112;
        v21 = v6;
        _os_log_error_impl(&dword_19AF50000, v12, OS_LOG_TYPE_ERROR, "%s Unable to get C string of name from %@.", buf, 0x16u);
      }
    }
    v9->_registrationToken = -1;
    queue = v9->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__AFNotifyStatePublisher_initWithName_queue___block_invoke;
    block[3] = &unk_1E3A36F30;
    v16 = v9;
    dispatch_async(queue, block);

  }
  return v9;
}

- (void)publishState:(unint64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__AFNotifyStatePublisher_publishState___block_invoke;
  v4[3] = &unk_1E3A353C0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)publishStateSynchronously:(unint64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__AFNotifyStatePublisher_publishStateSynchronously___block_invoke;
  v4[3] = &unk_1E3A353C0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

- (void)publishStateWithBlock:(id)a3
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
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __48__AFNotifyStatePublisher_publishStateWithBlock___block_invoke;
    v7[3] = &unk_1E3A36FA0;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)_notifyWithState:(unint64_t)a3
{
  if (self->_registrationToken != -1)
  {
    if (-[AFNotifyStatePublisher _setState:withToken:](self, "_setState:withToken:", a3))
      notify_post(self->_name);
  }
}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__AFNotifyStatePublisher_invalidate__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)_setState:(unint64_t)a3 withToken:(int)a4
{
  uint32_t v7;
  NSObject *v8;
  char *name;
  int v11;
  const char *v12;
  __int16 v13;
  unint64_t v14;
  __int16 v15;
  char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  uint32_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = notify_set_state(a4, a3);
  if (v7)
  {
    v8 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
    {
      name = self->_name;
      v11 = 136316162;
      v12 = "-[AFNotifyStatePublisher _setState:withToken:]";
      v13 = 2048;
      v14 = a3;
      v15 = 2080;
      v16 = name;
      v17 = 1024;
      v18 = a4;
      v19 = 1024;
      v20 = v7;
      _os_log_error_impl(&dword_19AF50000, v8, OS_LOG_TYPE_ERROR, "%s Failed to set state to %llu of %s with token %d (status = %u).", (uint8_t *)&v11, 0x2Cu);
    }
  }
  return v7 == 0;
}

- (BOOL)_getState:(unint64_t *)a3 withToken:(int)a4
{
  uint32_t state;
  NSObject *v8;
  _BOOL4 v9;
  char *name;
  uint64_t state64;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  uint32_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    *a3 = 0;
    state64 = 0;
    state = notify_get_state(a4, &state64);
    if (!state)
    {
      *a3 = state64;
LABEL_7:
      LOBYTE(v9) = 1;
      return v9;
    }
  }
  else
  {
    state64 = 0;
    state = notify_get_state(a4, &state64);
    if (!state)
      goto LABEL_7;
  }
  v8 = AFSiriLogContextUtility;
  v9 = os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR);
  if (v9)
  {
    name = self->_name;
    *(_DWORD *)buf = 136315906;
    v14 = "-[AFNotifyStatePublisher _getState:withToken:]";
    v15 = 2080;
    v16 = name;
    v17 = 1024;
    v18 = a4;
    v19 = 1024;
    v20 = state;
    _os_log_error_impl(&dword_19AF50000, v8, OS_LOG_TYPE_ERROR, "%s Failed to get state of %s with token %d (status = %u).", buf, 0x22u);
    LOBYTE(v9) = 0;
  }
  return v9;
}

- (void)_register
{
  uint32_t v3;
  uint32_t v4;
  NSObject *v5;
  char *name;
  int v7;
  NSObject *v8;
  char *v9;
  int out_token;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_registrationToken == -1)
  {
    out_token = -1;
    v3 = notify_register_check(self->_name, &out_token);
    if (v3)
    {
      v4 = v3;
      v5 = AFSiriLogContextUtility;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
      {
        name = self->_name;
        *(_DWORD *)buf = 136315650;
        v12 = "-[AFNotifyStatePublisher _register]";
        v13 = 2080;
        v14 = name;
        v15 = 1024;
        v16 = v4;
        _os_log_error_impl(&dword_19AF50000, v5, OS_LOG_TYPE_ERROR, "%s Failed to get registration token of %s (status = %u).", buf, 0x1Cu);
      }
    }
    else
    {
      v7 = out_token;
      self->_registrationToken = out_token;
      v8 = AFSiriLogContextUtility;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
      {
        v9 = self->_name;
        *(_DWORD *)buf = 136315650;
        v12 = "-[AFNotifyStatePublisher _register]";
        v13 = 2080;
        v14 = v9;
        v15 = 1024;
        v16 = v7;
        _os_log_impl(&dword_19AF50000, v8, OS_LOG_TYPE_INFO, "%s Registration token of %s is %d.", buf, 0x1Cu);
      }
    }
  }
}

- (void)_unregister
{
  int registrationToken;
  NSObject *v4;
  char *name;
  int v6;
  const char *v7;
  __int16 v8;
  char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  registrationToken = self->_registrationToken;
  if (registrationToken != -1)
  {
    notify_cancel(registrationToken);
    self->_registrationToken = -1;
    v4 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
    {
      name = self->_name;
      v6 = 136315394;
      v7 = "-[AFNotifyStatePublisher _unregister]";
      v8 = 2080;
      v9 = name;
      _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s Registration token of %s is invalidated.", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __36__AFNotifyStatePublisher_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_unregister");
}

_DWORD *__48__AFNotifyStatePublisher_publishStateWithBlock___block_invoke(uint64_t a1)
{
  _DWORD *result;
  _DWORD *v3;

  result = *(_DWORD **)(a1 + 32);
  if (result[6] != -1)
  {
    v3 = 0;
    result = (_DWORD *)objc_msgSend(result, "_getState:withToken:", &v3);
    if ((_DWORD)result)
    {
      result = (_DWORD *)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      if (result != v3)
      {
        result = (_DWORD *)objc_msgSend(*(id *)(a1 + 32), "_setState:withToken:", result, *(unsigned int *)(*(_QWORD *)(a1 + 32) + 24));
        if ((_DWORD)result)
          return (_DWORD *)notify_post(*(const char **)(*(_QWORD *)(a1 + 32) + 16));
      }
    }
  }
  return result;
}

uint64_t __52__AFNotifyStatePublisher_publishStateSynchronously___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyWithState:", *(_QWORD *)(a1 + 40));
}

uint64_t __39__AFNotifyStatePublisher_publishState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyWithState:", *(_QWORD *)(a1 + 40));
}

uint64_t __45__AFNotifyStatePublisher_initWithName_queue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_register");
}

@end
