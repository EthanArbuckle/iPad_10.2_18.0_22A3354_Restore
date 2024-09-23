@implementation CCUIPowerButtonGlyphView

- (CCUIPowerButtonGlyphView)initWithSymbolConfiguration:(id)a3
{
  id v4;
  CCUIPowerButtonGlyphView *v5;

  v4 = objc_allocWithZone((Class)type metadata accessor for PowerButtonGlyphView());
  v5 = (CCUIPowerButtonGlyphView *)sub_1CFBEF47C(a3, 0.0, 0.0, 0.0, 0.0);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v5;
}

- (CCUIPowerButtonGlyphView)initWithCoder:(id)a3
{
  CCUIPowerButtonGlyphView *result;

  result = (CCUIPowerButtonGlyphView *)sub_1CFBFAD14();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  CCUIPowerButtonGlyphView *v2;

  v2 = self;
  sub_1CFBEF600();

}

- (UIImageView)imageView
{
  return (UIImageView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                + OBJC_IVAR___CCUIPowerButtonGlyphView_imageView));
}

- (CCUIPowerButtonGlyphView)initWithFrame:(CGRect)a3
{
  CCUIPowerButtonGlyphView *result;

  result = (CCUIPowerButtonGlyphView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
