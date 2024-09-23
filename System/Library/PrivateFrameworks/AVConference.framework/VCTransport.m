@implementation VCTransport

- (VCTransport)init
{
  id v2;
  void *v3;
  NSObject *CustomRootQueue;
  NSObject *v5;
  _QWORD v7[3];
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)VCTransport;
  v2 = -[VCTransport init](&v8, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF26A0]), "initWithObject:", v2);
    v7[0] = v3;
    v7[1] = MEMORY[0x1E0C98BD0];
    v7[2] = MEMORY[0x1E0C98BC0];
    TPCreateHandle((uint64_t *)v2 + 1, 0, 0, 0, (uint64_t)VCTransportICEConnected, (uint64_t)VCTransportICENewCandidates, (uint64_t)VCTransportICEShouldNominate, (uint64_t)VCTransportICERemoveIPPort, v3, (uint64_t)VCDataPacketReceivedCallback, (uint64_t)v7);

    *((_QWORD *)v2 + 2) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 10);
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    *((_QWORD *)v2 + 3) = dispatch_queue_create_with_target_V2("com.apple.AVConference.VCTransport.delegateQueue", 0, CustomRootQueue);
    *((_QWORD *)v2 + 4) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 4);
    v5 = VCDispatchQueue_GetCustomRootQueue(58);
    *((_QWORD *)v2 + 5) = dispatch_queue_create_with_target_V2("com.apple.VideoConference.vctransport.dataReceivedHandlerQueue", 0, v5);
  }
  return (VCTransport *)v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  TPSetDataPacketReceivedCallback((uint64_t)self->tpHandle, 0, 0);
  TPCloseHandle();

  dispatch_release((dispatch_object_t)self->delegateQueue);
  dispatch_release((dispatch_object_t)self->dataReceivedHandlerQueue);
  v3.receiver = self;
  v3.super_class = (Class)VCTransport;
  -[VCTransport dealloc](&v3, sel_dealloc);
}

+ (VCTransport)sharedInstance
{
  void *v2;
  VCTransport *Weak;
  VCTransport *v4;

  v2 = (void *)objc_opt_class();
  objc_sync_enter(v2);
  Weak = (VCTransport *)objc_loadWeak(&gVCTransportInstance);
  if (!Weak)
  {
    v4 = objc_alloc_init(VCTransport);
    objc_storeWeak(&gVCTransportInstance, v4);
    Weak = v4;
  }
  objc_sync_exit(v2);
  return Weak;
}

- (void)setReportingAgent:(opaqueRTCReporting *)a3
{
  TPSetReportingAgent();
}

- (void)registerICEBlockForCallID:(unsigned int)a3 connectedBlock:(id)a4 newCandidatesBlock:(id)a5 newNominationBlock:(id)a6 removeIPPortBlock:(id)a7
{
  NSObject *delegateQueue;
  _QWORD block[9];
  unsigned int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  delegateQueue = self->delegateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __112__VCTransport_registerICEBlockForCallID_connectedBlock_newCandidatesBlock_newNominationBlock_removeIPPortBlock___block_invoke;
  block[3] = &unk_1E9E58DA8;
  v9 = a3;
  block[6] = a5;
  block[7] = a6;
  block[8] = a7;
  block[4] = self;
  block[5] = a4;
  dispatch_async(delegateQueue, block);
}

void __112__VCTransport_registerICEBlockForCallID_connectedBlock_newCandidatesBlock_newNominationBlock_removeIPPortBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  const void *v4;
  void *v5;
  const void *v6;
  void *v7;
  const void *v8;
  void *v9;
  const void *v10;
  void *v11;
  id v12;

  v2 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 72));
  if (*(_QWORD *)(a1 + 40) || *(_QWORD *)(a1 + 48) || *(_QWORD *)(a1 + 56) || *(_QWORD *)(a1 + 64))
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
    v4 = *(const void **)(a1 + 40);
    v12 = (id)v3;
    if (v4)
    {
      v5 = _Block_copy(v4);
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v5, CFSTR("NewConnection"));

    }
    v6 = *(const void **)(a1 + 48);
    if (v6)
    {
      v7 = _Block_copy(v6);
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v7, CFSTR("NewCandidates"));

    }
    v8 = *(const void **)(a1 + 56);
    if (v8)
    {
      v9 = _Block_copy(v8);
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, CFSTR("NewNomination"));

    }
    v10 = *(const void **)(a1 + 64);
    if (v10)
    {
      v11 = _Block_copy(v10);
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, CFSTR("RemoveIPPort"));

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", v12, v2);

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:", v2);
  }
}

- (int)updateInterfaceList:(unsigned int)a3 shouldFilterCellInterface:(BOOL)a4 isUpdateNeeded:(int *)a5
{
  _BOOL4 v6;
  uint64_t v7;
  _QWORD v10[3];

  v6 = a4;
  v7 = *(_QWORD *)&a3;
  v10[2] = *MEMORY[0x1E0C80C00];
  v10[0] = 0xAAAAAAAAAAAAAAAALL;
  v10[1] = 0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(+[VideoConferenceManager defaultVideoConferenceManager](VideoConferenceManager, "defaultVideoConferenceManager"), "getClientUUID:", v10);
  objc_sync_enter(self);
  LODWORD(a5) = TPUpdateInterfaceList((uint64_t)self->tpHandle, v7, a5, v6, (const unsigned __int8 *)v10);
  objc_sync_exit(self);
  return (int)a5;
}

- (void)iceConnectedForCallID:(unsigned int)a3 result:(tagCONNRESULT *)a4 didReceivePacket:(int)a5 useRelay:(int)a6 secretKey:(__CFData *)a7 skeResult:(int)a8
{
  void *v15;
  NSObject *delegateQueue;
  _QWORD v17[7];
  unsigned int v18;
  int v19;
  int v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v15 = malloc_type_calloc(1uLL, 0x140uLL, 0x1020040A6FBA1A4uLL);
    memcpy(v15, a4, 0x140uLL);
  }
  else
  {
    v15 = 0;
  }
  delegateQueue = self->delegateQueue;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __90__VCTransport_iceConnectedForCallID_result_didReceivePacket_useRelay_secretKey_skeResult___block_invoke;
  v17[3] = &unk_1E9E56898;
  v17[4] = self;
  v17[5] = v15;
  v18 = a3;
  v19 = a5;
  v17[6] = a7;
  v20 = a6;
  v21 = a8;
  dispatch_async(delegateQueue, v17);
}

void __90__VCTransport_iceConnectedForCallID_result_didReceivePacket_useRelay_secretKey_skeResult___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 56))), "objectForKeyedSubscript:", CFSTR("NewConnection"));
  if (v2)
    (*(void (**)(uint64_t, _QWORD, BOOL, BOOL, _QWORD, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 40), *(_DWORD *)(a1 + 60) != 0, *(_DWORD *)(a1 + 64) != 0, *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 68));
  free(*(void **)(a1 + 40));
}

- (void)iceNewCandidatesForCallID:(unsigned int)a3 blob:(char *)a4 size:(int)a5 newCandidateVersion:(unsigned __int16)a6
{
  uint64_t v9;
  NSObject *delegateQueue;
  _QWORD v11[6];
  unsigned int v12;
  unsigned __int16 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a4, a5);
  delegateQueue = self->delegateQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71__VCTransport_iceNewCandidatesForCallID_blob_size_newCandidateVersion___block_invoke;
  v11[3] = &unk_1E9E57418;
  v12 = a3;
  v11[4] = self;
  v11[5] = v9;
  v13 = a6;
  dispatch_async(delegateQueue, v11);
}

uint64_t __71__VCTransport_iceNewCandidatesForCallID_blob_size_newCandidateVersion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48))), "objectForKeyedSubscript:", CFSTR("NewCandidates"));
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 40), *(unsigned __int16 *)(a1 + 52));
  return result;
}

- (void)iceShouldNominateNewCandidate:(tagCANDIDATEPAIR *)a3 forCallID:(unsigned int)a4 interfaceMask:(int)a5 nominated:(int *)a6 demote:(int *)a7 connectionPriority:(int *)a8 replaceOnly:(int *)a9
{
  NSObject *delegateQueue;
  _QWORD v10[10];
  unsigned int v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  delegateQueue = self->delegateQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __117__VCTransport_iceShouldNominateNewCandidate_forCallID_interfaceMask_nominated_demote_connectionPriority_replaceOnly___block_invoke;
  v10[3] = &unk_1E9E56780;
  v10[4] = self;
  v10[5] = a3;
  v11 = a4;
  v12 = a5;
  v10[6] = a6;
  v10[7] = a7;
  v10[8] = a8;
  v10[9] = a9;
  dispatch_sync(delegateQueue, v10);
}

void __117__VCTransport_iceShouldNominateNewCandidate_forCallID_interfaceMask_nominated_demote_connectionPriority_replaceOnly___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 80))), "objectForKeyedSubscript:", CFSTR("NewNomination"));
  if (v2)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 84), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315650;
      v6 = v3;
      v7 = 2080;
      v8 = "-[VCTransport iceShouldNominateNewCandidate:forCallID:interfaceMask:nominated:demote:connectionPriority:repla"
           "ceOnly:]_block_invoke";
      v9 = 1024;
      v10 = 261;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d iceNewNominationBlock didn't exist", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (void)iceRemoveIPPort:(tagIPPORT *)a3 forCallID:(unsigned int)a4 isLocalInterface:(BOOL)a5
{
  __int128 v5;
  NSObject *delegateQueue;
  _QWORD block[6];
  unsigned int v8;
  BOOL v9;
  _QWORD v10[4];
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x4810000000;
  v10[3] = "";
  v5 = *(_OWORD *)&a3->szIfName[12];
  v11 = *(_OWORD *)&a3->iFlags;
  v12 = v5;
  v13 = *(_QWORD *)&a3->IP.abIPv6[12];
  delegateQueue = self->delegateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__VCTransport_iceRemoveIPPort_forCallID_isLocalInterface___block_invoke;
  block[3] = &unk_1E9E58DD0;
  v8 = a4;
  block[4] = self;
  block[5] = v10;
  v9 = a5;
  dispatch_async(delegateQueue, block);
  _Block_object_dispose(v10, 8);
}

void __58__VCTransport_iceRemoveIPPort_forCallID_isLocalInterface___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48))), "objectForKeyedSubscript:", CFSTR("RemoveIPPort"));
  if (v2)
  {
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v2 + 16))(v2, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32, *(unsigned __int8 *)(a1 + 52));
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315650;
      v6 = v3;
      v7 = 2080;
      v8 = "-[VCTransport iceRemoveIPPort:forCallID:isLocalInterface:]_block_invoke";
      v9 = 1024;
      v10 = 277;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d iceRemoveIPPortBlock didn't exist", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (void)registerDataReceivedHandler:(id)a3 forCallID:(unsigned int)a4
{
  NSObject *dataReceivedHandlerQueue;
  _QWORD v5[6];
  unsigned int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  dataReceivedHandlerQueue = self->dataReceivedHandlerQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__VCTransport_registerDataReceivedHandler_forCallID___block_invoke;
  v5[3] = &unk_1E9E58DF8;
  v5[4] = self;
  v5[5] = a3;
  v6 = a4;
  dispatch_async(dataReceivedHandlerQueue, v5);
}

void __53__VCTransport_registerDataReceivedHandler_forCallID___block_invoke(uint64_t a1)
{
  const void *v2;
  void *v3;

  v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    v3 = _Block_copy(v2);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKeyedSubscript:", v3, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48)));
    _Block_release(v3);
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48)));
  }
}

- (void)receivedDataPacket:(char *)a3 length:(int)a4 forCallID:(unsigned int)a5 encrypted:(BOOL)a6 OFTType:(int)a7
{
  uint64_t v11;
  NSObject *dataReceivedHandlerQueue;
  _QWORD block[6];
  unsigned int v14;
  int v15;
  BOOL v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v11 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a3, a4);
  dataReceivedHandlerQueue = self->dataReceivedHandlerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__VCTransport_receivedDataPacket_length_forCallID_encrypted_OFTType___block_invoke;
  block[3] = &unk_1E9E55690;
  block[4] = self;
  block[5] = v11;
  v16 = a6;
  v14 = a5;
  v15 = a7;
  dispatch_async(dataReceivedHandlerQueue, block);
}

uint64_t __69__VCTransport_receivedDataPacket_length_forCallID_encrypted_OFTType___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48)));
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(unsigned int *)(a1 + 52));
  return result;
}

- (int)stopConnectivityCheckForCallID:(unsigned int)a3
{
  return TPStopConnectivityCheck();
}

- (id)getRemoteCIDForDstIPPort:(tagIPPORT *)a3 callID:(unsigned int)a4
{
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v5[0] = 0xAAAAAAAAAAAAAAAALL;
  if ((TPGetRemoteCIDForDstIPPort() & 0x80000000) != 0)
    return 0;
  else
    return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v5, 8);
}

- (int)getNextBestCandidate:(tagCANDIDATE *)a3 callID:(unsigned int)a4 isLocal:(int)a5 IPPortToExclude:(tagIPPORT *)a6
{
  return TPGetNextBestCandidate();
}

- (int)discardRelayBindingForCallID:(unsigned int)a3
{
  return TPDiscardRelayBinding();
}

- (int)discardRelayBindingForCallID:(unsigned int)a3 withChannelNumber:(int)a4
{
  return TPDiscardRelayBindingWithChannelNumber();
}

- (int)getConnectionDataForCallID:(unsigned int)a3 version:(unsigned __int8)a4 useCompressedData:(BOOL)a5 pConnectionData:(void *)a6 connectDataSizeInBytes:(int *)a7 relayDictionary:(__CFDictionary *)a8 interfaceUpdate:(BOOL)a9 nonCellularCandidateTimeout:(double)a10
{
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v18;
  _QWORD v19[3];

  v13 = a5;
  v14 = a4;
  v19[2] = *MEMORY[0x1E0C80C00];
  v19[0] = 0xAAAAAAAAAAAAAAAALL;
  v19[1] = 0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(+[VideoConferenceManager defaultVideoConferenceManager](VideoConferenceManager, "defaultVideoConferenceManager"), "getClientUUID:", v19);
  LODWORD(v18) = a9;
  return TPGetConnectionData((uint64_t)self->tpHandle, v14, a3, v13, (uint64_t)a6, (uint64_t)a7, 1, 0, (uint64_t)"static", 0, (uint64_t)a8, v18, (const unsigned __int8 *)v19);
}

- (int)setupDTLSSecurity:(unsigned int)a3 connectionResult:(tagCONNRESULT *)a4 completionHandler:(id)a5
{
  return TPSetupOpenFaceTimeSecurity((uint64_t)self->tpHandle, a3, (uint64_t)a4, (uint64_t)a5);
}

- (int)detailedErrorCodeForConnectionWithCallID:(unsigned int)a3
{
  if ((int)TPGetConnErrorCode() >= 0)
    return 400;
  else
    return 400;
}

- (int)startConnectionCheckForCallID:(unsigned int)a3 remoteConnectionDataBlob:(id)a4 relayDictionary:(id)a5 iceTimeout:(double)a6 securityIdentity:(__SecIdentity *)a7 skeState:(SKEStateOpaque *)a8 usedRelay:(int *)a9
{
  uint64_t v14;
  uint64_t v16;
  void *v17;

  v14 = *(_QWORD *)&a3;
  v16 = objc_msgSend(a4, "length");
  v17 = malloc_type_malloc((int)v16, 0xE93702F6uLL);
  objc_msgSend(a4, "getBytes:length:", v17, (int)v16);
  LODWORD(a9) = TPStartConnectionCheck(a6, (uint64_t)self->tpHandle, v14, (uint64_t)v17, v16, 0, (uint64_t)a5, (uint64_t)a9, a7);
  free(v17);
  return (int)a9;
}

- (BOOL)ipPortStillExists:(tagIPPORT *)a3 requiresWifi:(BOOL)a4
{
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5 = 0;
  TPGetInterfaceStillExists((uint64_t)self->tpHandle, (uint64_t)a3, &v5);
  return v5 != 0;
}

- (int)sendUDPPacketReliableEncrypted:(id)a3 localIPPort:(tagIPPORT *)a4 destinationIPPort:(tagIPPORT *)a5 oftType:(int)a6
{
  return TPSendUDPPacketARPL((uint64_t)self->tpHandle, (void *)objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"), (uint64_t)a4, &a5->iFlags, a6, 1, 1);
}

- (int)sendData:(id)a3 localCallID:(unsigned int)a4 remoteCallID:(unsigned int)a5 encrypted:(BOOL)a6 OFTType:(int)a7
{
  return TPSendUDPDataPacket((uint64_t)self->tpHandle, (_OWORD *)objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"), a4, a5, a6, a7);
}

- (int)setForceRelayForCallID:(unsigned int)a3
{
  return TPSetForceRelay();
}

- (int)setForceIPv6ForCallID:(unsigned int)a3
{
  return TPSetForceIPv6();
}

- (int)updateICERoleForCallID:(unsigned int)a3 role:(int)a4 remoteCallID:(unsigned int)a5 sessionID:(__CFString *)a6
{
  return TPUpdateICERole((uint64_t)self->tpHandle, *(uint64_t *)&a3, a4, a5, a6);
}

- (int)setSKEState:(SKEStateOpaque *)a3 forCallID:(unsigned int)a4
{
  return TPSetSKEState();
}

- (int)setICETimeout:(double)a3
{
  return TPSetICETimeout(a3);
}

- (int)updateQoS:(BOOL)a3
{
  return TPUpdateQoS((uint64_t)self->tpHandle, a3);
}

- (int)getLoopbackIP:(tagIPPORT *)a3
{
  return TPGetLoopbackIP((uint64_t)self->tpHandle, (uint64_t)a3);
}

- (void)setARPLHandler:(id)a3
{
  TPSetARPLHandler((uint64_t)self->tpHandle, a3);
}

- (int)processRemoteInterfaceChangeMessageWithLocalCallID:(unsigned int)a3 remoteCallID:(unsigned int)a4 remoteData:(void *)a5 remoteLen:(int)a6 remoteCandidateVersion:(unsigned __int16)a7
{
  return TPProcessRemoteInterfaceChangeMessage((uint64_t)self->tpHandle, a3, a4, (const UInt8 *)a5, a6, a7);
}

- (int)getRemoteICEVersion:(unsigned int)a3 remoteICEVersion:(unsigned int *)a4
{
  return TPGetRemoteICEVersion();
}

- (void)cleanup
{
  TPCleanupARPLHandler();
}

- (int)updateBasebandForConnection:(tagCONNRESULT *)a3 notificationRegistrationToken:(unsigned int)a4 callType:(unsigned __int8)a5
{
  return TPUpdateBaseband((uint64_t)self->tpHandle, (uint64_t)a3, a4, a5);
}

- (int)getCellTechForCallID:(unsigned int)a3 localCellTech:(int *)a4 isLocalCellularQoSEnabled:(int *)a5 remoteCellTech:(int *)a6 isRemoteCellularQoSEnabled:(int *)a7
{
  return TPGetCellTech();
}

- (int)getSignalStrengthBars:(int *)a3 displayBars:(int *)a4 maxDisplayBars:(int *)a5
{
  return TPGetSignalStrength((uint64_t)self->tpHandle, a3, a4, a5);
}

- (int)updateQualityIndicator:(int)a3 isIPv6:(BOOL)a4
{
  return TPUpdateQualityIndictor((uint64_t)self->tpHandle, a3, a4);
}

- (int)flushBasebandQueue:(void *)a3
{
  return TPFlushBasebandQueue((uint64_t)self->tpHandle, (uint64_t)a3);
}

@end
