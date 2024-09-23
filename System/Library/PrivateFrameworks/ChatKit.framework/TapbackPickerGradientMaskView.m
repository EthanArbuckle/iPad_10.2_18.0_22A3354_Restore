@implementation TapbackPickerGradientMaskView

- (_TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF329TapbackPickerGradientMaskView)initWithCoder:(id)a3
{
  _TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF329TapbackPickerGradientMaskView *result;

  result = (_TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF329TapbackPickerGradientMaskView *)sub_18E769320();
  __break(1u);
  return result;
}

- (_TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF329TapbackPickerGradientMaskView)initWithFrame:(CGRect)a3
{
  _TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF329TapbackPickerGradientMaskView *v3;
  void *v4;
  _TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF329TapbackPickerGradientMaskView *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TapbackPickerGradientMaskView();
  v3 = -[TapbackPickerCircleView initWithFrame:](&v8, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v4 = (void *)objc_opt_self();
  v5 = v3;
  v6 = objc_msgSend(v4, sel_whiteColor);
  -[TapbackPickerGradientMaskView setBackgroundColor:](v5, sel_setBackgroundColor_, v6);

  return v5;
}

@end
