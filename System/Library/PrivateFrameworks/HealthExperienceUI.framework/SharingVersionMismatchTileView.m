@implementation SharingVersionMismatchTileView

- (_TtC18HealthExperienceUI30SharingVersionMismatchTileView)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI30SharingVersionMismatchTileView *)SharingVersionMismatchTileView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI30SharingVersionMismatchTileView)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC18HealthExperienceUI30SharingVersionMismatchTileView *result;

  v4 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI30SharingVersionMismatchTileView_context;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v5 = a3;

  result = (_TtC18HealthExperienceUI30SharingVersionMismatchTileView *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A97A6764((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI30SharingVersionMismatchTileView_context, (unint64_t *)&qword_1ED27C440, (unint64_t *)&qword_1ED27C430, (uint64_t)&protocol descriptor for FeedItemViewControllerContext);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI30SharingVersionMismatchTileView_messageView));
}

@end
