@implementation BKSTouchEventService

- (id)registerSceneHostSettings:(id)a3 forCAContextID:(unsigned int)a4
{
  id v7;
  BKSSceneHostRegistration *v8;
  id v9;
  BKSTouchEventService *v10;
  BKSTouchEventService *v11;
  objc_super v13;

  v7 = a3;
  -[BKSTouchEventService _connectToService](self, "_connectToService");
  v8 = [BKSSceneHostRegistration alloc];
  v9 = v7;
  v10 = self;
  if (v8)
  {
    v13.receiver = v8;
    v13.super_class = (Class)BKSSceneHostRegistration;
    v11 = -[BKSTouchEventService init](&v13, sel_init);
    v8 = (BKSSceneHostRegistration *)v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_connection, self);
      objc_storeStrong((id *)&v8->_sceneHostSettings, a3);
      v8->_contextID = a4;
    }
  }

  -[BKSTouchEventService _updateRegistration:]((uint64_t)v10, v8);
  return v8;
}

- (void)_updateRegistration:(uint64_t)a1
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD *v15;

  v3 = a2;
  if (a1)
  {
    v15 = v3;
    objc_msgSend((id)a1, "_connectToService");
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if (v15)
      v4 = *((unsigned int *)v15 + 2);
    else
      v4 = 0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_QWORD *)(a1 + 32))
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v7 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v6;

      v8 = *(void **)(a1 + 32);
    }
    else
    {
      v8 = 0;
    }
    objc_msgSend(v8, "objectForKey:", v5);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99E10]);
      v10 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v9, v11);

    }
    objc_msgSend(v9, "removeObject:", v15);
    objc_msgSend(v9, "addObject:", v15);
    if (v15)
      v12 = (void *)v15[3];
    else
      v12 = 0;
    v13 = v12;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 16), "remoteTarget");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSceneHostSettings:forContextID:", v13, v5);

    v3 = v15;
  }

}

- (void)_connectToService
{
  os_unfair_lock_s *p_connectionLock;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  p_connectionLock = &self->_connectionLock;
  os_unfair_lock_lock(&self->_connectionLock);
  if (self->_connection)
  {
    os_unfair_lock_unlock(p_connectionLock);
  }
  else
  {
    +[BKSHIDServiceConnection clientConnectionForServiceWithName:](BKSHIDServiceConnection, "clientConnectionForServiceWithName:", CFSTR("BKTouchEvents"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_storeStrong((id *)&self->_connection, v5);
      os_unfair_lock_unlock(p_connectionLock);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __41__BKSTouchEventService__connectToService__block_invoke;
      v12[3] = &unk_1E1EA1868;
      v12[4] = self;
      objc_msgSend(v5, "configureConnection:", v12);
      BKLogTouchEvents();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_18A0F0000, v6, OS_LOG_TYPE_DEBUG, "activating connection to server", buf, 2u);
      }

      objc_msgSend(v5, "activate");
      BKLogTouchEvents();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v5, "remoteTarget");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v14 = v11;
        _os_log_debug_impl(&dword_18A0F0000, v7, OS_LOG_TYPE_DEBUG, "server remote target %{public}@", buf, 0xCu);

      }
      objc_msgSend(v5, "remoteTarget");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKSTouchEventService.m"), 371, CFSTR("we must have a remote target"));

      }
    }
    else
    {
      BKLogTouchEvents();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_18A0F0000, v10, OS_LOG_TYPE_ERROR, "cannot get connection for service", buf, 2u);
      }

      os_unfair_lock_unlock(p_connectionLock);
    }

  }
}

+ (BKSTouchEventService)sharedInstance
{
  if (sharedInstance_onceToken_10436 != -1)
    dispatch_once(&sharedInstance_onceToken_10436, &__block_literal_global_104);
  return (BKSTouchEventService *)(id)sharedInstance_service_10437;
}

- (BKSTouchEventService)init
{
  BKSTouchEventService *v2;
  BKSTouchEventService *v3;
  objc_class *v4;
  void *v5;
  uint64_t SerialWithQoS;
  OS_dispatch_queue *requestQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BKSTouchEventService;
  v2 = -[BKSTouchEventService init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_connectionLock._os_unfair_lock_opaque = 0;
    v2->_registrationLock._os_unfair_lock_opaque = 0;
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    SerialWithQoS = BSDispatchQueueCreateSerialWithQoS();
    requestQueue = v3->_requestQueue;
    v3->_requestQueue = (OS_dispatch_queue *)SerialWithQoS;

  }
  return v3;
}

- (void)addTouchAuthenticationSpecifications:(id)a3 forReason:(id)a4
{
  int v4;
  id v5;

  objc_msgSend(a3, "bs_secureEncoded");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  _BKSHIDTouchAddAuthenticationSpecifications(v4, objc_msgSend(v5, "bs_bytesForMIG"), objc_msgSend(v5, "bs_lengthForMIG"));

}

- (id)addAuthenticationSpecifications:(id)a3 forReason:(id)a4
{
  void *v4;
  int v5;
  _BKSLocallyOwnedTouchAuthenticationAssertion *v6;

  objc_msgSend(a3, "bs_secureEncoded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  _BKSHIDTouchAddAuthenticationSpecifications(v5, objc_msgSend(v4, "bs_bytesForMIG"), objc_msgSend(v4, "bs_lengthForMIG"));
  v6 = objc_alloc_init(_BKSLocallyOwnedTouchAuthenticationAssertion);

  return v6;
}

- (CATransform3D)transformForDisplayUUID:(SEL)a3 layerID:(id)a4 contextID:(unint64_t)a5
{
  uint64_t v6;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  CATransform3D *result;
  int v17;
  id v18;
  __int16 v19;
  int v20;
  __int16 v21;
  unint64_t v22;
  uint64_t v23;

  v6 = *(_QWORD *)&a6;
  v23 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  -[BKSTouchEventService _connectToService](self, "_connectToService");
  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "transform3DForDisplayUUID:layerID:contextID:", v10, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    *(_OWORD *)&retstr->m41 = 0u;
    *(_OWORD *)&retstr->m43 = 0u;
    *(_OWORD *)&retstr->m31 = 0u;
    *(_OWORD *)&retstr->m33 = 0u;
    *(_OWORD *)&retstr->m21 = 0u;
    *(_OWORD *)&retstr->m23 = 0u;
    *(_OWORD *)&retstr->m11 = 0u;
    *(_OWORD *)&retstr->m13 = 0u;
    objc_msgSend(v14, "transform");
  }
  else
  {
    BKLogMousePointer();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v17 = 138543874;
      v18 = v10;
      v19 = 1024;
      v20 = v6;
      v21 = 2048;
      v22 = a5;
      _os_log_error_impl(&dword_18A0F0000, v15, OS_LOG_TYPE_ERROR, "cannot get transform for display:%{public}@ context:%X layer:%llX", (uint8_t *)&v17, 0x1Cu);
    }

    *(_OWORD *)&retstr->m22 = 0u;
    *(_OWORD *)&retstr->m32 = 0u;
    *(_OWORD *)&retstr->m42 = 0u;
    *(_OWORD *)&retstr->m34 = 0u;
    *(_OWORD *)&retstr->m24 = 0u;
    *(_OWORD *)&retstr->m14 = 0u;
    *(_OWORD *)&retstr->m12 = 0u;
    retstr->m11 = 1.0;
    retstr->m22 = 1.0;
    retstr->m33 = 1.0;
    retstr->m44 = 1.0;
  }

  return result;
}

- (void)_repostAllRegistrations
{
  os_unfair_lock_s *p_registrationLock;
  id v4;
  uint64_t v5;
  NSMutableDictionary *registrationLock_registrationsByContextID;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  p_registrationLock = &self->_registrationLock;
  os_unfair_lock_lock(&self->_registrationLock);
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = MEMORY[0x1E0C809B0];
  registrationLock_registrationsByContextID = self->_registrationLock_registrationsByContextID;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__BKSTouchEventService__repostAllRegistrations__block_invoke;
  v11[3] = &unk_1E1EA17B0;
  v12 = v4;
  v8 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](registrationLock_registrationsByContextID, "enumerateKeysAndObjectsUsingBlock:", v11);
  os_unfair_lock_unlock(p_registrationLock);
  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __47__BKSTouchEventService__repostAllRegistrations__block_invoke_2;
  v9[3] = &unk_1E1EA17D8;
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v10;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v9);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrationLock_registrationsByContextID, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
}

void __41__BKSTouchEventService__connectToService__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[16];

  v3 = a2;
  BKLogTouchEvents();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_18A0F0000, v4, OS_LOG_TYPE_DEBUG, "configured client service", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EDF637E0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EDF665C0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D03430], "interfaceWithIdentifier:", CFSTR("BKTouchEvents"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setServer:", v6);
  objc_msgSend(v7, "setClient:", v5);
  objc_msgSend(v3, "setInterface:", v7);
  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(MEMORY[0x1E0D03478], "userInitiated");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v8);

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__BKSTouchEventService__connectToService__block_invoke_126;
  v9[3] = &unk_1E1EA1800;
  v9[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "setInterruptionHandler:", v9);
  objc_msgSend(v3, "setInvalidationHandler:", &__block_literal_global_129);

}

uint64_t __41__BKSTouchEventService__connectToService__block_invoke_126(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  BKLogTouchEvents();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_error_impl(&dword_18A0F0000, v2, OS_LOG_TYPE_ERROR, "service interruption -- attempting to reconnect", v4, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "activate");
  return objc_msgSend(*(id *)(a1 + 32), "_repostAllRegistrations");
}

void __41__BKSTouchEventService__connectToService__block_invoke_128()
{
  NSObject *v0;
  uint8_t v1[16];

  BKLogTouchEvents();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_error_impl(&dword_18A0F0000, v0, OS_LOG_TYPE_ERROR, "backboardd must be going down, ignoring", v1, 2u);
  }

}

void __47__BKSTouchEventService__repostAllRegistrations__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "lastObject");
  v6 = objc_claimAutoreleasedReturnValue();
  v8 = (id)v6;
  if (v6)
    v7 = *(_QWORD *)(v6 + 24);
  else
    v7 = 0;
  objc_msgSend(v4, "setObject:forKey:", v7, v5);

}

uint64_t __47__BKSTouchEventService__repostAllRegistrations__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSceneHostSettings:forContextID:", a3, a2);
}

void __38__BKSTouchEventService_sharedInstance__block_invoke()
{
  BKSTouchEventService *v0;
  void *v1;

  v0 = objc_alloc_init(BKSTouchEventService);
  v1 = (void *)sharedInstance_service_10437;
  sharedInstance_service_10437 = (uint64_t)v0;

}

@end
