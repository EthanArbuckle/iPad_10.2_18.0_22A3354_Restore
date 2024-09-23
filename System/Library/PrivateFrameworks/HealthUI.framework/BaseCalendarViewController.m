@implementation BaseCalendarViewController

- (_TtC8HealthUI26BaseCalendarViewController)initWithCollectionViewLayout:(id)a3
{
  char *v4;
  objc_super v6;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8HealthUI26BaseCalendarViewController_collectionViewDataSource) = 0;
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC8HealthUI26BaseCalendarViewController_isYearOverlayVisible) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC8HealthUI26BaseCalendarViewController_decelerationTargetContentOffset;
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v4[16] = 1;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8HealthUI26BaseCalendarViewController____lazy_storage___yearOverlay) = (Class)1;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for BaseCalendarViewController();
  return -[BaseCalendarViewController initWithCollectionViewLayout:](&v6, sel_initWithCollectionViewLayout_, a3);
}

- (_TtC8HealthUI26BaseCalendarViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_1D7B4A3BC();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC8HealthUI26BaseCalendarViewController *)BaseCalendarViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC8HealthUI26BaseCalendarViewController)initWithCoder:(id)a3
{
  return (_TtC8HealthUI26BaseCalendarViewController *)BaseCalendarViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8HealthUI26BaseCalendarViewController_collectionViewDataSource));
  sub_1D7AB1270(*(id *)((char *)&self->super.super.super.super.isa
                      + OBJC_IVAR____TtC8HealthUI26BaseCalendarViewController____lazy_storage___yearOverlay));
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC8HealthUI26BaseCalendarViewController *v5;

  v4 = a3;
  v5 = self;
  BaseCalendarViewController.updateYearOverlay()();

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  char *v4;
  id v5;
  _TtC8HealthUI26BaseCalendarViewController *v6;

  v4 = (char *)self + OBJC_IVAR____TtC8HealthUI26BaseCalendarViewController_decelerationTargetContentOffset;
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v4[16] = 1;
  v5 = a3;
  v6 = self;
  BaseCalendarViewController.updateYearOverlay()();

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  CGFloat x;
  CGFloat y;
  id v8;
  _TtC8HealthUI26BaseCalendarViewController *v9;

  x = a5->x;
  y = a5->y;
  v8 = a3;
  v9 = self;
  BaseCalendarViewController.updateYearOverlayForScrollViewWillEndDragging(targetContentOffset:)((CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x));

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v6;
  _TtC8HealthUI26BaseCalendarViewController *v7;

  v6 = a3;
  v7 = self;
  sub_1D7AB0D40(a4);

}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v4;
  _TtC8HealthUI26BaseCalendarViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1D7AB0EEC("[%{public}s] scrollViewDidEndScrollingAnimation: resuming data fetching");

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4;
  _TtC8HealthUI26BaseCalendarViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1D7AB0EEC("[%{public}s] scrollViewDidEndDecelerating: resuming data fetching");

}

@end
