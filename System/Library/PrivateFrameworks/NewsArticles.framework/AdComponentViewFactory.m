@implementation AdComponentViewFactory

- (NSString)type
{
  return (NSString *)(id)sub_1BA0BE81C();
}

- (int)role
{
  return 0;
}

- (id)componentViewForComponent:(id)a3
{
  _TtC12NewsArticles22AdComponentViewFactory *v4;
  char *v5;

  swift_unknownObjectRetain();
  v4 = self;
  v5 = sub_1B9F4AE50();
  swift_unknownObjectRelease();

  return v5;
}

- (_TtC12NewsArticles22AdComponentViewFactory)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegateProvider:(id)a5 componentStyleRendererFactory:(id)a6
{
  id v7;
  _TtC12NewsArticles22AdComponentViewFactory *result;

  swift_unknownObjectRetain();
  v7 = a4;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  result = (_TtC12NewsArticles22AdComponentViewFactory *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles22AdComponentViewFactory_resolver);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles22AdComponentViewFactory_bannerAdFactory);
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles22AdComponentViewFactory_bannerAdRenderer);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles22AdComponentViewFactory_integrator);
  swift_unknownObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles22AdComponentViewFactory_trackerFactory);
}

@end
