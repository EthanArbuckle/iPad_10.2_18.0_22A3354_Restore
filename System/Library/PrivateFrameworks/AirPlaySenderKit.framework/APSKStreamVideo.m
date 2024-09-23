@implementation APSKStreamVideo

- (APSKStreamVideo)init
{
  return -[APSKStreamVideo initWithDelegate:delegateQueue:options:](self, "initWithDelegate:delegateQueue:options:", 0, 0, 0);
}

- (APSKStreamVideo)initWithDelegate:(id)a3 delegateQueue:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  APSKStreamVideo *v11;
  APSKStreamVideo *v12;
  void **p_delegateQueue;
  dispatch_queue_t v14;
  OS_dispatch_queue *queue;
  id WeakRetained;
  void *v17;
  dispatch_queue_t v18;
  void *v19;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)APSKStreamVideo;
  v11 = -[APSKStreamVideo init](&v21, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v8);
    p_delegateQueue = (void **)&v12->_delegateQueue;
    objc_storeStrong((id *)&v12->_delegateQueue, a4);
    objc_storeStrong((id *)&v12->_options, a5);
    objc_storeWeak((id *)&v12->_frameSender, 0);
    v14 = dispatch_queue_create("com.apple.apskstreamvideo.stateq", 0);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v14;

    WeakRetained = objc_loadWeakRetained((id *)&v12->_delegate);
    if (WeakRetained)
    {
      v17 = *p_delegateQueue;

      if (!v17)
      {
        v18 = dispatch_queue_create("com.apple.apskstreamvideo.delegateq", 0);
        v19 = *p_delegateQueue;
        *p_delegateQueue = v18;

      }
    }
    if (gLogCategory_AirPlaySenderKit <= 50
      && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }

  return v12;
}

- (int)enqueueFrame:(__CVBuffer *)a3 forTime:(int64_t)a4
{
  NSObject *queue;
  void *v7;
  int v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  queue = self->_queue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __40__APSKStreamVideo_enqueueFrame_forTime___block_invoke;
  v10[3] = &unk_25075C688;
  v10[4] = self;
  v10[5] = &v11;
  dispatch_sync(queue, v10);
  v7 = (void *)v12[5];
  if (v7)
    v8 = objc_msgSend(v7, "sendFrame:forTime:", a3, a4);
  else
    v8 = -6709;
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __40__APSKStreamVideo_enqueueFrame_forTime___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

- (BOOL)active
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __25__APSKStreamVideo_active__block_invoke;
  v5[3] = &unk_25075C688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __25__APSKStreamVideo_active__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = WeakRetained != 0;

}

- (int)displayWidth
{
  NSObject *queue;
  int v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __31__APSKStreamVideo_displayWidth__block_invoke;
  v5[3] = &unk_25075C688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __31__APSKStreamVideo_displayWidth__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 48);
  return result;
}

- (int)displayHeight
{
  NSObject *queue;
  int v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __32__APSKStreamVideo_displayHeight__block_invoke;
  v5[3] = &unk_25075C688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __32__APSKStreamVideo_displayHeight__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 52);
  return result;
}

- (int)displayRefreshRate
{
  NSObject *queue;
  int v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __37__APSKStreamVideo_displayRefreshRate__block_invoke;
  v5[3] = &unk_25075C688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__APSKStreamVideo_displayRefreshRate__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 56);
  return result;
}

- (void)setFrameSender:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  APSKStreamVideo *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__APSKStreamVideo_setFrameSender___block_invoke;
  block[3] = &unk_25075C6D8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __34__APSKStreamVideo_setFrameSender___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  id v4;
  id v5;
  char v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD *v9;
  id v10;
  char v11;
  uint64_t v12;
  _QWORD block[5];
  _QWORD v14[5];

  v2 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 40));
  v4 = WeakRetained;
  if (v2)
  {

    if (v4)
    {
      APSLogErrorAt();
      return;
    }
    objc_storeWeak((id *)(*(_QWORD *)(a1 + 40) + 40), *(id *)(a1 + 32));
    if (gLogCategory_AirPlaySenderKit <= 50
      && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v5 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = *(NSObject **)(v7 + 16);
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __34__APSKStreamVideo_setFrameSender___block_invoke_2;
      v14[3] = &unk_25075C6B0;
      v14[4] = v7;
      v9 = v14;
LABEL_16:
      dispatch_async(v8, v9);
    }
  }
  else
  {

    if (v4)
    {
      objc_storeWeak((id *)(*(_QWORD *)(a1 + 40) + 40), 0);
      if (gLogCategory_AirPlaySenderKit <= 50
        && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v10 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
      v11 = objc_opt_respondsToSelector();

      if ((v11 & 1) != 0)
      {
        v12 = *(_QWORD *)(a1 + 40);
        v8 = *(NSObject **)(v12 + 16);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __34__APSKStreamVideo_setFrameSender___block_invoke_3;
        block[3] = &unk_25075C6B0;
        block[4] = v12;
        v9 = block;
        goto LABEL_16;
      }
    }
  }
}

void __34__APSKStreamVideo_setFrameSender___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "videoStreamDidStart:", *(_QWORD *)(a1 + 32));

}

void __34__APSKStreamVideo_setFrameSender___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "videoStreamDidStop:", *(_QWORD *)(a1 + 32));

}

- (void)setError:(int)a3
{
  id WeakRetained;
  char v6;
  NSObject *delegateQueue;
  _QWORD block[5];
  int v9;

  if (a3)
  {
    if (gLogCategory_AirPlaySenderKit <= 90
      && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      delegateQueue = self->_delegateQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __28__APSKStreamVideo_setError___block_invoke;
      block[3] = &unk_25075C700;
      block[4] = self;
      v9 = a3;
      dispatch_async(delegateQueue, block);
    }
  }
}

void __28__APSKStreamVideo_setError___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "videoStreamDidFail:withError:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));

}

- (void)setDisplayWidth:(int)a3 height:(int)a4 refreshRate:(int)a5
{
  NSObject *queue;
  _QWORD block[5];
  int v7;
  int v8;
  int v9;

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__APSKStreamVideo_setDisplayWidth_height_refreshRate___block_invoke;
  block[3] = &unk_25075C728;
  block[4] = self;
  v7 = a3;
  v8 = a4;
  v9 = a5;
  dispatch_sync(queue, block);
}

void __54__APSKStreamVideo_setDisplayWidth_height_refreshRate___block_invoke(uint64_t a1)
{
  _DWORD *v2;
  int v3;
  id WeakRetained;
  char v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD block[5];

  v2 = *(_DWORD **)(a1 + 32);
  v3 = *(_DWORD *)(a1 + 40);
  if (v2[12] != v3 || v2[13] != *(_DWORD *)(a1 + 44) || v2[14] != *(_DWORD *)(a1 + 48))
  {
    v2[12] = v3;
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 52) = *(_DWORD *)(a1 + 44);
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 56) = *(_DWORD *)(a1 + 48);
    if (gLogCategory_AirPlaySenderKit <= 50
      && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(NSObject **)(v6 + 16);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __54__APSKStreamVideo_setDisplayWidth_height_refreshRate___block_invoke_2;
      block[3] = &unk_25075C6B0;
      block[4] = v6;
      dispatch_async(v7, block);
    }
  }
}

void __54__APSKStreamVideo_setDisplayWidth_height_refreshRate___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "videoStreamDisplayInfoDidUpdate:", *(_QWORD *)(a1 + 32));

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_frameSender);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
