@implementation AdComponentSizerFactory

- (NSString)type
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1BA0BE81C();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (int)role
{
  return *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC12NewsArticles23AdComponentSizerFactory_role);
}

- (id)sizerForComponent:(id)a3 componentLayout:(id)a4 layoutOptions:(id)a5 DOMObjectProvider:(id)a6
{
  id v11;
  _TtC12NewsArticles23AdComponentSizerFactory *v12;
  id v13;

  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v11 = a5;
  swift_unknownObjectRetain();
  v12 = self;
  v13 = sub_1B9FABCCC((uint64_t)a3, (uint64_t)a4, v11, a6);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  return v13;
}

- (_TtC12NewsArticles23AdComponentSizerFactory)init
{
  _TtC12NewsArticles23AdComponentSizerFactory *result;

  result = (_TtC12NewsArticles23AdComponentSizerFactory *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles23AdComponentSizerFactory_layoutStore);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles23AdComponentSizerFactory_bannerAdFactory);
}

@end
