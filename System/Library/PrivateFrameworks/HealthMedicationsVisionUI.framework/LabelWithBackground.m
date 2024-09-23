@implementation LabelWithBackground

- (_TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD219LabelWithBackground)initWithFrame:(CGRect)a3
{
  return (_TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD219LabelWithBackground *)sub_21C2A582C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD219LabelWithBackground)initWithCoder:(id)a3
{
  id v4;
  _TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD219LabelWithBackground *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD219LabelWithBackground_xInset) = (Class)0x4028000000000000;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD219LabelWithBackground_yInset) = (Class)0x4000000000000000;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD219LabelWithBackground____lazy_storage___blurView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD219LabelWithBackground____lazy_storage___label) = 0;
  v4 = a3;

  result = (_TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD219LabelWithBackground *)sub_21C2C26C0();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  id v2;
  id v3;
  id v4;
  objc_super v5;
  CGRect v6;
  CGRect v7;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for LabelWithBackground();
  v2 = v5.receiver;
  -[LabelWithBackground layoutSubviews](&v5, sel_layoutSubviews);
  v3 = sub_21C2A5640();
  objc_msgSend(v2, sel_bounds, v5.receiver, v5.super_class);
  objc_msgSend(v3, sel_setFrame_);

  v4 = sub_21C2A56EC();
  objc_msgSend(v2, sel_bounds);
  v7 = CGRectInset(v6, 12.0, 2.0);
  objc_msgSend(v4, sel_setFrame_, v7.origin.x, v7.origin.y, v7.size.width, v7.size.height);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD219LabelWithBackground *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_21C2A56EC();
  objc_msgSend(v6, sel_sizeThatFits_, width, height);
  v8 = v7;
  v10 = v9;

  v11 = v8 + 24.0;
  v12 = v10 + 4.0;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD219LabelWithBackground____lazy_storage___blurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD219LabelWithBackground____lazy_storage___label));
}

@end
