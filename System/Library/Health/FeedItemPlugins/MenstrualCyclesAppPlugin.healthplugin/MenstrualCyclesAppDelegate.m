@implementation MenstrualCyclesAppDelegate

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  uint64_t v5;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  _TtC24MenstrualCyclesAppPlugin26MenstrualCyclesAppDelegate *v12;
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
  v8 = _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
  v10 = v9;
  if (v5)
LABEL_3:
    v5 = sub_231CA1AAC();
LABEL_4:
  v11 = a3;
  v12 = self;
  v13 = sub_231965228((uint64_t)a3, v8, v10, v5);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v13 & 1;
}

- (_TtC24MenstrualCyclesAppPlugin26MenstrualCyclesAppDelegate)init
{
  _TtC24MenstrualCyclesAppPlugin26MenstrualCyclesAppDelegate *result;

  sub_23199E9A0();
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin26MenstrualCyclesAppDelegate_healthStore));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin26MenstrualCyclesAppDelegate_healthSharingNotificationSyncStore));
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  sub_231A0C810(self, (int)a2, a3, a4, a5, (uint64_t)&unk_25009BCA8, (uint64_t)sub_231A10B00, (void (*)(id, uint64_t, uint64_t))sub_231A0F310);
}

- (void)userNotificationCenter:(id)a3 openSettingsForNotification:(id)a4
{
  id v6;
  id v7;
  _TtC24MenstrualCyclesAppPlugin26MenstrualCyclesAppDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_231A0F704(a4);

}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  sub_231A0C810(self, (int)a2, a3, a4, a5, (uint64_t)&unk_25009BA00, (uint64_t)sub_231A0F304, (void (*)(id, uint64_t, uint64_t))sub_231A0FCAC);
}

@end
