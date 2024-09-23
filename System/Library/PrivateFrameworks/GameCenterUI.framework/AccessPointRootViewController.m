@implementation AccessPointRootViewController

- (unint64_t)supportedInterfaceOrientations
{
  _TtC12GameCenterUI29AccessPointRootViewController *v2;
  unint64_t v3;
  unint64_t v4;

  v2 = self;
  sub_1AB4CC2B4();
  v4 = v3;

  return v4;
}

- (_TtC12GameCenterUI29AccessPointRootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC12GameCenterUI29AccessPointRootViewController *result;

  if (a3)
  {
    v5 = sub_1AB7DAF90();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  sub_1AB4CC33C(v5, v7, a4);
  return result;
}

- (_TtC12GameCenterUI29AccessPointRootViewController)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  return (_TtC12GameCenterUI29AccessPointRootViewController *)sub_1AB4CC4C8((uint64_t)v3, v4, (uint64_t (*)(uint64_t))type metadata accessor for AccessPointRootViewController);
}

@end
