@implementation IntegrationServer

- (_TtC26CalendarIntegrationSupport17IntegrationServer)init
{
  return (_TtC26CalendarIntegrationSupport17IntegrationServer *)IntegrationServer.init()();
}

- (void)startServer
{
  _TtC26CalendarIntegrationSupport17IntegrationServer *v2;

  v2 = self;
  sub_2376BD998((void (*)(uint64_t))sub_2376BD840);

}

- (void)requestRegularSync
{
  sub_2376BD920((char *)self, (uint64_t)a2, (void (*)(os_unfair_lock_s *))sub_2376BDD78);
}

- (void)requestCatchupSync
{
  sub_2376BD920((char *)self, (uint64_t)a2, (void (*)(os_unfair_lock_s *))sub_2376BDD60);
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26CalendarIntegrationSupport17IntegrationServer_deviceLockObserver));
  swift_release();
}

@end
