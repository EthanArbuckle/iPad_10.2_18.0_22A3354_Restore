@implementation InteractionsOnboardingEducationCell

- (_TtC19HealthMedicationsUI35InteractionsOnboardingEducationCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  char *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI35InteractionsOnboardingEducationCell_item;
  *(_OWORD *)v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  *((_QWORD *)v9 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI35InteractionsOnboardingEducationCell____lazy_storage___labelView) = 0;
  v11.receiver = self;
  v11.super_class = ObjectType;
  return -[InteractionsOnboardingEducationCell initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC19HealthMedicationsUI35InteractionsOnboardingEducationCell)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  char *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI35InteractionsOnboardingEducationCell_item;
  *(_OWORD *)v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((_QWORD *)v6 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI35InteractionsOnboardingEducationCell____lazy_storage___labelView) = 0;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return -[InteractionsOnboardingEducationCell initWithCoder:](&v8, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  sub_1BC0F7954((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI35InteractionsOnboardingEducationCell_item);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI35InteractionsOnboardingEducationCell____lazy_storage___labelView));
}

@end
