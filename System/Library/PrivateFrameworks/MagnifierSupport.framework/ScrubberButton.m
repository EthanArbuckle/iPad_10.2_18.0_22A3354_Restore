@implementation ScrubberButton

- (_TtC16MagnifierSupport14ScrubberButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22742D418();
}

- (void)layoutSubviews
{
  _TtC16MagnifierSupport14ScrubberButton *v2;

  v2 = self;
  sub_22742C9A4();

}

- (void)didTap:(id)a3
{
  char *v5;
  uint64_t v6;
  void (*v7)(void);
  id v8;
  _TtC16MagnifierSupport14ScrubberButton *v9;

  v5 = (char *)self + OBJC_IVAR____TtC16MagnifierSupport14ScrubberButton_delegate;
  if (MEMORY[0x2276B3E34]((char *)self + OBJC_IVAR____TtC16MagnifierSupport14ScrubberButton_delegate, a2))
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

- (void)removeFromSuperview
{
  _TtC16MagnifierSupport14ScrubberButton *v2;

  v2 = self;
  sub_22742CBE4();

}

- (_TtC16MagnifierSupport14ScrubberButton)initWithFrame:(CGRect)a3
{
  _TtC16MagnifierSupport14ScrubberButton *result;

  result = (_TtC16MagnifierSupport14ScrubberButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_22731A0F0((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport14ScrubberButton_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport14ScrubberButton____lazy_storage___internalButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport14ScrubberButton____lazy_storage___scrubber));
  swift_release();
  swift_release();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (NSString)largeContentTitle
{
  return (NSString *)sub_22742D064((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_227415BCC);
}

- (UIImage)largeContentImage
{
  id v2;

  sub_2274154A4();
  return (UIImage *)v2;
}

- (NSString)accessibilityIdentifier
{
  return (NSString *)sub_22742D064((uint64_t)self, (uint64_t)a2, (void (*)(void))Control.rawValue.getter);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  _TtC16MagnifierSupport14ScrubberButton *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_22742D0B8(v4);

  return self & 1;
}

@end
