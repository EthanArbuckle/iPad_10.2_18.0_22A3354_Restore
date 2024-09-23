@implementation HistoryFeedViewController

- (_TtC7NewsUI225HistoryFeedViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC7NewsUI225HistoryFeedViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7NewsUI225HistoryFeedViewController____lazy_storage___clearButton) = 0;
  v4 = a3;

  result = (_TtC7NewsUI225HistoryFeedViewController *)sub_1D6E28010();
  __break(1u);
  return result;
}

- (_TtC7NewsUI225HistoryFeedViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7NewsUI225HistoryFeedViewController *result;

  v4 = a4;
  result = (_TtC7NewsUI225HistoryFeedViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI225HistoryFeedViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI225HistoryFeedViewController_blueprintViewController));
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI225HistoryFeedViewController____lazy_storage___clearButton));
}

- (void)viewDidLoad
{
  _TtC7NewsUI225HistoryFeedViewController *v2;

  v2 = self;
  sub_1D6C9C5E8();

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
  -[HistoryFeedViewController viewWillLayoutSubviews](&v15, sel_viewWillLayoutSubviews);
  v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC7NewsUI225HistoryFeedViewController_blueprintViewController], sel_view, v15.receiver, v15.super_class);
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
  _TtC7NewsUI225HistoryFeedViewController *v4;

  v4 = self;
  sub_1D6C9CC8C(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC7NewsUI225HistoryFeedViewController *v4;

  v4 = self;
  sub_1D6C9D09C(a3);

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
  -[HistoryFeedViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
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
  -[HistoryFeedViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
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
  -[HistoryFeedViewController traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1D6C9E494();

}

- (void)clearHistory
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t ObjectType;
  uint64_t (*v7)(uint64_t, uint64_t);
  _TtC7NewsUI225HistoryFeedViewController *v8;
  _TtC7NewsUI225HistoryFeedViewController *v9;
  _TtC7NewsUI225HistoryFeedViewController *v10;
  _TtC7NewsUI225HistoryFeedViewController *v11;

  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsUI225HistoryFeedViewController_eventHandler);
  v4 = __swift_project_boxed_opaque_existential_1(v3 + 6, v3[9]);
  v5 = v3[5];
  ObjectType = swift_getObjectType();
  v7 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 32);
  v8 = self;
  v11 = (_TtC7NewsUI225HistoryFeedViewController *)v7(ObjectType, v5);
  v9 = (_TtC7NewsUI225HistoryFeedViewController *)MEMORY[0x1D82919D4](*v4 + 16);
  if (v9)
  {
    v10 = v9;
    -[HistoryFeedViewController presentViewController:animated:completion:](v9, sel_presentViewController_animated_completion_, v11, 1, 0);

    v8 = v11;
    v11 = v10;
  }

}

- (void)tabBarSplitViewDidChangeFocusToFocus:(int64_t)a3 action:(int64_t)a4
{
  _TtC7NewsUI225HistoryFeedViewController *v5;

  v5 = self;
  sub_1D6C9E634(a3);

}

- (void)scrollToTopAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _TtC7NewsUI225HistoryFeedViewController *v4;
  id v5;

  v3 = a3;
  v4 = self;
  sub_1D6E1E9BC();
  v5 = (id)sub_1D6E1E224();
  swift_release();
  objc_msgSend(v5, sel_ts_scrollToTop_, v3);

}

@end
