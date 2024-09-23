@implementation SliderButton

- (id)clickPresentationInteraction:(id)a3 presentationForPresentingViewController:(id)a4
{
  id v6;
  id v7;
  _TtC16MagnifierSupport12SliderButton *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = (void *)sub_2273665D0(v6);

  return v9;
}

- (BOOL)clickPresentationInteractionShouldBegin:(id)a3
{
  id v4;
  _TtC16MagnifierSupport12SliderButton *v5;
  char v6;

  v4 = a3;
  v5 = self;
  sub_227365C38(v4);
  LOBYTE(self) = v6;

  return self & 1;
}

- (BOOL)clickPresentationInteractionShouldPresent:(id)a3
{
  id v4;
  _TtC16MagnifierSupport12SliderButton *v5;
  char v6;

  v4 = a3;
  v5 = self;
  sub_227365F48(v4);
  LOBYTE(self) = v6;

  return self & 1;
}

- (void)clickPresentationInteractionEnded:(id)a3 wasCancelled:(BOOL)a4
{
  id v5;
  _TtC16MagnifierSupport12SliderButton *v6;

  v5 = a3;
  v6 = self;
  sub_227366828();

}

- (id)clickPresentationInteraction:(id)a3 previewForHighlightingAtLocation:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  _TtC16MagnifierSupport12SliderButton *v8;
  id v9;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = self;
  v9 = sub_227366284(v7, x, y);

  return v9;
}

- (_TtC16MagnifierSupport12SliderButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_227441814();
}

- (void)layoutSubviews
{
  _TtC16MagnifierSupport12SliderButton *v2;

  v2 = self;
  sub_227440E54();

}

- (void)didTap:(id)a3
{
  _TtC16MagnifierSupport12SliderButton *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_2274418F4();

}

- (void)removeFromSuperview
{
  _TtC16MagnifierSupport12SliderButton *v2;

  v2 = self;
  sub_227441090();

}

- (_TtC16MagnifierSupport12SliderButton)initWithFrame:(CGRect)a3
{
  sub_2274411A8();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport12SliderButton_clickInteraction));
  sub_22731A0F0((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport12SliderButton_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport12SliderButton____lazy_storage___internalButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport12SliderButton____lazy_storage___slider));
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (NSString)largeContentTitle
{
  return (NSString *)sub_2274414EC((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_227415BCC);
}

- (UIImage)largeContentImage
{
  id v2;

  sub_2274154A4();
  return (UIImage *)v2;
}

- (NSString)accessibilityIdentifier
{
  return (NSString *)sub_2274414EC((uint64_t)self, (uint64_t)a2, (void (*)(void))Control.rawValue.getter);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  _TtC16MagnifierSupport12SliderButton *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_227441540(v4);

  return self & 1;
}

@end
