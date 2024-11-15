@implementation FMDExtHostContext

- (FMDExtHostContext)init
{
  NSObject *v3;
  objc_super v5;
  uint8_t buf[16];

  LogCategory_Extensions();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9939000, v3, OS_LOG_TYPE_DEFAULT, "#ext - alloced host context instance", buf, 2u);
  }

  v5.receiver = self;
  v5.super_class = (Class)FMDExtHostContext;
  return -[FMDExtHostContext init](&v5, sel_init);
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FMDExtHostContext;
  if (-[FMDExtHostContext respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    v4 = 1;
  }
  else
  {
    -[FMDExtHostContext accessoryDelegate](self, "accessoryDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

  }
  return v4 & 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FMDExtHostContext;
  -[FMDExtHostContext methodSignatureForSelector:](&v8, sel_methodSignatureForSelector_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[FMDExtHostContext accessoryDelegate](self, "accessoryDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "methodSignatureForSelector:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[FMDExtHostContext accessoryDelegate](self, "accessoryDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selector");
  v6 = objc_opt_respondsToSelector();

  LogCategory_Extensions();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v6 & 1) != 0)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[FMDExtHostContext accessoryDelegate](self, "accessoryDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v4;
      v12 = 2112;
      v13 = v9;
      _os_log_impl(&dword_1C9939000, v8, OS_LOG_TYPE_DEFAULT, "HostContext forwardInvocation %@ to delegate %@", (uint8_t *)&v10, 0x16u);

    }
    -[FMDExtHostContext accessoryDelegate](self, "accessoryDelegate");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invokeWithTarget:", v8);
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    -[FMDExtHostContext forwardInvocation:].cold.1(v4, v8);
  }

}

- (FMDExtAccessoryDelegateProtocol)accessoryDelegate
{
  return self->_accessoryDelegate;
}

- (void)setAccessoryDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryDelegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryDelegate, 0);
}

- (void)forwardInvocation:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector((SEL)objc_msgSend(a1, "selector"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1C9939000, a2, OS_LOG_TYPE_ERROR, "Invocation %@ not supported skipping completion block", (uint8_t *)&v4, 0xCu);

}

@end
