@implementation DUEncodingModelOutput

- (id)copyWithZone:(void *)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void (*v7)(void);
  _TtC21DocumentUnderstanding21DUEncodingModelOutput *v8;
  id v9;
  uint64_t v10;
  _QWORD v12[2];

  v4 = type metadata accessor for DocumentUnderstanding_EncodingModelOutput(0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(void (**)(void))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.isa) + 0x140);
  v8 = self;
  v7();
  v9 = objc_allocWithZone((Class)type metadata accessor for DUEncodingModelOutput());
  v10 = specialized DUEncodingModelOutput.init<A>(proto:)((uint64_t)v6);

  v12[1] = v10;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DUEncodingModelOutput?);
  return (id)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

- (BOOL)isEqual:(id)a3
{
  _TtC21DocumentUnderstanding21DUEncodingModelOutput *v4;
  _TtC21DocumentUnderstanding21DUEncodingModelOutput *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = DUEncodingModelOutput.isEqual(_:)((uint64_t)v8);

  outlined destroy of DocumentUnderstanding_ClientInterface_CalendarEvent?((uint64_t)v8, &demangling cache variable for type metadata for Any?);
  return v6 & 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  _TtC21DocumentUnderstanding21DUEncodingModelOutput *v7;
  void *v8;
  id v9;
  uint64_t v10;

  type metadata accessor for DUEncodingModelOutput();
  lazy protocol witness table accessor for type DUCategoryResult and conformance DUCategoryResult(&lazy protocol witness table cache variable for type DUEncodingModelOutput and conformance DUEncodingModelOutput, v5, (uint64_t (*)(uint64_t))type metadata accessor for DUEncodingModelOutput, (uint64_t)&protocol conformance descriptor for DUEncodingModelOutput);
  v6 = a3;
  v7 = self;
  v8 = (void *)DUProtobufEncodableProtocol.serializedData()();
  if (v8)
  {
    v9 = v8;
    v10 = MEMORY[0x22E2AF8EC](0xD000000000000016, 0x80000002284DABA0);
    objc_msgSend(v6, sel_encodeObject_forKey_, v9, v10);

    v6 = v9;
    v7 = (_TtC21DocumentUnderstanding21DUEncodingModelOutput *)v10;
  }

}

- (_TtC21DocumentUnderstanding21DUEncodingModelOutput)initWithCoder:(id)a3
{
  return (_TtC21DocumentUnderstanding21DUEncodingModelOutput *)DUEncodingModelOutput.init(coder:)(a3);
}

- (_TtC21DocumentUnderstanding21DUEncodingModelOutput)init
{
  _TtC21DocumentUnderstanding21DUEncodingModelOutput *result;

  result = (_TtC21DocumentUnderstanding21DUEncodingModelOutput *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
