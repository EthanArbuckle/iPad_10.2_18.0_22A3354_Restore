@implementation AudioPowerManager

- (void)dealloc
{
  _TtC10DropInCore17AudioPowerManager *v2;

  v2 = self;
  sub_23A7DD538();
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v3 = sub_23A7F1E0C();
  OUTLINED_FUNCTION_357(v3);
  v4 = sub_23A7F1DE8();
  OUTLINED_FUNCTION_357(v4);

  sub_23A77EF5C((uint64_t)self + OBJC_IVAR____TtC10DropInCore17AudioPowerManager_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10DropInCore17AudioPowerManager_audioFrequencyController));
}

- (_TtC10DropInCore17AudioPowerManager)init
{
  sub_23A7DDD9C();
}

- (void)frequencyController:(id)a3 audioPowerChanged:(float)a4 forParticipantWithStreamToken:(int64_t)a5
{
  id v8;
  _TtC10DropInCore17AudioPowerManager *v9;

  v8 = a3;
  v9 = self;
  sub_23A7DDE90(a4, (uint64_t)v9, a5);

}

@end
