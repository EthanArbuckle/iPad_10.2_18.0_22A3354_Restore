@implementation LNPerformActionExecutorDelegateProxy

- (LNPerformActionExecutorDelegateProxy)initWithConnection:(id)a3 interface:(id)a4
{
  id v5;

  v5 = a3;
  swift_unknownObjectRetain();
  return (LNPerformActionExecutorDelegateProxy *)PerformActionExecutorDelegateProxy.init(connection:interface:)(v5, (uint64_t)a4);
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
  void *v4;
  uint64_t v5;
  LNPerformActionExecutorDelegateProxy *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = self;
  v6 = self;
  sub_227EDA224((uint64_t)&unk_255941450, v5);
}

- (void)requestContinueInApp:(id)a3 completionHandler:(id)a4
{
  sub_228056D60(self, (int)a2, (uint64_t)a3, a4);
}

- (void)requestOpenURL:(id)a3 completionHandler:(id)a4
{
  sub_228056D60(self, (int)a2, (uint64_t)a3, a4);
}

- (BOOL)requestCancelTimeoutAndReturnError:(id *)a3
{
  return sub_228057088(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))sub_228056E4C);
}

- (BOOL)requestExtendTimeoutAndReturnError:(id *)a3
{
  return sub_228057088(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))sub_228056E84);
}

- (int64_t)connectionIdentifier
{
  LNPerformActionExecutorDelegateProxy *v2;
  id v3;

  v2 = self;
  v3 = sub_22805712C();

  return (int64_t)v3;
}

- (BOOL)hasValidConnection
{
  LNPerformActionExecutorDelegateProxy *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_2280571A4();

  return v3;
}

- (LNPerformActionExecutorDelegateProxy)init
{
  PerformActionExecutorDelegateProxy.init()();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectWeakDestroy();
}

@end
