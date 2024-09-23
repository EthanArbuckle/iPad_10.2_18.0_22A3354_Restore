@implementation FBSSceneHostHandle

+ (FBSSceneHostHandle)handleWithAuditToken:(id)a3
{
  id v5;
  int v6;
  FBSSceneHostHandle *v7;

  v5 = a3;
  v6 = objc_msgSend(v5, "pid");
  if (v6 == getpid())
  {
    objc_msgSend(a1, "localHandle");
    v7 = (FBSSceneHostHandle *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_alloc_init(FBSSceneHostHandle);
    objc_storeStrong((id *)&v7->_auditToken, a3);
  }

  return v7;
}

+ (id)localHandle
{
  if (localHandle_onceToken != -1)
    dispatch_once(&localHandle_onceToken, &__block_literal_global_24);
  return (id)localHandle_local;
}

void __33__FBSSceneHostHandle_localHandle__block_invoke()
{
  FBSSceneHostHandle *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = objc_alloc_init(FBSSceneHostHandle);
  v1 = (void *)localHandle_local;
  localHandle_local = (uint64_t)v0;

  *(_BYTE *)(localHandle_local + 8) = 1;
  objc_msgSend(off_1E38E9DD8, "tokenForCurrentProcess");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(localHandle_local + 16);
  *(_QWORD *)(localHandle_local + 16) = v2;

}

- (id)description
{
  _BOOL4 local;
  void *v4;
  objc_class *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v10;

  local = self->_local;
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (local)
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p; local>"), v6, self, v10);
  else
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p; pid %u>"),
      v6,
      self,
      -[BSAuditToken pid](self->_auditToken, "pid"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isLocal
{
  return self->_local;
}

- (BSAuditToken)auditToken
{
  return self->_auditToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auditToken, 0);
}

@end
