@implementation AmbientNoMatchView

- (_TtC16MusicRecognition18AmbientNoMatchView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicRecognition18AmbientNoMatchView *)sub_1000B46EC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)self, (uint64_t)a2);
}

- (_TtC16MusicRecognition18AmbientNoMatchView)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  return (_TtC16MusicRecognition18AmbientNoMatchView *)sub_1000B525C(v3, v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition18AmbientNoMatchView_retryButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition18AmbientNoMatchView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition18AmbientNoMatchView_stackView));
}

@end
