@implementation CallCenterManagerClient

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC10DropInCore23CallCenterManagerClient_audioPowerManager));
  sub_23A7F1E0C();
  v3 = OUTLINED_FUNCTION_28_1();
  OUTLINED_FUNCTION_11_4(v3, v4, v5);
}

- (void)conversationManager:(id)a3 activeRemoteParticipantsChangedForConversation:(id)a4
{
  id v6;
  id v7;
  _TtC10DropInCore23CallCenterManagerClient *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_23A78EBB0();

}

- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4
{
  id v6;
  id v7;
  _TtC10DropInCore23CallCenterManagerClient *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_23A78EDF4();

}

- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4
{
  id v6;
  id v7;
  _TtC10DropInCore23CallCenterManagerClient *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_23A78FA74((uint64_t)v6, (uint64_t)v7);

}

@end
