@implementation BKHIDEventDeliveryManagerServer

- (BKHIDEventDeliveryManagerServer)initWithDeliveryManager:(id)a3 ruleChangeAuthority:(id)a4
{
  id v7;
  id v8;
  BKHIDEventDeliveryManagerServer *v9;
  BKHIDEventDeliveryManagerServer *v10;
  BKHIDDomainServiceServer *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  BKHIDDomainServiceServer *server;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)BKHIDEventDeliveryManagerServer;
  v9 = -[BKHIDEventDeliveryManagerServer init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_deliveryManager, a3);
    objc_storeStrong((id *)&v10->_ruleChangeAuthority, a4);
    v11 = [BKHIDDomainServiceServer alloc];
    v12 = *MEMORY[0x1E0D00A00];
    BKLogEventDelivery();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[BKHIDDomainServiceServer initWithDelegate:serverTarget:serverProtocol:clientProtocol:serviceName:queue:log:entitlement:](v11, "initWithDelegate:serverTarget:serverProtocol:clientProtocol:serviceName:queue:log:entitlement:", v10, v10, &unk_1EF901BB0, &unk_1EF904360, v12, 0, v13, 0);
    server = v10->_server;
    v10->_server = (BKHIDDomainServiceServer *)v14;

    -[BKHIDDomainServiceServer activate](v10->_server, "activate");
  }

  return v10;
}

- (void)connectionDidTerminate:(id)a3 process:(id)a4
{
  -[BKHIDEventDeliveryManager processDidTerminate:](self->_deliveryManager, "processDidTerminate:", objc_msgSend(a4, "pid", a3));
}

- (void)submitRuleChanges:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6 || objc_msgSend(v6, "isInvalid"))
  {
    BKLogEventDelivery();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
LABEL_4:

      goto LABEL_5;
    }
    v16 = 138543362;
    v17 = v6;
    v12 = "invalid remote audit token: %{public}@";
    v13 = v7;
    v14 = 12;
LABEL_15:
    _os_log_error_impl(&dword_1C8914000, v13, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v16, v14);
    goto LABEL_4;
  }
  v8 = objc_msgSend(v6, "pid");
  if ((int)v8 <= 0)
  {
    BKLogEventDelivery();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_4;
    v16 = 67109120;
    LODWORD(v17) = v8;
    v12 = "invalid remote pid: %d";
    v13 = v7;
    v14 = 8;
    goto LABEL_15;
  }
  v9 = -[BKHIDEventDeliveryManagerServerRuleChangeAuthority permittedRuleChangeMaskForAuditToken:](self->_ruleChangeAuthority, "permittedRuleChangeMaskForAuditToken:", v6);
  v10 = objc_msgSend(v4, "contentsMask");
  if ((v10 & v9) != v10)
  {
    BKLogEventDelivery();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      BSProcessDescriptionForPID();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543874;
      v17 = v15;
      v18 = 1024;
      v19 = v10;
      v20 = 1024;
      v21 = v9;
      _os_log_error_impl(&dword_1C8914000, v11, OS_LOG_TYPE_ERROR, "process %{public}@ tried to make unauthorized changes (%X allowed:%X) -- ignoring", (uint8_t *)&v16, 0x18u);

    }
    v10 &= v9;
  }
  os_unfair_lock_lock(&self->_lock);
  -[BKHIDEventDeliveryManagerServer _lock_submitRuleChanges:validatedContentsMask:forPID:](self, "_lock_submitRuleChanges:validatedContentsMask:forPID:", v4, v10, v8);
  os_unfair_lock_unlock(&self->_lock);
LABEL_5:

}

- (void)selectDeferringTargetForPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6 || objc_msgSend(v6, "isInvalid"))
  {
    BKLogEventDelivery();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_4;
    v12 = 138543362;
    v13 = v6;
    v9 = "invalid remote audit token: %{public}@";
    v10 = v7;
    v11 = 12;
LABEL_11:
    _os_log_error_impl(&dword_1C8914000, v10, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v12, v11);
    goto LABEL_4;
  }
  v8 = objc_msgSend(v6, "pid");
  if ((int)v8 > 0)
  {
    os_unfair_lock_lock(&self->_lock);
    -[BKHIDEventDeliveryManager selectDeferringPredicate:forClientWithPID:](self->_deliveryManager, "selectDeferringPredicate:forClientWithPID:", v4, v8);
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_5;
  }
  BKLogEventDelivery();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v12 = 67109120;
    LODWORD(v13) = v8;
    v9 = "invalid remote pid: %d";
    v10 = v7;
    v11 = 8;
    goto LABEL_11;
  }
LABEL_4:

LABEL_5:
}

- (id)deliveryGraphDescription
{
  void *v3;
  void *v4;
  NSObject *v5;
  __CFString *v6;
  os_unfair_lock_s *p_lock;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && !objc_msgSend(v4, "isInvalid"))
  {
    if (objc_msgSend(v4, "hasEntitlement:", CFSTR("com.apple.backboardd.eventResolution")))
    {
      p_lock = &self->_lock;
      os_unfair_lock_lock(&self->_lock);
      -[BKHIDEventDeliveryManager deliveryGraphDescription](self->_deliveryManager, "deliveryGraphDescription");
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      os_unfair_lock_unlock(p_lock);
      goto LABEL_7;
    }
  }
  else
  {
    BKLogEventDelivery();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v9 = 138543362;
      v10 = v4;
      _os_log_error_impl(&dword_1C8914000, v5, OS_LOG_TYPE_ERROR, "invalid remote audit token: %{public}@", (uint8_t *)&v9, 0xCu);
    }

  }
  v6 = &stru_1E81F83B8;
LABEL_7:

  return v6;
}

- (id)connectionDescriptionForDeferringRuleIdentity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  __CFString *v8;
  os_unfair_lock_s *p_lock;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && !objc_msgSend(v6, "isInvalid"))
  {
    if (objc_msgSend(v6, "hasEntitlement:", CFSTR("com.apple.backboardd.eventResolution")))
    {
      p_lock = &self->_lock;
      os_unfair_lock_lock(&self->_lock);
      -[BKHIDEventDeliveryManager connectionDescriptionForDeferringRuleIdentity:](self->_deliveryManager, "connectionDescriptionForDeferringRuleIdentity:", v4);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      os_unfair_lock_unlock(p_lock);
      goto LABEL_7;
    }
  }
  else
  {
    BKLogEventDelivery();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = 138543362;
      v12 = v6;
      _os_log_error_impl(&dword_1C8914000, v7, OS_LOG_TYPE_ERROR, "invalid remote audit token: %{public}@", (uint8_t *)&v11, 0xCu);
    }

  }
  v8 = &stru_1E81F83B8;
LABEL_7:

  return v8;
}

- (void)_lock_submitRuleChanges:(id)a3 validatedContentsMask:(unint64_t)a4 forPID:(int)a5
{
  uint64_t v5;
  char v6;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  int v26;
  int v27;
  uint64_t v28;

  v5 = *(_QWORD *)&a5;
  v6 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = v8;
  if ((v6 & 1) != 0)
  {
    objc_msgSend(v8, "discreteDispatchingRules");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[BKHIDEventDeliveryManager setDispatchingRoots:forClientWithPID:](self->_deliveryManager, "setDispatchingRoots:forClientWithPID:", v10, v5);
    }
    else
    {
      BKLogEventDelivery();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v26 = 67109120;
        v27 = v5;
        _os_log_error_impl(&dword_1C8914000, v11, OS_LOG_TYPE_ERROR, "missing dispatch roots from pid:%d", (uint8_t *)&v26, 8u);
      }

    }
    if ((v6 & 4) == 0)
    {
LABEL_3:
      if ((v6 & 2) == 0)
        goto LABEL_23;
      goto LABEL_17;
    }
  }
  else if ((v6 & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v9, "keyCommandDispatchingRules");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[BKHIDEventDeliveryManager setKeyCommandRoots:forClientWithPID:](self->_deliveryManager, "setKeyCommandRoots:forClientWithPID:", v12, v5);
  }
  else
  {
    BKLogEventDelivery();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v26 = 67109120;
      v27 = v5;
      _os_log_error_impl(&dword_1C8914000, v13, OS_LOG_TYPE_ERROR, "missing key command roots from pid:%d", (uint8_t *)&v26, 8u);
    }

  }
  if ((v6 & 2) != 0)
  {
LABEL_17:
    objc_msgSend(v9, "deferringRules");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      -[BKHIDEventDeliveryManager setDeferringRules:forClientWithPID:](self->_deliveryManager, "setDeferringRules:forClientWithPID:", v14, v5);
    }
    else
    {
      BKLogEventDelivery();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v26 = 67109120;
        v27 = v5;
        _os_log_error_impl(&dword_1C8914000, v15, OS_LOG_TYPE_ERROR, "missing deferring rules from pid:%d", (uint8_t *)&v26, 8u);
      }

    }
  }
LABEL_23:
  if ((v6 & 8) != 0)
  {
    v16 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v9, "keyCommandsRegistrations");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[BKHIDEventDeliveryManager setKeyCommandsRegistrations:forClientWithPID:](self->_deliveryManager, "setKeyCommandsRegistrations:forClientWithPID:", v18, v5);
    }
    else
    {
      BKLogEventDelivery();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v26 = 67109120;
        v27 = v5;
        _os_log_error_impl(&dword_1C8914000, v19, OS_LOG_TYPE_ERROR, "missing key commands registration from pid:%d", (uint8_t *)&v26, 8u);
      }

    }
    if ((v6 & 0x10) == 0)
    {
LABEL_25:
      if ((v6 & 0x20) == 0)
        goto LABEL_45;
      goto LABEL_39;
    }
  }
  else if ((v6 & 0x10) == 0)
  {
    goto LABEL_25;
  }
  v20 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v9, "bufferingPredicates");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setWithArray:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[BKHIDEventDeliveryManager setEventBufferingPredicates:forClientWithPID:](self->_deliveryManager, "setEventBufferingPredicates:forClientWithPID:", v22, v5);
  }
  else
  {
    BKLogEventDelivery();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v26 = 67109120;
      v27 = v5;
      _os_log_error_impl(&dword_1C8914000, v23, OS_LOG_TYPE_ERROR, "missing buffering predicates from pid:%d", (uint8_t *)&v26, 8u);
    }

  }
  if ((v6 & 0x20) != 0)
  {
LABEL_39:
    objc_msgSend(v9, "activeUIResponders");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      -[BKHIDEventDeliveryManager setActiveUIResponders:forClientWithPID:](self->_deliveryManager, "setActiveUIResponders:forClientWithPID:", v24, v5);
    }
    else
    {
      BKLogEventDelivery();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = 67109120;
        v27 = v5;
        _os_log_error_impl(&dword_1C8914000, v25, OS_LOG_TYPE_ERROR, "missing buffering predicates from pid:%d", (uint8_t *)&v26, 8u);
      }

    }
  }
LABEL_45:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ruleChangeAuthority, 0);
  objc_storeStrong((id *)&self->_deliveryManager, 0);
  objc_storeStrong((id *)&self->_resolutionsByPID, 0);
  objc_storeStrong((id *)&self->_observerPIDs, 0);
  objc_storeStrong((id *)&self->_server, 0);
}

@end
