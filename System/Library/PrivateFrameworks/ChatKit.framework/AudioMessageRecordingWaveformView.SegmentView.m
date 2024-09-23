@implementation AudioMessageRecordingWaveformView.SegmentView

- (_TtCC7ChatKit33AudioMessageRecordingWaveformViewP33_68B4BF5DB603E8129B1C86442826AB4B11SegmentView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for AudioMessageRecordingWaveformView.SegmentView();
  return -[AudioMessageRecordingWaveformView.SegmentView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtCC7ChatKit33AudioMessageRecordingWaveformViewP33_68B4BF5DB603E8129B1C86442826AB4B11SegmentView)initWithCoder:(id)a3
{
  _TtCC7ChatKit33AudioMessageRecordingWaveformViewP33_68B4BF5DB603E8129B1C86442826AB4B11SegmentView *result;

  result = (_TtCC7ChatKit33AudioMessageRecordingWaveformViewP33_68B4BF5DB603E8129B1C86442826AB4B11SegmentView *)sub_18E769320();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  id v2;
  id v3;
  objc_super v4;
  CGRect v5;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AudioMessageRecordingWaveformView.SegmentView();
  v2 = v4.receiver;
  -[AudioMessageRecordingWaveformView.SegmentView layoutSubviews](&v4, sel_layoutSubviews);
  v3 = objc_msgSend(v2, sel_layer, v4.receiver, v4.super_class);
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v3, sel_setCornerRadius_, CGRectGetWidth(v5) * 0.5);

}

@end
