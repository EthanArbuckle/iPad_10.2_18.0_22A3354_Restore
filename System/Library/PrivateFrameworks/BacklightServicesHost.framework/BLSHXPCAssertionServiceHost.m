@implementation BLSHXPCAssertionServiceHost

- (BLSHXPCAssertionServiceHost)initWithLocalService:(id)a3 peer:(id)a4
{
  id v7;
  id v8;
  BLSHXPCAssertionServiceHost *v9;
  BLSHXPCAssertionServiceHost *v10;
  void *v11;
  uint64_t v12;
  NSMutableDictionary *assertionProxies;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)BLSHXPCAssertionServiceHost;
  v9 = -[BLSHXPCAssertionServiceHost init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(v8, "remoteProcess");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v10->_remoteProcessHandle, v11);

    objc_storeStrong((id *)&v10->_localService, a3);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    assertionProxies = v10->_assertionProxies;
    v10->_assertionProxies = (NSMutableDictionary *)v12;

    v10->_valid = 1;
  }

  return v10;
}

- (void)dealloc
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_2145AC000, log, OS_LOG_TYPE_FAULT, "must invalidate before deallocating service", v1, 2u);
}

- (os_unfair_lock_s)isValid
{
  os_unfair_lock_s *v1;
  os_unfair_lock_s *v2;

  v1 = a1;
  if (a1)
  {
    v2 = a1 + 8;
    os_unfair_lock_lock(a1 + 8);
    v1 = (os_unfair_lock_s *)(LOBYTE(v1[9]._os_unfair_lock_opaque) != 0);
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *assertionProxies;
  _QWORD v5[5];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_valid = 0;
  assertionProxies = self->_assertionProxies;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __41__BLSHXPCAssertionServiceHost_invalidate__block_invoke;
  v5[3] = &unk_24D1BD0C8;
  v5[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](assertionProxies, "enumerateKeysAndObjectsUsingBlock:", v5);
  os_unfair_lock_unlock(p_lock);
}

void __41__BLSHXPCAssertionServiceHost_invalidate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "invalidate");
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v6 = (void *)MEMORY[0x24BDD1540];
  v7 = *MEMORY[0x24BE0B778];
  v10 = *MEMORY[0x24BDD0FC8];
  v11[0] = CFSTR("service disconnected");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelAssertion:withError:", v4, v9);

}

- (id)proxyForIdentifier:(os_unfair_lock_s *)a1
{
  uint64_t v2;
  os_unfair_lock_s *v3;
  id v4;

  v2 = (uint64_t)a1;
  if (a1)
  {
    v3 = a1 + 8;
    v4 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(v2 + 32));
    objc_msgSend(*(id *)(v2 + 24), "objectForKey:", v4);
    v2 = objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(v3);
  }
  return (id)v2;
}

- (void)setProxy:(void *)a3 forIdentifier:
{
  os_unfair_lock_s *v5;
  id v6;
  id v7;

  if (a1)
  {
    v5 = (os_unfair_lock_s *)(a1 + 32);
    v6 = a3;
    v7 = a2;
    os_unfair_lock_lock(v5);
    objc_msgSend(*(id *)(a1 + 24), "setObject:forKey:", v7, v6);

    os_unfair_lock_unlock(v5);
  }
}

- (void)removeProxyForIdentifier:(uint64_t)a1
{
  os_unfair_lock_s *v3;
  id v4;

  if (a1)
  {
    v3 = (os_unfair_lock_s *)(a1 + 32);
    v4 = a2;
    os_unfair_lock_lock(v3);
    objc_msgSend(*(id *)(a1 + 24), "removeObjectForKey:", v4);

    os_unfair_lock_unlock(v3);
  }
}

- (id)acquireAssertionForDescriptor:(id)a3 error:(id *)a4
{
  id v7;
  id WeakRetained;
  char v9;
  id v10;
  void *v11;
  void *v12;
  id result;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  BLSHAssertionProxy *v18;
  void *v19;
  BLSHAssertionProxy *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_remoteProcessHandle);
  v25 = 0;
  v9 = objc_msgSend(v7, "checkEntitlementSourceForRequiredEntitlements:error:", WeakRetained, &v25);
  v10 = v25;
  v11 = v10;
  if ((v9 & 1) != 0 || v10)
  {
    if (v10)
    {
      v12 = 0;
      if (!a4)
      {
LABEL_6:

        return v12;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE0FA00], "currentContext");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_alloc(MEMORY[0x24BE0B840]);
      objc_msgSend(v14, "remoteProcess");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "pid");
      v12 = (void *)objc_msgSend(v15, "initWithClientPid:hostPid:count:", v17, getpid(), objc_msgSend(MEMORY[0x24BE0B840], "nextCount"));

      v18 = [BLSHAssertionProxy alloc];
      objc_msgSend(v14, "remoteTarget");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[BLSHAssertionProxy initWithIdentifier:descriptor:remoteTarget:](v18, "initWithIdentifier:descriptor:remoteTarget:", v12, v7, v19);

      -[BLSHXPCAssertionServiceHost setProxy:forIdentifier:]((uint64_t)self, v20, v12);
      -[BLSAssertionService acquireAssertion:](self->_localService, "acquireAssertion:", v20);

      if (!a4)
        goto LABEL_6;
    }
    *a4 = objc_retainAutorelease(v11);
    goto LABEL_6;
  }
  v21 = (void *)MEMORY[0x24BDD17C8];
  v22 = (int)objc_msgSend(WeakRetained, "pid");
  objc_msgSend(WeakRetained, "bundleIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("checkEntitlementSourceForRequiredEntitlements returned NO but did not provide an error for process:%ld:'%@' descriptor:%@"), v22, v23, v7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[BLSHXPCAssertionServiceHost acquireAssertionForDescriptor:error:].cold.1(a2, (uint64_t)self, (uint64_t)v24);
  objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
  result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)acquireAssertion:(id)a3
{
  BLSAssertionService *localService;
  id v4;

  localService = self->_localService;
  -[BLSHXPCAssertionServiceHost proxyForIdentifier:]((os_unfair_lock_s *)self, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BLSAssertionService acquireAssertion:](localService, "acquireAssertion:", v4);

}

- (void)cancelAssertion:(id)a3 withError:(id)a4
{
  BLSAssertionService *localService;
  id v7;
  id v8;

  localService = self->_localService;
  v7 = a4;
  -[BLSHXPCAssertionServiceHost proxyForIdentifier:]((os_unfair_lock_s *)self, a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[BLSAssertionService cancelAssertion:withError:](localService, "cancelAssertion:withError:", v8, v7);

}

- (void)restartAssertionTimeoutTimer:(id)a3
{
  BLSAssertionService *localService;
  id v4;

  localService = self->_localService;
  -[BLSHXPCAssertionServiceHost proxyForIdentifier:]((os_unfair_lock_s *)self, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BLSAssertionService restartAssertionTimeoutTimer:](localService, "restartAssertionTimeoutTimer:", v4);

}

- (void)destroyAssertion:(id)a3
{
  -[BLSHXPCAssertionServiceHost removeProxyForIdentifier:]((uint64_t)self, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertionProxies, 0);
  objc_destroyWeak((id *)&self->_remoteProcessHandle);
  objc_storeStrong((id *)&self->_localService, 0);
}

- (void)acquireAssertionForDescriptor:(uint64_t)a3 error:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("BLSHXPCAssertionServiceHost.m");
  v16 = 1024;
  v17 = 105;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_2145AC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
