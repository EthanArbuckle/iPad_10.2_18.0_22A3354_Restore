@implementation Orientation

- (_TtC11DockKitCore11Orientation)init
{
  uint64_t v3;
  objc_class *v4;
  objc_super v6;

  v3 = OBJC_IVAR____TtC11DockKitCore11Orientation_allocatedLock;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D2830);
  v4 = (objc_class *)swift_allocObject();
  *((_DWORD *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.isa + v3) = v4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore11Orientation__yaw) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore11Orientation__pitch) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore11Orientation__roll) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for Orientation();
  return -[Orientation init](&v6, sel_init);
}

- (id)copyWithZone:(void *)a3
{
  return (id)sub_23A5C01B4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_QWORD *__return_ptr))sub_23A68B510);
}

- (NSString)description
{
  _TtC11DockKitCore11Orientation *v2;
  void *v3;

  v2 = self;
  sub_23A68BA80();

  v3 = (void *)sub_23A690E04();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
