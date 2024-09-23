@implementation AUPBServer

+ (id)sharedInstance
{
  objc_super v4;

  objc_sync_enter(a1);
  if (!sSharedInstance)
  {
    v4.receiver = a1;
    v4.super_class = (Class)&OBJC_METACLASS___AUPBServer;
    sSharedInstance = objc_msgSend(objc_msgSendSuper2(&v4, sel_allocWithZone_, 0), "init");
  }
  objc_sync_exit(a1);
  return (id)sSharedInstance;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(a1, "sharedInstance", a3);
}

- (unint64_t)retainCount
{
  return -1;
}

- (void)dealloc
{
  objc_super v3;

  if (self->mValidToken)
    notify_cancel(self->mNotifyToken);
  v3.receiver = self;
  v3.super_class = (Class)AUPBServer;
  -[AUPBServer dealloc](&v3, sel_dealloc);
}

- (AUPBServer)init
{
  AUPBServer *v2;
  NSObject *v3;
  unfair_recursive_lock *v4;
  unfair_recursive_lock *value;
  NSXPCListener *v6;
  NSObject *global_queue;
  _QWORD handler[5];
  uint8_t buf[16];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AUPBServer;
  v2 = -[AUPBServer init](&v11, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.coreaudio", "aupbs");
    gAUPBServerLogCategory = (uint64_t)v3;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_18EE07000, v3, OS_LOG_TYPE_DEBUG, "Starting\n", buf, 2u);
    }
    v2->mAUPBRefCounter = 1;
    v2->mAUHandleCntr = 1;
    v4 = (unfair_recursive_lock *)operator new();
    *(_QWORD *)v4 = 0;
    value = v2->mLock.__ptr_.__value_;
    v2->mLock.__ptr_.__value_ = v4;
    if (value)
      MEMORY[0x193FFE460](value, 0x1000C4000313F17);
    v2->mClientConnections = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = (NSXPCListener *)objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
    v2->mListener = v6;
    -[NSXPCListener setDelegate:](v6, "setDelegate:", v2);
    -[NSXPCListener resume](v2->mListener, "resume");
    global_queue = dispatch_get_global_queue(0, 0);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __18__AUPBServer_init__block_invoke;
    handler[3] = &unk_1E2919F58;
    handler[4] = v2;
    *(_WORD *)&v2->mValidToken = notify_register_dispatch("com.apple.audio.aupbregistrarneeded", &v2->mNotifyToken, global_queue, handler) == 0;
    -[AUPBServer checkConnectRegistrar](v2, "checkConnectRegistrar");
  }
  return v2;
}

- (void)checkConnectRegistrar
{
  uint32_t state;
  BOOL v4;
  uint64_t state64;

  if (self->mValidToken)
  {
    state64 = 0;
    state = notify_get_state(self->mNotifyToken, &state64);
    if (state64)
      v4 = state == 0;
    else
      v4 = 0;
    if (v4 && !self->mRegistrarConnection)
      -[AUPBServer startRegistrarConnection](self, "startRegistrarConnection");
  }
}

- (void)startRegistrarConnection
{
  NSObject *v3;
  uint64_t v4;
  NSXPCConnection *mRegistrarConnection;
  NSXPCConnection *v6;
  AUPBRegistrarHosting *v7;
  NSXPCListenerEndpoint *v8;
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];
  uint8_t buf[8];
  uint8_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  AUPBServer *v17;

  v3 = gAUPBServerLogCategory;
  if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_18EE07000, v3, OS_LOG_TYPE_DEBUG, "Starting registrar connection\n", buf, 2u);
  }
  self->mRegistrarConnection = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.internal.aupbregistrarservice"));
  -[NSXPCConnection setRemoteObjectInterface:](self->mRegistrarConnection, "setRemoteObjectInterface:", objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE171570));
  *(_QWORD *)buf = 0;
  v13 = buf;
  v14 = 0x3052000000;
  v15 = __Block_byref_object_copy__2453;
  v16 = __Block_byref_object_dispose__2454;
  v17 = self;
  v4 = MEMORY[0x1E0C809B0];
  mRegistrarConnection = self->mRegistrarConnection;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __38__AUPBServer_startRegistrarConnection__block_invoke;
  v11[3] = &unk_1E29222D8;
  v11[4] = buf;
  -[NSXPCConnection setInterruptionHandler:](mRegistrarConnection, "setInterruptionHandler:", v11);
  v6 = self->mRegistrarConnection;
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __38__AUPBServer_startRegistrarConnection__block_invoke_2;
  v10[3] = &unk_1E29222D8;
  v10[4] = buf;
  -[NSXPCConnection setInvalidationHandler:](v6, "setInvalidationHandler:", v10);
  -[NSXPCConnection resume](self->mRegistrarConnection, "resume");
  v7 = -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->mRegistrarConnection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_2468);
  self->mProxyInterface = v7;
  v8 = -[NSXPCListener endpoint](self->mListener, "endpoint");
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __38__AUPBServer_startRegistrarConnection__block_invoke_32;
  v9[3] = &unk_1E29214E0;
  v9[4] = self;
  -[AUPBRegistrarHosting setListenerEndpoint:withReply:](v7, "setListenerEndpoint:withReply:", v8, v9);
  _Block_object_dispose(buf, 8);
}

- (void)handleRegistrarCrash
{
  NSObject *v3;
  NSMutableArray *mClientConnections;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  NSObject *v9;
  dispatch_time_t v10;
  _QWORD block[5];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[8];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = gAUPBServerLogCategory;
  if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_18EE07000, v3, OS_LOG_TYPE_DEBUG, "Registrar crashed - cancelling client connections\n", buf, 2u);
  }

  self->mRegistrarConnection = 0;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  mClientConnections = self->mClientConnections;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mClientConnections, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(mClientConnections);
        objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "xpcconnection"), "invalidate");
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mClientConnections, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v6);
  }
  -[NSMutableArray removeAllObjects](self->mClientConnections, "removeAllObjects");
  if (self->mConnectionAcknowledged)
  {
    v9 = gAUPBServerLogCategory;
    if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_18EE07000, v9, OS_LOG_TYPE_DEBUG, "CheckconnectRegistrar after 2 sec:\n", buf, 2u);
    }
    v10 = dispatch_time(0, 2000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __34__AUPBServer_handleRegistrarCrash__block_invoke;
    block[3] = &unk_1E2921508;
    block[4] = self;
    dispatch_after(v10, MEMORY[0x1E0C80D38], block);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  char v6;
  NSObject *v7;
  AUPBClientConnection *v8;
  NSXPCConnection *v9;
  uint64_t v10;
  _QWORD v12[7];
  _QWORD v13[7];
  __int128 buf;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  AUPBClientConnection *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend((id)objc_msgSend(a4, "valueForEntitlement:", CFSTR("com.apple.private.coreaudio.rpbclient")), "BOOLValue");
  v7 = gAUPBServerLogCategory;
  if ((v6 & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = a4;
      _os_log_debug_impl(&dword_18EE07000, v7, OS_LOG_TYPE_DEBUG, "New client connected (xpcCon=%p)\n", (uint8_t *)&buf, 0xCu);
    }
    v8 = objc_alloc_init(AUPBClientConnection);
    -[AUPBClientConnection setXpcconnection:](v8, "setXpcconnection:", a4);
    -[NSXPCConnection setExportedInterface:](-[AUPBClientConnection xpcconnection](v8, "xpcconnection"), "setExportedInterface:", objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE16AD20));
    -[NSXPCConnection setExportedObject:](-[AUPBClientConnection xpcconnection](v8, "xpcconnection"), "setExportedObject:", self);
    -[NSXPCConnection setRemoteObjectInterface:](-[AUPBClientConnection xpcconnection](v8, "xpcconnection"), "setRemoteObjectInterface:", objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE16E448));
    -[AUPBClientConnection setProxyInterface:](v8, "setProxyInterface:", -[NSXPCConnection remoteObjectProxy](-[AUPBClientConnection xpcconnection](v8, "xpcconnection"), "remoteObjectProxy"));
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v15 = 0x3052000000;
    v16 = __Block_byref_object_copy__2453;
    v17 = __Block_byref_object_dispose__2454;
    v18 = v8;
    v9 = -[AUPBClientConnection xpcconnection](v8, "xpcconnection");
    v10 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __49__AUPBServer_listener_shouldAcceptNewConnection___block_invoke;
    v13[3] = &unk_1E2919FA0;
    v13[4] = a4;
    v13[5] = self;
    v13[6] = &buf;
    -[NSXPCConnection setInterruptionHandler:](v9, "setInterruptionHandler:", v13);
    v12[0] = v10;
    v12[1] = 3221225472;
    v12[2] = __49__AUPBServer_listener_shouldAcceptNewConnection___block_invoke_62;
    v12[3] = &unk_1E2919FA0;
    v12[4] = a4;
    v12[5] = self;
    v12[6] = &buf;
    -[NSXPCConnection setInvalidationHandler:](-[AUPBClientConnection xpcconnection](v8, "xpcconnection"), "setInvalidationHandler:", v12);
    -[NSMutableArray addObject:](self->mClientConnections, "addObject:", v8);

    -[NSXPCConnection resume](-[AUPBClientConnection xpcconnection](v8, "xpcconnection"), "resume");
    _Block_object_dispose(&buf, 8);
  }
  else if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = objc_msgSend(a4, "description");
    _os_log_error_impl(&dword_18EE07000, v7, OS_LOG_TYPE_ERROR, "Refusing connection without entitlement: %@", (uint8_t *)&buf, 0xCu);
  }
  return v6;
}

- (OpaqueAUPB)registerBlock:(const AUPBMethods *)a3 withUserData:(void *)a4
{
  OpaqueAUPB *mAUPBRefCounter;
  NSObject *v8;
  __int128 v9;
  __int128 v10;
  void *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, AUProcessingBlock>, void *>>> *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, AUProcessingBlock>, void *>>> *v13;
  unsigned int v14;
  char *v15;
  void *v16;
  uint64_t *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v22[32];
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  os_unfair_recursive_lock_lock_with_options();
  mAUPBRefCounter = (OpaqueAUPB *)self->mAUPBRefCounter;
  self->mAUPBRefCounter = (_DWORD)mAUPBRefCounter + 1;
  v8 = gAUPBServerLogCategory;
  if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v22 = 67109376;
    *(_DWORD *)&v22[4] = (_DWORD)mAUPBRefCounter;
    *(_WORD *)&v22[8] = 2048;
    *(_QWORD *)&v22[10] = a4;
    _os_log_debug_impl(&dword_18EE07000, v8, OS_LOG_TYPE_DEBUG, "blockRef 0x%x assigned, userData: %p\n", v22, 0x12u);
  }
  v9 = *(_OWORD *)&a3->var2;
  *(_OWORD *)v22 = *(_OWORD *)&a3->var0;
  *(_OWORD *)&v22[16] = v9;
  v10 = *(_OWORD *)&a3->var6;
  v23 = *(_OWORD *)&a3->var4;
  v24 = v10;
  p_pair1 = &self->mBlockHandlesToMethods.__tree_.__pair1_;
  left = self->mBlockHandlesToMethods.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    while (1)
    {
      while (1)
      {
        v13 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, AUProcessingBlock>, void *>>> *)left;
        v14 = *((_DWORD *)left + 8);
        if (mAUPBRefCounter >= v14)
          break;
        left = v13->__value_.__left_;
        p_pair1 = v13;
        if (!v13->__value_.__left_)
          goto LABEL_11;
      }
      if (v14 >= mAUPBRefCounter)
        break;
      left = v13[1].__value_.__left_;
      if (!left)
      {
        p_pair1 = v13 + 1;
        goto LABEL_11;
      }
    }
    v15 = (char *)v13;
  }
  else
  {
    v13 = &self->mBlockHandlesToMethods.__tree_.__pair1_;
LABEL_11:
    v15 = (char *)operator new(0x70uLL);
    *((_DWORD *)v15 + 8) = (_DWORD)mAUPBRefCounter;
    *(_OWORD *)(v15 + 40) = 0u;
    *(_OWORD *)(v15 + 56) = 0u;
    *(_OWORD *)(v15 + 72) = 0u;
    *(_OWORD *)(v15 + 88) = 0u;
    *((_QWORD *)v15 + 13) = 0;
    *(_QWORD *)v15 = 0;
    *((_QWORD *)v15 + 1) = 0;
    *((_QWORD *)v15 + 2) = v13;
    p_pair1->__value_.__left_ = v15;
    v16 = *(void **)self->mBlockHandlesToMethods.__tree_.__begin_node_;
    v17 = (uint64_t *)v15;
    if (v16)
    {
      self->mBlockHandlesToMethods.__tree_.__begin_node_ = v16;
      v17 = (uint64_t *)p_pair1->__value_.__left_;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)self->mBlockHandlesToMethods.__tree_.__pair1_.__value_.__left_, v17);
    ++self->mBlockHandlesToMethods.__tree_.__pair3_.__value_;
  }
  v19 = v23;
  v18 = v24;
  v20 = *(_OWORD *)&v22[16];
  *(_OWORD *)(v15 + 40) = *(_OWORD *)v22;
  *(_OWORD *)(v15 + 56) = v20;
  *(_OWORD *)(v15 + 72) = v19;
  *(_OWORD *)(v15 + 88) = v18;
  *((_QWORD *)v15 + 13) = a4;
  -[AUPBServer blockListChanged](self, "blockListChanged", *(_OWORD *)v22, *(_QWORD *)&v22[16]);
  os_unfair_recursive_lock_unlock();
  return mAUPBRefCounter;
}

- (int)unregisterBlock:(OpaqueAUPB *)a3
{
  unsigned int v5;
  char *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, AUProcessingBlock>, void *>>> *p_pair1;
  unsigned int v8;
  BOOL v9;
  char **v10;
  int v11;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, RemoteAUHandleInfo>, void *>>> *begin_node;
  AUPBServer *v14;
  AUPBServer *isa;
  BOOL v16;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, AUProcessingBlock>, void *>>> *v17;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, AUProcessingBlock>, void *>>> **v18;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, AUProcessingBlock>, void *>>> *v19;
  uint64_t *v20;
  NSObject *v21;
  int v22;
  OpaqueAUPB *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  os_unfair_recursive_lock_lock_with_options();
  v5 = -[AUPBServer handleFromAUPBRef:](self, "handleFromAUPBRef:", a3);
  left = (char *)self->mBlockHandlesToMethods.__tree_.__pair1_.__value_.__left_;
  if (!left)
    goto LABEL_12;
  p_pair1 = &self->mBlockHandlesToMethods.__tree_.__pair1_;
  do
  {
    v8 = *((_DWORD *)left + 8);
    v9 = v8 >= v5;
    if (v8 >= v5)
      v10 = (char **)left;
    else
      v10 = (char **)(left + 8);
    if (v9)
      p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, AUProcessingBlock>, void *>>> *)left;
    left = *v10;
  }
  while (*v10);
  if (p_pair1 != &self->mBlockHandlesToMethods.__tree_.__pair1_ && v5 >= LODWORD(p_pair1[4].__value_.__left_))
  {
    begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, RemoteAUHandleInfo>, void *>>> *)self->mAUHandlesToInfo.__tree_.__begin_node_;
    if (begin_node != &self->mAUHandlesToInfo.__tree_.__pair1_)
    {
      do
      {
        if (LODWORD(begin_node[5].__value_.__left_) == LODWORD(p_pair1[4].__value_.__left_))
        {
          v14 = (AUPBServer *)std::__tree<std::__value_type<unsigned int,RemoteAUHandleInfo>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,RemoteAUHandleInfo>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,RemoteAUHandleInfo>>>::__remove_node_pointer((uint64_t **)&self->mAUHandlesToInfo, (uint64_t *)begin_node);
          operator delete(begin_node);
        }
        else
        {
          isa = (AUPBServer *)begin_node[1].__value_.__left_;
          if (isa)
          {
            do
            {
              v14 = isa;
              isa = (AUPBServer *)isa->super.isa;
            }
            while (isa);
          }
          else
          {
            do
            {
              v14 = (AUPBServer *)begin_node[2].__value_.__left_;
              v16 = v14->super.isa == (Class)begin_node;
              begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, RemoteAUHandleInfo>, void *>>> *)v14;
            }
            while (!v16);
          }
        }
        begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, RemoteAUHandleInfo>, void *>>> *)v14;
      }
      while (v14 != (AUPBServer *)&self->mAUHandlesToInfo.__tree_.__pair1_);
    }
    v17 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, AUProcessingBlock>, void *>>> *)p_pair1[1].__value_.__left_;
    if (v17)
    {
      do
      {
        v18 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, AUProcessingBlock>, void *>>> **)v17;
        v17 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, AUProcessingBlock>, void *>>> *)v17->__value_.__left_;
      }
      while (v17);
    }
    else
    {
      v19 = p_pair1;
      do
      {
        v18 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, AUProcessingBlock>, void *>>> **)v19[2].__value_.__left_;
        v16 = *v18 == v19;
        v19 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, AUProcessingBlock>, void *>>> *)v18;
      }
      while (!v16);
    }
    if (self->mBlockHandlesToMethods.__tree_.__begin_node_ == p_pair1)
      self->mBlockHandlesToMethods.__tree_.__begin_node_ = v18;
    v20 = (uint64_t *)self->mBlockHandlesToMethods.__tree_.__pair1_.__value_.__left_;
    --self->mBlockHandlesToMethods.__tree_.__pair3_.__value_;
    std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v20, (uint64_t *)p_pair1);
    operator delete(p_pair1);
    v21 = gAUPBServerLogCategory;
    if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
    {
      v22 = 134217984;
      v23 = a3;
      _os_log_debug_impl(&dword_18EE07000, v21, OS_LOG_TYPE_DEBUG, "Unregistered blockRef %p\n", (uint8_t *)&v22, 0xCu);
    }
    -[AUPBServer blockListChanged](self, "blockListChanged");
    v11 = 0;
  }
  else
  {
LABEL_12:
    v11 = -50;
  }
  os_unfair_recursive_lock_unlock();
  return v11;
}

- (int)registerAU:(OpaqueRemoteAudioUnit *)a3 inBlock:(OpaqueAUPB *)a4
{
  NSObject *v7;
  char *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, RemoteAUHandleInfo>, void *>>> *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, RemoteAUHandleInfo>, void *>>> *v10;
  unsigned int v11;
  BOOL v12;
  char **v13;
  unsigned int v14;
  void *v15;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, RemoteAUHandleInfo>, void *>>> *v16;
  unsigned int v17;
  _DWORD *v18;
  void *v19;
  uint64_t *v20;
  int v21;
  NSObject *v22;
  int v24;
  OpaqueRemoteAudioUnit *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  OpaqueAUPB *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  os_unfair_recursive_lock_lock_with_options();
  v7 = gAUPBServerLogCategory;
  if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
  {
    v24 = 134218496;
    v25 = a3;
    v26 = 1024;
    v27 = (int)a3;
    v28 = 2048;
    v29 = a4;
    _os_log_debug_impl(&dword_18EE07000, v7, OS_LOG_TYPE_DEBUG, "Registered AU %p -> handle 0x%x in block %p\n", (uint8_t *)&v24, 0x1Cu);
  }
  p_pair1 = &self->mAUHandlesToInfo.__tree_.__pair1_;
  left = (char *)self->mAUHandlesToInfo.__tree_.__pair1_.__value_.__left_;
  if (!left)
    goto LABEL_14;
  v10 = &self->mAUHandlesToInfo.__tree_.__pair1_;
  do
  {
    v11 = *((_DWORD *)left + 8);
    v12 = v11 >= a3;
    if (v11 >= a3)
      v13 = (char **)left;
    else
      v13 = (char **)(left + 8);
    if (v12)
      v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, RemoteAUHandleInfo>, void *>>> *)left;
    left = *v13;
  }
  while (*v13);
  if (v10 != p_pair1 && LODWORD(v10[4].__value_.__left_) <= a3)
  {
    v21 = 1886806380;
    v22 = gAUPBServerLogCategory;
    if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_ERROR))
    {
      v24 = 67109120;
      LODWORD(v25) = (_DWORD)a3;
      _os_log_error_impl(&dword_18EE07000, v22, OS_LOG_TYPE_ERROR, "### AU Handle 0x%x is already in handles to info map\n", (uint8_t *)&v24, 8u);
    }
  }
  else
  {
LABEL_14:
    v14 = -[AUPBServer handleFromAUPBRef:](self, "handleFromAUPBRef:", a4);
    v15 = p_pair1->__value_.__left_;
    v16 = &self->mAUHandlesToInfo.__tree_.__pair1_;
    if (p_pair1->__value_.__left_)
    {
      while (1)
      {
        while (1)
        {
          v16 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, RemoteAUHandleInfo>, void *>>> *)v15;
          v17 = *((_DWORD *)v15 + 8);
          if (v17 <= a3)
            break;
          v15 = v16->__value_.__left_;
          p_pair1 = v16;
          if (!v16->__value_.__left_)
            goto LABEL_21;
        }
        if (v17 >= a3)
          break;
        v15 = v16[1].__value_.__left_;
        if (!v15)
        {
          p_pair1 = v16 + 1;
          goto LABEL_21;
        }
      }
      v18 = v16;
    }
    else
    {
LABEL_21:
      v18 = operator new(0x38uLL);
      v18[8] = (_DWORD)a3;
      *((_QWORD *)v18 + 5) = 0;
      *((_QWORD *)v18 + 6) = 0;
      *(_QWORD *)v18 = 0;
      *((_QWORD *)v18 + 1) = 0;
      *((_QWORD *)v18 + 2) = v16;
      p_pair1->__value_.__left_ = v18;
      v19 = *(void **)self->mAUHandlesToInfo.__tree_.__begin_node_;
      v20 = (uint64_t *)v18;
      if (v19)
      {
        self->mAUHandlesToInfo.__tree_.__begin_node_ = v19;
        v20 = (uint64_t *)p_pair1->__value_.__left_;
      }
      std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)self->mAUHandlesToInfo.__tree_.__pair1_.__value_.__left_, v20);
      ++self->mAUHandlesToInfo.__tree_.__pair3_.__value_;
    }
    v21 = 0;
    v18[10] = v14;
    *((_QWORD *)v18 + 6) = a3;
  }
  os_unfair_recursive_lock_unlock();
  return v21;
}

- (int)unregisterAU:(OpaqueRemoteAudioUnit *)a3
{
  uint64_t **p_mAUHandlesToInfo;
  uint64_t **v6;
  uint64_t **begin_node;
  uint64_t *v8;
  uint64_t **v9;
  BOOL v10;
  NSObject *v11;
  int v13;
  int v14;
  OpaqueRemoteAudioUnit *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  os_unfair_recursive_lock_lock_with_options();
  begin_node = (uint64_t **)self->mAUHandlesToInfo.__tree_.__begin_node_;
  p_mAUHandlesToInfo = (uint64_t **)&self->mAUHandlesToInfo;
  v6 = begin_node;
  if (begin_node != p_mAUHandlesToInfo + 1)
  {
    while (v6[6] != (uint64_t *)a3)
    {
      v8 = v6[1];
      if (v8)
      {
        do
        {
          v9 = (uint64_t **)v8;
          v8 = (uint64_t *)*v8;
        }
        while (v8);
      }
      else
      {
        do
        {
          v9 = (uint64_t **)v6[2];
          v10 = *v9 == (uint64_t *)v6;
          v6 = v9;
        }
        while (!v10);
      }
      v6 = v9;
      if (v9 == p_mAUHandlesToInfo + 1)
        goto LABEL_13;
    }
    v11 = gAUPBServerLogCategory;
    if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
    {
      v13 = *((_DWORD *)v6 + 8);
      v14 = 134218240;
      v15 = a3;
      v16 = 1024;
      v17 = v13;
      _os_log_debug_impl(&dword_18EE07000, v11, OS_LOG_TYPE_DEBUG, "Unregistered AU %p, handle 0x%x\n", (uint8_t *)&v14, 0x12u);
    }
    std::__tree<std::__value_type<unsigned int,RemoteAUHandleInfo>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,RemoteAUHandleInfo>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,RemoteAUHandleInfo>>>::__remove_node_pointer(p_mAUHandlesToInfo, (uint64_t *)v6);
    operator delete(v6);
  }
LABEL_13:
  os_unfair_recursive_lock_unlock();
  return 0;
}

- (unsigned)handleFromAUPBRef:(OpaqueAUPB *)a3
{
  return a3;
}

- (void)processingBlockRef:(OpaqueAUPB *)a3 propertyChanged:(unsigned int)a4
{
  uint64_t v4;
  NSObject *v7;
  NSMutableArray *mClientConnections;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  OpaqueAUPB *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (self->mConnectionAcknowledged)
  {
    v4 = *(_QWORD *)&a4;
    v7 = gAUPBServerLogCategory;
    if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      v19 = a3;
      v20 = 1024;
      v21 = v4;
      _os_log_debug_impl(&dword_18EE07000, v7, OS_LOG_TYPE_DEBUG, "PBPropChange: Block=%p property=%d\n", buf, 0x12u);
    }
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    mClientConnections = self->mClientConnections;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mClientConnections, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(mClientConnections);
          objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "proxyInterface"), "processingBlock:propertyChanged:", -[AUPBServer handleFromAUPBRef:](self, "handleFromAUPBRef:", a3), v4);
        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mClientConnections, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }
  }
}

- (void)processingBlock:(OpaqueAUPB *)a3 properties:(const unsigned int *)a4 count:(unsigned int)a5 changedWithQualifierData:(void *)a6 length:(unsigned int)a7
{
  NSObject *v12;
  id v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  int v20;
  uint64_t i;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSMutableArray *obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  OpaqueAUPB *v35;
  __int16 v36;
  unsigned int v37;
  uint64_t v38;

  v26 = a6;
  v38 = *MEMORY[0x1E0C80C00];
  if (self->mConnectionAcknowledged)
  {
    v12 = gAUPBServerLogCategory;
    if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      v35 = a3;
      v36 = 1024;
      v37 = a5;
      _os_log_debug_impl(&dword_18EE07000, v12, OS_LOG_TYPE_DEBUG, "PBPropsChanged: Block=%p #props=%u\n", buf, 0x12u);
    }
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (a5)
    {
      v14 = a5;
      do
      {
        v15 = *a4++;
        objc_msgSend(v13, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15, v26));
        --v14;
      }
      while (v14);
    }
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = self->mClientConnections;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16, v26);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v30;
      if (v27)
        v19 = a7 == 0;
      else
        v19 = 1;
      v20 = !v19;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v30 != v18)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          v23 = -[AUPBServer handleFromAUPBRef:](self, "handleFromAUPBRef:", a3);
          v24 = (void *)objc_msgSend(v22, "proxyInterface");
          if (v20)
            v25 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v27, a7);
          else
            v25 = 0;
          objc_msgSend(v24, "processingBlock:propertiesChanged:withQualifierData:", v23, v13, v25);
        }
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v17);
    }

  }
}

- (void)blockListChanged
{
  -[AUPBServer processingBlockRef:propertyChanged:](self, "processingBlockRef:propertyChanged:", 0, 1651272556);
}

- (AUProcessingBlock)aupbFromAUHandle:(unsigned int)a3
{
  char *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, RemoteAUHandleInfo>, void *>>> *p_pair1;
  unsigned int v5;
  BOOL v6;
  char **v7;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, AUProcessingBlock>, void *>>> *v8;
  char *v9;
  char *v10;
  unsigned int v11;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, AUProcessingBlock>, void *>>> *v12;
  unsigned int v13;
  BOOL v14;
  void **v15;
  unsigned int v16;
  AUProcessingBlock *v17;

  left = (char *)self->mAUHandlesToInfo.__tree_.__pair1_.__value_.__left_;
  if (!left)
    return 0;
  p_pair1 = &self->mAUHandlesToInfo.__tree_.__pair1_;
  do
  {
    v5 = *((_DWORD *)left + 8);
    v6 = v5 >= a3;
    if (v5 >= a3)
      v7 = (char **)left;
    else
      v7 = (char **)(left + 8);
    if (v6)
      p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, RemoteAUHandleInfo>, void *>>> *)left;
    left = *v7;
  }
  while (*v7);
  if (p_pair1 == &self->mAUHandlesToInfo.__tree_.__pair1_)
    return 0;
  if (LODWORD(p_pair1[4].__value_.__left_) > a3)
    return 0;
  v10 = (char *)self->mBlockHandlesToMethods.__tree_.__pair1_.__value_.__left_;
  v8 = &self->mBlockHandlesToMethods.__tree_.__pair1_;
  v9 = v10;
  if (!v10)
    return 0;
  v11 = p_pair1[5].__value_.__left_;
  v12 = v8;
  do
  {
    v13 = *((_DWORD *)v9 + 8);
    v14 = v13 >= v11;
    if (v13 >= v11)
      v15 = (void **)v9;
    else
      v15 = (void **)(v9 + 8);
    if (v14)
      v12 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, AUProcessingBlock>, void *>>> *)v9;
    v9 = (char *)*v15;
  }
  while (*v15);
  if (v12 == v8)
    return 0;
  v16 = v12[4].__value_.__left_;
  v17 = (AUProcessingBlock *)&v12[5];
  if (v11 >= v16)
    return v17;
  else
    return 0;
}

- (OpaqueRemoteAudioUnit)auRefFromHandle:(unsigned int)a3
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, RemoteAUHandleInfo>, void *>>> *p_pair1;
  char *v4;
  char *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, RemoteAUHandleInfo>, void *>>> *v6;
  unsigned int v7;
  BOOL v8;
  void **v9;

  left = (char *)self->mAUHandlesToInfo.__tree_.__pair1_.__value_.__left_;
  p_pair1 = &self->mAUHandlesToInfo.__tree_.__pair1_;
  v4 = left;
  if (!left)
    return 0;
  v6 = p_pair1;
  do
  {
    v7 = *((_DWORD *)v4 + 8);
    v8 = v7 >= a3;
    if (v7 >= a3)
      v9 = (void **)v4;
    else
      v9 = (void **)(v4 + 8);
    if (v8)
      v6 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, RemoteAUHandleInfo>, void *>>> *)v4;
    v4 = (char *)*v9;
  }
  while (*v9);
  if (v6 != p_pair1 && LODWORD(v6[4].__value_.__left_) <= a3)
    return (OpaqueRemoteAudioUnit *)v6[6].__value_.__left_;
  else
    return 0;
}

- (unsigned)auHandleFromRef:(OpaqueRemoteAudioUnit *)a3
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, RemoteAUHandleInfo>, void *>>> *begin_node;
  AUPBServer *left;
  AUPBServer *v5;
  BOOL v6;

  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, RemoteAUHandleInfo>, void *>>> *)self->mAUHandlesToInfo.__tree_.__begin_node_;
  if (begin_node == &self->mAUHandlesToInfo.__tree_.__pair1_)
    return 0;
  while (begin_node[6].__value_.__left_ != a3)
  {
    left = (AUPBServer *)begin_node[1].__value_.__left_;
    if (left)
    {
      do
      {
        v5 = left;
        left = (AUPBServer *)left->super.isa;
      }
      while (left);
    }
    else
    {
      do
      {
        v5 = (AUPBServer *)begin_node[2].__value_.__left_;
        v6 = v5->super.isa == (Class)begin_node;
        begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, RemoteAUHandleInfo>, void *>>> *)v5;
      }
      while (!v6);
    }
    begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, RemoteAUHandleInfo>, void *>>> *)v5;
    if (v5 == (AUPBServer *)&self->mAUHandlesToInfo.__tree_.__pair1_)
      return 0;
  }
  return begin_node[4].__value_.__left_;
}

- (AUProcessingBlock)aupbFromRef:(OpaqueAUPB *)a3
{
  unsigned int v4;
  char *v5;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, AUProcessingBlock>, void *>>> *p_pair1;
  char *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, AUProcessingBlock>, void *>>> *v8;
  unsigned int v9;
  BOOL v10;
  void **v11;
  unsigned int v12;
  AUProcessingBlock *v13;

  v4 = -[AUPBServer handleFromAUPBRef:](self, "handleFromAUPBRef:", a3);
  left = (char *)self->mBlockHandlesToMethods.__tree_.__pair1_.__value_.__left_;
  p_pair1 = &self->mBlockHandlesToMethods.__tree_.__pair1_;
  v5 = left;
  if (!left)
    return 0;
  v8 = p_pair1;
  do
  {
    v9 = *((_DWORD *)v5 + 8);
    v10 = v9 >= v4;
    if (v9 >= v4)
      v11 = (void **)v5;
    else
      v11 = (void **)(v5 + 8);
    if (v10)
      v8 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, AUProcessingBlock>, void *>>> *)v5;
    v5 = (char *)*v11;
  }
  while (*v11);
  if (v8 == p_pair1)
    return 0;
  v12 = v8[4].__value_.__left_;
  v13 = (AUProcessingBlock *)&v8[5];
  if (v4 >= v12)
    return v13;
  else
    return 0;
}

- (void)copyProcessingBlock:(unsigned int)a3 property:(unsigned int)a4 intoReply:(id)a5
{
  uint64_t v6;
  NSObject *v9;
  AUProcessingBlock *v10;
  CFIndex Code;
  const __CFData *v12;
  BOOL v13;
  const __CFData *Data;
  CFDataRef *v15;
  const UInt8 *BytePtr;
  unint64_t Length;
  __int128 v18;
  char *v19;
  char *v20;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, AUProcessingBlock>, void *>>> *begin_node;
  AUPBServer *left;
  AUPBServer *v23;
  const char *v24;
  pid_t v25;
  id v26;
  OpaqueAudioComponent *v27;
  AudioComponent Next;
  uint64_t (***v29)(_QWORD);
  unsigned int *v30;
  uint64_t (***v31)(_QWORD);
  uint64_t v32;
  __CFString *v33;
  NSObject *v34;
  char *v35;
  uint64_t v36;
  unint64_t v37;
  const UInt8 *v38;
  unsigned int v39;
  unsigned int v40;
  int v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  char *v47;
  char *v48;
  char *v49;
  char *v50;
  CFTypeRef v51;
  NSObject *v52;
  NSObject *v53;
  CFIndex v54;
  uint64_t v55;
  std::runtime_error *exception;
  __int128 v57;
  id v58;
  CFTypeRef cf[2];
  CFDataRef theData;
  uint64_t valuePtr;
  CFTypeRef v62;
  CFTypeRef v63;
  AudioComponentDescription buffer[3];
  uint64_t v65;
  _QWORD v66[5];
  _QWORD v67[7];

  v6 = *(_QWORD *)&a4;
  v67[5] = *MEMORY[0x1E0C80C00];
  os_unfair_recursive_lock_lock_with_options();
  v9 = gAUPBServerLogCategory;
  if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
  {
    buffer[0].componentType = 67109376;
    buffer[0].componentSubType = v6;
    LOWORD(buffer[0].componentManufacturer) = 2048;
    *(_QWORD *)((char *)&buffer[0].componentManufacturer + 2) = a3;
    _os_log_debug_impl(&dword_18EE07000, v9, OS_LOG_TYPE_DEBUG, "CopyPBProp: Property=%d block=%p\n", (uint8_t *)buffer, 0x12u);
  }
  theData = 0;
  if (a3)
  {
    v10 = -[AUPBServer aupbFromRef:](self, "aupbFromRef:", a3);
    if (!v10)
    {
      Data = 0;
      Code = 1064329791;
      goto LABEL_88;
    }
    Code = ((uint64_t (*)(void *, uint64_t, CFDataRef *))v10->var0.var1)(v10->var1, v6, &theData);
    v12 = theData;
    if ((_DWORD)Code)
      v13 = 1;
    else
      v13 = theData == 0;
    if (v13)
    {
      Data = 0;
      goto LABEL_88;
    }
    if ((_DWORD)v6 == 1635087726)
    {
      BytePtr = CFDataGetBytePtr(theData);
      Length = CFDataGetLength(theData);
      v58 = a5;
      if (Length >= 0x18)
      {
        v19 = 0;
        v20 = 0;
        v35 = 0;
        v36 = 0;
        v37 = Length / 0x18;
        *(_QWORD *)&v18 = 134217984;
        v57 = v18;
        do
        {
          v38 = &BytePtr[24 * v36];
          v39 = -[AUPBServer auHandleFromRef:](self, "auHandleFromRef:", *((_QWORD *)v38 + 2), v57);
          v40 = v39;
          if (v39)
          {
            *(_QWORD *)&buffer[0].componentType = *(_QWORD *)v38;
            buffer[0].componentManufacturer = *((_DWORD *)v38 + 2);
            if (v20 >= v35)
            {
              v44 = (v20 - v19) >> 4;
              v45 = v44 + 1;
              if ((unint64_t)(v44 + 1) >> 60)
                std::vector<float>::__throw_length_error[abi:ne180100]();
              if ((v35 - v19) >> 3 > v45)
                v45 = (v35 - v19) >> 3;
              if ((unint64_t)(v35 - v19) >= 0x7FFFFFFFFFFFFFF0)
                v46 = 0xFFFFFFFFFFFFFFFLL;
              else
                v46 = v45;
              if (v46)
              {
                if (v46 >> 60)
                  std::__throw_bad_array_new_length[abi:ne180100]();
                v47 = (char *)operator new(16 * v46);
              }
              else
              {
                v47 = 0;
              }
              v48 = &v47[16 * v44];
              *(_QWORD *)v48 = *(_QWORD *)&buffer[0].componentType;
              *((_DWORD *)v48 + 2) = buffer[0].componentManufacturer;
              *((_DWORD *)v48 + 3) = v40;
              if (v20 == v19)
              {
                v50 = &v47[16 * v44];
              }
              else
              {
                v49 = &v47[16 * v44];
                do
                {
                  v50 = v49 - 16;
                  *((_OWORD *)v49 - 1) = *((_OWORD *)v20 - 1);
                  v20 -= 16;
                  v49 -= 16;
                }
                while (v20 != v19);
              }
              v35 = &v47[16 * v46];
              v20 = v48 + 16;
              if (v19)
                operator delete(v19);
              v19 = v50;
            }
            else
            {
              v41 = *((_DWORD *)v38 + 2);
              *(_QWORD *)v20 = *(_QWORD *)v38;
              *((_DWORD *)v20 + 2) = v41;
              *((_DWORD *)v20 + 3) = v39;
              v20 += 16;
            }
          }
          else
          {
            v42 = gAUPBServerLogCategory;
            if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_ERROR))
            {
              v43 = *((_QWORD *)v38 + 2);
              buffer[0].componentType = v57;
              *(_QWORD *)&buffer[0].componentSubType = v43;
              _os_log_error_impl(&dword_18EE07000, v42, OS_LOG_TYPE_ERROR, "#### Could not map from AU ref to handle - serious bug. AU = %p\n", (uint8_t *)buffer, 0xCu);
            }
          }
          ++v36;
        }
        while (v36 != v37);
      }
      else
      {
        v19 = 0;
        v20 = 0;
      }
      CFRelease(theData);
      a5 = v58;
      v12 = CFDataCreate(0, (const UInt8 *)v19, v20 - v19);
      theData = v12;
      if (v19)
      {
        operator delete(v19);
        v12 = theData;
      }
    }
    cf[0] = 0;
    Data = CFPropertyListCreateData(0, v12, kCFPropertyListBinaryFormat_v1_0, 0, (CFErrorRef *)cf);
    v51 = cf[0];
    if (cf[0])
    {
      v52 = gAUPBServerLogCategory;
      if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_ERROR))
      {
        buffer[0].componentType = 138412290;
        *(_QWORD *)&buffer[0].componentSubType = v51;
        _os_log_error_impl(&dword_18EE07000, v52, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)buffer, 0xCu);
        v51 = cf[0];
      }
      CFRelease(v51);
    }
    goto LABEL_87;
  }
  Data = 0;
  Code = 1064333936;
  if ((int)v6 <= 1886282092)
  {
    if ((_DWORD)v6 == 1635148149)
    {
      v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v27 = 0;
      buffer[0].componentFlagsMask = 0;
      *(_OWORD *)&buffer[0].componentType = *(_OWORD *)"xfua";
      while (1)
      {
        Next = AudioComponentFindNext(v27, buffer);
        v27 = Next;
        if (!Next)
          break;
        v29 = (uint64_t (***)(_QWORD))(**(uint64_t (***)(AudioComponent))Next)(Next);
        if (v29)
        {
          v30 = (unsigned int *)(**v29)(v29);
          Code = v30[9];
          v6 = v30[10];
          v9 = v30[11];
        }
        cf[0] = 0;
        Impl_AudioGetComponentInfo(v27, 0, (const __CFString **)cf);
        v31 = (uint64_t (***)(_QWORD))(**(uint64_t (***)(OpaqueAudioComponent *))v27)(v27);
        if (v31)
          v32 = *(unsigned int *)((**v31)(v31) + 56);
        else
          v32 = 0;
        v66[0] = CFSTR("type");
        v67[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", Code);
        v66[1] = CFSTR("subtype");
        v67[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
        v66[2] = CFSTR("manufacturer");
        v67[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v9);
        v67[3] = cf[0];
        v66[3] = CFSTR("name");
        v66[4] = CFSTR("version");
        v67[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v32);
        objc_msgSend(v26, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, v66, 5));
        if (cf[0])
          CFRelease(cf[0]);
      }
      Data = (const __CFData *)objc_msgSend(v26, "copy");

      theData = Data;
      Code = 4294967246;
      if (!Data)
        goto LABEL_88;
    }
    else
    {
      if ((_DWORD)v6 != 1651272556)
        goto LABEL_88;
      Data = CFDataCreateMutable(0, 0);
      begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, AUProcessingBlock>, void *>>> *)self->mBlockHandlesToMethods.__tree_.__begin_node_;
      if (begin_node != &self->mBlockHandlesToMethods.__tree_.__pair1_)
      {
        do
        {
          CFDataAppendBytes(Data, (const UInt8 *)&begin_node[4], 4);
          left = (AUPBServer *)begin_node[1].__value_.__left_;
          if (left)
          {
            do
            {
              v23 = left;
              left = (AUPBServer *)left->super.isa;
            }
            while (left);
          }
          else
          {
            do
            {
              v23 = (AUPBServer *)begin_node[2].__value_.__left_;
              v13 = v23->super.isa == (Class)begin_node;
              begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, AUProcessingBlock>, void *>>> *)v23;
            }
            while (!v13);
          }
          begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, AUProcessingBlock>, void *>>> *)v23;
        }
        while (v23 != (AUPBServer *)&self->mBlockHandlesToMethods.__tree_.__pair1_);
      }
      theData = Data;
      Code = 4294967246;
      if (!Data)
        goto LABEL_88;
    }
  }
  else
  {
    if ((_DWORD)v6 != 1886282093)
    {
      if ((_DWORD)v6 == 1920299877)
      {
        v25 = getpid();
        if (proc_pid_rusage(v25, 6, (rusage_info_t *)buffer))
        {
          Code = *__error();
LABEL_39:
          Data = theData;
          if (!theData)
            goto LABEL_88;
          goto LABEL_51;
        }
        applesauce::CF::TypeRef::TypeRef((applesauce::CF::TypeRef *)&v62, "ri_phys_footprint");
        valuePtr = v65;
        v63 = CFNumberCreate(0, kCFNumberLongLongType, &valuePtr);
        if (!v63)
        {
          exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          std::runtime_error::runtime_error(exception, "Could not construct");
        }
        cf[0] = &v62;
        cf[1] = (CFTypeRef)1;
        theData = applesauce::CF::details::make_CFDictionaryRef((uint64_t)cf);
        if (v63)
          CFRelease(v63);
        if (v62)
          CFRelease(v62);
      }
      else
      {
        if ((_DWORD)v6 != 1952805748)
          goto LABEL_88;
        if (self->mTestBlock.__ptr_.__value_)
          v15 = (CFDataRef *)MEMORY[0x1E0C9AE50];
        else
          v15 = (CFDataRef *)MEMORY[0x1E0C9AE40];
        theData = *v15;
        CFRetain(theData);
      }
      Code = 4294967246;
      goto LABEL_39;
    }
    v24 = getprogname();
    Data = (const __CFData *)CFStringCreateWithCString(0, v24, 0x8000100u);
    theData = Data;
    Code = 4294967246;
    if (!Data)
      goto LABEL_88;
  }
LABEL_51:
  cf[0] = 0;
  Data = CFPropertyListCreateData(0, Data, kCFPropertyListBinaryFormat_v1_0, 0, (CFErrorRef *)cf);
  if (!cf[0])
  {
LABEL_87:
    CFRelease(theData);
    Code = 0;
    goto LABEL_88;
  }
  Code = CFErrorGetCode((CFErrorRef)cf[0]);
  v33 = (__CFString *)CFErrorCopyDescription((CFErrorRef)cf[0]);
  v34 = gAUPBServerLogCategory;
  if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_ERROR))
  {
    v55 = -[__CFString UTF8String](v33, "UTF8String");
    buffer[0].componentType = 136315394;
    *(_QWORD *)&buffer[0].componentSubType = v55;
    LOWORD(buffer[0].componentFlags) = 1024;
    *(UInt32 *)((char *)&buffer[0].componentFlags + 2) = Code;
    _os_log_error_impl(&dword_18EE07000, v34, OS_LOG_TYPE_ERROR, "Error serializing property list to send: %s (err=%d)\n", (uint8_t *)buffer, 0x12u);
  }
  CFRelease(cf[0]);

LABEL_88:
  v53 = gAUPBServerLogCategory;
  if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
  {
    if (Data)
      v54 = CFDataGetLength(Data);
    else
      v54 = 0;
    buffer[0].componentType = 67109376;
    buffer[0].componentSubType = Code;
    LOWORD(buffer[0].componentManufacturer) = 2048;
    *(_QWORD *)((char *)&buffer[0].componentManufacturer + 2) = v54;
    _os_log_debug_impl(&dword_18EE07000, v53, OS_LOG_TYPE_DEBUG, "result=%d len=%ld\n", (uint8_t *)buffer, 0x12u);
  }
  (*((void (**)(id, CFIndex, const __CFData *))a5 + 2))(a5, Code, Data);
  if (Data)
    CFRelease(Data);
  os_unfair_recursive_lock_unlock();
}

- (void)setProcessingBlock:(unsigned int)a3 property:(unsigned int)a4 value:(id)a5 withReply:(id)a6
{
  uint64_t v8;
  uint64_t v11;
  NSObject *v12;
  CFPropertyListRef v13;
  const void *v14;
  CFTypeID v15;
  AUProcessingBlockBase *v16;
  TestAUProcessingBlock *value;
  uint64_t v18;
  CFTypeID v19;
  AUProcessingBlock *v20;
  NSObject *v21;
  int v22;
  int v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v8 = *(_QWORD *)&a4;
  v26 = *MEMORY[0x1E0C80C00];
  os_unfair_recursive_lock_lock_with_options();
  v11 = a3;
  v12 = gAUPBServerLogCategory;
  if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
  {
    v22 = 67109376;
    v23 = v8;
    v24 = 2048;
    v25 = a3;
    _os_log_debug_impl(&dword_18EE07000, v12, OS_LOG_TYPE_DEBUG, "SetPBProp: Property=%d block=0x%p", (uint8_t *)&v22, 0x12u);
  }
  v13 = CFPropertyListCreateWithData(0, (CFDataRef)a5, 0, 0, 0);
  v14 = v13;
  if (v13)
  {
    if (a3 || (_DWORD)v8 != 1952805748)
    {
LABEL_16:
      v20 = -[AUPBServer aupbFromRef:](self, "aupbFromRef:", v11);
      if (v20)
        v18 = ((uint64_t (*)(void *, uint64_t, const void *))v20->var0.var2)(v20->var1, v8, v14);
      else
        v18 = 1064329791;
      CFRelease(v14);
      goto LABEL_20;
    }
    v15 = CFGetTypeID(v13);
    if (v15 == CFBooleanGetTypeID())
    {
      if (CFBooleanGetValue((CFBooleanRef)v14))
        goto LABEL_8;
    }
    else
    {
      v19 = CFGetTypeID(v14);
      if (v19 != CFNumberGetTypeID())
        goto LABEL_16;
      v22 = 0;
      CFNumberGetValue((CFNumberRef)v14, kCFNumberSInt32Type, &v22);
      if (v22)
      {
LABEL_8:
        if (self->mTestBlock.__ptr_.__value_)
          goto LABEL_16;
        v16 = (AUProcessingBlockBase *)operator new();
        AUProcessingBlockBase::AUProcessingBlockBase(v16, CFSTR("Test Block"));
        *(_QWORD *)v16 = &off_1E2908788;
        value = self->mTestBlock.__ptr_.__value_;
        self->mTestBlock.__ptr_.__value_ = (TestAUProcessingBlock *)v16;
        if (!value)
          goto LABEL_16;
LABEL_15:
        (*(void (**)(TestAUProcessingBlock *))(*(_QWORD *)value + 8))(value);
        goto LABEL_16;
      }
    }
    value = self->mTestBlock.__ptr_.__value_;
    self->mTestBlock.__ptr_.__value_ = 0;
    if (!value)
      goto LABEL_16;
    goto LABEL_15;
  }
  v18 = 1886806380;
LABEL_20:
  v21 = gAUPBServerLogCategory;
  if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
  {
    v22 = 67109120;
    v23 = v18;
    _os_log_debug_impl(&dword_18EE07000, v21, OS_LOG_TYPE_DEBUG, "result=%d\n", (uint8_t *)&v22, 8u);
  }
  (*((void (**)(id, uint64_t))a6 + 2))(a6, v18);
  os_unfair_recursive_lock_unlock();
}

- (void)getAudioUnit:(unsigned int)a3 propertyInfo:(unsigned int)a4 onScope:(unsigned int)a5 element:(unsigned int)a6 inReply:(id)a7
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v13;
  AUProcessingBlock *v14;
  OpaqueRemoteAudioUnit *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  unsigned int v20;
  unsigned __int8 v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v8 = *(_QWORD *)&a6;
  v9 = *(_QWORD *)&a5;
  v10 = *(_QWORD *)&a4;
  v11 = *(_QWORD *)&a3;
  v30 = *MEMORY[0x1E0C80C00];
  os_unfair_recursive_lock_lock_with_options();
  v13 = gAUPBServerLogCategory;
  if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109888;
    v23 = v10;
    v24 = 1024;
    v25 = v11;
    v26 = 1024;
    v27 = v9;
    v28 = 1024;
    v29 = v8;
    _os_log_debug_impl(&dword_18EE07000, v13, OS_LOG_TYPE_DEBUG, "GetAUPropInfo: Property=%d AU=0x%x scope=%u element=%u ", buf, 0x1Au);
  }
  v21 = 0;
  v20 = 0;
  v14 = -[AUPBServer aupbFromAUHandle:](self, "aupbFromAUHandle:", v11);
  if (v14)
  {
    v15 = -[AUPBServer auRefFromHandle:](self, "auRefFromHandle:", v11);
    if (v15)
    {
      v16 = ((uint64_t (*)(void *, OpaqueRemoteAudioUnit *, uint64_t, uint64_t, uint64_t, unsigned int *, unsigned __int8 *))v14->var0.var3)(v14->var1, v15, v10, v9, v8, &v20, &v21);
      v17 = v20;
      v18 = v21;
    }
    else
    {
      v18 = 0;
      v17 = 0;
      v16 = 1063351615;
    }
  }
  else
  {
    v18 = 0;
    v17 = 0;
    v16 = 1064329791;
  }
  v19 = gAUPBServerLogCategory;
  if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109632;
    v23 = v16;
    v24 = 1024;
    v25 = v17;
    v26 = 1024;
    v27 = v18;
    _os_log_debug_impl(&dword_18EE07000, v19, OS_LOG_TYPE_DEBUG, "result=%d, size=%d, writable=%d\n", buf, 0x14u);
    v17 = v20;
    v18 = v21;
  }
  (*((void (**)(id, uint64_t, uint64_t, uint64_t))a7 + 2))(a7, v16, v17, v18);
  os_unfair_recursive_lock_unlock();
}

- (void)getAudioUnit:(unsigned int)a3 property:(unsigned int)a4 onScope:(unsigned int)a5 element:(unsigned int)a6 inReply:(id)a7
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v13;
  AUProcessingBlock *v14;
  OpaqueRemoteAudioUnit *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  const UInt8 *BytePtr;
  uint64_t Length;
  NSObject *v22;
  void *__p[3];
  unsigned int v24;
  char v25;
  uint8_t v26[4];
  int v27;
  __int16 v28;
  unsigned int v29;
  __int16 v30;
  int v31;
  uint8_t buf[8];
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  __int16 v37;
  _DWORD v38[8];
  uint64_t v39;

  v8 = *(_QWORD *)&a6;
  v9 = *(_QWORD *)&a5;
  v10 = *(_QWORD *)&a4;
  v11 = *(_QWORD *)&a3;
  v39 = *MEMORY[0x1E0C80C00];
  os_unfair_recursive_lock_lock_with_options();
  v13 = gAUPBServerLogCategory;
  if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)&buf[4] = v10;
    v33 = 1024;
    v34 = v11;
    v35 = 1024;
    v36 = v9;
    v37 = 1024;
    v38[0] = v8;
    _os_log_debug_impl(&dword_18EE07000, v13, OS_LOG_TYPE_DEBUG, "GetAUProp: Property=%d AU=0x%x scope=%u element=%u ", buf, 0x1Au);
  }
  v14 = -[AUPBServer aupbFromAUHandle:](self, "aupbFromAUHandle:", v11);
  if (!v14)
  {
    v17 = 0;
    v16 = 1064329791;
    goto LABEL_26;
  }
  v15 = -[AUPBServer auRefFromHandle:](self, "auRefFromHandle:", v11);
  if (!v15)
  {
    v17 = 0;
    v16 = 1063351615;
    goto LABEL_26;
  }
  v25 = 0;
  v24 = 0;
  v16 = ((uint64_t (*)(void *, OpaqueRemoteAudioUnit *, uint64_t, uint64_t, uint64_t, unsigned int *, char *))v14->var0.var3)(v14->var1, v15, v10, v9, v8, &v24, &v25);
  v17 = 0;
  if (!(_DWORD)v16 && v24)
  {
    std::vector<unsigned char>::vector(__p, v24);
    v16 = ((uint64_t (*)(void *, OpaqueRemoteAudioUnit *, uint64_t, uint64_t, uint64_t, void *, unsigned int *))v14->var0.var4)(v14->var1, v15, v10, v9, v8, __p[0], &v24);
    if ((_DWORD)v16)
    {
      v17 = 0;
      goto LABEL_24;
    }
    PropertyMarshaller::PropertyMarshaller((PropertyMarshaller *)buf, 0);
    *(_QWORD *)buf = &off_1E2909C60;
    v16 = PropertyMarshaller::Serialize();
    if ((_DWORD)v16)
    {
      v18 = gAUPBServerLogCategory;
      if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v26 = 67109632;
        v27 = v10;
        v28 = 1024;
        v29 = v24;
        v30 = 1024;
        v31 = v16;
        _os_log_error_impl(&dword_18EE07000, v18, OS_LOG_TYPE_ERROR, "Failed to serialize property %d, dataSize=%d, result=%d\n", v26, 0x14u);
      }
      v17 = 0;
      goto LABEL_23;
    }
    v19 = (void *)MEMORY[0x1E0C99D50];
    if (*(_QWORD *)((char *)v38 + 2) && **(_QWORD **)((char *)v38 + 2))
    {
      BytePtr = CFDataGetBytePtr(**(CFDataRef **)((char *)v38 + 2));
      if (*(_QWORD *)((char *)v38 + 2) && **(_QWORD **)((char *)v38 + 2))
      {
        Length = CFDataGetLength(**(CFDataRef **)((char *)v38 + 2));
LABEL_22:
        v17 = objc_msgSend(v19, "dataWithBytes:length:", BytePtr, Length);
LABEL_23:
        PropertyMarshaller::~PropertyMarshaller((PropertyMarshaller *)buf);
LABEL_24:
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
        goto LABEL_26;
      }
    }
    else
    {
      BytePtr = 0;
    }
    Length = 0;
    goto LABEL_22;
  }
LABEL_26:
  v22 = gAUPBServerLogCategory;
  if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v16;
    _os_log_debug_impl(&dword_18EE07000, v22, OS_LOG_TYPE_DEBUG, "result=%d\n", buf, 8u);
  }
  (*((void (**)(id, uint64_t, uint64_t))a7 + 2))(a7, v16, v17);
  os_unfair_recursive_lock_unlock();
}

- (void)setAudioUnit:(unsigned int)a3 property:(unsigned int)a4 onScope:(unsigned int)a5 element:(unsigned int)a6 value:(id)a7 withReply:(id)a8
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v15;
  AUProcessingBlock *v16;
  OpaqueRemoteAudioUnit *v17;
  const void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint8_t buf[8];
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  uint64_t v30;
  uint64_t v31;

  v10 = *(_QWORD *)&a6;
  v11 = *(_QWORD *)&a5;
  v12 = *(_QWORD *)&a4;
  v13 = *(_QWORD *)&a3;
  v31 = *MEMORY[0x1E0C80C00];
  os_unfair_recursive_lock_lock_with_options();
  v15 = gAUPBServerLogCategory;
  if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)&buf[4] = v12;
    v24 = 1024;
    v25 = v13;
    v26 = 1024;
    v27 = v11;
    v28 = 1024;
    v29 = v10;
    _os_log_debug_impl(&dword_18EE07000, v15, OS_LOG_TYPE_DEBUG, "SetAUProp: Property=%d AU=0x%x scope=%u element=%u ", buf, 0x1Au);
  }
  v16 = -[AUPBServer aupbFromAUHandle:](self, "aupbFromAUHandle:", v13);
  if (v16)
  {
    v17 = -[AUPBServer auRefFromHandle:](self, "auRefFromHandle:", v13);
    if (v17)
    {
      v18 = (const void *)objc_msgSend(a7, "bytes");
      objc_msgSend(a7, "length");
      PropertyMarshaller::PropertyMarshaller((PropertyMarshaller *)buf, v18);
      *(_QWORD *)buf = &off_1E2909C60;
      if (PropertyMarshaller::Deserialize())
      {
        v19 = 1936878714;
      }
      else
      {
        if (v30)
        {
          v20 = *(_QWORD *)(v30 + 40);
          v21 = (*(_DWORD *)(v30 + 48) - v20);
        }
        else
        {
          v20 = 0;
          v21 = 0;
        }
        v19 = ((uint64_t (*)(void *, OpaqueRemoteAudioUnit *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v16->var0.var5)(v16->var1, v17, v12, v11, v10, v20, v21);
      }
      PropertyMarshaller::~PropertyMarshaller((PropertyMarshaller *)buf);
    }
    else
    {
      v19 = 1063351615;
    }
  }
  else
  {
    v19 = 1064329791;
  }
  v22 = gAUPBServerLogCategory;
  if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v19;
    _os_log_debug_impl(&dword_18EE07000, v22, OS_LOG_TYPE_DEBUG, "result=%d\n", buf, 8u);
  }
  (*((void (**)(id, uint64_t))a8 + 2))(a8, v19);
  os_unfair_recursive_lock_unlock();
}

- (void)getAudioUnit:(unsigned int)a3 parameter:(unsigned int)a4 onScope:(unsigned int)a5 element:(unsigned int)a6 inReply:(id)a7
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v13;
  AUProcessingBlock *v14;
  OpaqueRemoteAudioUnit *v15;
  uint64_t v16;
  NSObject *v17;
  float v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v8 = *(_QWORD *)&a6;
  v9 = *(_QWORD *)&a5;
  v10 = *(_QWORD *)&a4;
  v11 = *(_QWORD *)&a3;
  v27 = *MEMORY[0x1E0C80C00];
  os_unfair_recursive_lock_lock_with_options();
  v13 = gAUPBServerLogCategory;
  if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109888;
    v20 = v10;
    v21 = 1024;
    v22 = v11;
    v23 = 1024;
    v24 = v9;
    v25 = 1024;
    v26 = v8;
    _os_log_debug_impl(&dword_18EE07000, v13, OS_LOG_TYPE_DEBUG, "GetAUParam: Parameter=%u AU=0x%x scope=%u element=%u ", buf, 0x1Au);
  }
  v18 = 0.0;
  v14 = -[AUPBServer aupbFromAUHandle:](self, "aupbFromAUHandle:", v11);
  if (v14)
  {
    v15 = -[AUPBServer auRefFromHandle:](self, "auRefFromHandle:", v11);
    if (v15)
      v16 = ((uint64_t (*)(void *, OpaqueRemoteAudioUnit *, uint64_t, uint64_t, uint64_t, float *))v14->var0.var6)(v14->var1, v15, v10, v9, v8, &v18);
    else
      v16 = 1063351615;
  }
  else
  {
    v16 = 1064329791;
  }
  v17 = gAUPBServerLogCategory;
  if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    v20 = v16;
    _os_log_debug_impl(&dword_18EE07000, v17, OS_LOG_TYPE_DEBUG, "result=%d\n", buf, 8u);
  }
  (*((void (**)(id, uint64_t, float))a7 + 2))(a7, v16, v18);
  os_unfair_recursive_lock_unlock();
}

- (void)setAudioUnit:(unsigned int)a3 parameter:(unsigned int)a4 onScope:(unsigned int)a5 element:(unsigned int)a6 value:(float)a7 withReply:(id)a8
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v15;
  AUProcessingBlock *v16;
  OpaqueRemoteAudioUnit *v17;
  uint64_t v18;
  NSObject *v19;
  int v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v10 = *(_QWORD *)&a6;
  v11 = *(_QWORD *)&a5;
  v12 = *(_QWORD *)&a4;
  v13 = *(_QWORD *)&a3;
  v28 = *MEMORY[0x1E0C80C00];
  os_unfair_recursive_lock_lock_with_options();
  v15 = gAUPBServerLogCategory;
  if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
  {
    v20 = 67109888;
    v21 = v12;
    v22 = 1024;
    v23 = v13;
    v24 = 1024;
    v25 = v11;
    v26 = 1024;
    v27 = v10;
    _os_log_debug_impl(&dword_18EE07000, v15, OS_LOG_TYPE_DEBUG, "SetAUParam: Parameter=%u AU=0x%x scope=%u element=%u ", (uint8_t *)&v20, 0x1Au);
  }
  v16 = -[AUPBServer aupbFromAUHandle:](self, "aupbFromAUHandle:", v13);
  if (v16)
  {
    v17 = -[AUPBServer auRefFromHandle:](self, "auRefFromHandle:", v13);
    if (v17)
      v18 = ((uint64_t (*)(void *, OpaqueRemoteAudioUnit *, uint64_t, uint64_t, uint64_t, float))v16->var0.var7)(v16->var1, v17, v12, v11, v10, a7);
    else
      v18 = 1063351615;
  }
  else
  {
    v18 = 1064329791;
  }
  v19 = gAUPBServerLogCategory;
  if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
  {
    v20 = 67109120;
    v21 = v18;
    _os_log_debug_impl(&dword_18EE07000, v19, OS_LOG_TYPE_DEBUG, "result=%d\n", (uint8_t *)&v20, 8u);
  }
  (*((void (**)(id, uint64_t))a8 + 2))(a8, v18);
  os_unfair_recursive_lock_unlock();
}

- (void).cxx_destruct
{
  TestAUProcessingBlock *value;
  unfair_recursive_lock *v4;

  value = self->mTestBlock.__ptr_.__value_;
  self->mTestBlock.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(TestAUProcessingBlock *, SEL))(*(_QWORD *)value + 8))(value, a2);
  v4 = self->mLock.__ptr_.__value_;
  self->mLock.__ptr_.__value_ = 0;
  if (v4)
    JUMPOUT(0x193FFE460);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = (char *)self + 56;
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = (char *)self + 80;
  *((_QWORD *)self + 13) = 0;
  return self;
}

uint64_t __49__AUPBServer_listener_shouldAcceptNewConnection___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint64_t result;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = gAUPBServerLogCategory;
  if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
  {
    v4 = a1[4];
    v5 = 134217984;
    v6 = v4;
    _os_log_debug_impl(&dword_18EE07000, v2, OS_LOG_TYPE_DEBUG, "Client connection (xpcCon=%p) interrupted\n", (uint8_t *)&v5, 0xCu);
  }
  result = objc_msgSend(*(id *)(a1[5] + 32), "containsObject:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1[5] + 32), "removeObject:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  return result;
}

uint64_t __49__AUPBServer_listener_shouldAcceptNewConnection___block_invoke_62(_QWORD *a1)
{
  NSObject *v2;
  uint64_t result;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = gAUPBServerLogCategory;
  if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
  {
    v4 = a1[4];
    v5 = 134217984;
    v6 = v4;
    _os_log_debug_impl(&dword_18EE07000, v2, OS_LOG_TYPE_DEBUG, "Client connection (xpcCon=%p) invalidated\n", (uint8_t *)&v5, 0xCu);
  }
  result = objc_msgSend(*(id *)(a1[5] + 32), "containsObject:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1[5] + 32), "removeObject:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  return result;
}

uint64_t __34__AUPBServer_handleRegistrarCrash__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "checkConnectRegistrar");
}

uint64_t __38__AUPBServer_startRegistrarConnection__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "handleRegistrarCrash");
}

uint64_t __38__AUPBServer_startRegistrarConnection__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "handleRegistrarCrash");
}

void __38__AUPBServer_startRegistrarConnection__block_invoke_32(uint64_t a1, void *a2)
{
  uint64_t v4;
  char v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!a2)
    goto LABEL_7;
  v4 = objc_msgSend(a2, "code");
  v5 = 1;
  if (v4 && v4 != 4)
  {
    if (v4 != 2)
      goto LABEL_7;
    v5 = 0;
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 121) = v5;
LABEL_7:
  v6 = gAUPBServerLogCategory;
  if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
  {
    v7 = 136315394;
    v8 = "-[AUPBServer startRegistrarConnection]_block_invoke";
    v9 = 2080;
    v10 = objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
    _os_log_debug_impl(&dword_18EE07000, v6, OS_LOG_TYPE_DEBUG, "%s %s", (uint8_t *)&v7, 0x16u);
  }
}

void __38__AUPBServer_startRegistrarConnection__block_invoke_3(uint64_t a1, void *a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = gAUPBServerLogCategory;
  if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315138;
    v5 = objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
    _os_log_error_impl(&dword_18EE07000, v3, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v4, 0xCu);
  }
}

uint64_t __18__AUPBServer_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "checkConnectRegistrar");
}

@end
