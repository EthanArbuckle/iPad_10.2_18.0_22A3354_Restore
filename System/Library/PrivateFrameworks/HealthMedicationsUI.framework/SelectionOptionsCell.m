@implementation SelectionOptionsCell

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC19HealthMedicationsUI20SelectionOptionsCell *v8;
  uint64_t v9;

  v4 = sub_1BC2B3B00();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC2B3AF4();
  v8 = self;
  sub_1BC22BC38();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)switchValueChanged:(id)a3
{
  id v4;
  _TtC19HealthMedicationsUI20SelectionOptionsCell *v5;

  v4 = a3;
  v5 = self;
  sub_1BC22C264();

}

- (_TtC19HealthMedicationsUI20SelectionOptionsCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI20SelectionOptionsCell *)SelectionOptionsCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI20SelectionOptionsCell)initWithCoder:(id)a3
{
  return (_TtC19HealthMedicationsUI20SelectionOptionsCell *)SelectionOptionsCell.init(coder:)(a3);
}

- (void).cxx_destruct
{
  sub_1BC0F2444((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI20SelectionOptionsCell_item, (unint64_t *)&qword_1EDA0F7D0, (uint64_t (*)(uint64_t))sub_1BC0E1B94);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI20SelectionOptionsCell____lazy_storage___cellSwitch));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI20SelectionOptionsCell____lazy_storage___selectedImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI20SelectionOptionsCell____lazy_storage___notSelectedImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI20SelectionOptionsCell____lazy_storage___accessoryImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI20SelectionOptionsCell_defaultBackgroundColor));
}

@end
