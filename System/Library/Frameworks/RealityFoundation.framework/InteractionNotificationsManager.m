@implementation InteractionNotificationsManager

- (void)notificationTriggerDidPostWithNotification:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;

  v3 = type metadata accessor for Notification();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  specialized InteractionNotificationsManager.notificationTriggerDidPost(notification:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

@end
