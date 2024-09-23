@implementation AudioMessageRecordingWaveformView

- (_TtC7ChatKit33AudioMessageRecordingWaveformView)initWithFrame:(CGRect)a3
{
  return (_TtC7ChatKit33AudioMessageRecordingWaveformView *)AudioMessageRecordingWaveformView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7ChatKit33AudioMessageRecordingWaveformView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s7ChatKit33AudioMessageRecordingWaveformViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)layoutSubviews
{
  _TtC7ChatKit33AudioMessageRecordingWaveformView *v2;

  v2 = self;
  sub_18E5156E4();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  char *v4;
  double v5;
  double v6;
  CGSize result;

  height = a3.height;
  v4 = (char *)self + OBJC_IVAR____TtC7ChatKit33AudioMessageRecordingWaveformView_intensities;
  swift_beginAccess();
  v5 = (double)*(uint64_t *)(*(_QWORD *)v4 + 16) * 4.0;
  v6 = height;
  result.height = v6;
  result.width = v5;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit33AudioMessageRecordingWaveformView_foregroundColor));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
