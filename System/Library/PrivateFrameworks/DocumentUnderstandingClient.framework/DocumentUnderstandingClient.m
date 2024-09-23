void sub_23A6CAD58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

const char *DocumentUnderstandingFeatureFlags.domain.getter()
{
  return "DocumentUnderstanding";
}

uint64_t DocumentUnderstandingFeatureFlags.feature.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(const char *, uint64_t))((char *)sub_23A6CCB24 + 4 * byte_23A6CFF50[a1]))("BackboneModel", 13);
}

const char *sub_23A6CCB24()
{
  return "TopicClassificationModel";
}

const char *sub_23A6CCB38()
{
  return "CategoryClassificationModel";
}

const char *sub_23A6CCB4C()
{
  return "FoundInModels";
}

const char *sub_23A6CCB60()
{
  return "IndexNonfileDocuments";
}

const char *sub_23A6CCB74()
{
  return "SearchAndOrganizationDocumentIngest";
}

const char *sub_23A6CCB88()
{
  return "AutonamingFromMessages";
}

BOOL static DocumentUnderstandingFeatureFlags.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

void DocumentUnderstandingFeatureFlags.hash(into:)(uint64_t a1, unsigned __int8 a2)
{
  Hasher._combine(_:)(a2);
}

Swift::Int DocumentUnderstandingFeatureFlags.hashValue.getter(unsigned __int8 a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance DocumentUnderstandingFeatureFlags(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance DocumentUnderstandingFeatureFlags()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance DocumentUnderstandingFeatureFlags()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance DocumentUnderstandingFeatureFlags()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

const char *protocol witness for FeatureFlagsKey.domain.getter in conformance DocumentUnderstandingFeatureFlags()
{
  return "DocumentUnderstanding";
}

uint64_t protocol witness for FeatureFlagsKey.feature.getter in conformance DocumentUnderstandingFeatureFlags()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(const char *, uint64_t))((char *)sub_23A6CCD10 + 4 * byte_23A6CFF57[*v0]))("BackboneModel", 13);
}

const char *sub_23A6CCD10()
{
  return "TopicClassificationModel";
}

const char *sub_23A6CCD24()
{
  return "CategoryClassificationModel";
}

const char *sub_23A6CCD38()
{
  return "FoundInModels";
}

const char *sub_23A6CCD4C()
{
  return "IndexNonfileDocuments";
}

const char *sub_23A6CCD60()
{
  return "SearchAndOrganizationDocumentIngest";
}

const char *sub_23A6CCD74()
{
  return "AutonamingFromMessages";
}

void *DocumentUnderstandingFeatureFlagReader.isBackboneModelEnabled.unsafeMutableAddressor()
{
  return &static DocumentUnderstandingFeatureFlagReader.isBackboneModelEnabled;
}

uint64_t static DocumentUnderstandingFeatureFlagReader.isBackboneModelEnabled.getter()
{
  return 0;
}

void *DocumentUnderstandingFeatureFlagReader.isTopicClassificationModelEnabled.unsafeMutableAddressor()
{
  return &static DocumentUnderstandingFeatureFlagReader.isTopicClassificationModelEnabled;
}

uint64_t static DocumentUnderstandingFeatureFlagReader.isTopicClassificationModelEnabled.getter()
{
  return 0;
}

void *DocumentUnderstandingFeatureFlagReader.isCategoryClassificationModelEnabled.unsafeMutableAddressor()
{
  return &static DocumentUnderstandingFeatureFlagReader.isCategoryClassificationModelEnabled;
}

uint64_t static DocumentUnderstandingFeatureFlagReader.isCategoryClassificationModelEnabled.getter()
{
  return 0;
}

uint64_t one-time initialization function for isFoundInModelsEnabled()
{
  char v0;
  uint64_t result;
  char v2[24];
  ValueMetadata *v3;
  unint64_t v4;

  v3 = &type metadata for DocumentUnderstandingFeatureFlags;
  v4 = lazy protocol witness table accessor for type DocumentUnderstandingFeatureFlags and conformance DocumentUnderstandingFeatureFlags();
  v2[0] = 3;
  v0 = isFeatureEnabled(_:)();
  result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  static DocumentUnderstandingFeatureFlagReader.isFoundInModelsEnabled = v0 & 1;
  return result;
}

char *DocumentUnderstandingFeatureFlagReader.isFoundInModelsEnabled.unsafeMutableAddressor()
{
  if (one-time initialization token for isFoundInModelsEnabled != -1)
    swift_once();
  return &static DocumentUnderstandingFeatureFlagReader.isFoundInModelsEnabled;
}

uint64_t static DocumentUnderstandingFeatureFlagReader.isFoundInModelsEnabled.getter()
{
  if (one-time initialization token for isFoundInModelsEnabled != -1)
    swift_once();
  return static DocumentUnderstandingFeatureFlagReader.isFoundInModelsEnabled;
}

void *DocumentUnderstandingFeatureFlagReader.isIndexNonfileDocumentsEnabled.unsafeMutableAddressor()
{
  return &static DocumentUnderstandingFeatureFlagReader.isIndexNonfileDocumentsEnabled;
}

uint64_t static DocumentUnderstandingFeatureFlagReader.isIndexNonfileDocumentsEnabled.getter()
{
  return 0;
}

void *DocumentUnderstandingFeatureFlagReader.isSearchAndOrganizationDocumentIngestEnabled.unsafeMutableAddressor()
{
  return &static DocumentUnderstandingFeatureFlagReader.isSearchAndOrganizationDocumentIngestEnabled;
}

uint64_t static DocumentUnderstandingFeatureFlagReader.isSearchAndOrganizationDocumentIngestEnabled.getter()
{
  return 0;
}

void *DocumentUnderstandingFeatureFlagReader.isAutonamingFromMessagesEnabled.unsafeMutableAddressor()
{
  return &static DocumentUnderstandingFeatureFlagReader.isAutonamingFromMessagesEnabled;
}

uint64_t static DocumentUnderstandingFeatureFlagReader.isAutonamingFromMessagesEnabled.getter()
{
  return 0;
}

id DocumentUnderstandingFeatureFlagReader.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id DocumentUnderstandingFeatureFlagReader.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DocumentUnderstandingFeatureFlagReader();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for DocumentUnderstandingFeatureFlagReader()
{
  return objc_opt_self();
}

id DocumentUnderstandingFeatureFlagReader.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DocumentUnderstandingFeatureFlagReader();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t lazy protocol witness table accessor for type DocumentUnderstandingFeatureFlags and conformance DocumentUnderstandingFeatureFlags()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type DocumentUnderstandingFeatureFlags and conformance DocumentUnderstandingFeatureFlags;
  if (!lazy protocol witness table cache variable for type DocumentUnderstandingFeatureFlags and conformance DocumentUnderstandingFeatureFlags)
  {
    result = MEMORY[0x23B8541E8](&protocol conformance descriptor for DocumentUnderstandingFeatureFlags, &type metadata for DocumentUnderstandingFeatureFlags);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DocumentUnderstandingFeatureFlags and conformance DocumentUnderstandingFeatureFlags);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type DocumentUnderstandingFeatureFlags and conformance DocumentUnderstandingFeatureFlags;
  if (!lazy protocol witness table cache variable for type DocumentUnderstandingFeatureFlags and conformance DocumentUnderstandingFeatureFlags)
  {
    result = MEMORY[0x23B8541E8](&protocol conformance descriptor for DocumentUnderstandingFeatureFlags, &type metadata for DocumentUnderstandingFeatureFlags);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DocumentUnderstandingFeatureFlags and conformance DocumentUnderstandingFeatureFlags);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for DocumentUnderstandingFeatureFlags(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFA)
    goto LABEL_17;
  if (a2 + 6 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 6) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 6;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 6;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 6;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 7;
  v8 = v6 - 7;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for DocumentUnderstandingFeatureFlags(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 6 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 6) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFA)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF9)
    return ((uint64_t (*)(void))((char *)&loc_23A6CD15C + 4 * byte_23A6CFF63[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_23A6CD190 + 4 * byte_23A6CFF5E[v4]))();
}

uint64_t sub_23A6CD190(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A6CD198(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A6CD1A0);
  return result;
}

uint64_t sub_23A6CD1AC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A6CD1B4);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_23A6CD1B8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A6CD1C0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t getEnumTag for DocumentUnderstandingFeatureFlags(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *destructiveInjectEnumTag for DocumentUnderstandingFeatureFlags(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for DocumentUnderstandingFeatureFlags()
{
  return &type metadata for DocumentUnderstandingFeatureFlags;
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

uint64_t DUProtobufEncodableProtocol.init(serializedData:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v23 = a4;
  type metadata accessor for BinaryDecodingOptions();
  MEMORY[0x24BDAC7A8]();
  swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v20 - v7;
  v9 = type metadata accessor for Optional();
  v21 = *(_QWORD *)(v9 - 8);
  v22 = v9;
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v20 - v10;
  v12 = MEMORY[0x23B853CE4](a1);
  v14 = v13;
  v26 = 0;
  v24 = 0u;
  v25 = 0u;
  outlined copy of Data._Representation(v12, v13);
  swift_getAssociatedConformanceWitness();
  BinaryDecodingOptions.init()();
  Message.init(serializedData:extensions:partial:options:)();
  (*(void (**)(char *, uint64_t, uint64_t))(a3 + 32))(v8, a2, a3);

  outlined consume of Data._Representation(v12, v14);
  v15 = *(_QWORD *)(a2 - 8);
  v16 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 48))(v11, 1, a2);
  v17 = v23;
  if (v16)
  {
    (*(void (**)(char *, uint64_t))(v21 + 8))(v11, v22);
    v18 = 1;
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v15 + 32))(v23, v11, a2);
    v18 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56))(v17, v18, 1, a2);
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

NSData_optional __swiftcall DUProtobufEncodableProtocol.serializedData()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  Class isa;
  objc_class *v13;
  Swift::Bool v14;
  objc_class *v15;
  uint64_t v16;
  NSData_optional result;

  v2 = v1;
  v3 = v0;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v16 - v6;
  (*(void (**)(uint64_t, uint64_t))(v2 + 24))(v3, v2);
  swift_getAssociatedConformanceWitness();
  v8 = Message.serializedData(partial:)();
  v10 = v9;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, AssociatedTypeWitness);
  v11 = objc_allocWithZone(MEMORY[0x24BDBCE50]);
  isa = Data._bridgeToObjectiveC()().super.isa;
  v13 = (objc_class *)objc_msgSend(v11, sel_initWithData_, isa);
  outlined consume of Data._Representation(v8, v10);

  v15 = v13;
  result.value.super.isa = v15;
  result.is_nil = v14;
  return result;
}

uint64_t DUProtobufEncodableProtocol.init(jsonString:options:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v26 = a1;
  v27 = a2;
  v28 = a6;
  v9 = type metadata accessor for JSONDecodingOptions();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8]();
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8]();
  v14 = (char *)&v23 - v13;
  v15 = type metadata accessor for Optional();
  v24 = *(_QWORD *)(v15 - 8);
  v25 = v15;
  MEMORY[0x24BDAC7A8]();
  v17 = (char *)&v23 - v16;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a3, v9);
  swift_getAssociatedConformanceWitness();
  Message.init(jsonString:options:)();
  (*(void (**)(char *, uint64_t, uint64_t))(a5 + 32))(v14, a4, a5);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a3, v9);
  v18 = *(_QWORD *)(a4 - 8);
  v19 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48))(v17, 1, a4);
  v20 = v28;
  if (v19)
  {
    (*(void (**)(char *, uint64_t))(v24 + 8))(v17, v25);
    v21 = 1;
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v18 + 32))(v28, v17, a4);
    v21 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 56))(v20, v21, 1, a4);
}

uint64_t DUProtobufEncodableProtocol.jsonString(options:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v11 - v7;
  (*(void (**)(uint64_t, uint64_t))(a3 + 24))(a2, a3);
  swift_getAssociatedConformanceWitness();
  v9 = Message.jsonString(options:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, AssociatedTypeWitness);
  return v9;
}

uint64_t DUProtobufEncodableProtocol.init(jsonUTF8Data:options:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v29 = a1;
  v30 = a2;
  v33 = a6;
  v9 = type metadata accessor for JSONDecodingOptions();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8]();
  v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8]();
  v14 = (char *)&v26 - v13;
  v15 = type metadata accessor for Optional();
  v27 = *(_QWORD *)(v15 - 8);
  v28 = v15;
  MEMORY[0x24BDAC7A8]();
  v17 = (char *)&v26 - v16;
  v31 = v10;
  v32 = a3;
  v18 = a3;
  v19 = v29;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v18, v9);
  v20 = v30;
  outlined copy of Data._Representation(v19, v30);
  swift_getAssociatedConformanceWitness();
  Message.init(jsonUTF8Data:options:)();
  (*(void (**)(char *, uint64_t, uint64_t))(a5 + 32))(v14, a4, a5);
  outlined consume of Data._Representation(v19, v20);
  (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v32, v9);
  v21 = *(_QWORD *)(a4 - 8);
  v22 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v21 + 48))(v17, 1, a4);
  v23 = v33;
  if (v22)
  {
    (*(void (**)(char *, uint64_t))(v27 + 8))(v17, v28);
    v24 = 1;
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v21 + 32))(v33, v17, a4);
    v24 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v21 + 56))(v23, v24, 1, a4);
}

uint64_t DUProtobufEncodableProtocol.jsonUTF8Data(options:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v13 - v8;
  (*(void (**)(uint64_t, uint64_t))(a3 + 24))(a2, a3);
  swift_getAssociatedConformanceWitness();
  v10 = Message.jsonUTF8Data(options:)();
  if (v3)
  {

    v11 = 0;
  }
  else
  {
    v11 = v10;
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, AssociatedTypeWitness);
  return v11;
}

uint64_t one-time initialization function for supportedUTTypes()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;

  v0 = type metadata accessor for UTType();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v2);
  v7 = (char *)&v22 - v6;
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v22 - v8;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_23A6D00E0;
  static UTType.pdf.getter();
  v11 = UTType.identifier.getter();
  v13 = v12;
  v14 = *(void (**)(char *, uint64_t))(v1 + 8);
  v14(v9, v0);
  *(_QWORD *)(v10 + 32) = v11;
  *(_QWORD *)(v10 + 40) = v13;
  static UTType.plainText.getter();
  v15 = UTType.identifier.getter();
  v17 = v16;
  v14(v7, v0);
  *(_QWORD *)(v10 + 48) = v15;
  *(_QWORD *)(v10 + 56) = v17;
  static UTType.rtf.getter();
  v18 = UTType.identifier.getter();
  v20 = v19;
  result = ((uint64_t (*)(char *, uint64_t))v14)(v4, v0);
  *(_QWORD *)(v10 + 64) = v18;
  *(_QWORD *)(v10 + 72) = v20;
  *(_QWORD *)(v10 + 80) = 0xD00000000000001ELL;
  *(_QWORD *)(v10 + 88) = 0x800000023A6D0E20;
  *(_QWORD *)(v10 + 96) = 0xD00000000000002CLL;
  *(_QWORD *)(v10 + 104) = 0x800000023A6D0E40;
  *(_QWORD *)(v10 + 112) = 0xD000000000000016;
  *(_QWORD *)(v10 + 120) = 0x800000023A6D0E70;
  *(_QWORD *)(v10 + 128) = 0xD00000000000001FLL;
  *(_QWORD *)(v10 + 136) = 0x800000023A6D0E90;
  *(_QWORD *)(v10 + 144) = 0xD000000000000026;
  *(_QWORD *)(v10 + 152) = 0x800000023A6D0EB0;
  *(_QWORD *)(v10 + 160) = 0xD000000000000017;
  *(_QWORD *)(v10 + 168) = 0x800000023A6D0EE0;
  *(_QWORD *)(v10 + 176) = 0xD00000000000001BLL;
  *(_QWORD *)(v10 + 184) = 0x800000023A6D0F00;
  *(_QWORD *)(v10 + 192) = 0xD00000000000002ELL;
  *(_QWORD *)(v10 + 200) = 0x800000023A6D0F20;
  *(_QWORD *)(v10 + 208) = 0xD00000000000001CLL;
  *(_QWORD *)(v10 + 216) = 0x800000023A6D0F50;
  static DUIngestableFiletypes.supportedUTTypes = v10;
  return result;
}

uint64_t *DUIngestableFiletypes.supportedUTTypes.unsafeMutableAddressor()
{
  if (one-time initialization token for supportedUTTypes != -1)
    swift_once();
  return &static DUIngestableFiletypes.supportedUTTypes;
}

uint64_t static DUIngestableFiletypes.supportedUTTypes.getter()
{
  return static DUIngestableFiletypes.supportedUTTypes.getter(&one-time initialization token for supportedUTTypes);
}

uint64_t one-time initialization function for wrappedSupportedUTTypes()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t result;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  void (*v15)(char *, char *, uint64_t);
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  char *v20;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UTType?);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v19 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for UTType();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v19 - v9;
  if (one-time initialization token for supportedUTTypes != -1)
    result = swift_once();
  v11 = static DUIngestableFiletypes.supportedUTTypes;
  v12 = *(_QWORD *)(static DUIngestableFiletypes.supportedUTTypes + 16);
  if (v12)
  {
    swift_bridgeObjectRetain_n();
    v19 = v11;
    v13 = v11 + 40;
    v14 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v20 = v7;
    do
    {
      swift_bridgeObjectRetain_n();
      UTType.init(_:)();
      swift_bridgeObjectRelease();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
      {
        outlined destroy of UTType?((uint64_t)v2);
      }
      else
      {
        v15 = *(void (**)(char *, char *, uint64_t))(v4 + 32);
        v15(v10, v2, v3);
        v15(v7, v10, v3);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v14 = (_QWORD *)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v14[2] + 1, 1, v14);
        v17 = v14[2];
        v16 = v14[3];
        if (v17 >= v16 >> 1)
          v14 = (_QWORD *)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v16 > 1, v17 + 1, 1, v14);
        v14[2] = v17 + 1;
        v18 = (unint64_t)v14
            + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))
            + *(_QWORD *)(v4 + 72) * v17;
        v7 = v20;
        v15((char *)v18, v20, v3);
      }
      v13 += 16;
      --v12;
    }
    while (v12);
    result = swift_bridgeObjectRelease_n();
  }
  else
  {
    v14 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  static DUIngestableFiletypes.wrappedSupportedUTTypes = (uint64_t)v14;
  return result;
}

uint64_t *DUIngestableFiletypes.wrappedSupportedUTTypes.unsafeMutableAddressor()
{
  if (one-time initialization token for wrappedSupportedUTTypes != -1)
    swift_once();
  return &static DUIngestableFiletypes.wrappedSupportedUTTypes;
}

uint64_t static DUIngestableFiletypes.wrappedSupportedUTTypes.getter()
{
  return static DUIngestableFiletypes.supportedUTTypes.getter(&one-time initialization token for wrappedSupportedUTTypes);
}

uint64_t one-time initialization function for supportedFileExtensions()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  if (one-time initialization token for officeFileExtensions != -1)
    swift_once();
  v0 = static DUIngestableFiletypes.officeFileExtensions;
  if (one-time initialization token for iWorkFileExtensions != -1)
    swift_once();
  swift_bridgeObjectRetain();
  v1 = swift_bridgeObjectRetain();
  specialized Array.append<A>(contentsOf:)(v1);
  if (one-time initialization token for pdfFileExtensions != -1)
    swift_once();
  swift_bridgeObjectRetain();
  v2 = swift_bridgeObjectRetain();
  specialized Array.append<A>(contentsOf:)(v2);
  swift_bridgeObjectRelease();
  if (one-time initialization token for jsonFileExtensions != -1)
    swift_once();
  swift_bridgeObjectRetain();
  v3 = swift_bridgeObjectRetain();
  specialized Array.append<A>(contentsOf:)(v3);
  swift_bridgeObjectRelease();
  if (one-time initialization token for txtFileExtensions != -1)
    swift_once();
  swift_bridgeObjectRetain();
  v4 = swift_bridgeObjectRetain();
  specialized Array.append<A>(contentsOf:)(v4);
  swift_bridgeObjectRelease();
  if (one-time initialization token for emlFileExtensions != -1)
    swift_once();
  swift_bridgeObjectRetain();
  v5 = swift_bridgeObjectRetain();
  specialized Array.append<A>(contentsOf:)(v5);
  result = swift_bridgeObjectRelease();
  static DUIngestableFiletypes.supportedFileExtensions = v0;
  return result;
}

uint64_t *DUIngestableFiletypes.officeFileExtensions.unsafeMutableAddressor()
{
  if (one-time initialization token for officeFileExtensions != -1)
    swift_once();
  return &static DUIngestableFiletypes.officeFileExtensions;
}

uint64_t *DUIngestableFiletypes.iWorkFileExtensions.unsafeMutableAddressor()
{
  if (one-time initialization token for iWorkFileExtensions != -1)
    swift_once();
  return &static DUIngestableFiletypes.iWorkFileExtensions;
}

uint64_t *DUIngestableFiletypes.pdfFileExtensions.unsafeMutableAddressor()
{
  if (one-time initialization token for pdfFileExtensions != -1)
    swift_once();
  return &static DUIngestableFiletypes.pdfFileExtensions;
}

uint64_t *DUIngestableFiletypes.jsonFileExtensions.unsafeMutableAddressor()
{
  if (one-time initialization token for jsonFileExtensions != -1)
    swift_once();
  return &static DUIngestableFiletypes.jsonFileExtensions;
}

uint64_t *DUIngestableFiletypes.txtFileExtensions.unsafeMutableAddressor()
{
  if (one-time initialization token for txtFileExtensions != -1)
    swift_once();
  return &static DUIngestableFiletypes.txtFileExtensions;
}

uint64_t *DUIngestableFiletypes.emlFileExtensions.unsafeMutableAddressor()
{
  if (one-time initialization token for emlFileExtensions != -1)
    swift_once();
  return &static DUIngestableFiletypes.emlFileExtensions;
}

uint64_t *DUIngestableFiletypes.supportedFileExtensions.unsafeMutableAddressor()
{
  if (one-time initialization token for supportedFileExtensions != -1)
    swift_once();
  return &static DUIngestableFiletypes.supportedFileExtensions;
}

uint64_t static DUIngestableFiletypes.supportedFileExtensions.getter()
{
  return static DUIngestableFiletypes.supportedUTTypes.getter(&one-time initialization token for supportedFileExtensions);
}

uint64_t static DUIngestableFiletypes.isFileURLSupported(_:)()
{
  Swift::String v0;
  char v1;

  URL.pathExtension.getter();
  v0 = String.lowercased()();
  swift_bridgeObjectRelease();
  if (one-time initialization token for supportedFileExtensions != -1)
    swift_once();
  v1 = specialized Sequence<>.contains(_:)(v0._countAndFlagsBits, (uint64_t)v0._object, (_QWORD *)static DUIngestableFiletypes.supportedFileExtensions);
  swift_bridgeObjectRelease();
  return v1 & 1;
}

uint64_t specialized Sequence<>.contains(_:)(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t result;
  _QWORD *v9;
  uint64_t i;
  uint64_t v11;
  BOOL v12;

  v3 = a3[2];
  if (!v3)
    return 0;
  if (a3[4] == a1 && a3[5] == a2)
    return 1;
  result = _stringCompareWithSmolCheck(_:_:expecting:)();
  if ((result & 1) != 0)
    return 1;
  if (v3 == 1)
    return 0;
  v9 = a3 + 7;
  for (i = 1; ; ++i)
  {
    v11 = i + 1;
    if (__OFADD__(i, 1))
      break;
    v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      return 1;
    result = 0;
    v9 += 2;
    if (v11 == v3)
      return result;
  }
  __break(1u);
  return result;
}

const char *DUIngestableFiletypes.icloudFileExtension.unsafeMutableAddressor()
{
  return "icloud";
}

uint64_t static DUIngestableFiletypes.icloudFileExtension.getter()
{
  return 0x64756F6C6369;
}

void one-time initialization function for officeFileExtensions()
{
  static DUIngestableFiletypes.officeFileExtensions = (uint64_t)&outlined read-only object #0 of one-time initialization function for officeFileExtensions;
}

uint64_t static DUIngestableFiletypes.officeFileExtensions.getter()
{
  return static DUIngestableFiletypes.supportedUTTypes.getter(&one-time initialization token for officeFileExtensions);
}

void one-time initialization function for iWorkFileExtensions()
{
  static DUIngestableFiletypes.iWorkFileExtensions = (uint64_t)&outlined read-only object #0 of one-time initialization function for iWorkFileExtensions;
}

uint64_t static DUIngestableFiletypes.iWorkFileExtensions.getter()
{
  return static DUIngestableFiletypes.supportedUTTypes.getter(&one-time initialization token for iWorkFileExtensions);
}

void one-time initialization function for pdfFileExtensions()
{
  static DUIngestableFiletypes.pdfFileExtensions = (uint64_t)&outlined read-only object #0 of one-time initialization function for pdfFileExtensions;
}

uint64_t static DUIngestableFiletypes.pdfFileExtensions.getter()
{
  return static DUIngestableFiletypes.supportedUTTypes.getter(&one-time initialization token for pdfFileExtensions);
}

void one-time initialization function for jsonFileExtensions()
{
  static DUIngestableFiletypes.jsonFileExtensions = (uint64_t)&outlined read-only object #0 of one-time initialization function for jsonFileExtensions;
}

uint64_t static DUIngestableFiletypes.jsonFileExtensions.getter()
{
  return static DUIngestableFiletypes.supportedUTTypes.getter(&one-time initialization token for jsonFileExtensions);
}

void one-time initialization function for txtFileExtensions()
{
  static DUIngestableFiletypes.txtFileExtensions = (uint64_t)&outlined read-only object #0 of one-time initialization function for txtFileExtensions;
}

uint64_t static DUIngestableFiletypes.txtFileExtensions.getter()
{
  return static DUIngestableFiletypes.supportedUTTypes.getter(&one-time initialization token for txtFileExtensions);
}

void one-time initialization function for emlFileExtensions()
{
  static DUIngestableFiletypes.emlFileExtensions = (uint64_t)&outlined read-only object #0 of one-time initialization function for emlFileExtensions;
}

uint64_t static DUIngestableFiletypes.emlFileExtensions.getter()
{
  return static DUIngestableFiletypes.supportedUTTypes.getter(&one-time initialization token for emlFileExtensions);
}

uint64_t static DUIngestableFiletypes.supportedUTTypes.getter(_QWORD *a1)
{
  if (*a1 != -1)
    swift_once();
  return swift_bridgeObjectRetain();
}

Class @objc static DUIngestableFiletypes.supportedUTTypes.getter(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  Class isa;

  if (*a3 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

id DUIngestableFiletypes.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id DUIngestableFiletypes.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DUIngestableFiletypes();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for DUIngestableFiletypes()
{
  return objc_opt_self();
}

id DUIngestableFiletypes.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DUIngestableFiletypes();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

size_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(size_t result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  unint64_t v16;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<UTType>);
  v10 = *(_QWORD *)(type metadata accessor for UTType() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_29;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  v15 = *(_QWORD *)(type metadata accessor for UTType() - 8);
  if ((v5 & 1) != 0)
  {
    if (v13 < a4
      || (v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(_QWORD *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v13;
}

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t specialized Array.append<A>(contentsOf:)(uint64_t result)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  int64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  int64_t v10;

  v2 = *(_QWORD *)(result + 16);
  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v6 = result;
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)result && v5 <= *(_QWORD *)(v3 + 24) >> 1)
  {
    if (*(_QWORD *)(v6 + 16))
      goto LABEL_5;
    goto LABEL_13;
  }
  if (v4 <= v5)
    v10 = v4 + v2;
  else
    v10 = v4;
  result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)result, v10, 1, (char *)v3);
  v3 = result;
  if (!*(_QWORD *)(v6 + 16))
  {
LABEL_13:
    if (!v2)
      goto LABEL_14;
    goto LABEL_16;
  }
LABEL_5:
  if ((*(_QWORD *)(v3 + 24) >> 1) - *(_QWORD *)(v3 + 16) < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  result = swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    result = swift_bridgeObjectRelease();
    *v1 = v3;
    return result;
  }
  v7 = *(_QWORD *)(v3 + 16);
  v8 = __OFADD__(v7, v2);
  v9 = v7 + v2;
  if (!v8)
  {
    *(_QWORD *)(v3 + 16) = v9;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B8541DC]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t outlined destroy of UTType?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UTType?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t URL.pathExtension.getter()
{
  return MEMORY[0x24BDCD810]();
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t Data.init(referencing:)()
{
  return MEMORY[0x24BDCDBE8]();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)MEMORY[0x24BDCDCA0]();
}

uint64_t isFeatureEnabled(_:)()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t type metadata accessor for JSONDecodingOptions()
{
  return MEMORY[0x24BE5BF98]();
}

uint64_t BinaryDecodingOptions.init()()
{
  return MEMORY[0x24BE5BFC0]();
}

uint64_t type metadata accessor for BinaryDecodingOptions()
{
  return MEMORY[0x24BE5BFC8]();
}

uint64_t Message.jsonString(options:)()
{
  return MEMORY[0x24BE5C188]();
}

uint64_t Message.init(jsonString:options:)()
{
  return MEMORY[0x24BE5C190]();
}

uint64_t Message.jsonUTF8Data(options:)()
{
  return MEMORY[0x24BE5C198]();
}

uint64_t Message.init(jsonUTF8Data:options:)()
{
  return MEMORY[0x24BE5C1A0]();
}

uint64_t Message.init(serializedData:extensions:partial:options:)()
{
  return MEMORY[0x24BE5C1B8]();
}

uint64_t Message.serializedData(partial:)()
{
  return MEMORY[0x24BE5C1C0]();
}

uint64_t UTType.identifier.getter()
{
  return MEMORY[0x24BEE6190]();
}

uint64_t static UTType.pdf.getter()
{
  return MEMORY[0x24BEE6270]();
}

uint64_t static UTType.rtf.getter()
{
  return MEMORY[0x24BEE6280]();
}

uint64_t static UTType.plainText.getter()
{
  return MEMORY[0x24BEE63B0]();
}

uint64_t type metadata accessor for UTType()
{
  return MEMORY[0x24BEE63B8]();
}

uint64_t UTType.init(_:)()
{
  return MEMORY[0x24BEE6410]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x24BDCF9E0]();
}

Swift::String __swiftcall String.lowercased()()
{
  uint64_t v0;
  void *v1;
  Swift::String result;

  v0 = MEMORY[0x24BEE0A08]();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x24BDCFBA8]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x24BEE3A30]();
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

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _exit(int a1)
{
  MEMORY[0x24BDACAC8](*(_QWORD *)&a1);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

int fileno(FILE *a1)
{
  return MEMORY[0x24BDAE390](a1);
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x24BDAE710](a1);
}

uid_t getuid(void)
{
  return MEMORY[0x24BDAE788]();
}

int isatty(int a1)
{
  return MEMORY[0x24BDAE8E0](*(_QWORD *)&a1);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8C0](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x24BDAF8C8](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x24BDAF9F8](a1);
}

int setuid(uid_t a1)
{
  return MEMORY[0x24BDAFD88](*(_QWORD *)&a1);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x24BEE4BA8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x24BEE4BB0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
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

void xpc_connection_activate(xpc_connection_t connection)
{
  MEMORY[0x24BDB0710](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x24BDB0740](name, targetq, flags);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x24BDB07A8](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

uint64_t xpc_connection_set_target_uid()
{
  return MEMORY[0x24BDB07F0]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x24BDB09A8](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

