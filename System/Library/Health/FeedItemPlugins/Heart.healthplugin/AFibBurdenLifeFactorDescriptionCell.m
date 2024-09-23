@implementation AFibBurdenLifeFactorDescriptionCell

- (_TtC5Heart35AFibBurdenLifeFactorDescriptionCell)initWithFrame:(CGRect)a3
{
  return (_TtC5Heart35AFibBurdenLifeFactorDescriptionCell *)sub_23130DD7C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5Heart35AFibBurdenLifeFactorDescriptionCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC5Heart35AFibBurdenLifeFactorDescriptionCell *result;

  v4 = (char *)self + OBJC_IVAR____TtC5Heart35AFibBurdenLifeFactorDescriptionCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC5Heart35AFibBurdenLifeFactorDescriptionCell____lazy_storage___titleDetailOptionalButtonView) = 0;
  v5 = a3;

  result = (_TtC5Heart35AFibBurdenLifeFactorDescriptionCell *)sub_231414EE4();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2312D1D70((uint64_t)self + OBJC_IVAR____TtC5Heart35AFibBurdenLifeFactorDescriptionCell_item);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Heart35AFibBurdenLifeFactorDescriptionCell____lazy_storage___titleDetailOptionalButtonView));
}

@end
