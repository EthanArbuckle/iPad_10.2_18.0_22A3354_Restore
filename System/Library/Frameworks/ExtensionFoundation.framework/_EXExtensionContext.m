@implementation _EXExtensionContext

- (_EXExtensionContext)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_EXExtensionContext;
  return -[_EXExtensionContext init](&v3, sel_init);
}

- (BOOL)shouldAcceptXPCConnection:(id)a3
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  BOOL result;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  void *v15;

  v3 = a3;
  _EXDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315906;
    v9 = "/Library/Caches/com.apple.xbs/Sources/ExtensionFoundation/ExtensionFoundation/Source/EXExtension/Extension/Inte"
         "rnal/Shim/EXExtensionContext.m";
    v10 = 1024;
    v11 = 21;
    v12 = 2080;
    v13 = "-[_EXExtensionContext shouldAcceptXPCConnection:]";
    v14 = 2112;
    v15 = v6;

  }
  __break(1u);
  return result;
}

- (id)makeXPCConnectionWithError:(id *)a3
{
  void *v4;
  void *v5;

  -[_EXExtensionContext internalImplementation](self, "internalImplementation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "makeXPCConnectionWithError:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)invalidate
{
  id v2;

  -[_EXExtensionContext internalImplementation](self, "internalImplementation");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (void)completeRequestWithHandler:(id)a3
{
  void (**v4)(id, uint64_t);

  v4 = (void (**)(id, uint64_t))a3;
  -[_EXExtensionContext invalidate](self, "invalidate");
  v4[2](v4, 1);

}

- (void)completeRequestReturningItems:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, _QWORD);
  NSObject *v7;

  v6 = (void (**)(id, _QWORD))a4;
  if (objc_msgSend(a3, "count"))
  {
    _EXDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[_EXExtensionContext completeRequestReturningItems:completionHandler:].cold.1(v7);

    -[_EXExtensionContext invalidate](self, "invalidate");
    v6[2](v6, 0);
  }
  else
  {
    -[_EXExtensionContext invalidate](self, "invalidate");
    v6[2](v6, 1);
  }

}

- (void)completeRequestReturningItems:(os_log_t)log completionHandler:.cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136446210;
  v2 = "-[_EXExtensionContext completeRequestReturningItems:completionHandler:]";
  _os_log_fault_impl(&dword_190C25000, log, OS_LOG_TYPE_FAULT, "'%{public}s' called with items. This is not supported!", (uint8_t *)&v1, 0xCu);
}

@end
