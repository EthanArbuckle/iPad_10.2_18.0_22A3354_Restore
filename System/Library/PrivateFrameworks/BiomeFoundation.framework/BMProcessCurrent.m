@implementation BMProcessCurrent

- (BOOL)reliesOnDirectAccessForDomain:(unint64_t)a3
{
  char v4;
  os_unfair_lock_s *p_reliesOnLegacyDirectAccessLock;
  NSNumber *reliesOnLegacyDirectAccess;
  void *v7;
  char v8;
  NSObject *v9;
  NSNumber *v10;
  NSNumber *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  uint8_t v16[16];

  if (!-[BMProcess processType](self, "processType", a3))
    return 0;
  if (-[BMProcess processType](self, "processType") != 2)
  {
    p_reliesOnLegacyDirectAccessLock = &self->_reliesOnLegacyDirectAccessLock;
    os_unfair_lock_lock(&self->_reliesOnLegacyDirectAccessLock);
    reliesOnLegacyDirectAccess = self->_reliesOnLegacyDirectAccess;
    if (reliesOnLegacyDirectAccess)
    {
      v4 = -[NSNumber BOOLValue](reliesOnLegacyDirectAccess, "BOOLValue");
    }
    else
    {
      if (-[BMProcess BOOLForEntitlement:](self, "BOOLForEntitlement:", CFSTR("com.apple.private.security.storage.Biome")))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && -[BMProcess processType](self, "processType") == 1)
        {
          -[BMProcess executableName](self, "executableName");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(&unk_1E5E4A318, "containsObject:", v7);

          if ((v8 & 1) == 0)
          {
            __biome_log_for_category(6);
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
              -[BMProcessCurrent reliesOnDirectAccessForDomain:].cold.2();

            v15 = (id)objc_claimAutoreleasedReturnValue();
            objc_exception_throw(v15);
          }
        }
        if (os_variant_has_internal_diagnostics())
        {
          __biome_log_for_category(6);
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v16 = 0;
            _os_log_impl(&dword_1AEB31000, v9, OS_LOG_TYPE_ERROR, "Warning: process needs to add mach-lookup for access service and remove datavault entitlement", v16, 2u);
          }

        }
        if (!-[BMProcess canPerformGlobalMachLookup:report:](self, "canPerformGlobalMachLookup:report:", CFSTR("com.apple.biome.PublicStreamAccessService"), 0)&& !-[BMProcess canPerformGlobalMachLookup:report:](self, "canPerformGlobalMachLookup:report:", CFSTR("com.apple.biome.access.user"), 0)&& !-[BMProcess canPerformGlobalMachLookup:report:](self, "canPerformGlobalMachLookup:report:", CFSTR("com.apple.biome.access.system"), 0))
        {
          if (-[BMProcess processType](self, "processType") == 2
            || -[BMProcess processType](self, "processType") == 8
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
            || -[BMProcessCurrent isRunningInUserContext](self, "isRunningInUserContext"))
          {
            v12 = self->_reliesOnLegacyDirectAccess;
            self->_reliesOnLegacyDirectAccess = (NSNumber *)MEMORY[0x1E0C9AAB0];

            v4 = 1;
            goto LABEL_19;
          }
          if (os_variant_has_internal_diagnostics())
          {
            __biome_log_for_category(6);
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
              -[BMProcessCurrent reliesOnDirectAccessForDomain:].cold.1();

          }
        }
      }
      v10 = self->_reliesOnLegacyDirectAccess;
      self->_reliesOnLegacyDirectAccess = (NSNumber *)MEMORY[0x1E0C9AAA0];

      v4 = 0;
    }
LABEL_19:
    os_unfair_lock_unlock(p_reliesOnLegacyDirectAccessLock);
    return v4;
  }
  return 1;
}

- (id)_initWithAuditToken:(id *)a3
{
  __int128 v3;
  id v4;
  void *v5;
  void *v6;
  _OWORD v8[2];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BMProcessCurrent;
  v3 = *(_OWORD *)&a3->var0[4];
  v8[0] = *(_OWORD *)a3->var0;
  v8[1] = v3;
  v4 = -[BMProcess _initWithAuditToken:](&v9, sel__initWithAuditToken_, v8);
  v5 = v4;
  if (v4)
  {
    *((_DWORD *)v4 + 30) = 0;
    v6 = (void *)*((_QWORD *)v4 + 16);
    *((_QWORD *)v4 + 16) = 0;

  }
  return v5;
}

- (BOOL)isManagedByLaunchd
{
  if (isManagedByLaunchd_onceToken != -1)
    dispatch_once(&isManagedByLaunchd_onceToken, &__block_literal_global_157);
  return isManagedByLaunchd_isManaged;
}

uint64_t __38__BMProcessCurrent_isManagedByLaunchd__block_invoke()
{
  uint64_t result;

  result = vproc_swap_integer();
  if (!result)
    isManagedByLaunchd_isManaged = 0;
  return result;
}

- (BOOL)isRunningInUserContext
{
  if (isRunningInUserContext_onceToken != -1)
    dispatch_once(&isRunningInUserContext_onceToken, &__block_literal_global_158);
  return isRunningInUserContext_userContext;
}

void __42__BMProcessCurrent_isRunningInUserContext__block_invoke()
{
  if (!vproc_swap_string())
  {
    isRunningInUserContext_userContext = geteuid() != 0;
    free(0);
  }
}

- (BOOL)isManagedByRunningBoard
{
  if (isManagedByRunningBoard_onceToken != -1)
    dispatch_once(&isManagedByRunningBoard_onceToken, &__block_literal_global_171);
  return isManagedByRunningBoard_isManaged;
}

void __43__BMProcessCurrent_isManagedByRunningBoard__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getRBSProcessHandleClass_softClass;
  v7 = getRBSProcessHandleClass_softClass;
  if (!getRBSProcessHandleClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getRBSProcessHandleClass_block_invoke;
    v3[3] = &unk_1E5E3C680;
    v3[4] = &v4;
    __getRBSProcessHandleClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v4, 8);
  objc_msgSend(v1, "currentProcess");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  isManagedByRunningBoard_isManaged = objc_msgSend(v2, "isManaged");

}

- (id)runningBoardAssertionWithExplanation:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  objc_class *v12;
  id v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v26;
  uint64_t v27;
  uint64_t v28;
  Class (*v29)(uint64_t);
  void *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[BMProcessCurrent isManagedByRunningBoard](self, "isManagedByRunningBoard"))
  {
    v32 = 0;
    v33 = &v32;
    v34 = 0x2050000000;
    v5 = (void *)getRBSTargetClass_softClass;
    v35 = getRBSTargetClass_softClass;
    if (!getRBSTargetClass_softClass)
    {
      v27 = MEMORY[0x1E0C809B0];
      v28 = 3221225472;
      v29 = __getRBSTargetClass_block_invoke;
      v30 = &unk_1E5E3C680;
      v31 = &v32;
      __getRBSTargetClass_block_invoke((uint64_t)&v27);
      v5 = (void *)v33[3];
    }
    v6 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v32, 8);
    objc_msgSend(v6, "targetWithPid:", getpid());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    v33 = &v32;
    v34 = 0x2050000000;
    v8 = (void *)getRBSDomainAttributeClass_softClass;
    v35 = getRBSDomainAttributeClass_softClass;
    if (!getRBSDomainAttributeClass_softClass)
    {
      v27 = MEMORY[0x1E0C809B0];
      v28 = 3221225472;
      v29 = __getRBSDomainAttributeClass_block_invoke;
      v30 = &unk_1E5E3C680;
      v31 = &v32;
      __getRBSDomainAttributeClass_block_invoke((uint64_t)&v27);
      v8 = (void *)v33[3];
    }
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v32, 8);
    objc_msgSend(v9, "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("FinishTaskUninterruptable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    v33 = &v32;
    v34 = 0x2050000000;
    v11 = (void *)getRBSAssertionClass_softClass;
    v35 = getRBSAssertionClass_softClass;
    if (!getRBSAssertionClass_softClass)
    {
      v27 = MEMORY[0x1E0C809B0];
      v28 = 3221225472;
      v29 = __getRBSAssertionClass_block_invoke;
      v30 = &unk_1E5E3C680;
      v31 = &v32;
      __getRBSAssertionClass_block_invoke((uint64_t)&v27);
      v11 = (void *)v33[3];
    }
    v12 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v32, 8);
    v13 = [v12 alloc];
    v36[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithExplanation:target:attributes:", v4, v7, v14);

    v26 = 0;
    v16 = objc_msgSend(v15, "acquireWithError:", &v26);
    v17 = v26;
    if ((v16 & 1) == 0)
    {
      __biome_log_for_category(0);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[BMProcessCurrent runningBoardAssertionWithExplanation:].cold.1((uint64_t)v17, v18, v19, v20, v21, v22, v23, v24);

    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reliesOnLegacyDirectAccess, 0);
}

- (void)reliesOnDirectAccessForDomain:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1AEB31000, v0, v1, "Client Error: root/system processes cannot access Biome using datavault entitlement", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)reliesOnDirectAccessForDomain:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4();
}

- (void)runningBoardAssertionWithExplanation:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AEB31000, a2, a3, "Failed to acquire RunningBoard assertion with error: %@", a5, a6, a7, a8, 2u);
}

@end
