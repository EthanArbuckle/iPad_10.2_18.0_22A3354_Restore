@implementation FriendRequestComposeViewController

- (_TtC12GameCenterUI34FriendRequestComposeViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB6D8834();
}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC12GameCenterUI34FriendRequestComposeViewController *v4;

  v4 = self;
  sub_1AB6D88C0(a3);

}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  id v6;
  _TtC12GameCenterUI34FriendRequestComposeViewController *v7;

  v6 = a3;
  v7 = self;
  sub_1AB6D89E8(v6, a4);

}

- (_TtC12GameCenterUI34FriendRequestComposeViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  sub_1AB6D90CC();
}

- (_TtC12GameCenterUI34FriendRequestComposeViewController)initWithRootViewController:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB6D9100();
}

- (_TtC12GameCenterUI34FriendRequestComposeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1AB7DAF90();
  v5 = a4;
  sub_1AB6D9138();
}

- (void).cxx_destruct
{
  OUTLINED_FUNCTION_26_30();
  swift_bridgeObjectRelease();
}

@end
