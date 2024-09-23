@implementation EGAssembly

- (EGAssembly)init
{
  objc_class *ObjectType;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = OBJC_IVAR___EGAssembly_assemblies;
  sub_1BA1C2804();
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1BA203760;
  v6 = type metadata accessor for EngagementAssembly();
  v7 = swift_allocObject();
  *(_QWORD *)(v5 + 56) = v6;
  *(_QWORD *)(v5 + 64) = sub_1BA1C29A0();
  *(_QWORD *)(v5 + 32) = v7;
  *(Class *)((char *)&self->super.isa + v4) = (Class)v5;
  v9.receiver = self;
  v9.super_class = ObjectType;
  return -[EGAssembly init](&v9, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
