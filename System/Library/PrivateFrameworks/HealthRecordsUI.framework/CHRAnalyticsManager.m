@implementation CHRAnalyticsManager

+ (CHRAnalyticsManager)shared
{
  if (qword_1ED6A3198 != -1)
    swift_once();
  return (CHRAnalyticsManager *)(id)qword_1ED6A42A0;
}

- (CHRAnalyticsManager)init
{
  return (CHRAnalyticsManager *)AnalyticsManager.init()();
}

- (void)submitAndFlushQueuedEvents
{
  CHRAnalyticsManager *v2;

  v2 = self;
  sub_1BC4E5A28();

}

- (void)postOnboardingFunnelEventWithStep:(int64_t)a3 context:(int64_t)a4 gatewayUrl:(id)a5
{
  id v9;
  CHRAnalyticsManager *v10;

  v9 = a5;
  v10 = self;
  sub_1BC4E371C(a3, a4, a5);

}

- (void)postUserInteractionEventWithType:(int64_t)a3 context:(int64_t)a4 action:(int64_t)a5 category:(id)a6 conceptIdentifier:(id)a7
{
  id v13;
  id v14;
  CHRAnalyticsManager *v15;

  v13 = a6;
  v14 = a7;
  v15 = self;
  sub_1BC4E3BB8(a3, a4, a5, a6, a7);

}

- (void)postPrivacyInteractionEventWithType:(int64_t)a3 context:(int64_t)a4 action:(BOOL)a5
{
  CHRAnalyticsManager *v8;

  v8 = self;
  sub_1BC4E5384(a3, a4, a5);

}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

@end
