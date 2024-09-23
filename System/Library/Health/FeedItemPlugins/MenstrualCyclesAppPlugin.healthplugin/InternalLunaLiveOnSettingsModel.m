@implementation InternalLunaLiveOnSettingsModel

- (_TtC24MenstrualCyclesAppPlugin31InternalLunaLiveOnSettingsModel)init
{
  _TtC24MenstrualCyclesAppPlugin31InternalLunaLiveOnSettingsModel *result;

  result = (_TtC24MenstrualCyclesAppPlugin31InternalLunaLiveOnSettingsModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31InternalLunaLiveOnSettingsModel_settingsManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31InternalLunaLiveOnSettingsModel_healthStore));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31InternalLunaLiveOnSettingsModel_analysisProvider));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31InternalLunaLiveOnSettingsModel_analysis));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31InternalLunaLiveOnSettingsModel_menstrualCyclesStatusManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31InternalLunaLiveOnSettingsModel_wristTemperatureMeasurementsStatusManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31InternalLunaLiveOnSettingsModel_wristTemperatureInputStatusManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31InternalLunaLiveOnSettingsModel_sleepMeasurementConfigurationProvider));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31InternalLunaLiveOnSettingsModel_sleepStore));
  v3 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31InternalLunaLiveOnSettingsModel__requirements;
  sub_23190AB28(0, &qword_255F47BA8, (uint64_t (*)(uint64_t))sub_231AB6EF0, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDB9EF0]);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
}

- (void)analysisProvider:(id)a3 didUpdateAnalysis:(id)a4
{
  id v6;
  id v7;
  _TtC24MenstrualCyclesAppPlugin31InternalLunaLiveOnSettingsModel *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_231ABCF40(v7);

}

- (void)settingsManagerDidUpdateAnalysisSettings:(id)a3
{
  id v4;
  _TtC24MenstrualCyclesAppPlugin31InternalLunaLiveOnSettingsModel *v5;

  v4 = a3;
  v5 = self;
  sub_231AB5BE8();

}

- (void)sleepStore:(id)a3 sleepSettingsDidChange:(id)a4
{
  id v6;
  id v7;
  _TtC24MenstrualCyclesAppPlugin31InternalLunaLiveOnSettingsModel *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_231ABD1EC((uint64_t)&unk_25009F7D0, (uint64_t)sub_231ABD820, (uint64_t)&unk_25009F7E8);

}

- (void)sleepStore:(id)a3 sleepScheduleDidChange:(id)a4
{
  id v6;
  id v7;
  _TtC24MenstrualCyclesAppPlugin31InternalLunaLiveOnSettingsModel *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_231ABD1EC((uint64_t)&unk_25009F780, (uint64_t)sub_231ABD590, (uint64_t)&unk_25009F798);

}

@end
