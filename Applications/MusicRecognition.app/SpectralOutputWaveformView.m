@implementation SpectralOutputWaveformView

- (_TtC16MusicRecognition26SpectralOutputWaveformView)initWithCoder:(id)a3
{
  id v4;
  _TtC16MusicRecognition26SpectralOutputWaveformView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicRecognition26SpectralOutputWaveformView_barViews) = (Class)&_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicRecognition26SpectralOutputWaveformView_waveformData) = (Class)&_swiftEmptyArrayStorage;
  v4 = a3;

  result = (_TtC16MusicRecognition26SpectralOutputWaveformView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000D9FE0, "MusicRecognition/SpectralOutputWaveformView.swift", 49, 2, 63, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  uint64_t v2;
  _TtC16MusicRecognition26SpectralOutputWaveformView *v3;

  v3 = self;
  sub_10001EE1C((uint64_t)v3, v2);

}

- (_TtC16MusicRecognition26SpectralOutputWaveformView)initWithFrame:(CGRect)a3
{
  _TtC16MusicRecognition26SpectralOutputWaveformView *result;

  result = (_TtC16MusicRecognition26SpectralOutputWaveformView *)_swift_stdlib_reportUnimplementedInitializer("MusicRecognition.SpectralOutputWaveformView", 43, "init(frame:)", 12, 0, (__n128)a3.origin, *(__n128 *)&a3.origin.y, (__n128)a3.size, *(__n128 *)&a3.size.height);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicRecognition26SpectralOutputWaveformView_barViews));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicRecognition26SpectralOutputWaveformView_waveformData));
}

@end
