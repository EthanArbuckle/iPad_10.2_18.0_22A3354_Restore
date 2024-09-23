@implementation TodayViewController

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
  -[TodayViewController viewWillLayoutSubviews](&v15, sel_viewWillLayoutSubviews);
  v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC7NewsUI219TodayViewController_blueprintViewController], sel_view, v15.receiver, v15.super_class);
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

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC7NewsUI219TodayViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1D5F2CC80(v4);

}

- (void)viewSafeAreaInsetsDidChange
{
  id v2;
  id v3;
  uint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = v5.receiver;
  -[TodayViewController viewSafeAreaInsetsDidChange](&v5, sel_viewSafeAreaInsetsDidChange);
  v3 = objc_msgSend(v2, sel_traitCollection, v5.receiver, v5.super_class);
  objc_msgSend(v3, sel_horizontalSizeClass);

  sub_1D5E6D4DC((unint64_t *)&qword_1ED5E70C0, v4, (uint64_t (*)(uint64_t))type metadata accessor for TodayViewController, (uint64_t)&unk_1D6EB64DC);
  sub_1D6E1CC64();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC7NewsUI219TodayViewController *v4;

  v4 = self;
  sub_1D5ED7450(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC7NewsUI219TodayViewController *v4;

  v4 = self;
  sub_1D5EF16E0(a3);

}

- (void)viewDidLoad
{
  _TtC7NewsUI219TodayViewController *v2;

  v2 = self;
  sub_1D5F16404();

}

- (void)dealloc
{
  objc_class *ObjectType;
  _TtC7NewsUI219TodayViewController *v4;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  swift_retain();
  sub_1D6E1C874();
  swift_release();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  -[TodayViewController dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI219TodayViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI219TodayViewController_blueprintViewController));
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI219TodayViewController_barCompressionManager));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI219TodayViewController_refreshControl));
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  sub_1D5FF43C0((uint64_t)self + OBJC_IVAR____TtC7NewsUI219TodayViewController_mastheadViewProviderDelegate);
  sub_1D5FF43C0((uint64_t)self + OBJC_IVAR____TtC7NewsUI219TodayViewController_miniMastheadViewProviderDelegate);
  swift_release();
}

- (_TtC7NewsUI219TodayViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D6AA0310();
}

- (_TtC7NewsUI219TodayViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7NewsUI219TodayViewController *result;

  v4 = a4;
  result = (_TtC7NewsUI219TodayViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC7NewsUI219TodayViewController *v4;

  v4 = self;
  sub_1D6A9D540(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC7NewsUI219TodayViewController *v4;

  v4 = self;
  sub_1D6A9D6C8(a3);

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
  -[TodayViewController traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1D6AA0518();

}

- (void)dismissKeyboard
{
  _TtC7NewsUI219TodayViewController *v2;
  id v3;
  id v4;

  v2 = self;
  v3 = -[TodayViewController view](v2, sel_view);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_endEditing_, 1);

  }
  else
  {
    __break(1u);
  }
}

- (void)didPullToRefresh
{
  _TtC7NewsUI219TodayViewController *v2;

  v2 = self;
  sub_1D6E19FA0();

}

- (void)significantTimeChangeDidOccur
{
  uint64_t ObjectType;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC7NewsUI219TodayViewController *v7;
  _TtC7NewsUI219TodayViewController *v8;
  _TtC7NewsUI219TodayViewController *v9;

  ObjectType = swift_getObjectType();
  v5 = sub_1D5E6D4DC((unint64_t *)&qword_1ED5E70C0, v4, (uint64_t (*)(uint64_t))type metadata accessor for TodayViewController, (uint64_t)&unk_1D6EB64DC);
  v9 = self;
  v6 = MEMORY[0x1D8285488](ObjectType, v5);
  if (v6)
  {
    v7 = (_TtC7NewsUI219TodayViewController *)v6;
    swift_getObjectType();
    sub_1D6E1F160();

    v8 = v7;
  }
  else
  {
    v8 = v9;
  }

}

- (void)offlineStatusBannerRequestedForceReload
{
  _TtC7NewsUI219TodayViewController *v2;

  v2 = self;
  sub_1D6A9D37C();

}

- (void)startTraversingWithDirection:(int64_t)a3
{
  _TtC7NewsUI219TodayViewController *v3;

  v3 = self;
  sub_1D6E1E9D4();

}

- (void)deselect
{
  _TtC7NewsUI219TodayViewController *v2;
  id v3;

  v2 = self;
  sub_1D6E1E9BC();
  v3 = (id)sub_1D6E1E224();
  swift_release();
  objc_msgSend(v3, sel_selectItemAtIndexPath_animated_scrollPosition_, 0, 0, 0);

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v5;
  _TtC7NewsUI219TodayViewController *v6;

  if (!a4)
  {
    v5 = a3;
    v6 = self;
    sub_1D5F2CD64();

  }
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v4;
  _TtC7NewsUI219TodayViewController *v5;

  v4 = a3;
  v5 = self;
  if ((objc_msgSend(v4, sel_ts_isScrolling) & 1) == 0)
    sub_1D5F2CD64();

}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  uint64_t v5;
  uint64_t ObjectType;
  void (*v7)(uint64_t, uint64_t);
  id v8;
  _TtC7NewsUI219TodayViewController *v9;

  v5 = (*(_QWORD **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsUI219TodayViewController_eventHandler))[5];
  ObjectType = swift_getObjectType();
  v7 = *(void (**)(uint64_t, uint64_t))(v5 + 136);
  v8 = a3;
  v9 = self;
  v7(ObjectType, v5);

  return 1;
}

- (void)scrollViewDidScrollToTop:(id)a3
{
  id v4;
  _TtC7NewsUI219TodayViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1D5F2CD64();

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  _TtC7NewsUI219TodayViewController *v4;
  _TtC7NewsUI219TodayViewController *v5;
  _TtC7NewsUI219TodayViewController *v6;
  void *v7;
  _TtC7NewsUI219TodayViewController *v8;

  v4 = (_TtC7NewsUI219TodayViewController *)a3;
  v5 = self;
  v6 = (_TtC7NewsUI219TodayViewController *)-[TodayViewController presentedViewController](v5, sel_presentedViewController);
  if (v6)
  {
    v8 = v6;
    type metadata accessor for ContinueReadingViewController();
    v7 = (void *)swift_dynamicCastClass();
    if (v7)
      sub_1D6CA34F4(v7);

    v4 = v5;
  }
  else
  {
    v8 = v5;
  }

}

- (void)scrollToTopAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _TtC7NewsUI219TodayViewController *v4;
  id v5;

  v3 = a3;
  v4 = self;
  sub_1D6E1E9BC();
  v5 = (id)sub_1D6E1E224();
  swift_release();
  objc_msgSend(v5, sel_ts_scrollToTop_dismissKeyboard_, v3, 1);

}

@end
