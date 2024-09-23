@implementation CNSecureContactViewController

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC9AirDropUI29CNSecureContactViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  _TtC9AirDropUI33AirDropTransferSessionsController *v6;
  _TtC9AirDropUI33AirDropTransferSessionsController *v7;
  id v8;
  NSString v9;
  SEL v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _TtC9AirDropUI29CNSecureContactViewController *v18;
  objc_super v20;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
    v8 = a4;
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7, v10, v11, v12, v13, v14, v15, v16);
  }
  else
  {
    v17 = a4;
    v9 = 0;
  }
  v20.receiver = self;
  v20.super_class = (Class)type metadata accessor for CNSecureContactViewController();
  v18 = -[CNSecureContactViewController initWithNibName:bundle:](&v20, "initWithNibName:bundle:", v9, a4);

  return v18;
}

- (_TtC9AirDropUI29CNSecureContactViewController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CNSecureContactViewController();
  return -[CNSecureContactViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
