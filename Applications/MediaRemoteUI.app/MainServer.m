@implementation MainServer

- (_TtC13MediaRemoteUI10MainServer)init
{
  _TtC13MediaRemoteUI10MainServer *v2;
  uint64_t v3;
  objc_super v5;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13MediaRemoteUI10MainServer_clientConnectionManager) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MainServer();
  v2 = -[MainServer init](&v5, "init");
  v3 = static os_log_type_t.default.getter(v2);
  if (qword_1000589C0 != -1)
    swift_once(&qword_1000589C0, sub_10001E320);
  os_log(_:dso:log:_:_:)(v3, &_mh_execute_header, qword_10005B240, "[MainServer] init", 17, 2, _swiftEmptyArrayStorage);

  return v2;
}

- (void).cxx_destruct
{

}

@end
