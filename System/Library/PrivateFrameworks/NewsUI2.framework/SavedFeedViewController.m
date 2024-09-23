@implementation SavedFeedViewController

- (_TtC7NewsUI223SavedFeedViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC7NewsUI223SavedFeedViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7NewsUI223SavedFeedViewController____lazy_storage___clearButton) = 0;
  v4 = a3;

  result = (_TtC7NewsUI223SavedFeedViewController *)sub_1D6E28010();
  __break(1u);
  return result;
}

- (_TtC7NewsUI223SavedFeedViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7NewsUI223SavedFeedViewController *result;

  v4 = a4;
  result = (_TtC7NewsUI223SavedFeedViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI223SavedFeedViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI223SavedFeedViewController_blueprintViewController));
  swift_release();

  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI223SavedFeedViewController____lazy_storage___clearButton));
}

- (void)viewDidLoad
{
  _TtC7NewsUI223SavedFeedViewController *v2;

  v2 = self;
  sub_1D67B9E70();

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
  -[SavedFeedViewController viewWillLayoutSubviews](&v15, sel_viewWillLayoutSubviews);
  v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC7NewsUI223SavedFeedViewController_blueprintViewController], sel_view, v15.receiver, v15.super_class);
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
  _TtC7NewsUI223SavedFeedViewController *v4;

  v4 = self;
  sub_1D67BA51C(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC7NewsUI223SavedFeedViewController *v4;

  v4 = self;
  sub_1D67BA944(a3);

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
  -[SavedFeedViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
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
  -[SavedFeedViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
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
  -[SavedFeedViewController traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1D67BBD64();

}

- (void)clearSaved
{
  uint64_t v3;
  uint64_t ObjectType;
  void (*v5)(uint64_t, uint64_t);
  _TtC7NewsUI223SavedFeedViewController *v6;

  v3 = (*(_QWORD **)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC7NewsUI223SavedFeedViewController_eventHandler))[5];
  ObjectType = swift_getObjectType();
  v5 = *(void (**)(uint64_t, uint64_t))(v3 + 48);
  v6 = self;
  v5(ObjectType, v3);

}

- (void)tabBarSplitViewDidChangeFocusToFocus:(int64_t)a3 action:(int64_t)a4
{
  _TtC7NewsUI223SavedFeedViewController *v5;

  v5 = self;
  sub_1D67BBF10(a3);

}

- (void)scrollToTopAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _TtC7NewsUI223SavedFeedViewController *v4;
  id v5;

  v3 = a3;
  v4 = self;
  sub_1D6E1E9BC();
  v5 = (id)sub_1D6E1E224();
  swift_release();
  objc_msgSend(v5, sel_ts_scrollToTop_, v3);

}

@end
