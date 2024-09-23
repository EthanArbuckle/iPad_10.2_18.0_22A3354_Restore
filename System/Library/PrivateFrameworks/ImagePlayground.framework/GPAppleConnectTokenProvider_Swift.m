@implementation GPAppleConnectTokenProvider_Swift

- (_TtC15ImagePlayground33GPAppleConnectTokenProvider_Swift)initWithAuthenticatingProtocol:(id)a3
{
  _QWORD *v5;
  objc_super v7;
  __int128 v8;
  uint64_t ObjectType;

  v5 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15ImagePlayground33GPAppleConnectTokenProvider_Swift__token);
  *v5 = 0;
  v5[1] = 0;
  ObjectType = swift_getObjectType();
  *(_QWORD *)&v8 = a3;
  sub_23ECDED88(&v8, (_TtC15ImagePlayground33GPAppleConnectTokenProvider_Swift *)((char *)self+ OBJC_IVAR____TtC15ImagePlayground33GPAppleConnectTokenProvider_Swift__authenticatingProtocol));
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for GPAppleConnectTokenProvider_Swift();
  swift_unknownObjectRetain();
  return -[GPAppleConnectTokenProvider_Swift init](&v7, sel_init);
}

- (void)setupTokenWithCompletion:(id)a3
{
  void *v4;
  _TtC15ImagePlayground33GPAppleConnectTokenProvider_Swift *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_23ED77FA4((char *)v5, (void (**)(_QWORD, _QWORD, _QWORD))v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (_TtC15ImagePlayground33GPAppleConnectTokenProvider_Swift)init
{
  _TtC15ImagePlayground33GPAppleConnectTokenProvider_Swift *result;

  result = (_TtC15ImagePlayground33GPAppleConnectTokenProvider_Swift *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15ImagePlayground33GPAppleConnectTokenProvider_Swift__authenticatingProtocol);
}

@end
