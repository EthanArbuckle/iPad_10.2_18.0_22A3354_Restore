@implementation TextSizeControlViewController

- (_TtC12NewsArticles29TextSizeControlViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B9F23418();
}

- (_TtC12NewsArticles29TextSizeControlViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC12NewsArticles29TextSizeControlViewController *result;

  v4 = a4;
  result = (_TtC12NewsArticles29TextSizeControlViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles29TextSizeControlViewController_styler);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles29TextSizeControlViewController_divider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles29TextSizeControlViewController_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles29TextSizeControlViewController_increaseButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles29TextSizeControlViewController_increaseAction));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles29TextSizeControlViewController_decreaseButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles29TextSizeControlViewController_decreaseAction));
}

- (void)viewDidLoad
{
  _TtC12NewsArticles29TextSizeControlViewController *v2;

  v2 = self;
  sub_1B9F229F8();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = a3;
  v5 = v7.receiver;
  -[TextSizeControlViewController traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1B9F23580();

}

- (void)viewDidLayoutSubviews
{
  _TtC12NewsArticles29TextSizeControlViewController *v2;

  v2 = self;
  sub_1B9F232BC();

}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 200.0;
  v3 = 40.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

@end
