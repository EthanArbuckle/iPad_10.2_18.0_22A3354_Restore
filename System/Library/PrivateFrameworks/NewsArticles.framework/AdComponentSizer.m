@implementation AdComponentSizer

- (_TtC12NewsArticles16AdComponentSizer)initWithComponent:(id)a3 componentLayout:(id)a4 componentStyle:(id)a5 DOMObjectProvider:(id)a6 layoutOptions:(id)a7
{
  id v8;
  _TtC12NewsArticles16AdComponentSizer *result;

  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v8 = a7;
  result = (_TtC12NewsArticles16AdComponentSizer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles16AdComponentSizer_layoutStore);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles16AdComponentSizer_bannerAdFactory);
}

- (double)calculateHeightForWidth:(double)a3 layoutContext:(id)a4
{
  _TtC12NewsArticles16AdComponentSizer *v5;
  double v6;
  double v7;

  swift_unknownObjectRetain();
  v5 = self;
  sub_1BA058DF0();
  v7 = v6;
  swift_unknownObjectRelease();

  return v7;
}

- (_NSRange)overrideColumnLayoutForColumnRange:(_NSRange)a3 inColumnLayout:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  _TtC12NewsArticles16AdComponentSizer *v8;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  v8 = self;
  v9 = sub_1BA0591EC(location, length, v7);
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.length = v13;
  result.location = v12;
  return result;
}

- (unint64_t)shouldIgnoreMarginsForColumnLayout:(id)a3
{
  id v4;
  _TtC12NewsArticles16AdComponentSizer *v5;
  unint64_t v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1BA059528(v4, (SEL *)&selRef_ignoreDocumentMargin);

  return v6;
}

- (unint64_t)shouldIgnoreViewportPaddingForColumnLayout:(id)a3
{
  id v4;
  _TtC12NewsArticles16AdComponentSizer *v5;
  unint64_t v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1BA059528(v4, (SEL *)&selRef_ignoreViewportPadding);

  return v6;
}

- (BOOL)requiresSizeChangeForStateChange:(id)a3 fromState:(id)a4
{
  _TtC12NewsArticles16AdComponentSizer *v5;
  char v6;

  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v5 = self;
  v6 = sub_1BA059768();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return v6 & 1;
}

@end
