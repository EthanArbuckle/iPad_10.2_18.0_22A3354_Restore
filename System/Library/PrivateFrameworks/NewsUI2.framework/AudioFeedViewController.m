@implementation AudioFeedViewController

- (_TtC7NewsUI223AudioFeedViewController)initWithCoder:(id)a3
{
  id v5;
  _TtC7NewsUI223AudioFeedViewController *result;

  *(_QWORD *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC7NewsUI223AudioFeedViewController_mastheadViewProviderDelegate) = 0;
  swift_unknownObjectWeakInit();
  v5 = a3;

  result = (_TtC7NewsUI223AudioFeedViewController *)sub_1D6E28010();
  __break(1u);
  return result;
}

- (_TtC7NewsUI223AudioFeedViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7NewsUI223AudioFeedViewController *result;

  v4 = a4;
  result = (_TtC7NewsUI223AudioFeedViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI223AudioFeedViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI223AudioFeedViewController_blueprintViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI223AudioFeedViewController_barCompressionManager));
  swift_unknownObjectRelease();
  sub_1D5FF43C0((uint64_t)self + OBJC_IVAR____TtC7NewsUI223AudioFeedViewController_mastheadViewProviderDelegate);
}

- (void)viewDidLoad
{
  _TtC7NewsUI223AudioFeedViewController *v2;

  v2 = self;
  sub_1D6A1C058();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  v4 = v9.receiver;
  -[AudioFeedViewController viewWillAppear:](&v9, sel_viewWillAppear_, v3);
  v5 = objc_msgSend(v4, sel_view, v9.receiver, v9.super_class);
  if (v5)
  {
    v6 = v5;
    v7 = (void *)sub_1D6E27A28();

    if (v7)
    {
      sub_1D6E1E9BC();
      v8 = sub_1D6E1E224();
      swift_release();
      sub_1D6E27A40();

      v4 = (id)v8;
    }

  }
  else
  {
    __break(1u);
  }
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
  -[AudioFeedViewController viewWillLayoutSubviews](&v15, sel_viewWillLayoutSubviews);
  v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC7NewsUI223AudioFeedViewController_blueprintViewController], sel_view, v15.receiver, v15.super_class);
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
  -[AudioFeedViewController traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1D6A1DCB4();

}

- (void)offlineStatusBannerRequestedForceReload
{
  _TtC7NewsUI223AudioFeedViewController *v2;

  v2 = self;
  sub_1D6A1C690();

}

- (void)scrollToTopAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _TtC7NewsUI223AudioFeedViewController *v4;
  id v5;

  v3 = a3;
  v4 = self;
  sub_1D6E1E9BC();
  v5 = (id)sub_1D6E1E224();
  swift_release();
  objc_msgSend(v5, sel_ts_scrollToTop_dismissKeyboard_, v3, 1);

}

@end
