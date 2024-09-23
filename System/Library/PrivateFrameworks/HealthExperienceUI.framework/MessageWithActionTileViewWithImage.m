@implementation MessageWithActionTileViewWithImage

- (_TtC18HealthExperienceUI25MessageWithActionTileView)messageTileView
{
  return (_TtC18HealthExperienceUI25MessageWithActionTileView *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18HealthExperienceUI34MessageWithActionTileViewWithImage_messageTileView);
}

- (_TtC18HealthExperienceUI34MessageWithActionTileViewWithImage)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI34MessageWithActionTileViewWithImage *)MessageWithActionTileViewWithImage.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI34MessageWithActionTileViewWithImage)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s18HealthExperienceUI025MessageWithActionTileViewE5ImageC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)updateConstraints
{
  _TtC18HealthExperienceUI34MessageWithActionTileViewWithImage *v2;

  v2 = self;
  sub_1A98D8498();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI34MessageWithActionTileViewWithImage_messageTileView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI34MessageWithActionTileViewWithImage_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI34MessageWithActionTileViewWithImage_messageTileViewTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI34MessageWithActionTileViewWithImage_messageTileViewLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI34MessageWithActionTileViewWithImage_imageViewLeadingConstraint));
}

@end
