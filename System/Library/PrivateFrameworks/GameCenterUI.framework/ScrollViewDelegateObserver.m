@implementation ScrollViewDelegateObserver

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC12GameCenterUI26ScrollViewDelegateObserver *v5;

  v4 = a3;
  v5 = self;
  sub_1AB6BB7AC();

}

- (void)scrollViewWillBeginDecelerating:(id)a3
{
  id v4;
  _TtC12GameCenterUI26ScrollViewDelegateObserver *v5;

  v4 = a3;
  v5 = self;
  sub_1AB6BB824();

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4;
  _TtC12GameCenterUI26ScrollViewDelegateObserver *v5;

  v4 = a3;
  v5 = self;
  sub_1AB6BB89C();

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v6;
  _TtC12GameCenterUI26ScrollViewDelegateObserver *v7;

  v6 = a3;
  v7 = self;
  sub_1AB6BB914((uint64_t)v6, a4);

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  _TtC12GameCenterUI26ScrollViewDelegateObserver *v5;

  v4 = a3;
  v5 = self;
  sub_1AB6BB994();

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double x;
  id v9;
  _TtC12GameCenterUI26ScrollViewDelegateObserver *v10;

  y = a4.y;
  x = a4.x;
  v9 = a3;
  v10 = self;
  sub_1AB6BBA0C((uint64_t)v9, (uint64_t)a5, x, y);

}

- (_TtC12GameCenterUI26ScrollViewDelegateObserver)init
{
  return (_TtC12GameCenterUI26ScrollViewDelegateObserver *)sub_1AB6BBAA4();
}

- (void).cxx_destruct
{
  swift_release();
}

@end
