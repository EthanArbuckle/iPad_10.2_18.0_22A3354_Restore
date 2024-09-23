@implementation ATLockdownSocket

- (ATLockdownSocket)initWithLockdownInfo:(void *)a3
{
  ATLockdownSocket *v4;
  ATLockdownSocket *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *socketRWQueue;
  NSObject *v8;
  NSObject *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ATLockdownSocket;
  v4 = -[ATSocket init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_lockdownInfo = a3;
    v6 = dispatch_queue_create("com.apple.atc-ATMessageLink-worker", 0);
    socketRWQueue = v5->_socketRWQueue;
    v5->_socketRWQueue = (OS_dispatch_queue *)v6;

    v8 = v5->_socketRWQueue;
    dispatch_get_global_queue(-32768, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_set_target_queue(v8, v9);

  }
  return v5;
}

- (BOOL)isWifi
{
  return self->_isWifiConnection;
}

- (BOOL)open
{
  __CFDictionary *Mutable;
  int v4;
  NSObject *v5;
  NSObject *v6;
  int socket;
  uint64_t securecontext;
  const char *v9;
  void *v10;
  uint64_t v11;
  int v12;
  dispatch_source_t v13;
  uint64_t v14;
  NSObject *v15;
  OS_dispatch_source *recvSource;
  NSObject *v17;
  NSObject *v18;
  _QWORD v20[4];
  id v21;
  _QWORD handler[4];
  NSObject *v23;
  id v24;
  NSObject *v25;
  uint8_t buf[4];
  _BYTE v27[14];
  __int16 v28;
  NSObject *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0DE6C10], self->_lockdownInfo);
  v25 = 0;
  v4 = secure_lockdown_checkin();
  if (v4)
  {
    _ATLogCategoryiTunesSync();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v27 = v4;
      _os_log_impl(&dword_1D1868000, v5, OS_LOG_TYPE_ERROR, "error:%d checking in with lockdown", buf, 8u);
    }
  }
  else
  {
    v5 = v25;
    _ATLogCategoryiTunesSync();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      socket = lockdown_get_socket();
      securecontext = lockdown_get_securecontext();
      v9 = "";
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v27 = socket;
      if (!securecontext)
        v9 = "out";
      *(_WORD *)&v27[4] = 2080;
      *(_QWORD *)&v27[6] = v9;
      v28 = 2114;
      v29 = v25;
      _os_log_impl(&dword_1D1868000, v6, OS_LOG_TYPE_DEFAULT, "Checked in with lockdown on socket %d with%s SSL. connectionInfo=%{public}@", buf, 0x1Cu);
    }

    -[NSObject objectForKey:](v25, "objectForKey:", *MEMORY[0x1E0DE6C18]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "longLongValue");

    self->_isWifiConnection = v11 == 3;
    if (-[ATSocket socketMode](self, "socketMode") == 1)
    {
      v12 = lockdown_get_socket();
      v13 = dispatch_source_create(MEMORY[0x1E0C80DB8], v12, 0, (dispatch_queue_t)self->_socketRWQueue);
      objc_initWeak((id *)buf, self);
      v14 = MEMORY[0x1E0C809B0];
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __24__ATLockdownSocket_open__block_invoke;
      handler[3] = &unk_1E927DA50;
      v15 = v13;
      v23 = v15;
      objc_copyWeak(&v24, (id *)buf);
      dispatch_source_set_event_handler(v15, handler);
      v20[0] = v14;
      v20[1] = 3221225472;
      v20[2] = __24__ATLockdownSocket_open__block_invoke_2;
      v20[3] = &unk_1E927DA78;
      objc_copyWeak(&v21, (id *)buf);
      dispatch_source_set_cancel_handler(v15, v20);
      recvSource = self->_recvSource;
      self->_recvSource = (OS_dispatch_source *)v15;
      v17 = v15;

      dispatch_resume((dispatch_object_t)self->_recvSource);
      objc_destroyWeak(&v21);
      objc_destroyWeak(&v24);

      objc_destroyWeak((id *)buf);
    }
  }

  CFRelease(Mutable);
  _ATLogCategoryiTunesSync();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)v27 = self;
    _os_log_impl(&dword_1D1868000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ opened", buf, 0xCu);
  }

  return v4 == 0;
}

- (void)close
{
  NSObject *v3;
  NSObject *recvSource;
  OS_dispatch_source *v5;
  NSObject *socketRWQueue;
  _QWORD block[5];
  uint8_t buf[4];
  ATLockdownSocket *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryiTunesSync();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v9 = self;
    _os_log_impl(&dword_1D1868000, v3, OS_LOG_TYPE_DEFAULT, "Closing lockdown socket %{public}@", buf, 0xCu);
  }

  recvSource = self->_recvSource;
  if (recvSource)
  {
    dispatch_source_cancel(recvSource);
    v5 = self->_recvSource;
    self->_recvSource = 0;

  }
  socketRWQueue = self->_socketRWQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__ATLockdownSocket_close__block_invoke;
  block[3] = &unk_1E927E120;
  block[4] = self;
  dispatch_sync(socketRWQueue, block);
}

- (BOOL)isOpen
{
  return self->_connection != 0;
}

- (void)writeData:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatch_get_global_queue(0, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__ATLockdownSocket_writeData_withCompletion___block_invoke;
  block[3] = &unk_1E927E0A8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (int)send:(const char *)a3 offset:(unsigned int)a4 len:(unsigned int)a5 error:(id *)a6
{
  unsigned int v10;
  uint64_t v11;
  BOOL v12;
  NSObject *socketRWQueue;
  int v14;
  _QWORD block[7];
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  int v23;

  v10 = 0;
  v11 = MEMORY[0x1E0C809B0];
  do
  {
    if (self->_connection)
      v12 = v10 >= a5;
    else
      v12 = 1;
    if (v12)
      break;
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    socketRWQueue = self->_socketRWQueue;
    block[0] = v11;
    block[1] = 3221225472;
    block[2] = __42__ATLockdownSocket_send_offset_len_error___block_invoke;
    block[3] = &unk_1E927DAA0;
    block[4] = self;
    block[5] = &v20;
    block[6] = a3;
    v18 = a4;
    v19 = a5;
    dispatch_sync(socketRWQueue, block);
    v14 = *((_DWORD *)v21 + 6);
    if (v14 <= 0)
    {
      if (a6)
      {
        objc_msgSend(MEMORY[0x1E0CF2208], "errorWithPosixError:format:", *__error(), CFSTR("%@: lockdown_send returned an error: %d"), self, *((unsigned int *)v21 + 6));
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v10 += v14;
    }
    _Block_object_dispose(&v20, 8);
  }
  while (v14 > 0);
  return v10;
}

- (int)recv:(char *)a3 offset:(unsigned int)a4 len:(unsigned int)a5 error:(id *)a6
{
  unsigned int v10;
  uint64_t v11;
  BOOL v12;
  NSObject *socketRWQueue;
  int v14;
  _QWORD block[7];
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  int v23;

  v10 = 0;
  v11 = MEMORY[0x1E0C809B0];
  do
  {
    if (self->_connection)
      v12 = v10 >= a5;
    else
      v12 = 1;
    if (v12)
      break;
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    socketRWQueue = self->_socketRWQueue;
    block[0] = v11;
    block[1] = 3221225472;
    block[2] = __42__ATLockdownSocket_recv_offset_len_error___block_invoke;
    block[3] = &unk_1E927DAA0;
    block[4] = self;
    block[5] = &v20;
    block[6] = a3;
    v18 = a4;
    v19 = a5;
    dispatch_sync(socketRWQueue, block);
    v14 = *((_DWORD *)v21 + 6);
    if (v14 <= 0)
    {
      if (a6)
      {
        objc_msgSend(MEMORY[0x1E0CF2208], "errorWithPosixError:format:", *__error(), CFSTR("%@: lockdown_recv returned an error: %d"), self, *((unsigned int *)v21 + 6));
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v10 += v14;
    }
    _Block_object_dispose(&v20, 8);
  }
  while (v14 > 0);
  return v10;
}

- (void)_readLength:(unint64_t)a3
{
  uint64_t v4;

  if (self->_connection)
  {
    v4 = lockdown_recv();
    if (v4 >= 1)
      -[ATSocket notifyHasDataAvailable:length:](self, "notifyHasDataAvailable:length:", self->_readBuffer, v4);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_socketRWQueue, 0);
  objc_storeStrong((id *)&self->_recvSource, 0);
}

uint64_t __42__ATLockdownSocket_recv_offset_len_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 65664);
  if (result)
  {
    result = lockdown_recv();
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

uint64_t __42__ATLockdownSocket_send_offset_len_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 65664);
  if (result)
  {
    result = lockdown_send();
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

void __45__ATLockdownSocket_writeData_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "bytes");
  v4 = objc_msgSend(*(id *)(a1 + 40), "length");
  v8 = 0;
  LODWORD(v2) = objc_msgSend(v2, "send:offset:len:error:", v3, 0, v4, &v8);
  v5 = v8;
  v6 = *(_QWORD *)(a1 + 48);
  if (objc_msgSend(*(id *)(a1 + 40), "length") == (int)v2)
    v7 = 0;
  else
    v7 = v5;
  (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);

}

uint64_t __25__ATLockdownSocket_close__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD *)(v2 + 65664);
  if (result)
  {
    result = lockdown_disconnect();
    v2 = *(_QWORD *)(a1 + 32);
  }
  *(_QWORD *)(v2 + 65664) = 0;
  return result;
}

void __24__ATLockdownSocket_open__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;

  v2 = *(NSObject **)(a1 + 32);
  if (dispatch_source_get_data(v2))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_readLength:", dispatch_source_get_data(*(dispatch_source_t *)(a1 + 32)));

  }
  else
  {
    dispatch_source_cancel(v2);
  }
}

void __24__ATLockdownSocket_open__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "notifySocketDidClose");

}

@end
