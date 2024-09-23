@implementation NXSessionDaemon

- (void)dealloc
{
  _TtC11NexusDaemon15NXSessionDaemon *v2;

  v2 = self;
  sub_243070B64();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  swift_bridgeObjectRelease();
  sub_24303B54C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11NexusDaemon15NXSessionDaemon_connectionEndedHandler));
  swift_release();

  v3 = (char *)self + OBJC_IVAR____TtC11NexusDaemon15NXSessionDaemon_endpoint;
  v4 = sub_2430A16B4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  sub_24303B54C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11NexusDaemon15NXSessionDaemon_invalidationHandler));
  v5 = (char *)self + OBJC_IVAR____TtC11NexusDaemon15NXSessionDaemon__messageContext;
  v6 = sub_2430A17F8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  sub_24303B54C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11NexusDaemon15NXSessionDaemon_serverEventHandler));

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11NexusDaemon15NXSessionDaemon__needsNexusBluetoothAdvertiser));
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

- (NSString)description
{
  _TtC11NexusDaemon15NXSessionDaemon *v2;
  void *v3;

  v2 = self;
  sub_243070F38();
  sub_2430A1DA4();

  swift_bridgeObjectRelease();
  v3 = (void *)sub_2430A1D68();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)sessionStarted:(id)a3
{
  id v4;
  _TtC11NexusDaemon15NXSessionDaemon *v5;

  v4 = a3;
  v5 = self;
  sub_2430797A8(v4);

}

- (void)sessionEnded:(id)a3 withReason:(unsigned int)a4 error:(id)a5
{
  id v8;
  _TtC11NexusDaemon15NXSessionDaemon *v9;
  id v10;

  v8 = a3;
  v9 = self;
  v10 = a5;
  sub_243079AF8(v8, a4, a5);

}

- (void)session:(id)a3 receivedInvitationAcceptFromID:(id)a4
{
  sub_24307A0E0(self, (uint64_t)a2, a3, (uint64_t)a4, "IDS invitation accepted: sessionID=%s, fromID=%s", 1);
}

- (void)session:(id)a3 receivedInvitationDeclineFromID:(id)a4
{
  sub_24307A0E0(self, (uint64_t)a2, a3, (uint64_t)a4, "IDS invitation declined: sessionID=%s, fromID=%s", 0);
}

- (void)session:(id)a3 receivedInvitationCancelFromID:(id)a4
{
  sub_24307A0E0(self, (uint64_t)a2, a3, (uint64_t)a4, "IDS invitation canceled: sessionID=%s, fromID=%s", 0);
}

- (_TtC11NexusDaemon15NXSessionDaemon)init
{
  _TtC11NexusDaemon15NXSessionDaemon *result;

  result = (_TtC11NexusDaemon15NXSessionDaemon *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
