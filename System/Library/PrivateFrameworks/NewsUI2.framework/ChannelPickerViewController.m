@implementation ChannelPickerViewController

- (_TtC7NewsUI227ChannelPickerViewController)initWithCoder:(id)a3
{
  _QWORD *v5;
  id v6;
  _TtC7NewsUI227ChannelPickerViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7NewsUI227ChannelPickerViewController_searchController) = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC7NewsUI227ChannelPickerViewController_selectionProvider) = 0;
  swift_unknownObjectWeakInit();
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC7NewsUI227ChannelPickerViewController_postPurchaseOnboardingTransitionDelegate);
  *v5 = 0;
  v5[1] = 0;
  v6 = a3;

  result = (_TtC7NewsUI227ChannelPickerViewController *)sub_1D6E28010();
  __break(1u);
  return result;
}

- (_TtC7NewsUI227ChannelPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7NewsUI227ChannelPickerViewController *result;

  v4 = a4;
  result = (_TtC7NewsUI227ChannelPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI227ChannelPickerViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI227ChannelPickerViewController_blueprintViewController));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI227ChannelPickerViewController_searchModule);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI227ChannelPickerViewController_searchController));
  sub_1D6270834(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsUI227ChannelPickerViewController_pickerType), *(_QWORD *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC7NewsUI227ChannelPickerViewController_pickerType));
  swift_unknownObjectWeakDestroy();
  sub_1D5FF43C0((uint64_t)self + OBJC_IVAR____TtC7NewsUI227ChannelPickerViewController_selectionProvider);
  swift_unknownObjectRelease();
}

- (void)viewDidLoad
{
  _TtC7NewsUI227ChannelPickerViewController *v2;

  v2 = self;
  sub_1D6608240();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v4;

  v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  -[ChannelPickerViewController viewDidAppear:](&v4, sel_viewDidAppear_, v3);
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC7NewsUI227ChannelPickerViewController *v4;

  v4 = self;
  sub_1D6608A20(a3);

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
  -[ChannelPickerViewController viewWillLayoutSubviews](&v15, sel_viewWillLayoutSubviews);
  v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC7NewsUI227ChannelPickerViewController_blueprintViewController], sel_view, v15.receiver, v15.super_class);
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
  -[ChannelPickerViewController traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1D660A408();

}

- (void)dismissVC
{
  _TtC7NewsUI227ChannelPickerViewController *v2;

  v2 = self;
  sub_1D6608D3C();

}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  id v4;
  _TtC7NewsUI227ChannelPickerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1D660A5BC(v4);

}

- (void)searchBarTextDidEndEditing:(id)a3
{
  objc_msgSend(a3, sel_resignFirstResponder);
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v6;
  _TtC7NewsUI227ChannelPickerViewController *v7;

  sub_1D6E26978();
  v6 = a3;
  v7 = self;
  sub_1D6609F60((uint64_t)v6);

  swift_bridgeObjectRelease();
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  id v4;
  _TtC7NewsUI227ChannelPickerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1D660A0F4((uint64_t)v4);

}

@end
