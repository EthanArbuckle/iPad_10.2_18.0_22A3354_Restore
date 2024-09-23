@implementation ASDTestFlightServiceExtension

- (void)didReceivePushToken:(id)a3 reply:(id)a4
{
  (*((void (**)(id, uint64_t, _QWORD))a4 + 2))(a4, 1, 0);
}

- (void)didReceivePushMessages:(id)a3 reply:(id)a4
{
  (*((void (**)(id, uint64_t, _QWORD))a4 + 2))(a4, 1, 0);
}

- (void)didReachTerminalPhaseWithBetaBundleID:(id)a3 terminalPhase:(int64_t)a4 error:(id)a5 reply:(id)a6
{
  (*((void (**)(id, uint64_t, _QWORD))a6 + 2))(a6, 1, 0);
}

- (void)reloadAppsFromServerWithReply:(id)a3
{
  (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(a3, 1, 0);
}

- (void)invokeCommand:(id)a3 withArguments:(id)a4 reply:(id)a5
{
  (*((void (**)(id, uint64_t, _QWORD))a5 + 2))(a5, 1, 0);
}

- (void)beginRequestWithExtensionContext:(id)a3
{
  char isKindOfClass;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (v7 && (isKindOfClass & 1) != 0)
  {
    v5 = v7;
    objc_msgSend(v5, "setExtensionInstance:", self);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("context is not an instance of ASDTestFlightServiceExtensionRemoteContext: context='%@'"), v7);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    ASDErrorWithUnderlyingErrorAndDescription(0, CFSTR("ASDTestFlightServiceErrorDomain"), 901, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cancelRequestWithError:", v6);

  }
}

@end
