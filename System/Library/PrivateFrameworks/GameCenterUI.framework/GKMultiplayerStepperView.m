@implementation GKMultiplayerStepperView

- (_TtC12GameCenterUI24GKMultiplayerStepperView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB4CE780();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  _TtC12GameCenterUI24GKMultiplayerStepperView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  JUMeasurements result;

  swift_unknownObjectRetain();
  v5 = self;
  v6 = sub_1AB4CE800();
  v8 = v7;
  v10 = v9;
  swift_unknownObjectRelease();

  v11 = 0.0;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.var3 = v11;
  result.var2 = v14;
  result.var1 = v13;
  result.var0 = v12;
  return result;
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI24GKMultiplayerStepperView *v2;

  v2 = self;
  sub_1AB4CEAB4();

}

- (void)didTapDown:(id)a3
{
  sub_1AB4CED58(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(void))sub_1AB4F12D4, (void (*)(void))sub_1AB4F131C);
}

- (void)didTapUp:(id)a3
{
  sub_1AB4CED58(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(void))sub_1AB4F12F8, (void (*)(void))sub_1AB4F1338);
}

- (UIButton)accessibilityDownButton
{
  return (UIButton *)sub_1AB4CEDFC();
}

- (UIButton)accessibilityUpButton
{
  return (UIButton *)sub_1AB4CEE28();
}

- (_TtC12GameCenterUI24GKMultiplayerStepperView)initWithFrame:(CGRect)a3
{
  sub_1AB4CEE38();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI24GKMultiplayerStepperView_downButton));
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI24GKMultiplayerStepperView_upButton);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI24GKMultiplayerStepperView_label);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI24GKMultiplayerStepperView_backgroundView);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI24GKMultiplayerStepperView_model));
}

@end
