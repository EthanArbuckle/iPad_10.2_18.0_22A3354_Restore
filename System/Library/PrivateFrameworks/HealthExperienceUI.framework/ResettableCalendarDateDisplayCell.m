@implementation ResettableCalendarDateDisplayCell

- (_TtC18HealthExperienceUI33ResettableCalendarDateDisplayCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI33ResettableCalendarDateDisplayCell *)sub_1A96C1024(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI33ResettableCalendarDateDisplayCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s18HealthExperienceUI33ResettableCalendarDateDisplayCellC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)didTapClear
{
  _TtC18HealthExperienceUI33ResettableCalendarDateDisplayCell *v2;

  v2 = self;
  sub_1A96C1440();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC18HealthExperienceUI33ResettableCalendarDateDisplayCell *v6;

  v5 = a3;
  v6 = self;
  sub_1A96C26D4(a3);

}

- (void).cxx_destruct
{
  sub_1A9643C10((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI33ResettableCalendarDateDisplayCell_item, (unint64_t *)&qword_1ED27B9E0, (void (*)(uint64_t))sub_1A96184A8);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33ResettableCalendarDateDisplayCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33ResettableCalendarDateDisplayCell_dateLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33ResettableCalendarDateDisplayCell_clearButton));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33ResettableCalendarDateDisplayCell_clearButtonWidthConstraint));
}

@end
