@implementation GKMetricsBridge

+ (void)recordLeaderboardPageEventWithPageId:(id)a3 withReferrerData:(BOOL)a4
{
  uint64_t v4;

  v4 = sub_1AB7DAF90();
  static GKMetricsBridge.recordLeaderboardPageEvent(pageId:withReferrerData:)(v4);
  swift_bridgeObjectRelease();
}

+ (void)recordChallengePageEventWithReferrerData:(BOOL)a3
{
  static GKMetricsBridge.recordChallengePageEvent(withReferrerData:)();
}

+ (void)recordInviteFriendClickEventWithType:(int64_t)a3 pageType:(id)a4 pageId:(id)a5
{
  sub_1AB7DAF90();
  sub_1AB7DAF90();
  static GKMetricsBridge.recordInviteFriendClickEvent(type:pageType:pageId:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC12GameCenterUI15GKMetricsBridge)init
{
  return (_TtC12GameCenterUI15GKMetricsBridge *)GKMetricsBridge.init()();
}

@end
