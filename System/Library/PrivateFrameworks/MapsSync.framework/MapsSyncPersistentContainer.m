@implementation MapsSyncPersistentContainer

+ (id)defaultDirectoryURL
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  uint64_t v8;

  v2 = sub_1A423BF3C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getObjCClassMetadata();
  sub_1A4107874((uint64_t)v5);
  v6 = (void *)sub_1A423BEF4();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v6;
}

- (_TtC8MapsSync27MapsSyncPersistentContainer)initWithName:(id)a3 managedObjectModel:(id)a4
{
  id v6;
  void *v7;
  _TtC8MapsSync27MapsSyncPersistentContainer *v8;
  objc_super v10;

  sub_1A423C14C();
  v6 = a4;
  v7 = (void *)sub_1A423C140();
  swift_bridgeObjectRelease();
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for MapsSyncPersistentContainer();
  v8 = -[NSPersistentContainer initWithName:managedObjectModel:](&v10, sel_initWithName_managedObjectModel_, v7, v6);

  return v8;
}

@end
