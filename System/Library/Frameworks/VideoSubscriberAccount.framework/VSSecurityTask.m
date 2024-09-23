@implementation VSSecurityTask

- (BOOL)shouldAllowAccessForBooleanEntitlement:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  id v7;
  id v8;
  char v9;
  NSObject *v10;
  id v12;
  id v13;

  v4 = a3;
  v5 = (void *)MEMORY[0x1D8236758]();
  v12 = 0;
  v13 = 0;
  v6 = -[VSSecurityTask getValue:forEntitlement:error:](self, "getValue:forEntitlement:error:", &v13, v4, &v12);
  v7 = v13;
  v8 = v12;
  if (!v6)
  {
    VSErrorLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[VSSecurityTask shouldAllowAccessForBooleanEntitlement:].cold.1();

    goto LABEL_7;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  v9 = objc_msgSend(v7, "BOOLValue");
LABEL_8:

  objc_autoreleasePoolPop(v5);
  return v9;
}

- (BOOL)getValue:(id *)a3 forEntitlement:(id)a4 error:(id *)a5
{
  id v8;
  __SecTask *v9;
  void *v10;
  id v11;
  BOOL v12;
  id v14;

  v8 = a4;
  v9 = -[VSSecurityTask _taskRef](self, "_taskRef");
  if (v9)
  {
    v14 = 0;
    v10 = (void *)((uint64_t (*)(__SecTask *, id, id *))self->_copyValueForEntitlement)(v9, v8, &v14);
    if (v10)
    {
      if (a3)
        *a3 = v10;
      else
        CFRelease(v10);
LABEL_15:
      v12 = 1;
      goto LABEL_16;
    }
    if (!v14)
    {
      if (a3)
        *a3 = 0;
      goto LABEL_15;
    }
    if (a5)
    {
      v11 = objc_retainAutorelease(v14);
      goto LABEL_10;
    }
LABEL_11:
    v12 = 0;
    goto LABEL_16;
  }
  if (!a5)
    goto LABEL_11;
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
  v12 = 0;
  *a5 = v11;
LABEL_16:

  return v12;
}

- (__SecTask)_taskRef
{
  __SecTask *result;
  unint64_t kind;
  uint64_t (*createWithAuditToken)(uint64_t, _OWORD *);
  uint64_t v6;
  __int128 v7;
  _OWORD v8[2];

  result = self->_taskRef;
  if (!result)
  {
    kind = self->_kind;
    if (kind == 1)
    {
      createWithAuditToken = (uint64_t (*)(uint64_t, _OWORD *))self->_createWithAuditToken;
      v6 = *MEMORY[0x1E0C9AE00];
      v7 = *(_OWORD *)&self->_auditToken.val[4];
      v8[0] = *(_OWORD *)self->_auditToken.val;
      v8[1] = v7;
      result = (__SecTask *)createWithAuditToken(v6, v8);
      goto LABEL_6;
    }
    if (!kind)
    {
      result = (__SecTask *)((uint64_t (*)(_QWORD, SEL))self->_createFromSelf)(*MEMORY[0x1E0C9AE00], a2);
LABEL_6:
      self->_taskRef = result;
      return result;
    }
    return 0;
  }
  return result;
}

+ (id)currentSecurityTask
{
  VSSecurityTask *v2;

  v2 = [VSSecurityTask alloc];
  return -[VSSecurityTask initWithCreateFromSelfProc:copyValueForEntitlementProc:](v2, "initWithCreateFromSelfProc:copyValueForEntitlementProc:", MEMORY[0x1E0CD6610], MEMORY[0x1E0CD65F0]);
}

+ (VSSecurityTask)securityTaskWithAuditToken:(id *)a3
{
  VSSecurityTask *v4;
  __int128 v5;
  _OWORD v7[2];

  v4 = [VSSecurityTask alloc];
  v5 = *(_OWORD *)&a3->var0[4];
  v7[0] = *(_OWORD *)a3->var0;
  v7[1] = v5;
  return -[VSSecurityTask initWithAuditToken:createWithAuditTokenProc:copyValueForEntitlementProc:](v4, "initWithAuditToken:createWithAuditTokenProc:copyValueForEntitlementProc:", v7, MEMORY[0x1E0CD6620], MEMORY[0x1E0CD65F0]);
}

+ (VSSecurityTask)securityTaskForCurrentConnection
{
  id v2;
  void *v3;
  void *v4;
  _OWORD v6[2];
  __int128 v7;
  __int128 v8;

  v2 = (id)_securityTaskForCurrentConnection;
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v7 = 0u;
      v8 = 0u;
      objc_msgSend(v3, "auditToken");
      v6[0] = v7;
      v6[1] = v8;
      +[VSSecurityTask securityTaskWithAuditToken:](VSSecurityTask, "securityTaskWithAuditToken:", v6);
      v2 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v2 = 0;
    }

  }
  return (VSSecurityTask *)v2;
}

+ (void)setSecurityTaskForCurrentConnection:(id)a3
{
  objc_storeStrong((id *)&_securityTaskForCurrentConnection, a3);
}

- (VSSecurityTask)initWithAuditToken:(id *)a3 createWithAuditTokenProc:(void *)a4 copyValueForEntitlementProc:(void *)a5
{
  VSSecurityTask *result;
  __int128 v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VSSecurityTask;
  result = -[VSSecurityTask init](&v10, sel_init);
  if (result)
  {
    result->_kind = 1;
    v9 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)result->_auditToken.val = *(_OWORD *)a3->var0;
    *(_OWORD *)&result->_auditToken.val[4] = v9;
    result->_createWithAuditToken = a4;
    result->_copyValueForEntitlement = a5;
  }
  return result;
}

- (VSSecurityTask)initWithCreateFromSelfProc:(void *)a3 copyValueForEntitlementProc:(void *)a4
{
  VSSecurityTask *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VSSecurityTask;
  result = -[VSSecurityTask init](&v7, sel_init);
  if (result)
  {
    result->_kind = 0;
    result->_createFromSelf = a3;
    result->_copyValueForEntitlement = a4;
  }
  return result;
}

- (void)dealloc
{
  __SecTask *taskRef;
  objc_super v4;

  taskRef = self->_taskRef;
  if (taskRef)
    CFRelease(taskRef);
  v4.receiver = self;
  v4.super_class = (Class)VSSecurityTask;
  -[VSSecurityTask dealloc](&v4, sel_dealloc);
}

- (VSSecurityTask)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The init method is not available."));

  return 0;
}

- (void)_copySigningIdentifier
{
  void *result;

  result = self->_copySigningIdentifier;
  if (!result)
  {
    result = (void *)MEMORY[0x1E0CD65E0];
    self->_copySigningIdentifier = (void *)MEMORY[0x1E0CD65E0];
  }
  return result;
}

- (BOOL)shouldAllowAccessToSubscriberIdentifierHashModifier:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  void *v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  id v64;
  id v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D8236758]();
  v65 = 0;
  v64 = 0;
  v6 = -[VSSecurityTask getValue:forEntitlement:error:](self, "getValue:forEntitlement:error:", &v65, CFSTR("com.apple.private.subscriptionservce.subscriber-identifier-hash-modifiers"), &v64);
  v7 = v65;
  v8 = v64;
  if (v6)
  {
    if (v7)
    {
      v9 = v7;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v10 = (void *)MEMORY[0x1E0C99DA0];
          v11 = *MEMORY[0x1E0C99778];
          v12 = (objc_class *)objc_opt_class();
          NSStringFromClass(v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "raise:format:", v11, CFSTR("Unexpectedly, allowedHashModifiers was %@, instead of NSArray."), v13);

        }
        v14 = v9;
        if (-[NSObject count](v14, "count"))
        {
          v58 = v5;
          v59 = v4;
          v62 = 0u;
          v63 = 0u;
          v60 = 0u;
          v61 = 0u;
          v15 = v14;
          v16 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v61;
            while (2)
            {
              for (i = 0; i != v17; ++i)
              {
                if (*(_QWORD *)v61 != v18)
                  objc_enumerationMutation(v15);
                v20 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * i);
                v21 = (void *)MEMORY[0x1D8236758]();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  VSErrorLogObject();
                  v42 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                    -[VSSecurityTask shouldAllowAccessToSubscriberIdentifierHashModifier:].cold.4(v20, v42, v43, v44, v45, v46, v47, v48);

                  objc_autoreleasePoolPop(v21);
                  v5 = v58;
                  v4 = v59;
                  goto LABEL_32;
                }
                objc_autoreleasePoolPop(v21);
              }
              v17 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
              if (v17)
                continue;
              break;
            }
          }

          v4 = v59;
          if ((-[NSObject containsObject:](v15, "containsObject:", v59) & 1) != 0)
          {
            v22 = 1;
            v5 = v58;
LABEL_34:

            goto LABEL_35;
          }
          VSErrorLogObject();
          v56 = objc_claimAutoreleasedReturnValue();
          v5 = v58;
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
            -[VSSecurityTask shouldAllowAccessToSubscriberIdentifierHashModifier:].cold.3();
          v15 = v56;
        }
        else
        {
          VSErrorLogObject();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            -[VSSecurityTask shouldAllowAccessToSubscriberIdentifierHashModifier:].cold.2(v15, v49, v50, v51, v52, v53, v54, v55);
        }
LABEL_32:

      }
      else
      {
        VSErrorLogObject();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[VSSecurityTask shouldAllowAccessToSubscriberIdentifierHashModifier:].cold.5((uint64_t)v9, v14, v36, v37, v38, v39, v40, v41);
      }
      v22 = 0;
      goto LABEL_34;
    }
    VSErrorLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[VSSecurityTask shouldAllowAccessToSubscriberIdentifierHashModifier:].cold.1(v9, v29, v30, v31, v32, v33, v34, v35);
  }
  else
  {
    VSErrorLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[VSSecurityTask shouldAllowAccessToSubscriberIdentifierHashModifier:].cold.6((uint64_t)v8, v9, v23, v24, v25, v26, v27, v28);
  }
  v22 = 0;
LABEL_35:

  objc_autoreleasePoolPop(v5);
  return v22;
}

- (NSString)signingIdentifier
{
  __SecTask *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v12;

  v3 = -[VSSecurityTask _taskRef](self, "_taskRef");
  if (v3)
  {
    v12 = 0;
    v3 = (__SecTask *)((uint64_t (*)(__SecTask *, void **))-[VSSecurityTask _copySigningIdentifier](self, "_copySigningIdentifier"))(v3, &v12);
    if (!v3)
    {
      VSErrorLogObject();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        -[VSSecurityTask signingIdentifier].cold.1(&v12, v4, v5, v6, v7, v8, v9, v10);

    }
  }
  return (NSString *)v3;
}

- (void)shouldAllowAccessForBooleanEntitlement:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D2419000, v0, v1, "Unable to get value for entitlement %@: %@");
  OUTLINED_FUNCTION_3();
}

- (void)shouldAllowAccessToSubscriberIdentifierHashModifier:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D2419000, a1, a3, "Nil value for hash modifier entitlement.", a5, a6, a7, a8, 0);
}

- (void)shouldAllowAccessToSubscriberIdentifierHashModifier:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D2419000, a1, a3, "Value for hash modifier entitlement is empty.", a5, a6, a7, a8, 0);
}

- (void)shouldAllowAccessToSubscriberIdentifierHashModifier:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D2419000, v0, v1, "Value for hash modifier entitlement (%@) did not contain provided hash modifier: %@");
  OUTLINED_FUNCTION_3();
}

- (void)shouldAllowAccessToSubscriberIdentifierHashModifier:(uint64_t)a3 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D2419000, a2, a3, "Hash modifier entitlement value contained non-string value: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)shouldAllowAccessToSubscriberIdentifierHashModifier:(uint64_t)a3 .cold.5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D2419000, a2, a3, "Value for hash modifier entitlement was not an array: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)shouldAllowAccessToSubscriberIdentifierHashModifier:(uint64_t)a3 .cold.6(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D2419000, a2, a3, "Unable to get value for hash modifier entitlement: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)signingIdentifier
{
  void *v8;

  v8 = *a1;
  OUTLINED_FUNCTION_2(&dword_1D2419000, a2, a3, "Error getting signing identifier: %@", a5, a6, a7, a8, 2u);

}

@end
