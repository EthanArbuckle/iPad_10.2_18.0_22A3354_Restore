@implementation PluginNotificationRouter

- (_TtC18HealthExperienceUI24PluginNotificationRouter)init
{
  _TtC18HealthExperienceUI24PluginNotificationRouter *v3;
  uint64_t v4;
  uint64_t v5;
  _TtC18HealthExperienceUI24PluginNotificationRouter *v6;

  sub_1A9A93A78();
  v3 = self;
  v4 = sub_1A9A93A6C();
  type metadata accessor for PlatformNotificationHandlerPluginProvider();
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = 0;
  *(_QWORD *)(v5 + 24) = v4;

  v6 = (_TtC18HealthExperienceUI24PluginNotificationRouter *)sub_1A993DF90(v5);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v6;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI24PluginNotificationRouter_pluginProviding);
  sub_1A961AEDC((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI24PluginNotificationRouter_sceneProvider);
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  sub_1A993D120(self, (int)a2, a3, a4, a5, (void (*)(id, id, id, void *))sub_1A993E21C);
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  sub_1A993D120(self, (int)a2, a3, a4, a5, (void (*)(id, id, id, void *))sub_1A993E390);
}

- (void)userNotificationCenter:(id)a3 openSettingsForNotification:(id)a4
{
  id v6;
  id v7;
  _TtC18HealthExperienceUI24PluginNotificationRouter *v8;
  _TtC18HealthExperienceUI24PluginNotificationRouter *v9;
  UNNotification_optional v10;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v10.is_nil = (char)v8;
  v9 = v8;
  v10.value.super.isa = (Class)a4;
  PluginNotificationRouter.userNotificationCenter(_:openSettingsFor:)((UNUserNotificationCenter)v6, v10);

}

@end
