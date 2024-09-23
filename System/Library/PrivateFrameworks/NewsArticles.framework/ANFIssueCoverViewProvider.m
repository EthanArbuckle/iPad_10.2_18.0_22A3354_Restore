@implementation ANFIssueCoverViewProvider

- (id)viewForIssueCover:(id)a3
{
  return objc_msgSend(objc_allocWithZone((Class)sub_1BA0BDD18()), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
}

- (void)presentIssueCover:(id)a3 onView:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC12NewsArticles25ANFIssueCoverViewProvider *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_1B9E58368(v9, v10);

}

- (_TtC12NewsArticles25ANFIssueCoverViewProvider)init
{
  _TtC12NewsArticles25ANFIssueCoverViewProvider *result;

  result = (_TtC12NewsArticles25ANFIssueCoverViewProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles25ANFIssueCoverViewProvider_layoutAttributesFactory);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles25ANFIssueCoverViewProvider_renderer);
}

@end
