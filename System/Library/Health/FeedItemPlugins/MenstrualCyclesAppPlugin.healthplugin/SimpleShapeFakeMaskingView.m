@implementation SimpleShapeFakeMaskingView

- (CALayer)croppingLayer
{
  return (CALayer *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC24MenstrualCyclesAppPluginP33_03708B5B1D68BF6913B83A4BE663025926SimpleShapeFakeMaskingView_croppingLayer));
}

- (void)setCroppingLayer:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPluginP33_03708B5B1D68BF6913B83A4BE663025926SimpleShapeFakeMaskingView_croppingLayer);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPluginP33_03708B5B1D68BF6913B83A4BE663025926SimpleShapeFakeMaskingView_croppingLayer) = (Class)a3;
  v3 = a3;

}

- (_TtC24MenstrualCyclesAppPluginP33_03708B5B1D68BF6913B83A4BE663025926SimpleShapeFakeMaskingView)initWithFrame:(CGRect)a3
{
  return (_TtC24MenstrualCyclesAppPluginP33_03708B5B1D68BF6913B83A4BE663025926SimpleShapeFakeMaskingView *)sub_231A70E08(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC24MenstrualCyclesAppPluginP33_03708B5B1D68BF6913B83A4BE663025926SimpleShapeFakeMaskingView)initWithCoder:(id)a3
{
  id v4;
  _TtC24MenstrualCyclesAppPluginP33_03708B5B1D68BF6913B83A4BE663025926SimpleShapeFakeMaskingView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPluginP33_03708B5B1D68BF6913B83A4BE663025926SimpleShapeFakeMaskingView_backgroundLayerColor) = 0;
  v4 = a3;

  result = (_TtC24MenstrualCyclesAppPluginP33_03708B5B1D68BF6913B83A4BE663025926SimpleShapeFakeMaskingView *)sub_231CA2A48();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC24MenstrualCyclesAppPluginP33_03708B5B1D68BF6913B83A4BE663025926SimpleShapeFakeMaskingView *v2;

  v2 = self;
  sub_231A710B4();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPluginP33_03708B5B1D68BF6913B83A4BE663025926SimpleShapeFakeMaskingView_backgroundLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPluginP33_03708B5B1D68BF6913B83A4BE663025926SimpleShapeFakeMaskingView_croppingLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPluginP33_03708B5B1D68BF6913B83A4BE663025926SimpleShapeFakeMaskingView_backgroundLayerColor));
}

@end
