@implementation BuddyStartOverAnalytics

+ (void)addRestartEventWithAnalyticsManager:(id)a3 paneIdentifier:(id)a4
{
  sub_100012478((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, 0);
}

+ (void)addEraseEventWithAnalyticsManager:(id)a3 paneIdentifier:(id)a4
{
  sub_100012478((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, 1);
}

- (_TtC5Setup23BuddyStartOverAnalytics)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BuddyStartOverAnalytics();
  return -[BuddyStartOverAnalytics init](&v3, "init");
}

@end
