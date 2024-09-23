@implementation ApplicationDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC10ChronoCore19ApplicationDelegate *v8;

  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    sub_1D291F44C();
    sub_1D29C58E0();
  }
  v6 = qword_1ED94F618;
  v7 = a3;
  v8 = self;
  if (v6 != -1)
    swift_once();
  sub_1D288D244();

  swift_bridgeObjectRelease();
  return 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC10ChronoCore19ApplicationDelegate *v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t ObjCClassFromMetadata;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  BSDispatchQueueAssertMain();
  v12 = objc_msgSend(v9, sel_role);
  v13 = sub_1D291F188();
  v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3BD8]), sel_initWithName_sessionRole_, 0, v12);
  if (v13)
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  else
    ObjCClassFromMetadata = 0;
  objc_msgSend(v14, sel_setDelegateClass_, ObjCClassFromMetadata);

  return v14;
}

- (_TtC10ChronoCore19ApplicationDelegate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ApplicationDelegate();
  return -[ApplicationDelegate init](&v3, sel_init);
}

@end
