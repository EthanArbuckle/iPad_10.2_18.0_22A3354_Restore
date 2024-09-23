@implementation SceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC17AskToMessagesHost13SceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC17AskToMessagesHost13SceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC17AskToMessagesHost13SceneDelegate_window) = (Class)a3;
  v3 = a3;

}

- (_TtC17AskToMessagesHost13SceneDelegate)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC17AskToMessagesHost13SceneDelegate_window) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SceneDelegate();
  return -[SceneDelegate init](&v3, "init");
}

- (void).cxx_destruct
{

}

- (void)scene:willConnectToSession:options:
{
  uint64_t v0;
  os_log_type_t v1;
  uint8_t *v2;
  uint64_t v3;
  NSObject *oslog;
  uint64_t v5;
  uint64_t v6;

  if (qword_10000D170 != -1)
    swift_once(&qword_10000D170, sub_1000048D4);
  v0 = type metadata accessor for Logger(0);
  sub_100004994(v0, (uint64_t)qword_10000D760);
  oslog = Logger.logObject.getter();
  v1 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(oslog, v1))
  {
    v2 = (uint8_t *)swift_slowAlloc(12, -1);
    v3 = swift_slowAlloc(32, -1);
    v6 = v3;
    *(_DWORD *)v2 = 136315138;
    v5 = sub_100004EE4(0xD00000000000001FLL, 0x8000000100005F70, &v6);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v5, &v6, v2 + 4, v2 + 12);
    _os_log_impl((void *)&_mh_execute_header, oslog, v1, "%s", v2, 0xCu);
    swift_arrayDestroy(v3, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v3, -1, -1);
    swift_slowDealloc(v2, -1, -1);

  }
  else
  {

  }
}

@end
