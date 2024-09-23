@implementation NotificationPromptManager

- (int64_t)subscribeNotificationPromptForTagID:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;

  v3 = sub_1D6E26978();
  v5 = v4;
  swift_retain();
  v6 = sub_1D62A2370(v3, v5);
  swift_release();
  swift_bridgeObjectRelease();
  return v6;
}

- (int64_t)notificationPrompt
{
  int64_t v2;

  swift_retain();
  v2 = sub_1D62A2680();
  swift_release();
  return v2;
}

@end
