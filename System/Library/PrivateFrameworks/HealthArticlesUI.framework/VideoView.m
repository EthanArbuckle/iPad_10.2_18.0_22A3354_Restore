@implementation VideoView

- (NSString)accessibilityVideoDescription
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_accessibilityVideoDescription;
  swift_beginAccess();
  if (!*((_QWORD *)v2 + 1))
    return (NSString *)0;
  swift_bridgeObjectRetain();
  v3 = (void *)sub_1BC97FEFC();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)setAccessibilityVideoDescription:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  if (a3)
  {
    v4 = sub_1BC97FF20();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_accessibilityVideoDescription);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (_TtC16HealthArticlesUI9VideoView)initWithFrame:(CGRect)a3
{
  return (_TtC16HealthArticlesUI9VideoView *)sub_1BC97AF74(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16HealthArticlesUI9VideoView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BC97E894();
}

- (void)nonLoopingEndOfPlay:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC16HealthArticlesUI9VideoView *v8;
  uint64_t v9;

  v4 = sub_1BC97F8C0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC97F8A8();
  v8 = self;
  sub_1BC97D6A4();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
  sub_1BC97DCB8((uint64_t)self + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_videoPlayer);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_primaryPlayerAsset));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_primaryPlayerItem));

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16HealthArticlesUI9VideoView____lazy_storage___captionLabel));
}

@end
