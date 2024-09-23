@implementation CAFUINumericInputView

- (void)buttonTouchDownWithSender:(id)a3
{
  UIControl *v4;
  _TtC5CAFUI21CAFUINumericInputView *v5;

  v4 = (UIControl *)a3;
  v5 = self;
  CAFUINumericInputView.buttonTouchDown(sender:)(v4);

}

- (void)buttonTouchUpWithSender:(id)a3
{
  UIControl *v4;
  _TtC5CAFUI21CAFUINumericInputView *v5;

  v4 = (UIControl *)a3;
  v5 = self;
  -[UIControl sendActionsForControlEvents:](v4, sel_sendActionsForControlEvents_, 4096);
  CAFUINumericInputView.buttonTouchCancel(sender:)(v4);

}

- (void)buttonTouchCancelWithSender:(id)a3
{
  UIControl *v4;
  _TtC5CAFUI21CAFUINumericInputView *v5;

  v4 = (UIControl *)a3;
  v5 = self;
  CAFUINumericInputView.buttonTouchCancel(sender:)(v4);

}

- (void)buttonValueChangedWithSender:(id)a3
{
  id v4;
  _TtC5CAFUI21CAFUINumericInputView *v5;

  v4 = a3;
  v5 = self;
  CAFUINumericInputView.buttonValueChanged(sender:)();

}

- (void)sliderChangedWithSender:(id)a3
{
  UISlider *v4;
  _TtC5CAFUI21CAFUINumericInputView *v5;

  v4 = (UISlider *)a3;
  v5 = self;
  CAFUINumericInputView.sliderChanged(sender:)(v4);

}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI21CAFUINumericInputView_decrementButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI21CAFUINumericInputView_incrementButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI21CAFUINumericInputView_touchTimer));

}

@end
