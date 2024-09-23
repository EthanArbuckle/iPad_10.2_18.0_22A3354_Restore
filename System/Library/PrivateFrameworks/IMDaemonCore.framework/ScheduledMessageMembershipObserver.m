@implementation ScheduledMessageMembershipObserver

- (void)dealloc
{
  void *v3;
  _TtC12IMDaemonCore34ScheduledMessageMembershipObserver *v4;
  id v5;
  objc_super v6;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_defaultCenter);
  objc_msgSend(v5, sel_removeObserver_name_object_, v4, CFSTR("__kIMDChatParticipantsDidChangeNotification"), 0);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for ScheduledMessageMembershipObserver();
  -[ScheduledMessageMembershipObserver dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12IMDaemonCore34ScheduledMessageMembershipObserver_chatRegistry));
}

- (void)handleChatParticipantsDidChange:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC12IMDaemonCore34ScheduledMessageMembershipObserver *v8;
  uint64_t v9;

  v4 = sub_1D166D460();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D166D43C();
  v8 = self;
  sub_1D163FD68();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC12IMDaemonCore34ScheduledMessageMembershipObserver)init
{
  _TtC12IMDaemonCore34ScheduledMessageMembershipObserver *result;

  result = (_TtC12IMDaemonCore34ScheduledMessageMembershipObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
