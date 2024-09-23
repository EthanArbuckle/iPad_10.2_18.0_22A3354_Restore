@implementation ProximityReaderSceneUIAppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  return 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC22ProximityReaderSceneUI33ProximityReaderSceneUIAppDelegate *v11;
  id v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = sub_10000E02C(v9);

  return v12;
}

- (_TtC22ProximityReaderSceneUI33ProximityReaderSceneUIAppDelegate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ProximityReaderSceneUIAppDelegate();
  return -[ProximityReaderSceneUIAppDelegate init](&v3, "init");
}

@end
