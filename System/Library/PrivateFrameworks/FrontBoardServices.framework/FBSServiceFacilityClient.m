@implementation FBSServiceFacilityClient

uint64_t __49__FBSServiceFacilityClient_initWithConfigurator___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "encodeObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), CFSTR("fbs_facilityID"));
}

- (NSString)identifier
{
  return self->_facilityID;
}

uint64_t __83__FBSServiceFacilityClient_sendMessage_withType_replyHandler_waitForReply_timeout___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (BSServiceConnectionEndpoint)defaultShellEndpoint
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  objc_msgSend(off_1E38E9E20, "environmentAliases");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E38E9E68, "defaultShellMachName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveMachService:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBSSystemServiceSpecification identifier](FBSSystemServiceSpecification, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E38E9E68, "endpointForMachName:service:instance:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    +[FBSSystemServiceSpecification identifier](FBSSystemServiceSpecification, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E38E9E68, "nullEndpointForService:instance:", v9, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (BSServiceConnectionEndpoint *)v8;
}

- (void)setEndpoint:(id)a3
{
  BSServiceConnectionEndpoint *v4;
  BSServiceConnectionEndpoint *v5;
  void *v6;
  void *v7;
  char v8;
  BSServiceConnectionEndpoint *endpoint;
  void *v10;
  void *v11;

  v4 = (BSServiceConnectionEndpoint *)a3;
  if (self->_configured)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("untimely configuration call"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSServiceFacilityClient setEndpoint:].cold.3();
LABEL_13:
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6EEB6CLL);
  }
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("endpoint"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSServiceFacilityClient setEndpoint:].cold.1();
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6EEBD0);
  }
  -[BSServiceConnectionEndpoint service](v4, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBSSystemServiceSpecification identifier](FBSSystemServiceSpecification, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if ((v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("the endpoint specifies an incompatible service : endpoint=%@"), v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSServiceFacilityClient setEndpoint:].cold.2();
    goto LABEL_13;
  }
  endpoint = self->_endpoint;
  self->_endpoint = v5;

}

- (FBSServiceFacilityClient)initWithConfigurator:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  FBSServiceFacilityClient *v6;
  NSString *facilityID;
  uint64_t v8;
  BSServiceQuality *serviceQuality;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  OS_dispatch_queue *calloutQueue;
  NSObject *v16;
  BSServiceConnectionEndpoint *endpoint;
  BSServiceConnectionEndpoint *v18;
  uint64_t v19;
  FBSServiceFacilityClient *v20;
  uint64_t v21;
  BSServiceConnection *lock_connection;
  BSServiceConnection *v23;
  id v24;
  id v25;
  id configOnly_interfaceTarget;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  FBSServiceFacilityClient *v34;
  id v35;
  _QWORD v36[4];
  FBSServiceFacilityClient *v37;
  objc_super v38;
  uint8_t buf[4];
  BSServiceConnectionEndpoint *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("block"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSServiceFacilityClient initWithConfigurator:].cold.1();
    objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6EEFB4);
  }
  v5 = (void (**)(_QWORD, _QWORD))v4;
  v38.receiver = self;
  v38.super_class = (Class)FBSServiceFacilityClient;
  v6 = -[FBSServiceFacilityClient init](&v38, sel_init);
  if (v6)
  {
    ((void (**)(_QWORD, FBSServiceFacilityClient *))v5)[2](v5, v6);
    v6->_configured = 1;
    if (!v6->_endpoint)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("configuration error: endpoint was not specified"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSServiceFacilityClient initWithConfigurator:].cold.2();
      objc_msgSend(objc_retainAutorelease(v29), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A6EF00CLL);
    }
    facilityID = v6->_facilityID;
    if (!facilityID)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("configuration error: facilityID was not specified"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSServiceFacilityClient initWithConfigurator:].cold.3();
      objc_msgSend(objc_retainAutorelease(v30), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A6EF064);
    }
    if ((v6->_interface == 0) != (v6->_configOnly_interfaceTarget == 0))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("if an interface is specified you must also specify the target"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSServiceFacilityClient initWithConfigurator:].cold.4();
      objc_msgSend(objc_retainAutorelease(v31), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A6EF0BCLL);
    }
    v6->_lock._os_unfair_lock_opaque = 0;
    if (!v6->_serviceQuality)
    {
      objc_msgSend(off_1E38E9E80, "utility");
      v8 = objc_claimAutoreleasedReturnValue();
      serviceQuality = v6->_serviceQuality;
      v6->_serviceQuality = (BSServiceQuality *)v8;

      facilityID = v6->_facilityID;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FBSServiceFacilityClient:%@"), facilityID);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E38E9DF8, "serial");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "serviceClass:relativePriority:", -[BSServiceQuality serviceClass](v6->_serviceQuality, "serviceClass"), -[BSServiceQuality relativePriority](v6->_serviceQuality, "relativePriority"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6->_calloutQueue)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FBSServiceFacilityClientCallout:%@"), v6->_facilityID);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = BSDispatchQueueCreate();
      calloutQueue = v6->_calloutQueue;
      v6->_calloutQueue = (OS_dispatch_queue *)v14;

    }
    NSClassFromString(CFSTR("UISApplicationSupportClient"));
    v6->_uisHack = objc_opt_isKindOfClass() & 1;
    FBLogCommon();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      endpoint = v6->_endpoint;
      *(_DWORD *)buf = 138412290;
      v40 = endpoint;
      _os_log_impl(&dword_19A6D4000, v16, OS_LOG_TYPE_DEFAULT, "Creating service facility connection with %@", buf, 0xCu);
    }

    v18 = v6->_endpoint;
    v19 = MEMORY[0x1E0C809B0];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __49__FBSServiceFacilityClient_initWithConfigurator___block_invoke;
    v36[3] = &unk_1E38EDA60;
    v20 = v6;
    v37 = v20;
    objc_msgSend(off_1E38E9E60, "connectionWithEndpoint:clientContextBuilder:", v18, v36);
    v21 = objc_claimAutoreleasedReturnValue();
    lock_connection = v20->_lock_connection;
    v20->_lock_connection = (BSServiceConnection *)v21;

    v23 = v20->_lock_connection;
    v32[0] = v19;
    v32[1] = 3221225472;
    v32[2] = __49__FBSServiceFacilityClient_initWithConfigurator___block_invoke_2;
    v32[3] = &unk_1E38ECA08;
    v33 = v10;
    v34 = v20;
    v35 = v12;
    v24 = v12;
    v25 = v10;
    -[BSServiceConnection _configureConnection:](v23, "_configureConnection:", v32);
    configOnly_interfaceTarget = v6->_configOnly_interfaceTarget;
    v6->_configOnly_interfaceTarget = 0;

  }
  return v6;
}

void __49__FBSServiceFacilityClient_initWithConfigurator___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  _QWORD *v14;

  v3 = a2;
  objc_msgSend(v3, "setName:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setServiceQuality:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
  v4 = (void *)BSDispatchQueueCreate();
  objc_msgSend(v3, "setTargetQueue:", v4);

  v5 = *(_QWORD **)(a1 + 40);
  v6 = MEMORY[0x1E0C809B0];
  if (v5[4])
  {
    objc_msgSend(v3, "setInterface:");
    objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40));
  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __49__FBSServiceFacilityClient_initWithConfigurator___block_invoke_3;
    v13[3] = &unk_1E38EDA88;
    v14 = v5;
    objc_msgSend(v3, "setMessageHandler:", v13);

  }
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __49__FBSServiceFacilityClient_initWithConfigurator___block_invoke_4;
  v11[3] = &unk_1E38EDAB0;
  v12 = *(id *)(a1 + 40);
  objc_msgSend(v3, "setErrorHandler:", v11);
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __49__FBSServiceFacilityClient_initWithConfigurator___block_invoke_5;
  v9[3] = &unk_1E38EC9E0;
  v10 = *(id *)(a1 + 40);
  objc_msgSend(v3, "setInterruptionHandler:", v9);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __49__FBSServiceFacilityClient_initWithConfigurator___block_invoke_6;
  v7[3] = &unk_1E38EC9E0;
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v3, "setInvalidationHandler:", v7);

}

- (void)setIdentifier:(id)a3
{
  id v4;
  NSString *v5;
  NSString *facilityID;
  void *v7;
  id v8;

  v4 = a3;
  if (self->_configured)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("untimely configuration call"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSServiceFacilityClient setIdentifier:].cold.2();
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6EF9B8);
  }
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSServiceFacilityClient setIdentifier:].cold.1();
    goto LABEL_9;
  }
  v8 = v4;
  v5 = (NSString *)objc_msgSend(v4, "copy");
  facilityID = self->_facilityID;
  self->_facilityID = v5;

}

- (OS_dispatch_queue)calloutQueue
{
  return self->_calloutQueue;
}

- (void)sendMessage:(id)a3 withType:(int64_t)a4
{
  -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", a3, a4, 0, 0, 0.0);
}

uint64_t __49__FBSServiceFacilityClient_initWithConfigurator___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_handleMessage:");
}

- (void)activate
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[FBSServiceFacilityClient _lock_activate](self, "_lock_activate");
  os_unfair_lock_unlock(p_lock);
}

- (void)sendMessage:(id)a3 withType:(int64_t)a4 replyHandler:(id)a5 waitForReply:(BOOL)a6 timeout:(double)a7
{
  _BOOL4 v7;
  id v11;
  id v12;
  void *v13;
  BSServiceConnection *v14;
  void *v15;
  void *v16;
  NSObject *calloutQueue;
  void *v18;
  _QWORD block[4];
  id v20;
  _QWORD v21[5];
  id v22;
  BOOL v23;

  v7 = a6;
  v11 = a3;
  v12 = a5;
  if (v11)
  {
    v13 = v12;
    os_unfair_lock_lock(&self->_lock);
    if (self->_lock_invalidated || self->_lock_connectionDenied)
    {
      v14 = 0;
    }
    else
    {
      v14 = self->_lock_connection;
      -[FBSServiceFacilityClient _lock_activate](self, "_lock_activate");
    }
    os_unfair_lock_unlock(&self->_lock);
    if (v13)
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __83__FBSServiceFacilityClient_sendMessage_withType_replyHandler_waitForReply_timeout___block_invoke;
      v21[3] = &unk_1E38EDAD8;
      v21[4] = self;
      v23 = v7;
      v22 = v13;
      -[BSServiceConnection createMessageWithCompletion:](v14, "createMessageWithCompletion:", v21);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[BSServiceConnection createMessage](v14, "createMessage");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v15, "encodeInt64:forKey:", a4, CFSTR("message"));
    objc_msgSend(v11, "payload");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "encodeXPCObject:forKey:", v16, CFSTR("fbs_message"));

    if (v15)
    {
      if (v7)
        objc_msgSend(v15, "sendSynchronously");
      else
        objc_msgSend(v15, "send");
    }
    else if (v13)
    {
      calloutQueue = self->_calloutQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __83__FBSServiceFacilityClient_sendMessage_withType_replyHandler_waitForReply_timeout___block_invoke_3;
      block[3] = &unk_1E38EB3B8;
      v20 = v13;
      dispatch_async(calloutQueue, block);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("fbs_message"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:].cold.1();
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)_lock_activate
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __49__FBSServiceFacilityClient__queue_handleMessage___block_invoke(uint64_t a1)
{
  uint64_t *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;

  v2 = (uint64_t *)(a1 + 32);
  if (objc_msgSend(*(id *)(a1 + 32), "_isValid"))
  {
    v3 = objc_msgSend(*(id *)(a1 + 40), "decodeInt64ForKey:", CFSTR("message"));
    +[FBSXPCMessage messageWithBSXPCMessage:ownReply:](FBSXPCMessage, "messageWithBSXPCMessage:ownReply:", *(_QWORD *)(a1 + 40), 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    FBLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __49__FBSServiceFacilityClient__queue_handleMessage___block_invoke_cold_1(v2, v5);

    objc_msgSend((id)*v2, "handleMessage:withType:", v4, v3);
  }
}

void __83__FBSServiceFacilityClient_sendMessage_withType_replyHandler_waitForReply_timeout___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  FBSXPCMessage *v7;
  BOOL v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  FBSXPCMessage *v12;
  id v13;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    +[FBSXPCMessage messageWithBSXPCMessage:ownReply:](FBSXPCMessage, "messageWithBSXPCMessage:ownReply:", v5, 0);
    v7 = (FBSXPCMessage *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 75))
    v8 = v7 == 0;
  else
    v8 = 0;
  if (v8)
    v7 = objc_alloc_init(FBSXPCMessage);
  if (*(_BYTE *)(a1 + 48))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v9 = *(void **)(a1 + 40);
    v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __83__FBSServiceFacilityClient_sendMessage_withType_replyHandler_waitForReply_timeout___block_invoke_2;
    v11[3] = &unk_1E38EB888;
    v13 = v9;
    v12 = v7;
    dispatch_async(v10, v11);

  }
}

- (BOOL)_isValid
{
  FBSServiceFacilityClient *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = !v2->_lock_invalidated;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_connection, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong(&self->_configOnly_interfaceTarget, 0);
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_serviceQuality, 0);
  objc_storeStrong((id *)&self->_facilityID, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[FBSServiceFacilityClient _lock_invalidate](self, "_lock_invalidate");
  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_invalidate
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  BSServiceConnection *lock_connection;
  int v7;
  void *v8;
  __int16 v9;
  FBSServiceFacilityClient *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_lock_invalidated)
  {
    FBLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = (objc_class *)objc_opt_class();
      NSStringFromClass(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543618;
      v8 = v5;
      v9 = 2048;
      v10 = self;
      _os_log_impl(&dword_19A6D4000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Service facility connection invalidated", (uint8_t *)&v7, 0x16u);

    }
    self->_lock_invalidated = 1;
    -[BSServiceConnection invalidate](self->_lock_connection, "invalidate");
    lock_connection = self->_lock_connection;
    self->_lock_connection = 0;

  }
}

- (void)setServiceQuality:(id)a3
{
  BSServiceQuality *v4;
  BSServiceQuality *serviceQuality;
  void *v6;

  v4 = (BSServiceQuality *)a3;
  if (self->_configured)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("untimely configuration call"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSServiceFacilityClient setServiceQuality:].cold.2();
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6F8298);
  }
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("serviceQuality"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSServiceFacilityClient setServiceQuality:].cold.1();
    goto LABEL_9;
  }
  serviceQuality = self->_serviceQuality;
  self->_serviceQuality = v4;

}

- (void)setCalloutQueue:(id)a3
{
  OS_dispatch_queue *v4;
  OS_dispatch_queue *calloutQueue;
  void *v6;

  v4 = (OS_dispatch_queue *)a3;
  if (self->_configured)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("untimely configuration call"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSServiceFacilityClient setCalloutQueue:].cold.2();
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6F839CLL);
  }
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("calloutQueue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSServiceFacilityClient setCalloutQueue:].cold.1();
    goto LABEL_9;
  }
  calloutQueue = self->_calloutQueue;
  self->_calloutQueue = v4;

}

- (void)dealloc
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __42__FBSServiceFacilityClient__lock_activate__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  os_unfair_lock_s **v4;
  os_unfair_lock_s *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  os_unfair_lock_s *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  os_unfair_lock_s *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  NSObject *v19;
  os_unfair_lock_s *v20;
  NSObject *v21;
  id v22;
  _QWORD block[5];
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  os_unfair_lock_s *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v5 = *(os_unfair_lock_s **)(a1 + 32);
  v4 = (os_unfair_lock_s **)(a1 + 32);
  os_unfair_lock_lock(v5 + 15);
  if (v3 && !BYTE2((*v4)[18]._os_unfair_lock_opaque))
  {
    FBLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *v4;
      *(_DWORD *)buf = 138543618;
      v26 = v8;
      v27 = 2048;
      v28 = v9;
      _os_log_impl(&dword_19A6D4000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Service facility connection activation received.", buf, 0x16u);

    }
    if ((objc_msgSend(v3, "decodeBoolForKey:", CFSTR("fbs_accept")) & 1) == 0)
    {
      FBLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = *v4;
        *(_DWORD *)buf = 138543618;
        v26 = v12;
        v27 = 2048;
        v28 = v13;
        _os_log_impl(&dword_19A6D4000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Service denied.", buf, 0x16u);

      }
      LOBYTE((*v4)[18]._os_unfair_lock_opaque) = 1;
      objc_msgSend(*(id *)&(*v4)[16]._os_unfair_lock_opaque, "invalidate");
      v14 = *(void **)&(*v4)[16]._os_unfair_lock_opaque;
      *(_QWORD *)&(*v4)[16]._os_unfair_lock_opaque = 0;

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "decodeStringForKey:", CFSTR("fbs_errorDesc"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Service denied: %@"), v16);
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKey:", v16, *MEMORY[0x1E0CB2D68]);
      }
      else
      {
        v17 = CFSTR("Service denied.");
      }
      objc_msgSend(v15, "setObject:forKey:", v17, *MEMORY[0x1E0CB2D50]);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("FBSServiceFacilityErrorDomain"), 1, v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      FBLogCommon();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        __42__FBSServiceFacilityClient__lock_activate__block_invoke_cold_1((uint64_t)v4, v18);

      v20 = *v4;
      v21 = *(NSObject **)&(*v4)[12]._os_unfair_lock_opaque;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __42__FBSServiceFacilityClient__lock_activate__block_invoke_68;
      block[3] = &unk_1E38EAE08;
      block[4] = v20;
      v24 = v18;
      v22 = v18;
      dispatch_async(v21, block);

    }
  }
  os_unfair_lock_unlock(*v4 + 15);

}

- (void)_queue_handleMessage:(id)a3
{
  id v4;
  NSObject *calloutQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  calloutQueue = self->_calloutQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__FBSServiceFacilityClient__queue_handleMessage___block_invoke;
  v7[3] = &unk_1E38EAE08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(calloutQueue, v7);

}

- (FBSServiceFacilityClient)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  FBSServiceFacilityClient *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  FBSServiceFacilityClient *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("you must use another initializer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = CFSTR("FBSServiceFacilityClient.m");
    v17 = 1024;
    v18 = 41;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (FBSServiceFacilityClient *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (FBSServiceFacilityClient)initWithIdentifier:(id)a3 calloutQueue:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  FBSServiceFacilityClient *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__FBSServiceFacilityClient_initWithIdentifier_calloutQueue___block_invoke;
  v12[3] = &unk_1E38EDA38;
  v13 = v6;
  v14 = v7;
  v8 = v7;
  v9 = v6;
  v10 = -[FBSServiceFacilityClient initWithConfigurator:](self, "initWithConfigurator:", v12);

  return v10;
}

void __60__FBSServiceFacilityClient_initWithIdentifier_calloutQueue___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  +[FBSServiceFacilityClient defaultShellEndpoint](FBSServiceFacilityClient, "defaultShellEndpoint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEndpoint:", v3);

  objc_msgSend(v5, "setIdentifier:", *(_QWORD *)(a1 + 32));
  objc_msgSend(off_1E38E9E80, "userInitiated");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setServiceQuality:", v4);

  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(v5, "setCalloutQueue:");

}

void __49__FBSServiceFacilityClient_initWithConfigurator___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  os_unfair_lock_s *v4;
  id v5;

  v4 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 60);
  v5 = a3;
  os_unfair_lock_lock(v4);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 73) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 60));
  objc_msgSend(*(id *)(a1 + 32), "_queue_handleError:", v5);

}

uint64_t __49__FBSServiceFacilityClient_initWithConfigurator___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "activate");
}

uint64_t __49__FBSServiceFacilityClient_initWithConfigurator___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)setInterface:(id)a3
{
  BSServiceInterface *v4;
  BSServiceInterface *interface;
  void *v6;

  v4 = (BSServiceInterface *)a3;
  if (self->_configured)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("untimely configuration call"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSServiceFacilityClient setInterface:].cold.2();
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A742488);
  }
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("interface"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSServiceFacilityClient setInterface:].cold.1();
    goto LABEL_9;
  }
  interface = self->_interface;
  self->_interface = v4;

}

- (void)setInterfaceTarget:(id)a3
{
  id v4;
  id configOnly_interfaceTarget;
  void *v6;

  v4 = a3;
  if (self->_configured)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("untimely configuration call"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSServiceFacilityClient setInterfaceTarget:].cold.2();
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A74258CLL);
  }
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("target"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSServiceFacilityClient setInterfaceTarget:].cold.1();
    goto LABEL_9;
  }
  configOnly_interfaceTarget = self->_configOnly_interfaceTarget;
  self->_configOnly_interfaceTarget = v4;

}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(off_1E38E9DF0, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_facilityID, CFSTR("facilityID"));
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

uint64_t __83__FBSServiceFacilityClient_sendMessage_withType_replyHandler_waitForReply_timeout___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __42__FBSServiceFacilityClient__lock_activate__block_invoke_68(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "handleError:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)_queue_handleError:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *calloutQueue;
  id v11;
  _QWORD block[5];
  id v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB35C8];
  v5 = *MEMORY[0x1E0CB2D68];
  v14[0] = *MEMORY[0x1E0CB2D50];
  v14[1] = v5;
  v15[0] = CFSTR("Service suspended: the connection with the service host has been interrupted.");
  v15[1] = CFSTR("The connection with the service host has been interrupted.");
  v14[2] = *MEMORY[0x1E0CB3388];
  v15[2] = a3;
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a3;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("FBSServiceFacilityErrorDomain"), 2, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  calloutQueue = self->_calloutQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__FBSServiceFacilityClient__queue_handleError___block_invoke;
  block[3] = &unk_1E38EAE08;
  block[4] = self;
  v13 = v9;
  v11 = v9;
  dispatch_async(calloutQueue, block);

}

uint64_t __47__FBSServiceFacilityClient__queue_handleError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  NSObject *v4;

  v2 = a1 + 32;
  result = objc_msgSend(*(id *)(a1 + 32), "_isValid");
  if ((_DWORD)result)
  {
    FBLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __47__FBSServiceFacilityClient__queue_handleError___block_invoke_cold_1(v2, a1);

    return objc_msgSend(*(id *)(a1 + 32), "handleError:", *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (BSServiceQuality)serviceQuality
{
  return self->_serviceQuality;
}

- (BOOL)isConfigured
{
  return self->_configured;
}

- (void)initWithConfigurator:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithConfigurator:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithConfigurator:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithConfigurator:.cold.4()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)setEndpoint:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)setEndpoint:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)setEndpoint:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)setIdentifier:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)setIdentifier:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)setServiceQuality:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)setServiceQuality:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)setInterface:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)setInterface:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)setInterfaceTarget:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)setInterfaceTarget:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)setCalloutQueue:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)setCalloutQueue:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)sendMessage:withType:replyHandler:waitForReply:timeout:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __42__FBSServiceFacilityClient__lock_activate__block_invoke_cold_1(uint64_t a1, void *a2)
{
  objc_class *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v3 = (objc_class *)OUTLINED_FUNCTION_10_1();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_9_1(&dword_19A6D4000, v6, v7, "[%{public}@:%p] %{public}@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_11_2();
}

void __47__FBSServiceFacilityClient__queue_handleError___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  objc_class *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v3 = (objc_class *)OUTLINED_FUNCTION_10_1();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a2 + 40), "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_9_1(&dword_19A6D4000, v6, v7, "[%{public}@:%p] %{public}@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_11_2();
}

void __49__FBSServiceFacilityClient__queue_handleMessage___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  objc_class *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)OUTLINED_FUNCTION_10_1();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *a1;
  v7 = 138543618;
  v8 = v5;
  v9 = 2048;
  v10 = v6;
  _os_log_debug_impl(&dword_19A6D4000, a2, OS_LOG_TYPE_DEBUG, "[%{public}@:%p] Handle incoming message.", (uint8_t *)&v7, 0x16u);

}

@end
