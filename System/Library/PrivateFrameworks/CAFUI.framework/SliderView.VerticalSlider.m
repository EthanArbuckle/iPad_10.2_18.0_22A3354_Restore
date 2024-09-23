@implementation SliderView.VerticalSlider

- (_TtCV5CAFUI10SliderView14VerticalSlider)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtCV5CAFUI10SliderView14VerticalSlider *result;

  v5 = OBJC_IVAR____TtCV5CAFUI10SliderView14VerticalSlider_slider;
  v6 = objc_allocWithZone(MEMORY[0x24BEBD958]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtCV5CAFUI10SliderView14VerticalSlider *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtCV5CAFUI10SliderView14VerticalSlider)initWithFrame:(CGRect)a3
{
  return (_TtCV5CAFUI10SliderView14VerticalSlider *)SliderView.VerticalSlider.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  _TtCV5CAFUI10SliderView14VerticalSlider *v2;

  v2 = self;
  SliderView.VerticalSlider.layoutSubviews()();

}

- (CGSize)intrinsicContentSize
{
  void *v2;
  _TtCV5CAFUI10SliderView14VerticalSlider *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtCV5CAFUI10SliderView14VerticalSlider_slider);
  v3 = self;
  objc_msgSend(v2, sel_intrinsicContentSize);
  v5 = v4;
  objc_msgSend(v2, sel_intrinsicContentSize);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void).cxx_destruct
{

}

@end
