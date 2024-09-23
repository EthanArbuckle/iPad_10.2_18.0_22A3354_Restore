@implementation ListeningView

- (_TtC16MusicRecognition13ListeningView)initWithFrame:(CGRect)a3
{
  _TtC16MusicRecognition13ListeningView *result;

  sub_1000791C8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)self, (uint64_t)a2);
  return result;
}

- (_TtC16MusicRecognition13ListeningView)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  _TtC16MusicRecognition13ListeningView *result;

  v3 = a3;
  sub_10007A0E0(v3, v4);
  return result;
}

- (void)layoutSubviews
{
  uint64_t v2;
  _TtC16MusicRecognition13ListeningView *v3;

  v3 = self;
  sub_10007A314((uint64_t)v3, v2);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition13ListeningView_listeningView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition13ListeningView_listeningLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition13ListeningView_cancelButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition13ListeningView_waveformView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicRecognition13ListeningView_extendedListeningTextChangeTask));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition13ListeningView_listeningLabelVerticalAnchor));
}

@end
