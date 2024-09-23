@implementation CPSimulatedDataCryptor

- (NSUUID)encryptionKeyID
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  Class isa;
  uint64_t v10;

  v3 = type metadata accessor for UUID();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR___CPSimulatedDataCryptor_encryptionKeyID;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
  isa = UUID._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSUUID *)isa;
}

- (void)setEncryptionKeyID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  void (*v9)(char *, char *, uint64_t);
  CPSimulatedDataCryptor *v10;
  uint64_t v11;

  v4 = type metadata accessor for UUID();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = (char *)self + OBJC_IVAR___CPSimulatedDataCryptor_encryptionKeyID;
  swift_beginAccess();
  v9 = *(void (**)(char *, char *, uint64_t))(v5 + 40);
  v10 = self;
  v9(v8, v7, v4);
  swift_endAccess();

}

- (NSArray)decryptionKeyIDSet
{
  Class isa;

  swift_beginAccess();
  type metadata accessor for UUID();
  swift_bridgeObjectRetain();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (void)setDecryptionKeyIDSet:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  type metadata accessor for UUID();
  v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___CPSimulatedDataCryptor_decryptionKeyIDSet);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (id)encryptData:(id)a3 seqNum:(unint64_t)a4 error:(id *)a5
{
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  Class isa;

  if (a3)
  {
    v6 = self;
    v7 = a3;
    v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    v10 = v9;

    isa = Data._bridgeToObjectiveC()().super.isa;
    outlined consume of Data._Representation(v8, v10);
    return isa;
  }
  else
  {
    __break(1u);
  }
  return self;
}

- (id)decryptData:(id)a3 keyID:(id)a4 seqNum:(unint64_t)a5 error:(id *)a6
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  CPSimulatedDataCryptor *v13;
  id v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  id result;
  id v19;
  CPSimulatedDataCryptor *v20;
  uint64_t v21;
  Class isa;
  uint64_t v23;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for UUID?);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    v12 = a4;
    v13 = self;
    v14 = a3;
    a3 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    v16 = v15;

    if (a4)
    {
LABEL_3:
      static UUID._unconditionallyBridgeFromObjectiveC(_:)();

      v17 = type metadata accessor for UUID();
      result = (id)(*(uint64_t (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v11, 0, 1, v17);
      goto LABEL_6;
    }
  }
  else
  {
    v19 = a4;
    v20 = self;
    v16 = 0xF000000000000000;
    if (a4)
      goto LABEL_3;
  }
  v21 = type metadata accessor for UUID();
  result = (id)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v11, 1, 1, v21);
LABEL_6:
  if (v16 >> 60 == 15)
  {
    __break(1u);
  }
  else
  {
    outlined copy of Data._Representation((uint64_t)a3, v16);
    outlined destroy of UUID?((uint64_t)v11);

    outlined consume of Data?((uint64_t)a3, v16);
    isa = Data._bridgeToObjectiveC()().super.isa;
    outlined consume of Data?((uint64_t)a3, v16);
    return isa;
  }
  return result;
}

- (CPSimulatedDataCryptor)init
{
  CPSimulatedDataCryptor *v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v2 = self;
  UUID.init()();
  v3 = OBJC_IVAR___CPSimulatedDataCryptor_decryptionKeyIDSet;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UUID>);
  type metadata accessor for UUID();
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1ACF59E20;
  UUID.init()();
  *(Class *)((char *)&v2->super.isa + v3) = (Class)v4;

  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for SimulatedDataCryptor();
  return -[CPSimulatedDataCryptor init](&v6, sel_init);
}

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return static SimulatedDataCryptor.supportsSecureCoding;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  static SimulatedDataCryptor.supportsSecureCoding = a3;
}

- (CPSimulatedDataCryptor)initWithCoder:(id)a3
{
  id v4;
  CPSimulatedDataCryptor *v5;
  uint64_t v6;
  uint64_t v7;
  CPSimulatedDataCryptor *v8;
  objc_super v10;

  v4 = a3;
  v5 = self;
  UUID.init()();
  v6 = OBJC_IVAR___CPSimulatedDataCryptor_decryptionKeyIDSet;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UUID>);
  type metadata accessor for UUID();
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1ACF59E20;
  UUID.init()();
  *(Class *)((char *)&v5->super.isa + v6) = (Class)v7;

  v10.receiver = v5;
  v10.super_class = (Class)type metadata accessor for SimulatedDataCryptor();
  v8 = -[CPSimulatedDataCryptor init](&v10, sel_init);

  return v8;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR___CPSimulatedDataCryptor_encryptionKeyID;
  v3 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
}

@end
