@implementation IMBDateTableViewCell

- (UILabel)dateLabel
{
  _TtC8Business20IMBDateTableViewCell *v2;
  id v3;

  v2 = self;
  v3 = sub_10006C958();

  return (UILabel *)v3;
}

- (void)setDateLabel:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8Business20IMBDateTableViewCell____lazy_storage___dateLabel);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8Business20IMBDateTableViewCell____lazy_storage___dateLabel) = (Class)a3;
  v3 = a3;

}

- (UILabel)conflictsLabel
{
  _TtC8Business20IMBDateTableViewCell *v2;
  id v3;

  v2 = self;
  v3 = sub_10006CA90();

  return (UILabel *)v3;
}

- (void)setConflictsLabel:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8Business20IMBDateTableViewCell____lazy_storage___conflictsLabel);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8Business20IMBDateTableViewCell____lazy_storage___conflictsLabel) = (Class)a3;
  v3 = a3;

}

- (UIButton)showMoreButton
{
  _TtC8Business20IMBDateTableViewCell *v2;
  id v3;

  v2 = self;
  v3 = sub_10006CBFC();

  return (UIButton *)v3;
}

- (void)setShowMoreButton:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8Business20IMBDateTableViewCell____lazy_storage___showMoreButton);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8Business20IMBDateTableViewCell____lazy_storage___showMoreButton) = (Class)a3;
  v3 = a3;

}

- (UIButton)viewInCalendarButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR____TtC8Business20IMBDateTableViewCell_viewInCalendarButton));
}

- (_TtC8Business25IMBTimeslotsContainerView)timeslotContainerView
{
  return (_TtC8Business25IMBTimeslotsContainerView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                             + OBJC_IVAR____TtC8Business20IMBDateTableViewCell_timeslotContainerView));
}

- (_TtC8Business20IMBDateTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC8Business20IMBDateTableViewCell *)sub_10006CFF8(a3, (uint64_t)a4, v6);
}

- (_TtC8Business20IMBDateTableViewCell)initWithCoder:(id)a3
{
  return (_TtC8Business20IMBDateTableViewCell *)sub_10006D1F8(a3);
}

- (void)toggleMoreLess
{
  _TtC8Business20IMBDateTableViewCell *v2;

  v2 = self;
  sub_10006E60C();

}

- (void)viewInCalendar
{
  _TtC8Business20IMBDateTableViewCell *v2;

  v2 = self;
  sub_10006E940();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business20IMBDateTableViewCell____lazy_storage___timeFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business20IMBDateTableViewCell____lazy_storage___dateLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business20IMBDateTableViewCell____lazy_storage___conflictsLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business20IMBDateTableViewCell____lazy_storage___showMoreButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business20IMBDateTableViewCell_viewInCalendarButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business20IMBDateTableViewCell_timeslotContainerView));
  sub_100011A64((uint64_t)self + OBJC_IVAR____TtC8Business20IMBDateTableViewCell_timeSelectionDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business20IMBDateTableViewCell_timeslotViewTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business20IMBDateTableViewCell_conflictHeigthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business20IMBDateTableViewCell_calendarButtonHeigthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business20IMBDateTableViewCell_calendarButtonBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business20IMBDateTableViewCell_showMoreButtonHeight));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business20IMBDateTableViewCell_showMoreButtonWidth));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC8Business20IMBDateTableViewCell_cellData));
  sub_100010C40((Class *)((char *)&self->super.super.super.super.isa
                        + OBJC_IVAR____TtC8Business20IMBDateTableViewCell_urlHelper));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business20IMBDateTableViewCell____lazy_storage___separatorView));
}

@end
