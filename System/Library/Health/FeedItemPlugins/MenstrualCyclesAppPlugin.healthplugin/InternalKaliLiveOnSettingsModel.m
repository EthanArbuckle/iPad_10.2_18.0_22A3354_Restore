@implementation InternalKaliLiveOnSettingsModel

- (_TtC24MenstrualCyclesAppPlugin31InternalKaliLiveOnSettingsModel)init
{
  return (_TtC24MenstrualCyclesAppPlugin31InternalKaliLiveOnSettingsModel *)sub_231AB7148();
}

- (void)sleepStore:(id)a3 sleepSettingsDidChange:(id)a4
{
  id v6;
  id v7;
  _TtC24MenstrualCyclesAppPlugin31InternalKaliLiveOnSettingsModel *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_231ABD1EC((uint64_t)&unk_25009F708, (uint64_t)sub_231ABD814, (uint64_t)&unk_25009F720);

}

- (void)sleepStore:(id)a3 sleepScheduleDidChange:(id)a4
{
  id v6;
  id v7;
  _TtC24MenstrualCyclesAppPlugin31InternalKaliLiveOnSettingsModel *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_231ABD1EC((uint64_t)&unk_25009F6B8, (uint64_t)sub_231ABD414, (uint64_t)&unk_25009F6D0);

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31InternalKaliLiveOnSettingsModel_healthStore));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31InternalKaliLiveOnSettingsModel_wristTemperatureMeasurementsStatusManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31InternalKaliLiveOnSettingsModel_sleepMeasurementConfigurationProvider));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31InternalKaliLiveOnSettingsModel_sleepStore));
  v3 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31InternalKaliLiveOnSettingsModel__requirements;
  sub_23190AB28(0, &qword_255F47BA8, (uint64_t (*)(uint64_t))sub_231AB6EF0, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDB9EF0]);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
}

@end
