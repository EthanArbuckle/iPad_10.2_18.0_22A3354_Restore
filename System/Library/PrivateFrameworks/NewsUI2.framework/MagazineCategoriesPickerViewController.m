@implementation MagazineCategoriesPickerViewController

- (_TtC7NewsUI238MagazineCategoriesPickerViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  _TtC7NewsUI238MagazineCategoriesPickerViewController *result;

  *(_QWORD *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC7NewsUI238MagazineCategoriesPickerViewController_delegate) = 0;
  swift_unknownObjectWeakInit();
  v5 = OBJC_IVAR____TtC7NewsUI238MagazineCategoriesPickerViewController_coverViewManager;
  sub_1D6E1D678();
  swift_allocObject();
  v6 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)sub_1D6E1D66C();
  v7 = OBJC_IVAR____TtC7NewsUI238MagazineCategoriesPickerViewController_eventManager;
  sub_1D5EB2A68(0, &qword_1EFFE6380, (uint64_t (*)(void))sub_1D646452C, (uint64_t)&type metadata for MagazineCategoriesPickerViewController.Event, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E0DB3508]);
  swift_allocObject();
  *(Class *)((char *)&self->super.super.super.isa + v7) = (Class)sub_1D6E19EC8();

  result = (_TtC7NewsUI238MagazineCategoriesPickerViewController *)sub_1D6E28010();
  __break(1u);
  return result;
}

- (void)closeButtonTappedWithSender:(id)a3
{
  _TtC7NewsUI238MagazineCategoriesPickerViewController *v4;
  _TtC7NewsUI238MagazineCategoriesPickerViewController *v5;
  _TtC7NewsUI238MagazineCategoriesPickerViewController *v6;
  _TtC7NewsUI238MagazineCategoriesPickerViewController *v7;

  v4 = (_TtC7NewsUI238MagazineCategoriesPickerViewController *)a3;
  v7 = self;
  v5 = (_TtC7NewsUI238MagazineCategoriesPickerViewController *)-[MagazineCategoriesPickerViewController parentViewController](v7, sel_parentViewController);
  if (v5)
  {
    v6 = v5;
    -[MagazineCategoriesPickerViewController dismissViewControllerAnimated:completion:](v5, sel_dismissViewControllerAnimated_completion_, 1, 0);

    v4 = v7;
    v7 = v6;
  }

}

- (_TtC7NewsUI238MagazineCategoriesPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7NewsUI238MagazineCategoriesPickerViewController *result;

  v4 = a4;
  result = (_TtC7NewsUI238MagazineCategoriesPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1D5FF43C0((uint64_t)self + OBJC_IVAR____TtC7NewsUI238MagazineCategoriesPickerViewController_delegate);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI238MagazineCategoriesPickerViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI238MagazineCategoriesPickerViewController_blueprintViewController));
  swift_release();
  swift_release();
  swift_release();
}

- (void)viewDidLoad
{
  _TtC7NewsUI238MagazineCategoriesPickerViewController *v2;

  v2 = self;
  sub_1D65E6754();

}

- (void)viewWillLayoutSubviews
{
  _TtC7NewsUI238MagazineCategoriesPickerViewController *v2;

  v2 = self;
  sub_1D65E6FDC();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  -[MagazineCategoriesPickerViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
  sub_1D6E19EA4();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC7NewsUI238MagazineCategoriesPickerViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1D65E71E8((uint64_t)a3);

}

@end
