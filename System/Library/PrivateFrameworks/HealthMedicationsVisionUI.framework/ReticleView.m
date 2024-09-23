@implementation ReticleView

- (_TtC25HealthMedicationsVisionUI11ReticleView)initWithFrame:(CGRect)a3
{
  return (_TtC25HealthMedicationsVisionUI11ReticleView *)sub_21C2A79B8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC25HealthMedicationsVisionUI11ReticleView)initWithCoder:(id)a3
{
  id v4;
  _TtC25HealthMedicationsVisionUI11ReticleView *result;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC25HealthMedicationsVisionUI11ReticleView_hasSetReticleRect) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC25HealthMedicationsVisionUI11ReticleView____lazy_storage___reticleView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC25HealthMedicationsVisionUI11ReticleView____lazy_storage___spotlightView) = 0;
  v4 = a3;

  result = (_TtC25HealthMedicationsVisionUI11ReticleView *)sub_21C2C26C0();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC25HealthMedicationsVisionUI11ReticleView *v2;

  v2 = self;
  sub_21C2A7B58();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC25HealthMedicationsVisionUI11ReticleView____lazy_storage___reticleView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC25HealthMedicationsVisionUI11ReticleView____lazy_storage___spotlightView));
}

@end
