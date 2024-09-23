@implementation LACOnenessSessionMonitorModel

- (BOOL)isMonitoring
{
  return *(Class *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC23LocalAuthenticationCore29LACOnenessSessionMonitorModel_sessionSubscription) != 0;
}

- (BOOL)isSessionActive
{
  _TtC23LocalAuthenticationCore29LACOnenessSessionMonitorModel *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = LACOnenessSessionMonitorModel.isOnenessActive.getter();

  return v3 & 1;
}

- (void)startMonitoring
{
  _TtC23LocalAuthenticationCore29LACOnenessSessionMonitorModel *v2;

  v2 = self;
  LACOnenessSessionMonitorModel.start()();

}

- (void)stopMonitoring
{
  _TtC23LocalAuthenticationCore29LACOnenessSessionMonitorModel *v2;

  v2 = self;
  LACOnenessSessionMonitorModel.stop()();

}

- (void)addObserver:(id)a3
{
  @objc LACOnenessSessionMonitorModel.add(_:)(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))LACOnenessSessionMonitorModel.add(_:));
}

- (void)removeObserver:(id)a3
{
  @objc LACOnenessSessionMonitorModel.add(_:)(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))LACOnenessSessionMonitorModel.remove(_:));
}

- (_TtC23LocalAuthenticationCore29LACOnenessSessionMonitorModel)init
{
  _TtC23LocalAuthenticationCore29LACOnenessSessionMonitorModel *result;

  result = (_TtC23LocalAuthenticationCore29LACOnenessSessionMonitorModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23LocalAuthenticationCore29LACOnenessSessionMonitorModel_observers));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23LocalAuthenticationCore29LACOnenessSessionMonitorModel_replyQueue));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC23LocalAuthenticationCore29LACOnenessSessionMonitorModel_sessionProvider);
  swift_release();
}

@end
