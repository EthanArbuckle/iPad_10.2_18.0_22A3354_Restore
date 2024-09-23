@implementation InteractionResultDetailEducationCell

- (_TtC19HealthMedicationsUI36InteractionResultDetailEducationCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI36InteractionResultDetailEducationCell *)sub_1BC285FDC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI36InteractionResultDetailEducationCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC19HealthMedicationsUI36InteractionResultDetailEducationCell *result;

  v4 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI36InteractionResultDetailEducationCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI36InteractionResultDetailEducationCell____lazy_storage___stackView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI36InteractionResultDetailEducationCell____lazy_storage___attributionLabel) = 0;
  v5 = a3;

  result = (_TtC19HealthMedicationsUI36InteractionResultDetailEducationCell *)sub_1BC2B52B8();
  __break(1u);
  return result;
}

- (void)awakeFromNib
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for InteractionResultDetailEducationCell();
  -[InteractionResultDetailEducationCell awakeFromNib](&v2, sel_awakeFromNib);
}

- (void).cxx_destruct
{
  sub_1BC0F7954((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI36InteractionResultDetailEducationCell_item);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI36InteractionResultDetailEducationCell____lazy_storage___stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI36InteractionResultDetailEducationCell____lazy_storage___attributionLabel));
}

@end
