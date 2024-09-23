@implementation BSSecTask

- (uint64_t)BOOLForEntitlement:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  if (a1)
  {
    -[BSSecTask valueForEntitlement:](a1, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
      v5 = objc_msgSend(v4, "BOOLValue");
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)valueForEntitlement:(uint64_t)a1
{
  id v3;
  os_unfair_lock_s *v4;

  v3 = a2;
  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    BSSecTaskCopyEntitlementValue(*(__SecTask **)(a1 + 8), v3);
    a1 = objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(v4);
  }

  return (id)a1;
}

+ (id)secTaskForAuditToken:(uint64_t)a1
{
  __int128 v3;
  _OWORD v5[2];

  objc_opt_self();
  v3 = a2[1];
  v5[0] = *a2;
  v5[1] = v3;
  +[BSSecTask _taskForAuditToken:]((uint64_t)BSSecTask, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_taskForAuditToken:(uint64_t)a1
{
  __int128 v3;
  uint64_t v4;
  void *v5;
  void *v6;
  BSSecTask *v7;
  __int128 v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  dispatch_time_t v13;
  NSObject *v14;
  id v15;
  _QWORD block[4];
  id v18;
  audit_token_t token;
  objc_super v20;
  audit_token_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v3 = a2[1];
  *(_OWORD *)token.val = *a2;
  *(_OWORD *)&token.val[4] = v3;
  v4 = BSVersionedPIDForAuditToken(&token);
  if (v4 == -1)
  {
    v15 = 0;
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_26);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)qword_1ECD39A00, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v7 = [BSSecTask alloc];
      v8 = a2[1];
      *(_OWORD *)v21.val = *a2;
      *(_OWORD *)&v21.val[4] = v8;
      if (v7)
      {
        v20.receiver = v7;
        v20.super_class = (Class)BSSecTask;
        v9 = objc_msgSendSuper2(&v20, sel_init);
        v6 = v9;
        if (v9)
        {
          *((_DWORD *)v9 + 4) = 0;
          token = v21;
          *((_QWORD *)v9 + 1) = SecTaskCreateWithAuditToken(0, &token);
        }
      }
      else
      {
        v6 = 0;
      }
      v10 = (void *)qword_1ECD39A00;
      if (!qword_1ECD39A00)
      {
        objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)qword_1ECD39A00;
        qword_1ECD39A00 = v11;

        v10 = (void *)qword_1ECD39A00;
      }
      objc_msgSend(v10, "setObject:forKey:", v6, v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_26);
    v13 = dispatch_time(0, 1000000000);
    dispatch_get_global_queue(17, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __32__BSSecTask__taskForAuditToken___block_invoke;
    block[3] = &unk_1E1EBE890;
    v15 = v6;
    v18 = v15;
    dispatch_after(v13, v14, block);

  }
  return v15;
}

- (void)dealloc
{
  os_unfair_lock_s *p_lock;
  __SecTask *lock_taskRef;
  objc_super v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_taskRef = self->_lock_taskRef;
  if (lock_taskRef)
    CFRelease(lock_taskRef);
  os_unfair_lock_unlock(p_lock);
  v5.receiver = self;
  v5.super_class = (Class)BSSecTask;
  -[BSSecTask dealloc](&v5, sel_dealloc);
}

void __37__BSSecTask_secTaskForCurrentProcess__block_invoke()
{
  uint64_t v0;
  void *v1;
  _OWORD v2[2];

  BSAuditTokenForCurrentProcess(v2);
  +[BSSecTask _taskForAuditToken:]((uint64_t)BSSecTask, v2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD399F8;
  qword_1ECD399F8 = v0;

}

+ (id)secTaskForCurrentProcess
{
  objc_opt_self();
  if (qword_1ECD399F0 != -1)
    dispatch_once(&qword_1ECD399F0, &__block_literal_global_23);
  return (id)qword_1ECD399F8;
}

- (os_unfair_lock_s)representsPlatformBinary
{
  os_unfair_lock_s *v1;
  os_unfair_lock_s *v2;

  if (result)
  {
    v1 = result;
    v2 = result + 4;
    os_unfair_lock_lock(result + 4);
    LODWORD(v1) = SecTaskGetCodeSignStatus(*(SecTaskRef *)&v1[2]._os_unfair_lock_opaque);
    os_unfair_lock_unlock(v2);
    return (os_unfair_lock_s *)((v1 & 0xC000001) == 67108865);
  }
  return result;
}

@end
