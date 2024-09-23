uint64_t static TokenHandoff.handoffUTToken(tokenData:advertisedItemID:hasSKANAdData:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  _BYTE *v8;
  uint64_t v10;

  v0 = sub_232EB9F40();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_232EABC7C();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  v5 = sub_232EB9F28();
  v6 = sub_232EBA078();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_232E98000, v5, v6, "This SPI is no longer available", v7, 2u);
    MEMORY[0x23492AAA8](v7, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_232E9A170();
  swift_allocError();
  *v8 = 0;
  return swift_willThrow();
}

unint64_t sub_232E9A170()
{
  unint64_t result;

  result = qword_25600FFA8;
  if (!qword_25600FFA8)
  {
    result = MEMORY[0x23492AA30](&protocol conformance descriptor for AdAttributionKitError, &type metadata for AdAttributionKitError);
    atomic_store(result, (unint64_t *)&qword_25600FFA8);
  }
  return result;
}

uint64_t static TokenHandoff.handoffUTToken(tokenData:advertisedItemID:skanEnvironment:)(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4)
{
  uint64_t v4;
  int v8;
  char v9;
  _QWORD *v10;

  v8 = *a4;
  if (v8 == 2)
    v9 = 2;
  else
    v9 = v8 & 1;
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v10;
  *v10 = v4;
  v10[1] = sub_232E9A230;
  return sub_232EAFC44(a3, a1, a2, v9);
}

uint64_t sub_232E9A230()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t static TokenHandoff.handoffUTMetrics(eventsData:advertisedItemID:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_232E9AE4C;
  return sub_232EAFE64(a3, a1, a2, 2);
}

uint64_t static TokenHandoff.handoffPODToken(tokenData:advertisedItemID:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_232EAFFC0(a3, a1, a2, 2);
}

BOOL static TokenHandoff.SKAdNetworkEnvironment.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t TokenHandoff.SKAdNetworkEnvironment.hash(into:)()
{
  return sub_232EBA294();
}

uint64_t sub_232E9A34C(char a1)
{
  if ((a1 & 1) != 0)
    return 0x69746375646F7270;
  else
    return 0x6D706F6C65766564;
}

BOOL sub_232E9A390(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_232E9A3AC()
{
  return sub_232EBA294();
}

uint64_t sub_232E9A3D8()
{
  char *v0;

  return sub_232E9A34C(*v0);
}

uint64_t sub_232E9A3E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_232E9AD4C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_232E9A404()
{
  return 0;
}

void sub_232E9A410(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_232E9A41C()
{
  sub_232E9A874();
  return sub_232EBA2D0();
}

uint64_t sub_232E9A444()
{
  sub_232E9A874();
  return sub_232EBA2DC();
}

uint64_t sub_232E9A46C()
{
  return 0;
}

void sub_232E9A478(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_232E9A484()
{
  sub_232E9A8FC();
  return sub_232EBA2D0();
}

uint64_t sub_232E9A4AC()
{
  sub_232E9A8FC();
  return sub_232EBA2DC();
}

uint64_t sub_232E9A4D4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_232E9A500()
{
  sub_232E9A8B8();
  return sub_232EBA2D0();
}

uint64_t sub_232E9A528()
{
  sub_232E9A8B8();
  return sub_232EBA2DC();
}

uint64_t TokenHandoff.SKAdNetworkEnvironment.encode(to:)(_QWORD *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25600FFC0);
  v16 = *(_QWORD *)(v3 - 8);
  v17 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25600FFC8);
  v14 = *(_QWORD *)(v6 - 8);
  v15 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25600FFD0);
  v18 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_232E9A874();
  sub_232EBA2C4();
  if ((v12 & 1) != 0)
  {
    v20 = 1;
    sub_232E9A8B8();
    sub_232EBA1D4();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v17);
  }
  else
  {
    v19 = 0;
    sub_232E9A8FC();
    sub_232EBA1D4();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v15);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v11, v9);
}

uint64_t TokenHandoff.SKAdNetworkEnvironment.hashValue.getter()
{
  sub_232EBA288();
  sub_232EBA294();
  return sub_232EBA2A0();
}

uint64_t sub_232E9A768()
{
  sub_232EBA288();
  sub_232EBA294();
  return sub_232EBA2A0();
}

uint64_t sub_232E9A7AC()
{
  sub_232EBA288();
  sub_232EBA294();
  return sub_232EBA2A0();
}

uint64_t sub_232E9A7EC(_QWORD *a1)
{
  return TokenHandoff.SKAdNetworkEnvironment.encode(to:)(a1);
}

uint64_t sub_232E9A800(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23492AA18]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
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

unint64_t sub_232E9A874()
{
  unint64_t result;

  result = qword_25600FFD8;
  if (!qword_25600FFD8)
  {
    result = MEMORY[0x23492AA30](&unk_232EBA9F0, &type metadata for TokenHandoff.SKAdNetworkEnvironment.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25600FFD8);
  }
  return result;
}

unint64_t sub_232E9A8B8()
{
  unint64_t result;

  result = qword_25600FFE0;
  if (!qword_25600FFE0)
  {
    result = MEMORY[0x23492AA30](&unk_232EBA9A0, &type metadata for TokenHandoff.SKAdNetworkEnvironment.ProductionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25600FFE0);
  }
  return result;
}

unint64_t sub_232E9A8FC()
{
  unint64_t result;

  result = qword_25600FFE8;
  if (!qword_25600FFE8)
  {
    result = MEMORY[0x23492AA30](&unk_232EBA950, &type metadata for TokenHandoff.SKAdNetworkEnvironment.DevelopmentCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25600FFE8);
  }
  return result;
}

unint64_t sub_232E9A944()
{
  unint64_t result;

  result = qword_25600FFF0;
  if (!qword_25600FFF0)
  {
    result = MEMORY[0x23492AA30](&protocol conformance descriptor for TokenHandoff.SKAdNetworkEnvironment, &type metadata for TokenHandoff.SKAdNetworkEnvironment);
    atomic_store(result, (unint64_t *)&qword_25600FFF0);
  }
  return result;
}

ValueMetadata *type metadata accessor for TokenHandoff()
{
  return &type metadata for TokenHandoff;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for TokenHandoff.SKAdNetworkEnvironment()
{
  return &type metadata for TokenHandoff.SKAdNetworkEnvironment;
}

uint64_t getEnumTagSinglePayload for PostbackUpdate.ConversionType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s16AdAttributionKit12TokenHandoffO22SKAdNetworkEnvironmentOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_232E9AAA0 + 4 * byte_232EBA6D5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_232E9AAD4 + 4 * byte_232EBA6D0[v4]))();
}

uint64_t sub_232E9AAD4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_232E9AADC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x232E9AAE4);
  return result;
}

uint64_t sub_232E9AAF0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x232E9AAF8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_232E9AAFC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_232E9AB04(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_232E9AB10(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_232E9AB18(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for TokenHandoff.SKAdNetworkEnvironment.CodingKeys()
{
  return &type metadata for TokenHandoff.SKAdNetworkEnvironment.CodingKeys;
}

ValueMetadata *type metadata accessor for TokenHandoff.SKAdNetworkEnvironment.DevelopmentCodingKeys()
{
  return &type metadata for TokenHandoff.SKAdNetworkEnvironment.DevelopmentCodingKeys;
}

ValueMetadata *type metadata accessor for TokenHandoff.SKAdNetworkEnvironment.ProductionCodingKeys()
{
  return &type metadata for TokenHandoff.SKAdNetworkEnvironment.ProductionCodingKeys;
}

unint64_t sub_232E9AB58()
{
  unint64_t result;

  result = qword_25600FFF8;
  if (!qword_25600FFF8)
  {
    result = MEMORY[0x23492AA30](&unk_232EBA928, &type metadata for TokenHandoff.SKAdNetworkEnvironment.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25600FFF8);
  }
  return result;
}

unint64_t sub_232E9ABA0()
{
  unint64_t result;

  result = qword_256010000;
  if (!qword_256010000)
  {
    result = MEMORY[0x23492AA30](&unk_232EBA848, &type metadata for TokenHandoff.SKAdNetworkEnvironment.DevelopmentCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010000);
  }
  return result;
}

unint64_t sub_232E9ABE8()
{
  unint64_t result;

  result = qword_256010008;
  if (!qword_256010008)
  {
    result = MEMORY[0x23492AA30](&unk_232EBA870, &type metadata for TokenHandoff.SKAdNetworkEnvironment.DevelopmentCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010008);
  }
  return result;
}

unint64_t sub_232E9AC30()
{
  unint64_t result;

  result = qword_256010010;
  if (!qword_256010010)
  {
    result = MEMORY[0x23492AA30](&unk_232EBA7F8, &type metadata for TokenHandoff.SKAdNetworkEnvironment.ProductionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010010);
  }
  return result;
}

unint64_t sub_232E9AC78()
{
  unint64_t result;

  result = qword_256010018;
  if (!qword_256010018)
  {
    result = MEMORY[0x23492AA30](&unk_232EBA820, &type metadata for TokenHandoff.SKAdNetworkEnvironment.ProductionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010018);
  }
  return result;
}

unint64_t sub_232E9ACC0()
{
  unint64_t result;

  result = qword_256010020;
  if (!qword_256010020)
  {
    result = MEMORY[0x23492AA30](&unk_232EBA898, &type metadata for TokenHandoff.SKAdNetworkEnvironment.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010020);
  }
  return result;
}

unint64_t sub_232E9AD08()
{
  unint64_t result;

  result = qword_256010028;
  if (!qword_256010028)
  {
    result = MEMORY[0x23492AA30](&unk_232EBA8C0, &type metadata for TokenHandoff.SKAdNetworkEnvironment.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010028);
  }
  return result;
}

uint64_t sub_232E9AD4C(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6D706F6C65766564 && a2 == 0xEB00000000746E65;
  if (v3 || (sub_232EBA228() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x69746375646F7270 && a2 == 0xEA00000000006E6FLL)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_232EBA228();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t static AppImpression.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256010030) + 60);
  v5 = *(_QWORD *)(a1 + v4);
  v6 = *(_QWORD *)(a1 + v4 + 8);
  v7 = (_QWORD *)(a2 + v4);
  if (v5 == *v7 && v6 == v7[1])
    return 1;
  else
    return sub_232EBA228();
}

uint64_t AppImpression.hash(into:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256010030);
  swift_bridgeObjectRetain();
  sub_232EB9F70();
  return swift_bridgeObjectRelease();
}

uint64_t AppImpression.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256010030) + 52);
  v4 = sub_232EB9F10();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t AppImpression.publisherItemID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256010030) + 52);
  return *(_QWORD *)(v1 + *(int *)(type metadata accessor for AppImpressionPayload() + 20));
}

uint64_t AppImpression.advertisedItemID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256010030) + 52);
  return *(_QWORD *)(v1 + *(int *)(type metadata accessor for AppImpressionPayload() + 24));
}

uint64_t AppImpression.sourceID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256010030) + 52);
  return *(_QWORD *)(v1 + *(int *)(type metadata accessor for AppImpressionPayload() + 28));
}

uint64_t AppImpression.keyID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AppImpression.adNetworkID.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256010030) + 52);
  v2 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for AppImpressionPayload() + 40) + v1);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t AppImpression.timestamp.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256010030);
  type metadata accessor for AppImpressionPayload();
  return sub_232EB9EF8();
}

uint64_t AppImpression.eligibleForReengagement.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256010030) + 52);
  return *(_BYTE *)(v1 + *(int *)(type metadata accessor for AppImpressionPayload() + 44)) & 1;
}

uint64_t AppImpression.compactJWSRepresentation.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256010030) + 60));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AppImpression.init(compactJWS:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;

  v3[4] = a2;
  v3[5] = a3;
  v3[3] = a1;
  v4 = sub_232EB9F40();
  v3[6] = v4;
  v3[7] = *(_QWORD *)(v4 - 8);
  v3[8] = swift_task_alloc();
  v3[9] = __swift_instantiateConcreteTypeFromMangledName(&qword_256010030);
  v3[10] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_232E9B1F4()
{
  _QWORD *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;

  v1 = v0[10];
  v3 = v0[4];
  v2 = v0[5];
  v4 = type metadata accessor for AppImpressionPayload();
  v5 = sub_232E9B7CC();
  v6 = sub_232E9CFE0(&qword_256010048, (uint64_t (*)(uint64_t))type metadata accessor for AppImpressionPayload, (uint64_t)&unk_232EBC0AC);
  swift_bridgeObjectRetain();
  sub_232EB1760(v3, v2, v4, v5, v6, v1);
  v0[11] = 0;
  v7 = v0[9];
  v8 = v0[3];
  sub_232E9CEC8(v0[10], v8);
  v9 = v8 + *(int *)(v7 + 52);
  v10 = *(_QWORD *)(v9 + *(int *)(v4 + 24));
  v11 = (uint64_t *)(v9 + *(int *)(v4 + 40));
  v12 = *v11;
  v13 = v11[1];
  v0[12] = v13;
  swift_bridgeObjectRetain();
  v14 = (_QWORD *)swift_task_alloc();
  v0[13] = v14;
  *v14 = v0;
  v14[1] = sub_232E9B50C;
  return sub_232EA4790(v10, v0[4], v0[5], v12, v13);
}

uint64_t sub_232E9B50C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 112) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_232E9B5C8()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;

  v1 = *(void **)(v0 + 112);
  v3 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 64);
  v4 = *(_QWORD *)(v0 + 48);
  v5 = sub_232EABA34();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  MEMORY[0x23492A9D0](v1);
  MEMORY[0x23492A9D0](v1);
  v6 = sub_232EB9F28();
  v7 = sub_232EBA078();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v8 = 138412290;
    MEMORY[0x23492A9D0](v1);
    v10 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 16) = v10;
    sub_232EBA09C();
    *v9 = v10;

    _os_log_impl(&dword_232E98000, v6, v7, "Encountered an error while initializing impression: %@.", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256010050);
    swift_arrayDestroy();
    MEMORY[0x23492AAA8](v9, -1, -1);
    MEMORY[0x23492AAA8](v8, -1, -1);
  }
  else
  {

  }
  v11 = *(_QWORD *)(v0 + 88);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 56) + 8))(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 48));
  sub_232E9A170();
  swift_allocError();
  sub_232E9FDB4((uint64_t)v1, v12);
  swift_willThrow();

  if (!v11)
    sub_232E9CF10(*(_QWORD *)(v0 + 24), &qword_256010030);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_232E9B7CC()
{
  unint64_t result;

  result = qword_256010040;
  if (!qword_256010040)
  {
    result = MEMORY[0x23492AA30](&unk_232EBC084, &type metadata for AppImpressionHeader);
    atomic_store(result, (unint64_t *)&qword_256010040);
  }
  return result;
}

void AppImpression.init(compactJWS:)(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  void *v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010030);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for AppImpressionPayload();
  v11 = sub_232E9B7CC();
  v12 = sub_232E9CFE0(&qword_256010048, (uint64_t (*)(uint64_t))type metadata accessor for AppImpressionPayload, (uint64_t)&unk_232EBC0AC);
  sub_232EB1760(a1, a2, v10, v11, v12, (uint64_t)v9);
  if (v3)
  {
    sub_232E9A170();
    swift_allocError();
    sub_232E9FDB4((uint64_t)v3, v13);
    swift_willThrow();

  }
  else
  {
    sub_232E9CEC8((uint64_t)v9, a3);
  }
}

uint64_t AppImpression.hashValue.getter()
{
  sub_232EBA288();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256010030);
  swift_bridgeObjectRetain();
  sub_232EB9F70();
  swift_bridgeObjectRelease();
  return sub_232EBA2A0();
}

uint64_t sub_232E9B9B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256010030) + 60);
  v5 = *(_QWORD *)(a1 + v4);
  v6 = *(_QWORD *)(a1 + v4 + 8);
  v7 = (_QWORD *)(a2 + v4);
  if (v5 == *v7 && v6 == v7[1])
    return 1;
  else
    return sub_232EBA228();
}

uint64_t sub_232E9BA10()
{
  sub_232EBA288();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256010030);
  swift_bridgeObjectRetain();
  sub_232EB9F70();
  swift_bridgeObjectRelease();
  return sub_232EBA2A0();
}

uint64_t sub_232E9BA7C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256010030);
  swift_bridgeObjectRetain();
  sub_232EB9F70();
  return swift_bridgeObjectRelease();
}

uint64_t sub_232E9BAD4()
{
  sub_232EBA288();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256010030);
  swift_bridgeObjectRetain();
  sub_232EB9F70();
  swift_bridgeObjectRelease();
  return sub_232EBA2A0();
}

uint64_t sub_232E9BB3C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256010030) + 52);
  v4 = sub_232EB9F10();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t AppImpression.beginView()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[3] = v0;
  v2 = sub_232EB9F40();
  v1[4] = v2;
  v1[5] = *(_QWORD *)(v2 - 8);
  v1[6] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_232E9BBE8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v1 = v0[3];
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010030);
  v3 = v1 + *(int *)(v2 + 52);
  v4 = *(_QWORD *)(v3 + *(int *)(type metadata accessor for AppImpressionPayload() + 24));
  v5 = (uint64_t *)(v1 + *(int *)(v2 + 60));
  v6 = *v5;
  v7 = v5[1];
  v0[7] = v7;
  swift_bridgeObjectRetain();
  v8 = (_QWORD *)swift_task_alloc();
  v0[8] = v8;
  *v8 = v0;
  v8[1] = sub_232E9BC8C;
  return sub_232EA4A08(v4, v6, v7);
}

uint64_t sub_232E9BC8C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 72) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_232E9BD0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  uint8_t *v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _BYTE *v14;

  v1 = *(_QWORD *)(v0 + 72);
  v2 = *(_QWORD *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 32);
  v4 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRelease();
  v5 = sub_232EABA34();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v5, v3);
  MEMORY[0x23492A9D0](v1);
  MEMORY[0x23492A9D0](v1);
  v6 = sub_232EB9F28();
  v7 = sub_232EBA078();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = *(void **)(v0 + 72);
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v9 = 138412290;
    MEMORY[0x23492A9D0](v8);
    v11 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 16) = v11;
    sub_232EBA09C();
    *v10 = v11;

    _os_log_impl(&dword_232E98000, v6, v7, "Encountered error while starting view for impression: %@.", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256010050);
    swift_arrayDestroy();
    MEMORY[0x23492AAA8](v10, -1, -1);
    MEMORY[0x23492AAA8](v9, -1, -1);
  }
  else
  {
    v12 = *(void **)(v0 + 72);

  }
  v13 = *(void **)(v0 + 72);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 40) + 8))(*(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 32));
  sub_232E9A170();
  swift_allocError();
  sub_232E9FDB4((uint64_t)v13, v14);
  swift_willThrow();

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t AppImpression.endView()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[3] = v0;
  v2 = sub_232EB9F40();
  v1[4] = v2;
  v1[5] = *(_QWORD *)(v2 - 8);
  v1[6] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_232E9BF68()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v1 = v0[3];
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010030);
  v3 = v1 + *(int *)(v2 + 52);
  v4 = *(_QWORD *)(v3 + *(int *)(type metadata accessor for AppImpressionPayload() + 24));
  v5 = (uint64_t *)(v1 + *(int *)(v2 + 60));
  v6 = *v5;
  v7 = v5[1];
  v0[7] = v7;
  swift_bridgeObjectRetain();
  v8 = (_QWORD *)swift_task_alloc();
  v0[8] = v8;
  *v8 = v0;
  v8[1] = sub_232E9C00C;
  return sub_232EA4B88(v4, v6, v7);
}

uint64_t sub_232E9C00C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 72) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_232E9C08C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  uint8_t *v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _BYTE *v14;

  v1 = *(_QWORD *)(v0 + 72);
  v2 = *(_QWORD *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 32);
  v4 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRelease();
  v5 = sub_232EABA34();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v5, v3);
  MEMORY[0x23492A9D0](v1);
  MEMORY[0x23492A9D0](v1);
  v6 = sub_232EB9F28();
  v7 = sub_232EBA078();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = *(void **)(v0 + 72);
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v9 = 138412290;
    MEMORY[0x23492A9D0](v8);
    v11 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 16) = v11;
    sub_232EBA09C();
    *v10 = v11;

    _os_log_impl(&dword_232E98000, v6, v7, "Encountered error while ending view for impression: %@.", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256010050);
    swift_arrayDestroy();
    MEMORY[0x23492AAA8](v10, -1, -1);
    MEMORY[0x23492AAA8](v9, -1, -1);
  }
  else
  {
    v12 = *(void **)(v0 + 72);

  }
  v13 = *(void **)(v0 + 72);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 40) + 8))(*(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 32));
  sub_232E9A170();
  swift_allocError();
  sub_232E9FDB4((uint64_t)v13, v14);
  swift_willThrow();

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t AppImpression.handleTap()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256010070);
  *(_QWORD *)(v1 + 24) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_232E9C2E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = sub_232EB9EBC();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 1, 1, v2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v3;
  *v3 = v0;
  v3[1] = sub_232E9C358;
  return sub_232E9C41C(*(_QWORD *)(v0 + 24));
}

uint64_t sub_232E9C358()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(*v1 + 24);
  v3 = *v1;
  *(_QWORD *)(v3 + 40) = v0;
  swift_task_dealloc();
  sub_232E9CF10(v2, &qword_256010070);
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t sub_232E9C3E8()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_232E9C41C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[3] = a1;
  v2[4] = v1;
  v3 = sub_232EB9F40();
  v2[5] = v3;
  v2[6] = *(_QWORD *)(v3 - 8);
  v2[7] = swift_task_alloc();
  v4 = sub_232EB9EBC();
  v2[8] = v4;
  v2[9] = *(_QWORD *)(v4 - 8);
  v2[10] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_232E9C4A4()
{
  uint64_t v0;

  sub_232EBA030();
  *(_QWORD *)(v0 + 88) = sub_232EBA024();
  sub_232EBA000();
  return swift_task_switch();
}

uint64_t sub_232E9C50C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _BYTE *v11;

  v1 = v0[10];
  v2 = v0[8];
  v3 = v0[9];
  swift_release();
  sub_232EB9EA4();
  v4 = objc_allocWithZone(MEMORY[0x24BEBD5C0]);
  v5 = (void *)sub_232EB9EB0();
  v6 = (void *)sub_232EB9F4C();
  v7 = (void *)sub_232EB9F4C();
  v8 = objc_msgSend(v4, sel_initWithSourceIdentifier_destinationURL_sourceDescription_purchaser_, 0, v5, v6, v7);

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  v9 = objc_msgSend(v8, sel_toUISClickAttribution);
  v10 = objc_msgSend(v9, sel_eventMessage);
  v0[12] = v10;
  if (!v10)
  {
    sub_232E9A170();
    v0[16] = swift_allocError();
    *v11 = 1;
    swift_willThrow();
  }

  return swift_task_switch();
}

uint64_t sub_232E9C67C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v1 = v0[4];
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010030);
  v3 = v1 + *(int *)(v2 + 52);
  v4 = *(_QWORD *)(v3 + *(int *)(type metadata accessor for AppImpressionPayload() + 24));
  v5 = (uint64_t *)(v1 + *(int *)(v2 + 60));
  v6 = *v5;
  v7 = v5[1];
  v0[13] = v7;
  swift_bridgeObjectRetain();
  v8 = (_QWORD *)swift_task_alloc();
  v0[14] = (uint64_t)v8;
  *v8 = v0;
  v8[1] = sub_232E9C728;
  return sub_232EA4E48(v4, v6, v7, v0[12], v0[3]);
}

uint64_t sub_232E9C728()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 120) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_232E9C794()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  _QWORD *v9;
  uint64_t v10;
  _BYTE *v11;

  v1 = *(void **)(v0 + 128);
  v3 = *(_QWORD *)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 56);
  v4 = *(_QWORD *)(v0 + 40);
  v5 = sub_232EABA34();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  MEMORY[0x23492A9D0](v1);
  MEMORY[0x23492A9D0](v1);
  v6 = sub_232EB9F28();
  v7 = sub_232EBA078();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v8 = 138412290;
    MEMORY[0x23492A9D0](v1);
    v10 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 16) = v10;
    sub_232EBA09C();
    *v9 = v10;

    _os_log_impl(&dword_232E98000, v6, v7, "Encountered an error while processing tap for impression: %@.", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256010050);
    swift_arrayDestroy();
    MEMORY[0x23492AAA8](v9, -1, -1);
    MEMORY[0x23492AAA8](v8, -1, -1);
  }
  else
  {

  }
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 48) + 8))(*(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 40));
  sub_232E9A170();
  swift_allocError();
  sub_232E9FDB4((uint64_t)v1, v11);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_232E9C988()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_232E9C9D4()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  _QWORD *v10;
  uint64_t v11;
  _BYTE *v12;

  v1 = *(void **)(v0 + 96);
  swift_bridgeObjectRelease();

  v2 = *(void **)(v0 + 120);
  v4 = *(_QWORD *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 56);
  v5 = *(_QWORD *)(v0 + 40);
  v6 = sub_232EABA34();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v6, v5);
  MEMORY[0x23492A9D0](v2);
  MEMORY[0x23492A9D0](v2);
  v7 = sub_232EB9F28();
  v8 = sub_232EBA078();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v9 = 138412290;
    MEMORY[0x23492A9D0](v2);
    v11 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 16) = v11;
    sub_232EBA09C();
    *v10 = v11;

    _os_log_impl(&dword_232E98000, v7, v8, "Encountered an error while processing tap for impression: %@.", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256010050);
    swift_arrayDestroy();
    MEMORY[0x23492AAA8](v10, -1, -1);
    MEMORY[0x23492AAA8](v9, -1, -1);
  }
  else
  {

  }
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 48) + 8))(*(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 40));
  sub_232E9A170();
  swift_allocError();
  sub_232E9FDB4((uint64_t)v2, v12);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t AppImpression.handleTap(reengagementURL:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2[2] = a1;
  v2[3] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256010070);
  v2[4] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_232E9CC30()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = v0[4];
  v2 = v0[2];
  v3 = sub_232EB9EBC();
  v4 = *(_QWORD *)(v3 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v1, v2, v3);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v4 + 56))(v1, 0, 1, v3);
  v5 = (_QWORD *)swift_task_alloc();
  v0[5] = v5;
  *v5 = v0;
  v5[1] = sub_232E9CCC8;
  return sub_232E9C41C(v0[4]);
}

uint64_t sub_232E9CCC8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(*v1 + 32);
  v3 = *v1;
  *(_QWORD *)(v3 + 48) = v0;
  swift_task_dealloc();
  sub_232E9CF10(v2, &qword_256010070);
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t sub_232E9CD58()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t static AppImpression.isSupported.getter()
{
  return 1;
}

uint64_t sub_232E9CD94(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_232E9CDC8(void (*a1)(void))
{
  a1();
  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_232E9CDE8(uint64_t (*a1)(void))
{
  return a1();
}

_BYTE **sub_232E9CE08(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

void sub_232E9CE18(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = (void *)a4();
  v7 = *a1 + 8;
  sub_232EBA09C();
  *a1 = v7;
  v8 = *a2;
  if (*a2)
  {
    *v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {

  }
}

uint64_t sub_232E9CEC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010030);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_232E9CF10(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_232E9CF4C()
{
  return sub_232E9CFE0(&qword_256010088, (uint64_t (*)(uint64_t))type metadata accessor for AppImpression, (uint64_t)&protocol conformance descriptor for AppImpression);
}

uint64_t type metadata accessor for AppImpression()
{
  uint64_t result;

  result = qword_2560100F0;
  if (!qword_2560100F0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_232E9CFB4()
{
  return sub_232E9CFE0(&qword_256010090, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
}

uint64_t sub_232E9CFE0(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23492AA30](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for AppImpression(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  int *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010030);
  v5 = *(_DWORD *)(*(_QWORD *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v28 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v28 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = v4;
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    v9 = *(int *)(v4 + 52);
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = sub_232EB9F10();
    v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v10, v11, v12);
    v14 = (int *)type metadata accessor for AppImpressionPayload();
    *(_QWORD *)&v10[v14[5]] = *(_QWORD *)&v11[v14[5]];
    *(_QWORD *)&v10[v14[6]] = *(_QWORD *)&v11[v14[6]];
    *(_QWORD *)&v10[v14[7]] = *(_QWORD *)&v11[v14[7]];
    *(_QWORD *)&v10[v14[8]] = *(_QWORD *)&v11[v14[8]];
    v15 = v14[10];
    v16 = &v10[v15];
    v17 = &v11[v15];
    v19 = *(_QWORD *)v17;
    v18 = *((_QWORD *)v17 + 1);
    *(_QWORD *)v16 = v19;
    *((_QWORD *)v16 + 1) = v18;
    v10[v14[11]] = v11[v14[11]];
    v20 = *(int *)(v6 + 56);
    v21 = (uint64_t *)((char *)a1 + v20);
    v22 = (uint64_t *)((char *)a2 + v20);
    v23 = v22[1];
    *v21 = *v22;
    v21[1] = v23;
    v24 = *(int *)(v6 + 60);
    v25 = (uint64_t *)((char *)a1 + v24);
    v26 = (uint64_t *)((char *)a2 + v24);
    v27 = v26[1];
    *v25 = *v26;
    v25[1] = v27;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for AppImpression(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v2 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256010030) + 52);
  v3 = sub_232EB9F10();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  type metadata accessor for AppImpressionPayload();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for AppImpression(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v6 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_256010030);
  v7 = v6[13];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_232EB9F10();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  v11 = (int *)type metadata accessor for AppImpressionPayload();
  *(_QWORD *)&v8[v11[5]] = *(_QWORD *)&v9[v11[5]];
  *(_QWORD *)&v8[v11[6]] = *(_QWORD *)&v9[v11[6]];
  *(_QWORD *)&v8[v11[7]] = *(_QWORD *)&v9[v11[7]];
  *(_QWORD *)&v8[v11[8]] = *(_QWORD *)&v9[v11[8]];
  v12 = v11[10];
  v13 = &v8[v12];
  v14 = &v9[v12];
  v16 = *(_QWORD *)v14;
  v15 = *((_QWORD *)v14 + 1);
  *(_QWORD *)v13 = v16;
  *((_QWORD *)v13 + 1) = v15;
  v8[v11[11]] = v9[v11[11]];
  v17 = v6[14];
  v18 = (_QWORD *)((char *)a1 + v17);
  v19 = (_QWORD *)((char *)a2 + v17);
  v20 = v19[1];
  *v18 = *v19;
  v18[1] = v20;
  v21 = v6[15];
  v22 = (_QWORD *)((char *)a1 + v21);
  v23 = (_QWORD *)((char *)a2 + v21);
  v24 = v23[1];
  *v22 = *v23;
  v22[1] = v24;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for AppImpression(_QWORD *a1, _QWORD *a2)
{
  int *v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_256010030);
  v5 = v4[13];
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_232EB9F10();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 24))(v6, v7, v8);
  v9 = (int *)type metadata accessor for AppImpressionPayload();
  *(_QWORD *)&v6[v9[5]] = *(_QWORD *)&v7[v9[5]];
  *(_QWORD *)&v6[v9[6]] = *(_QWORD *)&v7[v9[6]];
  *(_QWORD *)&v6[v9[7]] = *(_QWORD *)&v7[v9[7]];
  *(_QWORD *)&v6[v9[8]] = *(_QWORD *)&v7[v9[8]];
  v10 = v9[10];
  v11 = &v6[v10];
  v12 = &v7[v10];
  *(_QWORD *)v11 = *(_QWORD *)v12;
  *((_QWORD *)v11 + 1) = *((_QWORD *)v12 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6[v9[11]] = v7[v9[11]];
  v13 = v4[14];
  v14 = (_QWORD *)((char *)a1 + v13);
  v15 = (_QWORD *)((char *)a2 + v13);
  *v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v16 = v4[15];
  v17 = (_QWORD *)((char *)a1 + v16);
  v18 = (_QWORD *)((char *)a2 + v16);
  *v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *initializeWithTake for AppImpression(_OWORD *a1, _OWORD *a2)
{
  __int128 v4;
  int *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  int *v10;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_256010030);
  v6 = v5[13];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_232EB9F10();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = (int *)type metadata accessor for AppImpressionPayload();
  *(_QWORD *)&v7[v10[5]] = *(_QWORD *)&v8[v10[5]];
  *(_QWORD *)&v7[v10[6]] = *(_QWORD *)&v8[v10[6]];
  *(_QWORD *)&v7[v10[7]] = *(_QWORD *)&v8[v10[7]];
  *(_QWORD *)&v7[v10[8]] = *(_QWORD *)&v8[v10[8]];
  *(_OWORD *)&v7[v10[10]] = *(_OWORD *)&v8[v10[10]];
  v7[v10[11]] = v8[v10[11]];
  *(_OWORD *)((char *)a1 + v5[14]) = *(_OWORD *)((char *)a2 + v5[14]);
  *(_OWORD *)((char *)a1 + v5[15]) = *(_OWORD *)((char *)a2 + v5[15]);
  return a1;
}

_QWORD *assignWithTake for AppImpression(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  v6 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_256010030);
  v7 = v6[13];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_232EB9F10();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = (int *)type metadata accessor for AppImpressionPayload();
  *(_QWORD *)&v8[v11[5]] = *(_QWORD *)&v9[v11[5]];
  *(_QWORD *)&v8[v11[6]] = *(_QWORD *)&v9[v11[6]];
  *(_QWORD *)&v8[v11[7]] = *(_QWORD *)&v9[v11[7]];
  *(_QWORD *)&v8[v11[8]] = *(_QWORD *)&v9[v11[8]];
  v12 = v11[10];
  v13 = &v8[v12];
  v14 = &v9[v12];
  v16 = *(_QWORD *)v14;
  v15 = *((_QWORD *)v14 + 1);
  *(_QWORD *)v13 = v16;
  *((_QWORD *)v13 + 1) = v15;
  swift_bridgeObjectRelease();
  v8[v11[11]] = v9[v11[11]];
  v17 = v6[14];
  v18 = (_QWORD *)((char *)a1 + v17);
  v19 = (_QWORD *)((char *)a2 + v17);
  v21 = *v19;
  v20 = v19[1];
  *v18 = v21;
  v18[1] = v20;
  swift_bridgeObjectRelease();
  v22 = v6[15];
  v23 = (_QWORD *)((char *)a1 + v22);
  v24 = (_QWORD *)((char *)a2 + v22);
  v26 = *v24;
  v25 = v24[1];
  *v23 = v26;
  v23[1] = v25;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AppImpression()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_232E9D6E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010030);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for AppImpression()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_232E9D730(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010030);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t sub_232E9D774()
{
  uint64_t result;
  unint64_t v1;

  result = sub_232E9D7DC();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_232E9D7DC()
{
  uint64_t result;

  result = qword_256010100;
  if (!qword_256010100)
  {
    type metadata accessor for AppImpressionPayload();
    sub_232E9B7CC();
    sub_232E9CFE0(&qword_256010048, (uint64_t (*)(uint64_t))type metadata accessor for AppImpressionPayload, (uint64_t)&unk_232EBC0AC);
    type metadata accessor for JWS();
  }
  return result;
}

uint64_t static PostbackUpdateHelper.updateConversionValue(_:coarseCV:clientBundleID:)(uint64_t a1, char *a2, void (*a3)(uint64_t a1, void *a2), ValueMetadata *a4)
{
  char v7;

  v7 = *a2;
  swift_bridgeObjectRetain();
  sub_232EAED10(a1, v7, a3, a4);
  return swift_bridgeObjectRelease();
}

ValueMetadata *type metadata accessor for PostbackUpdateHelper()
{
  return &type metadata for PostbackUpdateHelper;
}

AdAttributionKit::CoarseConversionValue_optional __swiftcall CoarseConversionValue.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  AdAttributionKit::CoarseConversionValue_optional result;
  char v5;

  v2 = v1;
  v3 = sub_232EBA144();
  result.value = swift_bridgeObjectRelease();
  v5 = 3;
  if (v3 < 3)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t CoarseConversionValue.rawValue.getter()
{
  char *v0;

  return *(_QWORD *)&aHigh_2[8 * *v0];
}

uint64_t sub_232E9D964(char *a1, char *a2)
{
  return sub_232E9FEB0(*a1, *a2);
}

uint64_t sub_232E9D970()
{
  return sub_232EA0070();
}

uint64_t sub_232E9D978()
{
  return sub_232EA01D4();
}

uint64_t sub_232E9D980()
{
  return sub_232EA03B4();
}

AdAttributionKit::CoarseConversionValue_optional sub_232E9D988(Swift::String *a1)
{
  return CoarseConversionValue.init(rawValue:)(*a1);
}

uint64_t sub_232E9D994@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = CoarseConversionValue.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_232E9D9B8()
{
  sub_232E9EC48();
  return sub_232EB9FDC();
}

uint64_t sub_232E9DA14()
{
  sub_232E9EC48();
  return sub_232EB9FD0();
}

uint64_t static Postback.reengagementOpenURLParameter.getter()
{
  uint64_t v0;

  v0 = *(_QWORD *)sub_232EB0C64();
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t static Postback.updateConversionValue(_:lockPostback:)(uint64_t a1, char a2)
{
  _QWORD *v2;
  uint64_t v5;
  _QWORD *v6;
  __int16 v7;

  v5 = sub_232EB9F40();
  v2[3] = v5;
  v2[4] = *(_QWORD *)(v5 - 8);
  v2[5] = swift_task_alloc();
  v6 = (_QWORD *)swift_task_alloc();
  v2[6] = v6;
  *v6 = v2;
  v6[1] = sub_232E9DB20;
  if ((a2 & 1) != 0)
    v7 = 259;
  else
    v7 = 3;
  return sub_232EB3A50(a1, v7, 0);
}

uint64_t sub_232E9DB20()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 56) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_232E9DB94()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  uint8_t *v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _BYTE *v14;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 56);
  v4 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  v5 = sub_232EABCD4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v5, v1);
  MEMORY[0x23492A9D0](v2);
  MEMORY[0x23492A9D0](v2);
  v6 = sub_232EB9F28();
  v7 = sub_232EBA078();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = *(void **)(v0 + 56);
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v9 = 138412290;
    MEMORY[0x23492A9D0](v8);
    v11 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 16) = v11;
    sub_232EBA09C();
    *v10 = v11;

    _os_log_impl(&dword_232E98000, v6, v7, "Encountered error while updating postback: %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256010050);
    swift_arrayDestroy();
    MEMORY[0x23492AAA8](v10, -1, -1);
    MEMORY[0x23492AAA8](v9, -1, -1);
  }
  else
  {
    v12 = *(void **)(v0 + 56);

  }
  v13 = *(void **)(v0 + 56);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 32) + 8))(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 24));
  sub_232E9A170();
  swift_allocError();
  sub_232E9FDB4((uint64_t)v13, v14);
  swift_willThrow();

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t static Postback.updateConversionValue(_:coarseConversionValue:lockPostback:)(uint64_t a1, _BYTE *a2, char a3)
{
  _QWORD *v3;
  uint64_t v7;
  _QWORD *v8;
  __int16 v9;
  _QWORD *v10;
  _QWORD *v11;

  v7 = sub_232EB9F40();
  v3[3] = v7;
  v3[4] = *(_QWORD *)(v7 - 8);
  v3[5] = swift_task_alloc();
  if (*a2)
  {
    if (*a2 == 1)
    {
      v8 = (_QWORD *)swift_task_alloc();
      v3[6] = v8;
      *v8 = v3;
      v8[1] = sub_232E9DE9C;
      if ((a3 & 1) != 0)
        v9 = 257;
      else
        v9 = 1;
    }
    else
    {
      v11 = (_QWORD *)swift_task_alloc();
      v3[7] = v11;
      *v11 = v3;
      v11[1] = sub_232E9DF00;
      if ((a3 & 1) != 0)
        v9 = 258;
      else
        v9 = 2;
    }
  }
  else
  {
    v10 = (_QWORD *)swift_task_alloc();
    v3[8] = v10;
    *v10 = v3;
    v10[1] = sub_232E9DF64;
    if ((a3 & 1) != 0)
      v9 = 256;
    else
      v9 = 0;
  }
  return sub_232EB3A50(a1, v9, 0);
}

uint64_t sub_232E9DE9C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (v0)
    *(_QWORD *)(v2 + 72) = v0;
  return swift_task_switch();
}

uint64_t sub_232E9DF00()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (v0)
    *(_QWORD *)(v2 + 72) = v0;
  return swift_task_switch();
}

uint64_t sub_232E9DF64()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (v0)
    *(_QWORD *)(v2 + 72) = v0;
  return swift_task_switch();
}

uint64_t sub_232E9DFC8()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_232E9E008()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  uint8_t *v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _BYTE *v14;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 72);
  v4 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRelease();
  v5 = sub_232EABCD4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v5, v1);
  MEMORY[0x23492A9D0](v2);
  MEMORY[0x23492A9D0](v2);
  v6 = sub_232EB9F28();
  v7 = sub_232EBA078();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = *(void **)(v0 + 72);
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v9 = 138412290;
    MEMORY[0x23492A9D0](v8);
    v11 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 16) = v11;
    sub_232EBA09C();
    *v10 = v11;

    _os_log_impl(&dword_232E98000, v6, v7, "Encountered error while updating postback: %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256010050);
    swift_arrayDestroy();
    MEMORY[0x23492AAA8](v10, -1, -1);
    MEMORY[0x23492AAA8](v9, -1, -1);
  }
  else
  {
    v12 = *(void **)(v0 + 72);

  }
  v13 = *(void **)(v0 + 72);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 32) + 8))(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 24));
  sub_232E9A170();
  swift_allocError();
  sub_232E9FDB4((uint64_t)v13, v14);
  swift_willThrow();

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t static Postback.updateConversionValue(_:)(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = sub_232EB9F40();
  *(_QWORD *)(v1 + 24) = v3;
  *(_QWORD *)(v1 + 32) = *(_QWORD *)(v3 - 8);
  v4 = swift_task_alloc();
  v5 = *a1;
  *(_QWORD *)(v1 + 40) = v4;
  *(_QWORD *)(v1 + 48) = v5;
  *(_BYTE *)(v1 + 88) = *((_BYTE *)a1 + 8);
  *(_BYTE *)(v1 + 89) = *((_BYTE *)a1 + 9);
  *(_QWORD *)(v1 + 56) = a1[2];
  return swift_task_switch();
}

uint64_t sub_232E9E288()
{
  uint64_t v0;
  __int16 v1;
  int v2;
  uint64_t v3;
  _QWORD *v4;
  __int16 v5;

  v1 = *(unsigned __int8 *)(v0 + 89);
  v2 = *(unsigned __int8 *)(v0 + 88);
  v3 = sub_232E9E5C8();
  *(_QWORD *)(v0 + 64) = v3;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v4;
  if (v2)
    v5 = 256;
  else
    v5 = 0;
  *v4 = v0;
  v4[1] = sub_232E9E320;
  return sub_232EB3A50(*(_QWORD *)(v0 + 48), v5 | v1, v3);
}

uint64_t sub_232E9E320()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 80) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_232E9E384()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_232E9E3C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  uint8_t *v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _BYTE *v14;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 80);
  v4 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRelease();
  v5 = sub_232EABCD4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v5, v1);
  MEMORY[0x23492A9D0](v2);
  MEMORY[0x23492A9D0](v2);
  v6 = sub_232EB9F28();
  v7 = sub_232EBA078();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = *(void **)(v0 + 80);
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v9 = 138412290;
    MEMORY[0x23492A9D0](v8);
    v11 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 16) = v11;
    sub_232EBA09C();
    *v10 = v11;

    _os_log_impl(&dword_232E98000, v6, v7, "Encountered error while updating postback: %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256010050);
    swift_arrayDestroy();
    MEMORY[0x23492AAA8](v10, -1, -1);
    MEMORY[0x23492AAA8](v9, -1, -1);
  }
  else
  {
    v12 = *(void **)(v0 + 80);

  }
  v13 = *(void **)(v0 + 80);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 32) + 8))(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 24));
  sub_232E9A170();
  swift_allocError();
  sub_232E9FDB4((uint64_t)v13, v14);
  swift_willThrow();

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_232E9E5C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v7;
  uint64_t v8;

  v1 = *(_QWORD *)(v0 + 16);
  if (!v1)
    return 0;
  v2 = *(_QWORD *)(v1 + 16);
  if (!v2)
    return MEMORY[0x24BEE4B08];
  swift_bridgeObjectRetain();
  v3 = 0;
  v4 = MEMORY[0x24BEE4B08];
  do
  {
    if ((*(_BYTE *)(v1 + v3 + 32) & 1) != 0)
    {
      v8 = v4;
      v5 = 2;
    }
    else
    {
      v8 = v4;
      sub_232E9EC8C(&v7, 0);
      v5 = 1;
    }
    sub_232E9EC8C(&v7, v5);
    v4 = v8;
    ++v3;
  }
  while (v2 != v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t static Postback.isSupported.getter()
{
  return 1;
}

AdAttributionKit::PostbackUpdate::ConversionType_optional __swiftcall PostbackUpdate.ConversionType.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  uint64_t v3;
  AdAttributionKit::PostbackUpdate::ConversionType_optional result;
  char v5;

  v2 = v1;
  v3 = sub_232EBA144();
  result.value = swift_bridgeObjectRelease();
  if (v3 == 1)
    v5 = 1;
  else
    v5 = 2;
  if (!v3)
    v5 = 0;
  *v2 = v5;
  return result;
}

uint64_t PostbackUpdate.ConversionType.rawValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x656761676E656572;
  else
    return 0x6C6C6174736E69;
}

uint64_t sub_232E9E734(char *a1, char *a2)
{
  return sub_232E9FFC8(*a1, *a2);
}

uint64_t sub_232E9E740()
{
  return sub_232EA00D8();
}

uint64_t sub_232E9E748()
{
  return sub_232EA0260();
}

uint64_t sub_232E9E750()
{
  return sub_232EA02C0();
}

AdAttributionKit::PostbackUpdate::ConversionType_optional sub_232E9E758(Swift::String *a1)
{
  return PostbackUpdate.ConversionType.init(rawValue:)(*a1);
}

uint64_t sub_232E9E764@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = PostbackUpdate.ConversionType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t PostbackUpdate.fineConversionValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t PostbackUpdate.lockPostback.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 8);
}

void PostbackUpdate.coarseConversionValue.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 9);
}

uint64_t PostbackUpdate.conversionTypes.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PostbackUpdate.init(fineConversionValue:lockPostback:coarseConversionValue:conversionTypes:)@<X0>(uint64_t result@<X0>, char a2@<W1>, char *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  char v5;

  v5 = *a3;
  *(_QWORD *)a5 = result;
  *(_BYTE *)(a5 + 8) = a2;
  *(_BYTE *)(a5 + 9) = v5;
  *(_QWORD *)(a5 + 16) = a4;
  return result;
}

unint64_t sub_232E9E7C8()
{
  unint64_t result;

  result = qword_256010148;
  if (!qword_256010148)
  {
    result = MEMORY[0x23492AA30](&protocol conformance descriptor for CoarseConversionValue, &type metadata for CoarseConversionValue);
    atomic_store(result, (unint64_t *)&qword_256010148);
  }
  return result;
}

unint64_t sub_232E9E810()
{
  unint64_t result;

  result = qword_256010150;
  if (!qword_256010150)
  {
    result = MEMORY[0x23492AA30](&protocol conformance descriptor for PostbackUpdate.ConversionType, &type metadata for PostbackUpdate.ConversionType);
    atomic_store(result, (unint64_t *)&qword_256010150);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for CoarseConversionValue(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for CoarseConversionValue(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_232E9E930 + 4 * byte_232EBAB65[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_232E9E964 + 4 * asc_232EBAB60[v4]))();
}

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
    return ((uint64_t (*)(void))((char *)&loc_232EB9D50 + 4 * byte_232EBE1A5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_232EB9D84 + 4 * byte_232EBE1A0[v4]))();
}

uint64_t sub_232E9E964(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_232E9E96C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x232E9E974);
  return result;
}

uint64_t sub_232E9E980(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x232E9E988);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_232E9E98C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_232E9E994(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_232E9E9A0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CoarseConversionValue()
{
  return &type metadata for CoarseConversionValue;
}

{
  return &type metadata for CoarseConversionValue;
}

ValueMetadata *type metadata accessor for Postback()
{
  return &type metadata for Postback;
}

uint64_t destroy for PostbackUpdate()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s16AdAttributionKit14PostbackUpdateVwCP_0(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_WORD *)(a1 + 8) = *(_WORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PostbackUpdate(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_BYTE *)(a1 + 9) = *(_BYTE *)(a2 + 9);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for PostbackUpdate(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_BYTE *)(a1 + 9) = *(_BYTE *)(a2 + 9);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PostbackUpdate(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PostbackUpdate(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
      *(_QWORD *)(result + 16) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for PostbackUpdate()
{
  return &type metadata for PostbackUpdate;
}

uint64_t storeEnumTagSinglePayload for PostbackUpdate.ConversionType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_232E9EBC8 + 4 * byte_232EBAB6F[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_232E9EBFC + 4 * byte_232EBAB6A[v4]))();
}

uint64_t sub_232E9EBFC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_232E9EC04(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x232E9EC0CLL);
  return result;
}

uint64_t sub_232E9EC18(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x232E9EC20);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_232E9EC24(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_232E9EC2C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PostbackUpdate.ConversionType()
{
  return &type metadata for PostbackUpdate.ConversionType;
}

unint64_t sub_232E9EC48()
{
  unint64_t result;

  result = qword_256010158;
  if (!qword_256010158)
  {
    result = MEMORY[0x23492AA30](&protocol conformance descriptor for CoarseConversionValue, &type metadata for CoarseConversionValue);
    atomic_store(result, (unint64_t *)&qword_256010158);
  }
  return result;
}

uint64_t sub_232E9EC8C(_BYTE *a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v13;
  char isUniquelyReferenced_nonNull_native;
  char v15;
  uint64_t result;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v20;

  v4 = *v2;
  sub_232EBA288();
  swift_bridgeObjectRetain();
  sub_232EB9F70();
  swift_bridgeObjectRelease();
  v5 = sub_232EBA2A0();
  v6 = -1 << *(_BYTE *)(v4 + 32);
  v7 = v5 & ~v6;
  v17 = a2;
  if (((*(_QWORD *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) != 0)
  {
    v8 = (char)a2;
    v9 = ~v6;
    v10 = *(_QWORD *)&aDownloadredown[8 * v8];
    v11 = *(_QWORD *)&aDownloadredown[8 * v8 + 24];
    while (*(_QWORD *)&aDownloadredown[8 * *(char *)(*(_QWORD *)(v4 + 48) + v7)] != v10
         || *(_QWORD *)&aDownloadredown[8 * *(char *)(*(_QWORD *)(v4 + 48) + v7) + 24] != v11)
    {
      v13 = sub_232EBA228();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v13 & 1) != 0)
        goto LABEL_11;
      v7 = (v7 + 1) & v9;
      if (((*(_QWORD *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) == 0)
        goto LABEL_9;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_11:
    swift_bridgeObjectRelease();
    result = 0;
    v15 = *(_BYTE *)(*(_QWORD *)(*v18 + 48) + v7);
  }
  else
  {
LABEL_9:
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v20 = *v18;
    *v18 = 0x8000000000000000;
    v15 = v17;
    sub_232E9F140(v17, v7, isUniquelyReferenced_nonNull_native);
    *v18 = v20;
    swift_bridgeObjectRelease();
    result = 1;
  }
  *a1 = v15;
  return result;
}

uint64_t sub_232E9EE60()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  char v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(qword_256010160);
  v3 = sub_232EBA0F0();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v6 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v7 = ~(-1 << v5);
    else
      v7 = -1;
    v8 = v7 & *(_QWORD *)(v2 + 56);
    v9 = (unint64_t)(v5 + 63) >> 6;
    v10 = v3 + 56;
    result = swift_retain();
    v12 = 0;
    while (1)
    {
      if (v8)
      {
        v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        v15 = v14 | (v12 << 6);
      }
      else
      {
        v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9)
          goto LABEL_33;
        v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          v12 = v16 + 1;
          if (v16 + 1 >= v9)
            goto LABEL_33;
          v17 = v6[v12];
          if (!v17)
          {
            v12 = v16 + 2;
            if (v16 + 2 >= v9)
              goto LABEL_33;
            v17 = v6[v12];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                v1 = v0;
                v27 = 1 << *(_BYTE *)(v2 + 32);
                if (v27 > 63)
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v6 = -1 << v27;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  v12 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v12 >= v9)
                    goto LABEL_33;
                  v17 = v6[v12];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v12 = v18;
            }
          }
        }
LABEL_23:
        v8 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      v19 = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v15);
      sub_232EBA288();
      sub_232EB9F70();
      swift_bridgeObjectRelease();
      result = sub_232EBA2A0();
      v20 = -1 << *(_BYTE *)(v4 + 32);
      v21 = result & ~v20;
      v22 = v21 >> 6;
      if (((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        v13 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v23 = 0;
        v24 = (unint64_t)(63 - v20) >> 6;
        do
        {
          if (++v22 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v25 = v22 == v24;
          if (v22 == v24)
            v22 = 0;
          v23 |= v25;
          v26 = *(_QWORD *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(_QWORD *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(_BYTE *)(*(_QWORD *)(v4 + 48) + v13) = v19;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_232E9F140(uint64_t result, unint64_t a2, char a3)
{
  uint64_t *v3;
  char v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t *v20;
  char v21;

  v5 = result;
  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_16;
  if ((a3 & 1) != 0)
  {
    sub_232E9EE60();
  }
  else
  {
    if (v7 > v6)
    {
      result = (uint64_t)sub_232E9F314();
      goto LABEL_16;
    }
    sub_232E9F4A4();
  }
  v8 = *v3;
  sub_232EBA288();
  sub_232EB9F70();
  swift_bridgeObjectRelease();
  result = sub_232EBA2A0();
  v9 = -1 << *(_BYTE *)(v8 + 32);
  a2 = result & ~v9;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v10 = v5;
    v11 = ~v9;
    v12 = *(_QWORD *)&aDownloadredown[8 * v10];
    v13 = *(_QWORD *)&aDownloadredown[8 * v10 + 24];
    while (*(_QWORD *)&aDownloadredown[8 * *(char *)(*(_QWORD *)(v8 + 48) + a2)] != v12
         || *(_QWORD *)&aDownloadredown[8 * *(char *)(*(_QWORD *)(v8 + 48) + a2) + 24] != v13)
    {
      v15 = sub_232EBA228();
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      if ((v15 & 1) != 0)
        goto LABEL_20;
      a2 = (a2 + 1) & v11;
      if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
        goto LABEL_16;
    }
    goto LABEL_19;
  }
LABEL_16:
  v16 = *v20;
  *(_QWORD *)(*v20 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_BYTE *)(*(_QWORD *)(v16 + 48) + a2) = v21;
  v17 = *(_QWORD *)(v16 + 16);
  v18 = __OFADD__(v17, 1);
  v19 = v17 + 1;
  if (!v18)
  {
    *(_QWORD *)(v16 + 16) = v19;
    return result;
  }
  __break(1u);
LABEL_19:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_20:
  result = sub_232EBA240();
  __break(1u);
  return result;
}

void *sub_232E9F314()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(qword_256010160);
  v2 = *v0;
  v3 = sub_232EBA0E4();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      v9 = v16 + 1;
      if (v16 + 1 >= v13)
        goto LABEL_28;
      v17 = *(_QWORD *)(v6 + 8 * v9);
      if (!v17)
      {
        v9 = v16 + 2;
        if (v16 + 2 >= v13)
          goto LABEL_28;
        v17 = *(_QWORD *)(v6 + 8 * v9);
        if (!v17)
          break;
      }
    }
LABEL_27:
    v12 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v15) = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v15);
  }
  v18 = v16 + 3;
  if (v18 >= v13)
    goto LABEL_28;
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v9);
    ++v18;
    if (v17)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_232E9F4A4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  char v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(qword_256010160);
  v3 = sub_232EBA0F0();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v9 = (unint64_t)(v5 + 63) >> 6;
  v10 = v3 + 56;
  result = swift_retain();
  v12 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      v12 = v16 + 1;
      if (v16 + 1 >= v9)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v12);
      if (!v17)
      {
        v12 = v16 + 2;
        if (v16 + 2 >= v9)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v12);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    v19 = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v15);
    sub_232EBA288();
    sub_232EB9F70();
    swift_bridgeObjectRelease();
    result = sub_232EBA2A0();
    v20 = -1 << *(_BYTE *)(v4 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6))) != 0)
    {
      v13 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v23 = 0;
      v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v25 = v22 == v24;
        if (v22 == v24)
          v22 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v10 + 8 * v22);
      }
      while (v26 == -1);
      v13 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(_QWORD *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v13) = v19;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v12 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v12 >= v9)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v12);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_232E9F754()
{
  uint64_t result;
  unint64_t v1;

  result = sub_232EBA03C();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

BOOL sub_232E9F7C4(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_232E9F7D0()
{
  return sub_232EBA294();
}

uint64_t sub_232E9F7F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + *(_QWORD *)(*(_QWORD *)v0 + 88);
  v2 = sub_232EBA03C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t sub_232E9F83C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + *(_QWORD *)(*(_QWORD *)v0 + 88);
  v2 = sub_232EBA03C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AsyncStreamListener(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AsyncStreamListener);
}

uint64_t sub_232E9F898()
{
  sub_232EBA288();
  sub_232EBA294();
  return sub_232EBA2A0();
}

uint64_t sub_232E9F8DC()
{
  return sub_232E9F898();
}

uint64_t sub_232E9F8FC()
{
  return sub_232E9F7D0();
}

uint64_t sub_232E9F91C()
{
  sub_232EBA288();
  sub_232E9F7D0();
  return sub_232EBA2A0();
}

BOOL sub_232E9F958(uint64_t *a1, uint64_t *a2)
{
  return sub_232E9F7C4(*a1, *a2);
}

void sub_232E9F978()
{
  JUMPOUT(0x23492AA30);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x23492A9F4](a1, v6, a5);
}

uint64_t static DeveloperMode.isDeveloperModeEnabled.getter()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_232E9F9FC;
  return sub_232EB6700();
}

uint64_t sub_232E9F9FC(char a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  swift_task_dealloc();
  if (v1)
    v5 = 0;
  else
    v5 = a1 & 1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

uint64_t static DeveloperMode.setDeveloperModeEnabled(_:)(char a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_232E9A230;
  return sub_232EB67AC(a1);
}

ValueMetadata *type metadata accessor for DeveloperMode()
{
  return &type metadata for DeveloperMode;
}

uint64_t AdAttributionKitError.description.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_232E9FAF0 + 4 * byte_232EBAEF0[*v0]))(0xD000000000000024, 0x8000000232EBE410);
}

uint64_t sub_232E9FAF0()
{
  return 0x6E776F6E6B6E55;
}

uint64_t sub_232E9FB08@<X0>(uint64_t a1@<X8>)
{
  return a1 - 28;
}

unint64_t sub_232E9FB40()
{
  return 0xD000000000000036;
}

BOOL static AdAttributionKitError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t AdAttributionKitError.hash(into:)()
{
  return sub_232EBA294();
}

uint64_t AdAttributionKitError.hashValue.getter()
{
  sub_232EBA288();
  sub_232EBA294();
  return sub_232EBA2A0();
}

BOOL sub_232E9FBE8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_232E9FC00()
{
  unint64_t result;

  result = qword_2560101F8;
  if (!qword_2560101F8)
  {
    result = MEMORY[0x23492AA30](&protocol conformance descriptor for AdAttributionKitError, &type metadata for AdAttributionKitError);
    atomic_store(result, (unint64_t *)&qword_2560101F8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AdAttributionKitError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AdAttributionKitError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_232E9FD34 + 4 * byte_232EBAEFC[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_232E9FD68 + 4 * byte_232EBAEF7[v4]))();
}

uint64_t sub_232E9FD68(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_232E9FD70(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x232E9FD78);
  return result;
}

uint64_t sub_232E9FD84(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x232E9FD8CLL);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_232E9FD90(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_232E9FD98(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AdAttributionKitError()
{
  return &type metadata for AdAttributionKitError;
}

uint64_t sub_232E9FDB4@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;
  unsigned int v5;
  char v6;

  MEMORY[0x23492A9D0]();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25423FAD8);
  result = swift_dynamicCast();
  if ((_DWORD)result)
  {
    LOBYTE(v5) = v6;
  }
  else
  {
    MEMORY[0x23492A9D0](a1);
    result = swift_dynamicCast();
    if ((_DWORD)result)
    {
      LOBYTE(v5) = byte_232EBB034[v6];
    }
    else
    {
      MEMORY[0x23492A9D0](a1);
      result = swift_dynamicCast();
      if ((_DWORD)result)
        v5 = 0x5040306u >> (8 * v6);
      else
        LOBYTE(v5) = 0;
    }
  }
  *a2 = v5;
  return result;
}

uint64_t sub_232E9FEB0(char a1, char a2)
{
  char v3;

  if (*(_QWORD *)&aHigh_3[8 * a1] == *(_QWORD *)&aHigh_3[8 * a2] && qword_232EBB1A8[a1] == qword_232EBB1A8[a2])
    v3 = 1;
  else
    v3 = sub_232EBA228();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_232E9FF34(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x6B63696C63;
  else
    v3 = 2003134838;
  if (v2)
    v4 = 0xE400000000000000;
  else
    v4 = 0xE500000000000000;
  if ((a2 & 1) != 0)
    v5 = 0x6B63696C63;
  else
    v5 = 2003134838;
  if ((a2 & 1) != 0)
    v6 = 0xE500000000000000;
  else
    v6 = 0xE400000000000000;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_232EBA228();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_232E9FFC8(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x656761676E656572;
  else
    v3 = 0x6C6C6174736E69;
  if (v2)
    v4 = 0xE700000000000000;
  else
    v4 = 0xEC000000746E656DLL;
  if ((a2 & 1) != 0)
    v5 = 0x656761676E656572;
  else
    v5 = 0x6C6C6174736E69;
  if ((a2 & 1) != 0)
    v6 = 0xEC000000746E656DLL;
  else
    v6 = 0xE700000000000000;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_232EBA228();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_232EA0070()
{
  sub_232EBA288();
  sub_232EB9F70();
  swift_bridgeObjectRelease();
  return sub_232EBA2A0();
}

uint64_t sub_232EA00D8()
{
  sub_232EBA288();
  sub_232EB9F70();
  swift_bridgeObjectRelease();
  return sub_232EBA2A0();
}

uint64_t sub_232EA0160()
{
  sub_232EBA288();
  sub_232EB9F70();
  swift_bridgeObjectRelease();
  return sub_232EBA2A0();
}

uint64_t sub_232EA01D4()
{
  sub_232EB9F70();
  return swift_bridgeObjectRelease();
}

uint64_t sub_232EA0214()
{
  sub_232EB9F70();
  return swift_bridgeObjectRelease();
}

uint64_t sub_232EA0260()
{
  sub_232EB9F70();
  return swift_bridgeObjectRelease();
}

uint64_t sub_232EA02C0()
{
  sub_232EBA288();
  sub_232EB9F70();
  swift_bridgeObjectRelease();
  return sub_232EBA2A0();
}

uint64_t sub_232EA0344()
{
  sub_232EBA288();
  sub_232EB9F70();
  swift_bridgeObjectRelease();
  return sub_232EBA2A0();
}

uint64_t sub_232EA03B4()
{
  sub_232EBA288();
  sub_232EB9F70();
  swift_bridgeObjectRelease();
  return sub_232EBA2A0();
}

unint64_t static ImpressionIntake.compactJWSDictionaryKey.getter()
{
  return 0xD00000000000001ALL;
}

unint64_t static ImpressionIntake.reengagementURLDictionaryKey.getter()
{
  return 0xD00000000000001FLL;
}

uint64_t static ImpressionIntake.recordImpression(advertisedItemID:compactJWS:interactionType:clientBundleID:)(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_232EA8944(a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t static ImpressionIntake.processReengagement(advertisedItemID:compactJWS:clientBundleID:url:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X5>, uint64_t a3@<X8>)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_232EA8ADC(a1, a2, a3);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

AdAttributionKit::ImpressionIntake::InteractionType_optional __swiftcall ImpressionIntake.InteractionType.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  uint64_t v3;
  AdAttributionKit::ImpressionIntake::InteractionType_optional result;
  char v5;

  v2 = v1;
  v3 = sub_232EBA144();
  result.value = swift_bridgeObjectRelease();
  if (v3 == 1)
    v5 = 1;
  else
    v5 = 2;
  if (!v3)
    v5 = 0;
  *v2 = v5;
  return result;
}

uint64_t ImpressionIntake.InteractionType.rawValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x6B63696C63;
  else
    return 2003134838;
}

uint64_t sub_232EA05E8(char *a1, char *a2)
{
  return sub_232E9FF34(*a1, *a2);
}

unint64_t sub_232EA05F8()
{
  unint64_t result;

  result = qword_256010200;
  if (!qword_256010200)
  {
    result = MEMORY[0x23492AA30](&protocol conformance descriptor for ImpressionIntake.InteractionType, &type metadata for ImpressionIntake.InteractionType);
    atomic_store(result, (unint64_t *)&qword_256010200);
  }
  return result;
}

uint64_t sub_232EA063C()
{
  return sub_232EA0160();
}

uint64_t sub_232EA0644()
{
  return sub_232EA0214();
}

uint64_t sub_232EA064C()
{
  return sub_232EA0344();
}

AdAttributionKit::ImpressionIntake::InteractionType_optional sub_232EA0654(Swift::String *a1)
{
  return ImpressionIntake.InteractionType.init(rawValue:)(*a1);
}

uint64_t sub_232EA0660@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = ImpressionIntake.InteractionType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_232EA0684()
{
  sub_232EA0808();
  return sub_232EB9FDC();
}

uint64_t sub_232EA06E0()
{
  sub_232EA0808();
  return sub_232EB9FD0();
}

ValueMetadata *type metadata accessor for ImpressionIntake()
{
  return &type metadata for ImpressionIntake;
}

uint64_t storeEnumTagSinglePayload for ImpressionIntake.InteractionType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_232EA0788 + 4 * byte_232EBB045[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_232EA07BC + 4 * byte_232EBB040[v4]))();
}

uint64_t sub_232EA07BC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_232EA07C4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x232EA07CCLL);
  return result;
}

uint64_t sub_232EA07D8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x232EA07E0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_232EA07E4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_232EA07EC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ImpressionIntake.InteractionType()
{
  return &type metadata for ImpressionIntake.InteractionType;
}

unint64_t sub_232EA0808()
{
  unint64_t result;

  result = qword_256010208;
  if (!qword_256010208)
  {
    result = MEMORY[0x23492AA30](&protocol conformance descriptor for ImpressionIntake.InteractionType, &type metadata for ImpressionIntake.InteractionType);
    atomic_store(result, (unint64_t *)&qword_256010208);
  }
  return result;
}

uint64_t sub_232EA084C()
{
  id v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  void (*v15)();
  uint64_t v16;

  v0 = objc_allocWithZone(MEMORY[0x24BDD1988]);
  v1 = (void *)sub_232EB9F4C();
  v2 = objc_msgSend(v0, sel_initWithMachServiceName_options_, v1, 0);

  v3 = (void *)objc_opt_self();
  v4 = objc_msgSend(v3, sel_interfaceWithProtocol_, &unk_2560181D8);
  objc_msgSend(v2, sel_setExportedInterface_, v4);

  v5 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for XPCClient()), sel_init);
  objc_msgSend(v2, sel_setExportedObject_, v5);

  v6 = objc_msgSend(v3, sel_interfaceWithProtocol_, &unk_2560187A0);
  objc_msgSend(v2, sel_setRemoteObjectInterface_, v6);

  v15 = sub_232EA0A58;
  v16 = 0;
  v7 = MEMORY[0x24BDAC760];
  v11 = MEMORY[0x24BDAC760];
  v12 = 1107296256;
  v13 = sub_232EA0A64;
  v14 = &block_descriptor;
  v8 = _Block_copy(&v11);
  objc_msgSend(v2, sel_setInterruptionHandler_, v8);
  _Block_release(v8);
  v15 = sub_232EA0A90;
  v16 = 0;
  v11 = v7;
  v12 = 1107296256;
  v13 = sub_232EA0A64;
  v14 = &block_descriptor_3;
  v9 = _Block_copy(&v11);
  objc_msgSend(v2, sel_setInvalidationHandler_, v9);
  _Block_release(v9);
  objc_msgSend(v2, sel_resume);
  type metadata accessor for DeveloperModeServiceConnection();
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = v2;
  qword_256016D00 = result;
  return result;
}

void sub_232EA0A58()
{
  sub_232EA0A9C("Daemon connection interrupted");
}

uint64_t sub_232EA0A64(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_232EA0A90()
{
  sub_232EA0A9C("Daemon connection invalidated");
}

void sub_232EA0A9C(const char *a1)
{
  uint64_t v2;
  os_log_type_t v3;
  uint8_t *v4;
  NSObject *oslog;

  if (qword_25423FA88 != -1)
    swift_once();
  v2 = sub_232EB9F40();
  __swift_project_value_buffer(v2, (uint64_t)qword_254240AF8);
  oslog = sub_232EB9F28();
  v3 = sub_232EBA078();
  if (os_log_type_enabled(oslog, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_232E98000, oslog, v3, a1, v4, 2u);
    MEMORY[0x23492AAA8](v4, -1, -1);
  }

}

uint64_t sub_232EA0B70()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DeveloperModeServiceConnection()
{
  return objc_opt_self();
}

void sub_232EA0BB8(_QWORD *a1@<X8>)
{
  *a1 = 0;
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

_QWORD *sub_232EA0BF0@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_232EA0C08()
{
  uint64_t result;

  result = sub_232EA0C44();
  qword_256016D08 = result;
  return result;
}

uint64_t type metadata accessor for PostbackUpdateTestingServiceConnection()
{
  return objc_opt_self();
}

uint64_t sub_232EA0C44()
{
  char v0;
  id v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t result;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  ValueMetadata *v19;
  unint64_t v20;
  uint64_t v21;

  v19 = &type metadata for FeatureFlag;
  v20 = sub_232EA0F30();
  LOBYTE(v16) = 1;
  v0 = sub_232EB9F1C();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v16);
  if ((v0 & 1) != 0)
  {
    v1 = objc_allocWithZone(MEMORY[0x24BDD1988]);
    v2 = (void *)sub_232EB9F4C();
    v3 = objc_msgSend(v1, sel_initWithMachServiceName_options_, v2, 0, v16);

    v4 = (void *)objc_opt_self();
    v5 = objc_msgSend(v4, sel_interfaceWithProtocol_, &unk_2560181D8);
    objc_msgSend(v3, sel_setExportedInterface_, v5);

    v6 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for XPCClient()), sel_init);
    objc_msgSend(v3, sel_setExportedObject_, v6);

    v7 = objc_msgSend(v4, sel_interfaceWithProtocol_, &unk_256018740);
    objc_msgSend(v3, sel_setRemoteObjectInterface_, v7);

    v20 = (unint64_t)sub_232EA0A58;
    v21 = 0;
    v8 = MEMORY[0x24BDAC760];
    v16 = MEMORY[0x24BDAC760];
    v17 = 1107296256;
    v18 = sub_232EA0A64;
    v19 = (ValueMetadata *)&block_descriptor_0;
    v9 = _Block_copy(&v16);
    objc_msgSend(v3, sel_setInterruptionHandler_, v9);
    _Block_release(v9);
    v20 = (unint64_t)sub_232EA0A90;
    v21 = 0;
    v16 = v8;
    v17 = 1107296256;
    v18 = sub_232EA0A64;
    v19 = (ValueMetadata *)&block_descriptor_3_0;
    v10 = _Block_copy(&v16);
    objc_msgSend(v3, sel_setInvalidationHandler_, v10);
    _Block_release(v10);
    objc_msgSend(v3, sel_resume);
    type metadata accessor for PostbackUpdateTestingServiceConnection();
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = v3;
  }
  else
  {
    if (qword_25423FA88 != -1)
      swift_once();
    v12 = sub_232EB9F40();
    __swift_project_value_buffer(v12, (uint64_t)qword_254240AF8);
    v13 = sub_232EB9F28();
    v14 = sub_232EBA078();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_232E98000, v13, v14, "Testing feature flag is not enabled", v15, 2u);
      MEMORY[0x23492AAA8](v15, -1, -1);
    }

    return 0;
  }
  return result;
}

unint64_t sub_232EA0F30()
{
  unint64_t result;

  result = qword_25423F740[0];
  if (!qword_25423F740[0])
  {
    result = MEMORY[0x23492AA30](&unk_232EBD6CC, &type metadata for FeatureFlag);
    atomic_store(result, qword_25423F740);
  }
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

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_232EA0FB4()
{
  return 0x676E6967676F4CLL;
}

uint64_t sub_232EA0FCC()
{
  return 1;
}

uint64_t sub_232EA0FD4()
{
  return sub_232EBA294();
}

uint64_t sub_232EA1000()
{
  return 0x676E6967676F6CLL;
}

uint64_t sub_232EA1018@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x676E6967676F6CLL && a2 == 0xE700000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_232EBA228();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_232EA10AC()
{
  sub_232EA1288();
  return sub_232EBA2D0();
}

uint64_t sub_232EA10D4()
{
  sub_232EA1288();
  return sub_232EBA2DC();
}

uint64_t sub_232EA10FC()
{
  sub_232EA12CC();
  return sub_232EBA2D0();
}

uint64_t sub_232EA1124()
{
  sub_232EA12CC();
  return sub_232EBA2DC();
}

uint64_t sub_232EA114C(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010400);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010408);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_232EA1288();
  sub_232EBA2C4();
  sub_232EA12CC();
  sub_232EBA1D4();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

unint64_t sub_232EA1288()
{
  unint64_t result;

  result = qword_256010410;
  if (!qword_256010410)
  {
    result = MEMORY[0x23492AA30](&unk_232EBB9E4, &type metadata for MessageRegistration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010410);
  }
  return result;
}

unint64_t sub_232EA12CC()
{
  unint64_t result;

  result = qword_256010418;
  if (!qword_256010418)
  {
    result = MEMORY[0x23492AA30](&unk_232EBB994, &type metadata for MessageRegistration.LoggingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010418);
  }
  return result;
}

uint64_t sub_232EA1310()
{
  sub_232EBA288();
  sub_232EBA294();
  return sub_232EBA2A0();
}

uint64_t sub_232EA1350(_QWORD *a1)
{
  return sub_232EA24C0(a1);
}

uint64_t sub_232EA1364()
{
  _BYTE *v0;

  if (*v0)
    return 6778732;
  else
    return 0xD000000000000015;
}

uint64_t sub_232EA139C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_232EA27E8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_232EA13C0()
{
  sub_232EA271C();
  return sub_232EBA2D0();
}

uint64_t sub_232EA13E8()
{
  sub_232EA271C();
  return sub_232EBA2DC();
}

uint64_t sub_232EA1410()
{
  sub_232EA27A4();
  return sub_232EBA2D0();
}

uint64_t sub_232EA1438()
{
  sub_232EA27A4();
  return sub_232EBA2DC();
}

uint64_t sub_232EA1460()
{
  return 6778732;
}

uint64_t sub_232EA1470@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 6778732 && a2 == 0xE300000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_232EBA228();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_232EA14F4()
{
  sub_232EA2760();
  return sub_232EBA2D0();
}

uint64_t sub_232EA151C()
{
  sub_232EA2760();
  return sub_232EBA2DC();
}

uint64_t sub_232EA1544(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  _QWORD v15[2];
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;

  v17 = a3;
  v15[1] = a2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010420);
  v16 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15[0] = __swift_instantiateConcreteTypeFromMangledName(&qword_256010428);
  v7 = *(_QWORD *)(v15[0] - 8);
  MEMORY[0x24BDAC7A8](v15[0]);
  v9 = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010430);
  v18 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_232EA271C();
  v13 = v17;
  sub_232EBA2C4();
  if (v13)
  {
    v20 = 1;
    sub_232EA2760();
    sub_232EBA1D4();
    sub_232EBA1EC();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v6, v4);
  }
  else
  {
    v19 = 0;
    sub_232EA27A4();
    sub_232EBA1D4();
    (*(void (**)(char *, _QWORD))(v7 + 8))(v9, v15[0]);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v12, v10);
}

_QWORD *sub_232EA1760(_QWORD *a1)
{
  return sub_232EA28C4(a1);
}

_QWORD *sub_232EA1774@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  _QWORD *result;
  uint64_t v5;

  result = sub_232EA28C4(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

uint64_t sub_232EA179C(_QWORD *a1)
{
  uint64_t *v1;

  return sub_232EA1544(a1, *v1, v1[1]);
}

uint64_t sub_232EA17B4(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_232EA17E4()
{
  sub_232EBA288();
  sub_232EBA294();
  return sub_232EBA2A0();
}

uint64_t sub_232EA1820()
{
  return 1701869940;
}

uint64_t sub_232EA1830@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 1701869940 && a2 == 0xE400000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_232EBA228();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_232EA18B4()
{
  sub_232EA2C50();
  return sub_232EBA2D0();
}

uint64_t sub_232EA18DC()
{
  sub_232EA2C50();
  return sub_232EBA2DC();
}

uint64_t sub_232EA1904(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _QWORD v11[2];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010440);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_232EA2C50();
  sub_232EBA2C4();
  v11[0] = a2;
  v11[1] = a3;
  sub_232EA2C94();
  sub_232EBA210();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

_QWORD *sub_232EA1A08(_QWORD *a1)
{
  return sub_232EA2CD8(a1);
}

_QWORD *sub_232EA1A1C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  _QWORD *result;
  uint64_t v5;

  result = sub_232EA2CD8(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

uint64_t sub_232EA1A44(_QWORD *a1)
{
  uint64_t *v1;

  return sub_232EA1904(a1, *v1, v1[1]);
}

uint64_t sub_232EA1A5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256010450);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_232EBB260;
  *(_QWORD *)(v4 + 32) = a1;
  *(_QWORD *)(v4 + 40) = a2;
  swift_bridgeObjectRetain();
  sub_232EA1AC4();
  return swift_bridgeObjectRelease();
}

uint64_t sub_232EA1AC4()
{
  void *v0;
  void *v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;

  v1 = v0;
  sub_232EB9E8C();
  swift_allocObject();
  sub_232EB9E80();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25423FA90);
  sub_232EA2DFC();
  v2 = sub_232EB9E74();
  v4 = v3;
  swift_release();
  v5 = (void *)sub_232EB9ED4();
  objc_msgSend(v1, sel_handleMessages_, v5);

  return sub_232EA2EE8(v2, v4);
}

uint64_t sub_232EA1DC8(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  sub_232EA1A5C(a1, a2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_232EA1E10(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_232EA1E80(v6, v7, a3);
  v8 = *a1 + 8;
  sub_232EBA09C();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_232EA1E80(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_232EA1F50(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_232EA386C((uint64_t)v12, *a3);
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
      sub_232EA386C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_232EA1F50(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_232EBA0A8();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_232EA2108(a5, a6);
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
  v8 = sub_232EBA120();
  if (!v8)
  {
    sub_232EBA12C();
    __break(1u);
LABEL_17:
    result = sub_232EBA138();
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

uint64_t sub_232EA2108(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_232EA219C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_232EA2374(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_232EA2374(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_232EA219C(uint64_t a1, unint64_t a2)
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
      v3 = sub_232EA2310(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_232EBA0FC();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_232EBA12C();
      __break(1u);
LABEL_10:
      v2 = sub_232EB9FA0();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_232EBA138();
    __break(1u);
LABEL_14:
    result = sub_232EBA12C();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_232EA2310(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560104B0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_232EA2374(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560104B0);
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
  result = sub_232EBA138();
  __break(1u);
  return result;
}

uint64_t sub_232EA24C0(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560104C0);
  v2 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560104C8);
  v5 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_232EA1288();
  v8 = v23;
  sub_232EBA2B8();
  if (v8)
    goto LABEL_7;
  v20 = a1;
  v23 = v5;
  v10 = v21;
  v9 = v22;
  if (*(_QWORD *)(sub_232EBA1BC() + 16) != 1)
  {
    v14 = sub_232EBA114();
    swift_allocError();
    v16 = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560104B8);
    *v16 = &type metadata for MessageRegistration;
    sub_232EBA15C();
    sub_232EBA108();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v14 - 8) + 104))(v16, *MEMORY[0x24BEE26D0], v14);
    swift_willThrow();
    v17 = v23;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v7, v9);
    a1 = v20;
LABEL_7:
    v13 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v13);
  }
  sub_232EA12CC();
  v11 = v4;
  sub_232EBA150();
  v12 = v23;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v11, v10);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v9);
  v13 = (uint64_t)v20;
  return __swift_destroy_boxed_opaque_existential_1(v13);
}

unint64_t sub_232EA271C()
{
  unint64_t result;

  result = qword_25423F9E0;
  if (!qword_25423F9E0)
  {
    result = MEMORY[0x23492AA30](&unk_232EBB944, &type metadata for XPCClientMessage.MessageType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25423F9E0);
  }
  return result;
}

unint64_t sub_232EA2760()
{
  unint64_t result;

  result = qword_256010438;
  if (!qword_256010438)
  {
    result = MEMORY[0x23492AA30](&unk_232EBB8F4, &type metadata for XPCClientMessage.MessageType.LogCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010438);
  }
  return result;
}

unint64_t sub_232EA27A4()
{
  unint64_t result;

  result = qword_25423FA08;
  if (!qword_25423FA08)
  {
    result = MEMORY[0x23492AA30](&unk_232EBB8A4, &type metadata for XPCClientMessage.MessageType.ConnectionEstablishedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25423FA08);
  }
  return result;
}

uint64_t sub_232EA27E8(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000015 && a2 == 0x8000000232EBEAF0 || (sub_232EBA228() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 6778732 && a2 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v5 = sub_232EBA228();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

_QWORD *sub_232EA28C4(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _QWORD *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  _QWORD *v28;
  char v29;
  char v30;

  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_25423FAA8);
  v26 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v27 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_25423FAB0);
  v3 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25423FAA0);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_232EA271C();
  v11 = (uint64_t)v28;
  sub_232EBA2B8();
  if (v11)
    goto LABEL_9;
  v12 = v5;
  v13 = v27;
  v23 = v7;
  v28 = a1;
  v14 = sub_232EBA1BC();
  v15 = v14;
  if (*(_QWORD *)(v14 + 16) != 1)
  {
    v19 = sub_232EBA114();
    swift_allocError();
    v21 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560104B8);
    *v21 = &type metadata for XPCClientMessage.MessageType;
    v10 = v9;
    sub_232EBA15C();
    sub_232EBA108();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v19 - 8) + 104))(v21, *MEMORY[0x24BEE26D0], v19);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v9, v6);
    a1 = v28;
LABEL_9:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return v10;
  }
  if ((*(_BYTE *)(v14 + 32) & 1) != 0)
  {
    v30 = 1;
    sub_232EA2760();
    sub_232EBA150();
    v25 = v15;
    v16 = v24;
    v17 = sub_232EBA180();
    v18 = v23;
    v10 = (_QWORD *)v17;
    (*(void (**)(char *, uint64_t))(v26 + 8))(v13, v16);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v9, v6);
  }
  else
  {
    v29 = 0;
    sub_232EA27A4();
    sub_232EBA150();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v12, v25);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v9, v6);
    v10 = 0;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
  return v10;
}

unint64_t sub_232EA2C50()
{
  unint64_t result;

  result = qword_25423FA28;
  if (!qword_25423FA28)
  {
    result = MEMORY[0x23492AA30](&unk_232EBB854, &type metadata for XPCClientMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25423FA28);
  }
  return result;
}

unint64_t sub_232EA2C94()
{
  unint64_t result;

  result = qword_256010448;
  if (!qword_256010448)
  {
    result = MEMORY[0x23492AA30](&unk_232EBB39C, &type metadata for XPCClientMessage.MessageType);
    atomic_store(result, (unint64_t *)&qword_256010448);
  }
  return result;
}

_QWORD *sub_232EA2CD8(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  _QWORD *v9;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25423FAB8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_232EA2C50();
  sub_232EBA2B8();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    sub_232EA38AC();
    sub_232EBA1A4();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    v7 = v9;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v7;
}

unint64_t sub_232EA2DFC()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_256010458;
  if (!qword_256010458)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25423FA90);
    v2 = sub_232EA2EA4();
    result = MEMORY[0x23492AA30](MEMORY[0x24BEE12A0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_256010458);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23492AA24](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_232EA2EA4()
{
  unint64_t result;

  result = qword_256010460;
  if (!qword_256010460)
  {
    result = MEMORY[0x23492AA30](&unk_232EBB3EC, &type metadata for XPCClientMessage);
    atomic_store(result, (unint64_t *)&qword_256010460);
  }
  return result;
}

uint64_t sub_232EA2EE8(uint64_t a1, unint64_t a2)
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

unint64_t sub_232EA2F30()
{
  unint64_t result;

  result = qword_256010468;
  if (!qword_256010468)
  {
    result = MEMORY[0x23492AA30](&unk_232EBB294, &type metadata for MessageRegistration);
    atomic_store(result, (unint64_t *)&qword_256010468);
  }
  return result;
}

uint64_t sub_232EA2F80()
{
  return 0;
}

ValueMetadata *type metadata accessor for MessageRegistration()
{
  return &type metadata for MessageRegistration;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for XPCClientMessage(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for XPCClientMessage(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for XPCClientMessage()
{
  return &type metadata for XPCClientMessage;
}

_QWORD *initializeBufferWithCopyOfBuffer for XPCClientMessage.MessageType(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for XPCClientMessage.MessageType()
{
  return swift_bridgeObjectRelease();
}

_QWORD *_s20AttributionKitCommon16XPCClientMessageV11MessageTypeOwca_0(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for XPCClientMessage.MessageType(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for XPCClientMessage.MessageType(uint64_t a1, unsigned int a2)
{
  unint64_t v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  if ((v3 + 1) >= 2)
    return v3;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for XPCClientMessage.MessageType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

uint64_t sub_232EA31AC(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_232EA31C4(_QWORD *result, int a2)
{
  if (a2 < 0)
  {
    *result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for XPCClientMessage.MessageType()
{
  return &type metadata for XPCClientMessage.MessageType;
}

ValueMetadata *type metadata accessor for XPCClientMessage.CodingKeys()
{
  return &type metadata for XPCClientMessage.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for XPCClientMessage.MessageType.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_232EA3250 + 4 * byte_232EBB285[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_232EA3284 + 4 * byte_232EBB280[v4]))();
}

uint64_t sub_232EA3284(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_232EA328C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x232EA3294);
  return result;
}

uint64_t sub_232EA32A0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x232EA32A8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_232EA32AC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_232EA32B4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for XPCClientMessage.MessageType.CodingKeys()
{
  return &type metadata for XPCClientMessage.MessageType.CodingKeys;
}

ValueMetadata *type metadata accessor for XPCClientMessage.MessageType.ConnectionEstablishedCodingKeys()
{
  return &type metadata for XPCClientMessage.MessageType.ConnectionEstablishedCodingKeys;
}

ValueMetadata *type metadata accessor for XPCClientMessage.MessageType.LogCodingKeys()
{
  return &type metadata for XPCClientMessage.MessageType.LogCodingKeys;
}

uint64_t getEnumTagSinglePayload for ImpressionType(unsigned int *a1, int a2)
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

uint64_t _s20AttributionKitCommon19MessageRegistrationOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_232EA3380 + 4 * byte_232EBB28A[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_232EA33A0 + 4 * byte_232EBB28F[v4]))();
}

_BYTE *sub_232EA3380(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_232EA33A0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_232EA33A8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_232EA33B0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_232EA33B8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_232EA33C0(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for MessageRegistration.CodingKeys()
{
  return &type metadata for MessageRegistration.CodingKeys;
}

ValueMetadata *type metadata accessor for MessageRegistration.LoggingCodingKeys()
{
  return &type metadata for MessageRegistration.LoggingCodingKeys;
}

unint64_t sub_232EA33F0()
{
  unint64_t result;

  result = qword_256010470;
  if (!qword_256010470)
  {
    result = MEMORY[0x23492AA30](&unk_232EBB5B4, &type metadata for MessageRegistration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010470);
  }
  return result;
}

unint64_t sub_232EA3438()
{
  unint64_t result;

  result = qword_256010478;
  if (!qword_256010478)
  {
    result = MEMORY[0x23492AA30](&unk_232EBB66C, &type metadata for XPCClientMessage.MessageType.LogCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010478);
  }
  return result;
}

unint64_t sub_232EA3480()
{
  unint64_t result;

  result = qword_256010480;
  if (!qword_256010480)
  {
    result = MEMORY[0x23492AA30](&unk_232EBB774, &type metadata for XPCClientMessage.MessageType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010480);
  }
  return result;
}

unint64_t sub_232EA34C8()
{
  unint64_t result;

  result = qword_256010488;
  if (!qword_256010488)
  {
    result = MEMORY[0x23492AA30](&unk_232EBB82C, &type metadata for XPCClientMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010488);
  }
  return result;
}

unint64_t sub_232EA3510()
{
  unint64_t result;

  result = qword_25423FA38;
  if (!qword_25423FA38)
  {
    result = MEMORY[0x23492AA30](&unk_232EBB79C, &type metadata for XPCClientMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25423FA38);
  }
  return result;
}

unint64_t sub_232EA3558()
{
  unint64_t result;

  result = qword_25423FA30;
  if (!qword_25423FA30)
  {
    result = MEMORY[0x23492AA30](&unk_232EBB7C4, &type metadata for XPCClientMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25423FA30);
  }
  return result;
}

unint64_t sub_232EA35A0()
{
  unint64_t result;

  result = qword_25423FA18;
  if (!qword_25423FA18)
  {
    result = MEMORY[0x23492AA30](&unk_232EBB694, &type metadata for XPCClientMessage.MessageType.ConnectionEstablishedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25423FA18);
  }
  return result;
}

unint64_t sub_232EA35E8()
{
  unint64_t result;

  result = qword_25423FA10;
  if (!qword_25423FA10)
  {
    result = MEMORY[0x23492AA30](&unk_232EBB6BC, &type metadata for XPCClientMessage.MessageType.ConnectionEstablishedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25423FA10);
  }
  return result;
}

unint64_t sub_232EA3630()
{
  unint64_t result;

  result = qword_25423FA00;
  if (!qword_25423FA00)
  {
    result = MEMORY[0x23492AA30](&unk_232EBB5DC, &type metadata for XPCClientMessage.MessageType.LogCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25423FA00);
  }
  return result;
}

unint64_t sub_232EA3678()
{
  unint64_t result;

  result = qword_25423F9F8;
  if (!qword_25423F9F8)
  {
    result = MEMORY[0x23492AA30](&unk_232EBB604, &type metadata for XPCClientMessage.MessageType.LogCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25423F9F8);
  }
  return result;
}

unint64_t sub_232EA36C0()
{
  unint64_t result;

  result = qword_25423F9F0;
  if (!qword_25423F9F0)
  {
    result = MEMORY[0x23492AA30](&unk_232EBB6E4, &type metadata for XPCClientMessage.MessageType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25423F9F0);
  }
  return result;
}

unint64_t sub_232EA3708()
{
  unint64_t result;

  result = qword_25423F9E8;
  if (!qword_25423F9E8)
  {
    result = MEMORY[0x23492AA30](&unk_232EBB70C, &type metadata for XPCClientMessage.MessageType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25423F9E8);
  }
  return result;
}

unint64_t sub_232EA3750()
{
  unint64_t result;

  result = qword_256010490;
  if (!qword_256010490)
  {
    result = MEMORY[0x23492AA30](&unk_232EBB4D4, &type metadata for MessageRegistration.LoggingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010490);
  }
  return result;
}

unint64_t sub_232EA3798()
{
  unint64_t result;

  result = qword_256010498;
  if (!qword_256010498)
  {
    result = MEMORY[0x23492AA30](&unk_232EBB4FC, &type metadata for MessageRegistration.LoggingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010498);
  }
  return result;
}

unint64_t sub_232EA37E0()
{
  unint64_t result;

  result = qword_2560104A0;
  if (!qword_2560104A0)
  {
    result = MEMORY[0x23492AA30](&unk_232EBB524, &type metadata for MessageRegistration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560104A0);
  }
  return result;
}

unint64_t sub_232EA3828()
{
  unint64_t result;

  result = qword_2560104A8;
  if (!qword_2560104A8)
  {
    result = MEMORY[0x23492AA30](&unk_232EBB54C, &type metadata for MessageRegistration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560104A8);
  }
  return result;
}

uint64_t sub_232EA386C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_232EA38AC()
{
  unint64_t result;

  result = qword_25423FA20;
  if (!qword_25423FA20)
  {
    result = MEMORY[0x23492AA30](&unk_232EBB374, &type metadata for XPCClientMessage.MessageType);
    atomic_store(result, (unint64_t *)&qword_25423FA20);
  }
  return result;
}

uint64_t sub_232EA3900(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;

  v3[8] = a2;
  v3[9] = v2;
  v3[7] = a1;
  v3[10] = *v2;
  return swift_task_switch();
}

uint64_t sub_232EA3924()
{
  uint64_t v0;
  unint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  __int128 v14;

  *(_QWORD *)(v0 + 40) = &type metadata for FeatureFlag;
  v1 = sub_232EA0F30();
  *(_BYTE *)(v0 + 16) = 0;
  *(_QWORD *)(v0 + 48) = v1;
  v2 = sub_232EB9F1C();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  if ((v2 & 1) != 0)
  {
    sub_232EB9E8C();
    swift_allocObject();
    sub_232EB9E80();
    sub_232EA6BFC();
    v3 = sub_232EB9E74();
    *(_QWORD *)(v0 + 88) = v3;
    *(_QWORD *)(v0 + 96) = v4;
    v6 = v3;
    v7 = v4;
    v9 = *(_QWORD *)(v0 + 72);
    v8 = *(_QWORD *)(v0 + 80);
    v14 = *(_OWORD *)(v0 + 56);
    swift_release();
    v10 = *(_QWORD *)(v9 + 16);
    v11 = swift_task_alloc();
    *(_QWORD *)(v0 + 104) = v11;
    *(_QWORD *)(v11 + 16) = v10;
    *(_OWORD *)(v11 + 24) = v14;
    *(_QWORD *)(v11 + 40) = v6;
    *(_QWORD *)(v11 + 48) = v7;
    *(_QWORD *)(v11 + 56) = v8;
    v12 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 112) = v12;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25423FAE0);
    *v12 = v0;
    v12[1] = sub_232EA3AE8;
    return sub_232EBA234();
  }
  else
  {
    sub_232EA685C();
    swift_allocError();
    *v5 = 3;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_232EA3AE8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 120) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_232EA3B54(char a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;

  *(_QWORD *)(v4 + 64) = a3;
  *(_QWORD *)(v4 + 72) = v3;
  *(_QWORD *)(v4 + 56) = a2;
  *(_BYTE *)(v4 + 130) = a1;
  *(_QWORD *)(v4 + 80) = *v3;
  return swift_task_switch();
}

uint64_t sub_232EA3B7C()
{
  uint64_t v0;
  unint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  __int128 v14;

  *(_QWORD *)(v0 + 40) = &type metadata for FeatureFlag;
  v1 = sub_232EA0F30();
  *(_BYTE *)(v0 + 16) = 0;
  *(_QWORD *)(v0 + 48) = v1;
  v2 = sub_232EB9F1C();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  if ((v2 & 1) != 0)
  {
    *(_BYTE *)(v0 + 129) = *(_BYTE *)(v0 + 130);
    sub_232EB9E8C();
    swift_allocObject();
    sub_232EB9E80();
    sub_232EA6B4C();
    v3 = sub_232EB9E74();
    *(_QWORD *)(v0 + 88) = v3;
    *(_QWORD *)(v0 + 96) = v4;
    v6 = v3;
    v7 = v4;
    v9 = *(_QWORD *)(v0 + 72);
    v8 = *(_QWORD *)(v0 + 80);
    v14 = *(_OWORD *)(v0 + 56);
    swift_release();
    v10 = *(_QWORD *)(v9 + 16);
    v11 = swift_task_alloc();
    *(_QWORD *)(v0 + 104) = v11;
    *(_QWORD *)(v11 + 16) = v10;
    *(_OWORD *)(v11 + 24) = v14;
    *(_QWORD *)(v11 + 40) = v6;
    *(_QWORD *)(v11 + 48) = v7;
    *(_QWORD *)(v11 + 56) = v8;
    v12 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 112) = v12;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25423FAE0);
    *v12 = v0;
    v12[1] = sub_232EA3D50;
    return sub_232EBA234();
  }
  else
  {
    sub_232EA685C();
    swift_allocError();
    *v5 = 3;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_232EA3D50()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 120) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_232EA3DBC()
{
  uint64_t v0;

  sub_232EA2EE8(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 96));
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(unsigned __int8 *)(v0 + 128));
}

uint64_t sub_232EA3DF4()
{
  uint64_t v0;

  sub_232EA2EE8(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 96));
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_232EA3E34(uint64_t a1, __int16 a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;

  *(_QWORD *)(v6 + 104) = a5;
  *(_QWORD *)(v6 + 112) = v5;
  *(_QWORD *)(v6 + 88) = a3;
  *(_QWORD *)(v6 + 96) = a4;
  *(_WORD *)(v6 + 168) = a2;
  *(_QWORD *)(v6 + 80) = a1;
  *(_QWORD *)(v6 + 120) = *v5;
  return swift_task_switch();
}

uint64_t sub_232EA3E60()
{
  uint64_t v0;
  unint64_t v1;
  char v2;
  __int16 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  __int128 v16;

  *(_QWORD *)(v0 + 40) = &type metadata for FeatureFlag;
  v1 = sub_232EA0F30();
  *(_BYTE *)(v0 + 16) = 0;
  *(_QWORD *)(v0 + 48) = v1;
  v2 = sub_232EB9F1C();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  if ((v2 & 1) != 0)
  {
    v3 = *(_WORD *)(v0 + 168);
    v4 = *(_QWORD *)(v0 + 88);
    *(_QWORD *)(v0 + 56) = *(_QWORD *)(v0 + 80);
    *(_BYTE *)(v0 + 64) = v3;
    *(_BYTE *)(v0 + 65) = HIBYTE(v3) & 1;
    *(_QWORD *)(v0 + 72) = v4;
    sub_232EB9E8C();
    swift_allocObject();
    sub_232EB9E80();
    sub_232EA6AE4();
    v5 = sub_232EB9E74();
    *(_QWORD *)(v0 + 128) = v5;
    *(_QWORD *)(v0 + 136) = v6;
    v8 = v5;
    v9 = v6;
    v11 = *(_QWORD *)(v0 + 112);
    v10 = *(_QWORD *)(v0 + 120);
    v16 = *(_OWORD *)(v0 + 96);
    swift_release();
    v12 = *(_QWORD *)(v11 + 16);
    v13 = swift_task_alloc();
    *(_QWORD *)(v0 + 144) = v13;
    *(_QWORD *)(v13 + 16) = v12;
    *(_OWORD *)(v13 + 24) = v16;
    *(_QWORD *)(v13 + 40) = v8;
    *(_QWORD *)(v13 + 48) = v9;
    *(_QWORD *)(v13 + 56) = v10;
    v14 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 152) = v14;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25423FAE0);
    *v14 = v0;
    v14[1] = sub_232EA4048;
    return sub_232EBA234();
  }
  else
  {
    sub_232EA685C();
    swift_allocError();
    *v7 = 3;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_232EA4048()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 160) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_232EA40B4()
{
  uint64_t v0;

  sub_232EA2EE8(*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 136));
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(unsigned __int8 *)(v0 + 170));
}

uint64_t sub_232EA40EC()
{
  uint64_t v0;

  sub_232EA2EE8(*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 136));
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_232EA412C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;

  v3[8] = a2;
  v3[9] = v2;
  v3[7] = a1;
  v3[10] = *v2;
  return swift_task_switch();
}

uint64_t sub_232EA4150()
{
  uint64_t v0;
  unint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  __int128 v14;

  *(_QWORD *)(v0 + 40) = &type metadata for FeatureFlag;
  v1 = sub_232EA0F30();
  *(_BYTE *)(v0 + 16) = 0;
  *(_QWORD *)(v0 + 48) = v1;
  v2 = sub_232EB9F1C();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  if ((v2 & 1) != 0)
  {
    sub_232EB9E8C();
    swift_allocObject();
    sub_232EB9E80();
    sub_232EA6A14();
    v3 = sub_232EB9E74();
    *(_QWORD *)(v0 + 88) = v3;
    *(_QWORD *)(v0 + 96) = v4;
    v6 = v3;
    v7 = v4;
    v9 = *(_QWORD *)(v0 + 72);
    v8 = *(_QWORD *)(v0 + 80);
    v14 = *(_OWORD *)(v0 + 56);
    swift_release();
    v10 = *(_QWORD *)(v9 + 16);
    v11 = swift_task_alloc();
    *(_QWORD *)(v0 + 104) = v11;
    *(_QWORD *)(v11 + 16) = v10;
    *(_OWORD *)(v11 + 24) = v14;
    *(_QWORD *)(v11 + 40) = v6;
    *(_QWORD *)(v11 + 48) = v7;
    *(_QWORD *)(v11 + 56) = v8;
    v12 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 112) = v12;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25423FAE0);
    *v12 = v0;
    v12[1] = sub_232EA3D50;
    return sub_232EBA234();
  }
  else
  {
    sub_232EA685C();
    swift_allocError();
    *v5 = 3;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_232EA4314(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;

  v3[8] = a2;
  v3[9] = v2;
  v3[7] = a1;
  v3[10] = *v2;
  return swift_task_switch();
}

uint64_t sub_232EA4338()
{
  uint64_t v0;
  unint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  __int128 v14;

  *(_QWORD *)(v0 + 40) = &type metadata for FeatureFlag;
  v1 = sub_232EA0F30();
  *(_BYTE *)(v0 + 16) = 0;
  *(_QWORD *)(v0 + 48) = v1;
  v2 = sub_232EB9F1C();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  if ((v2 & 1) != 0)
  {
    sub_232EB9E8C();
    swift_allocObject();
    sub_232EB9E80();
    sub_232EA68A0();
    v3 = sub_232EB9E74();
    *(_QWORD *)(v0 + 88) = v3;
    *(_QWORD *)(v0 + 96) = v4;
    v6 = v3;
    v7 = v4;
    v9 = *(_QWORD *)(v0 + 72);
    v8 = *(_QWORD *)(v0 + 80);
    v14 = *(_OWORD *)(v0 + 56);
    swift_release();
    v10 = *(_QWORD *)(v9 + 16);
    v11 = swift_task_alloc();
    *(_QWORD *)(v0 + 104) = v11;
    *(_QWORD *)(v11 + 16) = v10;
    *(_OWORD *)(v11 + 24) = v14;
    *(_QWORD *)(v11 + 40) = v6;
    *(_QWORD *)(v11 + 48) = v7;
    *(_QWORD *)(v11 + 56) = v8;
    v12 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 112) = v12;
    *v12 = v0;
    v12[1] = sub_232EA44F8;
    return sub_232EBA234();
  }
  else
  {
    sub_232EA685C();
    swift_allocError();
    *v5 = 3;
    swift_willThrow();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  }
}

uint64_t sub_232EA44F8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 120) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_232EA4564()
{
  uint64_t v0;

  sub_232EA2EE8(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 96));
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_232EA45A8(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;

  v3[8] = a2;
  v3[9] = v2;
  v3[7] = a1;
  v3[10] = *v2;
  return swift_task_switch();
}

uint64_t sub_232EA45CC()
{
  uint64_t v0;
  unint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  __int128 v14;

  *(_QWORD *)(v0 + 40) = &type metadata for FeatureFlag;
  v1 = sub_232EA0F30();
  *(_BYTE *)(v0 + 16) = 0;
  *(_QWORD *)(v0 + 48) = v1;
  v2 = sub_232EB9F1C();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  if ((v2 & 1) != 0)
  {
    sub_232EB9E8C();
    swift_allocObject();
    sub_232EB9E80();
    sub_232EA68A0();
    v3 = sub_232EB9E74();
    *(_QWORD *)(v0 + 88) = v3;
    *(_QWORD *)(v0 + 96) = v4;
    v6 = v3;
    v7 = v4;
    v9 = *(_QWORD *)(v0 + 72);
    v8 = *(_QWORD *)(v0 + 80);
    v14 = *(_OWORD *)(v0 + 56);
    swift_release();
    v10 = *(_QWORD *)(v9 + 16);
    v11 = swift_task_alloc();
    *(_QWORD *)(v0 + 104) = v11;
    *(_QWORD *)(v11 + 16) = v10;
    *(_OWORD *)(v11 + 24) = v14;
    *(_QWORD *)(v11 + 40) = v6;
    *(_QWORD *)(v11 + 48) = v7;
    *(_QWORD *)(v11 + 56) = v8;
    v12 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 112) = v12;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25423FAE0);
    *v12 = v0;
    v12[1] = sub_232EA3AE8;
    return sub_232EBA234();
  }
  else
  {
    sub_232EA685C();
    swift_allocError();
    *v5 = 3;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_232EA4790(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[5] = a4;
  v5[6] = a5;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return swift_task_switch();
}

uint64_t sub_232EA47B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  __int128 v6;
  __int128 v7;

  if (qword_256010270 != -1)
    swift_once();
  if (!qword_256016E00)
    return (*(uint64_t (**)(void))(v0 + 8))();
  v1 = *(_QWORD *)(v0 + 48);
  v6 = *(_OWORD *)(v0 + 16);
  v7 = *(_OWORD *)(v0 + 32);
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v2;
  *(_OWORD *)(v2 + 16) = v6;
  *(_OWORD *)(v2 + 32) = v7;
  *(_QWORD *)(v2 + 48) = v1;
  v3 = swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v3;
  *(_QWORD *)(v3 + 16) = sub_232EA667C;
  *(_QWORD *)(v3 + 24) = v2;
  *(_QWORD *)&v7 = (char *)&dword_2560104D8 + dword_2560104D8;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v4;
  *v4 = v0;
  v4[1] = sub_232EA48B8;
  return ((uint64_t (*)(uint64_t, uint64_t))v7)((uint64_t)sub_232EA66A8, v3);
}

uint64_t sub_232EA48B8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 80) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

void sub_232EA491C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[6];

  v10 = (void *)sub_232EB9F4C();
  v11 = (void *)sub_232EB9F4C();
  v13[4] = a4;
  v13[5] = a5;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 1107296256;
  v13[2] = sub_232EB9688;
  v13[3] = &block_descriptor_83;
  v12 = _Block_copy(v13);
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_preflightImpressionWithAdvertisedItemID_compactJWS_adNetworkID_reply_, a6, v10, v11, v12);
  _Block_release(v12);

}

uint64_t sub_232EA4A08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return swift_task_switch();
}

uint64_t sub_232EA4A24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  __int128 v6;

  if (qword_256010270 != -1)
    swift_once();
  if (!qword_256016E00)
    return (*(uint64_t (**)(void))(v0 + 8))();
  v1 = *(_QWORD *)(v0 + 32);
  v6 = *(_OWORD *)(v0 + 16);
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v2;
  *(_OWORD *)(v2 + 16) = v6;
  *(_QWORD *)(v2 + 32) = v1;
  v3 = swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v3;
  *(_QWORD *)(v3 + 16) = sub_232EA66CC;
  *(_QWORD *)(v3 + 24) = v2;
  *(_QWORD *)&v6 = (char *)&dword_2560104D8 + dword_2560104D8;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v4;
  *v4 = v0;
  v4[1] = sub_232EA4B24;
  return ((uint64_t (*)(uint64_t, uint64_t))v6)((uint64_t)sub_232EA6DD0, v3);
}

uint64_t sub_232EA4B24()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 64) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_232EA4B88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return swift_task_switch();
}

uint64_t sub_232EA4BA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  __int128 v6;

  if (qword_256010270 != -1)
    swift_once();
  if (!qword_256016E00)
    return (*(uint64_t (**)(void))(v0 + 8))();
  v1 = *(_QWORD *)(v0 + 32);
  v6 = *(_OWORD *)(v0 + 16);
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v2;
  *(_OWORD *)(v2 + 16) = v6;
  *(_QWORD *)(v2 + 32) = v1;
  v3 = swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v3;
  *(_QWORD *)(v3 + 16) = sub_232EA6704;
  *(_QWORD *)(v3 + 24) = v2;
  *(_QWORD *)&v6 = (char *)&dword_2560104D8 + dword_2560104D8;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v4;
  *v4 = v0;
  v4[1] = sub_232EA4CA4;
  return ((uint64_t (*)(uint64_t, uint64_t))v6)((uint64_t)sub_232EA6DD0, v3);
}

uint64_t sub_232EA4CA4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 64) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_232EA4D08()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_232EA4D44()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_232EA4D80(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, SEL *a10)
{
  void *v14;
  void *v15;
  _QWORD v16[6];

  v14 = (void *)sub_232EB9F4C();
  v16[4] = a4;
  v16[5] = a5;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 1107296256;
  v16[2] = sub_232EB9688;
  v16[3] = a9;
  v15 = _Block_copy(v16);
  swift_retain();
  swift_release();
  objc_msgSend(a1, *a10, a6, v14, v15);
  _Block_release(v15);

}

uint64_t sub_232EA4E48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[5] = a4;
  v5[6] = a5;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return swift_task_switch();
}

uint64_t sub_232EA4E68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t);

  if (qword_256010270 != -1)
    swift_once();
  if (!qword_256016E00)
    return (*(uint64_t (**)(void))(v0 + 8))();
  v1 = *(_QWORD *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 24);
  v4 = swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v4;
  v5 = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v4 + 16) = v3;
  *(_QWORD *)(v4 + 24) = v2;
  *(_OWORD *)(v4 + 32) = v5;
  *(_QWORD *)(v4 + 48) = v1;
  v6 = swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v6;
  *(_QWORD *)(v6 + 16) = sub_232EA673C;
  *(_QWORD *)(v6 + 24) = v4;
  v9 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_2560104D8 + dword_2560104D8);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v7;
  *v7 = v0;
  v7[1] = sub_232EA4F74;
  return v9((uint64_t)sub_232EA6DD0, v6);
}

uint64_t sub_232EA4F74()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 80) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_232EA4FD8()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_232EA5014()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_232EA5050(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _QWORD aBlock[6];

  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010070);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)aBlock - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = (void *)sub_232EB9F4C();
  sub_232EA6BB4(a10, (uint64_t)v16);
  v18 = sub_232EB9EBC();
  v19 = *(_QWORD *)(v18 - 8);
  v20 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v16, 1, v18) != 1)
  {
    v20 = (void *)sub_232EB9EB0();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v16, v18);
  }
  aBlock[4] = a4;
  aBlock[5] = a5;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_232EB9688;
  aBlock[3] = &block_descriptor_63;
  v21 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_processTapWithAdvertisedItemID_compactJWS_eventMessage_reengagementURL_reply_, a6, v17, a9, v20, v21);
  _Block_release(v21);

}

uint64_t sub_232EA51D0()
{
  sub_232EA6768();
  return sub_232EBA2D0();
}

uint64_t sub_232EA51F8()
{
  sub_232EA6768();
  return sub_232EBA2DC();
}

uint64_t sub_232EA5220(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560104F8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_232EA6768();
  sub_232EBA2C4();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_232EA52E4(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

uint64_t sub_232EA5308(uint64_t a1, void *a2, void (*a3)(uint64_t *, uint64_t, uint64_t, uint64_t (*)(), uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void (*v13)(char *, uint64_t, uint64_t);
  unint64_t v14;
  uint64_t v15;
  void (*v16)(unint64_t, char *, uint64_t);
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t *, uint64_t, uint64_t, uint64_t (*)(), uint64_t);
  uint64_t v30;
  uint64_t v31[4];
  uint64_t v32;
  _QWORD aBlock[6];

  v25 = a7;
  v26 = a5;
  v27 = a6;
  v28 = a4;
  v29 = a3;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25423FAC8);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v13(v12, a1, v9);
  v14 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v15 = swift_allocObject();
  v16 = *(void (**)(unint64_t, char *, uint64_t))(v10 + 32);
  v16(v15 + v14, v12, v9);
  aBlock[4] = sub_232EA6CC8;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_232EA9300;
  aBlock[3] = &block_descriptor_77;
  v17 = _Block_copy(aBlock);
  swift_release();
  v18 = objc_msgSend(a2, sel_remoteObjectProxyWithErrorHandler_, v17);
  _Block_release(v17);
  sub_232EBA0C0();
  swift_unknownObjectRelease();
  sub_232EA386C((uint64_t)aBlock, (uint64_t)v31);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256010558);
  if (swift_dynamicCast() && v30)
  {
    v32 = v30;
    v13(v12, a1, v9);
    v19 = swift_allocObject();
    v16(v19 + v14, v12, v9);
    v20 = v26;
    *(_QWORD *)(v19 + ((v14 + v11 + 7) & 0xFFFFFFFFFFFFFFF8)) = v25;
    v29(&v32, v20, v27, sub_232EA692C, v19);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_232EA685C();
    v21 = swift_allocError();
    *v22 = 3;
    v31[0] = v21;
    sub_232EBA00C();
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)aBlock);
}

uint64_t sub_232EA5574(uint64_t a1, void *a2, void (*a3)(uint64_t *, uint64_t, uint64_t, uint64_t (*)(), uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void (*v13)(char *, uint64_t, uint64_t);
  unint64_t v14;
  uint64_t v15;
  void (*v16)(unint64_t, char *, uint64_t);
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t *, uint64_t, uint64_t, uint64_t (*)(), uint64_t);
  uint64_t v30;
  uint64_t v31[4];
  uint64_t v32;
  _QWORD aBlock[6];

  v25 = a7;
  v26 = a5;
  v27 = a6;
  v28 = a4;
  v29 = a3;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25423FAC8);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x24BDAC7A8]();
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v13(v12, a1, v9);
  v14 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v15 = swift_allocObject();
  v16 = *(void (**)(unint64_t, char *, uint64_t))(v10 + 32);
  v16(v15 + v14, v12, v9);
  aBlock[4] = sub_232EA68FC;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_232EA9300;
  aBlock[3] = &block_descriptor_57;
  v17 = _Block_copy(aBlock);
  swift_release();
  v18 = objc_msgSend(a2, sel_remoteObjectProxyWithErrorHandler_, v17);
  _Block_release(v17);
  sub_232EBA0C0();
  swift_unknownObjectRelease();
  sub_232EA386C((uint64_t)aBlock, (uint64_t)v31);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25423FA68);
  if (swift_dynamicCast())
  {
    v32 = v30;
    v13(v12, a1, v9);
    v19 = swift_allocObject();
    v16(v19 + v14, v12, v9);
    v20 = v26;
    *(_QWORD *)(v19 + ((v14 + v11 + 7) & 0xFFFFFFFFFFFFFFF8)) = v25;
    v29(&v32, v20, v27, sub_232EA692C, v19);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_232EA685C();
    v21 = swift_allocError();
    *v22 = 3;
    v31[0] = v21;
    sub_232EBA00C();
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)aBlock);
}

uint64_t sub_232EA57DC(uint64_t a1, void *a2, void (*a3)(uint64_t *, uint64_t, uint64_t, uint64_t (*)(), uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void (*v13)(char *, uint64_t, uint64_t);
  unint64_t v14;
  uint64_t v15;
  void (*v16)(unint64_t, char *, uint64_t);
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t *, uint64_t, uint64_t, uint64_t (*)(), uint64_t);
  uint64_t v30;
  uint64_t v31[4];
  uint64_t v32;
  _QWORD aBlock[6];

  v25 = a7;
  v26 = a5;
  v27 = a6;
  v28 = a4;
  v29 = a3;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25423FAC8);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v13(v12, a1, v9);
  v14 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v15 = swift_allocObject();
  v16 = *(void (**)(unint64_t, char *, uint64_t))(v10 + 32);
  v16(v15 + v14, v12, v9);
  aBlock[4] = sub_232EA68FC;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_232EA9300;
  aBlock[3] = &block_descriptor_46;
  v17 = _Block_copy(aBlock);
  swift_release();
  v18 = objc_msgSend(a2, sel_remoteObjectProxyWithErrorHandler_, v17);
  _Block_release(v17);
  sub_232EBA0C0();
  swift_unknownObjectRelease();
  sub_232EA386C((uint64_t)aBlock, (uint64_t)v31);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256010558);
  if (swift_dynamicCast())
  {
    v32 = v30;
    v13(v12, a1, v9);
    v19 = swift_allocObject();
    v16(v19 + v14, v12, v9);
    v20 = v26;
    *(_QWORD *)(v19 + ((v14 + v11 + 7) & 0xFFFFFFFFFFFFFFF8)) = v25;
    v29(&v32, v20, v27, sub_232EA692C, v19);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_232EA685C();
    v21 = swift_allocError();
    *v22 = 3;
    v31[0] = v21;
    sub_232EBA00C();
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)aBlock);
}

uint64_t sub_232EA5A44(uint64_t a1, void *a2, void (*a3)(uint64_t *, uint64_t, uint64_t, uint64_t (*)(), uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void (*v13)(char *, uint64_t, uint64_t);
  unint64_t v14;
  uint64_t v15;
  void (*v16)(unint64_t, char *, uint64_t);
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t *, uint64_t, uint64_t, uint64_t (*)(), uint64_t);
  uint64_t v30;
  uint64_t v31[4];
  uint64_t v32;
  _QWORD aBlock[6];

  v25 = a7;
  v26 = a5;
  v27 = a6;
  v28 = a4;
  v29 = a3;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25423FAC8);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v13(v12, a1, v9);
  v14 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v15 = swift_allocObject();
  v16 = *(void (**)(unint64_t, char *, uint64_t))(v10 + 32);
  v16(v15 + v14, v12, v9);
  aBlock[4] = sub_232EA68FC;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_232EA9300;
  aBlock[3] = &block_descriptor_35;
  v17 = _Block_copy(aBlock);
  swift_release();
  v18 = objc_msgSend(a2, sel_remoteObjectProxyWithErrorHandler_, v17);
  _Block_release(v17);
  sub_232EBA0C0();
  swift_unknownObjectRelease();
  sub_232EA386C((uint64_t)aBlock, (uint64_t)v31);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256010558);
  if (swift_dynamicCast())
  {
    v32 = v30;
    v13(v12, a1, v9);
    v19 = swift_allocObject();
    v16(v19 + v14, v12, v9);
    v20 = v26;
    *(_QWORD *)(v19 + ((v14 + v11 + 7) & 0xFFFFFFFFFFFFFFF8)) = v25;
    v29(&v32, v20, v27, sub_232EA692C, v19);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_232EA685C();
    v21 = swift_allocError();
    *v22 = 3;
    v31[0] = v21;
    sub_232EBA00C();
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)aBlock);
}

uint64_t sub_232EA5CAC(uint64_t a1, void *a2, void (*a3)(uint64_t *, uint64_t, uint64_t, uint64_t (*)(), uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void (*v13)(char *, uint64_t, uint64_t);
  unint64_t v14;
  uint64_t v15;
  void (*v16)(unint64_t, char *, uint64_t);
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t *, uint64_t, uint64_t, uint64_t (*)(), uint64_t);
  uint64_t v30;
  uint64_t v31[4];
  uint64_t v32;
  _QWORD aBlock[6];

  v25 = a7;
  v26 = a5;
  v27 = a6;
  v28 = a4;
  v29 = a3;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010540);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v13(v12, a1, v9);
  v14 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v15 = swift_allocObject();
  v16 = *(void (**)(unint64_t, char *, uint64_t))(v10 + 32);
  v16(v15 + v14, v12, v9);
  aBlock[4] = sub_232EA6948;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_232EA9300;
  aBlock[3] = &block_descriptor_24;
  v17 = _Block_copy(aBlock);
  swift_release();
  v18 = objc_msgSend(a2, sel_remoteObjectProxyWithErrorHandler_, v17);
  _Block_release(v17);
  sub_232EBA0C0();
  swift_unknownObjectRelease();
  sub_232EA386C((uint64_t)aBlock, (uint64_t)v31);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256010530);
  if (swift_dynamicCast())
  {
    v32 = v30;
    v13(v12, a1, v9);
    v19 = swift_allocObject();
    v16(v19 + v14, v12, v9);
    v20 = v26;
    *(_QWORD *)(v19 + ((v14 + v11 + 7) & 0xFFFFFFFFFFFFFFF8)) = v25;
    v29(&v32, v20, v27, sub_232EA69B0, v19);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_232EA685C();
    v21 = swift_allocError();
    *v22 = 3;
    v31[0] = v21;
    sub_232EBA00C();
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)aBlock);
}

uint64_t sub_232EA5F14(uint64_t a1, void *a2, void (*a3)(uint64_t *, uint64_t, uint64_t, uint64_t (*)(), uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void (*v13)(char *, uint64_t, uint64_t);
  unint64_t v14;
  uint64_t v15;
  void (*v16)(unint64_t, char *, uint64_t);
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t *, uint64_t, uint64_t, uint64_t (*)(), uint64_t);
  uint64_t v30;
  uint64_t v31[4];
  uint64_t v32;
  _QWORD aBlock[6];

  v25 = a7;
  v26 = a5;
  v27 = a6;
  v28 = a4;
  v29 = a3;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25423FAC8);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v13(v12, a1, v9);
  v14 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v15 = swift_allocObject();
  v16 = *(void (**)(unint64_t, char *, uint64_t))(v10 + 32);
  v16(v15 + v14, v12, v9);
  aBlock[4] = sub_232EA68FC;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_232EA9300;
  aBlock[3] = &block_descriptor_1;
  v17 = _Block_copy(aBlock);
  swift_release();
  v18 = objc_msgSend(a2, sel_remoteObjectProxyWithErrorHandler_, v17);
  _Block_release(v17);
  sub_232EBA0C0();
  swift_unknownObjectRelease();
  sub_232EA386C((uint64_t)aBlock, (uint64_t)v31);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256010530);
  if (swift_dynamicCast())
  {
    v32 = v30;
    v13(v12, a1, v9);
    v19 = swift_allocObject();
    v16(v19 + v14, v12, v9);
    v20 = v26;
    *(_QWORD *)(v19 + ((v14 + v11 + 7) & 0xFFFFFFFFFFFFFFF8)) = v25;
    v29(&v32, v20, v27, sub_232EA692C, v19);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_232EA685C();
    v21 = swift_allocError();
    *v22 = 3;
    v31[0] = v21;
    sub_232EBA00C();
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)aBlock);
}

uint64_t sub_232EA617C(void *a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  _QWORD *v6;
  _BYTE *v7;
  uint64_t v9;

  if (qword_25423FA88 != -1)
    swift_once();
  v2 = sub_232EB9F40();
  __swift_project_value_buffer(v2, (uint64_t)qword_254240AF8);
  MEMORY[0x23492A9D0](a1);
  MEMORY[0x23492A9D0](a1);
  v3 = sub_232EB9F28();
  v4 = sub_232EBA078();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v5 = 138543362;
    MEMORY[0x23492A9D0](a1);
    v9 = _swift_stdlib_bridgeErrorToNSError();
    sub_232EBA09C();
    *v6 = v9;

    _os_log_impl(&dword_232E98000, v3, v4, "Error fetching remote object proxy: %{public}@", v5, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256010050);
    swift_arrayDestroy();
    MEMORY[0x23492AAA8](v6, -1, -1);
    MEMORY[0x23492AAA8](v5, -1, -1);
  }
  else
  {

  }
  sub_232EA685C();
  swift_allocError();
  *v7 = 3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25423FAC8);
  return sub_232EBA00C();
}

uint64_t sub_232EA636C(void *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  _QWORD *v9;
  _BYTE *v10;
  uint64_t v12;

  if (qword_25423FA88 != -1)
    swift_once();
  v5 = sub_232EB9F40();
  __swift_project_value_buffer(v5, (uint64_t)qword_254240AF8);
  MEMORY[0x23492A9D0](a1);
  MEMORY[0x23492A9D0](a1);
  v6 = sub_232EB9F28();
  v7 = sub_232EBA078();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v8 = 138543362;
    MEMORY[0x23492A9D0](a1);
    v12 = _swift_stdlib_bridgeErrorToNSError();
    sub_232EBA09C();
    *v9 = v12;

    _os_log_impl(&dword_232E98000, v6, v7, "Error fetching remote object proxy: %{public}@", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256010050);
    swift_arrayDestroy();
    MEMORY[0x23492AAA8](v9, -1, -1);
    MEMORY[0x23492AAA8](v8, -1, -1);
  }
  else
  {

  }
  sub_232EA685C();
  swift_allocError();
  *v10 = 3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  return sub_232EBA00C();
}

uint64_t sub_232EA655C()
{
  __int16 v0;
  char v1;
  _BYTE *v3;

  v0 = sub_232EA9C7C();
  v1 = v0;
  if ((v0 & 0x100) != 0)
  {
    sub_232EA685C();
    swift_allocError();
    *v3 = v1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256010540);
    return sub_232EBA00C();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256010540);
    return sub_232EBA018();
  }
}

uint64_t sub_232EA65EC()
{
  __int16 v0;
  char v1;
  _BYTE *v3;

  v0 = sub_232EA9350();
  v1 = v0;
  if ((v0 & 0x100) != 0)
  {
    sub_232EA685C();
    swift_allocError();
    *v3 = v1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25423FAC8);
    return sub_232EBA00C();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25423FAC8);
    return sub_232EBA018();
  }
}

void sub_232EA667C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  sub_232EA491C(a1, a2, a3, a4, a5, *(_QWORD *)(v5 + 16));
}

uint64_t sub_232EA66A8(_QWORD *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(v1 + 16))(*a1);
}

void sub_232EA66CC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t *v5;

  sub_232EA4D80(a1, a2, a3, a4, a5, v5[2], v5[3], v5[4], (uint64_t)&block_descriptor_69, (SEL *)&selRef_startViewWithAdvertisedItemID_compactJWS_reply_);
}

void sub_232EA6704(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t *v5;

  sub_232EA4D80(a1, a2, a3, a4, a5, v5[2], v5[3], v5[4], (uint64_t)&block_descriptor_66, (SEL *)&selRef_endViewWithAdvertisedItemID_compactJWS_reply_);
}

void sub_232EA673C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t *v5;

  sub_232EA5050(a1, a2, a3, a4, a5, v5[2], v5[3], v5[4], v5[5], v5[6]);
}

unint64_t sub_232EA6768()
{
  unint64_t result;

  result = qword_256010500;
  if (!qword_256010500)
  {
    result = MEMORY[0x23492AA30](&unk_232EBBB20, &type metadata for ImpressionRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010500);
  }
  return result;
}

ValueMetadata *type metadata accessor for ImpressionRequest()
{
  return &type metadata for ImpressionRequest;
}

ValueMetadata *type metadata accessor for ImpressionRequest.CodingKeys()
{
  return &type metadata for ImpressionRequest.CodingKeys;
}

unint64_t sub_232EA67D0()
{
  unint64_t result;

  result = qword_256010508;
  if (!qword_256010508)
  {
    result = MEMORY[0x23492AA30](&unk_232EBBAD0, &type metadata for ImpressionRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010508);
  }
  return result;
}

unint64_t sub_232EA6818()
{
  unint64_t result;

  result = qword_256010510;
  if (!qword_256010510)
  {
    result = MEMORY[0x23492AA30](&unk_232EBBAF8, &type metadata for ImpressionRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010510);
  }
  return result;
}

unint64_t sub_232EA685C()
{
  unint64_t result;

  result = qword_256010520;
  if (!qword_256010520)
  {
    result = MEMORY[0x23492AA30](&unk_232EBD790, &type metadata for AttributionKitError);
    atomic_store(result, (unint64_t *)&qword_256010520);
  }
  return result;
}

unint64_t sub_232EA68A0()
{
  unint64_t result;

  result = qword_256010528;
  if (!qword_256010528)
  {
    result = MEMORY[0x23492AA30](&unk_232EBD4F8, &type metadata for DeveloperModeRequest);
    atomic_store(result, (unint64_t *)&qword_256010528);
  }
  return result;
}

uint64_t sub_232EA68E4(uint64_t a1)
{
  return sub_232EA6C4C(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_232EA5F14);
}

uint64_t sub_232EA68F0()
{
  return objectdestroyTm(&qword_25423FAC8);
}

uint64_t sub_232EA68FC(void *a1)
{
  return sub_232EA6954(a1, &qword_25423FAC8);
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_232EA6920()
{
  return objectdestroy_15Tm(&qword_25423FAC8);
}

uint64_t sub_232EA6930(uint64_t a1)
{
  return sub_232EA6C4C(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_232EA5CAC);
}

uint64_t sub_232EA693C()
{
  return objectdestroyTm(&qword_256010540);
}

uint64_t sub_232EA6948(void *a1)
{
  return sub_232EA6954(a1, &qword_256010540);
}

uint64_t sub_232EA6954(void *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(a2) - 8) + 80);
  return sub_232EA636C(a1, v2 + ((v5 + 16) & ~v5), a2);
}

uint64_t sub_232EA69A4()
{
  return objectdestroy_15Tm(&qword_256010540);
}

uint64_t sub_232EA69B0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256010540);
  return sub_232EA655C();
}

unint64_t sub_232EA6A14()
{
  unint64_t result;

  result = qword_256010550;
  if (!qword_256010550)
  {
    result = MEMORY[0x23492AA30](&unk_232EBD3D8, &type metadata for WoofRequest);
    atomic_store(result, (unint64_t *)&qword_256010550);
  }
  return result;
}

uint64_t sub_232EA6A58(uint64_t a1)
{
  return sub_232EA6C4C(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_232EA5A44);
}

uint64_t sub_232EA6A64()
{
  return objectdestroyTm(&qword_25423FAC8);
}

uint64_t sub_232EA6A70()
{
  return objectdestroy_15Tm(&qword_25423FAC8);
}

uint64_t sub_232EA6A7C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_25423FAC8);
  return sub_232EA65EC();
}

unint64_t sub_232EA6AE4()
{
  unint64_t result;

  result = qword_256010568;
  if (!qword_256010568)
  {
    result = MEMORY[0x23492AA30](&unk_232EBCDB8, &type metadata for PostbackRequest);
    atomic_store(result, (unint64_t *)&qword_256010568);
  }
  return result;
}

uint64_t sub_232EA6B28(uint64_t a1)
{
  return sub_232EA6C4C(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_232EA57DC);
}

uint64_t sub_232EA6B34()
{
  return objectdestroyTm(&qword_25423FAC8);
}

uint64_t sub_232EA6B40()
{
  return objectdestroy_15Tm(&qword_25423FAC8);
}

unint64_t sub_232EA6B4C()
{
  unint64_t result;

  result = qword_25423FA60;
  if (!qword_25423FA60)
  {
    result = MEMORY[0x23492AA30](&unk_232EBC8DC, &type metadata for TokenHandoffRequest);
    atomic_store(result, (unint64_t *)&qword_25423FA60);
  }
  return result;
}

uint64_t sub_232EA6B90(uint64_t a1)
{
  return sub_232EA6C4C(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_232EA5574);
}

uint64_t sub_232EA6B9C()
{
  return objectdestroyTm(&qword_25423FAC8);
}

uint64_t sub_232EA6BA8()
{
  return objectdestroy_15Tm(&qword_25423FAC8);
}

uint64_t sub_232EA6BB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010070);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_232EA6BFC()
{
  unint64_t result;

  result = qword_256010578;
  if (!qword_256010578)
  {
    result = MEMORY[0x23492AA30](&unk_232EBBA68, &type metadata for ImpressionRequest);
    atomic_store(result, (unint64_t *)&qword_256010578);
  }
  return result;
}

uint64_t sub_232EA6C40(uint64_t a1)
{
  return sub_232EA6C4C(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_232EA5308);
}

uint64_t sub_232EA6C4C(uint64_t a1, uint64_t (*a2)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v2;

  return a2(a1, v2[2], v2[3], v2[4], v2[5], v2[6], v2[7]);
}

uint64_t sub_232EA6C60()
{
  return objectdestroyTm(&qword_25423FAC8);
}

uint64_t objectdestroyTm(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1+ ((*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80)), v2);
  return swift_deallocObject();
}

uint64_t sub_232EA6CC8(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_25423FAC8);
  return sub_232EA617C(a1);
}

uint64_t sub_232EA6D08()
{
  return objectdestroy_15Tm(&qword_25423FAC8);
}

uint64_t objectdestroy_15Tm(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1+ ((*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80)), v2);
  return swift_deallocObject();
}

BOOL sub_232EA6DE0()
{
  uint64_t v0;

  v0 = sub_232EBA144();
  swift_bridgeObjectRelease();
  return v0 != 0;
}

uint64_t sub_232EA6E24()
{
  return 0x72706D692D707061;
}

unint64_t sub_232EA6E4C()
{
  unint64_t result;

  result = qword_256010580;
  if (!qword_256010580)
  {
    result = MEMORY[0x23492AA30](&unk_232EBBB9C, &type metadata for ImpressionType);
    atomic_store(result, (unint64_t *)&qword_256010580);
  }
  return result;
}

uint64_t sub_232EA6E90()
{
  sub_232EBA288();
  sub_232EB9F70();
  return sub_232EBA2A0();
}

uint64_t sub_232EA6EEC()
{
  return sub_232EB9F70();
}

uint64_t sub_232EA6F10()
{
  sub_232EBA288();
  sub_232EB9F70();
  return sub_232EBA2A0();
}

uint64_t sub_232EA6F68@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_232EBA144();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_232EA6FB8(char *a1@<X8>)
{
  strcpy(a1, "app-impression");
  a1[15] = -18;
}

uint64_t sub_232EA6FE0()
{
  sub_232EA7124();
  return sub_232EB9FDC();
}

uint64_t sub_232EA703C()
{
  sub_232EA7124();
  return sub_232EB9FD0();
}

uint64_t storeEnumTagSinglePayload for ImpressionType(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_232EA70C8 + 4 * byte_232EBBB90[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_232EA70E8 + 4 * byte_232EBBB95[v4]))();
}

_BYTE *sub_232EA70C8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_232EA70E8(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_232EA70F0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_232EA70F8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_232EA7100(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_232EA7108(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for ImpressionType()
{
  return &type metadata for ImpressionType;
}

unint64_t sub_232EA7124()
{
  unint64_t result;

  result = qword_256010588;
  if (!qword_256010588)
  {
    result = MEMORY[0x23492AA30](&unk_232EBBC04, &type metadata for ImpressionType);
    atomic_store(result, (unint64_t *)&qword_256010588);
  }
  return result;
}

uint64_t sub_232EA7168(__int128 *a1, void (*a2)(uint64_t *, uint64_t, unint64_t, uint64_t (*)(uint64_t, uint64_t), uint64_t))
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v6;
  char v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void (*v12)(uint64_t *, uint64_t, unint64_t, uint64_t (*)(uint64_t, uint64_t), uint64_t);
  __int128 v13;
  uint64_t v14;
  unint64_t v15;
  _BYTE *v16;
  _BYTE *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unsigned int v21;
  _BYTE *v22;
  uint64_t v23;
  unint64_t v24;
  _BYTE *v26;
  uint64_t v27;
  __int128 aBlock;
  __int128 v29;
  unint64_t v30;
  uint64_t v31;
  _BYTE v32[32];
  uint64_t v33;

  v6 = *v2;
  *((_QWORD *)&v29 + 1) = &type metadata for FeatureFlag;
  v30 = sub_232EA0F30();
  LOBYTE(aBlock) = 0;
  v7 = sub_232EB9F1C();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&aBlock);
  if ((v7 & 1) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25423F9D8);
    v8 = swift_allocObject();
    *(_WORD *)(v8 + 16) = -256;
    v9 = (void *)v2[2];
    v30 = (unint64_t)sub_232EAB598;
    v31 = v8;
    *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
    *((_QWORD *)&aBlock + 1) = 1107296256;
    *(_QWORD *)&v29 = sub_232EA9300;
    *((_QWORD *)&v29 + 1) = &block_descriptor_31;
    v10 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    v11 = objc_msgSend(v9, sel_synchronousRemoteObjectProxyWithErrorHandler_, v10);
    _Block_release(v10);
    sub_232EBA0C0();
    swift_unknownObjectRelease();
    sub_232EA386C((uint64_t)v32, (uint64_t)&aBlock);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256010640);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v12 = a2;
      v33 = v27;
      v13 = a1[1];
      aBlock = *a1;
      v29 = v13;
      v30 = *((_QWORD *)a1 + 4);
      sub_232EB9E8C();
      swift_allocObject();
      sub_232EB9E80();
      sub_232EAB43C();
      v14 = sub_232EB9E74();
      if (v3)
      {
        swift_unknownObjectRelease();
        swift_release();
        swift_release();
      }
      else
      {
        v18 = v14;
        v19 = v15;
        swift_release();
        v20 = swift_allocObject();
        *(_QWORD *)(v20 + 16) = v8;
        *(_QWORD *)(v20 + 24) = v6;
        swift_retain();
        v12(&v33, v18, v19, sub_232EAB5EC, v20);
        swift_release();
        swift_beginAccess();
        v21 = *(unsigned __int16 *)(v8 + 16);
        if (v21 >> 8 <= 0xFE)
        {
          if ((v21 & 0x100) == 0)
          {
            sub_232EA2EE8(v18, v19);
            swift_release();
            swift_unknownObjectRelease();
            __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
            return v21 & 1;
          }
          sub_232EA685C();
          swift_willThrowTypedImpl();
          swift_allocError();
          *v26 = v21;
          v23 = v18;
          v24 = v19;
        }
        else
        {
          sub_232EA685C();
          swift_allocError();
          *v22 = 0;
          swift_willThrow();
          v23 = v18;
          v24 = v19;
        }
        sub_232EA2EE8(v23, v24);
        swift_release();
        swift_unknownObjectRelease();
      }
    }
    else
    {
      sub_232EA685C();
      swift_allocError();
      *v17 = 3;
      swift_willThrow();
      swift_release();
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
  }
  else
  {
    sub_232EA685C();
    swift_allocError();
    *v16 = 3;
    swift_willThrow();
  }
  return 0;
}

uint64_t sub_232EA7530@<X0>(__int128 *a1@<X0>, void (*a2)(uint64_t *, uint64_t, unint64_t, uint64_t (*)(uint64_t a1, uint64_t a2), uint64_t)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  _BYTE *v30;
  _BYTE *v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _BYTE *v40;
  uint64_t v41;
  _BYTE *v42;
  char v43;
  _BYTE *v44;
  uint64_t v45;
  _BYTE *v46;
  uint64_t v47;
  char *v48;
  void (*v49)(uint64_t *, uint64_t, unint64_t, uint64_t (*)(uint64_t, uint64_t), uint64_t);
  __int128 *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  __int128 aBlock;
  __int128 v56;
  unint64_t v57;
  uint64_t v58;
  _BYTE v59[40];
  uint64_t v60;

  v51 = a3;
  v8 = *v4;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010628);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010630);
  v12 = *(_QWORD *)(v53 - 8);
  MEMORY[0x24BDAC7A8](v53);
  v14 = (char *)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  *((_QWORD *)&v56 + 1) = &type metadata for FeatureFlag;
  v57 = sub_232EA0F30();
  LOBYTE(aBlock) = 0;
  v15 = sub_232EB9F1C();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&aBlock);
  if ((v15 & 1) != 0)
  {
    v49 = a2;
    v50 = a1;
    v47 = v8;
    v48 = v11;
    v45 = a4;
    v46 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256010638);
    v16 = swift_allocObject();
    v17 = v16 + *(_QWORD *)(*(_QWORD *)v16 + 104);
    v18 = v12;
    v19 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56);
    v20 = v53;
    v19(v17, 1, 1, v53);
    v21 = (void *)v4[2];
    v57 = (unint64_t)sub_232EAB434;
    v58 = v16;
    *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
    *((_QWORD *)&aBlock + 1) = 1107296256;
    *(_QWORD *)&v56 = sub_232EA9300;
    *((_QWORD *)&v56 + 1) = &block_descriptor_22;
    v22 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    v23 = objc_msgSend(v21, sel_synchronousRemoteObjectProxyWithErrorHandler_, v22);
    _Block_release(v22);
    sub_232EBA0C0();
    swift_unknownObjectRelease();
    sub_232EA386C((uint64_t)v59, (uint64_t)&aBlock);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256010640);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v24 = v20;
      v25 = v18;
      v60 = v54;
      v26 = v50[1];
      aBlock = *v50;
      v56 = v26;
      v57 = *((_QWORD *)v50 + 4);
      sub_232EB9E8C();
      swift_allocObject();
      sub_232EB9E80();
      sub_232EAB43C();
      v27 = v52;
      v28 = sub_232EB9E74();
      if (v27)
      {
        swift_unknownObjectRelease();
        swift_release();
        swift_release();
      }
      else
      {
        v33 = v28;
        v34 = v29;
        swift_release();
        v35 = v24;
        v36 = swift_allocObject();
        v37 = v47;
        *(_QWORD *)(v36 + 16) = v16;
        *(_QWORD *)(v36 + 24) = v37;
        swift_retain();
        v49(&v60, v33, v34, sub_232EAB480, v36);
        swift_release();
        swift_beginAccess();
        v38 = (uint64_t)v48;
        sub_232EAB554(v17, (uint64_t)v48, &qword_256010628);
        v39 = v33;
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v25 + 48))(v38, 1, v35) == 1)
        {
          sub_232E9CF10(v38, &qword_256010628);
          sub_232EA685C();
          swift_allocError();
          *v40 = 0;
          swift_willThrow();
        }
        else
        {
          v41 = v38;
          v42 = v46;
          sub_232EAB510(v41, (uint64_t)v46, &qword_256010630);
          if (swift_getEnumCaseMultiPayload() == 1)
          {
            LOBYTE(v54) = *v42;
            v43 = v54;
            sub_232EA685C();
            swift_willThrowTypedImpl();
            swift_allocError();
            *v44 = v43;
          }
          else
          {
            sub_232EAB510((uint64_t)v42, v45, &qword_256010070);
          }
        }
        sub_232EA2EE8(v39, v34);
        swift_release();
        swift_unknownObjectRelease();
      }
    }
    else
    {
      sub_232EA685C();
      swift_allocError();
      *v32 = 3;
      swift_willThrow();
      swift_release();
    }
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v59);
  }
  else
  {
    sub_232EA685C();
    swift_allocError();
    *v30 = 3;
    return swift_willThrow();
  }
}

uint64_t sub_232EA79F0(uint64_t a1, char a2, void (*a3)(uint64_t a1, void *a2), ValueMetadata *a4, void (*a5)(uint64_t *, uint64_t, unint64_t, uint64_t (*)(uint64_t, uint64_t), uint64_t))
{
  uint64_t *v5;
  uint64_t v11;
  char v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  _BYTE *v19;
  _BYTE *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unsigned int v24;
  _BYTE *v25;
  _BYTE *v27;
  void (*v28)(uint64_t *, uint64_t, unint64_t, uint64_t (*)(uint64_t, uint64_t), uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t aBlock;
  uint64_t v32;
  void (*v33)(uint64_t, void *);
  ValueMetadata *v34;
  unint64_t v35;
  uint64_t v36;
  _BYTE v37[32];
  uint64_t v38;

  v11 = *v5;
  v34 = &type metadata for FeatureFlag;
  v35 = sub_232EA0F30();
  LOBYTE(aBlock) = 0;
  v12 = sub_232EB9F1C();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&aBlock);
  if ((v12 & 1) != 0)
  {
    v28 = a5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25423F9D8);
    v13 = swift_allocObject();
    *(_WORD *)(v13 + 16) = -256;
    v14 = (void *)v5[2];
    v35 = (unint64_t)sub_232EAB218;
    v36 = v13;
    aBlock = MEMORY[0x24BDAC760];
    v32 = 1107296256;
    v33 = sub_232EA9300;
    v34 = (ValueMetadata *)&block_descriptor_16;
    v15 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    v16 = objc_msgSend(v14, sel_synchronousRemoteObjectProxyWithErrorHandler_, v15);
    _Block_release(v15);
    sub_232EBA0C0();
    swift_unknownObjectRelease();
    sub_232EA386C((uint64_t)v37, (uint64_t)&aBlock);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560105D0);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v38 = v30;
      aBlock = a1;
      LOBYTE(v32) = a2;
      v33 = a3;
      v34 = a4;
      sub_232EB9E8C();
      swift_allocObject();
      sub_232EB9E80();
      sub_232EAB3AC();
      v17 = sub_232EB9E74();
      if (v29)
      {
        swift_unknownObjectRelease();
        swift_release();
        swift_release();
      }
      else
      {
        v21 = v17;
        v22 = v18;
        swift_release();
        v23 = swift_allocObject();
        *(_QWORD *)(v23 + 16) = v13;
        *(_QWORD *)(v23 + 24) = v11;
        swift_retain();
        v28(&v38, v21, v22, sub_232EAB5EC, v23);
        swift_release();
        swift_beginAccess();
        v24 = *(unsigned __int16 *)(v13 + 16);
        if (v24 >> 8 <= 0xFE)
        {
          if ((v24 & 0x100) == 0)
          {
            sub_232EA2EE8(v21, v22);
            swift_release();
            swift_unknownObjectRelease();
            __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
            return v24 & 1;
          }
          sub_232EA685C();
          swift_willThrowTypedImpl();
          swift_allocError();
          *v27 = v24;
        }
        else
        {
          sub_232EA685C();
          swift_allocError();
          *v25 = 0;
          swift_willThrow();
        }
        sub_232EA2EE8(v21, v22);
        swift_release();
        swift_unknownObjectRelease();
      }
    }
    else
    {
      sub_232EA685C();
      swift_allocError();
      *v20 = 3;
      swift_willThrow();
      swift_release();
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
  }
  else
  {
    sub_232EA685C();
    swift_allocError();
    *v19 = 3;
    swift_willThrow();
  }
  return 0;
}

uint64_t sub_232EA7DB8(char a1, void (*a2)(uint64_t *, uint64_t, unint64_t, uint64_t (*)(uint64_t a1, uint64_t a2), uint64_t))
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v6;
  char v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void (*v12)(uint64_t *, uint64_t, unint64_t, uint64_t (*)(uint64_t, uint64_t), uint64_t);
  uint64_t v13;
  unint64_t v14;
  _BYTE *v15;
  _BYTE *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unsigned int v20;
  _BYTE *v21;
  uint64_t v22;
  unint64_t v23;
  _BYTE *v25;
  uint64_t v26;
  _QWORD aBlock[3];
  ValueMetadata *v28;
  unint64_t v29;
  uint64_t v30;
  _BYTE v31[32];
  uint64_t v32;

  v6 = *v2;
  v28 = &type metadata for FeatureFlag;
  v29 = sub_232EA0F30();
  LOBYTE(aBlock[0]) = 0;
  v7 = sub_232EB9F1C();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)aBlock);
  if ((v7 & 1) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25423F9D8);
    v8 = swift_allocObject();
    *(_WORD *)(v8 + 16) = -256;
    v9 = (void *)v2[2];
    v29 = (unint64_t)sub_232EAB218;
    v30 = v8;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_232EA9300;
    v28 = (ValueMetadata *)&block_descriptor_10;
    v10 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    v11 = objc_msgSend(v9, sel_synchronousRemoteObjectProxyWithErrorHandler_, v10);
    _Block_release(v10);
    sub_232EBA0C0();
    swift_unknownObjectRelease();
    sub_232EA386C((uint64_t)v31, (uint64_t)aBlock);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25423FA68);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v12 = a2;
      v32 = v26;
      LOBYTE(aBlock[0]) = a1;
      sub_232EB9E8C();
      swift_allocObject();
      sub_232EB9E80();
      sub_232EA6B4C();
      v13 = sub_232EB9E74();
      if (v3)
      {
        swift_unknownObjectRelease();
        swift_release();
        swift_release();
      }
      else
      {
        v17 = v13;
        v18 = v14;
        swift_release();
        v19 = swift_allocObject();
        *(_QWORD *)(v19 + 16) = v8;
        *(_QWORD *)(v19 + 24) = v6;
        swift_retain();
        v12(&v32, v17, v18, sub_232EAB394, v19);
        swift_release();
        swift_beginAccess();
        v20 = *(unsigned __int16 *)(v8 + 16);
        if (v20 >> 8 <= 0xFE)
        {
          if ((v20 & 0x100) == 0)
          {
            sub_232EA2EE8(v17, v18);
            swift_release();
            swift_unknownObjectRelease();
            __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
            return v20 & 1;
          }
          sub_232EA685C();
          swift_willThrowTypedImpl();
          swift_allocError();
          *v25 = v20;
          v22 = v17;
          v23 = v18;
        }
        else
        {
          sub_232EA685C();
          swift_allocError();
          *v21 = 0;
          swift_willThrow();
          v22 = v17;
          v23 = v18;
        }
        sub_232EA2EE8(v22, v23);
        swift_release();
        swift_unknownObjectRelease();
      }
    }
    else
    {
      sub_232EA685C();
      swift_allocError();
      *v16 = 3;
      swift_willThrow();
      swift_release();
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
  }
  else
  {
    sub_232EA685C();
    swift_allocError();
    *v15 = 3;
    swift_willThrow();
  }
  return 0;
}

uint64_t sub_232EA8174@<X0>(void (*a1)(uint64_t *, uint64_t, unint64_t, uint64_t (*)(uint64_t a1, uint64_t a2), uint64_t)@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v6;
  char v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  _BYTE *v14;
  _BYTE *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  int v20;
  _BYTE *v21;
  uint64_t v22;
  unint64_t v23;
  _BYTE *v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD aBlock[3];
  ValueMetadata *v28;
  unint64_t v29;
  uint64_t v30;
  _BYTE v31[32];
  uint64_t v32;

  v6 = *v2;
  v28 = &type metadata for FeatureFlag;
  v29 = sub_232EA0F30();
  LOBYTE(aBlock[0]) = 0;
  v7 = sub_232EB9F1C();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)aBlock);
  if ((v7 & 1) == 0)
  {
    sub_232EA685C();
    swift_allocError();
    *v14 = 3;
    return swift_willThrow();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560105F0);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = 0;
  *(_QWORD *)(v8 + 24) = 0;
  *(_BYTE *)(v8 + 32) = -1;
  v9 = (void *)v2[2];
  v29 = (unint64_t)sub_232EAB2B0;
  v30 = v8;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_232EA9300;
  v28 = (ValueMetadata *)&block_descriptor_4;
  v10 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  v11 = objc_msgSend(v9, sel_synchronousRemoteObjectProxyWithErrorHandler_, v10);
  _Block_release(v10);
  sub_232EBA0C0();
  swift_unknownObjectRelease();
  sub_232EA386C((uint64_t)v31, (uint64_t)aBlock);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560105D0);
  if ((swift_dynamicCast() & 1) == 0)
  {
    sub_232EA685C();
    swift_allocError();
    *v16 = 3;
    swift_willThrow();
    swift_release();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
  }
  v25 = a2;
  v32 = v26;
  sub_232EB9E8C();
  swift_allocObject();
  sub_232EB9E80();
  sub_232EAB2B8();
  v12 = sub_232EB9E74();
  if (!v3)
  {
    v17 = v12;
    v18 = v13;
    swift_release();
    v19 = swift_allocObject();
    *(_QWORD *)(v19 + 16) = v8;
    *(_QWORD *)(v19 + 24) = v6;
    swift_retain();
    a1(&v32, v17, v18, sub_232EAB2FC, v19);
    swift_release();
    swift_beginAccess();
    v20 = *(unsigned __int8 *)(v8 + 32);
    if (v20 == 255)
    {
      sub_232EA685C();
      swift_allocError();
      *v21 = 0;
      swift_willThrow();
    }
    else
    {
      v22 = *(_QWORD *)(v8 + 16);
      if ((v20 & 1) == 0)
      {
        v23 = *(_QWORD *)(v8 + 24);
        sub_232EAB304(*(_QWORD *)(v8 + 16), v23);
        sub_232EA2EE8(v17, v18);
        swift_release();
        *v25 = v22;
        v25[1] = v23;
LABEL_13:
        swift_unknownObjectRelease();
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
      }
      sub_232EA685C();
      swift_willThrowTypedImpl();
      swift_allocError();
      *v24 = v22;
    }
    sub_232EA2EE8(v17, v18);
    swift_release();
    goto LABEL_13;
  }
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
}

uint64_t sub_232EA8524(void (*a1)(uint64_t *, uint64_t, unint64_t, uint64_t (*)(uint64_t, uint64_t), uint64_t))
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  char v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  _BYTE *v12;
  _BYTE *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unsigned int v17;
  _BYTE *v18;
  _BYTE *v20;
  void (*v21)(uint64_t *, uint64_t, unint64_t, uint64_t (*)(uint64_t, uint64_t), uint64_t);
  uint64_t v22;
  _QWORD aBlock[3];
  ValueMetadata *v24;
  unint64_t v25;
  uint64_t v26;
  _BYTE v27[32];
  uint64_t v28;

  v4 = *v1;
  v24 = &type metadata for FeatureFlag;
  v25 = sub_232EA0F30();
  LOBYTE(aBlock[0]) = 0;
  v5 = sub_232EB9F1C();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)aBlock);
  if ((v5 & 1) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25423F9D8);
    v6 = swift_allocObject();
    *(_WORD *)(v6 + 16) = -256;
    v7 = (void *)v1[2];
    v25 = (unint64_t)sub_232EAB218;
    v26 = v6;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_232EA9300;
    v24 = (ValueMetadata *)&block_descriptor_2;
    v8 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    v9 = objc_msgSend(v7, sel_synchronousRemoteObjectProxyWithErrorHandler_, v8);
    _Block_release(v8);
    sub_232EBA0C0();
    swift_unknownObjectRelease();
    sub_232EA386C((uint64_t)v27, (uint64_t)aBlock);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560105D0);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v21 = a1;
      v28 = v22;
      sub_232EB9E8C();
      swift_allocObject();
      sub_232EB9E80();
      sub_232EAB248();
      v10 = sub_232EB9E74();
      if (v2)
      {
        swift_unknownObjectRelease();
        swift_release();
        swift_release();
      }
      else
      {
        v14 = v10;
        v15 = v11;
        swift_release();
        v16 = swift_allocObject();
        *(_QWORD *)(v16 + 16) = v6;
        *(_QWORD *)(v16 + 24) = v4;
        swift_retain();
        v21(&v28, v14, v15, sub_232EAB5EC, v16);
        swift_release();
        swift_beginAccess();
        v17 = *(unsigned __int16 *)(v6 + 16);
        if (v17 >> 8 <= 0xFE)
        {
          if ((v17 & 0x100) == 0)
          {
            sub_232EA2EE8(v14, v15);
            swift_release();
            swift_unknownObjectRelease();
            __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
            return v17 & 1;
          }
          sub_232EA685C();
          swift_willThrowTypedImpl();
          swift_allocError();
          *v20 = v17;
        }
        else
        {
          sub_232EA685C();
          swift_allocError();
          *v18 = 0;
          swift_willThrow();
        }
        sub_232EA2EE8(v14, v15);
        swift_release();
        swift_unknownObjectRelease();
      }
    }
    else
    {
      sub_232EA685C();
      swift_allocError();
      *v13 = 3;
      swift_willThrow();
      swift_release();
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
  }
  else
  {
    sub_232EA685C();
    swift_allocError();
    *v12 = 3;
    swift_willThrow();
  }
  return 0;
}

uint64_t sub_232EA88D0()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_232EA88FC()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t sub_232EA8904()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_232EA8930@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  *(_QWORD *)a6 = result;
  *(_QWORD *)(a6 + 8) = a2;
  *(_BYTE *)(a6 + 16) = a3 & 1;
  *(_QWORD *)(a6 + 24) = a4;
  *(_QWORD *)(a6 + 32) = a5;
  return result;
}

uint64_t sub_232EA8944(uint64_t result)
{
  __int128 *v1;
  uint64_t v2;

  if (qword_256010278 != -1)
    result = swift_once();
  if (qword_256016E08)
  {
    v2 = MEMORY[0x24BDAC7A8](result);
    MEMORY[0x24BDAC7A8](v2);
    return sub_232EA7168(v1, (void (*)(uint64_t *, uint64_t, unint64_t, uint64_t (*)(uint64_t, uint64_t), uint64_t))sub_232EA66A8);
  }
  return result;
}

void sub_232EA8A14(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v10;
  void *v11;
  _QWORD v12[6];

  v10 = (void *)sub_232EB9ED4();
  v12[4] = a4;
  v12[5] = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 1107296256;
  v12[2] = sub_232EB9688;
  v12[3] = &block_descriptor_37;
  v11 = _Block_copy(v12);
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_recordImpressionWithAdvertisedItemID_intakeRequestData_reply_, a6, v10, v11);
  _Block_release(v11);

}

uint64_t sub_232EA8ADC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  __int128 *v3;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  _QWORD v11[8];

  v5 = a1;
  if (qword_256010278 != -1)
    a1 = swift_once();
  if (qword_256016E08)
  {
    v7 = MEMORY[0x24BDAC7A8](a1);
    v11[6] = v5;
    v11[7] = a2;
    MEMORY[0x24BDAC7A8](v7);
    v11[2] = sub_232EAA8DC;
    v11[3] = v8;
    return sub_232EA7530(v3, (void (*)(uint64_t *, uint64_t, unint64_t, uint64_t (*)(uint64_t, uint64_t), uint64_t))sub_232EA6DD0, (uint64_t)v11, a3);
  }
  else
  {
    v10 = sub_232EB9EBC();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(a3, 1, 1, v10);
  }
}

void sub_232EA8BE4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD aBlock[6];

  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010070);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)aBlock - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (void *)sub_232EB9ED4();
  sub_232EAB554(a7, (uint64_t)v14, &qword_256010070);
  v16 = sub_232EB9EBC();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v14, 1, v16) != 1)
  {
    v18 = (void *)sub_232EB9EB0();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v14, v16);
  }
  aBlock[4] = a4;
  aBlock[5] = a5;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_232EB9688;
  aBlock[3] = &block_descriptor_28;
  v19 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_processReengagementWithAdvertisedItemID_intakeRequestData_reengagementURL_reply_, a6, v15, v18, v19);
  _Block_release(v19);

}

uint64_t sub_232EA8D68()
{
  uint64_t v0;
  unsigned int v1;

  v0 = sub_232EBA144();
  swift_bridgeObjectRelease();
  if (v0 == 1)
    v1 = 1;
  else
    v1 = 2;
  if (v0)
    return v1;
  else
    return 0;
}

uint64_t sub_232EA8DB8(char a1)
{
  if ((a1 & 1) != 0)
    return 0x6B63696C63;
  else
    return 2003134838;
}

uint64_t sub_232EA8DE4(char *a1, char *a2)
{
  return sub_232EABF88(*a1, *a2);
}

uint64_t sub_232EA8DF0()
{
  sub_232EBA288();
  sub_232EB9F70();
  swift_bridgeObjectRelease();
  return sub_232EBA2A0();
}

uint64_t sub_232EA8E64()
{
  sub_232EB9F70();
  return swift_bridgeObjectRelease();
}

uint64_t sub_232EA8EB4()
{
  sub_232EBA288();
  sub_232EB9F70();
  swift_bridgeObjectRelease();
  return sub_232EBA2A0();
}

uint64_t sub_232EA8F24@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_232EBA144();
  result = swift_bridgeObjectRelease();
  if (v2 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v2)
    v4 = 0;
  *a1 = v4;
  return result;
}

void sub_232EA8F80(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  uint64_t v2;
  unint64_t v3;

  v2 = 2003134838;
  if (*v1)
    v2 = 0x6B63696C63;
  v3 = 0xE400000000000000;
  if (*v1)
    v3 = 0xE500000000000000;
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_232EA8FB4()
{
  sub_232EAB1D4();
  return sub_232EB9FDC();
}

uint64_t sub_232EA9010()
{
  sub_232EAB1D4();
  return sub_232EB9FD0();
}

uint64_t sub_232EA905C()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x7463617265746E69;
  if (*v0 != 1)
    v1 = 0x7542746E65696C63;
  if (*v0)
    return v1;
  else
    return 0x4A746361706D6F63;
}

uint64_t sub_232EA90D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_232EAA96C(a1, a2);
  *a3 = result;
  return result;
}

void sub_232EA90F8(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_232EA9104()
{
  sub_232EAA8E4();
  return sub_232EBA2D0();
}

uint64_t sub_232EA912C()
{
  sub_232EAA8E4();
  return sub_232EBA2DC();
}

uint64_t sub_232EA9154(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE v10[16];

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010590);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_232EAA8E4();
  sub_232EBA2C4();
  v10[15] = 0;
  sub_232EBA1EC();
  if (!v2)
  {
    v10[14] = *(_BYTE *)(v3 + 16);
    v10[13] = 1;
    sub_232EAA928();
    sub_232EBA210();
    v10[12] = 2;
    sub_232EBA1EC();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

double sub_232EA92A8@<D0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  _OWORD v6[2];
  uint64_t v7;

  sub_232EAAB14(a1, (uint64_t)v6);
  if (!v2)
  {
    result = *(double *)v6;
    v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    *(_QWORD *)(a2 + 32) = v7;
  }
  return result;
}

uint64_t sub_232EA92EC(_QWORD *a1)
{
  return sub_232EA9154(a1);
}

void sub_232EA9300(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_232EA9350()
{
  int v0;
  unsigned __int8 v2;
  unsigned __int8 v3;

  sub_232EB9E68();
  swift_allocObject();
  sub_232EB9E5C();
  __swift_instantiateConcreteTypeFromMangledName(qword_25423F950);
  sub_232EAB4D0(&qword_25423F948, qword_25423F950);
  sub_232EB9E50();
  swift_release();
  if (v3)
    v0 = v2;
  else
    v0 = v2 & 1;
  return v0 | (v3 << 8);
}

uint64_t sub_232EA9600@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  _BYTE *v10;
  _BYTE v12[15];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010630);
  MEMORY[0x24BDAC7A8](v2);
  v4 = &v12[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010650);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = &v12[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v6);
  v10 = &v12[-v9];
  sub_232EB9E68();
  swift_allocObject();
  sub_232EB9E5C();
  sub_232EAB4D0(&qword_256010658, &qword_256010650);
  sub_232EB9E50();
  swift_release();
  sub_232EAB510((uint64_t)v10, (uint64_t)v8, &qword_256010650);
  if (swift_getEnumCaseMultiPayload() == 1)
    *v4 = *v8;
  else
    sub_232EAB510((uint64_t)v8, (uint64_t)v4, &qword_256010070);
  swift_storeEnumTagMultiPayload();
  return sub_232EAB510((uint64_t)v4, a1, &qword_256010630);
}

uint64_t sub_232EA99B0@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  unint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  char v7;

  sub_232EB9E68();
  swift_allocObject();
  sub_232EB9E5C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256010600);
  sub_232EAB4D0(&qword_256010608, &qword_256010600);
  sub_232EB9E50();
  result = swift_release();
  v3 = (unint64_t)v5;
  v4 = v6;
  if (v7)
  {
    v3 = v5;
    v4 = 0;
  }
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v7;
  return result;
}

uint64_t sub_232EA9C7C()
{
  int v0;
  unsigned __int8 v2;
  unsigned __int8 v3;

  sub_232EB9E68();
  swift_allocObject();
  sub_232EB9E5C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560105E0);
  sub_232EAB4D0(&qword_2560105E8, &qword_2560105E0);
  sub_232EB9E50();
  swift_release();
  if (v3)
    v0 = v2;
  else
    v0 = v2 & 1;
  return v0 | (v3 << 8);
}

uint64_t sub_232EA9F2C(void *a1, uint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  _QWORD *v8;
  uint64_t result;
  uint64_t v10;

  if (qword_25423FA88 != -1)
    swift_once();
  v4 = sub_232EB9F40();
  __swift_project_value_buffer(v4, (uint64_t)qword_254240AF8);
  MEMORY[0x23492A9D0](a1);
  MEMORY[0x23492A9D0](a1);
  v5 = sub_232EB9F28();
  v6 = sub_232EBA078();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v7 = 138543362;
    MEMORY[0x23492A9D0](a1);
    v10 = _swift_stdlib_bridgeErrorToNSError();
    sub_232EBA09C();
    *v8 = v10;

    _os_log_impl(&dword_232E98000, v5, v6, "Error fetching synchronous remote object proxy: %{public}@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256010050);
    swift_arrayDestroy();
    MEMORY[0x23492AAA8](v8, -1, -1);
    MEMORY[0x23492AAA8](v7, -1, -1);
  }
  else
  {

  }
  result = swift_beginAccess();
  if (*(unsigned __int8 *)(a2 + 17) == 255)
    *(_WORD *)(a2 + 16) = 259;
  else
    __break(1u);
  return result;
}

uint64_t sub_232EAA108(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  uint8_t *v23;
  uint64_t v24;
  int v25;
  uint64_t result;
  uint64_t v27;
  char *v28;
  _BYTE *v29;
  char *v30;
  uint64_t v31;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010628);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v27 - v8;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010630);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25423FA88 != -1)
    swift_once();
  v14 = sub_232EB9F40();
  __swift_project_value_buffer(v14, (uint64_t)qword_254240AF8);
  MEMORY[0x23492A9D0](a1);
  MEMORY[0x23492A9D0](a1);
  v15 = sub_232EB9F28();
  v16 = sub_232EBA078();
  if (os_log_type_enabled(v15, v16))
  {
    v27 = a2;
    v17 = swift_slowAlloc();
    v30 = v7;
    v18 = (uint8_t *)v17;
    v19 = swift_slowAlloc();
    v28 = v9;
    v20 = (_QWORD *)v19;
    v29 = v13;
    *(_DWORD *)v18 = 138543362;
    MEMORY[0x23492A9D0](a1);
    v21 = _swift_stdlib_bridgeErrorToNSError();
    v31 = v21;
    a2 = v27;
    v13 = v29;
    sub_232EBA09C();
    *v20 = v21;

    _os_log_impl(&dword_232E98000, v15, v16, "Error fetching synchronous remote object proxy: %{public}@", v18, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256010050);
    swift_arrayDestroy();
    v22 = v20;
    v9 = v28;
    MEMORY[0x23492AAA8](v22, -1, -1);
    v23 = v18;
    v7 = v30;
    MEMORY[0x23492AAA8](v23, -1, -1);
  }
  else
  {

  }
  *v13 = 3;
  swift_storeEnumTagMultiPayload();
  v24 = a2 + *(_QWORD *)(*(_QWORD *)a2 + 104);
  swift_beginAccess();
  sub_232EAB554(v24, (uint64_t)v9, &qword_256010628);
  v25 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10);
  result = sub_232E9CF10((uint64_t)v9, &qword_256010628);
  if (v25 == 1)
  {
    sub_232EAB554((uint64_t)v13, (uint64_t)v7, &qword_256010630);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v7, 0, 1, v10);
    swift_beginAccess();
    sub_232EAB488((uint64_t)v7, v24);
    swift_endAccess();
    return sub_232E9CF10((uint64_t)v13, &qword_256010630);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_232EAA458(void *a1, uint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  _QWORD *v8;
  uint64_t result;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;

  if (qword_25423FA88 != -1)
    swift_once();
  v4 = sub_232EB9F40();
  __swift_project_value_buffer(v4, (uint64_t)qword_254240AF8);
  MEMORY[0x23492A9D0](a1);
  MEMORY[0x23492A9D0](a1);
  v5 = sub_232EB9F28();
  v6 = sub_232EBA078();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v7 = 138543362;
    MEMORY[0x23492A9D0](a1);
    v12 = _swift_stdlib_bridgeErrorToNSError();
    sub_232EBA09C();
    *v8 = v12;

    _os_log_impl(&dword_232E98000, v5, v6, "Error fetching synchronous remote object proxy: %{public}@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256010050);
    swift_arrayDestroy();
    MEMORY[0x23492AAA8](v8, -1, -1);
    MEMORY[0x23492AAA8](v7, -1, -1);
  }
  else
  {

  }
  result = swift_beginAccess();
  if (*(unsigned __int8 *)(a2 + 32) == 255)
  {
    v10 = *(_QWORD *)(a2 + 16);
    v11 = *(_QWORD *)(a2 + 24);
    *(_OWORD *)(a2 + 16) = xmmword_232EBBCC0;
    *(_BYTE *)(a2 + 32) = 1;
    return sub_232EAB35C(v10, v11, 0xFFu);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_232EAA648(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  int v15;
  uint64_t result;
  _BYTE v17[24];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010628);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = &v17[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v5);
  v9 = &v17[-v8];
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010630);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = &v17[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_232EA9600((uint64_t)v13);
  v14 = a3 + *(_QWORD *)(*(_QWORD *)a3 + 104);
  swift_beginAccess();
  sub_232EAB554(v14, (uint64_t)v9, &qword_256010628);
  v15 = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10);
  result = sub_232E9CF10((uint64_t)v9, &qword_256010628);
  if (v15 == 1)
  {
    sub_232EAB554((uint64_t)v13, (uint64_t)v7, &qword_256010630);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v7, 0, 1, v10);
    swift_beginAccess();
    sub_232EAB488((uint64_t)v7, v14);
    swift_endAccess();
    return sub_232E9CF10((uint64_t)v13, &qword_256010630);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_232EAA7FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  _QWORD v10[2];
  char v11;

  sub_232EA99B0((uint64_t)v10);
  v4 = v10[0];
  v5 = v10[1];
  v6 = v11;
  result = swift_beginAccess();
  if (*(unsigned __int8 *)(a3 + 32) == 255)
  {
    v8 = *(_QWORD *)(a3 + 16);
    v9 = *(_QWORD *)(a3 + 24);
    *(_QWORD *)(a3 + 16) = v4;
    *(_QWORD *)(a3 + 24) = v5;
    *(_BYTE *)(a3 + 32) = v6;
    return sub_232EAB35C(v8, v9, 0xFFu);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_232EAA870(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int16 v4;
  uint64_t result;

  v4 = sub_232EA9350();
  result = swift_beginAccess();
  if (*(unsigned __int8 *)(a3 + 17) == 255)
    *(_WORD *)(a3 + 16) = v4 & 0x1FF;
  else
    __break(1u);
  return result;
}

void sub_232EAA8D4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  sub_232EA8A14(a1, a2, a3, a4, a5, *(_QWORD *)(v5 + 16));
}

void sub_232EAA8DC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  sub_232EA8BE4(a1, a2, a3, a4, a5, *(_QWORD *)(v5 + 16), *(_QWORD *)(v5 + 24));
}

unint64_t sub_232EAA8E4()
{
  unint64_t result;

  result = qword_256010598;
  if (!qword_256010598)
  {
    result = MEMORY[0x23492AA30](&unk_232EBBF3C, &type metadata for ImpressionIntakeRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010598);
  }
  return result;
}

unint64_t sub_232EAA928()
{
  unint64_t result;

  result = qword_2560105A0;
  if (!qword_2560105A0)
  {
    result = MEMORY[0x23492AA30](&unk_232EBBDAC, &type metadata for ImpressionIntakeRequest.InteractionType);
    atomic_store(result, (unint64_t *)&qword_2560105A0);
  }
  return result;
}

uint64_t sub_232EAA96C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x4A746361706D6F63 && a2 == 0xEA00000000005357;
  if (v2 || (sub_232EBA228() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7463617265746E69 && a2 == 0xEF657079546E6F69 || (sub_232EBA228() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7542746E65696C63 && a2 == 0xEE004449656C646ELL)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_232EBA228();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_232EAAB14@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t);
  uint64_t v16;
  uint64_t result;
  uint64_t v18;
  int v19;
  char v20;
  char v21;
  unsigned __int8 v22;
  char v23;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010618);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_232EAA8E4();
  sub_232EBA2B8();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v23 = 0;
  v9 = sub_232EBA180();
  v11 = v10;
  v21 = 1;
  sub_232EAB3F0();
  swift_bridgeObjectRetain();
  sub_232EBA1A4();
  v19 = v22;
  v20 = 2;
  v12 = sub_232EBA180();
  v14 = v13;
  v15 = *(void (**)(char *, uint64_t))(v6 + 8);
  v16 = v12;
  v15(v8, v5);
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  *(_QWORD *)a2 = v9;
  *(_QWORD *)(a2 + 8) = v11;
  *(_BYTE *)(a2 + 16) = v19;
  *(_QWORD *)(a2 + 24) = v16;
  *(_QWORD *)(a2 + 32) = v14;
  return result;
}

unint64_t sub_232EAAD10()
{
  unint64_t result;

  result = qword_2560105A8;
  if (!qword_2560105A8)
  {
    result = MEMORY[0x23492AA30](&unk_232EBBCE4, &type metadata for ImpressionIntakeRequest.InteractionType);
    atomic_store(result, (unint64_t *)&qword_2560105A8);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for AppImpressionHeader(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for ImpressionIntakeRequest()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ImpressionIntakeRequest(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ImpressionIntakeRequest(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for ImpressionIntakeRequest(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ImpressionIntakeRequest(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ImpressionIntakeRequest(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ImpressionIntakeRequest()
{
  return &type metadata for ImpressionIntakeRequest;
}

uint64_t storeEnumTagSinglePayload for ImpressionIntakeRequest.InteractionType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_232EAAFB0 + 4 * byte_232EBBCD5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_232EAAFE4 + 4 * byte_232EBBCD0[v4]))();
}

uint64_t sub_232EAAFE4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_232EAAFEC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x232EAAFF4);
  return result;
}

uint64_t sub_232EAB000(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x232EAB008);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_232EAB00C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_232EAB014(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ImpressionIntakeRequest.InteractionType()
{
  return &type metadata for ImpressionIntakeRequest.InteractionType;
}

uint64_t storeEnumTagSinglePayload for ImpressionIntakeRequest.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_232EAB07C + 4 * byte_232EBBCDF[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_232EAB0B0 + 4 * byte_232EBBCDA[v4]))();
}

uint64_t sub_232EAB0B0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_232EAB0B8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x232EAB0C0);
  return result;
}

uint64_t sub_232EAB0CC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x232EAB0D4);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_232EAB0D8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_232EAB0E0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ImpressionIntakeRequest.CodingKeys()
{
  return &type metadata for ImpressionIntakeRequest.CodingKeys;
}

unint64_t sub_232EAB100()
{
  unint64_t result;

  result = qword_2560105B0;
  if (!qword_2560105B0)
  {
    result = MEMORY[0x23492AA30](&unk_232EBBF14, &type metadata for ImpressionIntakeRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560105B0);
  }
  return result;
}

unint64_t sub_232EAB148()
{
  unint64_t result;

  result = qword_2560105B8;
  if (!qword_2560105B8)
  {
    result = MEMORY[0x23492AA30](&unk_232EBBE84, &type metadata for ImpressionIntakeRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560105B8);
  }
  return result;
}

unint64_t sub_232EAB190()
{
  unint64_t result;

  result = qword_2560105C0;
  if (!qword_2560105C0)
  {
    result = MEMORY[0x23492AA30](&unk_232EBBEAC, &type metadata for ImpressionIntakeRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560105C0);
  }
  return result;
}

unint64_t sub_232EAB1D4()
{
  unint64_t result;

  result = qword_2560105C8;
  if (!qword_2560105C8)
  {
    result = MEMORY[0x23492AA30](&unk_232EBBD4C, &type metadata for ImpressionIntakeRequest.InteractionType);
    atomic_store(result, (unint64_t *)&qword_2560105C8);
  }
  return result;
}

uint64_t sub_232EAB218(void *a1)
{
  uint64_t v1;

  return sub_232EA9F2C(a1, v1);
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

unint64_t sub_232EAB248()
{
  unint64_t result;

  result = qword_2560105D8;
  if (!qword_2560105D8)
  {
    result = MEMORY[0x23492AA30](&unk_232EBE098, &type metadata for TokenFetchRequest);
    atomic_store(result, (unint64_t *)&qword_2560105D8);
  }
  return result;
}

uint64_t sub_232EAB28C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_232EAB2B0(void *a1)
{
  uint64_t v1;

  return sub_232EAA458(a1, v1);
}

unint64_t sub_232EAB2B8()
{
  unint64_t result;

  result = qword_2560105F8;
  if (!qword_2560105F8)
  {
    result = MEMORY[0x23492AA30](&unk_232EBCA88, &type metadata for SnoutRequest);
    atomic_store(result, (unint64_t *)&qword_2560105F8);
  }
  return result;
}

uint64_t sub_232EAB2FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_232EAA7FC(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_232EAB304(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_232EAB318(a1, a2);
  return a1;
}

uint64_t sub_232EAB318(uint64_t a1, unint64_t a2)
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

uint64_t sub_232EAB35C(uint64_t result, unint64_t a2, unsigned __int8 a3)
{
  if (a3 != 255)
    return sub_232EAB374(result, a2, a3 & 1);
  return result;
}

uint64_t sub_232EAB374(uint64_t a1, unint64_t a2, char a3)
{
  if ((a3 & 1) == 0)
    return sub_232EAB380(a1, a2);
  return a1;
}

uint64_t sub_232EAB380(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_232EA2EE8(a1, a2);
  return a1;
}

uint64_t sub_232EAB394(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_232EAA870(a1, a2, *(_QWORD *)(v2 + 16));
}

unint64_t sub_232EAB3AC()
{
  unint64_t result;

  result = qword_256010610;
  if (!qword_256010610)
  {
    result = MEMORY[0x23492AA30](&unk_232EBC6E4, &type metadata for PostbackUpdateTestingRequest);
    atomic_store(result, (unint64_t *)&qword_256010610);
  }
  return result;
}

unint64_t sub_232EAB3F0()
{
  unint64_t result;

  result = qword_256010620;
  if (!qword_256010620)
  {
    result = MEMORY[0x23492AA30](&unk_232EBBD84, &type metadata for ImpressionIntakeRequest.InteractionType);
    atomic_store(result, (unint64_t *)&qword_256010620);
  }
  return result;
}

uint64_t sub_232EAB434(void *a1)
{
  uint64_t v1;

  return sub_232EAA108(a1, v1);
}

unint64_t sub_232EAB43C()
{
  unint64_t result;

  result = qword_256010648;
  if (!qword_256010648)
  {
    result = MEMORY[0x23492AA30](&unk_232EBBDFC, &type metadata for ImpressionIntakeRequest);
    atomic_store(result, (unint64_t *)&qword_256010648);
  }
  return result;
}

uint64_t sub_232EAB480(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_232EAA648(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_232EAB488(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010628);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_232EAB4D0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x23492AA30](&unk_232EBCF80, v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_232EAB510(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_232EAB554(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_232EAB598(void *a1)
{
  uint64_t v1;

  return sub_232EA9F2C(a1, v1);
}

uint64_t sub_232EAB5F0()
{
  uint64_t result;

  result = sub_232EAB62C();
  qword_254240AF0 = result;
  return result;
}

uint64_t type metadata accessor for TokenHandoffServiceConnection()
{
  return objc_opt_self();
}

uint64_t sub_232EAB62C()
{
  char v0;
  id v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t result;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  ValueMetadata *v19;
  unint64_t v20;
  uint64_t v21;

  v19 = &type metadata for FeatureFlag;
  v20 = sub_232EA0F30();
  LOBYTE(v16) = 0;
  v0 = sub_232EB9F1C();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v16);
  if ((v0 & 1) != 0)
  {
    v1 = objc_allocWithZone(MEMORY[0x24BDD1988]);
    v2 = (void *)sub_232EB9F4C();
    v3 = objc_msgSend(v1, sel_initWithMachServiceName_options_, v2, 0, v16);

    v4 = (void *)objc_opt_self();
    v5 = objc_msgSend(v4, sel_interfaceWithProtocol_, &unk_2560181D8);
    objc_msgSend(v3, sel_setExportedInterface_, v5);

    v6 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for XPCClient()), sel_init);
    objc_msgSend(v3, sel_setExportedObject_, v6);

    v7 = objc_msgSend(v4, sel_interfaceWithProtocol_, &unk_256018860);
    objc_msgSend(v3, sel_setRemoteObjectInterface_, v7);

    v20 = (unint64_t)sub_232EA0A58;
    v21 = 0;
    v8 = MEMORY[0x24BDAC760];
    v16 = MEMORY[0x24BDAC760];
    v17 = 1107296256;
    v18 = sub_232EA0A64;
    v19 = (ValueMetadata *)&block_descriptor_3;
    v9 = _Block_copy(&v16);
    objc_msgSend(v3, sel_setInterruptionHandler_, v9);
    _Block_release(v9);
    v20 = (unint64_t)sub_232EA0A90;
    v21 = 0;
    v16 = v8;
    v17 = 1107296256;
    v18 = sub_232EA0A64;
    v19 = (ValueMetadata *)&block_descriptor_3_1;
    v10 = _Block_copy(&v16);
    objc_msgSend(v3, sel_setInvalidationHandler_, v10);
    _Block_release(v10);
    objc_msgSend(v3, sel_resume);
    type metadata accessor for TokenHandoffServiceConnection();
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = v3;
  }
  else
  {
    if (qword_25423FA88 != -1)
      swift_once();
    v12 = sub_232EB9F40();
    __swift_project_value_buffer(v12, (uint64_t)qword_254240AF8);
    v13 = sub_232EB9F28();
    v14 = sub_232EBA078();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_232E98000, v13, v14, "Service feature flag is not enabled", v15, 2u);
      MEMORY[0x23492AAA8](v15, -1, -1);
    }

    return 0;
  }
  return result;
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t sub_232EAB934()
{
  return sub_232EAB9B4(&qword_25423FA88, (uint64_t)qword_254240AF8);
}

void *sub_232EAB950()
{
  return &unk_250436A48;
}

unint64_t sub_232EAB95C()
{
  return 0xD00000000000001ALL;
}

uint64_t sub_232EAB978(uint64_t a1)
{
  return sub_232EABD94(a1, qword_256016D10);
}

uint64_t sub_232EAB998()
{
  return sub_232EAB9B4(&qword_256010220, (uint64_t)qword_256016D10);
}

uint64_t sub_232EAB9B4(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = sub_232EB9F40();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t sub_232EAB9F4@<X0>(uint64_t a1@<X8>)
{
  return sub_232EABA6C(&qword_256010220, (uint64_t)qword_256016D10, a1);
}

uint64_t sub_232EABA10(uint64_t a1)
{
  return sub_232EABD94(a1, qword_256016D28);
}

uint64_t sub_232EABA34()
{
  return sub_232EAB9B4(&qword_256010228, (uint64_t)qword_256016D28);
}

uint64_t sub_232EABA50@<X0>(uint64_t a1@<X8>)
{
  return sub_232EABA6C(&qword_256010228, (uint64_t)qword_256016D28, a1);
}

uint64_t sub_232EABA6C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_232EB9F40();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t sub_232EABAD4(uint64_t a1)
{
  return sub_232EABD94(a1, qword_254240AF8);
}

uint64_t sub_232EABAEC@<X0>(uint64_t a1@<X8>)
{
  return sub_232EABA6C(&qword_25423FA88, (uint64_t)qword_254240AF8, a1);
}

uint64_t sub_232EABB08(uint64_t a1)
{
  return sub_232EABD94(a1, qword_256016D40);
}

uint64_t sub_232EABB28()
{
  return sub_232EAB9B4(&qword_256010230, (uint64_t)qword_256016D40);
}

uint64_t sub_232EABB44@<X0>(uint64_t a1@<X8>)
{
  return sub_232EABA6C(&qword_256010230, (uint64_t)qword_256016D40, a1);
}

uint64_t sub_232EABB60(uint64_t a1)
{
  return sub_232EABD94(a1, qword_256016D58);
}

uint64_t sub_232EABB7C()
{
  return sub_232EAB9B4(&qword_256010238, (uint64_t)qword_256016D58);
}

uint64_t sub_232EABB98@<X0>(uint64_t a1@<X8>)
{
  return sub_232EABA6C(&qword_256010238, (uint64_t)qword_256016D58, a1);
}

uint64_t sub_232EABBB4(uint64_t a1)
{
  return sub_232EABD94(a1, qword_256016D70);
}

uint64_t sub_232EABBCC()
{
  return sub_232EAB9B4(&qword_256010240, (uint64_t)qword_256016D70);
}

uint64_t sub_232EABBE8@<X0>(uint64_t a1@<X8>)
{
  return sub_232EABA6C(&qword_256010240, (uint64_t)qword_256016D70, a1);
}

uint64_t sub_232EABC04(uint64_t a1)
{
  return sub_232EABD94(a1, qword_256016D88);
}

uint64_t sub_232EABC28()
{
  return sub_232EAB9B4(&qword_256010248, (uint64_t)qword_256016D88);
}

uint64_t sub_232EABC44@<X0>(uint64_t a1@<X8>)
{
  return sub_232EABA6C(&qword_256010248, (uint64_t)qword_256016D88, a1);
}

uint64_t sub_232EABC60(uint64_t a1)
{
  return sub_232EABD94(a1, qword_256016DA0);
}

uint64_t sub_232EABC7C()
{
  return sub_232EAB9B4(&qword_256010250, (uint64_t)qword_256016DA0);
}

uint64_t sub_232EABC98@<X0>(uint64_t a1@<X8>)
{
  return sub_232EABA6C(&qword_256010250, (uint64_t)qword_256016DA0, a1);
}

uint64_t sub_232EABCB4(uint64_t a1)
{
  return sub_232EABD94(a1, qword_256016DB8);
}

uint64_t sub_232EABCD4()
{
  return sub_232EAB9B4(&qword_256010258, (uint64_t)qword_256016DB8);
}

uint64_t sub_232EABCF0@<X0>(uint64_t a1@<X8>)
{
  return sub_232EABA6C(&qword_256010258, (uint64_t)qword_256016DB8, a1);
}

uint64_t sub_232EABD0C(uint64_t a1)
{
  return sub_232EABD94(a1, qword_256016DD0);
}

uint64_t sub_232EABD30()
{
  return sub_232EAB9B4(&qword_256010260, (uint64_t)qword_256016DD0);
}

uint64_t sub_232EABD4C@<X0>(uint64_t a1@<X8>)
{
  return sub_232EABA6C(&qword_256010260, (uint64_t)qword_256016DD0, a1);
}

uint64_t sub_232EABD68(uint64_t a1)
{
  return sub_232EABD94(a1, qword_256016DE8);
}

uint64_t sub_232EABD94(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_232EB9F40();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_232EB9F34();
}

uint64_t sub_232EABE08()
{
  return sub_232EAB9B4(&qword_256010268, (uint64_t)qword_256016DE8);
}

uint64_t sub_232EABE24@<X0>(uint64_t a1@<X8>)
{
  return sub_232EABA6C(&qword_256010268, (uint64_t)qword_256016DE8, a1);
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

uint64_t type metadata accessor for XPCServiceConnection()
{
  return objc_opt_self();
}

uint64_t sub_232EABEA0(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2;
  uint64_t v3;
  unint64_t v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  char v8;

  v2 = a1;
  if (a1)
  {
    if (a1 == 1)
      v3 = 4931905;
    else
      v3 = 1162891086;
    if (v2 == 1)
      v4 = 0xE300000000000000;
    else
      v4 = 0xE400000000000000;
    v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1)
        v6 = 4931905;
      else
        v6 = 1162891086;
      if (v5 == 1)
        v7 = 0xE300000000000000;
      else
        v7 = 0xE400000000000000;
      if (v3 != v6)
        goto LABEL_21;
      goto LABEL_19;
    }
  }
  else
  {
    v4 = 0xE300000000000000;
    v3 = 5129543;
    v5 = a2;
    if (a2)
      goto LABEL_9;
  }
  v7 = 0xE300000000000000;
  if (v3 != 5129543)
  {
LABEL_21:
    v8 = sub_232EBA228();
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

uint64_t sub_232EABF88(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x6B63696C63;
  else
    v3 = 2003134838;
  if (v2)
    v4 = 0xE400000000000000;
  else
    v4 = 0xE500000000000000;
  if ((a2 & 1) != 0)
    v5 = 0x6B63696C63;
  else
    v5 = 2003134838;
  if ((a2 & 1) != 0)
    v6 = 0xE500000000000000;
  else
    v6 = 0xE400000000000000;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_232EBA228();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_232EAC020(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2;
  uint64_t v3;
  unint64_t v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  char v8;

  v2 = a1;
  if (a1)
  {
    if (a1 == 1)
      v3 = 7827308;
    else
      v3 = 0x6D756964656DLL;
    if (v2 == 1)
      v4 = 0xE300000000000000;
    else
      v4 = 0xE600000000000000;
    v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1)
        v6 = 7827308;
      else
        v6 = 0x6D756964656DLL;
      if (v5 == 1)
        v7 = 0xE300000000000000;
      else
        v7 = 0xE600000000000000;
      if (v3 != v6)
        goto LABEL_21;
      goto LABEL_19;
    }
  }
  else
  {
    v4 = 0xE400000000000000;
    v3 = 1751607656;
    v5 = a2;
    if (a2)
      goto LABEL_9;
  }
  v7 = 0xE400000000000000;
  if (v3 != 1751607656)
  {
LABEL_21:
    v8 = sub_232EBA228();
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

void sub_232EAC110(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_232EAC15C(uint64_t a1, unsigned __int8 a2, uint64_t a3)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_232EAC20C + 4 * byte_232EBC048[a2]))(a3 + 4);
}

uint64_t sub_232EAC20C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  char v4;

  if (a1 == a3 + 4 && v3 == 0x8000000232EBE4D0)
    v4 = 1;
  else
    v4 = sub_232EBA228();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4 & 1;
}

uint64_t sub_232EAC2F0(char a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  if ((a1 & 1) != 0)
    v2 = 6580587;
  else
    v2 = 6777953;
  if ((a2 & 1) != 0)
    v3 = 6580587;
  else
    v3 = 6777953;
  if (v2 == v3)
    v4 = 1;
  else
    v4 = sub_232EBA228();
  swift_bridgeObjectRelease_n();
  return v4 & 1;
}

uint64_t sub_232EAC35C(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x69746375646F7270;
  else
    v3 = 0x6D706F6C65766564;
  if (v2)
    v4 = 0xEB00000000746E65;
  else
    v4 = 0xEA00000000006E6FLL;
  if ((a2 & 1) != 0)
    v5 = 0x69746375646F7270;
  else
    v5 = 0x6D706F6C65766564;
  if ((a2 & 1) != 0)
    v6 = 0xEA00000000006E6FLL;
  else
    v6 = 0xEB00000000746E65;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_232EBA228();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_232EAC40C(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2;
  uint64_t v3;
  unint64_t v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  char v8;

  v2 = a1;
  if (a1)
  {
    if (a1 == 1)
      v3 = 0x6F6C6E776F646572;
    else
      v3 = 0x6761676E652D6572;
    if (v2 == 1)
      v4 = 0xEA00000000006461;
    else
      v4 = 0xED0000746E656D65;
    v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1)
        v6 = 0x6F6C6E776F646572;
      else
        v6 = 0x6761676E652D6572;
      if (v5 == 1)
        v7 = 0xEA00000000006461;
      else
        v7 = 0xED0000746E656D65;
      if (v3 != v6)
        goto LABEL_21;
      goto LABEL_19;
    }
  }
  else
  {
    v4 = 0xE800000000000000;
    v3 = 0x64616F6C6E776F64;
    v5 = a2;
    if (a2)
      goto LABEL_9;
  }
  v7 = 0xE800000000000000;
  if (v3 != 0x64616F6C6E776F64)
  {
LABEL_21:
    v8 = sub_232EBA228();
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

void sub_232EAC544(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_232EAC588()
{
  sub_232EB9F70();
  return swift_bridgeObjectRelease();
}

void sub_232EAC630(uint64_t a1, char a2)
{
  sub_232EBA288();
  __asm { BR              X10 }
}

uint64_t sub_232EAC684()
{
  sub_232EB9F70();
  swift_bridgeObjectRelease();
  return sub_232EBA2A0();
}

uint64_t sub_232EAC748(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_bridgeObjectRetain();
  return a3;
}

uint64_t sub_232EAC778(char *a1, char *a2)
{
  return sub_232EAC2F0(*a1, *a2);
}

uint64_t sub_232EAC784()
{
  sub_232EBA288();
  sub_232EB9F70();
  swift_bridgeObjectRelease();
  return sub_232EBA2A0();
}

uint64_t sub_232EAC7E8()
{
  sub_232EB9F70();
  return swift_bridgeObjectRelease();
}

uint64_t sub_232EAC820()
{
  sub_232EBA288();
  sub_232EB9F70();
  swift_bridgeObjectRelease();
  return sub_232EBA2A0();
}

uint64_t sub_232EAC880@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_232EBA144();
  result = swift_bridgeObjectRelease();
  if (v2 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v2)
    v4 = 0;
  *a1 = v4;
  return result;
}

void sub_232EAC8DC(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  uint64_t v2;

  v2 = 6777953;
  if (*v1)
    v2 = 6580587;
  *a1 = v2;
  a1[1] = 0xE300000000000000;
}

uint64_t sub_232EAC904()
{
  _BYTE *v0;

  if (*v0)
    return 6580587;
  else
    return 6777953;
}

uint64_t sub_232EAC928@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_232EBA144();
  result = swift_bridgeObjectRelease();
  if (v2 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v2)
    v4 = 0;
  *a1 = v4;
  return result;
}

uint64_t sub_232EAC988()
{
  sub_232EADE48();
  return sub_232EBA2D0();
}

uint64_t sub_232EAC9B0()
{
  sub_232EADE48();
  return sub_232EBA2DC();
}

uint64_t sub_232EAC9D8(_QWORD *a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v3;

  result = sub_232EAD1A4(a1);
  if (v1)
    return v3;
  return result;
}

uint64_t sub_232EACA00@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = sub_232EAD1A4(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t sub_232EACA2C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_232EB9F10();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t sub_232EACA64()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for AppImpressionPayload() + 20));
}

uint64_t sub_232EACA84()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for AppImpressionPayload() + 24));
}

uint64_t sub_232EACAA4()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for AppImpressionPayload() + 28));
}

uint64_t sub_232EACAC4()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for AppImpressionPayload() + 32));
}

uint64_t sub_232EACAE4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for AppImpressionPayload() + 40));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_232EACB20()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for AppImpressionPayload() + 44));
}

uint64_t sub_232EACB40(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_232EACB78 + 4 * byte_232EBC060[a1]))(0xD000000000000015, 0x8000000232EBE4B0);
}

uint64_t sub_232EACB78(uint64_t a1)
{
  return a1 + 4;
}

uint64_t sub_232EACC0C(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_232EACC44 + 4 * byte_232EBC068[a1]))(0xD000000000000015, 0x8000000232EBE4B0);
}

uint64_t sub_232EACC44(uint64_t a1)
{
  return a1 + 4;
}

void sub_232EACCD8(char *a1)
{
  sub_232EAC110(*a1);
}

void sub_232EACCE4()
{
  char *v0;

  sub_232EAC630(0, *v0);
}

void sub_232EACCF0(uint64_t a1)
{
  char *v1;

  sub_232EAC544(a1, *v1);
}

void sub_232EACCF8(uint64_t a1)
{
  char *v1;

  sub_232EAC630(a1, *v1);
}

uint64_t sub_232EACD00@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_232EADE00();
  *a1 = result;
  return result;
}

uint64_t sub_232EACD2C@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_232EACB40(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_232EACD54()
{
  unsigned __int8 *v0;

  return sub_232EACC0C(*v0);
}

uint64_t sub_232EACD5C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_232EADE00();
  *a1 = result;
  return result;
}

void sub_232EACD80(_BYTE *a1@<X8>)
{
  *a1 = 8;
}

uint64_t sub_232EACD8C()
{
  sub_232EAD38C();
  return sub_232EBA2D0();
}

uint64_t sub_232EACDB4()
{
  sub_232EAD38C();
  return sub_232EBA2DC();
}

uint64_t sub_232EACDDC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  char v25;
  char v26;
  char v27;
  char v28;
  char v29;
  char v30;
  char v31;
  char v32;

  v19 = a2;
  v3 = sub_232EB9F10();
  v21 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v22 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010660);
  v5 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (int *)type metadata accessor for AppImpressionPayload();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_232EAD38C();
  v23 = v7;
  v11 = v24;
  sub_232EBA2B8();
  if (v11)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v12 = v5;
  v13 = v21;
  v32 = 0;
  sub_232EAD3D0();
  sub_232EBA1A4();
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v10, v22, v3);
  v31 = 1;
  *(_QWORD *)&v10[v8[5]] = sub_232EBA1B0();
  v30 = 2;
  *(_QWORD *)&v10[v8[6]] = sub_232EBA1B0();
  v29 = 3;
  *(_QWORD *)&v10[v8[7]] = sub_232EBA198();
  v28 = 4;
  *(_QWORD *)&v10[v8[8]] = sub_232EBA1B0();
  v27 = 5;
  sub_232EAD418();
  sub_232EBA1A4();
  v26 = 6;
  v14 = sub_232EBA180();
  v15 = (uint64_t *)&v10[v8[10]];
  *v15 = v14;
  v15[1] = v16;
  v25 = 7;
  v17 = sub_232EBA168();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v23, v20);
  v10[v8[11]] = v17;
  sub_232EAD45C((uint64_t)v10, v19);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_232EAD4A0((uint64_t)v10);
}

uint64_t sub_232EAD190@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_232EACDDC(a1, a2);
}

uint64_t sub_232EAD1A4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;
  char v10;
  char v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010740);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_232EADE48();
  sub_232EBA2B8();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    v11 = 0;
    v7 = sub_232EBA180();
    v10 = 1;
    swift_bridgeObjectRetain();
    sub_232EBA180();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v7;
}

uint64_t type metadata accessor for AppImpressionPayload()
{
  uint64_t result;

  result = qword_2560106D8;
  if (!qword_2560106D8)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_232EAD38C()
{
  unint64_t result;

  result = qword_256010668;
  if (!qword_256010668)
  {
    result = MEMORY[0x23492AA30](&unk_232EBC264, &type metadata for AppImpressionPayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010668);
  }
  return result;
}

unint64_t sub_232EAD3D0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256010670;
  if (!qword_256010670)
  {
    v1 = sub_232EB9F10();
    result = MEMORY[0x23492AA30](MEMORY[0x24BDCEAA8], v1);
    atomic_store(result, (unint64_t *)&qword_256010670);
  }
  return result;
}

unint64_t sub_232EAD418()
{
  unint64_t result;

  result = qword_256010678;
  if (!qword_256010678)
  {
    result = MEMORY[0x23492AA30](&unk_232EBBC3C, &type metadata for ImpressionType);
    atomic_store(result, (unint64_t *)&qword_256010678);
  }
  return result;
}

uint64_t sub_232EAD45C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AppImpressionPayload();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_232EAD4A0(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for AppImpressionPayload();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t destroy for AppImpressionHeader()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for AppImpressionHeader(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for AppImpressionHeader(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

_QWORD *assignWithTake for AppImpressionHeader(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AppImpressionHeader(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AppImpressionHeader(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
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
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AppImpressionHeader()
{
  return &type metadata for AppImpressionHeader;
}

_QWORD *sub_232EAD694(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_232EB9F10();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[6];
    *(_QWORD *)((char *)a1 + a3[5]) = *(_QWORD *)((char *)a2 + a3[5]);
    *(_QWORD *)((char *)a1 + v8) = *(_QWORD *)((char *)a2 + v8);
    v9 = a3[8];
    *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
    *(_QWORD *)((char *)a1 + v9) = *(_QWORD *)((char *)a2 + v9);
    v10 = a3[10];
    v11 = a3[11];
    v12 = (_QWORD *)((char *)a1 + v10);
    v13 = (_QWORD *)((char *)a2 + v10);
    v14 = v13[1];
    *v12 = *v13;
    v12[1] = v14;
    *((_BYTE *)a1 + v11) = *((_BYTE *)a2 + v11);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_232EAD758(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_232EB9F10();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_232EAD7A0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;

  v6 = sub_232EB9F10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  v8 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  *(_QWORD *)(a1 + v8) = *(_QWORD *)(a2 + v8);
  v9 = a3[10];
  v10 = a3[11];
  v11 = (_QWORD *)(a1 + v9);
  v12 = (_QWORD *)(a2 + v9);
  v13 = v12[1];
  *v11 = *v12;
  v11[1] = v13;
  *(_BYTE *)(a1 + v10) = *(_BYTE *)(a2 + v10);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_232EAD838(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;

  v6 = sub_232EB9F10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  v7 = a3[10];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + a3[11]) = *(_BYTE *)(a2 + a3[11]);
  return a1;
}

uint64_t sub_232EAD8F0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = sub_232EB9F10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  v8 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  *(_QWORD *)(a1 + v8) = *(_QWORD *)(a2 + v8);
  v9 = a3[11];
  *(_OWORD *)(a1 + a3[10]) = *(_OWORD *)(a2 + a3[10]);
  *(_BYTE *)(a1 + v9) = *(_BYTE *)(a2 + v9);
  return a1;
}

uint64_t sub_232EAD97C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v6 = sub_232EB9F10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  v8 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  *(_QWORD *)(a1 + v8) = *(_QWORD *)(a2 + v8);
  v9 = a3[10];
  v10 = (_QWORD *)(a1 + v9);
  v11 = (uint64_t *)(a2 + v9);
  v13 = *v11;
  v12 = v11[1];
  *v10 = v13;
  v10[1] = v12;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + a3[11]) = *(_BYTE *)(a2 + a3[11]);
  return a1;
}

uint64_t sub_232EADA1C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_232EADA28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_232EB9F10();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 40) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_232EADAA8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_232EADAB4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_232EB9F10();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 40) + 8) = (a2 - 1);
  return result;
}

uint64_t sub_232EADB30()
{
  uint64_t result;
  unint64_t v1;

  result = sub_232EB9F10();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AppImpressionPayload.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF9)
    goto LABEL_17;
  if (a2 + 7 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 7) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 7;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 7;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 7;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 8;
  v8 = v6 - 8;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for AppImpressionPayload.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 7 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 7) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF9)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF8)
    return ((uint64_t (*)(void))((char *)&loc_232EADCA8 + 4 * byte_232EBC075[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_232EADCDC + 4 * byte_232EBC070[v4]))();
}

uint64_t sub_232EADCDC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_232EADCE4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x232EADCECLL);
  return result;
}

uint64_t sub_232EADCF8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x232EADD00);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_232EADD04(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_232EADD0C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AppImpressionPayload.CodingKeys()
{
  return &type metadata for AppImpressionPayload.CodingKeys;
}

unint64_t sub_232EADD2C()
{
  unint64_t result;

  result = qword_256010728;
  if (!qword_256010728)
  {
    result = MEMORY[0x23492AA30](&unk_232EBC23C, &type metadata for AppImpressionPayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010728);
  }
  return result;
}

unint64_t sub_232EADD74()
{
  unint64_t result;

  result = qword_256010730;
  if (!qword_256010730)
  {
    result = MEMORY[0x23492AA30](&unk_232EBC174, &type metadata for AppImpressionPayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010730);
  }
  return result;
}

unint64_t sub_232EADDBC()
{
  unint64_t result;

  result = qword_256010738;
  if (!qword_256010738)
  {
    result = MEMORY[0x23492AA30](&unk_232EBC19C, &type metadata for AppImpressionPayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010738);
  }
  return result;
}

uint64_t sub_232EADE00()
{
  unint64_t v0;

  v0 = sub_232EBA144();
  swift_bridgeObjectRelease();
  if (v0 >= 8)
    return 8;
  else
    return v0;
}

unint64_t sub_232EADE48()
{
  unint64_t result;

  result = qword_256010748;
  if (!qword_256010748)
  {
    result = MEMORY[0x23492AA30](&unk_232EBC3A4, &type metadata for AppImpressionHeader.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010748);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for AppImpressionHeader.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_232EADED8 + 4 * byte_232EBC07F[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_232EADF0C + 4 * byte_232EBC07A[v4]))();
}

uint64_t sub_232EADF0C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_232EADF14(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x232EADF1CLL);
  return result;
}

uint64_t sub_232EADF28(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x232EADF30);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_232EADF34(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_232EADF3C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AppImpressionHeader.CodingKeys()
{
  return &type metadata for AppImpressionHeader.CodingKeys;
}

unint64_t sub_232EADF5C()
{
  unint64_t result;

  result = qword_256010750;
  if (!qword_256010750)
  {
    result = MEMORY[0x23492AA30](&unk_232EBC37C, &type metadata for AppImpressionHeader.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010750);
  }
  return result;
}

unint64_t sub_232EADFA4()
{
  unint64_t result;

  result = qword_256010758;
  if (!qword_256010758)
  {
    result = MEMORY[0x23492AA30](&unk_232EBC2B4, &type metadata for AppImpressionHeader.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010758);
  }
  return result;
}

unint64_t sub_232EADFEC()
{
  unint64_t result;

  result = qword_256010760;
  if (!qword_256010760)
  {
    result = MEMORY[0x23492AA30](&unk_232EBC2DC, &type metadata for AppImpressionHeader.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010760);
  }
  return result;
}

uint64_t sub_232EAE030()
{
  return sub_232EAE524((uint64_t)&unk_2504357D0);
}

void *sub_232EAE03C()
{
  return &unk_2504357F8;
}

uint64_t sub_232EAE048(char a1)
{
  char v2;
  char v3;

  if (!a1)
  {
    v3 = 1;
LABEL_8:
    swift_bridgeObjectRelease();
    return v3 & 1;
  }
  v2 = sub_232EBA228();
  swift_bridgeObjectRelease();
  if ((v2 & 1) == 0)
  {
    if (a1 == 2)
      v3 = sub_232EBA228();
    else
      v3 = 1;
    goto LABEL_8;
  }
  v3 = 1;
  return v3 & 1;
}

uint64_t sub_232EAE174(char a1)
{
  if (!a1)
    return 0x64616F6C6E776F64;
  if (a1 == 1)
    return 0x6F6C6E776F646572;
  return 0x6761676E652D6572;
}

uint64_t sub_232EAE1DC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_232EAC40C(*a1, *a2);
}

uint64_t sub_232EAE1E8()
{
  sub_232EBA288();
  sub_232EB9F70();
  swift_bridgeObjectRelease();
  return sub_232EBA2A0();
}

uint64_t sub_232EAE298()
{
  sub_232EB9F70();
  return swift_bridgeObjectRelease();
}

uint64_t sub_232EAE324()
{
  sub_232EBA288();
  sub_232EB9F70();
  swift_bridgeObjectRelease();
  return sub_232EBA2A0();
}

uint64_t sub_232EAE3D0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_232EAE594();
  *a1 = result;
  return result;
}

void sub_232EAE3FC(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  int v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v2 = *v1;
  v3 = 0xE800000000000000;
  v4 = 0xEA00000000006461;
  v5 = 0x6F6C6E776F646572;
  if (v2 != 1)
  {
    v5 = 0x6761676E652D6572;
    v4 = 0xED0000746E656D65;
  }
  v6 = v2 == 0;
  if (*v1)
    v7 = v5;
  else
    v7 = 0x64616F6C6E776F64;
  if (!v6)
    v3 = v4;
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_232EAE46C()
{
  sub_232EAE740();
  return sub_232EB9FDC();
}

uint64_t sub_232EAE4C8()
{
  sub_232EAE740();
  return sub_232EB9FD0();
}

void sub_232EAE514(_QWORD *a1@<X8>)
{
  *a1 = &unk_250435888;
}

uint64_t sub_232EAE524(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  unsigned __int8 *v4;
  unsigned int v5;
  char v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 16);
  sub_232EAE784();
  result = sub_232EBA048();
  v7 = result;
  if (v2)
  {
    v4 = (unsigned __int8 *)(a1 + 32);
    do
    {
      v5 = *v4++;
      sub_232E9EC8C(&v6, v5);
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

uint64_t sub_232EAE594()
{
  unint64_t v0;

  v0 = sub_232EBA144();
  swift_bridgeObjectRelease();
  if (v0 >= 3)
    return 3;
  else
    return v0;
}

unint64_t sub_232EAE5E0()
{
  unint64_t result;

  result = qword_256010768;
  if (!qword_256010768)
  {
    result = MEMORY[0x23492AA30](&unk_232EBC40C, &type metadata for ConversionType);
    atomic_store(result, (unint64_t *)&qword_256010768);
  }
  return result;
}

unint64_t sub_232EAE628()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256010770;
  if (!qword_256010770)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256010778);
    result = MEMORY[0x23492AA30](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_256010770);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for ConversionType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_232EAE6C0 + 4 * byte_232EBC405[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_232EAE6F4 + 4 * byte_232EBC400[v4]))();
}

uint64_t sub_232EAE6F4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_232EAE6FC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x232EAE704);
  return result;
}

uint64_t sub_232EAE710(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x232EAE718);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_232EAE71C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_232EAE724(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ConversionType()
{
  return &type metadata for ConversionType;
}

unint64_t sub_232EAE740()
{
  unint64_t result;

  result = qword_256010780;
  if (!qword_256010780)
  {
    result = MEMORY[0x23492AA30](&unk_232EBC474, &type metadata for ConversionType);
    atomic_store(result, (unint64_t *)&qword_256010780);
  }
  return result;
}

unint64_t sub_232EAE784()
{
  unint64_t result;

  result = qword_256010788;
  if (!qword_256010788)
  {
    result = MEMORY[0x23492AA30](&unk_232EBC434, &type metadata for ConversionType);
    atomic_store(result, (unint64_t *)&qword_256010788);
  }
  return result;
}

uint64_t sub_232EAE7C8()
{
  uint64_t v0;
  unsigned int v1;

  v0 = sub_232EBA144();
  swift_bridgeObjectRelease();
  if (v0 == 1)
    v1 = 1;
  else
    v1 = 2;
  if (v0)
    return v1;
  else
    return 0;
}

uint64_t sub_232EAE818(char *a1, char *a2)
{
  return sub_232EAC35C(*a1, *a2);
}

unint64_t sub_232EAE828()
{
  unint64_t result;

  result = qword_256010790;
  if (!qword_256010790)
  {
    result = MEMORY[0x23492AA30](&unk_232EBC57C, &type metadata for SystemEnvironment);
    atomic_store(result, (unint64_t *)&qword_256010790);
  }
  return result;
}

uint64_t sub_232EAE86C()
{
  sub_232EBA288();
  sub_232EB9F70();
  swift_bridgeObjectRelease();
  return sub_232EBA2A0();
}

uint64_t sub_232EAE8F8()
{
  sub_232EB9F70();
  return swift_bridgeObjectRelease();
}

uint64_t sub_232EAE960()
{
  sub_232EBA288();
  sub_232EB9F70();
  swift_bridgeObjectRelease();
  return sub_232EBA2A0();
}

uint64_t sub_232EAE9E8@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_232EBA144();
  result = swift_bridgeObjectRelease();
  if (v2 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v2)
    v4 = 0;
  *a1 = v4;
  return result;
}

void sub_232EAEA44(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  uint64_t v2;
  unint64_t v3;

  v2 = 0x6D706F6C65766564;
  if (*v1)
    v2 = 0x69746375646F7270;
  v3 = 0xEB00000000746E65;
  if (*v1)
    v3 = 0xEA00000000006E6FLL;
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_232EAEA90()
{
  sub_232EAEC04();
  return sub_232EB9FDC();
}

uint64_t sub_232EAEAEC()
{
  sub_232EAEC04();
  return sub_232EB9FD0();
}

uint64_t storeEnumTagSinglePayload for SystemEnvironment(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_232EAEB84 + 4 * byte_232EBC575[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_232EAEBB8 + 4 * asc_232EBC570[v4]))();
}

uint64_t sub_232EAEBB8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_232EAEBC0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x232EAEBC8);
  return result;
}

uint64_t sub_232EAEBD4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x232EAEBDCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_232EAEBE0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_232EAEBE8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SystemEnvironment()
{
  return &type metadata for SystemEnvironment;
}

unint64_t sub_232EAEC04()
{
  unint64_t result;

  result = qword_256010798;
  if (!qword_256010798)
  {
    result = MEMORY[0x23492AA30](&unk_232EBC5E4, &type metadata for SystemEnvironment);
    atomic_store(result, (unint64_t *)&qword_256010798);
  }
  return result;
}

void sub_232EAEC48(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[6];

  v7 = *a1;
  v8 = (void *)sub_232EB9ED4();
  v10[4] = a4;
  v10[5] = a5;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1107296256;
  v10[2] = sub_232EB9688;
  v10[3] = &block_descriptor_4;
  v9 = _Block_copy(v10);
  swift_retain();
  swift_release();
  objc_msgSend(v7, sel_updateConversionValue_reply_, v8, v9);
  _Block_release(v9);

}

uint64_t sub_232EAED08(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_232EAED10(uint64_t result, char a2, void (*a3)(uint64_t a1, void *a2), ValueMetadata *a4)
{
  uint64_t v7;

  v7 = result;
  if (qword_256010218 != -1)
    result = swift_once();
  if (qword_256016D08)
    return sub_232EA79F0(v7, a2, a3, a4, (void (*)(uint64_t *, uint64_t, unint64_t, uint64_t (*)(uint64_t, uint64_t), uint64_t))sub_232EAEC48);
  return result;
}

uint64_t sub_232EAEDAC()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x5643657372616F63;
  if (*v0 != 1)
    v1 = 0x7542746E65696C63;
  if (*v0)
    return v1;
  else
    return 0x5643656E6966;
}

uint64_t sub_232EAEE10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_232EAF0F4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_232EAEE34()
{
  sub_232EAEFF8();
  return sub_232EBA2D0();
}

uint64_t sub_232EAEE5C()
{
  sub_232EAEFF8();
  return sub_232EBA2DC();
}

uint64_t sub_232EAEE84(_QWORD *a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD v12[2];
  int v13;
  char v14;
  char v15;
  char v16;
  char v17;

  v12[1] = a5;
  v13 = a3;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560107A0);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_232EAEFF8();
  sub_232EBA2C4();
  v17 = 0;
  sub_232EBA204();
  if (!v5)
  {
    v16 = v13;
    v15 = 1;
    sub_232EAF03C();
    sub_232EBA1E0();
    v14 = 2;
    sub_232EBA1EC();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

unint64_t sub_232EAEFF8()
{
  unint64_t result;

  result = qword_2560107A8;
  if (!qword_2560107A8)
  {
    result = MEMORY[0x23492AA30](&unk_232EBC810, &type metadata for PostbackUpdateTestingRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560107A8);
  }
  return result;
}

unint64_t sub_232EAF03C()
{
  unint64_t result;

  result = qword_2560107B0;
  if (!qword_2560107B0)
  {
    result = MEMORY[0x23492AA30](&unk_232EBE274, &type metadata for CoarseConversionValue);
    atomic_store(result, (unint64_t *)&qword_2560107B0);
  }
  return result;
}

uint64_t sub_232EAF080(_QWORD *a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v3;

  result = sub_232EAF264(a1);
  if (v1)
    return v3;
  return result;
}

uint64_t sub_232EAF0A4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v5;
  uint64_t v6;
  uint64_t v7;

  result = sub_232EAF264(a1);
  if (!v2)
  {
    *(_QWORD *)a2 = result;
    *(_BYTE *)(a2 + 8) = v5;
    *(_QWORD *)(a2 + 16) = v6;
    *(_QWORD *)(a2 + 24) = v7;
  }
  return result;
}

uint64_t sub_232EAF0D4(_QWORD *a1)
{
  uint64_t v1;

  return sub_232EAEE84(a1, *(_QWORD *)v1, *(unsigned __int8 *)(v1 + 8), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_232EAF0F4(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x5643656E6966 && a2 == 0xE600000000000000;
  if (v2 || (sub_232EBA228() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x5643657372616F63 && a2 == 0xE800000000000000 || (sub_232EBA228() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7542746E65696C63 && a2 == 0xEE004449656C646ELL)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_232EBA228();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_232EAF264(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;
  char v10;
  char v11;
  char v12;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560107D0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1[3];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  sub_232EAEFF8();
  sub_232EBA2B8();
  if (!v1)
  {
    v12 = 0;
    v7 = sub_232EBA198();
    v11 = 1;
    sub_232EAF710();
    sub_232EBA174();
    v10 = 2;
    sub_232EBA180();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v7;
}

uint64_t destroy for PostbackUpdateTestingRequest()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PostbackUpdateTestingRequest(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PostbackUpdateTestingRequest(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for PostbackUpdateTestingRequest(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PostbackUpdateTestingRequest(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PostbackUpdateTestingRequest(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PostbackUpdateTestingRequest()
{
  return &type metadata for PostbackUpdateTestingRequest;
}

uint64_t storeEnumTagSinglePayload for PostbackUpdateTestingRequest.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_232EAF5B8 + 4 * byte_232EBC6B5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_232EAF5EC + 4 * asc_232EBC6B0[v4]))();
}

uint64_t sub_232EAF5EC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_232EAF5F4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x232EAF5FCLL);
  return result;
}

uint64_t sub_232EAF608(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x232EAF610);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_232EAF614(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_232EAF61C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PostbackUpdateTestingRequest.CodingKeys()
{
  return &type metadata for PostbackUpdateTestingRequest.CodingKeys;
}

unint64_t sub_232EAF63C()
{
  unint64_t result;

  result = qword_2560107B8;
  if (!qword_2560107B8)
  {
    result = MEMORY[0x23492AA30](&unk_232EBC7E8, &type metadata for PostbackUpdateTestingRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560107B8);
  }
  return result;
}

unint64_t sub_232EAF684()
{
  unint64_t result;

  result = qword_2560107C0;
  if (!qword_2560107C0)
  {
    result = MEMORY[0x23492AA30](&unk_232EBC758, &type metadata for PostbackUpdateTestingRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560107C0);
  }
  return result;
}

unint64_t sub_232EAF6CC()
{
  unint64_t result;

  result = qword_2560107C8;
  if (!qword_2560107C8)
  {
    result = MEMORY[0x23492AA30](&unk_232EBC780, &type metadata for PostbackUpdateTestingRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560107C8);
  }
  return result;
}

unint64_t sub_232EAF710()
{
  unint64_t result;

  result = qword_2560107D8;
  if (!qword_2560107D8)
  {
    result = MEMORY[0x23492AA30](&unk_232EBE24C, &type metadata for CoarseConversionValue);
    atomic_store(result, (unint64_t *)&qword_2560107D8);
  }
  return result;
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t sub_232EAF76C()
{
  uint64_t result;

  result = sub_232EAF89C();
  qword_256016E00 = result;
  return result;
}

uint64_t sub_232EAF788()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  void *v6;

  v1 = v0;
  if (qword_25423FA88 != -1)
    swift_once();
  v2 = sub_232EB9F40();
  __swift_project_value_buffer(v2, (uint64_t)qword_254240AF8);
  v3 = sub_232EB9F28();
  v4 = sub_232EBA06C();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_232E98000, v3, v4, "deinitializing ServiceConnection", v5, 2u);
    MEMORY[0x23492AAA8](v5, -1, -1);
  }

  v6 = *(void **)(v1 + 16);
  objc_msgSend(v6, sel_invalidate);

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ServiceConnection()
{
  return objc_opt_self();
}

uint64_t sub_232EAF89C()
{
  char v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t result;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  ValueMetadata *v23;
  unint64_t v24;
  uint64_t v25;

  v23 = &type metadata for FeatureFlag;
  v24 = sub_232EA0F30();
  LOBYTE(v20) = 0;
  v0 = sub_232EB9F1C();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v20);
  if ((v0 & 1) != 0)
  {
    if (qword_25423FA88 != -1)
      swift_once();
    v1 = sub_232EB9F40();
    __swift_project_value_buffer(v1, (uint64_t)qword_254240AF8);
    v2 = sub_232EB9F28();
    v3 = sub_232EBA06C();
    if (os_log_type_enabled(v2, v3))
    {
      v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_232E98000, v2, v3, "initializing ServiceConnection", v4, 2u);
      MEMORY[0x23492AAA8](v4, -1, -1);
    }

    v5 = objc_allocWithZone(MEMORY[0x24BDD1988]);
    v6 = (void *)sub_232EB9F4C();
    v7 = objc_msgSend(v5, sel_initWithMachServiceName_options_, v6, 0, v20);

    v8 = (void *)objc_opt_self();
    v9 = objc_msgSend(v8, sel_interfaceWithProtocol_, &unk_2560181D8);
    objc_msgSend(v7, sel_setExportedInterface_, v9);

    v10 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for XPCClient()), sel_init);
    objc_msgSend(v7, sel_setExportedObject_, v10);

    v11 = objc_msgSend(v8, sel_interfaceWithProtocol_, &unk_256018800);
    objc_msgSend(v7, sel_setRemoteObjectInterface_, v11);

    v24 = (unint64_t)sub_232EA0A58;
    v25 = 0;
    v12 = MEMORY[0x24BDAC760];
    v20 = MEMORY[0x24BDAC760];
    v21 = 1107296256;
    v22 = sub_232EA0A64;
    v23 = (ValueMetadata *)&block_descriptor_5;
    v13 = _Block_copy(&v20);
    objc_msgSend(v7, sel_setInterruptionHandler_, v13);
    _Block_release(v13);
    v24 = (unint64_t)sub_232EA0A90;
    v25 = 0;
    v20 = v12;
    v21 = 1107296256;
    v22 = sub_232EA0A64;
    v23 = (ValueMetadata *)&block_descriptor_3_2;
    v14 = _Block_copy(&v20);
    objc_msgSend(v7, sel_setInvalidationHandler_, v14);
    _Block_release(v14);
    objc_msgSend(v7, sel_resume);
    type metadata accessor for ServiceConnection();
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = v7;
  }
  else
  {
    if (qword_25423FA88 != -1)
      swift_once();
    v16 = sub_232EB9F40();
    __swift_project_value_buffer(v16, (uint64_t)qword_254240AF8);
    v17 = sub_232EB9F28();
    v18 = sub_232EBA078();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_232E98000, v17, v18, "Service feature flag is not enabled", v19, 2u);
      MEMORY[0x23492AAA8](v19, -1, -1);
    }

    return 0;
  }
  return result;
}

uint64_t block_copy_helper_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_5()
{
  return swift_release();
}

uint64_t sub_232EAFC44(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;

  *(_BYTE *)(v4 + 72) = a4;
  *(_QWORD *)(v4 + 24) = a2;
  *(_QWORD *)(v4 + 32) = a3;
  *(_QWORD *)(v4 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_232EAFC64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  __int128 v6;

  if (qword_25423F590 != -1)
    swift_once();
  if (!qword_254240AF0)
    return (*(uint64_t (**)(void))(v0 + 8))();
  v1 = *(_QWORD *)(v0 + 32);
  v6 = *(_OWORD *)(v0 + 16);
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v2;
  *(_OWORD *)(v2 + 16) = v6;
  *(_QWORD *)(v2 + 32) = v1;
  v3 = swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v3;
  *(_QWORD *)(v3 + 16) = sub_232EAFE58;
  *(_QWORD *)(v3 + 24) = v2;
  *(_QWORD *)&v6 = (char *)&dword_256010570 + dword_256010570;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v4;
  *v4 = v0;
  v4[1] = sub_232EA4CA4;
  return ((uint64_t (*)(char, uint64_t, uint64_t))v6)(*(_BYTE *)(v0 + 72), (uint64_t)sub_232EA66A8, v3);
}

void sub_232EAFD68(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[6];

  v10 = (void *)sub_232EB9ED4();
  v11 = (void *)sub_232EB9ED4();
  v13[4] = a4;
  v13[5] = a5;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 1107296256;
  v13[2] = sub_232EB9688;
  v13[3] = &block_descriptor_12;
  v12 = _Block_copy(v13);
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_handoffTokenWithAdvertisedItemID_tokenData_requestData_reply_, a6, v10, v11, v12);
  _Block_release(v12);

}

void sub_232EAFE58(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  sub_232EAFD68(a1, a2, a3, a4, a5, *(_QWORD *)(v5 + 16));
}

uint64_t sub_232EAFE64(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;

  *(_BYTE *)(v4 + 72) = a4;
  *(_QWORD *)(v4 + 24) = a2;
  *(_QWORD *)(v4 + 32) = a3;
  *(_QWORD *)(v4 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_232EAFE84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  __int128 v6;

  if (qword_25423F590 != -1)
    swift_once();
  if (!qword_254240AF0)
    return (*(uint64_t (**)(void))(v0 + 8))();
  v1 = *(_QWORD *)(v0 + 32);
  v6 = *(_OWORD *)(v0 + 16);
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v2;
  *(_OWORD *)(v2 + 16) = v6;
  *(_QWORD *)(v2 + 32) = v1;
  v3 = swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v3;
  *(_QWORD *)(v3 + 16) = sub_232EAFF88;
  *(_QWORD *)(v3 + 24) = v2;
  *(_QWORD *)&v6 = (char *)&dword_256010570 + dword_256010570;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v4;
  *v4 = v0;
  v4[1] = sub_232EA4B24;
  return ((uint64_t (*)(char, uint64_t, uint64_t))v6)(*(_BYTE *)(v0 + 72), (uint64_t)sub_232EA6DD0, v3);
}

void sub_232EAFF88(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t *v5;

  sub_232EB00AC(a1, a2, a3, a4, a5, v5[2], v5[3], v5[4], (uint64_t)&block_descriptor_9, (SEL *)&selRef_handoffUTMetricsWithAdvertisedItemID_eventsData_reply_);
}

uint64_t sub_232EAFFC0(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5;
  uint64_t result;

  if (qword_25423F590 != -1)
    result = swift_once();
  if (qword_254240AF0)
  {
    v5 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
    MEMORY[0x24BDAC7A8](v5);
    return sub_232EA7DB8(a4, (void (*)(uint64_t *, uint64_t, unint64_t, uint64_t (*)(uint64_t, uint64_t), uint64_t))sub_232EA6DD0);
  }
  return result;
}

void sub_232EB00AC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, SEL *a10)
{
  void *v14;
  void *v15;
  _QWORD v16[6];

  v14 = (void *)sub_232EB9ED4();
  v16[4] = a4;
  v16[5] = a5;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 1107296256;
  v16[2] = sub_232EB9688;
  v16[3] = a9;
  v15 = _Block_copy(v16);
  swift_retain();
  swift_release();
  objc_msgSend(a1, *a10, a6, v14, v15);
  _Block_release(v15);

}

void sub_232EB0174(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t *v5;

  sub_232EB00AC(a1, a2, a3, a4, a5, v5[2], v5[3], v5[4], (uint64_t)&block_descriptor_6, (SEL *)&selRef_handoffPODTokenWithAdvertisedItemID_tokenData_reply_);
}

uint64_t sub_232EB01AC()
{
  return 0x69766E456E616B73;
}

uint64_t sub_232EB01D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x69766E456E616B73 && a2 == 0xEF746E656D6E6F72)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_232EBA228();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_232EB0288()
{
  sub_232EB03D0();
  return sub_232EBA2D0();
}

uint64_t sub_232EB02B0()
{
  sub_232EB03D0();
  return sub_232EBA2DC();
}

uint64_t sub_232EB02D8(_QWORD *a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  _BYTE v9[16];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25423FAC0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = &v9[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_232EB03D0();
  sub_232EBA2C4();
  v9[15] = a2;
  sub_232EB0414();
  sub_232EBA1E0();
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_232EB03D0()
{
  unint64_t result;

  result = qword_25423FA48;
  if (!qword_25423FA48)
  {
    result = MEMORY[0x23492AA30](&unk_232EBCA08, &type metadata for TokenHandoffRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25423FA48);
  }
  return result;
}

unint64_t sub_232EB0414()
{
  unint64_t result;

  result = qword_25423FAD0;
  if (!qword_25423FAD0)
  {
    result = MEMORY[0x23492AA30](&unk_232EBC644, &type metadata for SystemEnvironment);
    atomic_store(result, (unint64_t *)&qword_25423FAD0);
  }
  return result;
}

_QWORD *sub_232EB0458(_QWORD *a1)
{
  return sub_232EB04AC(a1);
}

_QWORD *sub_232EB046C@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  _QWORD *result;

  result = sub_232EB04AC(a1);
  if (!v2)
    *a2 = (_BYTE)result;
  return result;
}

uint64_t sub_232EB0494(_QWORD *a1)
{
  char *v1;

  return sub_232EB02D8(a1, *v1);
}

_QWORD *sub_232EB04AC(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _QWORD *v7;
  _BYTE v9[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560108B8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_232EB03D0();
  sub_232EBA2B8();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    sub_232EB08AC();
    sub_232EBA174();
    (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
    v7 = (_QWORD *)v9[15];
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v7;
}

uint64_t getEnumTagSinglePayload for TokenHandoffRequest(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v6;
  int v7;
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
  if (*a1 <= 2u)
    v6 = 2;
  else
    v6 = *a1;
  v7 = v6 - 3;
  if (*a1 < 2u)
    v8 = -1;
  else
    v8 = v7;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for TokenHandoffRequest(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_232EB06B8 + 4 * byte_232EBC8A5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_232EB06EC + 4 * asc_232EBC8A0[v4]))();
}

uint64_t sub_232EB06EC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_232EB06F4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x232EB06FCLL);
  return result;
}

uint64_t sub_232EB0708(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x232EB0710);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_232EB0714(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_232EB071C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TokenHandoffRequest()
{
  return &type metadata for TokenHandoffRequest;
}

uint64_t storeEnumTagSinglePayload for TokenHandoffRequest.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_232EB0778 + 4 * byte_232EBC8AA[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_232EB0798 + 4 * byte_232EBC8AF[v4]))();
}

_BYTE *sub_232EB0778(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_232EB0798(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_232EB07A0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_232EB07A8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_232EB07B0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_232EB07B8(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for TokenHandoffRequest.CodingKeys()
{
  return &type metadata for TokenHandoffRequest.CodingKeys;
}

unint64_t sub_232EB07D8()
{
  unint64_t result;

  result = qword_2560108B0;
  if (!qword_2560108B0)
  {
    result = MEMORY[0x23492AA30](&unk_232EBC9E0, &type metadata for TokenHandoffRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560108B0);
  }
  return result;
}

unint64_t sub_232EB0820()
{
  unint64_t result;

  result = qword_25423FA58;
  if (!qword_25423FA58)
  {
    result = MEMORY[0x23492AA30](&unk_232EBC950, &type metadata for TokenHandoffRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25423FA58);
  }
  return result;
}

unint64_t sub_232EB0868()
{
  unint64_t result;

  result = qword_25423FA50;
  if (!qword_25423FA50)
  {
    result = MEMORY[0x23492AA30](&unk_232EBC978, &type metadata for TokenHandoffRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25423FA50);
  }
  return result;
}

unint64_t sub_232EB08AC()
{
  unint64_t result;

  result = qword_2560108C0;
  if (!qword_2560108C0)
  {
    result = MEMORY[0x23492AA30](&unk_232EBC61C, &type metadata for SystemEnvironment);
    atomic_store(result, (unint64_t *)&qword_2560108C0);
  }
  return result;
}

uint64_t block_copy_helper_6(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_6()
{
  return swift_release();
}

void sub_232EB0918(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  void *v6;
  _QWORD v7[6];

  v5 = *a1;
  v7[4] = a4;
  v7[5] = a5;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 1107296256;
  v7[2] = sub_232EB9688;
  v7[3] = &block_descriptor_7;
  v6 = _Block_copy(v7);
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_getSnoutStoriesWithReply_, v6);
  _Block_release(v6);
}

uint64_t sub_232EB09B4()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  if (qword_256010218 != -1)
    swift_once();
  if (!qword_256016D08)
    return 0;
  result = sub_232EA8174((void (*)(uint64_t *, uint64_t, unint64_t, uint64_t (*)(uint64_t, uint64_t), uint64_t))sub_232EB0918, &v2);
  if (!v0)
    return v2;
  return result;
}

uint64_t sub_232EB0A44()
{
  sub_232EB0B58();
  return sub_232EBA2D0();
}

uint64_t sub_232EB0A6C()
{
  sub_232EB0B58();
  return sub_232EBA2DC();
}

uint64_t sub_232EB0A94(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560108C8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_232EB0B58();
  sub_232EBA2C4();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_232EB0B58()
{
  unint64_t result;

  result = qword_2560108D0;
  if (!qword_2560108D0)
  {
    result = MEMORY[0x23492AA30](&unk_232EBCB30, &type metadata for SnoutRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560108D0);
  }
  return result;
}

ValueMetadata *type metadata accessor for SnoutRequest()
{
  return &type metadata for SnoutRequest;
}

ValueMetadata *type metadata accessor for SnoutRequest.CodingKeys()
{
  return &type metadata for SnoutRequest.CodingKeys;
}

unint64_t sub_232EB0BC0()
{
  unint64_t result;

  result = qword_2560108D8;
  if (!qword_2560108D8)
  {
    result = MEMORY[0x23492AA30](&unk_232EBCAE0, &type metadata for SnoutRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560108D8);
  }
  return result;
}

unint64_t sub_232EB0C08()
{
  unint64_t result;

  result = qword_2560108E0;
  if (!qword_2560108E0)
  {
    result = MEMORY[0x23492AA30](&unk_232EBCB08, &type metadata for SnoutRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560108E0);
  }
  return result;
}

uint64_t block_copy_helper_7(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_7()
{
  return swift_release();
}

void *sub_232EB0C64()
{
  return &unk_250437460;
}

unint64_t sub_232EB0C70()
{
  return 0xD000000000000020;
}

ValueMetadata *type metadata accessor for PostbackConstants()
{
  return &type metadata for PostbackConstants;
}

uint64_t sub_232EB0C9C()
{
  uint64_t result;
  unint64_t v1;

  sub_232EBA2AC();
  result = sub_232EBA090();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_232EB0D1C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + *(_QWORD *)(*(_QWORD *)v0 + 104);
  sub_232EBA2AC();
  v2 = sub_232EBA090();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t sub_232EB0D70()
{
  sub_232EB0D1C();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SyncXPCResult(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SyncXPCResult);
}

BOOL sub_232EB0DA0(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_232EB0DB0()
{
  return sub_232EBA294();
}

uint64_t sub_232EB0DD4()
{
  sub_232EBA288();
  sub_232EBA294();
  return sub_232EBA2A0();
}

uint64_t sub_232EB0E18(uint64_t a1, unint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  _BYTE *v23;
  _BYTE *v24;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  _BYTE *v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  char v36[16];
  uint64_t *v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v38 = 46;
  v39 = 0xE100000000000000;
  v37 = &v38;
  swift_bridgeObjectRetain();
  v4 = (_QWORD *)sub_232EB22BC(0x7FFFFFFFFFFFFFFFLL, 0, sub_232EB29BC, (uint64_t)v36, a1, a2);
  if (v4[2] != 3)
  {
    swift_bridgeObjectRelease();
    sub_232EB29D4();
    swift_allocError();
    *v24 = 0;
    return swift_willThrow();
  }
  v5 = v4[4];
  v6 = v4[5];
  v7 = v4[6];
  v8 = v4[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v9 = MEMORY[0x23492A430](v5, v6, v7, v8);
  v11 = v10;
  swift_bridgeObjectRelease();
  v38 = v9;
  v39 = v11;
  v12 = sub_232EB2A18();
  v13 = MEMORY[0x24BEE0D00];
  v38 = sub_232EBA0B4();
  v39 = v14;
  v34 = v12;
  v35 = v12;
  v32 = v13;
  v33 = v12;
  v15 = sub_232EBA0B4();
  v17 = v16;
  swift_bridgeObjectRelease();
  v38 = v15;
  v39 = v17;
  swift_bridgeObjectRetain();
  v18 = sub_232EB9F7C();
  swift_bridgeObjectRelease();
  v19 = v18 & 3;
  if (v18 <= 0)
    v19 = -(-v18 & 3);
  if (v19)
  {
    MEMORY[0x23492A478](61, 0xE100000000000000, 4 - v19);
    sub_232EB9F94();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  v20 = sub_232EB9EC8();
  v22 = v21;
  swift_bridgeObjectRelease();
  if (v22 >> 60 == 15)
  {
    sub_232EB29D4();
    swift_allocError();
    *v23 = 1;
    return swift_willThrow();
  }
  v26 = (void *)objc_opt_self();
  v27 = (void *)sub_232EB9ED4();
  v38 = 0;
  v28 = objc_msgSend(v26, sel_JSONObjectWithData_options_error_, v27, 0, &v38, v32, v33, v34, v35, 47, 0xE100000000000000);

  if (v28)
  {
    v29 = (id)v38;
    sub_232EBA0C0();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560108F8);
    if ((swift_dynamicCast() & 1) != 0)
    {
      sub_232EAB380(v20, v22);
      return 95;
    }
    sub_232EB29D4();
    swift_allocError();
    *v31 = 1;
  }
  else
  {
    v30 = (id)v38;
    sub_232EB9E98();

  }
  swift_willThrow();
  return sub_232EAB380(v20, v22);
}

uint64_t sub_232EB11CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  sub_232EB2A18();
  sub_232EBA0B4();
  v0 = sub_232EBA0B4();
  swift_bridgeObjectRelease();
  v4 = v0;
  swift_bridgeObjectRetain();
  v1 = sub_232EB9F7C();
  swift_bridgeObjectRelease();
  v2 = v1 & 3;
  if (v1 <= 0)
    v2 = -(-v1 & 3);
  if (v2)
  {
    MEMORY[0x23492A478](61, 0xE100000000000000, 4 - v2);
    sub_232EB9F94();
    swift_bridgeObjectRelease();
  }
  return v4;
}

uint64_t sub_232EB1310(uint64_t a1, unint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  _BYTE *v23;
  _BYTE *v24;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  _BYTE *v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  char v36[16];
  uint64_t *v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v38 = 46;
  v39 = 0xE100000000000000;
  v37 = &v38;
  swift_bridgeObjectRetain();
  v4 = (_QWORD *)sub_232EB22BC(0x7FFFFFFFFFFFFFFFLL, 0, sub_232EB29BC, (uint64_t)v36, a1, a2);
  if (v4[2] != 3)
  {
    swift_bridgeObjectRelease();
    sub_232EB29D4();
    swift_allocError();
    *v24 = 0;
    return swift_willThrow();
  }
  v5 = v4[8];
  v6 = v4[9];
  v7 = v4[10];
  v8 = v4[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v9 = MEMORY[0x23492A430](v5, v6, v7, v8);
  v11 = v10;
  swift_bridgeObjectRelease();
  v38 = v9;
  v39 = v11;
  v12 = sub_232EB2A18();
  v13 = MEMORY[0x24BEE0D00];
  v38 = sub_232EBA0B4();
  v39 = v14;
  v34 = v12;
  v35 = v12;
  v32 = v13;
  v33 = v12;
  v15 = sub_232EBA0B4();
  v17 = v16;
  swift_bridgeObjectRelease();
  v38 = v15;
  v39 = v17;
  swift_bridgeObjectRetain();
  v18 = sub_232EB9F7C();
  swift_bridgeObjectRelease();
  v19 = v18 & 3;
  if (v18 <= 0)
    v19 = -(-v18 & 3);
  if (v19)
  {
    MEMORY[0x23492A478](61, 0xE100000000000000, 4 - v19);
    sub_232EB9F94();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  v20 = sub_232EB9EC8();
  v22 = v21;
  swift_bridgeObjectRelease();
  if (v22 >> 60 == 15)
  {
    sub_232EB29D4();
    swift_allocError();
    *v23 = 2;
    return swift_willThrow();
  }
  v26 = (void *)objc_opt_self();
  v27 = (void *)sub_232EB9ED4();
  v38 = 0;
  v28 = objc_msgSend(v26, sel_JSONObjectWithData_options_error_, v27, 0, &v38, v32, v33, v34, v35, 47, 0xE100000000000000);

  if (v28)
  {
    v29 = (id)v38;
    sub_232EBA0C0();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560108F8);
    if ((swift_dynamicCast() & 1) != 0)
    {
      sub_232EAB380(v20, v22);
      return 95;
    }
    sub_232EB29D4();
    swift_allocError();
    *v31 = 2;
  }
  else
  {
    v30 = (id)v38;
    sub_232EB9E98();

  }
  swift_willThrow();
  return sub_232EAB380(v20, v22);
}

uint64_t sub_232EB16C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t sub_232EB16DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 24) - 8) + 16))(a2, v2 + *(int *)(a1 + 52));
}

uint64_t sub_232EB16F8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + *(int *)(a1 + 56));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_232EB172C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + *(int *)(a1 + 60));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_232EB1760@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, unint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  _BYTE *v37;
  _BYTE *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  _BYTE *v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  char v78[16];
  uint64_t *v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;

  v72 = a3;
  v73 = a5;
  v77 = a4;
  v71 = *(_QWORD *)(a3 - 8);
  v10 = MEMORY[0x24BDAC7A8](a1);
  v75 = (char *)&v64 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v88 = v12;
  v76 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v64 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_232EB9E14();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v64 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v80 = 46;
  v81 = 0xE100000000000000;
  v79 = &v80;
  swift_bridgeObjectRetain_n();
  v70 = a1;
  v19 = (_QWORD *)sub_232EB22BC(0x7FFFFFFFFFFFFFFFLL, 0, sub_232EB29BC, (uint64_t)v78, a1, a2);
  swift_bridgeObjectRelease();
  if (v19[2] != 3)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_232EB29D4();
    swift_allocError();
    *v39 = 0;
    return swift_willThrow();
  }
  v69 = v6;
  sub_232EB9E44();
  swift_allocObject();
  v20 = sub_232EB9E38();
  (*(void (**)(char *, _QWORD, uint64_t))(v16 + 104))(v18, *MEMORY[0x24BDCB1C8], v15);
  sub_232EB9E20();
  if (!v19[2])
  {
    __break(1u);
    goto LABEL_24;
  }
  v74 = v20;
  v68 = a6;
  v22 = v19[4];
  v21 = v19[5];
  v23 = v19[6];
  v24 = v19[7];
  swift_bridgeObjectRetain();
  v25 = MEMORY[0x23492A430](v22, v21, v23, v24);
  v27 = v26;
  swift_bridgeObjectRelease();
  v80 = v25;
  v81 = v27;
  v86 = 45;
  v87 = 0xE100000000000000;
  v84 = 43;
  v85 = 0xE100000000000000;
  sub_232EB2A18();
  v80 = sub_232EBA0B4();
  v81 = v28;
  v86 = 95;
  v87 = 0xE100000000000000;
  v84 = 47;
  v85 = 0xE100000000000000;
  v29 = sub_232EBA0B4();
  v31 = v30;
  swift_bridgeObjectRelease();
  v80 = v29;
  v81 = v31;
  swift_bridgeObjectRetain();
  v32 = sub_232EB9F7C();
  swift_bridgeObjectRelease();
  v33 = v32 & 3;
  if (v32 <= 0)
    v33 = -(-v32 & 3);
  if (v33)
  {
    MEMORY[0x23492A478](61, 0xE100000000000000, 4 - v33);
    sub_232EB9F94();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  v34 = sub_232EB9EC8();
  v36 = v35;
  swift_bridgeObjectRelease();
  if (v36 >> 60 == 15)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_232EB29D4();
    swift_allocError();
    *v37 = 1;
    swift_willThrow();
    return swift_release();
  }
  v40 = v88;
  v41 = v69;
  sub_232EB9E2C();
  v69 = v41;
  if (v41)
  {
    swift_release();
    swift_bridgeObjectRelease();
    sub_232EAB380(v34, v36);
    return swift_bridgeObjectRelease();
  }
  v66 = v34;
  v67 = v36;
  (*(void (**)(uint64_t, char *, uint64_t))(v76 + 32))(v68, v14, v40);
  if (v19[2] < 2uLL)
  {
LABEL_24:
    __break(1u);
    JUMPOUT(0x232EB215CLL);
  }
  v43 = v19[8];
  v42 = v19[9];
  v44 = v19[10];
  v45 = v19[11];
  swift_bridgeObjectRetain();
  v46 = MEMORY[0x23492A430](v43, v42, v44, v45);
  v48 = v47;
  swift_bridgeObjectRelease();
  v80 = v46;
  v81 = v48;
  v86 = 45;
  v87 = 0xE100000000000000;
  v84 = 43;
  v85 = 0xE100000000000000;
  v80 = sub_232EBA0B4();
  v81 = v49;
  v86 = 95;
  v87 = 0xE100000000000000;
  v84 = 47;
  v85 = 0xE100000000000000;
  v50 = sub_232EBA0B4();
  v52 = v51;
  swift_bridgeObjectRelease();
  v80 = v50;
  v81 = v52;
  swift_bridgeObjectRetain();
  v53 = sub_232EB9F7C();
  swift_bridgeObjectRelease();
  v54 = v53 & 3;
  if (v53 <= 0)
    v54 = -(-v53 & 3);
  if (v54)
  {
    MEMORY[0x23492A478](61, 0xE100000000000000, 4 - v54);
    sub_232EB9F94();
    swift_bridgeObjectRelease();
  }
  v55 = v73;
  swift_bridgeObjectRelease();
  v56 = sub_232EB9EC8();
  v58 = v57;
  swift_bridgeObjectRelease();
  if (v58 >> 60 == 15)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_232EB29D4();
    swift_allocError();
    *v59 = 2;
    swift_willThrow();
    sub_232EAB380(v66, v67);
    swift_release();
    v60 = v88;
  }
  else
  {
    v61 = v58;
    v62 = v72;
    v65 = v61;
    v63 = v69;
    sub_232EB9E2C();
    v60 = v88;
    if (!v63)
    {
      v69 = v56;
      v80 = v88;
      v81 = v62;
      v82 = v77;
      v83 = v55;
      type metadata accessor for JWS();
    }
    swift_release();
    swift_bridgeObjectRelease();
    sub_232EAB380(v66, v67);
    sub_232EAB380(v56, v65);
    swift_bridgeObjectRelease();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v76 + 8))(v68, v60);
}

uint64_t sub_232EB2160()
{
  uint64_t v0;

  sub_232EB9EE0();
  sub_232EB2A18();
  sub_232EBA0B4();
  swift_bridgeObjectRelease();
  sub_232EBA0B4();
  swift_bridgeObjectRelease();
  v0 = sub_232EBA0B4();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_232EB22BC(uint64_t a1, char a2, uint64_t (*a3)(_QWORD *), uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  _QWORD *v40;
  uint64_t result;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v47;
  unint64_t v48;
  _QWORD v50[4];

  v50[3] = a4;
  if (a1 < 0)
    goto LABEL_42;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = MEMORY[0x24BEE4AF8];
  v47 = swift_allocObject();
  *(_QWORD *)(v47 + 16) = 15;
  v11 = HIBYTE(a6) & 0xF;
  if (!a1 || ((a6 & 0x2000000000000000) != 0 ? (v12 = HIBYTE(a6) & 0xF) : (v12 = a5 & 0xFFFFFFFFFFFFLL), !v12))
  {
    if ((a6 & 0x2000000000000000) == 0)
      v11 = a5 & 0xFFFFFFFFFFFFLL;
    v30 = 7;
    if (((a6 >> 60) & ((a5 & 0x800000000000000) == 0)) != 0)
      v30 = 11;
    sub_232EB2758(v30 | (v11 << 16), v47, a2 & 1, v10);
    swift_bridgeObjectRelease();
    v13 = *(_QWORD **)(v10 + 16);
    swift_bridgeObjectRetain();
    swift_release();
LABEL_39:
    swift_release();
    return (uint64_t)v13;
  }
  v42 = a1;
  v43 = v10;
  v48 = 4 * v12;
  v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v14 = 15;
  v15 = 15;
  v16 = 15;
  while (1)
  {
    v50[0] = sub_232EB9FB8();
    v50[1] = v17;
    v18 = a3(v50);
    if (v6)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return (uint64_t)v13;
    }
    v19 = v18;
    swift_bridgeObjectRelease();
    if ((v19 & 1) != 0)
      break;
    v14 = sub_232EB9F88();
LABEL_9:
    if (v48 == v14 >> 14)
      goto LABEL_29;
  }
  if (v15 >> 14 == v14 >> 14 && (a2 & 1) != 0)
  {
    v14 = sub_232EB9F88();
    *(_QWORD *)(v47 + 16) = v14;
    v15 = v14;
    v16 = v14;
    goto LABEL_9;
  }
  if (v14 >> 14 < v15 >> 14)
    goto LABEL_41;
  v20 = sub_232EB9FC4();
  v44 = v21;
  v45 = v20;
  v23 = v22;
  v25 = v24;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v13 = sub_232EB28B0(0, v13[2] + 1, 1, v13);
  v27 = v13[2];
  v26 = v13[3];
  if (v27 >= v26 >> 1)
    v13 = sub_232EB28B0((_QWORD *)(v26 > 1), v27 + 1, 1, v13);
  v13[2] = v27 + 1;
  v28 = &v13[4 * v27];
  v28[4] = v45;
  v28[5] = v23;
  v28[6] = v25;
  v28[7] = v44;
  *(_QWORD *)(v43 + 16) = v13;
  v29 = sub_232EB9F88();
  v14 = v29;
  *(_QWORD *)(v47 + 16) = v29;
  if (v13[2] != v42)
  {
    v15 = v29;
    v16 = v29;
    goto LABEL_9;
  }
  v16 = v29;
  v15 = v29;
LABEL_29:
  if (v48 == v15 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
LABEL_38:
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_39;
  }
  if (v48 >= v16 >> 14)
  {
    v31 = sub_232EB9FC4();
    v33 = v32;
    v35 = v34;
    v37 = v36;
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v13 = sub_232EB28B0(0, v13[2] + 1, 1, v13);
    v39 = v13[2];
    v38 = v13[3];
    if (v39 >= v38 >> 1)
      v13 = sub_232EB28B0((_QWORD *)(v38 > 1), v39 + 1, 1, v13);
    v13[2] = v39 + 1;
    v40 = &v13[4 * v39];
    v40[4] = v31;
    v40[5] = v33;
    v40[6] = v35;
    v40[7] = v37;
    *(_QWORD *)(v43 + 16) = v13;
    goto LABEL_38;
  }
LABEL_41:
  sub_232EBA12C();
  __break(1u);
LABEL_42:
  result = sub_232EBA12C();
  __break(1u);
  return result;
}

uint64_t sub_232EB2758(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t result;

  v4 = *(_QWORD *)(a2 + 16) >> 14;
  v5 = (v4 == a1 >> 14) & a3;
  if (v5 == 1)
    return v5 ^ 1u;
  if (a1 >> 14 >= v4)
  {
    v7 = sub_232EB9FC4();
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = *(_QWORD **)(a4 + 16);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(a4 + 16) = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v14 = sub_232EB28B0(0, v14[2] + 1, 1, v14);
      *(_QWORD *)(a4 + 16) = v14;
    }
    v17 = v14[2];
    v16 = v14[3];
    if (v17 >= v16 >> 1)
    {
      v14 = sub_232EB28B0((_QWORD *)(v16 > 1), v17 + 1, 1, v14);
      *(_QWORD *)(a4 + 16) = v14;
    }
    v14[2] = v17 + 1;
    v18 = &v14[4 * v17];
    v18[4] = v7;
    v18[5] = v9;
    v18[6] = v11;
    v18[7] = v13;
    return v5 ^ 1u;
  }
  result = sub_232EBA12C();
  __break(1u);
  return result;
}

_QWORD *sub_232EB28B0(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_256010988);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 1;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
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
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4])
          memmove(v13, a4 + 4, 32 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_232EB3530(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_232EB29BC(_QWORD *a1)
{
  return sub_232EB2A5C(a1) & 1;
}

unint64_t sub_232EB29D4()
{
  unint64_t result;

  result = qword_2560108E8;
  if (!qword_2560108E8)
  {
    result = MEMORY[0x23492AA30](&unk_232EBCC94, &type metadata for JWSError);
    atomic_store(result, (unint64_t *)&qword_2560108E8);
  }
  return result;
}

unint64_t sub_232EB2A18()
{
  unint64_t result;

  result = qword_2560108F0;
  if (!qword_2560108F0)
  {
    result = MEMORY[0x23492AA30](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2560108F0);
  }
  return result;
}

uint64_t sub_232EB2A5C(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)(v1 + 16);
  if (*a1 == *v2 && a1[1] == v2[1])
    return 1;
  else
    return sub_232EBA228() & 1;
}

void type metadata accessor for JWS()
{
  JUMPOUT(0x23492A9F4);
}

unint64_t sub_232EB2AC0()
{
  unint64_t result;

  result = qword_256010900[0];
  if (!qword_256010900[0])
  {
    result = MEMORY[0x23492AA30](&unk_232EBCC2C, &type metadata for JWSError);
    atomic_store(result, qword_256010900);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for JWSError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for JWSError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_232EB2BE0 + 4 * byte_232EBCC15[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_232EB2C14 + 4 * byte_232EBCC10[v4]))();
}

uint64_t sub_232EB2C14(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_232EB2C1C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x232EB2C24);
  return result;
}

uint64_t sub_232EB2C30(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x232EB2C38);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_232EB2C3C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_232EB2C44(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for JWSError()
{
  return &type metadata for JWSError;
}

uint64_t sub_232EB2C60()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_232EB2C68()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_232EB2D00(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;

  v4 = a1;
  v5 = *(_QWORD *)(a3 + 24);
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v7 = *(_QWORD *)(v5 - 8);
  v8 = *(_DWORD *)(v7 + 80);
  v9 = *(_QWORD *)(v6 + 64) + v8;
  v10 = *(_QWORD *)(v7 + 64) + 7;
  v11 = v8 | *(_DWORD *)(v6 + 80) & 0xF8;
  if (v11 > 7
    || ((*(_DWORD *)(v6 + 80) | *(_DWORD *)(v7 + 80)) & 0x100000) != 0
    || ((((v10 + (v9 & ~v8)) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    v14 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v14 + (((v11 | 7) + 16) & ~(unint64_t)(v11 | 7)));
    swift_retain();
  }
  else
  {
    v15 = ~v8;
    (*(void (**)(uint64_t *, uint64_t *))(v6 + 16))(a1, a2);
    v16 = ((unint64_t)a2 + v9) & v15;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v7 + 16))(((unint64_t)v4 + v9) & v15, v16, v5);
    v17 = (_QWORD *)((v10 + (((unint64_t)v4 + v9) & v15)) & 0xFFFFFFFFFFFFFFF8);
    v18 = (_QWORD *)((v10 + v16) & 0xFFFFFFFFFFFFFFF8);
    *v17 = *v18;
    v17[1] = v18[1];
    v19 = (_QWORD *)(((unint64_t)v17 + 23) & 0xFFFFFFFFFFFFFFF8);
    v20 = (_QWORD *)(((unint64_t)v18 + 23) & 0xFFFFFFFFFFFFFFF8);
    *v19 = *v20;
    v19[1] = v20[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_232EB2E48(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  (*(void (**)(void))(v4 + 8))();
  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 8))((*(_QWORD *)(v4 + 64)
                                                                                            + a1
                                                                                            + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 80));
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_232EB2ECC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;

  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v6 + 16))();
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = v7 + v9;
  v11 = (v10 + a1) & ~v9;
  v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v11, v12);
  v13 = *(_QWORD *)(v8 + 64) + 7;
  v14 = (_QWORD *)((v13 + v11) & 0xFFFFFFFFFFFFFFF8);
  v15 = (_QWORD *)((v13 + v12) & 0xFFFFFFFFFFFFFFF8);
  *v14 = *v15;
  v14[1] = v15[1];
  v16 = (_QWORD *)(((unint64_t)v14 + 23) & 0xFFFFFFFFFFFFFFF8);
  v17 = (_QWORD *)(((unint64_t)v15 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v16 = *v17;
  v16[1] = v17[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_232EB2F94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;

  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v6 + 24))();
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = v7 + v9;
  v11 = (v10 + a1) & ~v9;
  v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v8 + 24))(v11, v12);
  v13 = *(_QWORD *)(v8 + 64) + 7;
  v14 = (_QWORD *)((v13 + v11) & 0xFFFFFFFFFFFFFFF8);
  v15 = (_QWORD *)((v13 + v12) & 0xFFFFFFFFFFFFFFF8);
  *v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v16 = (_QWORD *)(((unint64_t)v14 + 23) & 0xFFFFFFFFFFFFFFF8);
  v17 = (_QWORD *)(((unint64_t)v15 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v16 = *v17;
  v16[1] = v17[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_232EB3070(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _OWORD *v14;
  _OWORD *v15;

  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v6 + 32))();
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = v7 + v9;
  v11 = (v10 + a1) & ~v9;
  v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v8 + 32))(v11, v12);
  v13 = *(_QWORD *)(v8 + 64) + 7;
  v14 = (_OWORD *)((v13 + v11) & 0xFFFFFFFFFFFFFFF8);
  v15 = (_OWORD *)((v13 + v12) & 0xFFFFFFFFFFFFFFF8);
  *v14 = *v15;
  *(_OWORD *)(((unint64_t)v14 + 23) & 0xFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v15 + 23) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_232EB3114(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;

  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v6 + 40))();
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = v7 + v9;
  v11 = (v10 + a1) & ~v9;
  v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v8 + 40))(v11, v12);
  v13 = *(_QWORD *)(v8 + 64) + 7;
  v14 = (_QWORD *)((v13 + v11) & 0xFFFFFFFFFFFFFFF8);
  v15 = (_QWORD *)((v13 + v12) & 0xFFFFFFFFFFFFFFF8);
  *v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRelease();
  v16 = (_QWORD *)(((unint64_t)v14 + 23) & 0xFFFFFFFFFFFFFFF8);
  v17 = (_QWORD *)(((unint64_t)v15 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v16 = *v17;
  v16[1] = v17[1];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_232EB31E0(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v17;
  unint64_t v18;

  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_DWORD *)(v5 + 84);
  v7 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v8 = *(_DWORD *)(v7 + 84);
  if (v8 <= v6)
    v9 = *(_DWORD *)(v5 + 84);
  else
    v9 = *(_DWORD *)(v7 + 84);
  if (v9 <= 0x7FFFFFFF)
    v9 = 0x7FFFFFFF;
  if (!a2)
    return 0;
  v10 = *(unsigned __int8 *)(v7 + 80);
  v11 = *(_QWORD *)(v5 + 64) + v10;
  v12 = *(_QWORD *)(v7 + 64) + 7;
  if (v9 >= a2)
  {
    if (v6 == v9)
    {
      return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v5 + 48))(a1, *(unsigned int *)(v5 + 84), v4);
    }
    else
    {
      v17 = (v11 + a1) & ~v10;
      if (v8 == v9)
      {
        return (*(uint64_t (**)(uint64_t))(v7 + 48))(v17);
      }
      else
      {
        v18 = *(_QWORD *)(((v12 + v17) & 0xFFFFFFFFFFFFF8) + 8);
        if (v18 >= 0xFFFFFFFF)
          LODWORD(v18) = -1;
        return (v18 + 1);
      }
    }
  }
  else
  {
    if (((((((v12 + (v11 & ~v10)) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16) & 0xFFFFFFF8) != 0)
      v13 = 2;
    else
      v13 = a2 - v9 + 1;
    if (v13 >= 0x10000)
      v14 = 4;
    else
      v14 = 2;
    if (v13 < 0x100)
      v14 = 1;
    if (v13 >= 2)
      v15 = v14;
    else
      v15 = 0;
    return ((uint64_t (*)(void))((char *)&loc_232EB3288 + 4 * byte_232EBCC1A[v15]))();
  }
}

void sub_232EB3330(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  int v10;
  int v11;
  unsigned int v12;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 24) - 8);
  if (*(_DWORD *)(v6 + 84) <= *(_DWORD *)(v5 + 84))
    v7 = *(_DWORD *)(v5 + 84);
  else
    v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF)
    v7 = 0x7FFFFFFF;
  v8 = *(unsigned __int8 *)(v6 + 80);
  if (v7 >= a3)
  {
    v11 = 0;
    if (a2 <= v7)
      goto LABEL_19;
  }
  else
  {
    if (((((*(_DWORD *)(v6 + 64) + 7 + ((*(_DWORD *)(v5 + 64) + (_DWORD)v8) & ~(_DWORD)v8)) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) == 0xFFFFFFF0)
      v9 = a3 - v7 + 1;
    else
      v9 = 2;
    if (v9 >= 0x10000)
      v10 = 4;
    else
      v10 = 2;
    if (v9 < 0x100)
      v10 = 1;
    if (v9 >= 2)
      v11 = v10;
    else
      v11 = 0;
    if (a2 <= v7)
LABEL_19:
      __asm { BR              X0 }
  }
  if (((((*(_DWORD *)(v6 + 64) + 7 + ((*(_DWORD *)(v5 + 64) + (_DWORD)v8) & ~(_DWORD)v8)) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    v12 = ~v7 + a2;
    bzero(a1, ((((*(_QWORD *)(v6 + 64) + 7 + ((*(_QWORD *)(v5 + 64) + v8) & ~v8)) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)+ 16);
    *a1 = v12;
  }
  __asm { BR              X10 }
}

void sub_232EB3454()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x232EB34E4);
}

void sub_232EB345C(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x232EB3464);
  JUMPOUT(0x232EB34E4);
}

void sub_232EB34A8()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x232EB34E4);
}

void sub_232EB34B0()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x232EB34E4);
}

uint64_t sub_232EB34B8(uint64_t a1, int a2, int a3)
{
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *(_WORD *)(v12 + v13) = 0;
  if (!a2)
    JUMPOUT(0x232EB34E4);
  if (v6 == v9)
  {
    v3 = *(uint64_t (**)(uint64_t))(v10 + 56);
    v4 = v12;
  }
  else
  {
    v4 = (v11 + v12) & v7;
    if (a3 != v9)
      JUMPOUT(0x232EB34C4);
    v3 = *(uint64_t (**)(uint64_t))(v8 + 56);
  }
  return v3(v4);
}

uint64_t sub_232EB34FC()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_232EB3520()
{
  return swift_deallocObject();
}

uint64_t sub_232EB3530(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 32 * a1 + 32;
    v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_232EBA138();
  __break(1u);
  return result;
}

uint64_t sub_232EB3620()
{
  uint64_t result;

  result = sub_232EB365C();
  qword_256016E08 = result;
  return result;
}

uint64_t type metadata accessor for ImpressionIntakeServiceConnection()
{
  return objc_opt_self();
}

uint64_t sub_232EB365C()
{
  char v0;
  id v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t result;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  ValueMetadata *v19;
  unint64_t v20;
  uint64_t v21;

  v19 = &type metadata for FeatureFlag;
  v20 = sub_232EA0F30();
  LOBYTE(v16) = 0;
  v0 = sub_232EB9F1C();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v16);
  if ((v0 & 1) != 0)
  {
    v1 = objc_allocWithZone(MEMORY[0x24BDD1988]);
    v2 = (void *)sub_232EB9F4C();
    v3 = objc_msgSend(v1, sel_initWithMachServiceName_options_, v2, 0, v16);

    v4 = (void *)objc_opt_self();
    v5 = objc_msgSend(v4, sel_interfaceWithProtocol_, &unk_2560181D8);
    objc_msgSend(v3, sel_setExportedInterface_, v5);

    v6 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for XPCClient()), sel_init);
    objc_msgSend(v3, sel_setExportedObject_, v6);

    v7 = objc_msgSend(v4, sel_interfaceWithProtocol_, &unk_2560188C0);
    objc_msgSend(v3, sel_setRemoteObjectInterface_, v7);

    v20 = (unint64_t)sub_232EA0A58;
    v21 = 0;
    v8 = MEMORY[0x24BDAC760];
    v16 = MEMORY[0x24BDAC760];
    v17 = 1107296256;
    v18 = sub_232EA0A64;
    v19 = (ValueMetadata *)&block_descriptor_8;
    v9 = _Block_copy(&v16);
    objc_msgSend(v3, sel_setInterruptionHandler_, v9);
    _Block_release(v9);
    v20 = (unint64_t)sub_232EA0A90;
    v21 = 0;
    v16 = v8;
    v17 = 1107296256;
    v18 = sub_232EA0A64;
    v19 = (ValueMetadata *)&block_descriptor_3_3;
    v10 = _Block_copy(&v16);
    objc_msgSend(v3, sel_setInvalidationHandler_, v10);
    _Block_release(v10);
    objc_msgSend(v3, sel_resume);
    type metadata accessor for ImpressionIntakeServiceConnection();
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = v3;
  }
  else
  {
    if (qword_25423FA88 != -1)
      swift_once();
    v12 = sub_232EB9F40();
    __swift_project_value_buffer(v12, (uint64_t)qword_254240AF8);
    v13 = sub_232EB9F28();
    v14 = sub_232EBA078();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_232E98000, v13, v14, "Service feature flag is not enabled", v15, 2u);
      MEMORY[0x23492AAA8](v15, -1, -1);
    }

    return 0;
  }
  return result;
}

uint64_t block_copy_helper_8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_8()
{
  return swift_release();
}

void sub_232EB3964(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[6];

  v7 = *a1;
  v8 = (void *)sub_232EB9ED4();
  v10[4] = a4;
  v10[5] = a5;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1107296256;
  v10[2] = sub_232EB9688;
  v10[3] = &block_descriptor_9;
  v9 = _Block_copy(v10);
  swift_retain();
  swift_release();
  objc_msgSend(v7, sel_updateConversionValue_reply_, v8, v9);
  _Block_release(v9);

}

uint64_t sub_232EB3A24(uint64_t a1, unsigned int a2)
{
  return (a2 >> 8) & 1;
}

uint64_t sub_232EB3A2C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_232EB3A50(uint64_t a1, __int16 a2, uint64_t a3)
{
  uint64_t v3;

  *(_WORD *)(v3 + 40) = a2;
  *(_QWORD *)(v3 + 16) = a1;
  *(_QWORD *)(v3 + 24) = a3;
  return swift_task_switch();
}

uint64_t sub_232EB3A6C()
{
  uint64_t v0;
  __int16 v1;
  _QWORD *v2;
  char *v4;

  if (qword_256010270 != -1)
    swift_once();
  if (!qword_256016E00)
    return (*(uint64_t (**)(void))(v0 + 8))();
  v1 = *(_WORD *)(v0 + 40);
  v4 = (char *)&dword_256010560 + dword_256010560;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v2;
  *v2 = v0;
  v2[1] = sub_232EB3B30;
  return ((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v4)(*(_QWORD *)(v0 + 16), v1 & 0x1FF, *(_QWORD *)(v0 + 24), sub_232EB3964, 0);
}

uint64_t sub_232EB3B30()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_232EB3B78()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_232EB3BAC + 4 * byte_232EBCD80[*v0]))(0xD000000000000013, 0x8000000232EBF0F0);
}

uint64_t sub_232EB3BAC(uint64_t a1)
{
  return a1 + 2;
}

uint64_t sub_232EB3BC4()
{
  return 0x74736F506B636F6CLL;
}

uint64_t sub_232EB3BE4()
{
  return 0x69737265766E6F63;
}

uint64_t sub_232EB3C08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_232EB3F68(a1, a2);
  *a3 = result;
  return result;
}

void sub_232EB3C2C(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_232EB3C38()
{
  sub_232EB3E50();
  return sub_232EBA2D0();
}

uint64_t sub_232EB3C60()
{
  sub_232EB3E50();
  return sub_232EBA2DC();
}

uint64_t sub_232EB3C88(_QWORD *a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  _QWORD v13[2];
  char v14;
  char v15;
  char v16;
  char v17;
  char v18;

  v13[0] = a4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010A58);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_232EB3E50();
  sub_232EBA2C4();
  v18 = 0;
  sub_232EBA204();
  if (!v4)
  {
    v11 = v13[0];
    v17 = a3;
    v16 = 1;
    sub_232EAF03C();
    sub_232EBA1E0();
    v15 = 2;
    sub_232EBA1F8();
    v13[1] = v11;
    v14 = 3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256010A68);
    sub_232EB4510(&qword_256010A70, (uint64_t (*)(void))sub_232EB3E94, MEMORY[0x24BEE1700]);
    sub_232EBA1E0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

unint64_t sub_232EB3E50()
{
  unint64_t result;

  result = qword_256010A60;
  if (!qword_256010A60)
  {
    result = MEMORY[0x23492AA30](&unk_232EBCED8, &type metadata for PostbackRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010A60);
  }
  return result;
}

unint64_t sub_232EB3E94()
{
  unint64_t result;

  result = qword_256010A78;
  if (!qword_256010A78)
  {
    result = MEMORY[0x23492AA30](&unk_232EBC4D4, &type metadata for ConversionType);
    atomic_store(result, (unint64_t *)&qword_256010A78);
  }
  return result;
}

uint64_t sub_232EB3ED8(_QWORD *a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v3;

  result = sub_232EB4154(a1);
  if (v1)
    return v3;
  return result;
}

uint64_t sub_232EB3EFC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  __int16 v5;
  uint64_t v6;

  result = sub_232EB4154(a1);
  if (!v2)
  {
    *(_QWORD *)a2 = result;
    *(_BYTE *)(a2 + 8) = v5;
    *(_BYTE *)(a2 + 9) = HIBYTE(v5) & 1;
    *(_QWORD *)(a2 + 16) = v6;
  }
  return result;
}

uint64_t sub_232EB3F34(_QWORD *a1)
{
  uint64_t v1;

  return sub_232EB3C88(a1, *(_QWORD *)v1, *(_BYTE *)(v1 + 8), *(_QWORD *)(v1 + 16));
}

uint64_t sub_232EB3F68(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000013 && a2 == 0x8000000232EBF0F0 || (sub_232EBA228() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x8000000232EBF110 || (sub_232EBA228() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x74736F506B636F6CLL && a2 == 0xEC0000006B636162 || (sub_232EBA228() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x69737265766E6F63 && a2 == 0xEF73657079546E6FLL)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v5 = sub_232EBA228();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_232EB4154(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  _BYTE v8[32];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010A98);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = &v8[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_232EB3E50();
  sub_232EBA2B8();
  v8[31] = 0;
  v6 = sub_232EBA198();
  v8[29] = 1;
  sub_232EAF710();
  sub_232EBA174();
  v8[28] = 2;
  sub_232EBA18C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256010A68);
  v8[27] = 3;
  sub_232EB4510(&qword_256010AA0, (uint64_t (*)(void))sub_232EB4578, MEMORY[0x24BEE1720]);
  sub_232EBA174();
  (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v6;
}

ValueMetadata *type metadata accessor for PostbackRequest()
{
  return &type metadata for PostbackRequest;
}

uint64_t storeEnumTagSinglePayload for PostbackRequest.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_232EB43B8 + 4 * byte_232EBCD89[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_232EB43EC + 4 * byte_232EBCD84[v4]))();
}

uint64_t sub_232EB43EC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_232EB43F4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x232EB43FCLL);
  return result;
}

uint64_t sub_232EB4408(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x232EB4410);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_232EB4414(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_232EB441C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PostbackRequest.CodingKeys()
{
  return &type metadata for PostbackRequest.CodingKeys;
}

unint64_t sub_232EB443C()
{
  unint64_t result;

  result = qword_256010A80;
  if (!qword_256010A80)
  {
    result = MEMORY[0x23492AA30](&unk_232EBCEB0, &type metadata for PostbackRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010A80);
  }
  return result;
}

unint64_t sub_232EB4484()
{
  unint64_t result;

  result = qword_256010A88;
  if (!qword_256010A88)
  {
    result = MEMORY[0x23492AA30](&unk_232EBCE20, &type metadata for PostbackRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010A88);
  }
  return result;
}

unint64_t sub_232EB44CC()
{
  unint64_t result;

  result = qword_256010A90;
  if (!qword_256010A90)
  {
    result = MEMORY[0x23492AA30](&unk_232EBCE48, &type metadata for PostbackRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010A90);
  }
  return result;
}

uint64_t sub_232EB4510(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256010A68);
    v8 = a2();
    result = MEMORY[0x23492AA30](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_232EB4578()
{
  unint64_t result;

  result = qword_256010AA8;
  if (!qword_256010AA8)
  {
    result = MEMORY[0x23492AA30](&unk_232EBC4AC, &type metadata for ConversionType);
    atomic_store(result, (unint64_t *)&qword_256010AA8);
  }
  return result;
}

uint64_t block_copy_helper_9(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_9()
{
  return swift_release();
}

uint64_t sub_232EB45D4@<X0>(_BYTE *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _BYTE *a5@<X8>)
{
  type metadata accessor for ServiceResult(0, a2, a3, a4);
  if (swift_getEnumCaseMultiPayload() == 1)
    *a5 = *a1;
  else
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(a5, a1, a2);
  sub_232EA685C();
  sub_232EBA2AC();
  return swift_storeEnumTagMultiPayload();
}

uint64_t type metadata accessor for ServiceResult(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ServiceResult);
}

BOOL sub_232EB469C(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_232EB46AC()
{
  return sub_232EBA294();
}

uint64_t sub_232EB46D0(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x73736563637573 && a2 == 0xE700000000000000;
  if (v2 || (sub_232EBA228() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6572756C696166 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_232EBA228();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_232EB47C0()
{
  sub_232EBA288();
  sub_232EBA294();
  return sub_232EBA2A0();
}

uint64_t sub_232EB4804(char a1)
{
  if ((a1 & 1) != 0)
    return 0x6572756C696166;
  else
    return 0x73736563637573;
}

uint64_t sub_232EB4834(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_232EBA228();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

BOOL sub_232EB48A0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_232EB469C(*a1, *a2);
}

uint64_t sub_232EB48B8()
{
  return sub_232EB47C0();
}

uint64_t sub_232EB48CC()
{
  return sub_232EB46AC();
}

uint64_t sub_232EB48E0()
{
  sub_232EBA288();
  sub_232EB46AC();
  return sub_232EBA2A0();
}

uint64_t sub_232EB4928()
{
  char *v0;

  return sub_232EB4804(*v0);
}

uint64_t sub_232EB493C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_232EB46D0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_232EB496C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_232EB62DC();
  *a1 = result;
  return result;
}

uint64_t sub_232EB499C(uint64_t a1)
{
  MEMORY[0x23492AA30](&unk_232EBD2C0, a1);
  return sub_232EBA2D0();
}

uint64_t sub_232EB49D0(uint64_t a1)
{
  MEMORY[0x23492AA30](&unk_232EBD2C0, a1);
  return sub_232EBA2DC();
}

uint64_t sub_232EB4A04()
{
  return 12383;
}

uint64_t sub_232EB4A14@<X0>(_QWORD *a1@<X1>, _BYTE *a2@<X8>)
{
  return sub_232EB4ABC(a1, (uint64_t (*)(_QWORD, _QWORD, _QWORD))sub_232EA0FCC, a2);
}

uint64_t sub_232EB4A20(uint64_t a1)
{
  MEMORY[0x23492AA30](&unk_232EBD360, a1);
  return sub_232EBA2D0();
}

uint64_t sub_232EB4A54(uint64_t a1)
{
  MEMORY[0x23492AA30](&unk_232EBD360, a1);
  return sub_232EBA2DC();
}

uint64_t sub_232EB4A88@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_232EB4834(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_232EB4ABC@<X0>(_QWORD *a1@<X1>, uint64_t (*a2)(_QWORD, _QWORD, _QWORD)@<X3>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = a2(a1[2], a1[3], a1[4]);
  *a3 = result & 1;
  return result;
}

uint64_t sub_232EB4AF0(uint64_t a1)
{
  MEMORY[0x23492AA30](&unk_232EBD310, a1);
  return sub_232EBA2D0();
}

uint64_t sub_232EB4B24(uint64_t a1)
{
  MEMORY[0x23492AA30](&unk_232EBD310, a1);
  return sub_232EBA2DC();
}

uint64_t sub_232EB4B58(_QWORD *a1, _QWORD *a2)
{
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[2];
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  char v50;
  char v51;

  v4 = a2[2];
  v5 = a2[3];
  v6 = a2[4];
  v7 = type metadata accessor for ServiceResult.FailureCodingKeys(255, v4, v5, v6);
  v39 = MEMORY[0x23492AA30](&unk_232EBD360, v7);
  v40 = v7;
  v8 = sub_232EBA21C();
  v42 = *(_QWORD *)(v8 - 8);
  v43 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v41 = (char *)v33 - v9;
  v10 = type metadata accessor for ServiceResult.SuccessCodingKeys(255, v4, v5, v6);
  v33[0] = MEMORY[0x23492AA30](&unk_232EBD310, v10);
  v33[1] = v10;
  v38 = sub_232EBA21C();
  v36 = *(_QWORD *)(v38 - 8);
  v11 = MEMORY[0x24BDAC7A8](v38);
  v34 = (char *)v33 - v12;
  v37 = *(_QWORD *)(v4 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v35 = (char *)v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *(a2 - 1);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = v6;
  v45 = v4;
  v18 = type metadata accessor for ServiceResult.CodingKeys(255, v4, v5, v6);
  MEMORY[0x23492AA30](&unk_232EBD2C0, v18);
  v19 = sub_232EBA21C();
  v47 = *(_QWORD *)(v19 - 8);
  v48 = v19;
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)v33 - v20;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_232EBA2C4();
  (*(void (**)(char *, uint64_t, _QWORD *))(v15 + 16))(v17, v46, a2);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v22 = *v17;
    v51 = 1;
    v23 = v41;
    v24 = v48;
    sub_232EBA1D4();
    v50 = v22;
    sub_232EB4F04();
    v25 = v43;
    sub_232EBA210();
    (*(void (**)(char *, uint64_t))(v42 + 8))(v23, v25);
    return (*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v21, v24);
  }
  else
  {
    v27 = v37;
    v28 = v35;
    v29 = v45;
    (*(void (**)(char *, char *, uint64_t))(v37 + 32))(v35, v17, v45);
    v49 = 0;
    v30 = v34;
    v31 = v48;
    sub_232EBA1D4();
    v32 = v38;
    sub_232EBA210();
    (*(void (**)(char *, uint64_t))(v36 + 8))(v30, v32);
    (*(void (**)(char *, uint64_t))(v27 + 8))(v28, v29);
    return (*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v21, v31);
  }
}

uint64_t type metadata accessor for ServiceResult.FailureCodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ServiceResult.FailureCodingKeys);
}

uint64_t type metadata accessor for ServiceResult.SuccessCodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ServiceResult.SuccessCodingKeys);
}

uint64_t type metadata accessor for ServiceResult.CodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ServiceResult.CodingKeys);
}

unint64_t sub_232EB4F04()
{
  unint64_t result;

  result = qword_256010AB0;
  if (!qword_256010AB0)
  {
    result = MEMORY[0x23492AA30](&unk_232EBD7F8, &type metadata for AttributionKitError);
    atomic_store(result, (unint64_t *)&qword_256010AB0);
  }
  return result;
}

uint64_t sub_232EB4F48@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X8>)
{
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
  char *v22;
  uint64_t v23;
  char *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t *v40;
  char *v42;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(char *, char *, uint64_t);
  char *v52;
  char *v53;
  __int128 v54;
  char *v55;
  char *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _QWORD *v80;

  v71 = a5;
  v9 = type metadata accessor for ServiceResult.FailureCodingKeys(255, a2, a3, a4);
  v68 = MEMORY[0x23492AA30](&unk_232EBD360, v9);
  v69 = v9;
  v61 = sub_232EBA1C8();
  v64 = *(_QWORD *)(v61 - 8);
  MEMORY[0x24BDAC7A8](v61);
  v70 = (char *)&v54 - v10;
  v11 = type metadata accessor for ServiceResult.SuccessCodingKeys(255, a2, a3, a4);
  v65 = MEMORY[0x23492AA30](&unk_232EBD310, v11);
  v66 = v11;
  v60 = sub_232EBA1C8();
  v63 = *(_QWORD *)(v60 - 8);
  MEMORY[0x24BDAC7A8](v60);
  v67 = (char *)&v54 - v12;
  v13 = type metadata accessor for ServiceResult.CodingKeys(255, a2, a3, a4);
  MEMORY[0x23492AA30](&unk_232EBD2C0, v13);
  v14 = sub_232EBA1C8();
  v73 = *(_QWORD *)(v14 - 8);
  v74 = v14;
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v54 - v15;
  v75 = a2;
  v62 = a3;
  v72 = type metadata accessor for ServiceResult(0, a2, a3, a4);
  v59 = *(_QWORD *)(v72 - 8);
  v17 = MEMORY[0x24BDAC7A8](v72);
  v19 = (char *)&v54 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v17);
  v22 = (char *)&v54 - v21;
  MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v54 - v23;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v25 = v80;
  sub_232EBA2B8();
  v26 = (uint64_t)a1;
  if (!v25)
  {
    v57 = v22;
    v55 = v19;
    v56 = v24;
    v58 = 0;
    v80 = a1;
    v27 = v74;
    v28 = v16;
    *(_QWORD *)&v76 = sub_232EBA1BC();
    v29 = sub_232EB9FF4();
    MEMORY[0x23492AA30](MEMORY[0x24BEE12C8], v29);
    *(_QWORD *)&v78 = sub_232EBA0D8();
    *((_QWORD *)&v78 + 1) = v30;
    *(_QWORD *)&v79 = v31;
    *((_QWORD *)&v79 + 1) = v32;
    v33 = sub_232EBA0CC();
    MEMORY[0x23492AA30](MEMORY[0x24BEE2190], v33);
    sub_232EBA054();
    v34 = v76;
    if (v76 == 2 || (v54 = v78, v76 = v78, v77 = v79, (sub_232EBA060() & 1) == 0))
    {
      v38 = sub_232EBA114();
      swift_allocError();
      v40 = v39;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2560104B8);
      *v40 = v72;
      sub_232EBA15C();
      sub_232EBA108();
      (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v38 - 8) + 104))(v40, *MEMORY[0x24BEE26D0], v38);
      swift_willThrow();
    }
    else
    {
      if ((v34 & 1) == 0)
      {
        LOBYTE(v76) = 0;
        v35 = v67;
        v36 = v28;
        v37 = v58;
        sub_232EBA150();
        if (v37)
        {
          swift_unknownObjectRelease();
          (*(void (**)(char *, uint64_t))(v73 + 8))(v28, v27);
LABEL_9:
          v26 = (uint64_t)v80;
          return __swift_destroy_boxed_opaque_existential_1(v26);
        }
        v45 = v57;
        v46 = v60;
        sub_232EBA1A4();
        v47 = v73;
        (*(void (**)(char *, uint64_t))(v63 + 8))(v35, v46);
        swift_unknownObjectRelease();
        (*(void (**)(char *, uint64_t))(v47 + 8))(v36, v27);
        v50 = v72;
        swift_storeEnumTagMultiPayload();
        v51 = *(void (**)(char *, char *, uint64_t))(v59 + 32);
        v52 = v56;
        v51(v56, v45, v50);
        v44 = v71;
LABEL_15:
        v51(v44, v52, v50);
        goto LABEL_9;
      }
      LOBYTE(v76) = 1;
      v42 = v70;
      v43 = v58;
      sub_232EBA150();
      v44 = v71;
      if (!v43)
      {
        sub_232EB55CC();
        v48 = v61;
        sub_232EBA1A4();
        v49 = v73;
        (*(void (**)(char *, uint64_t))(v64 + 8))(v42, v48);
        swift_unknownObjectRelease();
        (*(void (**)(char *, uint64_t))(v49 + 8))(v28, v27);
        v53 = v55;
        *v55 = v76;
        v50 = v72;
        swift_storeEnumTagMultiPayload();
        v51 = *(void (**)(char *, char *, uint64_t))(v59 + 32);
        v52 = v56;
        v51(v56, v53, v50);
        goto LABEL_15;
      }
    }
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v73 + 8))(v16, v27);
    goto LABEL_9;
  }
  return __swift_destroy_boxed_opaque_existential_1(v26);
}

unint64_t sub_232EB55CC()
{
  unint64_t result;

  result = qword_256010AB8;
  if (!qword_256010AB8)
  {
    result = MEMORY[0x23492AA30](&unk_232EBD7D0, &type metadata for AttributionKitError);
    atomic_store(result, (unint64_t *)&qword_256010AB8);
  }
  return result;
}

uint64_t sub_232EB5610@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X1>, char *a3@<X8>)
{
  return sub_232EB4F48(a1, a2[2], a2[3], a2[4], a3);
}

uint64_t sub_232EB5630(_QWORD *a1, _QWORD *a2)
{
  return sub_232EB4B58(a1, a2);
}

uint64_t sub_232EB5644()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_232EB564C()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t *sub_232EB56BC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;

  v3 = a1;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  if (*(_QWORD *)(v4 + 64) <= 1uLL)
    v5 = 1;
  else
    v5 = *(_QWORD *)(v4 + 64);
  v6 = *(_DWORD *)(v4 + 80);
  if (v6 > 7 || (*(_DWORD *)(v4 + 80) & 0x100000) != 0 || (unint64_t)(v5 + 1) > 0x18)
  {
    v9 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v9 + ((v6 + 16) & ~v6));
    swift_retain();
  }
  else
  {
    v10 = *((unsigned __int8 *)a2 + v5);
    if (v10 >= 2)
    {
      if (v5 <= 3)
        v11 = v5;
      else
        v11 = 4;
      __asm { BR              X13 }
    }
    if (v10 == 1)
    {
      *(_BYTE *)a1 = *(_BYTE *)a2;
      *((_BYTE *)a1 + v5) = 1;
    }
    else
    {
      (*(void (**)(uint64_t *))(v4 + 16))(a1);
      *((_BYTE *)v3 + v5) = 0;
    }
  }
  return v3;
}

uint64_t sub_232EB57C8(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unsigned int v4;
  uint64_t v5;

  v2 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  v3 = *(_QWORD *)(v2 + 64);
  if (v3 <= 1)
    v3 = 1;
  v4 = *(unsigned __int8 *)(result + v3);
  if (v4 < 2)
  {
    if (v4 != 1)
      return (*(uint64_t (**)(void))(v2 + 8))();
  }
  else
  {
    if (v3 <= 3)
      v5 = v3;
    else
      v5 = 4;
    return ((uint64_t (*)(void))((char *)&loc_232EB580C + 4 * byte_232EBCF35[v5]))();
  }
  return result;
}

_BYTE *sub_232EB5860(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  char v8;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  if (*(_QWORD *)(v4 + 64) <= 1uLL)
    v5 = 1;
  else
    v5 = *(_QWORD *)(v4 + 64);
  v6 = a2[v5];
  if (v6 >= 2)
  {
    if (v5 <= 3)
      v7 = v5;
    else
      v7 = 4;
    __asm { BR              X13 }
  }
  if (v6 == 1)
  {
    *a1 = *a2;
    v8 = 1;
  }
  else
  {
    (*(void (**)(_BYTE *))(v4 + 16))(a1);
    v8 = 0;
  }
  a1[v5] = v8;
  return a1;
}

_BYTE *sub_232EB5930(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  char v12;

  if (a1 != a2)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(v5 - 8);
    if (*(_QWORD *)(v6 + 64) <= 1uLL)
      v7 = 1;
    else
      v7 = *(_QWORD *)(v6 + 64);
    v8 = a1[v7];
    if (v8 >= 2)
    {
      if (v7 <= 3)
        v9 = v7;
      else
        v9 = 4;
      __asm { BR              X12 }
    }
    if (v8 != 1)
      (*(void (**)(_BYTE *, _QWORD))(v6 + 8))(a1, *(_QWORD *)(a3 + 16));
    v10 = a2[v7];
    if (v10 >= 2)
    {
      if (v7 <= 3)
        v11 = v7;
      else
        v11 = 4;
      __asm { BR              X12 }
    }
    if (v10 == 1)
    {
      *a1 = *a2;
      v12 = 1;
    }
    else
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v6 + 16))(a1, a2, v5);
      v12 = 0;
    }
    a1[v7] = v12;
  }
  return a1;
}

_BYTE *sub_232EB5AAC(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  char v8;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  if (*(_QWORD *)(v4 + 64) <= 1uLL)
    v5 = 1;
  else
    v5 = *(_QWORD *)(v4 + 64);
  v6 = a2[v5];
  if (v6 >= 2)
  {
    if (v5 <= 3)
      v7 = v5;
    else
      v7 = 4;
    __asm { BR              X13 }
  }
  if (v6 == 1)
  {
    *a1 = *a2;
    v8 = 1;
  }
  else
  {
    (*(void (**)(_BYTE *))(v4 + 32))(a1);
    v8 = 0;
  }
  a1[v5] = v8;
  return a1;
}

_BYTE *sub_232EB5B7C(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  char v12;

  if (a1 != a2)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(v5 - 8);
    if (*(_QWORD *)(v6 + 64) <= 1uLL)
      v7 = 1;
    else
      v7 = *(_QWORD *)(v6 + 64);
    v8 = a1[v7];
    if (v8 >= 2)
    {
      if (v7 <= 3)
        v9 = v7;
      else
        v9 = 4;
      __asm { BR              X12 }
    }
    if (v8 != 1)
      (*(void (**)(_BYTE *, _QWORD))(v6 + 8))(a1, *(_QWORD *)(a3 + 16));
    v10 = a2[v7];
    if (v10 >= 2)
    {
      if (v7 <= 3)
        v11 = v7;
      else
        v11 = 4;
      __asm { BR              X12 }
    }
    if (v10 == 1)
    {
      *a1 = *a2;
      v12 = 1;
    }
    else
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v6 + 32))(a1, a2, v5);
      v12 = 0;
    }
    a1[v7] = v12;
  }
  return a1;
}

uint64_t sub_232EB5CF8(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  int v6;
  unsigned int v8;
  int v9;
  unsigned int v10;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64) <= 1uLL)
    v3 = 1;
  else
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_22;
  v4 = v3 + 1;
  v5 = 8 * (v3 + 1);
  if ((v3 + 1) <= 3)
  {
    v8 = ((a2 + ~(-1 << v5) - 254) >> v5) + 1;
    if (HIWORD(v8))
    {
      v6 = *(_DWORD *)(a1 + v4);
      if (!v6)
        goto LABEL_22;
      goto LABEL_15;
    }
    if (v8 > 0xFF)
    {
      v6 = *(unsigned __int16 *)(a1 + v4);
      if (!*(_WORD *)(a1 + v4))
        goto LABEL_22;
      goto LABEL_15;
    }
    if (v8 < 2)
    {
LABEL_22:
      v10 = *(unsigned __int8 *)(a1 + v3);
      if (v10 >= 2)
        return (v10 ^ 0xFF) + 1;
      else
        return 0;
    }
  }
  v6 = *(unsigned __int8 *)(a1 + v4);
  if (!*(_BYTE *)(a1 + v4))
    goto LABEL_22;
LABEL_15:
  v9 = (v6 - 1) << v5;
  if (v4 > 3)
    v9 = 0;
  if (!(_DWORD)v4)
    return (v9 + 255);
  if (v4 > 3)
    LODWORD(v4) = 4;
  return ((uint64_t (*)(void))((char *)&loc_232EB5DB8 + 4 * byte_232EBCF58[(v4 - 1)]))();
}

void sub_232EB5E04(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5;
  size_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 16) - 8) + 64);
  if (v5 <= 1)
    v5 = 1;
  v6 = v5 + 1;
  if (a3 < 0xFF)
  {
    v7 = 0;
  }
  else if (v6 <= 3)
  {
    v9 = ((a3 + ~(-1 << (8 * v6)) - 254) >> (8 * v6)) + 1;
    if (HIWORD(v9))
    {
      v7 = 4u;
    }
    else if (v9 >= 0x100)
    {
      v7 = 2;
    }
    else
    {
      v7 = v9 > 1;
    }
  }
  else
  {
    v7 = 1u;
  }
  if (a2 <= 0xFE)
    __asm { BR              X11 }
  v8 = a2 - 255;
  if (v6 < 4)
  {
    if ((_DWORD)v5 != -1)
    {
      v10 = v8 & ~(-1 << (8 * v6));
      bzero(a1, v6);
      if ((_DWORD)v6 == 3)
      {
        *a1 = v10;
        *((_BYTE *)a1 + 2) = BYTE2(v10);
      }
      else if ((_DWORD)v6 == 2)
      {
        *a1 = v10;
      }
      else
      {
        *(_BYTE *)a1 = v10;
      }
    }
  }
  else
  {
    bzero(a1, v5 + 1);
    *(_DWORD *)a1 = v8;
  }
  __asm { BR              X10 }
}

uint64_t sub_232EB5FA8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64) <= 1uLL)
    v2 = 1;
  else
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64);
  if (*(unsigned __int8 *)(a1 + v2) < 2u)
    return *(unsigned __int8 *)(a1 + v2);
  if (v2 <= 3)
    v3 = v2;
  else
    v3 = 4;
  return ((uint64_t (*)(void))((char *)&loc_232EB5FEC + 4 * byte_232EBCF66[v3]))();
}

void sub_232EB6034(_BYTE *a1, unsigned int a2, uint64_t a3)
{
  size_t v4;
  unsigned int v5;
  unsigned int v6;
  int v7;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64) <= 1uLL)
    v4 = 1;
  else
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
  if (a2 > 1)
  {
    v5 = a2 - 2;
    if (v4 < 4)
    {
      v6 = v5 >> (8 * v4);
      v7 = v5 & ~(-1 << (8 * v4));
      a1[v4] = v6 + 2;
      bzero(a1, v4);
      if ((_DWORD)v4 == 3)
      {
        *(_WORD *)a1 = v7;
        a1[2] = BYTE2(v7);
      }
      else if ((_DWORD)v4 == 2)
      {
        *(_WORD *)a1 = v7;
      }
      else
      {
        *a1 = v7;
      }
    }
    else
    {
      a1[v4] = 2;
      bzero(a1, v4);
      *(_DWORD *)a1 = v5;
    }
  }
  else
  {
    a1[v4] = a2;
  }
}

uint64_t sub_232EB60F8()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_232EB6100(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_232EB614C + 4 * byte_232EBCF70[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_232EB6180 + 4 * byte_232EBCF6B[v4]))();
}

uint64_t sub_232EB6180(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_232EB6188(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x232EB6190);
  return result;
}

uint64_t sub_232EB619C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x232EB61A4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_232EB61A8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_232EB61B0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_232EB61C0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_232EB6200 + 4 * byte_232EBCF75[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_232EB6220 + 4 * byte_232EBCF7A[v4]))();
}

_BYTE *sub_232EB6200(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_232EB6220(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_232EB6228(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_232EB6230(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_232EB6238(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_232EB6240(_DWORD *result)
{
  *result = 0;
  return result;
}

void sub_232EB624C()
{
  JUMPOUT(0x23492AA30);
}

void sub_232EB625C()
{
  JUMPOUT(0x23492AA30);
}

void sub_232EB626C()
{
  JUMPOUT(0x23492AA30);
}

void sub_232EB627C()
{
  JUMPOUT(0x23492AA30);
}

void sub_232EB628C()
{
  JUMPOUT(0x23492AA30);
}

void sub_232EB629C()
{
  JUMPOUT(0x23492AA30);
}

void sub_232EB62AC()
{
  JUMPOUT(0x23492AA30);
}

void sub_232EB62BC()
{
  JUMPOUT(0x23492AA30);
}

void sub_232EB62CC()
{
  JUMPOUT(0x23492AA30);
}

uint64_t sub_232EB62DC()
{
  return 2;
}

void sub_232EB62E4(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  void *v6;
  _QWORD v7[6];

  v5 = *a1;
  v7[4] = a4;
  v7[5] = a5;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 1107296256;
  v7[2] = sub_232EB9688;
  v7[3] = &block_descriptor_10;
  v6 = _Block_copy(v7);
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_handleHeartbeatWithReply_, v6);
  _Block_release(v6);
}

uint64_t sub_232EB6380()
{
  return swift_task_switch();
}

uint64_t sub_232EB6394()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (*v3)(uint64_t, uint64_t);

  if (qword_256010270 != -1)
    swift_once();
  if (!qword_256016E00)
    return (*(uint64_t (**)(void))(v0 + 8))();
  v3 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_256010548 + dword_256010548);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_232E9A230;
  return v3((uint64_t)sub_232EB62E4, 0);
}

uint64_t sub_232EB6444()
{
  sub_232EB6558();
  return sub_232EBA2D0();
}

uint64_t sub_232EB646C()
{
  sub_232EB6558();
  return sub_232EBA2DC();
}

uint64_t sub_232EB6494(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010AC8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_232EB6558();
  sub_232EBA2C4();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_232EB6558()
{
  unint64_t result;

  result = qword_256010AD0;
  if (!qword_256010AD0)
  {
    result = MEMORY[0x23492AA30](&unk_232EBD47C, &type metadata for WoofRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010AD0);
  }
  return result;
}

ValueMetadata *type metadata accessor for WoofRequest()
{
  return &type metadata for WoofRequest;
}

ValueMetadata *type metadata accessor for WoofRequest.CodingKeys()
{
  return &type metadata for WoofRequest.CodingKeys;
}

unint64_t sub_232EB65C0()
{
  unint64_t result;

  result = qword_256010AD8;
  if (!qword_256010AD8)
  {
    result = MEMORY[0x23492AA30](&unk_232EBD42C, &type metadata for WoofRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010AD8);
  }
  return result;
}

unint64_t sub_232EB6608()
{
  unint64_t result;

  result = qword_256010AE0;
  if (!qword_256010AE0)
  {
    result = MEMORY[0x23492AA30](&unk_232EBD454, &type metadata for WoofRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010AE0);
  }
  return result;
}

uint64_t block_copy_helper_10(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_10()
{
  return swift_release();
}

void sub_232EB6664(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  void *v6;
  _QWORD v7[6];

  v5 = *a1;
  v7[4] = a4;
  v7[5] = a5;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 1107296256;
  v7[2] = sub_232EB9688;
  v7[3] = &block_descriptor_7;
  v6 = _Block_copy(v7);
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_getDeveloperModeEnabledWithReply_, v6);
  _Block_release(v6);
}

uint64_t sub_232EB6700()
{
  return swift_task_switch();
}

uint64_t sub_232EB6714()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (*v3)(uint64_t, uint64_t);

  if (qword_256010210 != -1)
    swift_once();
  v3 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_256010538 + dword_256010538);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_232E9F9FC;
  return v3((uint64_t)sub_232EB6664, 0);
}

uint64_t sub_232EB67AC(char a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 48) = a1;
  return swift_task_switch();
}

uint64_t sub_232EB67C4()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t, uint64_t);

  if (qword_256010210 != -1)
    swift_once();
  v1 = *(_BYTE *)(v0 + 48);
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v2;
  *(_BYTE *)(v2 + 16) = v1;
  v3 = swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v3;
  *(_QWORD *)(v3 + 16) = sub_232EB6A20;
  *(_QWORD *)(v3 + 24) = v2;
  v6 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_256010518 + dword_256010518);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v4;
  *v4 = v0;
  v4[1] = sub_232EB6898;
  return v6((uint64_t)sub_232EA66A8, v3);
}

uint64_t sub_232EB6898()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 40) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_232EB68FC()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_232EB6938()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_232EB6974(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  void *v8;
  _QWORD v9[6];

  v9[4] = a4;
  v9[5] = a5;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = sub_232EB9688;
  v9[3] = &block_descriptor_11;
  v8 = _Block_copy(v9);
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_setDeveloperModeEnabled_reply_, a6 & 1, v8);
  _Block_release(v8);
}

void sub_232EB6A20(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  sub_232EB6974(a1, a2, a3, a4, a5, *(_BYTE *)(v5 + 16));
}

uint64_t sub_232EB6A28()
{
  sub_232EB6B3C();
  return sub_232EBA2D0();
}

uint64_t sub_232EB6A50()
{
  sub_232EB6B3C();
  return sub_232EBA2DC();
}

uint64_t sub_232EB6A78(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010AF8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_232EB6B3C();
  sub_232EBA2C4();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_232EB6B3C()
{
  unint64_t result;

  result = qword_256010B00;
  if (!qword_256010B00)
  {
    result = MEMORY[0x23492AA30](&unk_232EBD5B0, &type metadata for DeveloperModeRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010B00);
  }
  return result;
}

ValueMetadata *type metadata accessor for DeveloperModeRequest()
{
  return &type metadata for DeveloperModeRequest;
}

ValueMetadata *type metadata accessor for DeveloperModeRequest.CodingKeys()
{
  return &type metadata for DeveloperModeRequest.CodingKeys;
}

unint64_t sub_232EB6BA4()
{
  unint64_t result;

  result = qword_256010B08;
  if (!qword_256010B08)
  {
    result = MEMORY[0x23492AA30](&unk_232EBD560, &type metadata for DeveloperModeRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010B08);
  }
  return result;
}

unint64_t sub_232EB6BEC()
{
  unint64_t result;

  result = qword_256010B10;
  if (!qword_256010B10)
  {
    result = MEMORY[0x23492AA30](&unk_232EBD588, &type metadata for DeveloperModeRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010B10);
  }
  return result;
}

uint64_t block_copy_helper_11(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_11()
{
  return swift_release();
}

id sub_232EB6C50()
{
  return objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_2560181D8);
}

id sub_232EB6C90()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id sub_232EB6D24()
{
  void *v0;
  objc_class *ObjectType;
  objc_super v3;

  ObjectType = (objc_class *)swift_getObjectType();
  sub_232EB9F04();
  v3.receiver = v0;
  v3.super_class = ObjectType;
  return objc_msgSendSuper2(&v3, sel_init);
}

id sub_232EB6DC4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_232EB6E34()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v11;

  sub_232EB9E68();
  swift_allocObject();
  sub_232EB9E5C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25423FA90);
  sub_232EB7290();
  sub_232EB9E50();
  swift_release();
  v0 = *(_QWORD *)(v11 + 16);
  if (v0)
  {
    v1 = (uint64_t *)(v11 + 40);
    v2 = MEMORY[0x24BEE0D00];
    do
    {
      v3 = *v1;
      if (*v1)
      {
        v4 = *(v1 - 1);
        __swift_instantiateConcreteTypeFromMangledName(&qword_256010B18);
        v5 = swift_allocObject();
        *(_OWORD *)(v5 + 16) = xmmword_232EBB260;
        *(_QWORD *)(v5 + 56) = v2;
        *(_QWORD *)(v5 + 32) = v4;
        *(_QWORD *)(v5 + 40) = v3;
        swift_bridgeObjectRetain_n();
        sub_232EBA27C();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        if (qword_25423FA88 != -1)
          swift_once();
        v6 = sub_232EB9F40();
        __swift_project_value_buffer(v6, (uint64_t)qword_254240AF8);
        v7 = sub_232EB9F28();
        v8 = sub_232EBA084();
        if (os_log_type_enabled(v7, v8))
        {
          v9 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v9 = 0;
          _os_log_impl(&dword_232E98000, v7, v8, "Connection established", v9, 2u);
          MEMORY[0x23492AAA8](v9, -1, -1);
        }

      }
      v1 += 2;
      --v0;
    }
    while (v0);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_232EB71E0()
{
  return type metadata accessor for XPCClient();
}

uint64_t type metadata accessor for XPCClient()
{
  uint64_t result;

  result = qword_25423FA78;
  if (!qword_25423FA78)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_232EB7224()
{
  uint64_t result;
  unint64_t v1;

  result = sub_232EB9F10();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

unint64_t sub_232EB7290()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_25423FA98;
  if (!qword_25423FA98)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25423FA90);
    v2 = sub_232EB72F4();
    result = MEMORY[0x23492AA30](MEMORY[0x24BEE12D0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_25423FA98);
  }
  return result;
}

unint64_t sub_232EB72F4()
{
  unint64_t result;

  result = qword_25423FA40;
  if (!qword_25423FA40)
  {
    result = MEMORY[0x23492AA30](&unk_232EBB3C4, &type metadata for XPCClientMessage);
    atomic_store(result, (unint64_t *)&qword_25423FA40);
  }
  return result;
}

uint64_t sub_232EB7338()
{
  char v0;
  _BYTE v2[24];
  ValueMetadata *v3;
  unint64_t v4;

  v3 = &type metadata for FeatureFlag;
  v4 = sub_232EA0F30();
  v2[0] = 0;
  v0 = sub_232EB9F1C();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  return v0 & 1;
}

uint64_t sub_232EB7388()
{
  char v0;
  char v2[24];
  ValueMetadata *v3;
  unint64_t v4;

  v3 = &type metadata for FeatureFlag;
  v4 = sub_232EA0F30();
  v2[0] = 1;
  v0 = sub_232EB9F1C();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  return v0 & 1;
}

uint64_t storeEnumTagSinglePayload for FeatureFlag(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_232EB7428 + 4 * byte_232EBD635[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_232EB745C + 4 * asc_232EBD630[v4]))();
}

uint64_t sub_232EB745C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_232EB7464(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x232EB746CLL);
  return result;
}

uint64_t sub_232EB7478(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x232EB7480);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_232EB7484(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_232EB748C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FeatureFlag()
{
  return &type metadata for FeatureFlag;
}

unint64_t sub_232EB74AC()
{
  unint64_t result;

  result = qword_256010B20;
  if (!qword_256010B20)
  {
    result = MEMORY[0x23492AA30](&unk_232EBD6A4, &type metadata for FeatureFlag);
    atomic_store(result, (unint64_t *)&qword_256010B20);
  }
  return result;
}

const char *sub_232EB74F0()
{
  return "AdAttributionKit";
}

const char *sub_232EB7504()
{
  _BYTE *v0;

  if (*v0)
    return "Testing";
  else
    return "Service";
}

uint64_t sub_232EB752C(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_232EB7560 + 4 * byte_232EBD700[a1]))(0x6E776F6E6B6E75, 0xE700000000000000);
}

uint64_t sub_232EB7560()
{
  return 0x6165627472616568;
}

uint64_t sub_232EB757C()
{
  return 0x6F68747541746F6ELL;
}

unint64_t sub_232EB75A0()
{
  return 0xD000000000000012;
}

uint64_t sub_232EB7640()
{
  unsigned __int8 *v0;

  return sub_232EB752C(*v0);
}

uint64_t sub_232EB7648@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_232EB8270(a1, a2);
  *a3 = result;
  return result;
}

void sub_232EB766C(_BYTE *a1@<X8>)
{
  *a1 = 9;
}

uint64_t sub_232EB7678()
{
  sub_232EB7F74();
  return sub_232EBA2D0();
}

uint64_t sub_232EB76A0()
{
  sub_232EB7F74();
  return sub_232EBA2DC();
}

uint64_t sub_232EB76C8()
{
  sub_232EB80C8();
  return sub_232EBA2D0();
}

uint64_t sub_232EB76F0()
{
  sub_232EB80C8();
  return sub_232EBA2DC();
}

uint64_t sub_232EB7718()
{
  sub_232EB8194();
  return sub_232EBA2D0();
}

uint64_t sub_232EB7740()
{
  sub_232EB8194();
  return sub_232EBA2DC();
}

uint64_t sub_232EB7768()
{
  sub_232EB8040();
  return sub_232EBA2D0();
}

uint64_t sub_232EB7790()
{
  sub_232EB8040();
  return sub_232EBA2DC();
}

uint64_t sub_232EB77B8()
{
  sub_232EB7FFC();
  return sub_232EBA2D0();
}

uint64_t sub_232EB77E0()
{
  sub_232EB7FFC();
  return sub_232EBA2DC();
}

uint64_t sub_232EB7808()
{
  sub_232EB7FB8();
  return sub_232EBA2D0();
}

uint64_t sub_232EB7830()
{
  sub_232EB7FB8();
  return sub_232EBA2DC();
}

uint64_t sub_232EB7858()
{
  sub_232EB8084();
  return sub_232EBA2D0();
}

uint64_t sub_232EB7880()
{
  sub_232EB8084();
  return sub_232EBA2DC();
}

uint64_t sub_232EB78A8()
{
  sub_232EB8150();
  return sub_232EBA2D0();
}

uint64_t sub_232EB78D0()
{
  sub_232EB8150();
  return sub_232EBA2DC();
}

uint64_t sub_232EB78F8()
{
  sub_232EB810C();
  return sub_232EBA2D0();
}

uint64_t sub_232EB7920()
{
  sub_232EB810C();
  return sub_232EBA2DC();
}

uint64_t sub_232EB7948()
{
  sub_232EB81D8();
  return sub_232EBA2D0();
}

uint64_t sub_232EB7970()
{
  sub_232EB81D8();
  return sub_232EBA2DC();
}

void sub_232EB7998(_QWORD *a1, uint64_t a2)
{
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
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[3];
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v37 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010B28);
  v35 = *(_QWORD *)(v3 - 8);
  v36 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v34 = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010B30);
  v32 = *(_QWORD *)(v5 - 8);
  v33 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v31 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010B38);
  v29 = *(_QWORD *)(v7 - 8);
  v30 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v28 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010B40);
  v26 = *(_QWORD *)(v9 - 8);
  v27 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v25 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010B48);
  v23 = *(_QWORD *)(v11 - 8);
  v24 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v22 = (char *)v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010B50);
  v20 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v19 = (char *)v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010B58);
  v17[2] = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v17[1] = (char *)v17 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17[0] = __swift_instantiateConcreteTypeFromMangledName(&qword_256010B60);
  MEMORY[0x24BDAC7A8](v17[0]);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010B68);
  MEMORY[0x24BDAC7A8](v15);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010B70);
  v38 = *(_QWORD *)(v16 - 8);
  v39 = v16;
  MEMORY[0x24BDAC7A8](v16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_232EB7F74();
  sub_232EBA2C4();
  __asm { BR              X10 }
}

uint64_t sub_232EB7CAC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v4 - 89) = 0;
  sub_232EB81D8();
  v5 = *(_QWORD *)(v4 - 104);
  sub_232EBA1D4();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 112) + 8))(v2, v5);
}

unint64_t sub_232EB7F74()
{
  unint64_t result;

  result = qword_256010B78;
  if (!qword_256010B78)
  {
    result = MEMORY[0x23492AA30](&unk_232EBE020, &type metadata for AttributionKitError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010B78);
  }
  return result;
}

unint64_t sub_232EB7FB8()
{
  unint64_t result;

  result = qword_256010B80;
  if (!qword_256010B80)
  {
    result = MEMORY[0x23492AA30](&unk_232EBDFD0, &type metadata for AttributionKitError.InvalidImpressionJWSPayloadCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010B80);
  }
  return result;
}

unint64_t sub_232EB7FFC()
{
  unint64_t result;

  result = qword_256010B88;
  if (!qword_256010B88)
  {
    result = MEMORY[0x23492AA30](&unk_232EBDF80, &type metadata for AttributionKitError.InvalidImpressionJWSHeaderCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010B88);
  }
  return result;
}

unint64_t sub_232EB8040()
{
  unint64_t result;

  result = qword_256010B90;
  if (!qword_256010B90)
  {
    result = MEMORY[0x23492AA30](&unk_232EBDF30, &type metadata for AttributionKitError.ImpressionExpiredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010B90);
  }
  return result;
}

unint64_t sub_232EB8084()
{
  unint64_t result;

  result = qword_256010B98;
  if (!qword_256010B98)
  {
    result = MEMORY[0x23492AA30](&unk_232EBDEE0, &type metadata for AttributionKitError.MissingAttributionViewCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010B98);
  }
  return result;
}

unint64_t sub_232EB80C8()
{
  unint64_t result;

  result = qword_256010BA0;
  if (!qword_256010BA0)
  {
    result = MEMORY[0x23492AA30](&unk_232EBDE90, &type metadata for AttributionKitError.GenericNetworkRequestFailureCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010BA0);
  }
  return result;
}

unint64_t sub_232EB810C()
{
  unint64_t result;

  result = qword_256010BA8;
  if (!qword_256010BA8)
  {
    result = MEMORY[0x23492AA30](&unk_232EBDE40, &type metadata for AttributionKitError.ServiceUnavailableCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010BA8);
  }
  return result;
}

unint64_t sub_232EB8150()
{
  unint64_t result;

  result = qword_256010BB0;
  if (!qword_256010BB0)
  {
    result = MEMORY[0x23492AA30](&unk_232EBDDF0, &type metadata for AttributionKitError.NotAuthorizedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010BB0);
  }
  return result;
}

unint64_t sub_232EB8194()
{
  unint64_t result;

  result = qword_256010BB8;
  if (!qword_256010BB8)
  {
    result = MEMORY[0x23492AA30](&unk_232EBDDA0, &type metadata for AttributionKitError.HeartbeatCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010BB8);
  }
  return result;
}

unint64_t sub_232EB81D8()
{
  unint64_t result;

  result = qword_256010BC0;
  if (!qword_256010BC0)
  {
    result = MEMORY[0x23492AA30](&unk_232EBDD50, &type metadata for AttributionKitError.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010BC0);
  }
  return result;
}

uint64_t sub_232EB821C(_QWORD *a1)
{
  return sub_232EB8610(a1);
}

uint64_t sub_232EB8230@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = sub_232EB8610(a1);
  if (!v2)
    *a2 = result;
  return result;
}

void sub_232EB8258(_QWORD *a1)
{
  unsigned __int8 *v1;

  sub_232EB7998(a1, *v1);
}

uint64_t sub_232EB8270(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6E776F6E6B6E75 && a2 == 0xE700000000000000;
  if (v2 || (sub_232EBA228() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6165627472616568 && a2 == 0xE900000000000074 || (sub_232EBA228() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6F68747541746F6ELL && a2 == 0xED000064657A6972 || (sub_232EBA228() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x8000000232EBF1B0 || (sub_232EBA228() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD00000000000001CLL && a2 == 0x8000000232EBF1D0 || (sub_232EBA228() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x8000000232EBF1F0 || (sub_232EBA228() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000232EBF210 || (sub_232EBA228() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD00000000000001ALL && a2 == 0x8000000232EBF230 || (sub_232EBA228() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0xD00000000000001BLL && a2 == 0x8000000232EBF250)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else
  {
    v6 = sub_232EBA228();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 8;
    else
      return 9;
  }
}

uint64_t sub_232EB8610(_QWORD *a1)
{
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
  char *v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD v31[7];
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  char *v48;
  char *v49;
  char *v50;
  char *v51;
  char *v52;
  char *v53;
  char *v54;
  _QWORD *v55;
  uint64_t v56;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010C78);
  v45 = *(_QWORD *)(v2 - 8);
  v46 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v54 = (char *)v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010C80);
  v43 = *(_QWORD *)(v4 - 8);
  v44 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v53 = (char *)v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010C88);
  v41 = *(_QWORD *)(v6 - 8);
  v42 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v52 = (char *)v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010C90);
  v37 = *(_QWORD *)(v40 - 8);
  MEMORY[0x24BDAC7A8](v40);
  v50 = (char *)v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010C98);
  v38 = *(_QWORD *)(v9 - 8);
  v39 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v51 = (char *)v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010CA0);
  v35 = *(_QWORD *)(v36 - 8);
  MEMORY[0x24BDAC7A8](v36);
  v49 = (char *)v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010CA8);
  v33 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34);
  v48 = (char *)v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010CB0);
  v31[6] = *(_QWORD *)(v32 - 8);
  MEMORY[0x24BDAC7A8](v32);
  v47 = (char *)v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010CB8);
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010CC0);
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)v31 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = a1[3];
  v55 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v22);
  sub_232EB7F74();
  v23 = v56;
  sub_232EBA2B8();
  if (!v23)
  {
    v31[4] = v17;
    v31[2] = v15;
    v31[3] = v14;
    v56 = v19;
    v31[5] = 0;
    v24 = v21;
    v25 = sub_232EBA1BC();
    if (*(_QWORD *)(v25 + 16) == 1)
    {
      v26 = (char *)&loc_232EB899C + 4 * byte_232EBD712[*(unsigned __int8 *)(v25 + 32)];
      v31[1] = *(unsigned __int8 *)(v25 + 32);
      __asm { BR              X9 }
    }
    v27 = sub_232EBA114();
    swift_allocError();
    v29 = v28;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560104B8);
    *v29 = &type metadata for AttributionKitError;
    sub_232EBA15C();
    sub_232EBA108();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v27 - 8) + 104))(v29, *MEMORY[0x24BEE26D0], v27);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v56 + 8))(v24, v18);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v55);
}

unint64_t sub_232EB8DB0()
{
  unint64_t result;

  result = qword_256010BC8;
  if (!qword_256010BC8)
  {
    result = MEMORY[0x23492AA30](&unk_232EBD728, &type metadata for AttributionKitError);
    atomic_store(result, (unint64_t *)&qword_256010BC8);
  }
  return result;
}

ValueMetadata *type metadata accessor for AttributionKitError()
{
  return &type metadata for AttributionKitError;
}

uint64_t _s20AttributionKitCommon19AttributionKitErrorOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s20AttributionKitCommon19AttributionKitErrorOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_232EB8EE8 + 4 * byte_232EBD720[v4]))();
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_232EB8F1C + 4 * byte_232EBD71B[v4]))();
}

uint64_t sub_232EB8F1C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_232EB8F24(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x232EB8F2CLL);
  return result;
}

uint64_t sub_232EB8F38(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x232EB8F40);
  *(_BYTE *)result = a2 + 8;
  return result;
}

uint64_t sub_232EB8F44(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_232EB8F4C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AttributionKitError.CodingKeys()
{
  return &type metadata for AttributionKitError.CodingKeys;
}

ValueMetadata *type metadata accessor for AttributionKitError.UnknownCodingKeys()
{
  return &type metadata for AttributionKitError.UnknownCodingKeys;
}

ValueMetadata *type metadata accessor for AttributionKitError.HeartbeatCodingKeys()
{
  return &type metadata for AttributionKitError.HeartbeatCodingKeys;
}

ValueMetadata *type metadata accessor for AttributionKitError.NotAuthorizedCodingKeys()
{
  return &type metadata for AttributionKitError.NotAuthorizedCodingKeys;
}

ValueMetadata *type metadata accessor for AttributionKitError.ServiceUnavailableCodingKeys()
{
  return &type metadata for AttributionKitError.ServiceUnavailableCodingKeys;
}

ValueMetadata *type metadata accessor for AttributionKitError.GenericNetworkRequestFailureCodingKeys()
{
  return &type metadata for AttributionKitError.GenericNetworkRequestFailureCodingKeys;
}

ValueMetadata *type metadata accessor for AttributionKitError.MissingAttributionViewCodingKeys()
{
  return &type metadata for AttributionKitError.MissingAttributionViewCodingKeys;
}

ValueMetadata *type metadata accessor for AttributionKitError.ImpressionExpiredCodingKeys()
{
  return &type metadata for AttributionKitError.ImpressionExpiredCodingKeys;
}

ValueMetadata *type metadata accessor for AttributionKitError.InvalidImpressionJWSHeaderCodingKeys()
{
  return &type metadata for AttributionKitError.InvalidImpressionJWSHeaderCodingKeys;
}

ValueMetadata *type metadata accessor for AttributionKitError.InvalidImpressionJWSPayloadCodingKeys()
{
  return &type metadata for AttributionKitError.InvalidImpressionJWSPayloadCodingKeys;
}

unint64_t sub_232EB8FFC()
{
  unint64_t result;

  result = qword_256010BD0;
  if (!qword_256010BD0)
  {
    result = MEMORY[0x23492AA30](&unk_232EBDD28, &type metadata for AttributionKitError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010BD0);
  }
  return result;
}

unint64_t sub_232EB9044()
{
  unint64_t result;

  result = qword_256010BD8;
  if (!qword_256010BD8)
  {
    result = MEMORY[0x23492AA30](&unk_232EBDC48, &type metadata for AttributionKitError.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010BD8);
  }
  return result;
}

unint64_t sub_232EB908C()
{
  unint64_t result;

  result = qword_256010BE0;
  if (!qword_256010BE0)
  {
    result = MEMORY[0x23492AA30](&unk_232EBDC70, &type metadata for AttributionKitError.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010BE0);
  }
  return result;
}

unint64_t sub_232EB90D4()
{
  unint64_t result;

  result = qword_256010BE8;
  if (!qword_256010BE8)
  {
    result = MEMORY[0x23492AA30](&unk_232EBDBF8, &type metadata for AttributionKitError.HeartbeatCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010BE8);
  }
  return result;
}

unint64_t sub_232EB911C()
{
  unint64_t result;

  result = qword_256010BF0;
  if (!qword_256010BF0)
  {
    result = MEMORY[0x23492AA30](&unk_232EBDC20, &type metadata for AttributionKitError.HeartbeatCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010BF0);
  }
  return result;
}

unint64_t sub_232EB9164()
{
  unint64_t result;

  result = qword_256010BF8;
  if (!qword_256010BF8)
  {
    result = MEMORY[0x23492AA30](&unk_232EBDBA8, &type metadata for AttributionKitError.NotAuthorizedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010BF8);
  }
  return result;
}

unint64_t sub_232EB91AC()
{
  unint64_t result;

  result = qword_256010C00;
  if (!qword_256010C00)
  {
    result = MEMORY[0x23492AA30](&unk_232EBDBD0, &type metadata for AttributionKitError.NotAuthorizedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010C00);
  }
  return result;
}

unint64_t sub_232EB91F4()
{
  unint64_t result;

  result = qword_256010C08;
  if (!qword_256010C08)
  {
    result = MEMORY[0x23492AA30](&unk_232EBDB58, &type metadata for AttributionKitError.ServiceUnavailableCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010C08);
  }
  return result;
}

unint64_t sub_232EB923C()
{
  unint64_t result;

  result = qword_256010C10;
  if (!qword_256010C10)
  {
    result = MEMORY[0x23492AA30](&unk_232EBDB80, &type metadata for AttributionKitError.ServiceUnavailableCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010C10);
  }
  return result;
}

unint64_t sub_232EB9284()
{
  unint64_t result;

  result = qword_256010C18;
  if (!qword_256010C18)
  {
    result = MEMORY[0x23492AA30](&unk_232EBDB08, &type metadata for AttributionKitError.GenericNetworkRequestFailureCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010C18);
  }
  return result;
}

unint64_t sub_232EB92CC()
{
  unint64_t result;

  result = qword_256010C20;
  if (!qword_256010C20)
  {
    result = MEMORY[0x23492AA30](&unk_232EBDB30, &type metadata for AttributionKitError.GenericNetworkRequestFailureCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010C20);
  }
  return result;
}

unint64_t sub_232EB9314()
{
  unint64_t result;

  result = qword_256010C28;
  if (!qword_256010C28)
  {
    result = MEMORY[0x23492AA30](&unk_232EBDAB8, &type metadata for AttributionKitError.MissingAttributionViewCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010C28);
  }
  return result;
}

unint64_t sub_232EB935C()
{
  unint64_t result;

  result = qword_256010C30;
  if (!qword_256010C30)
  {
    result = MEMORY[0x23492AA30](&unk_232EBDAE0, &type metadata for AttributionKitError.MissingAttributionViewCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010C30);
  }
  return result;
}

unint64_t sub_232EB93A4()
{
  unint64_t result;

  result = qword_256010C38;
  if (!qword_256010C38)
  {
    result = MEMORY[0x23492AA30](&unk_232EBDA68, &type metadata for AttributionKitError.ImpressionExpiredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010C38);
  }
  return result;
}

unint64_t sub_232EB93EC()
{
  unint64_t result;

  result = qword_256010C40;
  if (!qword_256010C40)
  {
    result = MEMORY[0x23492AA30](&unk_232EBDA90, &type metadata for AttributionKitError.ImpressionExpiredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010C40);
  }
  return result;
}

unint64_t sub_232EB9434()
{
  unint64_t result;

  result = qword_256010C48;
  if (!qword_256010C48)
  {
    result = MEMORY[0x23492AA30](&unk_232EBDA18, &type metadata for AttributionKitError.InvalidImpressionJWSHeaderCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010C48);
  }
  return result;
}

unint64_t sub_232EB947C()
{
  unint64_t result;

  result = qword_256010C50;
  if (!qword_256010C50)
  {
    result = MEMORY[0x23492AA30](&unk_232EBDA40, &type metadata for AttributionKitError.InvalidImpressionJWSHeaderCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010C50);
  }
  return result;
}

unint64_t sub_232EB94C4()
{
  unint64_t result;

  result = qword_256010C58;
  if (!qword_256010C58)
  {
    result = MEMORY[0x23492AA30](&unk_232EBD9C8, &type metadata for AttributionKitError.InvalidImpressionJWSPayloadCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010C58);
  }
  return result;
}

unint64_t sub_232EB950C()
{
  unint64_t result;

  result = qword_256010C60;
  if (!qword_256010C60)
  {
    result = MEMORY[0x23492AA30](&unk_232EBD9F0, &type metadata for AttributionKitError.InvalidImpressionJWSPayloadCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010C60);
  }
  return result;
}

unint64_t sub_232EB9554()
{
  unint64_t result;

  result = qword_256010C68;
  if (!qword_256010C68)
  {
    result = MEMORY[0x23492AA30](&unk_232EBDC98, &type metadata for AttributionKitError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010C68);
  }
  return result;
}

unint64_t sub_232EB959C()
{
  unint64_t result;

  result = qword_256010C70;
  if (!qword_256010C70)
  {
    result = MEMORY[0x23492AA30](&unk_232EBDCC0, &type metadata for AttributionKitError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010C70);
  }
  return result;
}

void sub_232EB95EC(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  void *v6;
  _QWORD v7[6];

  v5 = *a1;
  v7[4] = a4;
  v7[5] = a5;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 1107296256;
  v7[2] = sub_232EB9688;
  v7[3] = &block_descriptor_12;
  v6 = _Block_copy(v7);
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_fetchReengagementTokensWithReply_, v6);
  _Block_release(v6);
}

uint64_t sub_232EB9688(uint64_t a1, void *a2)
{
  void (*v3)(uint64_t, unint64_t);
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = *(void (**)(uint64_t, unint64_t))(a1 + 32);
  swift_retain();
  v4 = a2;
  v5 = sub_232EB9EEC();
  v7 = v6;

  v3(v5, v7);
  sub_232EA2EE8(v5, v7);
  return swift_release();
}

uint64_t sub_232EB96F8()
{
  uint64_t result;

  if (qword_256010218 != -1)
    result = swift_once();
  if (qword_256016D08)
    return sub_232EA8524((void (*)(uint64_t *, uint64_t, unint64_t, uint64_t (*)(uint64_t, uint64_t), uint64_t))sub_232EB95EC);
  return result;
}

uint64_t sub_232EB9764()
{
  sub_232EB9878();
  return sub_232EBA2D0();
}

uint64_t sub_232EB978C()
{
  sub_232EB9878();
  return sub_232EBA2DC();
}

uint64_t sub_232EB97B4(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256010CC8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_232EB9878();
  sub_232EBA2C4();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_232EB9878()
{
  unint64_t result;

  result = qword_256010CD0;
  if (!qword_256010CD0)
  {
    result = MEMORY[0x23492AA30](&unk_232EBE150, &type metadata for TokenFetchRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010CD0);
  }
  return result;
}

ValueMetadata *type metadata accessor for TokenFetchRequest()
{
  return &type metadata for TokenFetchRequest;
}

ValueMetadata *type metadata accessor for TokenFetchRequest.CodingKeys()
{
  return &type metadata for TokenFetchRequest.CodingKeys;
}

unint64_t sub_232EB98E0()
{
  unint64_t result;

  result = qword_256010CD8;
  if (!qword_256010CD8)
  {
    result = MEMORY[0x23492AA30](&unk_232EBE100, &type metadata for TokenFetchRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010CD8);
  }
  return result;
}

unint64_t sub_232EB9928()
{
  unint64_t result;

  result = qword_256010CE0;
  if (!qword_256010CE0)
  {
    result = MEMORY[0x23492AA30](&unk_232EBE128, &type metadata for TokenFetchRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256010CE0);
  }
  return result;
}

uint64_t block_copy_helper_12(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_12()
{
  return swift_release();
}

uint64_t sub_232EB9988(char a1)
{
  if (!a1)
    return 1751607656;
  if (a1 == 1)
    return 7827308;
  return 0x6D756964656DLL;
}

uint64_t sub_232EB99CC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_232EAC020(*a1, *a2);
}

uint64_t sub_232EB99D8()
{
  sub_232EBA288();
  sub_232EB9F70();
  swift_bridgeObjectRelease();
  return sub_232EBA2A0();
}

uint64_t sub_232EB9A64()
{
  sub_232EB9F70();
  return swift_bridgeObjectRelease();
}

uint64_t sub_232EB9ACC()
{
  sub_232EBA288();
  sub_232EB9F70();
  swift_bridgeObjectRelease();
  return sub_232EBA2A0();
}

uint64_t sub_232EB9B54@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_232EB9C74();
  *a1 = result;
  return result;
}

void sub_232EB9B80(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  int v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v2 = *v1;
  v3 = 0xE400000000000000;
  v4 = 0xE300000000000000;
  v5 = 7827308;
  if (v2 != 1)
  {
    v5 = 0x6D756964656DLL;
    v4 = 0xE600000000000000;
  }
  v6 = v2 == 0;
  if (*v1)
    v7 = v5;
  else
    v7 = 1751607656;
  if (!v6)
    v3 = v4;
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_232EB9BCC()
{
  sub_232EB9DD0();
  return sub_232EB9FDC();
}

uint64_t sub_232EB9C28()
{
  sub_232EB9DD0();
  return sub_232EB9FD0();
}

uint64_t sub_232EB9C74()
{
  unint64_t v0;

  v0 = sub_232EBA144();
  swift_bridgeObjectRelease();
  if (v0 >= 3)
    return 3;
  else
    return v0;
}

unint64_t sub_232EB9CC0()
{
  unint64_t result;

  result = qword_256010CE8;
  if (!qword_256010CE8)
  {
    result = MEMORY[0x23492AA30](&unk_232EBE1AC, &type metadata for CoarseConversionValue);
    atomic_store(result, (unint64_t *)&qword_256010CE8);
  }
  return result;
}

uint64_t sub_232EB9D84(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_232EB9D8C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x232EB9D94);
  return result;
}

uint64_t sub_232EB9DA0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x232EB9DA8);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_232EB9DAC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_232EB9DB4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

unint64_t sub_232EB9DD0()
{
  unint64_t result;

  result = qword_256010CF0;
  if (!qword_256010CF0)
  {
    result = MEMORY[0x23492AA30](&unk_232EBE214, &type metadata for CoarseConversionValue);
    atomic_store(result, (unint64_t *)&qword_256010CF0);
  }
  return result;
}

uint64_t sub_232EB9E14()
{
  return MEMORY[0x24BDCB1E0]();
}

uint64_t sub_232EB9E20()
{
  return MEMORY[0x24BDCB1F0]();
}

uint64_t sub_232EB9E2C()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_232EB9E38()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_232EB9E44()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_232EB9E50()
{
  return MEMORY[0x24BDCCA20]();
}

uint64_t sub_232EB9E5C()
{
  return MEMORY[0x24BDCCA40]();
}

uint64_t sub_232EB9E68()
{
  return MEMORY[0x24BDCCA48]();
}

uint64_t sub_232EB9E74()
{
  return MEMORY[0x24BDCCA60]();
}

uint64_t sub_232EB9E80()
{
  return MEMORY[0x24BDCCA88]();
}

uint64_t sub_232EB9E8C()
{
  return MEMORY[0x24BDCCA90]();
}

uint64_t sub_232EB9E98()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_232EB9EA4()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_232EB9EB0()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_232EB9EBC()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_232EB9EC8()
{
  return MEMORY[0x24BDCDC08]();
}

uint64_t sub_232EB9ED4()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_232EB9EE0()
{
  return MEMORY[0x24BDCDCA8]();
}

uint64_t sub_232EB9EEC()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_232EB9EF8()
{
  return MEMORY[0x24BDCE778]();
}

uint64_t sub_232EB9F04()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_232EB9F10()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_232EB9F1C()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t sub_232EB9F28()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_232EB9F34()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_232EB9F40()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_232EB9F4C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_232EB9F58()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_232EB9F64()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_232EB9F70()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_232EB9F7C()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_232EB9F88()
{
  return MEMORY[0x24BEE0B70]();
}

uint64_t sub_232EB9F94()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_232EB9FA0()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_232EB9FAC()
{
  return MEMORY[0x24BEE0CE8]();
}

uint64_t sub_232EB9FB8()
{
  return MEMORY[0x24BEE0D98]();
}

uint64_t sub_232EB9FC4()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_232EB9FD0()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_232EB9FDC()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_232EB9FE8()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_232EB9FF4()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_232EBA000()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_232EBA00C()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_232EBA018()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_232EBA024()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_232EBA030()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_232EBA03C()
{
  return MEMORY[0x24BEE6A40]();
}

uint64_t sub_232EBA048()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_232EBA054()
{
  return MEMORY[0x24BEE1930]();
}

uint64_t sub_232EBA060()
{
  return MEMORY[0x24BEE19B8]();
}

uint64_t sub_232EBA06C()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_232EBA078()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_232EBA084()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_232EBA090()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_232EBA09C()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_232EBA0A8()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_232EBA0B4()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_232EBA0C0()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_232EBA0CC()
{
  return MEMORY[0x24BEE2150]();
}

uint64_t sub_232EBA0D8()
{
  return MEMORY[0x24BEE2168]();
}

uint64_t sub_232EBA0E4()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_232EBA0F0()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_232EBA0FC()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_232EBA108()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_232EBA114()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_232EBA120()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_232EBA12C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_232EBA138()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_232EBA144()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_232EBA150()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_232EBA15C()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_232EBA168()
{
  return MEMORY[0x24BEE32E0]();
}

uint64_t sub_232EBA174()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_232EBA180()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_232EBA18C()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_232EBA198()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_232EBA1A4()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_232EBA1B0()
{
  return MEMORY[0x24BEE33C0]();
}

uint64_t sub_232EBA1BC()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_232EBA1C8()
{
  return MEMORY[0x24BEE33E0]();
}

uint64_t sub_232EBA1D4()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_232EBA1E0()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_232EBA1EC()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_232EBA1F8()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_232EBA204()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_232EBA210()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_232EBA21C()
{
  return MEMORY[0x24BEE3520]();
}

uint64_t sub_232EBA228()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_232EBA234()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_232EBA240()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_232EBA24C()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_232EBA258()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_232EBA264()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_232EBA270()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_232EBA27C()
{
  return MEMORY[0x24BEE42C0]();
}

uint64_t sub_232EBA288()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_232EBA294()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_232EBA2A0()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_232EBA2AC()
{
  return MEMORY[0x24BEE4408]();
}

uint64_t sub_232EBA2B8()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_232EBA2C4()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_232EBA2D0()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_232EBA2DC()
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
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

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x24BEE4B78]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
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

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

