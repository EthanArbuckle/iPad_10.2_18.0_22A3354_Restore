@implementation _FBSDisplayLayoutEndpointServices

+ (void)_checkinService:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v3 = a3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("service"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[_FBSDisplayLayoutEndpointServices _checkinService:].cold.1();
LABEL_22:
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6F3BDCLL);
  }
  v17 = v3;
  objc_msgSend(v3, "endpoint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&__sharedEndpointServicesLock);
  objc_msgSend((id)__sharedEndpointServices, "objectForKey:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v17;
  v7 = (void *)v5;
  if (v5)
  {
    v8 = 0;
    v9 = v5 + 8;
    v10 = v5 + 32;
    v11 = 1;
    do
    {
      while (1)
      {
        v12 = *(_QWORD *)(v10 + 8 * v8);
        if (*(void **)(v9 + 8 * v8) == v6)
          break;
        v11 &= v12 == 0;
LABEL_6:
        if (++v8 == 3)
        {
          if ((v11 & 1) != 0)
          {
            objc_msgSend((id)__sharedEndpointServices, "removeObjectForKey:", v4);
            if (!objc_msgSend((id)__sharedEndpointServices, "count"))
            {
              v15 = (void *)__sharedEndpointServices;
              __sharedEndpointServices = 0;

            }
          }
          goto LABEL_16;
        }
      }
      if (!v12)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid refcnt for qos=%i endpoint=%@"), v8, v4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          +[_FBSDisplayLayoutEndpointServices _checkinService:].cold.2();
        goto LABEL_22;
      }
      v13 = v12 - 1;
      *(_QWORD *)(v10 + 8 * v8) = v13;
      if (!v13)
      {
        objc_msgSend(v6, "invalidate");
        v14 = *(void **)(v9 + 8 * v8);
        *(_QWORD *)(v9 + 8 * v8) = 0;

        v6 = v17;
        goto LABEL_6;
      }
      v11 = 0;
      ++v8;
    }
    while (v8 != 3);
  }
LABEL_16:
  os_unfair_lock_unlock((os_unfair_lock_t)&__sharedEndpointServicesLock);

}

+ (id)_checkoutServiceWithEndpoint:(id)a3 qos:(char)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char *v13;
  char *v14;
  char *v15;
  void *v16;
  id v17;
  void *v19;
  void *v20;

  v4 = a4;
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("endpoint"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[_FBSDisplayLayoutEndpointServices _checkoutServiceWithEndpoint:qos:].cold.1();
LABEL_19:
    objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6F4544);
  }
  v6 = v5;
  +[FBSDisplayLayoutMonitor serviceIdentifier](FBSDisplayLayoutMonitor, "serviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("endpoint's service is unexpected : %@"), v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[_FBSDisplayLayoutEndpointServices _checkoutServiceWithEndpoint:qos:].cold.3();
    objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6F45A0);
  }
  if (v4 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid QOS %d"), (int)v4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[_FBSDisplayLayoutEndpointServices _checkoutServiceWithEndpoint:qos:].cold.2();
    goto LABEL_19;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&__sharedEndpointServicesLock);
  v10 = (void *)__sharedEndpointServices;
  if (!__sharedEndpointServices)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)__sharedEndpointServices;
    __sharedEndpointServices = v11;

    v10 = (void *)__sharedEndpointServices;
  }
  objc_msgSend(v10, "objectForKey:", v6);
  v13 = (char *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v13 = (char *)objc_opt_new();
    objc_msgSend((id)__sharedEndpointServices, "setObject:forKey:", v13, v6);
  }
  v14 = &v13[8 * v4];
  v16 = (void *)*((_QWORD *)v14 + 1);
  v15 = v14 + 8;
  ++*((_QWORD *)v15 + 3);
  v17 = v16;
  if (!v17)
  {
    v17 = -[_FBSDisplayLayoutService _initWithEndpoint:qos:]([_FBSDisplayLayoutService alloc], "_initWithEndpoint:qos:", v6, v4);
    objc_storeStrong((id *)v15, v17);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&__sharedEndpointServicesLock);

  return v17;
}

- (void).cxx_destruct
{
  uint64_t v3;

  v3 = 24;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

+ (void)_checkoutServiceWithEndpoint:qos:.cold.1()
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

+ (void)_checkoutServiceWithEndpoint:qos:.cold.2()
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

+ (void)_checkoutServiceWithEndpoint:qos:.cold.3()
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

+ (void)_checkinService:.cold.1()
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

+ (void)_checkinService:.cold.2()
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
