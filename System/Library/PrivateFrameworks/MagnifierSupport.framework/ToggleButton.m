@implementation ToggleButton

- (_TtC16MagnifierSupport12ToggleButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2273B71E0();
}

- (void)layoutSubviews
{
  _TtC16MagnifierSupport12ToggleButton *v2;

  v2 = self;
  sub_2273B52CC();

}

- (void)didTap:(id)a3
{
  sub_2273188BC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_OWORD *))sub_2273B5914);
}

- (void)labelTapped:(id)a3
{
  sub_2273188BC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_OWORD *))sub_2273B5B5C);
}

- (void)removeFromSuperview
{
  _TtC16MagnifierSupport12ToggleButton *v2;

  v2 = self;
  sub_2273B5C68();

}

- (_TtC16MagnifierSupport12ToggleButton)initWithFrame:(CGRect)a3
{
  _TtC16MagnifierSupport12ToggleButton *result;

  result = (_TtC16MagnifierSupport12ToggleButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport12ToggleButton____lazy_storage___label));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport12ToggleButton_clickInteraction));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport12ToggleButton____lazy_storage___internalButton));
  sub_22731A0F0((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport12ToggleButton_delegate);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (NSString)accessibilityLabel
{
  void *v2;

  sub_227415BCC();
  v2 = (void *)sub_22758E1B4();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (CGPoint)accessibilityActivationPoint
{
  _TtC16MagnifierSupport12ToggleButton *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  v2 = self;
  v3 = sub_2273B60A8();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.y = v7;
  result.x = v6;
  return result;
}

- (NSString)accessibilityValue
{
  _TtC16MagnifierSupport12ToggleButton *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_2273B61A4();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_22758E1B4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (NSString)largeContentTitle
{
  _TtC16MagnifierSupport12ToggleButton *v2;
  id v3;
  id v4;

  v2 = self;
  v3 = sub_2273B2A38();
  v4 = objc_msgSend(v3, sel_text);

  if (v4)
  {
    sub_22758E1E4();

    v4 = (id)sub_22758E1B4();
    swift_bridgeObjectRelease();
  }
  else
  {

  }
  return (NSString *)v4;
}

- (UIImage)largeContentImage
{
  id v2;

  sub_2274154A4();
  return (UIImage *)v2;
}

- (id)clickPresentationInteraction:(id)a3 presentationForPresentingViewController:(id)a4
{
  id v6;
  id v7;
  _TtC16MagnifierSupport12ToggleButton *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = (void *)sub_2273B7314(v6);

  return v9;
}

- (BOOL)clickPresentationInteractionShouldBegin:(id)a3
{
  id v4;
  _TtC16MagnifierSupport12ToggleButton *v5;
  char v6;

  v4 = a3;
  v5 = self;
  sub_2273B6590(v4);
  LOBYTE(self) = v6;

  return self & 1;
}

- (BOOL)clickPresentationInteractionShouldPresent:(id)a3
{
  id v4;
  _TtC16MagnifierSupport12ToggleButton *v5;
  char v6;

  v4 = a3;
  v5 = self;
  sub_2273B68A4(v4);
  LOBYTE(self) = v6;

  return self & 1;
}

- (void)clickPresentationInteractionEnded:(id)a3 wasCancelled:(BOOL)a4
{
  id v5;
  _TtC16MagnifierSupport12ToggleButton *v6;

  v5 = a3;
  v6 = self;
  sub_2273B756C();

}

- (id)clickPresentationInteraction:(id)a3 previewForHighlightingAtLocation:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  _TtC16MagnifierSupport12ToggleButton *v8;
  id v9;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = self;
  v9 = sub_2273B6BE8(v7, x, y);

  return v9;
}

@end
