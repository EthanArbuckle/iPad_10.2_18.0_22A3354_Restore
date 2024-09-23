@implementation PrimaryAppleAccountListSectionProvider

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC11SettingsApp38PrimaryAppleAccountListSectionProvider *v5;
  id v6;
  _TtC11SettingsApp38PrimaryAppleAccountListSectionProvider *v7;
  void *v8;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = (void *)objc_opt_self(NSNotificationCenter);
  v5 = self;
  v6 = objc_msgSend(v4, "defaultCenter");
  v7 = v5;
  v8 = (void *)static FamilySettingsFactory.FamilySettingsViewsHaveChanged.getter();
  objc_msgSend(v6, "removeObserver:name:object:", v7, v8, 0);

  v9.receiver = v7;
  v9.super_class = ObjectType;
  -[PrimaryAppleAccountListSectionProvider dealloc](&v9, "dealloc");
}

- (void).cxx_destruct
{
  sub_10000BAE4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11SettingsApp38PrimaryAppleAccountListSectionProvider_id), *(_QWORD *)&self->id[OBJC_IVAR____TtC11SettingsApp38PrimaryAppleAccountListSectionProvider_id], self->id[OBJC_IVAR____TtC11SettingsApp38PrimaryAppleAccountListSectionProvider_id + 8]);
  sub_100005474((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC11SettingsApp38PrimaryAppleAccountListSectionProvider_invalidator));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SettingsApp38PrimaryAppleAccountListSectionProvider_primaryAppleAccountStatusObserver));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC11SettingsApp38PrimaryAppleAccountListSectionProvider_followUpListElementsGenerator));
  sub_10000BA50((uint64_t)self + OBJC_IVAR____TtC11SettingsApp38PrimaryAppleAccountListSectionProvider____lazy_storage___familyModel, &qword_10015AAE8);
}

- (_TtC11SettingsApp38PrimaryAppleAccountListSectionProvider)init
{
  _TtC11SettingsApp38PrimaryAppleAccountListSectionProvider *result;

  result = (_TtC11SettingsApp38PrimaryAppleAccountListSectionProvider *)_swift_stdlib_reportUnimplementedInitializer("SettingsApp.PrimaryAppleAccountListSectionProvider", 50, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
