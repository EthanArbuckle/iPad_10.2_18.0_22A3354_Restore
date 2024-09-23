@implementation MRRemoteControlGroupSession

- (MRRemoteControlGroupSession)initWithIdentifier:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  MRRemoteControlGroupSession *v8;
  uint64_t v9;
  NSString *identifier;
  uint64_t v11;
  NSMapTable *participantMap;
  uint64_t v13;
  NSMapTable *memberMap;
  uint64_t v15;
  NSMapTable *pendingParticipantMap;
  uint64_t v17;
  NSHashTable *optimisticApprovedPendingParticipants;
  uint64_t v19;
  NSHashTable *optimisticDeniedPendingParticipants;
  uint64_t v21;
  NSHashTable *optimisticRemovedParticipants;
  NSObject *v23;
  NSObject *v24;
  dispatch_queue_t v25;
  OS_dispatch_queue *queue;
  NSObject *v27;
  NSObject *v28;
  dispatch_queue_t v29;
  OS_dispatch_queue *callbackQueue;
  objc_super v32;

  v6 = a3;
  v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)MRRemoteControlGroupSession;
  v8 = -[MRRemoteControlGroupSession init](&v32, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    v8->_state = 0;
    objc_storeWeak((id *)&v8->_delegate, v7);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v11 = objc_claimAutoreleasedReturnValue();
    participantMap = v8->_participantMap;
    v8->_participantMap = (NSMapTable *)v11;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v13 = objc_claimAutoreleasedReturnValue();
    memberMap = v8->_memberMap;
    v8->_memberMap = (NSMapTable *)v13;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v15 = objc_claimAutoreleasedReturnValue();
    pendingParticipantMap = v8->_pendingParticipantMap;
    v8->_pendingParticipantMap = (NSMapTable *)v15;

    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 0, 2);
    optimisticApprovedPendingParticipants = v8->_optimisticApprovedPendingParticipants;
    v8->_optimisticApprovedPendingParticipants = (NSHashTable *)v17;

    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 0, 2);
    optimisticDeniedPendingParticipants = v8->_optimisticDeniedPendingParticipants;
    v8->_optimisticDeniedPendingParticipants = (NSHashTable *)v19;

    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 0, 2);
    optimisticRemovedParticipants = v8->_optimisticRemovedParticipants;
    v8->_optimisticRemovedParticipants = (NSHashTable *)v21;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v23 = objc_claimAutoreleasedReturnValue();
    MRGroupSessionSubsystemGetQueue();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = dispatch_queue_create_with_target_V2("com.apple.MediaRemote.MRRemoteControlGroupSession.queue", v23, v24);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v25;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v27 = objc_claimAutoreleasedReturnValue();
    MRGroupSessionSubsystemGetNotificationQueue();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = dispatch_queue_create_with_target_V2("com.apple.MediaRemote.MRRemoteControlGroupSession.callbackQueue", v27, v28);
    callbackQueue = v8->_callbackQueue;
    v8->_callbackQueue = (OS_dispatch_queue *)v29;

    -[MRRemoteControlGroupSession initializeConnection](v8, "initializeConnection");
  }

  return v8;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  MRRemoteControlGroupSession *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _MRLogForCategory(0xCuLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_impl(&dword_193827000, v3, OS_LOG_TYPE_DEFAULT, "[MRGroupSession] <%p> dealloc", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)MRRemoteControlGroupSession;
  -[MRRemoteControlGroupSession dealloc](&v4, sel_dealloc);
}

- (void)initializeConnection
{
  MRGroupSessionXPCConnection *v3;
  void *v4;
  uint64_t v5;
  MRGroupSessionXPCConnection *v6;
  MRGroupSessionXPCConnection *connection;
  MRGroupSessionXPCConnection *v8;
  _QWORD v9[5];
  _QWORD v10[4];
  id v11;
  id location;

  objc_initWeak(&location, self);
  v3 = [MRGroupSessionXPCConnection alloc];
  objc_msgSend(MEMORY[0x1E0D4D120], "proxyWithObject:protocol:", self, &unk_1EE2F67D0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__MRRemoteControlGroupSession_initializeConnection__block_invoke;
  v10[3] = &unk_1E30C6AA0;
  objc_copyWeak(&v11, &location);
  v6 = -[MRGroupSessionXPCConnection initWithClientObject:invalidationHandler:](v3, "initWithClientObject:invalidationHandler:", v4, v10);
  connection = self->_connection;
  self->_connection = v6;

  v8 = self->_connection;
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __51__MRRemoteControlGroupSession_initializeConnection__block_invoke_3;
  v9[3] = &unk_1E30CD168;
  v9[4] = self;
  -[MRGroupSessionXPCConnection sendMessage:](v8, "sendMessage:", v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __51__MRRemoteControlGroupSession_initializeConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__MRRemoteControlGroupSession_initializeConnection__block_invoke_2;
    block[3] = &unk_1E30C5CA8;
    v5 = v2;
    dispatch_async(v3, block);

  }
}

void __51__MRRemoteControlGroupSession_initializeConnection__block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MRGroupSessionError"), 1, CFSTR("XPC invalidated."));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "notifyDelegateOfInvalidation:", v2);

}

void __51__MRRemoteControlGroupSession_initializeConnection__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v6[5];

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__MRRemoteControlGroupSession_initializeConnection__block_invoke_4;
  v6[3] = &unk_1E30CF5A0;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "connectToSession:reply:", v5, v6);

}

void __51__MRRemoteControlGroupSession_initializeConnection__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 152);
    *(_QWORD *)(v7 + 152) = 0;

    objc_msgSend(*(id *)(a1 + 32), "notifyDelegateOfInvalidation:", v6);
  }
  else
  {
    _MRLogForCategory(0xCuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 134217984;
      v12 = v10;
      _os_log_impl(&dword_193827000, v9, OS_LOG_TYPE_DEFAULT, "[MRGroupSession] <%p> Connected.", (uint8_t *)&v11, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "parseInitialState:", v5);
  }

}

- (BOOL)isEqual:(id)a3
{
  MRRemoteControlGroupSession *v4;
  NSString *identifier;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;

  v4 = (MRRemoteControlGroupSession *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      identifier = self->_identifier;
      v6 = v4->_identifier;
      v7 = identifier;
      v8 = v7;
      if (v7 == v6)
        v9 = 1;
      else
        v9 = -[NSString isEqual:](v7, "isEqual:", v6);

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash");
}

- (NSString)description
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned int v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;

  -[MRGroupSessionToken hostInfo](self->_joinToken, "hostInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v5 = objc_opt_class();
  -[MRRemoteControlGroupSession identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "routeType") - 1;
  if (v8 > 0xA)
    v9 = CFSTR("Unknown");
  else
    v9 = off_1E30CF748[(char)v8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRRemoteControlGroupSession isPlaceholder](self, "isPlaceholder"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("<%@: identifier=%@, name=%@, route=%@, placeholder=%@>"), v5, v6, v7, v9, v11);

  return (NSString *)v12;
}

- (void)notifyDelegateOfInvalidation:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  MRRemoteControlGroupSession *v9;
  id v10;

  v4 = a3;
  -[MRRemoteControlGroupSession delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[MRRemoteControlGroupSession callbackQueue](self, "callbackQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__MRRemoteControlGroupSession_notifyDelegateOfInvalidation___block_invoke;
    block[3] = &unk_1E30C7328;
    v8 = v5;
    v9 = self;
    v10 = v4;
    dispatch_async(v6, block);

  }
}

uint64_t __60__MRRemoteControlGroupSession_notifyDelegateOfInvalidation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "groupSession:didInvalidateWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (BOOL)isLocalSession
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[MRRemoteControlGroupSession identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MRAVLocalEndpoint sharedLocalEndpoint](MRAVLocalEndpoint, "sharedLocalEndpoint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "groupSessionInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 == v5)
    v6 = 1;
  else
    v6 = objc_msgSend(v2, "isEqual:", v5);

  return v6;
}

- (BOOL)canManageParticipants
{
  void *v3;
  int v4;

  -[MRRemoteControlGroupSession localParticipant](self, "localParticipant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MRRemoteControlGroupSession isLocalSession](self, "isLocalSession"))
  {
    LOBYTE(v4) = 1;
  }
  else if (v3)
  {
    v4 = objc_msgSend(v3, "isGuest") ^ 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (BOOL)canHandleJoinRequests
{
  BOOL v3;
  void *v4;

  if (-[MRRemoteControlGroupSession isLocalSession](self, "isLocalSession"))
    return 1;
  -[MRGroupSessionToken equivalentMediaIdentifier](self->_joinToken, "equivalentMediaIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4 != 0;

  return v3;
}

- (NSString)localizedSessionName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[MRRemoteControlGroupSession host](self, "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "identity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    MRGroupSessionRouteMakeName(v6, -[MRRemoteControlGroupSession routeType](self, "routeType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[MRGroupSessionToken hostInfo](self->_joinToken, "hostInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedSessionName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v7;
}

- (unsigned)routeType
{
  void *v2;
  unsigned __int8 v3;

  -[MRGroupSessionToken hostInfo](self->_joinToken, "hostInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "routeType");

  return v3;
}

- (MRGroupSessionToken)joinToken
{
  MRGroupSessionToken *v3;

  if (-[MRRemoteControlGroupSession isPlaceholder](self, "isPlaceholder"))
    v3 = 0;
  else
    v3 = self->_joinToken;
  return v3;
}

- (int64_t)state
{
  NSObject *v3;
  int64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[MRRemoteControlGroupSession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__MRRemoteControlGroupSession_state__block_invoke;
  v6[3] = &unk_1E30C5D20;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_async_and_wait(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __36__MRRemoteControlGroupSession_state__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 24);
  return result;
}

- (NSData)synchronizedMetadata
{
  NSObject *v3;
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
  v10 = __Block_byref_object_copy__46;
  v11 = __Block_byref_object_dispose__46;
  v12 = 0;
  -[MRRemoteControlGroupSession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__MRRemoteControlGroupSession_synchronizedMetadata__block_invoke;
  v6[3] = &unk_1E30C5D20;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_async_and_wait(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSData *)v4;
}

void __51__MRRemoteControlGroupSession_synchronizedMetadata__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 128));
}

- (NSSet)members
{
  NSObject *v3;
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
  v10 = __Block_byref_object_copy__46;
  v11 = __Block_byref_object_dispose__46;
  v12 = 0;
  -[MRRemoteControlGroupSession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__MRRemoteControlGroupSession_members__block_invoke;
  v6[3] = &unk_1E30C5D20;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_async_and_wait(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v4;
}

void __38__MRRemoteControlGroupSession_members__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  v3 = v2;
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
  if (!v2)

}

- (NSSet)participants
{
  NSObject *v3;
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
  v10 = __Block_byref_object_copy__46;
  v11 = __Block_byref_object_dispose__46;
  v12 = 0;
  -[MRRemoteControlGroupSession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__MRRemoteControlGroupSession_participants__block_invoke;
  v6[3] = &unk_1E30C5D20;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_async_and_wait(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v4;
}

void __43__MRRemoteControlGroupSession_participants__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v3 = v2;
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
  if (!v2)

}

- (NSSet)pendingParticipants
{
  NSObject *v3;
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
  v10 = __Block_byref_object_copy__46;
  v11 = __Block_byref_object_dispose__46;
  v12 = 0;
  -[MRRemoteControlGroupSession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__MRRemoteControlGroupSession_pendingParticipants__block_invoke;
  v6[3] = &unk_1E30C5D20;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_async_and_wait(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v4;
}

void __50__MRRemoteControlGroupSession_pendingParticipants__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v3 = v2;
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
  if (!v2)

}

- (MRGroupSessionParticipant)host
{
  NSObject *v3;
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
  v10 = __Block_byref_object_copy__46;
  v11 = __Block_byref_object_dispose__46;
  v12 = 0;
  -[MRRemoteControlGroupSession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__MRRemoteControlGroupSession_host__block_invoke;
  v6[3] = &unk_1E30C5D20;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_async_and_wait(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (MRGroupSessionParticipant *)v4;
}

void __35__MRRemoteControlGroupSession_host__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 104));
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isLocalSession"))
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 112));
  }
}

- (MRGroupSessionParticipant)localParticipant
{
  NSObject *v3;
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
  v10 = __Block_byref_object_copy__46;
  v11 = __Block_byref_object_dispose__46;
  v12 = 0;
  -[MRRemoteControlGroupSession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__MRRemoteControlGroupSession_localParticipant__block_invoke;
  v6[3] = &unk_1E30C5D20;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_async_and_wait(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (MRGroupSessionParticipant *)v4;
}

void __47__MRRemoteControlGroupSession_localParticipant__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 112));
}

- (id)memberForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__46;
  v16 = __Block_byref_object_dispose__46;
  v17 = 0;
  -[MRRemoteControlGroupSession queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__MRRemoteControlGroupSession_memberForIdentifier___block_invoke;
  block[3] = &unk_1E30C74D0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_async_and_wait(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __51__MRRemoteControlGroupSession_memberForIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "memberMap");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)participantForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__46;
  v16 = __Block_byref_object_dispose__46;
  v17 = 0;
  -[MRRemoteControlGroupSession queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__MRRemoteControlGroupSession_participantForIdentifier___block_invoke;
  block[3] = &unk_1E30C74D0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_async_and_wait(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __56__MRRemoteControlGroupSession_participantForIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "participantMap");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)pendingParticipantForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__46;
  v16 = __Block_byref_object_dispose__46;
  v17 = 0;
  -[MRRemoteControlGroupSession queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__MRRemoteControlGroupSession_pendingParticipantForIdentifier___block_invoke;
  block[3] = &unk_1E30C74D0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_async_and_wait(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __63__MRRemoteControlGroupSession_pendingParticipantForIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "pendingParticipantMap");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)approvePendingParticipant:(id)a3 completion:(id)a4
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
  -[MRRemoteControlGroupSession queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__MRRemoteControlGroupSession_approvePendingParticipant_completion___block_invoke;
  block[3] = &unk_1E30CA5C0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __68__MRRemoteControlGroupSession_approvePendingParticipant_completion___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  MRCodableGroupSessionParticipant *v5;
  void *v6;
  void *v7;
  MRCodableGroupSessionParticipant *v8;
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  MROptimisticState *v13;
  void *v14;
  uint64_t v15;
  MROptimisticState *v16;
  _QWORD *v17;
  void *v18;
  void (**v19)(id, void *);
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "pendingParticipantMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = [MRCodableGroupSessionParticipant alloc];
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[MRCodableGroupSessionParticipant initWithIdentifier:identity:connected:guest:hidden:](v5, "initWithIdentifier:identity:connected:guest:hidden:", v6, v7, 1, objc_msgSend(v4, "isGuest"), objc_msgSend(v4, "isHidden"));

    -[MRCodableGroupSessionParticipant setPending:](v8, "setPending:", 0);
    _MRLogForCategory(0xCuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = a1[4];
      v11 = a1[5];
      *(_DWORD *)buf = 134218242;
      v27 = v10;
      v28 = 2112;
      v29 = v11;
      _os_log_impl(&dword_193827000, v9, OS_LOG_TYPE_DEFAULT, "[MRGroupSession] <%p> Set optimistic state for approved participant %@.", buf, 0x16u);
    }

    objc_initWeak((id *)buf, a1[4]);
    objc_msgSend(a1[4], "optimisticApprovedPendingParticipants");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = [MROptimisticState alloc];
    objc_msgSend(a1[4], "queue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __68__MRRemoteControlGroupSession_approvePendingParticipant_completion___block_invoke_299;
    v24[3] = &unk_1E30CF5C8;
    objc_copyWeak(&v25, (id *)buf);
    v16 = -[MROptimisticState initWithInitialState:expectedState:timeout:queue:timeoutHandler:](v13, "initWithInitialState:expectedState:timeout:queue:timeoutHandler:", 0, v8, v14, v24, 15.0);
    objc_msgSend(v12, "addObject:", v16);

    objc_msgSend(a1[4], "updateParticipantsForOptimisticStateChange");
    v17 = a1[4];
    v18 = (void *)v17[19];
    v21[0] = v15;
    v21[1] = 3221225472;
    v21[2] = __68__MRRemoteControlGroupSession_approvePendingParticipant_completion___block_invoke_301;
    v21[3] = &unk_1E30CF5F0;
    v21[4] = v17;
    v22 = v4;
    v23 = a1[6];
    objc_msgSend(v18, "sendMessage:", v21);

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    v19 = (void (**)(id, void *))a1[6];
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MRGroupSessionError"), 8, CFSTR("Pending participant no longer available."));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2](v19, v20);

  }
}

void __68__MRRemoteControlGroupSession_approvePendingParticipant_completion___block_invoke_299(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "participantMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "expectedState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      _MRLogForCategory(0xCuLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __68__MRRemoteControlGroupSession_approvePendingParticipant_completion___block_invoke_299_cold_1((uint64_t)v5, v3, v10);

    }
    objc_msgSend(v5, "optimisticApprovedPendingParticipants");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObject:", v3);

    objc_msgSend(v5, "updateParticipantsForOptimisticStateChange");
  }

}

void __68__MRRemoteControlGroupSession_approvePendingParticipant_completion___block_invoke_301(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)a1[4];
  v4 = a2;
  objc_msgSend(v3, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "session:approvePendingParticipant:reply:", v5, a1[5], a1[6]);

}

- (void)denyPendingParticipant:(id)a3 completion:(id)a4
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
  -[MRRemoteControlGroupSession queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__MRRemoteControlGroupSession_denyPendingParticipant_completion___block_invoke;
  block[3] = &unk_1E30CA5C0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __65__MRRemoteControlGroupSession_denyPendingParticipant_completion___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  void *v8;
  MROptimisticState *v9;
  id v10;
  void *v11;
  uint64_t v12;
  MROptimisticState *v13;
  _QWORD *v14;
  void *v15;
  void (**v16)(id, void *);
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "pendingParticipantMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    _MRLogForCategory(0xCuLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = a1[4];
      v7 = a1[5];
      *(_DWORD *)buf = 134218242;
      v24 = v6;
      v25 = 2112;
      v26 = v7;
      _os_log_impl(&dword_193827000, v5, OS_LOG_TYPE_DEFAULT, "[MRGroupSession] <%p> Set optimistic state for denied participant %@.", buf, 0x16u);
    }

    objc_initWeak((id *)buf, a1[4]);
    objc_msgSend(a1[4], "optimisticDeniedPendingParticipants");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = [MROptimisticState alloc];
    v10 = a1[5];
    objc_msgSend(a1[4], "queue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __65__MRRemoteControlGroupSession_denyPendingParticipant_completion___block_invoke_304;
    v21[3] = &unk_1E30CF5C8;
    objc_copyWeak(&v22, (id *)buf);
    v13 = -[MROptimisticState initWithInitialState:expectedState:timeout:queue:timeoutHandler:](v9, "initWithInitialState:expectedState:timeout:queue:timeoutHandler:", v10, 0, v11, v21, 5.0);
    objc_msgSend(v8, "addObject:", v13);

    objc_msgSend(a1[4], "updateParticipantsForOptimisticStateChange");
    v14 = a1[4];
    v15 = (void *)v14[19];
    v18[0] = v12;
    v18[1] = 3221225472;
    v18[2] = __65__MRRemoteControlGroupSession_denyPendingParticipant_completion___block_invoke_305;
    v18[3] = &unk_1E30CF5F0;
    v18[4] = v14;
    v19 = v4;
    v20 = a1[6];
    objc_msgSend(v15, "sendMessage:", v18);

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v16 = (void (**)(id, void *))a1[6];
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MRGroupSessionError"), 8, CFSTR("Pending participant no longer available."));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2](v16, v17);

  }
}

void __65__MRRemoteControlGroupSession_denyPendingParticipant_completion___block_invoke_304(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "pendingParticipantMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "initialState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      _MRLogForCategory(0xCuLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __65__MRRemoteControlGroupSession_denyPendingParticipant_completion___block_invoke_304_cold_1((uint64_t)v5, v3, v10);

    }
    objc_msgSend(v5, "optimisticDeniedPendingParticipants");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObject:", v3);

    objc_msgSend(v5, "updateParticipantsForOptimisticStateChange");
  }

}

void __65__MRRemoteControlGroupSession_denyPendingParticipant_completion___block_invoke_305(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)a1[4];
  v4 = a2;
  objc_msgSend(v3, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "session:denyPendingParticipant:reply:", v5, a1[5], a1[6]);

}

- (id)assertSessionManagementScreenVisible
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  MRGroupSessionAssertion *v10;
  id v11;
  MRGroupSessionAssertion *v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  _QWORD block[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  _QWORD v27[3];
  _QWORD v28[4];

  v28[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__46;
  v25 = __Block_byref_object_dispose__46;
  v26 = 0;
  -[MRRemoteControlGroupSession queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__MRRemoteControlGroupSession_assertSessionManagementScreenVisible__block_invoke;
  block[3] = &unk_1E30C5D20;
  block[4] = self;
  block[5] = &v21;
  dispatch_sync(v5, block);

  v27[0] = CFSTR("MRGroupSessionEventOptionEventType");
  v27[1] = CFSTR("MRGroupSessionEventOptionSessionIdentifier");
  v7 = v22[5];
  v28[0] = &unk_1E3143960;
  v28[1] = v7;
  v27[2] = CFSTR("MRGroupSessionEventOptionAssertionIdentifier");
  v28[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v6;
  v17[1] = 3221225472;
  v17[2] = __67__MRRemoteControlGroupSession_assertSessionManagementScreenVisible__block_invoke_310;
  v17[3] = &unk_1E30CF618;
  v9 = v4;
  v18 = v9;
  v19 = &v21;
  MRGroupSessionSendEvent(v8, v17);
  v10 = [MRGroupSessionAssertion alloc];
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __67__MRRemoteControlGroupSession_assertSessionManagementScreenVisible__block_invoke_312;
  v14[3] = &unk_1E30C5D20;
  v16 = &v21;
  v11 = v9;
  v15 = v11;
  v12 = -[MRGroupSessionAssertion initWithCancellationHandler:](v10, "initWithCancellationHandler:", v14);

  _Block_object_dispose(&v21, 8);
  return v12;
}

void __67__MRRemoteControlGroupSession_assertSessionManagementScreenVisible__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
}

void __67__MRRemoteControlGroupSession_assertSessionManagementScreenVisible__block_invoke_310(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _MRLogForCategory(0xCuLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __67__MRRemoteControlGroupSession_assertSessionManagementScreenVisible__block_invoke_310_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v8 = 138412546;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_193827000, v5, OS_LOG_TYPE_DEFAULT, "[MRGroupSession] Began assertion %@ for session with identifier: %@", (uint8_t *)&v8, 0x16u);
  }

}

void __67__MRRemoteControlGroupSession_assertSessionManagementScreenVisible__block_invoke_312(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("MRGroupSessionEventOptionEventType");
  v10[1] = CFSTR("MRGroupSessionEventOptionSessionIdentifier");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v11[0] = &unk_1E3143978;
  v11[1] = v3;
  v10[2] = CFSTR("MRGroupSessionEventOptionAssertionIdentifier");
  v11[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__MRRemoteControlGroupSession_assertSessionManagementScreenVisible__block_invoke_314;
  v7[3] = &unk_1E30CF618;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v8 = v5;
  v9 = v6;
  MRGroupSessionSendEvent(v4, v7);

}

void __67__MRRemoteControlGroupSession_assertSessionManagementScreenVisible__block_invoke_314(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _MRLogForCategory(0xCuLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __67__MRRemoteControlGroupSession_assertSessionManagementScreenVisible__block_invoke_314_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v8 = 138412546;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_193827000, v5, OS_LOG_TYPE_DEFAULT, "[MRGroupSession] Ended assertion %@ for session with identifier: %@", (uint8_t *)&v8, 0x16u);
  }

}

- (void)removeAllParticipantsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MRRemoteControlGroupSession queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__MRRemoteControlGroupSession_removeAllParticipantsWithCompletion___block_invoke;
  v7[3] = &unk_1E30C5B40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __67__MRRemoteControlGroupSession_removeAllParticipantsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 152);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__MRRemoteControlGroupSession_removeAllParticipantsWithCompletion___block_invoke_2;
  v4[3] = &unk_1E30CF640;
  v4[4] = v1;
  v5 = v2;
  objc_msgSend(v3, "sendMessage:", v4);

}

void __67__MRRemoteControlGroupSession_removeAllParticipantsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "session:removeAllParticipantsWithReply:", v5, *(_QWORD *)(a1 + 40));

}

- (void)removeParticipant:(id)a3 completion:(id)a4
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
  -[MRRemoteControlGroupSession queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__MRRemoteControlGroupSession_removeParticipant_completion___block_invoke;
  block[3] = &unk_1E30CA5C0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __60__MRRemoteControlGroupSession_removeParticipant_completion___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  void *v9;
  MROptimisticState *v10;
  id v11;
  void *v12;
  MROptimisticState *v13;
  _QWORD *v14;
  id v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "participantMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = MEMORY[0x1E0C809B0];
  if (v4)
  {
    _MRLogForCategory(0xCuLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = a1[4];
      v8 = a1[5];
      *(_DWORD *)buf = 134218242;
      v23 = v7;
      v24 = 2112;
      v25 = v8;
      _os_log_impl(&dword_193827000, v6, OS_LOG_TYPE_DEFAULT, "[MRGroupSession] <%p> Set optimistic state for removed participant %@.", buf, 0x16u);
    }

    objc_initWeak((id *)buf, a1[4]);
    objc_msgSend(a1[4], "optimisticRemovedParticipants");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = [MROptimisticState alloc];
    v11 = a1[5];
    objc_msgSend(a1[4], "queue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v5;
    v20[1] = 3221225472;
    v20[2] = __60__MRRemoteControlGroupSession_removeParticipant_completion___block_invoke_315;
    v20[3] = &unk_1E30CF5C8;
    objc_copyWeak(&v21, (id *)buf);
    v13 = -[MROptimisticState initWithInitialState:expectedState:timeout:queue:timeoutHandler:](v10, "initWithInitialState:expectedState:timeout:queue:timeoutHandler:", v11, 0, v12, v20, 5.0);
    objc_msgSend(v9, "addObject:", v13);

    objc_msgSend(a1[4], "updateParticipantsForOptimisticStateChange");
    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }
  v14 = a1[4];
  v15 = a1[5];
  v16 = (void *)v14[19];
  v17[0] = v5;
  v17[1] = 3221225472;
  v17[2] = __60__MRRemoteControlGroupSession_removeParticipant_completion___block_invoke_316;
  v17[3] = &unk_1E30CF5F0;
  v17[4] = v14;
  v18 = v15;
  v19 = a1[6];
  objc_msgSend(v16, "sendMessage:", v17);

}

void __60__MRRemoteControlGroupSession_removeParticipant_completion___block_invoke_315(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "participantMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "initialState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      _MRLogForCategory(0xCuLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __60__MRRemoteControlGroupSession_removeParticipant_completion___block_invoke_315_cold_1((uint64_t)v5, v3, v10);

    }
    objc_msgSend(v5, "optimisticRemovedParticipants");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObject:", v3);

    objc_msgSend(v5, "updateParticipantsForOptimisticStateChange");
  }

}

void __60__MRRemoteControlGroupSession_removeParticipant_completion___block_invoke_316(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "session:removeParticipant:reply:", v6, v5, *(_QWORD *)(a1 + 48));

}

- (void)parseParticipants:(id)a3 local:(id *)a4 host:(id *)a5 parsed:(id *)a6
{
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (void *)objc_msgSend(v9, "mutableCopy");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v16, "isLocal", (_QWORD)v18))
        {
          v17 = objc_retainAutorelease(v16);
          *a4 = v17;
          objc_msgSend(v10, "removeObject:", v17);
        }
        if (objc_msgSend(v16, "isHost"))
          *a5 = objc_retainAutorelease(v16);
        if (objc_msgSend(v16, "isHidden"))
          objc_msgSend(v10, "removeObject:", v16);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  *a6 = (id)objc_msgSend(v10, "copy");
}

- (void)parseInitialState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MRGroupSessionToken *v7;
  void *v8;
  MRGroupSessionToken *v9;
  MRGroupSessionToken *joinToken;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  NSSet *v27;
  NSSet *pendingParticipants;
  id v29;
  id v30;
  id v31;
  id v32;
  NSSet *v33;
  NSSet *participants;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  NSObject *v52;
  int64_t v53;
  id obj;
  id v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  _QWORD block[4];
  id v62;
  MRRemoteControlGroupSession *v63;
  id v64;
  id v65;
  id v66;
  int64_t v67;
  BOOL v68;
  BOOL v69;
  BOOL v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  id v75;
  id v76;
  id v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_MRGroupSessionStateInitialSyncKey"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v58, "integerValue");
  self->_state = v53;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_MRGroupSessionPlaceholderInitialSyncKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    self->_placeholder = objc_msgSend(v5, "BOOLValue");
  v57 = v6;
  v7 = [MRGroupSessionToken alloc];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_MRGroupSessionTokenInitialSyncKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MRGroupSessionToken initWithData:](v7, "initWithData:", v8);
  joinToken = self->_joinToken;
  self->_joinToken = v9;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_MRGroupSessionParticipantsInitialSyncKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v82, v88, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v83;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v83 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
        -[MRRemoteControlGroupSession participantMap](self, "participantMap");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKey:", v16, v18);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v82, v88, 16);
    }
    while (v13);
  }
  v59 = v4;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_MRGroupSessionPendingParticipantsInitialSyncKey"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v78, v87, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v79;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v79 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * j);
        -[MRRemoteControlGroupSession pendingParticipantMap](self, "pendingParticipantMap");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "identifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setObject:forKey:", v24, v26);

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v78, v87, 16);
    }
    while (v21);
  }
  if (v19)
  {
    v27 = v19;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v27 = (NSSet *)objc_claimAutoreleasedReturnValue();
  }
  pendingParticipants = self->_pendingParticipants;
  self->_pendingParticipants = v27;

  v76 = 0;
  v77 = 0;
  v75 = 0;
  -[MRRemoteControlGroupSession parseParticipants:local:host:parsed:](self, "parseParticipants:local:host:parsed:", v11, &v77, &v76, &v75);
  v29 = v77;
  v56 = v77;
  v30 = v76;
  v55 = v76;
  v31 = v75;
  v32 = v31;
  if (v31)
  {
    v33 = (NSSet *)v31;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v33 = (NSSet *)objc_claimAutoreleasedReturnValue();
  }
  participants = self->_participants;
  self->_participants = v33;

  objc_storeStrong((id *)&self->_localParticipant, v29);
  objc_storeStrong((id *)&self->_host, v30);
  objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("_MRGroupSessionMembersInitialSyncKey"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  v60 = v32;
  if (v35)
  {
    v37 = v35;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v37 = (id)objc_claimAutoreleasedReturnValue();
  }
  v38 = v37;

  v74 = 0u;
  v72 = 0u;
  v73 = 0u;
  v71 = 0u;
  obj = v38;
  v39 = v38;
  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v71, v86, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v72;
    do
    {
      for (k = 0; k != v41; ++k)
      {
        if (*(_QWORD *)v72 != v42)
          objc_enumerationMutation(v39);
        v44 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * k);
        -[MRRemoteControlGroupSession memberMap](self, "memberMap");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "identifier");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setObject:forKey:", v44, v46);

      }
      v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v71, v86, 16);
    }
    while (v41);
  }

  objc_storeStrong((id *)&self->_members, obj);
  v47 = v60;
  v48 = objc_msgSend(v60, "count");
  v49 = objc_msgSend(v39, "count");
  v50 = objc_msgSend(v19, "count");
  -[MRRemoteControlGroupSession delegate](self, "delegate");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (v51)
  {
    -[MRRemoteControlGroupSession callbackQueue](self, "callbackQueue");
    v52 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__MRRemoteControlGroupSession_parseInitialState___block_invoke;
    block[3] = &unk_1E30CF668;
    v62 = v51;
    v63 = self;
    v67 = v53;
    v68 = v49 != 0;
    v64 = v39;
    v69 = v48 != 0;
    v65 = v60;
    v70 = v50 != 0;
    v47 = v60;
    v66 = v19;
    dispatch_async(v52, block);

  }
}

uint64_t __49__MRRemoteControlGroupSession_parseInitialState___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "groupSessionDidConnect:", *(_QWORD *)(a1 + 40));
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    result = objc_msgSend(*(id *)(a1 + 32), "groupSession:didChangeState:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72));
  if (*(_BYTE *)(a1 + 80))
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      result = objc_msgSend(*(id *)(a1 + 32), "groupSession:didUpdateMembers:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  if (*(_BYTE *)(a1 + 81))
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      result = objc_msgSend(*(id *)(a1 + 32), "groupSession:didUpdateParticipants:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  }
  if (*(_BYTE *)(a1 + 82))
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend(*(id *)(a1 + 32), "groupSession:didUpdatePendingParticipants:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));
  }
  return result;
}

- (void)updateParticipantsForOptimisticStateChange
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  BOOL v31;
  BOOL v32;
  NSSet *v33;
  NSSet *pendingParticipants;
  BOOL v35;
  BOOL v36;
  void *v37;
  NSObject *v38;
  id v39;
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  MRRemoteControlGroupSession *v44;
  id v45;
  id v46;
  BOOL v47;
  BOOL v48;
  id v49;
  id v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint8_t v61[128];
  uint8_t buf[4];
  MRRemoteControlGroupSession *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  -[MRRemoteControlGroupSession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  _MRLogForCategory(0xCuLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v63 = self;
    _os_log_impl(&dword_193827000, v4, OS_LOG_TYPE_DEFAULT, "[MRGroupSession] <%p> updateParticipantsForOptimisticStateChange.", buf, 0xCu);
  }

  v5 = (void *)MEMORY[0x1E0C99E20];
  -[MRRemoteControlGroupSession participantMap](self, "participantMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)-[NSSet mutableCopy](self->_pendingParticipants, "mutableCopy");
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  -[MRRemoteControlGroupSession optimisticApprovedPendingParticipants](self, "optimisticApprovedPendingParticipants");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v57 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
        objc_msgSend(v17, "expectedState");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeObject:", v18);

        objc_msgSend(v17, "expectedState");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v19);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    }
    while (v14);
  }

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  -[MRRemoteControlGroupSession optimisticDeniedPendingParticipants](self, "optimisticDeniedPendingParticipants");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "allObjects");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v53;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v53 != v24)
          objc_enumerationMutation(v21);
        objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * j), "initialState");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeObject:", v26);

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
    }
    while (v23);
  }

  v50 = 0;
  v51 = 0;
  v49 = 0;
  -[MRRemoteControlGroupSession parseParticipants:local:host:parsed:](self, "parseParticipants:local:host:parsed:", v9, &v51, &v50, &v49);
  v27 = v51;
  v28 = v50;
  v29 = v49;
  v30 = v49;
  v31 = -[NSSet isEqualToSet:](self->_participants, "isEqualToSet:", v30);
  if (!v31)
    objc_storeStrong((id *)&self->_participants, v29);
  v32 = -[NSSet isEqualToSet:](self->_pendingParticipants, "isEqualToSet:", v10);
  if (!v32)
  {
    v33 = (NSSet *)objc_msgSend(v10, "copy");
    pendingParticipants = self->_pendingParticipants;
    self->_pendingParticipants = v33;

  }
  v35 = !v32;
  v36 = !v31;
  -[MRRemoteControlGroupSession delegate](self, "delegate");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRRemoteControlGroupSession callbackQueue](self, "callbackQueue");
  v38 = objc_claimAutoreleasedReturnValue();
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __73__MRRemoteControlGroupSession_updateParticipantsForOptimisticStateChange__block_invoke;
  v42[3] = &unk_1E30CF690;
  v47 = v36;
  v43 = v37;
  v44 = self;
  v48 = v35;
  v45 = v30;
  v46 = v10;
  v39 = v10;
  v40 = v30;
  v41 = v37;
  dispatch_async(v38, v42);

}

uint64_t __73__MRRemoteControlGroupSession_updateParticipantsForOptimisticStateChange__block_invoke(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v1 = result;
  v12 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(result + 64))
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
    {
      _MRLogForCategory(0xCuLL);
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        v3 = *(_QWORD *)(v1 + 40);
        v4 = *(_QWORD *)(v1 + 48);
        v8 = 134218242;
        v9 = v3;
        v10 = 2112;
        v11 = v4;
        _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_DEFAULT, "[MRGroupSession] <%p> Notify didUpdateParticipants: %@.", (uint8_t *)&v8, 0x16u);
      }

      result = objc_msgSend(*(id *)(v1 + 32), "groupSession:didUpdateParticipants:", *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48));
    }
  }
  if (*(_BYTE *)(v1 + 65))
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
    {
      _MRLogForCategory(0xCuLL);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_QWORD *)(v1 + 40);
        v7 = *(_QWORD *)(v1 + 56);
        v8 = 134218242;
        v9 = v6;
        v10 = 2112;
        v11 = v7;
        _os_log_impl(&dword_193827000, v5, OS_LOG_TYPE_DEFAULT, "[MRGroupSession] <%p> Notify didUpdatePendingParticipants: %@.", (uint8_t *)&v8, 0x16u);
      }

      return objc_msgSend(*(id *)(v1 + 32), "groupSession:didUpdatePendingParticipants:", *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 56));
    }
  }
  return result;
}

- (void)session:(id)a3 didChangeState:(int64_t)a4
{
  NSObject *v6;
  _QWORD v7[6];

  -[MRRemoteControlGroupSession queue](self, "queue", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__MRRemoteControlGroupSession_session_didChangeState___block_invoke;
  v7[3] = &unk_1E30C78E0;
  v7[4] = self;
  v7[5] = a4;
  dispatch_async(v6, v7);

}

void __54__MRRemoteControlGroupSession_session_didChangeState___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD block[4];
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  _MRLogForCategory(0xCuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134218240;
    v15 = v3;
    v16 = 2048;
    v17 = v4;
    _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_DEFAULT, "[MRGroupSession] <%p> Update state %ld.", buf, 0x16u);
  }

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__MRRemoteControlGroupSession_session_didChangeState___block_invoke_326;
    block[3] = &unk_1E30C9E88;
    v7 = v5;
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v11 = v7;
    v12 = v8;
    v13 = v9;
    dispatch_async(v6, block);

  }
}

uint64_t __54__MRRemoteControlGroupSession_session_didChangeState___block_invoke_326(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "groupSession:didChangeState:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)session:(id)a3 didUpdateParticipants:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[MRRemoteControlGroupSession queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__MRRemoteControlGroupSession_session_didUpdateParticipants___block_invoke;
  v8[3] = &unk_1E30C5F40;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

void __61__MRRemoteControlGroupSession_session_didUpdateParticipants___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  int v46;
  id v47;
  void *v48;
  int v49;
  void *v50;
  NSObject *v51;
  _QWORD v52[5];
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint8_t v72[128];
  uint8_t buf[4];
  uint64_t v74;
  __int16 v75;
  uint64_t v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  _MRLogForCategory(0xCuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    v74 = v3;
    v75 = 2112;
    v76 = v4;
    _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_DEFAULT, "[MRGroupSession] <%p> Update participants %@.", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "participantMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v6 = *(id *)(a1 + 40);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v67;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v67 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "participantMap");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKey:", v11, v13);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
    }
    while (v8);
  }

  v14 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "optimisticApprovedPendingParticipants");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v63;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v63 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * j);
        v22 = *(void **)(a1 + 40);
        objc_msgSend(v21, "expectedState");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v22) = objc_msgSend(v22, "containsObject:", v23);

        if ((_DWORD)v22)
        {
          objc_msgSend(*(id *)(a1 + 32), "optimisticApprovedPendingParticipants");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "removeObject:", v21);
        }
        else
        {
          objc_msgSend(v21, "expectedState");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v24);
        }

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
    }
    while (v18);
  }

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "optimisticRemovedParticipants");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "allObjects");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v59;
    do
    {
      for (k = 0; k != v28; ++k)
      {
        if (*(_QWORD *)v59 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * k);
        v32 = *(void **)(a1 + 40);
        objc_msgSend(v31, "initialState");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v32) = objc_msgSend(v32, "containsObject:", v33);

        if ((v32 & 1) != 0)
        {
          objc_msgSend(v31, "initialState");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v14;
          v36 = v34;
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "optimisticRemovedParticipants");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v35;
          v36 = v31;
        }
        objc_msgSend(v35, "removeObject:", v36);

      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
    }
    while (v28);
  }

  v37 = *(void **)(a1 + 32);
  v56 = 0;
  v57 = 0;
  v55 = 0;
  objc_msgSend(v37, "parseParticipants:local:host:parsed:", v14, &v57, &v56, &v55);
  v38 = v57;
  v39 = v57;
  v40 = v56;
  v41 = v56;
  v42 = v55;
  v43 = v55;
  v44 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  if (v44 == v43)
  {

  }
  else
  {
    v45 = v44;
    v46 = objc_msgSend(v44, "isEqual:", v43);

    if (!v46)
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 112), v38);
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 104), v40);
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), v42);
LABEL_36:
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if (v50 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
        v51 = objc_claimAutoreleasedReturnValue();
        v52[0] = MEMORY[0x1E0C809B0];
        v52[1] = 3221225472;
        v52[2] = __61__MRRemoteControlGroupSession_session_didUpdateParticipants___block_invoke_327;
        v52[3] = &unk_1E30C7328;
        v52[4] = *(_QWORD *)(a1 + 32);
        v53 = v43;
        v54 = v50;
        dispatch_async(v51, v52);

      }
      goto LABEL_41;
    }
  }
  v47 = *(id *)(*(_QWORD *)(a1 + 32) + 104);
  v48 = v47;
  if (v47 == v41)
  {

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 112), v38);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 104), v40);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), v42);
    goto LABEL_41;
  }
  v49 = objc_msgSend(v47, "isEqual:", v41);

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 112), v38);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 104), v40);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), v42);
  if (!v49)
    goto LABEL_36;
LABEL_41:

}

uint64_t __61__MRRemoteControlGroupSession_session_didUpdateParticipants___block_invoke_327(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _MRLogForCategory(0xCuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 134218242;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_DEFAULT, "[MRGroupSession] <%p> Notify didUpdateParticipants: %@.", (uint8_t *)&v6, 0x16u);
  }

  return objc_msgSend(*(id *)(a1 + 48), "groupSession:didUpdateParticipants:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)session:(id)a3 didUpdatePendingParticipants:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[MRRemoteControlGroupSession queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__MRRemoteControlGroupSession_session_didUpdatePendingParticipants___block_invoke;
  v8[3] = &unk_1E30C5F40;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

void __68__MRRemoteControlGroupSession_session_didUpdatePendingParticipants___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  id v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD block[5];
  id v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint8_t v64[128];
  uint8_t buf[4];
  uint64_t v66;
  __int16 v67;
  uint64_t v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  _MRLogForCategory(0xCuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    v66 = v3;
    v67 = 2112;
    v68 = v4;
    _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_DEFAULT, "[MRGroupSession] <%p> Update pending participants %@.", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "pendingParticipantMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v6 = *(id *)(a1 + 40);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v59 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "pendingParticipantMap");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKey:", v11, v13);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
    }
    while (v8);
  }

  v14 = (id)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "optimisticApprovedPendingParticipants");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v55;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v55 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
        objc_msgSend(v21, "expectedState");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v14, "containsObject:", v22);

        if (v23)
        {
          objc_msgSend(v21, "expectedState");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "removeObject:", v24);

        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
    }
    while (v18);
  }

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "optimisticDeniedPendingParticipants");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "allObjects");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v51;
    do
    {
      for (k = 0; k != v28; ++k)
      {
        if (*(_QWORD *)v51 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * k);
        objc_msgSend(v31, "initialState");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v14, "containsObject:", v32);

        if ((v33 & 1) != 0)
        {
          objc_msgSend(v31, "initialState");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v14;
          v36 = v34;
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "optimisticDeniedPendingParticipants");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v35;
          v36 = v31;
        }
        objc_msgSend(v35, "removeObject:", v36);

      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
    }
    while (v28);
  }

  v37 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  if (v37 == v14)
  {

    v45 = objc_msgSend(v14, "copy");
    v46 = *(_QWORD *)(a1 + 32);
    v43 = *(id *)(v46 + 48);
    *(_QWORD *)(v46 + 48) = v45;
LABEL_35:

    goto LABEL_36;
  }
  v38 = v37;
  v39 = objc_msgSend(v37, "isEqual:", v14);

  v40 = objc_msgSend(v14, "copy");
  v41 = *(_QWORD *)(a1 + 32);
  v42 = *(void **)(v41 + 48);
  *(_QWORD *)(v41 + 48) = v40;

  if ((v39 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v43 = (id)objc_claimAutoreleasedReturnValue();
    if (v43 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
      v44 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __68__MRRemoteControlGroupSession_session_didUpdatePendingParticipants___block_invoke_328;
      block[3] = &unk_1E30C7328;
      block[4] = *(_QWORD *)(a1 + 32);
      v48 = v14;
      v43 = v43;
      v49 = v43;
      dispatch_async(v44, block);

    }
    goto LABEL_35;
  }
LABEL_36:

}

uint64_t __68__MRRemoteControlGroupSession_session_didUpdatePendingParticipants___block_invoke_328(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _MRLogForCategory(0xCuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 134218242;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_DEFAULT, "[MRGroupSession] <%p> Notify didUpdatePendingParticipants: %@.", (uint8_t *)&v6, 0x16u);
  }

  return objc_msgSend(*(id *)(a1 + 48), "groupSession:didUpdatePendingParticipants:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)session:(id)a3 didUpdateMembers:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[MRRemoteControlGroupSession queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__MRRemoteControlGroupSession_session_didUpdateMembers___block_invoke;
  v8[3] = &unk_1E30C5F40;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

void __56__MRRemoteControlGroupSession_session_didUpdateMembers___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  void *v18;
  _QWORD block[4];
  id v20;
  uint64_t v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  _MRLogForCategory(0xCuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    v29 = v3;
    v30 = 2112;
    v31 = v4;
    _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_DEFAULT, "[MRGroupSession] <%p> Update members %@.", buf, 0x16u);
  }

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "memberMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = *(id *)(a1 + 40);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v10);
        objc_msgSend(*(id *)(a1 + 32), "memberMap");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKey:", v11, v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v8);
  }

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__MRRemoteControlGroupSession_session_didUpdateMembers___block_invoke_329;
    block[3] = &unk_1E30C7328;
    v16 = v14;
    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(void **)(a1 + 40);
    v20 = v16;
    v21 = v17;
    v22 = v18;
    dispatch_async(v15, block);

  }
}

uint64_t __56__MRRemoteControlGroupSession_session_didUpdateMembers___block_invoke_329(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "groupSession:didUpdateMembers:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)session:(id)a3 didUpdateSynchronizedMetadata:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[MRRemoteControlGroupSession queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__MRRemoteControlGroupSession_session_didUpdateSynchronizedMetadata___block_invoke;
  v8[3] = &unk_1E30C5F40;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

void __69__MRRemoteControlGroupSession_session_didUpdateSynchronizedMetadata___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD block[4];
  id v10;
  uint64_t v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  _MRLogForCategory(0xCuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134217984;
    v14 = v3;
    _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_DEFAULT, "[MRGroupSession] <%p> Update synchronized metadata.", buf, 0xCu);
  }

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 128), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__MRRemoteControlGroupSession_session_didUpdateSynchronizedMetadata___block_invoke_332;
    block[3] = &unk_1E30C7328;
    v6 = v4;
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(a1 + 40);
    v10 = v6;
    v11 = v7;
    v12 = v8;
    dispatch_async(v5, block);

  }
}

uint64_t __69__MRRemoteControlGroupSession_session_didUpdateSynchronizedMetadata___block_invoke_332(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "groupSession:didUpdateSynchronizedMetadata:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)session:(id)a3 didInvalidateWithError:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[MRRemoteControlGroupSession queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__MRRemoteControlGroupSession_session_didInvalidateWithError___block_invoke;
  v8[3] = &unk_1E30C5F40;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

void __62__MRRemoteControlGroupSession_session_didInvalidateWithError___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD block[4];
  id v14;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  _MRLogForCategory(0xCuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    v18 = v3;
    v19 = 2112;
    v20 = v4;
    _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_DEFAULT, "[MRGroupSession] <%p> invalidated %@.", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "optimisticRemovedParticipants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "optimisticApprovedPendingParticipants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "optimisticDeniedPendingParticipants");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setDelegate:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setConnection:", 0);
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__MRRemoteControlGroupSession_session_didInvalidateWithError___block_invoke_333;
    block[3] = &unk_1E30C7328;
    v10 = v8;
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(a1 + 40);
    v14 = v10;
    v15 = v11;
    v16 = v12;
    dispatch_async(v9, block);

  }
}

uint64_t __62__MRRemoteControlGroupSession_session_didInvalidateWithError___block_invoke_333(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "groupSession:didInvalidateWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)session:(id)a3 didConnectWithInitialState:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[MRRemoteControlGroupSession queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__MRRemoteControlGroupSession_session_didConnectWithInitialState___block_invoke;
  v8[3] = &unk_1E30C5F40;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

uint64_t __66__MRRemoteControlGroupSession_session_didConnectWithInitialState___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _MRLogForCategory(0xCuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 134217984;
    v6 = v3;
    _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_DEFAULT, "[MRGroupSession] <%p> Connected after initialization", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "parseInitialState:", *(_QWORD *)(a1 + 40));
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (BOOL)isPlaceholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(BOOL)a3
{
  self->_placeholder = a3;
}

- (void)setParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_participants, a3);
}

- (NSMapTable)participantMap
{
  return self->_participantMap;
}

- (void)setParticipantMap:(id)a3
{
  objc_storeStrong((id *)&self->_participantMap, a3);
}

- (void)setPendingParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_pendingParticipants, a3);
}

- (NSMapTable)pendingParticipantMap
{
  return self->_pendingParticipantMap;
}

- (void)setPendingParticipantMap:(id)a3
{
  objc_storeStrong((id *)&self->_pendingParticipantMap, a3);
}

- (void)setMembers:(id)a3
{
  objc_storeStrong((id *)&self->_members, a3);
}

- (NSMapTable)memberMap
{
  return self->_memberMap;
}

- (void)setMemberMap:(id)a3
{
  objc_storeStrong((id *)&self->_memberMap, a3);
}

- (NSHashTable)optimisticApprovedPendingParticipants
{
  return self->_optimisticApprovedPendingParticipants;
}

- (void)setOptimisticApprovedPendingParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_optimisticApprovedPendingParticipants, a3);
}

- (NSHashTable)optimisticDeniedPendingParticipants
{
  return self->_optimisticDeniedPendingParticipants;
}

- (void)setOptimisticDeniedPendingParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_optimisticDeniedPendingParticipants, a3);
}

- (NSHashTable)optimisticRemovedParticipants
{
  return self->_optimisticRemovedParticipants;
}

- (void)setOptimisticRemovedParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_optimisticRemovedParticipants, a3);
}

- (void)setHost:(id)a3
{
  objc_storeStrong((id *)&self->_host, a3);
}

- (void)setLocalParticipant:(id)a3
{
  objc_storeStrong((id *)&self->_localParticipant, a3);
}

- (void)setJoinToken:(id)a3
{
  objc_storeStrong((id *)&self->_joinToken, a3);
}

- (void)setSynchronizedMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_synchronizedMetadata, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (MRGroupSessionXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (MRGroupSessionDelegate)delegate
{
  return (MRGroupSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_synchronizedMetadata, 0);
  objc_storeStrong((id *)&self->_joinToken, 0);
  objc_storeStrong((id *)&self->_localParticipant, 0);
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_optimisticRemovedParticipants, 0);
  objc_storeStrong((id *)&self->_optimisticDeniedPendingParticipants, 0);
  objc_storeStrong((id *)&self->_optimisticApprovedPendingParticipants, 0);
  objc_storeStrong((id *)&self->_memberMap, 0);
  objc_storeStrong((id *)&self->_members, 0);
  objc_storeStrong((id *)&self->_pendingParticipantMap, 0);
  objc_storeStrong((id *)&self->_pendingParticipants, 0);
  objc_storeStrong((id *)&self->_participantMap, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

void __68__MRRemoteControlGroupSession_approvePendingParticipant_completion___block_invoke_299_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "expectedState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_9();
  OUTLINED_FUNCTION_2_4(&dword_193827000, a3, v5, "[MRGroupSession] <%p> Approved participant %@ not found after timeout.", v6);

  OUTLINED_FUNCTION_2_1();
}

void __65__MRRemoteControlGroupSession_denyPendingParticipant_completion___block_invoke_304_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "initialState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_9();
  OUTLINED_FUNCTION_2_4(&dword_193827000, a3, v5, "[MRGroupSession] <%p> Denied participant %@ still found after timeout.", v6);

  OUTLINED_FUNCTION_2_1();
}

void __67__MRRemoteControlGroupSession_assertSessionManagementScreenVisible__block_invoke_310_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_7_1(&dword_193827000, v0, v1, "[MRGroupSession] Failed to assert %@ for session with identifier: %@: %@");
}

void __67__MRRemoteControlGroupSession_assertSessionManagementScreenVisible__block_invoke_314_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_7_1(&dword_193827000, v0, v1, "[MRGroupSession] Failed to end assertion %@ for session with identifier: %@: %@");
}

void __60__MRRemoteControlGroupSession_removeParticipant_completion___block_invoke_315_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "initialState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_9();
  OUTLINED_FUNCTION_2_4(&dword_193827000, a3, v5, "[MRGroupSession] <%p> Removed participant %@ still found after timeout.", v6);

  OUTLINED_FUNCTION_2_1();
}

@end
