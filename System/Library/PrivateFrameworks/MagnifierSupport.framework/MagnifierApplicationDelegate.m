@implementation MagnifierApplicationDelegate

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC16MagnifierSupport28MagnifierApplicationDelegate *v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = objc_msgSend(v9, sel_role);
  v13 = objc_allocWithZone(MEMORY[0x24BEBD8E8]);
  v14 = (void *)sub_22758E1B4();
  v15 = objc_msgSend(v13, sel_initWithName_sessionRole_, v14, v12);

  return v15;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v6;
  _TtC16MagnifierSupport28MagnifierApplicationDelegate *v7;
  char v8;

  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    sub_22734019C();
    sub_22758E118();
  }
  v6 = a3;
  v7 = self;
  v8 = _s16MagnifierSupport0A19ApplicationDelegateC11application_29didFinishLaunchingWithOptionsSbSo13UIApplicationC_SDySo0k6LaunchJ3KeyaypGSgtF_0();

  swift_bridgeObjectRelease();
  return v8 & 1;
}

- (unint64_t)application:(id)a3 supportedInterfaceOrientationsForWindow:(id)a4
{
  uint64_t v6;
  id v7;
  id v8;
  _TtC16MagnifierSupport28MagnifierApplicationDelegate *v9;
  int v10;

  v6 = qword_2558D4BA8;
  v7 = a3;
  v8 = a4;
  v9 = self;
  if (v6 != -1)
    swift_once();
  v10 = byte_2558DAEE1;

  if (v10)
    return 2;
  else
    return 30;
}

- (_TtC16MagnifierSupport28MagnifierApplicationDelegate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[MagnifierApplicationDelegate init](&v3, sel_init);
}

@end
