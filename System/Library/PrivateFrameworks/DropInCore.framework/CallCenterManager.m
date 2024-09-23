@implementation CallCenterManager

- (void)dealloc
{
  _TtC10DropInCore17CallCenterManager *v2;

  v2 = self;
  sub_23A7EBF7C();
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  sub_23A77EF5C((uint64_t)self + OBJC_IVAR____TtC10DropInCore17CallCenterManager_delegate);
  OUTLINED_FUNCTION_102_1(OBJC_IVAR____TtC10DropInCore17CallCenterManager_callCenter);
  OUTLINED_FUNCTION_102_1(OBJC_IVAR____TtC10DropInCore17CallCenterManager_conversationProviderManager);
  swift_unknownObjectRelease();
  swift_release();
  OUTLINED_FUNCTION_102_1(OBJC_IVAR____TtC10DropInCore17CallCenterManager_serialQueue);
  v3 = sub_23A7F1E0C();
  OUTLINED_FUNCTION_357(v3);
  v4 = sub_23A7F1DE8();
  OUTLINED_FUNCTION_357(v4);
  OUTLINED_FUNCTION_102_1(OBJC_IVAR____TtC10DropInCore17CallCenterManager_activeConversation);
  OUTLINED_FUNCTION_102_1(OBJC_IVAR____TtC10DropInCore17CallCenterManager_conversationTimer);

}

- (_TtC10DropInCore17CallCenterManager)init
{
  sub_23A7EC6EC();
}

- (void)conversationManager:(id)a3 updatedIncomingPendingConversations:(id)a4
{
  id v6;
  _TtC10DropInCore17CallCenterManager *v7;

  sub_23A77E424(0, &qword_2569BB080);
  sub_23A7F21D8();
  v6 = a3;
  v7 = self;
  sub_23A7ED9B4();

  swift_bridgeObjectRelease();
}

- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4
{
  id v6;
  id v7;
  _TtC10DropInCore17CallCenterManager *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_23A7EDBA4();

}

- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4
{
  id v6;
  id v7;
  _TtC10DropInCore17CallCenterManager *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_23A7EE29C();

}

- (void)serverDisconnectedForConversationManager:(id)a3
{
  id v4;
  _TtC10DropInCore17CallCenterManager *v5;

  v4 = a3;
  v5 = self;
  sub_23A7EE61C();

}

- (void)uplinkMutedChangedWithNotification:(id)a3
{
  sub_23A7EFC94(self, (uint64_t)a2, (uint64_t)a3, sub_23A7EEDF0);
}

- (void)callStatusChangedWithNotification:(id)a3
{
  sub_23A7EFC94(self, (uint64_t)a2, (uint64_t)a3, sub_23A7EF6B8);
}

@end
