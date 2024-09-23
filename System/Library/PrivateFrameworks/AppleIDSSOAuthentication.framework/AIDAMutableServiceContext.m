@implementation AIDAMutableServiceContext

- (void)setAuthenticationResults:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *telemetryTimeSeries;

  v5 = a3;
  objc_storeStrong((id *)&self->super._authenticationResults, a3);
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFFC0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _AIDALogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8)
      -[AIDAMutableServiceContext setAuthenticationResults:].cold.2((uint64_t)v6, v7);
  }
  else if (v8)
  {
    -[AIDAMutableServiceContext setAuthenticationResults:].cold.1(v7);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v6;
  else
    v9 = 0;
  v10 = (NSMutableDictionary *)objc_msgSend(v9, "mutableCopy");
  telemetryTimeSeries = self->super.__telemetryTimeSeries;
  self->super.__telemetryTimeSeries = v10;

}

- (void)setShouldForceOperation:(BOOL)a3
{
  self->super._shouldForceOperation = a3;
}

- (void)setOperationUIPermissions:(int64_t)a3
{
  self->super._operationUIPermissions = a3;
}

- (void)setSignInContexts:(id)a3
{
  objc_storeStrong((id *)&self->super._signInContexts, a3);
}

- (void)setSignOutContexts:(id)a3
{
  objc_storeStrong((id *)&self->super._signOutContexts, a3);
}

- (void)setAaSignInFlowControllerDelegate:(id)a3
{
  AASignInFlowControllerDelegate *v4;
  void *v5;
  void *v6;
  id v7;
  AASignInFlowControllerDelegate *aaSignInFlowControllerDelegate;
  id v9;

  v4 = (AASignInFlowControllerDelegate *)a3;
  v5 = (void *)-[NSDictionary mutableCopy](self->super._signInContexts, "mutableCopy");
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v7;

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v4, CFSTR("com.apple.AppleID.Service.Cloud"));
  -[AIDAMutableServiceContext setSignInContexts:](self, "setSignInContexts:", v9);
  aaSignInFlowControllerDelegate = self->super._aaSignInFlowControllerDelegate;
  self->super._aaSignInFlowControllerDelegate = v4;

}

- (void)setAaSignOutFlowControllerDelegate:(id)a3
{
  AASignOutFlowControllerDelegate *v4;
  void *v5;
  void *v6;
  id v7;
  AASignOutFlowControllerDelegate *aaSignOutFlowControllerDelegate;
  id v9;

  v4 = (AASignOutFlowControllerDelegate *)a3;
  v5 = (void *)-[NSDictionary mutableCopy](self->super._signOutContexts, "mutableCopy");
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v7;

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v4, CFSTR("com.apple.AppleID.Service.Cloud"));
  -[AIDAMutableServiceContext setSignOutContexts:](self, "setSignOutContexts:", v9);
  aaSignOutFlowControllerDelegate = self->super._aaSignOutFlowControllerDelegate;
  self->super._aaSignOutFlowControllerDelegate = v4;

}

- (void)setCdpUiProvider:(id)a3
{
  objc_storeWeak((id *)&self->super._cdpUiProvider, a3);
}

- (void)setViewController:(id)a3
{
  objc_storeStrong((id *)&self->super._viewController, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  +[AIDAServiceContext contextWithContext:](AIDAServiceContext, "contextWithContext:", self);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  +[AIDAServiceContext contextWithContext:](AIDAMutableServiceContext, "contextWithContext:", self);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setAuthenticationResults:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D4C1F000, log, OS_LOG_TYPE_DEBUG, "AIDAMutableServiceContext cannot extract time series", v1, 2u);
}

- (void)setAuthenticationResults:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1D4C1F000, a2, OS_LOG_TYPE_DEBUG, "AIDAMutableServiceContext extracted time series from auth results: %@", (uint8_t *)&v2, 0xCu);
}

@end
