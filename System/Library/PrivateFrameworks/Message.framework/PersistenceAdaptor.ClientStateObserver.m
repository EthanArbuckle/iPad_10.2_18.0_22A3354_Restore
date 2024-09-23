@implementation PersistenceAdaptor.ClientStateObserver

- (void)dealloc
{
  _TtCC7Message18PersistenceAdaptor19ClientStateObserver *v2;

  v2 = self;
  sub_1A515AEF4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC7Message18PersistenceAdaptor19ClientStateObserver_queue));
  sub_1A5158AC8();
  sub_1A5138D80((id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC7Message18PersistenceAdaptor19ClientStateObserver_mailboxPersistence));
  swift_weakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC7Message18PersistenceAdaptor19ClientStateObserver_observerQueue));
}

- (_TtCC7Message18PersistenceAdaptor19ClientStateObserver)init
{
  return (_TtCC7Message18PersistenceAdaptor19ClientStateObserver *)sub_1A515C7EC();
}

@end
