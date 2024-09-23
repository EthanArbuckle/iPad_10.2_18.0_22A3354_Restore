@implementation NXAssembly

- (NXAssembly)init
{
  objc_class *ObjectType;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v13;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = OBJC_IVAR___NXAssembly_assemblies;
  sub_1D5B66484();
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1D5D221B0;
  v6 = type metadata accessor for AnalyticsAssembly();
  v7 = swift_allocObject();
  *(_QWORD *)(v5 + 56) = v6;
  *(_QWORD *)(v5 + 64) = sub_1D5B513B8(&qword_1ED9BF3F8, (uint64_t (*)(uint64_t))type metadata accessor for AnalyticsAssembly, (uint64_t)&unk_1D5D30AE4);
  *(_QWORD *)(v5 + 32) = v7;
  v8 = type metadata accessor for ServiceAssembly();
  v9 = swift_allocObject();
  *(_QWORD *)(v5 + 96) = v8;
  *(_QWORD *)(v5 + 104) = sub_1D5B513B8((unint64_t *)&unk_1ED9BF3C0, (uint64_t (*)(uint64_t))type metadata accessor for ServiceAssembly, (uint64_t)&unk_1D5D203A8);
  *(_QWORD *)(v5 + 72) = v9;
  v10 = type metadata accessor for SessionTrackingAssembly();
  v11 = swift_allocObject();
  *(_QWORD *)(v5 + 136) = v10;
  *(_QWORD *)(v5 + 144) = sub_1D5B513B8(&qword_1ED9BF5B8, (uint64_t (*)(uint64_t))type metadata accessor for SessionTrackingAssembly, (uint64_t)&unk_1D5D27A08);
  *(_QWORD *)(v5 + 112) = v11;
  *(Class *)((char *)&self->super.isa + v4) = (Class)v5;
  v13.receiver = self;
  v13.super_class = ObjectType;
  return -[NXAssembly init](&v13, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
