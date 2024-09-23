BOOL static RequesterCredentials.Errors.__derived_enum_equals(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void RequesterCredentials.Errors.hash(into:)(uint64_t a1, char a2)
{
  Hasher._combine(_:)(a2 & 1);
}

Swift::Int RequesterCredentials.Errors.hashValue.getter(char a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1 & 1);
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance RequesterCredentials.Errors(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance RequesterCredentials.Errors()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance RequesterCredentials.Errors()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance RequesterCredentials.Errors()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t variable initialization expression of RequesterCredentials.localKey()
{
  return P256.KeyAgreement.PrivateKey.init(compactRepresentable:)();
}

uint64_t RequesterCredentials.localPublicKeyData.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  v0 = type metadata accessor for P256.KeyAgreement.PublicKey();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  P256.KeyAgreement.PrivateKey.publicKey.getter();
  v4 = P256.KeyAgreement.PublicKey.compactRepresentation.getter();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

BOOL RequesterCredentials.isExhausted.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(char *, uint64_t, uint64_t);
  _BOOL8 v16;
  uint64_t v18;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
  v2 = MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v18 - v5;
  v7 = type metadata accessor for RequestKeyAgreement();
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v18 - v11;
  v13 = v0 + OBJC_IVAR____TtC12JoinRequests20RequesterCredentials_keyAgreement;
  swift_beginAccess();
  outlined init with copy of RequestKeyAgreement(v13, (uint64_t)v12);
  outlined init with copy of SymmetricKey?((uint64_t)v12, (uint64_t)v6);
  v14 = type metadata accessor for SymmetricKey();
  v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 48);
  LODWORD(v13) = v15(v6, 1, v14);
  outlined destroy of SymmetricKey?((uint64_t)v6, &demangling cache variable for type metadata for SymmetricKey?);
  outlined init with copy of RequestKeyAgreement((uint64_t)v12, (uint64_t)v10);
  if ((_DWORD)v13 == 1)
  {
    outlined init with copy of SymmetricKey?((uint64_t)&v10[*(int *)(v7 + 20)], (uint64_t)v4);
    outlined destroy of RequestKeyAgreement((uint64_t)v10);
    v16 = v15(v4, 1, v14) == 1;
    outlined destroy of SymmetricKey?((uint64_t)v4, &demangling cache variable for type metadata for SymmetricKey?);
  }
  else
  {
    outlined destroy of RequestKeyAgreement((uint64_t)v10);
    v16 = 0;
  }
  outlined destroy of RequestKeyAgreement((uint64_t)v12);
  return v16;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24267ED70]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t outlined init with copy of RequestKeyAgreement(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RequestKeyAgreement();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with copy of SymmetricKey?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of RequestKeyAgreement(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for RequestKeyAgreement();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t RequesterCredentials.__allocating_init(ownerPublicKey:)(uint64_t a1, unint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  RequesterCredentials.init(ownerPublicKey:)(a1, a2);
  return v4;
}

uint64_t RequesterCredentials.init(ownerPublicKey:)(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  void *v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;

  v32 = type metadata accessor for P256.KeyAgreement.PrivateKey();
  v36 = *(_QWORD *)(v32 - 8);
  MEMORY[0x24BDAC7A8](v32);
  v28 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for RequestKeyAgreement();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for P256.KeyAgreement.PublicKey?);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for P256.KeyAgreement.PublicKey();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v26 - v17;
  v33 = v2;
  v30 = v2 + OBJC_IVAR____TtC12JoinRequests20RequesterCredentials_localKey;
  P256.KeyAgreement.PrivateKey.init(compactRepresentable:)();
  v34 = a1;
  v35 = a2;
  v31 = a1;
  outlined copy of Data._Representation(a1, a2);
  v19 = v29;
  P256.KeyAgreement.PublicKey.init<A>(compactRepresentation:)();
  if (v19)
  {

    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  }
  else
  {
    v20 = (uint64_t)v28;
    v29 = v8;
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v11, 0, 1, v12);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) != 1)
    {
      v27 = a2;
      v24 = v18;
      (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v18, v11, v12);
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v16, v18, v12);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v36 + 16))(v20, v30, v32);
      v25 = (uint64_t)v29;
      RequestKeyAgreement.init(publicKey:privateKey:)((uint64_t)v16, v20, (uint64_t)v29);
      outlined consume of Data._Representation(v31, v27);
      (*(void (**)(char *, uint64_t))(v13 + 8))(v24, v12);
      v22 = v33;
      outlined init with take of RequestKeyAgreement(v25, v33 + OBJC_IVAR____TtC12JoinRequests20RequesterCredentials_keyAgreement);
      return v22;
    }
  }
  outlined destroy of SymmetricKey?((uint64_t)v11, &demangling cache variable for type metadata for P256.KeyAgreement.PublicKey?);
  lazy protocol witness table accessor for type RequesterCredentials.Errors and conformance RequesterCredentials.Errors();
  swift_allocError();
  *v21 = 0;
  swift_willThrow();
  outlined consume of Data._Representation(v31, a2);
  (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v30, v32);
  type metadata accessor for RequesterCredentials();
  v22 = v33;
  swift_deallocPartialClassInstance();
  return v22;
}

uint64_t outlined copy of Data._Representation(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

uint64_t outlined destroy of SymmetricKey?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t lazy protocol witness table accessor for type RequesterCredentials.Errors and conformance RequesterCredentials.Errors()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type RequesterCredentials.Errors and conformance RequesterCredentials.Errors;
  if (!lazy protocol witness table cache variable for type RequesterCredentials.Errors and conformance RequesterCredentials.Errors)
  {
    result = MEMORY[0x24267ED7C](&protocol conformance descriptor for RequesterCredentials.Errors, &type metadata for RequesterCredentials.Errors);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type RequesterCredentials.Errors and conformance RequesterCredentials.Errors);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type RequesterCredentials.Errors and conformance RequesterCredentials.Errors;
  if (!lazy protocol witness table cache variable for type RequesterCredentials.Errors and conformance RequesterCredentials.Errors)
  {
    result = MEMORY[0x24267ED7C](&protocol conformance descriptor for RequesterCredentials.Errors, &type metadata for RequesterCredentials.Errors);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type RequesterCredentials.Errors and conformance RequesterCredentials.Errors);
  }
  return result;
}

uint64_t outlined consume of Data._Representation(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

uint64_t type metadata accessor for RequesterCredentials()
{
  uint64_t result;

  result = type metadata singleton initialization cache for RequesterCredentials;
  if (!type metadata singleton initialization cache for RequesterCredentials)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t outlined init with take of RequestKeyAgreement(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RequestKeyAgreement();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t RequesterCredentials.encrypt(request:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  _BYTE *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;

  v4 = v3;
  v7 = (*(uint64_t (**)(void))(*(_QWORD *)v2 + 120))();
  if (v8 >> 60 == 15)
  {
    if (one-time initialization token for credentials != -1)
      swift_once();
    v9 = type metadata accessor for Logger();
    __swift_project_value_buffer(v9, (uint64_t)static Log.credentials);
    v10 = Logger.logObject.getter();
    v11 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_24019D000, v10, v11, "Failed to derive requester's public key from the locally-generated private key.", v12, 2u);
      MEMORY[0x24267EDD0](v12, -1, -1);
    }

    lazy protocol witness table accessor for type RequesterCredentials.Errors and conformance RequesterCredentials.Errors();
    swift_allocError();
    *v13 = 1;
    swift_willThrow();
  }
  else
  {
    v14 = v7;
    v15 = v8;
    swift_beginAccess();
    v16 = RequestKeyAgreement.encrypt(request:)(a1, a2);
    if (v3)
    {
      swift_endAccess();
      outlined consume of Data?(v14, v15);
    }
    else
    {
      v4 = v16;
      swift_endAccess();
    }
  }
  return v4;
}

uint64_t RequesterCredentials.decrypt(response:)(uint64_t a1, unint64_t a2)
{
  uint64_t v4;

  swift_beginAccess();
  v4 = RequestKeyAgreement.decrypt(response:)(a1, a2);
  swift_endAccess();
  return v4;
}

uint64_t RequesterCredentials.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC12JoinRequests20RequesterCredentials_localKey;
  v2 = type metadata accessor for P256.KeyAgreement.PrivateKey();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  outlined destroy of RequestKeyAgreement(v0 + OBJC_IVAR____TtC12JoinRequests20RequesterCredentials_keyAgreement);
  return v0;
}

uint64_t RequesterCredentials.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC12JoinRequests20RequesterCredentials_localKey;
  v2 = type metadata accessor for P256.KeyAgreement.PrivateKey();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  outlined destroy of RequestKeyAgreement(v0 + OBJC_IVAR____TtC12JoinRequests20RequesterCredentials_keyAgreement);
  return swift_deallocClassInstance();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t variable initialization expression of RequestKeyAgreement.requestKey@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;

  v2 = type metadata accessor for SymmetricKey();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(a1, 1, 1, v2);
}

uint64_t outlined consume of Data?(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return outlined consume of Data._Representation(a1, a2);
  return a1;
}

uint64_t ObjC metadata update function for RequesterCredentials()
{
  return type metadata accessor for RequesterCredentials();
}

uint64_t type metadata completion function for RequesterCredentials()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = type metadata accessor for P256.KeyAgreement.PrivateKey();
  if (v1 <= 0x3F)
  {
    result = type metadata accessor for RequestKeyAgreement();
    if (v2 <= 0x3F)
    {
      result = swift_updateClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for RequesterCredentials.Errors(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for RequesterCredentials.Errors(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_24019F81C + 4 * byte_2401A5605[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_24019F850 + 4 * byte_2401A5600[v4]))();
}

uint64_t sub_24019F850(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24019F858(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24019F860);
  return result;
}

uint64_t sub_24019F86C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24019F874);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_24019F878(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24019F880(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t getEnumTag for RequesterCredentials.Errors(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *destructiveInjectEnumTag for RequesterCredentials.Errors(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for RequesterCredentials.Errors()
{
  return &type metadata for RequesterCredentials.Errors;
}

void RequesterCredentials.keyAgreement.setter()
{
  swift_deletedMethodError();
  __break(1u);
}

uint64_t Log.credentials.unsafeMutableAddressor()
{
  return Log.credentials.unsafeMutableAddressor(&one-time initialization token for credentials, (uint64_t)static Log.credentials);
}

BOOL Subsystem.init(rawValue:)(Swift::String string)
{
  void *object;
  Swift::String v2;
  Swift::Int v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of Subsystem.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  return v3 != 0;
}

unint64_t Subsystem.rawValue.getter()
{
  return 0xD00000000000001CLL;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance Subsystem()
{
  return 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance Subsystem()
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance Subsystem()
{
  return String.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance Subsystem()
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  return Hasher._finalize()();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance Subsystem@<X0>(Swift::String *a1@<X0>, BOOL *a2@<X8>)
{
  Swift::Int v3;
  uint64_t result;

  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of protocol witness for RawRepresentable.init(rawValue:) in conformance Subsystem, *a1);
  result = swift_bridgeObjectRelease();
  *a2 = v3 != 0;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance Subsystem(_QWORD *a1@<X8>)
{
  *a1 = 0xD00000000000001CLL;
  a1[1] = 0x80000002401A5BA0;
}

uint64_t one-time initialization function for credentials()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Log.credentials);
  __swift_project_value_buffer(v0, (uint64_t)static Log.credentials);
  return Logger.init(subsystem:category:)();
}

uint64_t Logger.init<A>(subsystem:category:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  dispatch thunk of RawRepresentable.rawValue.getter();
  Logger.init(subsystem:category:)();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 8))(a1, a4);
}

uint64_t static Log.credentials.getter@<X0>(uint64_t a1@<X8>)
{
  return static Log.credentials.getter(&one-time initialization token for credentials, (uint64_t)static Log.credentials, a1);
}

uint64_t one-time initialization function for service()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Log.service);
  __swift_project_value_buffer(v0, (uint64_t)static Log.service);
  return Logger.init(subsystem:category:)();
}

uint64_t Log.service.unsafeMutableAddressor()
{
  return Log.credentials.unsafeMutableAddressor(&one-time initialization token for service, (uint64_t)static Log.service);
}

uint64_t Log.credentials.unsafeMutableAddressor(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = type metadata accessor for Logger();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t static Log.service.getter@<X0>(uint64_t a1@<X8>)
{
  return static Log.credentials.getter(&one-time initialization token for service, (uint64_t)static Log.service, a1);
}

uint64_t static Log.credentials.getter@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = type metadata accessor for Logger();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t >> prefix<A>(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD v4[4];
  _QWORD v5[2];

  v4[2] = a2;
  type metadata accessor for Optional();
  _sSq3mapyqd_0_Sgqd_0_xqd__YKXEqd__YKs5ErrorRd__Ri_d_0_r0_lF((void (*)(char *, char *))partial apply for closure #1 in >> prefix<A>(_:), (uint64_t)v4, MEMORY[0x24BEE4078], MEMORY[0x24BEE0D00], v2, (uint64_t)v5);
  if (v5[1])
    return v5[0];
  else
    return 7104878;
}

uint64_t partial apply for closure #1 in >> prefix<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return closure #1 in >> prefix<A>(_:)(a1, a2);
}

uint64_t _sSq3mapyqd_0_Sgqd_0_xqd__YKXEqd__YKs5ErrorRd__Ri_d_0_r0_lF@<X0>(void (*a1)(char *, char *)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X6>, uint64_t a6@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, char *);
  uint64_t v28;

  v25 = a5;
  v26 = a2;
  v28 = a4;
  v27 = a1;
  v24 = a3;
  v9 = *(_QWORD *)(a3 - 8);
  v10 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(_QWORD *)(v13 + 16);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v10);
  v18 = (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v21 + 16))(v20, v6);
  v22 = 1;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v20, 1, v14) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v18, v20, v14);
    v27(v18, v12);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
    if (v7)
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(v25, v12, v24);
    v22 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(a6, v22, 1);
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  _QWORD v7[4];
  uint64_t v8;
  unint64_t v9;

  v7[2] = a2;
  type metadata accessor for Optional();
  _sSq3mapyqd_0_Sgqd_0_xqd__YKXEqd__YKs5ErrorRd__Ri_d_0_r0_lF((void (*)(char *, char *))partial apply for closure #1 in DefaultStringInterpolation.appendInterpolation<A>(_:), (uint64_t)v7, MEMORY[0x24BEE4078], MEMORY[0x24BEE0D00], v2, (uint64_t)&v8);
  if (v9)
    v3 = v8;
  else
    v3 = 7104878;
  if (v9)
    v4 = v9;
  else
    v4 = 0xE300000000000000;
  v5 = v4;
  String.append(_:)(*(Swift::String *)&v3);
  return swift_bridgeObjectRelease();
}

uint64_t closure #1 in >> prefix<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;

  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(char *))(v4 + 16))((char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  result = String.init<A>(reflecting:)();
  *a2 = result;
  a2[1] = v6;
  return result;
}

unint64_t lazy protocol witness table accessor for type Subsystem and conformance Subsystem()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Subsystem and conformance Subsystem;
  if (!lazy protocol witness table cache variable for type Subsystem and conformance Subsystem)
  {
    result = MEMORY[0x24267ED7C](&protocol conformance descriptor for Subsystem, &type metadata for Subsystem);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Subsystem and conformance Subsystem);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for Subsystem(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for Subsystem(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_2401A0118 + 4 * asc_2401A56EC[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2401A0138 + 4 * byte_2401A56F1[v4]))();
}

_BYTE *sub_2401A0118(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2401A0138(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2401A0140(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2401A0148(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2401A0150(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2401A0158(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t getEnumTag for Subsystem()
{
  return 0;
}

ValueMetadata *type metadata accessor for Subsystem()
{
  return &type metadata for Subsystem;
}

ValueMetadata *type metadata accessor for Log()
{
  return &type metadata for Log;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t partial apply for closure #1 in DefaultStringInterpolation.appendInterpolation<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return partial apply for closure #1 in >> prefix<A>(_:)(a1, a2);
}

BOOL RequestKeyAgreement.isExhausted.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t (*v12)(char *, uint64_t, uint64_t);
  int v13;
  _BOOL8 v14;
  uint64_t v16;

  v1 = v0;
  v2 = type metadata accessor for RequestKeyAgreement();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v16 - v9;
  outlined init with copy of SymmetricKey?(v1, (uint64_t)&v16 - v9);
  v11 = type metadata accessor for SymmetricKey();
  v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 48);
  v13 = v12(v10, 1, v11);
  outlined destroy of SymmetricKey?((uint64_t)v10, &demangling cache variable for type metadata for SymmetricKey?);
  outlined init with copy of RequestKeyAgreement(v1, (uint64_t)v4);
  if (v13 == 1)
  {
    outlined init with copy of SymmetricKey?((uint64_t)&v4[*(int *)(v2 + 20)], (uint64_t)v8);
    outlined destroy of RequestKeyAgreement((uint64_t)v4);
    v14 = v12(v8, 1, v11) == 1;
    outlined destroy of SymmetricKey?((uint64_t)v8, &demangling cache variable for type metadata for SymmetricKey?);
  }
  else
  {
    outlined destroy of RequestKeyAgreement((uint64_t)v4);
    return 0;
  }
  return v14;
}

uint64_t type metadata accessor for RequestKeyAgreement()
{
  uint64_t result;

  result = type metadata singleton initialization cache for RequestKeyAgreement;
  if (!type metadata singleton initialization cache for RequestKeyAgreement)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t RequestKeyAgreement.init(publicKey:privateKey:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  char *v19;
  void (*v20)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
  MEMORY[0x24BDAC7A8](v6);
  v30 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for SharedSecret();
  v31 = *(_QWORD *)(v8 - 8);
  v32 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for SymmetricKey();
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56);
  v12(a3, 1, 1, v11);
  v13 = a3 + *(int *)(type metadata accessor for RequestKeyAgreement() + 20);
  v12(v13, 1, 1, v11);
  v14 = v35;
  P256.KeyAgreement.PrivateKey.sharedSecretFromKeyAgreement(with:)();
  v35 = v14;
  if (v14)
  {
    v15 = type metadata accessor for P256.KeyAgreement.PrivateKey();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(a2, v15);
    v16 = type metadata accessor for P256.KeyAgreement.PublicKey();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(a1, v16);
    return outlined destroy of RequestKeyAgreement(a3);
  }
  else
  {
    v25 = v13;
    v26 = a3;
    v27 = v12;
    v28 = a2;
    v29 = a1;
    type metadata accessor for SHA256();
    v24 = xmmword_2401A57B0;
    v34 = xmmword_2401A57B0;
    if (one-time initialization token for requestSharedInfo != -1)
      swift_once();
    v33 = static RequestKeyAgreement.requestSharedInfo;
    lazy protocol witness table accessor for type SHA256 and conformance SHA256(&lazy protocol witness table cache variable for type SHA256 and conformance SHA256, (uint64_t (*)(uint64_t))MEMORY[0x24BDC6AF8], MEMORY[0x24BDC6AE8]);
    lazy protocol witness table accessor for type Data and conformance Data();
    v18 = (uint64_t)v30;
    v19 = v10;
    SharedSecret.hkdfDerivedSymmetricKey<A, B, C>(using:salt:sharedInfo:outputByteCount:)();
    v20 = v27;
    v27(v18, 0, 1, v11);
    outlined assign with take of SymmetricKey?(v18, v26);
    v34 = v24;
    v21 = v25;
    if (one-time initialization token for responseSharedInfo != -1)
      swift_once();
    v33 = static RequestKeyAgreement.responseSharedInfo;
    outlined copy of Data._Representation(static RequestKeyAgreement.responseSharedInfo, *((unint64_t *)&static RequestKeyAgreement.responseSharedInfo + 1));
    SharedSecret.hkdfDerivedSymmetricKey<A, B, C>(using:salt:sharedInfo:outputByteCount:)();
    v22 = type metadata accessor for P256.KeyAgreement.PrivateKey();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 8))(v28, v22);
    v23 = type metadata accessor for P256.KeyAgreement.PublicKey();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 8))(v29, v23);
    outlined consume of Data._Representation(v33, *((unint64_t *)&v33 + 1));
    outlined consume of Data._Representation(v34, *((unint64_t *)&v34 + 1));
    (*(void (**)(char *, uint64_t))(v31 + 8))(v19, v32);
    v20(v18, 0, 1, v11);
    return outlined assign with take of SymmetricKey?(v18, v21);
  }
}

uint64_t RequestKeyAgreement.encrypt(request:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  _BYTE *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  os_log_type_t v27;
  uint8_t *v28;
  _BYTE *v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v34 = a1;
  v35 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AES.GCM.Nonce?);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for AES.GCM.SealedBox();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for SymmetricKey();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = v2;
  outlined init with copy of SymmetricKey?(v2, (uint64_t)v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    outlined destroy of SymmetricKey?((uint64_t)v12, &demangling cache variable for type metadata for SymmetricKey?);
    if (one-time initialization token for credentials != -1)
      swift_once();
    v17 = type metadata accessor for Logger();
    __swift_project_value_buffer(v17, (uint64_t)static Log.credentials);
    v18 = Logger.logObject.getter();
    v19 = static os_log_type_t.error.getter();
    v2 = v19;
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_24019D000, v18, (os_log_type_t)v2, "Cannot encrypt request data because request key was already used (exhausted).", v20, 2u);
      MEMORY[0x24267EDD0](v20, -1, -1);
    }

    lazy protocol witness table accessor for type RequestKeyAgreement.Errors and conformance RequestKeyAgreement.Errors();
    swift_allocError();
    *v21 = 0;
    swift_willThrow();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v16, v12, v13);
    v36 = v34;
    v37 = v35;
    v22 = type metadata accessor for AES.GCM.Nonce();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v5, 1, 1, v22);
    lazy protocol witness table accessor for type Data and conformance Data();
    v23 = v38;
    static AES.GCM.seal<A>(_:using:nonce:)();
    if (v23)
    {
      outlined destroy of SymmetricKey?((uint64_t)v5, &demangling cache variable for type metadata for AES.GCM.Nonce?);
    }
    else
    {
      outlined destroy of SymmetricKey?((uint64_t)v5, &demangling cache variable for type metadata for AES.GCM.Nonce?);
      v2 = AES.GCM.SealedBox.combined.getter();
      v25 = v24;
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      if (v25 >> 60 != 15)
      {
        (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
        v31 = v33;
        outlined destroy of SymmetricKey?(v33, &demangling cache variable for type metadata for SymmetricKey?);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56))(v31, 1, 1, v13);
        return v2;
      }
      if (one-time initialization token for credentials != -1)
        swift_once();
      v26 = type metadata accessor for Logger();
      __swift_project_value_buffer(v26, (uint64_t)static Log.credentials);
      v2 = Logger.logObject.getter();
      v27 = static os_log_type_t.error.getter();
      if (os_log_type_enabled((os_log_t)v2, v27))
      {
        v28 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v28 = 0;
        _os_log_impl(&dword_24019D000, (os_log_t)v2, v27, "Failed to encrypt request.", v28, 2u);
        MEMORY[0x24267EDD0](v28, -1, -1);
      }

      lazy protocol witness table accessor for type RequestKeyAgreement.Errors and conformance RequestKeyAgreement.Errors();
      swift_allocError();
      *v29 = 2;
      swift_willThrow();
    }
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  }
  return v2;
}

uint64_t RequestKeyAgreement.decrypt(response:)(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint8_t *v21;
  _BYTE *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  os_log_type_t v26;
  uint8_t *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  _BYTE *v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;

  v3 = v2;
  v37 = type metadata accessor for AES.GCM.SealedBox();
  v6 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v37);
  v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for SymmetricKey();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = v3 + *(int *)(type metadata accessor for RequestKeyAgreement() + 20);
  outlined init with copy of SymmetricKey?(v16, (uint64_t)v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    outlined destroy of SymmetricKey?((uint64_t)v11, &demangling cache variable for type metadata for SymmetricKey?);
    if (one-time initialization token for credentials != -1)
      swift_once();
    v17 = type metadata accessor for Logger();
    __swift_project_value_buffer(v17, (uint64_t)static Log.credentials);
    v18 = Logger.logObject.getter();
    v19 = static os_log_type_t.error.getter();
    v20 = v19;
    if (os_log_type_enabled(v18, v19))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_24019D000, v18, (os_log_type_t)v20, "Cannot decrypt response data because response key was already used (exhausted).", v21, 2u);
      MEMORY[0x24267EDD0](v21, -1, -1);
    }

    lazy protocol witness table accessor for type RequestKeyAgreement.Errors and conformance RequestKeyAgreement.Errors();
    swift_allocError();
    *v22 = 1;
    swift_willThrow();
  }
  else
  {
    v36 = v13;
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v12);
    outlined copy of Data._Representation(a1, a2);
    v23 = v38;
    specialized AES.GCM.SealedBox.init<A>(combined:)(a1, a2);
    if (v23)
    {
      v38 = v15;
      v35 = v12;
      if (one-time initialization token for credentials != -1)
        swift_once();
      v25 = type metadata accessor for Logger();
      __swift_project_value_buffer(v25, (uint64_t)static Log.credentials);
      MEMORY[0x24267ED40](v23);
      MEMORY[0x24267ED40](v23);
      v20 = Logger.logObject.getter();
      v26 = static os_log_type_t.error.getter();
      if (os_log_type_enabled((os_log_t)v20, v26))
      {
        v27 = (uint8_t *)swift_slowAlloc();
        v28 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v27 = 138412290;
        MEMORY[0x24267ED40](v23);
        v29 = _swift_stdlib_bridgeErrorToNSError();
        v39 = v29;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *v28 = v29;

        _os_log_impl(&dword_24019D000, (os_log_t)v20, v26, "Failed to decrypt response data with error: %@", v27, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        swift_arrayDestroy();
        MEMORY[0x24267EDD0](v28, -1, -1);
        MEMORY[0x24267EDD0](v27, -1, -1);
      }
      else
      {

      }
      v30 = v36;
      v31 = v38;

      lazy protocol witness table accessor for type RequestKeyAgreement.Errors and conformance RequestKeyAgreement.Errors();
      swift_allocError();
      *v32 = 3;
      swift_willThrow();

      (*(void (**)(char *, uint64_t))(v30 + 8))(v31, v35);
    }
    else
    {
      v24 = v12;
      v20 = static AES.GCM.open(_:using:)();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v37);
      v34 = v36;
      (*(void (**)(char *, uint64_t))(v36 + 8))(v15, v24);
      outlined destroy of SymmetricKey?(v16, &demangling cache variable for type metadata for SymmetricKey?);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v34 + 56))(v16, 1, 1, v24);
    }
  }
  return v20;
}

BOOL static RequestKeyAgreement.Errors.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

void RequestKeyAgreement.Errors.hash(into:)(uint64_t a1, unsigned __int8 a2)
{
  Hasher._combine(_:)(a2);
}

Swift::Int RequestKeyAgreement.Errors.hashValue.getter(unsigned __int8 a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance RequestKeyAgreement.Errors(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t one-time initialization function for requestSharedInfo()
{
  uint64_t result;
  uint64_t v1;

  result = specialized Data.init<A>(_:)(0xD00000000000001BLL, 0x80000002401A5C80);
  *(_QWORD *)&static RequestKeyAgreement.requestSharedInfo = result;
  *((_QWORD *)&static RequestKeyAgreement.requestSharedInfo + 1) = v1;
  return result;
}

unint64_t lazy protocol witness table accessor for type Data and conformance Data()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Data and conformance Data;
  if (!lazy protocol witness table cache variable for type Data and conformance Data)
  {
    result = MEMORY[0x24267ED7C](MEMORY[0x24BDCDDC0], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Data and conformance Data);
  }
  return result;
}

uint64_t outlined assign with take of SymmetricKey?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t specialized Data.init<A>(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  _BYTE *v5;
  _BYTE *v6;
  unint64_t v7;
  unint64_t v8;
  Swift::Int v9;
  uint64_t v10;
  __int128 v14[2];
  uint64_t v15;
  __int128 v16;
  _QWORD v17[7];

  v17[5] = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v16 = a1;
  *((_QWORD *)&v16 + 1) = a2;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ContiguousBytes);
  if (!swift_dynamicCast())
  {
    v15 = 0;
    memset(v14, 0, sizeof(v14));
    outlined destroy of SymmetricKey?((uint64_t)v14, &demangling cache variable for type metadata for ContiguousBytes?);
    if ((a2 & 0x1000000000000000) != 0)
      goto LABEL_20;
    if ((a2 & 0x2000000000000000) != 0)
    {
      v17[0] = a1;
      v17[1] = a2 & 0xFFFFFFFFFFFFFFLL;
      v4 = (char *)v17 + (HIBYTE(a2) & 0xF);
      v5 = v17;
    }
    else
    {
      if ((a1 & 0x1000000000000000) != 0)
      {
        v2 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        v3 = a1 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        v2 = _StringObject.sharedUTF8.getter();
      }
      if (v2)
        v4 = (_BYTE *)(v2 + v3);
      else
        v4 = 0;
      v5 = (_BYTE *)v2;
    }
    v6 = specialized Data._Representation.init(_:)(v5, v4);
    v8 = v7;
    if (v7 >> 60 != 15)
    {
      swift_bridgeObjectRelease();
      *(_QWORD *)&v14[0] = v6;
      *((_QWORD *)&v14[0] + 1) = v8;
      return *(_QWORD *)&v14[0];
    }
    if ((a2 & 0x1000000000000000) != 0)
    {
LABEL_20:
      v9 = String.UTF8View._foreignCount()();
    }
    else if ((a2 & 0x2000000000000000) != 0)
    {
      v9 = HIBYTE(a2) & 0xF;
    }
    else
    {
      v9 = a1 & 0xFFFFFFFFFFFFLL;
    }
    *(_QWORD *)&v14[0] = specialized Data._Representation.init(count:)(v9);
    *((_QWORD *)&v14[0] + 1) = v10;
    MEMORY[0x24BDAC7A8](*(_QWORD *)&v14[0]);
    specialized Data._Representation.withUnsafeMutableBytes<A>(_:)();
    __asm { BR              X12 }
  }
  outlined init with take of ContiguousBytes(v14, (uint64_t)v17);
  __swift_project_boxed_opaque_existential_1(v17, v17[3]);
  dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
  swift_bridgeObjectRelease();
  v14[0] = v16;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  return *(_QWORD *)&v14[0];
}

void specialized Data.init<A>(_:)(uint64_t a1, uint64_t a2)
{
  char *v2;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x24BDAC8D0];
  v3[3] = MEMORY[0x24BDCDDE8];
  v3[4] = MEMORY[0x24BDCDDC8];
  v3[0] = a1;
  v3[1] = a2;
  v2 = (char *)&loc_2401A1694
     + *((int *)qword_2401A18C8 + (__swift_project_boxed_opaque_existential_1(v3, MEMORY[0x24BDCDDE8])[1] >> 62));
  __asm { BR              X10 }
}

uint64_t sub_2401A16A4()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  __int16 v7;
  char v8;
  char v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;

  v6 = v2;
  v7 = v3;
  v8 = BYTE2(v3);
  v9 = BYTE3(v3);
  v10 = BYTE4(v3);
  v11 = BYTE5(v3);
  outlined copy of Data._Representation(v1, v0);
  closure #1 in Data.init<A>(_:)(&v6, (_BYTE *)&v6 + BYTE6(v3), &v12);
  outlined consume of Data._Representation(v1, v0);
  v4 = v12;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v13);
  return v4;
}

uint64_t one-time initialization function for responseSharedInfo()
{
  uint64_t result;
  uint64_t v1;

  result = specialized Data.init<A>(_:)(0xD00000000000001CLL, 0x80000002401A5C60);
  static RequestKeyAgreement.responseSharedInfo = result;
  unk_256FD86C0 = v1;
  return result;
}

unint64_t lazy protocol witness table accessor for type RequestKeyAgreement.Errors and conformance RequestKeyAgreement.Errors()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type RequestKeyAgreement.Errors and conformance RequestKeyAgreement.Errors;
  if (!lazy protocol witness table cache variable for type RequestKeyAgreement.Errors and conformance RequestKeyAgreement.Errors)
  {
    result = MEMORY[0x24267ED7C](&protocol conformance descriptor for RequestKeyAgreement.Errors, &type metadata for RequestKeyAgreement.Errors);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type RequestKeyAgreement.Errors and conformance RequestKeyAgreement.Errors);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type RequestKeyAgreement.Errors and conformance RequestKeyAgreement.Errors;
  if (!lazy protocol witness table cache variable for type RequestKeyAgreement.Errors and conformance RequestKeyAgreement.Errors)
  {
    result = MEMORY[0x24267ED7C](&protocol conformance descriptor for RequestKeyAgreement.Errors, &type metadata for RequestKeyAgreement.Errors);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type RequestKeyAgreement.Errors and conformance RequestKeyAgreement.Errors);
  }
  return result;
}

void specialized AES.GCM.SealedBox.init<A>(combined:)(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_2401A1990()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  if (BYTE6(v0) > 0x1BuLL)
  {
    outlined copy of Data._Representation(v1, v0);
    specialized Data.init<A>(_:)(v1, v0);
    AES.GCM.SealedBox.init(combined:)();
  }
  else
  {
    v2 = type metadata accessor for CryptoKitError();
    lazy protocol witness table accessor for type SHA256 and conformance SHA256(&lazy protocol witness table cache variable for type CryptoKitError and conformance CryptoKitError, (uint64_t (*)(uint64_t))MEMORY[0x24BDC61A8], MEMORY[0x24BDC61C0]);
    swift_allocError();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v2 - 8) + 104))(v3, *MEMORY[0x24BDC61A0], v2);
    swift_willThrow();
  }
  return outlined consume of Data._Representation(v1, v0);
}

uint64_t RequestKeyAgreement.retrieveKeyPair()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  _BYTE *v18;
  uint64_t v20;
  void (*v21)(void);
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  _BOOL4 v26;
  uint64_t v27;
  uint8_t *v28;
  _BYTE *v29;
  void (*v30)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v31 - v9;
  outlined init with copy of SymmetricKey?(v2, (uint64_t)&v31 - v9);
  v11 = type metadata accessor for SymmetricKey();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
  if (v13(v10, 1, v11) == 1)
  {
    outlined destroy of SymmetricKey?((uint64_t)v10, &demangling cache variable for type metadata for SymmetricKey?);
    if (one-time initialization token for credentials != -1)
      swift_once();
    v14 = type metadata accessor for Logger();
    __swift_project_value_buffer(v14, (uint64_t)static Log.credentials);
    v15 = Logger.logObject.getter();
    v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_24019D000, v15, v16, "Cannot retrieve key pair because request key was already used (exhausted).", v17, 2u);
      MEMORY[0x24267EDD0](v17, -1, -1);
    }

    lazy protocol witness table accessor for type RequestKeyAgreement.Errors and conformance RequestKeyAgreement.Errors();
    swift_allocError();
    *v18 = 0;
    return swift_willThrow();
  }
  else
  {
    v20 = a1;
    v21 = *(void (**)(void))(v12 + 32);
    v32 = v20;
    v21();
    v22 = v2 + *(int *)(type metadata accessor for RequestKeyAgreement() + 20);
    outlined init with copy of SymmetricKey?(v22, (uint64_t)v8);
    if (v13(v8, 1, v11) == 1)
    {
      outlined destroy of SymmetricKey?((uint64_t)v8, &demangling cache variable for type metadata for SymmetricKey?);
      if (one-time initialization token for credentials != -1)
        swift_once();
      v23 = type metadata accessor for Logger();
      __swift_project_value_buffer(v23, (uint64_t)static Log.credentials);
      v24 = Logger.logObject.getter();
      v25 = static os_log_type_t.error.getter();
      v26 = os_log_type_enabled(v24, v25);
      v27 = v32;
      if (v26)
      {
        v28 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v28 = 0;
        _os_log_impl(&dword_24019D000, v24, v25, "Cannot retrieve key pair because response key was already used (exhausted).", v28, 2u);
        MEMORY[0x24267EDD0](v28, -1, -1);
      }

      lazy protocol witness table accessor for type RequestKeyAgreement.Errors and conformance RequestKeyAgreement.Errors();
      swift_allocError();
      *v29 = 1;
      swift_willThrow();
      return (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 8))(v27, v11);
    }
    else
    {
      ((void (*)(uint64_t, char *, uint64_t))v21)(a2, v8, v11);
      outlined destroy of SymmetricKey?(v2, &demangling cache variable for type metadata for SymmetricKey?);
      v30 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56);
      v30(v2, 1, 1, v11);
      outlined destroy of SymmetricKey?(v22, &demangling cache variable for type metadata for SymmetricKey?);
      return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v30)(v22, 1, 1, v11);
    }
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for RequestKeyAgreement(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  unsigned int (*v9)(uint64_t *, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = type metadata accessor for SymmetricKey();
    v8 = *(_QWORD *)(v7 - 8);
    v9 = *(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48);
    if (v9(a2, 1, v7))
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    v12 = *(int *)(a3 + 20);
    v13 = (char *)a1 + v12;
    v14 = (char *)a2 + v12;
    if (v9((uint64_t *)v14, 1, v7))
    {
      v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
      memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v13, v14, v7);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v13, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t destroy for RequestKeyAgreement(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t result;

  v4 = type metadata accessor for SymmetricKey();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (!v6(a1, 1, v4))
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  v7 = a1 + *(int *)(a2 + 20);
  result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v6)(v7, 1, v4);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v7, v4);
  return result;
}

char *initializeWithCopy for RequestKeyAgreement(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int (*v8)(char *, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;

  v6 = type metadata accessor for SymmetricKey();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  if (v8(a2, 1, v6))
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  v10 = *(int *)(a3 + 20);
  v11 = &a1[v10];
  v12 = &a2[v10];
  if (v8(v12, 1, v6))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v11, v12, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v11, 0, 1, v6);
  }
  return a1;
}

char *assignWithCopy for RequestKeyAgreement(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  int v15;
  int v16;
  uint64_t v17;

  v6 = type metadata accessor for SymmetricKey();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
LABEL_7:
  v12 = *(int *)(a3 + 20);
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = v8(&a1[v12], 1, v6);
  v16 = v8(v14, 1, v6);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 24))(v13, v14, v6);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
    goto LABEL_12;
  }
  if (v16)
  {
LABEL_12:
    v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v13, v14, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v13, 0, 1, v6);
  return a1;
}

char *initializeWithTake for RequestKeyAgreement(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int (*v8)(char *, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;

  v6 = type metadata accessor for SymmetricKey();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  if (v8(a2, 1, v6))
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  v10 = *(int *)(a3 + 20);
  v11 = &a1[v10];
  v12 = &a2[v10];
  if (v8(v12, 1, v6))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v11, v12, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v11, 0, 1, v6);
  }
  return a1;
}

char *assignWithTake for RequestKeyAgreement(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  int v15;
  int v16;
  uint64_t v17;

  v6 = type metadata accessor for SymmetricKey();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
LABEL_7:
  v12 = *(int *)(a3 + 20);
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = v8(&a1[v12], 1, v6);
  v16 = v8(v14, 1, v6);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 40))(v13, v14, v6);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
    goto LABEL_12;
  }
  if (v16)
  {
LABEL_12:
    v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v13, v14, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v13, 0, 1, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for RequestKeyAgreement()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2401A25E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for RequestKeyAgreement()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2401A2634(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

void type metadata completion function for RequestKeyAgreement()
{
  unint64_t v0;

  type metadata accessor for SymmetricKey?();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void type metadata accessor for SymmetricKey?()
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for SymmetricKey?)
  {
    type metadata accessor for SymmetricKey();
    v0 = type metadata accessor for Optional();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for SymmetricKey?);
  }
}

uint64_t getEnumTagSinglePayload for RequestKeyAgreement.Errors(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_17;
  if (a2 + 3 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 3) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 3;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 3;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 3;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for RequestKeyAgreement.Errors(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_2401A2810 + 4 * byte_2401A57D5[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_2401A2844 + 4 * byte_2401A57D0[v4]))();
}

uint64_t sub_2401A2844(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2401A284C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2401A2854);
  return result;
}

uint64_t sub_2401A2860(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2401A2868);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_2401A286C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2401A2874(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *destructiveInjectEnumTag for RequestKeyAgreement.Errors(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for RequestKeyAgreement.Errors()
{
  return &type metadata for RequestKeyAgreement.Errors;
}

uint64_t lazy protocol witness table accessor for type SHA256 and conformance SHA256(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x24267ED7C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

void specialized Data._Representation.withUnsafeMutableBytes<A>(_:)()
{
  __asm { BR              X11 }
}

_QWORD *sub_2401A295C@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *(*v3)(_QWORD **__return_ptr, uint64_t *, char *);
  uint64_t v4;
  _QWORD *result;
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  unsigned int v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  unsigned __int8 v12;

  v8 = v4;
  LOWORD(v9) = a1;
  BYTE2(v9) = BYTE2(a1);
  HIBYTE(v9) = BYTE3(a1);
  v10 = BYTE4(a1);
  v11 = BYTE5(a1);
  v12 = BYTE6(a1);
  result = v3(&v7, &v8, (char *)&v8 + BYTE6(a1));
  if (!v2)
    result = v7;
  v6 = v9 | ((unint64_t)v10 << 32) | ((unint64_t)v11 << 40) | ((unint64_t)v12 << 48);
  *v1 = v8;
  v1[1] = v6;
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

_QWORD *_sSw17withMemoryRebound2to_q0_xm_q0_SryxGq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lFs5UInt8V_s5NeverOs16IndexingIteratorVySS8UTF8ViewVG_SitTgm5(_QWORD *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *result;
  uint64_t v6;

  if (a3)
  {
    result = a1(&v6, a3, a4 - a3);
    if (v4)
      return result;
    return (_QWORD *)v6;
  }
  result = a1(&v6, 0, 0);
  if (!v4)
    return (_QWORD *)v6;
  return result;
}

char *specialized __DataStorage.withUnsafeMutableBytes<A>(in:apply:)(uint64_t a1, uint64_t a2, _QWORD *(*a3)(uint64_t *__return_ptr, char *, char *))
{
  uint64_t v3;
  char *result;
  char *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  result = (char *)__DataStorage._bytes.getter();
  if (!result)
    goto LABEL_12;
  v8 = result;
  result = (char *)__DataStorage._offset.getter();
  v9 = a1 - (_QWORD)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  v10 = __OFSUB__(a2, a1);
  v11 = a2 - a1;
  if (v10)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  v12 = __DataStorage._length.getter();
  if (v12 >= v11)
    v13 = v11;
  else
    v13 = v12;
  result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3)
    return (char *)v14;
  return result;
}

uint64_t _StringGuts._slowEnsureMatchingEncoding(_:)(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = a1;
  v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v10 = String.UTF16View.index(_:offsetBy:)();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x24267EB00](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

uint64_t specialized closure #1 in closure #3 in Data.init<A>(_:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  char v3;
  uint64_t v4;

  if (result)
  {
    swift_bridgeObjectRetain();
    result = _StringGuts.copyUTF8(into:)();
    if ((v3 & 1) == 0)
    {
      v4 = result;
      result = swift_bridgeObjectRelease();
      *a2 = 0;
      a2[1] = 0xE000000000000000;
      a2[2] = 15;
      a2[3] = v4;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

_BYTE *specialized Data._Representation.init(_:)(_BYTE *result, _BYTE *a2)
{
  uint64_t v2;

  if (result)
  {
    v2 = a2 - result;
    if (a2 == result)
    {
      return 0;
    }
    else if (v2 <= 14)
    {
      return (_BYTE *)specialized Data.InlineData.init(_:)(result, a2);
    }
    else if ((unint64_t)v2 >= 0x7FFFFFFF)
    {
      return (_BYTE *)specialized Data.LargeSlice.init(_:)((uint64_t)result, (uint64_t)a2);
    }
    else
    {
      return (_BYTE *)specialized Data.InlineSlice.init(_:)((uint64_t)result, (uint64_t)a2);
    }
  }
  return result;
}

uint64_t specialized Data._Representation.init(count:)(uint64_t result)
{
  unint64_t v1;

  if (result)
  {
    v1 = result;
    if (result <= 14)
    {
      if (result < 0)
        __break(1u);
      else
        return 0;
    }
    else
    {
      type metadata accessor for __DataStorage();
      swift_allocObject();
      __DataStorage.init(length:)();
      if (v1 >= 0x7FFFFFFF)
      {
        type metadata accessor for Data.RangeReference();
        result = swift_allocObject();
        *(_QWORD *)(result + 16) = 0;
        *(_QWORD *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

_QWORD *partial apply for specialized closure #3 in Data.init<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  _QWORD v13[2];

  v5 = *(uint64_t **)(v3 + 16);
  v7 = *v5;
  v6 = v5[1];
  v13[0] = v7;
  v13[1] = v6;
  v12[2] = v13;
  result = _sSw17withMemoryRebound2to_q0_xm_q0_SryxGq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lFs5UInt8V_s5NeverOs16IndexingIteratorVySS8UTF8ViewVG_SitTgm5((_QWORD *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))partial apply for specialized closure #1 in closure #3 in Data.init<A>(_:), (uint64_t)v12, a1, a2);
  *a3 = result;
  a3[1] = v9;
  a3[2] = v10;
  a3[3] = v11;
  return result;
}

uint64_t outlined init with take of ContiguousBytes(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t partial apply for specialized closure #1 in closure #3 in Data.init<A>(_:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return specialized closure #1 in closure #3 in Data.init<A>(_:)(a1, a2);
}

uint64_t specialized == infix<A>(_:_:)(char a1, char a2)
{
  BOOL v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0xD000000000000010;
  else
    v3 = 0x72656C676E617257;
  if (v2)
    v4 = 0xE800000000000000;
  else
    v4 = 0x80000002401A5C00;
  if ((a2 & 1) != 0)
    v5 = 0xD000000000000010;
  else
    v5 = 0x72656C676E617257;
  if ((a2 & 1) != 0)
    v6 = 0x80000002401A5C00;
  else
    v6 = 0xE800000000000000;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

Swift::Int specialized RawRepresentable<>.hashValue.getter()
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t specialized RawRepresentable<>.hash(into:)()
{
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int specialized RawRepresentable<>._rawHashValue(seed:)()
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t JoinRequestError.rawValue.getter(char a1)
{
  if (!a1)
    return 0x6E776F6E6B6E75;
  if (a1 == 1)
    return 0xD000000000000018;
  return 0x5564696C61566F6ELL;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance JoinRequestError(char *a1, char *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *a2;
  v3 = JoinRequestError.rawValue.getter(*a1);
  v5 = v4;
  if (v3 == JoinRequestError.rawValue.getter(v2) && v5 == v6)
    v8 = 1;
  else
    v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance JoinRequestError()
{
  char *v0;
  char v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  JoinRequestError.rawValue.getter(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance JoinRequestError()
{
  char *v0;

  JoinRequestError.rawValue.getter(*v0);
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance JoinRequestError()
{
  char *v0;
  char v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  JoinRequestError.rawValue.getter(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance JoinRequestError@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = specialized JoinRequestError.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance JoinRequestError@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = JoinRequestError.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t protocol witness for IDSServiceProtocol.serviceIdentifier.getter in conformance IDSService()
{
  id *v0;
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(*v0, sel_serviceIdentifier);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

uint64_t protocol witness for IDSServiceProtocol.accounts.getter in conformance IDSService()
{
  id *v0;
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(*v0, sel_accounts);
  if (!v1)
    return 0;
  v2 = v1;
  type metadata accessor for IDSAccount();
  lazy protocol witness table accessor for type IDSAccount and conformance NSObject();
  v3 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

id protocol witness for IDSServiceProtocol.pseudonymProperties(withFeatureID:expiryDurationInSeconds:) in conformance IDSService(double a1)
{
  void **v1;
  void *v3;
  void *v4;
  id v5;

  v3 = *v1;
  v4 = (void *)MEMORY[0x24267EAAC]();
  v5 = objc_msgSend(v3, sel_pseudonymPropertiesWithFeatureID_expiryDurationInSeconds_, v4, a1);

  return v5;
}

uint64_t protocol witness for IDSServiceProtocol.provisionPseudonym(for:with:completion:) in conformance IDSService(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void **v4;
  void *v7;
  void *v8;
  _QWORD v10[6];

  v7 = *v4;
  v10[4] = a3;
  v10[5] = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1107296256;
  v10[2] = thunk for @escaping @callee_guaranteed (@guaranteed IDSPseudonym?, @guaranteed Error?) -> ();
  v10[3] = &block_descriptor;
  v8 = _Block_copy(v10);
  swift_retain();
  objc_msgSend(v7, sel_provisionPseudonymForURI_withProperties_completion_, a1, a2, v8);
  _Block_release(v8);
  return swift_release();
}

void thunk for @escaping @callee_guaranteed (@guaranteed IDSPseudonym?, @guaranteed Error?) -> ()(uint64_t a1, void *a2, void *a3)
{
  void (*v5)(void *, void *);
  id v6;
  id v7;

  v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  v7 = a2;
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

unint64_t JoinRequestProvider.serviceName.getter()
{
  return 0xD000000000000030;
}

JoinRequests::JoinRequestProvider_optional __swiftcall JoinRequestProvider.init(rawValue:)(Swift::String rawValue)
{
  void *object;
  Swift::String v2;
  Swift::Int v3;
  JoinRequests::JoinRequestProvider_optional v4;

  object = rawValue._object;
  v2._countAndFlagsBits = rawValue._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of JoinRequestProvider.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 == 1)
    v4.value = JoinRequests_JoinRequestProvider_GroupTestService;
  else
    v4.value = JoinRequests_JoinRequestProvider_unknownDefault;
  if (v3)
    return v4;
  else
    return 0;
}

uint64_t JoinRequestProvider.rawValue.getter(char a1)
{
  if ((a1 & 1) != 0)
    return 0xD000000000000010;
  else
    return 0x72656C676E617257;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance JoinRequestProvider(char *a1, char *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance JoinRequestProvider()
{
  return specialized RawRepresentable<>.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance JoinRequestProvider()
{
  return specialized RawRepresentable<>.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance JoinRequestProvider()
{
  return specialized RawRepresentable<>._rawHashValue(seed:)();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance JoinRequestProvider@<X0>(Swift::String *a1@<X0>, char *a2@<X8>)
{
  Swift::Int v3;
  uint64_t result;
  char v5;

  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of JoinRequestProvider.init(rawValue:), *a1);
  result = swift_bridgeObjectRelease();
  if (v3 == 1)
    v5 = 1;
  else
    v5 = 2;
  if (!v3)
    v5 = 0;
  *a2 = v5;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance JoinRequestProvider@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = JoinRequestProvider.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t specialized JoinRequestError.init(rawValue:)(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of JoinRequestError.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 >= 3)
    return 3;
  else
    return v3;
}

unint64_t lazy protocol witness table accessor for type JoinRequestError and conformance JoinRequestError()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type JoinRequestError and conformance JoinRequestError;
  if (!lazy protocol witness table cache variable for type JoinRequestError and conformance JoinRequestError)
  {
    result = MEMORY[0x24267ED7C](&protocol conformance descriptor for JoinRequestError, &type metadata for JoinRequestError);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JoinRequestError and conformance JoinRequestError);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type JoinRequestProvider and conformance JoinRequestProvider()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type JoinRequestProvider and conformance JoinRequestProvider;
  if (!lazy protocol witness table cache variable for type JoinRequestProvider and conformance JoinRequestProvider)
  {
    result = MEMORY[0x24267ED7C](&protocol conformance descriptor for JoinRequestProvider, &type metadata for JoinRequestProvider);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JoinRequestProvider and conformance JoinRequestProvider);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for JoinRequestError(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for JoinRequestError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_2401A3958 + 4 * byte_2401A58C5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2401A398C + 4 * byte_2401A58C0[v4]))();
}

uint64_t sub_2401A398C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2401A3994(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2401A399CLL);
  return result;
}

uint64_t sub_2401A39A8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2401A39B0);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2401A39B4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2401A39BC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for JoinRequestError()
{
  return &type metadata for JoinRequestError;
}

uint64_t storeEnumTagSinglePayload for JoinRequestProvider(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_2401A3A24 + 4 * byte_2401A58CF[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2401A3A58 + 4 * byte_2401A58CA[v4]))();
}

uint64_t sub_2401A3A58(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2401A3A60(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2401A3A68);
  return result;
}

uint64_t sub_2401A3A74(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2401A3A7CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2401A3A80(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2401A3A88(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for JoinRequestProvider()
{
  return &type metadata for JoinRequestProvider;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

unint64_t type metadata accessor for IDSAccount()
{
  unint64_t result;

  result = lazy cache variable for type metadata for IDSAccount;
  if (!lazy cache variable for type metadata for IDSAccount)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for IDSAccount);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type IDSAccount and conformance NSObject()
{
  unint64_t result;
  unint64_t v1;

  result = lazy protocol witness table cache variable for type IDSAccount and conformance NSObject;
  if (!lazy protocol witness table cache variable for type IDSAccount and conformance NSObject)
  {
    v1 = type metadata accessor for IDSAccount();
    result = MEMORY[0x24267ED7C](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type IDSAccount and conformance NSObject);
  }
  return result;
}

BOOL static OwnerCredentials.Errors.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

void OwnerCredentials.Errors.hash(into:)(uint64_t a1, unsigned __int8 a2)
{
  Hasher._combine(_:)(a2);
}

Swift::Int OwnerCredentials.Errors.hashValue.getter(unsigned __int8 a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

uint64_t OwnerCredentials.publicKeyData.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  v0 = type metadata accessor for P256.KeyAgreement.PublicKey();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  P256.KeyAgreement.PrivateKey.publicKey.getter();
  v4 = P256.KeyAgreement.PublicKey.compactRepresentation.getter();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

uint64_t OwnerCredentials.privateKeyData.getter()
{
  return P256.KeyAgreement.PrivateKey.rawRepresentation.getter();
}

uint64_t OwnerCredentials.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  P256.KeyAgreement.PrivateKey.init(compactRepresentable:)();
  return v0;
}

uint64_t OwnerCredentials.init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v6;

  v1 = type metadata accessor for P256.KeyAgreement.PrivateKey();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  P256.KeyAgreement.PrivateKey.init(compactRepresentable:)();
  (*(void (**)(uint64_t, char *, uint64_t))(v2 + 32))(v0 + OBJC_IVAR____TtC12JoinRequests16OwnerCredentials_privateKey, v4, v1);
  return v0;
}

uint64_t OwnerCredentials.__allocating_init(privateKeyData:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD v11[2];

  v5 = type metadata accessor for P256.KeyAgreement.PrivateKey();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = swift_allocObject();
  v11[0] = a1;
  v11[1] = a2;
  P256.KeyAgreement.PrivateKey.init<A>(rawRepresentation:)();
  if (v2)
    swift_deallocPartialClassInstance();
  else
    (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v9 + OBJC_IVAR____TtC12JoinRequests16OwnerCredentials_privateKey, v8, v5);
  return v9;
}

uint64_t OwnerCredentials.init(privateKeyData:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _QWORD v11[2];

  v6 = type metadata accessor for P256.KeyAgreement.PrivateKey();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11[0] = a1;
  v11[1] = a2;
  P256.KeyAgreement.PrivateKey.init<A>(rawRepresentation:)();
  if (v3)
  {
    type metadata accessor for OwnerCredentials();
    swift_deallocPartialClassInstance();
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v2 + OBJC_IVAR____TtC12JoinRequests16OwnerCredentials_privateKey, v9, v6);
  }
  return v2;
}

uint64_t type metadata accessor for OwnerCredentials()
{
  uint64_t result;

  result = type metadata singleton initialization cache for OwnerCredentials;
  if (!type metadata singleton initialization cache for OwnerCredentials)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t OwnerCredentials.decrypt(request:publicKey:)(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  _BYTE *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(char *, uint64_t, uint64_t);
  char *v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  unint64_t v55;
  unint64_t v56;
  void (*v57)(char *, uint64_t);
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  char *v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  char *v72;
  uint64_t v73;
  unint64_t v74;
  char *v75;

  v72 = (char *)a4;
  v61 = a1;
  v62 = a2;
  v5 = type metadata accessor for AES.GCM.SealedBox();
  v59 = *(_QWORD *)(v5 - 8);
  v60 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v63 = (char *)&v59 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v66 = type metadata accessor for SymmetricKey();
  v64 = *(_QWORD *)(v66 - 8);
  v7 = MEMORY[0x24BDAC7A8](v66);
  v68 = (uint64_t)&v59 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v67 = (uint64_t)&v59 - v10;
  v11 = MEMORY[0x24BDAC7A8](v9);
  v65 = (char *)&v59 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v59 - v13;
  v15 = type metadata accessor for P256.KeyAgreement.PrivateKey();
  v69 = *(_QWORD *)(v15 - 8);
  v70 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v59 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for RequestKeyAgreement();
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v59 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = type metadata accessor for P256.KeyAgreement.PublicKey();
  v22 = *(_QWORD *)(v21 - 8);
  v23 = MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)&v59 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = MEMORY[0x24BDAC7A8](v23);
  v28 = (char *)&v59 - v27;
  MEMORY[0x24BDAC7A8](v26);
  v30 = (char *)&v59 - v29;
  v73 = a3;
  v74 = (unint64_t)v72;
  outlined copy of Data._Representation(a3, (unint64_t)v72);
  v31 = v75;
  P256.KeyAgreement.PublicKey.init<A>(compactRepresentation:)();
  v32 = (uint64_t)v31;
  if (v31)
  {
    if (one-time initialization token for credentials != -1)
      swift_once();
    v33 = type metadata accessor for Logger();
    __swift_project_value_buffer(v33, (uint64_t)static Log.credentials);
    MEMORY[0x24267ED40](v31);
    MEMORY[0x24267ED40](v31);
    v34 = Logger.logObject.getter();
    v35 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v34, v35))
    {
      v36 = (uint8_t *)swift_slowAlloc();
      v37 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v36 = 138412290;
      MEMORY[0x24267ED40](v31);
      v38 = _swift_stdlib_bridgeErrorToNSError();
      v73 = v38;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *v37 = v38;

      _os_log_impl(&dword_24019D000, v34, v35, "Failed to derive public key from requester public key data provided alongside request: %@", v36, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      MEMORY[0x24267EDD0](v37, -1, -1);
      MEMORY[0x24267EDD0](v36, -1, -1);
    }
    else
    {

    }
    lazy protocol witness table accessor for type OwnerCredentials.Errors and conformance OwnerCredentials.Errors();
    swift_allocError();
    *v40 = 0;
    swift_willThrow();

  }
  else
  {
    v75 = v14;
    (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v30, v28, v21);
    (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v25, v30, v21);
    (*(void (**)(char *, char *, uint64_t))(v69 + 16))(v17, &v71[OBJC_IVAR____TtC12JoinRequests16OwnerCredentials_privateKey], v70);
    RequestKeyAgreement.init(publicKey:privateKey:)((uint64_t)v25, (uint64_t)v17, (uint64_t)v20);
    v39 = v21;
    v72 = v30;
    v41 = v67;
    v42 = v68;
    RequestKeyAgreement.retrieveKeyPair()(v67, v68);
    v71 = v20;
    v43 = v64;
    v44 = v41;
    v45 = *(void (**)(char *, uint64_t, uint64_t))(v64 + 32);
    v46 = v75;
    v47 = v66;
    v45(v75, v44, v66);
    v48 = v65;
    v45(v65, v42, v47);
    v50 = v61;
    v49 = v62;
    outlined copy of Data._Representation(v61, v62);
    v51 = v63;
    specialized AES.GCM.SealedBox.init<A>(combined:)(v50, v49);
    v52 = v48;
    v53 = v43;
    v32 = static AES.GCM.open(_:using:)();
    v56 = v55;
    (*(void (**)(char *, uint64_t))(v59 + 8))(v51, v60);
    outlined copy of Data._Representation(v32, v56);
    SymmetricKey.withUnsafeBytes<A>(_:)();
    outlined consume of Data._Representation(v32, v56);
    v69 = v39;
    v70 = v22;
    v57 = *(void (**)(char *, uint64_t))(v53 + 8);
    v58 = v66;
    v57(v52, v66);
    v57(v46, v58);
    outlined destroy of RequestKeyAgreement((uint64_t)v71);
    (*(void (**)(char *, uint64_t))(v70 + 8))(v72, v69);
  }
  return v32;
}

unint64_t lazy protocol witness table accessor for type OwnerCredentials.Errors and conformance OwnerCredentials.Errors()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OwnerCredentials.Errors and conformance OwnerCredentials.Errors;
  if (!lazy protocol witness table cache variable for type OwnerCredentials.Errors and conformance OwnerCredentials.Errors)
  {
    result = MEMORY[0x24267ED7C](&protocol conformance descriptor for OwnerCredentials.Errors, &type metadata for OwnerCredentials.Errors);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OwnerCredentials.Errors and conformance OwnerCredentials.Errors);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OwnerCredentials.Errors and conformance OwnerCredentials.Errors;
  if (!lazy protocol witness table cache variable for type OwnerCredentials.Errors and conformance OwnerCredentials.Errors)
  {
    result = MEMORY[0x24267ED7C](&protocol conformance descriptor for OwnerCredentials.Errors, &type metadata for OwnerCredentials.Errors);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OwnerCredentials.Errors and conformance OwnerCredentials.Errors);
  }
  return result;
}

NSObject *OwnerCredentials.encrypt(response:responseKeyData:)(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  os_log_type_t v26;
  uint8_t *v27;
  _BYTE *v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AES.GCM.Nonce?);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for AES.GCM.SealedBox();
  v30 = *(_QWORD *)(v11 - 8);
  v31 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for SymmetricKey();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = a3;
  v33 = a4;
  outlined copy of Data._Representation(a3, a4);
  v18 = MEMORY[0x24BDCDDE8];
  SymmetricKey.init<A>(data:)();
  v32 = a1;
  v33 = a2;
  v19 = type metadata accessor for AES.GCM.Nonce();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v10, 1, 1, v19);
  lazy protocol witness table accessor for type Data and conformance Data();
  v20 = v34;
  static AES.GCM.seal<A>(_:using:nonce:)();
  if (v20)
  {
    outlined destroy of AES.GCM.Nonce?((uint64_t)v10);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  }
  else
  {
    v21 = v15;
    v22 = v14;
    outlined destroy of AES.GCM.Nonce?((uint64_t)v10);
    v18 = AES.GCM.SealedBox.combined.getter();
    v24 = v23;
    (*(void (**)(char *, uint64_t))(v30 + 8))(v13, v31);
    if (v24 >> 60 == 15)
    {
      if (one-time initialization token for credentials != -1)
        swift_once();
      v25 = type metadata accessor for Logger();
      __swift_project_value_buffer(v25, (uint64_t)static Log.credentials);
      v18 = Logger.logObject.getter();
      v26 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v18, v26))
      {
        v27 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v27 = 0;
        _os_log_impl(&dword_24019D000, v18, v26, "Failed to encrypt response.", v27, 2u);
        MEMORY[0x24267EDD0](v27, -1, -1);
      }

      lazy protocol witness table accessor for type OwnerCredentials.Errors and conformance OwnerCredentials.Errors();
      swift_allocError();
      *v28 = 2;
      swift_willThrow();
      (*(void (**)(char *, uint64_t))(v21 + 8))(v17, v22);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v21 + 8))(v17, v22);
    }
  }
  return v18;
}

uint64_t OwnerCredentials.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC12JoinRequests16OwnerCredentials_privateKey;
  v2 = type metadata accessor for P256.KeyAgreement.PrivateKey();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t OwnerCredentials.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC12JoinRequests16OwnerCredentials_privateKey;
  v2 = type metadata accessor for P256.KeyAgreement.PrivateKey();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t outlined destroy of AES.GCM.Nonce?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AES.GCM.Nonce?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t ObjC metadata update function for OwnerCredentials()
{
  return type metadata accessor for OwnerCredentials();
}

uint64_t type metadata completion function for OwnerCredentials()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for P256.KeyAgreement.PrivateKey();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for OwnerCredentials.Errors(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_2401A4C48 + 4 * byte_2401A5AE5[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_2401A4C7C + 4 * asc_2401A5AE0[v4]))();
}

uint64_t sub_2401A4C7C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2401A4C84(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2401A4C8CLL);
  return result;
}

uint64_t sub_2401A4C98(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2401A4CA0);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_2401A4CA4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2401A4CAC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for OwnerCredentials.Errors()
{
  return &type metadata for OwnerCredentials.Errors;
}

uint64_t SymmetricKey.rawRepresentation.getter()
{
  uint64_t v1;

  SymmetricKey.withUnsafeBytes<A>(_:)();
  return v1;
}

uint64_t SymmetricKey.init<A>(rawRepresentation:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v4 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, a2);
  SymmetricKey.init<A>(data:)();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, a2);
}

uint64_t closure #1 in SymmetricKey.rawRepresentation.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  _QWORD *v4;
  _BYTE *v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[5];

  v14[3] = MEMORY[0x24BEE0F88];
  v14[4] = MEMORY[0x24BDCFB90];
  v14[0] = a1;
  v14[1] = a2;
  v4 = __swift_project_boxed_opaque_existential_1(v14, MEMORY[0x24BEE0F88]);
  v5 = (_BYTE *)*v4;
  if (*v4 && (v6 = (_BYTE *)v4[1], v7 = v6 - v5, v6 != v5))
  {
    if (v7 <= 14)
    {
      v8 = specialized Data.InlineData.init(_:)(v5, v6);
      v9 = v12 & 0xFFFFFFFFFFFFFFLL;
    }
    else if ((unint64_t)v7 >= 0x7FFFFFFF)
    {
      v8 = specialized Data.LargeSlice.init(_:)((uint64_t)v5, (uint64_t)v6);
      v9 = v13 | 0x8000000000000000;
    }
    else
    {
      v8 = specialized Data.InlineSlice.init(_:)((uint64_t)v5, (uint64_t)v6);
      v9 = v11 | 0x4000000000000000;
    }
  }
  else
  {
    v8 = 0;
    v9 = 0xC000000000000000;
  }
  result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  *a3 = v8;
  a3[1] = v9;
  return result;
}

_BYTE *closure #1 in Data.init<A>(_:)@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (!result)
    goto LABEL_4;
  v4 = a2 - result;
  if (a2 == result)
  {
    result = 0;
LABEL_4:
    v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    result = (_BYTE *)specialized Data.InlineData.init(_:)(result, a2);
    v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    result = (_BYTE *)specialized Data.LargeSlice.init(_:)((uint64_t)result, (uint64_t)a2);
    v5 = v8 | 0x8000000000000000;
  }
  else
  {
    result = (_BYTE *)specialized Data.InlineSlice.init(_:)((uint64_t)result, (uint64_t)a2);
    v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

uint64_t specialized Data.InlineData.init(_:)(_BYTE *__src, _BYTE *a2)
{
  unint64_t v2;
  _BYTE __dst[14];
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (__src)
    v2 = a2 - __src;
  else
    v2 = 0;
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF)
    goto LABEL_11;
  memset(__dst, 0, sizeof(__dst));
  v5 = v2;
  if (__src && a2 != __src)
    memcpy(__dst, __src, a2 - __src);
  return *(_QWORD *)__dst;
}

uint64_t specialized Data.LargeSlice.init(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  type metadata accessor for __DataStorage();
  swift_allocObject();
  result = __DataStorage.init(bytes:length:)();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    type metadata accessor for Data.RangeReference();
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = v2;
  }
  return result;
}

uint64_t specialized Data.InlineSlice.init(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  type metadata accessor for __DataStorage();
  swift_allocObject();
  __DataStorage.init(bytes:length:)();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0)
    return v2 << 32;
LABEL_10:
  __break(1u);
  return __DataStorage.init(bytes:length:copy:deallocator:offset:)();
}

uint64_t __DataStorage.init(bytes:length:copy:deallocator:offset:)()
{
  return MEMORY[0x24BDCBBA0]();
}

uint64_t __DataStorage.init(bytes:length:)()
{
  return MEMORY[0x24BDCBBB0]();
}

uint64_t __DataStorage._bytes.getter()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t __DataStorage.init(length:)()
{
  return MEMORY[0x24BDCBBD0]();
}

uint64_t __DataStorage._length.getter()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t __DataStorage._offset.getter()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t type metadata accessor for __DataStorage()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)()
{
  return MEMORY[0x24BDCC1E0]();
}

Swift::Void __swiftcall Data.LargeSlice.ensureUniqueReference()()
{
  MEMORY[0x24BDCDB60]();
}

uint64_t type metadata accessor for Data.RangeReference()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t Data._Representation.replaceSubrange(_:with:count:)()
{
  return MEMORY[0x24BDCDC28]();
}

uint64_t Data._Representation.append(contentsOf:)()
{
  return MEMORY[0x24BDCDC40]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t Logger.init(subsystem:category:)()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t type metadata accessor for CryptoKitError()
{
  return MEMORY[0x24BDC61A8]();
}

uint64_t SharedSecret.hkdfDerivedSymmetricKey<A, B, C>(using:salt:sharedInfo:outputByteCount:)()
{
  return MEMORY[0x24BDC6370]();
}

uint64_t type metadata accessor for SharedSecret()
{
  return MEMORY[0x24BDC6380]();
}

uint64_t SymmetricKey.withUnsafeBytes<A>(_:)()
{
  return MEMORY[0x24BDC63A0]();
}

uint64_t SymmetricKey.init<A>(data:)()
{
  return MEMORY[0x24BDC63B0]();
}

uint64_t type metadata accessor for SymmetricKey()
{
  return MEMORY[0x24BDC63E0]();
}

uint64_t static AES.GCM.open(_:using:)()
{
  return MEMORY[0x24BDC6580]();
}

uint64_t static AES.GCM.seal<A>(_:using:nonce:)()
{
  return MEMORY[0x24BDC65A8]();
}

uint64_t type metadata accessor for AES.GCM.Nonce()
{
  return MEMORY[0x24BDC65D0]();
}

uint64_t AES.GCM.SealedBox.combined.getter()
{
  return MEMORY[0x24BDC6620]();
}

uint64_t AES.GCM.SealedBox.init(combined:)()
{
  return MEMORY[0x24BDC6628]();
}

uint64_t type metadata accessor for AES.GCM.SealedBox()
{
  return MEMORY[0x24BDC6638]();
}

uint64_t P256.KeyAgreement.PublicKey.compactRepresentation.getter()
{
  return MEMORY[0x24BDC68A0]();
}

uint64_t P256.KeyAgreement.PublicKey.init<A>(compactRepresentation:)()
{
  return MEMORY[0x24BDC68A8]();
}

uint64_t type metadata accessor for P256.KeyAgreement.PublicKey()
{
  return MEMORY[0x24BDC68D0]();
}

uint64_t P256.KeyAgreement.PrivateKey.sharedSecretFromKeyAgreement(with:)()
{
  return MEMORY[0x24BDC68F0]();
}

uint64_t P256.KeyAgreement.PrivateKey.publicKey.getter()
{
  return MEMORY[0x24BDC68F8]();
}

uint64_t P256.KeyAgreement.PrivateKey.rawRepresentation.getter()
{
  return MEMORY[0x24BDC6910]();
}

uint64_t P256.KeyAgreement.PrivateKey.init<A>(rawRepresentation:)()
{
  return MEMORY[0x24BDC6918]();
}

uint64_t P256.KeyAgreement.PrivateKey.init(compactRepresentable:)()
{
  return MEMORY[0x24BDC6940]();
}

uint64_t type metadata accessor for P256.KeyAgreement.PrivateKey()
{
  return MEMORY[0x24BDC6968]();
}

uint64_t type metadata accessor for SHA256()
{
  return MEMORY[0x24BDC6AF8]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x24BDCF9E0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t String.init<A>(reflecting:)()
{
  return MEMORY[0x24BEE0A10]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x24BEE0B20]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
  MEMORY[0x24BEE0BC0](a1._countAndFlagsBits, a1._object);
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x24BEE2838]();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x24BEE3290](cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t Error._getEmbeddedNSError()()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t Error._code.getter()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t Error._domain.getter()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t Error._userInfo.getter()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x24BEE42E0]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
  MEMORY[0x24BEE42F8](a1);
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x24BEE4328]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x24BEE4C28]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

