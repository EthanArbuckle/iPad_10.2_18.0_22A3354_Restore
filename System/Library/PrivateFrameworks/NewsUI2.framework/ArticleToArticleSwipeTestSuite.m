@implementation ArticleToArticleSwipeTestSuite

- (_TtC7NewsUI230ArticleToArticleSwipeTestSuite)init
{
  return (_TtC7NewsUI230ArticleToArticleSwipeTestSuite *)sub_1D5E9C370();
}

- (void)setupTestWithContext:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC7NewsUI230ArticleToArticleSwipeTestSuite *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_1D68C78C8(v8, (uint64_t)sub_1D5FACAE0, v7);

  swift_release();
}

- (void).cxx_destruct
{
  sub_1D5E828E4((uint64_t)self + OBJC_IVAR____TtC7NewsUI230ArticleToArticleSwipeTestSuite_scrollViewObserver, (unint64_t *)&unk_1ED5F7C00, (unint64_t *)&unk_1ED5F7BF0, MEMORY[0x1E0DB3088]);
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7NewsUI230ArticleToArticleSwipeTestSuite_scrollViewContentOffsetObserver));
  sub_1D5FD0420(*(unint64_t *)((char *)&self->super.super.isa
                                    + OBJC_IVAR____TtC7NewsUI230ArticleToArticleSwipeTestSuite_activity));
}

@end
