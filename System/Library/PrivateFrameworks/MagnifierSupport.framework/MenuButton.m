@implementation MenuButton

- (_TtC16MagnifierSupport10MenuButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_227402D38();
}

- (void)layoutSubviews
{
  _TtC16MagnifierSupport10MenuButton *v2;

  v2 = self;
  sub_227400FE4();

}

- (void)didTap:(id)a3
{
  _TtC16MagnifierSupport10MenuButton *v4;
  _TtC16MagnifierSupport10MenuButton *v5;
  _OWORD v6[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_22758EAB4();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_227401C54();

  sub_22731A1A4((uint64_t)v6, &qword_2540BA340);
}

- (void)removeFromSuperview
{
  _TtC16MagnifierSupport10MenuButton *v2;

  v2 = self;
  sub_227401ED4();

}

- (_TtC16MagnifierSupport10MenuButton)initWithFrame:(CGRect)a3
{
  _TtC16MagnifierSupport10MenuButton *result;

  result = (_TtC16MagnifierSupport10MenuButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport10MenuButton____lazy_storage___label));
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport10MenuButton_clickInteraction));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport10MenuButton____lazy_storage___internalButton));
  sub_22731A0F0((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport10MenuButton_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport10MenuButton_cameraMenu));
  swift_bridgeObjectRelease();
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
  _TtC16MagnifierSupport10MenuButton *v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  v2 = self;
  v3 = sub_2273FF348();
  objc_msgSend(v3, sel_accessibilityActivationPoint);
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (id)clickPresentationInteraction:(id)a3 presentationForPresentingViewController:(id)a4
{
  id v6;
  id v7;
  _TtC16MagnifierSupport10MenuButton *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = (void *)sub_227402E4C(v6);

  return v9;
}

- (BOOL)clickPresentationInteractionShouldBegin:(id)a3
{
  id v4;
  _TtC16MagnifierSupport10MenuButton *v5;
  char v6;

  v4 = a3;
  v5 = self;
  sub_227402348(v4);
  LOBYTE(self) = v6;

  return self & 1;
}

- (BOOL)clickPresentationInteractionShouldPresent:(id)a3
{
  id v4;
  _TtC16MagnifierSupport10MenuButton *v5;
  char v6;

  v4 = a3;
  v5 = self;
  sub_227402658(v4);
  LOBYTE(self) = v6;

  return self & 1;
}

- (void)clickPresentationInteractionEnded:(id)a3 wasCancelled:(BOOL)a4
{
  id v5;
  _TtC16MagnifierSupport10MenuButton *v6;

  v5 = a3;
  v6 = self;
  sub_22740301C();

}

- (id)clickPresentationInteraction:(id)a3 previewForHighlightingAtLocation:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  _TtC16MagnifierSupport10MenuButton *v8;
  id v9;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = self;
  v9 = sub_227402998(v7, x, y);

  return v9;
}

@end
