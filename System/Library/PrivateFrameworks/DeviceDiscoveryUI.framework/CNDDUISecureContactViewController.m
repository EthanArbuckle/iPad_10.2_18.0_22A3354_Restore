@implementation CNDDUISecureContactViewController

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC17DeviceDiscoveryUI33CNDDUISecureContactViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _TtC17DeviceDiscoveryUI33CNDDUISecureContactViewController *v9;
  objc_super v11;

  if (a3)
  {
    sub_23A447284();
    v6 = a4;
    v7 = (void *)sub_23A447254();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for CNDDUISecureContactViewController();
  v9 = -[CNDDUISecureContactViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, v7, a4);

  return v9;
}

- (_TtC17DeviceDiscoveryUI33CNDDUISecureContactViewController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CNDDUISecureContactViewController();
  return -[CNDDUISecureContactViewController initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
