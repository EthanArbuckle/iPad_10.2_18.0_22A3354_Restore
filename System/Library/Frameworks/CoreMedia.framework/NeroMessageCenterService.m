@implementation NeroMessageCenterService

- (NeroMessageCenterService)initWithIDSSerivce:(id)a3 connection:(OpaqueFigTransportConnection *)a4
{
  NeroMessageCenterService *v6;
  NeroMessageCenterService *v7;
  dispatch_queue_t v8;
  IDSService *service;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NeroMessageCenterService;
  v6 = -[NeroMessageCenterService init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_connection = a4;
    v6->_service = (IDSService *)a3;
    v8 = dispatch_queue_create((const char *)objc_msgSend(CFSTR("FigTransportConnectionIDS.delegate"), "UTF8String"), 0);
    v7->_options = 0;
    v7->_serviceQueue = (OS_dispatch_queue *)v8;
    v7->_isActive = 0;
    service = v7->_service;
    if (!service || !-[IDSService canSend](service, "canSend") || !v7->_serviceQueue)
      return 0;
  }
  return v7;
}

- (void)activateConnection
{
  IDSService *service;
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  if (!self->_isActive)
  {
    -[IDSService addDelegate:queue:](self->_service, "addDelegate:queue:", self, self->_serviceQueue);
    service = self->_service;
    v4[0] = *(_QWORD *)ids_IDSLinkPreferenceOptionPacketsPerSecondKey;
    v5[0] = &unk_1E28FD8D0;
    v4[1] = *(_QWORD *)ids_IDSLinkPreferenceOptionOutputBytesPerSecondKey;
    v5[1] = &unk_1E28FD8E8;
    v4[2] = *(_QWORD *)ids_IDSLinkPreferenceOptionInputBytesPerSecondKey;
    v5[2] = &unk_1E28FD8E8;
    -[IDSService setLinkPreferences:](service, "setLinkPreferences:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3));
    -[IDSService canSend](self->_service, "canSend");
    self->_incomingPackage = 0;
    self->_incomingPackageSize = 0;
    self->_numBytesReceivedForIncomingPackage = 0;
    self->_isActive = 1;
  }
}

- (void)deactivateConnection
{
  IDSService *service;
  NSObject *serviceQueue;
  _QWORD v5[5];
  _QWORD v6[3];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  if (self->_isActive)
  {
    self->_isActive = 0;
    service = self->_service;
    v6[0] = *(_QWORD *)ids_IDSLinkPreferenceOptionPacketsPerSecondKey;
    v7[0] = &unk_1E28FD900;
    v6[1] = *(_QWORD *)ids_IDSLinkPreferenceOptionOutputBytesPerSecondKey;
    v7[1] = &unk_1E28FD900;
    v6[2] = *(_QWORD *)ids_IDSLinkPreferenceOptionInputBytesPerSecondKey;
    v7[2] = &unk_1E28FD900;
    -[IDSService setLinkPreferences:](service, "setLinkPreferences:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3));
    -[IDSService removeDelegate:](self->_service, "removeDelegate:", self);
    serviceQueue = self->_serviceQueue;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __48__NeroMessageCenterService_deactivateConnection__block_invoke;
    v5[3] = &unk_1E28D7E98;
    v5[4] = self;
    dispatch_async(serviceQueue, v5);
  }
}

void __48__NeroMessageCenterService_deactivateConnection__block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(const void **)(v2 + 56);
  if (v3)
  {
    CFRelease(v3);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0;
    v2 = *(_QWORD *)(a1 + 32);
  }
  *(_DWORD *)(v2 + 48) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 0;
}

- (BOOL)sendMemoryBlock:(void *)a3 withLength:(unint64_t)a4
{
  uint64_t v7;
  id v9;
  uint64_t v10;

  v9 = 0;
  v10 = 0;
  v7 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("__IDS_DEFAULT_PAIRED_DEVICE__"));
  if (!self->_isActive)
    return 1;
  -[IDSService sendData:toDestinations:priority:options:identifier:error:](self->_service, "sendData:toDestinations:priority:options:identifier:error:", objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", a3, a4, 1), v7, 300, self->_options, &v10, &v9);
  objc_msgSend(v9, "code");
  return v9 == 0;
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  unsigned int *v9;
  unint64_t v10;
  uint64_t DerivedStorage;
  uint64_t v13;
  unint64_t v14;
  OpaqueCMBlockBuffer **p_incomingPackage;
  const __CFAllocator *v16;
  OpaqueCMBlockBuffer *v17;
  BOOL v18;
  size_t v19;
  size_t numBytesReceivedForIncomingPackage;
  size_t v21;
  unint64_t v22;
  OpaqueCMBlockBuffer *incomingPackage;

  v9 = (unsigned int *)objc_msgSend(a5, "bytes", a3, a4);
  v10 = objc_msgSend(a5, "length");
  DerivedStorage = CMBaseObjectGetDerivedStorage((uint64_t)self->_connection);
  if (self->_isActive && v10 != 0)
  {
    v13 = DerivedStorage;
    v14 = 0;
    p_incomingPackage = &self->_incomingPackage;
    v16 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    do
    {
      v17 = *p_incomingPackage;
      if (v10 > 3)
      {
        if (!v17)
        {
          v19 = *v9;
          self->_incomingPackageSize = v19;
          if (CMBlockBufferCreateWithMemoryBlock(v16, 0, v19, *(CFAllocatorRef *)(v13 + 64), 0, 0, v19, 1u, &self->_incomingPackage))
          {
            return;
          }
          v17 = *p_incomingPackage;
        }
      }
      else
      {
        if (v17)
          v18 = v10 == v14;
        else
          v18 = 1;
        if (v18)
          return;
      }
      numBytesReceivedForIncomingPackage = self->_numBytesReceivedForIncomingPackage;
      if (v10 >= self->_incomingPackageSize - numBytesReceivedForIncomingPackage)
        v21 = self->_incomingPackageSize - numBytesReceivedForIncomingPackage;
      else
        v21 = v10;
      if (CMBlockBufferReplaceDataBytes(v9, v17, numBytesReceivedForIncomingPackage, v21))
        break;
      v22 = self->_numBytesReceivedForIncomingPackage + v21;
      self->_numBytesReceivedForIncomingPackage = v22;
      if (v22 == self->_incomingPackageSize)
      {
        ids_didReceivePackage(self->_connection, self->_incomingPackage);
        incomingPackage = self->_incomingPackage;
        if (incomingPackage)
        {
          CFRelease(incomingPackage);
          *p_incomingPackage = 0;
        }
        self->_incomingPackageSize = 0;
        self->_numBytesReceivedForIncomingPackage = 0;
      }
      v14 += v21;
    }
    while (v14 < v10);
  }
}

- (void)dealloc
{
  NSObject *serviceQueue;
  objc_super v4;

  -[NeroMessageCenterService deactivateConnection](self, "deactivateConnection");
  serviceQueue = self->_serviceQueue;
  if (serviceQueue)
  {
    dispatch_release(serviceQueue);
    self->_serviceQueue = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)NeroMessageCenterService;
  -[NeroMessageCenterService dealloc](&v4, sel_dealloc);
}

- (BOOL)isActive
{
  return self->_isActive;
}

@end
