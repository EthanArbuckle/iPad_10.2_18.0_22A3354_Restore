@implementation MagazineFeedViewController

- (_TtC7NewsUI226MagazineFeedViewController)initWithCoder:(id)a3
{
  _TtC7NewsUI226MagazineFeedViewController *result;

  result = (_TtC7NewsUI226MagazineFeedViewController *)sub_1D6E28010();
  __break(1u);
  return result;
}

- (_TtC7NewsUI226MagazineFeedViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7NewsUI226MagazineFeedViewController *result;

  v4 = a4;
  result = (_TtC7NewsUI226MagazineFeedViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI226MagazineFeedViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI226MagazineFeedViewController_blueprintViewController));
  swift_unknownObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI226MagazineFeedViewController_offlineAlertControllerFactory);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI226MagazineFeedViewController_feedPaywallConfigFactory);
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
}

- (void)viewDidLoad
{
  _TtC7NewsUI226MagazineFeedViewController *v2;

  v2 = self;
  sub_1D627B6C8();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC7NewsUI226MagazineFeedViewController *v4;

  v4 = self;
  sub_1D627BEC0(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC7NewsUI226MagazineFeedViewController *v4;

  v4 = self;
  sub_1D627C284(a3);

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
  -[MagazineFeedViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
  sub_1D6E1D588();

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  uint64_t v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = v6.receiver;
  -[MagazineFeedViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, v3);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1D6E44300;
  *(_BYTE *)(v5 + 32) = 2;
  sub_1D6E1DFC0();

  swift_release();
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
  -[MagazineFeedViewController viewWillLayoutSubviews](&v15, sel_viewWillLayoutSubviews);
  v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC7NewsUI226MagazineFeedViewController_blueprintViewController], sel_view, v15.receiver, v15.super_class);
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
  -[MagazineFeedViewController traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1D627E940();

}

- (void)offlineStatusBannerRequestedForceReload
{
  uint64_t v2;
  _TtC7NewsUI226MagazineFeedViewController *v3;
  id v4;
  uint64_t v5;
  uint64_t ObjectType;
  id v7;

  v2 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC7NewsUI226MagazineFeedViewController_eventHandler);
  v3 = self;
  sub_1D6E1EA1C();
  v4 = objc_allocWithZone((Class)sub_1D6E1F28C());
  v7 = (id)sub_1D6E1F274();
  v5 = *(_QWORD *)(v2 + 40);
  ObjectType = swift_getObjectType();
  (*(void (**)(id, uint64_t, uint64_t))(v5 + 64))(v7, ObjectType, v5);

}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  uint64_t v5;
  uint64_t ObjectType;
  void (*v7)(uint64_t, uint64_t);
  id v8;
  _TtC7NewsUI226MagazineFeedViewController *v9;

  v5 = (*(_QWORD **)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC7NewsUI226MagazineFeedViewController_eventHandler))[5];
  ObjectType = swift_getObjectType();
  v7 = *(void (**)(uint64_t, uint64_t))(v5 + 80);
  v8 = a3;
  v9 = self;
  v7(ObjectType, v5);

  return 1;
}

- (void)tabBarSplitViewDidChangeFocusToFocus:(int64_t)a3 action:(int64_t)a4
{
  _TtC7NewsUI226MagazineFeedViewController *v5;

  v5 = self;
  sub_1D627EC60(a3);

}

- (void)startTraversingWithDirection:(int64_t)a3
{
  _TtC7NewsUI226MagazineFeedViewController *v3;

  v3 = self;
  sub_1D6E1E9D4();

}

- (void)deselect
{
  _TtC7NewsUI226MagazineFeedViewController *v2;
  id v3;

  v2 = self;
  sub_1D6E1E9BC();
  v3 = (id)sub_1D6E1E224();
  swift_release();
  objc_msgSend(v3, sel_selectItemAtIndexPath_animated_scrollPosition_, 0, 0, 0);

}

- (void)scrollToTopAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _TtC7NewsUI226MagazineFeedViewController *v4;
  id v5;

  v3 = a3;
  v4 = self;
  sub_1D6E1E9BC();
  v5 = (id)sub_1D6E1E224();
  swift_release();
  objc_msgSend(v5, sel_ts_scrollToTop_dismissKeyboard_, v3, 1);

}

@end
