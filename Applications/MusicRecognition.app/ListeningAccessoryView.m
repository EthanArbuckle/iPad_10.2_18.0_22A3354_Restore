@implementation ListeningAccessoryView

- (_TtC16MusicRecognition22ListeningAccessoryView)initWithFrame:(CGRect)a3
{
  _TtC16MusicRecognition22ListeningAccessoryView *result;

  sub_10004A3F8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)self, (uint64_t)a2);
  return result;
}

- (_TtC16MusicRecognition22ListeningAccessoryView)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  _TtC16MusicRecognition22ListeningAccessoryView *result;

  v3 = a3;
  sub_10004A9B0(v3, v4);
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 1.0;
  v3 = 1.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition22ListeningAccessoryView_listeningView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition22ListeningAccessoryView_imageView));
}

@end
