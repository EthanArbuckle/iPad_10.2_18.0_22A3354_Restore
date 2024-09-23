@implementation HKAudiogramLineSeries

- (BOOL)supportsMultiTouchSelection
{
  return 0;
}

+ (id)audiogramLineSeriesForSeriesEar:(int64_t)a3 selectedEar:(int64_t)a4 disableConnectionLines:(BOOL)a5
{
  return sub_1D7ADCE14(a3, a4, a5, 0, 0);
}

+ (id)audiogramLineSeriesForSeriesEar:(int64_t)a3 selectedEar:(int64_t)a4 disableConnectionLines:(BOOL)a5 disabledStyleOverride:(BOOL)a6 selectedFrequency:(id)a7
{
  id v12;
  char *v13;

  v12 = a7;
  v13 = sub_1D7ADCE14(a3, a4, a5, a6, a7);

  return v13;
}

- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  __int128 v18;
  id v19;
  id v20;
  CGContext *v21;
  id v22;
  HKAudiogramLineSeries *v23;
  _OWORD v24[3];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v18 = *(_OWORD *)&a6->c;
  v24[0] = *(_OWORD *)&a6->a;
  v24[1] = v18;
  v24[2] = *(_OWORD *)&a6->tx;
  v19 = a3;
  v20 = a5;
  v21 = a7;
  v22 = a8;
  swift_unknownObjectRetain();
  v23 = self;
  sub_1D7ADCA68((uint64_t)v19, (uint64_t)v20, (CGFloat *)v24, v21, (uint64_t)v22, a9, x, y, width, height);

  swift_unknownObjectRelease();
}

- (HKAudiogramLineSeries)init
{
  HKAudiogramLineSeries *result;

  result = (HKAudiogramLineSeries *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
