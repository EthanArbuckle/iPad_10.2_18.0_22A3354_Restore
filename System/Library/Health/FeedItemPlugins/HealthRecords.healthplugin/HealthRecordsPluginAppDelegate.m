@implementation HealthRecordsPluginAppDelegate

- (_TtC13HealthRecords30HealthRecordsPluginAppDelegate)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC13HealthRecords30HealthRecordsPluginAppDelegate____lazy_storage___notificationCenterDelegate) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HealthRecordsPluginAppDelegate();
  return -[HealthRecordsPluginAppDelegate init](&v3, sel_init);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtC13HealthRecords30HealthRecordsPluginAppDelegate *v12;
  char v13;

  v5 = (uint64_t)a5;
  if (!a4)
  {
    v8 = 0;
    v10 = 0;
    if (!a5)
      goto LABEL_4;
    goto LABEL_3;
  }
  v8 = sub_23126409C();
  v10 = v9;
  if (v5)
LABEL_3:
    v5 = sub_231263FC4();
LABEL_4:
  v11 = a3;
  v12 = self;
  v13 = sub_231231044((uint64_t)a3, v8, v10, v5);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v13 & 1;
}

@end
