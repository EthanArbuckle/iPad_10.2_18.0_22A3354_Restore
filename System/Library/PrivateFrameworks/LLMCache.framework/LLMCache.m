uint64_t ListResponse.entries.getter()
{
  return swift_bridgeObjectRetain();
}

LLMCache::ListResponse __swiftcall ListResponse.init(entries:)(LLMCache::ListResponse entries)
{
  LLMCache::ListResponse *v1;

  v1->entries._rawValue = entries.entries._rawValue;
  return entries;
}

uint64_t CacheEntry.llmOutput.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CacheEntry.isExactMatch.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 16);
}

LLMCache::CacheEntry __swiftcall CacheEntry.init(llmOutput:isExactMatch:)(Swift::String llmOutput, Swift::Bool isExactMatch)
{
  uint64_t v2;
  LLMCache::CacheEntry result;

  *(Swift::String *)v2 = llmOutput;
  *(_BYTE *)(v2 + 16) = isExactMatch;
  result.llmOutput = llmOutput;
  result.isExactMatch = isExactMatch;
  return result;
}

id default argument 0 of static Logger.makeSignpostID(log:)()
{
  if (one-time initialization token for log != -1)
    swift_once();
  return (id)static Logger.log;
}

id default argument 1 of static Logger.withSignpost<A>(name:log:completion:)()
{
  if (one-time initialization token for log != -1)
    swift_once();
  return (id)static Logger.log;
}

uint64_t default argument 3 of BiomeLogEmitter.buildSearchTelemetry(cmId:state:listRequest:listResponse:error:)()
{
  return MEMORY[0x24BEE4AF8];
}

ValueMetadata *type metadata accessor for ListResponse()
{
  return &type metadata for ListResponse;
}

uint64_t destroy for CacheEntry()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeBufferWithCopyOfBuffer for CacheEntry(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for CacheEntry(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for CacheEntry(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for CacheEntry(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 17))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CacheEntry(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 17) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CacheEntry()
{
  return &type metadata for CacheEntry;
}

void AnnotatedCacheEntryBuilder.namespace.setter()
{
  swift_deletedMethodError();
  __break(1u);
}

BOOL Logger.Subsystem.init(rawValue:)(Swift::String string)
{
  void *object;
  Swift::String v2;
  Swift::Int v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of Logger.Subsystem.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  return v3 != 0;
}

unint64_t Logger.Subsystem.rawValue.getter()
{
  return 0xD000000000000017;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance Logger.Subsystem()
{
  return 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance Logger.Subsystem()
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance Logger.Subsystem()
{
  return String.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance Logger.Subsystem()
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  return Hasher._finalize()();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance Logger.Subsystem@<X0>(Swift::String *a1@<X0>, BOOL *a2@<X8>)
{
  Swift::Int v3;
  uint64_t result;

  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of protocol witness for RawRepresentable.init(rawValue:) in conformance Logger.Subsystem, *a1);
  result = swift_bridgeObjectRelease();
  *a2 = v3 != 0;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance Logger.Subsystem(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000017;
  a1[1] = 0x800000024020DC80;
}

LLMCache::Logger::Category_optional __swiftcall Logger.Category.init(rawValue:)(Swift::String rawValue)
{
  void *object;
  Swift::String v2;
  Swift::Int v3;
  LLMCache::Logger::Category_optional v4;

  object = rawValue._object;
  v2._countAndFlagsBits = rawValue._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of Logger.Category.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 == 1)
    v4.value = LLMCache_Logger_Category_instrumentation;
  else
    v4.value = LLMCache_Logger_Category_unknownDefault;
  if (v3)
    return v4;
  else
    return 0;
}

uint64_t Logger.Category.rawValue.getter(char a1)
{
  if ((a1 & 1) != 0)
    return 0x656D757274736E49;
  else
    return 0x6E614D6568636143;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance Logger.Category(_BYTE *a1, _BYTE *a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v8;

  v2 = *a1 == 0;
  if (*a1)
    v3 = 0x656D757274736E49;
  else
    v3 = 0x6E614D6568636143;
  if (v2)
    v4 = 0xEC00000072656761;
  else
    v4 = 0xEF6E6F697461746ELL;
  if (*a2)
    v5 = 0x656D757274736E49;
  else
    v5 = 0x6E614D6568636143;
  if (*a2)
    v6 = 0xEF6E6F697461746ELL;
  else
    v6 = 0xEC00000072656761;
  if (v3 == v5 && v4 == v6)
    v8 = 1;
  else
    v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance Logger.Category()
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance Logger.Category()
{
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance Logger.Category()
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance Logger.Category@<X0>(Swift::String *a1@<X0>, char *a2@<X8>)
{
  Swift::Int v3;
  uint64_t result;
  char v5;

  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of Logger.Category.init(rawValue:), *a1);
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

void protocol witness for RawRepresentable.rawValue.getter in conformance Logger.Category(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  uint64_t v2;
  unint64_t v3;

  v2 = 0x6E614D6568636143;
  if (*v1)
    v2 = 0x656D757274736E49;
  v3 = 0xEC00000072656761;
  if (*v1)
    v3 = 0xEF6E6F697461746ELL;
  *a1 = v2;
  a1[1] = v3;
}

uint64_t one-time initialization function for log()
{
  uint64_t result;

  type metadata accessor for OS_os_log();
  result = OS_os_log.init(subsystem:category:)();
  static Logger.log = result;
  return result;
}

uint64_t *Logger.log.unsafeMutableAddressor()
{
  if (one-time initialization token for log != -1)
    swift_once();
  return &static Logger.log;
}

id static Logger.log.getter()
{
  if (one-time initialization token for log != -1)
    swift_once();
  return (id)static Logger.log;
}

uint64_t one-time initialization function for logger()
{
  uint64_t v0;
  id v1;

  v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Logger.logger);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.logger);
  if (one-time initialization token for log != -1)
    swift_once();
  v1 = (id)static Logger.log;
  return Logger.init(_:)();
}

uint64_t Logger.logger.unsafeMutableAddressor()
{
  return Logger.logger.unsafeMutableAddressor(&one-time initialization token for logger, (uint64_t)static Logger.logger);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t static Logger.logger.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.logger.getter(&one-time initialization token for logger, (uint64_t)static Logger.logger, a1);
}

uint64_t one-time initialization function for instrumentation()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Logger.instrumentation);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.instrumentation);
  type metadata accessor for OS_os_log();
  OS_os_log.init(subsystem:category:)();
  return Logger.init(_:)();
}

uint64_t Logger.instrumentation.unsafeMutableAddressor()
{
  return Logger.logger.unsafeMutableAddressor(&one-time initialization token for instrumentation, (uint64_t)static Logger.instrumentation);
}

uint64_t Logger.logger.unsafeMutableAddressor(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = type metadata accessor for Logger();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t static Logger.instrumentation.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.logger.getter(&one-time initialization token for instrumentation, (uint64_t)static Logger.instrumentation, a1);
}

uint64_t static Logger.logger.getter@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = type metadata accessor for Logger();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t static Logger.makeSignpostID(log:)(void *a1)
{
  id v1;

  v1 = a1;
  return OSSignpostID.init(log:)();
}

uint64_t static Logger.begin(_:log:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v4;

  v4 = a4;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  return os_signpost(_:dso:log:name:signpostID:)();
}

uint64_t static Logger.begin(_:_:log:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return static Logger.begin(_:_:log:)(a1, a2, a3, a4, a5, (void (*)(void))MEMORY[0x24BEE7948]);
}

uint64_t static Logger.event(_:log:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = type metadata accessor for OSSignpostID();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  static os_signpost_type_t.event.getter();
  static OSSignpostID.exclusive.getter();
  os_signpost(_:dso:log:name:signpostID:)();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t static Logger.end(_:_:log:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return static Logger.begin(_:_:log:)(a1, a2, a3, a4, a5, (void (*)(void))MEMORY[0x24BEE7940]);
}

uint64_t static Logger.begin(_:_:log:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(void))
{
  a6();
  return os_signpost(_:dso:log:name:signpostID:)();
}

uint64_t static Logger.withSignpost<A>(name:log:completion:)(uint64_t a1, uint64_t a2, int a3, void *a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  _QWORD v17[2];
  int v18;

  v18 = a3;
  v17[0] = a1;
  v17[1] = a2;
  v7 = type metadata accessor for OSSignpostID();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7, v9);
  v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = OS_os_log.signpostsEnabled.getter();
  if ((v12 & 1) == 0)
    return a5(v12, v13);
  v14 = a4;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  v15 = os_signpost(_:dso:log:name:signpostID:)();
  ((void (*)(uint64_t))a5)(v15);
  static os_signpost_type_t.end.getter();
  os_signpost(_:dso:log:name:signpostID:)();
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

unint64_t lazy protocol witness table accessor for type Logger.Subsystem and conformance Logger.Subsystem()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Logger.Subsystem and conformance Logger.Subsystem;
  if (!lazy protocol witness table cache variable for type Logger.Subsystem and conformance Logger.Subsystem)
  {
    result = MEMORY[0x2426803DC](&protocol conformance descriptor for Logger.Subsystem, &type metadata for Logger.Subsystem);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Logger.Subsystem and conformance Logger.Subsystem);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Logger.Category and conformance Logger.Category()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Logger.Category and conformance Logger.Category;
  if (!lazy protocol witness table cache variable for type Logger.Category and conformance Logger.Category)
  {
    result = MEMORY[0x2426803DC](&protocol conformance descriptor for Logger.Category, &type metadata for Logger.Category);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Logger.Category and conformance Logger.Category);
  }
  return result;
}

ValueMetadata *type metadata accessor for Logger()
{
  return &type metadata for Logger;
}

uint64_t getEnumTagSinglePayload for Logger.Subsystem(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for Logger.Subsystem(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2401E8F44 + 4 * asc_24020CF68[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2401E8F64 + 4 * byte_24020CF6D[v4]))();
}

_BYTE *sub_2401E8F44(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2401E8F64(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2401E8F6C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2401E8F74(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2401E8F7C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2401E8F84(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t getEnumTag for Logger.Subsystem()
{
  return 0;
}

ValueMetadata *type metadata accessor for Logger.Subsystem()
{
  return &type metadata for Logger.Subsystem;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Logger.Category(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for Logger.Category(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2401E9094 + 4 * byte_24020CF77[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2401E90C8 + 4 * byte_24020CF72[v4]))();
}

uint64_t sub_2401E90C8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2401E90D0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2401E90D8);
  return result;
}

uint64_t sub_2401E90E4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2401E90ECLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2401E90F0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2401E90F8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t getEnumTag for Logger.Category(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *destructiveInjectEnumTag for Logger.Category(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for Logger.Category()
{
  return &type metadata for Logger.Category;
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

unint64_t type metadata accessor for OS_os_log()
{
  unint64_t result;

  result = lazy cache variable for type metadata for OS_os_log;
  if (!lazy cache variable for type metadata for OS_os_log)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for OS_os_log);
  }
  return result;
}

uint64_t BiomeLogEmitter.emitInsertStarted(clientTraceId:namespace:)@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  void (*v32)(uint64_t, _QWORD, uint64_t *);
  uint64_t v33;
  uint64_t v34;
  unsigned int (*v35)(char *, uint64_t, uint64_t);
  void (*v36)(char *, uint64_t);
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  NSObject *v48;
  os_log_type_t v49;
  _BOOL4 v50;
  char *v51;
  uint8_t *v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  void (*v56)(char *, uint64_t);
  uint64_t v57;
  char *v58;
  uint64_t v59;
  char *v60;
  _QWORD *v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  char *v72;
  uint64_t v73;
  uint64_t v74[3];
  uint64_t v75;
  uint64_t v76;

  v65 = type metadata accessor for UUID();
  v67 = *(_QWORD *)(v65 - 8);
  MEMORY[0x24BDAC7A8](v65, v7);
  v66 = (char *)&v59 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  v11 = MEMORY[0x24BDAC7A8](v9, v10);
  v64 = (char *)&v59 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11, v13);
  v15 = (char *)&v59 - v14;
  v16 = type metadata accessor for Date();
  v68 = *(_QWORD *)(v16 - 8);
  v69 = v16;
  v18 = MEMORY[0x24BDAC7A8](v16, v17);
  v20 = (char *)&v59 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18, v21);
  v23 = (char *)&v59 - v22;
  v24 = type metadata accessor for LLMCacheManagerTelemetry();
  v70 = *(_QWORD *)(v24 - 8);
  v26 = MEMORY[0x24BDAC7A8](v24, v25);
  v28 = (char *)&v59 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v26, v29);
  v31 = (char *)&v59 - v30;
  LOBYTE(a2) = *a2;
  UUID.init()();
  LOBYTE(v74[0]) = (_BYTE)a2;
  (*(void (**)(uint64_t, uint64_t, uint64_t *))(*(_QWORD *)v3 + 144))(a3, a1, v74);
  LOBYTE(v74[0]) = 3;
  v32 = *(void (**)(uint64_t, _QWORD, uint64_t *))(*(_QWORD *)v3 + 152);
  v71 = v28;
  v32(a3, 0, v74);
  type metadata accessor for Library.Streams.LLMCache.CacheManagerTelemetry();
  lazy protocol witness table accessor for type Library.Streams.LLMCache.CacheManagerTelemetry and conformance Library.Streams.LLMCache.CacheManagerTelemetry();
  static StreamResource.source()();
  v72 = v31;
  v60 = v20;
  v59 = a3;
  v63 = v24;
  v62 = v76;
  v61 = __swift_project_boxed_opaque_existential_1(v74, v75);
  LLMCacheManagerTelemetry.writeTimestamp.getter();
  v34 = v68;
  v33 = v69;
  v35 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v68 + 48);
  if (v35(v15, 1, v69) == 1)
  {
    static Date.now.getter();
    outlined destroy of Date?((uint64_t)v15, &demangling cache variable for type metadata for Date?);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v34 + 32))(v23, v15, v33);
  }
  dispatch thunk of Source.sendEvent(_:date:)();
  v36 = *(void (**)(char *, uint64_t))(v34 + 8);
  v36(v23, v33);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v74);
  static StreamResource.source()();
  v38 = v34;
  __swift_project_boxed_opaque_existential_1(v74, v75);
  v39 = (uint64_t)v64;
  v40 = v71;
  LLMCacheManagerTelemetry.writeTimestamp.getter();
  if (v35((char *)v39, 1, v33) == 1)
  {
    v41 = v60;
    static Date.now.getter();
    outlined destroy of Date?(v39, &demangling cache variable for type metadata for Date?);
  }
  else
  {
    v41 = v60;
    (*(void (**)(char *, uint64_t, uint64_t))(v38 + 32))(v60, v39, v33);
  }
  v42 = v33;
  v43 = v67;
  v44 = v59;
  dispatch thunk of Source.sendEvent(_:date:)();
  v36(v41, v42);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v74);
  if (one-time initialization token for instrumentation != -1)
    swift_once();
  v45 = type metadata accessor for Logger();
  __swift_project_value_buffer(v45, (uint64_t)static Logger.instrumentation);
  v47 = v65;
  v46 = v66;
  (*(void (**)(char *, uint64_t, uint64_t))(v43 + 16))(v66, v44, v65);
  v48 = Logger.logObject.getter();
  v49 = static os_log_type_t.debug.getter();
  v50 = os_log_type_enabled(v48, v49);
  v51 = v72;
  if (v50)
  {
    v52 = (uint8_t *)swift_slowAlloc();
    v53 = swift_slowAlloc();
    v74[0] = v53;
    *(_DWORD *)v52 = 136315138;
    v54 = UUID.uuidString.getter();
    v73 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v54, v55, v74);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v43 + 8))(v46, v47);
    _os_log_impl(&dword_2401E6000, v48, v49, "Emitted invocation and insertStarted logging events, cmId: %s", v52, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24268046C](v53, -1, -1);
    MEMORY[0x24268046C](v52, -1, -1);

    v56 = *(void (**)(char *, uint64_t))(v70 + 8);
    v57 = v63;
    v56(v71, v63);
    v58 = v72;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v43 + 8))(v46, v47);
    v56 = *(void (**)(char *, uint64_t))(v70 + 8);
    v57 = v63;
    v56(v40, v63);
    v58 = v51;
  }
  return ((uint64_t (*)(char *, uint64_t))v56)(v58, v57);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2426803C4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Library.Streams.LLMCache.CacheManagerTelemetry and conformance Library.Streams.LLMCache.CacheManagerTelemetry()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type Library.Streams.LLMCache.CacheManagerTelemetry and conformance Library.Streams.LLMCache.CacheManagerTelemetry;
  if (!lazy protocol witness table cache variable for type Library.Streams.LLMCache.CacheManagerTelemetry and conformance Library.Streams.LLMCache.CacheManagerTelemetry)
  {
    v1 = type metadata accessor for Library.Streams.LLMCache.CacheManagerTelemetry();
    result = MEMORY[0x2426803DC](MEMORY[0x24BE59898], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Library.Streams.LLMCache.CacheManagerTelemetry and conformance Library.Streams.LLMCache.CacheManagerTelemetry);
  }
  return result;
}

uint64_t BiomeLogEmitter.emitInsertEnded(cmId:)(char *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  _QWORD v32[2];
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39[5];

  v35 = type metadata accessor for UUID();
  v3 = *(_QWORD *)(v35 - 8);
  MEMORY[0x24BDAC7A8](v35, v4);
  v6 = (char *)v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x24BDAC7A8](v7, v8);
  v10 = (char *)v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for Date();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11, v13);
  v15 = (char *)v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for LLMCacheManagerTelemetry();
  v36 = *(_QWORD *)(v16 - 8);
  v37 = v16;
  MEMORY[0x24BDAC7A8](v16, v17);
  v19 = (char *)v32 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(v39[0]) = 3;
  (*(void (**)(char *, uint64_t, uint64_t *))(*(_QWORD *)v1 + 152))(a1, 1, v39);
  type metadata accessor for Library.Streams.LLMCache.CacheManagerTelemetry();
  lazy protocol witness table accessor for type Library.Streams.LLMCache.CacheManagerTelemetry and conformance Library.Streams.LLMCache.CacheManagerTelemetry();
  static StreamResource.source()();
  v33 = a1;
  v34 = v3;
  v32[1] = v39[4];
  __swift_project_boxed_opaque_existential_1(v39, v39[3]);
  LLMCacheManagerTelemetry.writeTimestamp.getter();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    static Date.now.getter();
    outlined destroy of Date?((uint64_t)v10, &demangling cache variable for type metadata for Date?);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v15, v10, v11);
  }
  v20 = v6;
  dispatch thunk of Source.sendEvent(_:date:)();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v39);
  v21 = v33;
  if (one-time initialization token for instrumentation != -1)
    swift_once();
  v22 = type metadata accessor for Logger();
  __swift_project_value_buffer(v22, (uint64_t)static Logger.instrumentation);
  v23 = v34;
  v24 = v35;
  (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v6, v21, v35);
  v25 = Logger.logObject.getter();
  v26 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v25, v26))
  {
    v27 = (uint8_t *)swift_slowAlloc();
    v28 = swift_slowAlloc();
    v39[0] = v28;
    v33 = v19;
    *(_DWORD *)v27 = 136315138;
    v29 = UUID.uuidString.getter();
    v38 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v29, v30, v39);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v20, v24);
    _os_log_impl(&dword_2401E6000, v25, v26, "Emitted insertEnded logging events, cmId: %s", v27, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24268046C](v28, -1, -1);
    MEMORY[0x24268046C](v27, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v33, v37);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v23 + 8))(v6, v24);
    return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v19, v37);
  }
}

uint64_t BiomeLogEmitter.emitInsertFailed(cmId:error:)(char *a1, _BYTE *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  _QWORD v35[2];
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42[5];

  v5 = type metadata accessor for UUID();
  v37 = *(_QWORD *)(v5 - 8);
  v38 = v5;
  MEMORY[0x24BDAC7A8](v5, v6);
  v8 = (char *)v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x24BDAC7A8](v9, v10);
  v12 = (char *)v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for Date();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13, v15);
  v17 = (char *)v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for LLMCacheManagerTelemetry();
  v39 = *(_QWORD *)(v18 - 8);
  v40 = v18;
  MEMORY[0x24BDAC7A8](v18, v19);
  v21 = (char *)v35 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(v42[0]) = *a2;
  (*(void (**)(char *, uint64_t, uint64_t *))(*(_QWORD *)v2 + 152))(a1, 2, v42);
  type metadata accessor for Library.Streams.LLMCache.CacheManagerTelemetry();
  lazy protocol witness table accessor for type Library.Streams.LLMCache.CacheManagerTelemetry and conformance Library.Streams.LLMCache.CacheManagerTelemetry();
  static StreamResource.source()();
  v35[1] = v42[4];
  v36 = a1;
  __swift_project_boxed_opaque_existential_1(v42, v42[3]);
  LLMCacheManagerTelemetry.writeTimestamp.getter();
  v22 = v14;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    static Date.now.getter();
    outlined destroy of Date?((uint64_t)v12, &demangling cache variable for type metadata for Date?);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v17, v12, v13);
  }
  v23 = v8;
  dispatch thunk of Source.sendEvent(_:date:)();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v17, v13);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v42);
  v24 = v36;
  if (one-time initialization token for instrumentation != -1)
    swift_once();
  v25 = type metadata accessor for Logger();
  __swift_project_value_buffer(v25, (uint64_t)static Logger.instrumentation);
  v26 = v37;
  v27 = v38;
  (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v8, v24, v38);
  v28 = Logger.logObject.getter();
  v29 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v28, v29))
  {
    v30 = (uint8_t *)swift_slowAlloc();
    v31 = swift_slowAlloc();
    v42[0] = v31;
    v36 = v21;
    *(_DWORD *)v30 = 136315138;
    v32 = UUID.uuidString.getter();
    v41 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v32, v33, v42);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v23, v27);
    _os_log_impl(&dword_2401E6000, v28, v29, "Emitted insertFailed logging events, cmId: %s", v30, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24268046C](v31, -1, -1);
    MEMORY[0x24268046C](v30, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v36, v40);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v26 + 8))(v8, v27);
    return (*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v21, v40);
  }
}

uint64_t BiomeLogEmitter.emitSearchStarted(clientTraceId:namespace:listRequest:)@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  void (*v34)(uint64_t, _QWORD, uint64_t, _QWORD, uint64_t *);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int (*v38)(uint64_t, uint64_t, uint64_t);
  void (*v39)(char *, uint64_t);
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  os_log_type_t v53;
  _BOOL4 v54;
  char *v55;
  uint8_t *v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  void (*v60)(char *, uint64_t);
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  _QWORD *v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  char *v77;
  char *v78;
  uint64_t v79;
  uint64_t v80[3];
  uint64_t v81;
  uint64_t v82;

  v9 = type metadata accessor for UUID();
  v70 = *(_QWORD *)(v9 - 8);
  v71 = v9;
  MEMORY[0x24BDAC7A8](v9, v10);
  v72 = (char *)&v63 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  v14 = MEMORY[0x24BDAC7A8](v12, v13);
  v69 = (char *)&v63 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14, v16);
  v75 = (char *)&v63 - v17;
  v18 = type metadata accessor for Date();
  v73 = *(_QWORD *)(v18 - 8);
  v74 = v18;
  v20 = MEMORY[0x24BDAC7A8](v18, v19);
  v22 = (char *)&v63 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20, v23);
  v25 = (char *)&v63 - v24;
  v26 = type metadata accessor for LLMCacheManagerTelemetry();
  v76 = *(_QWORD *)(v26 - 8);
  v28 = MEMORY[0x24BDAC7A8](v26, v27);
  v30 = (char *)&v63 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v28, v31);
  v33 = (char *)&v63 - v32;
  LOBYTE(a2) = *a2;
  UUID.init()();
  LOBYTE(v80[0]) = (_BYTE)a2;
  (*(void (**)(uint64_t, uint64_t, uint64_t *))(*(_QWORD *)v4 + 144))(a4, a1, v80);
  LOBYTE(v80[0]) = 3;
  v34 = *(void (**)(uint64_t, _QWORD, uint64_t, _QWORD, uint64_t *))(*(_QWORD *)v4 + 160);
  v77 = v30;
  v34(a4, 0, a3, MEMORY[0x24BEE4AF8], v80);
  type metadata accessor for Library.Streams.LLMCache.CacheManagerTelemetry();
  lazy protocol witness table accessor for type Library.Streams.LLMCache.CacheManagerTelemetry and conformance Library.Streams.LLMCache.CacheManagerTelemetry();
  static StreamResource.source()();
  v78 = v33;
  v65 = v22;
  v64 = a4;
  v68 = v26;
  v67 = v82;
  v66 = __swift_project_boxed_opaque_existential_1(v80, v81);
  v35 = (uint64_t)v75;
  LLMCacheManagerTelemetry.writeTimestamp.getter();
  v36 = v73;
  v37 = v74;
  v38 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v73 + 48);
  if (v38(v35, 1, v74) == 1)
  {
    static Date.now.getter();
    outlined destroy of Date?(v35, &demangling cache variable for type metadata for Date?);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v36 + 32))(v25, v35, v37);
  }
  dispatch thunk of Source.sendEvent(_:date:)();
  v39 = *(void (**)(char *, uint64_t))(v36 + 8);
  v39(v25, v37);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v80);
  static StreamResource.source()();
  v41 = v36;
  __swift_project_boxed_opaque_existential_1(v80, v81);
  v42 = (uint64_t)v69;
  v43 = v77;
  LLMCacheManagerTelemetry.writeTimestamp.getter();
  if (v38(v42, 1, v37) == 1)
  {
    v44 = v65;
    static Date.now.getter();
    outlined destroy of Date?(v42, &demangling cache variable for type metadata for Date?);
  }
  else
  {
    v44 = v65;
    (*(void (**)(char *, uint64_t, uint64_t))(v41 + 32))(v65, v42, v37);
  }
  v45 = v37;
  v46 = v64;
  dispatch thunk of Source.sendEvent(_:date:)();
  v39(v44, v45);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v80);
  if (one-time initialization token for instrumentation != -1)
    swift_once();
  v47 = type metadata accessor for Logger();
  __swift_project_value_buffer(v47, (uint64_t)static Logger.instrumentation);
  v48 = v70;
  v49 = v72;
  v50 = v46;
  v51 = v71;
  (*(void (**)(char *, uint64_t, uint64_t))(v70 + 16))(v72, v50, v71);
  v52 = Logger.logObject.getter();
  v53 = static os_log_type_t.debug.getter();
  v54 = os_log_type_enabled(v52, v53);
  v55 = v78;
  if (v54)
  {
    v56 = (uint8_t *)swift_slowAlloc();
    v57 = swift_slowAlloc();
    v80[0] = v57;
    *(_DWORD *)v56 = 136315138;
    v58 = UUID.uuidString.getter();
    v79 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v58, v59, v80);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v48 + 8))(v49, v51);
    _os_log_impl(&dword_2401E6000, v52, v53, "Emitted invocation and searchStarted logging events, cmId: %s", v56, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24268046C](v57, -1, -1);
    MEMORY[0x24268046C](v56, -1, -1);

    v60 = *(void (**)(char *, uint64_t))(v76 + 8);
    v61 = v68;
    v60(v77, v68);
    v62 = v78;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v48 + 8))(v49, v51);
    v60 = *(void (**)(char *, uint64_t))(v76 + 8);
    v61 = v68;
    v60(v43, v68);
    v62 = v55;
  }
  return ((uint64_t (*)(char *, uint64_t))v60)(v62, v61);
}

uint64_t BiomeLogEmitter.emitSearchEnded(cmId:listRequest:listResponse:)(uint64_t a1, char *a2, char *a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41[4];

  v36 = a2;
  v37 = a3;
  v35 = type metadata accessor for UUID();
  v5 = *(_QWORD *)(v35 - 8);
  MEMORY[0x24BDAC7A8](v35, v6);
  v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x24BDAC7A8](v9, v10);
  v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for Date();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13, v15);
  v17 = (char *)&v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for LLMCacheManagerTelemetry();
  v38 = *(_QWORD *)(v18 - 8);
  v39 = v18;
  MEMORY[0x24BDAC7A8](v18, v19);
  v21 = (char *)&v33 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(v41[0]) = 3;
  (*(void (**)(uint64_t, uint64_t, char *, char *, uint64_t *))(*(_QWORD *)v3 + 160))(a1, 1, v36, v37, v41);
  type metadata accessor for Library.Streams.LLMCache.CacheManagerTelemetry();
  lazy protocol witness table accessor for type Library.Streams.LLMCache.CacheManagerTelemetry and conformance Library.Streams.LLMCache.CacheManagerTelemetry();
  static StreamResource.source()();
  v36 = v8;
  v34 = v5;
  __swift_project_boxed_opaque_existential_1(v41, v41[3]);
  v37 = v21;
  LLMCacheManagerTelemetry.writeTimestamp.getter();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    static Date.now.getter();
    outlined destroy of Date?((uint64_t)v12, &demangling cache variable for type metadata for Date?);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v17, v12, v13);
  }
  dispatch thunk of Source.sendEvent(_:date:)();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v41);
  v22 = v34;
  if (one-time initialization token for instrumentation != -1)
    swift_once();
  v23 = type metadata accessor for Logger();
  __swift_project_value_buffer(v23, (uint64_t)static Logger.instrumentation);
  v25 = v35;
  v24 = v36;
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v36, a1, v35);
  v26 = Logger.logObject.getter();
  v27 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v26, v27))
  {
    v28 = (uint8_t *)swift_slowAlloc();
    v29 = swift_slowAlloc();
    v41[0] = v29;
    *(_DWORD *)v28 = 136315138;
    v30 = UUID.uuidString.getter();
    v40 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v30, v31, v41);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v25);
    _os_log_impl(&dword_2401E6000, v26, v27, "Emitted searchEnded logging events, cmId: %s", v28, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24268046C](v29, -1, -1);
    MEMORY[0x24268046C](v28, -1, -1);

  }
  else
  {

    (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v25);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v37, v39);
}

uint64_t BiomeLogEmitter.emitSearchFailed(cmId:listRequest:error:)(uint64_t a1, char *a2, _BYTE *a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42[4];

  v38 = a2;
  v37 = type metadata accessor for UUID();
  v6 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v37, v7);
  v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x24BDAC7A8](v10, v11);
  v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for Date();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14, v16);
  v18 = (char *)&v34 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = type metadata accessor for LLMCacheManagerTelemetry();
  v39 = *(_QWORD *)(v19 - 8);
  v40 = v19;
  MEMORY[0x24BDAC7A8](v19, v20);
  v22 = (char *)&v34 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(v42[0]) = *a3;
  (*(void (**)(uint64_t, uint64_t, char *, _QWORD, uint64_t *))(*(_QWORD *)v3 + 160))(a1, 2, v38, MEMORY[0x24BEE4AF8], v42);
  type metadata accessor for Library.Streams.LLMCache.CacheManagerTelemetry();
  lazy protocol witness table accessor for type Library.Streams.LLMCache.CacheManagerTelemetry and conformance Library.Streams.LLMCache.CacheManagerTelemetry();
  static StreamResource.source()();
  v35 = v6;
  v36 = v9;
  __swift_project_boxed_opaque_existential_1(v42, v42[3]);
  v38 = v22;
  LLMCacheManagerTelemetry.writeTimestamp.getter();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1)
  {
    static Date.now.getter();
    outlined destroy of Date?((uint64_t)v13, &demangling cache variable for type metadata for Date?);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v18, v13, v14);
  }
  dispatch thunk of Source.sendEvent(_:date:)();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v42);
  v23 = v35;
  if (one-time initialization token for instrumentation != -1)
    swift_once();
  v24 = type metadata accessor for Logger();
  __swift_project_value_buffer(v24, (uint64_t)static Logger.instrumentation);
  v25 = v36;
  v26 = v37;
  (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))(v36, a1, v37);
  v27 = Logger.logObject.getter();
  v28 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v27, v28))
  {
    v29 = (uint8_t *)swift_slowAlloc();
    v30 = swift_slowAlloc();
    v42[0] = v30;
    *(_DWORD *)v29 = 136315138;
    v31 = UUID.uuidString.getter();
    v41 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v31, v32, v42);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v25, v26);
    _os_log_impl(&dword_2401E6000, v27, v28, "Emitted searchFailed logging events, cmId: %s", v29, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24268046C](v30, -1, -1);
    MEMORY[0x24268046C](v29, -1, -1);

  }
  else
  {

    (*(void (**)(char *, uint64_t))(v23 + 8))(v25, v26);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v38, v40);
}

uint64_t BiomeLogEmitter.buildInvocationTelemetry(cmId:clientTraceId:namespace:)@<X0>(uint64_t a1@<X0>, char *a2@<X1>, unsigned __int8 *a3@<X2>, uint64_t a4@<X8>)
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(char *, _QWORD, uint64_t, uint64_t);
  void (*v40)(char *, uint64_t, uint64_t);
  unsigned int *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  char *v70;
  uint64_t v71;

  v59 = a1;
  v60 = a2;
  v71 = a4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MonotonicTimestamp?);
  MEMORY[0x24BDAC7A8](v5, v6);
  v70 = (char *)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x24BDAC7A8](v8, v9);
  v69 = (char *)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CacheManagerTarget?);
  MEMORY[0x24BDAC7A8](v11, v12);
  v66 = (char *)&v58 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CacheManagerTelemetryEventMetadata?);
  MEMORY[0x24BDAC7A8](v14, v15);
  v62 = (char *)&v58 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for CacheManagerTarget();
  v67 = *(_QWORD *)(v17 - 8);
  v68 = v17;
  MEMORY[0x24BDAC7A8](v17, v18);
  v20 = (char *)&v58 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CacheManagerRequestInvocation.CacheManagerNamespace?);
  MEMORY[0x24BDAC7A8](v21, v22);
  v24 = (char *)&v58 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = type metadata accessor for CacheManagerRequestInvocation();
  v64 = *(_QWORD *)(v25 - 8);
  v65 = v25;
  MEMORY[0x24BDAC7A8](v25, v26);
  v28 = (char *)&v58 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x24BDAC7A8](v29, v30);
  v32 = (char *)&v58 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v63 = type metadata accessor for CacheManagerTelemetryEventMetadata();
  v61 = *(_QWORD *)(v63 - 8);
  MEMORY[0x24BDAC7A8](v63, v33);
  v35 = (char *)&v58 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = *a3;
  CacheManagerTelemetryEventMetadata.init()();
  UUID.init()();
  v37 = type metadata accessor for UUID();
  v38 = *(_QWORD *)(v37 - 8);
  v39 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v38 + 56);
  v39(v32, 0, 1, v37);
  CacheManagerRequestInvocation.clientTraceId.setter();
  v40 = *(void (**)(char *, uint64_t, uint64_t))(v38 + 16);
  v40(v32, v59, v37);
  v39(v32, 0, 1, v37);
  CacheManagerTelemetryEventMetadata.cacheManagerId.setter();
  CacheManagerRequestInvocation.init()();
  v40(v32, (uint64_t)v60, v37);
  v39(v32, 0, 1, v37);
  CacheManagerRequestInvocation.clientTraceId.setter();
  if (v36)
  {
    if (v36 == 1)
      v41 = (unsigned int *)MEMORY[0x24BE59CC8];
    else
      v41 = (unsigned int *)MEMORY[0x24BE59CC0];
  }
  else
  {
    v41 = (unsigned int *)MEMORY[0x24BE59CD0];
  }
  v42 = *v41;
  v43 = type metadata accessor for CacheManagerRequestInvocation.CacheManagerNamespace();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 104))(v24, v42, v43);
  type metadata accessor for CacheManagerRequestInvocation.CacheManagerNamespace();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 56))(v24, 0, 1, v43);
  CacheManagerRequestInvocation.namespace.setter();
  v45 = v64;
  v44 = v65;
  (*(void (**)(char *, char *, uint64_t))(v64 + 16))(v20, v28, v65);
  v47 = v67;
  v46 = v68;
  (*(void (**)(char *, _QWORD, uint64_t))(v67 + 104))(v20, *MEMORY[0x24BE59BD8], v68);
  LLMCacheManagerTelemetry.init()();
  v60 = v28;
  v48 = v20;
  v50 = v61;
  v49 = v62;
  v51 = v63;
  (*(void (**)(char *, char *, uint64_t))(v61 + 16))(v62, v35, v63);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v50 + 56))(v49, 0, 1, v51);
  LLMCacheManagerTelemetry.eventMetadata.setter();
  v52 = v66;
  (*(void (**)(char *, char *, uint64_t))(v47 + 16))(v66, v48, v46);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v47 + 56))(v52, 0, 1, v46);
  LLMCacheManagerTelemetry.target.setter();
  v53 = v69;
  static Date.now.getter();
  v54 = type metadata accessor for Date();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v54 - 8) + 56))(v53, 0, 1, v54);
  LLMCacheManagerTelemetry.writeTimestamp.setter();
  v55 = v70;
  static MonotonicTimestamp.nowForSuspendingClock()();
  v56 = type metadata accessor for MonotonicTimestamp();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v56 - 8) + 56))(v55, 0, 1, v56);
  LLMCacheManagerTelemetry.monotonicTimestamp.setter();
  (*(void (**)(char *, uint64_t))(v47 + 8))(v48, v46);
  (*(void (**)(char *, uint64_t))(v45 + 8))(v60, v44);
  return (*(uint64_t (**)(char *, uint64_t))(v50 + 8))(v35, v51);
}

uint64_t CacheNamespace.toBiomeCacheManagerNamespace()@<X0>(uint64_t a1@<X8>)
{
  _BYTE *v1;
  unsigned int *v3;
  uint64_t v4;
  uint64_t v5;

  if (*v1)
  {
    if (*v1 == 1)
      v3 = (unsigned int *)MEMORY[0x24BE59CC8];
    else
      v3 = (unsigned int *)MEMORY[0x24BE59CC0];
  }
  else
  {
    v3 = (unsigned int *)MEMORY[0x24BE59CD0];
  }
  v4 = *v3;
  v5 = type metadata accessor for CacheManagerRequestInvocation.CacheManagerNamespace();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 104))(a1, v4, v5);
}

uint64_t BiomeLogEmitter.buildInsertTelemetry(cmId:state:error:)@<X0>(uint64_t a1@<X0>, int a2@<W1>, unsigned __int8 *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v49;
  unsigned int *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  char *v59;
  char *v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  char *v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  char *v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  char *v84;
  uint64_t v85;

  LODWORD(v73) = a2;
  v85 = a4;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MonotonicTimestamp?);
  MEMORY[0x24BDAC7A8](v6, v7);
  v84 = (char *)&v65 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x24BDAC7A8](v9, v10);
  v83 = (char *)&v65 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CacheManagerTarget?);
  MEMORY[0x24BDAC7A8](v12, v13);
  v79 = (char *)&v65 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CacheManagerTelemetryEventMetadata?);
  MEMORY[0x24BDAC7A8](v15, v16);
  v78 = (char *)&v65 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for CacheManagerTarget();
  v81 = *(_QWORD *)(v18 - 8);
  v82 = v18;
  MEMORY[0x24BDAC7A8](v18, v19);
  v80 = (char *)&v65 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CacheManagerError?);
  MEMORY[0x24BDAC7A8](v21, v22);
  v71 = (char *)&v65 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v66 = type metadata accessor for CacheManagerInsert.Failed();
  v72 = *(_QWORD *)(v66 - 8);
  MEMORY[0x24BDAC7A8](v66, v24);
  v70 = (char *)&v65 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CacheManagerError.ErrorType?);
  v28 = MEMORY[0x24BDAC7A8](v26, v27);
  MEMORY[0x24BDAC7A8](v28, v29);
  v67 = (char *)&v65 - v30;
  v31 = type metadata accessor for CacheManagerError();
  v68 = *(_QWORD *)(v31 - 8);
  v69 = v31;
  MEMORY[0x24BDAC7A8](v31, v32);
  v33 = type metadata accessor for CacheManagerInsert();
  v76 = *(_QWORD *)(v33 - 8);
  v77 = v33;
  MEMORY[0x24BDAC7A8](v33, v34);
  v36 = (char *)&v65 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x24BDAC7A8](v37, v38);
  v40 = (char *)&v65 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = type metadata accessor for CacheManagerTelemetryEventMetadata();
  v74 = *(_QWORD *)(v41 - 8);
  v75 = v41;
  MEMORY[0x24BDAC7A8](v41, v42);
  v44 = (char *)&v65 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = *a3;
  CacheManagerTelemetryEventMetadata.init()();
  UUID.init()();
  v46 = type metadata accessor for UUID();
  v47 = *(_QWORD *)(v46 - 8);
  v48 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v47 + 56);
  v48(v40, 0, 1, v46);
  CacheManagerRequestInvocation.clientTraceId.setter();
  (*(void (**)(char *, uint64_t, uint64_t))(v47 + 16))(v40, a1, v46);
  v48(v40, 0, 1, v46);
  v49 = CacheManagerTelemetryEventMetadata.cacheManagerId.setter();
  if ((_BYTE)v73)
  {
    if (v73 != 1)
    {
      MEMORY[0x24267FAF4](v49);
      __asm { BR              X9 }
    }
    CacheManagerInsert.Ended.init()();
    CacheManagerInsert.Ended.exists.setter();
    v50 = (unsigned int *)MEMORY[0x24BE59AF8];
  }
  else
  {
    CacheManagerInsert.Ended.init()();
    CacheManagerInsert.Ended.exists.setter();
    v50 = (unsigned int *)MEMORY[0x24BE59B30];
  }
  v51 = v76;
  v52 = v77;
  (*(void (**)(char *, _QWORD, uint64_t))(v76 + 104))(v36, *v50, v77);
  v53 = v80;
  (*(void (**)(char *, char *, uint64_t))(v51 + 16))(v80, v36, v52);
  v55 = v81;
  v54 = v82;
  (*(void (**)(char *, _QWORD, uint64_t))(v81 + 104))(v53, *MEMORY[0x24BE59BE0], v82);
  LLMCacheManagerTelemetry.init()();
  v73 = v36;
  v57 = v74;
  v56 = v75;
  v58 = v78;
  (*(void (**)(char *, char *, uint64_t))(v74 + 16))(v78, v44, v75);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v57 + 56))(v58, 0, 1, v56);
  LLMCacheManagerTelemetry.eventMetadata.setter();
  v59 = v79;
  (*(void (**)(char *, char *, uint64_t))(v55 + 16))(v79, v53, v54);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v55 + 56))(v59, 0, 1, v54);
  LLMCacheManagerTelemetry.target.setter();
  v60 = v83;
  static Date.now.getter();
  v61 = type metadata accessor for Date();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v61 - 8) + 56))(v60, 0, 1, v61);
  LLMCacheManagerTelemetry.writeTimestamp.setter();
  v62 = v84;
  static MonotonicTimestamp.nowForSuspendingClock()();
  v63 = type metadata accessor for MonotonicTimestamp();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v63 - 8) + 56))(v62, 0, 1, v63);
  LLMCacheManagerTelemetry.monotonicTimestamp.setter();
  (*(void (**)(char *, uint64_t))(v55 + 8))(v53, v54);
  (*(void (**)(char *, uint64_t))(v51 + 8))(v73, v52);
  return (*(uint64_t (**)(char *, uint64_t))(v57 + 8))(v44, v56);
}

uint64_t LLMCacheManagerError.toBiomeCacheManagerErrorType()@<X0>(uint64_t a1@<X8>)
{
  _BYTE *v1;
  unsigned int *v3;
  uint64_t v4;
  uint64_t v5;

  if (*v1)
    v3 = (unsigned int *)MEMORY[0x24BE59AA8];
  else
    v3 = (unsigned int *)MEMORY[0x24BE59AB0];
  v4 = *v3;
  v5 = type metadata accessor for CacheManagerError.ErrorType();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 104))(a1, v4, v5);
}

uint64_t BiomeLogEmitter.buildSearchTelemetry(cmId:state:listRequest:listResponse:error:)@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, _QWORD *a4@<X3>, unsigned __int8 *a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v62;
  _QWORD *v63;
  _QWORD *v64;
  char *v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  unsigned int *v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  char *v74;
  unsigned int *v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  char *v83;
  uint64_t v84;
  char *v85;
  char *v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  char *v94;
  uint64_t v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  _QWORD *v99;
  char *v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  char *v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  char *v114;
  char *v115;
  uint64_t v116;
  uint64_t v117;
  int v118;
  char *v119;
  _QWORD *v120;

  v99 = a4;
  v95 = a3;
  v118 = a2;
  v116 = a6;
  v117 = a1;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MonotonicTimestamp?);
  MEMORY[0x24BDAC7A8](v7, v8);
  v115 = (char *)&v91 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x24BDAC7A8](v10, v11);
  v114 = (char *)&v91 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CacheManagerTarget?);
  MEMORY[0x24BDAC7A8](v13, v14);
  v110 = (char *)&v91 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CacheManagerTelemetryEventMetadata?);
  MEMORY[0x24BDAC7A8](v16, v17);
  v109 = (char *)&v91 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = type metadata accessor for CacheManagerTarget();
  v112 = *(_QWORD *)(v19 - 8);
  v113 = v19;
  MEMORY[0x24BDAC7A8](v19, v20);
  v111 = (char *)&v91 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CacheManagerError?);
  MEMORY[0x24BDAC7A8](v22, v23);
  v101 = (char *)&v91 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = type metadata accessor for CacheManagerSearch.Failed();
  v102 = *(_QWORD *)(v25 - 8);
  v103 = v25;
  MEMORY[0x24BDAC7A8](v25, v26);
  v100 = (char *)&v91 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CacheManagerError.ErrorType?);
  v30 = MEMORY[0x24BDAC7A8](v28, v29);
  v93 = (char *)&v91 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v30, v32);
  v94 = (char *)&v91 - v33;
  v98 = type metadata accessor for CacheManagerError();
  v97 = *(_QWORD *)(v98 - 8);
  MEMORY[0x24BDAC7A8](v98, v34);
  v96 = (char *)&v91 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AnnotatedCacheEntry?);
  MEMORY[0x24BDAC7A8](v36, v37);
  v39 = (char *)&v91 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CacheManagerSearch.CacheManagerSearchStrategy?);
  MEMORY[0x24BDAC7A8](v40, v41);
  v43 = (char *)&v91 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  v92 = type metadata accessor for CacheManagerSearch.Ended();
  v91 = *(_QWORD *)(v92 - 8);
  MEMORY[0x24BDAC7A8](v92, v44);
  v46 = (char *)&v91 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = type metadata accessor for CacheManagerSearch();
  v107 = *(_QWORD *)(v47 - 8);
  v108 = v47;
  MEMORY[0x24BDAC7A8](v47, v48);
  v119 = (char *)&v91 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x24BDAC7A8](v50, v51);
  v53 = (char *)&v91 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0);
  v54 = type metadata accessor for CacheManagerTelemetryEventMetadata();
  v105 = *(_QWORD *)(v54 - 8);
  v106 = v54;
  MEMORY[0x24BDAC7A8](v54, v55);
  v57 = (char *)&v91 - ((v56 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = *a5;
  CacheManagerTelemetryEventMetadata.init()();
  UUID.init()();
  v59 = type metadata accessor for UUID();
  v60 = *(_QWORD *)(v59 - 8);
  v61 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v60 + 56);
  v61(v53, 0, 1, v59);
  CacheManagerRequestInvocation.clientTraceId.setter();
  (*(void (**)(char *, uint64_t, uint64_t))(v60 + 16))(v53, v117, v59);
  v61(v53, 0, 1, v59);
  v62 = CacheManagerTelemetryEventMetadata.cacheManagerId.setter();
  v104 = v57;
  if (!(_BYTE)v118)
  {
    v74 = v119;
    CacheManagerInsert.Ended.init()();
    CacheManagerInsert.Ended.exists.setter();
    v75 = (unsigned int *)MEMORY[0x24BE59BC8];
    goto LABEL_16;
  }
  if (v118 != 1)
  {
    MEMORY[0x24267FAF4](v62);
    __asm { BR              X9 }
  }
  v63 = v99;
  v120 = v99;
  swift_bridgeObjectRetain();
  specialized MutableCollection<>.sort(by:)(&v120);
  v64 = v120;
  v65 = v119;
  CacheManagerSearch.Ended.init()();
  v66 = *(unsigned __int8 *)(v95 + 16);
  v67 = type metadata accessor for CacheManagerSearch.CacheManagerSearchStrategy();
  v68 = *(_QWORD *)(v67 - 8);
  v69 = (unsigned int *)MEMORY[0x24BE59B40];
  if (!v66)
    v69 = (unsigned int *)MEMORY[0x24BE59B48];
  (*(void (**)(char *, _QWORD, uint64_t))(v68 + 104))(v43, *v69, v67);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v68 + 56))(v43, 0, 1, v67);
  MEMORY[0x24267FB84](v43);
  if (v63[2] >> 31)
  {
    __break(1u);
    goto LABEL_18;
  }
  LOBYTE(v120) = 0;
  CacheManagerSearch.Ended.resultCount.setter();
  v70 = v64[2];
  if (!v70)
  {
    CacheManagerSearch.Ended.highestMatchScore.setter();
    v71 = type metadata accessor for AnnotatedCacheEntry(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v71 - 8) + 56))(v39, 1, 1, v71);
    v74 = v65;
    goto LABEL_12;
  }
  v71 = type metadata accessor for AnnotatedCacheEntry(0);
  v72 = *(_QWORD *)(v71 - 8);
  v73 = (char *)v64 + ((*(unsigned __int8 *)(v72 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v72 + 80));
  CacheManagerSearch.Ended.highestMatchScore.setter();
  if (v70 > v64[2])
  {
LABEL_18:
    __break(1u);
    swift_release();
    __break(1u);
    JUMPOUT(0x2401ECCD4);
  }
  outlined init with copy of AnnotatedCacheEntry((uint64_t)&v73[*(_QWORD *)(v72 + 72) * (v70 - 1)], (uint64_t)v39);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v72 + 56))(v39, 0, 1, v71);
  v74 = v119;
LABEL_12:
  swift_release();
  type metadata accessor for AnnotatedCacheEntry(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v71 - 8) + 48))(v39, 1, v71) == 1)
    outlined destroy of Date?((uint64_t)v39, &demangling cache variable for type metadata for AnnotatedCacheEntry?);
  else
    outlined destroy of AnnotatedCacheEntry((uint64_t)v39);
  CacheManagerSearch.Ended.lowestMatchScore.setter();
  (*(void (**)(char *, char *, uint64_t))(v91 + 32))(v74, v46, v92);
  v75 = (unsigned int *)MEMORY[0x24BE59B90];
LABEL_16:
  v77 = v107;
  v76 = v108;
  (*(void (**)(char *, _QWORD, uint64_t))(v107 + 104))(v74, *v75, v108);
  v78 = v111;
  (*(void (**)(char *, char *, uint64_t))(v77 + 16))(v111, v74, v76);
  v80 = v112;
  v79 = v113;
  (*(void (**)(char *, _QWORD, uint64_t))(v112 + 104))(v78, *MEMORY[0x24BE59BE8], v113);
  LLMCacheManagerTelemetry.init()();
  v82 = v104;
  v81 = v105;
  v83 = v109;
  v84 = v106;
  (*(void (**)(char *, char *, uint64_t))(v105 + 16))(v109, v104, v106);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v81 + 56))(v83, 0, 1, v84);
  LLMCacheManagerTelemetry.eventMetadata.setter();
  v85 = v110;
  (*(void (**)(char *, char *, uint64_t))(v80 + 16))(v110, v78, v79);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v80 + 56))(v85, 0, 1, v79);
  LLMCacheManagerTelemetry.target.setter();
  v86 = v114;
  static Date.now.getter();
  v87 = type metadata accessor for Date();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v87 - 8) + 56))(v86, 0, 1, v87);
  LLMCacheManagerTelemetry.writeTimestamp.setter();
  v88 = v115;
  static MonotonicTimestamp.nowForSuspendingClock()();
  v89 = type metadata accessor for MonotonicTimestamp();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v89 - 8) + 56))(v88, 0, 1, v89);
  LLMCacheManagerTelemetry.monotonicTimestamp.setter();
  (*(void (**)(char *, uint64_t))(v80 + 8))(v78, v79);
  (*(void (**)(char *, uint64_t))(v77 + 8))(v119, v76);
  return (*(uint64_t (**)(char *, uint64_t))(v81 + 8))(v82, v84);
}

uint64_t SearchStrategy.toBiomeSearchStrategy()@<X0>(uint64_t a1@<X8>)
{
  unsigned __int8 *v1;
  int v3;
  uint64_t v4;
  unsigned int *v5;

  v3 = *v1;
  v4 = type metadata accessor for CacheManagerSearch.CacheManagerSearchStrategy();
  v5 = (unsigned int *)MEMORY[0x24BE59B40];
  if (!v3)
    v5 = (unsigned int *)MEMORY[0x24BE59B48];
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v4 - 8) + 104))(a1, *v5, v4);
}

BOOL static BiomeLogEmitter.State.== infix(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

void BiomeLogEmitter.State.hash(into:)(uint64_t a1, unsigned __int8 a2)
{
  Hasher._combine(_:)(a2);
}

Swift::Int BiomeLogEmitter.State.hashValue.getter(unsigned __int8 a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance BiomeLogEmitter.State(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance BiomeLogEmitter.State()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance BiomeLogEmitter.State()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance BiomeLogEmitter.State()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t BiomeLogEmitter.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t BiomeLogEmitter.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t BiomeLogEmitter.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t BiomeLogEmitter.init()()
{
  uint64_t v0;

  return v0;
}

uint64_t serialize(_:at:)(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t closure #1 in osLogInternal(_:log:type:)(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t closure #1 in OSLogArguments.append(_:)(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v6, v7, a3);
  v8 = *a1 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = specialized _StringGuts._deconstructUTF8<A>(scratch:)(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t specialized _StringGuts._deconstructUTF8<A>(scratch:)(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = _StringGuts._allocateForDeconstruct()(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t _StringGuts._allocateForDeconstruct()(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = _StringGuts.copyUTF8(into:)();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      v2 = String.UTF8View._foreignCount()();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

_BYTE **closure #1 in OSLogArguments.append(_:)(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

Swift::Int specialized MutableCollection<>.sort(by:)(_QWORD **a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  Swift::Int result;
  uint64_t v6[2];

  v2 = *(_QWORD *)(type metadata accessor for AnnotatedCacheEntry(0) - 8);
  v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v3 = (_QWORD *)specialized _ContiguousArrayBuffer._consumeAndCreateNew()(v3);
  v4 = v3[2];
  v6[0] = (uint64_t)v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  result = specialized UnsafeMutableBufferPointer._stableSortImpl(by:)(v6);
  *a1 = v3;
  return result;
}

uint64_t outlined init with copy of AnnotatedCacheEntry(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AnnotatedCacheEntry(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of Date?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t outlined destroy of AnnotatedCacheEntry(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for AnnotatedCacheEntry(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t lazy protocol witness table accessor for type BiomeLogEmitter.State and conformance BiomeLogEmitter.State()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type BiomeLogEmitter.State and conformance BiomeLogEmitter.State;
  if (!lazy protocol witness table cache variable for type BiomeLogEmitter.State and conformance BiomeLogEmitter.State)
  {
    result = MEMORY[0x2426803DC](&protocol conformance descriptor for BiomeLogEmitter.State, &type metadata for BiomeLogEmitter.State);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BiomeLogEmitter.State and conformance BiomeLogEmitter.State);
  }
  return result;
}

uint64_t type metadata accessor for BiomeLogEmitter()
{
  return objc_opt_self();
}

uint64_t method lookup function for BiomeLogEmitter()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BiomeLogEmitter.emitInsertStarted(clientTraceId:namespace:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 88))();
}

uint64_t dispatch thunk of BiomeLogEmitter.emitInsertEnded(cmId:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t dispatch thunk of BiomeLogEmitter.emitInsertFailed(cmId:error:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of BiomeLogEmitter.emitSearchStarted(clientTraceId:namespace:listRequest:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of BiomeLogEmitter.emitSearchEnded(cmId:listRequest:listResponse:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of BiomeLogEmitter.emitSearchFailed(cmId:listRequest:error:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of BiomeLogEmitter.buildInvocationTelemetry(cmId:clientTraceId:namespace:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of BiomeLogEmitter.buildInsertTelemetry(cmId:state:error:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of BiomeLogEmitter.buildSearchTelemetry(cmId:state:listRequest:listResponse:error:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of BiomeLogEmitter.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t getEnumTagSinglePayload for BiomeLogEmitter.State(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for BiomeLogEmitter.State(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2401ED884 + 4 * byte_24020D0F9[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2401ED8B8 + 4 * byte_24020D0F4[v4]))();
}

uint64_t sub_2401ED8B8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2401ED8C0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2401ED8C8);
  return result;
}

uint64_t sub_2401ED8D4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2401ED8DCLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2401ED8E0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2401ED8E8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *destructiveInjectEnumTag for BiomeLogEmitter.State(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for BiomeLogEmitter.State()
{
  return &type metadata for BiomeLogEmitter.State;
}

Swift::Int specialized UnsafeMutableBufferPointer._stableSortImpl(by:)(uint64_t *a1)
{
  Swift::Int v1;
  Swift::Int v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  Swift::Int v27;
  Swift::Int result;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  uint64_t v44;
  double v45;
  uint64_t v46;
  uint64_t v47;
  Swift::Int v48;
  Swift::Int v49;
  uint64_t v50;
  Swift::Int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  double v55;
  uint64_t v56;
  double v57;
  _BOOL4 v58;
  Swift::Int v59;
  uint64_t v60;
  Swift::Int v61;
  uint64_t v62;
  uint64_t v63;
  Swift::Int v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  double v70;
  uint64_t v71;
  double v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  Swift::Int v80;
  uint64_t v81;
  uint64_t v82;
  Swift::Int v83;
  Swift::Int v84;
  unint64_t v85;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v87;
  unint64_t v88;
  char *v89;
  char *v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  char v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  BOOL v103;
  unint64_t v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  BOOL v113;
  uint64_t v114;
  char v115;
  char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  BOOL v120;
  uint64_t v121;
  uint64_t v122;
  char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  unint64_t v131;
  uint64_t v132;
  char *v133;
  char *v134;
  uint64_t v135;
  char *v136;
  uint64_t v137;
  unint64_t v138;
  uint64_t v139;
  unint64_t v140;
  char *v141;
  uint64_t v142;
  uint64_t v143;
  char *v144;
  unint64_t v145;
  uint64_t v146;
  Swift::Int v147;
  uint64_t v148;
  Swift::Int v149;
  char *v150;
  uint64_t v151;
  uint64_t v152;
  Swift::Int v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  unint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;

  v2 = v1;
  v164 = type metadata accessor for AnnotatedCacheEntry(0);
  v159 = *(_QWORD *)(v164 - 8);
  v5 = MEMORY[0x24BDAC7A8](v164, v4);
  v154 = (uint64_t)&v146 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5, v7);
  v165 = (uint64_t)&v146 - v9;
  v11 = MEMORY[0x24BDAC7A8](v8, v10);
  v161 = (uint64_t)&v146 - v12;
  v14 = MEMORY[0x24BDAC7A8](v11, v13);
  v160 = (uint64_t)&v146 - v15;
  v17 = MEMORY[0x24BDAC7A8](v14, v16);
  v156 = (uint64_t)&v146 - v18;
  v20 = MEMORY[0x24BDAC7A8](v17, v19);
  v155 = (uint64_t)&v146 - v21;
  v23 = MEMORY[0x24BDAC7A8](v20, v22);
  v152 = (uint64_t)&v146 - v24;
  MEMORY[0x24BDAC7A8](v23, v25);
  v151 = (uint64_t)&v146 - v26;
  v27 = a1[1];
  result = _minimumMergeRunLength(_:)(v27);
  if (result >= v27)
  {
    if (v27 < 0)
      goto LABEL_154;
    if (v27)
      return specialized MutableCollection<>._insertionSort(within:sortedEnd:by:)(0, v27, 1, a1);
    return result;
  }
  if (v27 >= 0)
    v29 = v27;
  else
    v29 = v27 + 1;
  if (v27 < -1)
    goto LABEL_162;
  v149 = result;
  if (v27 < 2)
  {
    v33 = (char *)MEMORY[0x24BEE4AF8];
    v158 = MEMORY[0x24BEE4AF8]
         + ((*(unsigned __int8 *)(v159 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v159 + 80));
    v148 = MEMORY[0x24BEE4AF8];
    if (v27 != 1)
    {
      v35 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_120:
      if (v35 >= 2)
      {
        v139 = *a1;
        do
        {
          v140 = v35 - 2;
          if (v35 < 2)
            goto LABEL_149;
          if (!v139)
            goto LABEL_161;
          v141 = v33;
          v142 = *(_QWORD *)&v33[16 * v140 + 32];
          v143 = *(_QWORD *)&v33[16 * v35 + 24];
          specialized _merge<A>(low:mid:high:buffer:by:)(v139 + *(_QWORD *)(v159 + 72) * v142, v139 + *(_QWORD *)(v159 + 72) * *(_QWORD *)&v33[16 * v35 + 16], v139 + *(_QWORD *)(v159 + 72) * v143, v158);
          if (v2)
            break;
          if (v143 < v142)
            goto LABEL_150;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v141 = specialized _ArrayBuffer._consumeAndCreateNew()((uint64_t)v33);
          if (v140 >= *((_QWORD *)v141 + 2))
            goto LABEL_151;
          v144 = &v141[16 * v140 + 32];
          *(_QWORD *)v144 = v142;
          *((_QWORD *)v144 + 1) = v143;
          v145 = *((_QWORD *)v141 + 2);
          if (v35 > v145)
            goto LABEL_152;
          memmove(&v141[16 * v35 + 16], &v141[16 * v35 + 32], 16 * (v145 - v35));
          *((_QWORD *)v141 + 2) = v145 - 1;
          v35 = v145 - 1;
          v33 = v141;
        }
        while (v145 > 2);
      }
LABEL_131:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v148 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    v30 = v29 >> 1;
    v31 = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(_QWORD *)(v31 + 16) = v30;
    v32 = *(unsigned __int8 *)(v159 + 80);
    v148 = v31;
    v158 = v31 + ((v32 + 32) & ~v32);
  }
  v34 = 0;
  v33 = (char *)MEMORY[0x24BEE4AF8];
  v163 = a1;
  while (1)
  {
    v36 = v34;
    v37 = v34 + 1;
    if (v34 + 1 >= v27)
    {
      v48 = v34 + 1;
      goto LABEL_34;
    }
    v157 = v34;
    v38 = *a1;
    v39 = *(_QWORD *)(v159 + 72);
    v40 = v151;
    outlined init with copy of AnnotatedCacheEntry(*a1 + v39 * v37, v151);
    v41 = v152;
    outlined init with copy of AnnotatedCacheEntry(v38 + v39 * v157, v152);
    v42 = *(int *)(v164 + 48);
    if (*(_BYTE *)(v40 + v42 + 8))
      v43 = 0.0;
    else
      v43 = *(double *)(v40 + v42);
    v44 = v41 + v42;
    if (*(_BYTE *)(v44 + 8))
      v45 = 0.0;
    else
      v45 = *(double *)v44;
    v46 = v41;
    v47 = v38;
    v36 = v157;
    outlined destroy of AnnotatedCacheEntry(v46);
    outlined destroy of AnnotatedCacheEntry(v40);
    v48 = v36 + 2;
    v153 = v47;
    v166 = v39;
    if (v36 + 2 >= v27)
    {
LABEL_31:
      if (v45 >= v43)
        goto LABEL_34;
LABEL_58:
      if (v48 < v36)
        goto LABEL_155;
      if (v36 < v48)
      {
        v147 = v27;
        v150 = v33;
        v75 = 0;
        v76 = v166;
        v77 = v166 * (v48 - 1);
        v78 = v36;
        v79 = v48 * v166;
        v80 = v78;
        v81 = v78 * v166;
        do
        {
          if (v80 != v48 + v75 - 1)
          {
            v83 = v48;
            v84 = v153;
            if (!v153)
              goto LABEL_160;
            v85 = v153 + v81;
            v162 = v153 + v77;
            outlined init with take of AnnotatedCacheEntry(v153 + v81, v154);
            if (v81 < v77 || v85 >= v84 + v79)
            {
              v82 = v162;
              swift_arrayInitWithTakeFrontToBack();
            }
            else
            {
              v82 = v162;
              if (v81 != v77)
                swift_arrayInitWithTakeBackToFront();
            }
            outlined init with take of AnnotatedCacheEntry(v154, v82);
            a1 = v163;
            v48 = v83;
            v76 = v166;
          }
          ++v80;
          --v75;
          v77 -= v76;
          v79 -= v76;
          v81 += v76;
        }
        while (v80 < v48 + v75);
        v33 = v150;
        v36 = v157;
        v27 = v147;
      }
      goto LABEL_34;
    }
    v147 = v2;
    v150 = v33;
    v162 = v39 * v37;
    v49 = v36 + 2;
    v50 = v39 * v48;
    while (1)
    {
      v51 = v27;
      v52 = v155;
      outlined init with copy of AnnotatedCacheEntry(v47 + v50, v155);
      v53 = v156;
      outlined init with copy of AnnotatedCacheEntry(v47 + v162, v156);
      v54 = *(int *)(v164 + 48);
      v55 = *(double *)(v52 + v54);
      if (*(_BYTE *)(v52 + v54 + 8))
        v55 = 0.0;
      v56 = v53 + v54;
      v57 = *(double *)v56;
      if (*(_BYTE *)(v56 + 8))
        v57 = 0.0;
      v58 = v57 >= v55;
      outlined destroy of AnnotatedCacheEntry(v53);
      outlined destroy of AnnotatedCacheEntry(v52);
      if (v45 < v43 == v58)
        break;
      v47 += v166;
      ++v49;
      v27 = v51;
      if (v51 == v49)
      {
        v48 = v51;
        v33 = v150;
        v2 = v147;
        v36 = v157;
        goto LABEL_31;
      }
    }
    v33 = v150;
    v48 = v49;
    v2 = v147;
    v36 = v157;
    v27 = v51;
    if (v45 < v43)
      goto LABEL_58;
LABEL_34:
    if (v48 >= v27)
      goto LABEL_72;
    if (__OFSUB__(v48, v36))
      goto LABEL_153;
    if (v48 - v36 >= v149)
      goto LABEL_72;
    if (__OFADD__(v36, v149))
      goto LABEL_156;
    v59 = v36 + v149 >= v27 ? v27 : v36 + v149;
    if (v59 < v36)
      break;
    if (v48 != v59)
    {
      v157 = v36;
      v150 = v33;
      v147 = v2;
      v60 = *(_QWORD *)(v159 + 72);
      v166 = v60 * (v48 - 1);
      v162 = v60;
      v61 = v48 * v60;
      v153 = v59;
      do
      {
        v62 = 0;
        v63 = v157;
        while (1)
        {
          v64 = v48;
          v65 = *a1;
          v66 = v160;
          outlined init with copy of AnnotatedCacheEntry(v61 + v62 + *a1, v160);
          v67 = v166 + v62 + v65;
          v68 = v161;
          outlined init with copy of AnnotatedCacheEntry(v67, v161);
          v69 = *(int *)(v164 + 48);
          v70 = *(_BYTE *)(v66 + v69 + 8) ? 0.0 : *(double *)(v66 + v69);
          v71 = v68 + v69;
          v72 = *(_BYTE *)(v71 + 8) ? 0.0 : *(double *)v71;
          outlined destroy of AnnotatedCacheEntry(v68);
          outlined destroy of AnnotatedCacheEntry(v66);
          if (v72 >= v70)
            break;
          v73 = *a1;
          if (!*a1)
            goto LABEL_158;
          v74 = v73 + v166 + v62;
          outlined init with take of AnnotatedCacheEntry(v73 + v61 + v62, v165);
          swift_arrayInitWithTakeFrontToBack();
          outlined init with take of AnnotatedCacheEntry(v165, v74);
          a1 = v163;
          v62 -= v162;
          ++v63;
          v48 = v64;
          if (v64 == v63)
            goto LABEL_45;
        }
        v48 = v64;
LABEL_45:
        ++v48;
        v166 += v162;
        v61 += v162;
      }
      while (v48 != v153);
      v48 = v153;
      v2 = v147;
      v33 = v150;
      v36 = v157;
    }
LABEL_72:
    if (v48 < v36)
      goto LABEL_148;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v166 = v48;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      v33 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((_QWORD *)v33 + 2) + 1, 1, v33);
    v88 = *((_QWORD *)v33 + 2);
    v87 = *((_QWORD *)v33 + 3);
    v35 = v88 + 1;
    if (v88 >= v87 >> 1)
      v33 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v87 > 1), v88 + 1, 1, v33);
    *((_QWORD *)v33 + 2) = v35;
    v89 = v33 + 32;
    v90 = &v33[16 * v88 + 32];
    v91 = v166;
    *(_QWORD *)v90 = v36;
    *((_QWORD *)v90 + 1) = v91;
    if (v88)
    {
      while (1)
      {
        v92 = v35 - 1;
        if (v35 >= 4)
        {
          v97 = &v89[16 * v35];
          v98 = *((_QWORD *)v97 - 8);
          v99 = *((_QWORD *)v97 - 7);
          v103 = __OFSUB__(v99, v98);
          v100 = v99 - v98;
          if (v103)
            goto LABEL_137;
          v102 = *((_QWORD *)v97 - 6);
          v101 = *((_QWORD *)v97 - 5);
          v103 = __OFSUB__(v101, v102);
          v95 = v101 - v102;
          v96 = v103;
          if (v103)
            goto LABEL_138;
          v104 = v35 - 2;
          v105 = &v89[16 * v35 - 32];
          v107 = *(_QWORD *)v105;
          v106 = *((_QWORD *)v105 + 1);
          v103 = __OFSUB__(v106, v107);
          v108 = v106 - v107;
          if (v103)
            goto LABEL_140;
          v103 = __OFADD__(v95, v108);
          v109 = v95 + v108;
          if (v103)
            goto LABEL_143;
          if (v109 >= v100)
          {
            v127 = &v89[16 * v92];
            v129 = *(_QWORD *)v127;
            v128 = *((_QWORD *)v127 + 1);
            v103 = __OFSUB__(v128, v129);
            v130 = v128 - v129;
            if (v103)
              goto LABEL_147;
            v120 = v95 < v130;
            goto LABEL_109;
          }
        }
        else
        {
          if (v35 != 3)
          {
            v121 = *((_QWORD *)v33 + 4);
            v122 = *((_QWORD *)v33 + 5);
            v103 = __OFSUB__(v122, v121);
            v114 = v122 - v121;
            v115 = v103;
            goto LABEL_103;
          }
          v94 = *((_QWORD *)v33 + 4);
          v93 = *((_QWORD *)v33 + 5);
          v103 = __OFSUB__(v93, v94);
          v95 = v93 - v94;
          v96 = v103;
        }
        if ((v96 & 1) != 0)
          goto LABEL_139;
        v104 = v35 - 2;
        v110 = &v89[16 * v35 - 32];
        v112 = *(_QWORD *)v110;
        v111 = *((_QWORD *)v110 + 1);
        v113 = __OFSUB__(v111, v112);
        v114 = v111 - v112;
        v115 = v113;
        if (v113)
          goto LABEL_142;
        v116 = &v89[16 * v92];
        v118 = *(_QWORD *)v116;
        v117 = *((_QWORD *)v116 + 1);
        v103 = __OFSUB__(v117, v118);
        v119 = v117 - v118;
        if (v103)
          goto LABEL_145;
        if (__OFADD__(v114, v119))
          goto LABEL_146;
        if (v114 + v119 >= v95)
        {
          v120 = v95 < v119;
LABEL_109:
          if (v120)
            v92 = v104;
          goto LABEL_111;
        }
LABEL_103:
        if ((v115 & 1) != 0)
          goto LABEL_141;
        v123 = &v89[16 * v92];
        v125 = *(_QWORD *)v123;
        v124 = *((_QWORD *)v123 + 1);
        v103 = __OFSUB__(v124, v125);
        v126 = v124 - v125;
        if (v103)
          goto LABEL_144;
        if (v126 < v114)
          goto LABEL_14;
LABEL_111:
        v131 = v92 - 1;
        if (v92 - 1 >= v35)
        {
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
LABEL_154:
          __break(1u);
LABEL_155:
          __break(1u);
LABEL_156:
          __break(1u);
          goto LABEL_157;
        }
        v132 = *a1;
        if (!*a1)
          goto LABEL_159;
        v133 = v33;
        v134 = &v89[16 * v131];
        v135 = *(_QWORD *)v134;
        v136 = &v89[16 * v92];
        v137 = *((_QWORD *)v136 + 1);
        specialized _merge<A>(low:mid:high:buffer:by:)(v132 + *(_QWORD *)(v159 + 72) * *(_QWORD *)v134, v132 + *(_QWORD *)(v159 + 72) * *(_QWORD *)v136, v132 + *(_QWORD *)(v159 + 72) * v137, v158);
        if (v2)
          goto LABEL_131;
        if (v137 < v135)
          goto LABEL_134;
        if (v92 > *((_QWORD *)v133 + 2))
          goto LABEL_135;
        *(_QWORD *)v134 = v135;
        *(_QWORD *)&v89[16 * v131 + 8] = v137;
        v138 = *((_QWORD *)v133 + 2);
        if (v92 >= v138)
          goto LABEL_136;
        v33 = v133;
        v35 = v138 - 1;
        memmove(&v89[16 * v92], v136 + 16, 16 * (v138 - 1 - v92));
        *((_QWORD *)v133 + 2) = v138 - 1;
        a1 = v163;
        if (v138 <= 2)
          goto LABEL_14;
      }
    }
    v35 = 1;
LABEL_14:
    v27 = a1[1];
    v34 = v166;
    if (v166 >= v27)
      goto LABEL_120;
  }
LABEL_157:
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  __break(1u);
LABEL_160:
  __break(1u);
LABEL_161:
  __break(1u);
LABEL_162:
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized MutableCollection<>._insertionSort(within:sortedEnd:by:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  char *v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v30 = a1;
  v33 = type metadata accessor for AnnotatedCacheEntry(0);
  v8 = MEMORY[0x24BDAC7A8](v33, v7);
  v34 = (uint64_t)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8, v10);
  v13 = (char *)&v28 - v12;
  result = MEMORY[0x24BDAC7A8](v11, v14);
  v18 = (char *)&v28 - v17;
  v32 = a3;
  v29 = a2;
  if (a3 != a2)
  {
    v31 = *(_QWORD *)(v16 + 72);
    v35 = v31 * v32;
    v36 = v31 * (v32 - 1);
LABEL_5:
    v19 = 0;
    v20 = v30;
    while (1)
    {
      v21 = *a4;
      outlined init with copy of AnnotatedCacheEntry(v35 + v19 + *a4, (uint64_t)v18);
      outlined init with copy of AnnotatedCacheEntry(v36 + v19 + v21, (uint64_t)v13);
      v22 = *(int *)(v33 + 48);
      if (v18[v22 + 8])
        v23 = 0.0;
      else
        v23 = *(double *)&v18[v22];
      v24 = &v13[v22];
      if (v24[8])
        v25 = 0.0;
      else
        v25 = *(double *)v24;
      outlined destroy of AnnotatedCacheEntry((uint64_t)v13);
      result = outlined destroy of AnnotatedCacheEntry((uint64_t)v18);
      if (v25 >= v23)
      {
LABEL_4:
        v36 += v31;
        v35 += v31;
        if (++v32 == v29)
          return result;
        goto LABEL_5;
      }
      v26 = *a4;
      if (!*a4)
        break;
      v27 = v26 + v36 + v19;
      outlined init with take of AnnotatedCacheEntry(v26 + v35 + v19, v34);
      swift_arrayInitWithTakeFrontToBack();
      result = outlined init with take of AnnotatedCacheEntry(v34, v27);
      v19 -= v31;
      if (v32 == ++v20)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t specialized _merge<A>(low:mid:high:buffer:by:)(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v32;
  double v33;
  char *v34;
  double v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v39;
  unint64_t v40;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  double v45;
  char *v46;
  double v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t result;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;

  v52 = a1;
  v7 = type metadata accessor for AnnotatedCacheEntry(0);
  v9 = MEMORY[0x24BDAC7A8](v7, v8);
  v11 = (char *)&v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v9, v12);
  v15 = (char *)&v51 - v14;
  v17 = MEMORY[0x24BDAC7A8](v13, v16);
  v19 = (char *)&v51 - v18;
  MEMORY[0x24BDAC7A8](v17, v20);
  v22 = (char *)&v51 - v21;
  v24 = *(_QWORD *)(v23 + 72);
  if (!v24)
  {
    __break(1u);
LABEL_76:
    __break(1u);
LABEL_77:
    __break(1u);
    goto LABEL_78;
  }
  if (a2 - v52 == 0x8000000000000000 && v24 == -1)
    goto LABEL_76;
  v25 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v24 == -1)
    goto LABEL_77;
  v26 = (uint64_t)(a2 - v52) / v24;
  v54 = a4;
  v55 = v52;
  v27 = v25 / v24;
  if (v26 >= v25 / v24)
  {
    if ((v27 & 0x8000000000000000) == 0)
    {
      v29 = v27 * v24;
      if (a4 < a2 || a2 + v29 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      v40 = a4 + v29;
      v53 = a4 + v29;
      v55 = a2;
      if (v29 >= 1 && v52 < a2)
      {
        v42 = -v24;
        do
        {
          outlined init with copy of AnnotatedCacheEntry(v40 + v42, (uint64_t)v15);
          v43 = a2 + v42;
          outlined init with copy of AnnotatedCacheEntry(a2 + v42, (uint64_t)v11);
          v44 = *(int *)(v7 + 48);
          if (v15[v44 + 8])
            v45 = 0.0;
          else
            v45 = *(double *)&v15[v44];
          v46 = &v11[v44];
          if (v46[8])
            v47 = 0.0;
          else
            v47 = *(double *)v46;
          v48 = a3 + v42;
          outlined destroy of AnnotatedCacheEntry((uint64_t)v11);
          outlined destroy of AnnotatedCacheEntry((uint64_t)v15);
          if (v47 >= v45)
          {
            v49 = v53;
            v53 += v42;
            if (a3 < v49 || v48 >= v49)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (a3 != v49)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            v43 = a2;
          }
          else
          {
            if (a3 < a2 || v48 >= a2)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (a3 != a2)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            v55 += v42;
          }
          v40 = v53;
          if (v53 <= a4)
            break;
          a2 = v43;
          a3 += v42;
        }
        while (v43 > v52);
      }
      goto LABEL_74;
    }
  }
  else if ((v26 & 0x8000000000000000) == 0)
  {
    v28 = v26 * v24;
    if (a4 < v52 || v52 + v28 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != v52)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    v30 = a4 + v28;
    v53 = a4 + v28;
    if (v28 >= 1 && a2 < a3)
    {
      do
      {
        outlined init with copy of AnnotatedCacheEntry(a2, (uint64_t)v22);
        outlined init with copy of AnnotatedCacheEntry(a4, (uint64_t)v19);
        v32 = *(int *)(v7 + 48);
        if (v22[v32 + 8])
          v33 = 0.0;
        else
          v33 = *(double *)&v22[v32];
        v34 = &v19[v32];
        if (v34[8])
          v35 = 0.0;
        else
          v35 = *(double *)v34;
        outlined destroy of AnnotatedCacheEntry((uint64_t)v19);
        outlined destroy of AnnotatedCacheEntry((uint64_t)v22);
        v36 = v55;
        if (v35 >= v33)
        {
          v39 = v54 + v24;
          if (v55 < v54 || v55 >= v39)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v55 != v54)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          v54 = v39;
          v37 = a2;
        }
        else
        {
          v37 = a2 + v24;
          if (v55 < a2 || v55 >= v37)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v55 == a2)
          {
            v36 = a2;
          }
          else
          {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        v55 = v36 + v24;
        a4 = v54;
        if (v54 >= v30)
          break;
        a2 = v37;
      }
      while (v37 < a3);
    }
LABEL_74:
    specialized $defer #1 <A>() in _merge<A>(low:mid:high:buffer:by:)(&v55, &v54, (uint64_t *)&v53);
    return 1;
  }
LABEL_78:
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t outlined init with take of AnnotatedCacheEntry(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AnnotatedCacheEntry(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *UniversalEmbeddingProvider.defaultDimension.unsafeMutableAddressor()
{
  return &static UniversalEmbeddingProvider.defaultDimension;
}

uint64_t static UniversalEmbeddingProvider.defaultDimension.getter()
{
  return 512;
}

id UniversalEmbeddingProvider.init()()
{
  return objc_msgSend((id)objc_opt_self(), sel_service);
}

Swift::Void __swiftcall UniversalEmbeddingProvider.warmup()()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  Class isa;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  NSObject *v18;
  id v19;
  _QWORD aBlock[6];

  v1 = v0;
  v2 = type metadata accessor for OSSignpostID();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for log != -1)
    swift_once();
  v7 = (id)static Logger.log;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE642C8]), sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_24020D1B0;
  *(_QWORD *)(v9 + 32) = v8;
  aBlock[0] = v9;
  specialized Array._endMutation()();
  type metadata accessor for MADTextRequest(0, &lazy cache variable for type metadata for MADTextRequest);
  v10 = v8;
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  aBlock[4] = closure #1 in UniversalEmbeddingProvider.warmup();
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ();
  aBlock[3] = &block_descriptor;
  v12 = _Block_copy(aBlock);
  v13 = objc_msgSend(v1, sel_prewarmTextRequests_completionHandler_, isa, v12);
  _Block_release(v12);

  if (v13 == -1)
  {
    if (one-time initialization token for logger != -1)
      swift_once();
    v14 = type metadata accessor for Logger();
    __swift_project_value_buffer(v14, (uint64_t)static Logger.logger);
    v15 = Logger.logObject.getter();
    v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_2401E6000, v15, v16, "Failed to request text embedding prewarming", v17, 2u);
      MEMORY[0x24268046C](v17, -1, -1);
      v18 = v10;
      v10 = v15;
    }
    else
    {
      v18 = v15;
    }

  }
  v19 = (id)static Logger.log;
  static os_signpost_type_t.end.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

void closure #1 in UniversalEmbeddingProvider.warmup()(void *a1)
{
  id v2;
  uint64_t v3;
  id v4;
  id v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  os_log_type_t v12;
  uint8_t *v13;
  NSObject *oslog;
  uint64_t v15;

  if (a1)
  {
    v2 = a1;
    if (one-time initialization token for logger != -1)
      swift_once();
    v3 = type metadata accessor for Logger();
    __swift_project_value_buffer(v3, (uint64_t)static Logger.logger);
    v4 = a1;
    v5 = a1;
    oslog = Logger.logObject.getter();
    v6 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      v8 = swift_slowAlloc();
      v15 = v8;
      *(_DWORD *)v7 = 136315138;
      swift_getErrorValue();
      v9 = Error.localizedDescription.getter();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v9, v10, &v15);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_2401E6000, oslog, v6, "Failed to prewarm text embedding, error: %s", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24268046C](v8, -1, -1);
      MEMORY[0x24268046C](v7, -1, -1);

      return;
    }

  }
  else
  {
    if (one-time initialization token for logger != -1)
      swift_once();
    v11 = type metadata accessor for Logger();
    __swift_project_value_buffer(v11, (uint64_t)static Logger.logger);
    oslog = Logger.logObject.getter();
    v12 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(oslog, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_2401E6000, oslog, v12, "Finished prewarming text embedding", v13, 2u);
      MEMORY[0x24268046C](v13, -1, -1);
    }
  }

}

void thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ()(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

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

uint64_t UniversalEmbeddingProvider.dimension()(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1[3] = a1;
  v2 = type metadata accessor for OSSignpostID();
  v1[4] = v2;
  v1[5] = *(_QWORD *)(v2 - 8);
  v1[6] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t UniversalEmbeddingProvider.dimension()()
{
  _QWORD *v0;
  uint64_t v1;
  id v2;
  id v3;
  uint64_t v4;
  _QWORD *v5;

  if (one-time initialization token for log != -1)
    swift_once();
  v1 = v0[3];
  v2 = (id)static Logger.log;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE642C8]), sel_init);
  v0[7] = v3;
  v4 = swift_task_alloc();
  v0[8] = v4;
  *(_QWORD *)(v4 + 16) = v1;
  *(_QWORD *)(v4 + 24) = v3;
  v5 = (_QWORD *)swift_task_alloc();
  v0[9] = v5;
  *v5 = v0;
  v5[1] = UniversalEmbeddingProvider.dimension();
  return withCheckedContinuation<A>(isolation:function:_:)();
}

{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v1 = *(_QWORD *)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);

  v4 = *(_QWORD *)(v0 + 16);
  v5 = (id)static Logger.log;
  static os_signpost_type_t.end.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v4);
}

void closure #1 in UniversalEmbeddingProvider.dimension()(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  Class isa;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  Class v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  __int128 v20;
  uint64_t v21;
  id v22;
  _QWORD aBlock[6];

  v21 = a1;
  v22 = a2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<Int, Never>);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4, v7);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  v8 = swift_allocObject();
  v20 = xmmword_24020D1B0;
  *(_OWORD *)(v8 + 16) = xmmword_24020D1B0;
  *(_QWORD *)(v8 + 32) = a3;
  aBlock[0] = v8;
  specialized Array._endMutation()();
  type metadata accessor for MADTextRequest(0, &lazy cache variable for type metadata for MADTextRequest);
  v9 = a3;
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = v20;
  v12 = objc_allocWithZone(MEMORY[0x24BE642D8]);
  v13 = (void *)MEMORY[0x24267FDAC](0x6F77206F6C6C6568, 0xEB00000000646C72);
  v14 = objc_msgSend(v12, sel_initWithText_, v13);

  *(_QWORD *)(v11 + 32) = v14;
  aBlock[0] = v11;
  specialized Array._endMutation()();
  type metadata accessor for MADTextRequest(0, &lazy cache variable for type metadata for MADTextInput);
  v15 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v21, v4);
  v16 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v17 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v17 + v16, (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  *(_QWORD *)(v17 + ((v6 + v16 + 7) & 0xFFFFFFFFFFFFFFF8)) = v9;
  aBlock[4] = partial apply for closure #1 in closure #1 in UniversalEmbeddingProvider.dimension();
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@unowned Int32, @guaranteed Error?) -> ();
  aBlock[3] = &block_descriptor_15;
  v18 = _Block_copy(aBlock);
  v19 = v9;
  swift_release();
  objc_msgSend(v22, sel_performRequests_textInputs_completionHandler_, isa, v15, v18);
  _Block_release(v18);

}

void closure #1 in closure #1 in UniversalEmbeddingProvider.dimension()(int a1, id a2, uint64_t a3, void *a4)
{
  uint64_t v4;
  unint64_t v6;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v20;
  unint64_t v21;
  NSObject *v22;
  uint8_t *v23;
  ValueWitnessTable *v24;
  id v25;
  unint64_t v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  NSObject *v31;
  os_log_type_t v32;
  ValueWitnessTable *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;

  v6 = 0x256FDA000uLL;
  if (a2)
  {
    v8 = a2;
    if (one-time initialization token for logger != -1)
      swift_once();
    v9 = type metadata accessor for Logger();
    __swift_project_value_buffer(v9, (uint64_t)static Logger.logger);
    v10 = a2;
    v11 = a2;
    v12 = Logger.logObject.getter();
    v13 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = swift_slowAlloc();
      v15 = swift_slowAlloc();
      v40 = v15;
      *(_DWORD *)v14 = 67109378;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v14 + 8) = 2080;
      swift_getErrorValue();
      v16 = Error.localizedDescription.getter();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v16, v17, &v40);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_2401E6000, v12, v13, "Failed to fetch dimension for request id %d, error: %s", (uint8_t *)v14, 0x12u);
      swift_arrayDestroy();
      v18 = v15;
      v6 = 0x256FDA000;
      MEMORY[0x24268046C](v18, -1, -1);
      MEMORY[0x24268046C](v14, -1, -1);
    }
    else
    {

    }
    v40 = 512;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<Int, Never>);
    CheckedContinuation.resume(returning:)();

    if (a1 == -1)
      goto LABEL_33;
    return;
  }
  if (one-time initialization token for logger != -1)
    swift_once();
  v20 = type metadata accessor for Logger();
  __swift_project_value_buffer(v20, (uint64_t)static Logger.logger);
  v21 = a4;
  v22 = Logger.logObject.getter();
  LOBYTE(v23) = static os_log_type_t.default.getter();
  v24 = &value witness table for EmbeddingError;
  if (!os_log_type_enabled(v22, (os_log_type_t)v23))
  {

    goto LABEL_18;
  }
  v4 = swift_slowAlloc();
  *(_DWORD *)v4 = 67109376;
  LODWORD(v40) = a1;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  *(_WORD *)(v4 + 8) = 2048;
  v25 = objc_msgSend((id)v21, sel_embeddingResults);
  if (v25)
  {
    type metadata accessor for MADTextRequest(0, &lazy cache variable for type metadata for MADTextEmbeddingResult);
    v26 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (v26 >> 62)
      goto LABEL_42;
    v25 = *(id *)((v26 & 0xFFFFFFFFFFFFF8) + 0x10);

    swift_bridgeObjectRelease();
    v6 = 0x256FDA000;
  }
  else
  {

  }
  while (1)
  {
    v40 = (uint64_t)v25;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    _os_log_impl(&dword_2401E6000, v22, (os_log_type_t)v23, "Finished fetching dimension for request id %d and got back %ld results", (uint8_t *)v4, 0x12u);
    MEMORY[0x24268046C](v4, -1, -1);

LABEL_18:
    v27 = objc_msgSend((id)v21, *(SEL *)&v24[25].flags);
    if (!v27)
      break;
    v28 = v27;
    type metadata accessor for MADTextRequest(0, &lazy cache variable for type metadata for MADTextEmbeddingResult);
    v21 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (v21 >> 62)
    {
      swift_bridgeObjectRetain();
      v22 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (!v22)
      {
LABEL_31:
        swift_bridgeObjectRelease();
        break;
      }
    }
    else
    {
      v22 = *(NSObject **)((v21 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (!v22)
        goto LABEL_31;
    }
    if ((v21 & 0xC000000000000001) != 0)
    {
      v29 = (id)MEMORY[0x24267FF68](0, v21);
    }
    else
    {
      if (!*(_QWORD *)((v21 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        goto LABEL_41;
      }
      v29 = *(id *)(v21 + 32);
    }
    v30 = v29;
    swift_bridgeObjectRelease();
    v21 = v30;
    v31 = Logger.logObject.getter();
    v32 = static os_log_type_t.default.getter();
    v33 = &value witness table for EmbeddingError;
    if (os_log_type_enabled(v31, v32))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v23 = 134217984;
      v4 = (uint64_t)(v23 + 12);
      v34 = objc_msgSend((id)v21, sel_embedding);
      v24 = (ValueWitnessTable *)objc_msgSend(v34, sel_type);

      v33 = &value witness table for EmbeddingError;
      v40 = (uint64_t)v24;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      _os_log_impl(&dword_2401E6000, v31, v32, "Embedding is of type %lu for this hardware", v23, 0xCu);
      MEMORY[0x24268046C](v23, -1, -1);
    }
    else
    {

      v31 = v21;
    }

    v22 = objc_msgSend((id)v21, (SEL)v33[26].initializeBufferWithCopyOfBuffer);
    v35 = (uint64_t)-[NSObject count](v22, sel_count);

    if ((v35 & 0x8000000000000000) == 0)
    {
      v40 = v35;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<Int, Never>);
      CheckedContinuation.resume(returning:)();

      if (a1 != -1)
        return;
      goto LABEL_33;
    }
LABEL_41:
    __break(1u);
LABEL_42:
    swift_bridgeObjectRetain();
    v25 = (id)_CocoaArrayWrapper.endIndex.getter();

    swift_bridgeObjectRelease_n();
    v6 = 0x256FDA000;
  }
  v40 = 512;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<Int, Never>);
  CheckedContinuation.resume(returning:)();
  if (a1 != -1)
    return;
LABEL_33:
  if (*(_QWORD *)(v6 + 1384) != -1)
    swift_once();
  v36 = type metadata accessor for Logger();
  __swift_project_value_buffer(v36, (uint64_t)static Logger.logger);
  v37 = Logger.logObject.getter();
  v38 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v37, v38))
  {
    v39 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v39 = 0;
    _os_log_impl(&dword_2401E6000, v37, v38, "Failed to request text embedding", v39, 2u);
    MEMORY[0x24268046C](v39, -1, -1);
  }

}

void thunk for @escaping @callee_guaranteed (@unowned Int32, @guaranteed Error?) -> ()(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

uint64_t UniversalEmbeddingProvider.embedding(input:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;

  v3[5] = a2;
  v3[6] = a3;
  v3[4] = a1;
  v4 = type metadata accessor for OSSignpostID();
  v3[7] = v4;
  v3[8] = *(_QWORD *)(v4 - 8);
  v3[9] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t UniversalEmbeddingProvider.embedding(input:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  id v5;
  _QWORD *v6;
  _QWORD *v7;

  if (one-time initialization token for log != -1)
    swift_once();
  v1 = v0[5];
  v2 = v0[6];
  v3 = v0[4];
  v4 = (id)static Logger.log;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE642C8]), sel_init);
  v0[10] = v5;
  v6 = (_QWORD *)swift_task_alloc();
  v0[11] = v6;
  v6[2] = v2;
  v6[3] = v5;
  v6[4] = v3;
  v6[5] = v1;
  v7 = (_QWORD *)swift_task_alloc();
  v0[12] = v7;
  *v7 = v0;
  v7[1] = UniversalEmbeddingProvider.embedding(input:);
  return withCheckedThrowingContinuation<A>(isolation:function:_:)();
}

{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 104) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v1 = *(_QWORD *)(v0 + 72);
  v2 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 64);

  v4 = *(_QWORD *)(v0 + 16);
  v5 = *(_QWORD *)(v0 + 24);
  v6 = (id)static Logger.log;
  static os_signpost_type_t.end.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;

  v2 = *(_QWORD *)(v0 + 64);
  v1 = *(_QWORD *)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 56);

  swift_task_dealloc();
  v4 = (id)static Logger.log;
  static os_signpost_type_t.end.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void closure #1 in UniversalEmbeddingProvider.embedding(input:)(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  Class v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  Class v23;
  __int128 v24;
  Class isa;
  uint64_t v26;
  id v27;
  _QWORD aBlock[6];

  v26 = a1;
  v27 = a2;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<Data, Error>);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](v8, v11);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  v12 = swift_allocObject();
  v24 = xmmword_24020D1B0;
  *(_OWORD *)(v12 + 16) = xmmword_24020D1B0;
  *(_QWORD *)(v12 + 32) = a3;
  aBlock[0] = v12;
  specialized Array._endMutation()();
  type metadata accessor for MADTextRequest(0, &lazy cache variable for type metadata for MADTextRequest);
  v13 = a3;
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = v24;
  v15 = objc_allocWithZone(MEMORY[0x24BE642D8]);
  swift_bridgeObjectRetain();
  v16 = (void *)MEMORY[0x24267FDAC](a4, a5);
  swift_bridgeObjectRelease();
  v17 = objc_msgSend(v15, sel_initWithText_, v16);

  *(_QWORD *)(v14 + 32) = v17;
  aBlock[0] = v14;
  specialized Array._endMutation()();
  type metadata accessor for MADTextRequest(0, &lazy cache variable for type metadata for MADTextInput);
  v18 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v26, v8);
  v19 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v20 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v20 + v19, (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  *(_QWORD *)(v20 + ((v10 + v19 + 7) & 0xFFFFFFFFFFFFFFF8)) = v13;
  aBlock[4] = partial apply for closure #1 in closure #1 in UniversalEmbeddingProvider.embedding(input:);
  aBlock[5] = v20;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@unowned Int32, @guaranteed Error?) -> ();
  aBlock[3] = &block_descriptor_9;
  v21 = _Block_copy(aBlock);
  v22 = v13;
  swift_release();
  v23 = isa;
  objc_msgSend(v27, sel_performRequests_textInputs_completionHandler_, isa, v18, v21);
  _Block_release(v21);

}

void closure #1 in closure #1 in UniversalEmbeddingProvider.embedding(input:)(int a1, id a2, uint64_t a3, void *a4)
{
  uint64_t v4;
  unint64_t v6;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v20;
  unint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  id v24;
  unint64_t v25;
  uint64_t v26;
  _BYTE *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  os_log_type_t v34;
  ValueWitnessTable *v35;
  uint8_t *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _BYTE *v45;
  uint64_t v46;
  NSObject *v47;
  os_log_type_t v48;
  uint8_t *v49;
  uint64_t v50[2];

  v6 = 0x256FDA000uLL;
  if (!a2)
  {
    if (one-time initialization token for logger != -1)
      swift_once();
    v20 = type metadata accessor for Logger();
    __swift_project_value_buffer(v20, (uint64_t)static Logger.logger);
    v21 = a4;
    v22 = Logger.logObject.getter();
    v23 = static os_log_type_t.default.getter();
    if (!os_log_type_enabled(v22, v23))
    {

      goto LABEL_18;
    }
    v4 = swift_slowAlloc();
    *(_DWORD *)v4 = 67109376;
    LODWORD(v50[0]) = a1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v4 + 8) = 2048;
    v24 = objc_msgSend((id)v21, sel_embeddingResults);
    if (v24)
    {
      type metadata accessor for MADTextRequest(0, &lazy cache variable for type metadata for MADTextEmbeddingResult);
      v25 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

      if (v25 >> 62)
        goto LABEL_40;
      v24 = *(id *)((v25 & 0xFFFFFFFFFFFFF8) + 0x10);

      swift_bridgeObjectRelease();
      v6 = 0x256FDA000;
    }
    else
    {

    }
    while (1)
    {
      v50[0] = (uint64_t)v24;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      _os_log_impl(&dword_2401E6000, v22, v23, "Finished generating embedding for request id %d and got back %ld results", (uint8_t *)v4, 0x12u);
      MEMORY[0x24268046C](v4, -1, -1);

LABEL_18:
      v28 = objc_msgSend((id)v21, sel_embeddingResults);
      if (!v28)
        goto LABEL_31;
      v29 = v28;
      type metadata accessor for MADTextRequest(0, &lazy cache variable for type metadata for MADTextEmbeddingResult);
      v21 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

      if (v21 >> 62)
      {
        swift_bridgeObjectRetain();
        v22 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
        if (!v22)
        {
LABEL_30:
          swift_bridgeObjectRelease();
LABEL_31:
          lazy protocol witness table accessor for type EmbeddingError and conformance EmbeddingError();
          v44 = swift_allocError();
          *v45 = 1;
          v50[0] = v44;
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<Data, Error>);
          CheckedContinuation.resume(throwing:)();
          if (a1 != -1)
            return;
          goto LABEL_32;
        }
      }
      else
      {
        v22 = *(NSObject **)((v21 & 0xFFFFFFFFFFFFF8) + 0x10);
        if (!v22)
          goto LABEL_30;
      }
      if ((v21 & 0xC000000000000001) != 0)
        break;
      if (*(_QWORD *)((v21 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        v30 = *(id *)(v21 + 32);
        goto LABEL_24;
      }
      __break(1u);
LABEL_40:
      swift_bridgeObjectRetain();
      v24 = (id)_CocoaArrayWrapper.endIndex.getter();

      swift_bridgeObjectRelease_n();
      v6 = 0x256FDA000;
    }
    v30 = (id)MEMORY[0x24267FF68](0, v21);
LABEL_24:
    v31 = v30;
    swift_bridgeObjectRelease();
    v32 = v31;
    v33 = Logger.logObject.getter();
    v34 = static os_log_type_t.default.getter();
    v35 = &value witness table for EmbeddingError;
    if (os_log_type_enabled(v33, v34))
    {
      v36 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v36 = 134217984;
      v37 = -[NSObject embedding](v32, sel_embedding);
      v38 = objc_msgSend(v37, sel_type);

      v35 = &value witness table for EmbeddingError;
      v50[0] = (uint64_t)v38;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      _os_log_impl(&dword_2401E6000, v33, v34, "Embedding is of type %lu for this hardware", v36, 0xCu);
      MEMORY[0x24268046C](v36, -1, -1);
    }
    else
    {

      v33 = v32;
    }

    v39 = objc_msgSend(v32, (SEL)v35[26].initializeBufferWithCopyOfBuffer);
    v40 = objc_msgSend(v39, sel_data);

    v41 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    v43 = v42;

    v50[0] = v41;
    v50[1] = v43;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<Data, Error>);
    CheckedContinuation.resume(returning:)();

    if (a1 != -1)
      return;
    goto LABEL_32;
  }
  v8 = a2;
  if (one-time initialization token for logger != -1)
    swift_once();
  v9 = type metadata accessor for Logger();
  __swift_project_value_buffer(v9, (uint64_t)static Logger.logger);
  v10 = a2;
  v11 = a2;
  v12 = Logger.logObject.getter();
  v13 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc();
    v15 = swift_slowAlloc();
    v50[0] = v15;
    *(_DWORD *)v14 = 67109378;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v14 + 8) = 2080;
    swift_getErrorValue();
    v16 = Error.localizedDescription.getter();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v16, v17, v50);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2401E6000, v12, v13, "Failed to generate embedding for request id %d, error: %s", (uint8_t *)v14, 0x12u);
    swift_arrayDestroy();
    v18 = v15;
    v6 = 0x256FDA000;
    MEMORY[0x24268046C](v18, -1, -1);
    MEMORY[0x24268046C](v14, -1, -1);
  }
  else
  {

  }
  lazy protocol witness table accessor for type EmbeddingError and conformance EmbeddingError();
  v26 = swift_allocError();
  *v27 = 1;
  v50[0] = v26;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<Data, Error>);
  CheckedContinuation.resume(throwing:)();

  if (a1 == -1)
  {
LABEL_32:
    if (*(_QWORD *)(v6 + 1384) != -1)
      swift_once();
    v46 = type metadata accessor for Logger();
    __swift_project_value_buffer(v46, (uint64_t)static Logger.logger);
    v47 = Logger.logObject.getter();
    v48 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v47, v48))
    {
      v49 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v49 = 0;
      _os_log_impl(&dword_2401E6000, v47, v48, "Failed to request text embedding", v49, 2u);
      MEMORY[0x24268046C](v49, -1, -1);
    }

  }
}

uint64_t protocol witness for EmbeddingProviding.dimension() in conformance UniversalEmbeddingProvider()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *v0;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = protocol witness for EmbeddingProviding.dimension() in conformance UniversalEmbeddingProvider;
  return UniversalEmbeddingProvider.dimension()(v2);
}

uint64_t protocol witness for EmbeddingProviding.dimension() in conformance UniversalEmbeddingProvider(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

void protocol witness for EmbeddingProviding.warmup() in conformance UniversalEmbeddingProvider()
{
  UniversalEmbeddingProvider.warmup()();
}

uint64_t protocol witness for EmbeddingProviding.embedding(input:) in conformance UniversalEmbeddingProvider(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v6;
  _QWORD *v7;

  v6 = *v2;
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = protocol witness for EmbeddingProviding.embedding(input:) in conformance UniversalEmbeddingProvider;
  return UniversalEmbeddingProvider.embedding(input:)(a1, a2, v6);
}

{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = *v3;
  v7 = swift_task_dealloc();
  if (!v2)
  {
    v7 = a1;
    v8 = a2;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
}

void partial apply for closure #1 in UniversalEmbeddingProvider.dimension()(uint64_t a1)
{
  uint64_t v1;

  closure #1 in UniversalEmbeddingProvider.dimension()(a1, *(void **)(v1 + 16), *(void **)(v1 + 24));
}

void partial apply for closure #1 in UniversalEmbeddingProvider.embedding(input:)(uint64_t a1)
{
  uint64_t v1;

  closure #1 in UniversalEmbeddingProvider.embedding(input:)(a1, *(void **)(v1 + 16), *(void **)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40));
}

ValueMetadata *type metadata accessor for UniversalEmbeddingProvider()
{
  return &type metadata for UniversalEmbeddingProvider;
}

uint64_t sub_2401F0CC0()
{
  return objectdestroyTm(&demangling cache variable for type metadata for CheckedContinuation<Data, Error>);
}

uint64_t partial apply for closure #1 in closure #1 in UniversalEmbeddingProvider.embedding(input:)(uint64_t a1, uint64_t a2)
{
  return partial apply for closure #1 in closure #1 in UniversalEmbeddingProvider.embedding(input:)(a1, a2, &demangling cache variable for type metadata for CheckedContinuation<Data, Error>, (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))closure #1 in closure #1 in UniversalEmbeddingProvider.embedding(input:));
}

unint64_t lazy protocol witness table accessor for type EmbeddingError and conformance EmbeddingError()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type EmbeddingError and conformance EmbeddingError;
  if (!lazy protocol witness table cache variable for type EmbeddingError and conformance EmbeddingError)
  {
    result = MEMORY[0x2426803DC](&protocol conformance descriptor for EmbeddingError, &type metadata for EmbeddingError);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type EmbeddingError and conformance EmbeddingError);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type EmbeddingError and conformance EmbeddingError;
  if (!lazy protocol witness table cache variable for type EmbeddingError and conformance EmbeddingError)
  {
    result = MEMORY[0x2426803DC](&protocol conformance descriptor for EmbeddingError, &type metadata for EmbeddingError);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type EmbeddingError and conformance EmbeddingError);
  }
  return result;
}

uint64_t type metadata accessor for MADTextRequest(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_2401F0D5C()
{
  return objectdestroyTm(&demangling cache variable for type metadata for CheckedContinuation<Int, Never>);
}

uint64_t objectdestroyTm(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = (*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(unint64_t, uint64_t))(v3 + 8))(v1 + v4, v2);

  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #1 in UniversalEmbeddingProvider.dimension()(uint64_t a1, uint64_t a2)
{
  return partial apply for closure #1 in closure #1 in UniversalEmbeddingProvider.embedding(input:)(a1, a2, &demangling cache variable for type metadata for CheckedContinuation<Int, Never>, (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))closure #1 in closure #1 in UniversalEmbeddingProvider.dimension());
}

uint64_t partial apply for closure #1 in closure #1 in UniversalEmbeddingProvider.embedding(input:)(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(uint64_t, uint64_t, unint64_t, _QWORD))
{
  uint64_t v4;
  uint64_t v7;
  unint64_t v8;

  v7 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(a3) - 8);
  v8 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  return a4(a1, a2, v4 + v8, *(_QWORD *)(v4 + ((*(_QWORD *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFF8)));
}

uint64_t ListRequest.searchKey.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

void ListRequest.strategy.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 16);
}

uint64_t ListRequest.loggingTraceId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for ListRequest() + 24);
  v4 = type metadata accessor for UUID();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t type metadata accessor for ListRequest()
{
  uint64_t result;

  result = type metadata singleton initialization cache for ListRequest;
  if (!type metadata singleton initialization cache for ListRequest)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t ListRequest.maxResult.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for ListRequest() + 28));
}

uint64_t ListRequest.init(searchKey:strategy:maxResult:loggingTraceId:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;

  v9 = *a3;
  *(_QWORD *)a6 = a1;
  *(_QWORD *)(a6 + 8) = a2;
  *(_BYTE *)(a6 + 16) = v9;
  v10 = type metadata accessor for ListRequest();
  v11 = a6 + *(int *)(v10 + 24);
  v12 = type metadata accessor for UUID();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v11, a5, v12);
  *(_QWORD *)(a6 + *(int *)(v10 + 28)) = a4;
  return result;
}

uint64_t ListRequest.init(searchKey:strategy:loggingTraceId:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  v7 = *a3;
  *(_QWORD *)a5 = a1;
  *(_QWORD *)(a5 + 8) = a2;
  *(_BYTE *)(a5 + 16) = v7;
  v8 = type metadata accessor for ListRequest();
  v9 = a5 + *(int *)(v8 + 24);
  v10 = type metadata accessor for UUID();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v9, a4, v10);
  *(_QWORD *)(a5 + *(int *)(v8 + 28)) = 1;
  return result;
}

uint64_t ListRequest.init(searchKey:strategy:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  char v5;
  uint64_t v6;
  uint64_t result;

  v5 = *a3;
  *(_QWORD *)a4 = a1;
  *(_QWORD *)(a4 + 8) = a2;
  *(_BYTE *)(a4 + 16) = v5;
  v6 = type metadata accessor for ListRequest();
  result = UUID.init()();
  *(_QWORD *)(a4 + *(int *)(v6 + 28)) = 1;
  return result;
}

LLMCache::SearchStrategy_optional __swiftcall SearchStrategy.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  void *object;
  Swift::String v3;
  char *v4;
  Swift::Int v5;
  LLMCache::SearchStrategy_optional result;
  char v7;

  object = rawValue._object;
  v3._countAndFlagsBits = rawValue._countAndFlagsBits;
  v4 = v1;
  v3._object = object;
  v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of SearchStrategy.init(rawValue:), v3);
  result.value = swift_bridgeObjectRelease();
  if (v5 == 1)
    v7 = 1;
  else
    v7 = 2;
  if (!v5)
    v7 = 0;
  *v4 = v7;
  return result;
}

uint64_t SearchStrategy.rawValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x74614D7463617865;
  else
    return 0xD000000000000010;
}

unint64_t lazy protocol witness table accessor for type SearchStrategy and conformance SearchStrategy()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchStrategy and conformance SearchStrategy;
  if (!lazy protocol witness table cache variable for type SearchStrategy and conformance SearchStrategy)
  {
    result = MEMORY[0x2426803DC](&protocol conformance descriptor for SearchStrategy, &type metadata for SearchStrategy);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchStrategy and conformance SearchStrategy);
  }
  return result;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance SearchStrategy()
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance SearchStrategy()
{
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance SearchStrategy()
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

LLMCache::SearchStrategy_optional protocol witness for RawRepresentable.init(rawValue:) in conformance SearchStrategy(Swift::String *a1)
{
  return SearchStrategy.init(rawValue:)(*a1);
}

void protocol witness for RawRepresentable.rawValue.getter in conformance SearchStrategy(unint64_t *a1@<X8>)
{
  _BYTE *v1;
  unint64_t v2;
  unint64_t v3;

  v2 = 0xD000000000000010;
  if (*v1)
    v2 = 0x74614D7463617865;
  v3 = 0x800000024020DCC0;
  if (*v1)
    v3 = 0xEA00000000006863;
  *a1 = v2;
  a1[1] = v3;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance SearchStrategy(char *a1, char *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

_QWORD *initializeBufferWithCopyOfBuffer for ListRequest(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  uint64_t v13;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v13 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v7;
    *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
    v8 = *(int *)(a3 + 24);
    v9 = a1 + v8;
    v10 = (uint64_t)a2 + v8;
    v11 = type metadata accessor for UUID();
    v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    *(_QWORD *)((char *)v4 + *(int *)(a3 + 28)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 28));
  }
  return v4;
}

uint64_t destroy for ListRequest(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = type metadata accessor for UUID();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t initializeWithCopy for ListRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v7 = *(int *)(a3 + 24);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = type metadata accessor for UUID();
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  *(_QWORD *)(a1 + *(int *)(a3 + 28)) = *(_QWORD *)(a2 + *(int *)(a3 + 28));
  return a1;
}

uint64_t assignWithCopy for ListRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v6 = *(int *)(a3 + 24);
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  *(_QWORD *)(a1 + *(int *)(a3 + 28)) = *(_QWORD *)(a2 + *(int *)(a3 + 28));
  return a1;
}

uint64_t initializeWithTake for ListRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v6 = *(int *)(a3 + 24);
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  *(_QWORD *)(a1 + *(int *)(a3 + 28)) = *(_QWORD *)(a2 + *(int *)(a3 + 28));
  return a1;
}

uint64_t assignWithTake for ListRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v7 = *(int *)(a3 + 24);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  *(_QWORD *)(a1 + *(int *)(a3 + 28)) = *(_QWORD *)(a2 + *(int *)(a3 + 28));
  return a1;
}

uint64_t getEnumTagSinglePayload for ListRequest()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2401F1688(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = type metadata accessor for UUID();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 24), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for ListRequest()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2401F1710(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v7 = type metadata accessor for UUID();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata completion function for ListRequest()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for UUID();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for SearchStrategy(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2401F1858 + 4 * byte_24020D235[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2401F188C + 4 * asc_24020D230[v4]))();
}

uint64_t sub_2401F188C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2401F1894(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2401F189CLL);
  return result;
}

uint64_t sub_2401F18A8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2401F18B0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2401F18B4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2401F18BC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SearchStrategy()
{
  return &type metadata for SearchStrategy;
}

uint64_t dispatch thunk of CacheDatabase.delete(entries:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 8) + *(_QWORD *)(a3 + 8));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = dispatch thunk of CacheDatabase.delete(entries:);
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of CacheDatabase.delete(entries:)()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t dispatch thunk of CacheDatabase.describe(identifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v11;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a5 + 16) + *(_QWORD *)(a5 + 16));
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v11;
  *v11 = v5;
  v11[1] = dispatch thunk of CacheDatabase.describe(identifier:);
  return v13(a1, a2, a3, a4, a5);
}

uint64_t dispatch thunk of CacheDatabase.insert(entries:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 24) + *(_QWORD *)(a3 + 24));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = dispatch thunk of CacheDatabase.describe(identifier:);
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of CacheDatabase.list(namespace:searchKey:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v11;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a5 + 32) + *(_QWORD *)(a5 + 32));
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v11;
  *v11 = v5;
  v11[1] = dispatch thunk of CacheDatabase.list(namespace:searchKey:);
  return v13(a1, a2, a3, a4, a5);
}

uint64_t dispatch thunk of CacheDatabase.list(namespace:searchKey:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t dispatch thunk of CacheDatabase.listAll(namespace:nextToken:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v11;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a5 + 40) + *(_QWORD *)(a5 + 40));
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v11;
  *v11 = v5;
  v11[1] = dispatch thunk of CacheDatabase.listAll(namespace:nextToken:);
  return v13(a1, a2, a3, a4, a5);
}

uint64_t dispatch thunk of CacheDatabase.deleteAll(namespace:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 48) + *(_QWORD *)(a3 + 48));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = dispatch thunk of CacheDatabase.describe(identifier:);
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of CacheDatabase.warmup()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 56) + *(_QWORD *)(a2 + 56));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = dispatch thunk of CacheDatabase.describe(identifier:);
  return v7(a1, a2);
}

uint64_t specialized == infix<A>(_:_:)(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2;
  unint64_t v3;
  unint64_t v4;
  int v5;
  unint64_t v6;
  unint64_t v7;
  char v8;

  v2 = a1;
  if (a1)
  {
    if (a1 == 1)
      v3 = 1819047270;
    else
      v3 = 0xD000000000000012;
    if (v2 == 1)
      v4 = 0xE400000000000000;
    else
      v4 = 0x800000024020DCF0;
    v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1)
        v6 = 1819047270;
      else
        v6 = 0xD000000000000012;
      if (v5 == 1)
        v7 = 0xE400000000000000;
      else
        v7 = 0x800000024020DCF0;
      if (v3 != v6)
        goto LABEL_21;
      goto LABEL_19;
    }
  }
  else
  {
    v4 = 0xE400000000000000;
    v3 = 1953718630;
    v5 = a2;
    if (a2)
      goto LABEL_9;
  }
  v7 = 0xE400000000000000;
  if (v3 != 1953718630)
  {
LABEL_21:
    v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7)
    goto LABEL_21;
  v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
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
    v3 = 0x74614D7463617865;
  else
    v3 = 0xD000000000000010;
  if (v2)
    v4 = 0x800000024020DCC0;
  else
    v4 = 0xEA00000000006863;
  if ((a2 & 1) != 0)
    v5 = 0x74614D7463617865;
  else
    v5 = 0xD000000000000010;
  if ((a2 & 1) != 0)
    v6 = 0xEA00000000006863;
  else
    v6 = 0x800000024020DCC0;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t LLMCacheManaging.pruneExpiredEntries()()
{
  return swift_task_switch();
}

{
  uint64_t v0;
  _BYTE *v1;

  lazy protocol witness table accessor for type LLMCacheManagerError and conformance LLMCacheManagerError();
  swift_allocError();
  *v1 = 1;
  swift_willThrow();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  return swift_task_switch();
}

unint64_t lazy protocol witness table accessor for type LLMCacheManagerError and conformance LLMCacheManagerError()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type LLMCacheManagerError and conformance LLMCacheManagerError;
  if (!lazy protocol witness table cache variable for type LLMCacheManagerError and conformance LLMCacheManagerError)
  {
    result = MEMORY[0x2426803DC](&protocol conformance descriptor for LLMCacheManagerError, &type metadata for LLMCacheManagerError);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LLMCacheManagerError and conformance LLMCacheManagerError);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type LLMCacheManagerError and conformance LLMCacheManagerError;
  if (!lazy protocol witness table cache variable for type LLMCacheManagerError and conformance LLMCacheManagerError)
  {
    result = MEMORY[0x2426803DC](&protocol conformance descriptor for LLMCacheManagerError, &type metadata for LLMCacheManagerError);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LLMCacheManagerError and conformance LLMCacheManagerError);
  }
  return result;
}

void *LLMCacheManager.defaultTTLInSeconds.unsafeMutableAddressor()
{
  return &static LLMCacheManager.defaultTTLInSeconds;
}

double static LLMCacheManager.defaultTTLInSeconds.getter()
{
  return 15552000.0;
}

void *LLMCacheManager.defaultPageSize.unsafeMutableAddressor()
{
  return &static LLMCacheManager.defaultPageSize;
}

uint64_t static LLMCacheManager.defaultPageSize.getter()
{
  return 1000;
}

void LLMCacheManager.namespace.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 112);
}

uint64_t LLMCacheManager.db.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return outlined init with copy of CacheDatabase(v1 + 120, a1);
}

uint64_t outlined init with copy of CacheDatabase(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

double LLMCacheManager.ttl.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 160);
}

uint64_t LLMCacheManager.logEmitter.getter()
{
  return swift_retain();
}

uint64_t LLMCacheManager.__allocating_init(namespace:databasePath:)(_BYTE *a1, uint64_t a2)
{
  uint64_t v2;
  void **v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  NSURL *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD *v20;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40[2];

  v40[1] = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)(v2 + 144) = a2;
  v5 = (void **)(v2 + 120);
  v6 = type metadata accessor for URL();
  *(_QWORD *)(v2 + 152) = v6;
  v7 = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v2 + 160) = v7;
  v8 = swift_task_alloc();
  *(_QWORD *)(v2 + 168) = v8;
  v9 = type metadata accessor for OSSignpostID();
  *(_QWORD *)(v2 + 176) = v9;
  *(_QWORD *)(v2 + 184) = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v2 + 192) = swift_task_alloc();
  *(_BYTE *)(v2 + 224) = *a1;
  if (one-time initialization token for log != -1)
    swift_once();
  v10 = (id)static Logger.log;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  v11 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  URL._bridgeToObjectiveC()(v12);
  v14 = v13;
  *v5 = 0;
  v15 = objc_msgSend(v11, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v13, 1, 0, v2 + 120);

  v16 = *v5;
  if (v15)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v8, a2, v6);
    v17 = (void *)objc_opt_self();
    v18 = v16;
    v19 = objc_msgSend(v17, sel_service);
    *(_QWORD *)(v2 + 40) = &type metadata for UniversalEmbeddingProvider;
    *(_QWORD *)(v2 + 48) = &protocol witness table for UniversalEmbeddingProvider;
    *(_QWORD *)(v2 + 16) = v19;
    *(_QWORD *)(v2 + 200) = type metadata accessor for VectorDatabaseAccess();
    swift_allocObject();
    v20 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v2 + 208) = v20;
    *v20 = v2;
    v20[1] = LLMCacheManager.__allocating_init(namespace:databasePath:);
    return VectorDatabaseAccess.init(path:embeddingProvider:)(v8, (_QWORD *)(v2 + 16));
  }
  else
  {
    v22 = v16;
    v23 = (void *)_convertNSErrorToError(_:)();

    swift_willThrow();
    if (one-time initialization token for logger != -1)
      swift_once();
    v24 = type metadata accessor for Logger();
    __swift_project_value_buffer(v24, (uint64_t)static Logger.logger);
    v25 = v23;
    v26 = v23;
    v27 = Logger.logObject.getter();
    v28 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc();
      v30 = swift_slowAlloc();
      v40[0] = v30;
      *(_DWORD *)v29 = 136315138;
      swift_getErrorValue();
      v31 = Error.localizedDescription.getter();
      *(_QWORD *)(v2 + 136) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v31, v32, v40);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_2401E6000, v27, v28, "Failed to initialize LLMCacheManager: %s", v29, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24268046C](v30, -1, -1);
      MEMORY[0x24268046C](v29, -1, -1);
    }
    else
    {

    }
    v34 = *(_QWORD *)(v2 + 184);
    v33 = *(_QWORD *)(v2 + 192);
    v35 = *(_QWORD *)(v2 + 176);
    v36 = *(_QWORD *)(v2 + 152);
    v37 = *(_QWORD *)(v2 + 160);
    v38 = *(_QWORD *)(v2 + 144);
    swift_willThrow();
    v39 = (id)static Logger.log;
    static os_signpost_type_t.end.getter();
    os_signpost(_:dso:log:name:signpostID:)();

    (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v38, v36);
    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v33, v35);
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v2 + 8))();
  }
}

uint64_t LLMCacheManager.__allocating_init(namespace:databasePath:)(uint64_t a1)
{
  void *v1;
  uint64_t *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29[2];
  uint64_t v30;

  v3 = v1;
  v29[1] = *MEMORY[0x24BDAC8D0];
  v5 = *v2;
  v30 = *v2;
  v6 = *v2;
  v30 = v6;
  swift_task_dealloc();
  if (v3)
  {
    if (one-time initialization token for logger != -1)
      swift_once();
    v7 = type metadata accessor for Logger();
    __swift_project_value_buffer(v7, (uint64_t)static Logger.logger);
    v8 = v3;
    v9 = v3;
    v10 = Logger.logObject.getter();
    v11 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      v13 = swift_slowAlloc();
      v29[0] = v13;
      *(_DWORD *)v12 = 136315138;
      swift_getErrorValue();
      v14 = Error.localizedDescription.getter();
      *(_QWORD *)(v5 + 136) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v14, v15, v29);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_2401E6000, v10, v11, "Failed to initialize LLMCacheManager: %s", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24268046C](v13, -1, -1);
      MEMORY[0x24268046C](v12, -1, -1);
    }
    else
    {

    }
    v23 = *(_QWORD *)(v5 + 184);
    v22 = *(_QWORD *)(v5 + 192);
    v24 = *(_QWORD *)(v5 + 176);
    v25 = *(_QWORD *)(v5 + 152);
    v26 = *(_QWORD *)(v5 + 160);
    v27 = *(_QWORD *)(v5 + 144);
    swift_willThrow();
    v28 = (id)static Logger.log;
    static os_signpost_type_t.end.getter();
    os_signpost(_:dso:log:name:signpostID:)();

    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v27, v25);
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v24);
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v6 + 8))();
  }
  else
  {
    v16 = *(_QWORD *)(v5 + 200);
    v17 = *(_BYTE *)(v5 + 224);
    type metadata accessor for BiomeLogEmitter();
    v18 = swift_allocObject();
    *(_QWORD *)(v5 + 56) = a1;
    v19 = v5 + 56;
    *(_QWORD *)(v19 + 24) = v16;
    *(_QWORD *)(v19 + 32) = &protocol witness table for VectorDatabaseAccess;
    type metadata accessor for LLMCacheManager();
    v20 = swift_allocObject();
    *(_QWORD *)(v19 + 160) = v20;
    swift_retain();
    swift_defaultActor_initialize();
    *(_BYTE *)(v20 + 112) = v17;
    outlined init with take of ContiguousBytes((__int128 *)v19, v20 + 120);
    *(_QWORD *)(v20 + 160) = 0x416DA9C000000000;
    *(_QWORD *)(v20 + 168) = v18;
    swift_release();
    return swift_task_switch();
  }
}

uint64_t LLMCacheManager.__allocating_init(namespace:databasePath:)()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  if (one-time initialization token for logger != -1)
    swift_once();
  v1 = type metadata accessor for Logger();
  __swift_project_value_buffer(v1, (uint64_t)static Logger.logger);
  v2 = Logger.logObject.getter();
  v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2401E6000, v2, v3, "LLMCacheManager init completed", v4, 2u);
    MEMORY[0x24268046C](v4, -1, -1);
  }
  v6 = *(_QWORD *)(v0 + 184);
  v5 = *(_QWORD *)(v0 + 192);
  v7 = *(_QWORD *)(v0 + 176);
  v8 = *(_QWORD *)(v0 + 152);
  v9 = *(_QWORD *)(v0 + 160);
  v10 = *(_QWORD *)(v0 + 144);

  v11 = (id)static Logger.log;
  static os_signpost_type_t.end.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v10, v8);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 216));
}

uint64_t LLMCacheManager.__allocating_init(namespace:databaseAccess:ttl:logEmitter:)(_BYTE *a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v5;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;

  v10 = a4 & 1;
  v11 = *(_QWORD *)(a2 + 24);
  v12 = *(_QWORD *)(a2 + 32);
  v13 = __swift_mutable_project_boxed_opaque_existential_1(a2, v11);
  MEMORY[0x24BDAC7A8](v13, v13);
  v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v16 + 16))(v15);
  v17 = specialized LLMCacheManager.__allocating_init(namespace:databaseAccess:ttl:logEmitter:)(a1, (uint64_t)v15, a3, v10, a5, v5, v11, v12);
  __swift_destroy_boxed_opaque_existential_1Tm(a2);
  return v17;
}

uint64_t LLMCacheManager.init(namespace:databaseAccess:ttl:logEmitter:)(char *a1, __int128 *a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v5;
  char v10;
  double v11;

  v10 = *a1;
  swift_defaultActor_initialize();
  *(_BYTE *)(v5 + 112) = v10;
  outlined init with take of ContiguousBytes(a2, v5 + 120);
  v11 = *(double *)&a3;
  if ((a4 & 1) != 0)
    v11 = 15552000.0;
  *(double *)(v5 + 160) = v11;
  *(_QWORD *)(v5 + 168) = a5;
  return v5;
}

uint64_t LLMCacheManager.list(with:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3[21] = a2;
  v3[22] = v2;
  v3[20] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AnnotatedCacheEntry?);
  v3[23] = swift_task_alloc();
  v4 = type metadata accessor for Date();
  v3[24] = v4;
  v3[25] = *(_QWORD *)(v4 - 8);
  v3[26] = swift_task_alloc();
  v3[27] = swift_task_alloc();
  v5 = type metadata accessor for AnnotatedCacheEntry(0);
  v3[28] = v5;
  v3[29] = *(_QWORD *)(v5 - 8);
  v3[30] = swift_task_alloc();
  v3[31] = swift_task_alloc();
  v3[32] = swift_task_alloc();
  v3[33] = swift_task_alloc();
  v3[34] = swift_task_alloc();
  v3[35] = swift_task_alloc();
  v3[36] = swift_task_alloc();
  v6 = type metadata accessor for UUID();
  v3[37] = v6;
  v3[38] = *(_QWORD *)(v6 - 8);
  v3[39] = swift_task_alloc();
  v3[40] = type metadata accessor for ListRequest();
  v3[41] = swift_task_alloc();
  v3[42] = swift_task_alloc();
  v3[43] = swift_task_alloc();
  v7 = type metadata accessor for OSSignpostID();
  v3[44] = v7;
  v3[45] = *(_QWORD *)(v7 - 8);
  v3[46] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t LLMCacheManager.list(with:)()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  char v34;
  uint64_t v35;

  if (one-time initialization token for log != -1)
    swift_once();
  v1 = (id)static Logger.log;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  if (one-time initialization token for logger != -1)
    swift_once();
  v2 = *(_QWORD *)(v0 + 336);
  v3 = *(_QWORD *)(v0 + 344);
  v4 = *(_QWORD *)(v0 + 168);
  v5 = type metadata accessor for Logger();
  *(_QWORD *)(v0 + 376) = __swift_project_value_buffer(v5, (uint64_t)static Logger.logger);
  outlined init with copy of ListRequest(v4, v3, (uint64_t (*)(_QWORD))type metadata accessor for ListRequest);
  outlined init with copy of ListRequest(v4, v2, (uint64_t (*)(_QWORD))type metadata accessor for ListRequest);
  v6 = Logger.logObject.getter();
  v7 = static os_log_type_t.debug.getter();
  v8 = os_log_type_enabled(v6, v7);
  v9 = *(_QWORD *)(v0 + 336);
  v10 = *(uint64_t **)(v0 + 344);
  if (v8)
  {
    v11 = swift_slowAlloc();
    v12 = swift_slowAlloc();
    v35 = v12;
    *(_DWORD *)v11 = 136315394;
    v13 = *v10;
    v14 = v10[1];
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 152) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v13, v14, &v35);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    outlined destroy of ListRequest((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for ListRequest);
    *(_WORD *)(v11 + 12) = 2080;
    if (*(_BYTE *)(v9 + 16))
      v15 = 0x74614D7463617865;
    else
      v15 = 0xD000000000000010;
    if (*(_BYTE *)(v9 + 16))
      v16 = 0xEA00000000006863;
    else
      v16 = 0x800000024020DCC0;
    *(_QWORD *)(v0 + 112) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, v16, &v35);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    outlined destroy of ListRequest(v9, (uint64_t (*)(_QWORD))type metadata accessor for ListRequest);
    _os_log_impl(&dword_2401E6000, v6, v7, "LLMCacheManager entering list with search key: %s, strategy: %s...", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24268046C](v12, -1, -1);
    MEMORY[0x24268046C](v11, -1, -1);
  }
  else
  {
    outlined destroy of ListRequest(*(_QWORD *)(v0 + 344), (uint64_t (*)(_QWORD))type metadata accessor for ListRequest);
    outlined destroy of ListRequest(v9, (uint64_t (*)(_QWORD))type metadata accessor for ListRequest);
  }

  if ((LLMCacheManager.isEnabled()() & 1) != 0)
  {
    v17 = *(_QWORD *)(v0 + 320);
    v18 = *(uint64_t **)(v0 + 168);
    v19 = *(_QWORD *)(v0 + 176);
    v20 = *(_QWORD *)(v19 + 168);
    *(_QWORD *)(v0 + 384) = v20;
    v21 = (char *)v18 + *(int *)(v17 + 24);
    v34 = *(_BYTE *)(v19 + 112);
    v22 = v34;
    (*(void (**)(char *, char *, uint64_t *))(*(_QWORD *)v20 + 112))(v21, &v34, v18);
    v23 = (_QWORD *)(v19 + 120);
    v24 = *(_QWORD *)(v19 + 144);
    v25 = *(_QWORD *)(v19 + 152);
    __swift_project_boxed_opaque_existential_1(v23, v24);
    *(_BYTE *)(v0 + 472) = v22;
    v27 = *v18;
    v26 = v18[1];
    v33 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(v25 + 32)
                                                                              + *(_QWORD *)(v25 + 32));
    v28 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 392) = v28;
    *v28 = v0;
    v28[1] = LLMCacheManager.list(with:);
    return v33(v0 + 472, v27, v26, v24, v25);
  }
  else
  {
    v30 = *(_QWORD *)(v0 + 360);
    v31 = *(_QWORD *)(v0 + 368);
    v32 = *(_QWORD *)(v0 + 352);
    **(_QWORD **)(v0 + 160) = MEMORY[0x24BEE4AF8];
    $defer #1 () in LLMCacheManager.list(with:)();
    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v31, v32);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

{
  _QWORD *v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  void (*v17)(uint64_t, uint64_t);
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  _QWORD *v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  _QWORD *v32;
  unint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t (*v61)(unint64_t, uint64_t, uint64_t);

  v3 = v0[50];
  v58 = *(_QWORD *)(v3 + 16);
  if (v58)
  {
    v4 = 0;
    v51 = v0[41];
    v59 = v0[28];
    v56 = v0[25];
    v57 = v0[29];
    v52 = v0[21];
    v5 = MEMORY[0x24BEE4AF8];
    v6 = (uint64_t)type metadata accessor for AnnotatedCacheEntry;
    v53 = (*(unsigned __int8 *)(v57 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v57 + 80);
    v54 = v0[50];
    v55 = v3 + v53;
    v7 = MEMORY[0x24BEE4AF8];
    while (1)
    {
      if (v4 >= *(_QWORD *)(v3 + 16))
      {
        __break(1u);
        goto LABEL_55;
      }
      v60 = v7;
      v1 = v5;
      v13 = v0[26];
      v12 = v0[27];
      v14 = v0[24];
      v15 = *(_QWORD *)(v57 + 72);
      outlined init with copy of ListRequest(v55 + v15 * v4, v0[36], type metadata accessor for AnnotatedCacheEntry);
      Date.addingTimeInterval(_:)();
      static Date.now.getter();
      v16 = static Date.< infix(_:_:)();
      v17 = *(void (**)(uint64_t, uint64_t))(v56 + 8);
      v17(v13, v14);
      v17(v12, v14);
      if ((v16 & 1) == 0)
        break;
      outlined init with copy of ListRequest(v0[36], v0[35], type metadata accessor for AnnotatedCacheEntry);
      v5 = v1;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v1 + 16) + 1, 1, v1, &demangling cache variable for type metadata for _ContiguousArrayStorage<AnnotatedCacheEntry>, type metadata accessor for AnnotatedCacheEntry);
      v7 = v60;
      v19 = *(_QWORD *)(v5 + 16);
      v18 = *(_QWORD *)(v5 + 24);
      v2 = v19 + 1;
      v3 = v54;
      if (v19 >= v18 >> 1)
        v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v18 > 1, v19 + 1, 1, v5, &demangling cache variable for type metadata for _ContiguousArrayStorage<AnnotatedCacheEntry>, type metadata accessor for AnnotatedCacheEntry);
      v8 = v0[35];
      v9 = v0[36];
      *(_QWORD *)(v5 + 16) = v2;
      v10 = v5 + v53;
LABEL_4:
      outlined init with take of AnnotatedCacheEntry(v8, v10 + v19 * v15);
LABEL_5:
      ++v4;
      v11 = v9;
      v6 = (uint64_t)type metadata accessor for AnnotatedCacheEntry;
      outlined destroy of ListRequest(v11, type metadata accessor for AnnotatedCacheEntry);
      if (v4 == v58)
      {
        swift_bridgeObjectRelease();
        goto LABEL_43;
      }
    }
    v20 = v0[41];
    v21 = v0[36];
    v22 = v0[34];
    v23 = v0[21];
    if (*(_BYTE *)(v52 + 16) == 1)
    {
      swift_bridgeObjectRelease();
      outlined init with copy of ListRequest(v21, v22, type metadata accessor for AnnotatedCacheEntry);
      outlined init with copy of ListRequest(v23, v20, (uint64_t (*)(_QWORD))type metadata accessor for ListRequest);
    }
    else
    {
      v24 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      outlined init with copy of ListRequest(v21, v22, type metadata accessor for AnnotatedCacheEntry);
      outlined init with copy of ListRequest(v23, v20, (uint64_t (*)(_QWORD))type metadata accessor for ListRequest);
      if ((v24 & 1) == 0)
      {
LABEL_21:
        v28 = v0[36];
        v30 = v0[33];
        v29 = v0[34];
        outlined destroy of ListRequest(v0[41], (uint64_t (*)(_QWORD))type metadata accessor for ListRequest);
        outlined destroy of ListRequest(v29, type metadata accessor for AnnotatedCacheEntry);
        outlined init with copy of ListRequest(v28, v30, type metadata accessor for AnnotatedCacheEntry);
        v7 = v60;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v7 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v60 + 16) + 1, 1, v60, &demangling cache variable for type metadata for _ContiguousArrayStorage<AnnotatedCacheEntry>, type metadata accessor for AnnotatedCacheEntry);
        v5 = v1;
        v3 = v54;
        v19 = *(_QWORD *)(v7 + 16);
        v31 = *(_QWORD *)(v7 + 24);
        v2 = v19 + 1;
        if (v19 >= v31 >> 1)
          v7 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v31 > 1, v19 + 1, 1, v7, &demangling cache variable for type metadata for _ContiguousArrayStorage<AnnotatedCacheEntry>, type metadata accessor for AnnotatedCacheEntry);
        v9 = v0[36];
        v8 = v0[33];
        *(_QWORD *)(v7 + 16) = v2;
        v10 = v7 + v53;
        goto LABEL_4;
      }
    }
    v25 = *(_QWORD **)(v0[34] + *(int *)(v59 + 36));
    v2 = v25[2];
    if (!v2)
      goto LABEL_27;
    v6 = *(_QWORD *)v0[41];
    v26 = *(_QWORD *)(v51 + 8);
    v27 = v25[4] == v6 && v25[5] == v26;
    if (!v27 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      if (v2 == 1)
        goto LABEL_27;
      if ((v25[6] != v6 || v25[7] != v26) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
      {
        if (v2 != 2)
        {
          v32 = v25 + 9;
          v5 = 2;
          while (1)
          {
            v33 = v5 + 1;
            if (__OFADD__(v5, 1))
              break;
            v34 = *(v32 - 1) == v6 && *v32 == v26;
            if (v34 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
              goto LABEL_21;
            ++v5;
            v32 += 2;
            if (v33 == v2)
              goto LABEL_27;
          }
LABEL_55:
          __break(1u);
LABEL_56:
          __break(1u);
          goto LABEL_57;
        }
LABEL_27:
        v9 = v0[36];
        v2 = v0[34];
        outlined destroy of ListRequest(v0[41], (uint64_t (*)(_QWORD))type metadata accessor for ListRequest);
        outlined destroy of ListRequest(v2, type metadata accessor for AnnotatedCacheEntry);
        v5 = v1;
        v7 = v60;
        v3 = v54;
        goto LABEL_5;
      }
    }
    goto LABEL_21;
  }
  swift_bridgeObjectRelease();
  v5 = MEMORY[0x24BEE4AF8];
  v7 = MEMORY[0x24BEE4AF8];
LABEL_43:
  v0[52] = v5;
  v35 = v0[51];
  v36 = v0[21];
  v37 = swift_task_alloc();
  *(_QWORD *)(v37 + 16) = v36;
  swift_bridgeObjectRetain();
  specialized MutableCollection<>.sort(by:)(partial apply for closure #1 in static LLMCacheManager.sortAndFilterListResult(_:request:), v37);
  if (v35)
    return swift_release();
  v39 = v0[40];
  v40 = v0[21];
  swift_task_dealloc();
  v6 = specialized Collection.prefix(_:)(*(_QWORD *)(v40 + *(int *)(v39 + 28)), v7);
  v4 = v41;
  v1 = v42;
  v2 = v43;
  if ((v43 & 1) != 0)
  {
    type metadata accessor for __ContiguousArrayStorageBase();
    swift_unknownObjectRetain_n();
    v45 = swift_dynamicCastClass();
    if (!v45)
    {
      swift_unknownObjectRelease();
      v45 = MEMORY[0x24BEE4AF8];
    }
    v46 = *(_QWORD *)(v45 + 16);
    swift_release();
    if (__OFSUB__(v2 >> 1, v1))
      goto LABEL_56;
    if (v46 == (v2 >> 1) - v1)
    {
      v44 = swift_dynamicCastClass();
      swift_bridgeObjectRelease();
      if (!v44)
      {
        swift_unknownObjectRelease();
        v44 = MEMORY[0x24BEE4AF8];
      }
      goto LABEL_53;
    }
LABEL_57:
    swift_unknownObjectRelease();
  }
  v44 = specialized _copyCollectionToContiguousArray<A>(_:)(v6, v4, v1, v2);
  swift_bridgeObjectRelease();
LABEL_53:
  v0[53] = v44;
  v47 = (_QWORD *)v0[22];
  swift_unknownObjectRelease();
  v48 = v47[18];
  v49 = v47[19];
  __swift_project_boxed_opaque_existential_1(v47 + 15, v48);
  v61 = (uint64_t (*)(unint64_t, uint64_t, uint64_t))(**(int **)(v49 + 8) + *(_QWORD *)(v49 + 8));
  swift_retain();
  swift_bridgeObjectRetain();
  v50 = (_QWORD *)swift_task_alloc();
  v0[54] = v50;
  *v50 = v0;
  v50[1] = LLMCacheManager.list(with:);
  return v61(v5, v48, v49);
}

{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 440) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t (*v31)(unint64_t, uint64_t, uint64_t);

  v1 = v0[53];
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v3 = (void *)v0[55];
    v4 = v0[29];
    v27 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
    v28 = v0[25];
    v5 = v1 + v27;
    v29 = v4;
    v6 = *(_QWORD *)(v4 + 72);
    swift_bridgeObjectRetain_n();
    v7 = MEMORY[0x24BEE4AF8];
    do
    {
      v30 = v7;
      v8 = v0[27];
      v9 = v0[24];
      outlined init with copy of ListRequest(v5, v0[32], type metadata accessor for AnnotatedCacheEntry);
      v10 = AnnotatedCacheEntry.builder()();
      static Date.now.getter();
      v11 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v10 + 376))(v8);
      swift_release();
      v12 = (*(uint64_t (**)(uint64_t, uint64_t))(v28 + 8))(v8, v9);
      (*(void (**)(uint64_t))(*(_QWORD *)v11 + 440))(v12);
      swift_release();
      if (v3)
      {

        v13 = 1;
      }
      else
      {
        v13 = 0;
      }
      v14 = v0[32];
      v15 = v0[28];
      v16 = v0[23];
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 56))(v16, v13, 1, v15);
      outlined destroy of ListRequest(v14, type metadata accessor for AnnotatedCacheEntry);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v29 + 48))(v16, 1, v15) == 1)
      {
        outlined destroy of Date?(v0[23], &demangling cache variable for type metadata for AnnotatedCacheEntry?);
        v7 = v30;
      }
      else
      {
        v18 = v0[30];
        v17 = v0[31];
        outlined init with take of AnnotatedCacheEntry(v0[23], v17);
        outlined init with take of AnnotatedCacheEntry(v17, v18);
        v7 = v30;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v7 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v30 + 16) + 1, 1, v30, &demangling cache variable for type metadata for _ContiguousArrayStorage<AnnotatedCacheEntry>, type metadata accessor for AnnotatedCacheEntry);
        v20 = *(_QWORD *)(v7 + 16);
        v19 = *(_QWORD *)(v7 + 24);
        if (v20 >= v19 >> 1)
          v7 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v19 > 1, v20 + 1, 1, v7, &demangling cache variable for type metadata for _ContiguousArrayStorage<AnnotatedCacheEntry>, type metadata accessor for AnnotatedCacheEntry);
        v21 = v0[30];
        *(_QWORD *)(v7 + 16) = v20 + 1;
        outlined init with take of AnnotatedCacheEntry(v21, v7 + v27 + v20 * v6);
      }
      v3 = 0;
      v5 += v6;
      --v2;
    }
    while (v2);
    swift_release_n();
  }
  else
  {
    v7 = MEMORY[0x24BEE4AF8];
  }
  v0[56] = v7;
  v22 = (_QWORD *)v0[22];
  v23 = v22[18];
  v24 = v22[19];
  __swift_project_boxed_opaque_existential_1(v22 + 15, v23);
  v31 = (uint64_t (*)(unint64_t, uint64_t, uint64_t))(**(int **)(v24 + 24) + *(_QWORD *)(v24 + 24));
  v25 = (_QWORD *)swift_task_alloc();
  v0[57] = v25;
  *v25 = v0;
  v25[1] = LLMCacheManager.list(with:);
  return v31(v7, v23, v24);
}

{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 464) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  swift_bridgeObjectRelease();
  v1 = *(_QWORD *)(v0 + 424);
  v3 = *(_QWORD *)(v0 + 304);
  v2 = *(_QWORD *)(v0 + 312);
  v4 = *(_QWORD *)(v0 + 296);
  v5 = *(_QWORD *)(v0 + 168);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(**(_QWORD **)(v0 + 384) + 120))(v2, v5, v1);
  v6 = swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v5;
  v7 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay8LLMCache19AnnotatedCacheEntryVG_AF0fG0Vs5NeverOTg5((void (*)(_QWORD *__return_ptr, uint64_t))partial apply for closure #2 in LLMCacheManager.list(with:), v6, v1);
  swift_release_n();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  v8 = *(_QWORD *)(v0 + 360);
  v9 = *(_QWORD *)(v0 + 368);
  v10 = *(_QWORD *)(v0 + 352);
  **(_QWORD **)(v0 + 160) = v7;
  $defer #1 () in LLMCacheManager.list(with:)();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v23[2];

  v1 = *(void **)(v0 + 408);
  v2 = v1;
  v3 = v1;
  v4 = Logger.logObject.getter();
  v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(void **)(v0 + 408);
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v23[0] = v8;
    *(_DWORD *)v7 = 136315138;
    swift_getErrorValue();
    v9 = Error.localizedDescription.getter();
    *(_QWORD *)(v0 + 88) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v9, v10, v23);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2401E6000, v4, v5, "Failed to list: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24268046C](v8, -1, -1);
    MEMORY[0x24268046C](v7, -1, -1);
  }
  else
  {
    v11 = *(void **)(v0 + 408);

  }
  v12 = *(void **)(v0 + 408);
  v13 = *(_QWORD *)(v0 + 384);
  v15 = *(_QWORD *)(v0 + 360);
  v14 = *(_QWORD *)(v0 + 368);
  v16 = *(_QWORD *)(v0 + 352);
  v18 = *(_QWORD *)(v0 + 304);
  v17 = *(_QWORD *)(v0 + 312);
  v19 = *(_QWORD *)(v0 + 296);
  v20 = *(_QWORD *)(v0 + 168);
  LOBYTE(v23[0]) = 1;
  (*(void (**)(uint64_t, uint64_t, uint64_t *))(*(_QWORD *)v13 + 128))(v17, v20, v23);
  lazy protocol witness table accessor for type LLMCacheManagerError and conformance LLMCacheManagerError();
  swift_allocError();
  *v21 = 1;
  swift_willThrow();

  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
  $defer #1 () in LLMCacheManager.list(with:)();
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  _QWORD *v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t (*v38)(unint64_t, uint64_t, uint64_t);
  uint64_t v39;

  v1 = (void *)v0[55];
  swift_bridgeObjectRelease();
  v2 = v1;
  v3 = v1;
  v4 = Logger.logObject.getter();
  v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (void *)v0[55];
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v39 = v8;
    *(_DWORD *)v7 = 136315138;
    swift_getErrorValue();
    v9 = Error.localizedDescription.getter();
    v0[18] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v9, v10, &v39);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2401E6000, v4, v5, "Failed to delete expired entries, error: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24268046C](v8, -1, -1);
    MEMORY[0x24268046C](v7, -1, -1);

  }
  else
  {
    v11 = (void *)v0[55];

  }
  v12 = v0[53];
  v13 = *(_QWORD *)(v12 + 16);
  if (v13)
  {
    v36 = v0[29];
    v37 = v0[25];
    v35 = (*(unsigned __int8 *)(v36 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80);
    v14 = v12 + v35;
    v15 = *(_QWORD *)(v36 + 72);
    swift_bridgeObjectRetain_n();
    v16 = MEMORY[0x24BEE4AF8];
    do
    {
      v17 = v0[27];
      v18 = v0[24];
      outlined init with copy of ListRequest(v14, v0[32], type metadata accessor for AnnotatedCacheEntry);
      v19 = AnnotatedCacheEntry.builder()();
      static Date.now.getter();
      v20 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v19 + 376))(v17);
      swift_release();
      v21 = (*(uint64_t (**)(uint64_t, uint64_t))(v37 + 8))(v17, v18);
      (*(void (**)(uint64_t))(*(_QWORD *)v20 + 440))(v21);
      swift_release();
      v22 = v0[32];
      v23 = v0[28];
      v24 = v0[23];
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v36 + 56))(v24, 0, 1, v23);
      outlined destroy of ListRequest(v22, type metadata accessor for AnnotatedCacheEntry);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v36 + 48))(v24, 1, v23) == 1)
      {
        outlined destroy of Date?(v0[23], &demangling cache variable for type metadata for AnnotatedCacheEntry?);
      }
      else
      {
        v26 = v0[30];
        v25 = v0[31];
        outlined init with take of AnnotatedCacheEntry(v0[23], v25);
        outlined init with take of AnnotatedCacheEntry(v25, v26);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v16 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v16 + 16) + 1, 1, v16, &demangling cache variable for type metadata for _ContiguousArrayStorage<AnnotatedCacheEntry>, type metadata accessor for AnnotatedCacheEntry);
        v28 = *(_QWORD *)(v16 + 16);
        v27 = *(_QWORD *)(v16 + 24);
        if (v28 >= v27 >> 1)
          v16 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v27 > 1, v28 + 1, 1, v16, &demangling cache variable for type metadata for _ContiguousArrayStorage<AnnotatedCacheEntry>, type metadata accessor for AnnotatedCacheEntry);
        v29 = v0[30];
        *(_QWORD *)(v16 + 16) = v28 + 1;
        outlined init with take of AnnotatedCacheEntry(v29, v16 + v35 + v28 * v15);
      }
      v14 += v15;
      --v13;
    }
    while (v13);
    swift_release_n();
  }
  else
  {
    v16 = MEMORY[0x24BEE4AF8];
  }
  v0[56] = v16;
  v30 = (_QWORD *)v0[22];
  v31 = v30[18];
  v32 = v30[19];
  __swift_project_boxed_opaque_existential_1(v30 + 15, v31);
  v38 = (uint64_t (*)(unint64_t, uint64_t, uint64_t))(**(int **)(v32 + 24) + *(_QWORD *)(v32 + 24));
  v33 = (_QWORD *)swift_task_alloc();
  v0[57] = v33;
  *v33 = v0;
  v33[1] = LLMCacheManager.list(with:);
  return v38(v16, v31, v32);
}

{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;

  v1 = *(void **)(v0 + 464);
  swift_bridgeObjectRelease();
  v2 = v1;
  v3 = v1;
  v4 = Logger.logObject.getter();
  v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(void **)(v0 + 464);
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v23 = v8;
    *(_DWORD *)v7 = 136315138;
    swift_getErrorValue();
    v9 = Error.localizedDescription.getter();
    *(_QWORD *)(v0 + 120) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v9, v10, &v23);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2401E6000, v4, v5, "Failed to update last accessed time for entries, error: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24268046C](v8, -1, -1);
    MEMORY[0x24268046C](v7, -1, -1);

  }
  else
  {
    v11 = *(void **)(v0 + 464);

  }
  v12 = *(_QWORD *)(v0 + 424);
  v14 = *(_QWORD *)(v0 + 304);
  v13 = *(_QWORD *)(v0 + 312);
  v15 = *(_QWORD *)(v0 + 296);
  v16 = *(_QWORD *)(v0 + 168);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(**(_QWORD **)(v0 + 384) + 120))(v13, v16, v12);
  v17 = swift_task_alloc();
  *(_QWORD *)(v17 + 16) = v16;
  v18 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay8LLMCache19AnnotatedCacheEntryVG_AF0fG0Vs5NeverOTg5((void (*)(_QWORD *__return_ptr, uint64_t))partial apply for closure #2 in LLMCacheManager.list(with:), v17, v12);
  swift_release_n();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  swift_task_dealloc();
  v19 = *(_QWORD *)(v0 + 360);
  v20 = *(_QWORD *)(v0 + 368);
  v21 = *(_QWORD *)(v0 + 352);
  **(_QWORD **)(v0 + 160) = v18;
  $defer #1 () in LLMCacheManager.list(with:)();
  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v20, v21);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t LLMCacheManager.list(with:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 400) = a1;
  *(_QWORD *)(v3 + 408) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

void $defer #1 () in LLMCacheManager.list(with:)()
{
  id v0;
  uint64_t v1;
  os_log_type_t v2;
  uint8_t *v3;
  NSObject *oslog;

  if (one-time initialization token for log != -1)
    swift_once();
  v0 = (id)static Logger.log;
  static os_signpost_type_t.end.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  if (one-time initialization token for logger != -1)
    swift_once();
  v1 = type metadata accessor for Logger();
  __swift_project_value_buffer(v1, (uint64_t)static Logger.logger);
  oslog = Logger.logObject.getter();
  v2 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(oslog, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2401E6000, oslog, v2, "LLMCacheManager leaving list...", v3, 2u);
    MEMORY[0x24268046C](v3, -1, -1);
  }

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

uint64_t static LLMCacheManager.sortAndFilterListResult(_:request:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[5];
  uint64_t v17;

  v16[2] = a2;
  v17 = a1;
  swift_bridgeObjectRetain();
  specialized MutableCollection<>.sort(by:)(closure #1 in static LLMCacheManager.sortAndFilterListResult(_:request:)partial apply, (uint64_t)v16);
  v3 = v17;
  v4 = type metadata accessor for ListRequest();
  v5 = specialized Collection.prefix(_:)(*(_QWORD *)(a2 + *(int *)(v4 + 28)), v3);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  if ((v10 & 1) == 0)
    goto LABEL_2;
  type metadata accessor for __ContiguousArrayStorageBase();
  swift_unknownObjectRetain_n();
  v13 = swift_dynamicCastClass();
  if (!v13)
  {
    swift_unknownObjectRelease();
    v13 = MEMORY[0x24BEE4AF8];
  }
  v14 = *(_QWORD *)(v13 + 16);
  swift_release();
  if (__OFSUB__(v11 >> 1, v9))
  {
    __break(1u);
    goto LABEL_11;
  }
  if (v14 != (v11 >> 1) - v9)
  {
LABEL_11:
    swift_unknownObjectRelease();
LABEL_2:
    v12 = specialized _copyCollectionToContiguousArray<A>(_:)(v5, v7, v9, v11);
    goto LABEL_9;
  }
  v12 = swift_dynamicCastClass();
  if (!v12)
  {
    swift_unknownObjectRelease();
    v12 = MEMORY[0x24BEE4AF8];
  }
LABEL_9:
  swift_unknownObjectRelease();
  return v12;
}

uint64_t closure #2 in LLMCacheManager.list(with:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t result;
  char v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;

  v5 = *a2;
  v6 = a2[1];
  v7 = type metadata accessor for AnnotatedCacheEntry(0);
  v8 = (uint64_t *)(a1 + *(int *)(v7 + 32));
  v9 = v8[1];
  v10 = *(_QWORD **)(a1 + *(int *)(v7 + 36));
  v11 = v10[2];
  v19 = *v8;
  if (!v11)
    goto LABEL_9;
  v12 = v10[4] == v5 && v10[5] == v6;
  if (v12 || (result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
  {
LABEL_7:
    v14 = 1;
LABEL_10:
    *(_QWORD *)a3 = v19;
    *(_QWORD *)(a3 + 8) = v9;
    *(_BYTE *)(a3 + 16) = v14;
    return swift_bridgeObjectRetain();
  }
  if (v11 == 1)
  {
LABEL_9:
    v14 = 0;
    goto LABEL_10;
  }
  v15 = v10 + 7;
  v16 = 1;
  while (1)
  {
    v17 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (*(v15 - 1) == v5 && *v15 == v6)
      goto LABEL_7;
    result = _stringCompareWithSmolCheck(_:_:expecting:)();
    if ((result & 1) != 0)
      goto LABEL_7;
    v14 = 0;
    v15 += 2;
    ++v16;
    if (v17 == v11)
      goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay8LLMCache19AnnotatedCacheEntryVG_AF0fG0Vs5NeverOTg5(void (*a1)(_QWORD *__return_ptr, uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  _QWORD v20[2];
  char v21;
  uint64_t v22;

  v4 = v3;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = MEMORY[0x24BEE4AF8];
  if (v5)
  {
    v22 = MEMORY[0x24BEE4AF8];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v5, 0);
    v6 = v22;
    v8 = *(_QWORD *)(type metadata accessor for AnnotatedCacheEntry(0) - 8);
    v9 = a3 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    v18 = *(_QWORD *)(v8 + 72);
    while (1)
    {
      a1(v20, v9);
      if (v4)
        break;
      v4 = 0;
      v10 = v20[0];
      v11 = v20[1];
      v12 = v21;
      v22 = v6;
      v14 = *(_QWORD *)(v6 + 16);
      v13 = *(_QWORD *)(v6 + 24);
      if (v14 >= v13 >> 1)
      {
        v16 = v20[0];
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v13 > 1, v14 + 1, 1);
        v10 = v16;
        v6 = v22;
      }
      *(_QWORD *)(v6 + 16) = v14 + 1;
      v15 = v6 + 24 * v14;
      *(_QWORD *)(v15 + 32) = v10;
      *(_QWORD *)(v15 + 40) = v11;
      *(_BYTE *)(v15 + 48) = v12;
      v9 += v18;
      if (!--v5)
        return v6;
    }
    swift_release();
  }
  return v6;
}

uint64_t LLMCacheManager.isEnabled()()
{
  uint64_t v0;
  char v1;
  char v2;
  char v3;
  char v5[24];
  ValueMetadata *v6;
  unint64_t v7;

  if (*(_BYTE *)(v0 + 112))
  {
    if (*(_BYTE *)(v0 + 112) == 1)
    {
      swift_beginAccess();
      v1 = static LLMCacheManagerFeatureFlags.forceEnabled;
      if (static LLMCacheManagerFeatureFlags.forceEnabled == 2)
      {
        v6 = &type metadata for LLMCacheManagerFeatureFlags;
        v7 = lazy protocol witness table accessor for type LLMCacheManagerFeatureFlags and conformance LLMCacheManagerFeatureFlags();
        v2 = 1;
LABEL_9:
        v5[0] = v2;
        goto LABEL_10;
      }
    }
    else
    {
      swift_beginAccess();
      v1 = static LLMCacheManagerFeatureFlags.forceEnabled;
      if (static LLMCacheManagerFeatureFlags.forceEnabled == 2)
      {
        v6 = &type metadata for LLMCacheManagerFeatureFlags;
        v7 = lazy protocol witness table accessor for type LLMCacheManagerFeatureFlags and conformance LLMCacheManagerFeatureFlags();
        v2 = 2;
        goto LABEL_9;
      }
    }
LABEL_11:
    v3 = v1 & 1;
    return v3 & 1;
  }
  swift_beginAccess();
  v1 = static LLMCacheManagerFeatureFlags.forceEnabled;
  if (static LLMCacheManagerFeatureFlags.forceEnabled != 2)
    goto LABEL_11;
  v6 = &type metadata for LLMCacheManagerFeatureFlags;
  v7 = lazy protocol witness table accessor for type LLMCacheManagerFeatureFlags and conformance LLMCacheManagerFeatureFlags();
  v5[0] = 0;
LABEL_10:
  v3 = isFeatureEnabled(_:)();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v5);
  return v3 & 1;
}

uint64_t closure #1 in static LLMCacheManager.sortAndFilterListResult(_:request:)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  _QWORD *v24;
  char v25;
  char v26;
  char v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  double *v31;
  char v32;
  uint64_t v33;
  double v34;
  char v35;
  double v36;
  double v37;
  uint64_t v39;
  uint64_t v40;

  v6 = type metadata accessor for ListRequest();
  v8 = MEMORY[0x24BDAC7A8](v6, v7);
  v10 = (uint64_t *)((char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v8, v11);
  v13 = (uint64_t *)((char *)&v39 - v12);
  v14 = type metadata accessor for AnnotatedCacheEntry(0);
  v16 = MEMORY[0x24BDAC7A8](v14, v15);
  v18 = (char *)&v39 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v16, v19);
  v22 = (char *)&v39 - v21;
  v23 = *(int *)(v20 + 36);
  v39 = a1;
  v24 = *(_QWORD **)(a1 + v23);
  LOBYTE(a1) = specialized Sequence<>.contains(_:)(*a3, a3[1], v24);
  v40 = a2;
  outlined init with copy of ListRequest(a2, (uint64_t)v22, type metadata accessor for AnnotatedCacheEntry);
  outlined init with copy of ListRequest((uint64_t)a3, (uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for ListRequest);
  if ((a1 & 1) == 0)
  {
    outlined destroy of ListRequest((uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for ListRequest);
    outlined destroy of ListRequest((uint64_t)v22, type metadata accessor for AnnotatedCacheEntry);
LABEL_5:
    v27 = specialized Sequence<>.contains(_:)(*a3, a3[1], v24);
    v28 = v40;
    outlined init with copy of ListRequest(v40, (uint64_t)v18, type metadata accessor for AnnotatedCacheEntry);
    outlined init with copy of ListRequest((uint64_t)a3, (uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for ListRequest);
    if ((v27 & 1) != 0)
    {
      outlined destroy of ListRequest((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for ListRequest);
      outlined destroy of ListRequest((uint64_t)v18, type metadata accessor for AnnotatedCacheEntry);
    }
    else
    {
      v29 = specialized Sequence<>.contains(_:)(*v10, v10[1], *(_QWORD **)&v18[*(int *)(v14 + 36)]);
      outlined destroy of ListRequest((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for ListRequest);
      outlined destroy of ListRequest((uint64_t)v18, type metadata accessor for AnnotatedCacheEntry);
      if ((v29 & 1) != 0)
      {
        v26 = 0;
        return v26 & 1;
      }
    }
    v30 = *(int *)(v14 + 48);
    v31 = (double *)(v39 + v30);
    v32 = *(_BYTE *)(v39 + v30 + 8);
    v33 = v28 + v30;
    v34 = *(double *)(v28 + v30);
    v35 = *(_BYTE *)(v33 + 8);
    if ((v32 & 1) != 0)
    {
      if ((v35 & 1) == 0)
      {
        v36 = v34;
        v37 = 0.0;
LABEL_15:
        v26 = v36 < v37;
        return v26 & 1;
      }
    }
    else
    {
      v37 = *v31;
      v36 = 0.0;
      if ((v35 & 1) != 0)
        goto LABEL_15;
      v36 = v34;
      if (v37 != v34)
        goto LABEL_15;
    }
    v26 = static Date.> infix(_:_:)();
    return v26 & 1;
  }
  v25 = specialized Sequence<>.contains(_:)(*v13, v13[1], *(_QWORD **)&v22[*(int *)(v14 + 36)]);
  outlined destroy of ListRequest((uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for ListRequest);
  outlined destroy of ListRequest((uint64_t)v22, type metadata accessor for AnnotatedCacheEntry);
  if ((v25 & 1) != 0)
    goto LABEL_5;
  v26 = 1;
  return v26 & 1;
}

uint64_t specialized Collection.prefix(_:)(uint64_t result, uint64_t a2)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    v3 = *(_QWORD *)(a2 + 16);
    if ((uint64_t)v3 >= result)
      v4 = result;
    else
      v4 = *(_QWORD *)(a2 + 16);
    if (result)
      v5 = v4;
    else
      v5 = 0;
    if (v3 >= v5)
    {
      type metadata accessor for AnnotatedCacheEntry(0);
      return a2;
    }
  }
  __break(1u);
  return result;
}

uint64_t LLMCacheManager.insert(searchKey:llmOutput:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  v5[7] = type metadata accessor for InsertRequest();
  v5[8] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t LLMCacheManager.insert(searchKey:llmOutput:)()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v1 = (_QWORD *)v0[8];
  v3 = v0[4];
  v2 = v0[5];
  v5 = v0[2];
  v4 = v0[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  UUID.init()();
  *v1 = v5;
  v1[1] = v4;
  v1[2] = v3;
  v1[3] = v2;
  v6 = (_QWORD *)swift_task_alloc();
  v0[9] = v6;
  *v6 = v0;
  v6[1] = LLMCacheManager.insert(searchKey:llmOutput:);
  return LLMCacheManager.insert(with:)(v0[8]);
}

{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 80) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;

  outlined destroy of ListRequest(*(_QWORD *)(v0 + 64), (uint64_t (*)(_QWORD))type metadata accessor for InsertRequest);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;

  outlined destroy of ListRequest(*(_QWORD *)(v0 + 64), (uint64_t (*)(_QWORD))type metadata accessor for InsertRequest);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t LLMCacheManager.insert(with:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2[32] = a1;
  v2[33] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UserID?);
  v2[34] = swift_task_alloc();
  v2[35] = swift_task_alloc();
  v3 = type metadata accessor for UserID();
  v2[36] = v3;
  v2[37] = *(_QWORD *)(v3 - 8);
  v2[38] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  v2[39] = swift_task_alloc();
  v2[40] = swift_task_alloc();
  v4 = type metadata accessor for Date();
  v2[41] = v4;
  v2[42] = *(_QWORD *)(v4 - 8);
  v2[43] = swift_task_alloc();
  v2[44] = swift_task_alloc();
  v2[45] = *(_QWORD *)(type metadata accessor for AnnotatedCacheEntry(0) - 8);
  v2[46] = swift_task_alloc();
  v2[47] = swift_task_alloc();
  v2[48] = swift_task_alloc();
  v5 = type metadata accessor for UUID();
  v2[49] = v5;
  v2[50] = *(_QWORD *)(v5 - 8);
  v2[51] = swift_task_alloc();
  v2[52] = type metadata accessor for InsertRequest();
  v2[53] = swift_task_alloc();
  v6 = type metadata accessor for OSSignpostID();
  v2[54] = v6;
  v2[55] = *(_QWORD *)(v6 - 8);
  v2[56] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t LLMCacheManager.insert(with:)()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  uint64_t *v8;
  uint8_t *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t);
  char v32;
  uint64_t v33;

  if (one-time initialization token for log != -1)
    swift_once();
  v1 = (id)static Logger.log;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  if (one-time initialization token for logger != -1)
    swift_once();
  v2 = *(_QWORD *)(v0 + 424);
  v3 = *(_QWORD *)(v0 + 256);
  v4 = type metadata accessor for Logger();
  *(_QWORD *)(v0 + 456) = __swift_project_value_buffer(v4, (uint64_t)static Logger.logger);
  outlined init with copy of ListRequest(v3, v2, (uint64_t (*)(_QWORD))type metadata accessor for InsertRequest);
  v5 = Logger.logObject.getter();
  v6 = static os_log_type_t.debug.getter();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(uint64_t **)(v0 + 424);
  if (v7)
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v33 = v10;
    *(_DWORD *)v9 = 136315138;
    v12 = *v8;
    v11 = v8[1];
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 248) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v12, v11, &v33);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    outlined destroy of ListRequest((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for InsertRequest);
    _os_log_impl(&dword_2401E6000, v5, v6, "LLMCacheManager entering insert with search key %s...", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24268046C](v10, -1, -1);
    MEMORY[0x24268046C](v9, -1, -1);
  }
  else
  {
    outlined destroy of ListRequest(*(_QWORD *)(v0 + 424), (uint64_t (*)(_QWORD))type metadata accessor for InsertRequest);
  }

  if ((LLMCacheManager.isEnabled()() & 1) != 0)
  {
    v13 = *(_QWORD *)(v0 + 416);
    v14 = *(_QWORD *)(v0 + 256);
    v15 = *(_QWORD *)(v0 + 264);
    v16 = *(_QWORD *)(v15 + 168);
    *(_QWORD *)(v0 + 464) = v16;
    v17 = v14 + *(int *)(v13 + 24);
    LOBYTE(v13) = *(_BYTE *)(v15 + 112);
    *(_BYTE *)(v0 + 553) = v13;
    v32 = v13;
    (*(void (**)(uint64_t, char *))(*(_QWORD *)v16 + 88))(v17, &v32);
    specialized static LLMCacheManager.generateEntryId(searchKey:llmOutput:)(*(_QWORD *)v14, *(_QWORD *)(v14 + 8), *(_QWORD *)(v14 + 16), *(void **)(v14 + 24));
    v19 = v18;
    *(_QWORD *)(v0 + 472) = v18;
    v20 = (_QWORD *)(v15 + 120);
    v21 = *(_QWORD *)(v15 + 144);
    v22 = *(_QWORD *)(v15 + 152);
    __swift_project_boxed_opaque_existential_1(v20, v21);
    *(_QWORD *)(v0 + 208) = v19;
    v23 = dispatch thunk of CustomStringConvertible.description.getter();
    v25 = v24;
    *(_QWORD *)(v0 + 480) = v24;
    v31 = (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(v22 + 16)
                                                                             + *(_QWORD *)(v22 + 16));
    v26 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 488) = v26;
    *v26 = v0;
    v26[1] = LLMCacheManager.insert(with:);
    return v31(*(_QWORD *)(v0 + 384), v23, v25, v21, v22);
  }
  else
  {
    v29 = *(_QWORD *)(v0 + 440);
    v28 = *(_QWORD *)(v0 + 448);
    v30 = *(_QWORD *)(v0 + 432);
    $defer #1 () in LLMCacheManager.insert(with:)();
    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v28, v30);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 496) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(void);
  uint64_t *v27;
  uint64_t v28;
  void (*v29)(void);
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v38;
  unint64_t v39;
  _QWORD *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  id v49;
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  _QWORD *v59;
  unint64_t v60;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _BYTE *v69;
  uint64_t v70;
  uint64_t v71;
  _QWORD *v72;
  _QWORD *v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  _QWORD *v78;
  uint64_t (*v79)();
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  _QWORD **v83;
  uint64_t v84;
  uint64_t v85;
  char v86;
  uint64_t *v87;
  uint64_t v88;
  void (*v89)(void);
  uint64_t v90;
  uint64_t v91;
  uint64_t (*v92)(uint64_t, uint64_t, uint64_t);
  uint64_t v93[2];

  v1 = Logger.logObject.getter();
  v2 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2401E6000, v1, v2, "Found an existing cache entry, going to update it by appending new search key", v3, 2u);
    MEMORY[0x24268046C](v3, -1, -1);
  }
  v4 = *(void **)(v0 + 496);
  v5 = *(_QWORD *)(v0 + 352);
  v6 = *(_QWORD *)(v0 + 328);
  v7 = *(_QWORD *)(v0 + 336);
  v8 = *(_QWORD **)(v0 + 256);

  v9 = AnnotatedCacheEntry.builder()();
  static Date.now.getter();
  v10 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v9 + 384))(v5);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  v11 = (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)v10 + 400))(*v8, v8[1]);
  v12 = swift_release();
  (*(void (**)(uint64_t))(*(_QWORD *)v11 + 440))(v12);
  if (!v4)
  {
    v56 = *(_QWORD *)(v0 + 376);
    v57 = *(_QWORD *)(v0 + 360);
    v58 = *(_QWORD **)(v0 + 264);
    swift_release();
    v59 = v58 + 15;
    v74 = v58[18];
    v75 = v58[19];
    __swift_project_boxed_opaque_existential_1(v59, v74);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<AnnotatedCacheEntry>);
    v60 = (*(unsigned __int8 *)(v57 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v57 + 80);
    v77 = swift_allocObject();
    *(_QWORD *)(v0 + 504) = v77;
    *(_OWORD *)(v77 + 16) = xmmword_24020D390;
    outlined init with copy of ListRequest(v56, v77 + v60, type metadata accessor for AnnotatedCacheEntry);
    v92 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(v75 + 24) + *(_QWORD *)(v75 + 24));
    v78 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 512) = v78;
    v79 = LLMCacheManager.insert(with:);
LABEL_18:
    *v78 = v0;
    v78[1] = v79;
    return v92(v77, v74, v75);
  }
  v13 = v4;
  outlined destroy of ListRequest(*(_QWORD *)(v0 + 384), type metadata accessor for AnnotatedCacheEntry);
  swift_release();
  *(_QWORD *)(v0 + 240) = v4;
  v14 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
  if ((swift_dynamicCast() & 1) != 0 && *(_BYTE *)(v0 + 552) == 2)
  {

    v15 = Logger.logObject.getter();
    v16 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_2401E6000, v15, v16, "No existing cache entry found, going to insert a new entry", v17, 2u);
      MEMORY[0x24268046C](v17, -1, -1);
    }
    v18 = *(_QWORD *)(v0 + 472);
    v86 = *(_BYTE *)(v0 + 553);
    v19 = *(_QWORD *)(v0 + 336);
    v80 = *(_QWORD *)(v0 + 344);
    v20 = *(_QWORD *)(v0 + 320);
    v21 = *(_QWORD *)(v0 + 328);
    v85 = *(_QWORD *)(v0 + 312);
    v90 = *(_QWORD *)(v0 + 296);
    v87 = *(uint64_t **)(v0 + 256);

    static Date.now.getter();
    *(_QWORD *)(v0 + 216) = v18;
    v22 = dispatch thunk of CustomStringConvertible.description.getter();
    v81 = v23;
    v82 = v22;
    type metadata accessor for AnnotatedCacheEntryBuilder(0);
    v24 = swift_allocObject();
    v25 = v24 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_lastAccessedTime;
    v26 = *(void (**)(void))(v19 + 56);
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v26)(v24 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_lastAccessedTime, 1, 1, v21);
    v84 = v24 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_lastCreatedTime;
    v26();
    v27 = (uint64_t *)(v24 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_llmOutput);
    *v27 = 0;
    v27[1] = 0;
    v28 = v24 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_ttl;
    *(_QWORD *)v28 = 0;
    v88 = v28;
    *(_BYTE *)(v28 + 8) = 1;
    v29 = *(void (**)(void))(v90 + 56);
    v91 = v24 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_userId;
    v89 = v29;
    v29();
    v30 = v24 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_score;
    *(_QWORD *)v30 = 0;
    *(_BYTE *)(v30 + 8) = 1;
    *(_QWORD *)(v24 + 16) = v82;
    *(_QWORD *)(v24 + 24) = v81;
    *(_BYTE *)(v24 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_namespace) = v86;
    v83 = (_QWORD **)(v24 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_searchKeys);
    *v83 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v31 = *(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16);
    v31(v20, v80, v21);
    ((void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v26)(v20, 0, 1, v21);
    outlined init with take of Date?(v20, v85, &demangling cache variable for type metadata for Date?);
    swift_beginAccess();
    outlined assign with take of Date?(v85, v25, &demangling cache variable for type metadata for Date?);
    swift_endAccess();
    v31(v20, v80, v21);
    ((void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v26)(v20, 0, 1, v21);
    outlined init with take of Date?(v20, v85, &demangling cache variable for type metadata for Date?);
    swift_beginAccess();
    outlined assign with take of Date?(v85, v84, &demangling cache variable for type metadata for Date?);
    swift_endAccess();
    v33 = v87[2];
    v32 = v87[3];
    swift_beginAccess();
    *v27 = v33;
    v27[1] = v32;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v34 = *v87;
    v35 = v87[1];
    swift_beginAccess();
    if ((specialized Sequence<>.contains(_:)(v34, v35, *v83) & 1) == 0)
    {
      swift_beginAccess();
      v36 = *v83;
      swift_bridgeObjectRetain();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *v83 = v36;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        v36 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v36[2] + 1, 1, v36);
        *v83 = v36;
      }
      v39 = v36[2];
      v38 = v36[3];
      if (v39 >= v38 >> 1)
      {
        v36 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v38 > 1), v39 + 1, 1, v36);
        *v83 = v36;
      }
      v36[2] = v39 + 1;
      v40 = &v36[2 * v39];
      v40[4] = v34;
      v40[5] = v35;
      swift_endAccess();
    }
    v41 = *(uint64_t **)(v0 + 368);
    v43 = *(_QWORD *)(v0 + 296);
    v42 = *(_QWORD *)(v0 + 304);
    v45 = *(_QWORD *)(v0 + 280);
    v44 = *(_QWORD *)(v0 + 288);
    v46 = *(_QWORD *)(v0 + 272);
    v47 = *(_QWORD *)(*(_QWORD *)(v0 + 264) + 160);
    swift_beginAccess();
    *(_QWORD *)v88 = v47;
    *(_BYTE *)(v88 + 8) = 0;
    static UserID.defaultUserId.getter();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v43 + 16))(v45, v42, v44);
    ((void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v89)(v45, 0, 1, v44);
    outlined init with take of Date?(v45, v46, &demangling cache variable for type metadata for UserID?);
    swift_beginAccess();
    outlined assign with take of Date?(v46, v91, &demangling cache variable for type metadata for UserID?);
    swift_endAccess();
    (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v42, v44);
    AnnotatedCacheEntryBuilder.build()(v41);
    v71 = *(_QWORD *)(v0 + 360);
    v70 = *(_QWORD *)(v0 + 368);
    v72 = *(_QWORD **)(v0 + 264);
    swift_release();
    v73 = v72 + 15;
    v74 = v72[18];
    v75 = v72[19];
    __swift_project_boxed_opaque_existential_1(v73, v74);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<AnnotatedCacheEntry>);
    v76 = (*(unsigned __int8 *)(v71 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v71 + 80);
    v77 = swift_allocObject();
    *(_QWORD *)(v0 + 528) = v77;
    *(_OWORD *)(v77 + 16) = xmmword_24020D390;
    outlined init with copy of ListRequest(v70, v77 + v76, type metadata accessor for AnnotatedCacheEntry);
    v92 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(v75 + 24) + *(_QWORD *)(v75 + 24));
    v78 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 536) = v78;
    v79 = LLMCacheManager.insert(with:);
    goto LABEL_18;
  }

  v48 = v4;
  v49 = v4;
  v50 = Logger.logObject.getter();
  v51 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v50, v51))
  {
    v52 = (uint8_t *)swift_slowAlloc();
    v53 = swift_slowAlloc();
    v93[0] = v53;
    *(_DWORD *)v52 = 136315138;
    swift_getErrorValue();
    v54 = Error.localizedDescription.getter();
    *(_QWORD *)(v0 + 224) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v54, v55, v93);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2401E6000, v50, v51, "Failed to insert: %s", v52, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24268046C](v53, -1, -1);
    MEMORY[0x24268046C](v52, -1, -1);
  }
  else
  {

  }
  v62 = *(_QWORD *)(v0 + 464);
  v64 = *(_QWORD *)(v0 + 440);
  v63 = *(_QWORD *)(v0 + 448);
  v65 = *(_QWORD *)(v0 + 432);
  v67 = *(_QWORD *)(v0 + 400);
  v66 = *(_QWORD *)(v0 + 408);
  v68 = *(_QWORD *)(v0 + 392);
  LOBYTE(v93[0]) = 1;
  (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v62 + 104))(v66, v93);
  lazy protocol witness table accessor for type LLMCacheManagerError and conformance LLMCacheManagerError();
  swift_allocError();
  *v69 = 1;
  swift_willThrow();

  (*(void (**)(uint64_t, uint64_t))(v67 + 8))(v66, v68);
  $defer #1 () in LLMCacheManager.insert(with:)();
  (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v63, v65);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 520) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(_QWORD *)(v0 + 384);
  outlined destroy of ListRequest(*(_QWORD *)(v0 + 376), type metadata accessor for AnnotatedCacheEntry);
  outlined destroy of ListRequest(v1, type metadata accessor for AnnotatedCacheEntry);
  v3 = *(_QWORD *)(v0 + 400);
  v2 = *(_QWORD *)(v0 + 408);
  v4 = *(_QWORD *)(v0 + 392);
  (*(void (**)(uint64_t))(**(_QWORD **)(v0 + 464) + 96))(v2);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  v6 = *(_QWORD *)(v0 + 440);
  v5 = *(_QWORD *)(v0 + 448);
  v7 = *(_QWORD *)(v0 + 432);
  $defer #1 () in LLMCacheManager.insert(with:)();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 544) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *(_QWORD *)(v0 + 336);
  v1 = *(_QWORD *)(v0 + 344);
  v3 = *(_QWORD *)(v0 + 328);
  outlined destroy of ListRequest(*(_QWORD *)(v0 + 368), type metadata accessor for AnnotatedCacheEntry);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);

  v5 = *(_QWORD *)(v0 + 400);
  v4 = *(_QWORD *)(v0 + 408);
  v6 = *(_QWORD *)(v0 + 392);
  (*(void (**)(uint64_t))(**(_QWORD **)(v0 + 464) + 96))(v4);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  v8 = *(_QWORD *)(v0 + 440);
  v7 = *(_QWORD *)(v0 + 448);
  v9 = *(_QWORD *)(v0 + 432);
  $defer #1 () in LLMCacheManager.insert(with:)();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  void *v1;
  id v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(void);
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(void);
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v25;
  unint64_t v26;
  _QWORD *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _BYTE *v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  _QWORD *v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  _QWORD *v59;
  uint64_t v61;
  _QWORD **v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  void (*v70)(void);
  uint64_t v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t, uint64_t);
  uint64_t v74[2];

  swift_bridgeObjectRelease();
  v1 = *(void **)(v0 + 496);
  *(_QWORD *)(v0 + 240) = v1;
  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
  if ((swift_dynamicCast() & 1) != 0 && *(_BYTE *)(v0 + 552) == 2)
  {

    v3 = Logger.logObject.getter();
    v4 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_2401E6000, v3, v4, "No existing cache entry found, going to insert a new entry", v5, 2u);
      MEMORY[0x24268046C](v5, -1, -1);
    }
    v6 = *(_QWORD *)(v0 + 472);
    v7 = *(_BYTE *)(v0 + 553);
    v8 = *(_QWORD *)(v0 + 336);
    v64 = *(_QWORD *)(v0 + 344);
    v9 = *(_QWORD *)(v0 + 320);
    v10 = *(_QWORD *)(v0 + 328);
    v71 = *(_QWORD *)(v0 + 296);
    v66 = *(_QWORD *)(v0 + 312);
    v67 = *(uint64_t **)(v0 + 256);

    static Date.now.getter();
    *(_QWORD *)(v0 + 216) = v6;
    v68 = dispatch thunk of CustomStringConvertible.description.getter();
    v61 = v11;
    type metadata accessor for AnnotatedCacheEntryBuilder(0);
    v12 = swift_allocObject();
    v63 = v12 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_lastAccessedTime;
    v13 = *(void (**)(void))(v8 + 56);
    v13();
    v65 = v12 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_lastCreatedTime;
    v13();
    v14 = (uint64_t *)(v12 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_llmOutput);
    *v14 = 0;
    v14[1] = 0;
    v15 = v12 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_ttl;
    *(_QWORD *)v15 = 0;
    v69 = v15;
    *(_BYTE *)(v15 + 8) = 1;
    v16 = *(void (**)(void))(v71 + 56);
    v72 = v12 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_userId;
    v70 = v16;
    v16();
    v17 = v12 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_score;
    *(_QWORD *)v17 = 0;
    *(_BYTE *)(v17 + 8) = 1;
    *(_QWORD *)(v12 + 16) = v68;
    *(_QWORD *)(v12 + 24) = v61;
    *(_BYTE *)(v12 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_namespace) = v7;
    v62 = (_QWORD **)(v12 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_searchKeys);
    *v62 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
    v18(v9, v64, v10);
    ((void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v13)(v9, 0, 1, v10);
    outlined init with take of Date?(v9, v66, &demangling cache variable for type metadata for Date?);
    swift_beginAccess();
    outlined assign with take of Date?(v66, v63, &demangling cache variable for type metadata for Date?);
    swift_endAccess();
    v18(v9, v64, v10);
    ((void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v13)(v9, 0, 1, v10);
    outlined init with take of Date?(v9, v66, &demangling cache variable for type metadata for Date?);
    swift_beginAccess();
    outlined assign with take of Date?(v66, v65, &demangling cache variable for type metadata for Date?);
    swift_endAccess();
    v19 = v67[2];
    v20 = v67[3];
    swift_beginAccess();
    *v14 = v19;
    v14[1] = v20;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v21 = *v67;
    v22 = v67[1];
    swift_beginAccess();
    if ((specialized Sequence<>.contains(_:)(v21, v22, *v62) & 1) == 0)
    {
      swift_beginAccess();
      v23 = *v62;
      swift_bridgeObjectRetain();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *v62 = v23;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        v23 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v23[2] + 1, 1, v23);
        *v62 = v23;
      }
      v26 = v23[2];
      v25 = v23[3];
      if (v26 >= v25 >> 1)
      {
        v23 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v25 > 1), v26 + 1, 1, v23);
        *v62 = v23;
      }
      v23[2] = v26 + 1;
      v27 = &v23[2 * v26];
      v27[4] = v21;
      v27[5] = v22;
      swift_endAccess();
    }
    v28 = *(uint64_t **)(v0 + 368);
    v30 = *(_QWORD *)(v0 + 296);
    v29 = *(_QWORD *)(v0 + 304);
    v32 = *(_QWORD *)(v0 + 280);
    v31 = *(_QWORD *)(v0 + 288);
    v33 = *(_QWORD *)(v0 + 272);
    v34 = *(_QWORD *)(*(_QWORD *)(v0 + 264) + 160);
    swift_beginAccess();
    *(_QWORD *)v69 = v34;
    *(_BYTE *)(v69 + 8) = 0;
    static UserID.defaultUserId.getter();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v30 + 16))(v32, v29, v31);
    ((void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v70)(v32, 0, 1, v31);
    outlined init with take of Date?(v32, v33, &demangling cache variable for type metadata for UserID?);
    swift_beginAccess();
    outlined assign with take of Date?(v33, v72, &demangling cache variable for type metadata for UserID?);
    swift_endAccess();
    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v29, v31);
    AnnotatedCacheEntryBuilder.build()(v28);
    v52 = *(_QWORD *)(v0 + 360);
    v51 = *(_QWORD *)(v0 + 368);
    v53 = *(_QWORD **)(v0 + 264);
    swift_release();
    v54 = v53 + 15;
    v55 = v53[18];
    v56 = v53[19];
    __swift_project_boxed_opaque_existential_1(v54, v55);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<AnnotatedCacheEntry>);
    v57 = (*(unsigned __int8 *)(v52 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v52 + 80);
    v58 = swift_allocObject();
    *(_QWORD *)(v0 + 528) = v58;
    *(_OWORD *)(v58 + 16) = xmmword_24020D390;
    outlined init with copy of ListRequest(v51, v58 + v57, type metadata accessor for AnnotatedCacheEntry);
    v73 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(v56 + 24) + *(_QWORD *)(v56 + 24));
    v59 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 536) = v59;
    *v59 = v0;
    v59[1] = LLMCacheManager.insert(with:);
    return v73(v58, v55, v56);
  }
  else
  {

    v35 = v1;
    v36 = v1;
    v37 = Logger.logObject.getter();
    v38 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v37, v38))
    {
      v39 = (uint8_t *)swift_slowAlloc();
      v40 = swift_slowAlloc();
      v74[0] = v40;
      *(_DWORD *)v39 = 136315138;
      swift_getErrorValue();
      v41 = Error.localizedDescription.getter();
      *(_QWORD *)(v0 + 224) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v41, v42, v74);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_2401E6000, v37, v38, "Failed to insert: %s", v39, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24268046C](v40, -1, -1);
      MEMORY[0x24268046C](v39, -1, -1);
    }
    else
    {

    }
    v43 = *(_QWORD *)(v0 + 464);
    v45 = *(_QWORD *)(v0 + 440);
    v44 = *(_QWORD *)(v0 + 448);
    v46 = *(_QWORD *)(v0 + 432);
    v48 = *(_QWORD *)(v0 + 400);
    v47 = *(_QWORD *)(v0 + 408);
    v49 = *(_QWORD *)(v0 + 392);
    LOBYTE(v74[0]) = 1;
    (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v43 + 104))(v47, v74);
    lazy protocol witness table accessor for type LLMCacheManagerError and conformance LLMCacheManagerError();
    swift_allocError();
    *v50 = 1;
    swift_willThrow();

    (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v47, v49);
    $defer #1 () in LLMCacheManager.insert(with:)();
    (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v44, v46);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(void);
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(void);
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v26;
  unint64_t v27;
  _QWORD *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _BYTE *v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  _QWORD *v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  uint64_t v62;
  _QWORD **v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  void (*v71)(void);
  uint64_t v72;
  uint64_t v73;
  uint64_t (*v74)(uint64_t, uint64_t, uint64_t);
  uint64_t v75[2];

  v1 = *(_QWORD *)(v0 + 384);
  outlined destroy of ListRequest(*(_QWORD *)(v0 + 376), type metadata accessor for AnnotatedCacheEntry);
  outlined destroy of ListRequest(v1, type metadata accessor for AnnotatedCacheEntry);
  v2 = *(void **)(v0 + 520);
  *(_QWORD *)(v0 + 240) = v2;
  v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
  if ((swift_dynamicCast() & 1) != 0 && *(_BYTE *)(v0 + 552) == 2)
  {

    v4 = Logger.logObject.getter();
    v5 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_2401E6000, v4, v5, "No existing cache entry found, going to insert a new entry", v6, 2u);
      MEMORY[0x24268046C](v6, -1, -1);
    }
    v7 = *(_QWORD *)(v0 + 472);
    v8 = *(_BYTE *)(v0 + 553);
    v9 = *(_QWORD *)(v0 + 336);
    v65 = *(_QWORD *)(v0 + 344);
    v10 = *(_QWORD *)(v0 + 320);
    v11 = *(_QWORD *)(v0 + 328);
    v72 = *(_QWORD *)(v0 + 296);
    v67 = *(_QWORD *)(v0 + 312);
    v68 = *(uint64_t **)(v0 + 256);

    static Date.now.getter();
    *(_QWORD *)(v0 + 216) = v7;
    v69 = dispatch thunk of CustomStringConvertible.description.getter();
    v62 = v12;
    type metadata accessor for AnnotatedCacheEntryBuilder(0);
    v13 = swift_allocObject();
    v64 = v13 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_lastAccessedTime;
    v14 = *(void (**)(void))(v9 + 56);
    v14();
    v66 = v13 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_lastCreatedTime;
    v14();
    v15 = (uint64_t *)(v13 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_llmOutput);
    *v15 = 0;
    v15[1] = 0;
    v16 = v13 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_ttl;
    *(_QWORD *)v16 = 0;
    v70 = v16;
    *(_BYTE *)(v16 + 8) = 1;
    v17 = *(void (**)(void))(v72 + 56);
    v73 = v13 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_userId;
    v71 = v17;
    v17();
    v18 = v13 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_score;
    *(_QWORD *)v18 = 0;
    *(_BYTE *)(v18 + 8) = 1;
    *(_QWORD *)(v13 + 16) = v69;
    *(_QWORD *)(v13 + 24) = v62;
    *(_BYTE *)(v13 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_namespace) = v8;
    v63 = (_QWORD **)(v13 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_searchKeys);
    *v63 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16);
    v19(v10, v65, v11);
    ((void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v14)(v10, 0, 1, v11);
    outlined init with take of Date?(v10, v67, &demangling cache variable for type metadata for Date?);
    swift_beginAccess();
    outlined assign with take of Date?(v67, v64, &demangling cache variable for type metadata for Date?);
    swift_endAccess();
    v19(v10, v65, v11);
    ((void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v14)(v10, 0, 1, v11);
    outlined init with take of Date?(v10, v67, &demangling cache variable for type metadata for Date?);
    swift_beginAccess();
    outlined assign with take of Date?(v67, v66, &demangling cache variable for type metadata for Date?);
    swift_endAccess();
    v20 = v68[2];
    v21 = v68[3];
    swift_beginAccess();
    *v15 = v20;
    v15[1] = v21;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v22 = *v68;
    v23 = v68[1];
    swift_beginAccess();
    if ((specialized Sequence<>.contains(_:)(v22, v23, *v63) & 1) == 0)
    {
      swift_beginAccess();
      v24 = *v63;
      swift_bridgeObjectRetain();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *v63 = v24;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        v24 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v24[2] + 1, 1, v24);
        *v63 = v24;
      }
      v27 = v24[2];
      v26 = v24[3];
      if (v27 >= v26 >> 1)
      {
        v24 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v26 > 1), v27 + 1, 1, v24);
        *v63 = v24;
      }
      v24[2] = v27 + 1;
      v28 = &v24[2 * v27];
      v28[4] = v22;
      v28[5] = v23;
      swift_endAccess();
    }
    v29 = *(uint64_t **)(v0 + 368);
    v31 = *(_QWORD *)(v0 + 296);
    v30 = *(_QWORD *)(v0 + 304);
    v33 = *(_QWORD *)(v0 + 280);
    v32 = *(_QWORD *)(v0 + 288);
    v34 = *(_QWORD *)(v0 + 272);
    v35 = *(_QWORD *)(*(_QWORD *)(v0 + 264) + 160);
    swift_beginAccess();
    *(_QWORD *)v70 = v35;
    *(_BYTE *)(v70 + 8) = 0;
    static UserID.defaultUserId.getter();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 16))(v33, v30, v32);
    ((void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v71)(v33, 0, 1, v32);
    outlined init with take of Date?(v33, v34, &demangling cache variable for type metadata for UserID?);
    swift_beginAccess();
    outlined assign with take of Date?(v34, v73, &demangling cache variable for type metadata for UserID?);
    swift_endAccess();
    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v30, v32);
    AnnotatedCacheEntryBuilder.build()(v29);
    v53 = *(_QWORD *)(v0 + 360);
    v52 = *(_QWORD *)(v0 + 368);
    v54 = *(_QWORD **)(v0 + 264);
    swift_release();
    v55 = v54 + 15;
    v56 = v54[18];
    v57 = v54[19];
    __swift_project_boxed_opaque_existential_1(v55, v56);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<AnnotatedCacheEntry>);
    v58 = (*(unsigned __int8 *)(v53 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v53 + 80);
    v59 = swift_allocObject();
    *(_QWORD *)(v0 + 528) = v59;
    *(_OWORD *)(v59 + 16) = xmmword_24020D390;
    outlined init with copy of ListRequest(v52, v59 + v58, type metadata accessor for AnnotatedCacheEntry);
    v74 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(v57 + 24) + *(_QWORD *)(v57 + 24));
    v60 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 536) = v60;
    *v60 = v0;
    v60[1] = LLMCacheManager.insert(with:);
    return v74(v59, v56, v57);
  }
  else
  {

    v36 = v2;
    v37 = v2;
    v38 = Logger.logObject.getter();
    v39 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v38, v39))
    {
      v40 = (uint8_t *)swift_slowAlloc();
      v41 = swift_slowAlloc();
      v75[0] = v41;
      *(_DWORD *)v40 = 136315138;
      swift_getErrorValue();
      v42 = Error.localizedDescription.getter();
      *(_QWORD *)(v0 + 224) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v42, v43, v75);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_2401E6000, v38, v39, "Failed to insert: %s", v40, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24268046C](v41, -1, -1);
      MEMORY[0x24268046C](v40, -1, -1);
    }
    else
    {

    }
    v44 = *(_QWORD *)(v0 + 464);
    v46 = *(_QWORD *)(v0 + 440);
    v45 = *(_QWORD *)(v0 + 448);
    v47 = *(_QWORD *)(v0 + 432);
    v49 = *(_QWORD *)(v0 + 400);
    v48 = *(_QWORD *)(v0 + 408);
    v50 = *(_QWORD *)(v0 + 392);
    LOBYTE(v75[0]) = 1;
    (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v44 + 104))(v48, v75);
    lazy protocol witness table accessor for type LLMCacheManagerError and conformance LLMCacheManagerError();
    swift_allocError();
    *v51 = 1;
    swift_willThrow();

    (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v48, v50);
    $defer #1 () in LLMCacheManager.insert(with:)();
    (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v45, v47);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE *v20;
  uint64_t v22[2];

  v2 = *(_QWORD *)(v0 + 336);
  v1 = *(_QWORD *)(v0 + 344);
  v3 = *(_QWORD *)(v0 + 328);
  outlined destroy of ListRequest(*(_QWORD *)(v0 + 368), type metadata accessor for AnnotatedCacheEntry);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v4 = *(void **)(v0 + 544);

  v5 = v4;
  v6 = v4;
  v7 = Logger.logObject.getter();
  v8 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v22[0] = v10;
    *(_DWORD *)v9 = 136315138;
    swift_getErrorValue();
    v11 = Error.localizedDescription.getter();
    *(_QWORD *)(v0 + 224) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v11, v12, v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2401E6000, v7, v8, "Failed to insert: %s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24268046C](v10, -1, -1);
    MEMORY[0x24268046C](v9, -1, -1);
  }
  else
  {

  }
  v13 = *(_QWORD *)(v0 + 464);
  v15 = *(_QWORD *)(v0 + 440);
  v14 = *(_QWORD *)(v0 + 448);
  v16 = *(_QWORD *)(v0 + 432);
  v18 = *(_QWORD *)(v0 + 400);
  v17 = *(_QWORD *)(v0 + 408);
  v19 = *(_QWORD *)(v0 + 392);
  LOBYTE(v22[0]) = 1;
  (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v13 + 104))(v17, v22);
  lazy protocol witness table accessor for type LLMCacheManagerError and conformance LLMCacheManagerError();
  swift_allocError();
  *v20 = 1;
  swift_willThrow();

  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
  $defer #1 () in LLMCacheManager.insert(with:)();
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void $defer #1 () in LLMCacheManager.insert(with:)()
{
  id v0;
  uint64_t v1;
  os_log_type_t v2;
  uint8_t *v3;
  NSObject *oslog;

  if (one-time initialization token for log != -1)
    swift_once();
  v0 = (id)static Logger.log;
  static os_signpost_type_t.end.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  if (one-time initialization token for logger != -1)
    swift_once();
  v1 = type metadata accessor for Logger();
  __swift_project_value_buffer(v1, (uint64_t)static Logger.logger);
  oslog = Logger.logObject.getter();
  v2 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(oslog, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2401E6000, oslog, v2, "LLMCacheManager leaving insert...", v3, 2u);
    MEMORY[0x24268046C](v3, -1, -1);
  }

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
    outlined destroy of Date?((uint64_t)v14, &demangling cache variable for type metadata for ContiguousBytes?);
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
    MEMORY[0x24BDAC7A8](*(_QWORD *)&v14[0], v10);
    specialized Data._Representation.withUnsafeMutableBytes<A>(_:)();
    __asm { BR              X12 }
  }
  outlined init with take of ContiguousBytes(v14, (uint64_t)v17);
  __swift_project_boxed_opaque_existential_1(v17, v17[3]);
  dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
  swift_bridgeObjectRelease();
  v14[0] = v16;
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v17);
  return *(_QWORD *)&v14[0];
}

uint64_t LLMCacheManager.deleteAll()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[7] = v0;
  v2 = type metadata accessor for OSSignpostID();
  v1[8] = v2;
  v1[9] = *(_QWORD *)(v2 - 8);
  v1[10] = swift_task_alloc();
  return swift_task_switch();
}

{
  uint64_t v0;
  id v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t);

  if (one-time initialization token for log != -1)
    swift_once();
  v1 = (id)static Logger.log;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  if (one-time initialization token for logger != -1)
    swift_once();
  v2 = type metadata accessor for Logger();
  *(_QWORD *)(v0 + 88) = __swift_project_value_buffer(v2, (uint64_t)static Logger.logger);
  v3 = Logger.logObject.getter();
  v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2401E6000, v3, v4, "LLMCacheManager entering deleteAll...", v5, 2u);
    MEMORY[0x24268046C](v5, -1, -1);
  }

  if ((LLMCacheManager.isEnabled()() & 1) != 0)
  {
    v6 = *(_QWORD *)(v0 + 56);
    v7 = *(_QWORD *)(v6 + 144);
    v8 = *(_QWORD *)(v6 + 152);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v6 + 120), v7);
    *(_BYTE *)(v0 + 112) = *(_BYTE *)(v6 + 112);
    v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(v8 + 48) + *(_QWORD *)(v8 + 48));
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 96) = v9;
    *v9 = v0;
    v9[1] = LLMCacheManager.deleteAll();
    return v11(v0 + 112, v7, v8);
  }
  else
  {
    $defer #1 () in LLMCacheManager.deleteAll()();
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 72) + 8))(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 64));
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 104) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;

  $defer #1 () in LLMCacheManager.deleteAll()();
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 72) + 8))(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 64));
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v18;

  v1 = *(void **)(v0 + 104);
  v2 = v1;
  v3 = v1;
  v4 = Logger.logObject.getter();
  v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(void **)(v0 + 104);
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v18 = v8;
    *(_DWORD *)v7 = 136315138;
    swift_getErrorValue();
    v9 = Error.localizedDescription.getter();
    *(_QWORD *)(v0 + 48) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v9, v10, &v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2401E6000, v4, v5, "Failed to deleteAll: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24268046C](v8, -1, -1);
    MEMORY[0x24268046C](v7, -1, -1);
  }
  else
  {
    v11 = *(void **)(v0 + 104);

  }
  v12 = *(void **)(v0 + 104);
  v14 = *(_QWORD *)(v0 + 72);
  v13 = *(_QWORD *)(v0 + 80);
  v15 = *(_QWORD *)(v0 + 64);
  lazy protocol witness table accessor for type LLMCacheManagerError and conformance LLMCacheManagerError();
  swift_allocError();
  *v16 = 1;
  swift_willThrow();

  $defer #1 () in LLMCacheManager.deleteAll()();
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void $defer #1 () in LLMCacheManager.deleteAll()()
{
  id v0;
  uint64_t v1;
  os_log_type_t v2;
  uint8_t *v3;
  NSObject *oslog;

  if (one-time initialization token for log != -1)
    swift_once();
  v0 = (id)static Logger.log;
  static os_signpost_type_t.end.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  if (one-time initialization token for logger != -1)
    swift_once();
  v1 = type metadata accessor for Logger();
  __swift_project_value_buffer(v1, (uint64_t)static Logger.logger);
  oslog = Logger.logObject.getter();
  v2 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(oslog, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2401E6000, oslog, v2, "LLMCacheManager leaving deleteAll...", v3, 2u);
    MEMORY[0x24268046C](v3, -1, -1);
  }

}

uint64_t LLMCacheManager.warmup()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[7] = v0;
  v2 = type metadata accessor for OSSignpostID();
  v1[8] = v2;
  v1[9] = *(_QWORD *)(v2 - 8);
  v1[10] = swift_task_alloc();
  return swift_task_switch();
}

{
  uint64_t v0;
  id v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);

  if (one-time initialization token for log != -1)
    swift_once();
  v1 = (id)static Logger.log;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  if (one-time initialization token for logger != -1)
    swift_once();
  v2 = type metadata accessor for Logger();
  *(_QWORD *)(v0 + 88) = __swift_project_value_buffer(v2, (uint64_t)static Logger.logger);
  v3 = Logger.logObject.getter();
  v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2401E6000, v3, v4, "LLMCacheManager entering warmup...", v5, 2u);
    MEMORY[0x24268046C](v5, -1, -1);
  }

  if ((LLMCacheManager.isEnabled()() & 1) != 0)
  {
    v6 = *(_QWORD **)(v0 + 56);
    v7 = v6[18];
    v8 = v6[19];
    __swift_project_boxed_opaque_existential_1(v6 + 15, v7);
    v14 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(v8 + 56) + *(_QWORD *)(v8 + 56));
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 96) = v9;
    *v9 = v0;
    v9[1] = LLMCacheManager.warmup();
    return v14(v7, v8);
  }
  else
  {
    v12 = *(_QWORD *)(v0 + 72);
    v11 = *(_QWORD *)(v0 + 80);
    v13 = *(_QWORD *)(v0 + 64);
    $defer #1 () in LLMCacheManager.warmup()();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 104) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v0 + 72);
  v1 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 64);
  $defer #1 () in LLMCacheManager.warmup()();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v18;

  v1 = *(void **)(v0 + 104);
  v2 = v1;
  v3 = v1;
  v4 = Logger.logObject.getter();
  v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(void **)(v0 + 104);
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v18 = v8;
    *(_DWORD *)v7 = 136315138;
    swift_getErrorValue();
    v9 = Error.localizedDescription.getter();
    *(_QWORD *)(v0 + 48) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v9, v10, &v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2401E6000, v4, v5, "Failed to warmup: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24268046C](v8, -1, -1);
    MEMORY[0x24268046C](v7, -1, -1);
  }
  else
  {
    v11 = *(void **)(v0 + 104);

  }
  v12 = *(void **)(v0 + 104);
  v14 = *(_QWORD *)(v0 + 72);
  v13 = *(_QWORD *)(v0 + 80);
  v15 = *(_QWORD *)(v0 + 64);
  lazy protocol witness table accessor for type LLMCacheManagerError and conformance LLMCacheManagerError();
  swift_allocError();
  *v16 = 1;
  swift_willThrow();

  $defer #1 () in LLMCacheManager.warmup()();
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void $defer #1 () in LLMCacheManager.warmup()()
{
  id v0;
  uint64_t v1;
  os_log_type_t v2;
  uint8_t *v3;
  NSObject *oslog;

  if (one-time initialization token for log != -1)
    swift_once();
  v0 = (id)static Logger.log;
  static os_signpost_type_t.end.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  if (one-time initialization token for logger != -1)
    swift_once();
  v1 = type metadata accessor for Logger();
  __swift_project_value_buffer(v1, (uint64_t)static Logger.logger);
  oslog = Logger.logObject.getter();
  v2 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(oslog, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2401E6000, oslog, v2, "LLMCacheManager leaving warmup...", v3, 2u);
    MEMORY[0x24268046C](v3, -1, -1);
  }

}

uint64_t LLMCacheManager.pruneExpiredEntries()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[10] = v0;
  v2 = type metadata accessor for OSSignpostID();
  v1[11] = v2;
  v1[12] = *(_QWORD *)(v2 - 8);
  v1[13] = swift_task_alloc();
  return swift_task_switch();
}

{
  uint64_t v0;
  id v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  char v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  if (one-time initialization token for log != -1)
    swift_once();
  v1 = (id)static Logger.log;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  if (one-time initialization token for logger != -1)
    swift_once();
  v2 = type metadata accessor for Logger();
  *(_QWORD *)(v0 + 112) = __swift_project_value_buffer(v2, (uint64_t)static Logger.logger);
  v3 = Logger.logObject.getter();
  v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2401E6000, v3, v4, "LLMCacheManager entering pruneExpiredEntries", v5, 2u);
    MEMORY[0x24268046C](v5, -1, -1);
  }
  v6 = *(_QWORD *)(v0 + 80);

  *(_QWORD *)(v0 + 64) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v0 + 72) = 0;
  *(_BYTE *)(v0 + 169) = *(_BYTE *)(v6 + 112);
  swift_beginAccess();
  v7 = *(_BYTE *)(v0 + 169);
  v8 = *(_QWORD **)(v0 + 80);
  v9 = v8[18];
  v10 = v8[19];
  __swift_project_boxed_opaque_existential_1(v8 + 15, v9);
  *(_BYTE *)(v0 + 168) = v7;
  v11 = *(_QWORD *)(v0 + 72);
  v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(v10 + 40)
                                                                            + *(_QWORD *)(v10 + 40));
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 120) = v12;
  *v12 = v0;
  v12[1] = LLMCacheManager.pruneExpiredEntries();
  return v14(v0 + 168, 1000, v11, v9, v10);
}

{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 160) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v0 + 96);
  v1 = *(_QWORD *)(v0 + 104);
  v3 = *(_QWORD *)(v0 + 88);
  swift_bridgeObjectRelease();
  $defer #1 () in LLMCacheManager.pruneExpiredEntries()();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  swift_bridgeObjectRelease();
  v2 = *(_QWORD *)(v0 + 96);
  v1 = *(_QWORD *)(v0 + 104);
  v3 = *(_QWORD *)(v0 + 88);
  $defer #1 () in LLMCacheManager.pruneExpiredEntries()();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v2 = *(_QWORD *)(v0 + 96);
  v1 = *(_QWORD *)(v0 + 104);
  v3 = *(_QWORD *)(v0 + 88);
  $defer #1 () in LLMCacheManager.pruneExpiredEntries()();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t LLMCacheManager.pruneExpiredEntries()(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 128) = a1;
  *(_QWORD *)(v3 + 136) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

void LLMCacheManager.pruneExpiredEntries()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  void (*v24)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  void (*v25)(uint64_t, uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 128);
  v2 = *(_QWORD *)(v1 + 16);
  v3 = *(_QWORD *)(v0 + 72);
  v4 = __OFADD__(v3, v2);
  v5 = v3 + v2;
  if (v4)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v0 + 72) = v5;
    swift_retain();
    v6 = swift_bridgeObjectRetain();
    v7 = specialized _ArrayProtocol.filter(_:)(v6);
    swift_release();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    specialized Array.append<A>(contentsOf:)(v7);
    swift_endAccess();
    v8 = Logger.logObject.getter();
    v9 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = swift_slowAlloc();
      *(_DWORD *)v10 = 134218240;
      v11 = *(_QWORD *)(v0 + 64);
      *(_QWORD *)(v10 + 4) = *(_QWORD *)(v0 + 72);
      *(_WORD *)(v10 + 12) = 2048;
      *(_QWORD *)(v10 + 14) = *(_QWORD *)(v11 + 16);
      _os_log_impl(&dword_2401E6000, v8, v9, "Updated offset to %ld, collected %ld expired entries", (uint8_t *)v10, 0x16u);
      MEMORY[0x24268046C](v10, -1, -1);
    }

    v12 = *(_QWORD *)(v1 + 16);
    swift_bridgeObjectRelease();
    if (v12)
    {
      v13 = *(_BYTE *)(v0 + 169);
      v14 = *(_QWORD **)(v0 + 80);
      v15 = v14[18];
      v16 = v14[19];
      __swift_project_boxed_opaque_existential_1(v14 + 15, v15);
      *(_BYTE *)(v0 + 168) = v13;
      v17 = *(_QWORD *)(v0 + 72);
      v24 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(v16 + 40)
                                                                             + *(_QWORD *)(v16 + 40));
      v18 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 120) = v18;
      *v18 = v0;
      v18[1] = LLMCacheManager.pruneExpiredEntries();
      v24(v0 + 168, 1000, v17, v15, v16);
    }
    else
    {
      v19 = *(_QWORD **)(v0 + 80);
      v20 = v19[18];
      v21 = v19[19];
      __swift_project_boxed_opaque_existential_1(v19 + 15, v20);
      v22 = *(_QWORD *)(v0 + 64);
      *(_QWORD *)(v0 + 144) = v22;
      v25 = (void (*)(uint64_t, uint64_t, uint64_t))(**(int **)(v21 + 8) + *(_QWORD *)(v21 + 8));
      swift_bridgeObjectRetain();
      v23 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 152) = v23;
      *v23 = v0;
      v23[1] = LLMCacheManager.pruneExpiredEntries();
      v25(v22, v20, v21);
    }
  }
}

void $defer #1 () in LLMCacheManager.pruneExpiredEntries()()
{
  id v0;
  uint64_t v1;
  os_log_type_t v2;
  uint8_t *v3;
  NSObject *oslog;

  if (one-time initialization token for log != -1)
    swift_once();
  v0 = (id)static Logger.log;
  static os_signpost_type_t.end.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  if (one-time initialization token for logger != -1)
    swift_once();
  v1 = type metadata accessor for Logger();
  __swift_project_value_buffer(v1, (uint64_t)static Logger.logger);
  oslog = Logger.logObject.getter();
  v2 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(oslog, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2401E6000, oslog, v2, "LLMCacheManager leaving pruneExpiredEntries...", v3, 2u);
    MEMORY[0x24268046C](v3, -1, -1);
  }

}

uint64_t specialized Array.append<A>(contentsOf:)(uint64_t a1)
{
  unint64_t *v1;
  uint64_t v2;
  unint64_t v3;
  int64_t v4;
  int64_t v5;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  int64_t v23;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *(_QWORD *)(v3 + 24) >> 1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_5;
    goto LABEL_18;
  }
  if (v4 <= v5)
    v23 = v4 + v2;
  else
    v23 = v4;
  v3 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(isUniquelyReferenced_nonNull_native, v23, 1, v3, &demangling cache variable for type metadata for _ContiguousArrayStorage<AnnotatedCacheEntry>, type metadata accessor for AnnotatedCacheEntry);
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
LABEL_5:
  v8 = *(_QWORD *)(v3 + 16);
  v9 = (*(_QWORD *)(v3 + 24) >> 1) - v8;
  v10 = type metadata accessor for AnnotatedCacheEntry(0);
  if (v9 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v11 = *(_QWORD *)(v10 - 8);
  v12 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v13 = *(_QWORD *)(v11 + 72);
  v14 = v3 + v12 + v13 * v8;
  v15 = a1 + v12;
  v16 = v13 * v2;
  v17 = v14 + v16;
  v18 = v15 + v16;
  if (v15 < v17 && v14 < v18)
    goto LABEL_24;
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    result = swift_bridgeObjectRelease();
    *v1 = v3;
    return result;
  }
  v20 = *(_QWORD *)(v3 + 16);
  v21 = __OFADD__(v20, v2);
  v22 = v20 + v2;
  if (!v21)
  {
    *(_QWORD *)(v3 + 16) = v22;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t LLMCacheManager.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 120);
  swift_release();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t LLMCacheManager.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 120);
  swift_release();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t LLMCacheManager.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t protocol witness for Actor.unownedExecutor.getter in conformance LLMCacheManager()
{
  uint64_t v0;

  return v0;
}

uint64_t protocol witness for LLMCacheManaging.list(with:) in conformance LLMCacheManager(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = dispatch thunk of CacheDatabase.describe(identifier:);
  return LLMCacheManager.list(with:)(a1, a2);
}

uint64_t protocol witness for LLMCacheManaging.insert(with:) in conformance LLMCacheManager(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = dispatch thunk of CacheDatabase.describe(identifier:);
  return LLMCacheManager.insert(with:)(a1);
}

uint64_t protocol witness for LLMCacheManaging.insert(searchKey:llmOutput:) in conformance LLMCacheManager(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v5[4] = a3;
  v5[5] = a4;
  v5[2] = a1;
  v5[3] = a2;
  v5[6] = type metadata accessor for InsertRequest();
  v6 = swift_task_alloc();
  v7 = *v4;
  v5[7] = v6;
  v5[8] = v7;
  return swift_task_switch();
}

uint64_t protocol witness for LLMCacheManaging.insert(searchKey:llmOutput:) in conformance LLMCacheManager()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v1 = (_QWORD *)v0[7];
  v3 = v0[4];
  v2 = v0[5];
  v5 = v0[2];
  v4 = v0[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  UUID.init()();
  *v1 = v5;
  v1[1] = v4;
  v1[2] = v3;
  v1[3] = v2;
  v6 = (_QWORD *)swift_task_alloc();
  v0[9] = v6;
  *v6 = v0;
  v6[1] = protocol witness for LLMCacheManaging.insert(searchKey:llmOutput:) in conformance LLMCacheManager;
  return LLMCacheManager.insert(with:)(v0[7]);
}

{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 80) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;

  outlined destroy of ListRequest(*(_QWORD *)(v0 + 56), (uint64_t (*)(_QWORD))type metadata accessor for InsertRequest);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;

  outlined destroy of ListRequest(*(_QWORD *)(v0 + 56), (uint64_t (*)(_QWORD))type metadata accessor for InsertRequest);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t protocol witness for LLMCacheManaging.deleteAll() in conformance LLMCacheManager()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = dispatch thunk of CacheDatabase.describe(identifier:);
  return LLMCacheManager.deleteAll()();
}

uint64_t protocol witness for LLMCacheManaging.warmup() in conformance LLMCacheManager()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = dispatch thunk of CacheDatabase.describe(identifier:);
  return LLMCacheManager.warmup()();
}

uint64_t protocol witness for LLMCacheManaging.pruneExpiredEntries() in conformance LLMCacheManager()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = dispatch thunk of CacheDatabase.delete(entries:);
  return LLMCacheManager.pruneExpiredEntries()();
}

BOOL static LLMCacheManagerError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void LLMCacheManagerError.hash(into:)()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int LLMCacheManagerError.hashValue.getter()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

_QWORD *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Data>);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Int64>);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 25;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4])
          memmove(v13, a4 + 4, 8 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, unint64_t a4)
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, a4, &demangling cache variable for type metadata for _ContiguousArrayStorage<AnnotatedCacheEntry>, type metadata accessor for AnnotatedCacheEntry);
}

{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, a4, &demangling cache variable for type metadata for _ContiguousArrayStorage<Asset>, (uint64_t (*)(_QWORD))MEMORY[0x24BEBFEA0]);
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  size_t v17;
  BOOL v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = *(_QWORD *)(a4 + 24);
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = *(_QWORD *)(a4 + 16);
  if (v10 <= v11)
    v12 = *(_QWORD *)(a4 + 16);
  else
    v12 = v10;
  if (!v12)
  {
    v16 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  v13 = *(_QWORD *)(a6(0) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  v17 = _swift_stdlib_malloc_size(v16);
  if (!v14 || (v17 - v15 == 0x8000000000000000 ? (v18 = v14 == -1) : (v18 = 0), v18))
  {
LABEL_29:
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  v19 = *(_QWORD *)(a6(0) - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (unint64_t)v16 + v20;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v16 < a4 || v21 >= a4 + v20 + *(_QWORD *)(v19 + 72) * v11)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v11, v21, a4, a6);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v16;
}

uint64_t type metadata accessor for LLMCacheManager()
{
  return objc_opt_self();
}

void *closure #1 in serialize<A>(_:at:)(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  uint64_t v4;

  if (__src)
    v4 = a2 - (_QWORD)__src;
  else
    v4 = 0;
  if (!__dst)
  {
    if (v4 <= 0)
      return __src;
LABEL_10:
    __src = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v4)
    goto LABEL_10;
  if (__src)
    return memmove(__dst, __src, a2 - (_QWORD)__src);
  return __src;
}

uint64_t thunk for @escaping @callee_guaranteed () -> (@unowned Int)@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

Swift::Int specialized MutableCollection<>.sort(by:)(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2)
{
  _QWORD **v2;
  _QWORD *v5;
  Swift::Int result;

  type metadata accessor for AnnotatedCacheEntry(0);
  v5 = *v2;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v5 = (_QWORD *)specialized _ContiguousArrayBuffer._consumeAndCreateNew()(v5);
  result = specialized UnsafeMutableBufferPointer._stableSortImpl(by:)(a1, a2);
  *v2 = v5;
  return result;
}

uint64_t specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  size_t v12;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  char *v19;
  unint64_t v20;
  uint64_t result;

  v4 = a4 >> 1;
  v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
    goto LABEL_21;
  if (!v5)
    return MEMORY[0x24BEE4AF8];
  if (v5 <= 0)
  {
    v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
    if (v4 != a3)
    {
LABEL_10:
      if (v5 < 0)
        goto LABEL_24;
      v14 = *(_QWORD *)(type metadata accessor for AnnotatedCacheEntry(0) - 8);
      v15 = (char *)v11 + ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80));
      v16 = *(_QWORD *)(v14 + 72);
      v17 = a2 + v16 * a3;
      v18 = v16 * v5;
      v19 = &v15[v18];
      v20 = v17 + v18;
      if (v17 < (unint64_t)v19 && (unint64_t)v15 < v20)
        goto LABEL_24;
      swift_arrayInitWithCopy();
      return (uint64_t)v11;
    }
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<AnnotatedCacheEntry>);
  v8 = *(_QWORD *)(type metadata accessor for AnnotatedCacheEntry(0) - 8);
  v9 = *(_QWORD *)(v8 + 72);
  v10 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v11 = (_QWORD *)swift_allocObject();
  v12 = _swift_stdlib_malloc_size(v11);
  if (v9)
  {
    if (v12 - v10 == 0x8000000000000000 && v9 == -1)
      goto LABEL_23;
    v11[2] = v5;
    v11[3] = 2 * ((uint64_t)(v12 - v10) / v9);
    if (v4 != a3)
      goto LABEL_10;
    goto LABEL_20;
  }
LABEL_22:
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

Swift::Int specialized UnsafeMutableBufferPointer._stableSortImpl(by:)(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  Swift::Int v33;
  Swift::Int result;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  Swift::Int v39;
  char *v40;
  Swift::Int v41;
  Swift::Int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  Swift::Int v51;
  Swift::Int v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  int v56;
  Swift::Int v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  Swift::Int v63;
  uint64_t v64;
  Swift::Int v65;
  uint64_t v66;
  Swift::Int v67;
  uint64_t v68;
  Swift::Int v69;
  Swift::Int v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char v74;
  uint64_t v75;
  char v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  char *v82;
  char *v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  BOOL v95;
  unint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  BOOL v105;
  uint64_t v106;
  char v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  BOOL v112;
  uint64_t v113;
  uint64_t v114;
  char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  unint64_t v123;
  Swift::Int v124;
  char *v125;
  char *v126;
  uint64_t v127;
  char *v128;
  uint64_t v129;
  uint64_t v130;
  unint64_t v131;
  char *v132;
  uint64_t v133;
  unint64_t v134;
  char *v135;
  char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  char *v141;
  unint64_t v142;
  uint64_t v143;
  char *v144;
  char *v145;
  char *v146;
  Swift::Int v147;
  uint64_t v148;
  Swift::Int v149;
  uint64_t v150;
  char *v151;
  char *v152;
  uint64_t v153;
  Swift::Int v154;
  char *v155;
  uint64_t v156;
  uint64_t v157;
  char *v158;
  uint64_t v159;
  uint64_t v160;
  unint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t *v164;
  uint64_t (*v165)(uint64_t, uint64_t);
  uint64_t v166;

  v165 = a1;
  v156 = type metadata accessor for AnnotatedCacheEntry(0);
  v162 = *(_QWORD *)(v156 - 8);
  v5 = MEMORY[0x24BDAC7A8](v156, v4);
  v157 = (uint64_t)&v143 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5, v7);
  v160 = (uint64_t)&v143 - v9;
  v11 = MEMORY[0x24BDAC7A8](v8, v10);
  v13 = (char *)&v143 - v12;
  v15 = MEMORY[0x24BDAC7A8](v11, v14);
  v17 = (char *)&v143 - v16;
  v19 = MEMORY[0x24BDAC7A8](v15, v18);
  v21 = (char *)&v143 - v20;
  v23 = MEMORY[0x24BDAC7A8](v19, v22);
  v25 = (char *)&v143 - v24;
  v27 = MEMORY[0x24BDAC7A8](v23, v26);
  v29 = (char *)&v143 - v28;
  MEMORY[0x24BDAC7A8](v27, v30);
  v32 = (char *)&v143 - v31;
  v164 = v2;
  v33 = v2[1];
  result = _minimumMergeRunLength(_:)(v33);
  v149 = result;
  if (result >= v33)
  {
    if (v33 < 0)
      goto LABEL_151;
    if (v33)
      return specialized MutableCollection<>._insertionSort(within:sortedEnd:by:)(0, v33, 1, v165, a2);
  }
  else
  {
    if (v33 >= 0)
      v35 = v33;
    else
      v35 = v33 + 1;
    if (v33 <= -2)
    {
LABEL_160:
      result = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
      return result;
    }
    v152 = v21;
    v158 = v13;
    if (v33 >= 2)
    {
      v145 = v32;
      v146 = v29;
      v151 = v25;
      v155 = v17;
      v36 = v35 >> 1;
      v37 = static Array._allocateBufferUninitialized(minimumCapacity:)();
      *(_QWORD *)(v37 + 16) = v36;
      v161 = v37 + ((*(unsigned __int8 *)(v162 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v162 + 80));
      v38 = a2;
      goto LABEL_13;
    }
    v37 = MEMORY[0x24BEE4AF8];
    v161 = MEMORY[0x24BEE4AF8]
         + ((*(unsigned __int8 *)(v162 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v162 + 80));
    v38 = a2;
    if (v33 == 1)
    {
      v145 = v32;
      v146 = v29;
      v151 = v25;
      v155 = v17;
LABEL_13:
      v39 = 0;
      v40 = (char *)MEMORY[0x24BEE4AF8];
      v163 = v38;
      v148 = v37;
      while (1)
      {
        v41 = v39;
        v42 = v39 + 1;
        if (v39 + 1 >= v33)
        {
          ++v39;
          goto LABEL_59;
        }
        v43 = *v164;
        v44 = *(_QWORD *)(v162 + 72);
        v45 = (uint64_t)v145;
        outlined init with copy of ListRequest(*v164 + v44 * v42, (uint64_t)v145, type metadata accessor for AnnotatedCacheEntry);
        v159 = v44;
        v46 = v43 + v44 * v41;
        v47 = (uint64_t)v146;
        outlined init with copy of ListRequest(v46, (uint64_t)v146, type metadata accessor for AnnotatedCacheEntry);
        v48 = v166;
        LODWORD(v154) = v165(v45, v47);
        v166 = v48;
        if (v48)
        {
          outlined destroy of ListRequest(v47, type metadata accessor for AnnotatedCacheEntry);
          outlined destroy of ListRequest(v45, type metadata accessor for AnnotatedCacheEntry);
          swift_bridgeObjectRelease();
LABEL_127:
          v37 = v148;
          goto LABEL_128;
        }
        outlined destroy of ListRequest(v47, type metadata accessor for AnnotatedCacheEntry);
        outlined destroy of ListRequest(v45, type metadata accessor for AnnotatedCacheEntry);
        v39 = v41 + 2;
        if (v41 + 2 >= v33)
          goto LABEL_25;
        v147 = v41;
        v49 = v166;
        v144 = v40;
        v153 = v159 * v42;
        v143 = v43;
        v50 = v43;
        v150 = v159 * v39;
        while (1)
        {
          v51 = v33;
          v52 = v39;
          v53 = (uint64_t)v151;
          outlined init with copy of ListRequest(v50 + v150, (uint64_t)v151, type metadata accessor for AnnotatedCacheEntry);
          v54 = (uint64_t)v152;
          outlined init with copy of ListRequest(v50 + v153, (uint64_t)v152, type metadata accessor for AnnotatedCacheEntry);
          v55 = v165(v53, v54);
          if (v49)
          {
            outlined destroy of ListRequest(v54, type metadata accessor for AnnotatedCacheEntry);
            outlined destroy of ListRequest(v53, type metadata accessor for AnnotatedCacheEntry);
            swift_bridgeObjectRelease();
            goto LABEL_127;
          }
          v56 = v55;
          outlined destroy of ListRequest(v54, type metadata accessor for AnnotatedCacheEntry);
          outlined destroy of ListRequest(v53, type metadata accessor for AnnotatedCacheEntry);
          if (((v154 ^ v56) & 1) != 0)
            break;
          v39 = v52 + 1;
          v50 += v159;
          v33 = v51;
          if (v51 == v39)
          {
            v39 = v51;
            v40 = v144;
            v166 = 0;
            v41 = v147;
            goto LABEL_24;
          }
        }
        v40 = v144;
        v166 = 0;
        v39 = v52;
        v41 = v147;
        v33 = v51;
LABEL_24:
        v43 = v143;
LABEL_25:
        v57 = v149;
        if ((v154 & 1) == 0)
          break;
        if (v39 < v41)
          goto LABEL_155;
        v58 = (uint64_t)v158;
        if (v41 >= v39)
          goto LABEL_39;
        v59 = (uint64_t)v158;
        v154 = v33;
        v144 = v40;
        v60 = 0;
        v61 = v159 * (v39 - 1);
        v62 = v39 * v159;
        v63 = v41;
        v147 = v41;
        v64 = v41 * v159;
        do
        {
          if (v63 != v39 + v60 - 1)
          {
            if (!v43)
              goto LABEL_158;
            outlined init with take of AnnotatedCacheEntry(v43 + v64, v157);
            if (v64 < v61 || v43 + v64 >= (unint64_t)(v43 + v62))
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (v64 != v61)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            outlined init with take of AnnotatedCacheEntry(v157, v43 + v61);
            v59 = (uint64_t)v158;
          }
          ++v63;
          --v60;
          v61 -= v159;
          v62 -= v159;
          v64 += v159;
        }
        while (v63 < v39 + v60);
        v40 = v144;
        v57 = v149;
        v41 = v147;
        v33 = v154;
        v58 = v59;
        if (v39 < v154)
          goto LABEL_40;
LABEL_59:
        if (v39 < v41)
          goto LABEL_150;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v40 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((_QWORD *)v40 + 2) + 1, 1, v40);
        v80 = *((_QWORD *)v40 + 2);
        v79 = *((_QWORD *)v40 + 3);
        v81 = v80 + 1;
        v38 = v163;
        if (v80 >= v79 >> 1)
        {
          v132 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v79 > 1), v80 + 1, 1, v40);
          v38 = v163;
          v40 = v132;
        }
        *((_QWORD *)v40 + 2) = v81;
        v82 = v40 + 32;
        v83 = &v40[16 * v80 + 32];
        *(_QWORD *)v83 = v41;
        *((_QWORD *)v83 + 1) = v39;
        if (v80)
        {
          while (1)
          {
            v84 = v81 - 1;
            if (v81 >= 4)
            {
              v89 = &v82[16 * v81];
              v90 = *((_QWORD *)v89 - 8);
              v91 = *((_QWORD *)v89 - 7);
              v95 = __OFSUB__(v91, v90);
              v92 = v91 - v90;
              if (v95)
                goto LABEL_135;
              v94 = *((_QWORD *)v89 - 6);
              v93 = *((_QWORD *)v89 - 5);
              v95 = __OFSUB__(v93, v94);
              v87 = v93 - v94;
              v88 = v95;
              if (v95)
                goto LABEL_136;
              v96 = v81 - 2;
              v97 = &v82[16 * v81 - 32];
              v99 = *(_QWORD *)v97;
              v98 = *((_QWORD *)v97 + 1);
              v95 = __OFSUB__(v98, v99);
              v100 = v98 - v99;
              if (v95)
                goto LABEL_138;
              v95 = __OFADD__(v87, v100);
              v101 = v87 + v100;
              if (v95)
                goto LABEL_141;
              if (v101 >= v92)
              {
                v119 = &v82[16 * v84];
                v121 = *(_QWORD *)v119;
                v120 = *((_QWORD *)v119 + 1);
                v95 = __OFSUB__(v120, v121);
                v122 = v120 - v121;
                if (v95)
                  goto LABEL_145;
                v112 = v87 < v122;
                goto LABEL_96;
              }
            }
            else
            {
              if (v81 != 3)
              {
                v113 = *((_QWORD *)v40 + 4);
                v114 = *((_QWORD *)v40 + 5);
                v95 = __OFSUB__(v114, v113);
                v106 = v114 - v113;
                v107 = v95;
                goto LABEL_90;
              }
              v86 = *((_QWORD *)v40 + 4);
              v85 = *((_QWORD *)v40 + 5);
              v95 = __OFSUB__(v85, v86);
              v87 = v85 - v86;
              v88 = v95;
            }
            if ((v88 & 1) != 0)
              goto LABEL_137;
            v96 = v81 - 2;
            v102 = &v82[16 * v81 - 32];
            v104 = *(_QWORD *)v102;
            v103 = *((_QWORD *)v102 + 1);
            v105 = __OFSUB__(v103, v104);
            v106 = v103 - v104;
            v107 = v105;
            if (v105)
              goto LABEL_140;
            v108 = &v82[16 * v84];
            v110 = *(_QWORD *)v108;
            v109 = *((_QWORD *)v108 + 1);
            v95 = __OFSUB__(v109, v110);
            v111 = v109 - v110;
            if (v95)
              goto LABEL_143;
            if (__OFADD__(v106, v111))
              goto LABEL_144;
            if (v106 + v111 >= v87)
            {
              v112 = v87 < v111;
LABEL_96:
              if (v112)
                v84 = v96;
              goto LABEL_98;
            }
LABEL_90:
            if ((v107 & 1) != 0)
              goto LABEL_139;
            v115 = &v82[16 * v84];
            v117 = *(_QWORD *)v115;
            v116 = *((_QWORD *)v115 + 1);
            v95 = __OFSUB__(v116, v117);
            v118 = v116 - v117;
            if (v95)
              goto LABEL_142;
            if (v118 < v106)
              goto LABEL_107;
LABEL_98:
            v123 = v84 - 1;
            if (v84 - 1 >= v81)
            {
              __break(1u);
LABEL_132:
              __break(1u);
LABEL_133:
              __break(1u);
LABEL_134:
              __break(1u);
LABEL_135:
              __break(1u);
LABEL_136:
              __break(1u);
LABEL_137:
              __break(1u);
LABEL_138:
              __break(1u);
LABEL_139:
              __break(1u);
LABEL_140:
              __break(1u);
LABEL_141:
              __break(1u);
LABEL_142:
              __break(1u);
LABEL_143:
              __break(1u);
LABEL_144:
              __break(1u);
LABEL_145:
              __break(1u);
LABEL_146:
              __break(1u);
LABEL_147:
              __break(1u);
LABEL_148:
              __break(1u);
LABEL_149:
              __break(1u);
LABEL_150:
              __break(1u);
LABEL_151:
              __break(1u);
LABEL_152:
              __break(1u);
LABEL_153:
              __break(1u);
              goto LABEL_154;
            }
            if (!*v164)
              goto LABEL_156;
            v124 = v39;
            v125 = v40;
            v126 = &v82[16 * v123];
            v127 = *(_QWORD *)v126;
            v128 = &v82[16 * v84];
            v129 = *((_QWORD *)v128 + 1);
            v130 = v166;
            specialized _merge<A>(low:mid:high:buffer:by:)(*v164 + *(_QWORD *)(v162 + 72) * *(_QWORD *)v126, *v164 + *(_QWORD *)(v162 + 72) * *(_QWORD *)v128, *v164 + *(_QWORD *)(v162 + 72) * v129, v161, (uint64_t (*)(char *, char *))v165, v38);
            v166 = v130;
            if (v130)
              goto LABEL_125;
            if (v129 < v127)
              goto LABEL_132;
            if (v84 > *((_QWORD *)v125 + 2))
              goto LABEL_133;
            *(_QWORD *)v126 = v127;
            *(_QWORD *)&v82[16 * v123 + 8] = v129;
            v131 = *((_QWORD *)v125 + 2);
            if (v84 >= v131)
              goto LABEL_134;
            v40 = v125;
            v81 = v131 - 1;
            memmove(&v82[16 * v84], v128 + 16, 16 * (v131 - 1 - v84));
            *((_QWORD *)v125 + 2) = v131 - 1;
            v38 = v163;
            v39 = v124;
            if (v131 <= 2)
              goto LABEL_107;
          }
        }
        v81 = 1;
LABEL_107:
        v33 = v164[1];
        v37 = v148;
        if (v39 >= v33)
          goto LABEL_112;
      }
      v58 = (uint64_t)v158;
LABEL_39:
      if (v39 >= v33)
        goto LABEL_59;
LABEL_40:
      if (__OFSUB__(v39, v41))
        goto LABEL_152;
      if (v39 - v41 >= v57)
        goto LABEL_59;
      if (__OFADD__(v41, v57))
        goto LABEL_153;
      if (v41 + v57 >= v33)
        v65 = v33;
      else
        v65 = v41 + v57;
      if (v65 >= v41)
      {
        if (v39 == v65)
          goto LABEL_59;
        v147 = v41;
        v144 = v40;
        v66 = *(_QWORD *)(v162 + 72);
        v159 = v66 * (v39 - 1);
        v153 = v66;
        v67 = v39 * v66;
        v150 = v65;
LABEL_49:
        v68 = 0;
        v69 = v147;
        v154 = v39;
        while (1)
        {
          v71 = *v164;
          v72 = (uint64_t)v155;
          outlined init with copy of ListRequest(v67 + v68 + *v164, (uint64_t)v155, type metadata accessor for AnnotatedCacheEntry);
          outlined init with copy of ListRequest(v159 + v68 + v71, v58, type metadata accessor for AnnotatedCacheEntry);
          v73 = v166;
          v74 = v165(v72, v58);
          v75 = v58;
          v166 = v73;
          if (v73)
            break;
          v76 = v74;
          outlined destroy of ListRequest(v75, type metadata accessor for AnnotatedCacheEntry);
          outlined destroy of ListRequest(v72, type metadata accessor for AnnotatedCacheEntry);
          if ((v76 & 1) == 0)
          {
            v70 = v154;
            v58 = v75;
LABEL_56:
            v39 = v70 + 1;
            v159 += v153;
            v67 += v153;
            if (v39 == v150)
            {
              v39 = v150;
              v40 = v144;
              v41 = v147;
              goto LABEL_59;
            }
            goto LABEL_49;
          }
          v77 = *v164;
          if (!*v164)
            goto LABEL_157;
          v78 = v77 + v159 + v68;
          outlined init with take of AnnotatedCacheEntry(v77 + v67 + v68, v160);
          swift_arrayInitWithTakeFrontToBack();
          outlined init with take of AnnotatedCacheEntry(v160, v78);
          v70 = v154;
          v68 -= v153;
          ++v69;
          v58 = (uint64_t)v158;
          if (v154 == v69)
            goto LABEL_56;
        }
        outlined destroy of ListRequest(v58, type metadata accessor for AnnotatedCacheEntry);
        outlined destroy of ListRequest(v72, type metadata accessor for AnnotatedCacheEntry);
LABEL_125:
        swift_bridgeObjectRelease();
        v37 = v148;
LABEL_128:
        *(_QWORD *)(v37 + 16) = 0;
        return swift_bridgeObjectRelease();
      }
LABEL_154:
      __break(1u);
LABEL_155:
      __break(1u);
LABEL_156:
      __break(1u);
LABEL_157:
      __break(1u);
LABEL_158:
      __break(1u);
LABEL_159:
      __break(1u);
      goto LABEL_160;
    }
    v81 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
    v40 = (char *)MEMORY[0x24BEE4AF8];
LABEL_112:
    if (v81 >= 2)
    {
      v133 = *v164;
      do
      {
        v134 = v81 - 2;
        if (v81 < 2)
          goto LABEL_146;
        if (!v133)
          goto LABEL_159;
        v135 = v40;
        v136 = v40 + 32;
        v137 = *(_QWORD *)&v40[16 * v134 + 32];
        v138 = *(_QWORD *)&v40[16 * v81 + 24];
        v139 = v38;
        v140 = v166;
        specialized _merge<A>(low:mid:high:buffer:by:)(v133 + *(_QWORD *)(v162 + 72) * v137, v133 + *(_QWORD *)(v162 + 72) * *(_QWORD *)&v136[16 * v81 - 16], v133 + *(_QWORD *)(v162 + 72) * v138, v161, (uint64_t (*)(char *, char *))v165, v38);
        v166 = v140;
        if (v140)
        {
          swift_bridgeObjectRelease();
          goto LABEL_128;
        }
        if (v138 < v137)
          goto LABEL_147;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v135 = specialized _ArrayBuffer._consumeAndCreateNew()((uint64_t)v135);
        if (v134 >= *((_QWORD *)v135 + 2))
          goto LABEL_148;
        v141 = &v135[16 * v134 + 32];
        *(_QWORD *)v141 = v137;
        *((_QWORD *)v141 + 1) = v138;
        v142 = *((_QWORD *)v135 + 2);
        if (v81 > v142)
          goto LABEL_149;
        v40 = v135;
        memmove(&v135[16 * v81 + 16], &v135[16 * v81 + 32], 16 * (v142 - v81));
        *((_QWORD *)v135 + 2) = v142 - 1;
        v81 = v142 - 1;
        v38 = v139;
      }
      while (v142 > 2);
    }
    swift_bridgeObjectRelease();
    *(_QWORD *)(v37 + 16) = 0;
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t specialized MutableCollection<>._insertionSort(within:sortedEnd:by:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t), uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v7 = v6;
  v8 = v5;
  v40 = a5;
  v43 = a4;
  v37 = type metadata accessor for AnnotatedCacheEntry(0);
  v13 = MEMORY[0x24BDAC7A8](v37, v12);
  v45 = (uint64_t)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v13, v15);
  v42 = (uint64_t)&v35 - v17;
  result = MEMORY[0x24BDAC7A8](v16, v18);
  v41 = (uint64_t)&v35 - v21;
  v36 = a2;
  if (a3 != a2)
  {
    v22 = *(_QWORD *)(v20 + 72);
    v47 = v22 * (a3 - 1);
    v38 = v22;
    v46 = v22 * a3;
    v35 = a1;
LABEL_4:
    v23 = 0;
    v39 = a3;
    while (1)
    {
      v44 = a1;
      v25 = v8;
      v26 = *v8;
      v27 = v46 + v23 + *v8;
      v28 = v41;
      outlined init with copy of ListRequest(v27, v41, type metadata accessor for AnnotatedCacheEntry);
      v29 = v42;
      outlined init with copy of ListRequest(v47 + v23 + v26, v42, type metadata accessor for AnnotatedCacheEntry);
      v30 = v7;
      v31 = v43(v28, v29);
      outlined destroy of ListRequest(v29, type metadata accessor for AnnotatedCacheEntry);
      result = outlined destroy of ListRequest(v28, type metadata accessor for AnnotatedCacheEntry);
      if (v7)
        break;
      if ((v31 & 1) == 0)
      {
        v24 = v39;
        v8 = v25;
LABEL_11:
        a3 = v24 + 1;
        v47 += v38;
        v46 += v38;
        a1 = v35;
        if (a3 != v36)
          goto LABEL_4;
        return result;
      }
      v32 = *v25;
      if (!*v25)
      {
        __break(1u);
        return result;
      }
      v33 = v25;
      v34 = v32 + v47 + v23;
      outlined init with take of AnnotatedCacheEntry(v32 + v46 + v23, v45);
      swift_arrayInitWithTakeFrontToBack();
      result = outlined init with take of AnnotatedCacheEntry(v45, v34);
      v24 = v39;
      v23 -= v38;
      a1 = v44 + 1;
      v8 = v33;
      v7 = v30;
      if (v39 == v44 + 1)
        goto LABEL_11;
    }
  }
  return result;
}

uint64_t specialized _merge<A>(low:mid:high:buffer:by:)(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, uint64_t (*a5)(char *, char *), uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  int64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v35;
  char v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  char v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t result;
  uint64_t v53;
  unint64_t v54;
  char *v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t (*v59)(char *, char *);
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;

  v7 = v6;
  v59 = a5;
  v60 = a3;
  v58 = type metadata accessor for AnnotatedCacheEntry(0);
  v13 = MEMORY[0x24BDAC7A8](v58, v12);
  v15 = MEMORY[0x24BDAC7A8](v13, v14);
  v17 = MEMORY[0x24BDAC7A8](v15, v16);
  v19 = (char *)&v53 - v18;
  MEMORY[0x24BDAC7A8](v17, v20);
  v24 = (char *)&v53 - v23;
  v26 = *(_QWORD *)(v25 + 72);
  if (!v26)
  {
    __break(1u);
LABEL_64:
    __break(1u);
LABEL_65:
    __break(1u);
    goto LABEL_66;
  }
  v27 = a1;
  if (a2 - a1 == 0x8000000000000000 && v26 == -1)
    goto LABEL_64;
  v28 = v60 - a2;
  if (v60 - a2 == 0x8000000000000000 && v26 == -1)
    goto LABEL_65;
  v29 = (uint64_t)(a2 - a1) / v26;
  v63 = a1;
  v62 = a4;
  v30 = v28 / v26;
  if (v29 >= v28 / v26)
  {
    if ((v30 & 0x8000000000000000) == 0)
    {
      v55 = (char *)v22;
      v56 = a1;
      v32 = v30 * v26;
      v33 = v21;
      if (a4 < a2 || a2 + v32 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      v40 = a4 + v32;
      v61 = a4 + v32;
      v63 = a2;
      if (v32 < 1 || v56 >= a2)
        goto LABEL_62;
      v42 = -v26;
      v53 = a6;
      v54 = a4;
      while (1)
      {
        outlined init with copy of ListRequest(v40 + v42, v33, type metadata accessor for AnnotatedCacheEntry);
        v43 = a2 + v42;
        v44 = a2 + v42;
        v45 = v42;
        v24 = (char *)v33;
        v19 = v55;
        outlined init with copy of ListRequest(v44, (uint64_t)v55, type metadata accessor for AnnotatedCacheEntry);
        v46 = v59(v24, v19);
        if (v7)
          goto LABEL_61;
        v47 = v46;
        v57 = a2;
        v48 = v60;
        v49 = v60 + v45;
        outlined destroy of ListRequest((uint64_t)v19, type metadata accessor for AnnotatedCacheEntry);
        outlined destroy of ListRequest((uint64_t)v24, type metadata accessor for AnnotatedCacheEntry);
        v33 = (uint64_t)v24;
        if ((v47 & 1) != 0)
        {
          v42 = v45;
          v50 = v48 + v45;
          if (v48 < v57 || v49 >= v57)
          {
            swift_arrayInitWithTakeFrontToBack();
            v7 = 0;
          }
          else
          {
            v7 = 0;
            if (v48 != v57)
              swift_arrayInitWithTakeBackToFront();
          }
          v63 += v42;
        }
        else
        {
          v51 = v61;
          v61 += v45;
          v42 = v45;
          v50 = v48 + v45;
          if (v48 < v51 || v49 >= v51)
          {
            swift_arrayInitWithTakeFrontToBack();
            v43 = v57;
            v7 = 0;
          }
          else
          {
            v7 = 0;
            v43 = v57;
            if (v48 != v51)
              swift_arrayInitWithTakeBackToFront();
          }
        }
        v40 = v61;
        if (v61 > v54)
        {
          a2 = v43;
          v60 = v50;
          if (v43 > v56)
            continue;
        }
        goto LABEL_62;
      }
    }
  }
  else if ((v29 & 0x8000000000000000) == 0)
  {
    v31 = v29 * v26;
    if (a4 < v27 || v27 + v31 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != v27)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    v57 = a4 + v31;
    v61 = a4 + v31;
    if (v31 < 1 || a2 >= v60)
      goto LABEL_62;
    while (1)
    {
      outlined init with copy of ListRequest(a2, (uint64_t)v24, type metadata accessor for AnnotatedCacheEntry);
      outlined init with copy of ListRequest(a4, (uint64_t)v19, type metadata accessor for AnnotatedCacheEntry);
      v35 = v59(v24, v19);
      if (v6)
        break;
      v36 = v35;
      outlined destroy of ListRequest((uint64_t)v19, type metadata accessor for AnnotatedCacheEntry);
      outlined destroy of ListRequest((uint64_t)v24, type metadata accessor for AnnotatedCacheEntry);
      v37 = v63;
      if ((v36 & 1) != 0)
      {
        v38 = a2 + v26;
        if (v63 < a2 || v63 >= v38)
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (v63 == a2)
        {
          v37 = a2;
        }
        else
        {
          swift_arrayInitWithTakeBackToFront();
        }
      }
      else
      {
        v39 = v62 + v26;
        if (v63 < v62 || v63 >= v39)
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (v63 != v62)
        {
          swift_arrayInitWithTakeBackToFront();
        }
        v62 = v39;
        v38 = a2;
      }
      v63 = v37 + v26;
      a4 = v62;
      if (v62 < v57)
      {
        a2 = v38;
        if (v38 < v60)
          continue;
      }
      goto LABEL_62;
    }
LABEL_61:
    outlined destroy of ListRequest((uint64_t)v19, type metadata accessor for AnnotatedCacheEntry);
    outlined destroy of ListRequest((uint64_t)v24, type metadata accessor for AnnotatedCacheEntry);
LABEL_62:
    specialized $defer #1 <A>() in _merge<A>(low:mid:high:buffer:by:)(&v63, &v62, (uint64_t *)&v61);
    return 1;
  }
LABEL_66:
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Range<Int>>);
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
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t specialized $defer #1 <A>() in _merge<A>(low:mid:high:buffer:by:)(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  v3 = *a1;
  v4 = *a2;
  v5 = *a3;
  result = type metadata accessor for AnnotatedCacheEntry(0);
  v7 = *(_QWORD *)(*(_QWORD *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v8 = v5 - v4;
  if (v5 - v4 == 0x8000000000000000 && v7 == -1)
    goto LABEL_14;
  if (v8 / v7 < 0)
  {
LABEL_15:
    result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  if (v3 < v4 || v3 >= v4 + v8 / v7 * v7)
    return swift_arrayInitWithTakeFrontToBack();
  if (v3 != v4)
    return swift_arrayInitWithTakeBackToFront();
  return result;
}

char *specialized _ArrayBuffer._consumeAndCreateNew()(uint64_t a1)
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

{
  uint64_t *v3;
  uint64_t result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  unint64_t v22;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<AnnotatedCacheEntry>);
  v10 = *(_QWORD *)(type metadata accessor for AnnotatedCacheEntry(0) - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_34;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(type metadata accessor for AnnotatedCacheEntry(0) - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (char *)v13 + v17;
  v19 = (char *)a4 + v17;
  if ((a1 & 1) != 0)
  {
    if (v13 < a4 || v18 >= &v19[*(_QWORD *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v20 = *(_QWORD *)(v16 + 72) * v8;
  v21 = &v18[v20];
  v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  size_t v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CacheEntry>);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  v14 = 24 * v8;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v14])
      memmove(v12, v13, v14);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v14] || v12 >= &v13[v14])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void specialized Data._Representation.withUnsafeMutableBytes<A>(_:)()
{
  __asm { BR              X11 }
}

_QWORD *sub_2401FC050@<X0>(uint64_t a1@<X8>)
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

uint64_t specialized _ContiguousArrayBuffer._consumeAndCreateNew()(_QWORD *a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, a1[2], 0, a1);
}

uint64_t specialized LLMCacheManager.__allocating_init(namespace:databaseAccess:ttl:logEmitter:)(_BYTE *a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t *boxed_opaque_existential_1;
  uint64_t v15;
  double v16;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;

  v19 = a7;
  v20 = a8;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v18);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a7 - 8) + 32))(boxed_opaque_existential_1, a2, a7);
  type metadata accessor for LLMCacheManager();
  v15 = swift_allocObject();
  LOBYTE(a2) = *a1;
  swift_defaultActor_initialize();
  *(_BYTE *)(v15 + 112) = a2;
  outlined init with take of ContiguousBytes(&v18, v15 + 120);
  v16 = *(double *)&a3;
  if ((a4 & 1) != 0)
    v16 = 15552000.0;
  *(double *)(v15 + 160) = v16;
  *(_QWORD *)(v15 + 168) = a5;
  return v15;
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t partial apply for closure #1 in static LLMCacheManager.sortAndFilterListResult(_:request:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return closure #1 in static LLMCacheManager.sortAndFilterListResult(_:request:)(a1, a2, *(uint64_t **)(v2 + 16)) & 1;
}

uint64_t partial apply for closure #2 in LLMCacheManager.list(with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return closure #2 in LLMCacheManager.list(with:)(a1, *(uint64_t **)(v2 + 16), a2);
}

uint64_t outlined destroy of ListRequest(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t outlined init with copy of ListRequest(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t specialized __DataStorage.withUnsafeBytes<A>(in:apply:)(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = __DataStorage._bytes.getter();
  if (!result || (result = __DataStorage._offset.getter(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      __DataStorage._length.getter();
      type metadata accessor for Insecure.SHA1();
      lazy protocol witness table accessor for type Insecure.SHA1 and conformance Insecure.SHA1(&lazy protocol witness table cache variable for type Insecure.SHA1 and conformance Insecure.SHA1, (uint64_t (*)(uint64_t))MEMORY[0x24BDC6B90], MEMORY[0x24BDC6B88]);
      return dispatch thunk of HashFunction.update(bufferPointer:)();
    }
    __break(1u);
  }
  __break(1u);
  return result;
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

uint64_t specialized _ArrayBuffer._copyContents(subRange:initializing:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *specialized _ArrayBuffer._copyContents(subRange:initializing:)(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 8 * a1 + 32);
    v6 = 8 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized _ArrayBuffer._copyContents(subRange:initializing:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;

  v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    v9 = *(_QWORD *)(a5(0) - 8);
    v10 = *(unsigned __int8 *)(v9 + 80);
    v11 = *(_QWORD *)(v9 + 72);
    v12 = a4 + ((v10 + 32) & ~v10) + v11 * a1;
    v13 = v11 * v5;
    v14 = a3 + v13;
    v15 = v12 + v13;
    if (v12 >= v14 || v15 <= a3)
    {
      swift_arrayInitWithCopy();
      return v14;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
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
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  type metadata accessor for __DataStorage();
  swift_allocObject();
  result = __DataStorage.init(bytes:length:)();
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

void specialized static LLMCacheManager.generateEntryId(searchKey:llmOutput:)(uint64_t a1, unint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  Swift::String v13;
  Swift::String v14;
  uint64_t v15;
  uint64_t v16;

  v8 = type metadata accessor for Insecure.SHA1();
  v9 = (uint64_t (*)(uint64_t))MEMORY[0x24BDC6B90];
  MEMORY[0x24BDAC7A8](v8, v10);
  v11 = type metadata accessor for Insecure.SHA1Digest();
  MEMORY[0x24BDAC7A8](v11, v12);
  swift_bridgeObjectRetain();
  v13._countAndFlagsBits = 45;
  v13._object = (void *)0xE100000000000000;
  String.append(_:)(v13);
  v14._countAndFlagsBits = a3;
  v14._object = a4;
  String.append(_:)(v14);
  specialized Data.init<A>(_:)(a1, a2);
  v16 = v15;
  lazy protocol witness table accessor for type Insecure.SHA1 and conformance Insecure.SHA1(&lazy protocol witness table cache variable for type Insecure.SHA1 and conformance Insecure.SHA1, v9, MEMORY[0x24BDC6B88]);
  dispatch thunk of HashFunction.init()();
  __asm { BR              X10 }
}

uint64_t sub_2401FCF3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *boxed_opaque_existential_1;
  unint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v6 - 136) = v4;
  *(_WORD *)(v6 - 128) = v5;
  *(_BYTE *)(v6 - 126) = BYTE2(v5);
  *(_BYTE *)(v6 - 125) = BYTE3(v5);
  *(_BYTE *)(v6 - 124) = BYTE4(v5);
  *(_BYTE *)(v6 - 123) = BYTE5(v5);
  dispatch thunk of HashFunction.update(bufferPointer:)();
  outlined consume of Data._Representation(v4, v5);
  v7 = *(_QWORD *)(v6 - 168);
  dispatch thunk of HashFunction.finalize()();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 176) + 8))(v3, v2);
  outlined consume of Data._Representation(v4, v5);
  *(_QWORD *)(v6 - 112) = v0;
  *(_QWORD *)(v6 - 104) = lazy protocol witness table accessor for type Insecure.SHA1 and conformance Insecure.SHA1(&lazy protocol witness table cache variable for type Insecure.SHA1Digest and conformance Insecure.SHA1Digest, (uint64_t (*)(uint64_t))MEMORY[0x24BDC6B58], MEMORY[0x24BDC6B48]);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v6 - 136));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v7 + 16))(boxed_opaque_existential_1, v1, v0);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v6 - 136), *(_QWORD *)(v6 - 112));
  dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v1, v0);
  v9 = *(_QWORD *)(v6 - 144);
  __swift_destroy_boxed_opaque_existential_1Tm(v6 - 136);
  v10 = static Array._allocateBufferUninitialized(minimumCapacity:)();
  *(_QWORD *)(v10 + 16) = 8;
  *(_QWORD *)(v10 + 32) = 0;
  return ((uint64_t (*)(void))((char *)&loc_2401FD170 + *((int *)qword_2401FD448 + (v9 >> 62))))();
}

uint64_t sub_2401FD180()
{
  unint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  id v17;

  v6 = 0;
  if (BYTE6(v1))
  {
    *(_QWORD *)(v5 - 176) = BYTE6(v1);
    *(_QWORD *)(v5 - 168) = (int)v0;
    *(_QWORD *)(v5 - 192) = v0 >> 8;
    *(_QWORD *)(v5 - 184) = (uint64_t)v0 >> 32;
    *(_QWORD *)(v5 - 208) = v0 >> 24;
    *(_QWORD *)(v5 - 200) = v0 >> 16;
    *(_QWORD *)(v5 - 224) = v0 >> 40;
    *(_QWORD *)(v5 - 216) = HIDWORD(v0);
    *(_QWORD *)(v5 - 240) = HIBYTE(v0);
    *(_QWORD *)(v5 - 232) = HIWORD(v0);
    *(_QWORD *)(v5 - 256) = v1 >> 16;
    *(_QWORD *)(v5 - 248) = v1 >> 8;
    *(_QWORD *)(v5 - 264) = v1 >> 24;
    *(_QWORD *)(v5 - 272) = HIDWORD(v1);
    *(_QWORD *)(v5 - 280) = v1 >> 40;
    do
    {
      if (v6 >= BYTE6(v1))
      {
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
LABEL_30:
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
LABEL_33:
        __break(1u);
LABEL_34:
        __break(1u);
LABEL_35:
        __break(1u);
        JUMPOUT(0x2401FD424);
      }
      v8 = *(_QWORD *)(v2 + 16);
      if (!v8)
        goto LABEL_27;
      if (v4)
      {
        if (v4 == 1)
        {
          if (v6 < *(_QWORD *)(v5 - 168) || v6 >= *(_QWORD *)(v5 - 184))
            goto LABEL_30;
          v9 = __DataStorage._bytes.getter();
          if (!v9)
          {
            __break(1u);
LABEL_37:
            __break(1u);
          }
          v10 = v9;
          v11 = __DataStorage._offset.getter();
          v12 = v6 - v11;
          if (__OFSUB__(v6, v11))
            goto LABEL_33;
        }
        else
        {
          if (v6 < *(_QWORD *)(v0 + 16))
            goto LABEL_32;
          if (v6 >= *(_QWORD *)(v0 + 24))
            goto LABEL_34;
          v14 = __DataStorage._bytes.getter();
          if (!v14)
            goto LABEL_37;
          v10 = v14;
          v15 = __DataStorage._offset.getter();
          v12 = v6 - v15;
          if (__OFSUB__(v6, v15))
            goto LABEL_35;
        }
        v13 = *(_BYTE *)(v10 + v12);
      }
      else
      {
        if (v6 >= *(_QWORD *)(v5 - 176))
          goto LABEL_31;
        *(_BYTE *)(v5 - 136) = v0;
        *(_BYTE *)(v5 - 135) = *(_QWORD *)(v5 - 192);
        *(_BYTE *)(v5 - 134) = *(_QWORD *)(v5 - 200);
        *(_BYTE *)(v5 - 133) = *(_QWORD *)(v5 - 208);
        *(_BYTE *)(v5 - 132) = *(_QWORD *)(v5 - 216);
        *(_BYTE *)(v5 - 131) = *(_QWORD *)(v5 - 224);
        *(_BYTE *)(v5 - 130) = *(_QWORD *)(v5 - 232);
        *(_BYTE *)(v5 - 129) = *(_QWORD *)(v5 - 240);
        *(_BYTE *)(v5 - 128) = v1;
        *(_BYTE *)(v5 - 127) = *(_QWORD *)(v5 - 248);
        *(_BYTE *)(v5 - 126) = *(_QWORD *)(v5 - 256);
        *(_BYTE *)(v5 - 125) = *(_QWORD *)(v5 - 264);
        *(_BYTE *)(v5 - 124) = *(_QWORD *)(v5 - 272);
        *(_BYTE *)(v5 - 123) = *(_QWORD *)(v5 - 280);
        v13 = *(_BYTE *)(v5 - 136 + v6);
      }
      v16 = v6 % v8;
      if (v6 % v8 < 0)
        goto LABEL_28;
      if (v16 >= *(_QWORD *)(v2 + 16))
        goto LABEL_29;
      ++v6;
      *(_BYTE *)(v3 + v16) ^= v13;
    }
    while (BYTE6(v1) != v6);
    v7 = *(_QWORD *)(v2 + 16);
  }
  else
  {
    v7 = 8;
  }
  *(_QWORD *)(v5 - 136) = 0;
  v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCE50]), sel_initWithBytes_length_, v3, v7);
  swift_bridgeObjectRelease();
  objc_msgSend(v17, sel_getBytes_length_, v5 - 136, 8);

  outlined consume of Data._Representation(v0, v1);
  return *(_QWORD *)(v5 - 136);
}

uint64_t outlined init with take of Date?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t outlined assign with take of Date?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t specialized _ArrayProtocol.filter(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  char v23;
  void (*v24)(char *, uint64_t);
  char *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v3 = type metadata accessor for Date();
  v37 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3, v4);
  v34 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5, v7);
  v33 = (char *)&v30 - v8;
  v35 = type metadata accessor for AnnotatedCacheEntry(0);
  v10 = MEMORY[0x24BDAC7A8](v35, v9);
  v36 = (uint64_t)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10, v12);
  v15 = (char *)&v30 - v14;
  result = MEMORY[0x24BEE4AF8];
  v38 = MEMORY[0x24BEE4AF8];
  v17 = *(_QWORD *)(a1 + 16);
  if (v17)
  {
    v18 = *(unsigned __int8 *)(v13 + 80);
    v19 = *(_QWORD *)(v13 + 72);
    v30 = v1;
    v31 = (v18 + 32) & ~v18;
    v20 = a1 + v31;
    v32 = v3;
    do
    {
      outlined init with copy of ListRequest(v20, (uint64_t)v15, type metadata accessor for AnnotatedCacheEntry);
      v21 = v33;
      Date.addingTimeInterval(_:)();
      v22 = v34;
      static Date.now.getter();
      v23 = static Date.< infix(_:_:)();
      v24 = *(void (**)(char *, uint64_t))(v37 + 8);
      v25 = v22;
      v26 = v32;
      v24(v25, v32);
      v24(v21, v26);
      if ((v23 & 1) != 0)
      {
        outlined init with take of AnnotatedCacheEntry((uint64_t)v15, v36);
        v27 = v38;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v27 + 16) + 1, 1);
          v27 = v38;
        }
        v29 = *(_QWORD *)(v27 + 16);
        v28 = *(_QWORD *)(v27 + 24);
        if (v29 >= v28 >> 1)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v28 > 1, v29 + 1, 1);
          v27 = v38;
        }
        *(_QWORD *)(v27 + 16) = v29 + 1;
        outlined init with take of AnnotatedCacheEntry(v36, v27 + v31 + v29 * v19);
      }
      else
      {
        outlined destroy of ListRequest((uint64_t)v15, type metadata accessor for AnnotatedCacheEntry);
      }
      v20 += v19;
      --v17;
    }
    while (v17);
    return v38;
  }
  return result;
}

uint64_t dispatch thunk of LLMCacheManaging.list(with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a4 + 8) + *(_QWORD *)(a4 + 8));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = dispatch thunk of CacheDatabase.describe(identifier:);
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of LLMCacheManaging.insert(with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 16) + *(_QWORD *)(a3 + 16));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = dispatch thunk of CacheDatabase.describe(identifier:);
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of LLMCacheManaging.insert(searchKey:llmOutput:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v13;
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a6 + 24)
                                                                                     + *(_QWORD *)(a6 + 24));
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v13;
  *v13 = v6;
  v13[1] = dispatch thunk of CacheDatabase.describe(identifier:);
  return v15(a1, a2, a3, a4, a5, a6);
}

uint64_t dispatch thunk of LLMCacheManaging.deleteAll()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 32) + *(_QWORD *)(a2 + 32));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = dispatch thunk of CacheDatabase.describe(identifier:);
  return v7(a1, a2);
}

uint64_t dispatch thunk of LLMCacheManaging.warmup()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 40) + *(_QWORD *)(a2 + 40));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = dispatch thunk of CacheDatabase.describe(identifier:);
  return v7(a1, a2);
}

uint64_t dispatch thunk of LLMCacheManaging.pruneExpiredEntries()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 48) + *(_QWORD *)(a2 + 48));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = dispatch thunk of CacheDatabase.describe(identifier:);
  return v7(a1, a2);
}

uint64_t method lookup function for LLMCacheManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of LLMCacheManager.__allocating_init(namespace:databaseAccess:ttl:logEmitter:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v4 + 120))(a1, a2, a3, a4 & 1);
}

uint64_t dispatch thunk of LLMCacheManager.list(with:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(*(_QWORD *)v2 + 128) + *(_QWORD *)(*(_QWORD *)v2 + 128));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = dispatch thunk of CacheDatabase.describe(identifier:);
  return v8(a1, a2);
}

uint64_t dispatch thunk of LLMCacheManager.insert(searchKey:llmOutput:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v10;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t, uint64_t);

  v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v4 + 152)
                                                                   + *(_QWORD *)(*(_QWORD *)v4 + 152));
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v10;
  *v10 = v5;
  v10[1] = dispatch thunk of CacheDatabase.describe(identifier:);
  return v12(a1, a2, a3, a4);
}

uint64_t dispatch thunk of LLMCacheManager.insert(with:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 160) + *(_QWORD *)(*(_QWORD *)v1 + 160));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = dispatch thunk of CacheDatabase.describe(identifier:);
  return v6(a1);
}

uint64_t dispatch thunk of LLMCacheManager.deleteAll()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 168) + *(_QWORD *)(*(_QWORD *)v0 + 168));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = dispatch thunk of CacheDatabase.describe(identifier:);
  return v4();
}

uint64_t dispatch thunk of LLMCacheManager.warmup()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 176) + *(_QWORD *)(*(_QWORD *)v0 + 176));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = dispatch thunk of CacheDatabase.describe(identifier:);
  return v4();
}

uint64_t dispatch thunk of LLMCacheManager.pruneExpiredEntries()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 184) + *(_QWORD *)(*(_QWORD *)v0 + 184));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = dispatch thunk of CacheDatabase.delete(entries:);
  return v4();
}

uint64_t storeEnumTagSinglePayload for LLMCacheManagerError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2401FDD34 + 4 * byte_24020D3B5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2401FDD68 + 4 * byte_24020D3B0[v4]))();
}

uint64_t sub_2401FDD68(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2401FDD70(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2401FDD78);
  return result;
}

uint64_t sub_2401FDD84(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2401FDD8CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2401FDD90(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2401FDD98(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for LLMCacheManagerError()
{
  return &type metadata for LLMCacheManagerError;
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

uint64_t lazy protocol witness table accessor for type Insecure.SHA1 and conformance Insecure.SHA1(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2426803DC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
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

uint64_t outlined consume of Data._Representation?(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return outlined consume of Data._Representation(a1, a2);
  return a1;
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

unint64_t lazy protocol witness table accessor for type LLMCacheManagerFeatureFlags and conformance LLMCacheManagerFeatureFlags()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type LLMCacheManagerFeatureFlags and conformance LLMCacheManagerFeatureFlags;
  if (!lazy protocol witness table cache variable for type LLMCacheManagerFeatureFlags and conformance LLMCacheManagerFeatureFlags)
  {
    result = MEMORY[0x2426803DC](&protocol conformance descriptor for LLMCacheManagerFeatureFlags, &type metadata for LLMCacheManagerFeatureFlags);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LLMCacheManagerFeatureFlags and conformance LLMCacheManagerFeatureFlags);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type LLMCacheManagerFeatureFlags and conformance LLMCacheManagerFeatureFlags;
  if (!lazy protocol witness table cache variable for type LLMCacheManagerFeatureFlags and conformance LLMCacheManagerFeatureFlags)
  {
    result = MEMORY[0x2426803DC](&protocol conformance descriptor for LLMCacheManagerFeatureFlags, &type metadata for LLMCacheManagerFeatureFlags);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LLMCacheManagerFeatureFlags and conformance LLMCacheManagerFeatureFlags);
  }
  return result;
}

uint64_t closure #1 in static LLMCacheManager.sortAndFilterListResult(_:request:)partial apply(uint64_t a1, uint64_t a2)
{
  return partial apply for closure #1 in static LLMCacheManager.sortAndFilterListResult(_:request:)(a1, a2) & 1;
}

LLMCache::CacheNamespace_optional __swiftcall CacheNamespace.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  void *object;
  Swift::String v3;
  char *v4;
  unint64_t v5;
  LLMCache::CacheNamespace_optional result;
  char v7;

  object = rawValue._object;
  v3._countAndFlagsBits = rawValue._countAndFlagsBits;
  v4 = v1;
  v3._object = object;
  v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of CacheNamespace.init(rawValue:), v3);
  result.value = swift_bridgeObjectRelease();
  v7 = 3;
  if (v5 < 3)
    v7 = v5;
  *v4 = v7;
  return result;
}

uint64_t CacheNamespace.rawValue.getter()
{
  _BYTE *v0;
  unint64_t v1;

  v1 = 1819047270;
  if (*v0 != 1)
    v1 = 0xD000000000000012;
  if (*v0)
    return v1;
  else
    return 1953718630;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance CacheNamespace(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

unint64_t lazy protocol witness table accessor for type CacheNamespace and conformance CacheNamespace()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CacheNamespace and conformance CacheNamespace;
  if (!lazy protocol witness table cache variable for type CacheNamespace and conformance CacheNamespace)
  {
    result = MEMORY[0x2426803DC](&protocol conformance descriptor for CacheNamespace, &type metadata for CacheNamespace);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CacheNamespace and conformance CacheNamespace);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CacheNamespace and conformance CacheNamespace;
  if (!lazy protocol witness table cache variable for type CacheNamespace and conformance CacheNamespace)
  {
    result = MEMORY[0x2426803DC](&protocol conformance descriptor for CacheNamespace, &type metadata for CacheNamespace);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CacheNamespace and conformance CacheNamespace);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CacheNamespace and conformance CacheNamespace;
  if (!lazy protocol witness table cache variable for type CacheNamespace and conformance CacheNamespace)
  {
    result = MEMORY[0x2426803DC](&protocol conformance descriptor for CacheNamespace, &type metadata for CacheNamespace);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CacheNamespace and conformance CacheNamespace);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CacheNamespace and conformance CacheNamespace;
  if (!lazy protocol witness table cache variable for type CacheNamespace and conformance CacheNamespace)
  {
    result = MEMORY[0x2426803DC](&protocol conformance descriptor for CacheNamespace, &type metadata for CacheNamespace);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CacheNamespace and conformance CacheNamespace);
  }
  return result;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance CacheNamespace()
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance CacheNamespace()
{
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance CacheNamespace()
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

LLMCache::CacheNamespace_optional protocol witness for RawRepresentable.init(rawValue:) in conformance CacheNamespace(Swift::String *a1)
{
  return CacheNamespace.init(rawValue:)(*a1);
}

void protocol witness for RawRepresentable.rawValue.getter in conformance CacheNamespace(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  int v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  BOOL v6;
  uint64_t v7;

  v2 = *v1;
  v3 = 0xE400000000000000;
  v4 = 0xE400000000000000;
  v5 = 1819047270;
  if (v2 != 1)
  {
    v5 = 0xD000000000000012;
    v4 = 0x800000024020DCF0;
  }
  v6 = v2 == 0;
  if (*v1)
    v7 = v5;
  else
    v7 = 1953718630;
  if (!v6)
    v3 = v4;
  *a1 = v7;
  a1[1] = v3;
}

uint64_t protocol witness for Decodable.init(from:) in conformance CacheNamespace()
{
  lazy protocol witness table accessor for type CacheNamespace and conformance CacheNamespace();
  return RawRepresentable<>.init(from:)();
}

uint64_t protocol witness for Encodable.encode(to:) in conformance CacheNamespace()
{
  lazy protocol witness table accessor for type CacheNamespace and conformance CacheNamespace();
  return RawRepresentable<>.encode(to:)();
}

uint64_t storeEnumTagSinglePayload for CacheNamespace(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2401FE3A0 + 4 * byte_24020D559[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2401FE3D4 + 4 * byte_24020D554[v4]))();
}

uint64_t sub_2401FE3D4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2401FE3DC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2401FE3E4);
  return result;
}

uint64_t sub_2401FE3F0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2401FE3F8);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2401FE3FC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2401FE404(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CacheNamespace()
{
  return &type metadata for CacheNamespace;
}

uint64_t VectorDatabaseAccess.__allocating_init(path:embeddingProvider:)(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v5;

  swift_allocObject();
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = VectorDatabaseAccess.__allocating_init(path:embeddingProvider:);
  return VectorDatabaseAccess.init(path:embeddingProvider:)(a1, a2);
}

uint64_t VectorDatabaseAccess.__allocating_init(path:embeddingProvider:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = swift_task_dealloc();
  if (!v1)
    v5 = a1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

void *VectorDatabaseAccess.maxSearchResults.unsafeMutableAddressor()
{
  return &static VectorDatabaseAccess.maxSearchResults;
}

uint64_t static VectorDatabaseAccess.maxSearchResults.getter()
{
  return 8;
}

uint64_t one-time initialization function for jsonEncoder(uint64_t a1)
{
  return one-time initialization function for jsonEncoder(a1, MEMORY[0x24BDCB410], MEMORY[0x24BDCB400], &static VectorDatabaseAccess.jsonEncoder);
}

uint64_t one-time initialization function for jsonDecoder(uint64_t a1)
{
  return one-time initialization function for jsonEncoder(a1, MEMORY[0x24BDCB268], MEMORY[0x24BDCB260], &static VectorDatabaseAccess.jsonDecoder);
}

uint64_t one-time initialization function for jsonEncoder(uint64_t a1, void (*a2)(_QWORD), uint64_t (*a3)(void), uint64_t *a4)
{
  uint64_t result;

  a2(0);
  swift_allocObject();
  result = a3();
  *a4 = result;
  return result;
}

uint64_t *VectorDatabaseAccess.jsonDecoder.unsafeMutableAddressor()
{
  if (one-time initialization token for jsonDecoder != -1)
    swift_once();
  return &static VectorDatabaseAccess.jsonDecoder;
}

uint64_t static VectorDatabaseAccess.jsonDecoder.getter()
{
  if (one-time initialization token for jsonDecoder != -1)
    swift_once();
  return swift_retain();
}

const char *VectorDatabaseAccess.dimensionFile.unsafeMutableAddressor()
{
  return "dimension.txt";
}

uint64_t static VectorDatabaseAccess.dimensionFile.getter()
{
  return 0x6F69736E656D6964;
}

uint64_t VectorDatabaseAccess.embeddingProvider.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return outlined init with copy of CacheDatabase(v1 + 112, a1);
}

uint64_t VectorDatabaseAccess.vectordb.getter()
{
  return swift_retain();
}

uint64_t VectorDatabaseAccess.init(path:embeddingProvider:)(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  unint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  uint64_t v30;

  v4 = v2;
  v3[3] = a1;
  v3[4] = a2;
  v3[5] = v4;
  v7 = type metadata accessor for ColumnType();
  v3[6] = v7;
  v3[7] = *(_QWORD *)(v7 - 8);
  v3[8] = swift_task_alloc();
  v8 = type metadata accessor for VectorDatabaseMetric();
  v3[9] = v8;
  v3[10] = *(_QWORD *)(v8 - 8);
  v3[11] = swift_task_alloc();
  v9 = type metadata accessor for VectorDatabaseConfig();
  v3[12] = v9;
  v3[13] = *(_QWORD *)(v9 - 8);
  v3[14] = swift_task_alloc();
  v3[15] = swift_task_alloc();
  v10 = type metadata accessor for VectorDatabaseDataType();
  v3[16] = v10;
  v3[17] = *(_QWORD *)(v10 - 8);
  v3[18] = swift_task_alloc();
  v3[19] = swift_task_alloc();
  v11 = type metadata accessor for URL();
  v3[20] = v11;
  v12 = *(_QWORD *)(v11 - 8);
  v3[21] = swift_task_alloc();
  v13 = swift_task_alloc();
  v3[22] = v13;
  swift_defaultActor_initialize();
  if (one-time initialization token for logger != -1)
    swift_once();
  v14 = type metadata accessor for Logger();
  v3[23] = __swift_project_value_buffer(v14, (uint64_t)static Logger.logger);
  v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16);
  v3[24] = v15;
  v15(v13, a1, v11);
  v16 = Logger.logObject.getter();
  v17 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v16, v17))
  {
    v28 = v4;
    v18 = (uint8_t *)swift_slowAlloc();
    v27 = swift_slowAlloc();
    v30 = v27;
    *(_DWORD *)v18 = 136315138;
    v19 = URL.absoluteString.getter();
    v3[2] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v19, v20, &v30);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v21 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v21(v13, v11);
    _os_log_impl(&dword_2401E6000, v16, v17, "VectorDatabaseAccess directory: %s", v18, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24268046C](v27, -1, -1);
    v22 = v18;
    v4 = v28;
    MEMORY[0x24268046C](v22, -1, -1);
  }
  else
  {
    v21 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v21(v13, v11);
  }

  v3[25] = v21;
  outlined init with copy of CacheDatabase((uint64_t)a2, v4 + 112);
  v23 = a2[3];
  v24 = a2[4];
  __swift_project_boxed_opaque_existential_1(a2, v23);
  v29 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(v24 + 8) + *(_QWORD *)(v24 + 8));
  v25 = (_QWORD *)swift_task_alloc();
  v3[26] = v25;
  *v25 = v3;
  v25[1] = VectorDatabaseAccess.init(path:embeddingProvider:);
  return v29(v23, v24);
}

uint64_t VectorDatabaseAccess.init(path:embeddingProvider:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 216) = a1;
  swift_task_dealloc();
  v3 = Logger.logObject.getter();
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2401E6000, v3, v4, "VectorDatabaseAccess using float16 data type for this hardware", v5, 2u);
    MEMORY[0x24268046C](v5, -1, -1);
  }
  v6 = v2[21];
  v16 = v2[20];
  v17 = (void (*)(uint64_t, uint64_t, uint64_t))v2[24];
  v7 = v2[19];
  v20 = v2[18];
  v8 = v2[16];
  v9 = v2[17];
  v21 = v2[15];
  v22 = v2[13];
  v10 = v2[11];
  v23 = v2[12];
  v24 = v2[14];
  v11 = v2[9];
  v12 = v2[10];
  v13 = (_QWORD *)v2[8];
  v18 = v2[7];
  v19 = v2[6];
  v25 = v2[5];
  v14 = v2[3];

  (*(void (**)(uint64_t, _QWORD, uint64_t))(v9 + 104))(v7, *MEMORY[0x24BEBFDB0], v8);
  v17(v6, v14, v16);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v12 + 104))(v10, *MEMORY[0x24BEBFD68], v11);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<VectorDatabaseAttribute>);
  type metadata accessor for VectorDatabaseAttribute();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_24020D390;
  *v13 = 0;
  v13[1] = 0;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v18 + 104))(v13, *MEMORY[0x24BEBFE28], v19);
  VectorDatabaseAttribute.init(name:columnType:)();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v20, v7, v8);
  VectorDatabaseConfig.init(baseDirectory:distanceMetric:filterableAttributes:dimension:includePayload:numberOfProbes:averagePartitionSize:batchSize:batchFactor:tradeOffParameterBetweenClusteringAndBalance:dataType:)();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16))(v24, v21, v23);
  type metadata accessor for VectorDatabaseClient();
  swift_allocObject();
  *(_QWORD *)(v25 + 152) = VectorDatabaseClient.init(config:)();
  return swift_task_switch();
}

uint64_t VectorDatabaseAccess.init(path:embeddingProvider:)()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  void (*v4)(uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;

  specialized static VectorDatabaseAccess.updatePerisistedDimension(_:at:)(*(_QWORD *)(v0 + 216), *(_BYTE **)(v0 + 24));
  v1 = Logger.logObject.getter();
  v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2401E6000, v1, v2, "VectorDatabaseAccess init completed", v3, 2u);
    MEMORY[0x24268046C](v3, -1, -1);
  }
  v4 = *(void (**)(uint64_t, uint64_t))(v0 + 200);
  v5 = *(_QWORD *)(v0 + 160);
  v6 = *(_QWORD *)(v0 + 152);
  v7 = *(_QWORD *)(v0 + 120);
  v13 = *(_QWORD *)(v0 + 136);
  v14 = *(_QWORD *)(v0 + 128);
  v8 = *(_QWORD *)(v0 + 104);
  v9 = *(_QWORD *)(v0 + 96);
  v10 = *(_QWORD *)(v0 + 24);
  v11 = *(_QWORD *)(v0 + 32);

  v4(v10, v5);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v6, v14);
  __swift_destroy_boxed_opaque_existential_1Tm(v11);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 40));
}

uint64_t VectorDatabaseAccess.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;

  v1 = v0;
  dispatch thunk of VectorDatabaseClient.cooldown()();
  if (one-time initialization token for logger != -1)
    swift_once();
  v2 = type metadata accessor for Logger();
  __swift_project_value_buffer(v2, (uint64_t)static Logger.logger);
  v3 = Logger.logObject.getter();
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2401E6000, v3, v4, "VectorDatabaseAccess deinit completed", v5, 2u);
    MEMORY[0x24268046C](v5, -1, -1);
  }

  __swift_destroy_boxed_opaque_existential_1Tm(v1 + 112);
  swift_release();
  swift_defaultActor_destroy();
  return v1;
}

uint64_t VectorDatabaseAccess.__deallocating_deinit()
{
  VectorDatabaseAccess.deinit();
  return swift_defaultActor_deallocate();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> VectorDatabaseAccess.delete(entries:)(Swift::OpaquePointer entries)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  void *rawValue;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned __int8 *v22;
  unsigned __int8 *v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  unsigned __int8 *v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unsigned __int8 *v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  unsigned __int8 *v42;
  unsigned int v43;
  uint64_t v44;
  char v45;
  char v46;
  uint64_t v47;
  _BYTE *v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  uint8_t *v52;
  uint64_t v53;
  NSObject *v54;
  os_log_type_t v55;
  uint64_t v56;
  os_log_type_t v57;
  uint8_t *v58;
  char *v59;
  char *v60;
  uint64_t v61;
  void *v62;
  _QWORD *v63;
  _QWORD v64[2];

  v2 = v1;
  v4 = type metadata accessor for AnnotatedCacheEntry(0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (uint64_t *)((char *)&v59 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (one-time initialization token for logger != -1)
LABEL_84:
    swift_once();
  v9 = type metadata accessor for Logger();
  v10 = __swift_project_value_buffer(v9, (uint64_t)static Logger.logger);
  v11 = Logger.logObject.getter();
  v12 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_2401E6000, v11, v12, "VectorDatabaseAccess entering delete...", v13, 2u);
    MEMORY[0x24268046C](v13, -1, -1);
  }

  v14 = *((_QWORD *)entries._rawValue + 2);
  if (!v14)
    goto LABEL_78;
  rawValue = entries._rawValue;
  entries._rawValue = (char *)entries._rawValue
                    + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  v59 = (char *)v64 + 2;
  v60 = (char *)v64 + 3;
  v61 = v10;
  v5 = *(_QWORD *)(v5 + 72);
  v62 = rawValue;
  swift_bridgeObjectRetain();
  v16 = 0;
  v63 = (_QWORD *)MEMORY[0x24BEE4AF8];
  do
  {
    outlined init with copy of AnnotatedCacheEntry((uint64_t)entries._rawValue + v5 * v16, (uint64_t)v8);
    v17 = *v8;
    v18 = v8[1];
    v19 = HIBYTE(v18) & 0xF;
    v20 = *v8 & 0xFFFFFFFFFFFFLL;
    if ((v18 & 0x2000000000000000) != 0)
      v21 = HIBYTE(v18) & 0xF;
    else
      v21 = *v8 & 0xFFFFFFFFFFFFLL;
    if (!v21)
    {
LABEL_6:
      outlined destroy of AnnotatedCacheEntry((uint64_t)v8);
      goto LABEL_7;
    }
    if ((v18 & 0x1000000000000000) != 0)
    {
      swift_bridgeObjectRetain();
      v25 = (uint64_t)specialized _parseInteger<A, B>(ascii:radix:)(v17, v18, 10);
      v46 = v45;
      swift_bridgeObjectRelease();
      if ((v46 & 1) != 0)
        goto LABEL_6;
      goto LABEL_43;
    }
    if ((v18 & 0x2000000000000000) != 0)
    {
      v64[0] = *v8;
      v64[1] = v18 & 0xFFFFFFFFFFFFFFLL;
      if (v17 == 43)
      {
        if (!v19)
          goto LABEL_83;
        if (v19 == 1)
          goto LABEL_68;
        if ((BYTE1(v17) - 48) > 9u)
          goto LABEL_39;
        v25 = (BYTE1(v17) - 48);
        if (v19 != 2)
        {
          if ((BYTE2(v17) - 48) > 9u)
            goto LABEL_39;
          v25 = 10 * (BYTE1(v17) - 48) + (BYTE2(v17) - 48);
          v26 = v19 - 3;
          if (v19 != 3)
          {
            v27 = (unsigned __int8 *)v60;
            while (1)
            {
              v28 = *v27 - 48;
              if (v28 > 9)
                goto LABEL_39;
              v29 = 10 * v25;
              if ((unsigned __int128)(v25 * (__int128)10) >> 64 != (10 * v25) >> 63)
                goto LABEL_39;
              v25 = v29 + v28;
              if (__OFADD__(v29, v28))
                goto LABEL_39;
              LOBYTE(v19) = 0;
              ++v27;
              if (!--v26)
                goto LABEL_42;
            }
          }
        }
      }
      else
      {
        if (v17 == 45)
        {
          if (!v19)
          {
            __break(1u);
LABEL_83:
            __break(1u);
            goto LABEL_84;
          }
          if (v19 != 1)
          {
            if ((BYTE1(v17) - 48) > 9u)
              goto LABEL_39;
            if (v19 == 2)
            {
              LOBYTE(v19) = 0;
              v25 = -(uint64_t)(BYTE1(v17) - 48);
              goto LABEL_42;
            }
            if ((BYTE2(v17) - 48) > 9u)
              goto LABEL_39;
            v25 = -10 * (BYTE1(v17) - 48) - (BYTE2(v17) - 48);
            v41 = v19 - 3;
            if (v19 != 3)
            {
              v42 = (unsigned __int8 *)v60;
              while (1)
              {
                v43 = *v42 - 48;
                if (v43 > 9)
                  goto LABEL_39;
                v44 = 10 * v25;
                if ((unsigned __int128)(v25 * (__int128)10) >> 64 != (10 * v25) >> 63)
                  goto LABEL_39;
                v25 = v44 - v43;
                if (__OFSUB__(v44, v43))
                  goto LABEL_39;
                LOBYTE(v19) = 0;
                ++v42;
                if (!--v41)
                  goto LABEL_42;
              }
            }
            goto LABEL_41;
          }
LABEL_68:
          v25 = 0;
LABEL_42:
          if ((v19 & 1) != 0)
            goto LABEL_6;
          goto LABEL_43;
        }
        if (!v19 || (v17 - 48) > 9u)
        {
LABEL_39:
          v25 = 0;
          LOBYTE(v19) = 1;
          goto LABEL_42;
        }
        v25 = (v17 - 48);
        if (v19 != 1)
        {
          if ((BYTE1(v17) - 48) > 9u)
            goto LABEL_39;
          v25 = 10 * (v17 - 48) + (BYTE1(v17) - 48);
          v37 = v19 - 2;
          if (v19 != 2)
          {
            v38 = (unsigned __int8 *)v59;
            while (1)
            {
              v39 = *v38 - 48;
              if (v39 > 9)
                goto LABEL_39;
              v40 = 10 * v25;
              if ((unsigned __int128)(v25 * (__int128)10) >> 64 != (10 * v25) >> 63)
                goto LABEL_39;
              v25 = v40 + v39;
              if (__OFADD__(v40, v39))
                goto LABEL_39;
              LOBYTE(v19) = 0;
              ++v38;
              if (!--v37)
                goto LABEL_42;
            }
          }
        }
      }
LABEL_41:
      LOBYTE(v19) = 0;
      goto LABEL_42;
    }
    if ((v17 & 0x1000000000000000) != 0)
      v22 = (unsigned __int8 *)((v18 & 0xFFFFFFFFFFFFFFFLL) + 32);
    else
      v22 = (unsigned __int8 *)_StringObject.sharedUTF8.getter();
    v23 = specialized closure #1 in FixedWidthInteger.init<A>(_:radix:)(v22, v20, 10);
    if ((v24 & 1) != 0)
      goto LABEL_6;
    v25 = (uint64_t)v23;
LABEL_43:
    v30 = v5;
    v31 = entries._rawValue;
    v32 = v14;
    outlined destroy of AnnotatedCacheEntry((uint64_t)v8);
    v33 = v2;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
      v34 = v63;
    else
      v34 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v63[2] + 1, 1, v63);
    v36 = v34[2];
    v35 = v34[3];
    if (v36 >= v35 >> 1)
      v34 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v35 > 1), v36 + 1, 1, v34);
    v34[2] = v36 + 1;
    v63 = v34;
    v34[v36 + 4] = v25;
    v2 = v33;
    v14 = v32;
    entries._rawValue = v31;
    v5 = v30;
LABEL_7:
    ++v16;
  }
  while (v16 != v14);
  swift_bridgeObjectRelease();
  if (v63[2] == v14)
  {
    v47 = VectorDatabaseAccess.delete(identifiers:)();
    if (v2)
    {
      swift_bridgeObjectRelease();
      goto LABEL_73;
    }
    v53 = v47;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    v54 = Logger.logObject.getter();
    v55 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v54, v55))
    {
      v56 = swift_slowAlloc();
      *(_DWORD *)v56 = 134218240;
      v64[0] = v53;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v56 + 12) = 2048;
      v64[0] = v14;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2401E6000, v54, v55, "Deleted %ld entries successfully when %ld were originally requested", (uint8_t *)v56, 0x16u);
      MEMORY[0x24268046C](v56, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease();
    }
LABEL_78:
    v49 = Logger.logObject.getter();
    v57 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v49, v57))
    {
      v58 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v58 = 0;
      _os_log_impl(&dword_2401E6000, v49, v57, "VectorDatabaseAccess leaving delete...", v58, 2u);
      v52 = v58;
      goto LABEL_80;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type LLMCacheManagerError and conformance LLMCacheManagerError();
    swift_allocError();
    *v48 = 0;
    swift_willThrow();
LABEL_73:
    v49 = Logger.logObject.getter();
    v50 = static os_log_type_t.debug.getter();
    if (!os_log_type_enabled(v49, v50))
      goto LABEL_81;
    v51 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v51 = 0;
    _os_log_impl(&dword_2401E6000, v49, v50, "VectorDatabaseAccess leaving delete...", v51, 2u);
    v52 = v51;
LABEL_80:
    MEMORY[0x24268046C](v52, -1, -1);
  }
LABEL_81:

}

uint64_t VectorDatabaseAccess.delete(identifiers:)()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint8_t *v21;
  unint64_t v22;
  os_log_type_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t *v27;
  id v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint64_t v34;
  uint8_t *v35;
  uint64_t v36;
  os_log_type_t v37;
  uint64_t v38;
  uint64_t v39;
  uint8_t *v40;
  unint64_t *v41;
  uint64_t *v42;
  id v43;
  uint8_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unsigned int v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;

  v1 = type metadata accessor for VectorDatabaseError();
  v51 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1, v2);
  v4 = (unint64_t *)((char *)&v45 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = type metadata accessor for OSSignpostID();
  v52 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v6);
  v8 = (char *)&v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for log != -1)
    swift_once();
  v9 = (id)static Logger.log;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  v10 = dispatch thunk of VectorDatabaseClient.delete(identifiers:)();
  if (v0)
  {
    v55 = v0;
    v11 = v0;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    if (swift_dynamicCast())
    {
      v12 = v51;
      v13 = (*(uint64_t (**)(unint64_t *, uint64_t))(v51 + 88))(v4, v1);
      v14 = v13;
      if ((_DWORD)v13 == *MEMORY[0x24BEBFC30])
      {

        (*(void (**)(unint64_t *, uint64_t))(v12 + 96))(v4, v1);
        v15 = *v4;
        v16 = v4[1];
        v50 = v15;
        if (one-time initialization token for logger != -1)
          swift_once();
        v17 = type metadata accessor for Logger();
        __swift_project_value_buffer(v17, (uint64_t)static Logger.logger);
        swift_bridgeObjectRetain_n();
        v18 = Logger.logObject.getter();
        v19 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v18, v19))
        {
          v20 = swift_slowAlloc();
          v49 = v14;
          v21 = (uint8_t *)v20;
          v46 = swift_slowAlloc();
          v47 = v10;
          v54 = v46;
          v48 = v5;
          *(_DWORD *)v21 = 136315138;
          v45 = v21 + 4;
          swift_bridgeObjectRetain();
          v22 = v50;
          v53 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v50, v16, &v54);
          v5 = v48;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          v23 = v19;
          v24 = v22;
          _os_log_impl(&dword_2401E6000, v18, v23, "Failed to delete assets due to deletion failure, error detail: %s", v21, 0xCu);
          v25 = v46;
          swift_arrayDestroy();
          v26 = v25;
          v10 = v47;
          MEMORY[0x24268046C](v26, -1, -1);
          v27 = v21;
          v14 = v49;
          MEMORY[0x24268046C](v27, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n();
          v24 = v50;
        }
        lazy protocol witness table accessor for type Insecure.SHA1 and conformance Insecure.SHA1(&lazy protocol witness table cache variable for type VectorDatabaseError and conformance VectorDatabaseError, (uint64_t (*)(uint64_t))MEMORY[0x24BEBFC40], MEMORY[0x24BEBFC48]);
        swift_allocError();
        *v41 = v24;
        v41[1] = v16;
        (*(void (**)(unint64_t *, uint64_t, uint64_t))(v12 + 104))(v41, v14, v1);
        swift_willThrow();
      }
      else if ((_DWORD)v13 == *MEMORY[0x24BEBFC28])
      {

        (*(void (**)(unint64_t *, uint64_t))(v12 + 96))(v4, v1);
        v29 = *v4;
        v30 = v4[1];
        if (one-time initialization token for logger != -1)
          swift_once();
        v48 = v29;
        v31 = type metadata accessor for Logger();
        __swift_project_value_buffer(v31, (uint64_t)static Logger.logger);
        swift_bridgeObjectRetain_n();
        v32 = Logger.logObject.getter();
        v33 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v32, v33))
        {
          v34 = swift_slowAlloc();
          v50 = v30;
          v35 = (uint8_t *)v34;
          v47 = swift_slowAlloc();
          v54 = v47;
          v49 = v14;
          *(_DWORD *)v35 = 136315138;
          v46 = (uint64_t)(v35 + 4);
          swift_bridgeObjectRetain();
          v36 = v48;
          v53 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v48, v50, &v54);
          v14 = v49;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          v37 = v33;
          v38 = v36;
          _os_log_impl(&dword_2401E6000, v32, v37, "Failed to delete assets due to client failure, error detail: %s", v35, 0xCu);
          v39 = v47;
          swift_arrayDestroy();
          MEMORY[0x24268046C](v39, -1, -1);
          v40 = v35;
          v30 = v50;
          MEMORY[0x24268046C](v40, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n();
          v38 = v48;
        }
        lazy protocol witness table accessor for type Insecure.SHA1 and conformance Insecure.SHA1(&lazy protocol witness table cache variable for type VectorDatabaseError and conformance VectorDatabaseError, (uint64_t (*)(uint64_t))MEMORY[0x24BEBFC40], MEMORY[0x24BEBFC48]);
        swift_allocError();
        *v42 = v38;
        v42[1] = v30;
        (*(void (**)(uint64_t *, uint64_t, uint64_t))(v51 + 104))(v42, v14, v1);
        swift_willThrow();
      }
      else
      {
        (*(void (**)(unint64_t *, uint64_t))(v12 + 8))(v4, v1);
      }
    }

    v43 = (id)static Logger.log;
    static os_signpost_type_t.end.getter();
    os_signpost(_:dso:log:name:signpostID:)();

  }
  else
  {
    v28 = (id)static Logger.log;
    static os_signpost_type_t.end.getter();
    os_signpost(_:dso:log:name:signpostID:)();

  }
  (*(void (**)(char *, uint64_t))(v52 + 8))(v8, v5);
  return v10;
}

uint64_t VectorDatabaseAccess.describe(identifier:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned __int8 *v25;
  unsigned __int8 *v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  unsigned __int8 *v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  os_log_type_t v54;
  uint8_t *v55;
  uint64_t v56;
  uint64_t v57;
  _BYTE *v58;
  uint64_t v59;
  unsigned __int8 *v60;
  unsigned int v61;
  uint64_t v62;
  uint64_t v63;
  unsigned __int8 *v64;
  unsigned int v65;
  uint64_t v66;
  _BYTE *v67;
  uint64_t v68;
  id v69;
  char v71;
  char v72;
  uint64_t v73;
  NSObject *v74;
  os_log_type_t v75;
  uint8_t *v76;
  uint64_t v77;
  _BYTE *v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88[2];
  uint64_t v89;

  v82 = a3;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AnnotatedCacheEntry?);
  MEMORY[0x24BDAC7A8](v6, v7);
  v83 = (char *)&v80 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Asset?);
  MEMORY[0x24BDAC7A8](v9, v10);
  v12 = (char *)&v80 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v85 = type metadata accessor for Asset();
  v13 = *(_QWORD *)(v85 - 8);
  MEMORY[0x24BDAC7A8](v85, v14);
  v84 = (char *)&v80 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for OSSignpostID();
  v17 = *(_QWORD *)(v16 - 8);
  v86 = v16;
  v87 = v17;
  MEMORY[0x24BDAC7A8](v16, v18);
  v20 = (char *)&v80 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for log != -1)
    swift_once();
  v21 = (id)static Logger.log;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  v22 = HIBYTE(a2) & 0xF;
  v23 = a1 & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0)
    v24 = HIBYTE(a2) & 0xF;
  else
    v24 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v24)
    goto LABEL_76;
  if ((a2 & 0x1000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    v28 = (uint64_t)specialized _parseInteger<A, B>(ascii:radix:)(a1, a2, 10);
    v72 = v71;
    swift_bridgeObjectRelease();
    if ((v72 & 1) != 0)
      goto LABEL_76;
    goto LABEL_38;
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((a1 & 0x1000000000000000) != 0)
      v25 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
    else
      v25 = (unsigned __int8 *)_StringObject.sharedUTF8.getter();
    v26 = specialized closure #1 in FixedWidthInteger.init<A>(_:radix:)(v25, v23, 10);
    if ((v27 & 1) == 0)
    {
      v28 = (uint64_t)v26;
      goto LABEL_38;
    }
LABEL_76:
    if (one-time initialization token for logger != -1)
      swift_once();
    v73 = type metadata accessor for Logger();
    __swift_project_value_buffer(v73, (uint64_t)static Logger.logger);
    swift_bridgeObjectRetain_n();
    v74 = Logger.logObject.getter();
    v75 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v74, v75))
    {
      v76 = (uint8_t *)swift_slowAlloc();
      v77 = swift_slowAlloc();
      v88[0] = v77;
      *(_DWORD *)v76 = 136315138;
      swift_bridgeObjectRetain();
      v89 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, v88);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2401E6000, v74, v75, "Skip describing entry with invalid id %s", v76, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24268046C](v77, -1, -1);
      MEMORY[0x24268046C](v76, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v36 = v87;
    lazy protocol witness table accessor for type LLMCacheManagerError and conformance LLMCacheManagerError();
    swift_allocError();
    *v78 = 0;
    goto LABEL_82;
  }
  v88[0] = a1;
  v88[1] = a2 & 0xFFFFFFFFFFFFFFLL;
  if (a1 == 43)
  {
    if (!v22)
    {
LABEL_88:
      __break(1u);
      goto LABEL_89;
    }
    if (v22 == 1)
      goto LABEL_86;
    if ((BYTE1(a1) - 48) <= 9u)
    {
      v28 = (BYTE1(a1) - 48);
      if (v22 == 2)
        goto LABEL_36;
      if ((BYTE2(a1) - 48) <= 9u)
      {
        v28 = 10 * (BYTE1(a1) - 48) + (BYTE2(a1) - 48);
        v29 = v22 - 3;
        if (v22 != 3)
        {
          v30 = (unsigned __int8 *)v88 + 3;
          while (1)
          {
            v31 = *v30 - 48;
            if (v31 > 9)
              goto LABEL_34;
            v32 = 10 * v28;
            if ((unsigned __int128)(v28 * (__int128)10) >> 64 != (10 * v28) >> 63)
              goto LABEL_34;
            v28 = v32 + v31;
            if (__OFADD__(v32, v31))
              goto LABEL_34;
            LOBYTE(v22) = 0;
            ++v30;
            if (!--v29)
              goto LABEL_37;
          }
        }
        goto LABEL_36;
      }
    }
LABEL_34:
    v28 = 0;
    LOBYTE(v22) = 1;
    goto LABEL_37;
  }
  if (a1 != 45)
  {
    if (!v22 || (a1 - 48) > 9u)
      goto LABEL_34;
    v28 = (a1 - 48);
    if (v22 == 1)
    {
LABEL_36:
      LOBYTE(v22) = 0;
      goto LABEL_37;
    }
    if ((BYTE1(a1) - 48) <= 9u)
    {
      v28 = 10 * (a1 - 48) + (BYTE1(a1) - 48);
      v59 = v22 - 2;
      if (v22 != 2)
      {
        v60 = (unsigned __int8 *)v88 + 2;
        while (1)
        {
          v61 = *v60 - 48;
          if (v61 > 9)
            goto LABEL_34;
          v62 = 10 * v28;
          if ((unsigned __int128)(v28 * (__int128)10) >> 64 != (10 * v28) >> 63)
            goto LABEL_34;
          v28 = v62 + v61;
          if (__OFADD__(v62, v61))
            goto LABEL_34;
          LOBYTE(v22) = 0;
          ++v60;
          if (!--v59)
            goto LABEL_37;
        }
      }
      goto LABEL_36;
    }
    goto LABEL_34;
  }
  if (!v22)
  {
    __break(1u);
    goto LABEL_88;
  }
  if (v22 != 1)
  {
    if ((BYTE1(a1) - 48) > 9u)
      goto LABEL_34;
    if (v22 == 2)
    {
      LOBYTE(v22) = 0;
      v28 = -(uint64_t)(BYTE1(a1) - 48);
      goto LABEL_37;
    }
    if ((BYTE2(a1) - 48) > 9u)
      goto LABEL_34;
    v28 = -10 * (BYTE1(a1) - 48) - (BYTE2(a1) - 48);
    v63 = v22 - 3;
    if (v22 != 3)
    {
      v64 = (unsigned __int8 *)v88 + 3;
      while (1)
      {
        v65 = *v64 - 48;
        if (v65 > 9)
          goto LABEL_34;
        v66 = 10 * v28;
        if ((unsigned __int128)(v28 * (__int128)10) >> 64 != (10 * v28) >> 63)
          goto LABEL_34;
        v28 = v66 - v65;
        if (__OFSUB__(v66, v65))
          goto LABEL_34;
        LOBYTE(v22) = 0;
        ++v64;
        if (!--v63)
          goto LABEL_37;
      }
    }
    goto LABEL_36;
  }
LABEL_86:
  v28 = 0;
LABEL_37:
  if ((v22 & 1) != 0)
    goto LABEL_76;
LABEL_38:
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Int64>);
  v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_24020D390;
  *(_QWORD *)(v33 + 32) = v28;
  v34 = VectorDatabaseAccess.listAll(identifiers:pagination:)();
  if (v3)
  {
    swift_bridgeObjectRelease();
    v35 = v86;
    v36 = v87;
LABEL_84:
    v79 = (id)static Logger.log;
    static os_signpost_type_t.end.getter();
    os_signpost(_:dso:log:name:signpostID:)();

    return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v20, v35);
  }
  v37 = v34;
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v37 + 16))
  {
    v38 = v85;
    (*(void (**)(char *, unint64_t, uint64_t))(v13 + 16))(v12, v37 + ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80)), v85);
    v39 = 0;
  }
  else
  {
    v39 = 1;
    v38 = v85;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v12, v39, 1, v38);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v12, 1, v38) == 1)
  {
    outlined destroy of Date?((uint64_t)v12, &demangling cache variable for type metadata for Asset?);
    if (one-time initialization token for logger == -1)
    {
LABEL_45:
      v40 = type metadata accessor for Logger();
      __swift_project_value_buffer(v40, (uint64_t)static Logger.logger);
      swift_bridgeObjectRetain_n();
      v41 = Logger.logObject.getter();
      v42 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v41, v42))
      {
        v43 = (uint8_t *)swift_slowAlloc();
        v44 = swift_slowAlloc();
        v88[0] = v44;
        *(_DWORD *)v43 = 136315138;
        swift_bridgeObjectRetain();
        v89 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, v88);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_2401E6000, v41, v42, "Entry with id %s is not found", v43, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24268046C](v44, -1, -1);
        MEMORY[0x24268046C](v43, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      v36 = v87;
      lazy protocol witness table accessor for type LLMCacheManagerError and conformance LLMCacheManagerError();
      swift_allocError();
      *v58 = 2;
LABEL_82:
      swift_willThrow();
LABEL_83:
      v35 = v86;
      goto LABEL_84;
    }
LABEL_89:
    swift_once();
    goto LABEL_45;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v84, v12, v38);
  v45 = Asset.payload.getter();
  if (v46 >> 60 == 15)
  {
    v50 = type metadata accessor for AnnotatedCacheEntry(0);
    v51 = (uint64_t)v83;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 56))(v83, 1, 1, v50);
    outlined destroy of Date?(v51, &demangling cache variable for type metadata for AnnotatedCacheEntry?);
    if (one-time initialization token for logger != -1)
      swift_once();
    v52 = type metadata accessor for Logger();
    __swift_project_value_buffer(v52, (uint64_t)static Logger.logger);
    swift_bridgeObjectRetain_n();
    v53 = Logger.logObject.getter();
    v54 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v53, v54))
    {
      v55 = (uint8_t *)swift_slowAlloc();
      v56 = swift_slowAlloc();
      v88[0] = v56;
      *(_DWORD *)v55 = 136315138;
      v83 = (char *)(v55 + 4);
      swift_bridgeObjectRetain();
      v89 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, v88);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2401E6000, v53, v54, "Entry with id %s either does not have payload or payload fails to be decoded", v55, 0xCu);
      swift_arrayDestroy();
      v57 = v56;
      v38 = v85;
      MEMORY[0x24268046C](v57, -1, -1);
      MEMORY[0x24268046C](v55, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v36 = v87;
    lazy protocol witness table accessor for type LLMCacheManagerError and conformance LLMCacheManagerError();
    swift_allocError();
    *v67 = 1;
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v84, v38);
    goto LABEL_83;
  }
  v47 = v46;
  v81 = v13;
  v48 = v45;
  if (one-time initialization token for jsonDecoder != -1)
    swift_once();
  v49 = type metadata accessor for AnnotatedCacheEntry(0);
  lazy protocol witness table accessor for type Insecure.SHA1 and conformance Insecure.SHA1(&lazy protocol witness table cache variable for type AnnotatedCacheEntry and conformance AnnotatedCacheEntry, type metadata accessor for AnnotatedCacheEntry, (uint64_t)&protocol conformance descriptor for AnnotatedCacheEntry);
  dispatch thunk of JSONDecoder.decode<A>(_:from:)();
  outlined consume of Data._Representation?(v48, v47);
  v68 = (uint64_t)v83;
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v49 - 8) + 56))(v83, 0, 1, v49);
  (*(void (**)(char *, uint64_t))(v81 + 8))(v84, v38);
  outlined init with take of AnnotatedCacheEntry(v68, v82);
  v69 = (id)static Logger.log;
  static os_signpost_type_t.end.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  return (*(uint64_t (**)(char *, uint64_t))(v87 + 8))(v20, v86);
}

uint64_t Asset.toAnnotatedCachedEntry()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  v2 = Asset.payload.getter();
  if (v3 >> 60 == 15)
  {
    v4 = type metadata accessor for AnnotatedCacheEntry(0);
    v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56);
    v6 = a1;
    v7 = 1;
  }
  else
  {
    v8 = v2;
    v9 = v3;
    if (one-time initialization token for jsonDecoder != -1)
      swift_once();
    v10 = type metadata accessor for AnnotatedCacheEntry(0);
    lazy protocol witness table accessor for type Insecure.SHA1 and conformance Insecure.SHA1(&lazy protocol witness table cache variable for type AnnotatedCacheEntry and conformance AnnotatedCacheEntry, type metadata accessor for AnnotatedCacheEntry, (uint64_t)&protocol conformance descriptor for AnnotatedCacheEntry);
    dispatch thunk of JSONDecoder.decode<A>(_:from:)();
    outlined consume of Data._Representation?(v8, v9);
    v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
    v6 = a1;
    v7 = 0;
    v4 = v10;
  }
  return v5(v6, v7, 1, v4);
}

uint64_t VectorDatabaseAccess.insert(entries:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2[7] = a1;
  v2[8] = v1;
  v3 = type metadata accessor for Asset();
  v2[9] = v3;
  v2[10] = *(_QWORD *)(v3 - 8);
  v2[11] = swift_task_alloc();
  v2[12] = swift_task_alloc();
  v4 = type metadata accessor for ColumnType();
  v2[13] = v4;
  v2[14] = *(_QWORD *)(v4 - 8);
  v2[15] = swift_task_alloc();
  v5 = type metadata accessor for AnnotatedCacheEntry(0);
  v2[16] = v5;
  v2[17] = *(_QWORD *)(v5 - 8);
  v2[18] = swift_task_alloc();
  v2[19] = swift_task_alloc();
  return swift_task_switch();
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 224) = a1;
  *(_QWORD *)(v3 + 232) = v1;
  swift_task_dealloc();
  if (v1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t VectorDatabaseAccess.insert(entries:)()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  unsigned __int8 *v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t (*v26)(void);
  uint64_t v27;
  char v28;
  uint64_t v29;
  unsigned __int8 *v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  _BOOL4 v40;
  uint64_t *v41;
  uint8_t *v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _BYTE *v47;
  NSObject *v48;
  os_log_type_t v49;
  uint8_t *v50;
  uint64_t v51;
  unsigned __int8 *v52;
  unsigned int v53;
  uint64_t v54;
  uint64_t v55;
  unsigned __int8 *v56;
  unsigned int v57;
  uint64_t v58;
  char v59;
  uint64_t v60;

  if (one-time initialization token for logger != -1)
    swift_once();
  v1 = type metadata accessor for Logger();
  *(_QWORD *)(v0 + 160) = __swift_project_value_buffer(v1, (uint64_t)static Logger.logger);
  v2 = Logger.logObject.getter();
  v3 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2401E6000, v2, v3, "VectorDatabaseAccess entering insert...", v4, 2u);
    MEMORY[0x24268046C](v4, -1, -1);
  }
  v5 = *(_QWORD *)(v0 + 56);

  v6 = *(_QWORD *)(v5 + 16);
  *(_QWORD *)(v0 + 168) = v6;
  if (!v6)
  {
    v23 = Logger.logObject.getter();
    v24 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_2401E6000, v23, v24, "VectorDatabaseAccess leaving insert...", v25, 2u);
      MEMORY[0x24268046C](v25, -1, -1);
    }

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v26 = *(uint64_t (**)(void))(v0 + 8);
    return v26();
  }
  v7 = *(uint64_t **)(v0 + 152);
  v8 = *(_QWORD *)(v0 + 136);
  v9 = *(_QWORD *)(v0 + 56);
  v10 = *(_DWORD *)(v8 + 80);
  *(_DWORD *)(v0 + 244) = v10;
  v11 = *(_QWORD *)(v8 + 72);
  v12 = *MEMORY[0x24BEBFE48];
  *(_DWORD *)(v0 + 248) = *MEMORY[0x24BEBFE28];
  *(_DWORD *)(v0 + 252) = v12;
  v13 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v0 + 184) = 0;
  *(_QWORD *)(v0 + 192) = v13;
  *(_QWORD *)(v0 + 176) = v11;
  v14 = v9 + ((v10 + 32) & ~(unint64_t)v10);
  swift_bridgeObjectRetain();
  result = outlined init with copy of AnnotatedCacheEntry(v14, (uint64_t)v7);
  v16 = *v7;
  v17 = v7[1];
  v18 = HIBYTE(v17) & 0xF;
  v19 = *v7 & 0xFFFFFFFFFFFFLL;
  if ((v17 & 0x2000000000000000) != 0)
    v20 = HIBYTE(v17) & 0xF;
  else
    v20 = *v7 & 0xFFFFFFFFFFFFLL;
  if (!v20)
  {
LABEL_43:
    v36 = *(_QWORD *)(v0 + 152);
    v37 = *(_QWORD *)(v0 + 144);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    outlined init with copy of AnnotatedCacheEntry(v36, v37);
    v38 = Logger.logObject.getter();
    v39 = static os_log_type_t.error.getter();
    v40 = os_log_type_enabled(v38, v39);
    v41 = *(uint64_t **)(v0 + 144);
    if (v40)
    {
      v42 = (uint8_t *)swift_slowAlloc();
      v43 = swift_slowAlloc();
      v60 = v43;
      *(_DWORD *)v42 = 136315138;
      v45 = *v41;
      v44 = v41[1];
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 32) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v45, v44, &v60);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      outlined destroy of AnnotatedCacheEntry((uint64_t)v41);
      _os_log_impl(&dword_2401E6000, v38, v39, "Skip inserting entry with invalid id %s", v42, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24268046C](v43, -1, -1);
      MEMORY[0x24268046C](v42, -1, -1);
    }
    else
    {
      outlined destroy of AnnotatedCacheEntry(*(_QWORD *)(v0 + 144));
    }

    v46 = *(_QWORD *)(v0 + 152);
    lazy protocol witness table accessor for type LLMCacheManagerError and conformance LLMCacheManagerError();
    swift_allocError();
    *v47 = 0;
    swift_willThrow();
    outlined destroy of AnnotatedCacheEntry(v46);
    v48 = Logger.logObject.getter();
    v49 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v48, v49))
    {
      v50 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v50 = 0;
      _os_log_impl(&dword_2401E6000, v48, v49, "VectorDatabaseAccess leaving insert...", v50, 2u);
      MEMORY[0x24268046C](v50, -1, -1);
    }

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v26 = *(uint64_t (**)(void))(v0 + 8);
    return v26();
  }
  if ((v17 & 0x1000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    v27 = (uint64_t)specialized _parseInteger<A, B>(ascii:radix:)(v16, v17, 10);
    LOBYTE(v16) = v59;
    swift_bridgeObjectRelease();
LABEL_41:
    *(_QWORD *)(v0 + 200) = v27;
    if ((v16 & 1) == 0)
    {
      v33 = *(_QWORD *)(*(_QWORD *)(v0 + 152) + *(int *)(*(_QWORD *)(v0 + 128) + 36));
      *(_QWORD *)(v0 + 208) = v33;
      swift_bridgeObjectRetain();
      v34 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 216) = v34;
      *v34 = v0;
      v34[1] = VectorDatabaseAccess.insert(entries:);
      v35 = *(_QWORD *)(v0 + 64);
      v34[2] = v33;
      v34[3] = v35;
      return swift_task_switch();
    }
    goto LABEL_43;
  }
  v21 = (_BYTE *)(v0 + 240);
  if ((v17 & 0x2000000000000000) == 0)
  {
    if ((v16 & 0x1000000000000000) != 0)
      v22 = (unsigned __int8 *)((v17 & 0xFFFFFFFFFFFFFFFLL) + 32);
    else
      v22 = (unsigned __int8 *)_StringObject.sharedUTF8.getter();
    v27 = (uint64_t)specialized closure #1 in FixedWidthInteger.init<A>(_:radix:)(v22, v19, 10);
    LOBYTE(v16) = v28 & 1;
    goto LABEL_40;
  }
  *(_QWORD *)(v0 + 16) = v16;
  *(_QWORD *)(v0 + 24) = v17 & 0xFFFFFFFFFFFFFFLL;
  if (v16 == 43)
  {
    if (!v18)
      goto LABEL_71;
    if (v18 == 1 || (BYTE1(v16) - 48) > 9u)
      goto LABEL_39;
    v27 = (BYTE1(v16) - 48);
    if (v18 != 2)
    {
      if ((BYTE2(v16) - 48) > 9u)
        goto LABEL_39;
      v27 = 10 * (BYTE1(v16) - 48) + (BYTE2(v16) - 48);
      v29 = v18 - 3;
      if (v29)
      {
        v30 = (unsigned __int8 *)(v0 + 19);
        while (1)
        {
          v31 = *v30 - 48;
          if (v31 > 9)
            goto LABEL_39;
          v32 = 10 * v27;
          if ((unsigned __int128)(v27 * (__int128)10) >> 64 != (10 * v27) >> 63)
            goto LABEL_39;
          v27 = v32 + v31;
          if (__OFADD__(v32, v31))
            goto LABEL_39;
          LOBYTE(v16) = 0;
          ++v30;
          if (!--v29)
            goto LABEL_40;
        }
      }
    }
LABEL_61:
    LOBYTE(v16) = 0;
    *v21 = 0;
    goto LABEL_41;
  }
  if (v16 != 45)
  {
    if (!v18 || (v16 - 48) > 9u)
      goto LABEL_39;
    v27 = (v16 - 48);
    if (v18 != 1)
    {
      if ((BYTE1(v16) - 48) > 9u)
        goto LABEL_39;
      v27 = 10 * (v16 - 48) + (BYTE1(v16) - 48);
      v51 = v18 - 2;
      if (v51)
      {
        v52 = (unsigned __int8 *)(v0 + 18);
        while (1)
        {
          v53 = *v52 - 48;
          if (v53 > 9)
            goto LABEL_39;
          v54 = 10 * v27;
          if ((unsigned __int128)(v27 * (__int128)10) >> 64 != (10 * v27) >> 63)
            goto LABEL_39;
          v27 = v54 + v53;
          if (__OFADD__(v54, v53))
            goto LABEL_39;
          LOBYTE(v16) = 0;
          ++v52;
          if (!--v51)
            goto LABEL_40;
        }
      }
    }
    goto LABEL_61;
  }
  if (v18)
  {
    if (v18 != 1 && (BYTE1(v16) - 48) <= 9u)
    {
      if (v18 == 2)
      {
        LOBYTE(v16) = 0;
        v27 = -(uint64_t)(BYTE1(v16) - 48);
        *v21 = 0;
        goto LABEL_41;
      }
      if ((BYTE2(v16) - 48) <= 9u)
      {
        v27 = -10 * (BYTE1(v16) - 48) - (BYTE2(v16) - 48);
        v55 = v18 - 3;
        if (!v55)
          goto LABEL_61;
        v56 = (unsigned __int8 *)(v0 + 19);
        while (1)
        {
          v57 = *v56 - 48;
          if (v57 > 9)
            break;
          v58 = 10 * v27;
          if ((unsigned __int128)(v27 * (__int128)10) >> 64 != (10 * v27) >> 63)
            break;
          v27 = v58 - v57;
          if (__OFSUB__(v58, v57))
            break;
          LOBYTE(v16) = 0;
          ++v56;
          if (!--v55)
            goto LABEL_40;
        }
      }
    }
LABEL_39:
    v27 = 0;
    LOBYTE(v16) = 1;
LABEL_40:
    *v21 = v16;
    goto LABEL_41;
  }
  __break(1u);
LABEL_71:
  __break(1u);
  return result;
}

{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t (*v19)(void);
  uint64_t result;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _BYTE *v47;
  unsigned __int8 *v48;
  uint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  os_log_type_t v56;
  uint8_t *v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  unsigned __int8 *v61;
  unsigned int v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  NSObject *v69;
  os_log_type_t v70;
  _BOOL4 v71;
  uint64_t *v72;
  uint8_t *v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  _BYTE *v78;
  uint64_t v79;
  unsigned __int8 *v80;
  unsigned int v81;
  uint64_t v82;
  uint64_t v83;
  unsigned __int8 *v84;
  unsigned int v85;
  uint64_t v86;
  char v87;
  unsigned int v88;
  uint64_t v89;
  uint64_t v90;

  v1 = *(unsigned int *)(v0 + 248);
  v88 = *(_DWORD *)(v0 + 252);
  v2 = *(_QWORD **)(v0 + 120);
  v4 = *(_QWORD *)(v0 + 104);
  v3 = *(_QWORD *)(v0 + 112);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(VectorDatabaseAttribute, DatabaseValue)>);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (VectorDatabaseAttribute, DatabaseValue));
  v6 = *(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80);
  v7 = (v6 + 32) & ~v6;
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_24020D390;
  v9 = (uint64_t *)(v8 + v7 + *(int *)(v5 + 48));
  *v2 = 0;
  v2[1] = 0;
  (*(void (**)(_QWORD *, uint64_t, uint64_t))(v3 + 104))(v2, v1, v4);
  VectorDatabaseAttribute.init(name:columnType:)();
  *v9 = UserID.sharedUserId.getter();
  v9[1] = v10;
  v11 = type metadata accessor for DatabaseValue();
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v11 - 8) + 104))(v9, v88, v11);
  specialized Dictionary.init(dictionaryLiteral:)(v8);
  if (one-time initialization token for jsonEncoder != -1)
    swift_once();
  v12 = *(_QWORD *)(v0 + 232);
  lazy protocol witness table accessor for type Insecure.SHA1 and conformance Insecure.SHA1(&lazy protocol witness table cache variable for type AnnotatedCacheEntry and conformance AnnotatedCacheEntry, type metadata accessor for AnnotatedCacheEntry, (uint64_t)&protocol conformance descriptor for AnnotatedCacheEntry);
  v13 = dispatch thunk of JSONEncoder.encode<A>(_:)();
  if (v12)
  {
    v15 = *(_QWORD *)(v0 + 152);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    outlined destroy of AnnotatedCacheEntry(v15);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_5:
    v16 = Logger.logObject.getter();
    v17 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_2401E6000, v16, v17, "VectorDatabaseAccess leaving insert...", v18, 2u);
      MEMORY[0x24268046C](v18, -1, -1);
    }

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v19 = *(uint64_t (**)(void))(v0 + 8);
    return v19();
  }
  v21 = v13;
  v22 = v14;
  v24 = *(_QWORD *)(v0 + 88);
  v23 = *(_QWORD *)(v0 + 96);
  v26 = *(_QWORD *)(v0 + 72);
  v25 = *(_QWORD *)(v0 + 80);
  outlined copy of Data._Representation(v13, v14);
  Asset.init(identifier:vectors:attributes:payload:)();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16))(v24, v23, v26);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v28 = *(_QWORD *)(v0 + 192);
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    v28 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v28 + 16) + 1, 1, v28);
  v30 = *(_QWORD *)(v28 + 16);
  v29 = *(_QWORD *)(v28 + 24);
  if (v30 >= v29 >> 1)
    v28 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v29 > 1, v30 + 1, 1, v28);
  v89 = *(_QWORD *)(v0 + 168);
  v31 = *(_QWORD *)(v0 + 152);
  v32 = *(_QWORD *)(v0 + 88);
  v33 = *(_QWORD *)(v0 + 96);
  v35 = *(_QWORD *)(v0 + 72);
  v34 = *(_QWORD *)(v0 + 80);
  v36 = *(_QWORD *)(v0 + 184) + 1;
  *(_QWORD *)(v28 + 16) = v30 + 1;
  v37 = v28
      + ((*(unsigned __int8 *)(v34 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80))
      + *(_QWORD *)(v34 + 72) * v30;
  v38 = v28;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v34 + 32))(v37, v32, v35);
  outlined consume of Data._Representation(v21, v22);
  (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v33, v35);
  outlined destroy of AnnotatedCacheEntry(v31);
  if (v36 == v89)
  {
    swift_bridgeObjectRelease();
    v49 = VectorDatabaseAccess.insert(assets:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    v50 = Logger.logObject.getter();
    v51 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v50, v51))
    {
      v53 = *(_QWORD *)(v0 + 168);
      v54 = swift_slowAlloc();
      *(_DWORD *)v54 = 134218240;
      *(_QWORD *)(v0 + 40) = v49;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v54 + 12) = 2048;
      *(_QWORD *)(v0 + 48) = v53;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2401E6000, v50, v51, "Inserted %ld entries successfully when %ld were originally requested", (uint8_t *)v54, 0x16u);
      MEMORY[0x24268046C](v54, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    v55 = Logger.logObject.getter();
    v56 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v55, v56))
    {
      v57 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v57 = 0;
      _os_log_impl(&dword_2401E6000, v55, v56, "VectorDatabaseAccess leaving insert...", v57, 2u);
      MEMORY[0x24268046C](v57, -1, -1);
    }

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v19 = *(uint64_t (**)(void))(v0 + 8);
    return v19();
  }
  v39 = *(_QWORD *)(v0 + 176);
  v40 = *(_QWORD *)(v0 + 184) + 1;
  *(_QWORD *)(v0 + 184) = v40;
  *(_QWORD *)(v0 + 192) = v38;
  v41 = *(uint64_t **)(v0 + 152);
  result = outlined init with copy of AnnotatedCacheEntry(*(_QWORD *)(v0 + 56)+ ((*(unsigned __int8 *)(v0 + 244) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 244))+ v39 * v40, (uint64_t)v41);
  v42 = *v41;
  v43 = v41[1];
  v44 = HIBYTE(v43) & 0xF;
  v45 = *v41 & 0xFFFFFFFFFFFFLL;
  if ((v43 & 0x2000000000000000) != 0)
    v46 = HIBYTE(v43) & 0xF;
  else
    v46 = *v41 & 0xFFFFFFFFFFFFLL;
  if (!v46)
    goto LABEL_55;
  if ((v43 & 0x1000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    v58 = (uint64_t)specialized _parseInteger<A, B>(ascii:radix:)(v42, v43, 10);
    LOBYTE(v42) = v87;
    swift_bridgeObjectRelease();
LABEL_53:
    *(_QWORD *)(v0 + 200) = v58;
    if ((v42 & 1) == 0)
    {
      v64 = *(_QWORD *)(*(_QWORD *)(v0 + 152) + *(int *)(*(_QWORD *)(v0 + 128) + 36));
      *(_QWORD *)(v0 + 208) = v64;
      swift_bridgeObjectRetain();
      v65 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 216) = v65;
      *v65 = v0;
      v65[1] = VectorDatabaseAccess.insert(entries:);
      v66 = *(_QWORD *)(v0 + 64);
      v65[2] = v64;
      v65[3] = v66;
      return swift_task_switch();
    }
LABEL_55:
    v67 = *(_QWORD *)(v0 + 152);
    v68 = *(_QWORD *)(v0 + 144);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    outlined init with copy of AnnotatedCacheEntry(v67, v68);
    v69 = Logger.logObject.getter();
    v70 = static os_log_type_t.error.getter();
    v71 = os_log_type_enabled(v69, v70);
    v72 = *(uint64_t **)(v0 + 144);
    if (v71)
    {
      v73 = (uint8_t *)swift_slowAlloc();
      v74 = swift_slowAlloc();
      v90 = v74;
      *(_DWORD *)v73 = 136315138;
      v75 = *v72;
      v76 = v72[1];
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 32) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v75, v76, &v90);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      outlined destroy of AnnotatedCacheEntry((uint64_t)v72);
      _os_log_impl(&dword_2401E6000, v69, v70, "Skip inserting entry with invalid id %s", v73, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24268046C](v74, -1, -1);
      MEMORY[0x24268046C](v73, -1, -1);
    }
    else
    {
      outlined destroy of AnnotatedCacheEntry(*(_QWORD *)(v0 + 144));
    }

    v77 = *(_QWORD *)(v0 + 152);
    lazy protocol witness table accessor for type LLMCacheManagerError and conformance LLMCacheManagerError();
    swift_allocError();
    *v78 = 0;
    swift_willThrow();
    outlined destroy of AnnotatedCacheEntry(v77);
    goto LABEL_5;
  }
  v47 = (_BYTE *)(v0 + 240);
  if ((v43 & 0x2000000000000000) == 0)
  {
    if ((v42 & 0x1000000000000000) != 0)
      v48 = (unsigned __int8 *)((v43 & 0xFFFFFFFFFFFFFFFLL) + 32);
    else
      v48 = (unsigned __int8 *)_StringObject.sharedUTF8.getter();
    v58 = (uint64_t)specialized closure #1 in FixedWidthInteger.init<A>(_:radix:)(v48, v45, 10);
    LOBYTE(v42) = v59 & 1;
    goto LABEL_52;
  }
  *(_QWORD *)(v0 + 16) = v42;
  *(_QWORD *)(v0 + 24) = v43 & 0xFFFFFFFFFFFFFFLL;
  if (v42 == 43)
  {
    if (!v44)
      goto LABEL_80;
    if (v44 == 1 || (BYTE1(v42) - 48) > 9u)
      goto LABEL_51;
    v58 = (BYTE1(v42) - 48);
    if (v44 != 2)
    {
      if ((BYTE2(v42) - 48) > 9u)
        goto LABEL_51;
      v58 = 10 * (BYTE1(v42) - 48) + (BYTE2(v42) - 48);
      v60 = v44 - 3;
      if (v60)
      {
        v61 = (unsigned __int8 *)(v0 + 19);
        while (1)
        {
          v62 = *v61 - 48;
          if (v62 > 9)
            goto LABEL_51;
          v63 = 10 * v58;
          if ((unsigned __int128)(v58 * (__int128)10) >> 64 != (10 * v58) >> 63)
            goto LABEL_51;
          v58 = v63 + v62;
          if (__OFADD__(v63, v62))
            goto LABEL_51;
          LOBYTE(v42) = 0;
          ++v61;
          if (!--v60)
            goto LABEL_52;
        }
      }
    }
LABEL_70:
    LOBYTE(v42) = 0;
    *v47 = 0;
    goto LABEL_53;
  }
  if (v42 != 45)
  {
    if (!v44 || (v42 - 48) > 9u)
      goto LABEL_51;
    v58 = (v42 - 48);
    if (v44 != 1)
    {
      if ((BYTE1(v42) - 48) > 9u)
        goto LABEL_51;
      v58 = 10 * (v42 - 48) + (BYTE1(v42) - 48);
      v79 = v44 - 2;
      if (v79)
      {
        v80 = (unsigned __int8 *)(v0 + 18);
        while (1)
        {
          v81 = *v80 - 48;
          if (v81 > 9)
            goto LABEL_51;
          v82 = 10 * v58;
          if ((unsigned __int128)(v58 * (__int128)10) >> 64 != (10 * v58) >> 63)
            goto LABEL_51;
          v58 = v82 + v81;
          if (__OFADD__(v82, v81))
            goto LABEL_51;
          LOBYTE(v42) = 0;
          ++v80;
          if (!--v79)
            goto LABEL_52;
        }
      }
    }
    goto LABEL_70;
  }
  if (v44)
  {
    if (v44 != 1 && (BYTE1(v42) - 48) <= 9u)
    {
      if (v44 == 2)
      {
        LOBYTE(v42) = 0;
        v58 = -(uint64_t)(BYTE1(v42) - 48);
        *v47 = 0;
        goto LABEL_53;
      }
      if ((BYTE2(v42) - 48) <= 9u)
      {
        v58 = -10 * (BYTE1(v42) - 48) - (BYTE2(v42) - 48);
        v83 = v44 - 3;
        if (!v83)
          goto LABEL_70;
        v84 = (unsigned __int8 *)(v0 + 19);
        while (1)
        {
          v85 = *v84 - 48;
          if (v85 > 9)
            break;
          v86 = 10 * v58;
          if ((unsigned __int128)(v58 * (__int128)10) >> 64 != (10 * v58) >> 63)
            break;
          v58 = v86 - v85;
          if (__OFSUB__(v86, v85))
            break;
          LOBYTE(v42) = 0;
          ++v84;
          if (!--v83)
            goto LABEL_52;
        }
      }
    }
LABEL_51:
    v58 = 0;
    LOBYTE(v42) = 1;
LABEL_52:
    *v47 = v42;
    goto LABEL_53;
  }
  __break(1u);
LABEL_80:
  __break(1u);
  return result;
}

{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;

  outlined destroy of AnnotatedCacheEntry(*(_QWORD *)(v0 + 152));
  v1 = Logger.logObject.getter();
  v2 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2401E6000, v1, v2, "VectorDatabaseAccess leaving insert...", v3, 2u);
    MEMORY[0x24268046C](v3, -1, -1);
  }

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t result;
  char v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  _QWORD v25[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (VectorDatabaseAttribute, DatabaseValue));
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
  {
    v8 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<VectorDatabaseAttribute, DatabaseValue>);
  v7 = static _DictionaryStorage.allocate(capacity:)();
  v8 = (_QWORD *)v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (!v9)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v8;
  }
  v10 = &v6[*(int *)(v2 + 48)];
  v11 = v7 + 64;
  v12 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v25[1] = a1;
  v13 = a1 + v12;
  v14 = *(_QWORD *)(v3 + 72);
  swift_retain();
  while (1)
  {
    outlined init with copy of (VectorDatabaseAttribute, DatabaseValue)(v13, (uint64_t)v6);
    result = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v6);
    if ((v16 & 1) != 0)
      break;
    v17 = result;
    *(_QWORD *)(v11 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v18 = v8[6];
    v19 = type metadata accessor for VectorDatabaseAttribute();
    (*(void (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v18 + *(_QWORD *)(*(_QWORD *)(v19 - 8) + 72) * v17, v6, v19);
    v20 = v8[7];
    v21 = type metadata accessor for DatabaseValue();
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 32))(v20 + *(_QWORD *)(*(_QWORD *)(v21 - 8) + 72) * v17, v10, v21);
    v22 = v8[2];
    v23 = __OFADD__(v22, 1);
    v24 = v22 + 1;
    if (v23)
      goto LABEL_11;
    v8[2] = v24;
    v13 += v14;
    if (!--v9)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t VectorDatabaseAccess.searchKeyEmbeddings(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t VectorDatabaseAccess.searchKeyEmbeddings(_:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t, uint64_t);

  v1 = *(_QWORD **)(v0 + 16);
  v2 = v1[2];
  *(_QWORD *)(v0 + 32) = v2;
  if (!v2)
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(MEMORY[0x24BEE4AF8]);
  v3 = *(_QWORD **)(v0 + 24);
  v4 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v0 + 40) = 0;
  *(_QWORD *)(v0 + 48) = v4;
  v5 = v3 + 14;
  v6 = v1[5];
  *(_QWORD *)(v0 + 56) = v6;
  v7 = v1[4];
  v8 = v3[17];
  v9 = v3[18];
  swift_bridgeObjectRetain();
  __swift_project_boxed_opaque_existential_1(v5, v8);
  v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(v9 + 24) + *(_QWORD *)(v9 + 24));
  swift_bridgeObjectRetain();
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v10;
  *v10 = v0;
  v10[1] = VectorDatabaseAccess.searchKeyEmbeddings(_:);
  return v12(v7, v6, v8, v9);
}

{
  uint64_t v0;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t (*v19)(uint64_t, uint64_t, uint64_t, uint64_t);

  outlined copy of Data._Representation(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 80));
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v2 = *(_QWORD **)(v0 + 48);
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2[2] + 1, 1, *(_QWORD **)(v0 + 48));
  v4 = v2[2];
  v3 = v2[3];
  if (v4 >= v3 >> 1)
    v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v3 > 1), v4 + 1, 1, v2);
  v5 = *(_QWORD *)(v0 + 72);
  v6 = *(_QWORD *)(v0 + 80);
  v7 = *(_QWORD *)(v0 + 32);
  v8 = *(_QWORD *)(v0 + 40) + 1;
  v2[2] = v4 + 1;
  v9 = &v2[2 * v4];
  v9[4] = v5;
  v9[5] = v6;
  outlined consume of Data._Representation(v5, v6);
  if (v8 == v7)
  {
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(_QWORD *))(v0 + 8))(v2);
  }
  else
  {
    v11 = *(_QWORD *)(v0 + 40) + 1;
    *(_QWORD *)(v0 + 40) = v11;
    *(_QWORD *)(v0 + 48) = v2;
    v12 = *(_QWORD **)(v0 + 24);
    v13 = *(_QWORD *)(v0 + 16) + 16 * v11;
    v14 = *(_QWORD *)(v13 + 40);
    *(_QWORD *)(v0 + 56) = v14;
    v15 = *(_QWORD *)(v13 + 32);
    v16 = v12[17];
    v17 = v12[18];
    __swift_project_boxed_opaque_existential_1(v12 + 14, v16);
    v19 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(v17 + 24) + *(_QWORD *)(v17 + 24));
    swift_bridgeObjectRetain();
    v18 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 64) = v18;
    *v18 = v0;
    v18[1] = VectorDatabaseAccess.searchKeyEmbeddings(_:);
    return v19(v15, v14, v16, v17);
  }
}

uint64_t VectorDatabaseAccess.searchKeyEmbeddings(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;

  v4 = *v3;
  *(_QWORD *)(v4 + 72) = a1;
  *(_QWORD *)(v4 + 80) = a2;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (!v2)
    return swift_task_switch();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v4 + 8))();
}

uint64_t VectorDatabaseAccess.insert(assets:)()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint8_t *v21;
  unint64_t v22;
  os_log_type_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t *v27;
  id v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint64_t v34;
  uint8_t *v35;
  uint64_t v36;
  os_log_type_t v37;
  uint64_t v38;
  uint64_t v39;
  uint8_t *v40;
  unint64_t *v41;
  uint64_t *v42;
  id v43;
  uint8_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unsigned int v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;

  v1 = type metadata accessor for VectorDatabaseError();
  v51 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1, v2);
  v4 = (unint64_t *)((char *)&v45 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = type metadata accessor for OSSignpostID();
  v52 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v6);
  v8 = (char *)&v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for log != -1)
    swift_once();
  v9 = (id)static Logger.log;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  v10 = dispatch thunk of VectorDatabaseClient.insert(assets:)();
  if (v0)
  {
    v55 = v0;
    v11 = v0;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    if (swift_dynamicCast())
    {
      v12 = v51;
      v13 = (*(uint64_t (**)(unint64_t *, uint64_t))(v51 + 88))(v4, v1);
      v14 = v13;
      if ((_DWORD)v13 == *MEMORY[0x24BEBFC38])
      {

        (*(void (**)(unint64_t *, uint64_t))(v12 + 96))(v4, v1);
        v15 = *v4;
        v16 = v4[1];
        v50 = v15;
        if (one-time initialization token for logger != -1)
          swift_once();
        v17 = type metadata accessor for Logger();
        __swift_project_value_buffer(v17, (uint64_t)static Logger.logger);
        swift_bridgeObjectRetain_n();
        v18 = Logger.logObject.getter();
        v19 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v18, v19))
        {
          v20 = swift_slowAlloc();
          v49 = v14;
          v21 = (uint8_t *)v20;
          v46 = swift_slowAlloc();
          v47 = v10;
          v54 = v46;
          v48 = v5;
          *(_DWORD *)v21 = 136315138;
          v45 = v21 + 4;
          swift_bridgeObjectRetain();
          v22 = v50;
          v53 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v50, v16, &v54);
          v5 = v48;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          v23 = v19;
          v24 = v22;
          _os_log_impl(&dword_2401E6000, v18, v23, "Failed to insert assets due to insertion failure, error detail: %s", v21, 0xCu);
          v25 = v46;
          swift_arrayDestroy();
          v26 = v25;
          v10 = v47;
          MEMORY[0x24268046C](v26, -1, -1);
          v27 = v21;
          v14 = v49;
          MEMORY[0x24268046C](v27, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n();
          v24 = v50;
        }
        lazy protocol witness table accessor for type Insecure.SHA1 and conformance Insecure.SHA1(&lazy protocol witness table cache variable for type VectorDatabaseError and conformance VectorDatabaseError, (uint64_t (*)(uint64_t))MEMORY[0x24BEBFC40], MEMORY[0x24BEBFC48]);
        swift_allocError();
        *v41 = v24;
        v41[1] = v16;
        (*(void (**)(unint64_t *, uint64_t, uint64_t))(v12 + 104))(v41, v14, v1);
        swift_willThrow();
      }
      else if ((_DWORD)v13 == *MEMORY[0x24BEBFC28])
      {

        (*(void (**)(unint64_t *, uint64_t))(v12 + 96))(v4, v1);
        v29 = *v4;
        v30 = v4[1];
        if (one-time initialization token for logger != -1)
          swift_once();
        v48 = v29;
        v31 = type metadata accessor for Logger();
        __swift_project_value_buffer(v31, (uint64_t)static Logger.logger);
        swift_bridgeObjectRetain_n();
        v32 = Logger.logObject.getter();
        v33 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v32, v33))
        {
          v34 = swift_slowAlloc();
          v50 = v30;
          v35 = (uint8_t *)v34;
          v47 = swift_slowAlloc();
          v54 = v47;
          v49 = v14;
          *(_DWORD *)v35 = 136315138;
          v46 = (uint64_t)(v35 + 4);
          swift_bridgeObjectRetain();
          v36 = v48;
          v53 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v48, v50, &v54);
          v14 = v49;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          v37 = v33;
          v38 = v36;
          _os_log_impl(&dword_2401E6000, v32, v37, "Failed to insert assets due to client failure, error detail: %s", v35, 0xCu);
          v39 = v47;
          swift_arrayDestroy();
          MEMORY[0x24268046C](v39, -1, -1);
          v40 = v35;
          v30 = v50;
          MEMORY[0x24268046C](v40, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n();
          v38 = v48;
        }
        lazy protocol witness table accessor for type Insecure.SHA1 and conformance Insecure.SHA1(&lazy protocol witness table cache variable for type VectorDatabaseError and conformance VectorDatabaseError, (uint64_t (*)(uint64_t))MEMORY[0x24BEBFC40], MEMORY[0x24BEBFC48]);
        swift_allocError();
        *v42 = v38;
        v42[1] = v30;
        (*(void (**)(uint64_t *, uint64_t, uint64_t))(v51 + 104))(v42, v14, v1);
        swift_willThrow();
      }
      else
      {
        (*(void (**)(unint64_t *, uint64_t))(v12 + 8))(v4, v1);
      }
    }

    v43 = (id)static Logger.log;
    static os_signpost_type_t.end.getter();
    os_signpost(_:dso:log:name:signpostID:)();

  }
  else
  {
    v28 = (id)static Logger.log;
    static os_signpost_type_t.end.getter();
    os_signpost(_:dso:log:name:signpostID:)();

  }
  (*(void (**)(char *, uint64_t))(v52 + 8))(v8, v5);
  return v10;
}

uint64_t VectorDatabaseAccess.list(namespace:searchKey:)(_BYTE *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v4 + 128) = a3;
  *(_QWORD *)(v4 + 136) = v3;
  *(_QWORD *)(v4 + 120) = a2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AnnotatedCacheEntry?);
  *(_QWORD *)(v4 + 144) = swift_task_alloc();
  v6 = type metadata accessor for AnnotatedCacheEntry(0);
  *(_QWORD *)(v4 + 152) = v6;
  *(_QWORD *)(v4 + 160) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v4 + 168) = swift_task_alloc();
  *(_QWORD *)(v4 + 176) = swift_task_alloc();
  v7 = type metadata accessor for VectorDatabaseResult();
  *(_QWORD *)(v4 + 184) = v7;
  *(_QWORD *)(v4 + 192) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v4 + 200) = swift_task_alloc();
  *(_QWORD *)(v4 + 208) = swift_task_alloc();
  *(_BYTE *)(v4 + 256) = *a1;
  return swift_task_switch();
}

uint64_t VectorDatabaseAccess.list(namespace:searchKey:)()
{
  _QWORD *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t inited;
  _QWORD *v8;
  uint64_t v9;

  if (one-time initialization token for logger != -1)
    swift_once();
  v1 = type metadata accessor for Logger();
  v0[27] = __swift_project_value_buffer(v1, (uint64_t)static Logger.logger);
  v2 = Logger.logObject.getter();
  v3 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2401E6000, v2, v3, "VectorDatabaseAccess entering list...", v4, 2u);
    MEMORY[0x24268046C](v4, -1, -1);
  }
  v6 = v0[15];
  v5 = v0[16];

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  inited = swift_initStackObject();
  v0[28] = inited;
  *(_OWORD *)(inited + 16) = xmmword_24020D390;
  *(_QWORD *)(inited + 32) = v6;
  *(_QWORD *)(inited + 40) = v5;
  swift_bridgeObjectRetain();
  v8 = (_QWORD *)swift_task_alloc();
  v0[29] = v8;
  *v8 = v0;
  v8[1] = VectorDatabaseAccess.list(namespace:searchKey:);
  v9 = v0[17];
  v8[2] = inited;
  v8[3] = v9;
  return swift_task_switch();
}

{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void (*v17)(_QWORD, _QWORD, _QWORD);
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  _BOOL4 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t);
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _BYTE *v49;
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  _QWORD *v54;
  uint64_t v55;
  NSObject *v56;
  os_log_type_t v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  NSObject *v68;
  os_log_type_t v69;
  uint8_t *v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  unint64_t *v74;
  _QWORD *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void (*v80)(_QWORD, _QWORD, _QWORD);
  uint64_t v81[2];

  v1 = *(_QWORD **)(v0 + 240);
  if (!v1[2])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain_n();
    v6 = Logger.logObject.getter();
    v7 = static os_log_type_t.error.getter();
    v8 = os_log_type_enabled(v6, v7);
    v9 = *(_QWORD *)(v0 + 128);
    if (v8)
    {
      v11 = v0 + 120;
      v10 = *(_QWORD *)(v0 + 120);
      v12 = (uint8_t *)swift_slowAlloc();
      v13 = swift_slowAlloc();
      v81[0] = v13;
      *(_DWORD *)v12 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v11 - 8) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v10, v9, v81);
      v0 = v77;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2401E6000, v6, v7, "Failed to compute embedding for search key %s", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24268046C](v13, -1, -1);
      MEMORY[0x24268046C](v12, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    lazy protocol witness table accessor for type LLMCacheManagerError and conformance LLMCacheManagerError();
    swift_allocError();
    *v49 = 1;
    swift_willThrow();
    goto LABEL_29;
  }
  v2 = *(_QWORD *)(v0 + 248);
  v4 = v1[4];
  v3 = v1[5];
  outlined copy of Data._Representation(v4, v3);
  swift_bridgeObjectRelease();
  v5 = VectorDatabaseAccess.search(byVector:)();
  if (v2)
  {
    outlined consume of Data._Representation(v4, v3);
LABEL_29:
    v50 = Logger.logObject.getter();
    v51 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v50, v51))
    {
      v52 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v52 = 0;
      _os_log_impl(&dword_2401E6000, v50, v51, "VectorDatabaseAccess leaving list...", v52, 2u);
      MEMORY[0x24268046C](v52, -1, -1);
    }

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v74 = (unint64_t *)(v0 + 88);
  *(_QWORD *)(v0 + 88) = MEMORY[0x24BEE4AF8];
  v14 = *(_QWORD *)(v5 + 16);
  if (v14)
  {
    v71 = v4;
    v73 = v3;
    v15 = *(_QWORD *)(v0 + 192);
    v76 = *(_QWORD *)(v0 + 160);
    v16 = v5 + ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80));
    v78 = *(_QWORD *)(v15 + 72);
    v79 = v15;
    v17 = *(void (**)(_QWORD, _QWORD, _QWORD))(v15 + 16);
    v18 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v80 = v17;
    v17(*(_QWORD *)(v0 + 208), v16, *(_QWORD *)(v0 + 184));
    while (1)
    {
      v19 = VectorDatabaseResult.payload.getter();
      if (v20 >> 60 == 15)
      {
        v17(*(_QWORD *)(v0 + 200), *(_QWORD *)(v0 + 208), *(_QWORD *)(v0 + 184));
        v23 = Logger.logObject.getter();
        v24 = static os_log_type_t.error.getter();
        v25 = os_log_type_enabled(v23, v24);
        v26 = *(_QWORD *)(v0 + 200);
        v27 = *(_QWORD *)(v0 + 184);
        if (v25)
        {
          v28 = swift_slowAlloc();
          *(_DWORD *)v28 = 134217984;
          v29 = v16;
          v30 = v14;
          v31 = v18;
          v32 = VectorDatabaseResult.assetIdentifier.getter();
          v33 = *(void (**)(uint64_t, uint64_t))(v79 + 8);
          v33(v26, v27);
          *(_QWORD *)(v28 + 4) = v32;
          v18 = v31;
          v14 = v30;
          v16 = v29;
          v0 = v77;
          _os_log_impl(&dword_2401E6000, v23, v24, "Asset with id %lld either does not have payload or payload fails to be decoded", (uint8_t *)v28, 0xCu);
          MEMORY[0x24268046C](v28, -1, -1);
        }
        else
        {
          v33 = *(void (**)(uint64_t, uint64_t))(v79 + 8);
          v33(*(_QWORD *)(v0 + 200), *(_QWORD *)(v0 + 184));
        }

        v34 = VectorDatabaseResult.assetIdentifier.getter();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v18 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v18[2] + 1, 1, v18);
        v36 = v18[2];
        v35 = v18[3];
        if (v36 >= v35 >> 1)
          v18 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v35 > 1), v36 + 1, 1, v18);
        v18[2] = v36 + 1;
        v18[v36 + 4] = v34;
        v33(*(_QWORD *)(v0 + 208), *(_QWORD *)(v0 + 184));
      }
      else
      {
        v21 = v19;
        v22 = v20;
        if (one-time initialization token for jsonDecoder != -1)
          swift_once();
        lazy protocol witness table accessor for type Insecure.SHA1 and conformance Insecure.SHA1(&lazy protocol witness table cache variable for type AnnotatedCacheEntry and conformance AnnotatedCacheEntry, type metadata accessor for AnnotatedCacheEntry, (uint64_t)&protocol conformance descriptor for AnnotatedCacheEntry);
        dispatch thunk of JSONDecoder.decode<A>(_:from:)();
        v37 = *(_QWORD *)(v0 + 176);
        v75 = v18;
        v38 = *(_QWORD *)(v0 + 144);
        (*(void (**)(uint64_t, _QWORD, uint64_t, _QWORD))(v76 + 56))(v38, 0, 1, *(_QWORD *)(v0 + 152));
        outlined init with take of AnnotatedCacheEntry(v38, v37);
        v39 = AnnotatedCacheEntry.builder()();
        VectorDatabaseResult.value.getter();
        v41 = (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)v39 + 432))(v40, 0);
        v42 = swift_release();
        (*(void (**)(uint64_t))(*(_QWORD *)v41 + 440))(v42);
        swift_release();
        v43 = *v74;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          v43 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v43 + 16) + 1, 1, v43);
        v46 = *(_QWORD *)(v43 + 16);
        v45 = *(_QWORD *)(v43 + 24);
        if (v46 >= v45 >> 1)
          v43 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v45 > 1, v46 + 1, 1, v43);
        v47 = *(_QWORD *)(v0 + 168);
        v48 = *(_QWORD *)(v0 + 176);
        *(_QWORD *)(v43 + 16) = v46 + 1;
        outlined init with take of AnnotatedCacheEntry(v47, v43+ ((*(unsigned __int8 *)(v76 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v76 + 80))+ *(_QWORD *)(v76 + 72) * v46);
        outlined consume of Data._Representation?(v21, v22);
        *(_QWORD *)(v0 + 88) = v43;
        outlined destroy of AnnotatedCacheEntry(v48);
        v18 = v75;
        (*(void (**)(_QWORD, _QWORD))(v79 + 8))(*(_QWORD *)(v0 + 208), *(_QWORD *)(v0 + 184));
      }
      v16 += v78;
      --v14;
      v17 = v80;
      if (!v14)
        break;
      v80(*(_QWORD *)(v0 + 208), v16, *(_QWORD *)(v0 + 184));
    }
    swift_bridgeObjectRelease();
    v54 = v18;
    v4 = v71;
    v3 = v73;
    if (!v54[2])
      goto LABEL_36;
    goto LABEL_35;
  }
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(MEMORY[0x24BEE4AF8] + 16))
LABEL_35:
    VectorDatabaseAccess.delete(identifiers:)();
LABEL_36:
  swift_bridgeObjectRelease();
  v55 = *(_QWORD *)(v0 + 88);
  swift_bridgeObjectRetain();
  v56 = Logger.logObject.getter();
  v57 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v56, v57))
  {
    v72 = v4;
    v58 = *(unsigned __int8 *)(v0 + 256);
    v59 = swift_slowAlloc();
    v60 = swift_slowAlloc();
    v81[0] = v60;
    *(_DWORD *)v59 = 134218242;
    *(_QWORD *)(v0 + 96) = *(_QWORD *)(v55 + 16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v59 + 12) = 2080;
    v61 = 0xE400000000000000;
    v62 = 1819047270;
    if (v58 != 1)
    {
      v62 = 0xD000000000000012;
      v61 = 0x800000024020DCF0;
    }
    if (v58)
      v63 = v62;
    else
      v63 = 1953718630;
    if (v58)
      v64 = v61;
    else
      v64 = 0xE400000000000000;
    *(_QWORD *)(v0 + 104) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v63, v64, v81);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2401E6000, v56, v57, "Found %ld entries that match the requested search key and namespace %s", (uint8_t *)v59, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24268046C](v60, -1, -1);
    MEMORY[0x24268046C](v59, -1, -1);
    v65 = v72;
    v66 = v3;
  }
  else
  {
    swift_bridgeObjectRelease();
    v65 = v4;
    v66 = v3;
  }
  outlined consume of Data._Representation(v65, v66);

  swift_beginAccess();
  v67 = *(_QWORD *)(v77 + 88);
  v68 = Logger.logObject.getter();
  v69 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v68, v69))
  {
    v70 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v70 = 0;
    _os_log_impl(&dword_2401E6000, v68, v69, "VectorDatabaseAccess leaving list...", v70, 2u);
    MEMORY[0x24268046C](v70, -1, -1);
  }

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v77 + 8))(v67);
}

{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;

  swift_setDeallocating();
  swift_arrayDestroy();
  v1 = Logger.logObject.getter();
  v2 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2401E6000, v1, v2, "VectorDatabaseAccess leaving list...", v3, 2u);
    MEMORY[0x24268046C](v3, -1, -1);
  }

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t VectorDatabaseAccess.list(namespace:searchKey:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 240) = a1;
  *(_QWORD *)(v3 + 248) = v1;
  swift_task_dealloc();
  if (!v1)
  {
    swift_setDeallocating();
    swift_arrayDestroy();
  }
  return swift_task_switch();
}

uint64_t VectorDatabaseAccess.search(byVector:)()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint8_t *v23;
  uint8_t *v24;
  uint8_t *v25;
  id v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint64_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint8_t *v35;
  uint64_t *v36;
  uint64_t *v37;
  id v38;
  _QWORD v40[2];
  uint8_t *v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;

  v1 = type metadata accessor for VectorDatabaseError();
  v44 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1, v2);
  v4 = (_QWORD *)((char *)v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = type metadata accessor for OSSignpostID();
  v45 = *(_QWORD *)(v5 - 8);
  v46 = v5;
  MEMORY[0x24BDAC7A8](v5, v6);
  v8 = (char *)v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for log != -1)
    swift_once();
  v9 = (id)static Logger.log;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  v10 = dispatch thunk of VectorDatabaseClient.search(byVector:attributeFilters:limit:batchSize:numConcurrentReaders:)();
  if (v0)
  {
    v49 = v0;
    v11 = v0;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    if (swift_dynamicCast())
    {
      v12 = v44;
      v13 = (*(uint64_t (**)(uint64_t *, uint64_t))(v44 + 88))(v4, v1);
      v14 = v13;
      if ((_DWORD)v13 == *MEMORY[0x24BEBFC20])
      {

        (*(void (**)(uint64_t *, uint64_t))(v12 + 96))(v4, v1);
        v16 = *v4;
        v15 = v4[1];
        if (one-time initialization token for logger != -1)
          swift_once();
        v17 = type metadata accessor for Logger();
        __swift_project_value_buffer(v17, (uint64_t)static Logger.logger);
        swift_bridgeObjectRetain_n();
        v18 = Logger.logObject.getter();
        v19 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v18, v19))
        {
          v20 = swift_slowAlloc();
          LODWORD(v42) = v14;
          v21 = (uint8_t *)v20;
          v22 = swift_slowAlloc();
          v43 = v10;
          v41 = (uint8_t *)v22;
          v48 = v22;
          *(_DWORD *)v21 = 136315138;
          v40[1] = v21 + 4;
          swift_bridgeObjectRetain();
          v47 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v16, v15, &v48);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_2401E6000, v18, v19, "Failed to search assets due to search failure, error detail: %s", v21, 0xCu);
          v23 = v41;
          swift_arrayDestroy();
          v24 = v23;
          v10 = v43;
          MEMORY[0x24268046C](v24, -1, -1);
          v25 = v21;
          v14 = v42;
          MEMORY[0x24268046C](v25, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        lazy protocol witness table accessor for type Insecure.SHA1 and conformance Insecure.SHA1(&lazy protocol witness table cache variable for type VectorDatabaseError and conformance VectorDatabaseError, (uint64_t (*)(uint64_t))MEMORY[0x24BEBFC40], MEMORY[0x24BEBFC48]);
        swift_allocError();
        *v36 = v16;
        v36[1] = v15;
        (*(void (**)(uint64_t *, uint64_t, uint64_t))(v12 + 104))(v36, v14, v1);
        swift_willThrow();
      }
      else if ((_DWORD)v13 == *MEMORY[0x24BEBFC28])
      {

        (*(void (**)(uint64_t *, uint64_t))(v12 + 96))(v4, v1);
        v28 = *v4;
        v27 = v4[1];
        if (one-time initialization token for logger != -1)
          swift_once();
        v29 = type metadata accessor for Logger();
        __swift_project_value_buffer(v29, (uint64_t)static Logger.logger);
        swift_bridgeObjectRetain_n();
        v30 = Logger.logObject.getter();
        v31 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v30, v31))
        {
          v32 = swift_slowAlloc();
          v43 = v27;
          v33 = (uint8_t *)v32;
          v42 = swift_slowAlloc();
          v48 = v42;
          *(_DWORD *)v33 = 136315138;
          v41 = v33 + 4;
          swift_bridgeObjectRetain();
          v47 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v28, v43, &v48);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_2401E6000, v30, v31, "Failed to search assets due to client failure, error detail: %s", v33, 0xCu);
          v34 = v42;
          swift_arrayDestroy();
          MEMORY[0x24268046C](v34, -1, -1);
          v35 = v33;
          v27 = v43;
          MEMORY[0x24268046C](v35, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        lazy protocol witness table accessor for type Insecure.SHA1 and conformance Insecure.SHA1(&lazy protocol witness table cache variable for type VectorDatabaseError and conformance VectorDatabaseError, (uint64_t (*)(uint64_t))MEMORY[0x24BEBFC40], MEMORY[0x24BEBFC48]);
        swift_allocError();
        *v37 = v28;
        v37[1] = v27;
        (*(void (**)(uint64_t *, uint64_t, uint64_t))(v44 + 104))(v37, v14, v1);
        swift_willThrow();
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t))(v12 + 8))(v4, v1);
      }
    }

    v38 = (id)static Logger.log;
    static os_signpost_type_t.end.getter();
    os_signpost(_:dso:log:name:signpostID:)();

  }
  else
  {
    v26 = (id)static Logger.log;
    static os_signpost_type_t.end.getter();
    os_signpost(_:dso:log:name:signpostID:)();

  }
  (*(void (**)(char *, uint64_t))(v45 + 8))(v8, v46);
  return v10;
}

uint8_t *VectorDatabaseAccess.listAll(namespace:nextToken:)(unsigned __int8 *a1, uint64_t a2, uint8_t *a3)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  __int128 v31;
  NSObject *v32;
  os_log_type_t v33;
  uint64_t v34;
  unint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  void *v43;
  char *v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(char *, uint64_t);
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  void *v60;
  uint8_t *v61;
  NSObject *v62;
  os_log_type_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  uint64_t v68;
  unint64_t v69;
  os_log_type_t v70;
  uint8_t *v71;
  _QWORD v73[2];
  int v74;
  uint64_t v75;
  __int128 v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  char *v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  _QWORD *v89;
  void (*v90)(char *, unint64_t, uint64_t);
  uint64_t v91;
  uint64_t v92[4];
  uint8_t *v93;

  v5 = v3;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AnnotatedCacheEntry?);
  MEMORY[0x24BDAC7A8](v8, v9);
  v11 = (char *)v73 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for AnnotatedCacheEntry(0);
  v13 = *(_QWORD *)(v12 - 8);
  v86 = v12;
  v87 = v13;
  v15 = MEMORY[0x24BDAC7A8](v12, v14);
  v78 = (uint64_t)v73 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15, v17);
  v77 = (uint64_t)v73 - v18;
  v19 = type metadata accessor for Asset();
  v84 = *(_QWORD *)(v19 - 8);
  v85 = v19;
  v21 = MEMORY[0x24BDAC7A8](v19, v20);
  v80 = (char *)v73 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21, v23);
  v79 = (char *)v73 - v24;
  v25 = *a1;
  if (one-time initialization token for logger != -1)
    swift_once();
  v26 = type metadata accessor for Logger();
  v83 = __swift_project_value_buffer(v26, (uint64_t)static Logger.logger);
  v27 = Logger.logObject.getter();
  v28 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v27, v28))
  {
    v29 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v29 = 0;
    _os_log_impl(&dword_2401E6000, v27, v28, "VectorDatabaseAccess entering listAll...", v29, 2u);
    MEMORY[0x24268046C](v29, -1, -1);
  }

  v30 = VectorDatabaseAccess.listAll(identifiers:pagination:)();
  v88 = v4;
  if (v4)
  {
LABEL_6:
    v32 = Logger.logObject.getter();
    v33 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v32, v33))
    {
      a3 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)a3 = 0;
      _os_log_impl(&dword_2401E6000, v32, v33, "VectorDatabaseAccess leaving listAll...", a3, 2u);
      MEMORY[0x24268046C](a3, -1, -1);
    }
    goto LABEL_50;
  }
  v75 = v5;
  v74 = v25;
  v93 = (uint8_t *)MEMORY[0x24BEE4AF8];
  v34 = *(_QWORD *)(v30 + 16);
  if (!v34)
  {
    swift_bridgeObjectRelease();
    v36 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_34;
  }
  v35 = (*(unsigned __int8 *)(v84 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v84 + 80);
  v73[1] = v30;
  a3 = (uint8_t *)(v30 + v35);
  v81 = *(_QWORD *)(v84 + 72);
  v90 = *(void (**)(char *, unint64_t, uint64_t))(v84 + 16);
  v36 = (_QWORD *)MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v31 = 134217984;
  v76 = v31;
  v82 = v11;
  v37 = v86;
  v38 = v79;
  v90(v79, v30 + v35, v85);
  while (1)
  {
    v39 = Asset.payload.getter();
    if (v40 >> 60 == 15)
    {
      v89 = v36;
LABEL_20:
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v87 + 56))(v11, 1, 1, v37);
      outlined destroy of Date?((uint64_t)v11, &demangling cache variable for type metadata for AnnotatedCacheEntry?);
      v44 = v80;
      v45 = v85;
      v90(v80, (unint64_t)v38, v85);
      v46 = Logger.logObject.getter();
      v47 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v46, v47))
      {
        v48 = v44;
        v49 = swift_slowAlloc();
        *(_DWORD *)v49 = v76;
        v50 = Asset.identifier.getter();
        v51 = *(void (**)(char *, uint64_t))(v84 + 8);
        v51(v48, v45);
        *(_QWORD *)(v49 + 4) = v50;
        v38 = v79;
        _os_log_impl(&dword_2401E6000, v46, v47, "Asset with id %lld either does not have payload or payload fails to be decoded", (uint8_t *)v49, 0xCu);
        MEMORY[0x24268046C](v49, -1, -1);
      }
      else
      {
        v51 = *(void (**)(char *, uint64_t))(v84 + 8);
        v51(v44, v45);
      }
      v52 = v45;

      v53 = Asset.identifier.getter();
      v36 = v89;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v36 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v36[2] + 1, 1, v36);
      v55 = v36[2];
      v54 = v36[3];
      if (v55 >= v54 >> 1)
        v36 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v54 > 1), v55 + 1, 1, v36);
      v36[2] = v55 + 1;
      v36[v55 + 4] = v53;
      v51(v38, v52);
      goto LABEL_12;
    }
    v41 = v39;
    v42 = v40;
    if (one-time initialization token for jsonDecoder != -1)
      swift_once();
    lazy protocol witness table accessor for type Insecure.SHA1 and conformance Insecure.SHA1(&lazy protocol witness table cache variable for type AnnotatedCacheEntry and conformance AnnotatedCacheEntry, type metadata accessor for AnnotatedCacheEntry, (uint64_t)&protocol conformance descriptor for AnnotatedCacheEntry);
    v43 = v88;
    dispatch thunk of JSONDecoder.decode<A>(_:from:)();
    if (v43)
    {
      v89 = v36;

      outlined consume of Data._Representation?(v41, v42);
      v88 = 0;
      goto LABEL_20;
    }
    v88 = 0;
    outlined consume of Data._Representation?(v41, v42);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v87 + 56))(v11, 0, 1, v37);
    v56 = v77;
    outlined init with take of AnnotatedCacheEntry((uint64_t)v11, v77);
    outlined init with copy of AnnotatedCacheEntry(v56, v78);
    v57 = (unint64_t)v93;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v57 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v57 + 16) + 1, 1, v57);
    v52 = v85;
    v59 = *(_QWORD *)(v57 + 16);
    v58 = *(_QWORD *)(v57 + 24);
    if (v59 >= v58 >> 1)
      v57 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v58 > 1, v59 + 1, 1, v57);
    *(_QWORD *)(v57 + 16) = v59 + 1;
    outlined init with take of AnnotatedCacheEntry(v78, v57+ ((*(unsigned __int8 *)(v87 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v87 + 80))+ *(_QWORD *)(v87 + 72) * v59);
    v93 = (uint8_t *)v57;
    outlined destroy of AnnotatedCacheEntry(v77);
    (*(void (**)(char *, uint64_t))(v84 + 8))(v38, v52);
LABEL_12:
    v11 = v82;
    a3 += v81;
    --v34;
    v37 = v86;
    if (!v34)
      break;
    v90(v38, (unint64_t)a3, v52);
  }
  swift_bridgeObjectRelease();
LABEL_34:
  if (v36[2])
  {
    v60 = v88;
    VectorDatabaseAccess.delete(identifiers:)();
    v88 = v60;
    if (v60)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
  swift_bridgeObjectRelease();
  v61 = v93;
  swift_bridgeObjectRetain();
  v62 = Logger.logObject.getter();
  v63 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v62, v63))
  {
    v64 = swift_slowAlloc();
    v65 = swift_slowAlloc();
    *(_DWORD *)v64 = 134218242;
    v91 = *((_QWORD *)v61 + 2);
    v92[0] = v65;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v64 + 12) = 2080;
    v66 = 0xE400000000000000;
    v67 = 1819047270;
    if (v74 != 1)
    {
      v67 = 0xD000000000000012;
      v66 = 0x800000024020DCF0;
    }
    if (v74)
      v68 = v67;
    else
      v68 = 1953718630;
    if (v74)
      v69 = v66;
    else
      v69 = 0xE400000000000000;
    v91 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v68, v69, v92);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2401E6000, v62, v63, "Found %ld entries that match the requested namespace %s", (uint8_t *)v64, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24268046C](v65, -1, -1);
    MEMORY[0x24268046C](v64, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease();
  }
  swift_beginAccess();
  a3 = v93;
  v32 = Logger.logObject.getter();
  v70 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v32, v70))
  {
    v71 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v71 = 0;
    _os_log_impl(&dword_2401E6000, v32, v70, "VectorDatabaseAccess leaving listAll...", v71, 2u);
    MEMORY[0x24268046C](v71, -1, -1);
  }
LABEL_50:

  return a3;
}

uint64_t VectorDatabaseAccess.listAll(identifiers:pagination:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  id v8;
  void *v9;
  uint64_t v10;
  _BYTE *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t *v26;
  id v27;
  uint64_t *v28;
  id v29;
  _BYTE v31[4];
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;

  v0 = type metadata accessor for VectorDatabaseError();
  v33 = *(_QWORD *)(v0 - 8);
  v34 = v0;
  MEMORY[0x24BDAC7A8](v0, v1);
  v3 = (uint64_t *)&v31[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = type metadata accessor for OSSignpostID();
  v36 = *(_QWORD *)(v4 - 8);
  v37 = v4;
  MEMORY[0x24BDAC7A8](v4, v5);
  v7 = &v31[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (one-time initialization token for log != -1)
    swift_once();
  v8 = (id)static Logger.log;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  v9 = v35;
  v10 = dispatch thunk of VectorDatabaseClient.getAssets(identifiers:attributeFilters:pagination:)();
  if (v9)
  {
    v11 = v7;
    v40 = v9;
    v12 = v9;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    v13 = v34;
    if (swift_dynamicCast())
    {
      v14 = v33;
      v15 = (*(uint64_t (**)(uint64_t *, uint64_t))(v33 + 88))(v3, v13);
      if ((_DWORD)v15 == *MEMORY[0x24BEBFC28])
      {
        v16 = v15;

        (*(void (**)(uint64_t *, uint64_t))(v14 + 96))(v3, v13);
        v17 = *v3;
        v18 = v3[1];
        if (one-time initialization token for logger != -1)
          swift_once();
        v19 = type metadata accessor for Logger();
        __swift_project_value_buffer(v19, (uint64_t)static Logger.logger);
        swift_bridgeObjectRetain_n();
        v20 = Logger.logObject.getter();
        v21 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v20, v21))
        {
          v32 = v16;
          v22 = swift_slowAlloc();
          v35 = (void *)v17;
          v23 = (uint8_t *)v22;
          v24 = swift_slowAlloc();
          v39 = v24;
          *(_DWORD *)v23 = 136315138;
          swift_bridgeObjectRetain();
          v38 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)((uint64_t)v35, v18, &v39);
          v16 = v32;
          v13 = v34;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_2401E6000, v20, v21, "Failed to get all assets, error detail: %s", v23, 0xCu);
          swift_arrayDestroy();
          v25 = v24;
          v14 = v33;
          MEMORY[0x24268046C](v25, -1, -1);
          v26 = v23;
          v17 = (uint64_t)v35;
          MEMORY[0x24268046C](v26, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        lazy protocol witness table accessor for type Insecure.SHA1 and conformance Insecure.SHA1(&lazy protocol witness table cache variable for type VectorDatabaseError and conformance VectorDatabaseError, (uint64_t (*)(uint64_t))MEMORY[0x24BEBFC40], MEMORY[0x24BEBFC48]);
        swift_allocError();
        *v28 = v17;
        v28[1] = v18;
        (*(void (**)(uint64_t *, uint64_t, uint64_t))(v14 + 104))(v28, v16, v13);
        swift_willThrow();
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t))(v14 + 8))(v3, v13);
      }
    }

    v29 = (id)static Logger.log;
    static os_signpost_type_t.end.getter();
    os_signpost(_:dso:log:name:signpostID:)();

    (*(void (**)(_BYTE *, uint64_t))(v36 + 8))(v11, v37);
  }
  else
  {
    v27 = (id)static Logger.log;
    static os_signpost_type_t.end.getter();
    os_signpost(_:dso:log:name:signpostID:)();

    (*(void (**)(_BYTE *, uint64_t))(v36 + 8))(v7, v37);
  }
  return v10;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> VectorDatabaseAccess.deleteAll(namespace:)(LLMCache::CacheNamespace a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint8_t *v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint8_t *v25;
  uint64_t *v26;
  os_log_type_t v27;
  uint8_t *v28;
  _QWORD v29[2];
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;

  v2 = type metadata accessor for VectorDatabaseError();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (_QWORD *)((char *)v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (one-time initialization token for logger != -1)
    swift_once();
  v7 = type metadata accessor for Logger();
  __swift_project_value_buffer(v7, (uint64_t)static Logger.logger);
  v8 = Logger.logObject.getter();
  v9 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_2401E6000, v8, v9, "VectorDatabaseAccess entering deleteAll...", v10, 2u);
    MEMORY[0x24268046C](v10, -1, -1);
  }

  dispatch thunk of VectorDatabaseClient.deleteAll()();
  if (v1)
  {
    v34 = v1;
    v11 = v1;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    if (swift_dynamicCast())
    {
      v12 = (*(uint64_t (**)(uint64_t *, uint64_t))(v3 + 88))(v6, v2);
      if ((_DWORD)v12 == *MEMORY[0x24BEBFC28])
      {
        v13 = v12;

        (*(void (**)(uint64_t *, uint64_t))(v3 + 96))(v6, v2);
        v15 = *v6;
        v14 = v6[1];
        swift_bridgeObjectRetain_n();
        v16 = Logger.logObject.getter();
        v17 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v16, v17))
        {
          v18 = swift_slowAlloc();
          v31 = v15;
          v19 = (uint8_t *)v18;
          v30 = swift_slowAlloc();
          v33 = v30;
          *(_DWORD *)v19 = 136315138;
          v29[1] = v19 + 4;
          swift_bridgeObjectRetain();
          v32 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v31, v14, &v33);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_2401E6000, v16, v17, "Failed to delete all assets, error detail: %s", v19, 0xCu);
          v20 = v30;
          swift_arrayDestroy();
          MEMORY[0x24268046C](v20, -1, -1);
          v21 = v19;
          v15 = v31;
          MEMORY[0x24268046C](v21, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        lazy protocol witness table accessor for type Insecure.SHA1 and conformance Insecure.SHA1(&lazy protocol witness table cache variable for type VectorDatabaseError and conformance VectorDatabaseError, (uint64_t (*)(uint64_t))MEMORY[0x24BEBFC40], MEMORY[0x24BEBFC48]);
        swift_allocError();
        *v26 = v15;
        v26[1] = v14;
        (*(void (**)(uint64_t *, uint64_t, uint64_t))(v3 + 104))(v26, v13, v2);
        swift_willThrow();
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t))(v3 + 8))(v6, v2);
      }
    }

    v22 = Logger.logObject.getter();
    v27 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v22, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v28 = 0;
      _os_log_impl(&dword_2401E6000, v22, v27, "VectorDatabaseAccess leaving deleteAll...", v28, 2u);
      v25 = v28;
      goto LABEL_17;
    }
  }
  else
  {
    v22 = Logger.logObject.getter();
    v23 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_2401E6000, v22, v23, "VectorDatabaseAccess leaving deleteAll...", v24, 2u);
      v25 = v24;
LABEL_17:
      MEMORY[0x24268046C](v25, -1, -1);
    }
  }

}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> VectorDatabaseAccess.warmup()()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;

  v1 = v0;
  v2 = type metadata accessor for OSSignpostID();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for log != -1)
    swift_once();
  v7 = (id)static Logger.log;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  dispatch thunk of VectorDatabaseClient.warmup(numConcurrentReaders:)();
  v8 = v1 + 14;
  v10 = v1[17];
  v9 = v1[18];
  __swift_project_boxed_opaque_existential_1(v8, v10);
  (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v10, v9);
  v11 = (id)static Logger.log;
  static os_signpost_type_t.end.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

uint64_t VectorDatabaseAccess.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t protocol witness for CacheDatabase.delete(entries:) in conformance VectorDatabaseAccess(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v3;
  return swift_task_switch();
}

uint64_t protocol witness for CacheDatabase.delete(entries:) in conformance VectorDatabaseAccess()
{
  uint64_t v0;

  VectorDatabaseAccess.delete(entries:)(*(Swift::OpaquePointer *)(v0 + 16));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t protocol witness for CacheDatabase.describe(identifier:) in conformance VectorDatabaseAccess(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  _QWORD *v4;
  uint64_t v5;

  v4[2] = a1;
  v4[3] = a2;
  v5 = *v3;
  v4[4] = a3;
  v4[5] = v5;
  return swift_task_switch();
}

uint64_t protocol witness for CacheDatabase.describe(identifier:) in conformance VectorDatabaseAccess()
{
  uint64_t v0;

  VectorDatabaseAccess.describe(identifier:)(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 16));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t protocol witness for CacheDatabase.insert(entries:) in conformance VectorDatabaseAccess(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = dispatch thunk of CacheDatabase.delete(entries:);
  return VectorDatabaseAccess.insert(entries:)(a1);
}

uint64_t protocol witness for CacheDatabase.list(namespace:searchKey:) in conformance VectorDatabaseAccess(_BYTE *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = protocol witness for CacheDatabase.list(namespace:searchKey:) in conformance VectorDatabaseAccess;
  return VectorDatabaseAccess.list(namespace:searchKey:)(a1, a2, a3);
}

uint64_t protocol witness for CacheDatabase.listAll(namespace:nextToken:) in conformance VectorDatabaseAccess(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  _QWORD *v4;
  uint64_t v5;

  v4[2] = a1;
  v4[3] = a2;
  v5 = *v3;
  v4[4] = a3;
  v4[5] = v5;
  return swift_task_switch();
}

uint64_t protocol witness for CacheDatabase.listAll(namespace:nextToken:) in conformance VectorDatabaseAccess()
{
  uint64_t v0;
  uint8_t *v1;

  v1 = VectorDatabaseAccess.listAll(namespace:nextToken:)(*(unsigned __int8 **)(v0 + 16), *(_QWORD *)(v0 + 24), *(uint8_t **)(v0 + 32));
  return (*(uint64_t (**)(uint8_t *))(v0 + 8))(v1);
}

uint64_t protocol witness for CacheDatabase.deleteAll(namespace:) in conformance VectorDatabaseAccess(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v3;
  return swift_task_switch();
}

uint64_t protocol witness for CacheDatabase.deleteAll(namespace:) in conformance VectorDatabaseAccess(LLMCache::CacheNamespace a1)
{
  uint64_t v1;

  VectorDatabaseAccess.deleteAll(namespace:)(a1);
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t protocol witness for CacheDatabase.warmup() in conformance VectorDatabaseAccess()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = *v0;
  return swift_task_switch();
}

{
  uint64_t v0;

  VectorDatabaseAccess.warmup()();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

_QWORD *specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
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
    v5 = MEMORY[0x24267FE18](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

unsigned __int8 *specialized _parseInteger<A, B>(ascii:radix:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned __int8 *v11;
  uint64_t v13;
  uint64_t v14;

  v13 = a1;
  v14 = a2;
  swift_bridgeObjectRetain();
  v5 = String.init<A>(_:)();
  v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v8 = HIBYTE(v6) & 0xF;
    v13 = v5;
    v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  v5 = static String._copying(_:)();
  v10 = v9;
  swift_bridgeObjectRelease();
  v6 = v10;
  if ((v10 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v7 = (unsigned __int8 *)_StringObject.sharedUTF8.getter();
  }
LABEL_7:
  v11 = specialized closure #1 in FixedWidthInteger.init<A>(_:radix:)(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *specialized closure #1 in FixedWidthInteger.init<A>(_:radix:)(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  uint64_t v9;
  unsigned __int8 *i;
  unsigned int v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int8 *v18;
  unsigned int v19;
  char v20;
  uint64_t v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  uint64_t v25;
  unsigned int v26;
  char v27;
  uint64_t v28;

  v3 = a2;
  v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        v5 = a2 - 1;
        if (a2 != 1)
        {
          v6 = a3 + 48;
          v7 = a3 + 55;
          v8 = a3 + 87;
          if (a3 > 10)
          {
            v6 = 58;
          }
          else
          {
            v8 = 97;
            v7 = 65;
          }
          if (result)
          {
            v9 = 0;
            for (i = result + 1; ; ++i)
            {
              v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8)
                    return 0;
                  v12 = -87;
                }
                else
                {
                  v12 = -55;
                }
              }
              else
              {
                v12 = -48;
              }
              v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
                return 0;
              v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12)))
                return 0;
              if (!--v5)
                return (unsigned __int8 *)v9;
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      v22 = a3 + 48;
      v23 = a3 + 55;
      v24 = a3 + 87;
      if (a3 > 10)
      {
        v22 = 58;
      }
      else
      {
        v24 = 97;
        v23 = 65;
      }
      if (result)
      {
        v25 = 0;
        do
        {
          v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24)
                return 0;
              v27 = -87;
            }
            else
            {
              v27 = -55;
            }
          }
          else
          {
            v27 = -48;
          }
          v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63)
            return 0;
          v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27)))
            return 0;
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  v14 = a2 - 1;
  if (a2 == 1)
    return 0;
  v15 = a3 + 48;
  v16 = a3 + 55;
  v17 = a3 + 87;
  if (a3 > 10)
  {
    v15 = 58;
  }
  else
  {
    v17 = 97;
    v16 = 65;
  }
  if (!result)
    return 0;
  v9 = 0;
  v18 = result + 1;
  do
  {
    v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17)
          return 0;
        v20 = -87;
      }
      else
      {
        v20 = -55;
      }
    }
    else
    {
      v20 = -48;
    }
    v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
      return 0;
    v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20)))
      return 0;
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t static String._copying(_:)()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = String.subscript.getter();
  v4 = static String._copying(_:)(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t static String._copying(_:)(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = specialized Collection.count.getter(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v9, 0);
      v12 = specialized Sequence._copySequenceContents(initializing:)((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
        goto LABEL_9;
      }
    }
    else
    {
      v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    v13 = MEMORY[0x24267FDDC](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x24267FDDCLL);
LABEL_9:
      _StringObject.sharedUTF8.getter();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x24267FDDC]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t specialized Collection.count.getter(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v7 = result;
  v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0)
    LOBYTE(v8) = 1;
  v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    result = _StringGuts._slowEnsureMatchingEncoding(_:)(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = _StringGuts._slowEnsureMatchingEncoding(_:)(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0)
      return (a2 >> 16) - (v7 >> 16);
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v10 = a3 & 0xFFFFFFFFFFFFLL;
  if (v10 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v10 >= a2 >> 16)
  {
    return String.UTF8View._foreignDistance(from:to:)();
  }
  __break(1u);
  return result;
}

unint64_t specialized Sequence._copySequenceContents(initializing:)(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v26;
  unint64_t v27;
  _QWORD v28[2];

  v9 = (_QWORD *)result;
  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
    v12 = a4;
    v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0)
    goto LABEL_36;
  v10 = a5 >> 14;
  v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    v11 = 0;
    v12 = a4;
LABEL_33:
    *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  v11 = 0;
  v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0)
    LOBYTE(v14) = 1;
  v15 = 4 << v14;
  v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0)
    v16 = a6 & 0xFFFFFFFFFFFFLL;
  v23 = v16;
  v26 = a3 - 1;
  v12 = a4;
  while (1)
  {
    v17 = v12 & 0xC;
    result = v12;
    if (v17 == v15)
      result = _StringGuts._slowEnsureMatchingEncoding(_:)(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = String.UTF8View._foreignSubscript(position:)();
      v19 = result;
      if (v17 != v15)
        goto LABEL_23;
    }
    else
    {
      v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        v19 = *((_BYTE *)v28 + v18);
        if (v17 != v15)
          goto LABEL_23;
      }
      else
      {
        result = v21;
        if ((a6 & 0x1000000000000000) == 0)
          result = _StringObject.sharedUTF8.getter();
        v19 = *(_BYTE *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0)
            goto LABEL_24;
          goto LABEL_27;
        }
      }
    }
    result = _StringGuts._slowEnsureMatchingEncoding(_:)(v12, a6, a7);
    v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16)
      goto LABEL_35;
    v12 = String.UTF8View._foreignIndex(after:)();
LABEL_29:
    *(_BYTE *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14)
      goto LABEL_33;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1)
{
  uint64_t v2;

  type metadata accessor for VectorDatabaseAttribute();
  lazy protocol witness table accessor for type Insecure.SHA1 and conformance Insecure.SHA1(&lazy protocol witness table cache variable for type VectorDatabaseAttribute and conformance VectorDatabaseAttribute, (uint64_t (*)(uint64_t))MEMORY[0x24BEBFE00], MEMORY[0x24BEBFE10]);
  v2 = dispatch thunk of Hashable._rawHashValue(seed:)();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, unint64_t, uint64_t);
  char v15;
  _QWORD v17[2];

  v3 = v2;
  v17[1] = a1;
  v5 = type metadata accessor for VectorDatabaseAttribute();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = -1 << *(_BYTE *)(v3 + 32);
  v11 = a2 & ~v10;
  if (((*(_QWORD *)(v3 + 64 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) != 0)
  {
    v12 = ~v10;
    v13 = *(_QWORD *)(v6 + 72);
    v14 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    do
    {
      v14(v9, *(_QWORD *)(v3 + 48) + v13 * v11, v5);
      lazy protocol witness table accessor for type Insecure.SHA1 and conformance Insecure.SHA1(&lazy protocol witness table cache variable for type VectorDatabaseAttribute and conformance VectorDatabaseAttribute, (uint64_t (*)(uint64_t))MEMORY[0x24BEBFE00], MEMORY[0x24BEBFE18]);
      v15 = dispatch thunk of static Equatable.== infix(_:_:)();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
      if ((v15 & 1) != 0)
        break;
      v11 = (v11 + 1) & v12;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
  }
  return v11;
}

uint64_t specialized static VectorDatabaseAccess.persistDimension(_:at:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  id v28;
  id v29;
  NSObject *v30;
  os_log_type_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  void (*v36)(char *, uint64_t);
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  void (*v55)(char *, uint64_t);
  void (*v57)(char *, uint64_t);
  uint64_t v58;
  uint64_t v59;
  char *v60;
  void *v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66[2];
  uint64_t v67;

  v2 = type metadata accessor for String.Encoding();
  v62 = *(_QWORD *)(v2 - 8);
  v63 = (char *)v2;
  MEMORY[0x24BDAC7A8](v2, v3);
  v5 = (char *)&v58 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for URL.DirectoryHint();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)&v58 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for URL();
  v64 = *(_QWORD *)(v11 - 8);
  v65 = v11;
  v13 = MEMORY[0x24BDAC7A8](v11, v12);
  v60 = (char *)&v58 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v13, v15);
  v18 = (char *)&v58 - v17;
  MEMORY[0x24BDAC7A8](v16, v19);
  v21 = (char *)&v58 - v20;
  strcpy((char *)v66, "dimension.txt");
  HIWORD(v66[1]) = -4864;
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v10, *MEMORY[0x24BDCD7A0], v6);
  lazy protocol witness table accessor for type String and conformance String();
  URL.appending<A>(component:directoryHint:)();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  swift_bridgeObjectRelease();
  v59 = a1;
  v66[0] = a1;
  v66[0] = dispatch thunk of CustomStringConvertible.description.getter();
  v66[1] = v22;
  static String.Encoding.utf8.getter();
  v23 = v61;
  StringProtocol.write(to:atomically:encoding:)();
  if (v23)
  {
    (*(void (**)(char *, char *))(v62 + 8))(v5, v63);
    swift_bridgeObjectRelease();
    if (one-time initialization token for logger != -1)
      swift_once();
    v24 = type metadata accessor for Logger();
    __swift_project_value_buffer(v24, (uint64_t)static Logger.logger);
    v25 = v64;
    v26 = v65;
    v27 = v60;
    (*(void (**)(char *, char *, uint64_t))(v64 + 16))(v60, v21, v65);
    v28 = v23;
    v29 = v23;
    v30 = Logger.logObject.getter();
    v31 = static os_log_type_t.error.getter();
    v32 = v31;
    if (os_log_type_enabled(v30, v31))
    {
      v33 = swift_slowAlloc();
      v62 = swift_slowAlloc();
      v66[0] = v62;
      *(_DWORD *)v33 = 134218498;
      v67 = v59;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v33 + 12) = 2080;
      v63 = v21;
      LODWORD(v61) = v32;
      v34 = URL.absoluteString.getter();
      v67 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v34, v35, v66);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v36 = *(void (**)(char *, uint64_t))(v25 + 8);
      v36(v27, v65);
      *(_WORD *)(v33 + 22) = 2080;
      v26 = v65;
      swift_getErrorValue();
      v37 = Error.localizedDescription.getter();
      v67 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v37, v38, v66);
      v21 = v63;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_2401E6000, v30, (os_log_type_t)v61, "Failed to persist dimension %ld at path %s, file cannot be created, error: %s", (uint8_t *)v33, 0x20u);
      v39 = v62;
      swift_arrayDestroy();
      MEMORY[0x24268046C](v39, -1, -1);
      MEMORY[0x24268046C](v33, -1, -1);
    }
    else
    {
      v36 = *(void (**)(char *, uint64_t))(v25 + 8);
      v36(v27, v26);

    }
    swift_willThrow();
    return ((uint64_t (*)(char *, uint64_t))v36)(v21, v26);
  }
  else
  {
    (*(void (**)(char *, char *))(v62 + 8))(v5, v63);
    swift_bridgeObjectRelease();
    if (one-time initialization token for logger != -1)
      swift_once();
    v40 = type metadata accessor for Logger();
    __swift_project_value_buffer(v40, (uint64_t)static Logger.logger);
    v41 = v64;
    v42 = v18;
    v43 = v18;
    v44 = v65;
    (*(void (**)(char *, char *, uint64_t))(v64 + 16))(v43, v21, v65);
    v45 = Logger.logObject.getter();
    v46 = static os_log_type_t.info.getter();
    v47 = v21;
    if (os_log_type_enabled(v45, v46))
    {
      v48 = v42;
      v49 = swift_slowAlloc();
      v50 = swift_slowAlloc();
      v66[0] = v50;
      *(_DWORD *)v49 = 134218242;
      v67 = v59;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v49 + 12) = 2080;
      v63 = v21;
      v51 = v48;
      v52 = URL.absoluteString.getter();
      v67 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v52, v53, v66);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v54 = v65;
      v55 = *(void (**)(char *, uint64_t))(v64 + 8);
      v55(v51, v65);
      _os_log_impl(&dword_2401E6000, v45, v46, "Persisted dimension %ld at path %s, new file created", (uint8_t *)v49, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24268046C](v50, -1, -1);
      MEMORY[0x24268046C](v49, -1, -1);

      return ((uint64_t (*)(char *, uint64_t))v55)(v63, v54);
    }
    else
    {

      v57 = *(void (**)(char *, uint64_t))(v41 + 8);
      v57(v42, v44);
      return ((uint64_t (*)(char *, uint64_t))v57)(v47, v44);
    }
  }
}

uint64_t specialized static VectorDatabaseAccess.updatePerisistedDimension(_:at:)(uint64_t a1, _BYTE *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  void *v22;
  id v23;
  uint64_t countAndFlagsBits;
  void *v25;
  unsigned int v26;
  os_log_t v27;
  NSObject *v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  os_log_t v32;
  uint64_t v33;
  uint64_t (*v34)(_BYTE *, uint64_t);
  _BYTE *v35;
  char v37;
  uint64_t v38;
  uint64_t v39;
  _BYTE *v40;
  NSObject *v41;
  _BYTE *v42;
  os_log_type_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  void (*v49)(_BYTE *, uint64_t);
  id v50;
  NSURL *v51;
  void *v52;
  void *v53;
  unsigned int v54;
  void *v55;
  id v56;
  id v57;
  _BYTE *v58;
  NSURL *v59;
  void *v60;
  void *v61;
  unsigned int v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  _BYTE *v67;
  NSObject *v68;
  os_log_type_t v69;
  uint64_t v70;
  _BYTE *v71;
  uint64_t v72;
  unint64_t v73;
  os_log_t v74;
  _BYTE *v75;
  id v76;
  _BYTE v77[12];
  int v78;
  _BYTE *v79;
  _BYTE *v80;
  _BYTE *v81;
  os_log_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86[3];

  v86[2] = *MEMORY[0x24BDAC8D0];
  v4 = type metadata accessor for String.Encoding();
  MEMORY[0x24BDAC7A8](v4, v5);
  v6 = type metadata accessor for URL.DirectoryHint();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = &v77[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = type metadata accessor for URL();
  v12 = *(_QWORD *)(v11 - 8);
  v83 = v11;
  v84 = v12;
  v14 = MEMORY[0x24BDAC7A8](v11, v13);
  v80 = &v77[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v17 = MEMORY[0x24BDAC7A8](v14, v16);
  v81 = &v77[-v18];
  MEMORY[0x24BDAC7A8](v17, v19);
  v21 = &v77[-v20];
  strcpy((char *)v86, "dimension.txt");
  HIWORD(v86[1]) = -4864;
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v7 + 104))(v10, *MEMORY[0x24BDCD7A0], v6);
  lazy protocol witness table accessor for type String and conformance String();
  URL.appending<A>(component:directoryHint:)();
  (*(void (**)(_BYTE *, uint64_t))(v7 + 8))(v10, v6);
  swift_bridgeObjectRelease();
  v22 = (void *)objc_opt_self();
  v23 = objc_msgSend(v22, sel_defaultManager);
  countAndFlagsBits = URL.path(percentEncoded:)(1)._countAndFlagsBits;
  v25 = (void *)MEMORY[0x24267FDAC](countAndFlagsBits);
  swift_bridgeObjectRelease();
  v26 = objc_msgSend(v23, sel_fileExistsAtPath_, v25);

  if (!v26)
  {
    v32 = v82;
    specialized static VectorDatabaseAccess.persistDimension(_:at:)(a1);
    if (!v32)
      return (*(uint64_t (**)(_BYTE *, uint64_t))(v84 + 8))(v21, v83);
    goto LABEL_7;
  }
  static String.Encoding.utf8.getter();
  v27 = v82;
  v28 = String.init(contentsOf:encoding:)();
  if (v27)
  {
LABEL_7:
    v33 = v83;
    v34 = *(uint64_t (**)(_BYTE *, uint64_t))(v84 + 8);
LABEL_8:
    v35 = v21;
    return v34(v35, v33);
  }
  v30 = v29;
  v86[0] = a1;
  v82 = v28;
  if (v28 == dispatch thunk of CustomStringConvertible.description.getter() && v30 == v31)
  {
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  v37 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if ((v37 & 1) == 0)
  {
    v79 = v21;
    v50 = objc_msgSend(v22, sel_defaultManager);
    v81 = a2;
    URL._bridgeToObjectiveC()(v51);
    v53 = v52;
    v86[0] = 0;
    v54 = objc_msgSend(v50, sel_removeItemAtURL_error_, v52, v86);

    v55 = (void *)v86[0];
    if (v54)
    {
      v56 = (id)v86[0];
      v57 = objc_msgSend(v22, sel_defaultManager);
      v58 = v81;
      URL._bridgeToObjectiveC()(v59);
      v61 = v60;
      v86[0] = 0;
      v62 = objc_msgSend(v57, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v60, 1, 0, v86);

      v55 = (void *)v86[0];
      if (v62)
      {
        v63 = one-time initialization token for logger;
        v64 = (id)v86[0];
        v33 = v83;
        if (v63 != -1)
          swift_once();
        v65 = type metadata accessor for Logger();
        __swift_project_value_buffer(v65, (uint64_t)static Logger.logger);
        v66 = v84;
        v67 = v80;
        (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v84 + 16))(v80, v58, v33);
        swift_bridgeObjectRetain();
        v68 = Logger.logObject.getter();
        v69 = static os_log_type_t.info.getter();
        v78 = v69;
        if (os_log_type_enabled(v68, v69))
        {
          v70 = swift_slowAlloc();
          v81 = (_BYTE *)swift_slowAlloc();
          v86[0] = (uint64_t)v81;
          *(_DWORD *)v70 = 136315394;
          swift_bridgeObjectRetain();
          v85 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)((uint64_t)v82, v30, v86);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v70 + 12) = 2080;
          v82 = v68;
          v71 = v80;
          v72 = URL.absoluteString.getter();
          v85 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v72, v73, v86);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          v34 = *(uint64_t (**)(_BYTE *, uint64_t))(v84 + 8);
          v34(v71, v33);
          v74 = v82;
          _os_log_impl(&dword_2401E6000, v82, (os_log_type_t)v78, "Removed previous dimension %s and db file at path %s", (uint8_t *)v70, 0x16u);
          v75 = v81;
          swift_arrayDestroy();
          MEMORY[0x24268046C](v75, -1, -1);
          MEMORY[0x24268046C](v70, -1, -1);

        }
        else
        {
          swift_bridgeObjectRelease_n();
          v34 = *(uint64_t (**)(_BYTE *, uint64_t))(v66 + 8);
          v34(v67, v33);

        }
        specialized static VectorDatabaseAccess.persistDimension(_:at:)(a1);
        v35 = v79;
        return v34(v35, v33);
      }
    }
    v76 = v55;
    swift_bridgeObjectRelease();
    _convertNSErrorToError(_:)();

    swift_willThrow();
    v33 = v83;
    v34 = *(uint64_t (**)(_BYTE *, uint64_t))(v84 + 8);
    v21 = v79;
    goto LABEL_8;
  }
LABEL_12:
  swift_bridgeObjectRelease();
  if (one-time initialization token for logger != -1)
    swift_once();
  v38 = type metadata accessor for Logger();
  __swift_project_value_buffer(v38, (uint64_t)static Logger.logger);
  v33 = v83;
  v39 = v84;
  v40 = v81;
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v84 + 16))(v81, v21, v83);
  v41 = Logger.logObject.getter();
  v42 = v21;
  v43 = static os_log_type_t.info.getter();
  if (!os_log_type_enabled(v41, v43))
  {

    v34 = *(uint64_t (**)(_BYTE *, uint64_t))(v39 + 8);
    v34(v40, v33);
    v35 = v42;
    return v34(v35, v33);
  }
  v44 = swift_slowAlloc();
  v45 = swift_slowAlloc();
  v85 = a1;
  v86[0] = v45;
  *(_DWORD *)v44 = 134218242;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  *(_WORD *)(v44 + 12) = 2080;
  v79 = v42;
  v46 = URL.absoluteString.getter();
  v85 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v46, v47, v86);
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  swift_bridgeObjectRelease();
  v48 = v83;
  v49 = *(void (**)(_BYTE *, uint64_t))(v84 + 8);
  v49(v40, v83);
  _os_log_impl(&dword_2401E6000, v41, v43, "Dimension %ld at path %s has not changed", (uint8_t *)v44, 0x16u);
  swift_arrayDestroy();
  MEMORY[0x24268046C](v45, -1, -1);
  MEMORY[0x24268046C](v44, -1, -1);

  return ((uint64_t (*)(_BYTE *, uint64_t))v49)(v79, v48);
}

uint64_t type metadata accessor for VectorDatabaseAccess()
{
  return objc_opt_self();
}

uint64_t method lookup function for VectorDatabaseAccess()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of VectorDatabaseAccess.__allocating_init(path:embeddingProvider:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(v2 + 104) + *(_QWORD *)(v2 + 104));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = dispatch thunk of CacheDatabase.listAll(namespace:nextToken:);
  return v8(a1, a2);
}

uint64_t dispatch thunk of VectorDatabaseAccess.delete(entries:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of VectorDatabaseAccess.describe(identifier:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of VectorDatabaseAccess.insert(entries:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 136) + *(_QWORD *)(*(_QWORD *)v1 + 136));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = dispatch thunk of CacheDatabase.delete(entries:);
  return v6(a1);
}

uint64_t dispatch thunk of VectorDatabaseAccess.list(namespace:searchKey:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t);

  v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v3 + 160)
                                                          + *(_QWORD *)(*(_QWORD *)v3 + 160));
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v8;
  *v8 = v4;
  v8[1] = dispatch thunk of CacheDatabase.list(namespace:searchKey:);
  return v10(a1, a2, a3);
}

uint64_t dispatch thunk of VectorDatabaseAccess.listAll(namespace:nextToken:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of VectorDatabaseAccess.deleteAll(namespace:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of VectorDatabaseAccess.warmup()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t outlined init with copy of (VectorDatabaseAttribute, DatabaseValue)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (VectorDatabaseAttribute, DatabaseValue));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t lazy protocol witness table accessor for type String and conformance String()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    result = MEMORY[0x2426803DC](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
  }
  return result;
}

BOOL static EmbeddingError.== infix(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

void EmbeddingError.hash(into:)(uint64_t a1, unsigned __int8 a2)
{
  Hasher._combine(_:)(a2);
}

Swift::Int EmbeddingError.hashValue.getter(unsigned __int8 a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

uint64_t dispatch thunk of EmbeddingProviding.dimension()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 8) + *(_QWORD *)(a2 + 8));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = protocol witness for EmbeddingProviding.dimension() in conformance UniversalEmbeddingProvider;
  return v7(a1, a2);
}

uint64_t dispatch thunk of EmbeddingProviding.warmup()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of EmbeddingProviding.embedding(input:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a4 + 24) + *(_QWORD *)(a4 + 24));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = dispatch thunk of EmbeddingProviding.embedding(input:);
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of EmbeddingProviding.embedding(input:)(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v6;

  v6 = *v2;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, a2);
}

uint64_t storeEnumTagSinglePayload for EmbeddingError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_240207200 + 4 * byte_24020D745[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_240207234 + 4 * byte_24020D740[v4]))();
}

uint64_t sub_240207234(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24020723C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x240207244);
  return result;
}

uint64_t sub_240207250(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x240207258);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_24020725C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_240207264(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for EmbeddingError()
{
  return &type metadata for EmbeddingError;
}

uint64_t NextToken.offset.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for NextToken(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for NextToken(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 16) = v3;
  return result;
}

ValueMetadata *type metadata accessor for NextToken()
{
  return &type metadata for NextToken;
}

uint64_t AnnotatedCacheEntry.builder()()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(void);
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  BOOL v50;
  _QWORD *v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t result;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void (*v74)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  int v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;

  v1 = (uint64_t)v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UserID?);
  v4 = MEMORY[0x24BDAC7A8](v2, v3);
  v79 = (uint64_t)&v72 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4, v6);
  v78 = (char *)&v72 - v7;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  v10 = MEMORY[0x24BDAC7A8](v8, v9);
  v85 = (uint64_t)&v72 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10, v12);
  v14 = (char *)&v72 - v13;
  v15 = v0[1];
  v83 = *v0;
  v80 = v15;
  v16 = type metadata accessor for AnnotatedCacheEntry(0);
  v17 = *(int *)(v16 + 28);
  v18 = v16;
  v86 = v16;
  v81 = *((unsigned __int8 *)v0 + v17);
  type metadata accessor for AnnotatedCacheEntryBuilder(0);
  v19 = swift_allocObject();
  v20 = v19 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_lastAccessedTime;
  v82 = v19 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_lastAccessedTime;
  v21 = type metadata accessor for Date();
  v22 = *(_QWORD *)(v21 - 8);
  v23 = *(void (**)(void))(v22 + 56);
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v23)(v20, 1, 1, v21);
  v84 = v19 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_lastCreatedTime;
  v23();
  v24 = (_QWORD *)(v19 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_llmOutput);
  *v24 = 0;
  v24[1] = 0;
  v25 = v19 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_ttl;
  *(_QWORD *)v25 = 0;
  v73 = v25;
  *(_BYTE *)(v25 + 8) = 1;
  v26 = v19 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_userId;
  v27 = type metadata accessor for UserID();
  v72 = *(_QWORD *)(v27 - 8);
  v28 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v72 + 56);
  v76 = v26;
  v75 = v27;
  v74 = v28;
  ((void (*)(uint64_t, uint64_t, uint64_t))v28)(v26, 1, 1);
  v29 = v19 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_score;
  *(_QWORD *)v29 = 0;
  v77 = v29;
  *(_BYTE *)(v29 + 8) = 1;
  *(_QWORD *)(v19 + 16) = v83;
  *(_QWORD *)(v19 + 24) = v15;
  *(_BYTE *)(v19 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_namespace) = v81;
  v83 = v19;
  v30 = v19 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_searchKeys;
  *(_QWORD *)v30 = MEMORY[0x24BEE4AF8];
  v31 = *(void (**)(char *, uint64_t, uint64_t))(v22 + 16);
  v31(v14, v1 + *(int *)(v18 + 20), v21);
  ((void (*)(char *, _QWORD, uint64_t, uint64_t))v23)(v14, 0, 1, v21);
  v32 = v85;
  outlined init with take of Date?((uint64_t)v14, v85, &demangling cache variable for type metadata for Date?);
  v33 = v82;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  outlined assign with take of Date?(v32, v33, &demangling cache variable for type metadata for Date?);
  swift_endAccess();
  v34 = v86;
  v31(v14, v1 + *(int *)(v86 + 24), v21);
  ((void (*)(char *, _QWORD, uint64_t, uint64_t))v23)(v14, 0, 1, v21);
  outlined init with take of Date?((uint64_t)v14, v32, &demangling cache variable for type metadata for Date?);
  v35 = v84;
  swift_beginAccess();
  outlined assign with take of Date?(v32, v35, &demangling cache variable for type metadata for Date?);
  swift_endAccess();
  v36 = (uint64_t *)(v1 + *(int *)(v34 + 32));
  v38 = *v36;
  v37 = v36[1];
  swift_beginAccess();
  *v24 = v38;
  v24[1] = v37;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v39 = *(int *)(v34 + 36);
  v85 = v1;
  v40 = *(_QWORD *)(v1 + v39);
  v41 = *(_QWORD *)(v40 + 16);
  if (!v41)
  {
LABEL_32:
    v60 = v85;
    v61 = v86;
    v62 = *(_QWORD *)(v85 + *(int *)(v86 + 40));
    v63 = v73;
    swift_beginAccess();
    *(_QWORD *)v63 = v62;
    *(_BYTE *)(v63 + 8) = 0;
    v64 = v78;
    v65 = v75;
    (*(void (**)(char *, uint64_t, uint64_t))(v72 + 16))(v78, v60 + *(int *)(v61 + 44), v75);
    v74(v64, 0, 1, v65);
    v66 = (uint64_t)v64;
    v67 = v79;
    outlined init with take of Date?(v66, v79, &demangling cache variable for type metadata for UserID?);
    v68 = v76;
    swift_beginAccess();
    outlined assign with take of Date?(v67, v68, &demangling cache variable for type metadata for UserID?);
    swift_endAccess();
    v69 = v60 + *(int *)(v61 + 48);
    v70 = *(_QWORD *)v69;
    LOBYTE(v60) = *(_BYTE *)(v69 + 8);
    v71 = v77;
    swift_beginAccess();
    *(_QWORD *)v71 = v70;
    *(_BYTE *)(v71 + 8) = v60;
    return v83;
  }
  v42 = v40 + 32;
  v84 = *(_QWORD *)(v1 + v39);
  swift_bridgeObjectRetain();
  swift_beginAccess();
  v43 = 0;
  while (1)
  {
    v45 = (uint64_t *)(v42 + 16 * v43);
    v46 = *v45;
    v47 = v45[1];
    v48 = *(_QWORD **)v30;
    v49 = *(_QWORD *)(*(_QWORD *)v30 + 16);
    if (!v49)
      goto LABEL_12;
    v50 = v48[4] == v46 && v48[5] == v47;
    if (!v50 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      if (v49 == 1)
        goto LABEL_12;
      if (v48[6] != v46 || v48[7] != v47)
      {
        result = _stringCompareWithSmolCheck(_:_:expecting:)();
        if ((result & 1) == 0)
          break;
      }
    }
LABEL_4:
    if (++v43 == v41)
    {
      swift_bridgeObjectRelease();
      goto LABEL_32;
    }
  }
  if (v49 == 2)
  {
LABEL_12:
    swift_beginAccess();
    v51 = *(_QWORD **)v30;
    swift_bridgeObjectRetain_n();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v51 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v51[2] + 1, 1, v51);
    v53 = v51[2];
    v52 = v51[3];
    if (v53 >= v52 >> 1)
      v51 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v52 > 1), v53 + 1, 1, v51);
    v51[2] = v53 + 1;
    v44 = &v51[2 * v53];
    v44[4] = v46;
    v44[5] = v47;
    *(_QWORD *)v30 = v51;
    swift_endAccess();
    swift_bridgeObjectRelease();
    goto LABEL_4;
  }
  v56 = v48 + 9;
  v57 = 2;
  while (1)
  {
    v58 = v57 + 1;
    if (__OFADD__(v57, 1))
      break;
    if (*(v56 - 1) == v46 && *v56 == v47)
      goto LABEL_4;
    result = _stringCompareWithSmolCheck(_:_:expecting:)();
    if ((result & 1) != 0)
      goto LABEL_4;
    v56 += 2;
    ++v57;
    if (v58 == v49)
      goto LABEL_12;
  }
  __break(1u);
  return result;
}

LLMCache::CacheEntry __swiftcall AnnotatedCacheEntry.toCacheEntry(searchKey:)(Swift::String searchKey)
{
  uint64_t v1;
  uint64_t v2;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  void *v14;
  Swift::Bool v15;
  char v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  LLMCache::CacheEntry result;

  object = searchKey._object;
  countAndFlagsBits = searchKey._countAndFlagsBits;
  v5 = v1;
  v6 = type metadata accessor for AnnotatedCacheEntry(0);
  v7 = (uint64_t *)(v2 + *(int *)(v6 + 32));
  v9 = *v7;
  v8 = v7[1];
  v10 = *(_QWORD **)(v2 + *(int *)(v6 + 36));
  v11 = v10[2];
  if (!v11)
    goto LABEL_9;
  v12 = v10[4] == countAndFlagsBits && v10[5] == (_QWORD)object;
  if (v12 || (v13 = _stringCompareWithSmolCheck(_:_:expecting:)(), (v13 & 1) != 0))
  {
LABEL_7:
    v16 = 1;
LABEL_10:
    *(_QWORD *)v5 = v9;
    *(_QWORD *)(v5 + 8) = v8;
    *(_BYTE *)(v5 + 16) = v16;
    v13 = swift_bridgeObjectRetain();
    goto _$s8LLMCache19AnnotatedCacheEntryV02tocD09searchKeyAA0cD0VSS_tF;
  }
  if (v11 == 1)
  {
LABEL_9:
    v16 = 0;
    goto LABEL_10;
  }
  v17 = v10 + 7;
  v18 = 1;
  while (1)
  {
    v19 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (*(v17 - 1) == countAndFlagsBits && *v17 == (_QWORD)object)
      goto LABEL_7;
    v13 = _stringCompareWithSmolCheck(_:_:expecting:)();
    if ((v13 & 1) != 0)
      goto LABEL_7;
    v16 = 0;
    v17 += 2;
    ++v18;
    if (v19 == v11)
      goto LABEL_10;
  }
  __break(1u);
_$s8LLMCache19AnnotatedCacheEntryV02tocD09searchKeyAA0cD0VSS_tF:
  result.llmOutput._object = v14;
  result.llmOutput._countAndFlagsBits = v13;
  result.isExactMatch = v15;
  return result;
}

uint64_t AnnotatedCacheEntryBuilder.__allocating_init(id:namespace:)(uint64_t a1, uint64_t a2, char *a3)
{
  uint64_t v6;

  v6 = swift_allocObject();
  AnnotatedCacheEntryBuilder.init(id:namespace:)(a1, a2, a3);
  return v6;
}

id one-time initialization function for dateFormatter()
{
  id result;

  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD15D0]), sel_init);
  static AnnotatedCacheEntry.dateFormatter = (uint64_t)result;
  return result;
}

uint64_t *AnnotatedCacheEntry.dateFormatter.unsafeMutableAddressor()
{
  if (one-time initialization token for dateFormatter != -1)
    swift_once();
  return &static AnnotatedCacheEntry.dateFormatter;
}

id static AnnotatedCacheEntry.dateFormatter.getter()
{
  if (one-time initialization token for dateFormatter != -1)
    swift_once();
  return (id)static AnnotatedCacheEntry.dateFormatter;
}

uint64_t AnnotatedCacheEntry.id.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AnnotatedCacheEntry.lastAccessedTime.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for AnnotatedCacheEntry(0) + 20);
  v4 = type metadata accessor for Date();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t AnnotatedCacheEntry.lastCreatedTime.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for AnnotatedCacheEntry(0) + 24);
  v4 = type metadata accessor for Date();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t AnnotatedCacheEntry.namespace.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for AnnotatedCacheEntry(0);
  *a1 = *(_BYTE *)(v1 + *(int *)(result + 28));
  return result;
}

uint64_t AnnotatedCacheEntry.llmOutput.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for AnnotatedCacheEntry(0) + 32));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AnnotatedCacheEntry.searchKeys.getter()
{
  type metadata accessor for AnnotatedCacheEntry(0);
  return swift_bridgeObjectRetain();
}

double AnnotatedCacheEntry.ttl.getter()
{
  uint64_t v0;

  return *(double *)(v0 + *(int *)(type metadata accessor for AnnotatedCacheEntry(0) + 40));
}

uint64_t AnnotatedCacheEntry.userId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for AnnotatedCacheEntry(0) + 44);
  v4 = type metadata accessor for UserID();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t AnnotatedCacheEntry.score.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for AnnotatedCacheEntry(0) + 48));
}

Swift::String __swiftcall AnnotatedCacheEntry.getLastAccessedTimeString()()
{
  void *v0;
  Class isa;
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  Swift::String result;

  if (one-time initialization token for dateFormatter != -1)
    swift_once();
  v0 = (void *)static AnnotatedCacheEntry.dateFormatter;
  type metadata accessor for AnnotatedCacheEntry(0);
  isa = Date._bridgeToObjectiveC()().super.isa;
  v2 = objc_msgSend(v0, sel_stringFromDate_, isa);

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result._object = v7;
  result._countAndFlagsBits = v6;
  return result;
}

Swift::String __swiftcall AnnotatedCacheEntry.getLastCreatedTimeString()()
{
  void *v0;
  Class isa;
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  Swift::String result;

  if (one-time initialization token for dateFormatter != -1)
    swift_once();
  v0 = (void *)static AnnotatedCacheEntry.dateFormatter;
  type metadata accessor for AnnotatedCacheEntry(0);
  isa = Date._bridgeToObjectiveC()().super.isa;
  v2 = objc_msgSend(v0, sel_stringFromDate_, isa);

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result._object = v7;
  result._countAndFlagsBits = v6;
  return result;
}

uint64_t specialized static Array<A>.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  BOOL v5;
  char v6;
  uint64_t result;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *i;
  BOOL v11;

  v2 = a1[2];
  if (v2 != a2[2])
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  v5 = a1[4] == a2[4] && a1[5] == a2[5];
  if (v5 || (v6 = _stringCompareWithSmolCheck(_:_:expecting:)(), result = 0, (v6 & 1) != 0))
  {
    v8 = v2 - 1;
    if (!v8)
      return 1;
    v9 = a1 + 7;
    for (i = a2 + 7; ; i += 2)
    {
      v11 = *(v9 - 1) == *(i - 1) && *v9 == *i;
      if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
        break;
      v9 += 2;
      if (!--v8)
        return 1;
    }
    return 0;
  }
  return result;
}

uint64_t AnnotatedCacheEntry.CodingKeys.stringValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_240207F40 + 4 * a3[a1]))(25705, 0xE200000000000000);
}

unint64_t sub_240207F40()
{
  return 0xD000000000000010;
}

uint64_t sub_240207F5C()
{
  return 0x616572437473616CLL;
}

uint64_t sub_240207F80()
{
  return 0x63617073656D616ELL;
}

uint64_t sub_240207F9C()
{
  return 0x757074754F6D6C6CLL;
}

uint64_t sub_240207FBC()
{
  return 0x654B686372616573;
}

uint64_t sub_240207FD8()
{
  return 7107700;
}

uint64_t sub_240207FE8()
{
  return 0x644972657375;
}

uint64_t sub_240207FFC()
{
  return 0x65726F6373;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance AnnotatedCacheEntry.CodingKeys()
{
  unsigned __int8 *v0;

  return AnnotatedCacheEntry.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance AnnotatedCacheEntry.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = specialized AnnotatedCacheEntry.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance AnnotatedCacheEntry.CodingKeys()
{
  return 0;
}

void protocol witness for CodingKey.init(intValue:) in conformance AnnotatedCacheEntry.CodingKeys(_BYTE *a1@<X8>)
{
  *a1 = 9;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance AnnotatedCacheEntry.CodingKeys()
{
  lazy protocol witness table accessor for type AnnotatedCacheEntry.CodingKeys and conformance AnnotatedCacheEntry.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance AnnotatedCacheEntry.CodingKeys()
{
  lazy protocol witness table accessor for type AnnotatedCacheEntry.CodingKeys and conformance AnnotatedCacheEntry.CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t AnnotatedCacheEntry.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  char v14;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<AnnotatedCacheEntry.CodingKeys>);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type AnnotatedCacheEntry.CodingKeys and conformance AnnotatedCacheEntry.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  LOBYTE(v13) = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v2)
  {
    v10 = type metadata accessor for AnnotatedCacheEntry(0);
    LOBYTE(v13) = 1;
    type metadata accessor for Date();
    lazy protocol witness table accessor for type Insecure.SHA1 and conformance Insecure.SHA1(&lazy protocol witness table cache variable for type Date and conformance Date, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE920]);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    LOBYTE(v13) = 2;
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    LOBYTE(v13) = *(_BYTE *)(v3 + *(int *)(v10 + 28));
    v14 = 3;
    lazy protocol witness table accessor for type CacheNamespace and conformance CacheNamespace();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    LOBYTE(v13) = 4;
    KeyedEncodingContainer.encode(_:forKey:)();
    v13 = *(_QWORD *)(v3 + *(int *)(v10 + 36));
    v14 = 5;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
    lazy protocol witness table accessor for type [String] and conformance <A> [A](&lazy protocol witness table cache variable for type [String] and conformance <A> [A], MEMORY[0x24BEE0D08], MEMORY[0x24BEE12A0]);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    LOBYTE(v13) = 6;
    KeyedEncodingContainer.encode(_:forKey:)();
    LOBYTE(v13) = 7;
    type metadata accessor for UserID();
    lazy protocol witness table accessor for type Insecure.SHA1 and conformance Insecure.SHA1(&lazy protocol witness table cache variable for type UserID and conformance UserID, (uint64_t (*)(uint64_t))MEMORY[0x24BE9B488], MEMORY[0x24BE9B498]);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    LOBYTE(v13) = 8;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

uint64_t AnnotatedCacheEntry.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, char *, uint64_t);
  int *v30;
  int *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  char *v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  char *v51;
  int *v52;
  uint64_t v53;
  char v54;

  v43 = a2;
  v3 = type metadata accessor for UserID();
  v4 = *(_QWORD *)(v3 - 8);
  v44 = v3;
  v45 = v4;
  MEMORY[0x24BDAC7A8](v3, v5);
  v7 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = type metadata accessor for Date();
  v48 = *(_QWORD *)(v50 - 8);
  v9 = MEMORY[0x24BDAC7A8](v50, v8);
  v11 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9, v12);
  v14 = (char *)&v42 - v13;
  v46 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<AnnotatedCacheEntry.CodingKeys>);
  v15 = *(_QWORD *)(v46 - 8);
  MEMORY[0x24BDAC7A8](v46, v16);
  v18 = (char *)&v42 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = (int *)type metadata accessor for AnnotatedCacheEntry(0);
  MEMORY[0x24BDAC7A8](v52, v19);
  v21 = (uint64_t *)((char *)&v42 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  v22 = a1[3];
  v49 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v22);
  lazy protocol witness table accessor for type AnnotatedCacheEntry.CodingKeys and conformance AnnotatedCacheEntry.CodingKeys();
  v47 = v18;
  v23 = v51;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v23)
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v49);
  v24 = v11;
  v51 = v7;
  v25 = v15;
  LOBYTE(v53) = 0;
  v26 = v46;
  *v21 = KeyedDecodingContainer.decode(_:forKey:)();
  v21[1] = v27;
  LOBYTE(v53) = 1;
  lazy protocol witness table accessor for type Insecure.SHA1 and conformance Insecure.SHA1(&lazy protocol witness table cache variable for type Date and conformance Date, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE960]);
  v28 = v50;
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  v42 = v15;
  v29 = *(void (**)(char *, char *, uint64_t))(v48 + 32);
  v29((char *)v21 + v52[5], v14, v28);
  LOBYTE(v53) = 2;
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  v30 = v52;
  v29((char *)v21 + v52[6], v24, v28);
  v54 = 3;
  lazy protocol witness table accessor for type CacheNamespace and conformance CacheNamespace();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  v31 = v30;
  *((_BYTE *)v21 + v30[7]) = v53;
  LOBYTE(v53) = 4;
  v32 = KeyedDecodingContainer.decode(_:forKey:)();
  v33 = (uint64_t)v49;
  v34 = (uint64_t *)((char *)v21 + v30[8]);
  *v34 = v32;
  v34[1] = v35;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
  v54 = 5;
  lazy protocol witness table accessor for type [String] and conformance <A> [A](&lazy protocol witness table cache variable for type [String] and conformance <A> [A], MEMORY[0x24BEE0D38], MEMORY[0x24BEE12D0]);
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  *(uint64_t *)((char *)v21 + v30[9]) = v53;
  LOBYTE(v53) = 6;
  v42 = 0;
  KeyedDecodingContainer.decode(_:forKey:)();
  *(uint64_t *)((char *)v21 + v30[10]) = v36;
  LOBYTE(v53) = 7;
  lazy protocol witness table accessor for type Insecure.SHA1 and conformance Insecure.SHA1(&lazy protocol witness table cache variable for type UserID and conformance UserID, (uint64_t (*)(uint64_t))MEMORY[0x24BE9B488], MEMORY[0x24BE9B4B0]);
  v37 = v44;
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  (*(void (**)(char *, char *, uint64_t))(v45 + 32))((char *)v21 + v31[11], v51, v37);
  LOBYTE(v53) = 8;
  v38 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  LOBYTE(v31) = v39;
  (*(void (**)(char *, uint64_t))(v25 + 8))(v47, v26);
  v40 = (char *)v21 + v52[12];
  *(_QWORD *)v40 = v38;
  v40[8] = v31 & 1;
  outlined init with copy of AnnotatedCacheEntry((uint64_t)v21, v43);
  __swift_destroy_boxed_opaque_existential_1Tm(v33);
  return outlined destroy of AnnotatedCacheEntry((uint64_t)v21);
}

uint64_t AnnotatedCacheEntry.init(id:lastAccessedTime:lastCreatedTime:namespace:llmOutput:searchKeys:ttl:userId:score:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, char *a9@<X8>, double a10@<D0>, uint64_t a11, uint64_t a12, char a13)
{
  char v19;
  int *v20;
  char *v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t, uint64_t);
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t result;
  char *v28;

  v19 = *a5;
  *(_QWORD *)a9 = a1;
  *((_QWORD *)a9 + 1) = a2;
  v20 = (int *)type metadata accessor for AnnotatedCacheEntry(0);
  v21 = &a9[v20[5]];
  v22 = type metadata accessor for Date();
  v23 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 32);
  v23(v21, a3, v22);
  v23(&a9[v20[6]], a4, v22);
  a9[v20[7]] = v19;
  v24 = &a9[v20[8]];
  *(_QWORD *)v24 = a6;
  *((_QWORD *)v24 + 1) = a7;
  *(_QWORD *)&a9[v20[9]] = a8;
  *(double *)&a9[v20[10]] = a10;
  v25 = &a9[v20[11]];
  v26 = type metadata accessor for UserID();
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 32))(v25, a11, v26);
  v28 = &a9[v20[12]];
  *(_QWORD *)v28 = a12;
  v28[8] = a13 & 1;
  return result;
}

uint64_t protocol witness for Decodable.init(from:) in conformance AnnotatedCacheEntry@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return AnnotatedCacheEntry.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance AnnotatedCacheEntry(_QWORD *a1)
{
  return AnnotatedCacheEntry.encode(to:)(a1);
}

uint64_t key path setter for AnnotatedCacheEntryBuilder.id : AnnotatedCacheEntryBuilder(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  v2 = a1[1];
  v4 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v4 + 16) = v3;
  *(_QWORD *)(v4 + 24) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t AnnotatedCacheEntryBuilder.id.getter()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AnnotatedCacheEntryBuilder.lastAccessedTime.getter@<X0>(uint64_t a1@<X8>)
{
  return AnnotatedCacheEntryBuilder.lastAccessedTime.getter(&OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_lastAccessedTime, &demangling cache variable for type metadata for Date?, a1);
}

uint64_t key path setter for AnnotatedCacheEntryBuilder.lastAccessedTime : AnnotatedCacheEntryBuilder(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t *a5, _QWORD *a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v16;

  v10 = __swift_instantiateConcreteTypeFromMangledName(a5);
  MEMORY[0x24BDAC7A8](v10, v11);
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of Date?(a1, (uint64_t)v13, a5);
  v14 = *a2 + *a6;
  swift_beginAccess();
  outlined assign with take of Date?((uint64_t)v13, v14, a5);
  return swift_endAccess();
}

uint64_t AnnotatedCacheEntryBuilder.lastCreatedTime.getter@<X0>(uint64_t a1@<X8>)
{
  return AnnotatedCacheEntryBuilder.lastAccessedTime.getter(&OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_lastCreatedTime, &demangling cache variable for type metadata for Date?, a1);
}

uint64_t AnnotatedCacheEntryBuilder.lastAccessedTime.getter@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v6;

  v6 = v3 + *a1;
  swift_beginAccess();
  return outlined init with copy of Date?(v6, a3, a2);
}

uint64_t AnnotatedCacheEntryBuilder.namespace.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_namespace);
  result = swift_beginAccess();
  *a1 = *v3;
  return result;
}

uint64_t key path setter for AnnotatedCacheEntryBuilder.llmOutput : AnnotatedCacheEntryBuilder(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v3 = *a1;
  v2 = a1[1];
  v4 = (_QWORD *)(*a2 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_llmOutput);
  swift_beginAccess();
  *v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t AnnotatedCacheEntryBuilder.llmOutput.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_llmOutput);
  swift_beginAccess();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t key path setter for AnnotatedCacheEntryBuilder.searchKeys : AnnotatedCacheEntryBuilder(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_searchKeys);
  swift_beginAccess();
  *v3 = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t AnnotatedCacheEntryBuilder.searchKeys.getter()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t AnnotatedCacheEntryBuilder.ttl.getter()
{
  return AnnotatedCacheEntryBuilder.ttl.getter(&OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_ttl);
}

uint64_t AnnotatedCacheEntryBuilder.userId.getter@<X0>(uint64_t a1@<X8>)
{
  return AnnotatedCacheEntryBuilder.lastAccessedTime.getter(&OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_userId, &demangling cache variable for type metadata for UserID?, a1);
}

uint64_t AnnotatedCacheEntryBuilder.score.getter()
{
  return AnnotatedCacheEntryBuilder.ttl.getter(&OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_score);
}

uint64_t AnnotatedCacheEntryBuilder.ttl.getter(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = v1 + *a1;
  swift_beginAccess();
  return *(_QWORD *)v2;
}

uint64_t AnnotatedCacheEntryBuilder.init(id:namespace:)(uint64_t a1, uint64_t a2, char *a3)
{
  uint64_t v3;
  char v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t, uint64_t);
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = *a3;
  v7 = v3 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_lastAccessedTime;
  v8 = type metadata accessor for Date();
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56);
  v9(v7, 1, 1, v8);
  v9(v3 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_lastCreatedTime, 1, 1, v8);
  v10 = (_QWORD *)(v3 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_llmOutput);
  *v10 = 0;
  v10[1] = 0;
  v11 = v3 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_ttl;
  *(_QWORD *)v11 = 0;
  *(_BYTE *)(v11 + 8) = 1;
  v12 = v3 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_userId;
  v13 = type metadata accessor for UserID();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v12, 1, 1, v13);
  v14 = v3 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_score;
  *(_QWORD *)v14 = 0;
  *(_BYTE *)(v14 + 8) = 1;
  *(_QWORD *)(v3 + 16) = a1;
  *(_QWORD *)(v3 + 24) = a2;
  *(_BYTE *)(v3 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_namespace) = v6;
  *(_QWORD *)(v3 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_searchKeys) = MEMORY[0x24BEE4AF8];
  return v3;
}

uint64_t AnnotatedCacheEntryBuilder.withLastAccessedTime(_:)(uint64_t a1)
{
  return AnnotatedCacheEntryBuilder.withLastAccessedTime(_:)(a1, &demangling cache variable for type metadata for Date?, (uint64_t (*)(_QWORD))MEMORY[0x24BDCE900], &OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_lastAccessedTime);
}

uint64_t AnnotatedCacheEntryBuilder.withLastCreatedTime(_:)(uint64_t a1)
{
  return AnnotatedCacheEntryBuilder.withLastAccessedTime(_:)(a1, &demangling cache variable for type metadata for Date?, (uint64_t (*)(_QWORD))MEMORY[0x24BDCE900], &OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_lastCreatedTime);
}

uint64_t AnnotatedCacheEntryBuilder.withLastAccessedTime(_:)(uint64_t a1, uint64_t *a2, uint64_t (*a3)(_QWORD), _QWORD *a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;

  v9 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v11 = MEMORY[0x24BDAC7A8](v9, v10);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11, v14);
  v16 = (char *)&v21 - v15;
  v17 = a3(0);
  v18 = *(_QWORD *)(v17 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v16, a1, v17);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v16, 0, 1, v17);
  outlined init with take of Date?((uint64_t)v16, (uint64_t)v13, a2);
  v19 = v4 + *a4;
  swift_beginAccess();
  outlined assign with take of Date?((uint64_t)v13, v19, a2);
  swift_endAccess();
  return swift_retain();
}

uint64_t AnnotatedCacheEntryBuilder.withLlmOutput(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_llmOutput);
  swift_beginAccess();
  *v5 = a1;
  v5[1] = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_retain();
}

uint64_t AnnotatedCacheEntryBuilder.appendSearchKey(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  _QWORD **v6;
  _QWORD *v7;
  BOOL v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  BOOL v12;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v14;
  unint64_t v15;
  _QWORD *v16;

  v5 = (_QWORD *)(*(uint64_t (**)(void))(*(_QWORD *)v2 + 272))();
  v6 = (_QWORD **)v5;
  v7 = (_QWORD *)v5[2];
  if (v7)
  {
    v8 = v5[4] == a1 && v5[5] == a2;
    if (v8 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      return swift_retain();
    }
    if (v7 != (_QWORD *)1)
    {
      v9 = v6 + 7;
      v10 = 1;
      while (1)
      {
        v11 = (_QWORD *)(v10 + 1);
        if (__OFADD__(v10, 1))
          break;
        v12 = *(v9 - 1) == a1 && *v9 == a2;
        if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
          goto LABEL_7;
        v9 += 2;
        ++v10;
        if (v11 == v7)
          goto LABEL_17;
      }
      __break(1u);
      goto LABEL_23;
    }
  }
LABEL_17:
  swift_bridgeObjectRelease();
  v6 = (_QWORD **)(v2 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_searchKeys);
  swift_beginAccess();
  v7 = *v6;
  swift_bridgeObjectRetain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v6 = v7;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
LABEL_23:
    v7 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v7[2] + 1, 1, v7);
    *v6 = v7;
  }
  v15 = v7[2];
  v14 = v7[3];
  if (v15 >= v14 >> 1)
  {
    v7 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v14 > 1), v15 + 1, 1, v7);
    *v6 = v7;
  }
  v7[2] = v15 + 1;
  v16 = &v7[2 * v15];
  v16[4] = a1;
  v16[5] = a2;
  swift_endAccess();
  return swift_retain();
}

uint64_t AnnotatedCacheEntryBuilder.withSearchKeys(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    v3 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)v1 + 400);
    v4 = (uint64_t *)(swift_bridgeObjectRetain() + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      v3(v5, v6);
      swift_bridgeObjectRelease();
      swift_release();
      v4 += 2;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  return swift_retain();
}

uint64_t AnnotatedCacheEntryBuilder.withTtl(_:)(double a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_ttl;
  swift_beginAccess();
  *(double *)v3 = a1;
  *(_BYTE *)(v3 + 8) = 0;
  return swift_retain();
}

uint64_t AnnotatedCacheEntryBuilder.withUserId(_:)(uint64_t a1)
{
  return AnnotatedCacheEntryBuilder.withLastAccessedTime(_:)(a1, &demangling cache variable for type metadata for UserID?, (uint64_t (*)(_QWORD))MEMORY[0x24BE9B488], &OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_userId);
}

uint64_t type metadata accessor for AnnotatedCacheEntry(uint64_t a1)
{
  return type metadata accessor for AnnotatedCacheEntry(a1, (uint64_t *)&type metadata singleton initialization cache for AnnotatedCacheEntry);
}

uint64_t type metadata accessor for AnnotatedCacheEntryBuilder(uint64_t a1)
{
  return type metadata accessor for AnnotatedCacheEntry(a1, (uint64_t *)&type metadata singleton initialization cache for AnnotatedCacheEntryBuilder);
}

uint64_t type metadata accessor for AnnotatedCacheEntry(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t AnnotatedCacheEntryBuilder.withScore(_:)(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = v2 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_score;
  swift_beginAccess();
  *(_QWORD *)v5 = a1;
  *(_BYTE *)(v5 + 8) = a2 & 1;
  return swift_retain();
}

uint64_t AnnotatedCacheEntryBuilder.build()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  unsigned int (*v36)(char *, uint64_t, uint64_t);
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  _BYTE *v41;
  uint64_t result;
  char *v43;
  uint64_t (*v44)(char *, char *, uint64_t);
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  os_log_type_t v49;
  _BOOL4 v50;
  char *v51;
  uint64_t v52;
  uint8_t *v53;
  _BYTE *v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t (*v61)(void);
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  NSObject *v70;
  os_log_type_t v71;
  _BOOL4 v72;
  char *v73;
  uint8_t *v74;
  const char *v75;
  uint64_t v76;
  _BOOL4 v77;
  uint64_t v78;
  _BOOL4 v79;
  uint64_t v80;
  _BOOL4 v81;
  _BYTE *v82;
  void (*v83)(char *, uint64_t);
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void (*v89)(char *, char *, uint64_t);
  char *v90;
  char *v91;
  uint64_t v92;
  _QWORD *v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  int v98;
  char *v99;
  uint64_t v100;
  void (*v101)(char *, uint64_t);
  uint64_t *v102;
  uint64_t v103;
  int *v104;
  void (*v105)(char *, char *, uint64_t);
  uint64_t *v106;
  uint64_t v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  int v112;
  uint64_t v113;
  uint64_t (*v114)(char *, char *, uint64_t);
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void (*v118)(char *, char *, uint64_t);
  char *v119;
  uint64_t v120;
  char *v121;
  char *v122;
  char *v123;
  uint64_t *v124;
  char *v125;
  uint64_t v126;
  uint64_t v127;
  int v128;
  uint64_t v129;

  v124 = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UserID?);
  MEMORY[0x24BDAC7A8](v2, v3);
  v5 = (char *)&v109 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for UserID();
  v126 = *(_QWORD *)(v6 - 8);
  v127 = v6;
  v8 = MEMORY[0x24BDAC7A8](v6, v7);
  v123 = (char *)&v109 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8, v10);
  v122 = (char *)&v109 - v11;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  v14 = MEMORY[0x24BDAC7A8](v12, v13);
  v16 = (char *)&v109 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14, v17);
  v19 = (char *)&v109 - v18;
  v20 = type metadata accessor for Date();
  v21 = *(_QWORD *)(v20 - 8);
  v23 = MEMORY[0x24BDAC7A8](v20, v22);
  v125 = (char *)&v109 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = MEMORY[0x24BDAC7A8](v23, v25);
  v121 = (char *)&v109 - v27;
  v29 = MEMORY[0x24BDAC7A8](v26, v28);
  v31 = (char *)&v109 - v30;
  v33 = MEMORY[0x24BDAC7A8](v29, v32);
  v35 = (char *)&v109 - v34;
  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 176))(v33);
  v36 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48);
  if (v36(v19, 1, v20) == 1)
  {
    outlined destroy of Date?((uint64_t)v19, &demangling cache variable for type metadata for Date?);
    if (one-time initialization token for logger != -1)
      swift_once();
    v37 = type metadata accessor for Logger();
    __swift_project_value_buffer(v37, (uint64_t)static Logger.logger);
    v38 = Logger.logObject.getter();
    v39 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v38, v39))
    {
      v40 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v40 = 0;
      _os_log_impl(&dword_2401E6000, v38, v39, "Required cache entry parameter lastAccessedTime is not specified", v40, 2u);
      MEMORY[0x24268046C](v40, -1, -1);
    }

    lazy protocol witness table accessor for type LLMCacheManagerError and conformance LLMCacheManagerError();
    swift_allocError();
    *v41 = 1;
    return swift_willThrow();
  }
  v119 = v35;
  v120 = v21;
  v43 = v35;
  v44 = *(uint64_t (**)(char *, char *, uint64_t))(v21 + 32);
  v45 = v44(v43, v19, v20);
  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 200))(v45);
  v46 = v20;
  if (v36(v16, 1, v20) != 1)
  {
    v55 = v31;
    v56 = v44(v31, v16, v20);
    v57 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 248))(v56);
    if (v58)
    {
      v59 = v57;
      v60 = v58;
      v118 = (void (*)(char *, char *, uint64_t))v44;
      v61 = *(uint64_t (**)(void))(*(_QWORD *)v1 + 272);
      v62 = *(_QWORD *)(v61() + 16);
      v63 = swift_bridgeObjectRelease();
      v64 = v120;
      if (v62)
      {
        v65 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 296))(v63);
        if ((v66 & 1) != 0)
        {
          swift_bridgeObjectRelease();
          if (one-time initialization token for logger != -1)
            swift_once();
          v80 = type metadata accessor for Logger();
          __swift_project_value_buffer(v80, (uint64_t)static Logger.logger);
          v70 = Logger.logObject.getter();
          v71 = static os_log_type_t.error.getter();
          v81 = os_log_type_enabled(v70, v71);
          v73 = v119;
          if (!v81)
            goto LABEL_34;
          v74 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v74 = 0;
          v75 = "Required cache entry parameter ttl is not specified";
        }
        else
        {
          v116 = v65;
          v117 = v59;
          (*(void (**)(void))(*(_QWORD *)v1 + 320))();
          v68 = v126;
          v67 = v127;
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v126 + 48))(v5, 1, v127) != 1)
          {
            v114 = *(uint64_t (**)(char *, char *, uint64_t))(v68 + 32);
            v115 = v60;
            v84 = v122;
            v85 = v114(v122, v5, v67);
            v86 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 152))(v85);
            v110 = v87;
            v111 = v86;
            v88 = v68;
            v89 = *(void (**)(char *, char *, uint64_t))(v64 + 16);
            v90 = v121;
            v91 = v119;
            v89(v121, v119, v46);
            v92 = ((uint64_t (*)(char *, char *, uint64_t))v89)(v125, v55, v46);
            v93 = (*(_QWORD *(**)(uint64_t *__return_ptr, uint64_t))(*(_QWORD *)v1 + 224))(&v129, v92);
            v128 = v129;
            v113 = ((uint64_t (*)(_QWORD *))v61)(v93);
            v94 = v123;
            v95 = v127;
            v96 = (*(uint64_t (**)(char *, char *, uint64_t))(v88 + 16))(v123, v84, v127);
            v97 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 344))(v96);
            v112 = v98;
            v99 = v84;
            v100 = v95;
            (*(void (**)(char *, uint64_t))(v88 + 8))(v99, v95);
            v101 = *(void (**)(char *, uint64_t))(v120 + 8);
            v101(v55, v46);
            v101(v91, v46);
            v102 = v124;
            v103 = v110;
            *v124 = v111;
            v102[1] = v103;
            v104 = (int *)type metadata accessor for AnnotatedCacheEntry(0);
            v105 = v118;
            v118((char *)v102 + v104[5], v90, v46);
            v105((char *)v102 + v104[6], v125, v46);
            *((_BYTE *)v102 + v104[7]) = v128;
            v106 = (uint64_t *)((char *)v102 + v104[8]);
            v107 = v115;
            *v106 = v117;
            v106[1] = v107;
            *(uint64_t *)((char *)v102 + v104[9]) = v113;
            *(uint64_t *)((char *)v102 + v104[10]) = v116;
            result = v114((char *)v102 + v104[11], v94, v100);
            v108 = (char *)v102 + v104[12];
            *(_QWORD *)v108 = v97;
            v108[8] = v112 & 1;
            return result;
          }
          swift_bridgeObjectRelease();
          outlined destroy of Date?((uint64_t)v5, &demangling cache variable for type metadata for UserID?);
          if (one-time initialization token for logger != -1)
            swift_once();
          v69 = type metadata accessor for Logger();
          __swift_project_value_buffer(v69, (uint64_t)static Logger.logger);
          v70 = Logger.logObject.getter();
          v71 = static os_log_type_t.error.getter();
          v72 = os_log_type_enabled(v70, v71);
          v73 = v119;
          if (!v72)
          {
LABEL_34:

            lazy protocol witness table accessor for type LLMCacheManagerError and conformance LLMCacheManagerError();
            swift_allocError();
            *v82 = 1;
            swift_willThrow();
            v83 = *(void (**)(char *, uint64_t))(v64 + 8);
            v83(v55, v46);
            return ((uint64_t (*)(char *, uint64_t))v83)(v73, v46);
          }
          v74 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v74 = 0;
          v75 = "Required cache entry parameter userId is not specified";
        }
      }
      else
      {
        swift_bridgeObjectRelease();
        if (one-time initialization token for logger != -1)
          swift_once();
        v78 = type metadata accessor for Logger();
        __swift_project_value_buffer(v78, (uint64_t)static Logger.logger);
        v70 = Logger.logObject.getter();
        v71 = static os_log_type_t.error.getter();
        v79 = os_log_type_enabled(v70, v71);
        v73 = v119;
        if (!v79)
          goto LABEL_34;
        v74 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v74 = 0;
        v75 = "Required cache entry parameter searchKeys should have at least one value";
      }
    }
    else
    {
      v64 = v120;
      if (one-time initialization token for logger != -1)
        swift_once();
      v76 = type metadata accessor for Logger();
      __swift_project_value_buffer(v76, (uint64_t)static Logger.logger);
      v70 = Logger.logObject.getter();
      v71 = static os_log_type_t.error.getter();
      v77 = os_log_type_enabled(v70, v71);
      v73 = v119;
      if (!v77)
        goto LABEL_34;
      v74 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v74 = 0;
      v75 = "Required cache entry parameter llmOutput is not specified";
    }
    _os_log_impl(&dword_2401E6000, v70, v71, v75, v74, 2u);
    MEMORY[0x24268046C](v74, -1, -1);
    goto LABEL_34;
  }
  outlined destroy of Date?((uint64_t)v16, &demangling cache variable for type metadata for Date?);
  if (one-time initialization token for logger != -1)
    swift_once();
  v47 = type metadata accessor for Logger();
  __swift_project_value_buffer(v47, (uint64_t)static Logger.logger);
  v48 = Logger.logObject.getter();
  v49 = static os_log_type_t.error.getter();
  v50 = os_log_type_enabled(v48, v49);
  v51 = v119;
  v52 = v120;
  if (v50)
  {
    v53 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v53 = 0;
    _os_log_impl(&dword_2401E6000, v48, v49, "Required cache entry parameter lastCreatedTime is not specified", v53, 2u);
    MEMORY[0x24268046C](v53, -1, -1);
  }

  lazy protocol witness table accessor for type LLMCacheManagerError and conformance LLMCacheManagerError();
  swift_allocError();
  *v54 = 1;
  swift_willThrow();
  return (*(uint64_t (**)(char *, uint64_t))(v52 + 8))(v51, v20);
}

uint64_t AnnotatedCacheEntryBuilder.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  outlined destroy of Date?(v0 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_lastAccessedTime, &demangling cache variable for type metadata for Date?);
  outlined destroy of Date?(v0 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_lastCreatedTime, &demangling cache variable for type metadata for Date?);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of Date?(v0 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_userId, &demangling cache variable for type metadata for UserID?);
  return v0;
}

uint64_t AnnotatedCacheEntryBuilder.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  outlined destroy of Date?(v0 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_lastAccessedTime, &demangling cache variable for type metadata for Date?);
  outlined destroy of Date?(v0 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_lastCreatedTime, &demangling cache variable for type metadata for Date?);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of Date?(v0 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_userId, &demangling cache variable for type metadata for UserID?);
  return swift_deallocClassInstance();
}

uint64_t specialized static AnnotatedCacheEntry.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  char v5;
  uint64_t result;
  int *v7;
  uint64_t v8;
  int v9;
  int v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  char v19;
  uint64_t v20;
  double *v21;
  char v22;
  double *v23;
  char v24;

  if (*a1 != *a2 || a1[1] != a2[1])
  {
    v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    result = 0;
    if ((v5 & 1) == 0)
      return result;
  }
  v7 = (int *)type metadata accessor for AnnotatedCacheEntry(0);
  if ((static Date.== infix(_:_:)() & 1) == 0 || (static Date.== infix(_:_:)() & 1) == 0)
    return 0;
  v8 = v7[7];
  v9 = *((unsigned __int8 *)a1 + v8);
  v10 = *((unsigned __int8 *)a2 + v8);
  if (v9)
  {
    if (v9 == 1)
    {
      v11 = 0xE400000000000000;
      v12 = 1819047270;
      if (v10)
        goto LABEL_11;
LABEL_17:
      v13 = 0xE400000000000000;
      if (v12 != 1953718630)
        goto LABEL_22;
      goto LABEL_20;
    }
    v11 = 0x800000024020DCF0;
    v12 = 0xD000000000000012;
    if (!v10)
      goto LABEL_17;
  }
  else
  {
    v11 = 0xE400000000000000;
    v12 = 1953718630;
    if (!v10)
      goto LABEL_17;
  }
LABEL_11:
  if (v10 == 1)
  {
    v13 = 0xE400000000000000;
    if (v12 != 1819047270)
      goto LABEL_22;
  }
  else
  {
    v13 = 0x800000024020DCF0;
    if (v12 != 0xD000000000000012)
      goto LABEL_22;
  }
LABEL_20:
  if (v11 == v13)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_23;
  }
LABEL_22:
  v14 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = 0;
  if ((v14 & 1) == 0)
    return result;
LABEL_23:
  v15 = v7[8];
  v16 = *(_QWORD *)((char *)a1 + v15);
  v17 = *(_QWORD *)((char *)a1 + v15 + 8);
  v18 = (_QWORD *)((char *)a2 + v15);
  if (v16 == *v18 && v17 == v18[1]
    || (v19 = _stringCompareWithSmolCheck(_:_:expecting:)(), result = 0, (v19 & 1) != 0))
  {
    if ((specialized static Array<A>.== infix(_:_:)(*(_QWORD **)((char *)a1 + v7[9]), *(_QWORD **)((char *)a2 + v7[9])) & 1) == 0
      || *(double *)((char *)a1 + v7[10]) != *(double *)((char *)a2 + v7[10])
      || (static UserID.== infix(_:_:)() & 1) == 0)
    {
      return 0;
    }
    v20 = v7[12];
    v21 = (double *)((char *)a1 + v20);
    v22 = *((_BYTE *)a1 + v20 + 8);
    v23 = (double *)((char *)a2 + v20);
    v24 = *((_BYTE *)a2 + v20 + 8);
    if ((v22 & 1) != 0)
    {
      if ((v24 & 1) == 0)
        return 0;
    }
    else
    {
      if (*v21 != *v23)
        v24 = 1;
      if ((v24 & 1) != 0)
        return 0;
    }
    return 1;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type AnnotatedCacheEntry.CodingKeys and conformance AnnotatedCacheEntry.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type AnnotatedCacheEntry.CodingKeys and conformance AnnotatedCacheEntry.CodingKeys;
  if (!lazy protocol witness table cache variable for type AnnotatedCacheEntry.CodingKeys and conformance AnnotatedCacheEntry.CodingKeys)
  {
    result = MEMORY[0x2426803DC](&protocol conformance descriptor for AnnotatedCacheEntry.CodingKeys, &unk_251086280);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AnnotatedCacheEntry.CodingKeys and conformance AnnotatedCacheEntry.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type AnnotatedCacheEntry.CodingKeys and conformance AnnotatedCacheEntry.CodingKeys;
  if (!lazy protocol witness table cache variable for type AnnotatedCacheEntry.CodingKeys and conformance AnnotatedCacheEntry.CodingKeys)
  {
    result = MEMORY[0x2426803DC](&protocol conformance descriptor for AnnotatedCacheEntry.CodingKeys, &unk_251086280);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AnnotatedCacheEntry.CodingKeys and conformance AnnotatedCacheEntry.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type AnnotatedCacheEntry.CodingKeys and conformance AnnotatedCacheEntry.CodingKeys;
  if (!lazy protocol witness table cache variable for type AnnotatedCacheEntry.CodingKeys and conformance AnnotatedCacheEntry.CodingKeys)
  {
    result = MEMORY[0x2426803DC](&protocol conformance descriptor for AnnotatedCacheEntry.CodingKeys, &unk_251086280);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AnnotatedCacheEntry.CodingKeys and conformance AnnotatedCacheEntry.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type AnnotatedCacheEntry.CodingKeys and conformance AnnotatedCacheEntry.CodingKeys;
  if (!lazy protocol witness table cache variable for type AnnotatedCacheEntry.CodingKeys and conformance AnnotatedCacheEntry.CodingKeys)
  {
    result = MEMORY[0x2426803DC](&protocol conformance descriptor for AnnotatedCacheEntry.CodingKeys, &unk_251086280);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AnnotatedCacheEntry.CodingKeys and conformance AnnotatedCacheEntry.CodingKeys);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2426803D0](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type [String] and conformance <A> [A](unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String]);
    v8 = a2;
    result = MEMORY[0x2426803DC](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t outlined init with copy of Date?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24020A430@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 152))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_24020A464(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(_QWORD **)a1 + 176))();
}

uint64_t sub_24020A48C(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return key path setter for AnnotatedCacheEntryBuilder.lastAccessedTime : AnnotatedCacheEntryBuilder(a1, a2, a3, a4, &demangling cache variable for type metadata for Date?, &OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_lastAccessedTime);
}

uint64_t sub_24020A4B0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(_QWORD **)a1 + 200))();
}

uint64_t sub_24020A4D8(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return key path setter for AnnotatedCacheEntryBuilder.lastAccessedTime : AnnotatedCacheEntryBuilder(a1, a2, a3, a4, &demangling cache variable for type metadata for Date?, &OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_lastCreatedTime);
}

_QWORD *sub_24020A4FC@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  _QWORD *result;
  uint64_t v4;

  result = (*(_QWORD *(**)(uint64_t *__return_ptr))(**(_QWORD **)a1 + 224))(&v4);
  *a2 = v4;
  return result;
}

uint64_t sub_24020A53C(char *a1, _QWORD *a2)
{
  char v2;
  _BYTE *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_BYTE *)(*a2 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_namespace);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t sub_24020A588@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 248))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_24020A5BC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 272))();
  *a2 = result;
  return result;
}

uint64_t sub_24020A5F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v4;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 296))();
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_24020A628(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_12Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_ttl);
}

uint64_t sub_24020A634(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(_QWORD **)a1 + 320))();
}

uint64_t sub_24020A65C(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return key path setter for AnnotatedCacheEntryBuilder.lastAccessedTime : AnnotatedCacheEntryBuilder(a1, a2, a3, a4, &demangling cache variable for type metadata for UserID?, &OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_userId);
}

uint64_t sub_24020A680@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v4;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 344))();
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_24020A6B8(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_12Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_score);
}

uint64_t keypath_set_12Tm(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t result;

  v5 = *a1;
  v6 = *((_BYTE *)a1 + 8);
  v7 = *a2 + *a5;
  result = swift_beginAccess();
  *(_QWORD *)v7 = v5;
  *(_BYTE *)(v7 + 8) = v6;
  return result;
}

char *initializeBufferWithCopyOfBuffer for AnnotatedCacheEntry(char *a1, char *a2, int *a3)
{
  char *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  void (*v22)(char *, char *, uint64_t);
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v26 = *(_QWORD *)a2;
    *(_QWORD *)v4 = *(_QWORD *)a2;
    v4 = (char *)(v26 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = *((_QWORD *)a2 + 1);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *((_QWORD *)a1 + 1) = v7;
    v8 = a3[5];
    v9 = &a1[v8];
    v10 = &a2[v8];
    v11 = type metadata accessor for Date();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v12(&v4[a3[6]], &a2[a3[6]], v11);
    v13 = a3[8];
    v4[a3[7]] = a2[a3[7]];
    v14 = &v4[v13];
    v15 = &a2[v13];
    v16 = *((_QWORD *)v15 + 1);
    *(_QWORD *)v14 = *(_QWORD *)v15;
    *((_QWORD *)v14 + 1) = v16;
    v17 = a3[10];
    *(_QWORD *)&v4[a3[9]] = *(_QWORD *)&a2[a3[9]];
    *(_QWORD *)&v4[v17] = *(_QWORD *)&a2[v17];
    v18 = a3[11];
    v19 = &v4[v18];
    v20 = &a2[v18];
    v21 = type metadata accessor for UserID();
    v22 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v22(v19, v20, v21);
    v23 = a3[12];
    v24 = &v4[v23];
    v25 = &a2[v23];
    *(_QWORD *)v24 = *(_QWORD *)v25;
    v24[8] = v25[8];
  }
  return v4;
}

uint64_t destroy for AnnotatedCacheEntry(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;

  swift_bridgeObjectRelease();
  v4 = a1 + a2[5];
  v5 = type metadata accessor for Date();
  v6 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v6(v4, v5);
  v6(a1 + a2[6], v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v7 = a1 + a2[11];
  v8 = type metadata accessor for UserID();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
}

char *initializeWithCopy for AnnotatedCacheEntry(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  void (*v21)(char *, char *, uint64_t);
  uint64_t v22;
  char *v23;
  char *v24;

  v6 = *((_QWORD *)a2 + 1);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = v6;
  v7 = a3[5];
  v8 = &a1[v7];
  v9 = &a2[v7];
  v10 = type metadata accessor for Date();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  v11(&a1[a3[6]], &a2[a3[6]], v10);
  v12 = a3[8];
  a1[a3[7]] = a2[a3[7]];
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = *((_QWORD *)v14 + 1);
  *(_QWORD *)v13 = *(_QWORD *)v14;
  *((_QWORD *)v13 + 1) = v15;
  v16 = a3[10];
  *(_QWORD *)&a1[a3[9]] = *(_QWORD *)&a2[a3[9]];
  *(_QWORD *)&a1[v16] = *(_QWORD *)&a2[v16];
  v17 = a3[11];
  v18 = &a1[v17];
  v19 = &a2[v17];
  v20 = type metadata accessor for UserID();
  v21 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v21(v18, v19, v20);
  v22 = a3[12];
  v23 = &a1[v22];
  v24 = &a2[v22];
  *(_QWORD *)v23 = *(_QWORD *)v24;
  v23[8] = v24[8];
  return a1;
}

char *assignWithCopy for AnnotatedCacheEntry(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  char v21;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = *((_QWORD *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = type metadata accessor for Date();
  v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24);
  v10(v7, v8, v9);
  v10(&a1[a3[6]], &a2[a3[6]], v9);
  a1[a3[7]] = a2[a3[7]];
  v11 = a3[8];
  v12 = &a1[v11];
  v13 = &a2[v11];
  *(_QWORD *)v12 = *(_QWORD *)v13;
  *((_QWORD *)v12 + 1) = *((_QWORD *)v13 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)&a1[a3[9]] = *(_QWORD *)&a2[a3[9]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)&a1[a3[10]] = *(_QWORD *)&a2[a3[10]];
  v14 = a3[11];
  v15 = &a1[v14];
  v16 = &a2[v14];
  v17 = type metadata accessor for UserID();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 24))(v15, v16, v17);
  v18 = a3[12];
  v19 = &a1[v18];
  v20 = &a2[v18];
  v21 = v20[8];
  *(_QWORD *)v19 = *(_QWORD *)v20;
  v19[8] = v21;
  return a1;
}

char *initializeWithTake for AnnotatedCacheEntry(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = type metadata accessor for Date();
  v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  v10(&a1[a3[6]], &a2[a3[6]], v9);
  v11 = a3[8];
  a1[a3[7]] = a2[a3[7]];
  *(_OWORD *)&a1[v11] = *(_OWORD *)&a2[v11];
  v12 = a3[10];
  *(_QWORD *)&a1[a3[9]] = *(_QWORD *)&a2[a3[9]];
  *(_QWORD *)&a1[v12] = *(_QWORD *)&a2[v12];
  v13 = a3[11];
  v14 = &a1[v13];
  v15 = &a2[v13];
  v16 = type metadata accessor for UserID();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v14, v15, v16);
  v17 = a3[12];
  v18 = &a1[v17];
  v19 = &a2[v17];
  *(_QWORD *)v18 = *(_QWORD *)v19;
  v18[8] = v19[8];
  return a1;
}

char *assignWithTake for AnnotatedCacheEntry(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  char *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;

  v6 = *((_QWORD *)a2 + 1);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = v6;
  swift_bridgeObjectRelease();
  v7 = a3[5];
  v8 = &a1[v7];
  v9 = &a2[v7];
  v10 = type metadata accessor for Date();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40);
  v11(v8, v9, v10);
  v11(&a1[a3[6]], &a2[a3[6]], v10);
  v12 = a3[8];
  a1[a3[7]] = a2[a3[7]];
  v13 = &a1[v12];
  v14 = (uint64_t *)&a2[v12];
  v16 = *v14;
  v15 = v14[1];
  *(_QWORD *)v13 = v16;
  *((_QWORD *)v13 + 1) = v15;
  swift_bridgeObjectRelease();
  *(_QWORD *)&a1[a3[9]] = *(_QWORD *)&a2[a3[9]];
  swift_bridgeObjectRelease();
  v17 = a3[11];
  *(_QWORD *)&a1[a3[10]] = *(_QWORD *)&a2[a3[10]];
  v18 = &a1[v17];
  v19 = &a2[v17];
  v20 = type metadata accessor for UserID();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 40))(v18, v19, v20);
  v21 = a3[12];
  v22 = &a1[v21];
  v23 = &a2[v21];
  *(_QWORD *)v22 = *(_QWORD *)v23;
  v22[8] = v23[8];
  return a1;
}

uint64_t getEnumTagSinglePayload for AnnotatedCacheEntry()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24020ADB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = type metadata accessor for Date();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = *(int *)(a3 + 20);
    }
    else
    {
      v10 = type metadata accessor for UserID();
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a3 + 44);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1 + v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for AnnotatedCacheEntry()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_24020AE60(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v8 = type metadata accessor for Date();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = *(int *)(a4 + 20);
    }
    else
    {
      v10 = type metadata accessor for UserID();
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a4 + 44);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5 + v11, a2, a2, v10);
  }
  return result;
}

uint64_t type metadata completion function for AnnotatedCacheEntry()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = type metadata accessor for Date();
  if (v1 <= 0x3F)
  {
    result = type metadata accessor for UserID();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t ObjC metadata update function for AnnotatedCacheEntryBuilder()
{
  return type metadata accessor for AnnotatedCacheEntryBuilder(0);
}

void type metadata completion function for AnnotatedCacheEntryBuilder()
{
  unint64_t v0;
  unint64_t v1;

  type metadata accessor for Date?(319, &lazy cache variable for type metadata for Date?, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
  if (v0 <= 0x3F)
  {
    type metadata accessor for Date?(319, &lazy cache variable for type metadata for UserID?, (void (*)(uint64_t))MEMORY[0x24BE9B488]);
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for AnnotatedCacheEntryBuilder()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AnnotatedCacheEntryBuilder.id.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of AnnotatedCacheEntryBuilder.lastAccessedTime.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of AnnotatedCacheEntryBuilder.lastCreatedTime.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of AnnotatedCacheEntryBuilder.namespace.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of AnnotatedCacheEntryBuilder.llmOutput.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of AnnotatedCacheEntryBuilder.searchKeys.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 272))();
}

uint64_t dispatch thunk of AnnotatedCacheEntryBuilder.ttl.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 296))();
}

uint64_t dispatch thunk of AnnotatedCacheEntryBuilder.userId.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 320))();
}

uint64_t dispatch thunk of AnnotatedCacheEntryBuilder.score.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 344))();
}

uint64_t dispatch thunk of AnnotatedCacheEntryBuilder.__allocating_init(id:namespace:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 368))();
}

uint64_t dispatch thunk of AnnotatedCacheEntryBuilder.withLastAccessedTime(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 376))();
}

uint64_t dispatch thunk of AnnotatedCacheEntryBuilder.withLastCreatedTime(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 384))();
}

uint64_t dispatch thunk of AnnotatedCacheEntryBuilder.withLlmOutput(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 392))();
}

uint64_t dispatch thunk of AnnotatedCacheEntryBuilder.appendSearchKey(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 400))();
}

uint64_t dispatch thunk of AnnotatedCacheEntryBuilder.withSearchKeys(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 408))();
}

uint64_t dispatch thunk of AnnotatedCacheEntryBuilder.withTtl(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 416))();
}

uint64_t dispatch thunk of AnnotatedCacheEntryBuilder.withUserId(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 424))();
}

uint64_t dispatch thunk of AnnotatedCacheEntryBuilder.withScore(_:)(uint64_t a1, char a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)v2 + 432))(a1, a2 & 1);
}

uint64_t dispatch thunk of AnnotatedCacheEntryBuilder.build()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 440))();
}

void type metadata accessor for Date?(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = type metadata accessor for Optional();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t getEnumTagSinglePayload for AnnotatedCacheEntry.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF8)
    goto LABEL_17;
  if (a2 + 8 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 8) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 8;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 8;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 8;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 9;
  v8 = v6 - 9;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for AnnotatedCacheEntry.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 8 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 8) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF8)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF7)
    return ((uint64_t (*)(void))((char *)&loc_24020B300 + 4 * byte_24020D85E[v4]))();
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_24020B334 + 4 * byte_24020D859[v4]))();
}

uint64_t sub_24020B334(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24020B33C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24020B344);
  return result;
}

uint64_t sub_24020B350(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24020B358);
  *(_BYTE *)result = a2 + 8;
  return result;
}

uint64_t sub_24020B35C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24020B364(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void *type metadata accessor for AnnotatedCacheEntry.CodingKeys()
{
  return &unk_251086280;
}

uint64_t specialized AnnotatedCacheEntry.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000024020E4B0
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x616572437473616CLL && a2 == 0xEF656D6954646574
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x63617073656D616ELL && a2 == 0xE900000000000065
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x757074754F6D6C6CLL && a2 == 0xE900000000000074
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x654B686372616573 && a2 == 0xEA00000000007379
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 7107700 && a2 == 0xE300000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x644972657375 && a2 == 0xE600000000000000
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x65726F6373 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else
  {
    v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 8;
    else
      return 9;
  }
}

uint64_t InsertRequest.init(searchKey:llmOutput:loggingTraceId:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  char *v7;
  uint64_t v8;

  *a6 = a1;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;
  v7 = (char *)a6 + *(int *)(type metadata accessor for InsertRequest() + 24);
  v8 = type metadata accessor for UUID();
  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v7, a5, v8);
}

uint64_t type metadata accessor for InsertRequest()
{
  uint64_t result;

  result = type metadata singleton initialization cache for InsertRequest;
  if (!type metadata singleton initialization cache for InsertRequest)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t InsertRequest.searchKey.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InsertRequest.llmOutput.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InsertRequest.loggingTraceId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for InsertRequest() + 24);
  v4 = type metadata accessor for UUID();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t *initializeBufferWithCopyOfBuffer for InsertRequest(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v12 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    v7 = *(int *)(a3 + 24);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = type metadata accessor for UUID();
    v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11(v8, v9, v10);
  }
  return v3;
}

uint64_t destroy for InsertRequest(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = type metadata accessor for UUID();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *initializeWithCopy for InsertRequest(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  v6 = *(int *)(a3 + 24);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for UUID();
  v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  return a1;
}

_QWORD *assignWithCopy for InsertRequest(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 24);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for UUID();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *initializeWithTake for InsertRequest(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(int *)(a3 + 24);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = type metadata accessor for UUID();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

_QWORD *assignWithTake for InsertRequest(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  v8 = *(int *)(a3 + 24);
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = type metadata accessor for UUID();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for InsertRequest()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24020BC40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = type metadata accessor for UUID();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 24), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for InsertRequest()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_24020BCC8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v7 = type metadata accessor for UUID();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata completion function for InsertRequest()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for UUID();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *DBColumns.userIdColumnName.unsafeMutableAddressor()
{
  return &static DBColumns.userIdColumnName;
}

uint64_t static DBColumns.userIdColumnName.getter()
{
  return 6580597;
}

void *DBColumns.namespaceColumnName.unsafeMutableAddressor()
{
  return &static DBColumns.namespaceColumnName;
}

uint64_t static DBColumns.namespaceColumnName.getter()
{
  return 29550;
}

void *DBColumns.lastAccessedTimeColumnName.unsafeMutableAddressor()
{
  return &static DBColumns.lastAccessedTimeColumnName;
}

uint64_t static DBColumns.lastAccessedTimeColumnName.getter()
{
  return 7627116;
}

void *DBColumns.ttlColumnName.unsafeMutableAddressor()
{
  return &static DBColumns.ttlColumnName;
}

uint64_t static DBColumns.ttlColumnName.getter()
{
  return 7107700;
}

void *DBColumns.rawSearchKeyColumnName.unsafeMutableAddressor()
{
  return &static DBColumns.rawSearchKeyColumnName;
}

uint64_t static DBColumns.rawSearchKeyColumnName.getter()
{
  return 112;
}

ValueMetadata *type metadata accessor for DBColumns()
{
  return &type metadata for DBColumns;
}

uint64_t LLMCacheManagerFeatureFlags.isEnabled.getter()
{
  char *v0;
  char v1;
  char v2;
  _BYTE v4[24];
  ValueMetadata *v5;
  unint64_t v6;

  v1 = *v0;
  swift_beginAccess();
  if (static LLMCacheManagerFeatureFlags.forceEnabled == 2)
  {
    v5 = &type metadata for LLMCacheManagerFeatureFlags;
    v6 = lazy protocol witness table accessor for type LLMCacheManagerFeatureFlags and conformance LLMCacheManagerFeatureFlags();
    v4[0] = v1;
    v2 = isFeatureEnabled(_:)();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v4);
  }
  else
  {
    v2 = static LLMCacheManagerFeatureFlags.forceEnabled & 1;
  }
  return v2 & 1;
}

char *LLMCacheManagerFeatureFlags.forceEnabled.unsafeMutableAddressor()
{
  return &static LLMCacheManagerFeatureFlags.forceEnabled;
}

uint64_t static LLMCacheManagerFeatureFlags.forceEnabled.getter()
{
  swift_beginAccess();
  return static LLMCacheManagerFeatureFlags.forceEnabled;
}

uint64_t static LLMCacheManagerFeatureFlags.forceEnabled.setter(char a1)
{
  uint64_t result;

  result = swift_beginAccess();
  static LLMCacheManagerFeatureFlags.forceEnabled = a1;
  return result;
}

uint64_t (*static LLMCacheManagerFeatureFlags.forceEnabled.modify())()
{
  swift_beginAccess();
  return static LLMCacheManagerFeatureFlags.forceEnabled.modify;
}

const char *LLMCacheManagerFeatureFlags.domain.getter()
{
  return "SiriCacheManager";
}

const char *LLMCacheManagerFeatureFlags.feature.getter()
{
  _BYTE *v0;
  const char *v1;

  v1 = "FullPlanner";
  if (*v0 != 1)
    v1 = "ResponseGeneration";
  if (*v0)
    return v1;
  else
    return "FastPlanner";
}

BOOL static LLMCacheManagerFeatureFlags.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void LLMCacheManagerFeatureFlags.hash(into:)()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int LLMCacheManagerFeatureFlags.hashValue.getter()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

const char *protocol witness for FeatureFlagsKey.domain.getter in conformance LLMCacheManagerFeatureFlags()
{
  return "SiriCacheManager";
}

const char *protocol witness for FeatureFlagsKey.feature.getter in conformance LLMCacheManagerFeatureFlags()
{
  _BYTE *v0;
  const char *v1;

  v1 = "FullPlanner";
  if (*v0 != 1)
    v1 = "ResponseGeneration";
  if (*v0)
    return v1;
  else
    return "FastPlanner";
}

uint64_t storeEnumTagSinglePayload for LLMCacheManagerFeatureFlags(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24020C16C + 4 * byte_24020DBB5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_24020C1A0 + 4 * asc_24020DBB0[v4]))();
}

uint64_t sub_24020C1A0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24020C1A8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24020C1B0);
  return result;
}

uint64_t sub_24020C1BC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24020C1C4);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_24020C1C8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24020C1D0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for LLMCacheManagerFeatureFlags()
{
  return &type metadata for LLMCacheManagerFeatureFlags;
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t dispatch thunk of JSONEncoder.encode<A>(_:)()
{
  return MEMORY[0x24BDCB3B8]();
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

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t type metadata accessor for URL.DirectoryHint()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t URL.absoluteString.getter()
{
  return MEMORY[0x24BDCD820]();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
  MEMORY[0x24BDCD8D0](retstr);
}

Swift::String __swiftcall URL.path(percentEncoded:)(Swift::Bool percentEncoded)
{
  uint64_t v1;
  void *v2;
  Swift::String result;

  v1 = MEMORY[0x24BDCD9E8](percentEncoded);
  result._object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

uint64_t URL.appending<A>(component:directoryHint:)()
{
  return MEMORY[0x24BDCDAA8]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x24BDCDAC0]();
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

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t Date.addingTimeInterval(_:)()
{
  return MEMORY[0x24BDCE468]();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)MEMORY[0x24BDCE5D8]();
}

uint64_t static Date.> infix(_:_:)()
{
  return MEMORY[0x24BDCE5E8]();
}

uint64_t static Date.< infix(_:_:)()
{
  return MEMORY[0x24BDCE5F0]();
}

uint64_t static Date.== infix(_:_:)()
{
  return MEMORY[0x24BDCE858]();
}

uint64_t static Date.now.getter()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t UUID.uuidString.getter()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t UUID.init()()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t type metadata accessor for UUID()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t isFeatureEnabled(_:)()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t type metadata accessor for VectorDatabaseError()
{
  return MEMORY[0x24BEBFC40]();
}

uint64_t VectorDatabaseClient.init(config:)()
{
  return MEMORY[0x24BEBFC88]();
}

uint64_t dispatch thunk of VectorDatabaseClient.delete(identifiers:)()
{
  return MEMORY[0x24BEBFC98]();
}

uint64_t dispatch thunk of VectorDatabaseClient.insert(assets:)()
{
  return MEMORY[0x24BEBFCA0]();
}

uint64_t dispatch thunk of VectorDatabaseClient.search(byVector:attributeFilters:limit:batchSize:numConcurrentReaders:)()
{
  return MEMORY[0x24BEBFCA8]();
}

uint64_t dispatch thunk of VectorDatabaseClient.warmup(numConcurrentReaders:)()
{
  return MEMORY[0x24BEBFCC0]();
}

uint64_t dispatch thunk of VectorDatabaseClient.cooldown()()
{
  return MEMORY[0x24BEBFCC8]();
}

uint64_t dispatch thunk of VectorDatabaseClient.deleteAll()()
{
  return MEMORY[0x24BEBFCD0]();
}

uint64_t dispatch thunk of VectorDatabaseClient.getAssets(identifiers:attributeFilters:pagination:)()
{
  return MEMORY[0x24BEBFCE0]();
}

uint64_t type metadata accessor for VectorDatabaseClient()
{
  return MEMORY[0x24BEBFCE8]();
}

uint64_t VectorDatabaseConfig.init(baseDirectory:distanceMetric:filterableAttributes:dimension:includePayload:numberOfProbes:averagePartitionSize:batchSize:batchFactor:tradeOffParameterBetweenClusteringAndBalance:dataType:)()
{
  return MEMORY[0x24BEBFCF8]();
}

uint64_t type metadata accessor for VectorDatabaseConfig()
{
  return MEMORY[0x24BEBFD38]();
}

uint64_t type metadata accessor for VectorDatabaseMetric()
{
  return MEMORY[0x24BEBFD70]();
}

uint64_t VectorDatabaseResult.assetIdentifier.getter()
{
  return MEMORY[0x24BEBFD88]();
}

uint64_t VectorDatabaseResult.value.getter()
{
  return MEMORY[0x24BEBFD90]();
}

uint64_t VectorDatabaseResult.payload.getter()
{
  return MEMORY[0x24BEBFD98]();
}

uint64_t type metadata accessor for VectorDatabaseResult()
{
  return MEMORY[0x24BEBFDA0]();
}

uint64_t type metadata accessor for VectorDatabaseDataType()
{
  return MEMORY[0x24BEBFDC0]();
}

uint64_t VectorDatabaseAttribute.init(name:columnType:)()
{
  return MEMORY[0x24BEBFDF0]();
}

uint64_t type metadata accessor for VectorDatabaseAttribute()
{
  return MEMORY[0x24BEBFE00]();
}

uint64_t type metadata accessor for ColumnType()
{
  return MEMORY[0x24BEBFE38]();
}

uint64_t type metadata accessor for DatabaseValue()
{
  return MEMORY[0x24BEBFE58]();
}

uint64_t Asset.init(identifier:vectors:attributes:payload:)()
{
  return MEMORY[0x24BEBFE68]();
}

uint64_t Asset.identifier.getter()
{
  return MEMORY[0x24BEBFE78]();
}

uint64_t Asset.payload.getter()
{
  return MEMORY[0x24BEBFE90]();
}

uint64_t type metadata accessor for Asset()
{
  return MEMORY[0x24BEBFEA0]();
}

uint64_t UserID.sharedUserId.getter()
{
  return MEMORY[0x24BE9B470]();
}

uint64_t static UserID.defaultUserId.getter()
{
  return MEMORY[0x24BE9B478]();
}

uint64_t static UserID.== infix(_:_:)()
{
  return MEMORY[0x24BE9B480]();
}

uint64_t type metadata accessor for UserID()
{
  return MEMORY[0x24BE9B488]();
}

uint64_t type metadata accessor for Library.Streams.LLMCache.CacheManagerTelemetry()
{
  return MEMORY[0x24BE598A0]();
}

uint64_t static StreamResource.source()()
{
  return MEMORY[0x24BE59A88]();
}

uint64_t type metadata accessor for CacheManagerError.ErrorType()
{
  return MEMORY[0x24BE59AB8]();
}

uint64_t CacheManagerError.errorType.setter()
{
  return MEMORY[0x24BE59AC8]();
}

uint64_t CacheManagerError.init()()
{
  return MEMORY[0x24BE59AD0]();
}

uint64_t type metadata accessor for CacheManagerError()
{
  return MEMORY[0x24BE59AD8]();
}

uint64_t CacheManagerInsert.Ended.exists.setter()
{
  return MEMORY[0x24BE59AE8]();
}

uint64_t CacheManagerInsert.Ended.init()()
{
  return MEMORY[0x24BE59AF0]();
}

uint64_t CacheManagerInsert.Failed.reason.setter()
{
  return MEMORY[0x24BE59B00]();
}

uint64_t CacheManagerInsert.Failed.init()()
{
  return MEMORY[0x24BE59B08]();
}

uint64_t type metadata accessor for CacheManagerInsert.Failed()
{
  return MEMORY[0x24BE59B10]();
}

uint64_t CacheManagerInsert.Started.exists.setter()
{
  return MEMORY[0x24BE59B20]();
}

uint64_t CacheManagerInsert.Started.init()()
{
  return MEMORY[0x24BE59B28]();
}

uint64_t type metadata accessor for CacheManagerInsert()
{
  return MEMORY[0x24BE59B38]();
}

uint64_t type metadata accessor for CacheManagerSearch.CacheManagerSearchStrategy()
{
  return MEMORY[0x24BE59B50]();
}

uint64_t CacheManagerSearch.Ended.resultCount.setter()
{
  return MEMORY[0x24BE59B60]();
}

uint64_t CacheManagerSearch.Ended.searchStrategy.setter()
{
  return MEMORY[0x24BE59B68]();
}

uint64_t CacheManagerSearch.Ended.lowestMatchScore.setter()
{
  return MEMORY[0x24BE59B70]();
}

uint64_t CacheManagerSearch.Ended.highestMatchScore.setter()
{
  return MEMORY[0x24BE59B78]();
}

uint64_t CacheManagerSearch.Ended.init()()
{
  return MEMORY[0x24BE59B80]();
}

uint64_t type metadata accessor for CacheManagerSearch.Ended()
{
  return MEMORY[0x24BE59B88]();
}

uint64_t CacheManagerSearch.Failed.reason.setter()
{
  return MEMORY[0x24BE59B98]();
}

uint64_t CacheManagerSearch.Failed.init()()
{
  return MEMORY[0x24BE59BA0]();
}

uint64_t type metadata accessor for CacheManagerSearch.Failed()
{
  return MEMORY[0x24BE59BA8]();
}

uint64_t CacheManagerSearch.Started.exists.setter()
{
  return MEMORY[0x24BE59BB8]();
}

uint64_t CacheManagerSearch.Started.init()()
{
  return MEMORY[0x24BE59BC0]();
}

uint64_t type metadata accessor for CacheManagerSearch()
{
  return MEMORY[0x24BE59BD0]();
}

uint64_t type metadata accessor for CacheManagerTarget()
{
  return MEMORY[0x24BE59BF0]();
}

uint64_t static MonotonicTimestamp.nowForSuspendingClock()()
{
  return MEMORY[0x24BE59C10]();
}

uint64_t type metadata accessor for MonotonicTimestamp()
{
  return MEMORY[0x24BE59C38]();
}

uint64_t LLMCacheManagerTelemetry.eventMetadata.setter()
{
  return MEMORY[0x24BE59C88]();
}

uint64_t LLMCacheManagerTelemetry.writeTimestamp.getter()
{
  return MEMORY[0x24BE59C90]();
}

uint64_t LLMCacheManagerTelemetry.writeTimestamp.setter()
{
  return MEMORY[0x24BE59C98]();
}

uint64_t LLMCacheManagerTelemetry.monotonicTimestamp.setter()
{
  return MEMORY[0x24BE59CA0]();
}

uint64_t LLMCacheManagerTelemetry.target.setter()
{
  return MEMORY[0x24BE59CA8]();
}

uint64_t LLMCacheManagerTelemetry.init()()
{
  return MEMORY[0x24BE59CB0]();
}

uint64_t type metadata accessor for LLMCacheManagerTelemetry()
{
  return MEMORY[0x24BE59CB8]();
}

uint64_t type metadata accessor for CacheManagerRequestInvocation.CacheManagerNamespace()
{
  return MEMORY[0x24BE59CD8]();
}

uint64_t CacheManagerRequestInvocation.clientTraceId.setter()
{
  return MEMORY[0x24BE59CE8]();
}

uint64_t CacheManagerRequestInvocation.namespace.setter()
{
  return MEMORY[0x24BE59CF0]();
}

uint64_t CacheManagerRequestInvocation.init()()
{
  return MEMORY[0x24BE59CF8]();
}

uint64_t type metadata accessor for CacheManagerRequestInvocation()
{
  return MEMORY[0x24BE59D00]();
}

uint64_t CacheManagerTelemetryEventMetadata.cacheManagerId.setter()
{
  return MEMORY[0x24BE59D20]();
}

uint64_t CacheManagerTelemetryEventMetadata.rowId.setter()
{
  return MEMORY[0x24BE59D28]();
}

uint64_t CacheManagerTelemetryEventMetadata.init()()
{
  return MEMORY[0x24BE59D30]();
}

uint64_t type metadata accessor for CacheManagerTelemetryEventMetadata()
{
  return MEMORY[0x24BE59D38]();
}

uint64_t dispatch thunk of Source.sendEvent(_:date:)()
{
  return MEMORY[0x24BE5B1B0]();
}

uint64_t os_signpost(_:dso:log:name:signpostID:)()
{
  return MEMORY[0x24BEE7700]();
}

uint64_t OSSignpostID.init(log:)()
{
  return MEMORY[0x24BEE7718]();
}

uint64_t static OSSignpostID.exclusive.getter()
{
  return MEMORY[0x24BEE7748]();
}

uint64_t type metadata accessor for OSSignpostID()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t Logger.init(_:)()
{
  return MEMORY[0x24BEE78E8]();
}

uint64_t dispatch thunk of HashFunction.update(bufferPointer:)()
{
  return MEMORY[0x24BDC62A8]();
}

uint64_t dispatch thunk of HashFunction.finalize()()
{
  return MEMORY[0x24BDC62B0]();
}

uint64_t dispatch thunk of HashFunction.init()()
{
  return MEMORY[0x24BDC62C8]();
}

uint64_t type metadata accessor for Insecure.SHA1Digest()
{
  return MEMORY[0x24BDC6B58]();
}

uint64_t type metadata accessor for Insecure.SHA1()
{
  return MEMORY[0x24BDC6B90]();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t String.init(contentsOf:encoding:)()
{
  return MEMORY[0x24BDCF870]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x24BDCF9E0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t static String.Encoding.utf8.getter()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t type metadata accessor for String.Encoding()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t static String._uncheckedFromUTF8(_:)()
{
  return MEMORY[0x24BEE0AD8]();
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

uint64_t String.UTF8View._foreignDistance(from:to:)()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t String.init<A>(_:)()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t String.subscript.getter()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t RawRepresentable<>.encode(to:)()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t RawRepresentable<>.init(from:)()
{
  return MEMORY[0x24BEE1080]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x24BDCFBA8]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t specialized Array._endMutation()()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t CheckedContinuation.resume(throwing:)()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t static os_log_type_t.info.getter()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t static os_log_type_t.debug.getter()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t static os_log_type_t.default.getter()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t static os_signpost_type_t.end.getter()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t static os_signpost_type_t.begin.getter()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t static os_signpost_type_t.event.getter()
{
  return MEMORY[0x24BEE7958]();
}

uint64_t OS_os_log.signpostsEnabled.getter()
{
  return MEMORY[0x24BEE7968]();
}

uint64_t OS_os_log.init(subsystem:category:)()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t StringProtocol.write(to:atomically:encoding:)()
{
  return MEMORY[0x24BDD0608]();
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE30B0]();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x24BEE3290](cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
{
  return MEMORY[0x24BEE32E8]();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return MEMORY[0x24BEE3350]();
}

{
  return MEMORY[0x24BEE3360]();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t KeyedEncodingContainer.encodeIfPresent(_:forKey:)()
{
  return MEMORY[0x24BEE3438]();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return MEMORY[0x24BEE34A0]();
}

{
  return MEMORY[0x24BEE34B0]();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return MEMORY[0x24BEE34D0]();
}

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return MEMORY[0x24BEE3548](a1);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t withCheckedContinuation<A>(isolation:function:_:)()
{
  return MEMORY[0x24BEE7040]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t type metadata accessor for __ContiguousArrayStorageBase()
{
  return MEMORY[0x24BEE3B98]();
}

uint64_t withCheckedThrowingContinuation<A>(isolation:function:_:)()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t Error.localizedDescription.getter()
{
  return MEMORY[0x24BDD0708]();
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

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t CodingKey.description.getter()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t CodingKey.debugDescription.getter()
{
  return MEMORY[0x24BEE4A10]();
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

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
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

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
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

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x24BEE71E0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x24BEE71E8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x24BEE71F0]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x24BEE4C28]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
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

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x24BEE4EB0]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x24BEE4F30]();
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

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

