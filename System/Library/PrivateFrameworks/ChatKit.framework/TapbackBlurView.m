@implementation TapbackBlurView

- (_TtC7ChatKit15TapbackBlurView)initWithCoder:(id)a3
{
  id v4;
  _TtC7ChatKit15TapbackBlurView *result;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC7ChatKit15TapbackBlurView_isBlurEnabled) = 0;
  v4 = a3;

  result = (_TtC7ChatKit15TapbackBlurView *)sub_18E769320();
  __break(1u);
  return result;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  _TtC7ChatKit15TapbackBlurView *v7;
  char v8;

  if (a3)
  {
    v4 = sub_18E768984();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  v8 = sub_18E670BBC(v4, v6);

  swift_bridgeObjectRelease();
  return v8 & 1;
}

- (_TtC7ChatKit15TapbackBlurView)initWithFrame:(CGRect)a3
{
  _TtC7ChatKit15TapbackBlurView *result;

  result = (_TtC7ChatKit15TapbackBlurView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
