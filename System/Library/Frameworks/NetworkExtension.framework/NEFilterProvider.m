@implementation NEFilterProvider

- (void)startFilterWithCompletionHandler:(void *)completionHandler
{
  void (**v4)(void *, _QWORD);
  NSObject *v5;
  int v6;
  NEFilterProvider *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = completionHandler;
  ne_log_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138412290;
    v7 = self;
    _os_log_impl(&dword_19BD16000, v5, OS_LOG_TYPE_INFO, "%@: Start Filter", (uint8_t *)&v6, 0xCu);
  }

  v4[2](v4, 0);
}

- (void)stopFilterWithReason:(NEProviderStopReason)reason completionHandler:(void *)completionHandler
{
  void (**v6)(_QWORD);
  NSObject *v7;
  int v8;
  NEFilterProvider *v9;
  __int16 v10;
  NEProviderStopReason v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = completionHandler;
  ne_log_obj();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 138412546;
    v9 = self;
    v10 = 2048;
    v11 = reason;
    _os_log_impl(&dword_19BD16000, v7, OS_LOG_TYPE_INFO, "%@: Stop Filter with reason %ld", (uint8_t *)&v8, 0x16u);
  }

  v6[2](v6);
}

- (void)handleReport:(NEFilterReport *)report
{
  NEFilterReport *v4;
  NSObject *v5;
  int v6;
  NEFilterProvider *v7;
  __int16 v8;
  NEFilterReport *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = report;
  ne_log_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138412546;
    v7 = self;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_19BD16000, v5, OS_LOG_TYPE_INFO, "%@: handleReport %@", (uint8_t *)&v6, 0x16u);
  }

}

- (NEFilterProviderConfiguration)filterConfiguration
{
  return (NEFilterProviderConfiguration *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFilterConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterConfiguration, 0);
}

+ (__CFString)descriptionForAction:(uint64_t)a1
{
  __CFString *v3;

  objc_opt_self();
  if ((unint64_t)(a2 - 1) >= 4)
    v3 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid (%ld)"), a2);
  else
    v3 = off_1E3CC0500[a2 - 1];
  return v3;
}

@end
