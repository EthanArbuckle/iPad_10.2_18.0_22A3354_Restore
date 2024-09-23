@implementation RemoteAlertHandleObserver

- (_TtC13GameOverlayUI25RemoteAlertHandleObserver)init
{
  objc_super v4;

  swift_defaultActor_initialize(self, a2);
  *(_QWORD *)self->map = &_swiftEmptyDictionarySingleton;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for RemoteAlertHandleObserver();
  return -[RemoteAlertHandleObserver init](&v4, "init");
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  id v10;

  v4 = qword_10010BAA0;
  v10 = a3;
  swift_retain(self);
  if (v4 != -1)
    swift_once(&qword_10010BAA0, sub_100004DCC);
  v5 = type metadata accessor for Logger(0);
  v6 = sub_100004E8C(v5, (uint64_t)qword_1001232D8);
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "RemoteAlertHandle did activate.", v9, 2u);
    swift_slowDealloc(v9, -1, -1);
  }
  swift_release(self);

}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4;

  v4 = a3;
  swift_retain(self);
  sub_1000A0208(v4);

  swift_release(self);
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  swift_retain(self);
  v7 = a4;
  sub_1000A0514(v6, (uint64_t)a4);

  swift_release(self);
}

@end
