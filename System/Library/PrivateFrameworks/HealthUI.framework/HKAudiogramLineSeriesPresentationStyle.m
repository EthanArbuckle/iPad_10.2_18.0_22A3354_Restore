@implementation HKAudiogramLineSeriesPresentationStyle

- (HKAudiogramLineSeriesPresentationStyle)initWithSeriesEar:(int64_t)a3 selectedEar:(int64_t)a4 disableConnectionLines:(BOOL)a5 disabledStyleOverride:(BOOL)a6
{
  return (HKAudiogramLineSeriesPresentationStyle *)AudiogramLineSeriesPresentationStyle.init(seriesEar:selectedEar:disableConnectionLines:disabledStyleOverride:)(a3, a4, a5, a6);
}

- (HKAudiogramLineSeriesPresentationStyle)init
{
  HKAudiogramLineSeriesPresentationStyle *result;

  sub_1D7B4A7DC();
  swift_bridgeObjectRelease();
  result = (HKAudiogramLineSeriesPresentationStyle *)sub_1D7B4A890();
  __break(1u);
  return result;
}

- (id)lineSeriesPresentationStyle
{
  HKAudiogramLineSeriesPresentationStyle *v2;
  id v3;

  v2 = self;
  v3 = sub_1D7ADC500();

  return v3;
}

@end
