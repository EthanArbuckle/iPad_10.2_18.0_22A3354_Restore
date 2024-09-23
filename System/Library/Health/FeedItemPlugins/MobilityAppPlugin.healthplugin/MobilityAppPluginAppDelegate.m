@implementation MobilityAppPluginAppDelegate

- (_TtC17MobilityAppPlugin28MobilityAppPluginAppDelegate)init
{
  objc_class *ObjectType;
  id v4;
  _TtC17MobilityAppPlugin28MobilityAppPluginAppDelegate *v5;
  objc_class *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = objc_allocWithZone(MEMORY[0x24BE46D98]);
  v5 = self;
  v6 = (objc_class *)objc_msgSend(v4, sel_init);
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC17MobilityAppPlugin28MobilityAppPluginAppDelegate_analyticsManager) = v6;

  v8.receiver = v5;
  v8.super_class = ObjectType;
  return -[MobilityAppPluginAppDelegate init](&v8, sel_init);
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtC17MobilityAppPlugin28MobilityAppPluginAppDelegate *v12;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_231D558F0(v11, sub_231D5647C, (uint64_t (*)(void))v9);

  swift_release();
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  _TtC17MobilityAppPlugin28MobilityAppPluginAppDelegate *v11;

  v8 = _Block_copy(a5);
  *(_QWORD *)(swift_allocObject() + 16) = v8;
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_231D562A4((uint64_t (*)(uint64_t))sub_231D558E0);

  swift_release();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17MobilityAppPlugin28MobilityAppPluginAppDelegate_analyticsManager));
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtC17MobilityAppPlugin28MobilityAppPluginAppDelegate *v12;
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
  v8 = sub_231D7EB74();
  v10 = v9;
  if (v5)
LABEL_3:
    v5 = sub_231D7EB2C();
LABEL_4:
  v11 = a3;
  v12 = self;
  v13 = sub_231D794E8(a3, v8, v10, v5);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v13 & 1;
}

@end
