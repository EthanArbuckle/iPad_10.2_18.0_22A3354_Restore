@implementation AUPBClientManager

+ (id)sharedInstance
{
  objc_super v4;

  objc_sync_enter(a1);
  if (!sSharedInstance)
  {
    v4.receiver = a1;
    v4.super_class = (Class)&OBJC_METACLASS___AUPBClientManager;
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
  v3.super_class = (Class)AUPBClientManager;
  -[AUPBClientManager dealloc](&v3, sel_dealloc);
}

- (AUPBClientManager)init
{
  AUPBClientManager *v2;
  _QWORD *v3;
  NSObject *v4;
  NSMutableArray *v5;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)AUPBClientManager;
  v2 = -[AUPBClientManager init](&v7, sel_init);
  if (v2)
  {
    v3 = (_QWORD *)operator new();
    v3[1] = 0;
    *v3 = os_log_create("com.apple.coreaudio", "aupbc");
    gLogScope = (uint64_t)v3;
    v2->mTouchServersQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.coreaudio.aupb.client.serverQueue", 0);
    if (gLogScope)
    {
      v4 = *(NSObject **)gLogScope;
      if (!*(_QWORD *)gLogScope)
      {
LABEL_8:
        v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v2->mProxyInterface = 0;
        v2->mRemoteServers = v5;
        v2->mServerRefCounter = 1;
        v2->mRegistrarConnection = 0;
        *(_WORD *)&v2->mValidToken = notify_register_check("com.apple.audio.aupbregistrarneeded", &v2->mNotifyToken) == 0;
        -[AUPBClientManager startRegistarConnection](v2, "startRegistarConnection");
        return v2;
      }
    }
    else
    {
      v4 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v9 = "AUPBClientManager.mm";
      v10 = 1024;
      v11 = 153;
      _os_log_impl(&dword_18EE07000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d Starting\n", buf, 0x12u);
    }
    goto LABEL_8;
  }
  return v2;
}

- (void)startRegistarConnection
{
  uint64_t v3;
  NSXPCConnection *mRegistrarConnection;
  NSXPCConnection *v5;
  AUPBRegistrarHosting *v6;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  id v11;

  self->mRegistrarConnection = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.internal.aupbregistrarservice"));
  -[NSXPCConnection setRemoteObjectInterface:](self->mRegistrarConnection, "setRemoteObjectInterface:", objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE171570));
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3042000000;
  v10[3] = __Block_byref_object_copy__7138;
  v10[4] = __Block_byref_object_dispose__7139;
  objc_initWeak(&v11, self);
  v3 = MEMORY[0x1E0C809B0];
  mRegistrarConnection = self->mRegistrarConnection;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__AUPBClientManager_startRegistarConnection__block_invoke;
  v9[3] = &unk_1E29222D8;
  v9[4] = v10;
  -[NSXPCConnection setInterruptionHandler:](mRegistrarConnection, "setInterruptionHandler:", v9);
  v5 = self->mRegistrarConnection;
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __44__AUPBClientManager_startRegistarConnection__block_invoke_2;
  v8[3] = &unk_1E29222D8;
  v8[4] = v10;
  -[NSXPCConnection setInvalidationHandler:](v5, "setInvalidationHandler:", v8);
  -[NSXPCConnection setExportedInterface:](self->mRegistrarConnection, "setExportedInterface:", objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE16E388));
  -[NSXPCConnection setExportedObject:](self->mRegistrarConnection, "setExportedObject:", self);
  -[NSXPCConnection resume](self->mRegistrarConnection, "resume");
  v6 = -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->mRegistrarConnection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_7140);
  self->mProxyInterface = v6;
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __44__AUPBClientManager_startRegistarConnection__block_invoke_97;
  v7[3] = &unk_1E29214E0;
  v7[4] = self;
  -[AUPBRegistrarHosting registerAsEndpointListenerWithReply:](v6, "registerAsEndpointListenerWithReply:", v7);
  if (self->mValidToken)
  {
    notify_set_state(self->mNotifyToken, 1uLL);
    notify_post("com.apple.audio.aupbregistrarneeded");
  }
  _Block_object_dispose(v10, 8);
  objc_destroyWeak(&v11);
}

- (void)handleRegistrarCrash
{
  NSXPCConnection *mRegistrarConnection;
  NSObject *v4;
  NSObject *v5;
  dispatch_time_t v6;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  mRegistrarConnection = self->mRegistrarConnection;
  if (mRegistrarConnection)
  {

    self->mRegistrarConnection = 0;
  }
  if (self->mConnectionAcknowledged)
  {
    if (gLogScope)
    {
      v4 = *(NSObject **)gLogScope;
      if (!*(_QWORD *)gLogScope)
      {
LABEL_13:
        v6 = dispatch_time(0, 2000000000);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __41__AUPBClientManager_handleRegistrarCrash__block_invoke;
        block[3] = &unk_1E2921508;
        block[4] = self;
        dispatch_after(v6, MEMORY[0x1E0C80D38], block);
        return;
      }
    }
    else
    {
      v4 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v9 = "AUPBClientManager.mm";
      v10 = 1024;
      v11 = 226;
      _os_log_impl(&dword_18EE07000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d Delaying checking in with registrar a few seconds...\n", buf, 0x12u);
    }
    goto LABEL_13;
  }
  if (gLogScope)
  {
    v5 = *(NSObject **)gLogScope;
    if (!*(_QWORD *)gLogScope)
      return;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "AUPBClientManager.mm";
    v10 = 1024;
    v11 = 233;
    _os_log_impl(&dword_18EE07000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d Not retrying since connection not acknowledged.  No Entitlement?", buf, 0x12u);
  }
}

- (void)newServerAdded:(id)a3
{
  RemoteAUPBServer *v5;
  void *mServerRefCounter;
  NSObject *v7;
  NSXPCConnection *v8;
  uint64_t v9;
  NSXPCConnection *v10;
  NSObject *mTouchServersQueue;
  _QWORD v12[7];
  _QWORD v13[4];
  id v14;
  id v15[2];
  _QWORD v16[4];
  id v17;
  id v18[2];
  id location;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(RemoteAUPBServer);
  -[RemoteAUPBServer setXpcConnection:](v5, "setXpcConnection:", objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", a3));
  -[NSXPCConnection setRemoteObjectInterface:](-[RemoteAUPBServer xpcConnection](v5, "xpcConnection"), "setRemoteObjectInterface:", objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE16AD20));
  -[RemoteAUPBServer setProxyInterface:](v5, "setProxyInterface:", -[NSXPCConnection remoteObjectProxy](-[RemoteAUPBServer xpcConnection](v5, "xpcConnection"), "remoteObjectProxy"));
  -[NSXPCConnection setExportedInterface:](-[RemoteAUPBServer xpcConnection](v5, "xpcConnection"), "setExportedInterface:", objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE16E448));
  -[NSXPCConnection setExportedObject:](-[RemoteAUPBServer xpcConnection](v5, "xpcConnection"), "setExportedObject:", self);
  mServerRefCounter = (void *)self->mServerRefCounter;
  self->mServerRefCounter = (_DWORD)mServerRefCounter + 1;
  -[RemoteAUPBServer setRef:](v5, "setRef:", mServerRefCounter);
  if (gLogScope)
  {
    v7 = *(NSObject **)gLogScope;
    if (!*(_QWORD *)gLogScope)
      goto LABEL_7;
  }
  else
  {
    v7 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v21 = "AUPBClientManager.mm";
    v22 = 1024;
    v23 = 251;
    v24 = 2080;
    v25 = objc_msgSend(-[RemoteAUPBServer description](v5, "description"), "UTF8String");
    _os_log_impl(&dword_18EE07000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s\n", buf, 0x1Cu);
  }
LABEL_7:
  objc_initWeak((id *)buf, v5);
  objc_initWeak(&location, self);
  v8 = -[RemoteAUPBServer xpcConnection](v5, "xpcConnection");
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __36__AUPBClientManager_newServerAdded___block_invoke;
  v16[3] = &unk_1E2921530;
  objc_copyWeak(&v17, &location);
  objc_copyWeak(v18, (id *)buf);
  v18[1] = mServerRefCounter;
  -[NSXPCConnection setInvalidationHandler:](v8, "setInvalidationHandler:", v16);
  v10 = -[RemoteAUPBServer xpcConnection](v5, "xpcConnection");
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __36__AUPBClientManager_newServerAdded___block_invoke_125;
  v13[3] = &unk_1E2921530;
  objc_copyWeak(&v14, &location);
  objc_copyWeak(v15, (id *)buf);
  v15[1] = mServerRefCounter;
  -[NSXPCConnection setInterruptionHandler:](v10, "setInterruptionHandler:", v13);
  mTouchServersQueue = self->mTouchServersQueue;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __36__AUPBClientManager_newServerAdded___block_invoke_126;
  v12[3] = &unk_1E2921558;
  v12[4] = self;
  v12[5] = v5;
  v12[6] = mServerRefCounter;
  dispatch_async(mTouchServersQueue, v12);
  objc_destroyWeak(v15);
  objc_destroyWeak(&v14);
  objc_destroyWeak(v18);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);
}

- (OpaqueAUPB)aupbRefFromHandle:(unsigned int)a3
{
  return (OpaqueAUPB *)a3;
}

- (OpaqueRemoteAudioUnit)auRefFromHandle:(unsigned int)a3
{
  return (OpaqueRemoteAudioUnit *)a3;
}

- (unsigned)auHandleFromRef:(OpaqueRemoteAudioUnit *)a3
{
  return a3;
}

- (void)processingBlock:(unsigned int)a3 propertyChanged:(unsigned int)a4
{
  uint64_t v5;
  uint64_t v7;
  NSMutableArray *mRemoteServers;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  OpaqueAUPB *v16;
  PropertyListener *begin;
  PropertyListener *j;
  OpaqueAUPB *v19;
  uint64_t v21;
  NSObject *global_queue;
  _QWORD block[4];
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE buf[40];
  unsigned int v32;
  _BYTE v33[128];
  uint64_t v34;

  v5 = *(_QWORD *)&a3;
  v34 = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  mRemoteServers = self->mRemoteServers;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mRemoteServers, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (!v9)
    return;
  v10 = v9;
  v11 = *(_QWORD *)v28;
  while (2)
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v28 != v11)
        objc_enumerationMutation(mRemoteServers);
      v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
      if (v7 == objc_msgSend(v13, "xpcConnection"))
      {
        if (gLogScope)
        {
          v14 = *(NSObject **)gLogScope;
          if (!*(_QWORD *)gLogScope)
          {
LABEL_16:
            begin = self->mPropertyListeners.__begin_;
            for (j = self->mPropertyListeners.__end_; begin != j; begin = (PropertyListener *)((char *)begin + 40))
            {
              v19 = (OpaqueAUPB *)*((_QWORD *)begin + 1);
              if (v19 == -[AUPBClientManager aupbRefFromHandle:](self, "aupbRefFromHandle:", v5)
                && *((_DWORD *)begin + 4) == a4)
              {
                v21 = *(_QWORD *)begin;
                if (v21 == objc_msgSend(v13, "ref"))
                {
                  *(_OWORD *)buf = *(_OWORD *)begin;
                  *(_OWORD *)&buf[16] = *((_OWORD *)begin + 1);
                  *(_QWORD *)&buf[32] = *((_QWORD *)begin + 4);
                  global_queue = dispatch_get_global_queue(0, 0);
                  block[0] = MEMORY[0x1E0C809B0];
                  block[1] = 3221225472;
                  block[2] = __53__AUPBClientManager_processingBlock_propertyChanged___block_invoke;
                  block[3] = &__block_descriptor_72_e5_v8__0l;
                  v24 = *(_OWORD *)buf;
                  v25 = *(_OWORD *)&buf[16];
                  v26 = *(_QWORD *)&buf[32];
                  dispatch_async(global_queue, block);
                }
              }
            }
            return;
          }
        }
        else
        {
          v14 = MEMORY[0x1E0C81028];
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          v15 = objc_msgSend((id)objc_msgSend(v13, "description"), "UTF8String");
          v16 = -[AUPBClientManager aupbRefFromHandle:](self, "aupbRefFromHandle:", v5);
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)&buf[4] = "AUPBClientManager.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 322;
          *(_WORD *)&buf[18] = 2080;
          *(_QWORD *)&buf[20] = v15;
          *(_WORD *)&buf[28] = 2048;
          *(_QWORD *)&buf[30] = v16;
          *(_WORD *)&buf[38] = 1024;
          v32 = a4;
          _os_log_impl(&dword_18EE07000, v14, OS_LOG_TYPE_DEBUG, "%25s:%-5d PBProp Changed: %s, block=%p property=%d\n", buf, 0x2Cu);
        }
        goto LABEL_16;
      }
    }
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mRemoteServers, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    if (v10)
      continue;
    break;
  }
}

- (void)processingBlock:(unsigned int)a3 propertiesChanged:(id)a4 withQualifierData:(id)a5
{
  uint64_t v6;
  uint64_t v8;
  NSMutableArray *mRemoteServers;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  uint64_t v15;
  int v16;
  NSObject *v17;
  uint64_t v18;
  OpaqueAUPB *v19;
  PropertyListener *j;
  OpaqueAUPB *v21;
  uint64_t v22;
  _DWORD *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  size_t v28;
  void *v29;
  const void *v30;
  NSObject *global_queue;
  __int128 v32;
  _QWORD block[5];
  void *__p;
  void *v36;
  uint64_t v37;
  const void *v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  int v42;
  int v43;
  int v44;
  void *__dst;
  int v46[2];
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE buf[40];
  int v53;
  _BYTE v54[128];
  uint64_t v55;

  v6 = *(_QWORD *)&a3;
  v55 = *MEMORY[0x1E0C80C00];
  v8 = objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  mRemoteServers = self->mRemoteServers;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mRemoteServers, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v49 != v11)
          objc_enumerationMutation(mRemoteServers);
        v13 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        if (v8 == objc_msgSend(v13, "xpcConnection"))
        {
          if (!objc_msgSend(a4, "count"))
            return;
          v15 = 0;
          *(_QWORD *)&v14 = 136316162;
          v32 = v14;
          while (2)
          {
            v16 = objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", v15, v32), "unsignedIntValue");
            if (gLogScope)
            {
              v17 = *(NSObject **)gLogScope;
              if (!*(_QWORD *)gLogScope)
              {
LABEL_18:
                for (j = self->mPropertyListeners.__begin_;
                      j != self->mPropertyListeners.__end_;
                      j = (PropertyListener *)((char *)j + 40))
                {
                  v21 = (OpaqueAUPB *)*((_QWORD *)j + 1);
                  if (v21 == -[AUPBClientManager aupbRefFromHandle:](self, "aupbRefFromHandle:", v6)
                    && *((_DWORD *)j + 4) == v16)
                  {
                    v22 = *(_QWORD *)j;
                    if (v22 == objc_msgSend(v13, "ref"))
                    {
                      if ((unint64_t)objc_msgSend(a5, "length") >= 9)
                      {
                        v23 = (_DWORD *)objc_msgSend(a5, "bytes");
                        v24 = objc_msgSend(a5, "bytes");
                        while ((unint64_t)v23 >= v24)
                        {
                          v25 = objc_msgSend(a5, "bytes");
                          if ((unint64_t)v23 > v25 + objc_msgSend(a5, "length") - 8)
                            break;
                          if (*v23 == v16)
                          {
                            v27 = objc_msgSend(a5, "length");
                            v28 = v23[1];
                            if ((unint64_t)v23 > v27 - v28 - 8)
                              break;
                            std::vector<unsigned char>::vector(&__dst, v23[1]);
                            v30 = v23 + 2;
                            v29 = __dst;
                            if ((_DWORD)v28)
                            {
                              memcpy(__dst, v30, v28);
                              v29 = __dst;
                            }
                            goto LABEL_31;
                          }
                          v26 = v23[1];
                          v24 = objc_msgSend(a5, "bytes");
                          v23 = (_DWORD *)((char *)v23 + v26 + 8);
                        }
                      }
                      v29 = 0;
                      LODWORD(v28) = 0;
                      v30 = 0;
                      __dst = 0;
                      *(_QWORD *)v46 = 0;
                      v47 = 0;
LABEL_31:
                      *(_OWORD *)buf = *(_OWORD *)j;
                      *(_OWORD *)&buf[16] = *((_OWORD *)j + 1);
                      *(_QWORD *)&buf[32] = *((_QWORD *)j + 4);
                      block[0] = MEMORY[0x1E0C809B0];
                      block[1] = 3321888768;
                      block[2] = __73__AUPBClientManager_processingBlock_propertiesChanged_withQualifierData___block_invoke;
                      block[3] = &unk_1E2918120;
                      v42 = v28;
                      v36 = 0;
                      v37 = 0;
                      __p = 0;
                      std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&__p, v29, *(uint64_t *)v46, *(_QWORD *)v46 - (_QWORD)v29);
                      global_queue = dispatch_get_global_queue(0, 0);
                      v39 = *(_OWORD *)buf;
                      v40 = *(_OWORD *)&buf[16];
                      v41 = *(_QWORD *)&buf[32];
                      v38 = v30;
                      block[4] = self;
                      v43 = v6;
                      v44 = v16;
                      dispatch_async(global_queue, block);
                      if (__p)
                      {
                        v36 = __p;
                        operator delete(__p);
                      }
                      if (__dst)
                      {
                        *(_QWORD *)v46 = __dst;
                        operator delete(__dst);
                      }
                    }
                  }
                }
                if (++v15 >= (unint64_t)objc_msgSend(a4, "count"))
                  return;
                continue;
              }
            }
            else
            {
              v17 = MEMORY[0x1E0C81028];
            }
            break;
          }
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            v18 = objc_msgSend((id)objc_msgSend(v13, "description"), "UTF8String");
            v19 = -[AUPBClientManager aupbRefFromHandle:](self, "aupbRefFromHandle:", v6);
            *(_DWORD *)buf = v32;
            *(_QWORD *)&buf[4] = "AUPBClientManager.mm";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 345;
            *(_WORD *)&buf[18] = 2080;
            *(_QWORD *)&buf[20] = v18;
            *(_WORD *)&buf[28] = 2048;
            *(_QWORD *)&buf[30] = v19;
            *(_WORD *)&buf[38] = 1024;
            v53 = v16;
            _os_log_impl(&dword_18EE07000, v17, OS_LOG_TYPE_DEBUG, "%25s:%-5d PBPropsChanged: %s, block=%p property=%d\n", buf, 0x2Cu);
          }
          goto LABEL_18;
        }
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mRemoteServers, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    }
    while (v10);
  }
}

- (id)serverFromRef:(OpaqueAUPBServer *)a3
{
  NSMutableArray *mRemoteServers;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  mRemoteServers = self->mRemoteServers;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mRemoteServers, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(mRemoteServers);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if ((OpaqueAUPBServer *)objc_msgSend(v9, "ref") == a3)
      return v9;
    if (v6 == ++v8)
    {
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mRemoteServers, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (int)addNewServerListener:(void *)a3 withUserData:(void *)a4
{
  NewServerListener *value;
  NewServerListener *end;
  NewServerListener *v9;
  int v10;
  NewServerListener *begin;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  NSObject *mTouchServersQueue;
  NSObject *v20;
  _QWORD block[7];
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    end = self->mNewServerListeners.__end_;
    value = self->mNewServerListeners.__end_cap_.__value_;
    if (end >= value)
    {
      begin = self->mNewServerListeners.__begin_;
      v12 = (end - begin) >> 4;
      v13 = v12 + 1;
      if ((unint64_t)(v12 + 1) >> 60)
        std::vector<float>::__throw_length_error[abi:ne180100]();
      v14 = value - begin;
      if (v14 >> 3 > v13)
        v13 = v14 >> 3;
      if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF0)
        v15 = 0xFFFFFFFFFFFFFFFLL;
      else
        v15 = v13;
      if (v15)
      {
        if (v15 >> 60)
          std::__throw_bad_array_new_length[abi:ne180100]();
        v16 = (char *)operator new(16 * v15);
      }
      else
      {
        v16 = 0;
      }
      v17 = &v16[16 * v12];
      *(_QWORD *)v17 = a3;
      *((_QWORD *)v17 + 1) = a4;
      v9 = (NewServerListener *)(v17 + 16);
      if (end != begin)
      {
        do
        {
          *((_OWORD *)v17 - 1) = *((_OWORD *)end - 1);
          v17 -= 16;
          end = (NewServerListener *)((char *)end - 16);
        }
        while (end != begin);
        end = self->mNewServerListeners.__begin_;
      }
      self->mNewServerListeners.__begin_ = (NewServerListener *)v17;
      self->mNewServerListeners.__end_ = v9;
      self->mNewServerListeners.__end_cap_.__value_ = (NewServerListener *)&v16[16 * v15];
      if (end)
        operator delete(end);
    }
    else
    {
      *(_QWORD *)end = a3;
      *((_QWORD *)end + 1) = a4;
      v9 = (NewServerListener *)((char *)end + 16);
    }
    self->mNewServerListeners.__end_ = v9;
    v18 = -[NSMutableArray copy](self->mRemoteServers, "copy");
    mTouchServersQueue = self->mTouchServersQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__AUPBClientManager_addNewServerListener_withUserData___block_invoke;
    block[3] = &unk_1E29215A0;
    block[4] = v18;
    block[5] = a3;
    block[6] = a4;
    dispatch_async(mTouchServersQueue, block);
    v10 = 0;
  }
  else
  {
    v10 = -50;
  }
  if (gLogScope)
  {
    v20 = *(NSObject **)gLogScope;
    if (!*(_QWORD *)gLogScope)
      return v10;
  }
  else
  {
    v20 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316162;
    v24 = "AUPBClientManager.mm";
    v25 = 1024;
    v26 = 432;
    v27 = 2048;
    v28 = a3;
    v29 = 2048;
    v30 = a4;
    v31 = 1024;
    v32 = v10;
    _os_log_impl(&dword_18EE07000, v20, OS_LOG_TYPE_DEBUG, "%25s:%-5d AddServerListener: proc=%p, userData=%p, result=%d\n", buf, 0x2Cu);
  }
  return v10;
}

- (int)removeServerListener:(void *)a3 withUserData:(void *)a4
{
  NewServerListener *end;
  NewServerListener *begin;
  int v9;
  NSObject *v10;
  int64_t v12;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    begin = self->mNewServerListeners.__begin_;
    end = self->mNewServerListeners.__end_;
    while (begin != end)
    {
      if (*(void **)begin == a3 && *((void **)begin + 1) == a4)
      {
        v12 = end - (NewServerListener *)((char *)begin + 16);
        if (end != (NewServerListener *)((char *)begin + 16))
          memmove(begin, (char *)begin + 16, end - (NewServerListener *)((char *)begin + 16));
        v9 = 0;
        self->mNewServerListeners.__end_ = (NewServerListener *)((char *)begin + v12);
        goto LABEL_8;
      }
      begin = (NewServerListener *)((char *)begin + 16);
    }
  }
  v9 = -50;
LABEL_8:
  if (gLogScope)
  {
    v10 = *(NSObject **)gLogScope;
    if (!*(_QWORD *)gLogScope)
      return v9;
  }
  else
  {
    v10 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v13 = 136316162;
    v14 = "AUPBClientManager.mm";
    v15 = 1024;
    v16 = 450;
    v17 = 2048;
    v18 = a3;
    v19 = 2048;
    v20 = a4;
    v21 = 1024;
    v22 = v9;
    _os_log_impl(&dword_18EE07000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d RemoveServerListener: proc=%p, userData=%p, result=%d\n", (uint8_t *)&v13, 0x2Cu);
  }
  return v9;
}

- (int)addPropertyListener:(void *)a3 onServer:(OpaqueAUPBServer *)a4 block:(OpaqueAUPB *)a5 property:(unsigned int)a6 withUserData:(void *)a7
{
  int v12;
  PropertyListener *value;
  PropertyListener *end;
  PropertyListener *v16;
  PropertyListener *begin;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  __int128 v23;
  __int128 v24;
  NSObject *v25;
  int v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  OpaqueAUPBServer *v34;
  __int16 v35;
  OpaqueAUPB *v36;
  __int16 v37;
  unsigned int v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v12 = -50;
  if (a3 && a4)
  {
    end = self->mPropertyListeners.__end_;
    value = self->mPropertyListeners.__end_cap_.__value_;
    if (end >= value)
    {
      begin = self->mPropertyListeners.__begin_;
      v18 = 0xCCCCCCCCCCCCCCCDLL * ((end - begin) >> 3) + 1;
      if (v18 > 0x666666666666666)
        std::vector<float>::__throw_length_error[abi:ne180100]();
      v19 = 0xCCCCCCCCCCCCCCCDLL * ((value - begin) >> 3);
      if (2 * v19 > v18)
        v18 = 2 * v19;
      if (v19 >= 0x333333333333333)
        v20 = 0x666666666666666;
      else
        v20 = v18;
      if (v20)
      {
        if (v20 > 0x666666666666666)
          std::__throw_bad_array_new_length[abi:ne180100]();
        v21 = (char *)operator new(40 * v20);
      }
      else
      {
        v21 = 0;
      }
      v22 = &v21[8 * ((end - begin) >> 3)];
      *(_QWORD *)v22 = a4;
      *((_QWORD *)v22 + 1) = a5;
      *((_DWORD *)v22 + 4) = a6;
      *((_DWORD *)v22 + 5) = 0;
      *((_QWORD *)v22 + 3) = a3;
      *((_QWORD *)v22 + 4) = a7;
      v16 = (PropertyListener *)(v22 + 40);
      if (end != begin)
      {
        do
        {
          v23 = *(_OWORD *)((char *)end - 40);
          v24 = *(_OWORD *)((char *)end - 24);
          *((_QWORD *)v22 - 1) = *((_QWORD *)end - 1);
          *(_OWORD *)(v22 - 24) = v24;
          *(_OWORD *)(v22 - 40) = v23;
          v22 -= 40;
          end = (PropertyListener *)((char *)end - 40);
        }
        while (end != begin);
        end = self->mPropertyListeners.__begin_;
      }
      self->mPropertyListeners.__begin_ = (PropertyListener *)v22;
      self->mPropertyListeners.__end_ = v16;
      self->mPropertyListeners.__end_cap_.__value_ = (PropertyListener *)&v21[40 * v20];
      if (end)
        operator delete(end);
    }
    else
    {
      *(_QWORD *)end = a4;
      *((_QWORD *)end + 1) = a5;
      *((_QWORD *)end + 2) = a6;
      v16 = (PropertyListener *)((char *)end + 40);
      *((_QWORD *)end + 3) = a3;
      *((_QWORD *)end + 4) = a7;
    }
    v12 = 0;
    self->mPropertyListeners.__end_ = v16;
  }
  if (gLogScope)
  {
    v25 = *(NSObject **)gLogScope;
    if (!*(_QWORD *)gLogScope)
      return v12;
  }
  else
  {
    v25 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    v27 = 136316930;
    v28 = "AUPBClientManager.mm";
    v29 = 1024;
    v30 = 463;
    v31 = 2048;
    v32 = a3;
    v33 = 2048;
    v34 = a4;
    v35 = 2048;
    v36 = a5;
    v37 = 1024;
    v38 = a6;
    v39 = 2048;
    v40 = a7;
    v41 = 1024;
    v42 = v12;
    _os_log_impl(&dword_18EE07000, v25, OS_LOG_TYPE_DEBUG, "%25s:%-5d AddPBPropListener: proc=%p, server=%p block=%p property=%d userData=%p result=%d\n", (uint8_t *)&v27, 0x46u);
  }
  return v12;
}

- (int)removePropertyListener:(void *)a3 onServer:(OpaqueAUPBServer *)a4 block:(OpaqueAUPB *)a5 property:(unsigned int)a6 withUserData:(void *)a7
{
  PropertyListener *end;
  PropertyListener *begin;
  int v15;
  NSObject *v16;
  int64_t v18;
  int v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  OpaqueAUPBServer *v26;
  __int16 v27;
  OpaqueAUPB *v28;
  __int16 v29;
  unsigned int v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  begin = self->mPropertyListeners.__begin_;
  end = self->mPropertyListeners.__end_;
  if (begin == end)
  {
LABEL_8:
    v15 = -50;
  }
  else
  {
    while (*((void **)begin + 3) != a3
         || *(OpaqueAUPBServer **)begin != a4
         || *((OpaqueAUPB **)begin + 1) != a5
         || *((_DWORD *)begin + 4) != a6
         || *((void **)begin + 4) != a7)
    {
      begin = (PropertyListener *)((char *)begin + 40);
      if (begin == end)
        goto LABEL_8;
    }
    v18 = end - (PropertyListener *)((char *)begin + 40);
    if (end != (PropertyListener *)((char *)begin + 40))
      memmove(begin, (char *)begin + 40, end - (PropertyListener *)((char *)begin + 40));
    v15 = 0;
    self->mPropertyListeners.__end_ = (PropertyListener *)((char *)begin + v18);
  }
  if (gLogScope)
  {
    v16 = *(NSObject **)gLogScope;
    if (!*(_QWORD *)gLogScope)
      return v15;
  }
  else
  {
    v16 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v19 = 136316930;
    v20 = "AUPBClientManager.mm";
    v21 = 1024;
    v22 = 478;
    v23 = 2048;
    v24 = a3;
    v25 = 2048;
    v26 = a4;
    v27 = 2048;
    v28 = a5;
    v29 = 1024;
    v30 = a6;
    v31 = 2048;
    v32 = a7;
    v33 = 1024;
    v34 = v15;
    _os_log_impl(&dword_18EE07000, v16, OS_LOG_TYPE_DEBUG, "%25s:%-5d RemovePBPropListener: proc=%p, server=%p block=%p property=%d userData=%p result=%d\n", (uint8_t *)&v19, 0x46u);
  }
  return v15;
}

- (int)removePropertyListenersForServer:(OpaqueAUPBServer *)a3
{
  PropertyListener *end;
  PropertyListener *begin;
  int64_t v7;

  begin = self->mPropertyListeners.__begin_;
  end = self->mPropertyListeners.__end_;
  while (begin != end)
  {
    if (*(OpaqueAUPBServer **)begin == a3)
    {
      v7 = end - (PropertyListener *)((char *)begin + 40);
      if (end != (PropertyListener *)((char *)begin + 40))
        memmove(begin, (char *)begin + 40, end - (PropertyListener *)((char *)begin + 40));
      end = (PropertyListener *)((char *)begin + v7);
      self->mPropertyListeners.__end_ = (PropertyListener *)((char *)begin + v7);
    }
    else
    {
      begin = (PropertyListener *)((char *)begin + 40);
    }
  }
  return 0;
}

- (int)copyPBProperty:(unsigned int)a3 onServer:(OpaqueAUPBServer *)a4 block:(OpaqueAUPB *)a5 intoValue:(const void *)a6
{
  uint64_t v9;
  id v11;
  NSObject *v12;
  int v13;
  uint64_t *v14;
  void *v15;
  _QWORD v17[9];
  int v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  int v22;
  _BYTE buf[24];
  _BYTE v24[24];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (self->mConnectionAcknowledged)
  {
    v9 = *(_QWORD *)&a3;
    v11 = -[AUPBClientManager serverFromRef:](self, "serverFromRef:", a4);
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 1936881215;
    if (gLogScope)
    {
      v12 = *(NSObject **)gLogScope;
      if (!*(_QWORD *)gLogScope)
        goto LABEL_10;
    }
    else
    {
      v12 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "AUPBClientManager.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 500;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v9;
      *(_WORD *)v24 = 2048;
      *(_QWORD *)&v24[2] = a4;
      *(_WORD *)&v24[10] = 2048;
      *(_QWORD *)&v24[12] = a5;
      _os_log_impl(&dword_18EE07000, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d CopyPBProp: property=%d server=%p block=%p", buf, 0x2Cu);
      v14 = v20;
      if (a6)
        goto LABEL_11;
      goto LABEL_13;
    }
LABEL_10:
    v14 = &v19;
    if (a6)
    {
LABEL_11:
      if (!v11)
        goto LABEL_15;
      goto LABEL_14;
    }
LABEL_13:
    *((_DWORD *)v14 + 6) = 1886806380;
    if (!v11)
    {
LABEL_15:
      v13 = *((_DWORD *)v14 + 6);
      _Block_object_dispose(&v19, 8);
      return v13;
    }
LABEL_14:
    *((_DWORD *)v14 + 6) = 1953461620;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3052000000;
    *(_QWORD *)v24 = __Block_byref_object_copy__128;
    *(_QWORD *)&v24[8] = __Block_byref_object_dispose__129;
    *(_QWORD *)&v24[16] = 0;
    *(_QWORD *)&v24[16] = dispatch_semaphore_create(0);
    objc_msgSend(v11, "addSema:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
    v15 = (void *)objc_msgSend(v11, "proxyInterface");
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __61__AUPBClientManager_copyPBProperty_onServer_block_intoValue___block_invoke;
    v17[3] = &unk_1E29215C8;
    v18 = v9;
    v17[4] = self;
    v17[5] = v11;
    v17[6] = &v19;
    v17[7] = buf;
    v17[8] = a6;
    objc_msgSend(v15, "copyProcessingBlock:property:intoReply:", a5, v9, v17);
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)&buf[8] + 40), 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(*(dispatch_object_t *)(*(_QWORD *)&buf[8] + 40));
    _Block_object_dispose(buf, 8);
    v14 = v20;
    goto LABEL_15;
  }
  return 560295540;
}

- (int)setPBProperty:(unsigned int)a3 onServer:(OpaqueAUPBServer *)a4 block:(OpaqueAUPB *)a5 value:(void *)a6
{
  uint64_t v9;
  id v10;
  NSObject *v11;
  int v12;
  uint64_t *v13;
  CFDataRef Data;
  void *v15;
  _QWORD v17[7];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  int v21;
  _BYTE buf[24];
  _BYTE v23[24];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!self->mConnectionAcknowledged)
    return 560295540;
  v9 = *(_QWORD *)&a3;
  v10 = -[AUPBClientManager serverFromRef:](self, "serverFromRef:", a4);
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 1936881215;
  if (!gLogScope)
  {
    v11 = MEMORY[0x1E0C81028];
LABEL_7:
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "AUPBClientManager.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 546;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v9;
      *(_WORD *)v23 = 2048;
      *(_QWORD *)&v23[2] = a4;
      *(_WORD *)&v23[10] = 2048;
      *(_QWORD *)&v23[12] = a5;
      _os_log_impl(&dword_18EE07000, v11, OS_LOG_TYPE_DEBUG, "%25s:%-5d SetPBProp: property=%d server=%p block=%p\n", buf, 0x2Cu);
    }
    goto LABEL_9;
  }
  v11 = *(NSObject **)gLogScope;
  if (*(_QWORD *)gLogScope)
    goto LABEL_7;
LABEL_9:
  if (a6)
  {
    v13 = v19;
    if (v10)
    {
      *((_DWORD *)v19 + 6) = 1953461620;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3052000000;
      *(_QWORD *)v23 = __Block_byref_object_copy__128;
      *(_QWORD *)&v23[8] = __Block_byref_object_dispose__129;
      *(_QWORD *)&v23[16] = 0;
      *(_QWORD *)&v23[16] = dispatch_semaphore_create(0);
      objc_msgSend(v10, "addSema:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
      Data = CFPropertyListCreateData(0, a6, kCFPropertyListBinaryFormat_v1_0, 0, 0);
      v15 = (void *)objc_msgSend(v10, "proxyInterface");
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __56__AUPBClientManager_setPBProperty_onServer_block_value___block_invoke;
      v17[3] = &unk_1E29215F0;
      v17[4] = &v18;
      v17[5] = buf;
      v17[6] = v10;
      objc_msgSend(v15, "setProcessingBlock:property:value:withReply:", a5, v9, Data, v17);
      CFRelease(Data);
      dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)&buf[8] + 40), 0xFFFFFFFFFFFFFFFFLL);
      dispatch_release(*(dispatch_object_t *)(*(_QWORD *)&buf[8] + 40));
      _Block_object_dispose(buf, 8);
      v13 = v19;
    }
  }
  else
  {
    v13 = v19;
    *((_DWORD *)v19 + 6) = 1886806380;
  }
  v12 = *((_DWORD *)v13 + 6);
  _Block_object_dispose(&v18, 8);
  return v12;
}

- (int)getAUPropertyInfo:(unsigned int)a3 onServer:(OpaqueAUPBServer *)a4 audioUnit:(OpaqueRemoteAudioUnit *)a5 scope:(unsigned int)a6 element:(unsigned int)a7 intoDataSize:(unsigned int *)a8 writeable:(char *)a9
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v14;
  id v16;
  NSObject *v17;
  int v18;
  uint64_t *v19;
  void *v20;
  uint64_t v21;
  _QWORD v23[9];
  int v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  int v28;
  _BYTE buf[24];
  _BYTE v30[26];
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (self->mConnectionAcknowledged)
  {
    v10 = *(_QWORD *)&a7;
    v11 = *(_QWORD *)&a6;
    v14 = *(_QWORD *)&a3;
    v16 = -[AUPBClientManager serverFromRef:](self, "serverFromRef:", a4);
    v25 = 0;
    v26 = &v25;
    v27 = 0x2020000000;
    v28 = 1936881215;
    if (gLogScope)
    {
      v17 = *(NSObject **)gLogScope;
      if (!*(_QWORD *)gLogScope)
        goto LABEL_10;
    }
    else
    {
      v17 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136316674;
      *(_QWORD *)&buf[4] = "AUPBClientManager.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 573;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v14;
      *(_WORD *)v30 = 2048;
      *(_QWORD *)&v30[2] = a4;
      *(_WORD *)&v30[10] = 2048;
      *(_QWORD *)&v30[12] = a5;
      *(_WORD *)&v30[20] = 1024;
      *(_DWORD *)&v30[22] = v11;
      v31 = 1024;
      v32 = v10;
      _os_log_impl(&dword_18EE07000, v17, OS_LOG_TYPE_DEBUG, "%25s:%-5d GetAUPropInfo: property=%d server=%p au=%p scope=%d element=%d\n", buf, 0x38u);
      v19 = v26;
      if (!v16)
        goto LABEL_12;
      goto LABEL_11;
    }
LABEL_10:
    v19 = &v25;
    if (!v16)
    {
LABEL_12:
      v18 = *((_DWORD *)v19 + 6);
      _Block_object_dispose(&v25, 8);
      return v18;
    }
LABEL_11:
    *((_DWORD *)v19 + 6) = 1953461620;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3052000000;
    *(_QWORD *)v30 = __Block_byref_object_copy__128;
    *(_QWORD *)&v30[8] = __Block_byref_object_dispose__129;
    *(_QWORD *)&v30[16] = 0;
    *(_QWORD *)&v30[16] = dispatch_semaphore_create(0);
    objc_msgSend(v16, "addSema:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
    v20 = (void *)objc_msgSend(v16, "proxyInterface");
    v21 = -[AUPBClientManager auHandleFromRef:](self, "auHandleFromRef:", a5);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __95__AUPBClientManager_getAUPropertyInfo_onServer_audioUnit_scope_element_intoDataSize_writeable___block_invoke;
    v23[3] = &unk_1E2921618;
    v23[7] = a8;
    v23[8] = a9;
    v24 = v14;
    v23[4] = v16;
    v23[5] = &v25;
    v23[6] = buf;
    objc_msgSend(v20, "getAudioUnit:propertyInfo:onScope:element:inReply:", v21, v14, v11, v10, v23);
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)&buf[8] + 40), 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(*(dispatch_object_t *)(*(_QWORD *)&buf[8] + 40));
    _Block_object_dispose(buf, 8);
    v19 = v26;
    goto LABEL_12;
  }
  return 560295540;
}

- (int)getAUProperty:(unsigned int)a3 onServer:(OpaqueAUPBServer *)a4 audioUnit:(OpaqueRemoteAudioUnit *)a5 scope:(unsigned int)a6 element:(unsigned int)a7 copiedIntoBufer:(void *)a8 withSize:(unsigned int *)a9
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v14;
  id v16;
  NSObject *v17;
  int v18;
  uint64_t *v19;
  void *v20;
  uint64_t v21;
  _QWORD v23[9];
  int v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  int v28;
  _BYTE buf[24];
  _BYTE v30[26];
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (self->mConnectionAcknowledged)
  {
    v10 = *(_QWORD *)&a7;
    v11 = *(_QWORD *)&a6;
    v14 = *(_QWORD *)&a3;
    v16 = -[AUPBClientManager serverFromRef:](self, "serverFromRef:", a4);
    v25 = 0;
    v26 = &v25;
    v27 = 0x2020000000;
    v28 = 1936881215;
    if (gLogScope)
    {
      v17 = *(NSObject **)gLogScope;
      if (!*(_QWORD *)gLogScope)
        goto LABEL_10;
    }
    else
    {
      v17 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136316674;
      *(_QWORD *)&buf[4] = "AUPBClientManager.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 651;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v14;
      *(_WORD *)v30 = 2048;
      *(_QWORD *)&v30[2] = a4;
      *(_WORD *)&v30[10] = 2048;
      *(_QWORD *)&v30[12] = a5;
      *(_WORD *)&v30[20] = 1024;
      *(_DWORD *)&v30[22] = v11;
      v31 = 1024;
      v32 = v10;
      _os_log_impl(&dword_18EE07000, v17, OS_LOG_TYPE_DEBUG, "%25s:%-5d GetAUProp: property=%d server=%p au=%p scope=%d element=%d\n", buf, 0x38u);
      v19 = v26;
      if (!v16)
        goto LABEL_12;
      goto LABEL_11;
    }
LABEL_10:
    v19 = &v25;
    if (!v16)
    {
LABEL_12:
      v18 = *((_DWORD *)v19 + 6);
      _Block_object_dispose(&v25, 8);
      return v18;
    }
LABEL_11:
    *((_DWORD *)v19 + 6) = 1953461620;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3052000000;
    *(_QWORD *)v30 = __Block_byref_object_copy__128;
    *(_QWORD *)&v30[8] = __Block_byref_object_dispose__129;
    *(_QWORD *)&v30[16] = 0;
    *(_QWORD *)&v30[16] = dispatch_semaphore_create(0);
    objc_msgSend(v16, "addSema:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
    v20 = (void *)objc_msgSend(v16, "proxyInterface");
    v21 = -[AUPBClientManager auHandleFromRef:](self, "auHandleFromRef:", a5);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __93__AUPBClientManager_getAUProperty_onServer_audioUnit_scope_element_copiedIntoBufer_withSize___block_invoke;
    v23[3] = &unk_1E2921640;
    v24 = v14;
    v23[7] = a8;
    v23[8] = a9;
    v23[4] = v16;
    v23[5] = &v25;
    v23[6] = buf;
    objc_msgSend(v20, "getAudioUnit:property:onScope:element:inReply:", v21, v14, v11, v10, v23);
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)&buf[8] + 40), 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(*(dispatch_object_t *)(*(_QWORD *)&buf[8] + 40));
    _Block_object_dispose(buf, 8);
    v19 = v26;
    goto LABEL_12;
  }
  return 560295540;
}

- (int)setAUProperty:(unsigned int)a3 onServer:(OpaqueAUPBServer *)a4 audioUnit:(OpaqueRemoteAudioUnit *)a5 scope:(unsigned int)a6 element:(unsigned int)a7 withValue:(const void *)a8 size:(unsigned int)a9
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v13;
  id v15;
  NSObject *v16;
  int v17;
  int v18;
  uint64_t *v19;
  void *v20;
  const UInt8 *BytePtr;
  uint64_t Length;
  void *v23;
  void *v24;
  uint64_t v25;
  _QWORD v27[7];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  dispatch_semaphore_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  int v37;
  _BYTE buf[12];
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  _BYTE v43[10];
  __int16 v44;
  OpaqueRemoteAudioUnit *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  int v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (self->mConnectionAcknowledged)
  {
    v9 = *(_QWORD *)&a7;
    v10 = *(_QWORD *)&a6;
    v13 = *(_QWORD *)&a3;
    v15 = -[AUPBClientManager serverFromRef:](self, "serverFromRef:", a4);
    v34 = 0;
    v35 = &v34;
    v36 = 0x2020000000;
    v37 = 1936881215;
    if (gLogScope)
    {
      v16 = *(NSObject **)gLogScope;
      if (!*(_QWORD *)gLogScope)
        goto LABEL_9;
    }
    else
    {
      v16 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136316674;
      *(_QWORD *)&buf[4] = "AUPBClientManager.mm";
      v39 = 1024;
      v40 = 684;
      v41 = 1024;
      v42 = v13;
      *(_WORD *)v43 = 2048;
      *(_QWORD *)&v43[2] = a4;
      v44 = 2048;
      v45 = a5;
      v46 = 1024;
      v47 = v10;
      v48 = 1024;
      v49 = v9;
      _os_log_impl(&dword_18EE07000, v16, OS_LOG_TYPE_DEBUG, "%25s:%-5d SetAUProp: property=%d server=%p au=%p scope=%d element=%d\n", buf, 0x38u);
    }
LABEL_9:
    if (!v15)
    {
LABEL_21:
      v17 = *((_DWORD *)v35 + 6);
      _Block_object_dispose(&v34, 8);
      return v17;
    }
    PropertyMarshaller::PropertyMarshaller((PropertyMarshaller *)buf, 0);
    *(_QWORD *)buf = &off_1E2909C60;
    v18 = PropertyMarshaller::Serialize();
    v19 = v35;
    *((_DWORD *)v35 + 6) = v18;
    if (v18)
    {
      *((_DWORD *)v19 + 6) = 1936878714;
LABEL_20:
      PropertyMarshaller::~PropertyMarshaller((PropertyMarshaller *)buf);
      goto LABEL_21;
    }
    *((_DWORD *)v19 + 6) = 1953461620;
    v28 = 0;
    v29 = &v28;
    v30 = 0x3052000000;
    v31 = __Block_byref_object_copy__128;
    v32 = __Block_byref_object_dispose__129;
    v33 = 0;
    v33 = dispatch_semaphore_create(0);
    objc_msgSend(v15, "addSema:", v29[5]);
    v20 = (void *)MEMORY[0x1E0C99D50];
    if (*(_QWORD *)v43 && **(_QWORD **)v43)
    {
      BytePtr = CFDataGetBytePtr(**(CFDataRef **)v43);
      if (*(_QWORD *)v43 && **(_QWORD **)v43)
      {
        Length = CFDataGetLength(**(CFDataRef **)v43);
LABEL_19:
        v23 = (void *)objc_msgSend(v20, "dataWithBytes:length:", BytePtr, Length);
        v24 = (void *)objc_msgSend(v15, "proxyInterface");
        v25 = -[AUPBClientManager auHandleFromRef:](self, "auHandleFromRef:", a5);
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __83__AUPBClientManager_setAUProperty_onServer_audioUnit_scope_element_withValue_size___block_invoke;
        v27[3] = &unk_1E29215F0;
        v27[4] = &v34;
        v27[5] = &v28;
        v27[6] = v15;
        objc_msgSend(v24, "setAudioUnit:property:onScope:element:value:withReply:", v25, v13, v10, v9, v23, v27);

        dispatch_semaphore_wait((dispatch_semaphore_t)v29[5], 0xFFFFFFFFFFFFFFFFLL);
        dispatch_release((dispatch_object_t)v29[5]);
        _Block_object_dispose(&v28, 8);
        goto LABEL_20;
      }
    }
    else
    {
      BytePtr = 0;
    }
    Length = 0;
    goto LABEL_19;
  }
  return 560295540;
}

- (int)getAUParameter:(unsigned int)a3 onServer:(OpaqueAUPBServer *)a4 audioUnit:(OpaqueRemoteAudioUnit *)a5 scope:(unsigned int)a6 element:(unsigned int)a7 copiedIntoValue:(float *)a8
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v13;
  id v15;
  NSObject *v16;
  int v17;
  uint64_t *v18;
  void *v19;
  uint64_t v20;
  _QWORD v22[8];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int v26;
  _BYTE buf[24];
  _BYTE v28[26];
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (self->mConnectionAcknowledged)
  {
    v9 = *(_QWORD *)&a7;
    v10 = *(_QWORD *)&a6;
    v13 = *(_QWORD *)&a3;
    v15 = -[AUPBClientManager serverFromRef:](self, "serverFromRef:", a4);
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 1936881215;
    if (gLogScope)
    {
      v16 = *(NSObject **)gLogScope;
      if (!*(_QWORD *)gLogScope)
        goto LABEL_10;
    }
    else
    {
      v16 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136316674;
      *(_QWORD *)&buf[4] = "AUPBClientManager.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 719;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v13;
      *(_WORD *)v28 = 2048;
      *(_QWORD *)&v28[2] = a4;
      *(_WORD *)&v28[10] = 2048;
      *(_QWORD *)&v28[12] = a5;
      *(_WORD *)&v28[20] = 1024;
      *(_DWORD *)&v28[22] = v10;
      v29 = 1024;
      v30 = v9;
      _os_log_impl(&dword_18EE07000, v16, OS_LOG_TYPE_DEBUG, "%25s:%-5d GetAUParam: parameter=%d server=%p au=%p scope=%d element=%d\n", buf, 0x38u);
      v18 = v24;
      if (a8)
        goto LABEL_11;
      goto LABEL_13;
    }
LABEL_10:
    v18 = &v23;
    if (a8)
    {
LABEL_11:
      if (v15)
      {
        *((_DWORD *)v18 + 6) = 1953461620;
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3052000000;
        *(_QWORD *)v28 = __Block_byref_object_copy__128;
        *(_QWORD *)&v28[8] = __Block_byref_object_dispose__129;
        *(_QWORD *)&v28[16] = 0;
        *(_QWORD *)&v28[16] = dispatch_semaphore_create(0);
        objc_msgSend(v15, "addSema:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
        v19 = (void *)objc_msgSend(v15, "proxyInterface");
        v20 = -[AUPBClientManager auHandleFromRef:](self, "auHandleFromRef:", a5);
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __85__AUPBClientManager_getAUParameter_onServer_audioUnit_scope_element_copiedIntoValue___block_invoke;
        v22[3] = &unk_1E2921668;
        v22[4] = v15;
        v22[5] = &v23;
        v22[6] = buf;
        v22[7] = a8;
        objc_msgSend(v19, "getAudioUnit:parameter:onScope:element:inReply:", v20, v13, v10, v9, v22);
        dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)&buf[8] + 40), 0xFFFFFFFFFFFFFFFFLL);
        dispatch_release(*(dispatch_object_t *)(*(_QWORD *)&buf[8] + 40));
        _Block_object_dispose(buf, 8);
        v18 = v24;
      }
    }
LABEL_13:
    v17 = *((_DWORD *)v18 + 6);
    _Block_object_dispose(&v23, 8);
    return v17;
  }
  return 560295540;
}

- (int)setAUParameter:(unsigned int)a3 onServer:(OpaqueAUPBServer *)a4 audioUnit:(OpaqueRemoteAudioUnit *)a5 scope:(unsigned int)a6 element:(unsigned int)a7 value:(float)a8
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v13;
  id v15;
  NSObject *v16;
  int v17;
  uint64_t *v18;
  void *v19;
  uint64_t v20;
  _QWORD v22[7];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int v26;
  _BYTE buf[24];
  _BYTE v28[26];
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (self->mConnectionAcknowledged)
  {
    v9 = *(_QWORD *)&a7;
    v10 = *(_QWORD *)&a6;
    v13 = *(_QWORD *)&a3;
    v15 = -[AUPBClientManager serverFromRef:](self, "serverFromRef:", a4);
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 1936881215;
    if (gLogScope)
    {
      v16 = *(NSObject **)gLogScope;
      if (!*(_QWORD *)gLogScope)
        goto LABEL_10;
    }
    else
    {
      v16 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136316674;
      *(_QWORD *)&buf[4] = "AUPBClientManager.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 748;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v13;
      *(_WORD *)v28 = 2048;
      *(_QWORD *)&v28[2] = a4;
      *(_WORD *)&v28[10] = 2048;
      *(_QWORD *)&v28[12] = a5;
      *(_WORD *)&v28[20] = 1024;
      *(_DWORD *)&v28[22] = v10;
      v29 = 1024;
      v30 = v9;
      _os_log_impl(&dword_18EE07000, v16, OS_LOG_TYPE_DEBUG, "%25s:%-5d SetAUParam: parameter=%d server=%p au=%p scope=%d element=%d\n", buf, 0x38u);
      v18 = v24;
      if (!v15)
        goto LABEL_12;
      goto LABEL_11;
    }
LABEL_10:
    v18 = &v23;
    if (!v15)
    {
LABEL_12:
      v17 = *((_DWORD *)v18 + 6);
      _Block_object_dispose(&v23, 8);
      return v17;
    }
LABEL_11:
    *((_DWORD *)v18 + 6) = 1953461620;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3052000000;
    *(_QWORD *)v28 = __Block_byref_object_copy__128;
    *(_QWORD *)&v28[8] = __Block_byref_object_dispose__129;
    *(_QWORD *)&v28[16] = 0;
    *(_QWORD *)&v28[16] = dispatch_semaphore_create(0);
    objc_msgSend(v15, "addSema:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
    v19 = (void *)objc_msgSend(v15, "proxyInterface");
    v20 = -[AUPBClientManager auHandleFromRef:](self, "auHandleFromRef:", a5);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __75__AUPBClientManager_setAUParameter_onServer_audioUnit_scope_element_value___block_invoke;
    v22[3] = &unk_1E29215F0;
    v22[4] = &v23;
    v22[5] = buf;
    v22[6] = v15;
    objc_msgSend(v19, "setAudioUnit:parameter:onScope:element:value:withReply:", v20, v13, v10, v9, v22, COERCE_DOUBLE((unint64_t)LODWORD(a8)));
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)&buf[8] + 40), 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(*(dispatch_object_t *)(*(_QWORD *)&buf[8] + 40));
    _Block_object_dispose(buf, 8);
    v18 = v24;
    goto LABEL_12;
  }
  return 560295540;
}

- (int)getSerialAUProperty:(unsigned int)a3 onServer:(OpaqueAUPBServer *)a4 audioUnit:(OpaqueRemoteAudioUnit *)a5 scope:(unsigned int)a6 element:(unsigned int)a7 inData:(id *)a8
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v13;
  id v15;
  NSObject *v16;
  int v17;
  uint64_t *v18;
  void *v19;
  uint64_t v20;
  _QWORD v22[8];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int v26;
  _BYTE buf[24];
  _BYTE v28[26];
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (self->mConnectionAcknowledged)
  {
    v9 = *(_QWORD *)&a7;
    v10 = *(_QWORD *)&a6;
    v13 = *(_QWORD *)&a3;
    v15 = -[AUPBClientManager serverFromRef:](self, "serverFromRef:", a4);
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 1936881215;
    if (gLogScope)
    {
      v16 = *(NSObject **)gLogScope;
      if (!*(_QWORD *)gLogScope)
        goto LABEL_10;
    }
    else
    {
      v16 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136316674;
      *(_QWORD *)&buf[4] = "AUPBClientManager.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 776;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v13;
      *(_WORD *)v28 = 2048;
      *(_QWORD *)&v28[2] = a4;
      *(_WORD *)&v28[10] = 2048;
      *(_QWORD *)&v28[12] = a5;
      *(_WORD *)&v28[20] = 1024;
      *(_DWORD *)&v28[22] = v10;
      v29 = 1024;
      v30 = v9;
      _os_log_impl(&dword_18EE07000, v16, OS_LOG_TYPE_DEBUG, "%25s:%-5d GetAUPropSerial: property=%d server=%p au=%p scope=%d element=%d\n", buf, 0x38u);
      v18 = v24;
      if (!v15)
        goto LABEL_12;
      goto LABEL_11;
    }
LABEL_10:
    v18 = &v23;
    if (!v15)
    {
LABEL_12:
      v17 = *((_DWORD *)v18 + 6);
      _Block_object_dispose(&v23, 8);
      return v17;
    }
LABEL_11:
    *((_DWORD *)v18 + 6) = 1953461620;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3052000000;
    *(_QWORD *)v28 = __Block_byref_object_copy__128;
    *(_QWORD *)&v28[8] = __Block_byref_object_dispose__129;
    *(_QWORD *)&v28[16] = 0;
    *(_QWORD *)&v28[16] = dispatch_semaphore_create(0);
    objc_msgSend(v15, "addSema:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
    v19 = (void *)objc_msgSend(v15, "proxyInterface");
    v20 = -[AUPBClientManager auHandleFromRef:](self, "auHandleFromRef:", a5);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __81__AUPBClientManager_getSerialAUProperty_onServer_audioUnit_scope_element_inData___block_invoke;
    v22[3] = &unk_1E2921690;
    v22[4] = v15;
    v22[5] = &v23;
    v22[6] = buf;
    v22[7] = a8;
    objc_msgSend(v19, "getAudioUnit:property:onScope:element:inReply:", v20, v13, v10, v9, v22);
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)&buf[8] + 40), 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(*(dispatch_object_t *)(*(_QWORD *)&buf[8] + 40));
    _Block_object_dispose(buf, 8);
    v18 = v24;
    goto LABEL_12;
  }
  return 560295540;
}

- (int)setSerialAUProperty:(unsigned int)a3 onServer:(OpaqueAUPBServer *)a4 audioUnit:(OpaqueRemoteAudioUnit *)a5 scope:(unsigned int)a6 element:(unsigned int)a7 toData:(id)a8
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v13;
  id v15;
  NSObject *v16;
  int v17;
  uint64_t *v18;
  void *v19;
  uint64_t v20;
  _QWORD v22[7];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int v26;
  _BYTE buf[24];
  _BYTE v28[26];
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (self->mConnectionAcknowledged)
  {
    v9 = *(_QWORD *)&a7;
    v10 = *(_QWORD *)&a6;
    v13 = *(_QWORD *)&a3;
    v15 = -[AUPBClientManager serverFromRef:](self, "serverFromRef:", a4);
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 1936881215;
    if (gLogScope)
    {
      v16 = *(NSObject **)gLogScope;
      if (!*(_QWORD *)gLogScope)
        goto LABEL_10;
    }
    else
    {
      v16 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136316674;
      *(_QWORD *)&buf[4] = "AUPBClientManager.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 806;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v13;
      *(_WORD *)v28 = 2048;
      *(_QWORD *)&v28[2] = a4;
      *(_WORD *)&v28[10] = 2048;
      *(_QWORD *)&v28[12] = a5;
      *(_WORD *)&v28[20] = 1024;
      *(_DWORD *)&v28[22] = v10;
      v29 = 1024;
      v30 = v9;
      _os_log_impl(&dword_18EE07000, v16, OS_LOG_TYPE_DEBUG, "%25s:%-5d SetAUPropSerial: property=%d server=%p au=%p scope=%d element=%d\n", buf, 0x38u);
      v18 = v24;
      if (!v15)
        goto LABEL_12;
      goto LABEL_11;
    }
LABEL_10:
    v18 = &v23;
    if (!v15)
    {
LABEL_12:
      v17 = *((_DWORD *)v18 + 6);
      _Block_object_dispose(&v23, 8);
      return v17;
    }
LABEL_11:
    *((_DWORD *)v18 + 6) = 1953461620;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3052000000;
    *(_QWORD *)v28 = __Block_byref_object_copy__128;
    *(_QWORD *)&v28[8] = __Block_byref_object_dispose__129;
    *(_QWORD *)&v28[16] = 0;
    *(_QWORD *)&v28[16] = dispatch_semaphore_create(0);
    objc_msgSend(v15, "addSema:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
    v19 = (void *)objc_msgSend(v15, "proxyInterface");
    v20 = -[AUPBClientManager auHandleFromRef:](self, "auHandleFromRef:", a5);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __81__AUPBClientManager_setSerialAUProperty_onServer_audioUnit_scope_element_toData___block_invoke;
    v22[3] = &unk_1E29215F0;
    v22[4] = &v23;
    v22[5] = buf;
    v22[6] = v15;
    objc_msgSend(v19, "setAudioUnit:property:onScope:element:value:withReply:", v20, v13, v10, v9, a8, v22);
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)&buf[8] + 40), 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(*(dispatch_object_t *)(*(_QWORD *)&buf[8] + 40));
    _Block_object_dispose(buf, 8);
    v18 = v24;
    goto LABEL_12;
  }
  return 560295540;
}

- (void).cxx_destruct
{
  NewServerListener *begin;
  PropertyListener *v4;

  begin = self->mNewServerListeners.__begin_;
  if (begin)
  {
    self->mNewServerListeners.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->mPropertyListeners.__begin_;
  if (v4)
  {
    self->mPropertyListeners.__end_ = v4;
    operator delete(v4);
  }
}

- (id).cxx_construct
{
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 2) = 0u;
  return self;
}

intptr_t __81__AUPBClientManager_setSerialAUProperty_onServer_audioUnit_scope_element_toData___block_invoke(uint64_t a1, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_msgSend(*(id *)(a1 + 48), "removeSema:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

intptr_t __81__AUPBClientManager_getSerialAUProperty_onServer_audioUnit_scope_element_inData___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  void *v4;
  id v5;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  **(_QWORD **)(a1 + 56) = a3;
  v4 = **(void ***)(a1 + 56);
  if (v4)
    v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "removeSema:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
}

intptr_t __75__AUPBClientManager_setAUParameter_onServer_audioUnit_scope_element_value___block_invoke(uint64_t a1, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_msgSend(*(id *)(a1 + 48), "removeSema:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

intptr_t __85__AUPBClientManager_getAUParameter_onServer_audioUnit_scope_element_copiedIntoValue___block_invoke(uint64_t a1, int a2, float a3)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  **(float **)(a1 + 56) = a3;
  objc_msgSend(*(id *)(a1 + 32), "removeSema:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
}

intptr_t __83__AUPBClientManager_setAUProperty_onServer_audioUnit_scope_element_withValue_size___block_invoke(uint64_t a1, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_msgSend(*(id *)(a1 + 48), "removeSema:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

intptr_t __93__AUPBClientManager_getAUProperty_onServer_audioUnit_scope_element_copiedIntoBufer_withSize___block_invoke(uint64_t a1, int a2, void *a3)
{
  const void *v5;
  _QWORD v7[6];

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  if (a3 && !*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v5 = (const void *)objc_msgSend(a3, "bytes");
    objc_msgSend(a3, "length");
    PropertyMarshaller::PropertyMarshaller((PropertyMarshaller *)v7, v5);
    v7[0] = &off_1E2909C60;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = PropertyMarshaller::Deserialize();
    PropertyMarshaller::~PropertyMarshaller((PropertyMarshaller *)v7);
  }
  objc_msgSend(*(id *)(a1 + 32), "removeSema:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
}

intptr_t __95__AUPBClientManager_getAUPropertyInfo_onServer_audioUnit_scope_element_intoDataSize_writeable___block_invoke(uint64_t a1, int a2, int a3, char a4)
{
  _DWORD *v5;
  _BYTE *v6;
  int v7;
  int v8;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  v5 = *(_DWORD **)(a1 + 56);
  if (v5)
    *v5 = a3;
  v6 = *(_BYTE **)(a1 + 64);
  if (v6)
    *v6 = a4;
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v7 = *(_DWORD *)(a1 + 72);
    v8 = 8;
    if (v7 <= 23)
    {
      if (v7)
      {
        if (v7 == 4)
        {
          v8 = 104;
        }
        else if (v7 != 16)
        {
          goto LABEL_19;
        }
      }
LABEL_18:
      **(_DWORD **)(a1 + 56) = v8;
    }
    else
    {
      switch(v7)
      {
        case 24:
        case 25:
        case 30:
          goto LABEL_18;
        case 26:
        case 27:
        case 28:
        case 29:
        case 31:
        case 32:
        case 37:
          break;
        case 33:
        case 38:
          v8 = 24;
          goto LABEL_18;
        case 34:
        case 35:
        case 36:
          v8 = 16;
          goto LABEL_18;
        default:
          if (v7 == 50 || v7 == 54)
            goto LABEL_18;
          break;
      }
    }
  }
LABEL_19:
  objc_msgSend(*(id *)(a1 + 32), "removeSema:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
}

intptr_t __56__AUPBClientManager_setPBProperty_onServer_block_value___block_invoke(uint64_t a1, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_msgSend(*(id *)(a1 + 48), "removeSema:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

intptr_t __61__AUPBClientManager_copyPBProperty_onServer_block_intoValue___block_invoke(uint64_t a1, int a2, CFDataRef data)
{
  int v4;
  const __CFData *v5;
  const UInt8 *v6;
  unint64_t v7;
  uint64_t *v8;
  char *v9;
  const __CFData *v10;
  const UInt8 *BytePtr;
  unint64_t Length;
  uint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  const UInt8 *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  __int128 v25;
  uint64_t *v26;
  CFDataRef v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  char *v37;
  uint64_t *v38;
  uint64_t v39;
  __int128 v41;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  **(_QWORD **)(a1 + 64) = CFPropertyListCreateWithData(0, data, 0, 0, 0);
  v4 = *(_DWORD *)(a1 + 72);
  if (v4 == 1651272556)
  {
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      goto LABEL_56;
    v10 = **(const __CFData ***)(a1 + 64);
    if (!v10)
      goto LABEL_56;
    BytePtr = CFDataGetBytePtr(v10);
    Length = CFDataGetLength(**(CFDataRef **)(a1 + 64));
    if (Length >= 4)
    {
      v8 = 0;
      v28 = 0;
      v29 = 0;
      v30 = 0;
      v31 = Length >> 2;
      do
      {
        v32 = objc_msgSend(*(id *)(a1 + 32), "aupbRefFromHandle:", *(unsigned int *)&BytePtr[4 * v30]);
        v33 = v32;
        if (v28 >= v29)
        {
          v34 = v28 - v8;
          v35 = v34 + 1;
          if ((unint64_t)(v34 + 1) >> 61)
            std::vector<float>::__throw_length_error[abi:ne180100]();
          if (((char *)v29 - (char *)v8) >> 2 > v35)
            v35 = ((char *)v29 - (char *)v8) >> 2;
          if ((unint64_t)((char *)v29 - (char *)v8) >= 0x7FFFFFFFFFFFFFF8)
            v36 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v36 = v35;
          if (v36)
          {
            if (v36 >> 61)
              std::__throw_bad_array_new_length[abi:ne180100]();
            v37 = (char *)operator new(8 * v36);
          }
          else
          {
            v37 = 0;
          }
          v38 = (uint64_t *)&v37[8 * v34];
          *v38 = v33;
          v13 = v38 + 1;
          while (v28 != v8)
          {
            v39 = *--v28;
            *--v38 = v39;
          }
          v29 = (uint64_t *)&v37[8 * v36];
          if (v8)
            operator delete(v8);
          v8 = v38;
        }
        else
        {
          *v28 = v32;
          v13 = v28 + 1;
        }
        ++v30;
        v28 = v13;
      }
      while (v30 != v31);
    }
    else
    {
      v8 = 0;
      v13 = 0;
    }
    CFRelease(**(CFTypeRef **)(a1 + 64));
    v27 = CFDataCreate(0, (const UInt8 *)v8, (char *)v13 - (char *)v8);
  }
  else
  {
    if (v4 != 1635087726)
      goto LABEL_56;
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      goto LABEL_56;
    v5 = **(const __CFData ***)(a1 + 64);
    if (!v5)
      goto LABEL_56;
    v6 = CFDataGetBytePtr(v5);
    v7 = CFDataGetLength(**(CFDataRef **)(a1 + 64));
    if (v7 >= 0x10)
    {
      v8 = 0;
      v9 = 0;
      v14 = 0;
      v15 = 0;
      v16 = v7 >> 4;
      do
      {
        v17 = &v6[16 * v15];
        *(_QWORD *)&v41 = *(_QWORD *)v17;
        DWORD2(v41) = *((_DWORD *)v17 + 2);
        v18 = objc_msgSend(*(id *)(a1 + 32), "auRefFromHandle:", *((unsigned int *)v17 + 3));
        v19 = v18;
        if ((unint64_t)v9 >= v14)
        {
          v20 = 0xAAAAAAAAAAAAAAABLL * ((v9 - (char *)v8) >> 3) + 1;
          if (v20 > 0xAAAAAAAAAAAAAAALL)
            std::vector<float>::__throw_length_error[abi:ne180100]();
          if (0x5555555555555556 * ((uint64_t)(v14 - (_QWORD)v8) >> 3) > v20)
            v20 = 0x5555555555555556 * ((uint64_t)(v14 - (_QWORD)v8) >> 3);
          if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v14 - (_QWORD)v8) >> 3) >= 0x555555555555555)
            v21 = 0xAAAAAAAAAAAAAAALL;
          else
            v21 = v20;
          if (v21)
            v21 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<RemoteAUPropertyListeners::AUPropertyListener>>(v21);
          else
            v22 = 0;
          v23 = v21 + 8 * ((v9 - (char *)v8) >> 3);
          *(_OWORD *)v23 = v41;
          *(_QWORD *)(v23 + 16) = v19;
          if (v9 == (char *)v8)
          {
            v26 = (uint64_t *)(v21 + 8 * ((v9 - (char *)v8) >> 3));
          }
          else
          {
            v24 = v21 + 8 * ((v9 - (char *)v8) >> 3);
            do
            {
              v25 = *(_OWORD *)(v9 - 24);
              v26 = (uint64_t *)(v24 - 24);
              *(_QWORD *)(v24 - 8) = *((_QWORD *)v9 - 1);
              *(_OWORD *)(v24 - 24) = v25;
              v9 -= 24;
              v24 -= 24;
            }
            while (v9 != (char *)v8);
          }
          v14 = v21 + 24 * v22;
          v9 = (char *)(v23 + 24);
          if (v8)
            operator delete(v8);
          v8 = v26;
        }
        else
        {
          *(_OWORD *)v9 = v41;
          *((_QWORD *)v9 + 2) = v18;
          v9 += 24;
        }
        ++v15;
      }
      while (v15 != v16);
    }
    else
    {
      v8 = 0;
      v9 = 0;
    }
    CFRelease(**(CFTypeRef **)(a1 + 64));
    v27 = CFDataCreate(0, (const UInt8 *)v8, v9 - (char *)v8);
  }
  **(_QWORD **)(a1 + 64) = v27;
  if (v8)
    operator delete(v8);
LABEL_56:
  objc_msgSend(*(id *)(a1 + 40), "removeSema:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
}

void __55__AUPBClientManager_addNewServerListener_withUserData___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(_QWORD, uint64_t))(a1 + 40))(*(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "ref"));
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

uint64_t __73__AUPBClientManager_processingBlock_propertiesChanged_withQualifierData___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = 40;
  if (!*(_DWORD *)(a1 + 112))
    v1 = 64;
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 96))(*(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 72), objc_msgSend(*(id *)(a1 + 32), "aupbRefFromHandle:", *(unsigned int *)(a1 + 116)), *(unsigned int *)(a1 + 120), *(_QWORD *)(a1 + v1), *(unsigned int *)(a1 + 112));
}

uint64_t __53__AUPBClientManager_processingBlock_propertyChanged___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 56))(*(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), 0, 0);
}

id *__36__AUPBClientManager_newServerAdded___block_invoke(uint64_t a1)
{
  id *result;
  id *v3;
  id *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  result = (id *)objc_loadWeak((id *)(a1 + 32));
  if (!result)
    return result;
  v3 = result;
  result = (id *)objc_loadWeak((id *)(a1 + 40));
  if (!result)
    return result;
  v4 = result;
  objc_msgSend(result, "signalAllSemaphores");
  objc_msgSend(v3[3], "removeObject:", v4);
  if (!gLogScope)
  {
    v5 = MEMORY[0x1E0C81028];
LABEL_7:
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = objc_msgSend((id)objc_msgSend(v4, "description"), "UTF8String");
      v7 = objc_msgSend(v3[3], "count");
      v14 = 136315906;
      v15 = "AUPBClientManager.mm";
      v16 = 1024;
      v17 = 261;
      v18 = 2080;
      v19 = v6;
      v20 = 2048;
      v21 = v7;
      _os_log_impl(&dword_18EE07000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d Remote server %s invalidated, now have %lu servers\n", (uint8_t *)&v14, 0x26u);
    }
    goto LABEL_9;
  }
  v5 = *(NSObject **)gLogScope;
  if (*(_QWORD *)gLogScope)
    goto LABEL_7;
LABEL_9:
  v8 = v3[4];
  v9 = v3[5];
  if (v8 != v9)
  {
    v10 = v8 + 4;
    do
    {
      v11 = v10 - 4;
      if (*(v10 - 4) == *(_QWORD *)(a1 + 48) && *(v10 - 3) == 0 && *((_DWORD *)v10 - 4) == 1684628836)
        ((void (*)(_QWORD))*(v10 - 1))(*v10);
      v10 += 5;
    }
    while (v11 + 5 != v9);
  }
  return (id *)objc_msgSend(v3, "removePropertyListenersForServer:", *(_QWORD *)(a1 + 48));
}

id *__36__AUPBClientManager_newServerAdded___block_invoke_125(uint64_t a1)
{
  id *result;
  id *v3;
  id *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  result = (id *)objc_loadWeak((id *)(a1 + 32));
  if (!result)
    return result;
  v3 = result;
  result = (id *)objc_loadWeak((id *)(a1 + 40));
  if (!result)
    return result;
  v4 = result;
  objc_msgSend(result, "signalAllSemaphores");
  objc_msgSend(v3[3], "removeObject:", v4);
  if (!gLogScope)
  {
    v5 = MEMORY[0x1E0C81028];
LABEL_7:
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = objc_msgSend((id)objc_msgSend(v4, "description"), "UTF8String");
      v7 = objc_msgSend(v3[3], "count");
      v14 = 136315906;
      v15 = "AUPBClientManager.mm";
      v16 = 1024;
      v17 = 277;
      v18 = 2080;
      v19 = v6;
      v20 = 2048;
      v21 = v7;
      _os_log_impl(&dword_18EE07000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d Remote server %s interrupted, now have %lu servers\n", (uint8_t *)&v14, 0x26u);
    }
    goto LABEL_9;
  }
  v5 = *(NSObject **)gLogScope;
  if (*(_QWORD *)gLogScope)
    goto LABEL_7;
LABEL_9:
  v8 = v3[4];
  v9 = v3[5];
  if (v8 != v9)
  {
    v10 = v8 + 4;
    do
    {
      v11 = v10 - 4;
      if (*(v10 - 4) == *(_QWORD *)(a1 + 48) && *(v10 - 3) == 0 && *((_DWORD *)v10 - 4) == 1684628836)
        ((void (*)(_QWORD))*(v10 - 1))(*v10);
      v10 += 5;
    }
    while (v11 + 5 != v9);
  }
  return (id *)objc_msgSend(v3, "removePropertyListenersForServer:", *(_QWORD *)(a1 + 48));
}

uint64_t __36__AUPBClientManager_newServerAdded___block_invoke_126(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, _QWORD);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 40));

  result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "xpcConnection"), "resume");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(v3 + 56);
  v5 = *(_QWORD *)(v3 + 64);
  while (v4 != v5)
  {
    v7 = *(uint64_t (**)(uint64_t, _QWORD))v4;
    v6 = *(_QWORD *)(v4 + 8);
    v4 += 16;
    result = v7(v6, *(_QWORD *)(a1 + 48));
  }
  return result;
}

uint64_t __41__AUPBClientManager_handleRegistrarCrash__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startRegistarConnection");
}

uint64_t __44__AUPBClientManager_startRegistarConnection__block_invoke(uint64_t a1)
{
  return objc_msgSend(objc_loadWeak((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40)), "handleRegistrarCrash");
}

uint64_t __44__AUPBClientManager_startRegistarConnection__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(objc_loadWeak((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40)), "handleRegistrarCrash");
}

void __44__AUPBClientManager_startRegistarConnection__block_invoke_97(uint64_t a1, void *a2)
{
  uint64_t v4;
  char v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v4 = objc_msgSend(a2, "code");
    v5 = 1;
    if (v4 && v4 != 3)
    {
      if (v4 != 1)
        goto LABEL_7;
      v5 = 0;
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 101) = v5;
  }
LABEL_7:
  if (gLogScope)
  {
    v6 = *(NSObject **)gLogScope;
    if (!*(_QWORD *)gLogScope)
      return;
  }
  else
  {
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = 136315650;
    v8 = "AUPBClientManager.mm";
    v9 = 1024;
    v10 = 210;
    v11 = 2080;
    v12 = objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
    _os_log_impl(&dword_18EE07000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", (uint8_t *)&v7, 0x1Cu);
  }
}

void __44__AUPBClientManager_startRegistarConnection__block_invoke_3(uint64_t a1, void *a2)
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (gLogScope)
  {
    v3 = *(NSObject **)gLogScope;
    if (!*(_QWORD *)gLogScope)
      return;
  }
  else
  {
    v3 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315650;
    v5 = "AUPBClientManager.mm";
    v6 = 1024;
    v7 = 190;
    v8 = 2080;
    v9 = objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
    _os_log_impl(&dword_18EE07000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", (uint8_t *)&v4, 0x1Cu);
  }
}

@end
