@implementation AmbientMatchView

- (_TtC16MusicRecognition16AmbientMatchView)initWithFrame:(CGRect)a3
{
  _TtC16MusicRecognition16AmbientMatchView *result;

  sub_1000CB83C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)self, (uint64_t)a2);
  return result;
}

- (_TtC16MusicRecognition16AmbientMatchView)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  _TtC16MusicRecognition16AmbientMatchView *result;

  v3 = a3;
  sub_1000CD0F8(v3, v4);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_placeholderArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_albumArtContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_albumArtImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_artistLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_shazamLogoImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_shazamCountLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_trackDetailsStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_shazamCountStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_appleMusicButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView____lazy_storage___albumArtImageViewCenterYConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView____lazy_storage___placeholderViewCenterYConstraint));
}

@end
