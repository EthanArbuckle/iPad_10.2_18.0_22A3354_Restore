@implementation ImageWell

- (_TtC16MagnifierSupport9ImageWell)initWithCoder:(id)a3
{
  return (_TtC16MagnifierSupport9ImageWell *)sub_227526984(a3);
}

- (_TtC16MagnifierSupport9ImageWell)initWithFrame:(CGRect)a3
{
  return (_TtC16MagnifierSupport9ImageWell *)sub_227526A40(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (NSString)largeContentTitle
{
  _TtC16MagnifierSupport9ImageWell *v2;
  void *v3;

  v2 = self;
  sub_227526828();

  v3 = (void *)sub_22758E1B4();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (UIImage)largeContentImage
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.super.super.isa
            + OBJC_IVAR____TtC16MagnifierSupport9ImageWell_infiniteSettingsGlyph);
  swift_beginAccess();
  return (UIImage *)*v2;
}

- (NSString)accessibilityLabel
{
  _TtC16MagnifierSupport9ImageWell *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_22752792C();
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

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport9ImageWell_infiniteSettingsGlyph));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport9ImageWell_snapshotImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport9ImageWell_badgeView));
}

@end
