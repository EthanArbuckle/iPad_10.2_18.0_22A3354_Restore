@implementation WaveformAccessoryView

- (_TtC16MusicRecognition21WaveformAccessoryView)initWithFrame:(CGRect)a3
{
  _TtC16MusicRecognition21WaveformAccessoryView *result;

  sub_10001F394(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)self, (uint64_t)a2);
  return result;
}

- (_TtC16MusicRecognition21WaveformAccessoryView)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  _TtC16MusicRecognition21WaveformAccessoryView *result;

  v3 = a3;
  sub_10001F9F8(v3, v4);
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
                     + OBJC_IVAR____TtC16MusicRecognition21WaveformAccessoryView_waveformView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition21WaveformAccessoryView_listeningView));
}

@end
