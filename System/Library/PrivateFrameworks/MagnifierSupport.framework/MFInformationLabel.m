@implementation MFInformationLabel

- (_TtC16MagnifierSupport18MFInformationLabel)init
{
  return (_TtC16MagnifierSupport18MFInformationLabel *)sub_2273FC5FC();
}

- (void)setNeedsLayout
{
  _TtC16MagnifierSupport18MFInformationLabel *v2;

  v2 = self;
  sub_2273FC818();

}

- (_TtC16MagnifierSupport18MFInformationLabel)initWithCoder:(id)a3
{
  id v4;
  _TtC16MagnifierSupport18MFInformationLabel *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC16MagnifierSupport18MFInformationLabel_constraintAboveCard) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC16MagnifierSupport18MFInformationLabel_constraintBelowCard) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC16MagnifierSupport18MFInformationLabel_centerConstraintX) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC16MagnifierSupport18MFInformationLabel_centerConstraintY) = 0;
  v4 = a3;

  result = (_TtC16MagnifierSupport18MFInformationLabel *)sub_22758ECC4();
  __break(1u);
  return result;
}

- (_TtC16MagnifierSupport18MFInformationLabel)initWithFrame:(CGRect)a3
{
  _TtC16MagnifierSupport18MFInformationLabel *result;

  result = (_TtC16MagnifierSupport18MFInformationLabel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport18MFInformationLabel_constraintAboveCard));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport18MFInformationLabel_constraintBelowCard));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport18MFInformationLabel_centerConstraintX));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport18MFInformationLabel_centerConstraintY));
}

@end
