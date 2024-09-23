@implementation AllMetricsViewCell

- (_TtC13FTMInternal_418AllMetricsViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC13FTMInternal_418AllMetricsViewCell *)sub_100160ECC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC13FTMInternal_418AllMetricsViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100166054();
}

- (void)layoutSubviews
{
  _TtC13FTMInternal_418AllMetricsViewCell *v2;

  v2 = self;
  sub_100161A54();

}

- (void)prepareForReuse
{
  sub_10016346C(self, (uint64_t)a2, type metadata accessor for AllMetricsViewCell, (void (*)(id))sub_100161CDC);
}

- (void)didTapActivityIndicator
{
  id v3;
  _TtC13FTMInternal_418AllMetricsViewCell *v4;
  id v5;

  v3 = objc_allocWithZone((Class)UIImpactFeedbackGenerator);
  v4 = self;
  v5 = objc_msgSend(v3, "initWithStyle:", 1);
  objc_msgSend(v5, "impactOccurred");

}

- (BOOL)isHighlighted
{
  return sub_100165CE8(self, (uint64_t)a2, type metadata accessor for AllMetricsViewCell);
}

- (void)setHighlighted:(BOOL)a3
{
  _TtC13FTMInternal_418AllMetricsViewCell *v4;

  v4 = self;
  sub_100165D84(a3, type metadata accessor for AllMetricsViewCell, (uint64_t)&unk_100263E80, (uint64_t)sub_1001661B8, (uint64_t)&unk_100263E98);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_418AllMetricsViewCell_container));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_418AllMetricsViewCell____lazy_storage___metricNameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_418AllMetricsViewCell____lazy_storage___metricAvailabilityLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_418AllMetricsViewCell____lazy_storage___activityIndicatorButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_418AllMetricsViewCell____lazy_storage___bottomLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_418AllMetricsViewCell_timestampHiddenConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_418AllMetricsViewCell_timestampVisibleConstraint));
}

@end
