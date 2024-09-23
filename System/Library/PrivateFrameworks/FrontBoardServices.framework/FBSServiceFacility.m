@implementation FBSServiceFacility

- (BOOL)queue_clientDidConnect:(id)a3 withMessage:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  NSSet *v9;
  NSSet *clients_immutable;
  NSObject *v11;

  v6 = a3;
  v7 = a4;
  -[FBSSerialQueue assertOnQueue](self->_queue, "assertOnQueue");
  v8 = -[FBSServiceFacility shouldAllowClientConnection:withMessage:](self, "shouldAllowClientConnection:withMessage:", v6, v7);
  if (v8)
  {
    -[NSMutableSet addObject:](self->_clients, "addObject:", v6);
    os_unfair_lock_lock(&self->_clients_immutable_lock);
    v9 = (NSSet *)-[NSMutableSet copy](self->_clients, "copy");
    clients_immutable = self->_clients_immutable;
    self->_clients_immutable = v9;

    os_unfair_lock_unlock(&self->_clients_immutable_lock);
    -[FBSServiceFacility noteClientDidConnect:withMessage:](self, "noteClientDidConnect:withMessage:", v6, v7);
  }
  else
  {
    FBLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[FBSServiceFacility queue_clientDidConnect:withMessage:].cold.1((uint64_t)self, v6);

  }
  return v8;
}

- (BOOL)shouldAllowClientConnection:(id)a3 withMessage:(id)a4
{
  return 1;
}

- (FBSSerialQueue)queue
{
  return self->_queue;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)queue_handleMessage:(id)a3 withType:(int64_t)a4 fromClient:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;

  v8 = a3;
  v9 = a5;
  -[FBSSerialQueue assertOnQueue](self->_queue, "assertOnQueue");
  if (-[NSMutableSet containsObject:](self->_clients, "containsObject:", v9))
  {
    -[FBSServiceFacility noteDidReceiveMessage:withType:fromClient:](self, "noteDidReceiveMessage:withType:fromClient:", v8, a4, v9);
  }
  else
  {
    FBLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[FBSServiceFacility queue_handleMessage:withType:fromClient:].cold.1((uint64_t)self, v9);

  }
}

- (NSSet)_prerequisiteMilestones
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("FBSServiceMilestoneSystemApplicationInitialized"));
}

- (void)sendMessage:(id)a3 withType:(int64_t)a4 toClients:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  objc_msgSend(v7, "payload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v19 = v9;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    obj = v8;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Client must be provided by the system."));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              -[FBSServiceFacility sendMessage:withType:toClients:].cold.1();
            objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
            _bs_set_crash_log_message();
            __break(0);
            JUMPOUT(0x19A6F5284);
          }
          objc_msgSend(v14, "clientHandle_messageBuilder");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "createMessage");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "encodeInt64:forKey:", a4, CFSTR("message"));
          objc_msgSend(v7, "payload");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "encodeXPCObject:forKey:", v17, CFSTR("fbs_message"));

          objc_msgSend(v16, "send");
        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v11);
    }

    v9 = v19;
  }

}

- (void)queue_clientDidDisconnect:(id)a3
{
  NSString *identifier;
  void *v5;
  int v6;
  void *v7;
  NSSet *v8;
  NSSet *clients_immutable;
  id v10;

  v10 = a3;
  -[FBSSerialQueue assertOnQueue](self->_queue, "assertOnQueue");
  identifier = self->_identifier;
  objc_msgSend(v10, "facilityID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSString isEqualToString:](identifier, "isEqualToString:", v5))
  {

    goto LABEL_5;
  }
  v6 = -[NSMutableSet containsObject:](self->_clients, "containsObject:", v10);

  v7 = v10;
  if (v6)
  {
    -[NSMutableSet removeObject:](self->_clients, "removeObject:", v10);
    os_unfair_lock_lock(&self->_clients_immutable_lock);
    v8 = (NSSet *)-[NSMutableSet copy](self->_clients, "copy");
    clients_immutable = self->_clients_immutable;
    self->_clients_immutable = v8;

    os_unfair_lock_unlock(&self->_clients_immutable_lock);
    -[FBSServiceFacility noteClientDidDisconnect:](self, "noteClientDidDisconnect:", v10);
LABEL_5:
    v7 = v10;
  }

}

- (FBSServiceFacility)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  FBSServiceFacility *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  FBSServiceFacility *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("wrong initializer"));
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
    v16 = CFSTR("FBSServiceFacility.m");
    v17 = 1024;
    v18 = 34;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (FBSServiceFacility *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (FBSServiceFacility)initWithIdentifier:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  FBSServiceFacility *v9;
  uint64_t v10;
  NSString *identifier;
  uint64_t v12;
  NSMutableSet *clients;
  uint64_t v14;
  NSSet *clients_immutable;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("identifier != ((void *)0)"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSServiceFacility initWithIdentifier:queue:].cold.1();
    objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    goto LABEL_16;
  }
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("queue"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSServiceFacility initWithIdentifier:queue:].cold.2();
    objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A70BDF0);
  }
  v22.receiver = self;
  v22.super_class = (Class)FBSServiceFacility;
  v9 = -[FBSServiceFacility init](&v22, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v6, "copy");
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v10;

    objc_storeStrong((id *)&v9->_queue, a4);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v12 = objc_claimAutoreleasedReturnValue();
    clients = v9->_clients;
    v9->_clients = (NSMutableSet *)v12;

    v14 = -[NSMutableSet copy](v9->_clients, "copy");
    clients_immutable = v9->_clients_immutable;
    v9->_clients_immutable = (NSSet *)v14;

    v9->_clients_immutable_lock._os_unfair_lock_opaque = 0;
    FBSGetServiceFacilityManager();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = v16;
      objc_msgSend(v16, "addFacility:", v9);

      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("no service facility manager found"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSServiceFacility initWithIdentifier:queue:].cold.3();
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
LABEL_16:
    JUMPOUT(0x19A70BD8CLL);
  }
LABEL_6:

  return v9;
}

- (void)dealloc
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)invalidate
{
  id v3;

  -[FBSSerialQueue assertOnQueue](self->_queue, "assertOnQueue");
  self->_invalidated = 1;
  FBSGetServiceFacilityManager();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFacility:", self);

}

- (NSSet)clients
{
  os_unfair_lock_s *p_clients_immutable_lock;
  NSSet *v4;

  p_clients_immutable_lock = &self->_clients_immutable_lock;
  os_unfair_lock_lock(&self->_clients_immutable_lock);
  v4 = self->_clients_immutable;
  os_unfair_lock_unlock(p_clients_immutable_lock);
  return v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[FBSServiceFacility succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(off_1E38E9DF0, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSServiceFacility identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("ID"));

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[FBSServiceFacility descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  FBSServiceFacility *v11;

  v4 = a3;
  -[FBSServiceFacility succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__FBSServiceFacility_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E38EAE08;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

void __60__FBSServiceFacility_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_prerequisiteMilestones");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendArraySection:withName:skipIfEmpty:", v4, CFSTR("prereqMilestones"), 1);

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "clients");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendArraySection:withName:skipIfEmpty:", v6, CFSTR("clients"), 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clients_immutable, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_prerequisiteMilestones, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithIdentifier:queue:.cold.1()
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

- (void)initWithIdentifier:queue:.cold.2()
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

- (void)initWithIdentifier:queue:.cold.3()
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

- (void)queue_clientDidConnect:(uint64_t)a1 withMessage:(void *)a2 .cold.1(uint64_t a1, void *a2)
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

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "prettyProcessDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7_0(&dword_19A6D4000, v6, v7, "[%{public}@] Rejecting client %{public}@.", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_8();
}

- (void)queue_handleMessage:(uint64_t)a1 withType:(void *)a2 fromClient:.cold.1(uint64_t a1, void *a2)
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

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "prettyProcessDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7_0(&dword_19A6D4000, v6, v7, "[%{public}@] Ignoring message from untracked client %{public}@.", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_8();
}

- (void)sendMessage:withType:toClients:.cold.1()
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

@end
