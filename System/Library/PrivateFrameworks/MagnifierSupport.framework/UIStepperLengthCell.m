@implementation UIStepperLengthCell

- (void)accessibilityIncrement
{
  void *v2;
  id v3;
  double v4;
  double v5;
  double v6;
  _TtC16MagnifierSupport19UIStepperLengthCell *v7;

  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC16MagnifierSupport19UIStepperLengthCell__distanceStepper);
  v7 = self;
  v3 = v2;
  objc_msgSend(v3, sel_stepValue);
  v5 = v4;
  objc_msgSend(v3, sel_value);
  objc_msgSend(v3, sel_setValue_, v5 + v6);

  sub_2274371DC();
}

- (void)accessibilityDecrement
{
  void *v2;
  id v3;
  double v4;
  double v5;
  double v6;
  _TtC16MagnifierSupport19UIStepperLengthCell *v7;

  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC16MagnifierSupport19UIStepperLengthCell__distanceStepper);
  v7 = self;
  v3 = v2;
  objc_msgSend(v3, sel_stepValue);
  v5 = v4;
  objc_msgSend(v3, sel_value);
  objc_msgSend(v3, sel_setValue_, v6 - v5);

  sub_2274371DC();
}

- (void)distanceStepperValueChanged:(id)a3
{
  id v4;
  _TtC16MagnifierSupport19UIStepperLengthCell *v5;

  v4 = a3;
  v5 = self;
  sub_227437924();

}

- (_TtC16MagnifierSupport19UIStepperLengthCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)sub_22758E1E4();
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC16MagnifierSupport19UIStepperLengthCell *)sub_227437498(a3, (uint64_t)a4, v6);
}

- (_TtC16MagnifierSupport19UIStepperLengthCell)initWithCoder:(id)a3
{
  return (_TtC16MagnifierSupport19UIStepperLengthCell *)sub_2274375F4(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport19UIStepperLengthCell__distanceStepper));
  sub_227437D1C((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport19UIStepperLengthCell__lengthMeasure);
  sub_2273382D0(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC16MagnifierSupport19UIStepperLengthCell__valueChangedHandler));
}

@end
