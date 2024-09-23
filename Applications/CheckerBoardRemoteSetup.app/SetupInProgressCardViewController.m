@implementation SetupInProgressCardViewController

- (_TtC23CheckerBoardRemoteSetup33SetupInProgressCardViewController)initWithContentView:(id)a3
{
  id v4;

  v4 = a3;
  return (_TtC23CheckerBoardRemoteSetup33SetupInProgressCardViewController *)sub_100002A38(a3);
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC23CheckerBoardRemoteSetup33SetupInProgressCardViewController *v3;

  v3 = self;
  sub_1000033F4();

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_msgSend(*(id *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC23CheckerBoardRemoteSetup33SetupInProgressCardViewController_activityIndicator], "startAnimating", a3);
}

- (void).cxx_destruct
{

}

@end
