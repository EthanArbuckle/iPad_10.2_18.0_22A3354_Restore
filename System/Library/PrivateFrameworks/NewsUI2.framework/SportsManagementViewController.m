@implementation SportsManagementViewController

- (_TtC7NewsUI230SportsManagementViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC7NewsUI230SportsManagementViewController *result;

  swift_unknownObjectWeakInit();
  *(_QWORD *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC7NewsUI230SportsManagementViewController_selectionProvider) = 0;
  swift_unknownObjectWeakInit();
  v5 = OBJC_IVAR____TtC7NewsUI230SportsManagementViewController_overscrollView;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC3F10]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC7NewsUI230SportsManagementViewController *)sub_1D6E28010();
  __break(1u);
  return result;
}

- (_TtC7NewsUI230SportsManagementViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7NewsUI230SportsManagementViewController *result;

  v4 = a4;
  result = (_TtC7NewsUI230SportsManagementViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI230SportsManagementViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI230SportsManagementViewController_blueprintViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI230SportsManagementViewController_searchController));
  swift_unknownObjectWeakDestroy();
  sub_1D5FF43C0((uint64_t)self + OBJC_IVAR____TtC7NewsUI230SportsManagementViewController_selectionProvider);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI230SportsManagementViewController_overscrollView));
}

- (void)viewDidLoad
{
  _TtC7NewsUI230SportsManagementViewController *v2;

  v2 = self;
  sub_1D64B0048();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v4;

  v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  -[SportsManagementViewController viewDidAppear:](&v4, sel_viewDidAppear_, v3);
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC7NewsUI230SportsManagementViewController *v4;

  v4 = self;
  sub_1D64B0884(a3);

}

- (void)viewWillLayoutSubviews
{
  _TtC7NewsUI230SportsManagementViewController *v2;

  v2 = self;
  sub_1D64B0A20();

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
  -[SportsManagementViewController traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1D64B199C();

}

- (void)dismissVC
{
  _TtC7NewsUI230SportsManagementViewController *v2;
  id v3;

  v2 = self;
  sub_1D6E1AE1C();
  v3 = (id)sub_1D6E19E50();
  type metadata accessor for SportsManagementEventHandler();
  sub_1D6E1AC3C();

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

- (void)searchBarTextDidBeginEditing:(id)a3
{
  id v4;
  _TtC7NewsUI230SportsManagementViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1D64B1B5C(v4);

}

- (void)searchBarTextDidEndEditing:(id)a3
{
  objc_msgSend(a3, sel_resignFirstResponder);
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v6;
  _TtC7NewsUI230SportsManagementViewController *v7;

  sub_1D6E26978();
  v6 = a3;
  v7 = self;
  sub_1D64B1780((uint64_t)v6);

  swift_bridgeObjectRelease();
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _TtC7NewsUI230SportsManagementViewController *v10;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7NewsUI230SportsManagementViewController_searchController);
  v5 = a3;
  v10 = self;
  v6 = objc_msgSend(v4, sel_searchResultsController);
  if (v6)
  {
    v7 = v6;
    v8 = (void *)swift_dynamicCastObjCProtocolConditional();
    if (v8)
    {
      v9 = v8;
      if ((objc_msgSend(v8, sel_respondsToSelector_, sel_searchBarCancelButtonClicked_) & 1) != 0)
        objc_msgSend(v9, sel_searchBarCancelButtonClicked_, v5);
    }

  }
  else
  {

  }
}

@end
