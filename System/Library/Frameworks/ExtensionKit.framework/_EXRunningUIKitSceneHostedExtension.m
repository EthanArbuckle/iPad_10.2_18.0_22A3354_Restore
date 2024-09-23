@implementation _EXRunningUIKitSceneHostedExtension

- (int)_startWithArguments:(const char *)a3 count:(int)a4
{
  uint64_t v4;
  _EXRunningUIKitSceneHostedExtension *v6;

  v4 = *(_QWORD *)&a4;
  v6 = self;
  LODWORD(v4) = sub_20AE8E11C((uint64_t)a3, v4);

  return v4;
}

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  id v6;
  _EXRunningUIKitSceneHostedExtension *v7;

  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    sub_20AE8F384();
    sub_20AE9D3A0();
  }
  v6 = a3;
  v7 = self;
  -[_EXRunningExtension willFinishLaunching](v7, sel_willFinishLaunching);

  swift_bridgeObjectRelease();
  return 1;
}

- (void)applicationDidFinishLaunching:(id)a3
{
  -[_EXRunningExtension didFinishLaunching](self, sel_didFinishLaunching, a3);
}

- (void)applicationWillResignActive:(id)a3
{
  sub_20AE8E9C0(0xD00000000000001FLL, 0x800000020AEA3EE0);
}

- (void)applicationDidBecomeActive:(id)a3
{
  sub_20AE8E9C0(0xD00000000000001ELL, 0x800000020AEA3EC0);
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _EXRunningUIKitSceneHostedExtension *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = (void *)sub_20AE8EB60(v9, v10);

  return v12;
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7;
  id v8;
  _EXRunningUIKitSceneHostedExtension *v9;

  v7 = a3;
  v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  sub_20AE8EFA8(v7, v8);

  swift_unknownObjectRelease();
}

- (_EXRunningUIKitSceneHostedExtension)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for _EXRunningUIKitSceneHostedExtension();
  return -[_EXRunningUIKitSceneHostedExtension init](&v3, sel_init);
}

@end
