@implementation IMMultiplexedDaemonConnection

- (unint64_t)capabilities
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___IMMultiplexedDaemonConnection_capabilities);
}

- (NSDictionary)context
{
  void *v2;

  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR___IMMultiplexedDaemonConnection_context))
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1A2199740();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSDictionary *)v2;
}

- (IMMultiplexedDaemonConnection)initWithLabel:(id)a3 capabilities:(unint64_t)a4 context:(id)a5 onInvalidate:(id)a6 onDealloc:(id)a7
{
  objc_class *ObjectType;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t (**v21)();
  uint64_t (**v22)();
  objc_super v24;

  ObjectType = (objc_class *)swift_getObjectType();
  v13 = _Block_copy(a6);
  v14 = _Block_copy(a7);
  v15 = sub_1A2199764();
  v17 = v16;
  if (a5)
    a5 = (id)sub_1A219974C();
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = v13;
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = v14;
  v20 = (uint64_t *)((char *)self + OBJC_IVAR___IMMultiplexedDaemonConnection_label);
  *v20 = v15;
  v20[1] = v17;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMMultiplexedDaemonConnection_capabilities) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMMultiplexedDaemonConnection_context) = (Class)a5;
  v21 = (uint64_t (**)())((char *)self + OBJC_IVAR___IMMultiplexedDaemonConnection_onInvalidate);
  *v21 = sub_1A21872B4;
  v21[1] = (uint64_t (*)())v18;
  v22 = (uint64_t (**)())((char *)self + OBJC_IVAR___IMMultiplexedDaemonConnection_onDeinit);
  *v22 = sub_1A2187788;
  v22[1] = (uint64_t (*)())v19;
  v24.receiver = self;
  v24.super_class = ObjectType;
  return -[IMMultiplexedDaemonConnection init](&v24, sel_init);
}

- (NSString)label
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A2199758();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (IMDaemonProtocol)remoteProxy
{
  return (IMDaemonProtocol *)sub_1A2186488(self, (uint64_t)a2, (SEL *)&selRef_remoteDaemon);
}

- (IMDaemonProtocol)synchronousRemoteProxy
{
  return (IMDaemonProtocol *)sub_1A2186488(self, (uint64_t)a2, (SEL *)&selRef_synchronousRemoteDaemon);
}

- (void)waitForSetup
{
  IMMultiplexedDaemonConnection *v2;

  v2 = self;
  MultiplexedDaemonConnection.waitForSetup()();

}

- (void)connectWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  IMMultiplexedDaemonConnection *v13;
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
  v11[4] = &unk_1EE65E8D8;
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

- (void)invalidate
{
  IMMultiplexedDaemonConnection *v2;

  v2 = self;
  MultiplexedDaemonConnection.invalidate()();

}

- (void)dealloc
{
  objc_class *ObjectType;
  void (*v4)(uint64_t);
  IMMultiplexedDaemonConnection *v5;
  uint64_t v6;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(void (**)(uint64_t))((char *)&self->super.isa + OBJC_IVAR___IMMultiplexedDaemonConnection_onDeinit);
  v5 = self;
  v6 = swift_retain();
  v4(v6);
  swift_release();
  v7.receiver = v5;
  v7.super_class = ObjectType;
  -[IMMultiplexedDaemonConnection dealloc](&v7, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (IMMultiplexedDaemonConnection)init
{
  IMMultiplexedDaemonConnection *result;

  result = (IMMultiplexedDaemonConnection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
