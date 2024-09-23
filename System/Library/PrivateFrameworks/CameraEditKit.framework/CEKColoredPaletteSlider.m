@implementation CEKColoredPaletteSlider

- (NSArray)colors
{
  _QWORD *v2;
  void *v3;

  v2 = (Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___CEKColoredPaletteSlider_colors);
  swift_beginAccess();
  if (!*v2)
    return (NSArray *)0;
  sub_1B9867B70(0, &qword_1EF232410);
  swift_bridgeObjectRetain();
  v3 = (void *)sub_1B9872488();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)setColors:(id)a3
{
  uint64_t v3;
  uint64_t *v5;
  CEKColoredPaletteSlider *v6;

  v3 = (uint64_t)a3;
  if (a3)
  {
    sub_1B9867B70(0, &qword_1EF232410);
    v3 = sub_1B9872494();
  }
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___CEKColoredPaletteSlider_colors);
  swift_beginAccess();
  *v5 = v3;
  v6 = self;
  swift_bridgeObjectRelease();
  sub_1B9866B18();

}

- (CEKColoredPaletteSlider)initWithFrame:(CGRect)a3
{
  return (CEKColoredPaletteSlider *)sub_1B9866EAC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  CEKColoredPaletteSlider *v2;

  v2 = self;
  CEKColoredPaletteSlider.layoutSubviews()();

}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  CEKColoredPaletteSlider *v8;
  BOOL v9;
  CGPoint v11;
  CGRect v12;
  CGRect v13;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = self;
  -[CEKColoredPaletteSlider bounds](v8, sel_bounds);
  v13 = CGRectInset(v12, -10.0, -10.0);
  v11.x = x;
  v11.y = y;
  v9 = CGRectContainsPoint(v13, v11);

  return v9;
}

- (void)valueChanged:(id)a3
{
  -[CEKColoredPaletteSlider setNeedsLayout](self, sel_setNeedsLayout, a3);
}

- (CEKColoredPaletteSlider)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _sSo23CEKColoredPaletteSliderC13CameraEditKitE5coderABSgSo7NSCoderC_tcfc_0();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___CEKColoredPaletteSlider_backgroundLayer));

}

@end
