@implementation WidgetNamedImageView

- (_TtC19ComplicationDisplay20WidgetNamedImageView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_213066D80();
}

- (void)layoutSubviews
{
  _TtC19ComplicationDisplay20WidgetNamedImageView *v2;

  v2 = self;
  sub_2130657E0();

}

- (CLKImageProvider)imageProvider
{
  return (CLKImageProvider *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                     + OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_imageProvider));
}

- (void)setImageProvider:(id)a3
{
  void *v4;
  _TtC19ComplicationDisplay20WidgetNamedImageView *v5;
  id v6;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_imageProvider);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_imageProvider) = (Class)a3;
  v6 = a3;
  v5 = self;
  sub_213065924(v4);

}

- (UIColor)color
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_color));
}

- (void)setColor:(id)a3
{
  _TtC19ComplicationDisplay20WidgetNamedImageView *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_213066E24(a3);

}

- (BOOL)usesLegibility
{
  return *((_BYTE *)&self->super.super.super.isa
         + OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_usesLegibility);
}

- (void)setUsesLegibility:(BOOL)a3
{
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_usesLegibility) = a3;
}

- (UIColor)overrideColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_overrideColor));
}

- (void)setOverrideColor:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_overrideColor);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_overrideColor) = (Class)a3;
  v3 = a3;

}

- (_TtC19ComplicationDisplay20WidgetNamedImageView)initWithFrame:(CGRect)a3
{
  _TtC19ComplicationDisplay20WidgetNamedImageView *result;

  result = (_TtC19ComplicationDisplay20WidgetNamedImageView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_hostingViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_imageProvider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_color));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_overrideColor));
}

@end
