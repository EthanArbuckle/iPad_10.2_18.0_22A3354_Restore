@implementation AFBluetoothWirelessSplitterSessionStateObserver

- (AFBluetoothWirelessSplitterSessionStateObserver)initWithQueue:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  AFBluetoothWirelessSplitterSessionStateObserver *v9;
  AFBluetoothWirelessSplitterSessionStateObserver *v10;
  AFNotifyObserver *v11;
  AFNotifyObserver *notifyObserver;
  AFNotifyObserver *v13;
  _QWORD v15[4];
  AFBluetoothWirelessSplitterSessionStateObserver *v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)AFBluetoothWirelessSplitterSessionStateObserver;
  v9 = -[AFBluetoothWirelessSplitterSessionStateObserver init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    if (AFSupportsWirelessSplitter_onceToken != -1)
      dispatch_once(&AFSupportsWirelessSplitter_onceToken, &__block_literal_global_148);
    if (AFSupportsWirelessSplitter_supportsWirelessSplitter)
    {
      v11 = -[AFNotifyObserver initWithName:options:queue:delegate:]([AFNotifyObserver alloc], "initWithName:options:queue:delegate:", CFSTR("com.apple.bluetooth.WirelessSplitterOn"), 1, v7, v10);
      notifyObserver = v10->_notifyObserver;
      v10->_notifyObserver = v11;

      v13 = v10->_notifyObserver;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __74__AFBluetoothWirelessSplitterSessionStateObserver_initWithQueue_delegate___block_invoke;
      v15[3] = &unk_1E3A35100;
      v16 = v10;
      -[AFNotifyObserver getStateWithCompletion:](v13, "getStateWithCompletion:", v15);

    }
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[AFBluetoothWirelessSplitterSessionStateObserver _invalidate](self, "_invalidate");
  v3.receiver = self;
  v3.super_class = (Class)AFBluetoothWirelessSplitterSessionStateObserver;
  -[AFBluetoothWirelessSplitterSessionStateObserver dealloc](&v3, sel_dealloc);
}

- (void)getStateWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    if (AFSupportsWirelessSplitter_onceToken != -1)
      dispatch_once(&AFSupportsWirelessSplitter_onceToken, &__block_literal_global_148);
    if (AFSupportsWirelessSplitter_supportsWirelessSplitter)
    {
      queue = self->_queue;
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __74__AFBluetoothWirelessSplitterSessionStateObserver_getStateWithCompletion___block_invoke;
      v6[3] = &unk_1E3A36FA0;
      v6[4] = self;
      v7 = v4;
      dispatch_async(queue, v6);

    }
    else
    {
      (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
    }
  }

}

- (void)notifyObserver:(id)a3 didReceiveNotificationWithToken:(int)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  int v11;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__AFBluetoothWirelessSplitterSessionStateObserver_notifyObserver_didReceiveNotificationWithToken___block_invoke;
  block[3] = &unk_1E3A35128;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(queue, block);

}

- (void)notifyObserver:(id)a3 didChangeStateFrom:(unint64_t)a4 to:(unint64_t)a5
{
  id v8;
  NSObject *queue;
  id v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;
  unint64_t v14;

  v8 = a3;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __88__AFBluetoothWirelessSplitterSessionStateObserver_notifyObserver_didChangeStateFrom_to___block_invoke;
  v11[3] = &unk_1E3A35150;
  v11[4] = self;
  v12 = v8;
  v13 = a4;
  v14 = a5;
  v10 = v8;
  dispatch_async(queue, v11);

}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__AFBluetoothWirelessSplitterSessionStateObserver_invalidate__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_setState:(int64_t)a3
{
  unint64_t state;
  void *v6;
  NSObject *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  id WeakRetained;
  int v13;
  const char *v14;
  __int16 v15;
  __CFString *v16;
  __int16 v17;
  __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  state = self->_state;
  if (state != a3)
  {
    self->_state = a3;
    v6 = (void *)AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
    {
      v7 = v6;
      if (state > 2)
        v8 = CFSTR("(unknown)");
      else
        v8 = off_1E3A30148[state];
      v9 = v8;
      if ((unint64_t)a3 > 2)
        v10 = CFSTR("(unknown)");
      else
        v10 = off_1E3A30148[a3];
      v11 = v10;
      v13 = 136315650;
      v14 = "-[AFBluetoothWirelessSplitterSessionStateObserver _setState:]";
      v15 = 2112;
      v16 = v9;
      v17 = 2112;
      v18 = v11;
      _os_log_impl(&dword_19AF50000, v7, OS_LOG_TYPE_INFO, "%s state: %@ -> %@", (uint8_t *)&v13, 0x20u);

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "bluetoothWirelessSplitterSessionStateObserver:didChangeStateFrom:to:", self, state, a3);

  }
}

- (void)_invalidate
{
  AFNotifyObserver *notifyObserver;
  AFNotifyObserver *v4;

  notifyObserver = self->_notifyObserver;
  if (notifyObserver)
  {
    -[AFNotifyObserver invalidate](notifyObserver, "invalidate");
    v4 = self->_notifyObserver;
    self->_notifyObserver = 0;

  }
  objc_storeWeak((id *)&self->_delegate, 0);
}

- (int64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifyObserver, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __61__AFBluetoothWirelessSplitterSessionStateObserver_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

uint64_t __88__AFBluetoothWirelessSplitterSessionStateObserver_notifyObserver_didChangeStateFrom_to___block_invoke(uint64_t result)
{
  _QWORD *v1;
  _QWORD *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD **)(result + 32);
  if (v1[3] == *(_QWORD *)(result + 40))
  {
    v2 = (_QWORD *)result;
    v3 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
    {
      v4 = v2[6];
      v5 = v2[7];
      v7 = 136315650;
      v8 = "-[AFBluetoothWirelessSplitterSessionStateObserver notifyObserver:didChangeStateFrom:to:]_block_invoke";
      v9 = 2048;
      v10 = v4;
      v11 = 2048;
      v12 = v5;
      _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s fromState = %llu, toState = %llu", (uint8_t *)&v7, 0x20u);
      v1 = (_QWORD *)v2[4];
    }
    if (v2[7])
      v6 = 2;
    else
      v6 = 1;
    return objc_msgSend(v1, "_setState:", v6);
  }
  return result;
}

void __98__AFBluetoothWirelessSplitterSessionStateObserver_notifyObserver_didReceiveNotificationWithToken___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) == *(_QWORD *)(a1 + 40))
  {
    v2 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
    {
      v3 = *(_DWORD *)(a1 + 48);
      v4 = 136315394;
      v5 = "-[AFBluetoothWirelessSplitterSessionStateObserver notifyObserver:didReceiveNotificationWithToken:]_block_invoke";
      v6 = 1024;
      v7 = v3;
      _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_INFO, "%s token = %d", (uint8_t *)&v4, 0x12u);
    }
  }
}

uint64_t __74__AFBluetoothWirelessSplitterSessionStateObserver_getStateWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
}

uint64_t __74__AFBluetoothWirelessSplitterSessionStateObserver_initWithQueue_delegate___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "-[AFBluetoothWirelessSplitterSessionStateObserver initWithQueue:delegate:]_block_invoke";
    v9 = 2048;
    v10 = a2;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s initialState = %llu", (uint8_t *)&v7, 0x16u);
  }
  if (a2)
    v5 = 2;
  else
    v5 = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_setState:", v5);
}

@end
