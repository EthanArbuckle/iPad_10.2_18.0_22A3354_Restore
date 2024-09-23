@implementation IMDaemonConnection

- (void)connectWithCapabilities:(unint64_t)a3 context:(id)a4 contextChanged:(BOOL)a5
{
  uint64_t v8;
  uint64_t v9;
  IMDaemonConnection *v10;

  v8 = sub_1A219974C();
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a3;
  *(_QWORD *)(v9 + 24) = v8;
  *(_BYTE *)(v9 + 32) = a5;
  *(_QWORD *)(v9 + 40) = self;
  v10 = self;
  swift_bridgeObjectRetain();
  sub_1A21996BC();

  swift_bridgeObjectRelease();
  swift_release();
}

- (IMDaemonProtocol)remoteObjectProxy
{
  return (IMDaemonProtocol *)sub_1A200EE74(self);
}

- (void)setOnSetupComplete:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)();
  IMDaemonConnection *v7;

  v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v4 = swift_allocObject();
    *(_QWORD *)(v4 + 16) = v5;
    v6 = sub_1A200E768;
  }
  else
  {
    v6 = 0;
  }
  MEMORY[0x1E0C80A78](v4);
  v7 = self;
  sub_1A21996B0();
  sub_1A200EB3C((uint64_t)v6);

}

- (void)waitForSetup
{
  IMDaemonConnection *v2;

  v2 = self;
  DaemonConnection.waitForSetup()();

}

- (BOOL)isConnected
{
  IMDaemonConnection *v2;
  BOOL v4;

  v2 = self;
  sub_1A21996B0();

  return v4;
}

- (IMDaemonConnection)initWithListener:(id)a3
{
  IMDaemonConnection *v4;

  swift_unknownObjectRetain();
  v4 = (IMDaemonConnection *)sub_1A2172BAC((uint64_t)a3);
  swift_unknownObjectRelease();
  return v4;
}

- (IMDaemonConnection)init
{
  IMDaemonConnection *result;

  result = (IMDaemonConnection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release();
  swift_release();
  v3 = (char *)self + OBJC_IVAR___IMDaemonConnection_isInvokingSetup;
  v4 = sub_1A1FFD920((uint64_t *)&unk_1ECF12158);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease();
}

- (IMDaemonProtocol)synchronousRemoteObjectProxy
{
  return (IMDaemonProtocol *)sub_1A200EE74(self);
}

- (id)onSetupComplete
{
  IMDaemonConnection *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  uint64_t (*v11)(uint64_t);
  uint64_t v12;

  v2 = self;
  sub_1A1FFD920(&qword_1EE65DF28);
  sub_1A21996B0();
  if (v7)
  {
    v3 = v8;
    v4 = swift_allocObject();
    *(_QWORD *)(v4 + 16) = v7;
    *(_QWORD *)(v4 + 24) = v3;

    v11 = sub_1A2173F48;
    v12 = v4;
    v7 = MEMORY[0x1E0C809B0];
    v8 = 1107296256;
    v9 = sub_1A2171CFC;
    v10 = &unk_1E47242B0;
    v5 = _Block_copy(&v7);
    swift_release();
    return v5;
  }
  else
  {

    return 0;
  }
}

- (void)disconnect
{
  sub_1A2172210(self);
}

- (void)requestSetup
{
  sub_1A2172210(self);
}

- (void)requestSetupIfNeededWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  IMDaemonConnection *v13;
  uint64_t v14;

  v5 = sub_1A1FFD920((uint64_t *)&unk_1ECF12130);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_1A219983C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EE65DF40;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EE65E8E0;
  v12[5] = v11;
  v13 = self;
  sub_1A219339C((uint64_t)v7, (uint64_t)&unk_1EE65DF50, (uint64_t)v12);
  swift_release();
}

@end
