@implementation FocusReticleImage

- (_TtC16MagnifierSupport17FocusReticleImage)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC16MagnifierSupport17FocusReticleImage *v7;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for FocusReticleImage();
  v7 = -[FocusReticleImage initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
  sub_22750A5E0();
  -[FocusReticleImage setContentMode:](v7, sel_setContentMode_, 0);

  return v7;
}

- (_TtC16MagnifierSupport17FocusReticleImage)initWithCoder:(id)a3
{
  _TtC16MagnifierSupport17FocusReticleImage *result;

  result = (_TtC16MagnifierSupport17FocusReticleImage *)sub_22758ECC4();
  __break(1u);
  return result;
}

- (void)tintColorDidChange
{
  _TtC16MagnifierSupport17FocusReticleImage *v2;

  v2 = self;
  sub_22750A5E0();

}

- (_TtC16MagnifierSupport17FocusReticleImage)initWithImage:(id)a3
{
  id v3;
  _TtC16MagnifierSupport17FocusReticleImage *result;

  v3 = a3;
  result = (_TtC16MagnifierSupport17FocusReticleImage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC16MagnifierSupport17FocusReticleImage)initWithImage:(id)a3 highlightedImage:(id)a4
{
  id v5;
  id v6;
  _TtC16MagnifierSupport17FocusReticleImage *result;

  v5 = a3;
  v6 = a4;
  result = (_TtC16MagnifierSupport17FocusReticleImage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
