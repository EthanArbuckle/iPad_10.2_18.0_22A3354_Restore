@implementation UIButton(GKDashboardUtils)

+ (_TtC12GameCenterUI11CloseButton)_gkXmarkedCloseButtonWithTarget:()GKDashboardUtils action:
{
  id v5;
  _TtC12GameCenterUI11CloseButton *v6;

  v5 = a3;
  v6 = objc_alloc_init(_TtC12GameCenterUI11CloseButton);
  -[CloseButton addTarget:action:forEvents:](v6, "addTarget:action:forEvents:", v5, a4, 0x2000);

  return v6;
}

@end
