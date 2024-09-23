@implementation SessionXPCServiceServer.Server

- (void)performSetupWithConfigData:(id)a3 reply:(id)a4
{
  sub_23FCD2224(self, (int)a2, a3, a4, (uint64_t)&unk_251011478, (uint64_t)sub_23FCD4EAC, (void (*)(uint64_t, unint64_t, uint64_t, uint64_t))sub_23FCCDEC4);
}

- (void)startSessionWithId:(id)a3 configData:(id)a4 xpcData:(id)a5 with:(id)a6
{
  void *v8;
  id v9;
  _TtCV23IntelligenceFlowRuntime23SessionXPCServiceServer6Server *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v8 = _Block_copy(a6);
  sub_23FD74BF4();
  v9 = a4;
  swift_unknownObjectRetain();
  v10 = self;
  v11 = sub_23FD713D8();
  v13 = v12;

  *(_QWORD *)(swift_allocObject() + 16) = v8;
  sub_23FCCE5E8();
  swift_release();
  sub_23FC577B0(v11, v13);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)createSessionFromProtoEventsWithEventProtos:(id)a3 configData:(id)a4 xpcData:(id)a5 with:(id)a6
{
  void *v8;
  id v9;
  _TtCV23IntelligenceFlowRuntime23SessionXPCServiceServer6Server *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v8 = _Block_copy(a6);
  sub_23FD74CD8();
  v9 = a4;
  swift_unknownObjectRetain();
  v10 = self;
  v11 = sub_23FD713D8();
  v13 = v12;

  *(_QWORD *)(swift_allocObject() + 16) = v8;
  sub_23FCCFEE8();
  swift_release();
  sub_23FC577B0(v11, v13);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)postTransactionWithSessionId:(id)a3 eventProtos:(id)a4 with:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _TtCV23IntelligenceFlowRuntime23SessionXPCServiceServer6Server *v13;
  uint64_t v14;

  v7 = sub_23FD71474();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7, v9);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  sub_23FD7145C();
  sub_23FD74CD8();
  *(_QWORD *)(swift_allocObject() + 16) = v12;
  v13 = self;
  sub_23FCD12B4();

  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

- (void)endSessionWithId:(id)a3 with:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _TtCV23IntelligenceFlowRuntime23SessionXPCServiceServer6Server *v12;
  uint64_t v13;

  v6 = sub_23FD71474();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  sub_23FD7145C();
  *(_QWORD *)(swift_allocObject() + 16) = v11;
  v12 = self;
  sub_23FCD22E0();

  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (void)sendWithMessageData:(id)a3 with:(id)a4
{
  sub_23FCD2224(self, (int)a2, a3, a4, (uint64_t)&unk_251011270, (uint64_t)sub_23FCAB5B8, (void (*)(uint64_t, unint64_t, uint64_t, uint64_t))sub_23FCD1EF4);
}

- (void)generateStatementIdWithId:(id)a3 with:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _TtCV23IntelligenceFlowRuntime23SessionXPCServiceServer6Server *v12;
  uint64_t v13;

  v6 = sub_23FD71474();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  sub_23FD7145C();
  *(_QWORD *)(swift_allocObject() + 16) = v11;
  v12 = self;
  sub_23FCD22E0();

  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (void)updateTransactionHookAttachmentStatus:(id)a3 with:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtCV23IntelligenceFlowRuntime23SessionXPCServiceServer6Server *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_23FCD2748(v8, (uint64_t)sub_23FCD4EAC, v7);

  swift_release();
}

- (void)attachAsObserverTo:(id)a3 with:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _TtCV23IntelligenceFlowRuntime23SessionXPCServiceServer6Server *v12;
  uint64_t v13;

  v6 = sub_23FD71474();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  sub_23FD7145C();
  *(_QWORD *)(swift_allocObject() + 16) = v11;
  v12 = self;
  sub_23FCD2DD8();

  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (void)detachObservationFrom:(id)a3 with:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _TtCV23IntelligenceFlowRuntime23SessionXPCServiceServer6Server *v12;
  uint64_t v13;

  v6 = sub_23FD71474();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  sub_23FD7145C();
  *(_QWORD *)(swift_allocObject() + 16) = v11;
  v12 = self;
  sub_23FCD2DD8();

  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (void)fetchSessionClientIdWithReply:(id)a3
{
  void *v4;
  _TtCV23IntelligenceFlowRuntime23SessionXPCServiceServer6Server *v5;

  v4 = _Block_copy(a3);
  *(_QWORD *)(swift_allocObject() + 16) = v4;
  v5 = self;
  sub_23FCD32B8();

  swift_release();
}

- (void)dealloc
{
  _TtCV23IntelligenceFlowRuntime23SessionXPCServiceServer6Server *v2;

  v2 = self;
  sub_23FCD3490();
}

- (void).cxx_destruct
{
  sub_23FC5806C((uint64_t)self + OBJC_IVAR____TtCV23IntelligenceFlowRuntime23SessionXPCServiceServer6Server_sessionClientId, type metadata accessor for SessionClientID);
  swift_bridgeObjectRelease();
  sub_23FC1002C();
  sub_23FCAB84C();
  sub_23FCAB84C();
  sub_23FCAB84C();
  sub_23FCAB84C();
  swift_release();
}

- (_TtCV23IntelligenceFlowRuntime23SessionXPCServiceServer6Server)init
{
  sub_23FC98380();
}

@end
