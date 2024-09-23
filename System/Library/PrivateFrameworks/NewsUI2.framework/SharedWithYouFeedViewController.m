@implementation SharedWithYouFeedViewController

- (_TtC7NewsUI231SharedWithYouFeedViewController)initWithCoder:(id)a3
{
  _TtC7NewsUI231SharedWithYouFeedViewController *result;

  result = (_TtC7NewsUI231SharedWithYouFeedViewController *)sub_1D6E28010();
  __break(1u);
  return result;
}

- (_TtC7NewsUI231SharedWithYouFeedViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7NewsUI231SharedWithYouFeedViewController *result;

  v4 = a4;
  result = (_TtC7NewsUI231SharedWithYouFeedViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI231SharedWithYouFeedViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI231SharedWithYouFeedViewController_blueprintViewController));
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI231SharedWithYouFeedViewController_userInfo));
  swift_release();
}

- (void)viewDidLoad
{
  _TtC7NewsUI231SharedWithYouFeedViewController *v2;

  v2 = self;
  sub_1D6627E28();

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
  -[SharedWithYouFeedViewController viewWillLayoutSubviews](&v15, sel_viewWillLayoutSubviews);
  v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC7NewsUI231SharedWithYouFeedViewController_blueprintViewController], sel_view, v15.receiver, v15.super_class);
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

- (void)viewWillAppear:(BOOL)a3
{
  _TtC7NewsUI231SharedWithYouFeedViewController *v4;

  v4 = self;
  sub_1D6628414(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC7NewsUI231SharedWithYouFeedViewController *v4;

  v4 = self;
  sub_1D66287D4(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  -[SharedWithYouFeedViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
  swift_getObjectType();
  sub_1D6E1DD44();
  sub_1D6E1D588();

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  -[SharedWithYouFeedViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
  sub_1D6E1DFC0();

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
  -[SharedWithYouFeedViewController traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1D6629A54();

}

- (void)scrollToTopAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _TtC7NewsUI231SharedWithYouFeedViewController *v4;
  id v5;

  v3 = a3;
  v4 = self;
  sub_1D6E1E9BC();
  v5 = (id)sub_1D6E1E224();
  swift_release();
  objc_msgSend(v5, sel_ts_scrollToTop_, v3);

}

@end
