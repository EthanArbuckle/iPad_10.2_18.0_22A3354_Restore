@implementation DebugFormatHistoryMeasurementCell

- (_TtC8NewsFeed33DebugFormatHistoryMeasurementCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)sub_1BB8729A0();
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC8NewsFeed33DebugFormatHistoryMeasurementCell *)sub_1BB624098(a3, (uint64_t)a4, v6);
}

- (_TtC8NewsFeed33DebugFormatHistoryMeasurementCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BB62458C();
}

- (void)layoutSubviews
{
  _TtC8NewsFeed33DebugFormatHistoryMeasurementCell *v2;

  v2 = self;
  sub_1BB6242B8();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed33DebugFormatHistoryMeasurementCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed33DebugFormatHistoryMeasurementCell_barView));
}

@end
