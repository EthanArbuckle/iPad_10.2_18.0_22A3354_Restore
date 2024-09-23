@implementation APDaemonPersistentContainer

- (_TtC13AppProtection27APDaemonPersistentContainer)init
{
  void *v3;
  void *v4;
  void *v5;
  _TtC13AppProtection27APDaemonPersistentContainer *v6;
  objc_super v8;

  v3 = (void *)sub_2362CB674();
  sub_23629DF00();
  v5 = v4;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for APDaemonPersistentContainer();
  v6 = -[NSPersistentContainer initWithName:managedObjectModel:](&v8, sel_initWithName_managedObjectModel_, v3, v5);

  return v6;
}

- (_TtC13AppProtection27APDaemonPersistentContainer)initWithName:(id)a3 managedObjectModel:(id)a4
{
  id v4;
  _TtC13AppProtection27APDaemonPersistentContainer *result;

  v4 = a4;
  result = (_TtC13AppProtection27APDaemonPersistentContainer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
