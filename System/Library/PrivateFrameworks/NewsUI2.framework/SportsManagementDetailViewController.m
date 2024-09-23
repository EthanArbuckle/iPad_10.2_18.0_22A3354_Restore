@implementation SportsManagementDetailViewController

- (_TtC7NewsUI236SportsManagementDetailViewController)initWithCoder:(id)a3
{
  id v5;
  _TtC7NewsUI236SportsManagementDetailViewController *result;

  *(_QWORD *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC7NewsUI236SportsManagementDetailViewController_selectionProvider) = 0;
  swift_unknownObjectWeakInit();
  v5 = a3;

  result = (_TtC7NewsUI236SportsManagementDetailViewController *)sub_1D6E28010();
  __break(1u);
  return result;
}

- (_TtC7NewsUI236SportsManagementDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7NewsUI236SportsManagementDetailViewController *result;

  v4 = a4;
  result = (_TtC7NewsUI236SportsManagementDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI236SportsManagementDetailViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI236SportsManagementDetailViewController_blueprintViewController));
  sub_1D5E8D20C((uint64_t)self + OBJC_IVAR____TtC7NewsUI236SportsManagementDetailViewController_model, (uint64_t (*)(_QWORD))type metadata accessor for SportsDetailModel);
  sub_1D5FF43C0((uint64_t)self + OBJC_IVAR____TtC7NewsUI236SportsManagementDetailViewController_selectionProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI236SportsManagementDetailViewController_titleViewProvider);
}

- (void)viewDidLoad
{
  _TtC7NewsUI236SportsManagementDetailViewController *v2;

  v2 = self;
  sub_1D665BCCC();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v4;

  v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  -[SportsManagementDetailViewController viewDidAppear:](&v4, sel_viewDidAppear_, v3);
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC7NewsUI236SportsManagementDetailViewController *v4;

  v4 = self;
  sub_1D665C1B8(a3);

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
  -[SportsManagementDetailViewController viewWillLayoutSubviews](&v15, sel_viewWillLayoutSubviews);
  v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC7NewsUI236SportsManagementDetailViewController_blueprintViewController], sel_view, v15.receiver, v15.super_class);
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
  -[SportsManagementDetailViewController traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1D665CF18();

}

- (void)dismissVC
{
  _TtC7NewsUI236SportsManagementDetailViewController *v2;
  id v3;

  v2 = self;
  sub_1D6E1AE1C();
  v3 = (id)sub_1D6E19E50();
  type metadata accessor for SportsManagementDetailEventHandler();
  sub_1D6E1ACA8();

  swift_release();
  swift_release();

}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v4 = sub_1D6E16178();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D6E1613C();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return 0;
}

@end
