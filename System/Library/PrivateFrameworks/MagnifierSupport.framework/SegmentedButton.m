@implementation SegmentedButton

- (_TtC16MagnifierSupport15SegmentedButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2274AE6F4();
}

- (void)layoutSubviews
{
  _TtC16MagnifierSupport15SegmentedButton *v2;

  v2 = self;
  sub_2274AD4A0();

}

- (void)didTap:(id)a3
{
  char *v5;
  uint64_t v6;
  void (*v7)(void);
  id v8;
  _TtC16MagnifierSupport15SegmentedButton *v9;

  v5 = (char *)self + OBJC_IVAR____TtC16MagnifierSupport15SegmentedButton_delegate;
  if (MEMORY[0x2276B3E34]((char *)self + OBJC_IVAR____TtC16MagnifierSupport15SegmentedButton_delegate, a2))
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

- (void)didSelectSegment:(id)a3
{
  id v4;
  _TtC16MagnifierSupport15SegmentedButton *v5;

  v4 = a3;
  v5 = self;
  sub_2274AD73C();

}

- (void)removeFromSuperview
{
  _TtC16MagnifierSupport15SegmentedButton *v2;

  v2 = self;
  sub_2274ADA1C();

}

- (_TtC16MagnifierSupport15SegmentedButton)initWithFrame:(CGRect)a3
{
  _TtC16MagnifierSupport15SegmentedButton *result;

  result = (_TtC16MagnifierSupport15SegmentedButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport15SegmentedButton_clickInteraction));
  sub_22731A0F0((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport15SegmentedButton_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport15SegmentedButton____lazy_storage___segmentedControl));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport15SegmentedButton____lazy_storage___internalButton));
}

- (id)clickPresentationInteraction:(id)a3 presentationForPresentingViewController:(id)a4
{
  id v6;
  id v7;
  _TtC16MagnifierSupport15SegmentedButton *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = (void *)sub_2274AE7C8(v6);

  return v9;
}

- (BOOL)clickPresentationInteractionShouldBegin:(id)a3
{
  id v4;
  _TtC16MagnifierSupport15SegmentedButton *v5;
  char v6;

  v4 = a3;
  v5 = self;
  sub_2274ADE38(v4);
  LOBYTE(self) = v6;

  return self & 1;
}

- (BOOL)clickPresentationInteractionShouldPresent:(id)a3
{
  id v4;
  _TtC16MagnifierSupport15SegmentedButton *v5;
  char v6;

  v4 = a3;
  v5 = self;
  sub_2274AE0F0(v4);
  LOBYTE(self) = v6;

  return self & 1;
}

- (void)clickPresentationInteractionEnded:(id)a3 wasCancelled:(BOOL)a4
{
  id v5;
  _TtC16MagnifierSupport15SegmentedButton *v6;

  v5 = a3;
  v6 = self;
  sub_2274AEA20();

}

- (id)clickPresentationInteraction:(id)a3 previewForHighlightingAtLocation:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  _TtC16MagnifierSupport15SegmentedButton *v8;
  id v9;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = self;
  v9 = sub_2274AE3D8(v7, x, y);

  return v9;
}

@end
