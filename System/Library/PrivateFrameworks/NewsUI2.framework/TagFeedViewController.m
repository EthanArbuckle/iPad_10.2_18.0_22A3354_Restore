@implementation TagFeedViewController

- (void)dealloc
{
  objc_class *ObjectType;
  _TtC7NewsUI221TagFeedViewController *v4;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  swift_retain();
  sub_1D6E1C874();
  swift_release();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  -[TagFeedViewController dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI221TagFeedViewController_feedDescriptor));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI221TagFeedViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI221TagFeedViewController_blueprintViewController));
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI221TagFeedViewController_refreshControl));
  swift_release();
  objc_release(*(id *)((char *)&self->super._view
                     + OBJC_IVAR____TtC7NewsUI221TagFeedViewController_debugButtonConfiguration));
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI221TagFeedViewController_tipModelAvailability);
}

- (_TtC7NewsUI221TagFeedViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D62C75A0();
}

- (_TtC7NewsUI221TagFeedViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7NewsUI221TagFeedViewController *result;

  v4 = a4;
  result = (_TtC7NewsUI221TagFeedViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC7NewsUI221TagFeedViewController *v2;

  v2 = self;
  sub_1D62C2068();

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
  -[TagFeedViewController viewWillLayoutSubviews](&v15, sel_viewWillLayoutSubviews);
  v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC7NewsUI221TagFeedViewController_blueprintViewController], sel_view, v15.receiver, v15.super_class);
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

- (void)viewDidAppear:(BOOL)a3
{
  _TtC7NewsUI221TagFeedViewController *v4;

  v4 = self;
  sub_1D62C2E64(a3);

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
  -[TagFeedViewController traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1D62C778C();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC7NewsUI221TagFeedViewController *v4;

  v4 = self;
  sub_1D62C33BC(a3);

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
  -[TagFeedViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
  sub_1D6E1D588();
  sub_1D6E1C880();

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = (char *)v5.receiver;
  -[TagFeedViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC7NewsUI221TagFeedViewController_refreshControl], sel_endRefreshing, v5.receiver, v5.super_class);

}

- (void)viewSafeAreaInsetsDidChange
{
  _TtC7NewsUI221TagFeedViewController *v2;

  v2 = self;
  sub_1D62C39BC();

}

- (void)didPullToRefreshWithSender:(id)a3
{
  id v4;
  _TtC7NewsUI221TagFeedViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1D6E19FA0();

}

- (void)offlineStatusBannerRequestedForceReload
{
  _TtC7NewsUI221TagFeedViewController *v2;

  v2 = self;
  sub_1D62C2BE0();

}

- (void)gutterViewBoundsDidChange
{
  _TtC7NewsUI221TagFeedViewController *v2;

  v2 = self;
  sub_1D62C4C1C();

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC7NewsUI221TagFeedViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1D62C6BE4(v4);

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t ObjectType;
  uint64_t v13;
  _TtC7NewsUI221TagFeedViewController *v14;

  v5 = sub_1D6E231BC();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a3;
  v14 = self;
  if ((sub_1D6E272A8() & 1) != 0)
  {
    v10 = *(uint64_t *)((char *)&v14->super.super.super.isa + OBJC_IVAR____TtC7NewsUI221TagFeedViewController_eventHandler);
    (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x1E0D5C178], v5);
    v11 = *(_QWORD *)(v10 + 40);
    ObjectType = swift_getObjectType();
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 112))(v8, ObjectType, v11);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t ObjectType;
  uint64_t v15;
  _TtC7NewsUI221TagFeedViewController *v16;

  v7 = sub_1D6E231BC();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = a3;
  v16 = self;
  if ((sub_1D6E272A8() & 1) != 0 && !a4)
  {
    v12 = *(uint64_t *)((char *)&v16->super.super.super.isa + OBJC_IVAR____TtC7NewsUI221TagFeedViewController_eventHandler);
    (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x1E0D5C178], v7);
    v13 = *(_QWORD *)(v12 + 40);
    ObjectType = swift_getObjectType();
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 112))(v10, ObjectType, v13);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  }
  else
  {

  }
}

- (void)scrollToTopAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _TtC7NewsUI221TagFeedViewController *v4;
  id v5;

  v3 = a3;
  v4 = self;
  sub_1D6E1E9BC();
  v5 = (id)sub_1D6E1E224();
  swift_release();
  objc_msgSend(v5, sel_ts_scrollToTop_dismissKeyboard_, v3, (char *)objc_msgSend(*(id *)((char *)&v4->super.super.super.isa + OBJC_IVAR____TtC7NewsUI221TagFeedViewController_feedDescriptor), sel_feedConfiguration)- 12 < (char *)0xFFFFFFFFFFFFFFFDLL);

}

@end
