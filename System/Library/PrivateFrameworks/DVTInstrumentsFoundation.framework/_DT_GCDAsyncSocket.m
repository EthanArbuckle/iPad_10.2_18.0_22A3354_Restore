@implementation _DT_GCDAsyncSocket

- (_DT_GCDAsyncSocket)init
{
  return -[_DT_GCDAsyncSocket initWithDelegate:delegateQueue:socketQueue:](self, "initWithDelegate:delegateQueue:socketQueue:", 0, 0, 0);
}

- (_DT_GCDAsyncSocket)initWithSocketQueue:(id)a3
{
  return -[_DT_GCDAsyncSocket initWithDelegate:delegateQueue:socketQueue:](self, "initWithDelegate:delegateQueue:socketQueue:", 0, 0, a3);
}

- (_DT_GCDAsyncSocket)initWithDelegate:(id)a3 delegateQueue:(id)a4
{
  return -[_DT_GCDAsyncSocket initWithDelegate:delegateQueue:socketQueue:](self, "initWithDelegate:delegateQueue:socketQueue:", a3, a4, 0);
}

- (_DT_GCDAsyncSocket)initWithDelegate:(id)a3 delegateQueue:(id)a4 socketQueue:(id)a5
{
  id v9;
  id v10;
  id v11;
  _DT_GCDAsyncSocket *v12;
  _DT_GCDAsyncSocket *v13;
  id v14;
  id v15;
  id v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *socketQueue;
  uint64_t v19;
  NSMutableArray *readQueue;
  _DT_GCDAsyncReadPacket *currentRead;
  uint64_t v22;
  NSMutableArray *writeQueue;
  _DT_GCDAsyncWritePacket *currentWrite;
  _DT_GCDAsyncSocketPreBuffer *v25;
  _DT_GCDAsyncSocketPreBuffer *preBuffer;
  void *v28;
  void *v29;
  void *v30;
  objc_super v31;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v31.receiver = self;
  v31.super_class = (Class)_DT_GCDAsyncSocket;
  v12 = -[_DT_GCDAsyncSocket init](&v31, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeWeak(&v12->delegate, v9);
    objc_storeStrong((id *)&v13->delegateQueue, a4);
    *(_QWORD *)&v13->socket4FD = -1;
    v13->stateIndex = 0;
    if (v11)
    {
      dispatch_get_global_queue(-2, 0);
      v14 = (id)objc_claimAutoreleasedReturnValue();

      if (v14 == v11)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("GCDAsyncSocket.m"), 948, CFSTR("The given socketQueue parameter must not be a concurrent queue."));

      }
      dispatch_get_global_queue(2, 0);
      v15 = (id)objc_claimAutoreleasedReturnValue();

      if (v15 == v11)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("GCDAsyncSocket.m"), 950, CFSTR("The given socketQueue parameter must not be a concurrent queue."));

      }
      dispatch_get_global_queue(0, 0);
      v16 = (id)objc_claimAutoreleasedReturnValue();

      if (v16 == v11)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("GCDAsyncSocket.m"), 952, CFSTR("The given socketQueue parameter must not be a concurrent queue."));

      }
      v17 = (dispatch_queue_t)v11;
    }
    else
    {
      v17 = dispatch_queue_create((const char *)objc_msgSend(CFSTR("_DT_GCDAsyncSocket"), "UTF8String"), 0);
    }
    socketQueue = v13->socketQueue;
    v13->socketQueue = (OS_dispatch_queue *)v17;

    v13->IsOnSocketQueueOrTargetQueueKey = &v13->IsOnSocketQueueOrTargetQueueKey;
    dispatch_queue_set_specific((dispatch_queue_t)v13->socketQueue, &v13->IsOnSocketQueueOrTargetQueueKey, v13, 0);
    v19 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 5);
    readQueue = v13->readQueue;
    v13->readQueue = (NSMutableArray *)v19;

    currentRead = v13->currentRead;
    v13->currentRead = 0;

    v22 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 5);
    writeQueue = v13->writeQueue;
    v13->writeQueue = (NSMutableArray *)v22;

    currentWrite = v13->currentWrite;
    v13->currentWrite = 0;

    v25 = -[_DT_GCDAsyncSocketPreBuffer initWithCapacity:]([_DT_GCDAsyncSocketPreBuffer alloc], "initWithCapacity:", 4096);
    preBuffer = v13->preBuffer;
    v13->preBuffer = v25;

  }
  return v13;
}

- (void)dealloc
{
  NSObject *socketQueue;
  OS_dispatch_queue *delegateQueue;
  OS_dispatch_queue *v5;
  objc_super v6;
  _QWORD block[5];

  self->flags |= 0x10000u;
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    -[_DT_GCDAsyncSocket closeWithError:](self, "closeWithError:", 0);
  }
  else
  {
    socketQueue = self->socketQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_222B4A54C;
    block[3] = &unk_24EB27E30;
    block[4] = self;
    dispatch_sync(socketQueue, block);
  }
  objc_storeWeak(&self->delegate, 0);
  delegateQueue = self->delegateQueue;
  self->delegateQueue = 0;

  v5 = self->socketQueue;
  self->socketQueue = 0;

  v6.receiver = self;
  v6.super_class = (Class)_DT_GCDAsyncSocket;
  -[_DT_GCDAsyncSocket dealloc](&v6, sel_dealloc);
}

- (id)delegate
{
  NSObject *socketQueue;
  id v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
    return objc_loadWeakRetained(&self->delegate);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_222B4A628;
  v11 = sub_222B4A638;
  v12 = 0;
  socketQueue = self->socketQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_222B4A640;
  v6[3] = &unk_24EB29678;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(socketQueue, v6);
  v5 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v5;
}

- (void)setDelegate:(id)a3 synchronously:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  void (**v8)(_QWORD);
  NSObject *socketQueue;
  _QWORD v10[5];
  id v11;

  v4 = a4;
  v6 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_222B4A738;
  v10[3] = &unk_24EB28350;
  v10[4] = self;
  v7 = v6;
  v11 = v7;
  v8 = (void (**)(_QWORD))_Block_copy(v10);
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    v8[2](v8);
  }
  else
  {
    socketQueue = self->socketQueue;
    if (v4)
      dispatch_sync(socketQueue, v8);
    else
      dispatch_async(socketQueue, v8);
  }

}

- (void)setDelegate:(id)a3
{
  MEMORY[0x24BEDD108](self, sel_setDelegate_synchronously_);
}

- (void)synchronouslySetDelegate:(id)a3
{
  MEMORY[0x24BEDD108](self, sel_setDelegate_synchronously_);
}

- (OS_dispatch_queue)delegateQueue
{
  NSObject *socketQueue;
  id v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
    return self->delegateQueue;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_222B4A628;
  v11 = sub_222B4A638;
  v12 = 0;
  socketQueue = self->socketQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_222B4A824;
  v6[3] = &unk_24EB29678;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(socketQueue, v6);
  v5 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (OS_dispatch_queue *)v5;
}

- (void)setDelegateQueue:(id)a3 synchronously:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  void (**v8)(_QWORD);
  NSObject *socketQueue;
  _QWORD v10[5];
  id v11;

  v4 = a4;
  v6 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_222B4A8F8;
  v10[3] = &unk_24EB28350;
  v10[4] = self;
  v7 = v6;
  v11 = v7;
  v8 = (void (**)(_QWORD))_Block_copy(v10);
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    v8[2](v8);
  }
  else
  {
    socketQueue = self->socketQueue;
    if (v4)
      dispatch_sync(socketQueue, v8);
    else
      dispatch_async(socketQueue, v8);
  }

}

- (void)setDelegateQueue:(id)a3
{
  MEMORY[0x24BEDD108](self, sel_setDelegateQueue_synchronously_);
}

- (void)synchronouslySetDelegateQueue:(id)a3
{
  MEMORY[0x24BEDD108](self, sel_setDelegateQueue_synchronously_);
}

- (void)getDelegate:(id *)a3 delegateQueue:(id *)a4
{
  NSObject *socketQueue;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    if (a3)
      *a3 = objc_loadWeakRetained(&self->delegate);
    if (a4)
      *a4 = objc_retainAutorelease(self->delegateQueue);
  }
  else
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = sub_222B4A628;
    v19 = sub_222B4A638;
    v20 = 0;
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = sub_222B4A628;
    v13 = sub_222B4A638;
    v14 = 0;
    socketQueue = self->socketQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_222B4AA4C;
    block[3] = &unk_24EB296A0;
    block[4] = self;
    block[5] = &v15;
    block[6] = &v9;
    dispatch_sync(socketQueue, block);
    if (a3)
      *a3 = objc_retainAutorelease((id)v16[5]);
    if (a4)
      *a4 = objc_retainAutorelease((id)v10[5]);
    _Block_object_dispose(&v9, 8);

    _Block_object_dispose(&v15, 8);
  }
}

- (void)setDelegate:(id)a3 delegateQueue:(id)a4 synchronously:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  id v10;
  id v11;
  void (**v12)(_QWORD);
  NSObject *socketQueue;
  _QWORD aBlock[5];
  id v15;
  id v16;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_222B4AB8C;
  aBlock[3] = &unk_24EB296C8;
  aBlock[4] = self;
  v10 = v8;
  v15 = v10;
  v11 = v9;
  v16 = v11;
  v12 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    v12[2](v12);
  }
  else
  {
    socketQueue = self->socketQueue;
    if (v5)
      dispatch_sync(socketQueue, v12);
    else
      dispatch_async(socketQueue, v12);
  }

}

- (void)setDelegate:(id)a3 delegateQueue:(id)a4
{
  MEMORY[0x24BEDD108](self, sel_setDelegate_delegateQueue_synchronously_);
}

- (void)synchronouslySetDelegate:(id)a3 delegateQueue:(id)a4
{
  MEMORY[0x24BEDD108](self, sel_setDelegate_delegateQueue_synchronously_);
}

- (BOOL)isIPv4Enabled
{
  BOOL v3;
  NSObject *socketQueue;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
    return (self->config & 1) == 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  socketQueue = self->socketQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_222B4AC84;
  v6[3] = &unk_24EB29678;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(socketQueue, v6);
  v3 = *((_BYTE *)v8 + 24) != 0;
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (void)setIPv4Enabled:(BOOL)a3
{
  void (**v4)(_QWORD);
  _QWORD v5[5];
  BOOL v6;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_222B4AD30;
  v5[3] = &unk_24EB296F0;
  v6 = a3;
  v5[4] = self;
  v4 = (void (**)(_QWORD))_Block_copy(v5);
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
    v4[2](v4);
  else
    dispatch_async((dispatch_queue_t)self->socketQueue, v4);

}

- (BOOL)isIPv6Enabled
{
  BOOL v3;
  NSObject *socketQueue;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
    return (self->config & 2) == 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  socketQueue = self->socketQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_222B4AE08;
  v6[3] = &unk_24EB29678;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(socketQueue, v6);
  v3 = *((_BYTE *)v8 + 24) != 0;
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (void)setIPv6Enabled:(BOOL)a3
{
  void (**v4)(_QWORD);
  _QWORD v5[5];
  BOOL v6;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_222B4AEB4;
  v5[3] = &unk_24EB296F0;
  v6 = a3;
  v5[4] = self;
  v4 = (void (**)(_QWORD))_Block_copy(v5);
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
    v4[2](v4);
  else
    dispatch_async((dispatch_queue_t)self->socketQueue, v4);

}

- (BOOL)isIPv4PreferredOverIPv6
{
  BOOL v3;
  NSObject *socketQueue;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
    return (self->config & 4) == 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  socketQueue = self->socketQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_222B4AF8C;
  v6[3] = &unk_24EB29678;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(socketQueue, v6);
  v3 = *((_BYTE *)v8 + 24) != 0;
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (void)setIPv4PreferredOverIPv6:(BOOL)a3
{
  void (**v4)(_QWORD);
  _QWORD v5[5];
  BOOL v6;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_222B4B038;
  v5[3] = &unk_24EB296F0;
  v6 = a3;
  v5[4] = self;
  v4 = (void (**)(_QWORD))_Block_copy(v5);
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
    v4[2](v4);
  else
    dispatch_async((dispatch_queue_t)self->socketQueue, v4);

}

- (id)userData
{
  void (**v3)(_QWORD);
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_222B4A628;
  v11 = sub_222B4A638;
  v12 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_222B4B154;
  v6[3] = &unk_24EB29678;
  v6[4] = self;
  v6[5] = &v7;
  v3 = (void (**)(_QWORD))_Block_copy(v6);
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
    v3[2](v3);
  else
    dispatch_sync((dispatch_queue_t)self->socketQueue, v3);
  v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)setUserData:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_222B4B218;
  v7[3] = &unk_24EB28350;
  v7[4] = self;
  v5 = v4;
  v8 = v5;
  v6 = (void (**)(_QWORD))_Block_copy(v7);
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
    v6[2](v6);
  else
    dispatch_async((dispatch_queue_t)self->socketQueue, v6);

}

- (BOOL)acceptOnPort:(unsigned __int16)a3 error:(id *)a4
{
  return -[_DT_GCDAsyncSocket acceptOnInterface:port:error:](self, "acceptOnInterface:port:error:", 0, a3, a4);
}

- (BOOL)acceptOnInterface:(id)a3 port:(unsigned __int16)a4 error:(id *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  void (**v14)(_QWORD);
  int v15;
  BOOL v16;
  _QWORD v18[5];
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  unsigned __int16 v23;
  _QWORD aBlock[6];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;

  v8 = a3;
  v9 = (void *)objc_msgSend(v8, "copy");
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_222B4A628;
  v29 = sub_222B4A638;
  v30 = 0;
  v10 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_222B4B438;
  aBlock[3] = &unk_24EB29718;
  aBlock[4] = self;
  aBlock[5] = &v25;
  v11 = _Block_copy(aBlock);
  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = sub_222B4B600;
  v18[3] = &unk_24EB29788;
  v18[4] = self;
  v21 = &v25;
  v12 = v9;
  v19 = v12;
  v23 = a4;
  v13 = v11;
  v20 = v13;
  v22 = &v31;
  v14 = (void (**)(_QWORD))_Block_copy(v18);
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
    v14[2](v14);
  else
    dispatch_sync((dispatch_queue_t)self->socketQueue, v14);
  v15 = *((unsigned __int8 *)v32 + 24);
  if (a5 && !*((_BYTE *)v32 + 24))
  {
    *a5 = objc_retainAutorelease((id)v26[5]);
    v15 = *((unsigned __int8 *)v32 + 24);
  }
  v16 = v15 != 0;

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v16;
}

- (BOOL)doAccept:(int)a3
{
  int socket4FD;
  socklen_t v6;
  int v7;
  int v8;
  void *v9;
  BOOL v10;
  id WeakRetained;
  NSObject *delegateQueue;
  id v13;
  _QWORD block[4];
  id v16;
  id v17;
  _DT_GCDAsyncSocket *v18;
  int v19;
  BOOL v20;
  socklen_t v21;
  sockaddr v22;
  uint64_t v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  socket4FD = self->socket4FD;
  *(_QWORD *)&v22.sa_len = 0;
  *(_QWORD *)&v22.sa_data[6] = 0;
  if (socket4FD == a3)
  {
    v6 = 16;
  }
  else
  {
    v24 = 0;
    v23 = 0;
    v6 = 28;
  }
  v21 = v6;
  v7 = accept(a3, &v22, &v21);
  if (v7 == -1)
    return 0;
  v8 = v7;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v22, v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (fcntl(v8, 4, 4) == -1)
  {
    close(v8);

    return 0;
  }
  *(_DWORD *)&v22.sa_len = 1;
  setsockopt(v8, 0xFFFF, 4130, &v22, 4u);
  if (self->delegateQueue)
  {
    v10 = socket4FD == a3;
    WeakRetained = objc_loadWeakRetained(&self->delegate);
    delegateQueue = self->delegateQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_222B4BD38;
    block[3] = &unk_24EB297B0;
    v16 = WeakRetained;
    v17 = v9;
    v18 = self;
    v20 = v10;
    v19 = v8;
    v13 = WeakRetained;
    dispatch_async(delegateQueue, block);

  }
  return 1;
}

- (BOOL)preConnectWithInterface:(id)a3 error:(id *)a4
{
  id v7;
  id WeakRetained;
  int config;
  const __CFString *v10;
  BOOL v11;
  NSData *v12;
  id v13;
  NSData *v14;
  const __CFString *v15;
  NSData *connectInterface4;
  NSData *v18;
  NSData *connectInterface6;
  void *v20;
  id v21;
  id v22;

  v7 = a3;
  if (!dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDAsyncSocket.m"), 1799, CFSTR("Must be dispatched on socketQueue"));

  }
  WeakRetained = objc_loadWeakRetained(&self->delegate);

  if (!WeakRetained)
  {
    if (a4)
    {
      v10 = CFSTR("Attempting to connect without a delegate. Set a delegate first.");
      goto LABEL_15;
    }
LABEL_30:
    v11 = 0;
    goto LABEL_31;
  }
  if (!self->delegateQueue)
  {
    if (a4)
    {
      v10 = CFSTR("Attempting to connect without a delegate queue. Set a delegate queue first.");
      goto LABEL_15;
    }
    goto LABEL_30;
  }
  if (!-[_DT_GCDAsyncSocket isDisconnected](self, "isDisconnected"))
  {
    if (a4)
    {
      v10 = CFSTR("Attempting to connect while connected or accepting connections. Disconnect first.");
      goto LABEL_15;
    }
    goto LABEL_30;
  }
  config = self->config;
  if ((~config & 3) != 0)
  {
    if (v7)
    {
      v21 = 0;
      v22 = 0;
      -[_DT_GCDAsyncSocket getInterfaceAddress4:address6:fromDescription:port:](self, "getInterfaceAddress4:address6:fromDescription:port:", &v22, &v21, v7, 0);
      v12 = (NSData *)v22;
      v13 = v21;
      v14 = (NSData *)v13;
      if (!((unint64_t)v12 | (unint64_t)v13))
      {
        if (a4)
        {
          v15 = CFSTR("Unknown interface. Specify valid interface by name (e.g. \"en1\") or IP address.");
LABEL_28:
          -[_DT_GCDAsyncSocket badParamError:](self, "badParamError:", v15);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_29;
        }
        goto LABEL_29;
      }
      if ((config & 1) != 0 && !v13)
      {
        if (a4)
        {
          v15 = CFSTR("IPv4 has been disabled and specified interface doesn't support IPv6.");
          goto LABEL_28;
        }
LABEL_29:

        goto LABEL_30;
      }
      if ((config & 2) != 0 && !v12)
      {
        if (a4)
        {
          v15 = CFSTR("IPv6 has been disabled and specified interface doesn't support IPv4.");
          goto LABEL_28;
        }
        goto LABEL_29;
      }
      connectInterface4 = self->connectInterface4;
      self->connectInterface4 = v12;
      v18 = v12;

      connectInterface6 = self->connectInterface6;
      self->connectInterface6 = v14;

    }
    -[NSMutableArray removeAllObjects](self->readQueue, "removeAllObjects");
    -[NSMutableArray removeAllObjects](self->writeQueue, "removeAllObjects");
    v11 = 1;
    goto LABEL_31;
  }
  if (!a4)
    goto LABEL_30;
  v10 = CFSTR("Both IPv4 and IPv6 have been disabled. Must enable at least one protocol first.");
LABEL_15:
  -[_DT_GCDAsyncSocket badConfigError:](self, "badConfigError:", v10);
  v11 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_31:

  return v11;
}

- (BOOL)connectToHost:(id)a3 onPort:(unsigned __int16)a4 error:(id *)a5
{
  return MEMORY[0x24BEDD108](self, sel_connectToHost_onPort_withTimeout_error_);
}

- (BOOL)connectToHost:(id)a3 onPort:(unsigned __int16)a4 withTimeout:(double)a5 error:(id *)a6
{
  return MEMORY[0x24BEDD108](self, sel_connectToHost_onPort_viaInterface_withTimeout_error_);
}

- (BOOL)connectToHost:(id)a3 onPort:(unsigned __int16)a4 viaInterface:(id)a5 withTimeout:(double)a6 error:(id *)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void (**v18)(_QWORD);
  char v19;
  _QWORD aBlock[4];
  id v22;
  _DT_GCDAsyncSocket *v23;
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  double v27;
  unsigned __int16 v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;

  v12 = a3;
  v13 = a5;
  v14 = (void *)objc_msgSend(v12, "copy");
  v15 = (void *)objc_msgSend(v13, "copy");
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = sub_222B4A628;
  v33 = sub_222B4A638;
  v34 = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_222B4C290;
  aBlock[3] = &unk_24EB29850;
  v16 = v14;
  v25 = &v29;
  v22 = v16;
  v23 = self;
  v17 = v15;
  v28 = a4;
  v27 = a6;
  v24 = v17;
  v26 = &v35;
  v18 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (!dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    dispatch_sync((dispatch_queue_t)self->socketQueue, v18);
    if (!a7)
      goto LABEL_4;
    goto LABEL_3;
  }
  v18[2](v18);
  if (a7)
LABEL_3:
    *a7 = objc_retainAutorelease((id)v30[5]);
LABEL_4:
  v19 = *((_BYTE *)v36 + 24);

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  return v19;
}

- (BOOL)connectToAddress:(id)a3 error:(id *)a4
{
  return MEMORY[0x24BEDD108](self, sel_connectToAddress_viaInterface_withTimeout_error_);
}

- (BOOL)connectToAddress:(id)a3 withTimeout:(double)a4 error:(id *)a5
{
  return MEMORY[0x24BEDD108](self, sel_connectToAddress_viaInterface_withTimeout_error_);
}

- (BOOL)connectToAddress:(id)a3 viaInterface:(id)a4 withTimeout:(double)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void (**v16)(_QWORD);
  int v17;
  BOOL v18;
  _QWORD v20[4];
  id v21;
  _DT_GCDAsyncSocket *v22;
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  double v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;

  v10 = a3;
  v11 = a4;
  v12 = (void *)objc_msgSend(v10, "copy");
  v13 = (void *)objc_msgSend(v11, "copy");
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_222B4A628;
  v31 = sub_222B4A638;
  v32 = 0;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = sub_222B4C940;
  v20[3] = &unk_24EB29878;
  v14 = v12;
  v24 = &v27;
  v21 = v14;
  v22 = self;
  v15 = v13;
  v26 = a5;
  v23 = v15;
  v25 = &v33;
  v16 = (void (**)(_QWORD))_Block_copy(v20);
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
    v16[2](v16);
  else
    dispatch_sync((dispatch_queue_t)self->socketQueue, v16);
  v17 = *((unsigned __int8 *)v34 + 24);
  if (a6 && !*((_BYTE *)v34 + 24))
  {
    *a6 = objc_retainAutorelease((id)v28[5]);
    v17 = *((unsigned __int8 *)v34 + 24);
  }
  v18 = v17 != 0;

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v18;
}

- (void)lookup:(int)a3 didSucceedWithAddress4:(id)a4 address6:(id)a5
{
  unint64_t v9;
  unint64_t v10;
  unsigned __int16 config;
  const __CFString *v12;
  id v13;
  BOOL v14;
  void *v15;
  void *v16;
  id v17;

  v9 = (unint64_t)a4;
  v10 = (unint64_t)a5;
  if (!dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDAsyncSocket.m"), 2132, CFSTR("Must be dispatched on socketQueue"));

  }
  if (!(v9 | v10))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDAsyncSocket.m"), 2133, CFSTR("Expected at least one valid address"));

  }
  if (self->stateIndex == a3)
  {
    config = self->config;
    if (v10 || (config & 1) == 0)
    {
      if (v9 || (config & 2) == 0)
      {
        v17 = 0;
        v14 = -[_DT_GCDAsyncSocket connectWithAddress4:address6:error:](self, "connectWithAddress4:address6:error:", v9, v10, &v17);
        v13 = v17;
        if (v14)
          goto LABEL_14;
        goto LABEL_13;
      }
      v12 = CFSTR("IPv6 has been disabled and DNS lookup found no IPv4 address.");
    }
    else
    {
      v12 = CFSTR("IPv4 has been disabled and DNS lookup found no IPv6 address.");
    }
    -[_DT_GCDAsyncSocket otherError:](self, "otherError:", v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:
    -[_DT_GCDAsyncSocket closeWithError:](self, "closeWithError:", v13);
LABEL_14:

  }
}

- (void)lookup:(int)a3 didFail:(id)a4
{
  void *v7;
  id v8;

  v8 = a4;
  if (!dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDAsyncSocket.m"), 2186, CFSTR("Must be dispatched on socketQueue"));

  }
  if (self->stateIndex == a3)
  {
    -[_DT_GCDAsyncSocket endConnectTimeout](self, "endConnectTimeout");
    -[_DT_GCDAsyncSocket closeWithError:](self, "closeWithError:", v8);
  }

}

- (BOOL)connectWithAddress4:(id)a3 address6:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  int v11;
  int v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  int v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  const __CFString *v21;
  BOOL v22;
  int stateIndex;
  NSObject *v24;
  void *v26;
  _QWORD block[4];
  id v28;
  id v29;
  int v30;
  int v31;
  id location;
  int v33;

  v9 = a3;
  v10 = a4;
  if (!dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDAsyncSocket.m"), 2206, CFSTR("Must be dispatched on socketQueue"));

  }
  v11 = (self->config >> 2) & 1;
  if (!v10)
    v11 = 0;
  if (!v9)
    v11 = 1;
  if (v11)
    v12 = 30;
  else
    v12 = 2;
  if (v11)
    v13 = 36;
  else
    v13 = 32;
  if (v11)
    v14 = v10;
  else
    v14 = v9;
  if (v11)
    v15 = 56;
  else
    v15 = 48;
  v16 = socket(v12, 1, 0);
  *(_DWORD *)((char *)&self->super.isa + v13) = v16;
  v17 = v14;
  v18 = *(id *)((char *)&self->super.isa + v15);
  v19 = v18;
  if (v16 == -1)
  {
    if (a5)
    {
      v21 = CFSTR("Error in socket() function");
      goto LABEL_29;
    }
LABEL_30:
    v22 = 0;
    goto LABEL_31;
  }
  if (v18)
  {
    if (objc_msgSend((id)objc_opt_class(), "portFromAddress:", v18))
    {
      LODWORD(location) = 1;
      setsockopt(v16, 0xFFFF, 4, &location, 4u);
    }
    v20 = objc_retainAutorelease(v19);
    if (bind(v16, (const sockaddr *)objc_msgSend(v20, "bytes"), objc_msgSend(v20, "length")))
    {
      if (a5)
      {
        v21 = CFSTR("Error in bind() function");
LABEL_29:
        -[_DT_GCDAsyncSocket errnoErrorWithReason:](self, "errnoErrorWithReason:", v21);
        v22 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_31;
      }
      goto LABEL_30;
    }
  }
  v22 = 1;
  v33 = 1;
  setsockopt(v16, 0xFFFF, 4130, &v33, 4u);
  fcntl(v16, 2, 0x1000000);
  stateIndex = self->stateIndex;
  objc_initWeak(&location, self);
  dispatch_get_global_queue(0, 0);
  v24 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_222B4CFB0;
  block[3] = &unk_24EB298A0;
  v30 = v16;
  v28 = v17;
  objc_copyWeak(&v29, &location);
  v31 = stateIndex;
  dispatch_async(v24, block);
  objc_destroyWeak(&v29);

  objc_destroyWeak(&location);
LABEL_31:

  return v22;
}

- (void)didConnect:(int)a3
{
  uint64_t v6;
  int stateIndex;
  void (**v8)(_QWORD);
  void (**v9)(_QWORD);
  void *v10;
  unsigned __int16 v11;
  id WeakRetained;
  NSObject *delegateQueue;
  uint64_t socket4FD;
  void *v15;
  void *v16;
  _QWORD block[4];
  id v18;
  _DT_GCDAsyncSocket *v19;
  id v20;
  void (**v21)(_QWORD);
  unsigned __int16 v22;
  _QWORD v23[5];
  int v24;
  _QWORD aBlock[5];

  if (!dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDAsyncSocket.m"), 2331, CFSTR("Must be dispatched on socketQueue"));

  }
  if (self->stateIndex == a3)
  {
    self->flags |= 2u;
    -[_DT_GCDAsyncSocket endConnectTimeout](self, "endConnectTimeout");
    v6 = MEMORY[0x24BDAC760];
    stateIndex = self->stateIndex;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_222B4D3DC;
    aBlock[3] = &unk_24EB27E30;
    aBlock[4] = self;
    v8 = (void (**)(_QWORD))_Block_copy(aBlock);
    v23[0] = v6;
    v23[1] = 3221225472;
    v23[2] = sub_222B4D47C;
    v23[3] = &unk_24EB28028;
    v24 = stateIndex;
    v23[4] = self;
    v9 = (void (**)(_QWORD))_Block_copy(v23);
    -[_DT_GCDAsyncSocket connectedHost](self, "connectedHost");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[_DT_GCDAsyncSocket connectedPort](self, "connectedPort");
    WeakRetained = objc_loadWeakRetained(&self->delegate);
    if (self->delegateQueue && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v8[2](v8);
      delegateQueue = self->delegateQueue;
      block[0] = v6;
      block[1] = 3221225472;
      block[2] = sub_222B4D528;
      block[3] = &unk_24EB298C8;
      v18 = WeakRetained;
      v19 = self;
      v20 = v10;
      v22 = v11;
      v21 = v9;
      dispatch_async(delegateQueue, block);

    }
    else
    {
      v8[2](v8);
      v9[2](v9);
    }
    socket4FD = self->socket4FD;
    if ((_DWORD)socket4FD == -1)
      socket4FD = self->socket6FD;
    if (fcntl(socket4FD, 4, 4) == -1)
    {
      -[_DT_GCDAsyncSocket otherError:](self, "otherError:", CFSTR("Error enabling non-blocking IO on socket (fcntl)"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DT_GCDAsyncSocket closeWithError:](self, "closeWithError:", v15);

    }
    else
    {
      -[_DT_GCDAsyncSocket setupReadAndWriteSourcesForNewlyConnectedSocket:](self, "setupReadAndWriteSourcesForNewlyConnectedSocket:", socket4FD);
      -[_DT_GCDAsyncSocket maybeDequeueRead](self, "maybeDequeueRead");
      -[_DT_GCDAsyncSocket maybeDequeueWrite](self, "maybeDequeueWrite");
    }

  }
}

- (void)didNotConnect:(int)a3 error:(id)a4
{
  void *v7;
  id v8;

  v8 = a4;
  if (!dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDAsyncSocket.m"), 2458, CFSTR("Must be dispatched on socketQueue"));

  }
  if (self->stateIndex == a3)
    -[_DT_GCDAsyncSocket closeWithError:](self, "closeWithError:", v8);

}

- (void)startConnectTimeout:(double)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  OS_dispatch_source *v9;
  OS_dispatch_source *connectTimer;
  NSObject *v11;
  dispatch_time_t v12;
  _QWORD v13[4];
  id v14;
  id location[9];

  if (a3 >= 0.0)
  {
    location[1] = v6;
    location[2] = v5;
    location[7] = v3;
    location[8] = v4;
    v9 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->socketQueue);
    connectTimer = self->connectTimer;
    self->connectTimer = v9;

    objc_initWeak(location, self);
    v11 = self->connectTimer;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = sub_222B4D7A0;
    v13[3] = &unk_24EB28000;
    objc_copyWeak(&v14, location);
    dispatch_source_set_event_handler(v11, v13);
    v12 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer((dispatch_source_t)self->connectTimer, v12, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)self->connectTimer);
    objc_destroyWeak(&v14);
    objc_destroyWeak(location);
  }
}

- (void)endConnectTimeout
{
  NSObject *connectTimer;
  OS_dispatch_source *v4;
  NSData *connectInterface4;
  NSData *connectInterface6;

  connectTimer = self->connectTimer;
  if (connectTimer)
  {
    dispatch_source_cancel(connectTimer);
    v4 = self->connectTimer;
    self->connectTimer = 0;

  }
  ++self->stateIndex;
  connectInterface4 = self->connectInterface4;
  if (connectInterface4)
  {
    self->connectInterface4 = 0;

  }
  connectInterface6 = self->connectInterface6;
  if (connectInterface6)
  {
    self->connectInterface6 = 0;

  }
}

- (void)doConnectTimeout
{
  id v3;

  -[_DT_GCDAsyncSocket endConnectTimeout](self, "endConnectTimeout");
  -[_DT_GCDAsyncSocket connectTimeoutError](self, "connectTimeoutError");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[_DT_GCDAsyncSocket closeWithError:](self, "closeWithError:", v3);

}

- (void)closeWithError:(id)a3
{
  id v5;
  __CFReadStream *readStream;
  __CFWriteStream *writeStream;
  SSLContext *sslContext;
  NSObject *accept4Source;
  OS_dispatch_source *v10;
  NSObject *accept6Source;
  OS_dispatch_source *v12;
  NSObject *readSource;
  OS_dispatch_source *v14;
  NSObject *writeSource;
  OS_dispatch_source *v16;
  int *p_socket6FD;
  unsigned int flags;
  id WeakRetained;
  _DT_GCDAsyncSocket *v20;
  _DT_GCDAsyncSocket *v21;
  NSObject *delegateQueue;
  int socket4FD;
  int socket6FD;
  void *v25;
  _QWORD block[4];
  id v27;
  _DT_GCDAsyncSocket *v28;
  id v29;

  v5 = a3;
  if (!dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDAsyncSocket.m"), 2556, CFSTR("Must be dispatched on socketQueue"));

  }
  -[_DT_GCDAsyncSocket endConnectTimeout](self, "endConnectTimeout");
  if (self->currentRead)
    -[_DT_GCDAsyncSocket endCurrentRead](self, "endCurrentRead");
  if (self->currentWrite)
    -[_DT_GCDAsyncSocket endCurrentWrite](self, "endCurrentWrite");
  -[NSMutableArray removeAllObjects](self->readQueue, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->writeQueue, "removeAllObjects");
  -[_DT_GCDAsyncSocketPreBuffer reset](self->preBuffer, "reset");
  if (self->readStream || self->writeStream)
  {
    -[_DT_GCDAsyncSocket removeStreamsFromRunLoop](self, "removeStreamsFromRunLoop");
    readStream = self->readStream;
    if (readStream)
    {
      CFReadStreamSetClient(readStream, 0, 0, 0);
      CFReadStreamClose(self->readStream);
      CFRelease(self->readStream);
      self->readStream = 0;
    }
    writeStream = self->writeStream;
    if (writeStream)
    {
      CFWriteStreamSetClient(writeStream, 0, 0, 0);
      CFWriteStreamClose(self->writeStream);
      CFRelease(self->writeStream);
      self->writeStream = 0;
    }
  }
  -[_DT_GCDAsyncSocketPreBuffer reset](self->sslPreBuffer, "reset");
  self->sslErrCode = 0;
  sslContext = self->sslContext;
  if (sslContext)
  {
    SSLClose(sslContext);
    CFRelease(self->sslContext);
    self->sslContext = 0;
  }
  accept4Source = self->accept4Source;
  if (accept4Source)
  {
    dispatch_source_cancel(accept4Source);
    v10 = self->accept4Source;
    self->accept4Source = 0;

    accept6Source = self->accept6Source;
    if (!accept6Source)
      goto LABEL_20;
    goto LABEL_19;
  }
  accept6Source = self->accept6Source;
  if (accept6Source)
  {
LABEL_19:
    dispatch_source_cancel(accept6Source);
    v12 = self->accept6Source;
    self->accept6Source = 0;

LABEL_20:
    readSource = self->readSource;
    if (readSource)
    {
      dispatch_source_cancel(readSource);
      -[_DT_GCDAsyncSocket resumeReadSource](self, "resumeReadSource");
      v14 = self->readSource;
      self->readSource = 0;

    }
    writeSource = self->writeSource;
    if (writeSource)
    {
      dispatch_source_cancel(writeSource);
      -[_DT_GCDAsyncSocket resumeWriteSource](self, "resumeWriteSource");
      v16 = self->writeSource;
      self->writeSource = 0;

    }
    self->socket4FD = -1;
    p_socket6FD = &self->socket6FD;
    goto LABEL_25;
  }
  if (self->readSource || self->writeSource)
    goto LABEL_20;
  socket4FD = self->socket4FD;
  if (socket4FD != -1)
  {
    close(socket4FD);
    self->socket4FD = -1;
  }
  p_socket6FD = &self->socket6FD;
  socket6FD = self->socket6FD;
  if (socket6FD != -1)
  {
    close(socket6FD);
LABEL_25:
    *p_socket6FD = -1;
  }
  flags = self->flags;
  self->socketFDBytesAvailable = 0;
  self->flags = 0;
  if ((flags & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained(&self->delegate);
    if ((flags & 0x10000) != 0)
      v20 = 0;
    else
      v20 = self;
    v21 = v20;
    if (self->delegateQueue && (objc_opt_respondsToSelector() & 1) != 0)
    {
      delegateQueue = self->delegateQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = sub_222B4DB78;
      block[3] = &unk_24EB296C8;
      v27 = WeakRetained;
      v28 = v21;
      v29 = v5;
      dispatch_async(delegateQueue, block);

    }
  }

}

- (void)disconnect
{
  void (**v3)(_QWORD);
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_222B4DC38;
  aBlock[3] = &unk_24EB27E30;
  aBlock[4] = self;
  v3 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
    v3[2](v3);
  else
    dispatch_sync((dispatch_queue_t)self->socketQueue, v3);

}

- (void)disconnectAfterReading
{
  NSObject *socketQueue;
  _QWORD block[5];

  socketQueue = self->socketQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_222B4DCCC;
  block[3] = &unk_24EB27E30;
  block[4] = self;
  dispatch_async(socketQueue, block);
}

- (void)disconnectAfterWriting
{
  NSObject *socketQueue;
  _QWORD block[5];

  socketQueue = self->socketQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_222B4DD6C;
  block[3] = &unk_24EB27E30;
  block[4] = self;
  dispatch_async(socketQueue, block);
}

- (void)disconnectAfterReadingAndWriting
{
  NSObject *socketQueue;
  _QWORD block[5];

  socketQueue = self->socketQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_222B4DE0C;
  block[3] = &unk_24EB27E30;
  block[4] = self;
  dispatch_async(socketQueue, block);
}

- (void)maybeClose
{
  unsigned int flags;
  void *v5;

  if (!dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDAsyncSocket.m"), 2767, CFSTR("Must be dispatched on socketQueue"));

  }
  flags = self->flags;
  if ((flags & 0x20) != 0)
  {
    if (-[NSMutableArray count](self->readQueue, "count") || self->currentRead)
      return;
    if ((self->flags & 0x40) == 0)
    {
LABEL_12:
      -[_DT_GCDAsyncSocket closeWithError:](self, "closeWithError:", 0);
      return;
    }
  }
  else if ((flags & 0x40) == 0)
  {
    return;
  }
  if (!-[NSMutableArray count](self->writeQueue, "count") && !self->currentWrite)
    goto LABEL_12;
}

- (id)badConfigError:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", a3, *MEMORY[0x24BDD0FC8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("GCDAsyncSocketErrorDomain"), 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)badParamError:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", a3, *MEMORY[0x24BDD0FC8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("GCDAsyncSocketErrorDomain"), 2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)gaiError:(int)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", gai_strerror(a3), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v4, *MEMORY[0x24BDD0FC8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("kCFStreamErrorDomainNetDB"), a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)errnoErrorWithReason:(id)a3
{
  void *v3;
  id v4;
  int *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a3;
  v5 = __error();
  objc_msgSend(v3, "stringWithUTF8String:", strerror(*v5));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v6, *MEMORY[0x24BDD0FC8], v4, *MEMORY[0x24BDD0FD8], 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)errnoError
{
  void *v2;
  int *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = __error();
  objc_msgSend(v2, "stringWithUTF8String:", strerror(*v3));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v4, *MEMORY[0x24BDD0FC8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)sslError:(int)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", CFSTR("Error code definition can be found in Apple's SecureTransport.h"), *MEMORY[0x24BDD0FF0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("kCFStreamErrorDomainSSL"), a3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)connectTimeoutError
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("GCDAsyncSocketConnectTimeoutError"), CFSTR("Attempt to connect to host timed out"), CFSTR("_DT_GCDAsyncSocket"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v3, *MEMORY[0x24BDD0FC8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("GCDAsyncSocketErrorDomain"), 3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)readMaxedOutError
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("GCDAsyncSocketReadMaxedOutError"), CFSTR("Read operation reached set maximum length"), CFSTR("_DT_GCDAsyncSocket"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v3, *MEMORY[0x24BDD0FC8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("GCDAsyncSocketErrorDomain"), 6, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)readTimeoutError
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("GCDAsyncSocketReadTimeoutError"), CFSTR("Read operation timed out"), CFSTR("_DT_GCDAsyncSocket"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v3, *MEMORY[0x24BDD0FC8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("GCDAsyncSocketErrorDomain"), 4, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)writeTimeoutError
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("GCDAsyncSocketWriteTimeoutError"), CFSTR("Write operation timed out"), CFSTR("_DT_GCDAsyncSocket"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v3, *MEMORY[0x24BDD0FC8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("GCDAsyncSocketErrorDomain"), 5, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)connectionClosedError
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("GCDAsyncSocketClosedError"), CFSTR("Socket closed by remote peer"), CFSTR("_DT_GCDAsyncSocket"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v3, *MEMORY[0x24BDD0FC8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("GCDAsyncSocketErrorDomain"), 7, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)otherError:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", a3, *MEMORY[0x24BDD0FC8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("GCDAsyncSocketErrorDomain"), 8, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isDisconnected
{
  void (**v3)(_QWORD);
  char v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_222B4E71C;
  v6[3] = &unk_24EB29678;
  v6[4] = self;
  v6[5] = &v7;
  v3 = (void (**)(_QWORD))_Block_copy(v6);
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
    v3[2](v3);
  else
    dispatch_sync((dispatch_queue_t)self->socketQueue, v3);
  v4 = *((_BYTE *)v8 + 24);

  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)isConnected
{
  void (**v3)(_QWORD);
  char v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_222B4E80C;
  v6[3] = &unk_24EB29678;
  v6[4] = self;
  v6[5] = &v7;
  v3 = (void (**)(_QWORD))_Block_copy(v6);
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
    v3[2](v3);
  else
    dispatch_sync((dispatch_queue_t)self->socketQueue, v3);
  v4 = *((_BYTE *)v8 + 24);

  _Block_object_dispose(&v7, 8);
  return v4;
}

- (NSString)connectedHost
{
  void *v3;
  NSObject *socketQueue;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  if (!dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x3032000000;
    v11 = sub_222B4A628;
    v12 = sub_222B4A638;
    v13 = 0;
    socketQueue = self->socketQueue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = sub_222B4E928;
    v7[3] = &unk_24EB28738;
    v7[4] = self;
    v7[5] = &v8;
    dispatch_sync(socketQueue, v7);
    v5 = (id)v9[5];
    _Block_object_dispose(&v8, 8);

    return (NSString *)v5;
  }
  if (self->socket4FD != -1)
  {
    -[_DT_GCDAsyncSocket connectedHostFromSocket4:](self, "connectedHostFromSocket4:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    return (NSString *)v3;
  }
  if (self->socket6FD != -1)
  {
    -[_DT_GCDAsyncSocket connectedHostFromSocket6:](self, "connectedHostFromSocket6:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    return (NSString *)v3;
  }
  return (NSString *)0;
}

- (unsigned)connectedPort
{
  NSObject *socketQueue;
  unsigned __int16 v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  __int16 v10;

  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    if (self->socket4FD != -1)
      return -[_DT_GCDAsyncSocket connectedPortFromSocket4:](self, "connectedPortFromSocket4:");
    if (self->socket6FD != -1)
      return -[_DT_GCDAsyncSocket connectedPortFromSocket6:](self, "connectedPortFromSocket6:");
    return 0;
  }
  else
  {
    v7 = 0;
    v8 = &v7;
    v9 = 0x2020000000;
    v10 = 0;
    socketQueue = self->socketQueue;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = sub_222B4EA78;
    v6[3] = &unk_24EB28738;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(socketQueue, v6);
    v5 = *((_WORD *)v8 + 12);
    _Block_object_dispose(&v7, 8);
  }
  return v5;
}

- (NSString)localHost
{
  void *v3;
  NSObject *socketQueue;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  if (!dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x3032000000;
    v11 = sub_222B4A628;
    v12 = sub_222B4A638;
    v13 = 0;
    socketQueue = self->socketQueue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = sub_222B4EBCC;
    v7[3] = &unk_24EB28738;
    v7[4] = self;
    v7[5] = &v8;
    dispatch_sync(socketQueue, v7);
    v5 = (id)v9[5];
    _Block_object_dispose(&v8, 8);

    return (NSString *)v5;
  }
  if (self->socket4FD != -1)
  {
    -[_DT_GCDAsyncSocket localHostFromSocket4:](self, "localHostFromSocket4:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    return (NSString *)v3;
  }
  if (self->socket6FD != -1)
  {
    -[_DT_GCDAsyncSocket localHostFromSocket6:](self, "localHostFromSocket6:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    return (NSString *)v3;
  }
  return (NSString *)0;
}

- (unsigned)localPort
{
  NSObject *socketQueue;
  unsigned __int16 v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  __int16 v10;

  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    if (self->socket4FD != -1)
      return -[_DT_GCDAsyncSocket localPortFromSocket4:](self, "localPortFromSocket4:");
    if (self->socket6FD != -1)
      return -[_DT_GCDAsyncSocket localPortFromSocket6:](self, "localPortFromSocket6:");
    return 0;
  }
  else
  {
    v7 = 0;
    v8 = &v7;
    v9 = 0x2020000000;
    v10 = 0;
    socketQueue = self->socketQueue;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = sub_222B4ED1C;
    v6[3] = &unk_24EB28738;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(socketQueue, v6);
    v5 = *((_WORD *)v8 + 12);
    _Block_object_dispose(&v7, 8);
  }
  return v5;
}

- (id)connectedHost4
{
  void *v2;

  if (self->socket4FD == -1)
  {
    v2 = 0;
  }
  else
  {
    -[_DT_GCDAsyncSocket connectedHostFromSocket4:](self, "connectedHostFromSocket4:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)connectedHost6
{
  void *v2;

  if (self->socket6FD == -1)
  {
    v2 = 0;
  }
  else
  {
    -[_DT_GCDAsyncSocket connectedHostFromSocket6:](self, "connectedHostFromSocket6:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (unsigned)connectedPort4
{
  if (self->socket4FD == -1)
    return 0;
  else
    return -[_DT_GCDAsyncSocket connectedPortFromSocket4:](self, "connectedPortFromSocket4:");
}

- (unsigned)connectedPort6
{
  if (self->socket6FD == -1)
    return 0;
  else
    return -[_DT_GCDAsyncSocket connectedPortFromSocket6:](self, "connectedPortFromSocket6:");
}

- (id)localHost4
{
  void *v2;

  if (self->socket4FD == -1)
  {
    v2 = 0;
  }
  else
  {
    -[_DT_GCDAsyncSocket localHostFromSocket4:](self, "localHostFromSocket4:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)localHost6
{
  void *v2;

  if (self->socket6FD == -1)
  {
    v2 = 0;
  }
  else
  {
    -[_DT_GCDAsyncSocket localHostFromSocket6:](self, "localHostFromSocket6:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (unsigned)localPort4
{
  if (self->socket4FD == -1)
    return 0;
  else
    return -[_DT_GCDAsyncSocket localPortFromSocket4:](self, "localPortFromSocket4:");
}

- (unsigned)localPort6
{
  if (self->socket6FD == -1)
    return 0;
  else
    return -[_DT_GCDAsyncSocket localPortFromSocket6:](self, "localPortFromSocket6:");
}

- (id)connectedHostFromSocket4:(int)a3
{
  void *v3;
  socklen_t v5;
  sockaddr v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v6.sa_len = 0;
  *(_QWORD *)&v6.sa_data[6] = 0;
  v5 = 16;
  if (getpeername(a3, &v6, &v5) < 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "hostFromSockaddr4:", &v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)connectedHostFromSocket6:(int)a3
{
  void *v3;
  socklen_t v5;
  sockaddr v6;
  uint64_t v7;
  int v8;

  *(_QWORD *)&v6.sa_len = 0;
  *(_QWORD *)&v6.sa_data[6] = 0;
  v8 = 0;
  v7 = 0;
  v5 = 28;
  if (getpeername(a3, &v6, &v5) < 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "hostFromSockaddr6:", &v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (unsigned)connectedPortFromSocket4:(int)a3
{
  socklen_t v4;
  sockaddr v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v5.sa_len = 0;
  *(_QWORD *)&v5.sa_data[6] = 0;
  v4 = 16;
  if (getpeername(a3, &v5, &v4) < 0)
    return 0;
  else
    return objc_msgSend((id)objc_opt_class(), "portFromSockaddr4:", &v5);
}

- (unsigned)connectedPortFromSocket6:(int)a3
{
  socklen_t v4;
  sockaddr v5;
  uint64_t v6;
  int v7;

  *(_QWORD *)&v5.sa_len = 0;
  *(_QWORD *)&v5.sa_data[6] = 0;
  v7 = 0;
  v6 = 0;
  v4 = 28;
  if (getpeername(a3, &v5, &v4) < 0)
    return 0;
  else
    return objc_msgSend((id)objc_opt_class(), "portFromSockaddr6:", &v5);
}

- (id)localHostFromSocket4:(int)a3
{
  void *v3;
  socklen_t v5;
  sockaddr v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v6.sa_len = 0;
  *(_QWORD *)&v6.sa_data[6] = 0;
  v5 = 16;
  if (getsockname(a3, &v6, &v5) < 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "hostFromSockaddr4:", &v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)localHostFromSocket6:(int)a3
{
  void *v3;
  socklen_t v5;
  sockaddr v6;
  uint64_t v7;
  int v8;

  *(_QWORD *)&v6.sa_len = 0;
  *(_QWORD *)&v6.sa_data[6] = 0;
  v8 = 0;
  v7 = 0;
  v5 = 28;
  if (getsockname(a3, &v6, &v5) < 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "hostFromSockaddr6:", &v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (unsigned)localPortFromSocket4:(int)a3
{
  socklen_t v4;
  sockaddr v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v5.sa_len = 0;
  *(_QWORD *)&v5.sa_data[6] = 0;
  v4 = 16;
  if (getsockname(a3, &v5, &v4) < 0)
    return 0;
  else
    return objc_msgSend((id)objc_opt_class(), "portFromSockaddr4:", &v5);
}

- (unsigned)localPortFromSocket6:(int)a3
{
  socklen_t v4;
  sockaddr v5;
  uint64_t v6;
  int v7;

  *(_QWORD *)&v5.sa_len = 0;
  *(_QWORD *)&v5.sa_data[6] = 0;
  v7 = 0;
  v6 = 0;
  v4 = 28;
  if (getsockname(a3, &v5, &v4) < 0)
    return 0;
  else
    return objc_msgSend((id)objc_opt_class(), "portFromSockaddr6:", &v5);
}

- (NSData)connectedAddress
{
  void (**v3)(_QWORD);
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_222B4A628;
  v11 = sub_222B4A638;
  v12 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_222B4F354;
  v6[3] = &unk_24EB28738;
  v6[4] = self;
  v6[5] = &v7;
  v3 = (void (**)(_QWORD))_Block_copy(v6);
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
    v3[2](v3);
  else
    dispatch_sync((dispatch_queue_t)self->socketQueue, v3);
  v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return (NSData *)v4;
}

- (NSData)localAddress
{
  void (**v3)(_QWORD);
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_222B4A628;
  v11 = sub_222B4A638;
  v12 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_222B4F554;
  v6[3] = &unk_24EB28738;
  v6[4] = self;
  v6[5] = &v7;
  v3 = (void (**)(_QWORD))_Block_copy(v6);
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
    v3[2](v3);
  else
    dispatch_sync((dispatch_queue_t)self->socketQueue, v3);
  v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return (NSData *)v4;
}

- (BOOL)isIPv4
{
  BOOL v3;
  NSObject *socketQueue;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
    return self->socket4FD != -1;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  socketQueue = self->socketQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_222B4F710;
  v6[3] = &unk_24EB29678;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(socketQueue, v6);
  v3 = *((_BYTE *)v8 + 24) != 0;
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (BOOL)isIPv6
{
  BOOL v3;
  NSObject *socketQueue;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
    return self->socket6FD != -1;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  socketQueue = self->socketQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_222B4F7E0;
  v6[3] = &unk_24EB29678;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(socketQueue, v6);
  v3 = *((_BYTE *)v8 + 24) != 0;
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (BOOL)isSecure
{
  _DT_GCDAsyncSocket *v2;
  NSObject *socketQueue;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    LODWORD(v2) = (BYTE1(v2->flags) >> 5) & 1;
  }
  else
  {
    v6 = 0;
    v7 = &v6;
    v8 = 0x2020000000;
    v9 = 0;
    socketQueue = v2->socketQueue;
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = sub_222B4F8AC;
    v5[3] = &unk_24EB29678;
    v5[4] = v2;
    v5[5] = &v6;
    dispatch_sync(socketQueue, v5);
    LOBYTE(v2) = *((_BYTE *)v7 + 24) != 0;
    _Block_object_dispose(&v6, 8);
  }
  return (char)v2;
}

- (void)getInterfaceAddress4:(id *)a3 address6:(id *)a4 fromDescription:(id)a5 port:(unsigned __int16)a6
{
  unsigned int v6;
  id v9;
  void *v10;
  void *v11;
  id v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  _OWORD *v16;
  void *v17;
  void *v18;
  const char *v19;
  ifaddrs *v20;
  unsigned int v21;
  sockaddr *v22;
  sockaddr *ifa_addr;
  __int128 v24;
  ifaddrs *v25;
  ifaddrs *v26;
  _OWORD v27[3];
  char __s1[40];
  uint64_t v29;

  v6 = a6;
  v29 = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  objc_msgSend(v9, "componentsSeparatedByString:", CFSTR(":"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "objectAtIndex:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "length"))
      v12 = v11;
    else
      v12 = 0;

  }
  else
  {
    v12 = 0;
  }
  v13 = objc_msgSend(v10, "count");
  if (!v6 && v13 >= 2)
  {
    objc_msgSend(v10, "objectAtIndex:", 1);
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = strtol((const char *)objc_msgSend(v14, "UTF8String"), 0, 10);

    if ((unint64_t)(v15 - 1) >= 0xFFFF)
      v6 = 0;
    else
      v6 = v15;
  }
  if (!v12)
  {
    *(_QWORD *)&__s1[8] = 0;
    *(_WORD *)__s1 = 528;
    *(_WORD *)&__s1[2] = bswap32(v6) >> 16;
    *(_DWORD *)&__s1[4] = 0;
    memset((char *)v27 + 4, 0, 24);
    LOWORD(v27[0]) = 7708;
    WORD1(v27[0]) = *(_WORD *)&__s1[2];
    v16 = (_OWORD *)MEMORY[0x24BDAE878];
    goto LABEL_17;
  }
  if ((objc_msgSend(v12, "isEqualToString:", CFSTR("localhost")) & 1) != 0
    || objc_msgSend(v12, "isEqualToString:", CFSTR("loopback")))
  {
    *(_QWORD *)&__s1[8] = 0;
    *(_WORD *)__s1 = 528;
    *(_WORD *)&__s1[2] = bswap32(v6) >> 16;
    *(_DWORD *)&__s1[4] = 16777343;
    memset((char *)v27 + 4, 0, 24);
    LOWORD(v27[0]) = 7708;
    WORD1(v27[0]) = *(_WORD *)&__s1[2];
    v16 = (_OWORD *)MEMORY[0x24BDAE880];
LABEL_17:
    *(_OWORD *)((char *)v27 + 8) = *v16;
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithBytes:length:", __s1, 16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithBytes:length:", v27, 28);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  v19 = (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
  v26 = 0;
  v18 = 0;
  v17 = 0;
  if (!getifaddrs(&v26))
  {
    v20 = v26;
    if (v26)
    {
      v17 = 0;
      v18 = 0;
      v21 = bswap32(v6) >> 16;
      do
      {
        if (v17 || (v22 = v20->ifa_addr, v22->sa_family != 2))
        {
          if (!v18)
          {
            if (v20->ifa_addr->sa_family == 30
              && ((memset(__s1, 0, 28),
                   ifa_addr = v20->ifa_addr,
                   v24 = *(_OWORD *)&ifa_addr->sa_data[10],
                   *(sockaddr *)__s1 = *ifa_addr,
                   *(_OWORD *)&__s1[12] = v24,
                   !strcmp(v20->ifa_name, v19))
               || inet_ntop(30, &__s1[8], (char *)v27, 0x2Eu) && !strcmp((const char *)v27, v19)))
            {
              *(_WORD *)&__s1[2] = v21;
              objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithBytes:length:", __s1, 28);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v18 = 0;
            }
          }
        }
        else
        {
          v27[0] = 0uLL;
          v27[0] = *v22;
          if (!strcmp(v20->ifa_name, v19) || inet_ntop(2, (char *)v27 + 4, __s1, 0x10u) && !strcmp(__s1, v19))
          {
            WORD1(v27[0]) = v21;
            objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithBytes:length:", v27, 16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v17 = 0;
          }
        }
        v20 = v20->ifa_next;
      }
      while (v20);
      v25 = v26;
    }
    else
    {
      v25 = 0;
      v18 = 0;
      v17 = 0;
    }
    MEMORY[0x227679464](v25);
  }
LABEL_18:
  if (a3)
    *a3 = objc_retainAutorelease(v17);
  if (a4)
    *a4 = objc_retainAutorelease(v18);

}

- (void)setupReadAndWriteSourcesForNewlyConnectedSocket:(int)a3
{
  uintptr_t v5;
  OS_dispatch_source *v6;
  OS_dispatch_source *readSource;
  OS_dispatch_source *v8;
  OS_dispatch_source *writeSource;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD v15[5];
  int v16;
  _QWORD v17[5];
  int v18;
  _QWORD v19[3];
  int v20;
  _QWORD v21[4];
  id v22;
  _QWORD handler[4];
  id v24;
  id location;

  v5 = a3;
  v6 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA00], a3, 0, (dispatch_queue_t)self->socketQueue);
  readSource = self->readSource;
  self->readSource = v6;

  v8 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA30], v5, 0, (dispatch_queue_t)self->socketQueue);
  writeSource = self->writeSource;
  self->writeSource = v8;

  objc_initWeak(&location, self);
  v10 = self->readSource;
  v11 = MEMORY[0x24BDAC760];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = sub_222B4FE84;
  handler[3] = &unk_24EB28000;
  objc_copyWeak(&v24, &location);
  dispatch_source_set_event_handler(v10, handler);
  v12 = self->writeSource;
  v21[0] = v11;
  v21[1] = 3221225472;
  v21[2] = sub_222B4FEE4;
  v21[3] = &unk_24EB28000;
  objc_copyWeak(&v22, &location);
  dispatch_source_set_event_handler(v12, v21);
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v20 = 2;
  v13 = self->readSource;
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = sub_222B4FF34;
  v17[3] = &unk_24EB298F0;
  v17[4] = v19;
  v18 = a3;
  dispatch_source_set_cancel_handler(v13, v17);
  v14 = self->writeSource;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = sub_222B4FF58;
  v15[3] = &unk_24EB298F0;
  v15[4] = v19;
  v16 = a3;
  dispatch_source_set_cancel_handler(v14, v15);
  self->socketFDBytesAvailable = 0;
  self->flags &= ~0x100u;
  dispatch_resume((dispatch_object_t)self->readSource);
  self->flags |= 0x280u;
  _Block_object_dispose(v19, 8);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

- (BOOL)usingCFStreamForTLS
{
  return (~self->flags & 0x42000) == 0;
}

- (BOOL)usingSecureTransportForTLS
{
  return (~self->flags & 0x42000) != 0;
}

- (void)suspendReadSource
{
  if ((self->flags & 0x100) == 0)
  {
    dispatch_suspend((dispatch_object_t)self->readSource);
    self->flags |= 0x100u;
  }
}

- (void)resumeReadSource
{
  if ((self->flags & 0x100) != 0)
  {
    dispatch_resume((dispatch_object_t)self->readSource);
    self->flags &= ~0x100u;
  }
}

- (void)suspendWriteSource
{
  if ((self->flags & 0x200) == 0)
  {
    dispatch_suspend((dispatch_object_t)self->writeSource);
    self->flags |= 0x200u;
  }
}

- (void)resumeWriteSource
{
  if ((self->flags & 0x200) != 0)
  {
    dispatch_resume((dispatch_object_t)self->writeSource);
    self->flags &= ~0x200u;
  }
}

- (void)readDataWithTimeout:(double)a3 tag:(int64_t)a4
{
  MEMORY[0x24BEDD108](self, sel_readDataWithTimeout_buffer_bufferOffset_maxLength_tag_);
}

- (void)readDataWithTimeout:(double)a3 buffer:(id)a4 bufferOffset:(unint64_t)a5 tag:(int64_t)a6
{
  MEMORY[0x24BEDD108](self, sel_readDataWithTimeout_buffer_bufferOffset_maxLength_tag_);
}

- (void)readDataWithTimeout:(double)a3 buffer:(id)a4 bufferOffset:(unint64_t)a5 maxLength:(unint64_t)a6 tag:(int64_t)a7
{
  id v12;
  _DT_GCDAsyncReadPacket *v13;
  NSObject *socketQueue;
  _DT_GCDAsyncReadPacket *v15;
  _QWORD v16[5];
  _DT_GCDAsyncReadPacket *v17;

  v12 = a4;
  if (objc_msgSend(v12, "length") >= a5)
  {
    v13 = -[_DT_GCDAsyncReadPacket initWithData:startOffset:maxLength:timeout:readLength:terminator:tag:]([_DT_GCDAsyncReadPacket alloc], "initWithData:startOffset:maxLength:timeout:readLength:terminator:tag:", v12, a5, a6, 0, 0, a7, a3);
    socketQueue = self->socketQueue;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = sub_222B50190;
    v16[3] = &unk_24EB28350;
    v16[4] = self;
    v17 = v13;
    v15 = v13;
    dispatch_async(socketQueue, v16);

  }
}

- (void)readDataToLength:(unint64_t)a3 withTimeout:(double)a4 tag:(int64_t)a5
{
  MEMORY[0x24BEDD108](self, sel_readDataToLength_withTimeout_buffer_bufferOffset_tag_);
}

- (void)readDataToLength:(unint64_t)a3 withTimeout:(double)a4 buffer:(id)a5 bufferOffset:(unint64_t)a6 tag:(int64_t)a7
{
  id v12;
  void *v13;
  _DT_GCDAsyncReadPacket *v14;
  NSObject *socketQueue;
  _DT_GCDAsyncReadPacket *v16;
  _QWORD v17[5];
  _DT_GCDAsyncReadPacket *v18;

  v12 = a5;
  v13 = v12;
  if (a3 && objc_msgSend(v12, "length") >= a6)
  {
    v14 = -[_DT_GCDAsyncReadPacket initWithData:startOffset:maxLength:timeout:readLength:terminator:tag:]([_DT_GCDAsyncReadPacket alloc], "initWithData:startOffset:maxLength:timeout:readLength:terminator:tag:", v13, a6, 0, a3, 0, a7, a4);
    socketQueue = self->socketQueue;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = sub_222B502E0;
    v17[3] = &unk_24EB28350;
    v17[4] = self;
    v18 = v14;
    v16 = v14;
    dispatch_async(socketQueue, v17);

  }
}

- (void)readDataToData:(id)a3 withTimeout:(double)a4 tag:(int64_t)a5
{
  MEMORY[0x24BEDD108](self, sel_readDataToData_withTimeout_buffer_bufferOffset_maxLength_tag_);
}

- (void)readDataToData:(id)a3 withTimeout:(double)a4 buffer:(id)a5 bufferOffset:(unint64_t)a6 tag:(int64_t)a7
{
  MEMORY[0x24BEDD108](self, sel_readDataToData_withTimeout_buffer_bufferOffset_maxLength_tag_);
}

- (void)readDataToData:(id)a3 withTimeout:(double)a4 maxLength:(unint64_t)a5 tag:(int64_t)a6
{
  MEMORY[0x24BEDD108](self, sel_readDataToData_withTimeout_buffer_bufferOffset_maxLength_tag_);
}

- (void)readDataToData:(id)a3 withTimeout:(double)a4 buffer:(id)a5 bufferOffset:(unint64_t)a6 maxLength:(unint64_t)a7 tag:(int64_t)a8
{
  id v14;
  id v15;
  _DT_GCDAsyncReadPacket *v16;
  NSObject *socketQueue;
  _DT_GCDAsyncReadPacket *v18;
  _QWORD v19[5];
  _DT_GCDAsyncReadPacket *v20;

  v14 = a3;
  v15 = a5;
  if (objc_msgSend(v14, "length") && objc_msgSend(v15, "length") >= a6 && (!a7 || objc_msgSend(v14, "length") <= a7))
  {
    v16 = -[_DT_GCDAsyncReadPacket initWithData:startOffset:maxLength:timeout:readLength:terminator:tag:]([_DT_GCDAsyncReadPacket alloc], "initWithData:startOffset:maxLength:timeout:readLength:terminator:tag:", v15, a6, a7, 0, v14, a8, a4);
    socketQueue = self->socketQueue;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = sub_222B50480;
    v19[3] = &unk_24EB28350;
    v19[4] = self;
    v20 = v16;
    v18 = v16;
    dispatch_async(socketQueue, v19);

  }
}

- (float)progressOfReadReturningTag:(int64_t *)a3 bytesDone:(unint64_t *)a4 total:(unint64_t *)a5
{
  void (**v6)(_QWORD);
  float v7;
  _QWORD aBlock[9];
  uint64_t v10;
  float *v11;
  uint64_t v12;
  int v13;

  v10 = 0;
  v11 = (float *)&v10;
  v12 = 0x2020000000;
  v13 = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_222B505B8;
  aBlock[3] = &unk_24EB29918;
  aBlock[6] = a3;
  aBlock[7] = a4;
  aBlock[8] = a5;
  aBlock[4] = self;
  aBlock[5] = &v10;
  v6 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
    v6[2](v6);
  else
    dispatch_sync((dispatch_queue_t)self->socketQueue, v6);
  v7 = v11[6];

  _Block_object_dispose(&v10, 8);
  return v7;
}

- (void)maybeDequeueRead
{
  _DT_GCDAsyncReadPacket *v4;
  _DT_GCDAsyncReadPacket *currentRead;
  unsigned int flags;
  void *v7;

  if (!dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDAsyncSocket.m"), 3927, CFSTR("Must be dispatched on socketQueue"));

  }
  if (!self->currentRead && (self->flags & 2) != 0)
  {
    if (-[NSMutableArray count](self->readQueue, "count"))
    {
      -[NSMutableArray objectAtIndex:](self->readQueue, "objectAtIndex:", 0);
      v4 = (_DT_GCDAsyncReadPacket *)objc_claimAutoreleasedReturnValue();
      currentRead = self->currentRead;
      self->currentRead = v4;

      -[NSMutableArray removeObjectAtIndex:](self->readQueue, "removeObjectAtIndex:", 0);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        self->flags |= 0x800u;
        MEMORY[0x24BEDD108](self, sel_maybeStartTLS);
      }
      else
      {
        -[_DT_GCDAsyncSocket setupReadTimerWithTimeout:](self, "setupReadTimerWithTimeout:", self->currentRead->timeout);
        -[_DT_GCDAsyncSocket doReadData](self, "doReadData");
      }
    }
    else
    {
      flags = self->flags;
      if ((flags & 0x20) != 0)
      {
        if ((flags & 0x40) == 0 || !-[NSMutableArray count](self->writeQueue, "count") && !self->currentWrite)
          -[_DT_GCDAsyncSocket closeWithError:](self, "closeWithError:", 0);
      }
      else if ((flags & 0x2000) != 0)
      {
        -[_DT_GCDAsyncSocket flushSSLBuffers](self, "flushSSLBuffers");
        if (!-[_DT_GCDAsyncSocketPreBuffer availableBytes](self->preBuffer, "availableBytes")
          && !-[_DT_GCDAsyncSocket usingCFStreamForTLS](self, "usingCFStreamForTLS"))
        {
          -[_DT_GCDAsyncSocket resumeReadSource](self, "resumeReadSource");
        }
      }
    }
  }
}

- (void)flushSSLBuffers
{
  CFIndex v3;
  void (**v4)(void);
  char *v5;
  OSStatus v6;
  void *v8;
  size_t processed;
  _QWORD aBlock[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  if ((self->flags & 0x2000) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDAsyncSocket.m"), 4005, CFSTR("Cannot flush ssl buffers on non-secure socket"));

  }
  if (!-[_DT_GCDAsyncSocketPreBuffer availableBytes](self->preBuffer, "availableBytes"))
  {
    if (-[_DT_GCDAsyncSocket usingCFStreamForTLS](self, "usingCFStreamForTLS"))
    {
      if ((self->flags & 0x80000) != 0 && CFReadStreamHasBytesAvailable(self->readStream))
      {
        -[_DT_GCDAsyncSocketPreBuffer ensureCapacityForWrite:](self->preBuffer, "ensureCapacityForWrite:", 4096);
        v3 = CFReadStreamRead(self->readStream, (UInt8 *)-[_DT_GCDAsyncSocketPreBuffer writeBuffer](self->preBuffer, "writeBuffer"), 4096);
        if (v3 >= 1)
          -[_DT_GCDAsyncSocketPreBuffer didWrite:](self->preBuffer, "didWrite:", v3);
        self->flags &= ~0x80000u;
      }
    }
    else
    {
      v11 = 0;
      v12 = &v11;
      v13 = 0x2020000000;
      v14 = 0;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 3221225472;
      aBlock[2] = sub_222B509EC;
      aBlock[3] = &unk_24EB29678;
      aBlock[4] = self;
      aBlock[5] = &v11;
      v4 = (void (**)(void))_Block_copy(aBlock);
      v4[2]();
      while (v12[3])
      {
        -[_DT_GCDAsyncSocketPreBuffer ensureCapacityForWrite:](self->preBuffer, "ensureCapacityForWrite:");
        v5 = -[_DT_GCDAsyncSocketPreBuffer writeBuffer](self->preBuffer, "writeBuffer");
        processed = 0;
        v6 = SSLRead(self->sslContext, v5, v12[3], &processed);
        if (processed)
          -[_DT_GCDAsyncSocketPreBuffer didWrite:](self->preBuffer, "didWrite:");
        if (v6)
          break;
        ((void (*)(void (**)(void)))v4[2])(v4);
      }

      _Block_object_dispose(&v11, 8);
    }
  }
}

- (void)doReadData
{
  BOOL v3;
  unint64_t socketFDBytesAvailable;
  unint64_t v6;
  int v7;
  unsigned int flags;
  _DT_GCDAsyncReadPacket *currentRead;
  uint64_t v10;
  size_t v11;
  void *v12;
  _DT_GCDAsyncReadPacket *v13;
  unint64_t readLength;
  BOOL v15;
  unsigned int v16;
  int v17;
  int v18;
  _BOOL4 v19;
  _DT_GCDAsyncReadPacket *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t maxLength;
  CFIndex v24;
  char *v25;
  uint64_t v26;
  unint64_t v27;
  size_t v28;
  int socket4FD;
  unint64_t v30;
  size_t v31;
  unint64_t v32;
  int v33;
  unint64_t v34;
  CFIndex v35;
  uint64_t v36;
  BOOL v37;
  _DT_GCDAsyncReadPacket *v38;
  BOOL v39;
  _DT_GCDAsyncReadPacket *v40;
  id WeakRetained;
  int64_t tag;
  NSObject *delegateQueue;
  size_t v44;
  uint64_t v45;
  size_t v46;
  _DT_GCDAsyncReadPacket *v47;
  unint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(uint64_t);
  void *v55;
  id v56;
  _DT_GCDAsyncSocket *v57;
  size_t v58;
  int64_t v59;
  char v60;
  BOOL v61;
  size_t bufferSize;

  if (self->currentRead)
    v3 = (self->flags & 8) == 0;
  else
    v3 = 0;
  if (!v3)
  {
    if ((self->flags & 0x2000) != 0)
      -[_DT_GCDAsyncSocket flushSSLBuffers](self, "flushSSLBuffers");
    if (!-[_DT_GCDAsyncSocket usingCFStreamForTLS](self, "usingCFStreamForTLS"))
    {
      if (self->socketFDBytesAvailable)
        -[_DT_GCDAsyncSocket suspendReadSource](self, "suspendReadSource");
    }
    return;
  }
  if (-[_DT_GCDAsyncSocket usingCFStreamForTLS](self, "usingCFStreamForTLS"))
  {
    if ((self->flags & 0x80000) != 0 && CFReadStreamHasBytesAvailable(self->readStream))
    {
      socketFDBytesAvailable = 0;
LABEL_17:
      v7 = 1;
      goto LABEL_20;
    }
  }
  else
  {
    socketFDBytesAvailable = self->socketFDBytesAvailable;
    if ((self->flags & 0x2000) != 0)
    {
      v6 = -[_DT_GCDAsyncSocketPreBuffer availableBytes](self->sslPreBuffer, "availableBytes");
      bufferSize = 0;
      SSLGetBufferedReadSize(self->sslContext, &bufferSize);
      socketFDBytesAvailable += v6 + bufferSize;
    }
    if (socketFDBytesAvailable)
      goto LABEL_17;
  }
  if (!-[_DT_GCDAsyncSocketPreBuffer availableBytes](self->preBuffer, "availableBytes"))
  {
LABEL_135:
    if (!-[_DT_GCDAsyncSocket usingCFStreamForTLS](self, "usingCFStreamForTLS", v52, v53, v54, v55))
      -[_DT_GCDAsyncSocket resumeReadSource](self, "resumeReadSource");
    return;
  }
  v7 = 0;
  socketFDBytesAvailable = 0;
LABEL_20:
  flags = self->flags;
  if ((flags & 0x800) == 0)
  {
    v61 = 0;
    if (-[_DT_GCDAsyncSocketPreBuffer availableBytes](self->preBuffer, "availableBytes"))
    {
      currentRead = self->currentRead;
      if (currentRead->term)
        v10 = -[_DT_GCDAsyncReadPacket readLengthForTermWithPreBuffer:found:](self->currentRead, "readLengthForTermWithPreBuffer:found:", self->preBuffer, &v61);
      else
        v10 = -[_DT_GCDAsyncReadPacket readLengthForNonTermWithHint:](currentRead, "readLengthForNonTermWithHint:", -[_DT_GCDAsyncSocketPreBuffer availableBytes](self->preBuffer, "availableBytes"));
      v11 = v10;
      -[_DT_GCDAsyncReadPacket ensureCapacityForAdditionalDataOfLength:](self->currentRead, "ensureCapacityForAdditionalDataOfLength:", v10);
      memcpy(-[NSMutableData mutableBytes](self->currentRead->buffer, "mutableBytes")+ self->currentRead->startOffset+ self->currentRead->bytesDone, -[_DT_GCDAsyncSocketPreBuffer readBuffer](self->preBuffer, "readBuffer"), v11);
      -[_DT_GCDAsyncSocketPreBuffer didRead:](self->preBuffer, "didRead:", v11);
      self->currentRead->bytesDone += v11;
      v13 = self->currentRead;
      readLength = v13->readLength;
      if (readLength)
      {
        v12 = 0;
        v15 = v13->bytesDone == readLength;
LABEL_34:
        v61 = v15;
        goto LABEL_35;
      }
      if (!v13->term)
      {
        maxLength = v13->maxLength;
        if (maxLength)
          v15 = v13->bytesDone == maxLength;
        else
          v15 = 0;
        v12 = 0;
        goto LABEL_34;
      }
      if (!v61)
      {
        v22 = v13->maxLength;
        if (v22)
        {
          if (v13->bytesDone >= v22)
          {
            -[_DT_GCDAsyncSocket readMaxedOutError](self, "readMaxedOutError");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_35;
          }
        }
      }
    }
    else
    {
      v11 = 0;
    }
    v12 = 0;
LABEL_35:
    v16 = self->flags & 0x4000;
    if (v61 || v12)
    {
      v18 = 0;
      v19 = v16 != 0;
      if (v61)
        goto LABEL_128;
    }
    else
    {
      v17 = v7 ^ 1;
      if (v16)
        v18 = 0;
      else
        v18 = v7 ^ 1;
      v19 = v16 != 0;
      if (v16)
      {
        v12 = 0;
        v18 = 0;
      }
      else
      {
        if (v7)
        {
          if (-[_DT_GCDAsyncSocketPreBuffer availableBytes](self->preBuffer, "availableBytes"))
          {
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDAsyncSocket.m"), 4371, CFSTR("Invalid logic"));

          }
          v60 = 0;
          if ((self->flags & 0x2000) != 0)
          {
            if (-[_DT_GCDAsyncSocket usingCFStreamForTLS](self, "usingCFStreamForTLS"))
            {
              v24 = -[_DT_GCDAsyncReadPacket optimalReadLengthWithDefault:shouldPreBuffer:](self->currentRead, "optimalReadLengthWithDefault:shouldPreBuffer:", 0x8000, &v60);
              if (v60)
              {
                -[_DT_GCDAsyncSocketPreBuffer ensureCapacityForWrite:](self->preBuffer, "ensureCapacityForWrite:", v24);
                v25 = -[_DT_GCDAsyncSocketPreBuffer writeBuffer](self->preBuffer, "writeBuffer");
              }
              else
              {
                -[_DT_GCDAsyncReadPacket ensureCapacityForAdditionalDataOfLength:](self->currentRead, "ensureCapacityForAdditionalDataOfLength:", v24);
                v25 = (char *)(-[NSMutableData mutableBytes](self->currentRead->buffer, "mutableBytes")
                             + self->currentRead->startOffset
                             + self->currentRead->bytesDone);
              }
              v35 = CFReadStreamRead(self->readStream, (UInt8 *)v25, v24);
              if (v35 < 0)
              {
                v19 = 0;
                v12 = CFReadStreamCopyError(self->readStream);
                v31 = 0;
                v18 = 0;
              }
              else
              {
                v31 = v35;
                v12 = 0;
                if (v35)
                  v18 = 1;
                else
                  v18 = v17;
                v19 = v35 == 0;
              }
              self->flags &= ~0x80000u;
            }
            else
            {
              if (socketFDBytesAvailable <= 0x8000)
                v26 = 0x8000;
              else
                v26 = socketFDBytesAvailable + 0x4000;
              v27 = -[_DT_GCDAsyncReadPacket optimalReadLengthWithDefault:shouldPreBuffer:](self->currentRead, "optimalReadLengthWithDefault:shouldPreBuffer:", v26, &v60);
              if (v60)
              {
                -[_DT_GCDAsyncSocketPreBuffer ensureCapacityForWrite:](self->preBuffer, "ensureCapacityForWrite:", v27);
                v25 = -[_DT_GCDAsyncSocketPreBuffer writeBuffer](self->preBuffer, "writeBuffer");
              }
              else
              {
                -[_DT_GCDAsyncReadPacket ensureCapacityForAdditionalDataOfLength:](self->currentRead, "ensureCapacityForAdditionalDataOfLength:", v27);
                v25 = (char *)(-[NSMutableData mutableBytes](self->currentRead->buffer, "mutableBytes")
                             + self->currentRead->startOffset
                             + self->currentRead->bytesDone);
              }
              v31 = 0;
              do
              {
                bufferSize = 0;
                v36 = SSLRead(self->sslContext, &v25[v31], v27 - v31, &bufferSize);
                v31 += bufferSize;
                if ((_DWORD)v36)
                  v37 = 1;
                else
                  v37 = v31 >= v27;
              }
              while (!v37);
              v12 = 0;
              v19 = 0;
              if ((_DWORD)v36 == -9803)
              {
                v18 = 1;
              }
              else if ((_DWORD)v36)
              {
                if (v36 >> 1 == 2147478745)
                {
                  v12 = 0;
                  self->sslErrCode = v36;
                  v19 = 1;
                }
                else
                {
                  -[_DT_GCDAsyncSocket sslError:](self, "sslError:", v36);
                  v12 = (void *)objc_claimAutoreleasedReturnValue();
                }
              }
            }
            if (!v31)
            {
LABEL_115:
              if (v61)
                goto LABEL_128;
              goto LABEL_116;
            }
          }
          else
          {
            v20 = self->currentRead;
            if (v20->term)
              v21 = -[_DT_GCDAsyncReadPacket readLengthForTermWithHint:shouldPreBuffer:](v20, "readLengthForTermWithHint:shouldPreBuffer:", socketFDBytesAvailable, &v60);
            else
              v21 = -[_DT_GCDAsyncReadPacket readLengthForNonTermWithHint:](v20, "readLengthForNonTermWithHint:", socketFDBytesAvailable);
            v28 = v21;
            if (v60)
            {
              -[_DT_GCDAsyncSocketPreBuffer ensureCapacityForWrite:](self->preBuffer, "ensureCapacityForWrite:", v21);
              v25 = -[_DT_GCDAsyncSocketPreBuffer writeBuffer](self->preBuffer, "writeBuffer");
            }
            else
            {
              -[_DT_GCDAsyncReadPacket ensureCapacityForAdditionalDataOfLength:](self->currentRead, "ensureCapacityForAdditionalDataOfLength:", v21);
              v25 = (char *)(-[NSMutableData mutableBytes](self->currentRead->buffer, "mutableBytes")
                           + self->currentRead->startOffset
                           + self->currentRead->bytesDone);
            }
            socket4FD = self->socket4FD;
            if (socket4FD == -1)
              socket4FD = self->socket6FD;
            v30 = read(socket4FD, v25, v28);
            if ((v30 & 0x8000000000000000) != 0)
            {
              v33 = *__error();
              v18 = v33 == 35;
              if (v33 == 35)
              {
                v12 = 0;
              }
              else
              {
                -[_DT_GCDAsyncSocket errnoErrorWithReason:](self, "errnoErrorWithReason:", CFSTR("Error in read() function"));
                v12 = (void *)objc_claimAutoreleasedReturnValue();
              }
              v19 = 0;
              self->socketFDBytesAvailable = 0;
              goto LABEL_115;
            }
            v31 = v30;
            if (!v30)
            {
              v18 = 0;
              v12 = 0;
              self->socketFDBytesAvailable = 0;
              v19 = 1;
              goto LABEL_115;
            }
            if (v30 >= v28)
            {
              v34 = self->socketFDBytesAvailable;
              v37 = v34 >= v30;
              v32 = v34 - v30;
              if (!v37)
                v32 = 0;
            }
            else
            {
              v32 = 0;
            }
            v12 = 0;
            v19 = 0;
            self->socketFDBytesAvailable = v32;
            if (v32)
              v18 = v17;
            else
              v18 = 1;
          }
          v38 = self->currentRead;
          if (v38->readLength)
          {
            if (v60)
            {
              objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDAsyncSocket.m"), 4645, CFSTR("Invalid logic"));

              v38 = self->currentRead;
            }
            v38->bytesDone += v31;
            v11 += v31;
            v39 = self->currentRead->bytesDone == self->currentRead->readLength;
LABEL_114:
            v61 = v39;
            goto LABEL_115;
          }
          if (!v38->term)
          {
            if (v60)
            {
              -[_DT_GCDAsyncSocketPreBuffer didWrite:](self->preBuffer, "didWrite:", v31);
              -[_DT_GCDAsyncReadPacket ensureCapacityForAdditionalDataOfLength:](self->currentRead, "ensureCapacityForAdditionalDataOfLength:", v31);
              memcpy(-[NSMutableData mutableBytes](self->currentRead->buffer, "mutableBytes")+ self->currentRead->startOffset+ self->currentRead->bytesDone, -[_DT_GCDAsyncSocketPreBuffer readBuffer](self->preBuffer, "readBuffer"), v31);
              -[_DT_GCDAsyncSocketPreBuffer didRead:](self->preBuffer, "didRead:", v31);
              v38 = self->currentRead;
            }
            v38->bytesDone += v31;
            v11 += v31;
            v39 = 1;
            goto LABEL_114;
          }
          if (v60)
          {
            -[_DT_GCDAsyncSocketPreBuffer didWrite:](self->preBuffer, "didWrite:", v31);
            v44 = -[_DT_GCDAsyncReadPacket readLengthForTermWithPreBuffer:found:](self->currentRead, "readLengthForTermWithPreBuffer:found:", self->preBuffer, &v61);
            -[_DT_GCDAsyncReadPacket ensureCapacityForAdditionalDataOfLength:](self->currentRead, "ensureCapacityForAdditionalDataOfLength:", v44);
            memcpy(-[NSMutableData mutableBytes](self->currentRead->buffer, "mutableBytes")+ self->currentRead->startOffset+ self->currentRead->bytesDone, -[_DT_GCDAsyncSocketPreBuffer readBuffer](self->preBuffer, "readBuffer"), v44);
            -[_DT_GCDAsyncSocketPreBuffer didRead:](self->preBuffer, "didRead:", v44);
            self->currentRead->bytesDone += v44;
            v11 += v44;
            if (v61)
              goto LABEL_115;
            goto LABEL_150;
          }
          v45 = -[_DT_GCDAsyncReadPacket searchForTermAfterPreBuffering:](v38, "searchForTermAfterPreBuffering:", v31);
          if (v45)
          {
            v46 = v45;
            if (v45 < 1)
            {
              self->currentRead->bytesDone += v31;
              v61 = 0;
              v11 += v31;
LABEL_150:
              v47 = self->currentRead;
              v48 = v47->maxLength;
              if (v48 && v47->bytesDone >= v48)
              {
                -[_DT_GCDAsyncSocket readMaxedOutError](self, "readMaxedOutError");
                v49 = objc_claimAutoreleasedReturnValue();

                v12 = (void *)v49;
              }
              goto LABEL_115;
            }
            v31 -= v45;
            -[_DT_GCDAsyncSocketPreBuffer ensureCapacityForWrite:](self->preBuffer, "ensureCapacityForWrite:", v45);
            memcpy(-[_DT_GCDAsyncSocketPreBuffer writeBuffer](self->preBuffer, "writeBuffer"), &v25[v31], v46);
            -[_DT_GCDAsyncSocketPreBuffer didWrite:](self->preBuffer, "didWrite:", v46);
          }
          self->currentRead->bytesDone += v31;
          v61 = 1;
          v11 += v31;
          goto LABEL_115;
        }
        v12 = 0;
        v19 = 0;
        v18 = 1;
      }
    }
LABEL_116:
    v40 = self->currentRead;
    if (v40->readLength || v40->term)
    {
      if (v11)
      {
        WeakRetained = objc_loadWeakRetained(&self->delegate);
        if (self->delegateQueue && (objc_opt_respondsToSelector() & 1) != 0)
        {
          tag = self->currentRead->tag;
          delegateQueue = self->delegateQueue;
          v52 = MEMORY[0x24BDAC760];
          v53 = 3221225472;
          v54 = sub_222B513DC;
          v55 = &unk_24EB29940;
          v56 = WeakRetained;
          v57 = self;
          v58 = v11;
          v59 = tag;
          dispatch_async(delegateQueue, &v52);

        }
      }
LABEL_123:
      if (!v12)
      {
        if (!v19)
        {
          if (!v18)
            return;
          goto LABEL_135;
        }
LABEL_133:
        -[_DT_GCDAsyncSocket doReadEOF](self, "doReadEOF", v52, v53, v54, v55);
        return;
      }
      goto LABEL_129;
    }
    v61 = v11 != 0;
    if (!v11)
      goto LABEL_123;
LABEL_128:
    -[_DT_GCDAsyncSocket completeCurrentRead](self, "completeCurrentRead");
    if (!v12)
    {
      if (!v19)
      {
        -[_DT_GCDAsyncSocket maybeDequeueRead](self, "maybeDequeueRead");
        if ((v18 & 1) == 0)
          return;
        goto LABEL_135;
      }
      if (-[_DT_GCDAsyncSocketPreBuffer availableBytes](self->preBuffer, "availableBytes"))
        -[_DT_GCDAsyncSocket maybeDequeueRead](self, "maybeDequeueRead");
      goto LABEL_133;
    }
LABEL_129:
    -[_DT_GCDAsyncSocket closeWithError:](self, "closeWithError:", v12, v52, v53, v54, v55);

    return;
  }
  if ((flags & 0x1000) != 0)
  {
    if (-[_DT_GCDAsyncSocket usingSecureTransportForTLS](self, "usingSecureTransportForTLS"))
      -[_DT_GCDAsyncSocket ssl_continueSSLHandshake](self, "ssl_continueSSLHandshake");
  }
  else if (!-[_DT_GCDAsyncSocket usingCFStreamForTLS](self, "usingCFStreamForTLS"))
  {
    -[_DT_GCDAsyncSocket suspendReadSource](self, "suspendReadSource");
  }
}

- (void)doReadEOF
{
  unsigned int flags;
  unsigned int v4;
  void *v5;
  int socket4FD;
  int sslErrCode;
  uint64_t v8;
  id WeakRetained;
  NSObject *delegateQueue;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  _DT_GCDAsyncSocket *v16;
  pollfd v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  flags = self->flags;
  LOWORD(v4) = flags | 0x4000;
  self->flags = flags | 0x4000;
  if ((flags & 0x2000) != 0)
  {
    -[_DT_GCDAsyncSocket flushSSLBuffers](self, "flushSSLBuffers");
    v4 = self->flags;
  }
  if ((v4 & 0x1800) != 0)
  {
    if (-[_DT_GCDAsyncSocket usingSecureTransportForTLS](self, "usingSecureTransportForTLS"))
    {
      -[_DT_GCDAsyncSocket sslError:](self, "sslError:", 4294957490);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
LABEL_20:
        -[_DT_GCDAsyncSocket closeWithError:](self, "closeWithError:", v5);

        return;
      }
    }
LABEL_15:
    if (-[_DT_GCDAsyncSocket usingSecureTransportForTLS](self, "usingSecureTransportForTLS")
      && (sslErrCode = self->sslErrCode, sslErrCode != -9805)
      && sslErrCode)
    {
      -[_DT_GCDAsyncSocket sslError:](self, "sslError:");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[_DT_GCDAsyncSocket connectionClosedError](self, "connectionClosedError");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v5 = (void *)v8;
    goto LABEL_20;
  }
  if ((v4 & 0x8000) == 0 && !-[_DT_GCDAsyncSocketPreBuffer availableBytes](self->preBuffer, "availableBytes"))
  {
    if ((self->config & 8) == 0)
      goto LABEL_15;
    socket4FD = self->socket4FD;
    if (socket4FD == -1)
      socket4FD = self->socket6FD;
    v17.fd = socket4FD;
    *(_DWORD *)&v17.events = 4;
    poll(&v17, 1u, 0);
    if ((v17.revents & 4) == 0)
      goto LABEL_15;
    self->flags |= 0x8000u;
    WeakRetained = objc_loadWeakRetained(&self->delegate);
    if (self->delegateQueue && (objc_opt_respondsToSelector() & 1) != 0)
    {
      delegateQueue = self->delegateQueue;
      v11 = MEMORY[0x24BDAC760];
      v12 = 3221225472;
      v13 = sub_222B515EC;
      v14 = &unk_24EB28350;
      v15 = WeakRetained;
      v16 = self;
      dispatch_async(delegateQueue, &v11);

    }
  }
  if (!-[_DT_GCDAsyncSocket usingCFStreamForTLS](self, "usingCFStreamForTLS", v11, v12, v13, v14))
    -[_DT_GCDAsyncSocket suspendReadSource](self, "suspendReadSource");
}

- (void)completeCurrentRead
{
  _DT_GCDAsyncReadPacket *currentRead;
  NSMutableData *buffer;
  NSMutableData *v5;
  unint64_t v6;
  _DT_GCDAsyncReadPacket *v7;
  unint64_t originalBufferLength;
  unint64_t bytesDone;
  unint64_t startOffset;
  unint64_t v11;
  uint64_t v12;
  NSMutableData *v13;
  id WeakRetained;
  _DT_GCDAsyncReadPacket *v15;
  NSObject *delegateQueue;
  _DT_GCDAsyncReadPacket *v17;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  _DT_GCDAsyncSocket *v25;
  NSMutableData *v26;
  _DT_GCDAsyncReadPacket *v27;

  currentRead = self->currentRead;
  if (!currentRead)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDAsyncSocket.m"), 4995, CFSTR("Trying to complete current read when there is no current read."));

    currentRead = self->currentRead;
  }
  buffer = currentRead->buffer;
  if (currentRead->bufferOwner)
  {
    -[NSMutableData setLength:](buffer, "setLength:", currentRead->bytesDone);
    v5 = self->currentRead->buffer;
  }
  else
  {
    v6 = -[NSMutableData length](buffer, "length");
    v7 = self->currentRead;
    originalBufferLength = v7->originalBufferLength;
    if (v6 > originalBufferLength)
    {
      startOffset = v7->startOffset;
      bytesDone = v7->bytesDone;
      if (bytesDone + startOffset <= originalBufferLength)
        v11 = v7->originalBufferLength;
      else
        v11 = bytesDone + startOffset;
      -[NSMutableData setLength:](v7->buffer, "setLength:", v11);
      v7 = self->currentRead;
    }
    v12 = -[NSMutableData mutableBytes](v7->buffer, "mutableBytes");
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v12 + self->currentRead->startOffset, self->currentRead->bytesDone, 0);
    v5 = (NSMutableData *)objc_claimAutoreleasedReturnValue();
  }
  v13 = v5;
  WeakRetained = objc_loadWeakRetained(&self->delegate);
  if (self->delegateQueue && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v15 = self->currentRead;
    delegateQueue = self->delegateQueue;
    v20 = MEMORY[0x24BDAC760];
    v21 = 3221225472;
    v22 = sub_222B517D0;
    v23 = &unk_24EB29968;
    v24 = WeakRetained;
    v25 = self;
    v26 = v13;
    v27 = v15;
    v17 = v15;
    dispatch_async(delegateQueue, &v20);

  }
  -[_DT_GCDAsyncSocket endCurrentRead](self, "endCurrentRead", v20, v21, v22, v23);

}

- (void)endCurrentRead
{
  NSObject *readTimer;
  OS_dispatch_source *v4;
  _DT_GCDAsyncReadPacket *currentRead;

  readTimer = self->readTimer;
  if (readTimer)
  {
    dispatch_source_cancel(readTimer);
    v4 = self->readTimer;
    self->readTimer = 0;

  }
  currentRead = self->currentRead;
  self->currentRead = 0;

}

- (void)setupReadTimerWithTimeout:(double)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  OS_dispatch_source *v9;
  OS_dispatch_source *readTimer;
  NSObject *v11;
  dispatch_time_t v12;
  _QWORD v13[4];
  id v14;
  id location[9];

  if (a3 >= 0.0)
  {
    location[1] = v6;
    location[2] = v5;
    location[7] = v3;
    location[8] = v4;
    v9 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->socketQueue);
    readTimer = self->readTimer;
    self->readTimer = v9;

    objc_initWeak(location, self);
    v11 = self->readTimer;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = sub_222B51948;
    v13[3] = &unk_24EB28000;
    objc_copyWeak(&v14, location);
    dispatch_source_set_event_handler(v11, v13);
    v12 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer((dispatch_source_t)self->readTimer, v12, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)self->readTimer);
    objc_destroyWeak(&v14);
    objc_destroyWeak(location);
  }
}

- (void)doReadTimeout
{
  id WeakRetained;
  _DT_GCDAsyncReadPacket *v4;
  NSObject *delegateQueue;
  _DT_GCDAsyncReadPacket *v6;
  _QWORD block[4];
  id v8;
  _DT_GCDAsyncSocket *v9;
  _DT_GCDAsyncReadPacket *v10;

  self->flags |= 8u;
  WeakRetained = objc_loadWeakRetained(&self->delegate);
  if (self->delegateQueue && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = self->currentRead;
    delegateQueue = self->delegateQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_222B51A70;
    block[3] = &unk_24EB296C8;
    v8 = WeakRetained;
    v9 = self;
    v10 = v4;
    v6 = v4;
    dispatch_async(delegateQueue, block);

  }
  else
  {
    -[_DT_GCDAsyncSocket doReadTimeoutWithExtension:](self, "doReadTimeoutWithExtension:", 0.0);
  }

}

- (void)doReadTimeoutWithExtension:(double)a3
{
  _DT_GCDAsyncReadPacket *currentRead;
  dispatch_time_t v5;
  id v6;

  currentRead = self->currentRead;
  if (currentRead)
  {
    if (a3 <= 0.0)
    {
      -[_DT_GCDAsyncSocket readTimeoutError](self, "readTimeoutError");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[_DT_GCDAsyncSocket closeWithError:](self, "closeWithError:", v6);

    }
    else
    {
      currentRead->timeout = currentRead->timeout + a3;
      v5 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
      dispatch_source_set_timer((dispatch_source_t)self->readTimer, v5, 0xFFFFFFFFFFFFFFFFLL, 0);
      self->flags &= ~8u;
      -[_DT_GCDAsyncSocket doReadData](self, "doReadData");
    }
  }
}

- (void)writeData:(id)a3 withTimeout:(double)a4 tag:(int64_t)a5
{
  id v8;
  _DT_GCDAsyncWritePacket *v9;
  NSObject *socketQueue;
  _DT_GCDAsyncWritePacket *v11;
  _QWORD v12[5];
  _DT_GCDAsyncWritePacket *v13;

  v8 = a3;
  if (objc_msgSend(v8, "length"))
  {
    v9 = -[_DT_GCDAsyncWritePacket initWithData:timeout:tag:]([_DT_GCDAsyncWritePacket alloc], "initWithData:timeout:tag:", v8, a5, a4);
    socketQueue = self->socketQueue;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = sub_222B51CB0;
    v12[3] = &unk_24EB28350;
    v12[4] = self;
    v13 = v9;
    v11 = v9;
    dispatch_async(socketQueue, v12);

  }
}

- (float)progressOfWriteReturningTag:(int64_t *)a3 bytesDone:(unint64_t *)a4 total:(unint64_t *)a5
{
  void (**v6)(_QWORD);
  float v7;
  _QWORD aBlock[9];
  uint64_t v10;
  float *v11;
  uint64_t v12;
  int v13;

  v10 = 0;
  v11 = (float *)&v10;
  v12 = 0x2020000000;
  v13 = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_222B51DE8;
  aBlock[3] = &unk_24EB29918;
  aBlock[6] = a3;
  aBlock[7] = a4;
  aBlock[8] = a5;
  aBlock[4] = self;
  aBlock[5] = &v10;
  v6 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
    v6[2](v6);
  else
    dispatch_sync((dispatch_queue_t)self->socketQueue, v6);
  v7 = v11[6];

  _Block_object_dispose(&v10, 8);
  return v7;
}

- (void)maybeDequeueWrite
{
  _DT_GCDAsyncWritePacket *v4;
  _DT_GCDAsyncWritePacket *currentWrite;
  unsigned int flags;
  void *v7;

  if (!dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDAsyncSocket.m"), 5230, CFSTR("Must be dispatched on socketQueue"));

  }
  if (!self->currentWrite && (self->flags & 2) != 0)
  {
    if (-[NSMutableArray count](self->writeQueue, "count"))
    {
      -[NSMutableArray objectAtIndex:](self->writeQueue, "objectAtIndex:", 0);
      v4 = (_DT_GCDAsyncWritePacket *)objc_claimAutoreleasedReturnValue();
      currentWrite = self->currentWrite;
      self->currentWrite = v4;

      -[NSMutableArray removeObjectAtIndex:](self->writeQueue, "removeObjectAtIndex:", 0);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        self->flags |= 0x1000u;
        MEMORY[0x24BEDD108](self, sel_maybeStartTLS);
      }
      else
      {
        -[_DT_GCDAsyncSocket setupWriteTimerWithTimeout:](self, "setupWriteTimerWithTimeout:", self->currentWrite->timeout);
        -[_DT_GCDAsyncSocket doWriteData](self, "doWriteData");
      }
    }
    else
    {
      flags = self->flags;
      if ((flags & 0x40) != 0
        && ((flags & 0x20) == 0 || !-[NSMutableArray count](self->readQueue, "count") && !self->currentRead))
      {
        -[_DT_GCDAsyncSocket closeWithError:](self, "closeWithError:", 0);
      }
    }
  }
}

- (void)doWriteData
{
  _DT_GCDAsyncWritePacket *currentWrite;
  unsigned int flags;
  int socket4FD;
  ssize_t v6;
  unint64_t sslWriteCachedLength;
  char v8;
  void *v9;
  CFIndex v10;
  uint64_t v11;
  NSUInteger v12;
  _DT_GCDAsyncWritePacket *v13;
  uint64_t v14;
  char *v15;
  NSUInteger v16;
  size_t v17;
  uint64_t v18;
  int v19;
  _DT_GCDAsyncWritePacket *v20;
  unint64_t bytesDone;
  NSObject *socketQueue;
  char v23;
  id WeakRetained;
  int64_t tag;
  NSObject *delegateQueue;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t);
  void *v31;
  id v32;
  _DT_GCDAsyncSocket *v33;
  unint64_t v34;
  int64_t v35;
  _QWORD block[5];
  size_t processed;

  currentWrite = self->currentWrite;
  if (!currentWrite || (flags = self->flags, (flags & 0x10) != 0))
  {
    if (-[_DT_GCDAsyncSocket usingCFStreamForTLS](self, "usingCFStreamForTLS") || (self->flags & 0x80) == 0)
      return;
    goto LABEL_8;
  }
  if ((flags & 0x80) == 0)
  {
    if (!-[_DT_GCDAsyncSocket usingCFStreamForTLS](self, "usingCFStreamForTLS"))
      -[_DT_GCDAsyncSocket resumeWriteSource](self, "resumeWriteSource");
    return;
  }
  if ((flags & 0x1000) != 0)
  {
    if ((flags & 0x800) != 0)
    {
      if (-[_DT_GCDAsyncSocket usingSecureTransportForTLS](self, "usingSecureTransportForTLS"))
        -[_DT_GCDAsyncSocket ssl_continueSSLHandshake](self, "ssl_continueSSLHandshake");
      return;
    }
    if (-[_DT_GCDAsyncSocket usingCFStreamForTLS](self, "usingCFStreamForTLS"))
      return;
LABEL_8:
    -[_DT_GCDAsyncSocket suspendWriteSource](self, "suspendWriteSource");
    return;
  }
  if ((flags & 0x2000) == 0)
  {
    socket4FD = self->socket4FD;
    if (socket4FD == -1)
      socket4FD = self->socket6FD;
    v6 = write(socket4FD, -[NSData bytes](currentWrite->buffer, "bytes") + self->currentWrite->bytesDone, -[NSData length](self->currentWrite->buffer, "length") - self->currentWrite->bytesDone);
    if ((v6 & 0x8000000000000000) == 0)
    {
      sslWriteCachedLength = v6;
LABEL_15:
      v8 = 0;
      v9 = 0;
      goto LABEL_54;
    }
    if (*__error() == 35)
    {
      v9 = 0;
      sslWriteCachedLength = 0;
      goto LABEL_51;
    }
    -[_DT_GCDAsyncSocket errnoErrorWithReason:](self, "errnoErrorWithReason:", CFSTR("Error in write() function"));
    v14 = objc_claimAutoreleasedReturnValue();
LABEL_41:
    v9 = (void *)v14;
    sslWriteCachedLength = 0;
    v8 = 0;
    goto LABEL_58;
  }
  if (!-[_DT_GCDAsyncSocket usingCFStreamForTLS](self, "usingCFStreamForTLS"))
  {
    if (self->sslWriteCachedLength)
    {
      processed = 0;
      v11 = SSLWrite(self->sslContext, 0, 0, &processed);
      if ((_DWORD)v11 == -9803)
      {
        v9 = 0;
        v19 = 1;
      }
      else
      {
        if (!(_DWORD)v11)
        {
          sslWriteCachedLength = self->sslWriteCachedLength;
          self->sslWriteCachedLength = 0;
          v12 = -[NSData length](self->currentWrite->buffer, "length", v11);
          v13 = self->currentWrite;
          if (v12 == v13->bytesDone + sslWriteCachedLength)
            goto LABEL_15;
          goto LABEL_33;
        }
        -[_DT_GCDAsyncSocket sslError:](self, "sslError:", v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 0;
      }
      sslWriteCachedLength = 0;
      goto LABEL_49;
    }
    sslWriteCachedLength = 0;
    v13 = self->currentWrite;
LABEL_33:
    v15 = (char *)(-[NSData bytes](v13->buffer, "bytes") + self->currentWrite->bytesDone + sslWriteCachedLength);
    v16 = -[NSData length](self->currentWrite->buffer, "length")
        - (sslWriteCachedLength
         + self->currentWrite->bytesDone);
    while (1)
    {
      v17 = v16 >= 0x8000 ? 0x8000 : v16;
      processed = 0;
      v18 = SSLWrite(self->sslContext, v15, v17, &processed);
      if ((_DWORD)v18)
        break;
      v15 += processed;
      sslWriteCachedLength += processed;
      v16 -= processed;
      if (!v16)
      {
        v9 = 0;
        goto LABEL_48;
      }
    }
    if ((_DWORD)v18 == -9803)
    {
      v9 = 0;
      self->sslWriteCachedLength = v17;
      v19 = 1;
      goto LABEL_49;
    }
    -[_DT_GCDAsyncSocket sslError:](self, "sslError:", v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_48:
    v19 = 0;
LABEL_49:
    if (!v19)
    {
      v8 = 0;
      goto LABEL_54;
    }
    goto LABEL_51;
  }
  v10 = CFWriteStreamWrite(self->writeStream, (const UInt8 *)(-[NSData bytes](self->currentWrite->buffer, "bytes") + self->currentWrite->bytesDone), -[NSData length](self->currentWrite->buffer, "length") - self->currentWrite->bytesDone);
  if (v10 < 0)
  {
    v14 = (uint64_t)CFWriteStreamCopyError(self->writeStream);
    goto LABEL_41;
  }
  sslWriteCachedLength = v10;
  v9 = 0;
LABEL_51:
  self->flags &= ~0x80u;
  if (!-[_DT_GCDAsyncSocket usingCFStreamForTLS](self, "usingCFStreamForTLS"))
    -[_DT_GCDAsyncSocket resumeWriteSource](self, "resumeWriteSource");
  v8 = 1;
LABEL_54:
  if (!sslWriteCachedLength)
  {
LABEL_58:
    v23 = 1;
    if ((v8 & 1) != 0)
      goto LABEL_64;
    goto LABEL_61;
  }
  self->currentWrite->bytesDone += sslWriteCachedLength;
  v20 = self->currentWrite;
  bytesDone = v20->bytesDone;
  if (bytesDone == -[NSData length](v20->buffer, "length"))
  {
    -[_DT_GCDAsyncSocket completeCurrentWrite](self, "completeCurrentWrite");
    if (!v9)
    {
      socketQueue = self->socketQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = sub_222B524AC;
      block[3] = &unk_24EB27E30;
      block[4] = self;
      dispatch_async(socketQueue, block);
      return;
    }
    goto LABEL_70;
  }
  v23 = 0;
  if ((v8 & 1) != 0)
    goto LABEL_64;
LABEL_61:
  if (!v9)
  {
    self->flags &= ~0x80u;
    if (!-[_DT_GCDAsyncSocket usingCFStreamForTLS](self, "usingCFStreamForTLS"))
      -[_DT_GCDAsyncSocket resumeWriteSource](self, "resumeWriteSource");
  }
LABEL_64:
  if ((v23 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained(&self->delegate);
    if (self->delegateQueue && (objc_opt_respondsToSelector() & 1) != 0)
    {
      tag = self->currentWrite->tag;
      delegateQueue = self->delegateQueue;
      v28 = MEMORY[0x24BDAC760];
      v29 = 3221225472;
      v30 = sub_222B524DC;
      v31 = &unk_24EB29940;
      v32 = WeakRetained;
      v33 = self;
      v34 = sslWriteCachedLength;
      v35 = tag;
      dispatch_async(delegateQueue, &v28);

    }
  }
  if (v9)
  {
LABEL_70:
    -[_DT_GCDAsyncSocket errnoErrorWithReason:](self, "errnoErrorWithReason:", CFSTR("Error in write() function"), v28, v29, v30, v31);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DT_GCDAsyncSocket closeWithError:](self, "closeWithError:", v27);

  }
}

- (void)completeCurrentWrite
{
  id WeakRetained;
  int64_t tag;
  NSObject *delegateQueue;
  void *v7;
  _QWORD block[4];
  id v9;
  _DT_GCDAsyncSocket *v10;
  int64_t v11;

  if (!self->currentWrite)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDAsyncSocket.m"), 5669, CFSTR("Trying to complete current write when there is no current write."));

  }
  WeakRetained = objc_loadWeakRetained(&self->delegate);
  if (self->delegateQueue && (objc_opt_respondsToSelector() & 1) != 0)
  {
    tag = self->currentWrite->tag;
    delegateQueue = self->delegateQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_222B52610;
    block[3] = &unk_24EB29990;
    v9 = WeakRetained;
    v10 = self;
    v11 = tag;
    dispatch_async(delegateQueue, block);

  }
  -[_DT_GCDAsyncSocket endCurrentWrite](self, "endCurrentWrite");

}

- (void)endCurrentWrite
{
  NSObject *writeTimer;
  OS_dispatch_source *v4;
  _DT_GCDAsyncWritePacket *currentWrite;

  writeTimer = self->writeTimer;
  if (writeTimer)
  {
    dispatch_source_cancel(writeTimer);
    v4 = self->writeTimer;
    self->writeTimer = 0;

  }
  currentWrite = self->currentWrite;
  self->currentWrite = 0;

}

- (void)setupWriteTimerWithTimeout:(double)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  OS_dispatch_source *v9;
  OS_dispatch_source *writeTimer;
  NSObject *v11;
  dispatch_time_t v12;
  _QWORD v13[4];
  id v14;
  id location[9];

  if (a3 >= 0.0)
  {
    location[1] = v6;
    location[2] = v5;
    location[7] = v3;
    location[8] = v4;
    v9 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->socketQueue);
    writeTimer = self->writeTimer;
    self->writeTimer = v9;

    objc_initWeak(location, self);
    v11 = self->writeTimer;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = sub_222B52784;
    v13[3] = &unk_24EB28000;
    objc_copyWeak(&v14, location);
    dispatch_source_set_event_handler(v11, v13);
    v12 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer((dispatch_source_t)self->writeTimer, v12, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)self->writeTimer);
    objc_destroyWeak(&v14);
    objc_destroyWeak(location);
  }
}

- (void)doWriteTimeout
{
  id WeakRetained;
  _DT_GCDAsyncWritePacket *v4;
  NSObject *delegateQueue;
  _DT_GCDAsyncWritePacket *v6;
  _QWORD block[4];
  id v8;
  _DT_GCDAsyncSocket *v9;
  _DT_GCDAsyncWritePacket *v10;

  self->flags |= 0x10u;
  WeakRetained = objc_loadWeakRetained(&self->delegate);
  if (self->delegateQueue && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = self->currentWrite;
    delegateQueue = self->delegateQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_222B528AC;
    block[3] = &unk_24EB296C8;
    v8 = WeakRetained;
    v9 = self;
    v10 = v4;
    v6 = v4;
    dispatch_async(delegateQueue, block);

  }
  else
  {
    -[_DT_GCDAsyncSocket doWriteTimeoutWithExtension:](self, "doWriteTimeoutWithExtension:", 0.0);
  }

}

- (void)doWriteTimeoutWithExtension:(double)a3
{
  _DT_GCDAsyncWritePacket *currentWrite;
  dispatch_time_t v5;
  id v6;

  currentWrite = self->currentWrite;
  if (currentWrite)
  {
    if (a3 <= 0.0)
    {
      -[_DT_GCDAsyncSocket writeTimeoutError](self, "writeTimeoutError");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[_DT_GCDAsyncSocket closeWithError:](self, "closeWithError:", v6);

    }
    else
    {
      currentWrite->timeout = currentWrite->timeout + a3;
      v5 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
      dispatch_source_set_timer((dispatch_source_t)self->writeTimer, v5, 0xFFFFFFFFFFFFFFFFLL, 0);
      self->flags &= ~0x10u;
      -[_DT_GCDAsyncSocket doWriteData](self, "doWriteData");
    }
  }
}

- (void)startTLS:(id)a3
{
  id v4;
  _DT_GCDAsyncSpecialPacket *v5;
  NSObject *socketQueue;
  _DT_GCDAsyncSpecialPacket *v7;
  _QWORD v8[5];
  _DT_GCDAsyncSpecialPacket *v9;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = -[_DT_GCDAsyncSpecialPacket initWithTLSSettings:]([_DT_GCDAsyncSpecialPacket alloc], "initWithTLSSettings:", v4);
  socketQueue = self->socketQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_222B52AE0;
  v8[3] = &unk_24EB28350;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(socketQueue, v8);

}

- (void)maybeStartTLS
{
  _DT_GCDAsyncReadPacket *v3;
  _DT_GCDAsyncReadPacket *v4;
  void *v5;
  void *v6;
  char v7;

  if ((~self->flags & 0x1800) == 0)
  {
    v3 = self->currentRead;
    v4 = v3;
    if (v3)
      v3 = (_DT_GCDAsyncReadPacket *)v3->buffer;
    -[_DT_GCDAsyncReadPacket objectForKey:](v3, "objectForKey:", CFSTR("GCDAsyncSocketUseCFStreamForTLS"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = v5;
      v7 = objc_msgSend(v5, "BOOLValue");

      if ((v7 & 1) != 0)
      {
        MEMORY[0x24BEDD108](self, sel_cf_startTLS);
        return;
      }
    }
    else
    {

    }
    MEMORY[0x24BEDD108](self, sel_ssl_startTLS);
  }
}

- (int)sslReadWithBuffer:(void *)a3 length:(unint64_t *)a4
{
  unint64_t v7;
  unint64_t v8;
  size_t v9;
  unint64_t socketFDBytesAvailable;
  int socket6FD;
  size_t v12;
  char *v13;
  unint64_t v14;
  size_t v15;
  unint64_t v16;
  BOOL v17;
  unint64_t v18;
  int v20;

  if (!self->socketFDBytesAvailable
    && !-[_DT_GCDAsyncSocketPreBuffer availableBytes](self->sslPreBuffer, "availableBytes"))
  {
    -[_DT_GCDAsyncSocket resumeReadSource](self, "resumeReadSource");
    *a4 = 0;
    return -9803;
  }
  v7 = *a4;
  v8 = -[_DT_GCDAsyncSocketPreBuffer availableBytes](self->sslPreBuffer, "availableBytes");
  if (v8)
  {
    if (v8 >= v7)
      v9 = v7;
    else
      v9 = v8;
    memcpy(a3, -[_DT_GCDAsyncSocketPreBuffer readBuffer](self->sslPreBuffer, "readBuffer"), v9);
    -[_DT_GCDAsyncSocketPreBuffer didRead:](self->sslPreBuffer, "didRead:", v9);
    v7 -= v9;
    if (!v7)
    {
      *a4 = v9;
      return 0;
    }
  }
  else
  {
    v9 = 0;
  }
  socketFDBytesAvailable = self->socketFDBytesAvailable;
  if (!socketFDBytesAvailable)
  {
    *a4 = v9;
    return -9803;
  }
  socket6FD = self->socket6FD;
  if (socket6FD == -1)
    socket6FD = self->socket4FD;
  if (socketFDBytesAvailable <= v7)
  {
    v13 = (char *)a3 + v9;
    v12 = v7;
  }
  else
  {
    -[_DT_GCDAsyncSocketPreBuffer ensureCapacityForWrite:](self->sslPreBuffer, "ensureCapacityForWrite:", self->socketFDBytesAvailable);
    v12 = self->socketFDBytesAvailable;
    v13 = -[_DT_GCDAsyncSocketPreBuffer writeBuffer](self->sslPreBuffer, "writeBuffer");
  }
  v14 = read(socket6FD, v13, v12);
  if ((v14 & 0x8000000000000000) != 0)
  {
    v20 = *__error();
    self->socketFDBytesAvailable = 0;
    *a4 = v9;
    if (v20 != 35)
      return -9806;
    return -9803;
  }
  v15 = v14;
  if (v14)
  {
    v16 = self->socketFDBytesAvailable;
    v17 = v16 >= v14;
    v18 = v16 - v14;
    if (!v17)
      v18 = 0;
    self->socketFDBytesAvailable = v18;
    if (socketFDBytesAvailable > v7)
    {
      -[_DT_GCDAsyncSocketPreBuffer didWrite:](self->sslPreBuffer, "didWrite:", v14);
      if (v7 < v15)
        v15 = v7;
      memcpy((char *)a3 + v9, -[_DT_GCDAsyncSocketPreBuffer readBuffer](self->sslPreBuffer, "readBuffer"), v15);
      -[_DT_GCDAsyncSocketPreBuffer didRead:](self->sslPreBuffer, "didRead:", v15);
    }
    *a4 = v15 + v9;
    if (v7 == v15)
      return 0;
    return -9803;
  }
  self->socketFDBytesAvailable = 0;
  *a4 = v9;
  return -9806;
}

- (int)sslWriteWithBuffer:(const void *)a3 length:(unint64_t *)a4
{
  unint64_t v6;
  int socket4FD;
  ssize_t v8;
  int v10;

  if ((self->flags & 0x80) == 0)
  {
    -[_DT_GCDAsyncSocket resumeWriteSource](self, "resumeWriteSource", a3);
LABEL_14:
    *a4 = 0;
    return -9803;
  }
  v6 = *a4;
  socket4FD = self->socket4FD;
  if (socket4FD == -1)
    socket4FD = self->socket6FD;
  v8 = write(socket4FD, a3, *a4);
  if (v8 < 0)
  {
    v10 = *__error();
    self->flags &= ~0x80u;
    *a4 = 0;
    if (v10 == 35)
      return -9803;
    else
      return -9806;
  }
  else
  {
    if (!v8)
    {
      self->flags &= ~0x80u;
      goto LABEL_14;
    }
    *a4 = v8;
    if (v8 == v6)
      return 0;
    else
      return -9803;
  }
}

- (void)ssl_startTLS
{
  _DT_GCDAsyncReadPacket *v4;
  _DT_GCDAsyncReadPacket *v5;
  NSMutableData *v6;
  void *v7;
  int v8;
  SSLContext *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  id v16;
  const char *v17;
  size_t v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  SSLContext *sslContext;
  void *v27;
  void *v28;
  SSLProtocol v29;
  void *v30;
  SSLProtocol v31;
  void *v32;
  void *v33;
  void *v34;
  size_t v35;
  const SSLCipherSuite *v36;
  uint64_t i;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  _DT_GCDAsyncSocketPreBuffer *v50;
  _DT_GCDAsyncSocketPreBuffer *sslPreBuffer;
  unint64_t v52;
  size_t v53;
  uint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v4 = self->currentRead;
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDAsyncSocket.m"), 6125, CFSTR("Logic error"));

    -[_DT_GCDAsyncSocket otherError:](self, "otherError:", CFSTR("Logic error"));
    v6 = (NSMutableData *)objc_claimAutoreleasedReturnValue();
    -[_DT_GCDAsyncSocket closeWithError:](self, "closeWithError:", v6);
    goto LABEL_10;
  }
  v6 = v4->buffer;
  -[NSMutableData objectForKey:](v6, "objectForKey:", *MEMORY[0x24BDB77F0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  v9 = SSLCreateContext((CFAllocatorRef)*MEMORY[0x24BDBD240], (SSLProtocolSide)(v8 ^ 1), kSSLStreamType);
  self->sslContext = v9;
  if (!v9)
  {
    v10 = CFSTR("Error in SSLCreateContext");
    goto LABEL_9;
  }
  if (SSLSetIOFuncs(v9, (SSLReadFunc)sub_222B53940, (SSLWriteFunc)sub_222B539FC))
  {
    v10 = CFSTR("Error in SSLSetIOFuncs");
LABEL_9:
    -[_DT_GCDAsyncSocket otherError:](self, "otherError:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DT_GCDAsyncSocket closeWithError:](self, "closeWithError:", v12);

    goto LABEL_10;
  }
  if (SSLSetConnection(self->sslContext, self))
  {
    v10 = CFSTR("Error in SSLSetConnection");
    goto LABEL_9;
  }
  -[NSMutableData objectForKey:](v6, "objectForKey:", CFSTR("GCDAsyncSocketManuallyEvaluateTrust"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  if (v14)
  {
    if (v8)
    {
      v10 = CFSTR("Manual trust validation is not supported for server sockets");
      goto LABEL_9;
    }
    if (SSLSetSessionOption(self->sslContext, kSSLSessionOptionBreakOnServerAuth, 1u))
    {
      v10 = CFSTR("Error in SSLSetSessionOption");
      goto LABEL_9;
    }
  }
  -[NSMutableData objectForKey:](v6, "objectForKey:", *MEMORY[0x24BDB7810]);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = objc_retainAutorelease(v15);
    v17 = (const char *)objc_msgSend(v16, "UTF8String");
    v18 = strlen(v17);
    if (SSLSetPeerDomainName(self->sslContext, v17, v18))
    {
      v19 = CFSTR("Error in SSLSetPeerDomainName");
LABEL_28:
      -[_DT_GCDAsyncSocket otherError:](self, "otherError:", v19);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DT_GCDAsyncSocket closeWithError:](self, "closeWithError:", v24);

LABEL_29:
      goto LABEL_10;
    }
  }
  else if (v15)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDAsyncSocket.m"), 6251, CFSTR("Invalid value for kCFStreamSSLPeerName. Value must be of type NSString."));

    v21 = CFSTR("Invalid value for kCFStreamSSLPeerName.");
LABEL_21:
    -[_DT_GCDAsyncSocket otherError:](self, "otherError:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DT_GCDAsyncSocket closeWithError:](self, "closeWithError:", v22);

LABEL_22:
    goto LABEL_10;
  }
  -[NSMutableData objectForKey:](v6, "objectForKey:", *MEMORY[0x24BDB77E0]);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (SSLSetCertificate(self->sslContext, (CFArrayRef)v16))
    {
      v19 = CFSTR("Error in SSLSetCertificate");
      goto LABEL_28;
    }
  }
  else if (v16)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDAsyncSocket.m"), 6273, CFSTR("Invalid value for kCFStreamSSLCertificates. Value must be of type NSArray."));

    v19 = CFSTR("Invalid value for kCFStreamSSLCertificates.");
    goto LABEL_28;
  }
  -[NSMutableData objectForKey:](v6, "objectForKey:", CFSTR("GCDAsyncSocketSSLPeerID"));
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v25 = v15;
    sslContext = self->sslContext;
    v16 = objc_retainAutorelease(v25);
    if (SSLSetPeerID(sslContext, (const void *)objc_msgSend(v16, "bytes"), objc_msgSend(v16, "length")))
    {
      -[_DT_GCDAsyncSocket otherError:](self, "otherError:", CFSTR("Error in SSLSetPeerID"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DT_GCDAsyncSocket closeWithError:](self, "closeWithError:", v27);

      goto LABEL_29;
    }

    goto LABEL_36;
  }
  if (v15)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDAsyncSocket.m"), 6297, CFSTR("Invalid value for GCDAsyncSocketSSLPeerID. Value must be of type NSData. (You can convert strings to data using a method like [string dataUsingEncoding:NSUTF8StringEncoding])"));

    v21 = CFSTR("Invalid value for GCDAsyncSocketSSLPeerID.");
    goto LABEL_21;
  }
LABEL_36:
  -[NSMutableData objectForKey:](v6, "objectForKey:", CFSTR("GCDAsyncSocketSSLProtocolVersionMin"));
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v29 = objc_msgSend(v16, "intValue");
    if (v29 && SSLSetProtocolVersionMin(self->sslContext, v29))
    {
      v19 = CFSTR("Error in SSLSetProtocolVersionMin");
      goto LABEL_28;
    }
  }
  else if (v16)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDAsyncSocket.m"), 6321, CFSTR("Invalid value for GCDAsyncSocketSSLProtocolVersionMin. Value must be of type NSNumber."));

    v19 = CFSTR("Invalid value for GCDAsyncSocketSSLProtocolVersionMin.");
    goto LABEL_28;
  }
  -[NSMutableData objectForKey:](v6, "objectForKey:", CFSTR("GCDAsyncSocketSSLProtocolVersionMax"));
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v31 = objc_msgSend(v15, "intValue");
    if (v31 && SSLSetProtocolVersionMax(self->sslContext, v31))
    {
      v21 = CFSTR("Error in SSLSetProtocolVersionMax");
      goto LABEL_21;
    }
  }
  else if (v15)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDAsyncSocket.m"), 6345, CFSTR("Invalid value for GCDAsyncSocketSSLProtocolVersionMax. Value must be of type NSNumber."));

    v21 = CFSTR("Invalid value for GCDAsyncSocketSSLProtocolVersionMax.");
    goto LABEL_21;
  }
  -[NSMutableData objectForKey:](v6, "objectForKey:", CFSTR("GCDAsyncSocketSSLSessionOptionFalseStart"));
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (SSLSetSessionOption(self->sslContext, kSSLSessionOptionFalseStart, objc_msgSend(v16, "BOOLValue")))
    {
      v19 = CFSTR("Error in SSLSetSessionOption (kSSLSessionOptionFalseStart)");
      goto LABEL_28;
    }
  }
  else if (v16)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDAsyncSocket.m"), 6365, CFSTR("Invalid value for GCDAsyncSocketSSLSessionOptionFalseStart. Value must be of type NSNumber."));

    v19 = CFSTR("Invalid value for GCDAsyncSocketSSLSessionOptionFalseStart.");
    goto LABEL_28;
  }
  -[NSMutableData objectForKey:](v6, "objectForKey:", CFSTR("GCDAsyncSocketSSLSessionOptionSendOneByteRecord"));
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (SSLSetSessionOption(self->sslContext, kSSLSessionOptionSendOneByteRecord, objc_msgSend(v15, "BOOLValue")))
    {
      v21 = CFSTR("Error in SSLSetSessionOption (kSSLSessionOptionSendOneByteRecord)");
      goto LABEL_21;
    }
  }
  else if (v15)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDAsyncSocket.m"), 6387, CFSTR("Invalid value for GCDAsyncSocketSSLSessionOptionSendOneByteRecord. Value must be of type NSNumber."));

    v21 = CFSTR("Invalid value for GCDAsyncSocketSSLSessionOptionSendOneByteRecord.");
    goto LABEL_21;
  }
  -[NSMutableData objectForKey:](v6, "objectForKey:", CFSTR("GCDAsyncSocketSSLCipherSuites"));
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = v16;
    v35 = objc_msgSend(v15, "count");
    v54 = (uint64_t)&v54;
    v36 = (const SSLCipherSuite *)((char *)&v54 - ((2 * v35 + 15) & 0xFFFFFFFFFFFFFFF0));
    if (v35)
    {
      for (i = 0; i != v35; ++i)
      {
        objc_msgSend(v15, "objectAtIndex:", i, v54, v55);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v36[i] = objc_msgSend(v38, "shortValue");

      }
    }
    if (SSLSetEnabledCiphers(self->sslContext, v36, v35))
    {
      -[_DT_GCDAsyncSocket otherError:](self, "otherError:", CFSTR("Error in SSLSetEnabledCiphers"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DT_GCDAsyncSocket closeWithError:](self, "closeWithError:", v39);

      goto LABEL_22;
    }

  }
  else if (v16)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDAsyncSocket.m"), 6418, CFSTR("Invalid value for GCDAsyncSocketSSLCipherSuites. Value must be of type NSArray."));

    v19 = CFSTR("Invalid value for GCDAsyncSocketSSLCipherSuites.");
    goto LABEL_28;
  }
  -[NSMutableData objectForKey:](v6, "objectForKey:", *MEMORY[0x24BDB77C8], v54);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDAsyncSocket.m"), 6459, CFSTR("Security option unavailable - kCFStreamSSLAllowsAnyRoot - You must use manual trust evaluation"));

    v21 = CFSTR("Security option unavailable - kCFStreamSSLAllowsAnyRoot");
    goto LABEL_21;
  }
  -[NSMutableData objectForKey:](v6, "objectForKey:", *MEMORY[0x24BDB77D8]);
  v42 = objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v16 = (id)v42;
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDAsyncSocket.m"), 6474, CFSTR("Security option unavailable - kCFStreamSSLAllowsExpiredRoots - You must use manual trust evaluation"));

    v19 = CFSTR("Security option unavailable - kCFStreamSSLAllowsExpiredRoots");
    goto LABEL_28;
  }
  -[NSMutableData objectForKey:](v6, "objectForKey:", *MEMORY[0x24BDB7818]);
  v44 = objc_claimAutoreleasedReturnValue();
  if (v44)
  {
    v16 = (id)v44;
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDAsyncSocket.m"), 6489, CFSTR("Security option unavailable - kCFStreamSSLValidatesCertificateChain - You must use manual trust evaluation"));

    v19 = CFSTR("Security option unavailable - kCFStreamSSLValidatesCertificateChain");
    goto LABEL_28;
  }
  -[NSMutableData objectForKey:](v6, "objectForKey:", *MEMORY[0x24BDB77D0]);
  v46 = objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    v16 = (id)v46;
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDAsyncSocket.m"), 6504, CFSTR("Security option unavailable - kCFStreamSSLAllowsExpiredCertificates - You must use manual trust evaluation"));

    v19 = CFSTR("Security option unavailable - kCFStreamSSLAllowsExpiredCertificates");
    goto LABEL_28;
  }
  -[NSMutableData objectForKey:](v6, "objectForKey:", *MEMORY[0x24BDB77F8]);
  v48 = objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v16 = (id)v48;
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDAsyncSocket.m"), 6519, CFSTR("Security option unavailable - kCFStreamSSLLevel - You must use GCDAsyncSocketSSLProtocolVersionMin & GCDAsyncSocketSSLProtocolVersionMax"));

    v19 = CFSTR("Security option unavailable - kCFStreamSSLLevel");
    goto LABEL_28;
  }
  v50 = -[_DT_GCDAsyncSocketPreBuffer initWithCapacity:]([_DT_GCDAsyncSocketPreBuffer alloc], "initWithCapacity:", 4096);
  sslPreBuffer = self->sslPreBuffer;
  self->sslPreBuffer = v50;

  v52 = -[_DT_GCDAsyncSocketPreBuffer availableBytes](self->preBuffer, "availableBytes");
  if (v52)
  {
    v53 = v52;
    -[_DT_GCDAsyncSocketPreBuffer ensureCapacityForWrite:](self->sslPreBuffer, "ensureCapacityForWrite:", v52);
    memcpy(-[_DT_GCDAsyncSocketPreBuffer writeBuffer](self->sslPreBuffer, "writeBuffer"), -[_DT_GCDAsyncSocketPreBuffer readBuffer](self->preBuffer, "readBuffer"), v53);
    -[_DT_GCDAsyncSocketPreBuffer didRead:](self->preBuffer, "didRead:", v53);
    -[_DT_GCDAsyncSocketPreBuffer didWrite:](self->sslPreBuffer, "didWrite:", v53);
  }
  self->sslErrCode = 0;
  -[_DT_GCDAsyncSocket ssl_continueSSLHandshake](self, "ssl_continueSSLHandshake");
LABEL_10:

}

- (void)ssl_continueSSLHandshake
{
  uint64_t v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  OS_dispatch_queue *v7;
  int stateIndex;
  OS_dispatch_queue *v9;
  uint64_t v10;
  void *v11;
  id WeakRetained;
  NSObject *delegateQueue;
  void *v14;
  const void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _DT_GCDAsyncSocket *v19;
  id v20;
  uint64_t *v21;
  _QWORD aBlock[4];
  OS_dispatch_queue *v23;
  uint64_t *v24;
  id v25;
  int v26;
  id location;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  SecTrustRef v31;
  _QWORD block[4];
  id v33;
  _DT_GCDAsyncSocket *v34;

  v3 = SSLHandshake(self->sslContext);
  if ((_DWORD)v3 == -9841)
  {
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 0;
    v6 = SSLCopyPeerTrust(self->sslContext, &v31);
    if ((_DWORD)v6)
    {
      -[_DT_GCDAsyncSocket sslError:](self, "sslError:", v6);
      v7 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
      -[_DT_GCDAsyncSocket closeWithError:](self, "closeWithError:", v7);
    }
    else
    {
      stateIndex = self->stateIndex;
      v9 = self->socketQueue;
      objc_initWeak(&location, self);
      v10 = MEMORY[0x24BDAC760];
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 3221225472;
      aBlock[2] = sub_222B53E28;
      aBlock[3] = &unk_24EB299E0;
      v7 = v9;
      v23 = v7;
      v24 = &v28;
      objc_copyWeak(&v25, &location);
      v26 = stateIndex;
      v11 = _Block_copy(aBlock);
      WeakRetained = objc_loadWeakRetained(&self->delegate);
      if (self->delegateQueue && (objc_opt_respondsToSelector() & 1) != 0)
      {
        delegateQueue = self->delegateQueue;
        v17[0] = v10;
        v17[1] = 3221225472;
        v17[2] = sub_222B53F4C;
        v17[3] = &unk_24EB29A08;
        v18 = WeakRetained;
        v19 = self;
        v21 = &v28;
        v20 = v11;
        dispatch_async(delegateQueue, v17);

        v14 = v18;
      }
      else
      {
        v15 = (const void *)v29[3];
        if (v15)
        {
          CFRelease(v15);
          v29[3] = 0;
        }
        -[_DT_GCDAsyncSocket otherError:](self, "otherError:", CFSTR("GCDAsyncSocketManuallyEvaluateTrust specified in tlsSettings, but delegate doesn't implement socket:shouldTrustPeer:"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[_DT_GCDAsyncSocket closeWithError:](self, "closeWithError:", v14);
      }

      objc_destroyWeak(&v25);
      objc_destroyWeak(&location);
    }

    _Block_object_dispose(&v28, 8);
  }
  else if ((_DWORD)v3 != -9803)
  {
    if ((_DWORD)v3)
    {
      -[_DT_GCDAsyncSocket sslError:](self, "sslError:", v3);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      -[_DT_GCDAsyncSocket closeWithError:](self, "closeWithError:", v16);

    }
    else
    {
      self->flags = self->flags & 0xFFFFC7FF | 0x2000;
      v4 = objc_loadWeakRetained(&self->delegate);
      if (self->delegateQueue)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v5 = self->delegateQueue;
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = sub_222B53DF8;
          block[3] = &unk_24EB28350;
          v33 = v4;
          v34 = self;
          dispatch_async(v5, block);

        }
      }
      -[_DT_GCDAsyncSocket endCurrentRead](self, "endCurrentRead");
      -[_DT_GCDAsyncSocket endCurrentWrite](self, "endCurrentWrite");
      -[_DT_GCDAsyncSocket maybeDequeueRead](self, "maybeDequeueRead");
      -[_DT_GCDAsyncSocket maybeDequeueWrite](self, "maybeDequeueWrite");

    }
  }
}

- (void)ssl_shouldTrustPeer:(BOOL)a3 stateIndex:(int)a4
{
  id v5;

  if (self->stateIndex == a4)
  {
    self->stateIndex = a4 + 1;
    if (a3)
    {
      -[_DT_GCDAsyncSocket ssl_continueSSLHandshake](self, "ssl_continueSSLHandshake");
    }
    else
    {
      -[_DT_GCDAsyncSocket sslError:](self, "sslError:", 4294957471);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[_DT_GCDAsyncSocket closeWithError:](self, "closeWithError:", v5);

    }
  }
}

- (void)cf_finishSSLHandshake
{
  unsigned int flags;
  id WeakRetained;
  NSObject *delegateQueue;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  _DT_GCDAsyncSocket *v11;

  flags = self->flags;
  if ((~flags & 0x1800) == 0)
  {
    self->flags = flags & 0xFFFFC7FF | 0x2000;
    WeakRetained = objc_loadWeakRetained(&self->delegate);
    if (self->delegateQueue)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        delegateQueue = self->delegateQueue;
        v6 = MEMORY[0x24BDAC760];
        v7 = 3221225472;
        v8 = sub_222B540EC;
        v9 = &unk_24EB28350;
        v10 = WeakRetained;
        v11 = self;
        dispatch_async(delegateQueue, &v6);

      }
    }
    -[_DT_GCDAsyncSocket endCurrentRead](self, "endCurrentRead", v6, v7, v8, v9);
    -[_DT_GCDAsyncSocket endCurrentWrite](self, "endCurrentWrite");
    -[_DT_GCDAsyncSocket maybeDequeueRead](self, "maybeDequeueRead");
    -[_DT_GCDAsyncSocket maybeDequeueWrite](self, "maybeDequeueWrite");

  }
}

- (void)cf_abortSSLHandshake:(id)a3
{
  unsigned int flags;

  flags = self->flags;
  if ((~flags & 0x1800) == 0)
  {
    self->flags = flags & 0xFFFFE7FF;
    -[_DT_GCDAsyncSocket closeWithError:](self, "closeWithError:", a3);
  }
}

- (void)cf_startTLS
{
  const __CFString *v4;
  NSMutableData *buffer;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  _DT_GCDAsyncReadPacket *v12;

  if (-[_DT_GCDAsyncSocketPreBuffer availableBytes](self->preBuffer, "availableBytes"))
  {
    v4 = CFSTR("Invalid TLS transition. Handshake has already been read from socket.");
  }
  else
  {
    -[_DT_GCDAsyncSocket suspendReadSource](self, "suspendReadSource");
    -[_DT_GCDAsyncSocket suspendWriteSource](self, "suspendWriteSource");
    self->socketFDBytesAvailable = 0;
    self->flags = self->flags & 0xFFF3FF7F | 0x40000;
    if (-[_DT_GCDAsyncSocket createReadAndWriteStream](self, "createReadAndWriteStream"))
    {
      if (-[_DT_GCDAsyncSocket registerForStreamCallbacksIncludingReadWrite:](self, "registerForStreamCallbacksIncludingReadWrite:", 1))
      {
        if (-[_DT_GCDAsyncSocket addStreamsToRunLoop](self, "addStreamsToRunLoop"))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDAsyncSocket.m"), 6781, CFSTR("Invalid read packet for startTLS"));

          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDAsyncSocket.m"), 6782, CFSTR("Invalid write packet for startTLS"));

          }
          v12 = self->currentRead;
          buffer = v12->buffer;
          v6 = (const __CFString *)*MEMORY[0x24BDB77B0];
          v7 = CFReadStreamSetProperty(self->readStream, (CFStreamPropertyKey)*MEMORY[0x24BDB77B0], buffer);
          if (v7 | CFWriteStreamSetProperty(self->writeStream, v6, buffer))
          {
            if (-[_DT_GCDAsyncSocket openStreams](self, "openStreams"))
              goto LABEL_16;
            v8 = CFSTR("Error in CFStreamOpen");
          }
          else
          {
            v8 = CFSTR("Error in CFStreamSetProperty");
          }
          -[_DT_GCDAsyncSocket otherError:](self, "otherError:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[_DT_GCDAsyncSocket closeWithError:](self, "closeWithError:", v9);

          goto LABEL_16;
        }
        v4 = CFSTR("Error in CFStreamScheduleWithRunLoop");
      }
      else
      {
        v4 = CFSTR("Error in CFStreamSetClient");
      }
    }
    else
    {
      v4 = CFSTR("Error in CFStreamCreatePairWithSocket");
    }
  }
  -[_DT_GCDAsyncSocket otherError:](self, "otherError:", v4);
  v12 = (_DT_GCDAsyncReadPacket *)objc_claimAutoreleasedReturnValue();
  -[_DT_GCDAsyncSocket closeWithError:](self, "closeWithError:", v12);
LABEL_16:

}

+ (void)startCFStreamThreadIfNeeded
{
  _QWORD block[5];

  if (qword_25576FAA8 != -1)
    dispatch_once(&qword_25576FAA8, &unk_24EB277D0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_222B5441C;
  block[3] = &unk_24EB29A28;
  block[4] = a1;
  dispatch_sync((dispatch_queue_t)qword_25576FAB8, block);
}

+ (void)stopCFStreamThreadIfNeeded
{
  dispatch_time_t v2;

  v2 = dispatch_time(0, 30000000000);
  dispatch_after(v2, (dispatch_queue_t)qword_25576FAB8, &unk_24EB29A48);
}

+ (void)cfstreamThread
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;

  v3 = (void *)MEMORY[0x227679C5C](a1, a2);
  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setName:", CFSTR("_DT_GCDAsyncSocket-CFStream"));

  v5 = (void *)MEMORY[0x24BDBCF40];
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceNow");
  v7 = (id)objc_msgSend(v5, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", a1, sel_ignore_, 0, 1);

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isCancelled") & 1) == 0)
  {
    v10 = *MEMORY[0x24BDBCA90];
    do
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v9, "runMode:beforeDate:", v10, v11);

    }
    while (v12 && !objc_msgSend(v8, "isCancelled"));
  }

  objc_autoreleasePoolPop(v3);
}

+ (void)scheduleCFStreams:(id)a3
{
  void *v5;
  uint64_t v6;
  __CFRunLoop *Current;
  _QWORD *v8;
  __CFReadStream *v9;
  CFRunLoopMode *v10;
  __CFWriteStream *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = qword_25576FAC0;

  if (v5 != (void *)v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("GCDAsyncSocket.m"), 6930, CFSTR("Invoked on wrong thread"));

  }
  Current = CFRunLoopGetCurrent();
  v8 = v13;
  v9 = (__CFReadStream *)*((_QWORD *)v13 + 27);
  v10 = (CFRunLoopMode *)MEMORY[0x24BDBD5A0];
  if (v9)
  {
    CFReadStreamScheduleWithRunLoop(v9, Current, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
    v8 = v13;
  }
  v11 = (__CFWriteStream *)v8[28];
  if (v11)
  {
    CFWriteStreamScheduleWithRunLoop(v11, Current, *v10);
    v8 = v13;
  }

}

+ (void)unscheduleCFStreams:(id)a3
{
  void *v5;
  uint64_t v6;
  __CFRunLoop *Current;
  _QWORD *v8;
  __CFReadStream *v9;
  CFRunLoopMode *v10;
  __CFWriteStream *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = qword_25576FAC0;

  if (v5 != (void *)v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("GCDAsyncSocket.m"), 6944, CFSTR("Invoked on wrong thread"));

  }
  Current = CFRunLoopGetCurrent();
  v8 = v13;
  v9 = (__CFReadStream *)*((_QWORD *)v13 + 27);
  v10 = (CFRunLoopMode *)MEMORY[0x24BDBD5A0];
  if (v9)
  {
    CFReadStreamUnscheduleFromRunLoop(v9, Current, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
    v8 = v13;
  }
  v11 = (__CFWriteStream *)v8[28];
  if (v11)
  {
    CFWriteStreamUnscheduleFromRunLoop(v11, Current, *v10);
    v8 = v13;
  }

}

- (BOOL)createReadAndWriteStream
{
  __CFReadStream **p_readStream;
  __CFWriteStream **p_writeStream;
  __CFWriteStream *v6;
  CFSocketNativeHandle socket6FD;
  CFStreamPropertyKey *v8;
  CFTypeRef *v9;
  __CFReadStream *v10;
  void *v11;

  if (!dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDAsyncSocket.m"), 7093, CFSTR("Must be dispatched on socketQueue"));

  }
  p_readStream = &self->readStream;
  if (self->readStream)
    goto LABEL_5;
  p_writeStream = &self->writeStream;
  if (self->writeStream)
    goto LABEL_5;
  socket6FD = self->socket6FD;
  if (socket6FD == -1)
  {
    socket6FD = self->socket4FD;
    if (socket6FD == -1)
      goto LABEL_20;
  }
  LODWORD(v6) = -[_DT_GCDAsyncSocket isConnected](self, "isConnected");
  if (!(_DWORD)v6)
    return (char)v6;
  CFStreamCreatePairWithSocket(0, socket6FD, &self->readStream, &self->writeStream);
  v8 = (CFStreamPropertyKey *)MEMORY[0x24BDBD5D0];
  v9 = (CFTypeRef *)MEMORY[0x24BDBD268];
  if (*p_readStream)
    CFReadStreamSetProperty(*p_readStream, (CFStreamPropertyKey)*MEMORY[0x24BDBD5D0], (CFTypeRef)*MEMORY[0x24BDBD268]);
  if (!*p_writeStream)
  {
    v10 = *p_readStream;
    if (*p_readStream)
      goto LABEL_17;
LABEL_20:
    LOBYTE(v6) = 0;
    return (char)v6;
  }
  CFWriteStreamSetProperty(*p_writeStream, *v8, *v9);
  v6 = *p_writeStream;
  v10 = *p_readStream;
  if (!*p_readStream)
    goto LABEL_18;
  if (v6)
  {
LABEL_5:
    LOBYTE(v6) = 1;
    return (char)v6;
  }
LABEL_17:
  CFReadStreamClose(v10);
  CFRelease(*p_readStream);
  *p_readStream = 0;
  v6 = *p_writeStream;
LABEL_18:
  if (v6)
  {
    CFWriteStreamClose(v6);
    CFRelease(*p_writeStream);
    LOBYTE(v6) = 0;
    *p_writeStream = 0;
  }
  return (char)v6;
}

- (BOOL)registerForStreamCallbacksIncludingReadWrite:(BOOL)a3
{
  _BOOL4 v3;
  __CFReadStream *readStream;
  CFOptionFlags v7;
  int v8;
  CFOptionFlags v9;
  void *v10;
  void *v11;

  v3 = a3;
  if (!dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDAsyncSocket.m"), 7155, CFSTR("Must be dispatched on socketQueue"));

  }
  readStream = self->readStream;
  if (!readStream || !self->writeStream)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDAsyncSocket.m"), 7156, CFSTR("Read/Write stream is null"));

    readStream = self->readStream;
  }
  self->streamContext.version = 0;
  self->streamContext.info = self;
  self->streamContext.retain = 0;
  if (v3)
    v7 = 26;
  else
    v7 = 24;
  self->streamContext.release = 0;
  self->streamContext.copyDescription = 0;
  v8 = CFReadStreamSetClient(readStream, v7, (CFReadStreamClientCallBack)sub_222B54ACC, (CFStreamClientContext *)&self->streamContext);
  if (v8)
  {
    if (v3)
      v9 = 28;
    else
      v9 = 24;
    LOBYTE(v8) = CFWriteStreamSetClient(self->writeStream, v9, (CFWriteStreamClientCallBack)sub_222B54BE8, (CFStreamClientContext *)&self->streamContext) != 0;
  }
  return v8;
}

- (BOOL)addStreamsToRunLoop
{
  void *v5;
  void *v6;

  if (!dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDAsyncSocket.m"), 7189, CFSTR("Must be dispatched on socketQueue"));

  }
  if (!self->readStream || !self->writeStream)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDAsyncSocket.m"), 7190, CFSTR("Read/Write stream is null"));

  }
  if ((self->flags & 0x20000) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "startCFStreamThreadIfNeeded");
    objc_msgSend((id)objc_opt_class(), "performSelector:onThread:withObject:waitUntilDone:", sel_scheduleCFStreams_, qword_25576FAC0, self, 1);
    self->flags |= 0x20000u;
  }
  return 1;
}

- (void)removeStreamsFromRunLoop
{
  void *v4;
  void *v5;

  if (!dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDAsyncSocket.m"), 7212, CFSTR("Must be dispatched on socketQueue"));

  }
  if (!self->readStream || !self->writeStream)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDAsyncSocket.m"), 7213, CFSTR("Read/Write stream is null"));

  }
  if ((self->flags & 0x20000) != 0)
  {
    objc_msgSend((id)objc_opt_class(), "performSelector:onThread:withObject:waitUntilDone:", sel_unscheduleCFStreams_, qword_25576FAC0, self, 1);
    objc_msgSend((id)objc_opt_class(), "stopCFStreamThreadIfNeeded");
    self->flags &= ~0x20000u;
  }
}

- (BOOL)openStreams
{
  __CFReadStream *readStream;
  CFStreamStatus Status;
  CFStreamStatus v6;
  int v8;
  int v9;
  BOOL v10;
  void *v11;
  void *v12;

  if (!dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDAsyncSocket.m"), 7233, CFSTR("Must be dispatched on socketQueue"));

  }
  readStream = self->readStream;
  if (!readStream || !self->writeStream)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDAsyncSocket.m"), 7234, CFSTR("Read/Write stream is null"));

    readStream = self->readStream;
  }
  Status = CFReadStreamGetStatus(readStream);
  v6 = CFWriteStreamGetStatus(self->writeStream);
  if (Status && v6)
    return 1;
  v8 = CFReadStreamOpen(self->readStream);
  v9 = CFWriteStreamOpen(self->writeStream);
  if (v8)
    v10 = v9 == 0;
  else
    v10 = 1;
  return !v10;
}

- (BOOL)autoDisconnectOnClosedReadStream
{
  BOOL v3;
  NSObject *socketQueue;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
    return (self->config & 8) == 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  socketQueue = self->socketQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_222B550BC;
  v6[3] = &unk_24EB29678;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(socketQueue, v6);
  v3 = *((_BYTE *)v8 + 24) != 0;
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (void)setAutoDisconnectOnClosedReadStream:(BOOL)a3
{
  void (**v4)(_QWORD);
  _QWORD v5[5];
  BOOL v6;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_222B55168;
  v5[3] = &unk_24EB296F0;
  v6 = a3;
  v5[4] = self;
  v4 = (void (**)(_QWORD))_Block_copy(v5);
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
    v4[2](v4);
  else
    dispatch_async((dispatch_queue_t)self->socketQueue, v4);

}

- (void)markSocketQueueTargetQueue:(id)a3
{
  dispatch_queue_set_specific((dispatch_queue_t)a3, self->IsOnSocketQueueOrTargetQueueKey, self, 0);
}

- (void)unmarkSocketQueueTargetQueue:(id)a3
{
  dispatch_queue_set_specific((dispatch_queue_t)a3, self->IsOnSocketQueueOrTargetQueueKey, 0, 0);
}

- (void)performBlock:(id)a3
{
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
    (*((void (**)(id))a3 + 2))(a3);
  else
    dispatch_sync((dispatch_queue_t)self->socketQueue, a3);
}

- (int)socketFD
{
  int result;

  if (!dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
    return -1;
  result = self->socket4FD;
  if (result == -1)
    return self->socket6FD;
  return result;
}

- (int)socket4FD
{
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
    return self->socket4FD;
  else
    return -1;
}

- (int)socket6FD
{
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
    return self->socket6FD;
  else
    return -1;
}

- (__CFReadStream)readStream
{
  __CFReadStream *result;

  result = (__CFReadStream *)dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey);
  if (result)
  {
    result = self->readStream;
    if (!result)
    {
      -[_DT_GCDAsyncSocket createReadAndWriteStream](self, "createReadAndWriteStream");
      return self->readStream;
    }
  }
  return result;
}

- (__CFWriteStream)writeStream
{
  __CFWriteStream *result;

  result = (__CFWriteStream *)dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey);
  if (result)
  {
    result = self->writeStream;
    if (!result)
    {
      -[_DT_GCDAsyncSocket createReadAndWriteStream](self, "createReadAndWriteStream");
      return self->writeStream;
    }
  }
  return result;
}

- (SSLContext)sslContext
{
  SSLContext *result;

  result = (SSLContext *)dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey);
  if (result)
    return self->sslContext;
  return result;
}

+ (id)lookupHost:(id)a3 port:(unsigned __int16)a4 error:(id *)a5
{
  unsigned int v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  const char *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  addrinfo *v19;
  uint64_t v20;
  int ai_family;
  addrinfo *v23;
  int v24;
  void *v26;
  addrinfo *v27;
  addrinfo v28;
  addrinfo *v29[3];

  v6 = a4;
  v29[2] = *(addrinfo **)MEMORY[0x24BDAC8D0];
  v8 = a3;
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("localhost")) & 1) == 0
    && !objc_msgSend(v8, "isEqualToString:", CFSTR("loopback")))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%hu"), v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = 0;
    *(_QWORD *)&v28.ai_flags = 0;
    memset(&v28.ai_addrlen, 0, 32);
    *(_QWORD *)&v28.ai_socktype = 0x600000001;
    v15 = (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    v16 = objc_retainAutorelease(v14);
    v17 = getaddrinfo(v15, (const char *)objc_msgSend(v16, "UTF8String"), &v28, v29);
    if ((_DWORD)v17)
    {
      v18 = v17;
      v11 = 0;
    }
    else
    {
      v19 = v29[0];
      if (v29[0])
      {
        v20 = 0;
        do
        {
          ai_family = v19->ai_family;
          if (ai_family == 30 || ai_family == 2)
            ++v20;
          v19 = v19->ai_next;
        }
        while (v19);
      }
      else
      {
        v20 = 0;
      }
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v20);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v29[0];
      if (v29[0])
      {
        do
        {
          v24 = v23->ai_family;
          if (v24 == 30 || v24 == 2)
          {
            objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v23->ai_addr, v23->ai_addrlen);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addObject:", v26);

          }
          v23 = v23->ai_next;
        }
        while (v23);
        v27 = v29[0];
      }
      else
      {
        v27 = 0;
      }
      freeaddrinfo(v27);
      if (objc_msgSend(v11, "count"))
      {
        v12 = 0;
LABEL_31:

        if (!a5)
          goto LABEL_5;
        goto LABEL_4;
      }
      v18 = 4;
    }
    objc_msgSend(a1, "gaiError:", v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  LOWORD(v29[0]) = 528;
  WORD1(v29[0]) = __rev16(v6);
  HIDWORD(v29[0]) = 16777343;
  v29[1] = 0;
  LOWORD(v28.ai_flags) = 7708;
  HIWORD(v28.ai_flags) = WORD1(v29[0]);
  v28.ai_family = 0;
  *(_OWORD *)&v28.ai_socktype = *MEMORY[0x24BDAE880];
  LODWORD(v28.ai_canonname) = 0;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v29, 16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v28, 28);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v9);
  objc_msgSend(v11, "addObject:", v10);

  v12 = 0;
  if (a5)
LABEL_4:
    *a5 = objc_retainAutorelease(v12);
LABEL_5:

  return v11;
}

+ (id)hostFromSockaddr4:(const sockaddr_in *)a3
{
  char v4[16];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (!inet_ntop(2, &a3->sin_addr, v4, 0x10u))
    v4[0] = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)hostFromSockaddr6:(const sockaddr_in6 *)a3
{
  char v4[46];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (!inet_ntop(30, &a3->sin6_addr, v4, 0x2Eu))
    v4[0] = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (unsigned)portFromSockaddr4:(const sockaddr_in *)a3
{
  return bswap32(a3->sin_port) >> 16;
}

+ (unsigned)portFromSockaddr6:(const sockaddr_in6 *)a3
{
  return bswap32(a3->sin6_port) >> 16;
}

+ (id)hostFromAddress:(id)a3
{
  int v3;
  id v4;
  void *v5;
  id v6;
  id v8;

  v8 = 0;
  v3 = objc_msgSend(a1, "getHost:port:fromAddress:", &v8, 0, a3);
  v4 = v8;
  v5 = v4;
  v6 = 0;
  if (v3)
    v6 = v4;

  return v6;
}

+ (unsigned)portFromAddress:(id)a3
{
  int v3;
  unsigned __int16 v4;
  unsigned __int16 v6;

  v6 = 0;
  v3 = objc_msgSend(a1, "getHost:port:fromAddress:", 0, &v6, a3);
  v4 = v6;
  if (!v3)
    return 0;
  return v4;
}

+ (BOOL)isIPv4Address:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = (unint64_t)objc_msgSend(v3, "length") >= 0x10
    && *(_BYTE *)(objc_msgSend(objc_retainAutorelease(v3), "bytes") + 1) == 2;

  return v4;
}

+ (BOOL)isIPv6Address:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = (unint64_t)objc_msgSend(v3, "length") >= 0x10
    && *(_BYTE *)(objc_msgSend(objc_retainAutorelease(v3), "bytes") + 1) == 30;

  return v4;
}

+ (BOOL)getHost:(id *)a3 port:(unsigned __int16 *)a4 fromAddress:(id)a5
{
  return MEMORY[0x24BEDD108](a1, sel_getHost_port_family_fromAddress_);
}

+ (BOOL)getHost:(id *)a3 port:(unsigned __int16 *)a4 family:(char *)a5 fromAddress:(id)a6
{
  id v10;
  id v11;
  uint64_t v12;
  int v13;
  char v14;
  __int128 v15;
  BOOL v16;
  _BYTE v18[28];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v10 = a6;
  if ((unint64_t)objc_msgSend(v10, "length") < 0x10)
    goto LABEL_20;
  v11 = objc_retainAutorelease(v10);
  v12 = objc_msgSend(v11, "bytes");
  v13 = *(unsigned __int8 *)(v12 + 1);
  if (v13 == 30)
  {
    if ((unint64_t)objc_msgSend(v11, "length") >= 0x1C)
    {
      v15 = *(_OWORD *)v12;
      *(_OWORD *)&v18[12] = *(_OWORD *)(v12 + 12);
      *(_OWORD *)v18 = v15;
      if (a3)
      {
        objc_msgSend(a1, "hostFromSockaddr6:", v18);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (a4)
        *a4 = objc_msgSend(a1, "portFromSockaddr6:", v18);
      if (!a5)
        goto LABEL_19;
      v14 = 30;
      goto LABEL_18;
    }
LABEL_20:
    v16 = 0;
    goto LABEL_21;
  }
  if (v13 != 2 || (unint64_t)objc_msgSend(v11, "length") < 0x10)
    goto LABEL_20;
  *(_OWORD *)v18 = *(_OWORD *)v12;
  if (a3)
  {
    objc_msgSend(a1, "hostFromSockaddr4:", v18);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a4)
    *a4 = objc_msgSend(a1, "portFromSockaddr4:", v18);
  if (!a5)
    goto LABEL_19;
  v14 = 2;
LABEL_18:
  *a5 = v14;
LABEL_19:
  v16 = 1;
LABEL_21:

  return v16;
}

+ (id)CRLFData
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", "\r\n", 2);
}

+ (id)CRData
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", "\r", 1);
}

+ (id)LFData
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", "\n", 1);
}

+ (id)ZeroData
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", ", 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->userData, 0);
  objc_storeStrong((id *)&self->sslPreBuffer, 0);
  objc_storeStrong((id *)&self->preBuffer, 0);
  objc_storeStrong((id *)&self->currentWrite, 0);
  objc_storeStrong((id *)&self->currentRead, 0);
  objc_storeStrong((id *)&self->writeQueue, 0);
  objc_storeStrong((id *)&self->readQueue, 0);
  objc_storeStrong((id *)&self->writeTimer, 0);
  objc_storeStrong((id *)&self->readTimer, 0);
  objc_storeStrong((id *)&self->writeSource, 0);
  objc_storeStrong((id *)&self->readSource, 0);
  objc_storeStrong((id *)&self->connectTimer, 0);
  objc_storeStrong((id *)&self->accept6Source, 0);
  objc_storeStrong((id *)&self->accept4Source, 0);
  objc_storeStrong((id *)&self->socketQueue, 0);
  objc_storeStrong((id *)&self->connectInterface6, 0);
  objc_storeStrong((id *)&self->connectInterface4, 0);
  objc_storeStrong((id *)&self->delegateQueue, 0);
  objc_destroyWeak(&self->delegate);
}

@end
