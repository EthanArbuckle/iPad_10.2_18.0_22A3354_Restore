@implementation ArticleViewerInteractor

- (_TtC12NewsArticles23ArticleViewerInteractor)init
{
  _TtC12NewsArticles23ArticleViewerInteractor *result;

  result = (_TtC12NewsArticles23ArticleViewerInteractor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B9E30DEC((uint64_t)self + OBJC_IVAR____TtC12NewsArticles23ArticleViewerInteractor_delegate);
  sub_1B9E327F4((uint64_t)self + OBJC_IVAR____TtC12NewsArticles23ArticleViewerInteractor_coordinator, (uint64_t (*)(_QWORD))sub_1B9EBD050);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles23ArticleViewerInteractor_blueprintProvider);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles23ArticleViewerInteractor_pageBlueprintFactory);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles23ArticleViewerInteractor_pageTracker);
  swift_unknownObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles23ArticleViewerInteractor_historyService);

}

- (void)subscriptionController:(id)a3 didAddTags:(id)a4 changeTags:(id)a5 moveTags:(id)a6 removeTags:(id)a7 subscriptionType:(unint64_t)a8
{
  uint64_t v11;
  id v14;
  _TtC12NewsArticles23ArticleViewerInteractor *v15;

  v11 = (uint64_t)a5;
  if (a4)
  {
    sub_1BA0BEBF4();
    if (!v11)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (a5)
LABEL_3:
    v11 = sub_1BA0BEBF4();
LABEL_4:
  if (a6)
    sub_1BA0BEBF4();
  if (a7)
    sub_1BA0BEBF4();
  v14 = a3;
  v15 = self;
  sub_1B9EBCFA4(v11, a8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
