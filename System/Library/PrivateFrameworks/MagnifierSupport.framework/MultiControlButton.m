@implementation MultiControlButton

- (_TtC16MagnifierSupport18MultiControlButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_227365658();
}

- (void)addTarget:(id)a3 action:(SEL)a4 forControlEvents:(unint64_t)a5
{
  _TtC16MagnifierSupport18MultiControlButton *v8;
  _TtC16MagnifierSupport18MultiControlButton *v9;
  _OWORD v10[2];

  if (a3)
  {
    v8 = self;
    swift_unknownObjectRetain();
    sub_22758EAB4();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v9 = self;
  }
  sub_2273640B0((uint64_t)v10, (uint64_t)a4, a5);

  sub_227365B54((uint64_t)v10);
}

- (void)layoutSubviews
{
  _TtC16MagnifierSupport18MultiControlButton *v2;

  v2 = self;
  sub_22736445C();

}

- (void)didTap:(id)a3
{
  char *v5;
  uint64_t v6;
  void (*v7)(void);
  id v8;
  _TtC16MagnifierSupport18MultiControlButton *v9;

  v5 = (char *)self + OBJC_IVAR____TtC16MagnifierSupport18MultiControlButton_delegate;
  if (MEMORY[0x2276B3E34]((char *)self + OBJC_IVAR____TtC16MagnifierSupport18MultiControlButton_delegate, a2))
  {
    v6 = *((_QWORD *)v5 + 1);
    swift_getObjectType();
    v7 = *(void (**)(void))(v6 + 8);
    v8 = a3;
    v9 = self;
    v7();

    swift_unknownObjectRelease();
  }
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (_TtC16MagnifierSupport18MultiControlButton)initWithFrame:(CGRect)a3
{
  _TtC16MagnifierSupport18MultiControlButton *result;

  result = (_TtC16MagnifierSupport18MultiControlButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport18MultiControlButton_clickInteraction));
  sub_22731A0F0((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport18MultiControlButton_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport18MultiControlButton____lazy_storage___keyboardButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport18MultiControlButton____lazy_storage___label));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport18MultiControlButton____lazy_storage___internalButton));
}

- (id)clickPresentationInteraction:(id)a3 presentationForPresentingViewController:(id)a4
{
  id v6;
  id v7;
  _TtC16MagnifierSupport18MultiControlButton *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = (void *)sub_227365744(v6);

  return v9;
}

- (BOOL)clickPresentationInteractionShouldBegin:(id)a3
{
  id v4;
  _TtC16MagnifierSupport18MultiControlButton *v5;
  char v6;

  v4 = a3;
  v5 = self;
  sub_227364C68(v4);
  LOBYTE(self) = v6;

  return self & 1;
}

- (BOOL)clickPresentationInteractionShouldPresent:(id)a3
{
  id v4;
  _TtC16MagnifierSupport18MultiControlButton *v5;
  char v6;

  v4 = a3;
  v5 = self;
  sub_227364F20(v4);
  LOBYTE(self) = v6;

  return self & 1;
}

- (void)clickPresentationInteractionEnded:(id)a3 wasCancelled:(BOOL)a4
{
  id v5;
  _TtC16MagnifierSupport18MultiControlButton *v6;

  v5 = a3;
  v6 = self;
  sub_22736599C();

}

- (id)clickPresentationInteraction:(id)a3 previewForHighlightingAtLocation:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  _TtC16MagnifierSupport18MultiControlButton *v8;
  id v9;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = self;
  v9 = sub_227365208(v7, x, y);

  return v9;
}

@end
