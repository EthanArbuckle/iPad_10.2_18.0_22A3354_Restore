@implementation ANFIssueCoverLayoutAttributesFactory

- (id)createAttributesWithIssueCover:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  _TtC12NewsArticles36ANFIssueCoverLayoutAttributesFactory *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1B9F4B8DC(v7);

  return v9;
}

- (_TtC12NewsArticles36ANFIssueCoverLayoutAttributesFactory)init
{
  _TtC12NewsArticles36ANFIssueCoverLayoutAttributesFactory *result;

  result = (_TtC12NewsArticles36ANFIssueCoverLayoutAttributesFactory *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12NewsArticles36ANFIssueCoverLayoutAttributesFactory_issue));
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC12NewsArticles36ANFIssueCoverLayoutAttributesFactory_issueCoverLayoutAttributesFactory);
}

@end
