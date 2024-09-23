@implementation NSPFlowDivertProvider

- (NSPFlowDivertProvider)init
{
  NSPFlowDivertProvider *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSPFlowDivertProvider;
  v2 = -[NEProvider init](&v5, sel_init);
  if (v2)
  {
    +[NSPManager sharedManager](NSPManager, "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSPFlowDivertProvider setManager:](v2, "setManager:", v3);

  }
  return v2;
}

- (void)startProxyWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  int v9;
  NSPFlowDivertProvider *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  nplog_obj();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = 138412546;
    v10 = self;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_19E8FE000, v8, OS_LOG_TYPE_INFO, "%@: NSPFlowDivertProvider: starting with options %@", (uint8_t *)&v9, 0x16u);
  }

  v7[2](v7, 0);
}

- (void)stopProxyWithReason:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  NSPFlowDivertProvider *v10;
  __int16 v11;
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  nplog_obj();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = 138412546;
    v10 = self;
    v11 = 2048;
    v12 = a3;
    _os_log_impl(&dword_19E8FE000, v7, OS_LOG_TYPE_INFO, "%@: NSPFlowDivertProvider: stopping with reason %ld", (uint8_t *)&v9, 0x16u);
  }

  -[NSPFlowDivertProvider manager](self, "manager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stopWithCompletionHandler:", v6);

}

- (BOOL)handleNewFlow:(id)a3
{
  id v3;
  NPAppProxyFlowBridge *v4;
  void *v5;
  NPAppProxyFlowBridge *v6;

  v3 = a3;
  kdebug_trace();
  v4 = [NPAppProxyFlowBridge alloc];
  v5 = (void *)nw_context_copy_implicit_context();
  v6 = -[NPAppProxyFlowBridge initWithAppProxyFlow:nwContext:](v4, "initWithAppProxyFlow:nwContext:", v3, v5);

  return 1;
}

- (NSPManager)manager
{
  return (NSPManager *)objc_getProperty(self, a2, 64, 1);
}

- (void)setManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
}

@end
