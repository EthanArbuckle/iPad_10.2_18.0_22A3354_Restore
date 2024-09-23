@implementation DetailView

- (_TtC12GameCenterUI10DetailView)initWithFrame:(CGRect)a3
{
  _TtC12GameCenterUI10DetailView *result;

  sub_1AB5D6D08();
  return result;
}

- (_TtC12GameCenterUI10DetailView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB5D720C();
}

- (void)wasTapped
{
  _TtC12GameCenterUI10DetailView *v2;

  v2 = self;
  sub_1AB5D7BC4();

}

- (void)layoutSubviews
{
  _TtC12GameCenterUI10DetailView *v2;

  v2 = self;
  sub_1AB5D7C48();

}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double width;
  _TtC12GameCenterUI10DetailView *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  JUMeasurements result;

  width = a3.width;
  swift_unknownObjectRetain();
  v7 = self;
  v8 = sub_1AB5D7F40(a4, width);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  swift_unknownObjectRelease();

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.var3 = v18;
  result.var2 = v17;
  result.var1 = v16;
  result.var0 = v15;
  return result;
}

- (void)didTapWithAccessoryView:(id)a3
{
  id v4;
  _TtC12GameCenterUI10DetailView *v5;

  v4 = a3;
  v5 = self;
  sub_1AB5D8288(v4);

}

- (void).cxx_destruct
{

  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI10DetailView_subtitleLabel);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI10DetailView_imageView);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI10DetailView_separator);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI10DetailView_chevronView);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI10DetailView_accessoryView);
  sub_1AB47A074((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI10DetailView_accessory, &qword_1EEBFFAD0);
  OUTLINED_FUNCTION_69_1(OBJC_IVAR____TtC12GameCenterUI10DetailView_accessoryAction);
  OUTLINED_FUNCTION_69_1(OBJC_IVAR____TtC12GameCenterUI10DetailView_selectionHandler);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI10DetailView_tapGestureRecognizer);
  OUTLINED_FUNCTION_0_62(*(uint64_t *)((char *)&self->super.super.super.isa
                                    + OBJC_IVAR____TtC12GameCenterUI10DetailView_gameControllerSelectHandler));
}

@end
