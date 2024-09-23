@implementation MedicationsHealthAppPluginDelegate

- (_TtC26MedicationsHealthAppPlugin34MedicationsHealthAppPluginDelegate)init
{
  return (_TtC26MedicationsHealthAppPlugin34MedicationsHealthAppPluginDelegate *)sub_2318780E4();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin34MedicationsHealthAppPluginDelegate_healthStore));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin34MedicationsHealthAppPluginDelegate_scheduleControl));
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  sub_23187899C(self, (int)a2, a3, a4, a5, (uint64_t)&unk_25007FF18, (uint64_t)sub_23187D758, (void (*)(id, uint64_t, uint64_t))sub_23187C458);
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  sub_23187899C(self, (int)a2, a3, a4, a5, (uint64_t)&unk_25007FEF0, (uint64_t)sub_23187D748, (void (*)(id, uint64_t, uint64_t))sub_23187D178);
}

- (id)makeDataListViewControllerForHealthStore:(id)a3 displayType:(id)a4 predicate:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC26MedicationsHealthAppPlugin34MedicationsHealthAppPluginDelegate *v11;
  id v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = sub_23187D634((uint64_t)v8, v9);

  return v12;
}

@end
