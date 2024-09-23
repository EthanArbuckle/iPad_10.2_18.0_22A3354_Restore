@implementation XPCPublisher

- (void)cancel
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  _TtC11HomeKitCore12XPCPublisher *v7;

  v2 = qword_2559C17E8;
  v7 = self;
  if (v2 != -1)
    swift_once();
  v3 = sub_228866E64();
  __swift_project_value_buffer(v3, (uint64_t)qword_2559C20A0);
  v4 = sub_228866E4C();
  v5 = sub_2288672CC();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2287E6000, v4, v5, "Cancelling subscription", v6, 2u);
    MEMORY[0x22E2B7260](v6, -1, -1);
  }

  (*(void (**)(void))((char *)&v7->super.isa + OBJC_IVAR____TtC11HomeKitCore12XPCPublisher_cancelationHandler))();
}

- (void)dealloc
{
  objc_class *ObjectType;
  uint64_t v4;
  _TtC11HomeKitCore12XPCPublisher *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = qword_2559C17E8;
  v5 = self;
  if (v4 != -1)
    swift_once();
  v6 = sub_228866E64();
  __swift_project_value_buffer(v6, (uint64_t)qword_2559C20A0);
  v7 = sub_228866E4C();
  v8 = sub_2288672CC();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_2287E6000, v7, v8, "Publisher deinit", v9, 2u);
    MEMORY[0x22E2B7260](v9, -1, -1);
  }

  v10.receiver = v5;
  v10.super_class = ObjectType;
  -[XPCPublisher dealloc](&v10, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_release();
}

- (_TtC11HomeKitCore12XPCPublisher)init
{
  _TtC11HomeKitCore12XPCPublisher *result;

  result = (_TtC11HomeKitCore12XPCPublisher *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
