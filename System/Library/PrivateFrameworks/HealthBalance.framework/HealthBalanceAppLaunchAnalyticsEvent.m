@implementation HealthBalanceAppLaunchAnalyticsEvent

- (BOOL)isEventSubmissionIHAGated
{
  return 0;
}

- (NSString)eventName
{
  return (NSString *)(id)sub_23DC2A220();
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unsigned __int8 v12;

  v5 = a3;
  swift_retain();
  v6 = objc_msgSend(v5, sel_environmentDataSource);
  v7 = self->needsOnboarding[0];
  v12 = self->source[0];
  sub_23DBFA190(v6, v7, &v12);
  v9 = v8;

  sub_23DBF7FC4(v9);
  swift_release();

  swift_bridgeObjectRelease();
  v10 = (void *)sub_23DC2A16C();
  swift_bridgeObjectRelease();
  return v10;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;

  v4 = a3;
  swift_retain();
  sub_23DBF97DC(v4);
  swift_release();

  v5 = (void *)sub_23DC2A16C();
  swift_bridgeObjectRelease();
  return v5;
}

@end
