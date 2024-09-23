@implementation QueryController

- (void)dealloc
{
  _TtC19ExtensionFoundation15QueryController *v2;
  objc_super v3;

  v2 = self;
  sub_190C714D8();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for QueryController();
  -[QueryController dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC19ExtensionFoundation15QueryController_id;
  v4 = sub_190CA84E8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_190C73FB0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC19ExtensionFoundation15QueryController_callbacks), *(_QWORD *)&self->_anon_0[OBJC_IVAR____TtC19ExtensionFoundation15QueryController_callbacks], *(_QWORD *)&self->callbacks[OBJC_IVAR____TtC19ExtensionFoundation15QueryController_callbacks]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19ExtensionFoundation15QueryController_notificationQueue));
}

- (void)resultDidUpdate:(id)a3
{
  id v4;
  _TtC19ExtensionFoundation15QueryController *v5;

  v4 = a3;
  v5 = self;
  sub_190C71A94(v4);

}

- (NSString)description
{
  _TtC19ExtensionFoundation15QueryController *v2;
  void *v3;

  v2 = self;
  sub_190C72858();

  v3 = (void *)sub_190CA85D8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC19ExtensionFoundation15QueryController)init
{
  _TtC19ExtensionFoundation15QueryController *result;

  result = (_TtC19ExtensionFoundation15QueryController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
