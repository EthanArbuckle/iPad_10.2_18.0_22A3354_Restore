@implementation DUDebugInfo

- (NSString)debugString
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC21DocumentUnderstanding11DUDebugInfo_debugString);
  swift_beginAccess();
  v4 = *v2;
  v3 = v2[1];
  swift_bridgeObjectRetain();
  v5 = (void *)MEMORY[0x22E2AF8EC](v4, v3);
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (void)setDebugString:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC21DocumentUnderstanding11DUDebugInfo_debugString);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (id)copyWithZone:(void *)a3
{
  _TtC21DocumentUnderstanding11DUDebugInfo *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  DUDebugInfo.copy(with:)(v6);

  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  v4 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v6);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  _TtC21DocumentUnderstanding11DUDebugInfo *v7;
  void *v8;
  id v9;
  uint64_t v10;

  type metadata accessor for DUDebugInfo();
  lazy protocol witness table accessor for type DUCategoryResult and conformance DUCategoryResult(&lazy protocol witness table cache variable for type DUDebugInfo and conformance DUDebugInfo, v5, (uint64_t (*)(uint64_t))type metadata accessor for DUDebugInfo, (uint64_t)&protocol conformance descriptor for DUDebugInfo);
  v6 = a3;
  v7 = self;
  v8 = (void *)DUProtobufEncodableProtocol.serializedData()();
  if (v8)
  {
    v9 = v8;
    v10 = MEMORY[0x22E2AF8EC](0xD000000000000016, 0x80000002284DABA0);
    objc_msgSend(v6, sel_encodeObject_forKey_, v9, v10);

    v6 = v9;
    v7 = (_TtC21DocumentUnderstanding11DUDebugInfo *)v10;
  }

}

- (_TtC21DocumentUnderstanding11DUDebugInfo)initWithCoder:(id)a3
{
  return (_TtC21DocumentUnderstanding11DUDebugInfo *)DUDebugInfo.init(coder:)(a3);
}

- (_TtC21DocumentUnderstanding11DUDebugInfo)init
{
  _QWORD *v2;
  objc_super v4;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21DocumentUnderstanding11DUDebugInfo_debugString);
  *v2 = 0;
  v2[1] = 0xE000000000000000;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DUDebugInfo();
  return -[DUDebugInfo init](&v4, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
