@implementation FBSWorkspaceScenesClientIdentifier

+ (FBSWorkspaceScenesClientIdentifier)identifierWithHostEndpoint:(uint64_t)a1
{
  id v2;
  FBSWorkspaceScenesClientIdentifier *v3;
  uint64_t v4;
  BSServiceConnectionEndpoint *hostEndpoint;
  BSServiceConnectionHost *peer;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *description;
  uint64_t v12;
  FBSWorkspaceScenesClientIdentifier *result;
  void *v14;

  v2 = a2;
  objc_opt_self();
  if (v2)
  {
    v3 = objc_alloc_init(FBSWorkspaceScenesClientIdentifier);
    v4 = objc_msgSend(v2, "copy");
    hostEndpoint = v3->_hostEndpoint;
    v3->_hostEndpoint = (BSServiceConnectionEndpoint *)v4;

    peer = v3->_peer;
    v3->_peer = 0;

    objc_msgSend(v2, "instance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v2, "targetDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@:%@"), v9, v7);
      v10 = objc_claimAutoreleasedReturnValue();
      description = v3->_description;
      v3->_description = (NSString *)v10;

    }
    else
    {
      objc_msgSend(v2, "targetDescription");
      v12 = objc_claimAutoreleasedReturnValue();
      v9 = v3->_description;
      v3->_description = (NSString *)v12;
    }

    return v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("hostEndpoint"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSWorkspaceScenesClientIdentifier identifierWithHostEndpoint:].cold.1();
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    result = (FBSWorkspaceScenesClientIdentifier *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

+ (FBSWorkspaceScenesClientIdentifier)identifierWithPeer:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  FBSWorkspaceScenesClientIdentifier *v6;
  BSServiceConnectionEndpoint *hostEndpoint;
  uint64_t v8;
  NSString *description;
  FBSWorkspaceScenesClientIdentifier *result;
  void *v11;

  v3 = a2;
  objc_opt_self();
  if (v3)
  {
    objc_msgSend(v3, "remoteToken");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "pid");

    if ((int)v5 < 1)
    {
      v6 = 0;
    }
    else
    {
      v6 = objc_alloc_init(FBSWorkspaceScenesClientIdentifier);
      hostEndpoint = v6->_hostEndpoint;
      v6->_hostEndpoint = 0;

      objc_storeStrong((id *)&v6->_peer, a2);
      v6->_host = v5;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%i(%p)"), v5, v3);
      v8 = objc_claimAutoreleasedReturnValue();
      description = v6->_description;
      v6->_description = (NSString *)v8;

    }
    return v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("peer"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSWorkspaceScenesClientIdentifier identifierWithPeer:].cold.1();
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    result = (FBSWorkspaceScenesClientIdentifier *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (unint64_t)hash
{
  BSServiceConnectionEndpoint *hostEndpoint;

  hostEndpoint = self->_hostEndpoint;
  if (!hostEndpoint)
    hostEndpoint = self->_peer;
  return -[BSServiceConnectionEndpoint hash](hostEndpoint, "hash");
}

- (BOOL)isEqual:(id)a3
{
  FBSWorkspaceScenesClientIdentifier *v4;
  uint64_t v5;
  char v6;

  v4 = (FBSWorkspaceScenesClientIdentifier *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class() && BSEqualObjects())
      v6 = BSEqualObjects();
    else
      v6 = 0;
  }

  return v6;
}

- (id)tokenWithIdentity:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (*(_QWORD *)(a1 + 16))
    {
      v5 = *(unsigned int *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0D87D80], "identityOfCurrentProcess");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "internalWorkspaceIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[FBSSceneIdentityToken tokenWithHostPID:directEndpointTarget:workspace:identifier:](FBSSceneIdentityToken, "tokenWithHostPID:directEndpointTarget:workspace:identifier:", v5, v6, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = *(_QWORD *)(a1 + 8);
      objc_msgSend(v3, "internalWorkspaceIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[FBSSceneIdentityToken tokenWithHostEndpoint:workspace:identifier:](FBSSceneIdentityToken, "tokenWithHostEndpoint:workspace:identifier:", v10, v6, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)description
{
  return self->_description;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_peer, 0);
  objc_storeStrong((id *)&self->_hostEndpoint, 0);
}

+ (void)identifierWithHostEndpoint:.cold.1()
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

+ (void)identifierWithPeer:.cold.1()
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
