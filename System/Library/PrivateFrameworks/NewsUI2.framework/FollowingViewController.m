@implementation FollowingViewController

- (_TtC7NewsUI223FollowingViewController)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC7NewsUI223FollowingViewController *result;

  v5 = (char *)self + OBJC_IVAR____TtC7NewsUI223FollowingViewController_previousSelectedIndexPath;
  v6 = sub_1D6E16178();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC7NewsUI223FollowingViewController____lazy_storage___sidebarBarButtonItem) = 0;
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC7NewsUI223FollowingViewController_viewHasAppearedAtLeastOnce) = 0;
  v7 = a3;

  result = (_TtC7NewsUI223FollowingViewController *)sub_1D6E28010();
  __break(1u);
  return result;
}

- (void)dealloc
{
  objc_class *ObjectType;
  _TtC7NewsUI223FollowingViewController *v4;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  swift_retain();
  sub_1D6E1C874();
  swift_release();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  -[FollowingViewController dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI223FollowingViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI223FollowingViewController_blueprintViewController));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI223FollowingViewController_purchaseController));
  swift_unknownObjectRelease();
  sub_1D5E8D20C((uint64_t)self + OBJC_IVAR____TtC7NewsUI223FollowingViewController_previousSelectedIndexPath, (uint64_t (*)(_QWORD))sub_1D5F2FD28);
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI223FollowingViewController_offlineProvider);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI223FollowingViewController_followingTabGroupManager));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI223FollowingViewController____lazy_storage___sidebarBarButtonItem));
}

- (void)viewDidLoad
{
  _TtC7NewsUI223FollowingViewController *v2;

  v2 = self;
  sub_1D6BAFF64();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC7NewsUI223FollowingViewController *v4;

  v4 = self;
  sub_1D6BB07BC(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC7NewsUI223FollowingViewController *v4;

  v4 = self;
  sub_1D6BB0AA8(a3);

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
  -[FollowingViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
  sub_1D6E1C880();

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC7NewsUI223FollowingViewController *v4;

  v4 = self;
  sub_1D6BB0D8C(a3);

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
  -[FollowingViewController viewWillLayoutSubviews](&v15, sel_viewWillLayoutSubviews);
  v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC7NewsUI223FollowingViewController_blueprintViewController], sel_view, v15.receiver, v15.super_class);
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

- (void)viewSafeAreaInsetsDidChange
{
  _TtC7NewsUI223FollowingViewController *v2;

  v2 = self;
  sub_1D6BB137C();

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
  -[FollowingViewController traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1D6BB5668();

}

- (id)contentScrollView
{
  _TtC7NewsUI223FollowingViewController *v2;
  void *v3;

  v2 = self;
  sub_1D6E1E9BC();
  v3 = (void *)sub_1D6E1E224();

  swift_release();
  return v3;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v5;
  _TtC7NewsUI223FollowingViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1D6BB0F18(v5, a4);

}

- (void)delete:(id)a3
{
  _TtC7NewsUI223FollowingViewController *v4;
  _TtC7NewsUI223FollowingViewController *v5;
  _OWORD v6[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1D6E27D04();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_1D6BB1748();

  sub_1D5E8D20C((uint64_t)v6, (uint64_t (*)(_QWORD))sub_1D5F11814);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  _TtC7NewsUI223FollowingViewController *v6;
  _TtC7NewsUI223FollowingViewController *v7;
  char v8;
  _OWORD v10[2];

  if (a4)
  {
    v6 = self;
    swift_unknownObjectRetain();
    sub_1D6E27D04();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  v8 = sub_1D6BB1D00((uint64_t)a3, (uint64_t)v10);

  sub_1D5E8D20C((uint64_t)v10, (uint64_t (*)(_QWORD))sub_1D5F11814);
  return v8 & 1;
}

- (void)handleSidebarWithSender:(id)a3
{
  _TtC7NewsUI223FollowingViewController *v4;
  _TtC7NewsUI223FollowingViewController *v5;
  _TtC7NewsUI223FollowingViewController *v6;
  uint64_t v7;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1D6E27D04();
  swift_unknownObjectRelease();
  v5 = (_TtC7NewsUI223FollowingViewController *)-[FollowingViewController splitViewController](v4, sel_splitViewController);
  if (v5)
  {
    v6 = v5;
    -[FollowingViewController togglePrimaryViewVisibilityAnimated:](v5, sel_togglePrimaryViewVisibilityAnimated_, 1);

    v4 = v6;
  }

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v7);
}

- (_TtC7NewsUI223FollowingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7NewsUI223FollowingViewController *result;

  v4 = a4;
  result = (_TtC7NewsUI223FollowingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)tabBarControllerDidDoubleTapBarButtonItem:(id)a3
{
  id v4;
  _TtC7NewsUI223FollowingViewController *v5;
  id v6;

  v4 = a3;
  v5 = self;
  sub_1D6E1E9BC();
  v6 = (id)sub_1D6E1E224();
  swift_release();
  objc_msgSend(v6, sel_scrollRectToVisible_animated_, 1, 0.0, 0.0, 1.0, 1.0);

}

- (void)tabBarSplitViewDidChangeTraitCollectionToTraitCollection:(id)a3
{
  id v4;
  _TtC7NewsUI223FollowingViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1D6BB58FC();

}

- (void)tabBarSplitViewWillChangeDisplayModeToDisplayMode:(int64_t)a3
{
  _TtC7NewsUI223FollowingViewController *v4;

  v4 = self;
  sub_1D6BB3C60((void *)a3);

}

- (void)tabBarSplitViewDidChangeCollapseStateToCollapseState:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  _TtC7NewsUI223FollowingViewController *v5;

  v3 = a3;
  v5 = self;
  sub_1D6BB05A8(0, 1);
  v4 = *(Class *)((char *)&v5->super.super.super.super.isa
                + OBJC_IVAR____TtC7NewsUI223FollowingViewController_searchCoordinator);
  if ((objc_msgSend(v4, sel_respondsToSelector_, sel_tabBarSplitViewDidChangeCollapseStateToCollapseState_) & 1) != 0)objc_msgSend(v4, sel_tabBarSplitViewDidChangeCollapseStateToCollapseState_, v3);

}

- (void)scrollToTopAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _TtC7NewsUI223FollowingViewController *v4;
  id v5;

  v3 = a3;
  v4 = self;
  sub_1D6E1E9BC();
  v5 = (id)sub_1D6E1E224();
  swift_release();
  objc_msgSend(v5, sel_ts_scrollToTop_, v3);

}

@end
