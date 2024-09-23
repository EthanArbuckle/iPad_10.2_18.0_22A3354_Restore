@implementation AirPlayConnection

- (void)dealloc
{
  objc_class *ObjectType;
  uint64_t v4;
  _TtC10AirPlayKit17AirPlayConnection *v5;
  uint64_t v6;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = qword_255AFE868;
  v5 = self;
  if (v4 != -1)
    swift_once();
  v6 = sub_22A6A5CAC();
  __swift_project_value_buffer(v6, (uint64_t)qword_255B08F18);
  sub_22A629A38(0xD000000000000060, 0x800000022A6AD010, 0x292865736F6C63, 0xE700000000000000);
  objc_msgSend(*(id *)((char *)&v5->super.isa + OBJC_IVAR____TtC10AirPlayKit17AirPlayConnection_connection), sel_close);
  v7.receiver = v5;
  v7.super_class = ObjectType;
  -[AirPlayConnection dealloc](&v7, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  sub_22A62EA00(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10AirPlayKit17AirPlayConnection_onDataReceived));
  sub_22A62EA00(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10AirPlayKit17AirPlayConnection_onClose));
}

- (_TtC10AirPlayKit17AirPlayConnection)init
{
  _TtC10AirPlayKit17AirPlayConnection *result;

  result = (_TtC10AirPlayKit17AirPlayConnection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
