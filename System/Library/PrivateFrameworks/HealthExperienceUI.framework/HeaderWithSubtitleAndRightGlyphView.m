@implementation HeaderWithSubtitleAndRightGlyphView

- (_TtC18HealthExperienceUI35HeaderWithSubtitleAndRightGlyphView)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI35HeaderWithSubtitleAndRightGlyphView *)HeaderWithSubtitleAndRightGlyphView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI35HeaderWithSubtitleAndRightGlyphView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1A97A3BB0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35HeaderWithSubtitleAndRightGlyphView_headerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35HeaderWithSubtitleAndRightGlyphView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35HeaderWithSubtitleAndRightGlyphView_glyphImageView));
}

@end
