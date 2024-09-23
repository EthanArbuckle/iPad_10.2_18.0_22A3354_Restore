@implementation ProxyAuthenticationKeyManager

- (_TtC12NewsArticles29ProxyAuthenticationKeyManager)init
{
  _TtC12NewsArticles29ProxyAuthenticationKeyManager *result;

  result = (_TtC12NewsArticles29ProxyAuthenticationKeyManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  sub_1B9E3C470((uint64_t)self + OBJC_IVAR____TtC12NewsArticles29ProxyAuthenticationKeyManager_key, &qword_1ED5997A8, (uint64_t (*)(uint64_t))type metadata accessor for ProxyAuthenticationKey);
  swift_bridgeObjectRelease();
}

- (void)requestAuthenticationKeyWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC12NewsArticles29ProxyAuthenticationKeyManager *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_1B9E3AC68((uint64_t)sub_1B9E3B390, v5);

  swift_release();
}

@end
