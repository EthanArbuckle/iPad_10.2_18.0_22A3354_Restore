uint64_t PlaygroundLoggerProbePointConfiguration.streamLoggedResultsEnabled.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t PlaygroundLoggerProbePointConfiguration.streamLoggedResultsEnabled.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*PlaygroundLoggerProbePointConfiguration.streamLoggedResultsEnabled.modify())()
{
  return nullsub_1;
}

LiveExecutionResultsFoundation::PlaygroundLoggerProbePointConfiguration __swiftcall PlaygroundLoggerProbePointConfiguration.init(streamLoggedResultsEnabled:)(LiveExecutionResultsFoundation::PlaygroundLoggerProbePointConfiguration streamLoggedResultsEnabled)
{
  LiveExecutionResultsFoundation::PlaygroundLoggerProbePointConfiguration *v1;

  v1->streamLoggedResultsEnabled = streamLoggedResultsEnabled.streamLoggedResultsEnabled;
  return streamLoggedResultsEnabled;
}

void static PlaygroundLoggerProbePointConfiguration.offConfiguration.getter(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

unint64_t PlaygroundLoggerProbePointConfiguration.description.getter()
{
  sub_22634AB64();
  swift_bridgeObjectRelease();
  sub_22634AB4C();
  swift_bridgeObjectRelease();
  sub_22634AB4C();
  return 0xD00000000000001CLL;
}

uint64_t sub_22634811C()
{
  sub_22634AB64();
  sub_22634AB4C();
  sub_22634AB4C();
  swift_bridgeObjectRelease();
  sub_22634AB4C();
  return 0;
}

BOOL static PlaygroundLoggerProbePointConfiguration.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

BOOL sub_2263481E4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PlaygroundLoggerProbePointConfiguration(unsigned __int8 *a1, unsigned int a2)
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
  v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for PlaygroundLoggerProbePointConfiguration(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2263482F8 + 4 * byte_22634AD55[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_22634832C + 4 * byte_22634AD50[v4]))();
}

uint64_t sub_22634832C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_226348334(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22634833CLL);
  return result;
}

uint64_t sub_226348348(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x226348350);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_226348354(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22634835C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PlaygroundLoggerProbePointConfiguration()
{
  return &type metadata for PlaygroundLoggerProbePointConfiguration;
}

uint64_t sub_226348378(uint64_t a1)
{
  return sub_2263484B0(a1, qword_25583AF40);
}

uint64_t static OS_os_log.agent.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2263483FC(&qword_25583AEF0, (uint64_t)qword_25583AF40, a1);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_2263483C8(uint64_t a1)
{
  return sub_2263484B0(a1, qword_25583AF58);
}

uint64_t static OS_os_log.host.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2263483FC(&qword_25583AEF8, (uint64_t)qword_25583AF58, a1);
}

uint64_t sub_2263483FC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_22634AB34();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t sub_226348464(uint64_t a1)
{
  return sub_2263484B0(a1, qword_25583AF70);
}

uint64_t static OS_os_log.os.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2263483FC(&qword_25583AF00, (uint64_t)qword_25583AF70, a1);
}

uint64_t sub_226348494(uint64_t a1)
{
  return sub_2263484B0(a1, qword_25583AF88);
}

uint64_t sub_2263484B0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_22634AB34();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_22634AB28();
}

uint64_t static OS_os_log.probe.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2263483FC(&qword_25583AF08, (uint64_t)qword_25583AF88, a1);
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

BOOL SourceLocationCollectionMode.isOn.getter()
{
  _BYTE *v0;

  return *v0 != 0;
}

LiveExecutionResultsFoundation::SourceLocationCollectionMode_optional __swiftcall SourceLocationCollectionMode.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 3;
  if ((unint64_t)rawValue < 3)
    v2 = rawValue;
  *v1 = v2;
  return (LiveExecutionResultsFoundation::SourceLocationCollectionMode_optional)rawValue;
}

uint64_t SourceLocationCollectionMode.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

BOOL sub_2263485AC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2263485C0()
{
  sub_22634ABB8();
  sub_22634ABC4();
  return sub_22634ABD0();
}

uint64_t sub_226348604()
{
  return sub_22634ABC4();
}

uint64_t sub_22634862C()
{
  sub_22634ABB8();
  sub_22634ABC4();
  return sub_22634ABD0();
}

LiveExecutionResultsFoundation::SourceLocationCollectionMode_optional sub_22634866C(Swift::Int *a1)
{
  return SourceLocationCollectionMode.init(rawValue:)(*a1);
}

void sub_226348674(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

uint64_t LoggingProbePointConfiguration.LogSources.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

LiveExecutionResultsFoundation::LoggingProbePointConfiguration::LogSources __swiftcall LoggingProbePointConfiguration.LogSources.init(rawValue:)(LiveExecutionResultsFoundation::LoggingProbePointConfiguration::LogSources rawValue)
{
  LiveExecutionResultsFoundation::LoggingProbePointConfiguration::LogSources *v1;

  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void static LoggingProbePointConfiguration.LogSources.none.getter(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

void static LoggingProbePointConfiguration.LogSources.printHook.getter(_QWORD *a1@<X8>)
{
  *a1 = 1;
}

void static LoggingProbePointConfiguration.LogSources.standardOut.getter(_QWORD *a1@<X8>)
{
  *a1 = 2;
}

void static LoggingProbePointConfiguration.LogSources.standardError.getter(_QWORD *a1@<X8>)
{
  *a1 = 4;
}

void sub_2263486BC()
{
  qword_25583AFA0 = 6;
}

uint64_t sub_2263486E0@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = 0;
    v5 = (uint64_t *)(a1 + 32);
    do
    {
      v7 = *v5++;
      v6 = v7;
      if ((v7 & ~v4) == 0)
        v6 = 0;
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }
  result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

_QWORD *static LoggingProbePointConfiguration.LogSources.standardOutErr.getter@<X0>(_QWORD *a1@<X8>)
{
  return sub_2263487A0(&qword_25583AF10, &qword_25583AFA0, a1);
}

void sub_226348750()
{
  qword_25583AFA8 = 7;
}

_QWORD *static LoggingProbePointConfiguration.LogSources.all.getter@<X0>(_QWORD *a1@<X8>)
{
  return sub_2263487A0(&qword_25583AF18, &qword_25583AFA8, a1);
}

_QWORD *sub_2263487A0@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X1>, _QWORD *a3@<X8>)
{
  if (*result != -1)
    result = (_QWORD *)swift_once();
  *a3 = *a2;
  return result;
}

Swift::Bool __swiftcall LoggingProbePointConfiguration.LogSources.containsLogSource(_:)(LiveExecutionResultsFoundation::PrintSample::LogSource a1)
{
  _QWORD *v1;

  return (qword_22634B1A0[*(char *)a1] & ~*v1) == 0;
}

_QWORD *sub_226348800@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_22634880C(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_226348814@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *sub_226348828@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *sub_22634883C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_226348850(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

_QWORD *sub_226348880@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & *result;
  if (v3)
    *v2 &= ~*result;
  *(_QWORD *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_2263488AC@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *result;
  v4 = *v2;
  *v2 |= *result;
  v5 = v4 & v3;
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v5 == 0;
  return result;
}

_QWORD *sub_2263488D0(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_2263488E4(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *sub_2263488F8(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *sub_22634890C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_226348920(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_226348934(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL sub_226348948(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL sub_22634895C()
{
  _QWORD *v0;

  return *v0 == 0;
}

uint64_t sub_22634896C()
{
  return sub_22634AB58();
}

_QWORD *sub_226348984(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

_QWORD *sub_226348998@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_2263489A8(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

BOOL sub_2263489B4(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

void LoggingProbePointConfiguration.activeLogSources.getter(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

_QWORD *LoggingProbePointConfiguration.activeLogSources.setter(_QWORD *result)
{
  _QWORD *v1;

  *v1 = *result;
  return result;
}

uint64_t (*LoggingProbePointConfiguration.activeLogSources.modify())()
{
  return nullsub_1;
}

void LoggingProbePointConfiguration.sourceLocationCollectionMode.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 8);
}

_BYTE *LoggingProbePointConfiguration.sourceLocationCollectionMode.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 8) = *result;
  return result;
}

uint64_t (*LoggingProbePointConfiguration.sourceLocationCollectionMode.modify())()
{
  return nullsub_1;
}

LiveExecutionResultsFoundation::LoggingProbePointConfiguration __swiftcall LoggingProbePointConfiguration.init(activeLogSources:sourceLocationCollectionMode:)(LiveExecutionResultsFoundation::LoggingProbePointConfiguration::LogSources activeLogSources, LiveExecutionResultsFoundation::SourceLocationCollectionMode sourceLocationCollectionMode)
{
  uint64_t v2;
  char v3;
  LiveExecutionResultsFoundation::LoggingProbePointConfiguration result;

  v3 = *(_BYTE *)sourceLocationCollectionMode;
  *(_QWORD *)v2 = *(_QWORD *)activeLogSources.rawValue;
  *(_BYTE *)(v2 + 8) = v3;
  result.activeLogSources = activeLogSources;
  result.sourceLocationCollectionMode = sourceLocationCollectionMode;
  return result;
}

void static LoggingProbePointConfiguration.offConfiguration.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t LoggingProbePointConfiguration.description.getter()
{
  sub_22634AB64();
  sub_22634AB4C();
  LoggingProbePointConfiguration.LogSources.description.getter();
  sub_22634AB4C();
  swift_bridgeObjectRelease();
  sub_22634AB4C();
  sub_22634AB70();
  sub_22634AB4C();
  return 0;
}

BOOL static LoggingProbePointConfiguration.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)a1 == *(_QWORD *)a2 && *(unsigned __int8 *)(a1 + 8) == *(unsigned __int8 *)(a2 + 8);
}

BOOL sub_226348B48(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)a1 == *(_QWORD *)a2 && *(unsigned __int8 *)(a1 + 8) == *(unsigned __int8 *)(a2 + 8);
}

uint64_t LoggingProbePointConfiguration.LogSources.hashValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t sub_226348B70()
{
  unint64_t v0;
  uint64_t result;

  v0 = sub_226349568(qword_24EDC11E8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25583AFF0);
  result = swift_arrayDestroy();
  qword_25583BB40 = v0;
  return result;
}

uint64_t LoggingProbePointConfiguration.LogSources.description.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  uint64_t result;
  int64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v1 = *v0;
  if (qword_25583AF20 != -1)
LABEL_36:
    swift_once();
  swift_beginAccess();
  v2 = qword_25583BB40;
  v3 = qword_25583BB40 + 64;
  v4 = 1 << *(_BYTE *)(qword_25583BB40 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(qword_25583BB40 + 64);
  v7 = (unint64_t)(v4 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v9 = 0;
  v10 = MEMORY[0x24BEE4AF8];
  while (v6)
  {
    v11 = __clz(__rbit64(v6));
    v6 &= v6 - 1;
    v12 = v11 | (v9 << 6);
LABEL_26:
    v16 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v12);
    if ((v16 & ~v1) == 0)
    {
      swift_beginAccess();
      v17 = qword_25583BB40;
      if (*(_QWORD *)(qword_25583BB40 + 16) && (v18 = sub_226348F10(v16), (v19 & 1) != 0))
      {
        v20 = (uint64_t *)(*(_QWORD *)(v17 + 56) + 16 * v18);
        v21 = v20[1];
        v26 = *v20;
        swift_endAccess();
        v27 = v21;
        swift_bridgeObjectRetain();
        result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          result = (uint64_t)sub_226349004(0, *(_QWORD *)(v10 + 16) + 1, 1, (char *)v10);
          v10 = result;
        }
        v23 = *(_QWORD *)(v10 + 16);
        v22 = *(_QWORD *)(v10 + 24);
        if (v23 >= v22 >> 1)
        {
          result = (uint64_t)sub_226349004((char *)(v22 > 1), v23 + 1, 1, (char *)v10);
          v10 = result;
        }
        *(_QWORD *)(v10 + 16) = v23 + 1;
        v24 = v10 + 16 * v23;
        *(_QWORD *)(v24 + 32) = v26;
        *(_QWORD *)(v24 + 40) = v27;
      }
      else
      {
        result = swift_endAccess();
      }
    }
  }
  v13 = v9 + 1;
  if (__OFADD__(v9, 1))
  {
    __break(1u);
    goto LABEL_36;
  }
  if (v13 >= v7)
    goto LABEL_34;
  v14 = *(_QWORD *)(v3 + 8 * v13);
  ++v9;
  if (v14)
    goto LABEL_25;
  v9 = v13 + 1;
  if (v13 + 1 >= v7)
    goto LABEL_34;
  v14 = *(_QWORD *)(v3 + 8 * v9);
  if (v14)
    goto LABEL_25;
  v9 = v13 + 2;
  if (v13 + 2 >= v7)
    goto LABEL_34;
  v14 = *(_QWORD *)(v3 + 8 * v9);
  if (v14)
    goto LABEL_25;
  v9 = v13 + 3;
  if (v13 + 3 >= v7)
    goto LABEL_34;
  v14 = *(_QWORD *)(v3 + 8 * v9);
  if (v14)
    goto LABEL_25;
  v9 = v13 + 4;
  if (v13 + 4 >= v7)
    goto LABEL_34;
  v14 = *(_QWORD *)(v3 + 8 * v9);
  if (v14)
  {
LABEL_25:
    v6 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v9 << 6);
    goto LABEL_26;
  }
  v15 = v13 + 5;
  if (v15 >= v7)
  {
LABEL_34:
    swift_release();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25583AFB0);
    sub_226349144();
    v25 = sub_22634AB40();
    swift_bridgeObjectRelease();
    return v25;
  }
  v14 = *(_QWORD *)(v3 + 8 * v15);
  if (v14)
  {
    v9 = v15;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v9 >= v7)
      goto LABEL_34;
    v14 = *(_QWORD *)(v3 + 8 * v9);
    ++v15;
    if (v14)
      goto LABEL_25;
  }
  __break(1u);
  return result;
}

uint64_t sub_226348E9C()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t sub_226348EA4()
{
  return sub_22634ABC4();
}

uint64_t sub_226348ECC()
{
  sub_22634ABB8();
  sub_22634ABC4();
  return sub_22634ABD0();
}

unint64_t sub_226348F10(uint64_t a1)
{
  uint64_t v2;

  sub_22634ABB8();
  sub_22634ABC4();
  v2 = sub_22634ABD0();
  return sub_226348F68(a1, v2);
}

unint64_t sub_226348F68(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(_QWORD *)(v7 + 8 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_QWORD *)(v7 + 8 * result) == a1)
          break;
      }
    }
  }
  return result;
}

char *sub_226349004(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25583AFE8);
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

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x227695FB8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_226349144()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25583AFB8;
  if (!qword_25583AFB8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25583AFB0);
    result = MEMORY[0x227695FD0](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_25583AFB8);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x227695FC4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_2263491D8()
{
  unint64_t result;

  result = qword_25583AFC0;
  if (!qword_25583AFC0)
  {
    result = MEMORY[0x227695FD0](&protocol conformance descriptor for SourceLocationCollectionMode, &type metadata for SourceLocationCollectionMode);
    atomic_store(result, (unint64_t *)&qword_25583AFC0);
  }
  return result;
}

unint64_t sub_226349220()
{
  unint64_t result;

  result = qword_25583AFC8;
  if (!qword_25583AFC8)
  {
    result = MEMORY[0x227695FD0](&protocol conformance descriptor for LoggingProbePointConfiguration.LogSources, &type metadata for LoggingProbePointConfiguration.LogSources);
    atomic_store(result, (unint64_t *)&qword_25583AFC8);
  }
  return result;
}

unint64_t sub_226349268()
{
  unint64_t result;

  result = qword_25583AFD0;
  if (!qword_25583AFD0)
  {
    result = MEMORY[0x227695FD0](&protocol conformance descriptor for LoggingProbePointConfiguration.LogSources, &type metadata for LoggingProbePointConfiguration.LogSources);
    atomic_store(result, (unint64_t *)&qword_25583AFD0);
  }
  return result;
}

unint64_t sub_2263492B0()
{
  unint64_t result;

  result = qword_25583AFD8;
  if (!qword_25583AFD8)
  {
    result = MEMORY[0x227695FD0](&protocol conformance descriptor for LoggingProbePointConfiguration.LogSources, &type metadata for LoggingProbePointConfiguration.LogSources);
    atomic_store(result, (unint64_t *)&qword_25583AFD8);
  }
  return result;
}

unint64_t sub_2263492F8()
{
  unint64_t result;

  result = qword_25583AFE0;
  if (!qword_25583AFE0)
  {
    result = MEMORY[0x227695FD0](&protocol conformance descriptor for LoggingProbePointConfiguration.LogSources, &type metadata for LoggingProbePointConfiguration.LogSources);
    atomic_store(result, (unint64_t *)&qword_25583AFE0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SourceLocationCollectionMode(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SourceLocationCollectionMode(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_226349418 + 4 * byte_22634AE15[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_22634944C + 4 * byte_22634AE10[v4]))();
}

uint64_t sub_22634944C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_226349454(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22634945CLL);
  return result;
}

uint64_t sub_226349468(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x226349470);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_226349474(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22634947C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_226349488(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_226349490(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SourceLocationCollectionMode()
{
  return &type metadata for SourceLocationCollectionMode;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for LoggingProbePointConfiguration(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 8);
  v4 = v3 >= 3;
  v5 = v3 - 3;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for LoggingProbePointConfiguration(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = a2 + 2;
  }
  return result;
}

ValueMetadata *type metadata accessor for LoggingProbePointConfiguration()
{
  return &type metadata for LoggingProbePointConfiguration;
}

ValueMetadata *type metadata accessor for LoggingProbePointConfiguration.LogSources()
{
  return &type metadata for LoggingProbePointConfiguration.LogSources;
}

unint64_t sub_226349568(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t *v9;
  _QWORD *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v1 = a1[2];
  if (!v1)
    return MEMORY[0x24BEE4B00];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25583AFF8);
  v3 = (_QWORD *)sub_22634AB7C();
  v4 = a1[4];
  v5 = a1[5];
  v6 = a1[6];
  result = sub_226348F10(v4);
  if ((v8 & 1) != 0)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    return (unint64_t)v3;
  }
  v9 = a1 + 9;
  while (1)
  {
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v4;
    v10 = (_QWORD *)(v3[7] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    v11 = v3[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      break;
    v3[2] = v13;
    if (!--v1)
      goto LABEL_8;
    v14 = v9 + 3;
    v4 = *(v9 - 2);
    v5 = *(v9 - 1);
    v15 = *v9;
    swift_bridgeObjectRetain();
    result = sub_226348F10(v4);
    v9 = v14;
    v6 = v15;
    if ((v16 & 1) != 0)
      goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t SourceLocation.filePath.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SourceLocation.filePath.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*SourceLocation.filePath.modify())()
{
  return nullsub_1;
}

uint64_t SourceLocation.lineNumber.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t SourceLocation.lineNumber.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = result;
  return result;
}

uint64_t (*SourceLocation.lineNumber.modify())()
{
  return nullsub_1;
}

uint64_t SourceLocation.column.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

uint64_t SourceLocation.column.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = result;
  return result;
}

uint64_t (*SourceLocation.column.modify())()
{
  return nullsub_1;
}

uint64_t SourceLocation.callStackAddress.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32);
}

uint64_t SourceLocation.callStackAddress.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = result;
  return result;
}

uint64_t (*SourceLocation.callStackAddress.modify())()
{
  return nullsub_1;
}

uint64_t SourceLocation.init(filePath:lineNumber:column:callStackAddress:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  *a6 = result;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;
  a6[4] = a5;
  return result;
}

uint64_t static InProcessSymbolicationService.shared.getter()
{
  type metadata accessor for InProcessSymbolicationService();
  return swift_initStaticObject();
}

uint64_t type metadata accessor for InProcessSymbolicationService()
{
  return objc_opt_self();
}

uint64_t sub_226349794()
{
  _BYTE *v0;

  sub_2263497E0();
  swift_allocError();
  *v0 = 1;
  return swift_willThrow();
}

unint64_t sub_2263497E0()
{
  unint64_t result;

  result = qword_25583B000;
  if (!qword_25583B000)
  {
    result = MEMORY[0x227695FD0](&protocol conformance descriptor for InProcessSymbolicationService.SymbolicationError, &type metadata for InProcessSymbolicationService.SymbolicationError);
    atomic_store(result, (unint64_t *)&qword_25583B000);
  }
  return result;
}

unint64_t InProcessSymbolicationService.SymbolicationError.errorDescription.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0xD00000000000001ELL;
  else
    return 0xD00000000000002DLL;
}

BOOL static InProcessSymbolicationService.SymbolicationError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t InProcessSymbolicationService.SymbolicationError.hash(into:)()
{
  return sub_22634ABC4();
}

uint64_t InProcessSymbolicationService.SymbolicationError.hashValue.getter()
{
  sub_22634ABB8();
  sub_22634ABC4();
  return sub_22634ABD0();
}

unint64_t sub_2263498E8()
{
  _BYTE *v0;

  if (*v0)
    return 0xD00000000000001ELL;
  else
    return 0xD00000000000002DLL;
}

uint64_t InProcessSymbolicationService.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t InProcessSymbolicationService.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

unint64_t sub_226349960()
{
  unint64_t result;

  result = qword_25583B008;
  if (!qword_25583B008)
  {
    result = MEMORY[0x227695FD0](&protocol conformance descriptor for InProcessSymbolicationService.SymbolicationError, &type metadata for InProcessSymbolicationService.SymbolicationError);
    atomic_store(result, (unint64_t *)&qword_25583B008);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for SourceLocation(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SourceLocation()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SourceLocation(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for SourceLocation(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for SourceLocation(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for SourceLocation(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SourceLocation(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
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
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SourceLocation()
{
  return &type metadata for SourceLocation;
}

uint64_t sub_226349B78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t result;

  if ((a6 & 1) == 0)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t destroy for SourceLocationInfo(uint64_t a1)
{
  return sub_226349BA0(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
}

uint64_t sub_226349BA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t result;

  if ((a6 & 1) == 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t initializeWithCopy for SourceLocationInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_BYTE *)(a2 + 40);
  sub_226349B78(*(_QWORD *)a2, v4, v5, v6, v7, v8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_BYTE *)(a1 + 40) = v8;
  return a1;
}

uint64_t assignWithCopy for SourceLocationInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_BYTE *)(a2 + 40);
  sub_226349B78(*(_QWORD *)a2, v4, v5, v6, v7, v8);
  v9 = *(_QWORD *)a1;
  v10 = *(_QWORD *)(a1 + 8);
  v11 = *(_QWORD *)(a1 + 16);
  v12 = *(_QWORD *)(a1 + 24);
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(_BYTE *)(a1 + 40);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_BYTE *)(a1 + 40) = v8;
  sub_226349BA0(v9, v10, v11, v12, v13, v14);
  return a1;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for SourceLocationInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  __int128 v11;

  v3 = *(_QWORD *)(a2 + 32);
  v4 = *(_BYTE *)(a2 + 40);
  v5 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  v8 = *(_QWORD *)(a1 + 24);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_BYTE *)(a1 + 40);
  v11 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v11;
  *(_QWORD *)(a1 + 32) = v3;
  *(_BYTE *)(a1 + 40) = v4;
  sub_226349BA0(v5, v7, v6, v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for SourceLocationInfo(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 41))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SourceLocationInfo(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 40) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 41) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 41) = 0;
    if (a2)
      *(_BYTE *)(result + 40) = -(char)a2;
  }
  return result;
}

uint64_t sub_226349DA8(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 40);
}

uint64_t sub_226349DB0(uint64_t result, char a2)
{
  *(_BYTE *)(result + 40) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SourceLocationInfo()
{
  return &type metadata for SourceLocationInfo;
}

uint64_t method lookup function for InProcessSymbolicationService()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of InProcessSymbolicationService.sourceLocationForAddressInCurrentProcess(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 88))();
}

uint64_t getEnumTagSinglePayload for InProcessSymbolicationService.SymbolicationError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for InProcessSymbolicationService.SymbolicationError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_226349ED0 + 4 * byte_22634B1C5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_226349F04 + 4 * byte_22634B1C0[v4]))();
}

uint64_t sub_226349F04(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_226349F0C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x226349F14);
  return result;
}

uint64_t sub_226349F20(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x226349F28);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_226349F2C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_226349F34(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_226349F40(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for InProcessSymbolicationService.SymbolicationError()
{
  return &type metadata for InProcessSymbolicationService.SymbolicationError;
}

uint64_t PlaygroundLoggerSample.payload.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  char v4;

  v2 = *(_QWORD *)v1;
  v3 = *(_QWORD *)(v1 + 8);
  v4 = *(_BYTE *)(v1 + 16);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = v4;
  return sub_226349F74(v2, v3, v4);
}

uint64_t sub_226349F74(uint64_t a1, unint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_bridgeObjectRetain();
  else
    return sub_226349F84(a1, a2);
}

uint64_t sub_226349F84(uint64_t a1, unint64_t a2)
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

uint64_t PlaygroundLoggerSample.payload.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t result;

  v2 = *a1;
  v3 = a1[1];
  v4 = *((_BYTE *)a1 + 16);
  result = sub_22634A004(*(_QWORD *)v1, *(_QWORD *)(v1 + 8), *(_BYTE *)(v1 + 16));
  *(_QWORD *)v1 = v2;
  *(_QWORD *)(v1 + 8) = v3;
  *(_BYTE *)(v1 + 16) = v4;
  return result;
}

uint64_t sub_22634A004(uint64_t a1, unint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  else
    return sub_22634A014(a1, a2);
}

uint64_t sub_22634A014(uint64_t a1, unint64_t a2)
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

uint64_t (*PlaygroundLoggerSample.payload.modify())()
{
  return nullsub_1;
}

__n128 PlaygroundLoggerSample.init(payload:)@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  unsigned __int8 v2;
  __n128 result;

  v2 = a1[1].n128_u8[0];
  result = *a1;
  *a2 = *a1;
  a2[1].n128_u8[0] = v2;
  return result;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for PlaygroundLoggerSample()
{
  return &type metadata for PlaygroundLoggerSample;
}

uint64_t destroy for PlaygroundLoggerSample.Payload(uint64_t a1)
{
  return sub_22634A004(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s30LiveExecutionResultsFoundation22PlaygroundLoggerSampleV7PayloadOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  char v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_226349F74(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t _s30LiveExecutionResultsFoundation22PlaygroundLoggerSampleV7PayloadOwca_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  char v5;
  uint64_t v6;
  unint64_t v7;
  char v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_226349F74(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v8 = *(_BYTE *)(a1 + 16);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_22634A004(v6, v7, v8);
  return a1;
}

uint64_t _s30LiveExecutionResultsFoundation22PlaygroundLoggerSampleV7PayloadOwta_0(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  unint64_t v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(_BYTE *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_22634A004(v4, v5, v6);
  return a1;
}

uint64_t _s30LiveExecutionResultsFoundation22PlaygroundLoggerSampleV7PayloadOwet_0(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t _s30LiveExecutionResultsFoundation22PlaygroundLoggerSampleV7PayloadOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_22634A230(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_22634A238(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PlaygroundLoggerSample.Payload()
{
  return &type metadata for PlaygroundLoggerSample.Payload;
}

LiveExecutionResultsFoundation::PrintSample::LogSource_optional __swiftcall PrintSample.LogSource.init(rawValue:)(Swift::Int rawValue)
{
  _BYTE *v1;
  unint64_t v2;

  v2 = 0x304020100uLL >> (8 * rawValue);
  if ((unint64_t)rawValue >= 5)
    LOBYTE(v2) = 4;
  *v1 = v2;
  return (LiveExecutionResultsFoundation::PrintSample::LogSource_optional)rawValue;
}

uint64_t PrintSample.LogSource.rawValue.getter()
{
  char *v0;

  return qword_22634B4E0[*v0];
}

BOOL sub_22634A294(char *a1, char *a2)
{
  return qword_22634B4E0[*a1] == qword_22634B4E0[*a2];
}

uint64_t sub_22634A2B8()
{
  sub_22634ABB8();
  sub_22634ABC4();
  return sub_22634ABD0();
}

uint64_t sub_22634A304()
{
  return sub_22634ABC4();
}

uint64_t sub_22634A338()
{
  sub_22634ABB8();
  sub_22634ABC4();
  return sub_22634ABD0();
}

LiveExecutionResultsFoundation::PrintSample::LogSource_optional sub_22634A380(Swift::Int *a1)
{
  return PrintSample.LogSource.init(rawValue:)(*a1);
}

void sub_22634A388(_QWORD *a1@<X8>)
{
  char *v1;

  *a1 = qword_22634B4E0[*v1];
}

uint64_t PrintSample.string.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PrintSample.string.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*PrintSample.string.modify())()
{
  return nullsub_1;
}

double PrintSample.timestamp.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

void PrintSample.timestamp.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 16) = a1;
}

uint64_t (*PrintSample.timestamp.modify())()
{
  return nullsub_1;
}

void PrintSample.logSource.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 24);
}

_BYTE *PrintSample.logSource.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 24) = *result;
  return result;
}

uint64_t (*PrintSample.logSource.modify())()
{
  return nullsub_1;
}

uint64_t PrintSample.sourceLocationInfo.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;

  v2 = *(_QWORD *)(v1 + 32);
  v3 = *(_QWORD *)(v1 + 40);
  v4 = *(_QWORD *)(v1 + 48);
  v5 = *(_QWORD *)(v1 + 56);
  v6 = *(_QWORD *)(v1 + 64);
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 32) = v6;
  v7 = *(_BYTE *)(v1 + 72);
  *(_BYTE *)(a1 + 40) = v7;
  return sub_22634A47C(v2, v3, v4, v5, v6, v7);
}

uint64_t sub_22634A47C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int8 a6)
{
  if (a6 != 255)
    return sub_226349B78(result, a2, a3, a4, a5, a6 & 1);
  return result;
}

__n128 PrintSample.sourceLocationInfo.setter(__int128 *a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  __n128 result;
  __n128 v5;
  __int128 v6;

  v5 = (__n128)a1[1];
  v6 = *a1;
  v2 = *((_QWORD *)a1 + 4);
  v3 = *((_BYTE *)a1 + 40);
  sub_22634A4F8(*(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56), *(_QWORD *)(v1 + 64), *(_BYTE *)(v1 + 72));
  result = v5;
  *(_OWORD *)(v1 + 32) = v6;
  *(__n128 *)(v1 + 48) = v5;
  *(_QWORD *)(v1 + 64) = v2;
  *(_BYTE *)(v1 + 72) = v3;
  return result;
}

uint64_t sub_22634A4F8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int8 a6)
{
  if (a6 != 255)
    return sub_226349BA0(result, a2, a3, a4, a5, a6 & 1);
  return result;
}

uint64_t (*PrintSample.sourceLocationInfo.modify())()
{
  return nullsub_1;
}

__n128 PrintSample.init(string:timestamp:logSource:sourceLocationInfo:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>, double a6@<D0>)
{
  char v6;
  uint64_t v7;
  char v8;
  __n128 result;
  __int128 v10;

  v6 = *a3;
  v7 = *(_QWORD *)(a4 + 32);
  v8 = *(_BYTE *)(a4 + 40);
  *(_QWORD *)a5 = a1;
  *(_QWORD *)(a5 + 8) = a2;
  *(double *)(a5 + 16) = a6;
  *(_BYTE *)(a5 + 24) = v6;
  result = *(__n128 *)a4;
  v10 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)(a5 + 32) = *(_OWORD *)a4;
  *(_OWORD *)(a5 + 48) = v10;
  *(_QWORD *)(a5 + 64) = v7;
  *(_BYTE *)(a5 + 72) = v8;
  return result;
}

unint64_t sub_22634A550()
{
  unint64_t result;

  result = qword_25583B0B0;
  if (!qword_25583B0B0)
  {
    result = MEMORY[0x227695FD0](&protocol conformance descriptor for PrintSample.LogSource, &type metadata for PrintSample.LogSource);
    atomic_store(result, (unint64_t *)&qword_25583B0B0);
  }
  return result;
}

uint64_t destroy for PrintSample(uint64_t a1)
{
  uint64_t result;
  int v3;

  result = swift_bridgeObjectRelease();
  v3 = *(unsigned __int8 *)(a1 + 72);
  if (v3 != 255)
    return sub_226349BA0(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v3 & 1);
  return result;
}

uint64_t initializeWithCopy for PrintSample(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int v5;
  __int128 v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v5 = *(unsigned __int8 *)(a2 + 72);
  swift_bridgeObjectRetain();
  if (v5 == 255)
  {
    v6 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v6;
    *(_OWORD *)(a1 + 57) = *(_OWORD *)(a2 + 57);
  }
  else
  {
    v7 = v5 & 1;
    v8 = *(_QWORD *)(a2 + 32);
    v9 = *(_QWORD *)(a2 + 40);
    v10 = *(_QWORD *)(a2 + 48);
    v11 = *(_QWORD *)(a2 + 56);
    v12 = *(_QWORD *)(a2 + 64);
    sub_226349B78(v8, v9, v10, v11, v12, v7);
    *(_QWORD *)(a1 + 32) = v8;
    *(_QWORD *)(a1 + 40) = v9;
    *(_QWORD *)(a1 + 48) = v10;
    *(_QWORD *)(a1 + 56) = v11;
    *(_QWORD *)(a1 + 64) = v12;
    *(_BYTE *)(a1 + 72) = v7;
  }
  return a1;
}

uint64_t assignWithCopy for PrintSample(uint64_t a1, uint64_t a2)
{
  __int128 *v4;
  __int128 *v5;
  int v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  char v11;
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
  char v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v4 = (__int128 *)(a1 + 32);
  v5 = (__int128 *)(a2 + 32);
  v6 = *(unsigned __int8 *)(a2 + 72);
  if (*(unsigned __int8 *)(a1 + 72) == 255)
  {
    if (v6 == 255)
    {
      v9 = *v5;
      v10 = *(_OWORD *)(a2 + 48);
      *(_OWORD *)(a1 + 57) = *(_OWORD *)(a2 + 57);
      *v4 = v9;
      *(_OWORD *)(a1 + 48) = v10;
    }
    else
    {
      v23 = v6 & 1;
      v24 = *(_QWORD *)(a2 + 32);
      v25 = *(_QWORD *)(a2 + 40);
      v26 = *(_QWORD *)(a2 + 48);
      v27 = *(_QWORD *)(a2 + 56);
      v28 = *(_QWORD *)(a2 + 64);
      sub_226349B78(v24, v25, v26, v27, v28, v6 & 1);
      *(_QWORD *)(a1 + 32) = v24;
      *(_QWORD *)(a1 + 40) = v25;
      *(_QWORD *)(a1 + 48) = v26;
      *(_QWORD *)(a1 + 56) = v27;
      *(_QWORD *)(a1 + 64) = v28;
      *(_BYTE *)(a1 + 72) = v23;
    }
  }
  else if (v6 == 255)
  {
    sub_22634A7F0(a1 + 32);
    v7 = *(_OWORD *)(a2 + 57);
    v8 = *(_OWORD *)(a2 + 48);
    *v4 = *v5;
    *(_OWORD *)(a1 + 48) = v8;
    *(_OWORD *)(a1 + 57) = v7;
  }
  else
  {
    v11 = v6 & 1;
    v12 = *(_QWORD *)(a2 + 32);
    v13 = *(_QWORD *)(a2 + 40);
    v14 = *(_QWORD *)(a2 + 48);
    v15 = *(_QWORD *)(a2 + 56);
    v16 = *(_QWORD *)(a2 + 64);
    sub_226349B78(v12, v13, v14, v15, v16, v6 & 1);
    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(_QWORD *)(a1 + 40);
    v19 = *(_QWORD *)(a1 + 48);
    v20 = *(_QWORD *)(a1 + 56);
    v21 = *(_QWORD *)(a1 + 64);
    v22 = *(_BYTE *)(a1 + 72);
    *(_QWORD *)(a1 + 32) = v12;
    *(_QWORD *)(a1 + 40) = v13;
    *(_QWORD *)(a1 + 48) = v14;
    *(_QWORD *)(a1 + 56) = v15;
    *(_QWORD *)(a1 + 64) = v16;
    *(_BYTE *)(a1 + 72) = v11;
    sub_226349BA0(v17, v18, v19, v20, v21, v22);
  }
  return a1;
}

uint64_t sub_22634A7F0(uint64_t a1)
{
  destroy for SourceLocationInfo(a1);
  return a1;
}

__n128 __swift_memcpy73_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 57) = *(_OWORD *)(a2 + 57);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for PrintSample(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int v5;
  int v6;
  __int128 v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v5 = *(unsigned __int8 *)(a1 + 72);
  if (v5 != 255)
  {
    v6 = *(unsigned __int8 *)(a2 + 72);
    if (v6 != 255)
    {
      v8 = v5 & 1;
      v9 = *(_QWORD *)(a2 + 64);
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 40);
      v12 = *(_QWORD *)(a1 + 48);
      v13 = *(_QWORD *)(a1 + 56);
      v14 = *(_QWORD *)(a1 + 64);
      v15 = *(_OWORD *)(a2 + 48);
      *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
      *(_OWORD *)(a1 + 48) = v15;
      *(_QWORD *)(a1 + 64) = v9;
      *(_BYTE *)(a1 + 72) = v6 & 1;
      sub_226349BA0(v10, v11, v12, v13, v14, v8);
      return a1;
    }
    sub_22634A7F0(a1 + 32);
  }
  v7 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v7;
  *(_OWORD *)(a1 + 57) = *(_OWORD *)(a2 + 57);
  return a1;
}

uint64_t getEnumTagSinglePayload for PrintSample(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 73))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PrintSample(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 72) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 73) = 1;
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
    *(_BYTE *)(result + 73) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PrintSample()
{
  return &type metadata for PrintSample;
}

uint64_t getEnumTagSinglePayload for PrintSample.LogSource(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for PrintSample.LogSource(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22634AA84 + 4 * byte_22634B3D5[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_22634AAB8 + 4 * byte_22634B3D0[v4]))();
}

uint64_t sub_22634AAB8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22634AAC0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22634AAC8);
  return result;
}

uint64_t sub_22634AAD4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22634AADCLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_22634AAE0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22634AAE8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PrintSample.LogSource()
{
  return &type metadata for PrintSample.LogSource;
}

uint64_t sub_22634AB04()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_22634AB10()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_22634AB1C()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_22634AB28()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_22634AB34()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_22634AB40()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_22634AB4C()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_22634AB58()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_22634AB64()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_22634AB70()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_22634AB7C()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_22634AB88()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_22634AB94()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_22634ABA0()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_22634ABAC()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_22634ABB8()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_22634ABC4()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_22634ABD0()
{
  return MEMORY[0x24BEE4328]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
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

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
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

uint64_t swift_initStaticObject()
{
  return MEMORY[0x24BEE4E50]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
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

