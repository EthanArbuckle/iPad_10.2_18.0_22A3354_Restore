@implementation SleepMeasurementsConfigurationProvider

- (_TtC24MenstrualCyclesAppPlugin38SleepMeasurementsConfigurationProvider)init
{
  _TtC24MenstrualCyclesAppPlugin38SleepMeasurementsConfigurationProvider *result;

  result = (_TtC24MenstrualCyclesAppPlugin38SleepMeasurementsConfigurationProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin38SleepMeasurementsConfigurationProvider_sleepStore));
  v3 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin38SleepMeasurementsConfigurationProvider_logger;
  v4 = sub_231C9FA6C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  v5 = (char *)self
     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin38SleepMeasurementsConfigurationProvider_configurationPublisher;
  sub_2319F4C14();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

- (void)sleepStore:(id)a3 sleepEventRecordDidChange:(id)a4
{
  id v6;
  id v7;
  _TtC24MenstrualCyclesAppPlugin38SleepMeasurementsConfigurationProvider *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_231B31A08(v6, v7);

}

- (void)sleepStore:(id)a3 sleepFocusConfigurationDidUpdate:(id)a4
{
  id v6;
  id v7;
  _TtC24MenstrualCyclesAppPlugin38SleepMeasurementsConfigurationProvider *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_231B323D4((uint64_t)v6);

}

@end
