@implementation TapbackPickerGradientView

- (_TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF325TapbackPickerGradientView)initWithCoder:(id)a3
{
  id v4;
  _TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF325TapbackPickerGradientView *result;

  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF325TapbackPickerGradientView_selectionColor) = 1;
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF325TapbackPickerGradientView_isSelected) = 0;
  v4 = a3;

  result = (_TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF325TapbackPickerGradientView *)sub_18E769320();
  __break(1u);
  return result;
}

- (_TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF325TapbackPickerGradientView)initWithFrame:(CGRect)a3
{
  return (_TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF325TapbackPickerGradientView *)sub_18E6A8E20();
}

- (void)layoutSubviews
{
  id v2;
  id v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TapbackPickerGradientView();
  v2 = v5.receiver;
  -[CKGradientView layoutSubviews](&v5, sel_layoutSubviews);
  v3 = objc_msgSend(v2, sel_maskView, v5.receiver, v5.super_class);
  objc_msgSend(v3, sel_setNeedsLayout);

  v4 = objc_msgSend(v2, sel_maskView);
  objc_msgSend(v4, sel_layoutIfNeeded);

}

@end
