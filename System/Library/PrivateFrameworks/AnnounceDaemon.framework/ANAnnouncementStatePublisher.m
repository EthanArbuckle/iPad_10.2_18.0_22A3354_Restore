@implementation ANAnnouncementStatePublisher

- (void)dealloc
{
  char *name;
  objc_super v4;

  -[ANAnnouncementStatePublisher _unregister](self, "_unregister");
  name = self->_name;
  if (name)
  {
    free(name);
    self->_name = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)ANAnnouncementStatePublisher;
  -[ANAnnouncementStatePublisher dealloc](&v4, sel_dealloc);
}

- (ANAnnouncementStatePublisher)init
{
  ANAnnouncementStatePublisher *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ANAnnouncementStatePublisher;
  v2 = -[ANAnnouncementStatePublisher init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.announce.statePublisherQueue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)publishState:(unint64_t)a3 name:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11[2];
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__ANAnnouncementStatePublisher_publishState_name___block_invoke;
  v9[3] = &unk_1E9390B30;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a3;
  v10 = v6;
  v8 = v6;
  dispatch_async(queue, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __50__ANAnnouncementStatePublisher_publishState_name___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_publishState:name:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__ANAnnouncementStatePublisher_invalidate__block_invoke;
  block[3] = &unk_1E938F9B0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __42__ANAnnouncementStatePublisher_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_unregister");
}

- (void)_publishState:(unint64_t)a3 name:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  unint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[ANAnnouncementStatePublisher _setName:](self, "_setName:", v6))
  {
    -[ANAnnouncementStatePublisher _register](self, "_register");
    if (self->_registrationToken != -1
      && -[ANAnnouncementStatePublisher _setState:withToken:](self, "_setState:withToken:", a3))
    {
      notify_post(self->_name);
      ANLogHandleAnnouncementStatePublisher();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 138412802;
        v10 = &stru_1E93913D0;
        v11 = 2048;
        v12 = a3;
        v13 = 2112;
        v14 = v6;
        _os_log_impl(&dword_1D23A0000, v7, OS_LOG_TYPE_DEFAULT, "%@Publish state: %lu for name: %@", (uint8_t *)&v9, 0x20u);
      }

    }
    -[ANAnnouncementStatePublisher _unregister](self, "_unregister");
  }
  else
  {
    ANLogHandleAnnouncementStatePublisher();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412546;
      v10 = &stru_1E93913D0;
      v11 = 2112;
      v12 = (unint64_t)v6;
      _os_log_impl(&dword_1D23A0000, v8, OS_LOG_TYPE_ERROR, "%@Error while setting name: %@.", (uint8_t *)&v9, 0x16u);
    }

  }
}

- (BOOL)_setName:(id)a3
{
  id v4;
  char *name;
  size_t v6;
  char *v7;
  char v8;
  NSObject *v9;
  int v11;
  const __CFString *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ANAnnouncementStatePublisher _unregister](self, "_unregister");
  name = self->_name;
  if (name)
  {
    free(name);
    self->_name = 0;
  }
  v6 = objc_msgSend(v4, "maximumLengthOfBytesUsingEncoding:", 4) + 1;
  v7 = (char *)malloc_type_malloc(v6, 0x9A4CF87DuLL);
  self->_name = v7;
  v8 = objc_msgSend(v4, "getCString:maxLength:encoding:", v7, v6, 4);
  if ((v8 & 1) == 0)
  {
    ANLogHandleAnnouncementStatePublisher();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412546;
      v12 = &stru_1E93913D0;
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_1D23A0000, v9, OS_LOG_TYPE_ERROR, "%@Unable to get C string of name from %@.", (uint8_t *)&v11, 0x16u);
    }

  }
  return v8;
}

- (BOOL)_setState:(unint64_t)a3 withToken:(int)a4
{
  uint32_t v7;
  NSObject *v8;
  char *name;
  void *v10;
  int v12;
  const __CFString *v13;
  __int16 v14;
  unint64_t v15;
  __int16 v16;
  char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint32_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = notify_set_state(a4, a3);
  if (v7)
  {
    ANLogHandleAnnouncementStatePublisher();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      name = self->_name;
      v12 = 138413314;
      v13 = &stru_1E93913D0;
      v14 = 2048;
      v15 = a3;
      v16 = 2080;
      v17 = name;
      v18 = 1024;
      v19 = a4;
      v20 = 1024;
      v21 = v7;
      _os_log_impl(&dword_1D23A0000, v8, OS_LOG_TYPE_ERROR, "%@Failed to set state to %lu of %s with token %d (status = %u).", (uint8_t *)&v12, 0x2Cu);
    }

    +[ANAnalytics shared](ANAnalytics, "shared");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "error:", 5014);

  }
  return v7 == 0;
}

- (void)_register
{
  uint32_t v3;
  uint32_t v4;
  NSObject *v5;
  char *name;
  NSObject *v7;
  char *v8;
  int out_token;
  uint8_t buf[4];
  const __CFString *v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_registrationToken == -1)
  {
    out_token = -1;
    v3 = notify_register_check(self->_name, &out_token);
    if (v3)
    {
      v4 = v3;
      ANLogHandleAnnouncementStatePublisher();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        name = self->_name;
        *(_DWORD *)buf = 138412802;
        v11 = &stru_1E93913D0;
        v12 = 2080;
        v13 = name;
        v14 = 1024;
        v15 = v4;
        _os_log_impl(&dword_1D23A0000, v5, OS_LOG_TYPE_ERROR, "%@Failed to get registration token of %s (status = %u).", buf, 0x1Cu);
      }

      +[ANAnalytics shared](ANAnalytics, "shared");
      v7 = objc_claimAutoreleasedReturnValue();
      -[NSObject error:](v7, "error:", 5015);
    }
    else
    {
      self->_registrationToken = out_token;
      ANLogHandleAnnouncementStatePublisher();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = self->_name;
        *(_DWORD *)buf = 138412802;
        v11 = &stru_1E93913D0;
        v12 = 2080;
        v13 = v8;
        v14 = 1024;
        v15 = out_token;
        _os_log_impl(&dword_1D23A0000, v7, OS_LOG_TYPE_DEFAULT, "%@Registration token of %s is %d.", buf, 0x1Cu);
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
  const __CFString *v7;
  __int16 v8;
  char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  registrationToken = self->_registrationToken;
  if (registrationToken != -1)
  {
    notify_cancel(registrationToken);
    self->_registrationToken = -1;
    ANLogHandleAnnouncementStatePublisher();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      name = self->_name;
      v6 = 138412546;
      v7 = &stru_1E93913D0;
      v8 = 2080;
      v9 = name;
      _os_log_impl(&dword_1D23A0000, v4, OS_LOG_TYPE_DEFAULT, "%@Registration token of %s is invalidated.", (uint8_t *)&v6, 0x16u);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
