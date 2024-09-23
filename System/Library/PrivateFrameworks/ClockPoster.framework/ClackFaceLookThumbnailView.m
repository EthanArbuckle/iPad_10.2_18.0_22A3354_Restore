@implementation ClackFaceLookThumbnailView

- (_TtC11ClockPoster26ClackFaceLookThumbnailView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC11ClockPoster26ClackFaceLookThumbnailView *result;

  v5 = OBJC_IVAR____TtC11ClockPoster26ClackFaceLookThumbnailView_gradientLayer;
  v6 = objc_allocWithZone(MEMORY[0x24BDE56B8]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC11ClockPoster26ClackFaceLookThumbnailView *)sub_237EE309C();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC11ClockPoster26ClackFaceLookThumbnailView *v2;

  v2 = self;
  sub_237E7D490();

}

- (_TtC11ClockPoster26ClackFaceLookThumbnailView)initWithFrame:(CGRect)a3
{
  _TtC11ClockPoster26ClackFaceLookThumbnailView *result;

  result = (_TtC11ClockPoster26ClackFaceLookThumbnailView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ClockPoster26ClackFaceLookThumbnailView_gradientLayer));
}

@end
