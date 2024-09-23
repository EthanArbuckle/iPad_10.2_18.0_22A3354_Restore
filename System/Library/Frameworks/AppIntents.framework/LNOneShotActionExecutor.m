@implementation LNOneShotActionExecutor

- (int64_t)connectionIdentifier
{
  return 0;
}

- (BOOL)hasValidConnection
{
  return 0;
}

- (LNOneShotActionExecutor)initWithAction:(id)a3 executorOptions:(id)a4 appContext:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  return (LNOneShotActionExecutor *)OneShotActionExecutor.init(action:executorOptions:appContext:)();
}

- (void)performWithCompletionHandler:(id)a3
{
  sub_22808FE60(self, (int)a2, a3);
}

- (LNOneShotActionExecutor)init
{
  OneShotActionExecutor.init()();
}

- (void).cxx_destruct
{

}

- (void)requestActionConfirmation:(id)a3 completionHandler:(id)a4
{
  sub_228056D60(self, (int)a2, (uint64_t)a3, a4);
}

- (void)requestParameterConfirmation:(id)a3 completionHandler:(id)a4
{
  sub_228056D60(self, (int)a2, (uint64_t)a3, a4);
}

- (void)requestParameterDisambiguation:(id)a3 completionHandler:(id)a4
{
  sub_228056D60(self, (int)a2, (uint64_t)a3, a4);
}

- (void)requestParameterNeedsValue:(id)a3 completionHandler:(id)a4
{
  sub_228056D60(self, (int)a2, (uint64_t)a3, a4);
}

- (void)requestViewSnippetEnvironmentWithCompletionHandler:(id)a3
{
  sub_22808FE60(self, (int)a2, a3);
}

- (BOOL)requestCancelTimeoutAndReturnError:(id *)a3
{
  return sub_22808FFD8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))OneShotActionExecutor.requestCancelTimeout());
}

- (BOOL)requestExtendTimeoutAndReturnError:(id *)a3
{
  return sub_22808FFD8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))OneShotActionExecutor.requestExtendTimeout());
}

- (void)requestContinueInApp:(id)a3 completionHandler:(id)a4
{
  sub_228056D60(self, (int)a2, (uint64_t)a3, a4);
}

- (void)requestOpenURL:(id)a3 completionHandler:(id)a4
{
  sub_228056D60(self, (int)a2, (uint64_t)a3, a4);
}

@end
