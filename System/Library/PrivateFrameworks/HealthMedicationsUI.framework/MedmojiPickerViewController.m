@implementation MedmojiPickerViewController

- (_TtC19HealthMedicationsUI27MedmojiPickerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BC22A174();
}

- (void)viewDidLoad
{
  _TtC19HealthMedicationsUI27MedmojiPickerViewController *v2;

  v2 = self;
  sub_1BC227708();

}

- (void)cancelButtonTappped:(id)a3
{
  char *v4;
  uint64_t v5;
  uint64_t ObjectType;
  void (*v7)(uint64_t, uint64_t);
  id v8;
  _TtC19HealthMedicationsUI27MedmojiPickerViewController *v9;
  id v10;
  _TtC19HealthMedicationsUI27MedmojiPickerViewController *v11;

  v4 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI27MedmojiPickerViewController_delegate;
  if (MEMORY[0x1BCCEF478]((char *)self + OBJC_IVAR____TtC19HealthMedicationsUI27MedmojiPickerViewController_delegate, a2))
  {
    v5 = *((_QWORD *)v4 + 1);
    ObjectType = swift_getObjectType();
    v7 = *(void (**)(uint64_t, uint64_t))(v5 + 16);
    v8 = a3;
    v9 = self;
    v7(ObjectType, v5);
    swift_unknownObjectRelease();
  }
  else
  {
    v10 = a3;
    v11 = self;
  }
  -[MedmojiPickerViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0);

}

- (void)doneButtonTappped:(id)a3
{
  id v4;
  _TtC19HealthMedicationsUI27MedmojiPickerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1BC22A974();

}

- (void)shapeButtonTappped:(id)a3
{
  id v4;
  _TtC19HealthMedicationsUI27MedmojiPickerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1BC229404();

}

- (void)colorButtonTappped:(id)a3
{
  id v4;
  _TtC19HealthMedicationsUI27MedmojiPickerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1BC229420();

}

- (_TtC19HealthMedicationsUI27MedmojiPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC19HealthMedicationsUI27MedmojiPickerViewController *result;

  v4 = a4;
  result = (_TtC19HealthMedicationsUI27MedmojiPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI27MedmojiPickerViewController____lazy_storage___medicationView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI27MedmojiPickerViewController_shapeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI27MedmojiPickerViewController_colorButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI27MedmojiPickerViewController____lazy_storage___medmojiCategorySelectionView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI27MedmojiPickerViewController____lazy_storage___shapeSelectionViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI27MedmojiPickerViewController____lazy_storage___colorSelectionViewController));
  sub_1BC0F0430((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI27MedmojiPickerViewController_delegate);
  swift_bridgeObjectRelease();
  sub_1BC0F2444((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI27MedmojiPickerViewController_config, (unint64_t *)&qword_1EDA0ECC0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2C950]);
}

@end
