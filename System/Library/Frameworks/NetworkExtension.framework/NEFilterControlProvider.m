@implementation NEFilterControlProvider

- (void)handleNewFlow:(NEFilterFlow *)flow completionHandler:(void *)completionHandler
{
  NEFilterFlow *v6;
  void (**v7)(void *, _QWORD);
  NSObject *v8;
  int v9;
  NEFilterControlProvider *v10;
  __int16 v11;
  NEFilterFlow *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = flow;
  v7 = completionHandler;
  ne_log_obj();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = 138412546;
    v10 = self;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_19BD16000, v8, OS_LOG_TYPE_INFO, "%@: Handle new flow: %@", (uint8_t *)&v9, 0x16u);
  }

  v7[2](v7, 0);
}

- (void)handleRemediationForFlow:(NEFilterFlow *)flow completionHandler:(void *)completionHandler
{
  NEFilterFlow *v6;
  void (**v7)(void *, _QWORD);
  NSObject *v8;
  int v9;
  NEFilterControlProvider *v10;
  __int16 v11;
  NEFilterFlow *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = flow;
  v7 = completionHandler;
  ne_log_obj();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = 138412546;
    v10 = self;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_19BD16000, v8, OS_LOG_TYPE_INFO, "%@: Handle remediation for flow: %@", (uint8_t *)&v9, 0x16u);
  }

  v7[2](v7, 0);
}

- (void)notifyRulesChanged
{
  NSObject *v3;
  void *v4;
  int v5;
  NEFilterControlProvider *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  ne_log_obj();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_impl(&dword_19BD16000, v3, OS_LOG_TYPE_INFO, "%@: Notify rules changed", (uint8_t *)&v5, 0xCu);
  }

  -[NEProvider context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notifyRulesChanged");

}

- (NSDictionary)remediationMap
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRemediationMap:(NSDictionary *)remediationMap
{
  objc_setProperty_atomic_copy(self, a2, remediationMap, 48);
}

- (NSDictionary)URLAppendStringMap
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setURLAppendStringMap:(NSDictionary *)URLAppendStringMap
{
  objc_setProperty_atomic_copy(self, a2, URLAppendStringMap, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URLAppendStringMap, 0);
  objc_storeStrong((id *)&self->_remediationMap, 0);
}

@end
