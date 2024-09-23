@implementation EndOfArticleViewController

- (NAArticleFooterDelegate)footerDelegate
{
  return (NAArticleFooterDelegate *)sub_1B9F3BBE0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12NewsArticles26EndOfArticleViewController_footerDelegate);
}

- (void)setFooterDelegate:(id)a3
{
  sub_1B9F3BC80();
}

- (NAEndOfArticleResultProviderDelegate)resultProviderDelegate
{
  return (NAEndOfArticleResultProviderDelegate *)sub_1B9F3BBE0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12NewsArticles26EndOfArticleViewController_resultProviderDelegate);
}

- (void)setResultProviderDelegate:(id)a3
{
  sub_1B9F3BC80();
}

- (_TtC12NewsArticles26EndOfArticleViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B9F3E068();
}

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC12NewsArticles26EndOfArticleViewController *v5;
  id v6;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (void *)objc_opt_self();
  v5 = self;
  v6 = objc_msgSend(v4, sel_defaultCenter);
  objc_msgSend(v6, sel_removeObserver_name_object_, v5, *MEMORY[0x1E0DC4528], 0);

  v7.receiver = v5;
  v7.super_class = ObjectType;
  -[EndOfArticleViewController dealloc](&v7, sel_dealloc);
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles26EndOfArticleViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles26EndOfArticleViewController_blueprintViewController));
  sub_1B9E30DEC((uint64_t)self + OBJC_IVAR____TtC12NewsArticles26EndOfArticleViewController_footerDelegate);
  sub_1B9E30DEC((uint64_t)self + OBJC_IVAR____TtC12NewsArticles26EndOfArticleViewController_resultProviderDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles26EndOfArticleViewController_overriddenTraitCollection));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles26EndOfArticleViewController_gutterViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles26EndOfArticleViewController_bottomSpacerView));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles26EndOfArticleViewController_urlHandler);
}

- (_TtC12NewsArticles26EndOfArticleViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC12NewsArticles26EndOfArticleViewController *result;

  v4 = a4;
  result = (_TtC12NewsArticles26EndOfArticleViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC12NewsArticles26EndOfArticleViewController *v2;

  v2 = self;
  EndOfArticleViewController.viewDidLoad()();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  uint64_t v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = (char *)v6.receiver;
  -[EndOfArticleViewController viewWillAppear:](&v6, sel_viewWillAppear_, v3);
  if (*(_QWORD *)&v4[OBJC_IVAR____TtC12NewsArticles26EndOfArticleViewController_gutterViewController])
  {
    sub_1BA0BB9CC();
    v5 = sub_1BA0BB798();
    swift_release();
    sub_1BA0BF038();

    v4 = (char *)v5;
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  uint64_t v5;
  uint64_t ObjectType;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = (char *)v7.receiver;
  -[EndOfArticleViewController viewDidAppear:](&v7, sel_viewDidAppear_, v3);
  v5 = *(_QWORD *)(*(_QWORD *)&v4[OBJC_IVAR____TtC12NewsArticles26EndOfArticleViewController_eventHandler] + 40);
  ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v5 + 48))(ObjectType, v5);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC12NewsArticles26EndOfArticleViewController *v4;

  v4 = self;
  EndOfArticleViewController.viewDidDisappear(_:)(a3);

}

- (void)viewWillLayoutSubviews
{
  _TtC12NewsArticles26EndOfArticleViewController *v2;

  v2 = self;
  EndOfArticleViewController.viewWillLayoutSubviews()();

}

- (void)viewDidLayoutSubviews
{
  _TtC12NewsArticles26EndOfArticleViewController *v2;

  v2 = self;
  EndOfArticleViewController.viewDidLayoutSubviews()();

}

- (void)traitCollectionDidChange:(id)a3
{
  char *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  v4 = (char *)v9.receiver;
  v5 = a3;
  -[EndOfArticleViewController traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v5);
  v6 = *(void **)&v4[OBJC_IVAR____TtC12NewsArticles26EndOfArticleViewController_overriddenTraitCollection];
  if (v6)
  {
    v7 = *(id *)&v4[OBJC_IVAR____TtC12NewsArticles26EndOfArticleViewController_overriddenTraitCollection];
  }
  else
  {
    v7 = objc_msgSend(v4, sel_traitCollection, v9.receiver, v9.super_class);
    v6 = 0;
  }
  v8 = v6;
  sub_1B9F3E130();

}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  id v4;
  _TtC12NewsArticles26EndOfArticleViewController *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = EndOfArticleViewController.shouldUpdateFocus(in:)((UIFocusUpdateContext)v4);

  return self & 1;
}

- (void)smartInvertStatusDidChange
{
  objc_class *ObjectType;
  _TtC12NewsArticles26EndOfArticleViewController *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  v5 = -[EndOfArticleViewController traitCollection](v4, sel_traitCollection);
  v9.receiver = v4;
  v9.super_class = ObjectType;
  -[EndOfArticleViewController traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v5);
  v6 = *(Class *)((char *)&v4->super.super.super.isa
                + OBJC_IVAR____TtC12NewsArticles26EndOfArticleViewController_overriddenTraitCollection);
  if (v6)
  {
    v7 = *(Class *)((char *)&v4->super.super.super.isa
                  + OBJC_IVAR____TtC12NewsArticles26EndOfArticleViewController_overriddenTraitCollection);
  }
  else
  {
    v7 = -[EndOfArticleViewController traitCollection](v4, sel_traitCollection);
    v6 = 0;
  }
  v8 = v6;
  sub_1B9F3E130();

}

- (void)deselect
{
  _TtC12NewsArticles26EndOfArticleViewController *v2;
  id v3;

  v2 = self;
  sub_1BA0BB9CC();
  v3 = (id)sub_1BA0BB798();
  swift_release();
  objc_msgSend(v3, sel_selectItemAtIndexPath_animated_scrollPosition_, 0, 0, 0);

}

- (double)sectionItemHeightForSize:(CGSize)a3 traitCollection:(id)a4
{
  id v5;
  _TtC12NewsArticles26EndOfArticleViewController *v6;
  void *v7;
  id v8;
  double v9;
  double v10;

  v5 = a4;
  v6 = self;
  sub_1BA0BB9CC();
  v7 = (void *)sub_1BA0BB798();
  swift_release();
  v8 = objc_msgSend(v7, sel_collectionViewLayout);

  objc_msgSend(v8, sel_collectionViewContentSize);
  v10 = v9;

  return fmax(v10, 1.0);
}

@end
