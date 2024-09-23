@implementation DeviceNotification

- (unint64_t)state
{
  uint64_t v3;
  os_unfair_lock_s *v4;
  _TtC11DockKitCore18DeviceNotification *v5;
  unint64_t *v6;
  unint64_t v7;
  os_unfair_lock_s *v8;

  v3 = OBJC_IVAR____TtC11DockKitCore18DeviceNotification_allocatedLock;
  v4 = *(os_unfair_lock_s **)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore18DeviceNotification_allocatedLock);
  v5 = self;
  swift_retain();
  os_unfair_lock_lock(v4 + 4);
  swift_release();
  v6 = (unint64_t *)((char *)v5 + OBJC_IVAR____TtC11DockKitCore18DeviceNotification__state);
  notify_get_state(*(_DWORD *)((char *)&v5->super.isa + OBJC_IVAR____TtC11DockKitCore18DeviceNotification_token), (uint64_t *)((char *)v5 + OBJC_IVAR____TtC11DockKitCore18DeviceNotification__state));
  v7 = *v6;
  v8 = *(os_unfair_lock_s **)((char *)&self->super.isa + v3);
  swift_retain();
  os_unfair_lock_unlock(v8 + 4);

  swift_release();
  return v7;
}

- (void)setState:(unint64_t)a3
{
  _TtC11DockKitCore18DeviceNotification *v4;

  v4 = self;
  DeviceNotification.state.setter(a3);

}

- (_TtC11DockKitCore18DeviceNotification)initWithName:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_23A690E1C();
  return (_TtC11DockKitCore18DeviceNotification *)DeviceNotification.init(name:)(v3, v4);
}

- (_TtC11DockKitCore18DeviceNotification)initWithName:(id)a3 queue:(id)a4 handler:(id)a5
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  char *v12;

  v6 = _Block_copy(a5);
  v7 = sub_23A690E1C();
  v9 = v8;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v6;
  v11 = a4;
  v12 = sub_23A630880(v7, v9, v11, (uint64_t)sub_23A630BF4, v10);

  return (_TtC11DockKitCore18DeviceNotification *)v12;
}

- (void)dealloc
{
  objc_class *ObjectType;
  int v4;
  _TtC11DockKitCore18DeviceNotification *v5;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore18DeviceNotification_token);
  v5 = self;
  if (v4 != -1)
    notify_cancel(v4);
  v6.receiver = v5;
  v6.super_class = ObjectType;
  -[DeviceNotification dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC11DockKitCore18DeviceNotification_logger;
  v4 = sub_23A690D14();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
}

- (_TtC11DockKitCore18DeviceNotification)init
{
  _TtC11DockKitCore18DeviceNotification *result;

  result = (_TtC11DockKitCore18DeviceNotification *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
