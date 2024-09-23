@implementation MatchView

- (_TtC16MusicRecognition9MatchView)initWithFrame:(CGRect)a3
{
  _TtC16MusicRecognition9MatchView *result;

  sub_10008F41C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)self, (uint64_t)a2);
  return result;
}

- (_TtC16MusicRecognition9MatchView)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  _TtC16MusicRecognition9MatchView *result;

  v3 = a3;
  sub_10008FF48(v3, v4);
  return result;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition9MatchView_appleMusicButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition9MatchView____lazy_storage___stackViewTrailingAnchorWithAppleMusicButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition9MatchView____lazy_storage___stackViewTrailingAnchorWithoutAppleMusicButton));
}

@end
