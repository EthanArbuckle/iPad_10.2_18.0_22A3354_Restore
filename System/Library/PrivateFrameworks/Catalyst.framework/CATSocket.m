@implementation CATSocket

- (void)setNativeSocket:(int)a3
{
  OS_dispatch_source *v6;
  OS_dispatch_source *socketSource;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  _QWORD handler[5];

  if (-[CATSocket nativeSocket](self, "nativeSocket") != -1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATSocket.m"), 55, CFSTR("%@ cannot call %@ when already connected."), self, v12);

  }
  if (self->mIsInvalid)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATSocket.m"), 56, CFSTR("%@ cannot call %@ when already invalidated."), self, v14);

  }
  if (self->_nativeSocket != a3)
  {
    self->_nativeSocket = a3;
    v6 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA00], a3, 0, (dispatch_queue_t)self->_socketQueue);
    socketSource = self->_socketSource;
    self->_socketSource = v6;

    v8 = MEMORY[0x24BDAC760];
    v9 = self->_socketSource;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __29__CATSocket_setNativeSocket___block_invoke;
    handler[3] = &unk_24C1C5A60;
    handler[4] = self;
    dispatch_source_set_cancel_handler(v9, handler);
    v10 = self->_socketSource;
    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __29__CATSocket_setNativeSocket___block_invoke_2;
    v15[3] = &unk_24C1C5A60;
    v15[4] = self;
    dispatch_source_set_event_handler(v10, v15);
    -[CATSocket populateLocalEndPoint](self, "populateLocalEndPoint");
    if (self->mState != 1)
      -[CATSocket populateRemoteEndPoint](self, "populateRemoteEndPoint");
  }
}

uint64_t __29__CATSocket_setNativeSocket___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "socketDidCancel");
}

uint64_t __29__CATSocket_setNativeSocket___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "socketDidReceiveEvent");
}

- (int)nativeSocket
{
  return self->_nativeSocket;
}

- (CATSocket)init
{
  CATSocket *v2;
  CATSocket *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *userQueue;
  dispatch_queue_t v6;
  OS_dispatch_queue *socketQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CATSocket;
  v2 = -[CATSocket init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_nativeSocket = -1;
    v4 = dispatch_queue_create(0, 0);
    userQueue = v3->_userQueue;
    v3->_userQueue = (OS_dispatch_queue *)v4;

    v6 = dispatch_queue_create(0, 0);
    socketQueue = v3->_socketQueue;
    v3->_socketQueue = (OS_dispatch_queue *)v6;

  }
  return v3;
}

- (CATSocket)initWithNativeSocket:(int)a3
{
  uint64_t v3;
  CATSocket *v4;
  CATSocket *v5;

  v3 = *(_QWORD *)&a3;
  v4 = -[CATSocket init](self, "init");
  v5 = v4;
  if (v4)
  {
    v4->mState = 3;
    -[CATSocket setNativeSocket:](v4, "setNativeSocket:", v3);
  }
  return v5;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (!self->mIsInvalid)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATSocket.m"), 118, CFSTR("%@ cannot dealloc while receiver is still valid."), self);

  }
  v5.receiver = self;
  v5.super_class = (Class)CATSocket;
  -[CATSocket dealloc](&v5, sel_dealloc);
}

- (BOOL)listenWithEndPoint:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  char v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v6 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__1;
  v19 = __Block_byref_object_dispose__1;
  v20 = 0;
  -[CATSocket socketQueue](self, "socketQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __38__CATSocket_listenWithEndPoint_error___block_invoke;
  v11[3] = &unk_24C1C6000;
  v11[4] = self;
  v13 = &v15;
  v8 = v6;
  v12 = v8;
  v14 = &v21;
  dispatch_sync(v7, v11);

  if (a4)
    *a4 = objc_retainAutorelease((id)v16[5]);
  v9 = *((_BYTE *)v22 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __38__CATSocket_listenWithEndPoint_error___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  const sockaddr *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  int v20;

  v2 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 12);
  if (v2)
  {
    if (v2 == 1)
    {
      v3 = (void *)MEMORY[0x24BDD1540];
      v4 = *MEMORY[0x24BDD1128];
      v5 = 37;
LABEL_6:
      objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, v5, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      return;
    }
LABEL_5:
    v3 = (void *)MEMORY[0x24BDD1540];
    v4 = *MEMORY[0x24BDD1128];
    v5 = 22;
    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 40), "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7 <= 0xF)
    goto LABEL_5;
  objc_msgSend(*(id *)(a1 + 40), "data");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = (const sockaddr *)objc_msgSend(v11, "bytes");

  v13 = socket(v12->sa_family, 1, 6);
  if ((_DWORD)v13 == -1)
  {
    v18 = (void *)MEMORY[0x24BDD1540];
    v19 = *MEMORY[0x24BDD1128];
    v5 = *__error();
    v3 = v18;
    v4 = v19;
    goto LABEL_6;
  }
  v14 = v13;
  v20 = 1;
  if (setsockopt(v13, 0xFFFF, 4, &v20, 4u) || bind(v14, v12, v12->sa_len) || listen(v14, 16))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 12) = 1;
    objc_msgSend(*(id *)(a1 + 32), "setNativeSocket:", v14);
  }
  else
  {
    close(v14);
  }
}

- (BOOL)connectToEndPoint:(id)a3 error:(id *)a4
{
  id v7;
  NSObject *v8;
  id v9;
  char v10;
  void *v12;
  _QWORD block[5];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATSocket.m"), 199, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("endPoint"));

  }
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__1;
  v21 = __Block_byref_object_dispose__1;
  v22 = 0;
  -[CATSocket socketQueue](self, "socketQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__CATSocket_connectToEndPoint_error___block_invoke;
  block[3] = &unk_24C1C6000;
  block[4] = self;
  v15 = &v17;
  v9 = v7;
  v14 = v9;
  v16 = &v23;
  dispatch_sync(v8, block);

  if (a4)
    *a4 = objc_retainAutorelease((id)v18[5]);
  v10 = *((_BYTE *)v24 + 24);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v10;
}

void __37__CATSocket_connectToEndPoint_error___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  _QWORD block[6];
  int v22;
  int v23;

  v2 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 12);
  if (v2)
  {
    if (v2 == 3)
    {
      v3 = (void *)MEMORY[0x24BDD1540];
      v4 = *MEMORY[0x24BDD1128];
      v5 = 37;
      goto LABEL_8;
    }
    if (v2 == 2)
    {
      v3 = (void *)MEMORY[0x24BDD1540];
      v4 = *MEMORY[0x24BDD1128];
      v5 = 36;
LABEL_8:
      objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, v5, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      return;
    }
LABEL_6:
    v3 = (void *)MEMORY[0x24BDD1540];
    v4 = *MEMORY[0x24BDD1128];
    v5 = 22;
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 40), "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7 <= 0xF)
    goto LABEL_6;
  objc_msgSend(*(id *)(a1 + 40), "data");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = objc_msgSend(v11, "bytes");

  v13 = socket(*(unsigned __int8 *)(v12 + 1), 1, 0);
  if ((_DWORD)v13 == -1)
  {
    v18 = (void *)MEMORY[0x24BDD1540];
    v19 = *MEMORY[0x24BDD1128];
    v5 = *__error();
    v3 = v18;
    v4 = v19;
    goto LABEL_8;
  }
  v14 = v13;
  v23 = 1;
  if (setsockopt(v13, 0xFFFF, 4130, &v23, 4u))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

    close(v14);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 12) = 2;
    objc_msgSend(*(id *)(a1 + 32), "setNativeSocket:", v14);
    dispatch_get_global_queue(21, 0);
    v20 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __37__CATSocket_connectToEndPoint_error___block_invoke_2;
    block[3] = &unk_24C1C6028;
    v22 = v14;
    block[4] = *(_QWORD *)(a1 + 32);
    block[5] = v12;
    dispatch_async(v20, block);

  }
}

void __37__CATSocket_connectToEndPoint_error___block_invoke_2(uint64_t a1)
{
  int v2;
  void *v3;
  id v4;

  v2 = connect(*(_DWORD *)(a1 + 48), *(const sockaddr **)(a1 + 40), **(unsigned __int8 **)(a1 + 40));
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "socketDidFailWithError:", v4);

  }
  else
  {
    objc_msgSend(v3, "socketDidConnect");
  }
}

- (void)resume
{
  NSObject *v3;
  _QWORD block[5];

  -[CATSocket socketQueue](self, "socketQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __19__CATSocket_resume__block_invoke;
  block[3] = &unk_24C1C5A60;
  block[4] = self;
  dispatch_async(v3, block);

}

void __19__CATSocket_resume__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  objc_msgSend(*(id *)(a1 + 32), "socketSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "socketSource");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_resume(v3);

  }
}

- (void)suspend
{
  NSObject *v3;
  _QWORD block[5];

  -[CATSocket socketQueue](self, "socketQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __20__CATSocket_suspend__block_invoke;
  block[3] = &unk_24C1C5A60;
  block[4] = self;
  dispatch_async(v3, block);

}

void __20__CATSocket_suspend__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  objc_msgSend(*(id *)(a1 + 32), "socketSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "socketSource");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_suspend(v3);

  }
}

- (void)invalidate
{
  NSObject *v3;
  _QWORD block[5];

  -[CATSocket socketQueue](self, "socketQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __23__CATSocket_invalidate__block_invoke;
  block[3] = &unk_24C1C5A60;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __23__CATSocket_invalidate__block_invoke(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  NSObject *v4;

  v2 = *(_BYTE **)(a1 + 32);
  if (!v2[8])
  {
    objc_msgSend(v2, "socketSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "socketSource");
      v4 = objc_claimAutoreleasedReturnValue();
      dispatch_source_cancel(v4);

    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  }
}

- (void)socketDidReceiveEvent
{
  if (self->mState == 1)
    -[CATSocket socketDidReceiveListeningEvent](self, "socketDidReceiveListeningEvent");
  else
    -[CATSocket socketDidReceiveData](self, "socketDidReceiveData");
}

- (void)socketDidReceiveListeningEvent
{
  NSObject *v3;
  uintptr_t data;

  -[CATSocket socketSource](self, "socketSource");
  v3 = objc_claimAutoreleasedReturnValue();
  data = dispatch_source_get_data(v3);

  for (; data; --data)
    -[CATSocket acceptPendingConnection](self, "acceptPendingConnection");
}

- (void)acceptPendingConnection
{
  NSObject *v5;
  int *v6;
  char *v7;
  int v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  __int16 v13;
  char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = __error();
  v7 = strerror(*v6);
  v8 = *__error();
  v9 = 138413058;
  v10 = a1;
  v11 = 1024;
  v12 = a3;
  v13 = 2080;
  v14 = v7;
  v15 = 1024;
  v16 = v8;
  _os_log_error_impl(&dword_209592000, v5, OS_LOG_TYPE_ERROR, "%@ failed accepting from socket (%d): %s (%i)", (uint8_t *)&v9, 0x22u);

}

uint64_t __36__CATSocket_acceptPendingConnection__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "delegateShouldAcceptNewSocket:", *(_QWORD *)(a1 + 40));
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 40), "invalidate");
  return result;
}

- (void)socketDidReceiveData
{
  NSObject *v3;
  uintptr_t data;
  void *v5;
  int v6;
  id v7;
  ssize_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  _QWORD block[5];
  id v14;

  -[CATSocket socketSource](self, "socketSource");
  v3 = objc_claimAutoreleasedReturnValue();
  data = dispatch_source_get_data(v3);

  if (!data)
  {
    -[CATSocket socketSource](self, "socketSource");
    v12 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v12);

    return;
  }
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", data);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CATSocket nativeSocket](self, "nativeSocket");
  v7 = objc_retainAutorelease(v5);
  v8 = read(v6, (void *)objc_msgSend(v7, "mutableBytes"), data);
  if (v8 == -1)
  {
    if (*__error() != 35 && *__error() != 4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CATSocket socketDidFailWithError:](self, "socketDidFailWithError:", v11);

      -[CATSocket invalidate](self, "invalidate");
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (v8)
  {
LABEL_8:
    -[CATSocket userQueue](self, "userQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __33__CATSocket_socketDidReceiveData__block_invoke;
    block[3] = &unk_24C1C5C00;
    block[4] = self;
    v14 = v7;
    dispatch_async(v10, block);

    goto LABEL_9;
  }
  -[CATSocket socketSource](self, "socketSource");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_source_cancel(v9);

LABEL_9:
}

void __33__CATSocket_socketDidReceiveData__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(v1, "delegateDidReceiveData:", v2);

}

- (void)socketDidConnect
{
  NSObject *v3;
  _QWORD block[5];

  self->mState = 3;
  -[CATSocket populateRemoteEndPoint](self, "populateRemoteEndPoint");
  -[CATSocket userQueue](self, "userQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__CATSocket_socketDidConnect__block_invoke;
  block[3] = &unk_24C1C5A60;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __29__CATSocket_socketDidConnect__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "delegateDidConnect");
}

- (void)socketDidCancel
{
  OS_dispatch_source *socketSource;
  NSObject *v4;
  _QWORD block[5];

  close(self->_nativeSocket);
  self->_nativeSocket = -1;
  socketSource = self->_socketSource;
  self->_socketSource = 0;

  if ((self->mState | 2) == 3)
  {
    self->mState = 5;
    -[CATSocket userQueue](self, "userQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __28__CATSocket_socketDidCancel__block_invoke;
    block[3] = &unk_24C1C5A60;
    block[4] = self;
    dispatch_async(v4, block);

  }
}

uint64_t __28__CATSocket_socketDidCancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "delegateDidClose");
}

- (void)socketDidFailWithError:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  self->mState = 4;
  -[CATSocket userQueue](self, "userQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __36__CATSocket_socketDidFailWithError___block_invoke;
  v7[3] = &unk_24C1C5C00;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __36__CATSocket_socketDidFailWithError___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "delegateDidFailWithError:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)populateLocalEndPoint
{
  void *v3;
  int nativeSocket;
  id v5;
  CATEndPoint *v6;
  CATEndPoint *localEndPoint;
  socklen_t v8;

  v8 = 16;
  getsockname(self->_nativeSocket, 0, &v8);
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    nativeSocket = self->_nativeSocket;
    v5 = objc_retainAutorelease(v3);
    getsockname(nativeSocket, (sockaddr *)objc_msgSend(v5, "mutableBytes"), &v8);
    v6 = -[CATEndPoint initWithData:]([CATEndPoint alloc], "initWithData:", v5);
    localEndPoint = self->_localEndPoint;
    self->_localEndPoint = v6;

  }
}

- (void)populateRemoteEndPoint
{
  void *v3;
  int nativeSocket;
  id v5;
  CATEndPoint *v6;
  CATEndPoint *remoteEndPoint;
  socklen_t v8;

  v8 = 16;
  getpeername(self->_nativeSocket, 0, &v8);
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    nativeSocket = self->_nativeSocket;
    v5 = objc_retainAutorelease(v3);
    getpeername(nativeSocket, (sockaddr *)objc_msgSend(v5, "mutableBytes"), &v8);
    v6 = -[CATEndPoint initWithData:]([CATEndPoint alloc], "initWithData:", v5);
    remoteEndPoint = self->_remoteEndPoint;
    self->_remoteEndPoint = v6;

  }
}

- (BOOL)delegateShouldAcceptNewSocket:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  char v8;

  v4 = a3;
  -[CATSocket delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CATSocket delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "socket:shouldAcceptNewSocket:", self, v4);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)delegateDidReceiveData:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[CATSocket delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CATSocket delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v6, "socket:didReceiveData:", self, v7);

  }
}

- (void)delegateDidClose
{
  void *v3;
  char v4;
  id v5;

  -[CATSocket delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CATSocket delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "socketDidClose:", self);

  }
}

- (void)delegateDidConnect
{
  void *v3;
  char v4;
  id v5;

  -[CATSocket delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CATSocket delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "socketDidConnect:", self);

  }
}

- (void)delegateDidFailWithError:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CATSocket delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CATSocket delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "socket:didFailWithError:", self, v7);

  }
}

- (CATSocketDelegate)delegate
{
  return (CATSocketDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CATEndPoint)localEndPoint
{
  return self->_localEndPoint;
}

- (CATEndPoint)remoteEndPoint
{
  return self->_remoteEndPoint;
}

- (OS_dispatch_source)socketSource
{
  return self->_socketSource;
}

- (OS_dispatch_queue)socketQueue
{
  return self->_socketQueue;
}

- (OS_dispatch_queue)userQueue
{
  return self->_userQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userQueue, 0);
  objc_storeStrong((id *)&self->_socketQueue, 0);
  objc_storeStrong((id *)&self->_socketSource, 0);
  objc_storeStrong((id *)&self->_remoteEndPoint, 0);
  objc_storeStrong((id *)&self->_localEndPoint, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
