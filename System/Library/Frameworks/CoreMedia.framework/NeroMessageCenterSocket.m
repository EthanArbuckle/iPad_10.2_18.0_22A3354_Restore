@implementation NeroMessageCenterSocket

- (NeroMessageCenterSocket)initWithIDSSerivce:(id)a3 connection:(OpaqueFigTransportConnection *)a4
{
  NeroMessageCenterSocket *v6;
  NeroMessageCenterSocket *v7;
  uint64_t v8;
  objc_super v10;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)NeroMessageCenterSocket;
  v6 = -[NeroMessageCenterSocket init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_connection = a4;
    v6->_service = (IDSService *)a3;
    v11[0] = *(_QWORD *)ids_IDSOpenSocketOptionTransportKey;
    v12[0] = &unk_1E28FD918;
    v11[1] = *(_QWORD *)ids_IDSOpenSocketOptionPriorityKey;
    v12[1] = &unk_1E28FD930;
    v11[2] = *(_QWORD *)ids_IDSOpenSocketOptionScopeKey;
    v12[2] = &unk_1E28FD918;
    v8 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
    v7->_outgoingPackageQueue.stqh_first = 0;
    v7->_options = (NSDictionary *)v8;
    v7->_idsDevice = 0;
    v7->_outgoingPackageQueue.stqh_last = &v7->_outgoingPackageQueue.stqh_first;
    v7->_outgoingQueueHeadBytesSent = 0;
    pthread_mutex_init(&v7->_outgoingQueueMutex, 0);
    v7->_receivalQueue = (OS_dispatch_queue *)dispatch_queue_create((const char *)objc_msgSend(CFSTR("FigTransportConnectionIDS.socketReceiver"), "UTF8String"), 0);
    v7->_isActive = 0;
  }
  return v7;
}

- (void)activateConnection
{
  dispatch_semaphore_t v3;
  NSObject *v4;
  IDSService *service;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  IDSDevice *v11;
  id v12;
  IDSDevice *idsDevice;
  NSDictionary *options;
  uint64_t v15;
  NSObject *receivalQueue;
  _QWORD block[5];
  _QWORD v18[6];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _QWORD v24[3];
  _QWORD v25[4];

  v25[3] = *MEMORY[0x1E0C80C00];
  v3 = dispatch_semaphore_create(0);
  if (!self->_isActive)
  {
    v4 = v3;
    service = self->_service;
    v24[0] = *(_QWORD *)ids_IDSLinkPreferenceOptionPacketsPerSecondKey;
    v25[0] = &unk_1E28FD8D0;
    v24[1] = *(_QWORD *)ids_IDSLinkPreferenceOptionOutputBytesPerSecondKey;
    v25[1] = &unk_1E28FD8E8;
    v24[2] = *(_QWORD *)ids_IDSLinkPreferenceOptionInputBytesPerSecondKey;
    v25[2] = &unk_1E28FD8E8;
    -[IDSService setLinkPreferences:](service, "setLinkPreferences:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 3));
    self->_idsDevice = 0;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v6 = (void *)-[IDSService devices](self->_service, "devices");
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(v6);
          v11 = *(IDSDevice **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if (-[IDSDevice isDefaultPairedDevice](v11, "isDefaultPairedDevice"))
            self->_idsDevice = v11;
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v8);
    }
    if (self->_idsDevice)
    {
      self->_pollfd.fd = -1;
      v12 = objc_alloc((Class)ids_IDSDeviceConnectionClass);
      idsDevice = self->_idsDevice;
      options = self->_options;
      v15 = MEMORY[0x1E0C809B0];
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __45__NeroMessageCenterSocket_activateConnection__block_invoke;
      v18[3] = &unk_1E28DD180;
      v18[4] = self;
      v18[5] = v4;
      self->_deviceConnection = (IDSDeviceConnection *)objc_msgSend(v12, "initSocketWithDevice:options:completionHandler:queue:", idsDevice, options, v18, self->_receivalQueue);
      dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
      if (!fcntl(self->_pollfd.fd, 4, 4))
      {
        self->_pollfd.events = 5;
        dispatch_release(v4);
        self->_isActive = 1;
        receivalQueue = self->_receivalQueue;
        block[0] = v15;
        block[1] = 3221225472;
        block[2] = __45__NeroMessageCenterSocket_activateConnection__block_invoke_2;
        block[3] = &unk_1E28D7E98;
        block[4] = self;
        dispatch_async(receivalQueue, block);
      }
    }
  }
}

intptr_t __45__NeroMessageCenterSocket_activateConnection__block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  if (!a3)
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 48) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __45__NeroMessageCenterSocket_activateConnection__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "mainLoop");
}

- (void)deactivateConnection
{
  NSObject *receivalQueue;
  IDSService *service;
  _QWORD v5[5];
  _QWORD v6[3];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  if (self->_isActive)
  {
    self->_isActive = 0;
    self->_pollfd.events = 0;
    receivalQueue = self->_receivalQueue;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __47__NeroMessageCenterSocket_deactivateConnection__block_invoke;
    v5[3] = &unk_1E28D7E98;
    v5[4] = self;
    dispatch_sync(receivalQueue, v5);
    -[IDSDeviceConnection close](self->_deviceConnection, "close");

    service = self->_service;
    v6[0] = *(_QWORD *)ids_IDSLinkPreferenceOptionPacketsPerSecondKey;
    v7[0] = &unk_1E28FD900;
    v6[1] = *(_QWORD *)ids_IDSLinkPreferenceOptionInputBytesPerSecondKey;
    v7[1] = &unk_1E28FD900;
    v6[2] = *(_QWORD *)ids_IDSLinkPreferenceOptionOutputBytesPerSecondKey;
    v7[2] = &unk_1E28FD900;
    -[IDSService setLinkPreferences:](service, "setLinkPreferences:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3));
  }
}

void __47__NeroMessageCenterSocket_deactivateConnection__block_invoke(uint64_t a1)
{
  uint64_t i;
  void **v3;
  void **v4;
  void *v5;
  const void *v6;

  for (i = *(_QWORD *)(a1 + 32); ; i = *(_QWORD *)(a1 + 32))
  {
    v3 = (void **)(i + 88);
    v4 = *(void ***)(i + 88);
    if (!v4)
      break;
    v5 = *v4;
    *v3 = *v4;
    if (!v5)
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) = *(_QWORD *)(a1 + 32) + 88;
    free(v4[1]);
    free(v4);
  }
  v6 = *(const void **)(i + 80);
  if (v6)
  {
    CFRelease(v6);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = 0;
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 72) = 0;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = 0;
  }
}

- (BOOL)sendMemoryBlock:(void *)a3 withLength:(unint64_t)a4
{
  FigPackageRecord *v7;
  FigPackageRecord *v8;

  if (!self->_isActive)
    goto LABEL_4;
  v7 = (FigPackageRecord *)malloc_type_calloc(1uLL, 0x18uLL, 0x10A00404E934A1DuLL);
  if (v7)
  {
    v8 = v7;
    *((_QWORD *)v7 + 1) = a3;
    *((_QWORD *)v7 + 2) = a4;
    pthread_mutex_lock(&self->_outgoingQueueMutex);
    *(_QWORD *)v8 = 0;
    *self->_outgoingPackageQueue.stqh_last = v8;
    self->_outgoingPackageQueue.stqh_last = (FigPackageRecord **)v8;
    pthread_mutex_unlock(&self->_outgoingQueueMutex);
LABEL_4:
    LOBYTE(v7) = 1;
  }
  return (char)v7;
}

- (void)sendPackage
{
  _opaque_pthread_mutex_t *p_outgoingQueueMutex;
  FigPackageRecord *stqh_first;
  FigPackageRecordQueue *p_outgoingPackageQueue;
  unint64_t outgoingQueueHeadBytesSent;
  unint64_t v7;
  FigPackageRecord *v8;
  ssize_t v9;
  FigPackageRecord *v10;

  p_outgoingQueueMutex = &self->_outgoingQueueMutex;
  pthread_mutex_lock(&self->_outgoingQueueMutex);
  p_outgoingPackageQueue = &self->_outgoingPackageQueue;
  stqh_first = self->_outgoingPackageQueue.stqh_first;
  if (stqh_first)
  {
    outgoingQueueHeadBytesSent = self->_outgoingQueueHeadBytesSent;
    v7 = *((_QWORD *)stqh_first + 2);
    v8 = self->_outgoingPackageQueue.stqh_first;
    if (outgoingQueueHeadBytesSent >= v7)
    {
LABEL_6:
      self->_outgoingQueueHeadBytesSent = 0;
      v10 = *(FigPackageRecord **)v8;
      self->_outgoingPackageQueue.stqh_first = *(FigPackageRecord **)v8;
      if (!v10)
        self->_outgoingPackageQueue.stqh_last = &p_outgoingPackageQueue->stqh_first;
      free(*((void **)stqh_first + 1));
      free(stqh_first);
    }
    else
    {
      while (1)
      {
        v9 = write(self->_pollfd.fd, (const void *)(*((_QWORD *)stqh_first + 1) + outgoingQueueHeadBytesSent), v7 - outgoingQueueHeadBytesSent);
        if (!v9)
          break;
        outgoingQueueHeadBytesSent = self->_outgoingQueueHeadBytesSent + v9;
        self->_outgoingQueueHeadBytesSent = outgoingQueueHeadBytesSent;
        v7 = *((_QWORD *)stqh_first + 2);
        if (outgoingQueueHeadBytesSent >= v7)
        {
          v8 = p_outgoingPackageQueue->stqh_first;
          goto LABEL_6;
        }
      }
    }
  }
  pthread_mutex_unlock(p_outgoingQueueMutex);
}

- (void)readPackage
{
  uint64_t DerivedStorage;
  size_t numBytesReceivedForIncomingPackage;
  unsigned int *p_incomingPackageSize;
  char *v6;
  size_t v7;
  ssize_t v8;
  OpaqueCMBlockBuffer **p_incomingPackage;
  size_t incomingPackageSize;
  ssize_t v11;
  size_t lengthAtOffsetOut;
  char *dataPointerOut;

  DerivedStorage = CMBaseObjectGetDerivedStorage((uint64_t)self->_connection);
  numBytesReceivedForIncomingPackage = self->_numBytesReceivedForIncomingPackage;
  if (numBytesReceivedForIncomingPackage > 3)
  {
    v7 = 0;
    v6 = 0;
LABEL_7:
    lengthAtOffsetOut = v7;
    dataPointerOut = v6;
    p_incomingPackage = &self->_incomingPackage;
    if (self->_incomingPackage)
      goto LABEL_8;
    if (!CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, self->_incomingPackageSize, *(CFAllocatorRef *)(DerivedStorage + 64), 0, 0, self->_incomingPackageSize, 1u, &self->_incomingPackage)&& !CMBlockBufferReplaceDataBytes(&self->_incomingPackageSize, *p_incomingPackage, 0, 4uLL))
    {
      numBytesReceivedForIncomingPackage = self->_numBytesReceivedForIncomingPackage;
LABEL_8:
      while (1)
      {
        incomingPackageSize = self->_incomingPackageSize;
        if (numBytesReceivedForIncomingPackage >= incomingPackageSize)
          break;
        if (CMBlockBufferGetDataPointer(*p_incomingPackage, numBytesReceivedForIncomingPackage, &lengthAtOffsetOut, 0, &dataPointerOut))
        {
          return;
        }
        v11 = read(self->_pollfd.fd, dataPointerOut, lengthAtOffsetOut);
        if (v11 < 1)
          return;
        numBytesReceivedForIncomingPackage = self->_numBytesReceivedForIncomingPackage + v11;
        self->_numBytesReceivedForIncomingPackage = numBytesReceivedForIncomingPackage;
      }
      if (numBytesReceivedForIncomingPackage >= 4 && numBytesReceivedForIncomingPackage == incomingPackageSize)
      {
        ids_didReceivePackage(self->_connection, self->_incomingPackage);
        CFRelease(self->_incomingPackage);
        self->_incomingPackage = 0;
        self->_incomingPackageSize = 0;
        self->_numBytesReceivedForIncomingPackage = 0;
      }
    }
  }
  else
  {
    p_incomingPackageSize = &self->_incomingPackageSize;
    while (1)
    {
      v6 = (char *)p_incomingPackageSize + numBytesReceivedForIncomingPackage;
      v7 = 4 - numBytesReceivedForIncomingPackage;
      v8 = read(self->_pollfd.fd, (char *)p_incomingPackageSize + numBytesReceivedForIncomingPackage, 4 - numBytesReceivedForIncomingPackage);
      if (v8 < 1)
        break;
      numBytesReceivedForIncomingPackage = self->_numBytesReceivedForIncomingPackage + v8;
      self->_numBytesReceivedForIncomingPackage = numBytesReceivedForIncomingPackage;
      if (numBytesReceivedForIncomingPackage >= 4)
        goto LABEL_7;
    }
  }
}

- (void)mainLoop
{
  pollfd *p_pollfd;
  __int16 revents;
  NSObject *v5;
  int v6;
  uint64_t v7;
  unsigned int v8;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  unsigned int v10;
  char *v11;
  NSObject *global_queue;
  _QWORD block[5];
  os_log_type_t type;
  int v15;
  int v16;
  const char *v17;
  char v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (self->_isActive)
  {
    p_pollfd = &self->_pollfd;
    while (1)
    {
      poll(p_pollfd, 1u, 15);
      revents = self->_pollfd.revents;
      if ((revents & 8) != 0)
        break;
      if ((revents & 0x10) != 0)
      {
        v15 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(0, 1, &v15, &type);
        v6 = v15;
        if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
          v10 = v6;
        else
          v10 = v6 & 0xFFFFFFFE;
        if (v10)
        {
          v16 = 136315138;
          v17 = "-[NeroMessageCenterSocket mainLoop]";
          goto LABEL_21;
        }
        goto LABEL_22;
      }
      if ((revents & 1) != 0)
      {
        -[NeroMessageCenterSocket readPackage](self, "readPackage");
        revents = self->_pollfd.revents;
      }
      if ((revents & 4) != 0)
        -[NeroMessageCenterSocket sendPackage](self, "sendPackage");
      if (!self->_isActive)
        return;
    }
    v15 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(0, 1, &v15, &type);
    v6 = v15;
    if (os_log_type_enabled(v5, type))
      v8 = v6;
    else
      v8 = v6 & 0xFFFFFFFE;
    if (v8)
    {
      v16 = 136315138;
      v17 = "-[NeroMessageCenterSocket mainLoop]";
LABEL_21:
      v11 = (char *)_os_log_send_and_compose_impl();
      LOBYTE(v6) = v15;
      goto LABEL_23;
    }
LABEL_22:
    v11 = 0;
LABEL_23:
    fig_log_call_emit_and_clean_up_after_send_and_compose(0, 1u, 1, v11, v11 != &v18, v6, 0, v7);
    if (self->_isActive)
    {
      global_queue = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __35__NeroMessageCenterSocket_mainLoop__block_invoke;
      block[3] = &unk_1E28D7E98;
      block[4] = self;
      dispatch_async(global_queue, block);
    }
  }
}

uint64_t __35__NeroMessageCenterSocket_mainLoop__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deactivateConnection");
}

- (void)dealloc
{
  NSObject *receivalQueue;
  objc_super v4;

  -[NeroMessageCenterSocket deactivateConnection](self, "deactivateConnection");
  pthread_mutex_destroy(&self->_outgoingQueueMutex);
  receivalQueue = self->_receivalQueue;
  if (receivalQueue)
  {
    dispatch_release(receivalQueue);
    self->_receivalQueue = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)NeroMessageCenterSocket;
  -[NeroMessageCenterSocket dealloc](&v4, sel_dealloc);
}

- (BOOL)isActive
{
  return self->_isActive;
}

@end
