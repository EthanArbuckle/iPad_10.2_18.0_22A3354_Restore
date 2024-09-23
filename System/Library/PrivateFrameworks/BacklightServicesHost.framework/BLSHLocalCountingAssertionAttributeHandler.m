@implementation BLSHLocalCountingAssertionAttributeHandler

- (id)initForService:(id)a3
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BLSHLocalCountingAssertionAttributeHandler;
  v3 = -[BLSHLocalAssertionAttributeHandler initForService:](&v7, sel_initForService_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v3[4];
    v3[4] = v4;

    *((_DWORD *)v3 + 10) = 0;
  }
  return v3;
}

+ (id)attributeClasses
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  id result;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;

  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ must subclass BLSHLocalCountingAssertionAttributeHandler and override %@"), a1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v12 = v7;
    v13 = 2114;
    v14 = v9;
    v15 = 2048;
    v16 = a1;
    v17 = 2114;
    v18 = CFSTR("BLSHLocalCountingAssertionAttributeHandler.m");
    v19 = 1024;
    v20 = 41;
    v21 = 2114;
    v22 = v6;
    _os_log_error_impl(&dword_2145AC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
  result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (Class)attributeBaseClass
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  Class result;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;

  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ must subclass BLSHLocalCountingAssertionAttributeHandler and override %@"), a1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v12 = v7;
    v13 = 2114;
    v14 = v9;
    v15 = 2048;
    v16 = a1;
    v17 = 2114;
    v18 = CFSTR("BLSHLocalCountingAssertionAttributeHandler.m");
    v19 = 1024;
    v20 = 46;
    v21 = 2114;
    v22 = v6;
    _os_log_error_impl(&dword_2145AC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
  result = (Class)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (Class)entryClass
{
  return (Class)objc_opt_class();
}

- (void)activateWithFirstEntry:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  BLSHLocalCountingAssertionAttributeHandler *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;

  v5 = a3;
  v6 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ must subclass BLSHLocalCountingAssertionAttributeHandler and override %@"), self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v13 = v9;
    v14 = 2114;
    v15 = v11;
    v16 = 2048;
    v17 = self;
    v18 = 2114;
    v19 = CFSTR("BLSHLocalCountingAssertionAttributeHandler.m");
    v20 = 1024;
    v21 = 55;
    v22 = 2114;
    v23 = v8;
    _os_log_error_impl(&dword_2145AC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (void)deactivateWithFinalEntry:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  BLSHLocalCountingAssertionAttributeHandler *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;

  v5 = a3;
  v6 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ must subclass BLSHLocalCountingAssertionAttributeHandler and override %@"), self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v13 = v9;
    v14 = 2114;
    v15 = v11;
    v16 = 2048;
    v17 = self;
    v18 = 2114;
    v19 = CFSTR("BLSHLocalCountingAssertionAttributeHandler.m");
    v20 = 1024;
    v21 = 59;
    v22 = 2114;
    v23 = v8;
    _os_log_error_impl(&dword_2145AC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (id)countingTargetForEntry:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null", a3);
}

- (id)entriesForCountingTarget:(id)a3
{
  os_unfair_lock_s *p_countingDictionaryLock;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  p_countingDictionaryLock = &self->_countingDictionaryLock;
  v5 = a3;
  os_unfair_lock_lock(p_countingDictionaryLock);
  -[NSMutableDictionary objectForKey:](self->_lock_entryDictionary, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  os_unfair_lock_unlock(p_countingDictionaryLock);
  return v8;
}

- (void)incrementCountWithEntry:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  BOOL v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    objc_msgSend((id)a1, "countingTargetForEntry:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD15C0]), "initWithOptions:capacity:", 517, 2);
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, v4);
    }
    v6 = objc_msgSend(v5, "count");
    objc_msgSend(v5, "addObject:", v3);
    v7 = objc_msgSend(v5, "count");
    bls_assertions_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v10 = 134219266;
      v11 = a1;
      v12 = 2114;
      v13 = a1;
      v14 = 1024;
      v15 = v6;
      v16 = 1024;
      v17 = v7;
      v18 = 2114;
      v19 = v3;
      v20 = 2114;
      v21 = v4;
      _os_log_debug_impl(&dword_2145AC000, v8, OS_LOG_TYPE_DEBUG, "%p handler:%{public}@ increment count:%u->%u with entry:%{public}@ -> countingTarget:%{public}@", (uint8_t *)&v10, 0x36u);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    if (v6)
      v9 = 0;
    else
      v9 = v7 == 1;
    if (v9)
      objc_msgSend((id)a1, "activateWithFirstEntry:", v3);

  }
}

- (void)decrementCountWithEntry:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    objc_msgSend((id)a1, "countingTargetForEntry:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");
    objc_msgSend(v5, "removeObject:", v3);
    v7 = objc_msgSend(v5, "count");
    bls_assertions_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v10 = 134219266;
      v11 = a1;
      v12 = 2114;
      v13 = a1;
      v14 = 1024;
      v15 = v6;
      v16 = 1024;
      v17 = v7;
      v18 = 2048;
      v19 = v5;
      v20 = 2114;
      v21 = v3;
      _os_log_debug_impl(&dword_2145AC000, v8, OS_LOG_TYPE_DEBUG, "%p handler:%{public}@ decrement count:%u->%u for %p with entry:%{public}@", (uint8_t *)&v10, 0x36u);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    if (v6 == 1 && v7 == 0)
      objc_msgSend((id)a1, "deactivateWithFinalEntry:", v3);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_entryDictionary, 0);
}

@end
