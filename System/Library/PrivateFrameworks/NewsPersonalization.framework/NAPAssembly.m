@implementation NAPAssembly

- (NAPAssembly)init
{
  objc_class *ObjectType;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = OBJC_IVAR___NAPAssembly_assemblies;
  sub_1D5B66484();
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1D5D20550;
  v6 = type metadata accessor for SuggestionsAssembly();
  v7 = swift_allocObject();
  *(_QWORD *)(v5 + 56) = v6;
  *(_QWORD *)(v5 + 64) = sub_1D5B513B8(qword_1ED9BCFA0, (uint64_t (*)(uint64_t))type metadata accessor for SuggestionsAssembly, (uint64_t)&unk_1D5D31E64);
  *(_QWORD *)(v5 + 32) = v7;
  v8 = type metadata accessor for TabiAssembly();
  v9 = swift_allocObject();
  *(_QWORD *)(v5 + 96) = v8;
  *(_QWORD *)(v5 + 104) = sub_1D5B513B8((unint64_t *)&unk_1ED9BCDC0, (uint64_t (*)(uint64_t))type metadata accessor for TabiAssembly, (uint64_t)&unk_1D5D32284);
  *(_QWORD *)(v5 + 72) = v9;
  *(Class *)((char *)&self->super.isa + v4) = (Class)v5;
  v11.receiver = self;
  v11.super_class = ObjectType;
  return -[NAPAssembly init](&v11, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
