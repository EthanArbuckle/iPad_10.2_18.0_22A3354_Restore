@implementation LACOnenessAuthenticationProviderDummy

- (LACOnenessAuthenticationProviderDelegate)delegate
{
  swift_beginAccess();
  return (LACOnenessAuthenticationProviderDelegate *)(id)swift_unknownObjectRetain();
}

- (void)setDelegate:(id)a3
{
  id *v4;

  v4 = (id *)((char *)&self->super.isa
            + OBJC_IVAR____TtC23LocalAuthenticationCore37LACOnenessAuthenticationProviderDummy_delegate);
  swift_beginAccess();
  *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (BOOL)isAvailable
{
  void *v3;
  _TtC23LocalAuthenticationCore37LACOnenessAuthenticationProviderDummy *v4;
  id v5;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_isCompanionSessionActive);

  if (v5)
  return v5 != 0;
}

- (void)domainStateForRequest:(id)a3 completion:(id)a4
{
  void *v5;
  _TtC23LocalAuthenticationCore37LACOnenessAuthenticationProviderDummy *v6;

  v5 = _Block_copy(a4);
  _Block_copy(v5);
  swift_unknownObjectRetain();
  v6 = self;
  specialized LACOnenessAuthenticationProviderDummy.domainState(for:completion:)((uint64_t)v5);
  _Block_release(v5);
  _Block_release(v5);
  swift_unknownObjectRelease();

}

- (_TtC23LocalAuthenticationCore37LACOnenessAuthenticationProviderDummy)initWithReplyQueue:(id)a3
{
  objc_class *ObjectType;
  id v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC23LocalAuthenticationCore37LACOnenessAuthenticationProviderDummy_delegate) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC23LocalAuthenticationCore37LACOnenessAuthenticationProviderDummy_replyQueue) = (Class)a3;
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = a3;
  return -[LACOnenessAuthenticationProviderDummy init](&v8, sel_init);
}

- (id)authenticateClient:(id)a3 withAcmContext:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  id v15;
  _TtC23LocalAuthenticationCore37LACOnenessAuthenticationProviderDummy *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  void (*v20)(char *, uint64_t);
  Class isa;
  uint64_t v23;

  v7 = type metadata accessor for UUID();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for UUID?);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = a3;
  v15 = a4;
  v16 = self;
  v17 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v19 = v18;

  UUID.init()();
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v13, v10, v7);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v13, 0, 1, v7);
  $defer #1 () in LACOnenessAuthenticationProviderDummy.authenticateClient(_:withAcmContext:)((uint64_t)v16, (uint64_t)v10);
  v20 = *(void (**)(char *, uint64_t))(v8 + 8);
  v20(v10, v7);
  outlined consume of Data._Representation(v17, v19);

  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v13, 1, v7) != 1)
  {
    isa = UUID._bridgeToObjectiveC()().super.isa;
    v20(v13, v7);
  }
  return isa;
}

- (void)cancelAuthenticationWithID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC23LocalAuthenticationCore37LACOnenessAuthenticationProviderDummy *v8;
  uint64_t v9;

  v4 = type metadata accessor for UUID();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  LACOnenessAuthenticationProviderDummy.cancelAuthentication(with:)();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC23LocalAuthenticationCore37LACOnenessAuthenticationProviderDummy)init
{
  _TtC23LocalAuthenticationCore37LACOnenessAuthenticationProviderDummy *result;

  result = (_TtC23LocalAuthenticationCore37LACOnenessAuthenticationProviderDummy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23LocalAuthenticationCore37LACOnenessAuthenticationProviderDummy_replyQueue));
  swift_unknownObjectRelease();
}

@end
