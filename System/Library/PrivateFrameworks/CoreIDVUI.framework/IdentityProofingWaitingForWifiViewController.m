@implementation IdentityProofingWaitingForWifiViewController

- (_TtC9CoreIDVUI44IdentityProofingWaitingForWifiViewController)initWithCoder:(id)a3
{
  _TtC9CoreIDVUI44IdentityProofingWaitingForWifiViewController *result;

  result = (_TtC9CoreIDVUI44IdentityProofingWaitingForWifiViewController *)sub_213FF9878();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC9CoreIDVUI44IdentityProofingWaitingForWifiViewController *v2;

  v2 = self;
  sub_213F9BF50();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC9CoreIDVUI44IdentityProofingWaitingForWifiViewController *v4;

  v4 = self;
  sub_213F9CC20(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for IdentityProofingWaitingForWifiViewController();
  v4 = v5.receiver;
  -[IdentityProofingWaitingForWifiViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
  sub_213FF8618();
  sub_213F9DBC0();

  swift_bridgeObjectRelease();
}

- (_TtC9CoreIDVUI44IdentityProofingWaitingForWifiViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9CoreIDVUI44IdentityProofingWaitingForWifiViewController *result;

  v4 = a4;
  result = (_TtC9CoreIDVUI44IdentityProofingWaitingForWifiViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
}

@end
