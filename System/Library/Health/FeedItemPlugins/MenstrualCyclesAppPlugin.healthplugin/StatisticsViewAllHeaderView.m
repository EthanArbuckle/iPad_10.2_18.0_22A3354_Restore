@implementation StatisticsViewAllHeaderView

- (_TtC24MenstrualCyclesAppPlugin27StatisticsViewAllHeaderView)initWithReuseIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3)
  {
    v3 = _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
  }
  else
  {
    v3 = 0;
    v4 = 0;
  }
  return (_TtC24MenstrualCyclesAppPlugin27StatisticsViewAllHeaderView *)sub_231BB7A78(v3, v4);
}

- (_TtC24MenstrualCyclesAppPlugin27StatisticsViewAllHeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_231BB8618();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27StatisticsViewAllHeaderView_headerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27StatisticsViewAllHeaderView_headerSeparator));
  swift_bridgeObjectRelease();
}

@end
