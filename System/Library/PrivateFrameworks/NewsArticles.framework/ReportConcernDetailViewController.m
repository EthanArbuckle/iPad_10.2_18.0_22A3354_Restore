@implementation ReportConcernDetailViewController

- (_TtC12NewsArticles33ReportConcernDetailViewController)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC12NewsArticles33ReportConcernDetailViewController *result;

  v5 = (char *)self + OBJC_IVAR____TtC12NewsArticles33ReportConcernDetailViewController_selectedItemIndexPath;
  v6 = sub_1BA0B9AD0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12NewsArticles33ReportConcernDetailViewController____lazy_storage___sendButton) = 0;
  v7 = a3;

  result = (_TtC12NewsArticles33ReportConcernDetailViewController *)sub_1BA0BF3B0();
  __break(1u);
  return result;
}

- (_TtC12NewsArticles33ReportConcernDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC12NewsArticles33ReportConcernDetailViewController *result;

  v4 = a4;
  result = (_TtC12NewsArticles33ReportConcernDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles33ReportConcernDetailViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles33ReportConcernDetailViewController_blueprintViewController));
  sub_1B9E4F9E8((uint64_t)self + OBJC_IVAR____TtC12NewsArticles33ReportConcernDetailViewController_selectedItemIndexPath, &qword_1EF252080, (void (*)(uint64_t))MEMORY[0x1E0CB1658]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles33ReportConcernDetailViewController____lazy_storage___sendButton));
}

- (void)viewDidLoad
{
  _TtC12NewsArticles33ReportConcernDetailViewController *v2;

  v2 = self;
  sub_1B9E63C68();

}

- (void)viewWillLayoutSubviews
{
  char *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)swift_getObjectType();
  v2 = (char *)v15.receiver;
  -[ReportConcernDetailViewController viewWillLayoutSubviews](&v15, sel_viewWillLayoutSubviews);
  v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC12NewsArticles33ReportConcernDetailViewController_blueprintViewController], sel_view, v15.receiver, v15.super_class);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v2, sel_view);
    if (v5)
    {
      v6 = v5;
      objc_msgSend(v5, sel_bounds);
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;

      objc_msgSend(v4, sel_setFrame_, v8, v10, v12, v14);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
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
  -[ReportConcernDetailViewController traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1B9E658B0();

}

- (void)send
{
  _TtC12NewsArticles33ReportConcernDetailViewController *v2;

  v2 = self;
  sub_1B9E640DC();

}

@end
