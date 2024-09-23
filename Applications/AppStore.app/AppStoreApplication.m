@implementation AppStoreApplication

- (_TtC8AppStore19AppStoreApplication)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore19AppStoreApplication_hasConcludedExtendedLaunchTest) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[AppStoreApplication init](&v5, "init");
}

- (id)_extendLaunchTest
{
  return String._bridgeToObjectiveC()();
}

+ (_TtC8AppStore19AppStoreApplication)sharedApplication
{
  uint64_t ObjCClassMetadata;
  id v3;
  objc_super v5;

  ObjCClassMetadata = swift_getObjCClassMetadata(a1);
  v5.receiver = (id)swift_getObjCClassFromMetadata(ObjCClassMetadata);
  v5.super_class = (Class)&OBJC_METACLASS____TtC8AppStore19AppStoreApplication;
  v3 = objc_msgSendSuper2(&v5, "sharedApplication");
  return (_TtC8AppStore19AppStoreApplication *)(id)swift_dynamicCastClassUnconditional(v3, ObjCClassMetadata, 0, 0, 0);
}

@end
