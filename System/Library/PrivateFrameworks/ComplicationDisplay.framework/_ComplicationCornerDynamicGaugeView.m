@implementation _ComplicationCornerDynamicGaugeView

- (void)handleGaugeProvider:(id)a3 leftLabelProvider:(id)a4 rightLabelProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  _TtC19ComplicationDisplay35_ComplicationCornerDynamicGaugeView *v12;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = self;
  sub_21304AE08(a3, (uint64_t)a4, (uint64_t)a5);

}

- (_TtC19ComplicationDisplay35_ComplicationCornerDynamicGaugeView)initWithFontFallback:(int64_t)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19ComplicationDisplay35_ComplicationCornerDynamicGaugeView_fillStyle) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for _ComplicationCornerDynamicGaugeView();
  return -[CDRichComplicationCornerBaseGaugeView initWithFontFallback:](&v5, sel_initWithFontFallback_, a3);
}

@end
