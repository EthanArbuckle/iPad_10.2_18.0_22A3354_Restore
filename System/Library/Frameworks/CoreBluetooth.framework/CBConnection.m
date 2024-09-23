@implementation CBConnection

- (CBConnection)init
{
  CBConnection *v2;
  CBConnection *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CBConnection;
  v2 = -[CBConnection init](&v5, sel_init);
  if (v2)
  {
    v2->_clientID = CBXPCGetNextClientID();
    v2->_connectionLatency = -99;
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v2->_socketFD = -1;
    v2->_ucat = (LogCategory *)&gLogCategory_CBConnection;
    v3 = v2;
  }

  return v2;
}

- (void)dealloc
{
  LogCategory *ucat;
  CBConnection *v4;
  SEL v5;
  id v6;
  id *v7;
  objc_super v8;

  if (self->_activateCalled && !self->_invalidateCalled)
  {
    v4 = (CBConnection *)CUFatalErrorF();
    -[CBConnection initWithXPCObject:error:](v4, v5, v6, v7);
  }
  else
  {
    ucat = self->_ucat;
    if (ucat)
    {
      if ((ucat->var3 & 0x40000) != 0)
      {
        LogCategory_Remove();
        self->_ucat = 0;
      }
    }
    v8.receiver = self;
    v8.super_class = (Class)CBConnection;
    -[CBConnection dealloc](&v8, sel_dealloc);
  }
}

- (CBConnection)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CBConnection *v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  CBConnection *v21;
  const char *v23;
  uint64_t v24;

  v6 = a3;
  v13 = -[CBConnection init](self, "init");
  if (!v13)
  {
    if (!a4)
      goto LABEL_35;
    v23 = "CBConnection init failed";
LABEL_34:
    CBErrorF(-6756, (uint64_t)v23, v7, v8, v9, v10, v11, v12, v24);
    v21 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_29;
  }
  if (MEMORY[0x1A85D2194](v6) != MEMORY[0x1E0C812F8])
  {
    if (!a4)
      goto LABEL_35;
    v23 = "XPC non-dict";
    goto LABEL_34;
  }
  v14 = CUXPCDecodeUInt64RangedEx();
  if (v14 == 6)
  {
    v13->_clientID = 0;
  }
  else if (v14 == 5)
  {
    goto LABEL_35;
  }
  v15 = CUXPCDecodeUInt64RangedEx();
  if (v15 == 6)
  {
    v13->_connectionFlags = 0;
  }
  else if (v15 == 5)
  {
    goto LABEL_35;
  }
  if (!CUXPCDecodeDouble())
    goto LABEL_35;
  v16 = CUXPCDecodeUInt64RangedEx();
  if (v16 == 6)
  {
    v13->_internalFlags = 0;
  }
  else if (v16 == 5)
  {
    goto LABEL_35;
  }
  objc_opt_class();
  if (!CUXPCDecodeObject())
    goto LABEL_35;
  v17 = CUXPCDecodeUInt64RangedEx();
  if (v17 == 6)
  {
    v13->_blePSM = 0;
  }
  else if (v17 == 5)
  {
    goto LABEL_35;
  }
  v18 = CUXPCDecodeUInt64RangedEx();
  if (v18 == 6)
  {
    v13->_serviceFlags = 0;
  }
  else if (v18 == 5)
  {
    goto LABEL_35;
  }
  objc_opt_class();
  if (!CUXPCDecodeObject())
    goto LABEL_35;
  v19 = CUXPCDecodeSInt64RangedEx();
  if (v19 == 6)
  {
    v13->_socketFD = 0;
  }
  else if (v19 == 5)
  {
    goto LABEL_35;
  }
  v20 = CUXPCDecodeUInt64RangedEx();
  if (v20 == 6)
  {
    v13->_useCase = 0;
    goto LABEL_27;
  }
  if (v20 == 5)
  {
LABEL_35:
    v21 = 0;
    goto LABEL_29;
  }
LABEL_27:
  if (!CUXPCDecodeNSArrayOfNSString())
    goto LABEL_35;
  v21 = v13;
LABEL_29:

  return v21;
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4;
  uint64_t clientID;
  uint64_t connectionFlags;
  double connectTimeoutSeconds;
  uint64_t internalFlags;
  uint64_t serviceFlags;
  int64_t socketFD;
  uint64_t useCase;
  xpc_object_t xdict;

  v4 = a3;
  clientID = self->_clientID;
  xdict = v4;
  if ((_DWORD)clientID)
    xpc_dictionary_set_uint64(v4, "cid", clientID);
  connectionFlags = self->_connectionFlags;
  if ((_DWORD)connectionFlags)
    xpc_dictionary_set_uint64(xdict, "CnFl", connectionFlags);
  connectTimeoutSeconds = self->_connectTimeoutSeconds;
  if (connectTimeoutSeconds != 0.0)
    xpc_dictionary_set_double(xdict, "cnTO", connectTimeoutSeconds);
  internalFlags = self->_internalFlags;
  if ((_DWORD)internalFlags)
    xpc_dictionary_set_uint64(xdict, "intF", internalFlags);
  CUXPCEncodeObject();
  if (self->_blePSM)
    xpc_dictionary_set_uint64(xdict, "psm", self->_blePSM);
  serviceFlags = self->_serviceFlags;
  if ((_DWORD)serviceFlags)
    xpc_dictionary_set_uint64(xdict, "svFl", serviceFlags);
  CUXPCEncodeObject();
  socketFD = self->_socketFD;
  if ((_DWORD)socketFD)
    xpc_dictionary_set_int64(xdict, "sFD", socketFD);
  useCase = self->_useCase;
  if ((_DWORD)useCase)
    xpc_dictionary_set_uint64(xdict, "ucas", useCase);
  CUXPCEncodeNSArrayOfNSString();

}

- (NSString)description
{
  NSUUID *blePeerUUID;
  NSUUID *v4;
  void *v5;
  void *v6;
  void *v7;
  NSUUID *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  int64_t connectionLatency;
  id v14;
  id v15;
  CBDevice *remoteDevice;
  id v17;
  id v18;
  NSArray *serviceUUIDs;
  NSArray *v20;
  id v21;
  id v22;
  id v24;
  NSArray *useCaseClientIDs;
  NSArray *v26;
  id v27;
  NSObject *dispatchQueue;
  NSObject *v29;
  id v30;
  void *v32;
  void *v33;
  CBDevice *v34;
  void *v35;
  void *v36;
  void *v37;

  blePeerUUID = self->_blePeerUUID;
  if (blePeerUUID)
  {
    v4 = blePeerUUID;
  }
  else
  {
    -[CBL2CAPChannel peer](self->_l2capChannel, "peer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      -[CBDevice identifier](self->_peerDevice, "identifier");
      v8 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    }
    v4 = v8;

  }
  NSAppendPrintF_safe();
  v9 = 0;
  v10 = v9;
  if (self->_blePSM)
  {
    v37 = v9;
    NSAppendPrintF_safe();
    v11 = v37;

    v10 = v11;
  }
  if (self->_connectionFlags)
  {
    CUPrintFlags32();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v12 = v10;

    v10 = v12;
  }
  connectionLatency = self->_connectionLatency;
  if (connectionLatency != -99)
  {
    CBCentralManagerConnectionLatencyToString(connectionLatency);
    NSAppendPrintF_safe();
    v14 = v10;

    v10 = v14;
  }
  if (self->_serviceFlags)
  {
    CUPrintFlags32();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v15 = v10;

    v10 = v15;
  }
  remoteDevice = self->_remoteDevice;
  if (remoteDevice)
  {
    v34 = remoteDevice;
    NSAppendPrintF_safe();
    v17 = v10;

    v10 = v17;
  }
  if (self->_connectTimeoutSeconds != 0.0)
  {
    NSAppendPrintF_safe();
    v18 = v10;

    v10 = v18;
  }
  serviceUUIDs = self->_serviceUUIDs;
  if (serviceUUIDs)
  {
    v20 = serviceUUIDs;
    CUPrintNSObjectOneLine();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v21 = v10;

    v10 = v21;
  }
  if (self->_socketFD)
  {
    NSAppendPrintF_safe();
    v22 = v10;

    v10 = v22;
  }
  if (self->_useCase)
  {
    NSAppendPrintF_safe();
    v24 = v10;

    v10 = v24;
  }
  useCaseClientIDs = self->_useCaseClientIDs;
  if (useCaseClientIDs)
  {
    v26 = useCaseClientIDs;
    CUPrintNSObjectOneLine();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v27 = v10;

    v10 = v27;
  }
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
  {
    dispatch_queue_get_label(dispatchQueue);
    v29 = dispatchQueue;
    NSAppendPrintF_safe();
    v30 = v10;

    v10 = v30;
  }

  return (NSString *)v10;
}

- (CBConnection)initWithXPCEventRepresentation:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CBConnection *v13;
  const char *string;
  const char *v15;
  id v16;
  void *v17;
  uint64_t v18;
  NSUUID *blePeerUUID;
  int64_t int64;
  uint64_t v21;
  void *v22;
  int var0;
  CBConnection *v24;
  const char *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v6 = a3;
  v13 = -[CBConnection init](self, "init");
  if (!v13)
  {
    if (a4)
    {
      v26 = "CBConnection init failed";
LABEL_20:
      CBErrorF(-6756, (uint64_t)v26, v7, v8, v9, v10, v11, v12, v34);
      v24 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
LABEL_23:
    v24 = 0;
    goto LABEL_15;
  }
  if (MEMORY[0x1A85D2194](v6) != MEMORY[0x1E0C812F8])
  {
    if (a4)
    {
      v26 = "XPC non-dict";
      goto LABEL_20;
    }
    goto LABEL_23;
  }
  string = xpc_dictionary_get_string(v6, "deviceID");
  if (string)
  {
    v15 = string;
    v16 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "initWithUUIDString:", v17);
    blePeerUUID = v13->_blePeerUUID;
    v13->_blePeerUUID = (NSUUID *)v18;

    if (!v13->_blePeerUUID)
    {
      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v15);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        CBErrorF(-6705, (uint64_t)"Bad peer ID: %@", v28, v29, v30, v31, v32, v33, (uint64_t)v27);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_23;
    }
  }
  int64 = xpc_dictionary_get_int64(v6, "psm");
  if (int64)
    v13->_blePSM = int64;
  xpc_dictionary_get_value(v6, "socketFD");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  if (v21)
  {
    if (MEMORY[0x1A85D2194](v21) == MEMORY[0x1E0C81318])
    {
      v13->_socketFD = xpc_fd_dup(v22);
    }
    else
    {
      var0 = v13->_ucat->var0;
      if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
        LogPrintF_safe();
    }
  }
  v24 = v13;

LABEL_15:
  return v24;
}

- (void)setLabel:(id)a3
{
  id v4;

  objc_storeStrong((id *)&self->_label, a3);
  v4 = objc_retainAutorelease(a3);
  objc_msgSend(v4, "UTF8String");
  LogCategoryReplaceF();

}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__CBConnection_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E54007A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __39__CBConnection_activateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_activateWithCompletion:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  void *v7;
  id activateCompletion;
  _BOOL4 v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3;
  v21 = __Block_byref_object_dispose__3;
  v22 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __40__CBConnection__activateWithCompletion___block_invoke;
  v14[3] = &unk_1E53FF898;
  v16 = &v17;
  v14[4] = self;
  v5 = v4;
  v15 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x1A85D1CE4](v14);
  if (!self->_activateCalled && !self->_invalidateCalled)
  {
    self->_activateCalled = 1;
    v7 = (void *)MEMORY[0x1A85D1CE4](v5);
    activateCompletion = self->_activateCompletion;
    self->_activateCompletion = v7;

    if (self->_bluetoothStateChangedHandler)
      self->_internalFlags |= 1u;
    if (self->_pairingCompletedHandler)
      self->_internalFlags |= 0x100u;
    if (self->_pairingPromptHandler)
      self->_internalFlags |= 0x100u;
    if ((self->_connectionFlags & 0x100) != 0)
    {
      v9 = 0;
      if (self->_remoteDevice)
        goto LABEL_17;
    }
    else
    {
      v9 = self->_serviceFlags != 0;
      if (self->_remoteDevice)
        goto LABEL_17;
    }
    if (!v9)
    {
      v13 = 0;
      -[CBConnection activateDirectAndReturnError:](self, "activateDirectAndReturnError:", &v13);
      v10 = v13;
      if (v10)
      {
        v11 = self->_activateCompletion;
        self->_activateCompletion = 0;

        (*((void (**)(id, id))v5 + 2))(v5, v10);
      }
      goto LABEL_16;
    }
LABEL_17:
    -[CBConnection _activateXPCStart:](self, "_activateXPCStart:", 0);
    goto LABEL_18;
  }
  NSErrorF_safe();
  v12 = objc_claimAutoreleasedReturnValue();
  v10 = (id)v18[5];
  v18[5] = v12;
LABEL_16:

LABEL_18:
  v6[2](v6);

  _Block_object_dispose(&v17, 8);
}

uint64_t __40__CBConnection__activateWithCompletion___block_invoke(_QWORD *a1)
{
  uint64_t result;
  int v3;
  void *v4;

  result = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  if (result)
  {
    v3 = **(_DWORD **)(a1[4] + 152);
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    return (*(uint64_t (**)(void))(a1[5] + 16))();
  }
  return result;
}

- (BOOL)activateDirectAndReturnError:(id *)a3
{
  void (**v5)(_QWORD);
  CBL2CAPChannel *l2capChannel;
  void *v7;
  NSUUID *v8;
  NSUUID *blePeerUUID;
  int var0;
  CBDevice *v11;
  NSMutableArray *writeRequests;
  void *v13;
  void *v14;
  int v15;
  CBDevice *v16;
  void *v17;
  CBDevice *peerDevice;
  id *v19;
  BOOL v20;
  id activateCompletion;
  BOOL v22;
  id v23;
  id v24;
  NSMutableArray *v25;
  NSMutableArray *readRequests;
  NSMutableArray *v27;
  BOOL v28;
  int v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  NSUUID *v35;
  void *v36;
  uint64_t blePSM;
  id v38;
  id obj;
  _QWORD v40[7];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;

  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__3;
  v45 = __Block_byref_object_dispose__3;
  v46 = 0;
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __45__CBConnection_activateDirectAndReturnError___block_invoke;
  v40[3] = &unk_1E53FF9D8;
  v40[4] = self;
  v40[5] = &v41;
  v40[6] = a3;
  v5 = (void (**)(_QWORD))MEMORY[0x1A85D1CE4](v40, a2);
  l2capChannel = self->_l2capChannel;
  if (l2capChannel)
  {
    -[CBL2CAPChannel peer](l2capChannel, "peer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    blePeerUUID = self->_blePeerUUID;
    self->_blePeerUUID = v8;

    self->_blePSM = -[CBL2CAPChannel PSM](self->_l2capChannel, "PSM");
    if (self->_peerDevice)
    {
      var0 = self->_ucat->var0;
      if (var0 > 30)
        goto LABEL_15;
    }
    else
    {
      v16 = objc_alloc_init(CBDevice);
      -[NSUUID UUIDString](self->_blePeerUUID, "UUIDString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CBDevice setIdentifier:](v16, "setIdentifier:", v17);

      peerDevice = self->_peerDevice;
      self->_peerDevice = v16;

      var0 = self->_ucat->var0;
      if (var0 > 30)
      {
LABEL_15:
        v19 = (id *)(v42 + 5);
        obj = (id)v42[5];
        v20 = -[CBConnection _setupIOAndReturnError:](self, "_setupIOAndReturnError:", &obj, v35, blePSM);
        objc_storeStrong(v19, obj);
        if (!v20)
        {
          v28 = 0;
          goto LABEL_23;
        }
        writeRequests = (NSMutableArray *)MEMORY[0x1A85D1CE4](self->_activateCompletion);
        activateCompletion = self->_activateCompletion;
        self->_activateCompletion = 0;

        if (writeRequests)
          ((void (*)(NSMutableArray *, _QWORD))writeRequests[2].super.super.isa)(writeRequests, 0);
        goto LABEL_21;
      }
    }
    if (var0 != -1 || _LogCategory_Initialize())
    {
      v35 = self->_blePeerUUID;
      blePSM = self->_blePSM;
      LogPrintF_safe();
    }
    goto LABEL_15;
  }
  v11 = self->_peerDevice;
  if (!v11)
  {
    NSErrorF_safe();
    v31 = objc_claimAutoreleasedReturnValue();
    v28 = 0;
    writeRequests = (NSMutableArray *)v42[5];
    v42[5] = v31;
    goto LABEL_22;
  }
  writeRequests = (NSMutableArray *)v11;
  -[CBDevice identifier](v11, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    NSErrorF_safe();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)v42[5];
    v42[5] = v32;

    v28 = 0;
    goto LABEL_22;
  }
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v13);
  if (!v14)
  {
    NSErrorF_safe();
    v34 = objc_claimAutoreleasedReturnValue();
    v24 = (id)v42[5];
    v42[5] = v34;
LABEL_30:

    v28 = 0;
    goto LABEL_22;
  }
  objc_storeStrong((id *)&self->_blePeerUUID, v14);
  v15 = self->_ucat->var0;
  if (v15 <= 30 && (v15 != -1 || _LogCategory_Initialize()))
  {
    v35 = self->_blePeerUUID;
    blePSM = self->_blePSM;
    LogPrintF_safe();
  }
  v38 = 0;
  v22 = -[CBConnection _startConnectingAndReturnError:](self, "_startConnectingAndReturnError:", &v38, v35, blePSM);
  v23 = v38;
  v24 = v23;
  if (!v22)
  {
    v30 = self->_ucat->var0;
    if (v30 <= 90 && (v30 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    if (a3)
    {
      v24 = objc_retainAutorelease(v24);
      *a3 = v24;
    }
    goto LABEL_30;
  }

LABEL_21:
  v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  readRequests = self->_readRequests;
  self->_readRequests = v25;

  v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  writeRequests = self->_writeRequests;
  self->_writeRequests = v27;
  v28 = 1;
LABEL_22:

LABEL_23:
  v5[2](v5);

  _Block_object_dispose(&v41, 8);
  return v28;
}

void __45__CBConnection_activateDirectAndReturnError___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v2 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 152);
    if (v2 <= 90 && (v2 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    if (*(_QWORD *)(a1 + 48))
      **(_QWORD **)(a1 + 48) = objc_retainAutorelease(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  }
}

- (void)_activateXPCStart:(BOOL)a3
{
  int var0;
  xpc_object_t v5;
  _xpc_connection_s *v6;
  NSObject *dispatchQueue;
  _QWORD handler[5];

  var0 = self->_ucat->var0;
  if (a3)
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
LABEL_7:
      LogPrintF_safe();
  }
  else if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }
  v5 = xpc_dictionary_create(0, 0, 0);
  -[CBConnection encodeWithXPCObject:](self, "encodeWithXPCObject:", v5);
  xpc_dictionary_set_string(v5, "mTyp", "CnxA");
  -[CBConnection _ensureXPCStarted](self, "_ensureXPCStarted");
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  dispatchQueue = self->_dispatchQueue;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __34__CBConnection__activateXPCStart___block_invoke;
  handler[3] = &unk_1E53FFB40;
  handler[4] = self;
  xpc_connection_send_message_with_reply(v6, v5, dispatchQueue, handler);

}

uint64_t __34__CBConnection__activateXPCStart___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateXPCCompleted:", a2);
}

- (void)_activateXPCCompleted:(id)a3
{
  uint64_t v4;
  int var0;
  void (**v6)(_QWORD, _QWORD);
  id activateCompletion;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  CUXPCDecodeNSErrorIfNeeded();
  v4 = objc_claimAutoreleasedReturnValue();
  var0 = self->_ucat->var0;
  v11 = (id)v4;
  if (v4)
  {
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
  }
  else if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85D1CE4](self->_activateCompletion);
  activateCompletion = self->_activateCompletion;
  self->_activateCompletion = 0;

  if (v6)
  {
    ((void (**)(_QWORD, id))v6)[2](v6, v11);
  }
  else
  {
    v8 = MEMORY[0x1A85D1CE4](self->_errorHandler);
    v9 = (void *)v8;
    if (v8)
      (*(void (**)(uint64_t, id))(v8 + 16))(v8, v11);

  }
}

- (void)disconnectWithCompletion:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__CBConnection_disconnectWithCompletion___block_invoke;
  v7[3] = &unk_1E54007A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __41__CBConnection_disconnectWithCompletion___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  _xpc_connection_s *v3;
  void *v4;
  NSObject *v5;
  _QWORD handler[4];
  id v7;

  v2 = xpc_dictionary_create(0, 0, 0);
  objc_msgSend(*(id *)(a1 + 32), "encodeWithXPCObject:", v2);
  xpc_dictionary_set_string(v2, "mTyp", "CnxD");
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 208);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __41__CBConnection_disconnectWithCompletion___block_invoke_2;
  handler[3] = &unk_1E5400778;
  v7 = v4;
  xpc_connection_send_message_with_reply(v3, v2, v5, handler);

}

void __41__CBConnection_disconnectWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  CUXPCDecodeNSErrorIfNeeded();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (id)_ensureXPCStarted
{
  OS_xpc_object **p_xpcCnx;
  OS_xpc_object *v4;
  OS_xpc_object *v5;
  OS_xpc_object *v6;
  _xpc_connection_s *mach_service;
  _xpc_connection_s *v8;
  _QWORD v10[5];
  _xpc_connection_s *v11;

  p_xpcCnx = &self->_xpcCnx;
  v4 = self->_xpcCnx;
  if (v4)
    return v4;
  v5 = self->_xpcListenerEndpoint;
  v6 = v5;
  if (v5)
  {
    mach_service = xpc_connection_create_from_endpoint(v5);
    xpc_connection_set_target_queue(mach_service, (dispatch_queue_t)self->_dispatchQueue);
  }
  else
  {
    mach_service = xpc_connection_create_mach_service("com.apple.bluetooth.xpc", (dispatch_queue_t)self->_dispatchQueue, 0);
  }
  objc_storeStrong((id *)p_xpcCnx, mach_service);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __33__CBConnection__ensureXPCStarted__block_invoke;
  v10[3] = &unk_1E53FFB68;
  v10[4] = self;
  v8 = mach_service;
  v11 = v8;
  xpc_connection_set_event_handler(v8, v10);
  xpc_connection_activate(v8);

  return v8;
}

_QWORD *__33__CBConnection__ensureXPCStarted__block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[20] == *(_QWORD *)(a1 + 40))
    return (_QWORD *)objc_msgSend(result, "xpcReceivedMessage:", a2);
  return result;
}

- (void)_interrupted
{
  int var0;
  uint64_t v4;
  void *v5;
  void (**v6)(void);
  void (**v7)(void);

  if (!self->_invalidateCalled)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    v4 = MEMORY[0x1A85D1CE4](self->_interruptionHandler);
    v5 = (void *)v4;
    if (v4)
      (*(void (**)(uint64_t))(v4 + 16))(v4);

    self->_bluetoothState = 1;
    v6 = (void (**)(void))MEMORY[0x1A85D1CE4](self->_bluetoothStateChangedHandler);
    if (v6)
    {
      v7 = v6;
      v6[2]();
      v6 = v7;
    }

  }
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__CBConnection_invalidate__block_invoke;
  block[3] = &unk_1E53FF780;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __26__CBConnection_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_invalidate
{
  int var0;
  OS_dispatch_source *connectTimeoutTimer;
  NSObject *v5;
  OS_dispatch_source *v6;
  CBCentralManager *centralManager;
  id errorHandler;
  CBPeripheral *peripheral;
  void *v10;
  NSObject *readSource;
  OS_dispatch_source *v12;
  NSObject *writeSource;
  OS_dispatch_source *v14;
  OS_xpc_object *xpcCnx;

  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    connectTimeoutTimer = self->_connectTimeoutTimer;
    if (connectTimeoutTimer)
    {
      v5 = connectTimeoutTimer;
      dispatch_source_cancel(v5);
      v6 = self->_connectTimeoutTimer;
      self->_connectTimeoutTimer = 0;

    }
    if (self->_peripheral)
    {
      self->_guardConnected = 0;
      -[CBCentralManager cancelPeripheralConnection:](self->_centralManager, "cancelPeripheralConnection:");
    }
    -[CBCentralManager setDelegate:](self->_centralManager, "setDelegate:", 0);
    centralManager = self->_centralManager;
    self->_centralManager = 0;

    errorHandler = self->_errorHandler;
    self->_errorHandler = 0;

    -[CBPeripheral setDelegate:](self->_peripheral, "setDelegate:", 0);
    peripheral = self->_peripheral;
    self->_peripheral = 0;

    NSErrorF_safe();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBConnection _reportError:](self, "_reportError:", v10);

    readSource = self->_readSource;
    if (readSource)
    {
      dispatch_source_cancel(readSource);
      if (self->_readSuspended)
      {
        dispatch_resume((dispatch_object_t)self->_readSource);
        self->_readSuspended = 0;
      }
      v12 = self->_readSource;
      self->_readSource = 0;

    }
    writeSource = self->_writeSource;
    if (writeSource)
    {
      dispatch_source_cancel(writeSource);
      if (self->_writeSuspended)
      {
        dispatch_resume((dispatch_object_t)self->_writeSource);
        self->_writeSuspended = 0;
      }
      v14 = self->_writeSource;
      self->_writeSource = 0;

    }
    xpcCnx = self->_xpcCnx;
    if (xpcCnx)
      xpc_connection_cancel(xpcCnx);
    -[CBConnection _invalidated](self, "_invalidated");
  }
}

- (void)_invalidated
{
  void (**v3)(_QWORD);
  id activateCompletion;
  id bluetoothStateChangedHandler;
  id errorHandler;
  id interruptionHandler;
  id invalidationHandler;
  id pairingCompletedHandler;
  id pairingPromptHandler;
  id serverInvalidationHandler;
  id xpcForwardMessageReceiveHandler;
  id xpcSendEventHandler;
  int var0;
  void (**v15)(void);

  if (!self->_invalidateDone
    && !self->_readSource
    && !self->_writeSource
    && !self->_readRequestCurrent
    && !-[NSMutableArray count](self->_readRequests, "count")
    && !self->_writeRequestCurrent
    && !-[NSMutableArray count](self->_writeRequests, "count")
    && !self->_xpcCnx)
  {
    v15 = (void (**)(void))MEMORY[0x1A85D1CE4](self->_invalidationHandler);
    v3 = (void (**)(_QWORD))MEMORY[0x1A85D1CE4](self->_serverInvalidationHandler);
    activateCompletion = self->_activateCompletion;
    self->_activateCompletion = 0;

    bluetoothStateChangedHandler = self->_bluetoothStateChangedHandler;
    self->_bluetoothStateChangedHandler = 0;

    errorHandler = self->_errorHandler;
    self->_errorHandler = 0;

    interruptionHandler = self->_interruptionHandler;
    self->_interruptionHandler = 0;

    invalidationHandler = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    pairingCompletedHandler = self->_pairingCompletedHandler;
    self->_pairingCompletedHandler = 0;

    pairingPromptHandler = self->_pairingPromptHandler;
    self->_pairingPromptHandler = 0;

    serverInvalidationHandler = self->_serverInvalidationHandler;
    self->_serverInvalidationHandler = 0;

    xpcForwardMessageReceiveHandler = self->_xpcForwardMessageReceiveHandler;
    self->_xpcForwardMessageReceiveHandler = 0;

    xpcSendEventHandler = self->_xpcSendEventHandler;
    self->_xpcSendEventHandler = 0;

    if (v15)
      v15[2]();
    if (v3)
      v3[2](v3);
    self->_invalidateDone = 1;
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();

    }
    else
    {

    }
  }
}

- (BOOL)updateWithXPCSubscriberInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *serviceUUIDs;
  NSArray *v9;
  NSArray *v10;
  BOOL v11;
  NSArray *v12;
  char v13;
  NSArray *v14;
  _QWORD applier[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  v5 = v4;
  if (!v4 || MEMORY[0x1A85D2194](v4) != MEMORY[0x1E0C812F8])
  {
    v11 = 0;
    goto LABEL_14;
  }
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3;
  v21 = __Block_byref_object_dispose__3;
  v22 = 0;
  xpc_dictionary_get_array(v5, "serviceUUIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    applier[0] = MEMORY[0x1E0C809B0];
    applier[1] = 3221225472;
    applier[2] = __44__CBConnection_updateWithXPCSubscriberInfo___block_invoke;
    applier[3] = &unk_1E5402080;
    applier[4] = &v17;
    xpc_array_apply(v6, applier);
  }
  serviceUUIDs = self->_serviceUUIDs;
  v9 = (NSArray *)(id)v18[5];
  v10 = serviceUUIDs;
  v11 = v9 != v10;
  if (v9 == v10)
  {

LABEL_12:
    goto LABEL_13;
  }
  v12 = v10;
  if ((v9 == 0) == (v10 != 0))
  {

    goto LABEL_11;
  }
  v13 = -[NSArray isEqual:](v9, "isEqual:", v10);

  if ((v13 & 1) == 0)
  {
LABEL_11:
    v14 = (NSArray *)(id)v18[5];
    v9 = self->_serviceUUIDs;
    self->_serviceUUIDs = v14;
    goto LABEL_12;
  }
  v11 = 0;
LABEL_13:

  _Block_object_dispose(&v17, 8);
LABEL_14:

  return v11;
}

uint64_t __44__CBConnection_updateWithXPCSubscriberInfo___block_invoke(uint64_t a1, int a2, xpc_object_t xstring)
{
  const char *string_ptr;
  void *v5;
  CBUUID *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;

  string_ptr = xpc_string_get_string_ptr(xstring);
  if (string_ptr)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", string_ptr);
    if (v5)
    {
      v6 = -[CBUUID initWithString:safe:]([CBUUID alloc], "initWithString:safe:", v5, 1);
      if (v6)
      {
        v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
        if (!v7)
        {
          v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
          v10 = *(void **)(v9 + 40);
          *(_QWORD *)(v9 + 40) = v8;

          v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
        }
        objc_msgSend(v7, "addObject:", v6);
      }

    }
  }
  return 1;
}

- (void)xpcForwardMessage:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  CBConnection *v9;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__CBConnection_xpcForwardMessage___block_invoke;
  v7[3] = &unk_1E53FF5A0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __34__CBConnection_xpcForwardMessage___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;
  _xpc_connection_s *v5;
  xpc_object_t xdict;

  xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "kCBMsgId");
  v2 = **(_DWORD **)(*(_QWORD *)(a1 + 40) + 152);
  if (v2 <= 10 && (v2 != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  xdict = xpc_dictionary_create(0, 0, 0);
  objc_msgSend(*(id *)(a1 + 40), "encodeWithXPCObject:", xdict);
  xpc_dictionary_set_string(xdict, "mTyp", "CnxF");
  xpc_dictionary_set_value(xdict, "fwdM", *(xpc_object_t *)(a1 + 32));
  v3 = MEMORY[0x1A85D1CE4](*(_QWORD *)(*(_QWORD *)(a1 + 40) + 384));
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t, xpc_object_t))(v3 + 16))(v3, xdict);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_ensureXPCStarted");
    v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_send_message(v5, xdict);

  }
}

- (void)xpcReceivedForwardedEvent:(id)a3
{
  void *v4;
  void *v5;
  int var0;
  uint64_t v7;
  void *v8;
  int v9;
  int v10;
  int v11;
  void *v12;

  xpc_dictionary_get_value(a3, "fwdM");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v12 = v4;
  if (v4)
  {
    xpc_dictionary_get_int64(v4, "kCBMsgId");
    var0 = self->_ucat->var0;
    if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    v7 = MEMORY[0x1A85D1CE4](self->_xpcForwardMessageReceiveHandler);
    v8 = (void *)v7;
    if (v7)
    {
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v12);
    }
    else
    {
      v10 = self->_ucat->var0;
      if (v10 <= 90 && (v10 != -1 || _LogCategory_Initialize()))
        LogPrintF_safe();
    }

    goto LABEL_9;
  }
  v9 = self->_ucat->var0;
  if (v9 <= 90)
  {
    if (v9 != -1 || (v11 = _LogCategory_Initialize(), v5 = 0, v11))
    {
      LogPrintF_safe();
LABEL_9:
      v5 = v12;
    }
  }

}

- (void)xpcReceivedMessage:(id)a3
{
  id v4;
  int var0;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  int v16;
  int v17;
  void *v18;
  uint64_t v19;
  void *v20;
  OS_xpc_object *xpcCnx;
  void *v22;
  void *v23;
  id v24;

  v4 = a3;
  var0 = self->_ucat->var0;
  v24 = v4;
  if (var0 <= 9)
  {
    if (var0 != -1 || (v6 = _LogCategory_Initialize(), v4 = v24, v6))
    {
      CUPrintXPC();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

      v4 = v24;
    }
  }
  if (MEMORY[0x1A85D2194](v4) == MEMORY[0x1E0C812F8])
  {
    -[CBConnection _xpcReceivedMessage:](self, "_xpcReceivedMessage:", v24);
    goto LABEL_26;
  }
  if (v24 == (id)MEMORY[0x1E0C81258])
  {
    -[CBConnection _interrupted](self, "_interrupted");
    goto LABEL_26;
  }
  if (v24 != (id)MEMORY[0x1E0C81260])
  {
    CUXPCDecodeNSErrorIfNeeded();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v7;
    if (v7)
    {
      v15 = v7;

      v16 = self->_ucat->var0;
      if (v16 > 90)
        goto LABEL_21;
    }
    else
    {
      CBErrorF(-6700, (uint64_t)"XPC event error", v8, v9, v10, v11, v12, v13, (uint64_t)v22);
      v15 = (id)objc_claimAutoreleasedReturnValue();

      v16 = self->_ucat->var0;
      if (v16 > 90)
      {
LABEL_21:
        v19 = MEMORY[0x1A85D1CE4](self->_errorHandler);
        v20 = (void *)v19;
        if (v19)
          (*(void (**)(uint64_t, id))(v19 + 16))(v19, v15);

        goto LABEL_26;
      }
    }
    if (v16 != -1 || _LogCategory_Initialize())
    {
      CUPrintNSError();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      CUPrintXPC();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    goto LABEL_21;
  }
  if (!self->_invalidateCalled)
  {
    v17 = self->_ucat->var0;
    if (v17 <= 90 && (v17 != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
  }
  xpcCnx = self->_xpcCnx;
  self->_xpcCnx = 0;

  -[CBConnection _invalidated](self, "_invalidated");
LABEL_26:

}

- (void)_xpcReceivedMessage:(id)a3
{
  const char *string;
  const char *v5;
  int v6;
  int var0;
  id v8;

  v8 = a3;
  string = xpc_dictionary_get_string(v8, "mTyp");
  if (!string)
  {
    var0 = self->_ucat->var0;
    if (var0 > 90 || var0 == -1 && !_LogCategory_Initialize())
      goto LABEL_11;
LABEL_10:
    LogPrintF_safe();
LABEL_11:

    return;
  }
  v5 = string;
  if (!strcmp(string, "CnxF"))
  {
    -[CBConnection xpcReceivedForwardedEvent:](self, "xpcReceivedForwardedEvent:", v8);

  }
  else if (!strcmp(v5, "PrCm"))
  {
    -[CBConnection xpcReceivedPairingCompleted:](self, "xpcReceivedPairingCompleted:", v8);

  }
  else
  {
    if (strcmp(v5, "PrPm"))
    {
      v6 = self->_ucat->var0;
      if (v6 > 90 || v6 == -1 && !_LogCategory_Initialize())
        goto LABEL_11;
      goto LABEL_10;
    }
    -[CBConnection xpcReceivedPairingPrompt:](self, "xpcReceivedPairingPrompt:", v8);

  }
}

- (void)xpcReceivedPairingCompleted:(id)a3
{
  id v4;
  id v5;
  int v6;
  int var0;
  void *v8;

  v4 = a3;
  if (MEMORY[0x1A85D2194]() == MEMORY[0x1E0C812F8])
  {
    objc_opt_class();
    CUXPCDecodeObject();
    v5 = 0;
    var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
  }
  else
  {
    v6 = self->_ucat->var0;
    if (v6 <= 90 && (v6 != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
  }

}

- (void)xpcReceivedPairingPrompt:(id)a3
{
  id v4;
  id v5;
  int var0;
  int v7;
  void *v8;

  v4 = a3;
  if (MEMORY[0x1A85D2194]() == MEMORY[0x1E0C812F8])
  {
    objc_opt_class();
    CUXPCDecodeObject();
    v5 = 0;
    var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    goto LABEL_4;
  }
  v7 = self->_ucat->var0;
  if (v7 > 90 || v7 == -1 && !_LogCategory_Initialize())
  {
LABEL_4:

    return;
  }
  LogPrintF_safe();

}

- (BOOL)_startConnectingAndReturnError:(id *)a3
{
  CBCentralManager *v5;
  OS_dispatch_queue *dispatchQueue;
  void *v7;
  CBCentralManager *v8;
  CBCentralManager *centralManager;
  CBCentralManager *v10;
  unsigned int internalFlags;
  void *v12;
  uint64_t v13;
  void *v14;
  id xpcForwardMessageReceiveHandler;
  CBCentralManager *v16;
  BOOL result;
  id v18;
  _QWORD v19[5];
  _QWORD v20[5];
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  if (!self->_blePeerUUID)
  {
    if (a3)
      goto LABEL_12;
    return 0;
  }
  v5 = [CBCentralManager alloc];
  dispatchQueue = self->_dispatchQueue;
  v21 = CFSTR("kCBManagerNeedsRestrictedStateOperation");
  v22[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CBCentralManager initWithDelegate:queue:options:](v5, "initWithDelegate:queue:options:", self, dispatchQueue, v7);
  centralManager = self->_centralManager;
  self->_centralManager = v8;

  v10 = self->_centralManager;
  if (!v10)
  {
    if (a3)
    {
LABEL_12:
      NSErrorF_safe();
      v18 = (id)objc_claimAutoreleasedReturnValue();
      result = 0;
      *a3 = v18;
      return result;
    }
    return 0;
  }
  if ((self->_connectionFlags & 0x80) != 0 || (internalFlags = self->_internalFlags, (internalFlags & 0x100) != 0))
  {
    -[CBManager sharedPairingAgent](v10, "sharedPairingAgent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDelegate:", self);

    internalFlags = self->_internalFlags;
  }
  if ((internalFlags & 0x20) != 0)
  {
    v13 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __47__CBConnection__startConnectingAndReturnError___block_invoke;
    v20[3] = &unk_1E53FFB40;
    v20[4] = self;
    v14 = (void *)MEMORY[0x1A85D1CE4](v20);
    xpcForwardMessageReceiveHandler = self->_xpcForwardMessageReceiveHandler;
    self->_xpcForwardMessageReceiveHandler = v14;

    v16 = self->_centralManager;
    v19[0] = v13;
    v19[1] = 3221225472;
    v19[2] = __47__CBConnection__startConnectingAndReturnError___block_invoke_2;
    v19[3] = &unk_1E53FFB40;
    v19[4] = self;
    -[CBManager setWHBMsgReplyHandler:](v16, "setWHBMsgReplyHandler:", v19);
  }
  -[CBConnection _run](self, "_run");
  return 1;
}

void __47__CBConnection__startConnectingAndReturnError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  int v6;
  id v7;
  uint64_t v8;
  id v9;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = **(_DWORD **)(v4 + 152);
  v9 = v3;
  if (v5 <= 30)
  {
    if (v5 == -1)
    {
      v6 = _LogCategory_Initialize();
      v4 = *(_QWORD *)(a1 + 32);
      if (!v6)
      {
        v3 = v9;
        goto LABEL_6;
      }
      v3 = v9;
    }
    v7 = v3;
    v8 = *(_QWORD *)(v4 + 24);
    LogPrintF_safe();
    v3 = v9;
    v4 = *(_QWORD *)(a1 + 32);
  }
LABEL_6:
  objc_msgSend(*(id *)(v4 + 32), "didReceiveForwardedMessageForCBManager:", v3, v7, v8);

}

uint64_t __47__CBConnection__startConnectingAndReturnError___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "xpcForwardMessage:", a2);
}

- (BOOL)_setupIOAndReturnError:(id *)a3
{
  int v5;
  unsigned int v6;
  OS_dispatch_source *v7;
  OS_dispatch_source *readSource;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  OS_dispatch_source *v12;
  OS_dispatch_source *writeSource;
  NSObject *v14;
  BOOL v15;
  NSObject *v16;
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD handler[5];
  int v22;

  v5 = -[CBL2CAPChannel socketFD](self->_l2capChannel, "socketFD");
  if (v5 < 0)
  {
    if (a3)
      goto LABEL_11;
    return 0;
  }
  v6 = v5;
  self->_socketFD = v5;
  v22 = 1;
  if (setsockopt(v5, 0xFFFF, 4130, &v22, 4u) && (!*__error() || *__error()))
  {
    if (a3)
      goto LABEL_11;
    return 0;
  }
  if (SocketSetNonBlocking())
  {
    if (a3)
      goto LABEL_11;
    return 0;
  }
  v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DB8], v6, 0, (dispatch_queue_t)self->_dispatchQueue);
  readSource = self->_readSource;
  self->_readSource = v7;

  v9 = self->_readSource;
  if (!v9)
  {
    if (!a3)
      return 0;
LABEL_11:
    NSErrorF_safe();
    v15 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    return v15;
  }
  v10 = MEMORY[0x1E0C809B0];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __39__CBConnection__setupIOAndReturnError___block_invoke;
  handler[3] = &unk_1E53FF780;
  handler[4] = self;
  dispatch_source_set_event_handler(v9, handler);
  v11 = self->_readSource;
  v20[0] = v10;
  v20[1] = 3221225472;
  v20[2] = __39__CBConnection__setupIOAndReturnError___block_invoke_2;
  v20[3] = &unk_1E53FF780;
  v20[4] = self;
  dispatch_source_set_cancel_handler(v11, v20);
  dispatch_resume((dispatch_object_t)self->_readSource);
  v12 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DF0], v6, 0, (dispatch_queue_t)self->_dispatchQueue);
  writeSource = self->_writeSource;
  self->_writeSource = v12;

  v14 = self->_writeSource;
  v15 = v14 != 0;
  if (v14)
  {
    v19[0] = v10;
    v19[1] = 3221225472;
    v19[2] = __39__CBConnection__setupIOAndReturnError___block_invoke_3;
    v19[3] = &unk_1E53FF780;
    v19[4] = self;
    dispatch_source_set_event_handler(v14, v19);
    v16 = self->_writeSource;
    v18[0] = v10;
    v18[1] = 3221225472;
    v18[2] = __39__CBConnection__setupIOAndReturnError___block_invoke_4;
    v18[3] = &unk_1E53FF780;
    v18[4] = self;
    dispatch_source_set_cancel_handler(v16, v18);
    self->_writeSuspended = 1;
  }
  else if (a3)
  {
    NSErrorF_safe();
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v15;
}

uint64_t __39__CBConnection__setupIOAndReturnError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processReads:", 1);
}

uint64_t __39__CBConnection__setupIOAndReturnError___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 80);
  *(_QWORD *)(v2 + 80) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

uint64_t __39__CBConnection__setupIOAndReturnError___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processWrites");
}

uint64_t __39__CBConnection__setupIOAndReturnError___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 120);
  *(_QWORD *)(v2 + 120) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

- (void)_reportError:(id)a3
{
  int var0;
  void (**v5)(_QWORD, _QWORD);
  id activateCompletion;
  void (**v7)(_QWORD, _QWORD);
  id errorHandler;
  void *v9;
  id v10;

  v10 = a3;
  if (!self->_invalidateCalled)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
  }
  self->_state = 3;
  v5 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85D1CE4](self->_activateCompletion);
  activateCompletion = self->_activateCompletion;
  self->_activateCompletion = 0;

  if (v5)
  {
    ((void (**)(_QWORD, id))v5)[2](v5, v10);
  }
  else
  {
    v7 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85D1CE4](self->_errorHandler);
    errorHandler = self->_errorHandler;
    self->_errorHandler = 0;

    if (v7)
      ((void (**)(_QWORD, id))v7)[2](v7, v10);

  }
  -[CBConnection _abortReadsWithError:](self, "_abortReadsWithError:", v10, v9);
  -[CBConnection _abortWritesWithError:](self, "_abortWritesWithError:", v10);

}

- (void)_run
{
  int state;
  CBManagerState v4;
  int v6;
  void (**v7)(_QWORD, _QWORD);
  id activateCompletion;
  int var0;

  if (!self->_invalidateCalled)
  {
    while (1)
    {
      state = self->_state;
      switch(state)
      {
        case 0:
          self->_state = 10;
          if (state != 10)
            goto LABEL_35;
          return;
        case 10:
          v4 = -[CBManager state](self->_centralManager, "state");
          if (v4 == 10 || v4 == CBManagerStatePoweredOn)
            goto LABEL_27;
          goto LABEL_34;
        case 11:
          if (!-[CBConnection _runConnectStart](self, "_runConnectStart"))
            goto LABEL_34;
          goto LABEL_27;
        case 12:
          if (!self->_guardConnected)
            goto LABEL_34;
          self->_state = 13;
          if (state == 13)
            return;
          goto LABEL_35;
        case 13:
          self->_connectedTime = CFAbsoluteTimeGetCurrent();
          goto LABEL_27;
        case 14:
          if (self->_blePSM)
          {
            -[CBPeripheral openL2CAPChannel:](self->_peripheral, "openL2CAPChannel:");
LABEL_27:
            v6 = self->_state + 1;
            self->_state = v6;
            if (v6 == state)
              return;
          }
          else
          {
            self->_state = 18;
            if (state == 18)
              return;
          }
LABEL_35:
          var0 = self->_ucat->var0;
          if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
            LogPrintF_safe();
          break;
        case 15:
          if (!self->_l2capChannel)
            goto LABEL_34;
          self->_state = 16;
          if (state == 16)
            return;
          goto LABEL_35;
        case 16:
          self->_state = 17;
          if (state == 17)
            return;
          goto LABEL_35;
        case 17:
          if (-[CBConnection _runSetupChannel](self, "_runSetupChannel"))
            goto LABEL_27;
          goto LABEL_34;
        case 18:
          v7 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85D1CE4](self->_activateCompletion, a2);
          activateCompletion = self->_activateCompletion;
          self->_activateCompletion = 0;

          if (v7)
            v7[2](v7, 0);
          if (self->_blePSM)
          {
            -[CBConnection _processReads:](self, "_processReads:", 0);
            -[CBConnection _processWrites](self, "_processWrites");
          }

          goto LABEL_34;
        default:
LABEL_34:
          if (self->_state != state)
            goto LABEL_35;
          return;
      }
    }
  }
}

- (BOOL)_runConnectStart
{
  NSUUID *v3;
  CBCentralManager *centralManager;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSString *clientBundleID;
  void *v11;
  void *v12;
  void *v13;
  int var0;
  OS_dispatch_source *v15;
  OS_dispatch_source *connectTimeoutTimer;
  NSObject *v17;
  NSUUID *v19;
  void *v20;
  _QWORD handler[6];
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v3 = self->_blePeerUUID;
  centralManager = self->_centralManager;
  v22[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBCentralManager retrievePeripheralsWithIdentifiers:](centralManager, "retrievePeripheralsWithIdentifiers:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_storeStrong((id *)&self->_peripheral, v7);
    -[CBPeripheral setDelegate:](self->_peripheral, "setDelegate:", self);
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = v8;
    clientBundleID = self->_clientBundleID;
    if (clientBundleID)
      objc_msgSend(v8, "setObject:forKeyedSubscript:", clientBundleID, CFSTR("kCBConnectOptionClientBundleID"));
    if (self->_clientUseCase)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("kCBOptionUsecase"));

    }
    if (self->_useCase)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("kCBOptionUsecase"));

    }
    if ((self->_connectionFlags & 0x40) != 0)
      objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("kCBConnectOptionDoNoDisconnectOnEncryptionFailure"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_connectionScanDutyCycle);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("kCBConnectOptionConnectionScanDutyCycle"));

    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSObjectOneLine();
      v19 = v3;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    -[CBCentralManager connectPeripheral:options:](self->_centralManager, "connectPeripheral:options:", v7, v9, v19, v20);
    if (self->_connectTimeoutSeconds > 0.0)
    {
      v15 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      connectTimeoutTimer = self->_connectTimeoutTimer;
      self->_connectTimeoutTimer = v15;
      v17 = v15;

      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __32__CBConnection__runConnectStart__block_invoke;
      handler[3] = &unk_1E53FF5A0;
      handler[4] = v17;
      handler[5] = self;
      dispatch_source_set_event_handler(v17, handler);
      CUDispatchTimerSet();
      dispatch_activate(v17);

    }
  }
  else
  {
    NSErrorF_safe();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBConnection _reportError:](self, "_reportError:", v9, v3);
  }

  return v7 != 0;
}

void __32__CBConnection__runConnectStart__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v8;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  v8 = *(void **)(a1 + 32);
  if (v8 == *(void **)(*(_QWORD *)(a1 + 40) + 40))
  {
    if (v8)
    {
      v10 = v8;
      dispatch_source_cancel(v10);
      v11 = *(_QWORD *)(a1 + 40);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = 0;

    }
    v13 = *(void **)(a1 + 40);
    CBErrorF(-6722, (uint64_t)"Connect timeout", a3, a4, a5, a6, a7, a8, v14);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_reportError:", v15);

  }
}

- (BOOL)_runSetupChannel
{
  BOOL v3;
  id v4;
  id v6;

  v6 = 0;
  v3 = -[CBConnection _setupIOAndReturnError:](self, "_setupIOAndReturnError:", &v6);
  v4 = v6;
  if (!v3)
    -[CBConnection _reportError:](self, "_reportError:", v4);

  return v3;
}

- (void)pairingGenerateOOBDataWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__CBConnection_pairingGenerateOOBDataWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E54007A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __60__CBConnection_pairingGenerateOOBDataWithCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pairingGenerateOOBDataWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_pairingGenerateOOBDataWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (**v13)(_QWORD);
  CBPeripheral *peripheral;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  CBPeripheral *v21;
  CBCentralManager *centralManager;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  int var0;
  void *v39;
  CBServer *server;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  _QWORD v49[5];
  id v50;
  _QWORD v51[5];
  id v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;

  v4 = a3;
  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__3;
  v58 = __Block_byref_object_dispose__3;
  v59 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __61__CBConnection__pairingGenerateOOBDataWithCompletionHandler___block_invoke;
  v51[3] = &unk_1E53FF898;
  v53 = &v54;
  v51[4] = self;
  v6 = v4;
  v52 = v6;
  v13 = (void (**)(_QWORD))MEMORY[0x1A85D1CE4](v51);
  if (self->_invalidateCalled)
  {
    CBErrorF(-71148, (uint64_t)"Use after invalidate", v7, v8, v9, v10, v11, v12, v47);
    v43 = objc_claimAutoreleasedReturnValue();
LABEL_20:
    v21 = (CBPeripheral *)v55[5];
    v55[5] = v43;
    goto LABEL_17;
  }
  peripheral = self->_peripheral;
  if (peripheral)
  {
    v21 = peripheral;
    goto LABEL_5;
  }
  -[CBL2CAPChannel peer](self->_l2capChannel, "peer");
  v21 = (CBPeripheral *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    CBErrorF(-6705, (uint64_t)"No peer", v15, v16, v17, v18, v19, v20, v47);
    v43 = objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
LABEL_5:
  centralManager = self->_centralManager;
  if (centralManager)
  {
    -[CBManager sharedPairingAgent](centralManager, "sharedPairingAgent");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v23;
    if (v23)
    {
      objc_msgSend(v23, "retrieveOOBDataForPeer:", v21);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (v37)
      {
        objc_storeStrong((id *)&self->_pairingOOBData, v37);
        var0 = self->_ucat->var0;
        if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
        {
          -[CBPeer identifier](v21, "identifier");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          CUPrintNSDataHex();
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF_safe();

        }
        (*((void (**)(id, void *, _QWORD))v6 + 2))(v6, v37, 0);
      }
      else
      {
        CBErrorF(-6700, (uint64_t)"Generate OOB data failed", v31, v32, v33, v34, v35, v36, v47);
        v45 = objc_claimAutoreleasedReturnValue();
        v46 = (void *)v55[5];
        v55[5] = v45;

      }
    }
    else
    {
      CBErrorF(-6705, (uint64_t)"No pairing agent", v24, v25, v26, v27, v28, v29, v47);
      v44 = objc_claimAutoreleasedReturnValue();
      v37 = (void *)v55[5];
      v55[5] = v44;
    }

  }
  else
  {
    server = self->_server;
    if (server)
    {
      v49[0] = v5;
      v49[1] = 3221225472;
      v49[2] = __61__CBConnection__pairingGenerateOOBDataWithCompletionHandler___block_invoke_2;
      v49[3] = &unk_1E54020A8;
      v49[4] = self;
      v50 = v6;
      -[CBServer pairingGenerateOOBDataForPeer:completionHandler:](server, "pairingGenerateOOBDataForPeer:completionHandler:", v21, v49);

    }
    else
    {
      CBErrorF(-6700, (uint64_t)"No central or server", v15, v16, v17, v18, v19, v20, v47);
      v41 = objc_claimAutoreleasedReturnValue();
      v42 = (void *)v55[5];
      v55[5] = v41;

    }
  }
LABEL_17:

  v13[2](v13);
  _Block_object_dispose(&v54, 8);

}

uint64_t __61__CBConnection__pairingGenerateOOBDataWithCompletionHandler___block_invoke(_QWORD *a1)
{
  uint64_t result;
  int v3;
  void *v4;

  result = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  if (result)
  {
    v3 = **(_DWORD **)(a1[4] + 152);
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    return (*(uint64_t (**)(void))(a1[5] + 16))();
  }
  return result;
}

void __61__CBConnection__pairingGenerateOOBDataWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;

  v7 = a2;
  v6 = a3;
  if (v7 && !v6)
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)pairingSetOOBEnabled:(BOOL)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__CBConnection_pairingSetOOBEnabled_completionHandler___block_invoke;
  block[3] = &unk_1E54020D0;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

uint64_t __55__CBConnection_pairingSetOOBEnabled_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pairingSetOOBEnabled:completionHandler:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)_pairingSetOOBEnabled:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (**v14)(_QWORD);
  CBPeripheral *peripheral;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  CBPeripheral *v22;
  CBCentralManager *centralManager;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  int var0;
  void *v33;
  CBServer *server;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  _QWORD v40[5];
  id v41;
  uint64_t *v42;
  BOOL v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;

  v4 = a3;
  v6 = a4;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__3;
  v48 = __Block_byref_object_dispose__3;
  v49 = 0;
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __56__CBConnection__pairingSetOOBEnabled_completionHandler___block_invoke;
  v40[3] = &unk_1E54020F8;
  v42 = &v44;
  v40[4] = self;
  v43 = v4;
  v7 = v6;
  v41 = v7;
  v14 = (void (**)(_QWORD))MEMORY[0x1A85D1CE4](v40);
  if (self->_invalidateCalled)
  {
    CBErrorF(-71148, (uint64_t)"Use after invalidate", v8, v9, v10, v11, v12, v13, v39);
    v36 = objc_claimAutoreleasedReturnValue();
    v22 = (CBPeripheral *)v45[5];
    v45[5] = v36;
    goto LABEL_17;
  }
  peripheral = self->_peripheral;
  if (peripheral)
  {
    v22 = peripheral;
  }
  else
  {
    -[CBL2CAPChannel peer](self->_l2capChannel, "peer");
    v22 = (CBPeripheral *)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      CBErrorF(-6705, (uint64_t)"No peer", v16, v17, v18, v19, v20, v21, v39);
      v35 = objc_claimAutoreleasedReturnValue();
      v22 = 0;
      goto LABEL_13;
    }
  }
  centralManager = self->_centralManager;
  if (centralManager)
  {
    -[CBManager sharedPairingAgent](centralManager, "sharedPairingAgent");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v24;
    if (v24)
    {
      objc_msgSend(v24, "setDelegate:", self);
      objc_msgSend(v31, "setOOBPairingEnabled:forPeer:", 1, v22);
      var0 = self->_ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      {
        -[CBPeer identifier](v22, "identifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

      }
      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
    }
    else
    {
      CBErrorF(-6705, (uint64_t)"No pairing agent", v25, v26, v27, v28, v29, v30, v39);
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = (void *)v45[5];
      v45[5] = v37;

    }
    goto LABEL_16;
  }
  server = self->_server;
  if (!server)
  {
    CBErrorF(-6700, (uint64_t)"No central or server", v16, v17, v18, v19, v20, v21, v39);
    v35 = objc_claimAutoreleasedReturnValue();
LABEL_13:
    v31 = (void *)v45[5];
    v45[5] = v35;
LABEL_16:

    goto LABEL_17;
  }
  -[CBServer pairingSetOOBEnabled:peer:completionHandler:](server, "pairingSetOOBEnabled:peer:completionHandler:", v4, v22, v7);
LABEL_17:

  v14[2](v14);
  _Block_object_dispose(&v44, 8);

}

uint64_t __56__CBConnection__pairingSetOOBEnabled_completionHandler___block_invoke(_QWORD *a1)
{
  uint64_t result;
  int v3;
  void *v4;

  result = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  if (result)
  {
    v3 = **(_DWORD **)(a1[4] + 152);
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    return (*(uint64_t (**)(void))(a1[5] + 16))();
  }
  return result;
}

- (void)pairingPerformAction:(int)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;
  int v11;

  v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__CBConnection_pairingPerformAction_completionHandler___block_invoke;
  block[3] = &unk_1E54006C0;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

void __55__CBConnection_pairingPerformAction_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v9 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v9 + 49))
  {
    v11 = *(_QWORD *)(a1 + 40);
    CBErrorF(-71148, (uint64_t)"Use after invalidate", a3, a4, a5, a6, a7, a8, v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v13);

  }
  else
  {
    v10 = *(unsigned int *)(a1 + 48);
    if (*(_QWORD *)(v9 + 32))
      objc_msgSend((id)v9, "_pairingPerformActionBLE:withOptions:completionHandler:", v10, MEMORY[0x1E0C9AA70], *(_QWORD *)(a1 + 40));
    else
      objc_msgSend((id)v9, "_pairingPerformActionClassic:completionHandler:", v10, *(_QWORD *)(a1 + 40));
  }
}

- (void)pairingPerformAction:(int)a3 withOptions:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *dispatchQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int v16;

  v8 = a4;
  v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__CBConnection_pairingPerformAction_withOptions_completionHandler___block_invoke;
  v13[3] = &unk_1E5402120;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v13[4] = self;
  v11 = v8;
  v12 = v9;
  dispatch_async(dispatchQueue, v13);

}

void __67__CBConnection_pairingPerformAction_withOptions_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v9 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v9 + 49))
  {
    v13 = *(_QWORD *)(a1 + 48);
    CBErrorF(-71148, (uint64_t)"Use after invalidate", a3, a4, a5, a6, a7, a8, v14);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v15);

  }
  else
  {
    v10 = *(unsigned int *)(a1 + 56);
    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(_QWORD *)(a1 + 48);
    if (*(_QWORD *)(v9 + 32))
      objc_msgSend((id)v9, "_pairingPerformActionBLE:withOptions:completionHandler:", v10, v11, v12);
    else
      objc_msgSend((id)v9, "_pairingPerformActionClassic:withOptions:completionHandler:", v10, v11, v12);
  }
}

- (void)_pairingPerformActionBLE:(int)a3 withOptions:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  CBPeripheral *v25;
  int var0;
  uint64_t v27;
  void *v28;
  const char *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t);
  void *v49;
  CBConnection *v50;
  id v51;
  uint64_t *v52;
  int v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;

  v8 = a4;
  v9 = a5;
  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__3;
  v58 = __Block_byref_object_dispose__3;
  v59 = 0;
  v46 = MEMORY[0x1E0C809B0];
  v47 = 3221225472;
  v48 = __71__CBConnection__pairingPerformActionBLE_withOptions_completionHandler___block_invoke;
  v49 = &unk_1E5402148;
  v52 = &v54;
  v50 = self;
  v53 = a3;
  v10 = v9;
  v51 = v10;
  v11 = (void (**)(_QWORD))MEMORY[0x1A85D1CE4](&v46);
  -[CBManager sharedPairingAgent](self->_centralManager, "sharedPairingAgent");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v25 = self->_peripheral;
    if (v25)
    {
      var0 = self->_ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      {
        -[CBPeer identifier](v25, "identifier");
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = (void *)v27;
        if (a3 > 3)
          v29 = "?";
        else
          v29 = off_1E5402228[a3];
        v44 = v27;
        v45 = v29;
        LogPrintF_safe();

      }
      v30 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      if (objc_msgSend(v8, "count"))
      {
        v37 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kCBMsgArgPairingPasskey"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "numberWithInteger:", objc_msgSend(v38, "integerValue"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setObject:forKeyedSubscript:", v39, CFSTR("kCBMsgArgPairingPasskey"));

      }
      if ((a3 - 1) > 2)
      {
        CBErrorF(-6705, (uint64_t)"Bad pairing action", v31, v32, v33, v34, v35, v36, v44);
        v40 = objc_claimAutoreleasedReturnValue();
        v41 = (void *)v55[5];
        v55[5] = v40;

      }
      else
      {
        objc_msgSend(v18, "respondToPairingRequest:type:accept:data:", v25, self->_pairingType, (((_BYTE)a3 - 1) & 7) == 0, v30, v44, v45, v46, v47, v48, v49, v50);
        if (v10)
          (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
      }
    }
    else
    {
      CBErrorF(-6705, (uint64_t)"No peripheral", v19, v20, v21, v22, v23, v24, v44);
      v43 = objc_claimAutoreleasedReturnValue();
      v30 = (id)v55[5];
      v55[5] = v43;
    }

  }
  else
  {
    CBErrorF(-6705, (uint64_t)"No pairing agent", v12, v13, v14, v15, v16, v17, v44);
    v42 = objc_claimAutoreleasedReturnValue();
    v25 = (CBPeripheral *)v55[5];
    v55[5] = v42;
  }

  v11[2](v11);
  _Block_object_dispose(&v54, 8);

}

uint64_t __71__CBConnection__pairingPerformActionBLE_withOptions_completionHandler___block_invoke(uint64_t result)
{
  _QWORD *v1;
  uint64_t v2;
  int v3;
  void *v4;
  void *v5;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 40))
  {
    v1 = (_QWORD *)result;
    v2 = *(_QWORD *)(result + 32);
    v3 = **(_DWORD **)(v2 + 152);
    if (v3 <= 90)
    {
      if (v3 != -1)
      {
LABEL_4:
        objc_msgSend(*(id *)(v2 + 304), "identifier");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        result = v1[5];
        if (!result)
          return result;
        return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(v1[6] + 8) + 40));
      }
      if (_LogCategory_Initialize())
      {
        v2 = v1[4];
        goto LABEL_4;
      }
    }
    result = v1[5];
    if (!result)
      return result;
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(v1[6] + 8) + 40));
  }
  return result;
}

- (void)_pairingPerformActionClassic:(int)a3 completionHandler:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (**v12)(id, void *);
  const char *v13;
  int v14;
  void *v15;
  xpc_object_t v16;
  CBPairingInfo *v17;
  _xpc_connection_s *v18;
  NSObject *dispatchQueue;
  uint64_t v20;
  _QWORD handler[4];
  void (**v22)(id, void *);

  v12 = (void (**)(id, void *))a4;
  if (a3 == 1)
  {
    v15 = 0;
  }
  else
  {
    if (a3 == 3)
    {
      v13 = "User canceled pairing";
      v14 = -6723;
    }
    else
    {
      if (a3 != 2)
      {
        CBErrorF(-6705, (uint64_t)"Bad pairing action", v6, v7, v8, v9, v10, v11, v20);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v12[2](v12, v15);
        goto LABEL_10;
      }
      v13 = "User rejected pairing";
      v14 = -71146;
    }
    CBErrorF(v14, (uint64_t)v13, v6, v7, v8, v9, v10, v11, v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v16, "mTyp", "CnPC");
  v17 = objc_alloc_init(CBPairingInfo);
  -[CBPairingInfo setDevice:](v17, "setDevice:", self->_peerDevice);
  -[CBPairingInfo setError:](v17, "setError:", v15);
  CUXPCEncodeObject();
  -[CBConnection _ensureXPCStarted](self, "_ensureXPCStarted");
  v18 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  dispatchQueue = self->_dispatchQueue;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __63__CBConnection__pairingPerformActionClassic_completionHandler___block_invoke;
  handler[3] = &unk_1E5400778;
  v22 = v12;
  xpc_connection_send_message_with_reply(v18, v16, dispatchQueue, handler);

LABEL_10:
}

void __63__CBConnection__pairingPerformActionClassic_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  CUXPCDecodeNSErrorIfNeeded();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)_pairingPerformActionClassic:(int)a3 withOptions:(id)a4 completionHandler:(id)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (**v15)(id, void *);
  const char *v16;
  int v17;
  void *v18;
  xpc_object_t v19;
  CBPairingInfo *v20;
  void *v21;
  _xpc_connection_s *v22;
  NSObject *dispatchQueue;
  uint64_t v24;
  _QWORD handler[4];
  void (**v26)(id, void *);

  v8 = a4;
  v15 = (void (**)(id, void *))a5;
  if (a3 == 1)
  {
    v18 = 0;
  }
  else
  {
    if (a3 == 3)
    {
      v16 = "User canceled pairing";
      v17 = -6723;
    }
    else
    {
      if (a3 != 2)
      {
        CBErrorF(-6705, (uint64_t)"Bad pairing action", v9, v10, v11, v12, v13, v14, v24);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v15[2](v15, v18);
        goto LABEL_12;
      }
      v16 = "User rejected pairing";
      v17 = -71146;
    }
    CBErrorF(v17, (uint64_t)v16, v9, v10, v11, v12, v13, v14, v24);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v19, "mTyp", "CnPC");
  v20 = objc_alloc_init(CBPairingInfo);
  -[CBPairingInfo setDevice:](v20, "setDevice:", self->_peerDevice);
  -[CBPairingInfo setError:](v20, "setError:", v18);
  if (v8)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kCBMsgArgPairingPasskey"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBPairingInfo setPin:](v20, "setPin:", v21);

  }
  CUXPCEncodeObject();
  -[CBConnection _ensureXPCStarted](self, "_ensureXPCStarted");
  v22 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  dispatchQueue = self->_dispatchQueue;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __75__CBConnection__pairingPerformActionClassic_withOptions_completionHandler___block_invoke;
  handler[3] = &unk_1E5400778;
  v26 = v15;
  xpc_connection_send_message_with_reply(v22, v19, dispatchQueue, handler);

LABEL_12:
}

void __75__CBConnection__pairingPerformActionClassic_withOptions_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  CUXPCDecodeNSErrorIfNeeded();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)pairWithOOBData:(id)a3
{
  void *v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = (void *)objc_msgSend(a3, "copy");
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __32__CBConnection_pairWithOOBData___block_invoke;
  v7[3] = &unk_1E53FF5A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __32__CBConnection_pairWithOOBData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pairWithOOBData:", *(_QWORD *)(a1 + 40));
}

- (void)_pairWithOOBData:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (**v12)(_QWORD);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CBPeripheral *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  int var0;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  _QWORD v36[6];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v5 = a3;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__3;
  v41 = __Block_byref_object_dispose__3;
  v42 = 0;
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __33__CBConnection__pairWithOOBData___block_invoke;
  v36[3] = &unk_1E53FF8C0;
  v36[4] = self;
  v36[5] = &v37;
  v12 = (void (**)(_QWORD))MEMORY[0x1A85D1CE4](v36);
  if (self->_invalidateCalled)
  {
    CBErrorF(-71148, (uint64_t)"Use after invalidate", v6, v7, v8, v9, v10, v11, v34);
    v30 = objc_claimAutoreleasedReturnValue();
    v19 = (CBPeripheral *)v38[5];
    v38[5] = v30;
  }
  else
  {
    v19 = self->_peripheral;
    if (v19)
    {
      -[CBManager sharedPairingAgent](self->_centralManager, "sharedPairingAgent");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v20;
      if (v20)
      {
        objc_msgSend(v20, "setDelegate:", self);
        var0 = self->_ucat->var0;
        if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
        {
          -[CBPeer identifier](v19, "identifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          CUPrintNSDataHex();
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF_safe();

        }
        objc_storeStrong((id *)&self->_pairingOOBData, a3);
        objc_msgSend(v27, "pairPeer:", v19);
      }
      else
      {
        CBErrorF(-6705, (uint64_t)"No pairing agent", v21, v22, v23, v24, v25, v26, v34);
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = (void *)v38[5];
        v38[5] = v32;

      }
    }
    else
    {
      CBErrorF(-6705, (uint64_t)"No peer", v13, v14, v15, v16, v17, v18, v34);
      v31 = objc_claimAutoreleasedReturnValue();
      v27 = (void *)v38[5];
      v38[5] = v31;
    }

  }
  v12[2](v12);

  _Block_object_dispose(&v37, 8);
}

void __33__CBConnection__pairWithOOBData___block_invoke(uint64_t a1)
{
  int v1;
  id v2;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v1 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 152);
    if (v1 <= 90 && (v1 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v2 = (id)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
  }
}

- (void)readWithCBReadRequest:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__CBConnection_readWithCBReadRequest___block_invoke;
  v7[3] = &unk_1E53FF5A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __38__CBConnection_readWithCBReadRequest___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _DWORD *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 49))
  {
    v3 = *(_QWORD *)(a1 + 40);
    NSErrorF_safe();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v2, "_completeReadRequest:error:", v3, v5);

  }
  else
  {
    objc_msgSend(*(id *)(v2 + 104), "addObject:", *(_QWORD *)(a1 + 40));
    v4 = *(_DWORD **)(a1 + 32);
    if ((v4[28] & 0x80000000) == 0)
      objc_msgSend(v4, "_processReads:", 0);
  }
}

- (void)_processReads:(BOOL)a3
{
  int v4;
  CBReadRequest **p_readRequestCurrent;
  int *v6;
  CBReadRequest *v7;
  uint64_t v8;
  uint64_t v9;
  int Data;
  int var0;
  uint64_t v12;
  uint64_t v13;
  int *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  CBReadRequest *readRequestCurrent;
  void *v19;
  CBReadRequest *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _BOOL4 v27;
  CBReadRequest **v28;
  uint64_t socketFD;
  CBReadRequest *obja;
  CBReadRequest *obj;

  v27 = a3;
  v4 = 0;
  p_readRequestCurrent = &self->_readRequestCurrent;
  v6 = &OBJC_IVAR___CBReadRequest__length;
  v28 = &self->_readRequestCurrent;
  do
  {
    v7 = *p_readRequestCurrent;
    if (!v7)
    {
      -[NSMutableArray firstObject](self->_readRequests, "firstObject");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        obja = (CBReadRequest *)v8;
        -[NSMutableArray removeObjectAtIndex:](self->_readRequests, "removeObjectAtIndex:", 0);
        -[CBConnection _prepareReadRequest:](self, "_prepareReadRequest:", obja);
        objc_storeStrong((id *)p_readRequestCurrent, obja);
        v7 = obja;
        goto LABEL_5;
      }
      if (!v27)
        goto LABEL_31;
      if (v4)
      {
        if (!self->_readSuspended)
          goto LABEL_31;
        goto LABEL_30;
      }
      if (-[CBConnection _processReadStatus](self, "_processReadStatus"))
      {
        if (!self->_readSuspended)
        {
          self->_readSuspended = 1;
          dispatch_suspend((dispatch_object_t)self->_readSource);
          v20 = 0;
LABEL_18:

          return;
        }
      }
      else if (self->_readSuspended)
      {
LABEL_30:
        self->_readSuspended = 0;
        dispatch_resume((dispatch_object_t)self->_readSource);
        v20 = 0;
        goto LABEL_18;
      }
LABEL_31:
      v20 = 0;
      goto LABEL_18;
    }
LABEL_5:
    v9 = *(uint64_t *)((char *)&v7->super.isa + *v6);
    obj = v7;
    -[CBReadRequest minLength](v7, "minLength", v21, v22, v23, v24, v25, v26);
    -[CBReadRequest maxLength](obj, "maxLength");
    Data = SocketReadDataEx();
    var0 = self->_ucat->var0;
    if (var0 <= 9 && (var0 != -1 || _LogCategory_Initialize()))
    {
      socketFD = self->_socketFD;
      v12 = -[CBReadRequest minLength](obj, "minLength");
      v13 = -[CBReadRequest maxLength](obj, "maxLength");
      v14 = v6;
      v15 = *(uint64_t *)((char *)&obj->super.isa + *v6);
      CUPrintErrorCode();
      v25 = v15;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v14;
      v23 = v13;
      v24 = v9;
      v21 = socketFD;
      v22 = v12;
      LogPrintF_safe();

      p_readRequestCurrent = v28;
    }
    if (Data)
    {
      if (Data == 35)
      {
        if (self->_readSuspended)
        {
          self->_readSuspended = 0;
          dispatch_resume((dispatch_object_t)self->_readSource);
        }
      }
      else
      {
        NSErrorF_safe();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[CBConnection _abortReadsWithError:](self, "_abortReadsWithError:", v19);

      }
      v20 = obj;
      goto LABEL_18;
    }
    v16 = *(uint64_t *)((char *)&obj->super.isa + *v6);
    -[CBReadRequest bufferData](obj, "bufferData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setLength:", v16);

    readRequestCurrent = self->_readRequestCurrent;
    self->_readRequestCurrent = 0;

    -[CBConnection _completeReadRequest:error:](self, "_completeReadRequest:error:", obj, 0);
    ++v4;
  }
  while (v4 != 4);
  if (self->_readSuspended)
  {
    self->_readSuspended = 0;
    dispatch_resume((dispatch_object_t)self->_readSource);
  }
}

- (void)_prepareReadRequest:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  int var0;
  void *v9;
  _QWORD *v10;

  v10 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", objc_msgSend(v10, "maxLength"));
  objc_msgSend(v10, "setBufferData:", v4);

  objc_msgSend(v10, "bufferData");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10[1] = objc_msgSend(v5, "mutableBytes");

  objc_msgSend(v10, "bufferData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setData:", v6);

  v10[3] = 0;
  v7 = (void *)v10[2];
  v10[2] = 0;

  var0 = self->_ucat->var0;
  if (var0 > 9)
    goto LABEL_6;
  v9 = v10;
  if (var0 == -1)
  {
    if (_LogCategory_Initialize())
    {
      v9 = v10;
      goto LABEL_3;
    }
LABEL_6:

    return;
  }
LABEL_3:
  objc_msgSend(v9, "minLength");
  objc_msgSend(v10, "maxLength");
  LogPrintF_safe();

}

- (void)_abortReadsWithError:(id)a3
{
  id v4;
  int var0;
  CBReadRequest *v6;
  CBReadRequest *readRequestCurrent;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CBReadRequest *v13;
  NSObject *readSource;
  void (**v15)(_QWORD, _QWORD);
  id errorHandler;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_readRequestCurrent || -[NSMutableArray count](self->_readRequests, "count"))
  {
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
  }
  v6 = self->_readRequestCurrent;
  if (v6)
  {
    readRequestCurrent = self->_readRequestCurrent;
    self->_readRequestCurrent = 0;

    -[CBConnection _completeReadRequest:error:](self, "_completeReadRequest:error:", v6, v4);
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = self->_readRequests;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      v13 = v6;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v6 = (CBReadRequest *)*(id *)(*((_QWORD *)&v18 + 1) + 8 * v12);

        -[CBConnection _completeReadRequest:error:](self, "_completeReadRequest:error:", v6, v4);
        ++v12;
        v13 = v6;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  -[NSMutableArray removeAllObjects](self->_readRequests, "removeAllObjects");
  readSource = self->_readSource;
  if (readSource && !self->_readSuspended)
  {
    self->_readSuspended = 1;
    dispatch_suspend(readSource);
  }
  v15 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85D1CE4](self->_errorHandler);
  errorHandler = self->_errorHandler;
  self->_errorHandler = 0;

  if (v15)
    ((void (**)(_QWORD, id))v15)[2](v15, v4);
  -[CBConnection _invalidated](self, "_invalidated", v17);

}

- (BOOL)_processReadStatus
{
  ssize_t v3;
  int v4;
  void (**v6)(_QWORD, _QWORD);
  id v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  id errorHandler;
  void *v11;
  char v12;

  do
  {
    v12 = 0;
    v3 = recv(self->_socketFD, &v12, 1uLL, 2);
    if ((v3 & 0x8000000000000000) == 0)
    {
      if (!v3)
      {
        v9 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85D1CE4](self->_errorHandler);
        errorHandler = self->_errorHandler;
        self->_errorHandler = 0;

        if (v9)
        {
          NSErrorF_safe();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v9)[2](v9, v11);

        }
        return 1;
      }
      return 1;
    }
    if (!*__error())
      goto LABEL_9;
    v4 = *__error();
  }
  while (v4 == 4);
  if (!v4)
    return 1;
  if (v4 == 35)
    return 0;
LABEL_9:
  v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85D1CE4](self->_errorHandler);
  v7 = self->_errorHandler;
  self->_errorHandler = 0;

  if (v6)
  {
    NSErrorF_safe();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v6)[2](v6, v8);

  }
  return 1;
}

- (void)_completeReadRequest:(id)a3 error:(id)a4
{
  id v6;
  int var0;
  void *v8;
  void *v9;
  void (**v10)(_QWORD);
  void *v11;
  _QWORD *v12;

  v12 = a3;
  v6 = a4;
  var0 = self->_ucat->var0;
  if (var0 <= 9)
  {
    v8 = v12;
    if (var0 != -1)
    {
LABEL_3:
      objc_msgSend(v8, "length");
      CUPrintNSError();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

      goto LABEL_5;
    }
    if (_LogCategory_Initialize())
    {
      v8 = v12;
      goto LABEL_3;
    }
  }
LABEL_5:
  v9 = (void *)v12[2];
  v12[2] = v6;

  objc_msgSend(v12, "completion");
  v10 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCompletion:", 0);
  if (v10)
    v10[2](v10);

}

- (void)writeWithCBWriteRequest:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__CBConnection_writeWithCBWriteRequest___block_invoke;
  v7[3] = &unk_1E53FF5A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __40__CBConnection_writeWithCBWriteRequest___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _DWORD *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 49))
  {
    v3 = *(_QWORD *)(a1 + 40);
    NSErrorF_safe();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v2, "_completeWriteRequest:error:", v3, v5);

  }
  else
  {
    objc_msgSend(*(id *)(v2 + 144), "addObject:", *(_QWORD *)(a1 + 40));
    v4 = *(_DWORD **)(a1 + 32);
    if ((v4[28] & 0x80000000) == 0)
      objc_msgSend(v4, "_processWrites");
  }
}

- (void)writeEndOfDataWithCompletion:(id)a3
{
  id v4;
  CBWriteRequest *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  CBWriteRequest *v10;
  id v11;

  v4 = a3;
  v5 = objc_alloc_init(CBWriteRequest);
  -[CBWriteRequest setEndOfData:](v5, "setEndOfData:", 1);
  if (v4)
  {
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __45__CBConnection_writeEndOfDataWithCompletion___block_invoke;
    v9 = &unk_1E53FF5F0;
    v10 = v5;
    v11 = v4;
    -[CBWriteRequest setCompletion:](v5, "setCompletion:", &v6);

  }
  -[CBConnection writeWithCBWriteRequest:](self, "writeWithCBWriteRequest:", v5, v6, v7, v8, v9);

}

void __45__CBConnection_writeEndOfDataWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)_processWrites
{
  CBWriteRequest **p_writeRequestCurrent;
  int *v4;
  int v5;
  void *v6;
  CBWriteRequest *writeRequestCurrent;
  CBWriteRequest *v8;
  uint64_t v9;
  int v10;
  int var0;
  int *v12;
  uint64_t v13;
  uint64_t socketFD;
  uint64_t v15;
  id v16;
  int v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  CBWriteRequest **v23;
  id v24;

  p_writeRequestCurrent = &self->_writeRequestCurrent;
  v4 = &OBJC_IVAR___CBWriteRequest__ion;
  v5 = 4;
  v23 = &self->_writeRequestCurrent;
  do
  {
    v8 = *p_writeRequestCurrent;
    if (!v8)
    {
      -[NSMutableArray firstObject](self->_writeRequests, "firstObject");
      v15 = objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        if (!self->_writeSuspended)
        {
          self->_writeSuspended = 1;
          dispatch_suspend((dispatch_object_t)self->_writeSource);
        }
        v8 = 0;
        goto LABEL_35;
      }
      v8 = (CBWriteRequest *)v15;
      -[NSMutableArray removeObjectAtIndex:](self->_writeRequests, "removeObjectAtIndex:", 0);
      v24 = 0;
      -[CBConnection _prepareWriteRequest:error:](self, "_prepareWriteRequest:error:", v8, &v24);
      v16 = v24;
      if (v16)
      {
        v6 = v16;
        goto LABEL_4;
      }
      objc_storeStrong((id *)p_writeRequestCurrent, v8);
    }
    v9 = *(unsigned int *)((char *)&v8->super.isa + *v4);
    v10 = SocketWriteData();
    var0 = self->_ucat->var0;
    if (var0 <= 9 && (var0 != -1 || _LogCategory_Initialize()))
    {
      v12 = v4;
      v13 = *(unsigned int *)((char *)&v8->super.isa + *v4);
      socketFD = self->_socketFD;
      CUPrintErrorCode();
      v21 = v13;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v12;
      v19 = socketFD;
      v20 = v9;
      LogPrintF_safe();

      p_writeRequestCurrent = v23;
    }
    if (v10)
    {
      if (v10 == 35)
      {
        if (self->_writeSuspended)
        {
          self->_writeSuspended = 0;
          dispatch_resume((dispatch_object_t)self->_writeSource);
        }
      }
      else
      {
        NSErrorF_safe();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[CBConnection _abortWritesWithError:](self, "_abortWritesWithError:", v18);

      }
LABEL_35:

      return;
    }
    if (!-[CBWriteRequest endOfData](v8, "endOfData"))
      goto LABEL_2;
    v17 = self->_ucat->var0;
    if (v17 <= 9 && (v17 != -1 || _LogCategory_Initialize()))
    {
      v19 = self->_socketFD;
      LogPrintF_safe();
    }
    if (shutdown(self->_socketFD, 1) && (!*__error() || *__error()))
    {
      NSErrorF_safe();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_2:
      v6 = 0;
    }
    writeRequestCurrent = self->_writeRequestCurrent;
    self->_writeRequestCurrent = 0;

LABEL_4:
    -[CBConnection _completeWriteRequest:error:](self, "_completeWriteRequest:error:", v8, v6, v19, v20, v21, v22);

    --v5;
  }
  while (v5);
  if (self->_writeSuspended)
  {
    self->_writeSuspended = 0;
    dispatch_resume((dispatch_object_t)self->_writeSource);
  }
}

- (BOOL)_prepareWriteRequest:(id)a3 error:(id *)a4
{
  char *v5;
  void *v6;
  unint64_t v7;
  char *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  void *v15;
  int v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  const double *v24;
  int64x2_t v25;
  int64x2_t v26;
  const double *v27;
  unsigned __int128 v28;
  unsigned __int128 v29;
  uint64_t v30;
  int var0;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = (char *)a3;
  objc_msgSend(v5, "dataArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  if (v7 >= 0x11)
  {
    if (a4)
    {
      NSErrorF_safe();
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v8 = v5 + 16;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v35 != v12)
            objc_enumerationMutation(v9);
          v14 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i));
          *(_QWORD *)v8 = objc_msgSend(v14, "bytes");
          *((_QWORD *)v8 + 1) = objc_msgSend(v14, "length");
          v8 += 16;
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v11);
    }

    *((_QWORD *)v5 + 34) = v5 + 16;
    *((_DWORD *)v5 + 70) = (unint64_t)(v8 - v5 - 16) >> 4;
    *((_QWORD *)v5 + 36) = 0;
    v15 = (void *)*((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = 0;

    if (gLogCategory_CBConnection <= 9 && (gLogCategory_CBConnection != -1 || _LogCategory_Initialize()))
    {
      v16 = *((_DWORD *)v5 + 70);
      if (v16)
      {
        v17 = *((_QWORD *)v5 + 34);
        v18 = (v16 - 1) & 0xFFFFFFFFFFFFFFFLL;
        if (v18 >= 4)
        {
          v21 = v18 + 1;
          v22 = v21 & 3;
          if ((v21 & 3) == 0)
            v22 = 4;
          v23 = v21 - v22;
          v20 = v17 + 16 * v23;
          v24 = (const double *)(v17 + 40);
          v25 = 0uLL;
          v26 = 0uLL;
          do
          {
            v27 = v24 - 4;
            v28 = (unsigned __int128)vld2q_f64(v27);
            v29 = (unsigned __int128)vld2q_f64(v24);
            v25 = vaddq_s64((int64x2_t)v28, v25);
            v26 = vaddq_s64((int64x2_t)v29, v26);
            v24 += 8;
            v23 -= 4;
          }
          while (v23);
          v19 = vaddvq_s64(vaddq_s64(v26, v25));
        }
        else
        {
          v19 = 0;
          v20 = *((_QWORD *)v5 + 34);
        }
        v30 = v17 + 16 * v16;
        do
        {
          v19 += *(_QWORD *)(v20 + 8);
          v20 += 16;
        }
        while (v20 != v30);
      }
      var0 = self->_ucat->var0;
      if (var0 <= 9 && (var0 != -1 || _LogCategory_Initialize()))
        LogPrintF_safe();
    }
  }

  return v7 < 0x11;
}

- (void)_abortWritesWithError:(id)a3
{
  id v4;
  int var0;
  CBWriteRequest *v6;
  CBWriteRequest *writeRequestCurrent;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CBWriteRequest *v13;
  NSObject *writeSource;
  void (**v15)(_QWORD, _QWORD);
  id errorHandler;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_writeRequestCurrent || -[NSMutableArray count](self->_writeRequests, "count"))
  {
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
  }
  v6 = self->_writeRequestCurrent;
  if (v6)
  {
    writeRequestCurrent = self->_writeRequestCurrent;
    self->_writeRequestCurrent = 0;

    -[CBConnection _completeWriteRequest:error:](self, "_completeWriteRequest:error:", v6, v4);
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = self->_writeRequests;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      v13 = v6;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v6 = (CBWriteRequest *)*(id *)(*((_QWORD *)&v18 + 1) + 8 * v12);

        -[CBConnection _completeWriteRequest:error:](self, "_completeWriteRequest:error:", v6, v4);
        ++v12;
        v13 = v6;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  -[NSMutableArray removeAllObjects](self->_writeRequests, "removeAllObjects");
  writeSource = self->_writeSource;
  if (writeSource && !self->_writeSuspended)
  {
    self->_writeSuspended = 1;
    dispatch_suspend(writeSource);
  }
  v15 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85D1CE4](self->_errorHandler);
  errorHandler = self->_errorHandler;
  self->_errorHandler = 0;

  if (v15)
    ((void (**)(_QWORD, id))v15)[2](v15, v4);
  -[CBConnection _invalidated](self, "_invalidated", v17);

}

- (void)_completeWriteRequest:(id)a3 error:(id)a4
{
  id v6;
  int var0;
  void *v8;
  void (**v9)(_QWORD);
  void *v10;
  _QWORD *v11;

  v11 = a3;
  v6 = a4;
  var0 = self->_ucat->var0;
  if (var0 <= 9 && (var0 != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
  v8 = (void *)v11[1];
  v11[1] = v6;

  objc_msgSend(v11, "completion");
  v9 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCompletion:", 0);
  if (v9)
    v9[2](v9);

}

- (void)centralManagerDidUpdateState:(id)a3
{
  uint64_t v4;
  int var0;
  void *v6;
  id v7;

  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled)
  {
LABEL_2:

  }
  else
  {
    v4 = objc_msgSend(v7, "state");
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    switch(v4)
    {
      case 1:
      case 4:
        NSErrorF_safe();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[CBConnection _reportError:](self, "_reportError:", v6);

        break;
      case 5:
      case 10:
        -[CBConnection _run](self, "_run");

        break;
      default:
        goto LABEL_2;
    }
  }
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v6;
  void *v7;
  NSUUID *blePeerUUID;
  NSUUID *v9;
  NSUUID *v10;
  NSUUID *v11;
  char v12;
  int var0;
  int v14;
  OS_dispatch_source *connectTimeoutTimer;
  NSObject *v16;
  OS_dispatch_source *v17;
  int64_t connectionLatency;
  int v19;
  int v20;
  NSUUID *v21;
  uint64_t v22;
  const char *v23;
  id v24;

  v24 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    blePeerUUID = self->_blePeerUUID;
    v9 = v7;
    v10 = blePeerUUID;
    if (v9 != v10)
    {
      v11 = v10;
      if ((v9 == 0) != (v10 != 0))
      {
        v12 = -[NSUUID isEqual:](v9, "isEqual:", v10);

        if ((v12 & 1) != 0)
        {
          var0 = self->_ucat->var0;
          if (var0 > 30)
            goto LABEL_15;
          goto LABEL_8;
        }
      }
      else
      {

      }
      v14 = self->_ucat->var0;
      if (v14 <= 60 && (v14 != -1 || _LogCategory_Initialize()))
        LogPrintF_safe();
      goto LABEL_26;
    }

    var0 = self->_ucat->var0;
    if (var0 > 30)
    {
LABEL_15:
      connectTimeoutTimer = self->_connectTimeoutTimer;
      if (connectTimeoutTimer)
      {
        v16 = connectTimeoutTimer;
        dispatch_source_cancel(v16);
        v17 = self->_connectTimeoutTimer;
        self->_connectTimeoutTimer = 0;

      }
      connectionLatency = self->_connectionLatency;
      if (connectionLatency != -99)
      {
        v19 = self->_ucat->var0;
        if (v19 <= 30
          && (v19 != -1 || (v20 = _LogCategory_Initialize(), connectionLatency = self->_connectionLatency, v20)))
        {
          v23 = CBCentralManagerConnectionLatencyToString(connectionLatency);
          LogPrintF_safe();
          objc_msgSend(v24, "setDesiredConnectionLatency:forPeripheral:", self->_connectionLatency, v6, v9, v23);
        }
        else
        {
          objc_msgSend(v24, "setDesiredConnectionLatency:forPeripheral:", connectionLatency, v6, v21, v22);
        }
      }
      self->_guardConnected = 1;
      -[CBConnection _run](self, "_run", v21);
LABEL_26:

      goto LABEL_27;
    }
LABEL_8:
    if (var0 != -1 || _LogCategory_Initialize())
    {
      v21 = v9;
      LogPrintF_safe();
    }
    goto LABEL_15;
  }
LABEL_27:

}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  id v7;
  void *v8;
  NSUUID *blePeerUUID;
  NSUUID *v10;
  NSUUID *v11;
  NSUUID *v12;
  char v13;
  int var0;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a4;
  v7 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    objc_msgSend(v19, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    blePeerUUID = self->_blePeerUUID;
    v10 = v8;
    v11 = blePeerUUID;
    if (v10 != v11)
    {
      v12 = v11;
      if ((v10 == 0) != (v11 != 0))
      {
        v13 = -[NSUUID isEqual:](v10, "isEqual:", v11);

        if ((v13 & 1) != 0)
        {
          var0 = self->_ucat->var0;
          if (var0 > 90)
          {
LABEL_15:
            if (v7)
            {
              -[CBConnection _reportError:](self, "_reportError:", v7);
            }
            else
            {
              NSErrorF_safe();
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              -[CBConnection _reportError:](self, "_reportError:", v16);

            }
LABEL_19:

            goto LABEL_20;
          }
LABEL_8:
          if (var0 != -1 || _LogCategory_Initialize())
          {
            CUPrintNSError();
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            LogPrintF_safe();

          }
          goto LABEL_15;
        }
      }
      else
      {

      }
      v15 = self->_ucat->var0;
      if (v15 <= 60 && (v15 != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSError();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

      }
      goto LABEL_19;
    }

    var0 = self->_ucat->var0;
    if (var0 > 90)
      goto LABEL_15;
    goto LABEL_8;
  }
LABEL_20:

}

- (void)pairingAgent:(id)a3 peerDidRequestPairing:(id)a4 type:(int64_t)a5 passkey:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void (**v14)(_QWORD);
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSData *v31;
  int var0;
  const char *v33;
  __CFString *v34;
  int v35;
  void (**v36)(_QWORD, _QWORD);
  CBPairingInfo *v37;
  void (**v38)(_QWORD, _QWORD);
  CBPairingInfo *v39;
  int v40;
  uint64_t v41;
  void *v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  void *v47;
  __CFString *v48;
  id v49;
  void *v50;
  _QWORD v51[6];
  id v52;
  uint64_t *v53;
  int64_t v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  const __CFString *v61;
  id v62;
  const __CFString *v63;
  _QWORD v64[3];

  v64[1] = *MEMORY[0x1E0C80C00];
  v49 = a3;
  v10 = a4;
  v11 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v50 = v10;
  objc_msgSend(v10, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0;
  v56 = &v55;
  v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__3;
  v59 = __Block_byref_object_dispose__3;
  v60 = 0;
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __64__CBConnection_pairingAgent_peerDidRequestPairing_type_passkey___block_invoke;
  v51[3] = &unk_1E5402170;
  v51[4] = self;
  v51[5] = v12;
  v53 = &v55;
  v54 = a5;
  v13 = v11;
  v52 = v13;
  v14 = (void (**)(_QWORD))MEMORY[0x1A85D1CE4](v51);
  -[CBPeer identifier](self->_peripheral, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v17 = v15;
  }
  else
  {
    -[CBL2CAPChannel peer](self->_l2capChannel, "peer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "identifier");
    v17 = (id)objc_claimAutoreleasedReturnValue();

  }
  if ((objc_msgSend(v12, "isEqual:", v17) & 1) == 0)
  {
    CBErrorF(-6727, (uint64_t)"peer not found", v19, v20, v21, v22, v23, v24, v45);
    v44 = objc_claimAutoreleasedReturnValue();
    v31 = (NSData *)v56[5];
    v56[5] = v44;
    goto LABEL_47;
  }
  v31 = self->_pairingOOBData;
  var0 = self->_ucat->var0;
  if (var0 <= 30)
  {
    if (var0 == -1)
    {
      if (!_LogCategory_Initialize())
        goto LABEL_16;
      if ((unint64_t)a5 <= 5)
      {
LABEL_8:
        v33 = off_1E54022A0[a5];
        if (v31)
        {
LABEL_9:
          CUPrintNSDataHex();
          v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_14;
        }
LABEL_13:
        v34 = CFSTR("nil");
LABEL_14:
        v47 = v13;
        v48 = v34;
        v45 = (uint64_t)v12;
        v46 = v33;
        LogPrintF_safe();
        if (v31)

        goto LABEL_16;
      }
    }
    else if ((unint64_t)a5 <= 5)
    {
      goto LABEL_8;
    }
    v33 = "?";
    if (v31)
      goto LABEL_9;
    goto LABEL_13;
  }
LABEL_16:
  self->_pairingType = a5;
  if (a5)
  {
    if (a5 == 5)
    {
      if (v31)
      {
        v35 = self->_ucat->var0;
        if (v35 <= 30 && (v35 != -1 || _LogCategory_Initialize()))
        {
          CUPrintNSDataHex();
          v46 = "OOB";
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = (uint64_t)v12;
          LogPrintF_safe();

        }
        v63 = CFSTR("kCBMsgArgPairingData");
        v64[0] = v31;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, &v63, 1, v45, v46, v47, v48);
        v36 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "respondToPairingRequest:type:accept:data:", v50, 5, 1, v36);
        goto LABEL_44;
      }
      CBErrorF(-6745, (uint64_t)"No OOB data", v25, v26, v27, v28, v29, v30, v45);
      v41 = objc_claimAutoreleasedReturnValue();
LABEL_34:
      v36 = (void (**)(_QWORD, _QWORD))v56[5];
      v56[5] = v41;
LABEL_44:

      goto LABEL_47;
    }
    if ((unint64_t)a5 > 4 || ((1 << a5) & 0x16) == 0)
    {
      CBErrorF(-6735, (uint64_t)"Unsupported pairing type", v25, v26, v27, v28, v29, v30, v45);
      v41 = objc_claimAutoreleasedReturnValue();
      goto LABEL_34;
    }
    v38 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85D1CE4](self->_pairingPromptHandler);
    if (v38)
    {
      v39 = objc_alloc_init(CBPairingInfo);
      -[CBPairingInfo setDevice:](v39, "setDevice:", self->_peerDevice);
      -[CBPairingInfo setPairingType:](v39, "setPairingType:", a5);
      if (log10((double)(int)objc_msgSend(v13, "intValue")) < 4.0)
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%04d"), objc_msgSend(v13, "intValue"));
      else
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%06d"), objc_msgSend(v13, "intValue"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[CBPairingInfo setPin:](v39, "setPin:", v42);

      ((void (**)(_QWORD, CBPairingInfo *))v38)[2](v38, v39);
    }

    if (a5 == 1 && (self->_connectionFlags & 0x200) != 0)
    {
      v43 = self->_ucat->var0;
      if (v43 <= 30 && (v43 != -1 || _LogCategory_Initialize()))
      {
        v45 = (uint64_t)v12;
        v46 = "Display";
        LogPrintF_safe();
      }
      if (v13)
      {
        v61 = CFSTR("kCBMsgArgPairingPasskey");
        v62 = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
        v36 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v36 = (void (**)(_QWORD, _QWORD))MEMORY[0x1E0C9AA70];
      }
      objc_msgSend(v49, "respondToPairingRequest:type:accept:data:", v50, 1, 1, v36, v45, v46, v47, v48);
      goto LABEL_44;
    }
  }
  else
  {
    if ((self->_connectionFlags & 0x80) == 0)
    {
      v36 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85D1CE4](self->_pairingPromptHandler);
      if (v36)
      {
        v37 = objc_alloc_init(CBPairingInfo);
        -[CBPairingInfo setDevice:](v37, "setDevice:", self->_peerDevice);
        -[CBPairingInfo setPairingType:](v37, "setPairingType:", 0);
        ((void (**)(_QWORD, CBPairingInfo *))v36)[2](v36, v37);

      }
      goto LABEL_44;
    }
    v40 = self->_ucat->var0;
    if (v40 <= 30 && (v40 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
      objc_msgSend(v49, "respondToPairingRequest:type:accept:data:", v50, 0, 1, MEMORY[0x1E0C9AA70], v12, "JustWorks", v47, v48);
    }
    else
    {
      objc_msgSend(v49, "respondToPairingRequest:type:accept:data:", v50, 0, 1, MEMORY[0x1E0C9AA70], v45, v46, v47, v48);
    }
  }
LABEL_47:

  v14[2](v14);
  _Block_object_dispose(&v55, 8);

}

void __64__CBConnection_pairingAgent_peerDidRequestPairing_type_passkey___block_invoke(uint64_t a1)
{
  int v1;
  void *v2;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    v1 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 152);
    if (v1 <= 90 && (v1 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
  }
}

- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4
{
  NSObject *dispatchQueue;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  char v11;
  int var0;
  NSData *pairingOOBData;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  CBDevice *v15;
  void *v16;
  id v17;

  dispatchQueue = self->_dispatchQueue;
  v6 = a4;
  dispatch_assert_queue_V2(dispatchQueue);
  objc_msgSend(v6, "identifier");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  -[CBPeer identifier](self->_peripheral, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    -[CBL2CAPChannel peer](self->_l2capChannel, "peer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  v11 = objc_msgSend(v17, "isEqual:", v9);
  var0 = self->_ucat->var0;
  if ((v11 & 1) != 0)
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    pairingOOBData = self->_pairingOOBData;
    self->_pairingOOBData = 0;

    v14 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A85D1CE4](self->_pairingCompletedHandler);
    if (v14)
    {
      v15 = self->_peerDevice;
      if (!v15)
      {
        v15 = objc_alloc_init(CBDevice);
        objc_msgSend(v17, "UUIDString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[CBDevice setIdentifier:](v15, "setIdentifier:", v16);

      }
      ((void (**)(_QWORD, CBDevice *, _QWORD))v14)[2](v14, v15, 0);

    }
  }
  else if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

}

- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5
{
  NSObject *dispatchQueue;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  char v14;
  int var0;
  NSData *pairingOOBData;
  void (**v17)(_QWORD, _QWORD, _QWORD);
  CBDevice *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a5;
  dispatchQueue = self->_dispatchQueue;
  v8 = a4;
  dispatch_assert_queue_V2(dispatchQueue);
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBPeer identifier](self->_peripheral, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    -[CBL2CAPChannel peer](self->_l2capChannel, "peer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  v14 = objc_msgSend(v9, "isEqual:", v12);
  var0 = self->_ucat->var0;
  if ((v14 & 1) != 0)
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    pairingOOBData = self->_pairingOOBData;
    self->_pairingOOBData = 0;

    v17 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A85D1CE4](self->_pairingCompletedHandler);
    if (v17)
    {
      v18 = self->_peerDevice;
      if (!v18)
      {
        v18 = objc_alloc_init(CBDevice);
        objc_msgSend(v9, "UUIDString");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[CBDevice setIdentifier:](v18, "setIdentifier:", v19);

      }
      ((void (**)(_QWORD, CBDevice *, id))v17)[2](v17, v18, v21);

    }
  }
  else if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

}

- (void)pairingAgent:(id)a3 peerDidUnpair:(id)a4
{
  NSObject *dispatchQueue;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  char v11;
  int var0;
  id v13;

  dispatchQueue = self->_dispatchQueue;
  v6 = a4;
  dispatch_assert_queue_V2(dispatchQueue);
  objc_msgSend(v6, "identifier");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[CBPeer identifier](self->_peripheral, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    -[CBL2CAPChannel peer](self->_l2capChannel, "peer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  v11 = objc_msgSend(v13, "isEqual:", v9);
  var0 = self->_ucat->var0;
  if ((v11 & 1) != 0)
  {
    if (var0 > 30 || var0 == -1 && !_LogCategory_Initialize())
      goto LABEL_9;
LABEL_7:
    LogPrintF_safe();
    goto LABEL_9;
  }
  if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    goto LABEL_7;
LABEL_9:

}

- (void)peripheral:(id)a3 didOpenL2CAPChannel:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  int v10;
  void *v11;
  void *v12;
  NSUUID *blePeerUUID;
  NSUUID *v14;
  NSUUID *v15;
  NSUUID *v16;
  char v17;
  int v18;
  int var0;
  id v20;
  int v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;

  v28 = a3;
  v8 = a4;
  v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled)
    goto LABEL_25;
  if (!self->_l2capChannel)
  {
    objc_msgSend(v28, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    blePeerUUID = self->_blePeerUUID;
    v14 = v12;
    v15 = blePeerUUID;
    if (v14 == v15)
    {

    }
    else
    {
      v16 = v15;
      if ((v14 == 0) == (v15 != 0))
      {

LABEL_18:
        var0 = self->_ucat->var0;
        if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
        {
          objc_msgSend(v28, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          CUPrintNSError();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF_safe();

          goto LABEL_24;
        }
        goto LABEL_25;
      }
      v17 = -[NSUUID isEqual:](v14, "isEqual:", v15);

      if ((v17 & 1) == 0)
        goto LABEL_18;
    }
    v18 = self->_ucat->var0;
    if (v18 <= 30 && (v18 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v25 = v8;
      v26 = objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    if (v9)
    {
      NSErrorNestedF();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CBConnection _reportError:](self, "_reportError:", v11);
      goto LABEL_24;
    }
    v20 = v8;
    v11 = v20;
    if (!v20)
    {
      NSErrorF_safe();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[CBConnection _reportError:](self, "_reportError:", v23);

      goto LABEL_24;
    }
    if (objc_msgSend(v20, "PSM") == self->_blePSM)
    {
      objc_storeStrong((id *)&self->_l2capChannel, a4);
      v21 = self->_ucat->var0;
      if (v21 <= 30 && (v21 != -1 || _LogCategory_Initialize()))
      {
        objc_msgSend(v11, "peer", v25, v26);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "identifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v11, "PSM");
        LogPrintF_safe();

      }
      -[CBConnection _run](self, "_run", v25, v26);
      goto LABEL_24;
    }
    v24 = self->_ucat->var0;
    if (v24 > 60 || v24 == -1 && !_LogCategory_Initialize())
    {
LABEL_24:

      goto LABEL_25;
    }
    objc_msgSend(v11, "PSM", v25, v26);
LABEL_6:
    LogPrintF_safe();
    goto LABEL_24;
  }
  v10 = self->_ucat->var0;
  if (v10 <= 60 && (v10 != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
LABEL_25:

}

- (void)readWithRequest:(id)a3
{
  id v4;
  CBReadRequest *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  CBReadRequest *v12;

  v4 = a3;
  v5 = objc_alloc_init(CBReadRequest);
  -[CBReadRequest setMinLength:](v5, "setMinLength:", objc_msgSend(v4, "minLength"));
  -[CBReadRequest setMaxLength:](v5, "setMaxLength:", objc_msgSend(v4, "maxLength"));
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __32__CBConnection_readWithRequest___block_invoke;
  v10 = &unk_1E53FF5A0;
  v11 = v4;
  v12 = v5;
  v6 = v4;
  -[CBReadRequest setCompletion:](v5, "setCompletion:", &v7);
  -[CBConnection readWithCBReadRequest:](self, "readWithCBReadRequest:", v5, v7, v8, v9, v10);

}

void __32__CBConnection_readWithRequest___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 40), "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setData:", v2);

  objc_msgSend(*(id *)(a1 + 40), "error");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = (int)*MEMORY[0x1E0D1B4A0];
  v6 = *(void **)(v4 + v5);
  *(_QWORD *)(v4 + v5) = v3;

  v7 = objc_msgSend(*(id *)(a1 + 40), "length");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + (int)*MEMORY[0x1E0D1B4A8]) = v7;
  objc_msgSend(*(id *)(a1 + 32), "completion");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCompletion:", 0);
  v8 = v9;
  if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
    v8 = v9;
  }

}

- (void)writeWithRequest:(id)a3
{
  id v4;
  CBWriteRequest *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  CBWriteRequest *v13;

  v4 = a3;
  v5 = objc_alloc_init(CBWriteRequest);
  objc_msgSend(v4, "dataArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBWriteRequest setDataArray:](v5, "setDataArray:", v6);

  -[CBWriteRequest setEndOfData:](v5, "setEndOfData:", objc_msgSend(v4, "endOfData"));
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __33__CBConnection_writeWithRequest___block_invoke;
  v11 = &unk_1E53FF5A0;
  v12 = v4;
  v13 = v5;
  v7 = v4;
  -[CBWriteRequest setCompletion:](v5, "setCompletion:", &v8);
  -[CBConnection writeWithCBWriteRequest:](self, "writeWithCBWriteRequest:", v5, v8, v9, v10, v11);

}

void __33__CBConnection_writeWithRequest___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 40), "error");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = (int)*MEMORY[0x1E0D1B4B0];
  v5 = *(void **)(v3 + v4);
  *(_QWORD *)(v3 + v4) = v2;

  objc_msgSend(*(id *)(a1 + 32), "completion");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCompletion:", 0);
  v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    v6 = v7;
  }

}

- (int64_t)bluetoothState
{
  return self->_bluetoothState;
}

- (id)bluetoothStateChangedHandler
{
  return self->_bluetoothStateChangedHandler;
}

- (void)setBluetoothStateChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (id)pairingCompletedHandler
{
  return self->_pairingCompletedHandler;
}

- (void)setPairingCompletedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (id)pairingPromptHandler
{
  return self->_pairingPromptHandler;
}

- (void)setPairingPromptHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSString)label
{
  return self->_label;
}

- (CBDevice)remoteDevice
{
  return self->_remoteDevice;
}

- (void)setRemoteDevice:(id)a3
{
  objc_storeStrong((id *)&self->_remoteDevice, a3);
}

- (unsigned)useCase
{
  return self->_useCase;
}

- (void)setUseCase:(unsigned int)a3
{
  self->_useCase = a3;
}

- (NSArray)useCaseClientIDs
{
  return self->_useCaseClientIDs;
}

- (void)setUseCaseClientIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (unsigned)blePSM
{
  return self->_blePSM;
}

- (void)setBlePSM:(unsigned __int16)a3
{
  self->_blePSM = a3;
}

- (unsigned)connectionFlags
{
  return self->_connectionFlags;
}

- (void)setConnectionFlags:(unsigned int)a3
{
  self->_connectionFlags = a3;
}

- (int64_t)connectionLatency
{
  return self->_connectionLatency;
}

- (void)setConnectionLatency:(int64_t)a3
{
  self->_connectionLatency = a3;
}

- (int64_t)connectionScanDutyCycle
{
  return self->_connectionScanDutyCycle;
}

- (void)setConnectionScanDutyCycle:(int64_t)a3
{
  self->_connectionScanDutyCycle = a3;
}

- (double)connectTimeoutSeconds
{
  return self->_connectTimeoutSeconds;
}

- (void)setConnectTimeoutSeconds:(double)a3
{
  self->_connectTimeoutSeconds = a3;
}

- (CBDevice)peerDevice
{
  return self->_peerDevice;
}

- (void)setPeerDevice:(id)a3
{
  objc_storeStrong((id *)&self->_peerDevice, a3);
}

- (unsigned)serviceFlags
{
  return self->_serviceFlags;
}

- (void)setServiceFlags:(unsigned int)a3
{
  self->_serviceFlags = a3;
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (void)setClientBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (int64_t)clientUseCase
{
  return self->_clientUseCase;
}

- (void)setClientUseCase:(int64_t)a3
{
  self->_clientUseCase = a3;
}

- (unsigned)clientID
{
  return self->_clientID;
}

- (void)setClientID:(unsigned int)a3
{
  self->_clientID = a3;
}

- (double)connectedTime
{
  return self->_connectedTime;
}

- (void)setConnectedTime:(double)a3
{
  self->_connectedTime = a3;
}

- (unsigned)internalFlags
{
  return self->_internalFlags;
}

- (void)setInternalFlags:(unsigned int)a3
{
  self->_internalFlags = a3;
}

- (CBL2CAPChannel)l2capChannel
{
  return self->_l2capChannel;
}

- (void)setL2capChannel:(id)a3
{
  objc_storeStrong((id *)&self->_l2capChannel, a3);
}

- (CBServer)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
  objc_storeStrong((id *)&self->_server, a3);
}

- (id)serverInvalidationHandler
{
  return self->_serverInvalidationHandler;
}

- (void)setServerInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (NSArray)serviceUUIDs
{
  return self->_serviceUUIDs;
}

- (void)setServiceUUIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (id)xpcForwardMessageReceiveHandler
{
  return self->_xpcForwardMessageReceiveHandler;
}

- (void)setXpcForwardMessageReceiveHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (OS_xpc_object)xpcListenerEndpoint
{
  return self->_xpcListenerEndpoint;
}

- (void)setXpcListenerEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_xpcListenerEndpoint, a3);
}

- (id)xpcSendEventHandler
{
  return self->_xpcSendEventHandler;
}

- (void)setXpcSendEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_xpcSendEventHandler, 0);
  objc_storeStrong((id *)&self->_xpcListenerEndpoint, 0);
  objc_storeStrong(&self->_xpcForwardMessageReceiveHandler, 0);
  objc_storeStrong((id *)&self->_serviceUUIDs, 0);
  objc_storeStrong(&self->_serverInvalidationHandler, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_l2capChannel, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_peerDevice, 0);
  objc_storeStrong((id *)&self->_useCaseClientIDs, 0);
  objc_storeStrong((id *)&self->_remoteDevice, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_pairingPromptHandler, 0);
  objc_storeStrong(&self->_pairingCompletedHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_bluetoothStateChangedHandler, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_writeRequests, 0);
  objc_storeStrong((id *)&self->_writeRequestCurrent, 0);
  objc_storeStrong((id *)&self->_writeSource, 0);
  objc_storeStrong((id *)&self->_readRequests, 0);
  objc_storeStrong((id *)&self->_readRequestCurrent, 0);
  objc_storeStrong((id *)&self->_readSource, 0);
  objc_storeStrong((id *)&self->_peripheral, 0);
  objc_storeStrong((id *)&self->_pairingOOBData, 0);
  objc_storeStrong((id *)&self->_connectTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_blePeerUUID, 0);
  objc_storeStrong(&self->_activateCompletion, 0);
}

@end
