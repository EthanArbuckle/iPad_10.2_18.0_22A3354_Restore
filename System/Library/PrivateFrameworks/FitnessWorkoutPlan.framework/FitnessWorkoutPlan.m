BOOL static PlanCompletionMonitorState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_23C460CDC()
{
  return 0;
}

uint64_t sub_23C460CE8()
{
  return 0;
}

void sub_23C460CF4(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_23C460D00()
{
  sub_23C461140();
  return sub_23C480DA8();
}

uint64_t sub_23C460D28()
{
  sub_23C461140();
  return sub_23C480DB4();
}

BOOL sub_23C460D50(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_23C460D6C()
{
  return sub_23C480D6C();
}

uint64_t sub_23C460D98()
{
  _BYTE *v0;

  if (*v0)
    return 0x657669746361;
  else
    return 1701602409;
}

uint64_t sub_23C460DC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C461A54(a1, a2);
  *a3 = result;
  return result;
}

void sub_23C460DEC(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_23C460DF8()
{
  sub_23C4610FC();
  return sub_23C480DA8();
}

uint64_t sub_23C460E20()
{
  sub_23C4610FC();
  return sub_23C480DB4();
}

uint64_t sub_23C460E48@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_23C460E74()
{
  sub_23C461184();
  return sub_23C480DA8();
}

uint64_t sub_23C460E9C()
{
  sub_23C461184();
  return sub_23C480DB4();
}

uint64_t PlanCompletionMonitorState.encode(to:)(_QWORD *a1)
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

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7120);
  v16 = *(_QWORD *)(v3 - 8);
  v17 = v3;
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7128);
  v14 = *(_QWORD *)(v6 - 8);
  v15 = v6;
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7130);
  v18 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C4610FC();
  sub_23C480D9C();
  if ((v12 & 1) != 0)
  {
    v20 = 1;
    sub_23C461140();
    sub_23C480D00();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v17);
  }
  else
  {
    v19 = 0;
    sub_23C461184();
    sub_23C480D00();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v15);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v11, v9);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24261FF98]((char *)a1 + (int)result, -(result >> 32), 0, 0);
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

unint64_t sub_23C4610FC()
{
  unint64_t result;

  result = qword_256BA7138;
  if (!qword_256BA7138)
  {
    result = MEMORY[0x24261FFB0](&unk_23C4813DC, &type metadata for PlanCompletionMonitorState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7138);
  }
  return result;
}

unint64_t sub_23C461140()
{
  unint64_t result;

  result = qword_256BA7140;
  if (!qword_256BA7140)
  {
    result = MEMORY[0x24261FFB0](&unk_23C48138C, &type metadata for PlanCompletionMonitorState.ActiveCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7140);
  }
  return result;
}

unint64_t sub_23C461184()
{
  unint64_t result;

  result = qword_256BA7148;
  if (!qword_256BA7148)
  {
    result = MEMORY[0x24261FFB0](&unk_23C48133C, &type metadata for PlanCompletionMonitorState.IdleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7148);
  }
  return result;
}

uint64_t PlanCompletionMonitorState.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
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
  uint64_t v15;
  char v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  char v35;

  v30 = a2;
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7150);
  v32 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8]();
  v31 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7158);
  v4 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7160);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C4610FC();
  v11 = v33;
  sub_23C480D90();
  if (v11)
    goto LABEL_7;
  v26 = v4;
  v27 = a1;
  v12 = v31;
  v13 = v32;
  v33 = v8;
  v14 = sub_23C480CF4();
  v15 = v7;
  if (*(_QWORD *)(v14 + 16) != 1)
  {
    v19 = sub_23C480C94();
    swift_allocError();
    v21 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7168);
    *v21 = &type metadata for PlanCompletionMonitorState;
    sub_23C480CAC();
    sub_23C480C88();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v19 - 8) + 104))(v21, *MEMORY[0x24BEE26D0], v19);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v10, v15);
    a1 = v27;
LABEL_7:
    v24 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v24);
  }
  v16 = *(_BYTE *)(v14 + 32);
  if ((v16 & 1) != 0)
  {
    LODWORD(v28) = *(unsigned __int8 *)(v14 + 32);
    v35 = 1;
    sub_23C461140();
    sub_23C480CA0();
    v17 = v33;
    v18 = v30;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v12, v29);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v10, v15);
    v16 = v28;
  }
  else
  {
    v34 = 0;
    sub_23C461184();
    v22 = v6;
    sub_23C480CA0();
    v23 = v33;
    v18 = v30;
    (*(void (**)(char *, uint64_t))(v26 + 8))(v22, v28);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v10, v15);
  }
  *v18 = v16;
  v24 = (uint64_t)v27;
  return __swift_destroy_boxed_opaque_existential_1(v24);
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

uint64_t sub_23C461540@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return PlanCompletionMonitorState.init(from:)(a1, a2);
}

uint64_t sub_23C461554(_QWORD *a1)
{
  return PlanCompletionMonitorState.encode(to:)(a1);
}

uint64_t PlanCompletionMonitorState.hash(into:)()
{
  return sub_23C480D6C();
}

uint64_t PlanCompletionMonitorState.hashValue.getter()
{
  sub_23C480D60();
  sub_23C480D6C();
  return sub_23C480D84();
}

uint64_t sub_23C4615D4()
{
  sub_23C480D60();
  sub_23C480D6C();
  return sub_23C480D84();
}

uint64_t sub_23C461618()
{
  sub_23C480D60();
  sub_23C480D6C();
  return sub_23C480D84();
}

unint64_t sub_23C46165C()
{
  unint64_t result;

  result = qword_256BA7170;
  if (!qword_256BA7170)
  {
    result = MEMORY[0x24261FFB0](&protocol conformance descriptor for PlanCompletionMonitorState, &type metadata for PlanCompletionMonitorState);
    atomic_store(result, (unint64_t *)&qword_256BA7170);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for PlanCompletionMonitorState()
{
  return &type metadata for PlanCompletionMonitorState;
}

uint64_t getEnumTagSinglePayload for PlanCompletionState(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s18FitnessWorkoutPlan26PlanCompletionMonitorStateOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C4617A8 + 4 * byte_23C4810A5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C4617DC + 4 * byte_23C4810A0[v4]))();
}

uint64_t sub_23C4617DC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C4617E4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C4617ECLL);
  return result;
}

uint64_t sub_23C4617F8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C461800);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C461804(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C46180C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C461818(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23C461820(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PlanCompletionMonitorState.CodingKeys()
{
  return &type metadata for PlanCompletionMonitorState.CodingKeys;
}

ValueMetadata *type metadata accessor for PlanCompletionMonitorState.IdleCodingKeys()
{
  return &type metadata for PlanCompletionMonitorState.IdleCodingKeys;
}

ValueMetadata *type metadata accessor for PlanCompletionMonitorState.ActiveCodingKeys()
{
  return &type metadata for PlanCompletionMonitorState.ActiveCodingKeys;
}

unint64_t sub_23C461860()
{
  unint64_t result;

  result = qword_256BA7178;
  if (!qword_256BA7178)
  {
    result = MEMORY[0x24261FFB0](&unk_23C481314, &type metadata for PlanCompletionMonitorState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7178);
  }
  return result;
}

unint64_t sub_23C4618A8()
{
  unint64_t result;

  result = qword_256BA7180;
  if (!qword_256BA7180)
  {
    result = MEMORY[0x24261FFB0](&unk_23C481234, &type metadata for PlanCompletionMonitorState.IdleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7180);
  }
  return result;
}

unint64_t sub_23C4618F0()
{
  unint64_t result;

  result = qword_256BA7188;
  if (!qword_256BA7188)
  {
    result = MEMORY[0x24261FFB0](&unk_23C48125C, &type metadata for PlanCompletionMonitorState.IdleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7188);
  }
  return result;
}

unint64_t sub_23C461938()
{
  unint64_t result;

  result = qword_256BA7190;
  if (!qword_256BA7190)
  {
    result = MEMORY[0x24261FFB0](&unk_23C4811E4, &type metadata for PlanCompletionMonitorState.ActiveCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7190);
  }
  return result;
}

unint64_t sub_23C461980()
{
  unint64_t result;

  result = qword_256BA7198;
  if (!qword_256BA7198)
  {
    result = MEMORY[0x24261FFB0](&unk_23C48120C, &type metadata for PlanCompletionMonitorState.ActiveCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7198);
  }
  return result;
}

unint64_t sub_23C4619C8()
{
  unint64_t result;

  result = qword_256BA71A0;
  if (!qword_256BA71A0)
  {
    result = MEMORY[0x24261FFB0](&unk_23C481284, &type metadata for PlanCompletionMonitorState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA71A0);
  }
  return result;
}

unint64_t sub_23C461A10()
{
  unint64_t result;

  result = qword_256BA71A8;
  if (!qword_256BA71A8)
  {
    result = MEMORY[0x24261FFB0](&unk_23C4812AC, &type metadata for PlanCompletionMonitorState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA71A8);
  }
  return result;
}

uint64_t sub_23C461A54(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 1701602409 && a2 == 0xE400000000000000;
  if (v2 || (sub_23C480D54() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x657669746361 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23C480D54();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_23C461B38(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_23C461B58(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGSize()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_256BA71B0)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_256BA71B0);
  }
}

uint64_t PlanCompletionEnvironment.makeSessionSummaryDismissedStream.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_retain();
  return v1;
}

uint64_t PlanCompletionEnvironment.makeSignificantTimeChangeStream.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_retain();
  return v1;
}

uint64_t PlanCompletionEnvironment.presentPlanCompletionIfNeeded.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_retain();
  return v1;
}

uint64_t PlanCompletionEnvironment.init(makeSessionSummaryDismissedStream:makeSignificantTimeChangeStream:presentPlanCompletionIfNeeded:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, _QWORD *a7@<X8>)
{
  *a7 = result;
  a7[1] = a2;
  a7[2] = a3;
  a7[3] = a4;
  a7[4] = a5;
  a7[5] = a6;
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for PlanCompletionEnvironment(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for PlanCompletionEnvironment()
{
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for PlanCompletionEnvironment(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v3 = *(_QWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = v3;
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for PlanCompletionEnvironment(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  swift_release();
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

_OWORD *assignWithTake for PlanCompletionEnvironment(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  a1[2] = a2[2];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for PlanCompletionEnvironment(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PlanCompletionEnvironment(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 48) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PlanCompletionEnvironment()
{
  return &type metadata for PlanCompletionEnvironment;
}

BOOL static PlanCompletionAction.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t PlanCompletionAction.hash(into:)()
{
  return sub_23C480D6C();
}

uint64_t sub_23C461EFC()
{
  _BYTE *v0;

  if (*v0)
    return 0x6570704177656976;
  else
    return 0xD00000000000001DLL;
}

uint64_t sub_23C461F44@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C4629FC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C461F68()
{
  sub_23C462270();
  return sub_23C480DA8();
}

uint64_t sub_23C461F90()
{
  sub_23C462270();
  return sub_23C480DB4();
}

uint64_t sub_23C461FB8()
{
  sub_23C4622F8();
  return sub_23C480DA8();
}

uint64_t sub_23C461FE0()
{
  sub_23C4622F8();
  return sub_23C480DB4();
}

uint64_t sub_23C462008()
{
  sub_23C4622B4();
  return sub_23C480DA8();
}

uint64_t sub_23C462030()
{
  sub_23C4622B4();
  return sub_23C480DB4();
}

uint64_t PlanCompletionAction.hashValue.getter()
{
  sub_23C480D60();
  sub_23C480D6C();
  return sub_23C480D84();
}

uint64_t PlanCompletionAction.encode(to:)(_QWORD *a1)
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

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA71B8);
  v16 = *(_QWORD *)(v3 - 8);
  v17 = v3;
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA71C0);
  v14 = *(_QWORD *)(v6 - 8);
  v15 = v6;
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA71C8);
  v18 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C462270();
  sub_23C480D9C();
  if ((v12 & 1) != 0)
  {
    v20 = 1;
    sub_23C4622B4();
    sub_23C480D00();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v17);
  }
  else
  {
    v19 = 0;
    sub_23C4622F8();
    sub_23C480D00();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v15);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v11, v9);
}

unint64_t sub_23C462270()
{
  unint64_t result;

  result = qword_256BA71D0;
  if (!qword_256BA71D0)
  {
    result = MEMORY[0x24261FFB0](&unk_23C4817B0, &type metadata for PlanCompletionAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA71D0);
  }
  return result;
}

unint64_t sub_23C4622B4()
{
  unint64_t result;

  result = qword_256BA71D8;
  if (!qword_256BA71D8)
  {
    result = MEMORY[0x24261FFB0](&unk_23C481760, &type metadata for PlanCompletionAction.ViewAppearedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA71D8);
  }
  return result;
}

unint64_t sub_23C4622F8()
{
  unint64_t result;

  result = qword_256BA71E0;
  if (!qword_256BA71E0)
  {
    result = MEMORY[0x24261FFB0](&unk_23C481710, &type metadata for PlanCompletionAction.PresentPlanCompletionIfNeededCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA71E0);
  }
  return result;
}

uint64_t PlanCompletionAction.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
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
  uint64_t v15;
  char v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  char v35;

  v30 = a2;
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA71E8);
  v32 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8]();
  v31 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA71F0);
  v4 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA71F8);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C462270();
  v11 = v33;
  sub_23C480D90();
  if (v11)
    goto LABEL_7;
  v26 = v4;
  v27 = a1;
  v12 = v31;
  v13 = v32;
  v33 = v8;
  v14 = sub_23C480CF4();
  v15 = v7;
  if (*(_QWORD *)(v14 + 16) != 1)
  {
    v19 = sub_23C480C94();
    swift_allocError();
    v21 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7168);
    *v21 = &type metadata for PlanCompletionAction;
    sub_23C480CAC();
    sub_23C480C88();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v19 - 8) + 104))(v21, *MEMORY[0x24BEE26D0], v19);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v10, v15);
    a1 = v27;
LABEL_7:
    v24 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v24);
  }
  v16 = *(_BYTE *)(v14 + 32);
  if ((v16 & 1) != 0)
  {
    LODWORD(v28) = *(unsigned __int8 *)(v14 + 32);
    v35 = 1;
    sub_23C4622B4();
    sub_23C480CA0();
    v17 = v33;
    v18 = v30;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v12, v29);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v10, v15);
    v16 = v28;
  }
  else
  {
    v34 = 0;
    sub_23C4622F8();
    v22 = v6;
    sub_23C480CA0();
    v23 = v33;
    v18 = v30;
    (*(void (**)(char *, uint64_t))(v26 + 8))(v22, v28);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v10, v15);
  }
  *v18 = v16;
  v24 = (uint64_t)v27;
  return __swift_destroy_boxed_opaque_existential_1(v24);
}

unint64_t sub_23C462698()
{
  unint64_t result;

  result = qword_256BA7200;
  if (!qword_256BA7200)
  {
    result = MEMORY[0x24261FFB0](&protocol conformance descriptor for PlanCompletionAction, &type metadata for PlanCompletionAction);
    atomic_store(result, (unint64_t *)&qword_256BA7200);
  }
  return result;
}

uint64_t sub_23C4626DC@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return PlanCompletionAction.init(from:)(a1, a2);
}

uint64_t sub_23C4626F0(_QWORD *a1)
{
  return PlanCompletionAction.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for PlanCompletionAction()
{
  return &type metadata for PlanCompletionAction;
}

uint64_t _s18FitnessWorkoutPlan20PlanCompletionActionOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C462764 + 4 * byte_23C481475[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C462798 + 4 * asc_23C481470[v4]))();
}

uint64_t sub_23C462798(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C4627A0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C4627A8);
  return result;
}

uint64_t sub_23C4627B4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C4627BCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C4627C0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C4627C8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PlanCompletionAction.CodingKeys()
{
  return &type metadata for PlanCompletionAction.CodingKeys;
}

ValueMetadata *type metadata accessor for PlanCompletionAction.PresentPlanCompletionIfNeededCodingKeys()
{
  return &type metadata for PlanCompletionAction.PresentPlanCompletionIfNeededCodingKeys;
}

ValueMetadata *type metadata accessor for PlanCompletionAction.ViewAppearedCodingKeys()
{
  return &type metadata for PlanCompletionAction.ViewAppearedCodingKeys;
}

unint64_t sub_23C462808()
{
  unint64_t result;

  result = qword_256BA7208;
  if (!qword_256BA7208)
  {
    result = MEMORY[0x24261FFB0](&unk_23C4816E8, &type metadata for PlanCompletionAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7208);
  }
  return result;
}

unint64_t sub_23C462850()
{
  unint64_t result;

  result = qword_256BA7210;
  if (!qword_256BA7210)
  {
    result = MEMORY[0x24261FFB0](&unk_23C481608, &type metadata for PlanCompletionAction.PresentPlanCompletionIfNeededCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7210);
  }
  return result;
}

unint64_t sub_23C462898()
{
  unint64_t result;

  result = qword_256BA7218;
  if (!qword_256BA7218)
  {
    result = MEMORY[0x24261FFB0](&unk_23C481630, &type metadata for PlanCompletionAction.PresentPlanCompletionIfNeededCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7218);
  }
  return result;
}

unint64_t sub_23C4628E0()
{
  unint64_t result;

  result = qword_256BA7220;
  if (!qword_256BA7220)
  {
    result = MEMORY[0x24261FFB0](&unk_23C4815B8, &type metadata for PlanCompletionAction.ViewAppearedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7220);
  }
  return result;
}

unint64_t sub_23C462928()
{
  unint64_t result;

  result = qword_256BA7228;
  if (!qword_256BA7228)
  {
    result = MEMORY[0x24261FFB0](&unk_23C4815E0, &type metadata for PlanCompletionAction.ViewAppearedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7228);
  }
  return result;
}

unint64_t sub_23C462970()
{
  unint64_t result;

  result = qword_256BA7230;
  if (!qword_256BA7230)
  {
    result = MEMORY[0x24261FFB0](&unk_23C481658, &type metadata for PlanCompletionAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7230);
  }
  return result;
}

unint64_t sub_23C4629B8()
{
  unint64_t result;

  result = qword_256BA7238;
  if (!qword_256BA7238)
  {
    result = MEMORY[0x24261FFB0](&unk_23C481680, &type metadata for PlanCompletionAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7238);
  }
  return result;
}

uint64_t sub_23C4629FC(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD00000000000001DLL && a2 == 0x800000023C484FC0 || (sub_23C480D54() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6570704177656976 && a2 == 0xEC00000064657261)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v5 = sub_23C480D54();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

void PlanCompletionState.state.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

_BYTE *PlanCompletionState.state.setter(_BYTE *result)
{
  _BYTE *v1;

  *v1 = *result;
  return result;
}

uint64_t (*PlanCompletionState.state.modify())()
{
  return nullsub_1;
}

FitnessWorkoutPlan::PlanCompletionState __swiftcall PlanCompletionState.init(state:)(FitnessWorkoutPlan::PlanCompletionState state)
{
  _BYTE *v1;

  *v1 = *(_BYTE *)state.state;
  return state;
}

uint64_t sub_23C462B34()
{
  return 1;
}

uint64_t sub_23C462B3C()
{
  sub_23C480D60();
  sub_23C480D6C();
  return sub_23C480D84();
}

uint64_t sub_23C462B7C()
{
  return sub_23C480D6C();
}

uint64_t sub_23C462BA0()
{
  sub_23C480D60();
  sub_23C480D6C();
  return sub_23C480D84();
}

uint64_t sub_23C462BDC()
{
  return 0x6574617473;
}

uint64_t sub_23C462BF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x6574617473 && a2 == 0xE500000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_23C480D54();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_23C462C7C()
{
  sub_23C462DC8();
  return sub_23C480DA8();
}

uint64_t sub_23C462CA4()
{
  sub_23C462DC8();
  return sub_23C480DB4();
}

uint64_t PlanCompletionState.encode(to:)(_QWORD *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char v7;
  uint64_t v9;
  char v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7240);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C462DC8();
  sub_23C480D9C();
  v10 = v7;
  sub_23C462E0C();
  sub_23C480D3C();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_23C462DC8()
{
  unint64_t result;

  result = qword_256BA7248;
  if (!qword_256BA7248)
  {
    result = MEMORY[0x24261FFB0](&unk_23C481978, &type metadata for PlanCompletionState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7248);
  }
  return result;
}

unint64_t sub_23C462E0C()
{
  unint64_t result;

  result = qword_256BA7250;
  if (!qword_256BA7250)
  {
    result = MEMORY[0x24261FFB0](&protocol conformance descriptor for PlanCompletionMonitorState, &type metadata for PlanCompletionMonitorState);
    atomic_store(result, (unint64_t *)&qword_256BA7250);
  }
  return result;
}

uint64_t PlanCompletionState.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;
  char v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7258);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C462DC8();
  sub_23C480D90();
  if (!v2)
  {
    sub_23C462F6C();
    sub_23C480CE8();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v11;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_23C462F6C()
{
  unint64_t result;

  result = qword_256BA7260;
  if (!qword_256BA7260)
  {
    result = MEMORY[0x24261FFB0](&protocol conformance descriptor for PlanCompletionMonitorState, &type metadata for PlanCompletionMonitorState);
    atomic_store(result, (unint64_t *)&qword_256BA7260);
  }
  return result;
}

uint64_t sub_23C462FB0@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return PlanCompletionState.init(from:)(a1, a2);
}

uint64_t sub_23C462FC4(_QWORD *a1)
{
  return PlanCompletionState.encode(to:)(a1);
}

BOOL static PlanCompletionState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t storeEnumTagSinglePayload for PlanCompletionState(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C46303C + 4 * byte_23C481815[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C463070 + 4 * byte_23C481810[v4]))();
}

uint64_t sub_23C463070(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C463078(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C463080);
  return result;
}

uint64_t sub_23C46308C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C463094);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C463098(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C4630A0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PlanCompletionState()
{
  return &type metadata for PlanCompletionState;
}

uint64_t getEnumTagSinglePayload for PlanCompletionState.CodingKeys(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for PlanCompletionState.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23C463150 + 4 * byte_23C48181A[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23C463170 + 4 * byte_23C48181F[v4]))();
}

_BYTE *sub_23C463150(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23C463170(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C463178(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C463180(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C463188(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C463190(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_23C46319C()
{
  return 0;
}

ValueMetadata *type metadata accessor for PlanCompletionState.CodingKeys()
{
  return &type metadata for PlanCompletionState.CodingKeys;
}

unint64_t sub_23C4631B8()
{
  unint64_t result;

  result = qword_256BA7268;
  if (!qword_256BA7268)
  {
    result = MEMORY[0x24261FFB0](&unk_23C481950, &type metadata for PlanCompletionState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7268);
  }
  return result;
}

unint64_t sub_23C463200()
{
  unint64_t result;

  result = qword_256BA7270;
  if (!qword_256BA7270)
  {
    result = MEMORY[0x24261FFB0](&unk_23C4818C0, &type metadata for PlanCompletionState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7270);
  }
  return result;
}

unint64_t sub_23C463248()
{
  unint64_t result;

  result = qword_256BA7278;
  if (!qword_256BA7278)
  {
    result = MEMORY[0x24261FFB0](&unk_23C4818E8, &type metadata for PlanCompletionState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7278);
  }
  return result;
}

BOOL static CreateWorkoutPlanButtonAction.== infix(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t CreateWorkoutPlanButtonAction.hash(into:)()
{
  return sub_23C480D6C();
}

BOOL sub_23C4632C0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23C4632D4()
{
  _BYTE *v0;
  unint64_t v1;

  v1 = 0xD000000000000017;
  if (*v0 != 1)
    v1 = 0xD000000000000010;
  if (*v0)
    return v1;
  else
    return 0x4164694477656976;
}

uint64_t sub_23C463348@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C4638C4(a1, a2);
  *a3 = result;
  return result;
}

void sub_23C46336C(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_23C463378()
{
  sub_23C463760();
  return sub_23C480DA8();
}

uint64_t sub_23C4633A0()
{
  sub_23C463760();
  return sub_23C480DB4();
}

uint64_t sub_23C4633C8()
{
  sub_23C4637E8();
  return sub_23C480DA8();
}

uint64_t sub_23C4633F0()
{
  sub_23C4637E8();
  return sub_23C480DB4();
}

uint64_t sub_23C463418()
{
  sub_23C4637A4();
  return sub_23C480DA8();
}

uint64_t sub_23C463440()
{
  sub_23C4637A4();
  return sub_23C480DB4();
}

uint64_t sub_23C463468()
{
  sub_23C46382C();
  return sub_23C480DA8();
}

uint64_t sub_23C463490()
{
  sub_23C46382C();
  return sub_23C480DB4();
}

uint64_t CreateWorkoutPlanButtonAction.hashValue.getter()
{
  sub_23C480D60();
  sub_23C480D6C();
  return sub_23C480D84();
}

uint64_t CreateWorkoutPlanButtonAction.encode(to:)(_QWORD *a1, int a2)
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
  char *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  char v25;
  char v26;
  char v27;

  v24 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7280);
  v21 = *(_QWORD *)(v3 - 8);
  v22 = v3;
  MEMORY[0x24BDAC7A8]();
  v20 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7288);
  v18 = *(_QWORD *)(v5 - 8);
  v19 = v5;
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7290);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7298);
  v23 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8]();
  v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C463760();
  sub_23C480D9C();
  if ((_BYTE)v24)
  {
    if (v24 == 1)
    {
      v26 = 1;
      sub_23C4637E8();
      sub_23C480D00();
      (*(void (**)(char *, uint64_t))(v18 + 8))(v7, v19);
    }
    else
    {
      v27 = 2;
      sub_23C4637A4();
      v15 = v20;
      sub_23C480D00();
      (*(void (**)(char *, uint64_t))(v21 + 8))(v15, v22);
    }
  }
  else
  {
    v25 = 0;
    sub_23C46382C();
    sub_23C480D00();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v14, v12);
}

unint64_t sub_23C463760()
{
  unint64_t result;

  result = qword_256BA72A0;
  if (!qword_256BA72A0)
  {
    result = MEMORY[0x24261FFB0](&unk_23C481DD4, &type metadata for CreateWorkoutPlanButtonAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA72A0);
  }
  return result;
}

unint64_t sub_23C4637A4()
{
  unint64_t result;

  result = qword_256BA72A8;
  if (!qword_256BA72A8)
  {
    result = MEMORY[0x24261FFB0](&unk_23C481D84, &type metadata for CreateWorkoutPlanButtonAction.ShowHandoffAlertCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA72A8);
  }
  return result;
}

unint64_t sub_23C4637E8()
{
  unint64_t result;

  result = qword_256BA72B0;
  if (!qword_256BA72B0)
  {
    result = MEMORY[0x24261FFB0](&unk_23C481D34, &type metadata for CreateWorkoutPlanButtonAction.CreateWorkoutPlanTappedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA72B0);
  }
  return result;
}

unint64_t sub_23C46382C()
{
  unint64_t result;

  result = qword_256BA72B8;
  if (!qword_256BA72B8)
  {
    result = MEMORY[0x24261FFB0](&unk_23C481CE4, &type metadata for CreateWorkoutPlanButtonAction.ViewDidAppearCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA72B8);
  }
  return result;
}

_QWORD *CreateWorkoutPlanButtonAction.init(from:)(_QWORD *a1)
{
  return sub_23C463A30(a1);
}

_QWORD *sub_23C463884@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  _QWORD *result;

  result = sub_23C463A30(a1);
  if (!v2)
    *a2 = (_BYTE)result;
  return result;
}

uint64_t sub_23C4638AC(_QWORD *a1)
{
  unsigned __int8 *v1;

  return CreateWorkoutPlanButtonAction.encode(to:)(a1, *v1);
}

uint64_t sub_23C4638C4(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x4164694477656976 && a2 == 0xED00007261657070;
  if (v2 || (sub_23C480D54() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x800000023C484FE0 || (sub_23C480D54() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000023C485000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_23C480D54();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

_QWORD *sub_23C463A30(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  char *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  _QWORD *v30;
  char v31;
  char v32;
  char v33;

  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7310);
  v25 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8]();
  v29 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7318);
  v23 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8]();
  v28 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7320);
  v4 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7328);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (uint64_t *)((char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C463760();
  v11 = (uint64_t)v30;
  sub_23C480D90();
  if (v11)
    goto LABEL_7;
  v21 = v4;
  v22 = v8;
  v12 = v29;
  v30 = a1;
  v13 = v10;
  v14 = sub_23C480CF4();
  v15 = v7;
  if (*(_QWORD *)(v14 + 16) != 1)
  {
    v18 = sub_23C480C94();
    swift_allocError();
    v10 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7168);
    *v10 = &type metadata for CreateWorkoutPlanButtonAction;
    sub_23C480CAC();
    sub_23C480C88();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v18 - 8) + 104))(v10, *MEMORY[0x24BEE26D0], v18);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(_QWORD *, uint64_t))(v22 + 8))(v13, v7);
    a1 = v30;
LABEL_7:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return v10;
  }
  v10 = (_QWORD *)*(unsigned __int8 *)(v14 + 32);
  if (*(_BYTE *)(v14 + 32))
  {
    if ((_DWORD)v10 == 1)
    {
      v32 = 1;
      sub_23C4637E8();
      v16 = v28;
      sub_23C480CA0();
      v17 = v22;
      (*(void (**)(char *, uint64_t))(v23 + 8))(v16, v26);
    }
    else
    {
      v33 = 2;
      sub_23C4637A4();
      sub_23C480CA0();
      v17 = v22;
      (*(void (**)(char *, uint64_t))(v25 + 8))(v12, v27);
    }
    swift_bridgeObjectRelease();
    (*(void (**)(_QWORD *, uint64_t))(v17 + 8))(v13, v15);
  }
  else
  {
    v31 = 0;
    sub_23C46382C();
    sub_23C480CA0();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v6, v24);
    swift_bridgeObjectRelease();
    (*(void (**)(_QWORD *, uint64_t))(v22 + 8))(v13, v7);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  return v10;
}

unint64_t sub_23C463E0C()
{
  unint64_t result;

  result = qword_256BA72C0;
  if (!qword_256BA72C0)
  {
    result = MEMORY[0x24261FFB0](&protocol conformance descriptor for CreateWorkoutPlanButtonAction, &type metadata for CreateWorkoutPlanButtonAction);
    atomic_store(result, (unint64_t *)&qword_256BA72C0);
  }
  return result;
}

ValueMetadata *type metadata accessor for CreateWorkoutPlanButtonAction()
{
  return &type metadata for CreateWorkoutPlanButtonAction;
}

uint64_t getEnumTagSinglePayload for PreviousPlanLockupState.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s18FitnessWorkoutPlan29CreateWorkoutPlanButtonActionOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C463F44 + 4 * byte_23C4819D5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23C463F78 + 4 * byte_23C4819D0[v4]))();
}

uint64_t sub_23C463F78(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C463F80(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C463F88);
  return result;
}

uint64_t sub_23C463F94(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C463F9CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23C463FA0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C463FA8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_23C463FB4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CreateWorkoutPlanButtonAction.CodingKeys()
{
  return &type metadata for CreateWorkoutPlanButtonAction.CodingKeys;
}

ValueMetadata *type metadata accessor for CreateWorkoutPlanButtonAction.ViewDidAppearCodingKeys()
{
  return &type metadata for CreateWorkoutPlanButtonAction.ViewDidAppearCodingKeys;
}

ValueMetadata *type metadata accessor for CreateWorkoutPlanButtonAction.CreateWorkoutPlanTappedCodingKeys()
{
  return &type metadata for CreateWorkoutPlanButtonAction.CreateWorkoutPlanTappedCodingKeys;
}

ValueMetadata *type metadata accessor for CreateWorkoutPlanButtonAction.ShowHandoffAlertCodingKeys()
{
  return &type metadata for CreateWorkoutPlanButtonAction.ShowHandoffAlertCodingKeys;
}

unint64_t sub_23C464000()
{
  unint64_t result;

  result = qword_256BA72C8;
  if (!qword_256BA72C8)
  {
    result = MEMORY[0x24261FFB0](&unk_23C481CBC, &type metadata for CreateWorkoutPlanButtonAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA72C8);
  }
  return result;
}

unint64_t sub_23C464048()
{
  unint64_t result;

  result = qword_256BA72D0;
  if (!qword_256BA72D0)
  {
    result = MEMORY[0x24261FFB0](&unk_23C481BDC, &type metadata for CreateWorkoutPlanButtonAction.ViewDidAppearCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA72D0);
  }
  return result;
}

unint64_t sub_23C464090()
{
  unint64_t result;

  result = qword_256BA72D8;
  if (!qword_256BA72D8)
  {
    result = MEMORY[0x24261FFB0](&unk_23C481C04, &type metadata for CreateWorkoutPlanButtonAction.ViewDidAppearCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA72D8);
  }
  return result;
}

unint64_t sub_23C4640D8()
{
  unint64_t result;

  result = qword_256BA72E0;
  if (!qword_256BA72E0)
  {
    result = MEMORY[0x24261FFB0](&unk_23C481B8C, &type metadata for CreateWorkoutPlanButtonAction.CreateWorkoutPlanTappedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA72E0);
  }
  return result;
}

unint64_t sub_23C464120()
{
  unint64_t result;

  result = qword_256BA72E8;
  if (!qword_256BA72E8)
  {
    result = MEMORY[0x24261FFB0](&unk_23C481BB4, &type metadata for CreateWorkoutPlanButtonAction.CreateWorkoutPlanTappedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA72E8);
  }
  return result;
}

unint64_t sub_23C464168()
{
  unint64_t result;

  result = qword_256BA72F0;
  if (!qword_256BA72F0)
  {
    result = MEMORY[0x24261FFB0](&unk_23C481B3C, &type metadata for CreateWorkoutPlanButtonAction.ShowHandoffAlertCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA72F0);
  }
  return result;
}

unint64_t sub_23C4641B0()
{
  unint64_t result;

  result = qword_256BA72F8;
  if (!qword_256BA72F8)
  {
    result = MEMORY[0x24261FFB0](&unk_23C481B64, &type metadata for CreateWorkoutPlanButtonAction.ShowHandoffAlertCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA72F8);
  }
  return result;
}

unint64_t sub_23C4641F8()
{
  unint64_t result;

  result = qword_256BA7300;
  if (!qword_256BA7300)
  {
    result = MEMORY[0x24261FFB0](&unk_23C481C2C, &type metadata for CreateWorkoutPlanButtonAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7300);
  }
  return result;
}

unint64_t sub_23C464240()
{
  unint64_t result;

  result = qword_256BA7308;
  if (!qword_256BA7308)
  {
    result = MEMORY[0x24261FFB0](&unk_23C481C54, &type metadata for CreateWorkoutPlanButtonAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7308);
  }
  return result;
}

uint64_t PreviousPlanLockupEnvironment.init(fetchDetailForIdentifier:hasActivePlan:repeatPlan:makeWorkoutPlanUpdatedStream:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>)
{
  *a9 = result;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  a9[7] = a8;
  return result;
}

uint64_t destroy for PreviousPlanLockupEnvironment()
{
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for PreviousPlanLockupEnvironment(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  v3 = *(_QWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = v3;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for PreviousPlanLockupEnvironment(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  swift_release();
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_retain();
  swift_release();
  v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

_OWORD *assignWithTake for PreviousPlanLockupEnvironment(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  a1[2] = a2[2];
  swift_release();
  a1[3] = a2[3];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for PreviousPlanLockupEnvironment(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PreviousPlanLockupEnvironment(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 64) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PreviousPlanLockupEnvironment()
{
  return &type metadata for PreviousPlanLockupEnvironment;
}

BOOL static CreateWorkoutPlanButtonPlacement.== infix(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t CreateWorkoutPlanButtonPlacement.hash(into:)()
{
  return sub_23C480D6C();
}

uint64_t sub_23C46453C()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x756F59726F66;
  if (*v0 != 1)
    v1 = 0x7972617262696CLL;
  if (*v0)
    return v1;
  else
    return 0x65726F6C707865;
}

uint64_t sub_23C464594@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C464B04(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C4645B8()
{
  sub_23C4649A0();
  return sub_23C480DA8();
}

uint64_t sub_23C4645E0()
{
  sub_23C4649A0();
  return sub_23C480DB4();
}

uint64_t sub_23C464608()
{
  sub_23C464A6C();
  return sub_23C480DA8();
}

uint64_t sub_23C464630()
{
  sub_23C464A6C();
  return sub_23C480DB4();
}

uint64_t sub_23C464658()
{
  sub_23C464A28();
  return sub_23C480DA8();
}

uint64_t sub_23C464680()
{
  sub_23C464A28();
  return sub_23C480DB4();
}

uint64_t sub_23C4646A8()
{
  sub_23C4649E4();
  return sub_23C480DA8();
}

uint64_t sub_23C4646D0()
{
  sub_23C4649E4();
  return sub_23C480DB4();
}

uint64_t CreateWorkoutPlanButtonPlacement.hashValue.getter()
{
  sub_23C480D60();
  sub_23C480D6C();
  return sub_23C480D84();
}

uint64_t CreateWorkoutPlanButtonPlacement.encode(to:)(_QWORD *a1, int a2)
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
  char *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  char v25;
  char v26;
  char v27;

  v24 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7330);
  v21 = *(_QWORD *)(v3 - 8);
  v22 = v3;
  MEMORY[0x24BDAC7A8]();
  v20 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7338);
  v18 = *(_QWORD *)(v5 - 8);
  v19 = v5;
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7340);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7348);
  v23 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8]();
  v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C4649A0();
  sub_23C480D9C();
  if ((_BYTE)v24)
  {
    if (v24 == 1)
    {
      v26 = 1;
      sub_23C464A28();
      sub_23C480D00();
      (*(void (**)(char *, uint64_t))(v18 + 8))(v7, v19);
    }
    else
    {
      v27 = 2;
      sub_23C4649E4();
      v15 = v20;
      sub_23C480D00();
      (*(void (**)(char *, uint64_t))(v21 + 8))(v15, v22);
    }
  }
  else
  {
    v25 = 0;
    sub_23C464A6C();
    sub_23C480D00();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v14, v12);
}

unint64_t sub_23C4649A0()
{
  unint64_t result;

  result = qword_256BA7350;
  if (!qword_256BA7350)
  {
    result = MEMORY[0x24261FFB0](&unk_23C48227C, &type metadata for CreateWorkoutPlanButtonPlacement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7350);
  }
  return result;
}

unint64_t sub_23C4649E4()
{
  unint64_t result;

  result = qword_256BA7358;
  if (!qword_256BA7358)
  {
    result = MEMORY[0x24261FFB0](&unk_23C48222C, &type metadata for CreateWorkoutPlanButtonPlacement.LibraryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7358);
  }
  return result;
}

unint64_t sub_23C464A28()
{
  unint64_t result;

  result = qword_256BA7360;
  if (!qword_256BA7360)
  {
    result = MEMORY[0x24261FFB0](&unk_23C4821DC, &type metadata for CreateWorkoutPlanButtonPlacement.ForYouCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7360);
  }
  return result;
}

unint64_t sub_23C464A6C()
{
  unint64_t result;

  result = qword_256BA7368;
  if (!qword_256BA7368)
  {
    result = MEMORY[0x24261FFB0](&unk_23C48218C, &type metadata for CreateWorkoutPlanButtonPlacement.ExploreCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7368);
  }
  return result;
}

_QWORD *CreateWorkoutPlanButtonPlacement.init(from:)(_QWORD *a1)
{
  return sub_23C464C50(a1);
}

_QWORD *sub_23C464AC4@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  _QWORD *result;

  result = sub_23C464C50(a1);
  if (!v2)
    *a2 = (_BYTE)result;
  return result;
}

uint64_t sub_23C464AEC(_QWORD *a1)
{
  unsigned __int8 *v1;

  return CreateWorkoutPlanButtonPlacement.encode(to:)(a1, *v1);
}

uint64_t sub_23C464B04(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x65726F6C707865 && a2 == 0xE700000000000000;
  if (v2 || (sub_23C480D54() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x756F59726F66 && a2 == 0xE600000000000000 || (sub_23C480D54() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7972617262696CLL && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_23C480D54();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

_QWORD *sub_23C464C50(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  char *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  _QWORD *v30;
  char v31;
  char v32;
  char v33;

  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA73C0);
  v25 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8]();
  v29 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA73C8);
  v23 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8]();
  v28 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA73D0);
  v4 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA73D8);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (uint64_t *)((char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C4649A0();
  v11 = (uint64_t)v30;
  sub_23C480D90();
  if (v11)
    goto LABEL_7;
  v21 = v4;
  v22 = v8;
  v12 = v29;
  v30 = a1;
  v13 = v10;
  v14 = sub_23C480CF4();
  v15 = v7;
  if (*(_QWORD *)(v14 + 16) != 1)
  {
    v18 = sub_23C480C94();
    swift_allocError();
    v10 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7168);
    *v10 = &type metadata for CreateWorkoutPlanButtonPlacement;
    sub_23C480CAC();
    sub_23C480C88();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v18 - 8) + 104))(v10, *MEMORY[0x24BEE26D0], v18);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(_QWORD *, uint64_t))(v22 + 8))(v13, v7);
    a1 = v30;
LABEL_7:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return v10;
  }
  v10 = (_QWORD *)*(unsigned __int8 *)(v14 + 32);
  if (*(_BYTE *)(v14 + 32))
  {
    if ((_DWORD)v10 == 1)
    {
      v32 = 1;
      sub_23C464A28();
      v16 = v28;
      sub_23C480CA0();
      v17 = v22;
      (*(void (**)(char *, uint64_t))(v23 + 8))(v16, v26);
    }
    else
    {
      v33 = 2;
      sub_23C4649E4();
      sub_23C480CA0();
      v17 = v22;
      (*(void (**)(char *, uint64_t))(v25 + 8))(v12, v27);
    }
    swift_bridgeObjectRelease();
    (*(void (**)(_QWORD *, uint64_t))(v17 + 8))(v13, v15);
  }
  else
  {
    v31 = 0;
    sub_23C464A6C();
    sub_23C480CA0();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v6, v24);
    swift_bridgeObjectRelease();
    (*(void (**)(_QWORD *, uint64_t))(v22 + 8))(v13, v7);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  return v10;
}

unint64_t sub_23C46502C()
{
  unint64_t result;

  result = qword_256BA7370;
  if (!qword_256BA7370)
  {
    result = MEMORY[0x24261FFB0](&protocol conformance descriptor for CreateWorkoutPlanButtonPlacement, &type metadata for CreateWorkoutPlanButtonPlacement);
    atomic_store(result, (unint64_t *)&qword_256BA7370);
  }
  return result;
}

ValueMetadata *type metadata accessor for CreateWorkoutPlanButtonPlacement()
{
  return &type metadata for CreateWorkoutPlanButtonPlacement;
}

uint64_t _s18FitnessWorkoutPlan32CreateWorkoutPlanButtonPlacementOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C4650D0 + 4 * byte_23C481E95[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23C465104 + 4 * byte_23C481E90[v4]))();
}

uint64_t sub_23C465104(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C46510C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C465114);
  return result;
}

uint64_t sub_23C465120(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C465128);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23C46512C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C465134(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CreateWorkoutPlanButtonPlacement.CodingKeys()
{
  return &type metadata for CreateWorkoutPlanButtonPlacement.CodingKeys;
}

ValueMetadata *type metadata accessor for CreateWorkoutPlanButtonPlacement.ExploreCodingKeys()
{
  return &type metadata for CreateWorkoutPlanButtonPlacement.ExploreCodingKeys;
}

ValueMetadata *type metadata accessor for CreateWorkoutPlanButtonPlacement.ForYouCodingKeys()
{
  return &type metadata for CreateWorkoutPlanButtonPlacement.ForYouCodingKeys;
}

ValueMetadata *type metadata accessor for CreateWorkoutPlanButtonPlacement.LibraryCodingKeys()
{
  return &type metadata for CreateWorkoutPlanButtonPlacement.LibraryCodingKeys;
}

unint64_t sub_23C465184()
{
  unint64_t result;

  result = qword_256BA7378;
  if (!qword_256BA7378)
  {
    result = MEMORY[0x24261FFB0](&unk_23C482164, &type metadata for CreateWorkoutPlanButtonPlacement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7378);
  }
  return result;
}

unint64_t sub_23C4651CC()
{
  unint64_t result;

  result = qword_256BA7380;
  if (!qword_256BA7380)
  {
    result = MEMORY[0x24261FFB0](&unk_23C482084, &type metadata for CreateWorkoutPlanButtonPlacement.ExploreCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7380);
  }
  return result;
}

unint64_t sub_23C465214()
{
  unint64_t result;

  result = qword_256BA7388;
  if (!qword_256BA7388)
  {
    result = MEMORY[0x24261FFB0](&unk_23C4820AC, &type metadata for CreateWorkoutPlanButtonPlacement.ExploreCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7388);
  }
  return result;
}

unint64_t sub_23C46525C()
{
  unint64_t result;

  result = qword_256BA7390;
  if (!qword_256BA7390)
  {
    result = MEMORY[0x24261FFB0](&unk_23C482034, &type metadata for CreateWorkoutPlanButtonPlacement.ForYouCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7390);
  }
  return result;
}

unint64_t sub_23C4652A4()
{
  unint64_t result;

  result = qword_256BA7398;
  if (!qword_256BA7398)
  {
    result = MEMORY[0x24261FFB0](&unk_23C48205C, &type metadata for CreateWorkoutPlanButtonPlacement.ForYouCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7398);
  }
  return result;
}

unint64_t sub_23C4652EC()
{
  unint64_t result;

  result = qword_256BA73A0;
  if (!qword_256BA73A0)
  {
    result = MEMORY[0x24261FFB0](&unk_23C481FE4, &type metadata for CreateWorkoutPlanButtonPlacement.LibraryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA73A0);
  }
  return result;
}

unint64_t sub_23C465334()
{
  unint64_t result;

  result = qword_256BA73A8;
  if (!qword_256BA73A8)
  {
    result = MEMORY[0x24261FFB0](&unk_23C48200C, &type metadata for CreateWorkoutPlanButtonPlacement.LibraryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA73A8);
  }
  return result;
}

unint64_t sub_23C46537C()
{
  unint64_t result;

  result = qword_256BA73B0;
  if (!qword_256BA73B0)
  {
    result = MEMORY[0x24261FFB0](&unk_23C4820D4, &type metadata for CreateWorkoutPlanButtonPlacement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA73B0);
  }
  return result;
}

unint64_t sub_23C4653C4()
{
  unint64_t result;

  result = qword_256BA73B8;
  if (!qword_256BA73B8)
  {
    result = MEMORY[0x24261FFB0](&unk_23C4820FC, &type metadata for CreateWorkoutPlanButtonPlacement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA73B8);
  }
  return result;
}

uint64_t RepeatReplaceAlertDetailView.init(locale:planDetail:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_23C4807A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a3, a1, v6);
  v7 = a3 + *(int *)(type metadata accessor for RepeatReplaceAlertDetailView() + 20);
  return sub_23C4654A4(a2, v7);
}

uint64_t type metadata accessor for RepeatReplaceAlertDetailView()
{
  uint64_t result;

  result = qword_256BA7450;
  if (!qword_256BA7450)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23C4654A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PreviousPlanDetail();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23C4654F0()
{
  return sub_23C4809A0();
}

uint64_t sub_23C465508@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA73E0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v6 = sub_23C4808B0();
  *((_QWORD *)v6 + 1) = 0;
  v6[16] = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256BA73E8);
  sub_23C465F28(v2);
  LOBYTE(v2) = sub_23C480910();
  sub_23C480808();
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  sub_23C46651C((uint64_t)v6, a1);
  v15 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256BA73F0) + 36);
  *(_BYTE *)v15 = v2;
  *(_QWORD *)(v15 + 8) = v8;
  *(_QWORD *)(v15 + 16) = v10;
  *(_QWORD *)(v15 + 24) = v12;
  *(_QWORD *)(v15 + 32) = v14;
  *(_BYTE *)(v15 + 40) = 0;
  return sub_23C466564((uint64_t)v6);
}

uint64_t RepeatReplaceAlertDetailView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA73E0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v6 = sub_23C4808B0();
  *((_QWORD *)v6 + 1) = 0;
  v6[16] = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256BA73E8);
  sub_23C465F28(v2);
  LOBYTE(v2) = sub_23C480910();
  sub_23C480808();
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  sub_23C46651C((uint64_t)v6, a1);
  v15 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256BA73F0) + 36);
  *(_BYTE *)v15 = v2;
  *(_QWORD *)(v15 + 8) = v8;
  *(_QWORD *)(v15 + 16) = v10;
  *(_QWORD *)(v15 + 24) = v12;
  *(_QWORD *)(v15 + 32) = v14;
  *(_BYTE *)(v15 + 40) = 0;
  return sub_23C466564((uint64_t)v6);
}

void sub_23C465700(uint64_t a1, char a2)
{
  if (a1)
  {
    sub_23C480C7C();
    __asm { BR              X10 }
  }
  sub_23C480C7C();
  __asm { BR              X10 }
}

void sub_23C4657B4()
{
  sub_23C480BC8();
  swift_bridgeObjectRelease();
  JUMPOUT(0x23C4658FCLL);
}

void sub_23C4657CC()
{
  sub_23C480BC8(0x414453454E444557, 0xE900000000000059);
  swift_bridgeObjectRelease(0xE900000000000059);
  JUMPOUT(0x23C4658FCLL);
}

void sub_23C4657E8()
{
  sub_23C480BC8(0x5941445352554854, 0xE800000000000000);
  swift_bridgeObjectRelease(0xE800000000000000);
  JUMPOUT(0x23C4658FCLL);
}

void sub_23C465800()
{
  uint64_t v0;

  sub_23C480BC8(0x594144495246, v0);
  swift_bridgeObjectRelease(v0);
  JUMPOUT(0x23C4658FCLL);
}

void sub_23C465810()
{
  sub_23C480BC8(0x5941445255544153, 0xE800000000000000);
  swift_bridgeObjectRelease(0xE800000000000000);
  JUMPOUT(0x23C4658FCLL);
}

void sub_23C465864()
{
  sub_23C480BC8(0x414453454E444557, 0xE900000000000059);
  swift_bridgeObjectRelease(0xE900000000000059);
  JUMPOUT(0x23C4658FCLL);
}

void sub_23C465880()
{
  sub_23C480BC8(0x5941445352554854, 0xE800000000000000);
  swift_bridgeObjectRelease(0xE800000000000000);
  JUMPOUT(0x23C4658FCLL);
}

void sub_23C465898()
{
  uint64_t v0;

  sub_23C480BC8(0x594144495246, v0);
  swift_bridgeObjectRelease(v0);
  JUMPOUT(0x23C4658FCLL);
}

void sub_23C4658A8()
{
  sub_23C480BC8(0x5941445255544153, 0xE800000000000000);
  swift_bridgeObjectRelease(0xE800000000000000);
  JUMPOUT(0x23C4658FCLL);
}

uint64_t sub_23C465918(char *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v14;
  char *v15;

  v3 = sub_23C4807A8();
  v4 = *(_QWORD *)(v3 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23C480B98();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v15 = a1;
  swift_bridgeObjectRetain();
  v7 = sub_23C468F24(&v15);
  v8 = v15;
  MEMORY[0x24BDAC7A8](v7);
  *(&v14 - 2) = v1;
  v9 = (char *)sub_23C469D18((uint64_t)v8, (uint64_t (*)(uint64_t, _QWORD))sub_23C469CFC);
  swift_release();
  v15 = v9;
  sub_23C480B38();
  if (qword_256BA7110 != -1)
    swift_once();
  v10 = (void *)qword_256BADA90;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v1, v3);
  v11 = v10;
  sub_23C480BB0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256BA74A8);
  sub_23C469CBC(&qword_256BA74B0, &qword_256BA74A8, MEMORY[0x24BEE12B0]);
  v12 = sub_23C480B2C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_23C465B24(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  id v11;
  uint64_t v13;

  v6 = sub_23C4807A8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23C480B98();
  MEMORY[0x24BDAC7A8]();
  sub_23C465700(a1, a2);
  sub_23C480B38();
  if (qword_256BA7110 != -1)
    swift_once();
  v10 = (void *)qword_256BADA90;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a3, v6);
  v11 = v10;
  return sub_23C480BB0();
}

uint64_t sub_23C465C54(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v15;
  uint64_t v16;

  v3 = v2;
  v6 = sub_23C4807A8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_23C480B98();
  MEMORY[0x24BDAC7A8](v10);
  v11 = sub_23C480B80();
  MEMORY[0x24BDAC7A8](v11);
  if (a1 == a2)
  {
    sub_23C480B74();
    sub_23C480B68();
    v16 = a1;
    sub_23C480B50();
    sub_23C480B68();
    sub_23C480B8C();
    if (qword_256BA7110 == -1)
      goto LABEL_5;
    goto LABEL_6;
  }
  sub_23C480B74();
  sub_23C480B68();
  v16 = a1;
  sub_23C480B50();
  sub_23C480B68();
  v16 = a2;
  sub_23C480B50();
  sub_23C480B68();
  sub_23C480B8C();
  if (qword_256BA7110 != -1)
LABEL_6:
    swift_once();
LABEL_5:
  v12 = (void *)qword_256BADA90;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v3, v6);
  v13 = v12;
  return sub_23C480BB0();
}

uint64_t sub_23C465F28(uint64_t a1)
{
  uint64_t v1;
  char *v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  _BYTE *v18;
  _BYTE *v19;
  void (*v20)(char *, _BYTE *, uint64_t);
  _BYTE *v21;
  _BYTE *v22;
  _BYTE *v23;
  int *v24;
  char *v25;
  char *v26;
  uint64_t v27;
  _BYTE *v28;
  char *v29;
  uint64_t v30;
  void (*v31)(_BYTE *, uint64_t);
  _BYTE v33[4];
  int v34;
  _BYTE *v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  _BYTE *v39;
  _BYTE *v40;
  _BYTE *v41;
  uint64_t v42;
  _BYTE *v43;
  _BYTE *v44;
  int v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  _BYTE v49[311];
  _BYTE v50[311];
  _BYTE v51[311];
  _BYTE v52[311];
  _BYTE v53[304];
  _BYTE v54[320];
  _BYTE v55[304];
  _BYTE v56[320];
  _BYTE v57[311];
  _BYTE v58[304];
  _BYTE v59[320];
  _BYTE v60[311];
  _BYTE v61[304];
  _BYTE v62[320];
  _BYTE v63[311];
  _QWORD v64[41];
  _QWORD v65[41];
  _QWORD v66[41];
  _QWORD v67[41];
  _QWORD v68[2];
  char v69;
  _BYTE v70[311];
  _QWORD v71[2];
  char v72;
  _BYTE v73[311];
  _QWORD v74[2];
  char v75;
  _BYTE v76[311];
  _QWORD v77[2];
  char v78;
  _BYTE v79[311];

  v1 = MEMORY[0x24BDAC7A8](a1);
  v3 = v2;
  v4 = sub_23C480A9C();
  v48 = *(_QWORD *)(v4 - 8);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v41 = &v33[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = MEMORY[0x24BDAC7A8](v5);
  v43 = &v33[-v8];
  v9 = MEMORY[0x24BDAC7A8](v7);
  v44 = &v33[-v10];
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = &v33[-v12];
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = &v33[-v15];
  MEMORY[0x24BDAC7A8](v14);
  v18 = &v33[-v17];
  v47 = sub_23C480898();
  sub_23C46707C(v1, v53);
  v54[312] = 1;
  memcpy(&v54[7], v53, 0x130uLL);
  v45 = 1;
  memcpy(v52, v54, sizeof(v52));
  v40 = v18;
  sub_23C480A90();
  v42 = sub_23C480898();
  sub_23C4679D4(v1, v55);
  v56[312] = 1;
  memcpy(&v56[7], v55, 0x130uLL);
  v46 = 1;
  memcpy(v57, v56, sizeof(v57));
  v19 = v16;
  v39 = v16;
  sub_23C480A90();
  v38 = sub_23C480898();
  sub_23C467FA0(v1, v58);
  v59[312] = 1;
  memcpy(&v59[7], v58, 0x130uLL);
  v36 = 1;
  memcpy(v60, v59, sizeof(v60));
  v35 = v13;
  sub_23C480A90();
  v37 = sub_23C480898();
  sub_23C468614(v1, v61);
  v62[312] = 1;
  memcpy(&v62[7], v61, 0x130uLL);
  v34 = 1;
  memcpy(v63, v62, sizeof(v63));
  v20 = *(void (**)(char *, _BYTE *, uint64_t))(v48 + 16);
  v21 = v44;
  v20(v44, v18, v4);
  memcpy(v51, v57, sizeof(v51));
  v22 = v43;
  v20(v43, v19, v4);
  memcpy(v50, v60, sizeof(v50));
  v23 = v41;
  v20(v41, v13, v4);
  memcpy(v49, v63, sizeof(v49));
  v64[0] = v47;
  v64[1] = 0;
  LOBYTE(v64[2]) = v45;
  memcpy((char *)&v64[2] + 1, v52, 0x137uLL);
  memcpy(v3, v64, 0x148uLL);
  v24 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_256BA7498);
  v20(&v3[v24[12]], v21, v4);
  v25 = &v3[v24[16]];
  v65[0] = v42;
  v65[1] = 0;
  LOBYTE(v65[2]) = v46;
  memcpy((char *)&v65[2] + 1, v51, 0x137uLL);
  memcpy(v25, v65, 0x148uLL);
  v20(&v3[v24[20]], v22, v4);
  v26 = &v3[v24[24]];
  v27 = v38;
  v66[0] = v38;
  v66[1] = 0;
  LOBYTE(v18) = v36;
  LOBYTE(v66[2]) = v36;
  memcpy((char *)&v66[2] + 1, v50, 0x137uLL);
  memcpy(v26, v66, 0x148uLL);
  v28 = v23;
  v20(&v3[v24[28]], v23, v4);
  v29 = &v3[v24[32]];
  v30 = v37;
  v67[0] = v37;
  v67[1] = 0;
  LOBYTE(v23) = v34;
  LOBYTE(v67[2]) = v34;
  memcpy((char *)&v67[2] + 1, v49, 0x137uLL);
  memcpy(v29, v67, 0x148uLL);
  sub_23C468CC0((uint64_t)v64);
  sub_23C468CC0((uint64_t)v65);
  sub_23C468CC0((uint64_t)v66);
  sub_23C468CC0((uint64_t)v67);
  sub_23C468D50((uint64_t)v53);
  sub_23C468D50((uint64_t)v55);
  v31 = *(void (**)(_BYTE *, uint64_t))(v48 + 8);
  v31(v35, v4);
  v31(v39, v4);
  sub_23C468DD0((uint64_t)v55);
  v31(v40, v4);
  sub_23C468DD0((uint64_t)v53);
  v68[0] = v30;
  v68[1] = 0;
  v69 = (char)v23;
  memcpy(v70, v49, sizeof(v70));
  sub_23C468E60((uint64_t)v68);
  v31(v28, v4);
  v71[0] = v27;
  v71[1] = 0;
  v72 = (char)v18;
  memcpy(v73, v50, sizeof(v73));
  sub_23C468E60((uint64_t)v71);
  v31(v43, v4);
  v74[0] = v42;
  v74[1] = 0;
  v75 = v46;
  memcpy(v76, v51, sizeof(v76));
  sub_23C468E60((uint64_t)v74);
  v31(v44, v4);
  v77[0] = v47;
  v77[1] = 0;
  v78 = v45;
  memcpy(v79, v52, sizeof(v79));
  return sub_23C468E60((uint64_t)v77);
}

uint64_t sub_23C46651C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA73E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23C466564(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA73E0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23C4665A4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for RepeatReplaceAlertDetailView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(char *, char *, uint64_t);
  uint64_t v19;
  char *v20;
  uint64_t v21;
  void (*v22)(char *, char *, uint64_t);
  uint64_t v23;
  char *v25;
  char *v26;
  char *v27;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v23 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v23 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23C4807A8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (uint64_t *)((char *)a1 + v8);
    v10 = (char *)a2 + v8;
    v11 = *(uint64_t *)((char *)a2 + v8 + 8);
    *v9 = *(uint64_t *)((char *)a2 + v8);
    v9[1] = v11;
    v12 = *(uint64_t *)((char *)a2 + v8 + 24);
    v9[2] = *(uint64_t *)((char *)a2 + v8 + 16);
    v9[3] = v12;
    v13 = *(uint64_t *)((char *)a2 + v8 + 40);
    v9[4] = *(uint64_t *)((char *)a2 + v8 + 32);
    v9[5] = v13;
    v14 = *(uint64_t *)((char *)a2 + v8 + 56);
    v9[6] = *(uint64_t *)((char *)a2 + v8 + 48);
    v9[7] = v14;
    v15 = (int *)type metadata accessor for PreviousPlanDetail();
    v16 = v15[8];
    v25 = &v10[v16];
    v26 = (char *)v9 + v16;
    v17 = sub_23C48076C();
    v18 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v18(v26, v25, v17);
    *(_QWORD *)((char *)v9 + v15[9]) = *(_QWORD *)&v10[v15[9]];
    *(_QWORD *)((char *)v9 + v15[10]) = *(_QWORD *)&v10[v15[10]];
    *(_QWORD *)((char *)v9 + v15[11]) = *(_QWORD *)&v10[v15[11]];
    *((_BYTE *)v9 + v15[12]) = v10[v15[12]];
    *(_QWORD *)((char *)v9 + v15[13]) = *(_QWORD *)&v10[v15[13]];
    v19 = v15[14];
    v27 = (char *)v9 + v19;
    v20 = &v10[v19];
    v21 = sub_23C480790();
    v22 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v22(v27, v20, v21);
    *(_QWORD *)((char *)v9 + v15[15]) = *(_QWORD *)&v10[v15[15]];
  }
  return a1;
}

uint64_t destroy for RepeatReplaceAlertDetailView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = sub_23C4807A8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v6 = type metadata accessor for PreviousPlanDetail();
  v7 = v5 + *(int *)(v6 + 32);
  v8 = sub_23C48076C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v9 = v5 + *(int *)(v6 + 56);
  v10 = sub_23C480790();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
}

uint64_t initializeWithCopy for RepeatReplaceAlertDetailView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  void (*v19)(char *, char *, uint64_t);
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  void (*v24)(char *, char *, uint64_t);
  char *v26;

  v6 = sub_23C4807A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  v10 = *(_QWORD *)(a2 + v7);
  v11 = v9[1];
  *v8 = v10;
  v8[1] = v11;
  v12 = v9[3];
  v8[2] = v9[2];
  v8[3] = v12;
  v13 = v9[5];
  v8[4] = v9[4];
  v8[5] = v13;
  v14 = v9[7];
  v8[6] = v9[6];
  v8[7] = v14;
  v15 = (int *)type metadata accessor for PreviousPlanDetail();
  v16 = v15[8];
  v26 = (char *)v8 + v16;
  v17 = (char *)v9 + v16;
  v18 = sub_23C48076C();
  v19 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v19(v26, v17, v18);
  *(_QWORD *)((char *)v8 + v15[9]) = *(_QWORD *)((char *)v9 + v15[9]);
  *(_QWORD *)((char *)v8 + v15[10]) = *(_QWORD *)((char *)v9 + v15[10]);
  *(_QWORD *)((char *)v8 + v15[11]) = *(_QWORD *)((char *)v9 + v15[11]);
  *((_BYTE *)v8 + v15[12]) = *((_BYTE *)v9 + v15[12]);
  *(_QWORD *)((char *)v8 + v15[13]) = *(_QWORD *)((char *)v9 + v15[13]);
  v20 = v15[14];
  v21 = (char *)v8 + v20;
  v22 = (char *)v9 + v20;
  v23 = sub_23C480790();
  v24 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v24(v21, v22, v23);
  *(_QWORD *)((char *)v8 + v15[15]) = *(_QWORD *)((char *)v9 + v15[15]);
  return a1;
}

uint64_t assignWithCopy for RepeatReplaceAlertDetailView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  int *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;

  v6 = sub_23C4807A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *(_QWORD *)(a2 + v7);
  v8[1] = *(_QWORD *)(a2 + v7 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8[2] = v9[2];
  v8[3] = v9[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8[4] = v9[4];
  v8[5] = v9[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8[6] = v9[6];
  v8[7] = v9[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = (int *)type metadata accessor for PreviousPlanDetail();
  v11 = v10[8];
  v12 = (char *)v8 + v11;
  v13 = (char *)v9 + v11;
  v14 = sub_23C48076C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 24))(v12, v13, v14);
  *(_QWORD *)((char *)v8 + v10[9]) = *(_QWORD *)((char *)v9 + v10[9]);
  *(_QWORD *)((char *)v8 + v10[10]) = *(_QWORD *)((char *)v9 + v10[10]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)((char *)v8 + v10[11]) = *(_QWORD *)((char *)v9 + v10[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_BYTE *)v8 + v10[12]) = *((_BYTE *)v9 + v10[12]);
  *(_QWORD *)((char *)v8 + v10[13]) = *(_QWORD *)((char *)v9 + v10[13]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v15 = v10[14];
  v16 = (char *)v8 + v15;
  v17 = (char *)v9 + v15;
  v18 = sub_23C480790();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 24))(v16, v17, v18);
  *(_QWORD *)((char *)v8 + v10[15]) = *(_QWORD *)((char *)v9 + v10[15]);
  return a1;
}

uint64_t initializeWithTake for RepeatReplaceAlertDetailView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _OWORD *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  int *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = sub_23C4807A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_OWORD *)(a1 + v7);
  v9 = a2 + v7;
  v10 = *(_OWORD *)(a2 + v7 + 16);
  *v8 = *(_OWORD *)(a2 + v7);
  v8[1] = v10;
  v11 = *(_OWORD *)(a2 + v7 + 48);
  v8[2] = *(_OWORD *)(a2 + v7 + 32);
  v8[3] = v11;
  v12 = (int *)type metadata accessor for PreviousPlanDetail();
  v13 = v12[8];
  v14 = (char *)v8 + v13;
  v15 = v9 + v13;
  v16 = sub_23C48076C();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v14, v15, v16);
  *(_QWORD *)((char *)v8 + v12[9]) = *(_QWORD *)(v9 + v12[9]);
  *(_QWORD *)((char *)v8 + v12[10]) = *(_QWORD *)(v9 + v12[10]);
  *(_QWORD *)((char *)v8 + v12[11]) = *(_QWORD *)(v9 + v12[11]);
  *((_BYTE *)v8 + v12[12]) = *(_BYTE *)(v9 + v12[12]);
  *(_QWORD *)((char *)v8 + v12[13]) = *(_QWORD *)(v9 + v12[13]);
  v17 = v12[14];
  v18 = (char *)v8 + v17;
  v19 = v9 + v17;
  v20 = sub_23C480790();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(v18, v19, v20);
  *(_QWORD *)((char *)v8 + v12[15]) = *(_QWORD *)(v9 + v12[15]);
  return a1;
}

uint64_t assignWithTake for RepeatReplaceAlertDetailView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;

  v6 = sub_23C4807A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  v10 = *(_QWORD *)(a2 + v7 + 8);
  *v8 = *(_QWORD *)(a2 + v7);
  v8[1] = v10;
  swift_bridgeObjectRelease();
  v11 = v9[3];
  v8[2] = v9[2];
  v8[3] = v11;
  swift_bridgeObjectRelease();
  v12 = v9[5];
  v8[4] = v9[4];
  v8[5] = v12;
  swift_bridgeObjectRelease();
  v13 = v9[7];
  v8[6] = v9[6];
  v8[7] = v13;
  swift_bridgeObjectRelease();
  v14 = (int *)type metadata accessor for PreviousPlanDetail();
  v15 = v14[8];
  v16 = (char *)v8 + v15;
  v17 = (char *)v9 + v15;
  v18 = sub_23C48076C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 40))(v16, v17, v18);
  *(_QWORD *)((char *)v8 + v14[9]) = *(_QWORD *)((char *)v9 + v14[9]);
  *(_QWORD *)((char *)v8 + v14[10]) = *(_QWORD *)((char *)v9 + v14[10]);
  swift_bridgeObjectRelease();
  *(_QWORD *)((char *)v8 + v14[11]) = *(_QWORD *)((char *)v9 + v14[11]);
  swift_bridgeObjectRelease();
  *((_BYTE *)v8 + v14[12]) = *((_BYTE *)v9 + v14[12]);
  *(_QWORD *)((char *)v8 + v14[13]) = *(_QWORD *)((char *)v9 + v14[13]);
  swift_bridgeObjectRelease();
  v19 = v14[14];
  v20 = (char *)v8 + v19;
  v21 = (char *)v9 + v19;
  v22 = sub_23C480790();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 40))(v20, v21, v22);
  *(_QWORD *)((char *)v8 + v14[15]) = *(_QWORD *)((char *)v9 + v14[15]);
  return a1;
}

uint64_t getEnumTagSinglePayload for RepeatReplaceAlertDetailView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C466E30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v6 = sub_23C4807A8();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v8 = type metadata accessor for PreviousPlanDetail();
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t storeEnumTagSinglePayload for RepeatReplaceAlertDetailView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C466EB0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v8 = sub_23C4807A8();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v10 = type metadata accessor for PreviousPlanDetail();
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t sub_23C466F2C()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_23C4807A8();
  if (v1 <= 0x3F)
  {
    result = type metadata accessor for PreviousPlanDetail();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

unint64_t sub_23C466FB4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256BA7488;
  if (!qword_256BA7488)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256BA73F0);
    v2[0] = sub_23C469CBC(&qword_256BA7490, &qword_256BA73E0, MEMORY[0x24BDF4700]);
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x24261FFB0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256BA7488);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24261FFA4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_23C46707C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  uint64_t KeyPath;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint64_t v70;
  uint64_t v71;
  char v72;
  uint64_t v73;
  uint64_t v74;
  char v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _OWORD v85[9];
  _OWORD v86[10];
  _OWORD v87[19];
  _OWORD v88[10];
  _OWORD v89[10];

  v59 = a2;
  v3 = sub_23C4807A8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v56 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23C480B98();
  MEMORY[0x24BDAC7A8](v7);
  sub_23C480B38();
  if (qword_256BA7110 != -1)
    swift_once();
  v8 = (void *)qword_256BADA90;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  v9 = v8;
  *(_QWORD *)&v87[0] = sub_23C480BB0();
  *((_QWORD *)&v87[0] + 1) = v10;
  v58 = sub_23C468EE0();
  v11 = sub_23C480964();
  v13 = v12;
  v15 = v14 & 1;
  sub_23C480934();
  v16 = sub_23C480958();
  v57 = a1;
  v18 = v17;
  v20 = v19;
  swift_release();
  sub_23C468E50(v11, v13, v15);
  swift_bridgeObjectRelease();
  LODWORD(v87[0]) = sub_23C4808EC();
  v21 = sub_23C48094C();
  v23 = v22;
  v25 = v24;
  LOBYTE(v11) = v26 & 1;
  sub_23C468E50(v16, v18, v20 & 1);
  swift_bridgeObjectRelease();
  v27 = sub_23C480ACC();
  sub_23C46761C(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v87, 0.0, 1, 0.0, 1, v27, v28, v21, v23, v11, v25);
  sub_23C468E50(v21, v23, v11);
  swift_bridgeObjectRelease();
  v82 = v87[6];
  v83 = v87[7];
  v84 = v87[8];
  v78 = v87[2];
  v79 = v87[3];
  v80 = v87[4];
  v81 = v87[5];
  v76 = v87[0];
  v77 = v87[1];
  v29 = v57 + *(int *)(type metadata accessor for RepeatReplaceAlertDetailView() + 20);
  v30 = type metadata accessor for PreviousPlanDetail();
  *(_QWORD *)&v87[0] = sub_23C465918(*(char **)(v29 + *(int *)(v30 + 40)));
  *((_QWORD *)&v87[0] + 1) = v31;
  v32 = sub_23C480964();
  v34 = v33;
  LOBYTE(v11) = v35 & 1;
  sub_23C480934();
  v36 = sub_23C480958();
  v38 = v37;
  LOBYTE(v25) = v39;
  swift_release();
  sub_23C468E50(v32, v34, v11);
  swift_bridgeObjectRelease();
  LODWORD(v87[0]) = sub_23C4808F8();
  v40 = sub_23C48094C();
  v42 = v41;
  v44 = v43;
  LOBYTE(v18) = v45 & 1;
  sub_23C468E50(v36, v38, v25 & 1);
  swift_bridgeObjectRelease();
  KeyPath = swift_getKeyPath();
  v70 = v40;
  v71 = v42;
  v72 = v18;
  v73 = v44;
  v74 = KeyPath;
  v75 = 2;
  sub_23C480AD8();
  sub_23C4677FC(262.0, 0, 0.0, 1, 0.0, 1, 0.0, 1, v87, 0.0, 1, 0.0, 1);
  sub_23C468E50(v40, v42, v18);
  swift_release();
  swift_bridgeObjectRelease();
  v66 = v87[6];
  v67 = v87[7];
  v68 = v87[8];
  v69 = v87[9];
  v62 = v87[2];
  v63 = v87[3];
  v64 = v87[4];
  v65 = v87[5];
  v60 = v87[0];
  v61 = v87[1];
  v85[6] = v82;
  v85[7] = v83;
  v85[8] = v84;
  v85[2] = v78;
  v85[3] = v79;
  v85[4] = v80;
  v85[5] = v81;
  v85[0] = v76;
  v85[1] = v77;
  v47 = v87[6];
  v48 = v87[7];
  v86[6] = v87[6];
  v86[7] = v87[7];
  v86[8] = v87[8];
  v86[9] = v87[9];
  v49 = v87[2];
  v50 = v87[3];
  v86[2] = v87[2];
  v86[3] = v87[3];
  v51 = v87[4];
  v52 = v87[5];
  v86[4] = v87[4];
  v86[5] = v87[5];
  v53 = v87[0];
  v54 = v87[1];
  v86[0] = v87[0];
  v86[1] = v87[1];
  v87[6] = v82;
  v87[7] = v83;
  v87[2] = v78;
  v87[3] = v79;
  v87[4] = v80;
  v87[5] = v81;
  v87[0] = v76;
  v87[1] = v77;
  v87[16] = v48;
  v87[17] = v87[8];
  v87[18] = v87[9];
  v87[12] = v50;
  v87[13] = v51;
  v87[14] = v52;
  v87[15] = v47;
  v87[8] = v84;
  v87[9] = v53;
  v87[10] = v54;
  v87[11] = v49;
  memcpy(v59, v87, 0x130uLL);
  v88[6] = v66;
  v88[7] = v67;
  v88[8] = v68;
  v88[9] = v69;
  v88[2] = v62;
  v88[3] = v63;
  v88[4] = v64;
  v88[5] = v65;
  v88[0] = v60;
  v88[1] = v61;
  sub_23C469AF0((uint64_t)v85);
  sub_23C469B2C((uint64_t)v86);
  sub_23C469B78((uint64_t)v88);
  v89[6] = v82;
  v89[7] = v83;
  v89[8] = v84;
  v89[2] = v78;
  v89[3] = v79;
  v89[4] = v80;
  v89[5] = v81;
  v89[0] = v76;
  v89[1] = v77;
  return sub_23C469BC4((uint64_t)v89);
}

uint64_t sub_23C46761C@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19)
{
  uint64_t v20;
  char v21;
  uint64_t v22;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;

  v20 = a19;
  v21 = a18;
  v22 = a17;
  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if ((a8 & 1) != 0)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_23C480C58();
    v31 = (void *)sub_23C480904();
    sub_23C4807D8();

    v21 = a18;
    v20 = a19;
    v22 = a17;
  }
  sub_23C48085C();
  *(_QWORD *)a9 = a16;
  *(_QWORD *)(a9 + 8) = v22;
  *(_BYTE *)(a9 + 16) = v21 & 1;
  *(_QWORD *)(a9 + 24) = v20;
  *(_OWORD *)(a9 + 96) = v37;
  *(_OWORD *)(a9 + 112) = v38;
  *(_OWORD *)(a9 + 128) = v39;
  *(_OWORD *)(a9 + 32) = v33;
  *(_OWORD *)(a9 + 48) = v34;
  *(_OWORD *)(a9 + 64) = v35;
  *(_OWORD *)(a9 + 80) = v36;
  sub_23C468D40(a16, v22, v21 & 1);
  return swift_bridgeObjectRetain();
}

uint64_t sub_23C4677FC@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, _OWORD *a9@<X8>, double a10, char a11, double a12, char a13)
{
  __int128 *v13;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  char v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  _BYTE v39[32];

  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if ((a8 & 1) != 0)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_23C480C58();
    v23 = (void *)sub_23C480904();
    sub_23C4807D8();

  }
  sub_23C48085C();
  v24 = v13[1];
  v36 = *v13;
  v37 = v24;
  sub_23C469C00((uint64_t)&v36, (uint64_t)v39);
  v38 = *((_QWORD *)&v37 + 1);
  v34 = *((_QWORD *)v13 + 4);
  v35 = *((_BYTE *)v13 + 40);
  v25 = v13[1];
  *a9 = *v13;
  a9[1] = v25;
  *(_OWORD *)((char *)a9 + 25) = *(__int128 *)((char *)v13 + 25);
  a9[8] = v32;
  a9[9] = v33;
  a9[3] = v27;
  a9[4] = v28;
  a9[6] = v30;
  a9[7] = v31;
  a9[5] = v29;
  sub_23C469C3C((uint64_t)v39);
  sub_23C469C6C((uint64_t)&v38);
  return sub_23C469C94((uint64_t)&v34);
}

uint64_t sub_23C4679D4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t result;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  char v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  char v53;
  uint64_t KeyPath;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[2];
  void *v64;
  uint64_t v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint64_t v76;
  uint64_t v77;
  char v78;
  uint64_t v79;
  uint64_t v80;
  char v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _OWORD v91[9];
  _OWORD v92[10];
  _OWORD v93[19];
  _OWORD v94[10];
  _OWORD v95[10];

  v64 = a2;
  v3 = sub_23C4807A8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v63 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23C480B98();
  MEMORY[0x24BDAC7A8](v7);
  sub_23C480B38();
  if (qword_256BA7110 != -1)
    swift_once();
  v8 = (void *)qword_256BADA90;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  v9 = v8;
  *(_QWORD *)&v93[0] = sub_23C480BB0();
  *((_QWORD *)&v93[0] + 1) = v10;
  v63[1] = sub_23C468EE0();
  v11 = sub_23C480964();
  v13 = v12;
  v65 = a1;
  v15 = v14 & 1;
  sub_23C480934();
  v16 = sub_23C480958();
  v18 = v17;
  v20 = v19;
  swift_release();
  sub_23C468E50(v11, v13, v15);
  swift_bridgeObjectRelease();
  LODWORD(v93[0]) = sub_23C4808EC();
  v21 = sub_23C48094C();
  v23 = v22;
  v25 = v24;
  v27 = v26 & 1;
  sub_23C468E50(v16, v18, v20 & 1);
  swift_bridgeObjectRelease();
  v28 = sub_23C480ACC();
  sub_23C46761C(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v93, 0.0, 1, 0.0, 1, v28, v29, v21, v23, v27, v25);
  sub_23C468E50(v21, v23, v27);
  v30 = v65;
  swift_bridgeObjectRelease();
  v88 = v93[6];
  v89 = v93[7];
  v90 = v93[8];
  v84 = v93[2];
  v85 = v93[3];
  v86 = v93[4];
  v87 = v93[5];
  v82 = v93[0];
  v83 = v93[1];
  v31 = v30 + *(int *)(type metadata accessor for RepeatReplaceAlertDetailView() + 20);
  result = type metadata accessor for PreviousPlanDetail();
  v33 = *(_QWORD **)(v31 + *(int *)(result + 44));
  v34 = v33[2];
  if (v34)
  {
    if (v34 != 1)
    {
      *(_QWORD *)&v93[0] = sub_23C465C54(v33[4], v33[5]);
      *((_QWORD *)&v93[0] + 1) = v35;
      v36 = sub_23C480964();
      v38 = v37;
      v40 = v39 & 1;
      sub_23C480934();
      v41 = sub_23C480958();
      v43 = v42;
      v45 = v44;
      swift_release();
      v46 = v45 & 1;
      sub_23C468E50(v36, v38, v40);
      swift_bridgeObjectRelease();
      LODWORD(v93[0]) = sub_23C4808F8();
      v47 = sub_23C48094C();
      v49 = v48;
      v51 = v50;
      v53 = v52 & 1;
      sub_23C468E50(v41, v43, v46);
      swift_bridgeObjectRelease();
      KeyPath = swift_getKeyPath();
      v76 = v47;
      v77 = v49;
      v78 = v53;
      v79 = v51;
      v80 = KeyPath;
      v81 = 2;
      sub_23C480AD8();
      sub_23C4677FC(262.0, 0, 0.0, 1, 0.0, 1, 0.0, 1, v93, 0.0, 1, 0.0, 1);
      sub_23C468E50(v47, v49, v53);
      swift_release();
      swift_bridgeObjectRelease();
      v72 = v93[6];
      v73 = v93[7];
      v74 = v93[8];
      v75 = v93[9];
      v68 = v93[2];
      v69 = v93[3];
      v70 = v93[4];
      v71 = v93[5];
      v66 = v93[0];
      v67 = v93[1];
      v91[6] = v88;
      v91[7] = v89;
      v91[8] = v90;
      v91[2] = v84;
      v91[3] = v85;
      v91[4] = v86;
      v91[5] = v87;
      v91[0] = v82;
      v91[1] = v83;
      v55 = v93[6];
      v56 = v93[7];
      v92[6] = v93[6];
      v92[7] = v93[7];
      v92[8] = v93[8];
      v92[9] = v93[9];
      v57 = v93[2];
      v58 = v93[3];
      v92[2] = v93[2];
      v92[3] = v93[3];
      v59 = v93[4];
      v60 = v93[5];
      v92[4] = v93[4];
      v92[5] = v93[5];
      v61 = v93[0];
      v62 = v93[1];
      v92[0] = v93[0];
      v92[1] = v93[1];
      v93[6] = v88;
      v93[7] = v89;
      v93[2] = v84;
      v93[3] = v85;
      v93[4] = v86;
      v93[5] = v87;
      v93[0] = v82;
      v93[1] = v83;
      v93[16] = v56;
      v93[17] = v93[8];
      v93[18] = v93[9];
      v93[12] = v58;
      v93[13] = v59;
      v93[14] = v60;
      v93[15] = v55;
      v93[8] = v90;
      v93[9] = v61;
      v93[10] = v62;
      v93[11] = v57;
      memcpy(v64, v93, 0x130uLL);
      v94[6] = v72;
      v94[7] = v73;
      v94[8] = v74;
      v94[9] = v75;
      v94[2] = v68;
      v94[3] = v69;
      v94[4] = v70;
      v94[5] = v71;
      v94[0] = v66;
      v94[1] = v67;
      sub_23C469AF0((uint64_t)v91);
      sub_23C469B2C((uint64_t)v92);
      sub_23C469B78((uint64_t)v94);
      v95[6] = v88;
      v95[7] = v89;
      v95[8] = v90;
      v95[2] = v84;
      v95[3] = v85;
      v95[4] = v86;
      v95[5] = v87;
      v95[0] = v82;
      v95[1] = v83;
      return sub_23C469BC4((uint64_t)v95);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_23C467FA0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
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
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  uint64_t KeyPath;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  char *v68;
  void (*v69)(char *, uint64_t, uint64_t);
  unint64_t v70;
  void *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  uint64_t v82;
  uint64_t v83;
  char v84;
  uint64_t v85;
  uint64_t v86;
  char v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _OWORD v97[9];
  _OWORD v98[10];
  _OWORD v99[19];
  _OWORD v100[10];
  _OWORD v101[10];

  v71 = a2;
  v3 = sub_23C4807A8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v64 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23C480B98();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v64 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23C480B38();
  if (qword_256BA7110 != -1)
    swift_once();
  v10 = (void *)qword_256BADA90;
  v69 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v69(v6, a1, v3);
  v11 = v10;
  *(_QWORD *)&v99[0] = sub_23C480BB0();
  *((_QWORD *)&v99[0] + 1) = v12;
  v70 = sub_23C468EE0();
  v13 = sub_23C480964();
  v15 = v14;
  v17 = v16 & 1;
  sub_23C480934();
  v68 = v9;
  v18 = sub_23C480958();
  v66 = v3;
  v67 = v6;
  v19 = v18;
  v65 = a1;
  v21 = v20;
  v23 = v22;
  swift_release();
  sub_23C468E50(v13, v15, v17);
  swift_bridgeObjectRelease();
  LODWORD(v99[0]) = sub_23C4808EC();
  v24 = sub_23C48094C();
  v26 = v25;
  v28 = v27;
  LOBYTE(v13) = v29 & 1;
  sub_23C468E50(v19, v21, v23 & 1);
  swift_bridgeObjectRelease();
  v30 = sub_23C480ACC();
  sub_23C46761C(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v99, 0.0, 1, 0.0, 1, v30, v31, v24, v26, v13, v28);
  sub_23C468E50(v24, v26, v13);
  swift_bridgeObjectRelease();
  v94 = v99[6];
  v95 = v99[7];
  v96 = v99[8];
  v90 = v99[2];
  v91 = v99[3];
  v92 = v99[4];
  v93 = v99[5];
  v88 = v99[0];
  v89 = v99[1];
  v32 = type metadata accessor for RepeatReplaceAlertDetailView();
  v33 = v65;
  v34 = v65 + *(int *)(v32 + 20);
  *(_QWORD *)&v99[0] = *(_QWORD *)(v34 + *(int *)(type metadata accessor for PreviousPlanDetail() + 52));
  sub_23C480B38();
  v35 = (void *)qword_256BADA90;
  v69(v67, v33, v66);
  v36 = v35;
  sub_23C480BB0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256BA74A8);
  sub_23C469CBC(&qword_256BA74B0, &qword_256BA74A8, MEMORY[0x24BEE12B0]);
  v37 = sub_23C480B2C();
  v39 = v38;
  swift_bridgeObjectRelease();
  *(_QWORD *)&v99[0] = v37;
  *((_QWORD *)&v99[0] + 1) = v39;
  v40 = sub_23C480964();
  v42 = v41;
  LOBYTE(v33) = v43 & 1;
  sub_23C480934();
  v44 = sub_23C480958();
  v46 = v45;
  LOBYTE(v28) = v47;
  swift_release();
  sub_23C468E50(v40, v42, v33);
  swift_bridgeObjectRelease();
  LODWORD(v99[0]) = sub_23C4808F8();
  v48 = sub_23C48094C();
  v50 = v49;
  v52 = v51;
  LOBYTE(v42) = v53 & 1;
  sub_23C468E50(v44, v46, v28 & 1);
  swift_bridgeObjectRelease();
  KeyPath = swift_getKeyPath();
  v82 = v48;
  v83 = v50;
  v84 = v42;
  v85 = v52;
  v86 = KeyPath;
  v87 = 2;
  sub_23C480AD8();
  sub_23C4677FC(262.0, 0, 0.0, 1, 0.0, 1, 0.0, 1, v99, 0.0, 1, 0.0, 1);
  sub_23C468E50(v48, v50, v42);
  swift_release();
  swift_bridgeObjectRelease();
  v78 = v99[6];
  v79 = v99[7];
  v80 = v99[8];
  v81 = v99[9];
  v74 = v99[2];
  v75 = v99[3];
  v76 = v99[4];
  v77 = v99[5];
  v72 = v99[0];
  v73 = v99[1];
  v97[6] = v94;
  v97[7] = v95;
  v97[8] = v96;
  v97[2] = v90;
  v97[3] = v91;
  v97[4] = v92;
  v97[5] = v93;
  v97[0] = v88;
  v97[1] = v89;
  v55 = v99[6];
  v56 = v99[7];
  v98[6] = v99[6];
  v98[7] = v99[7];
  v98[8] = v99[8];
  v98[9] = v99[9];
  v57 = v99[2];
  v58 = v99[3];
  v98[2] = v99[2];
  v98[3] = v99[3];
  v59 = v99[4];
  v60 = v99[5];
  v98[4] = v99[4];
  v98[5] = v99[5];
  v61 = v99[0];
  v62 = v99[1];
  v98[0] = v99[0];
  v98[1] = v99[1];
  v99[6] = v94;
  v99[7] = v95;
  v99[2] = v90;
  v99[3] = v91;
  v99[4] = v92;
  v99[5] = v93;
  v99[0] = v88;
  v99[1] = v89;
  v99[15] = v55;
  v99[16] = v56;
  v99[17] = v99[8];
  v99[18] = v99[9];
  v99[12] = v58;
  v99[13] = v59;
  v99[14] = v60;
  v99[8] = v96;
  v99[9] = v61;
  v99[10] = v62;
  v99[11] = v57;
  memcpy(v71, v99, 0x130uLL);
  v100[6] = v78;
  v100[7] = v79;
  v100[8] = v80;
  v100[9] = v81;
  v100[2] = v74;
  v100[3] = v75;
  v100[4] = v76;
  v100[5] = v77;
  v100[0] = v72;
  v100[1] = v73;
  sub_23C469AF0((uint64_t)v97);
  sub_23C469B2C((uint64_t)v98);
  sub_23C469B78((uint64_t)v100);
  v101[6] = v94;
  v101[7] = v95;
  v101[8] = v96;
  v101[2] = v90;
  v101[3] = v91;
  v101[4] = v92;
  v101[5] = v93;
  v101[0] = v88;
  v101[1] = v89;
  return sub_23C469BC4((uint64_t)v101);
}

uint64_t sub_23C468614@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  uint64_t KeyPath;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v65[2];
  char *v66;
  uint64_t v67;
  unint64_t v68;
  void (*v69)(char *, uint64_t, uint64_t);
  char *v70;
  void *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  uint64_t v82;
  uint64_t v83;
  char v84;
  uint64_t v85;
  uint64_t v86;
  char v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _OWORD v97[9];
  _OWORD v98[10];
  _OWORD v99[19];
  _OWORD v100[10];
  _OWORD v101[10];

  v71 = a2;
  v3 = sub_23C480B80();
  MEMORY[0x24BDAC7A8](v3);
  v70 = (char *)v65 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23C4807A8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v65 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23C480B98();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v65 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23C480B38();
  if (qword_256BA7110 != -1)
    swift_once();
  v12 = (void *)qword_256BADA90;
  v69 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v69(v8, a1, v5);
  v13 = v12;
  *(_QWORD *)&v99[0] = sub_23C480BB0();
  *((_QWORD *)&v99[0] + 1) = v14;
  v68 = sub_23C468EE0();
  v15 = sub_23C480964();
  v17 = v16;
  v19 = v18 & 1;
  sub_23C480934();
  v65[0] = a1;
  v20 = sub_23C480958();
  v66 = v8;
  v67 = v5;
  v21 = v20;
  v23 = v22;
  v65[1] = v11;
  v25 = v24;
  swift_release();
  v26 = v25 & 1;
  sub_23C468E50(v15, v17, v19);
  swift_bridgeObjectRelease();
  LODWORD(v99[0]) = sub_23C4808EC();
  v27 = sub_23C48094C();
  v29 = v28;
  v31 = v30;
  LOBYTE(v15) = v32 & 1;
  sub_23C468E50(v21, v23, v26);
  swift_bridgeObjectRelease();
  v33 = sub_23C480ACC();
  sub_23C46761C(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v99, 0.0, 1, 0.0, 1, v33, v34, v27, v29, v15, v31);
  sub_23C468E50(v27, v29, v15);
  swift_bridgeObjectRelease();
  v94 = v99[6];
  v95 = v99[7];
  v96 = v99[8];
  v90 = v99[2];
  v91 = v99[3];
  v92 = v99[4];
  v93 = v99[5];
  v88 = v99[0];
  v89 = v99[1];
  sub_23C480B74();
  sub_23C480B68();
  v35 = type metadata accessor for RepeatReplaceAlertDetailView();
  v36 = v65[0];
  v37 = v65[0] + *(int *)(v35 + 20);
  *(_QWORD *)&v99[0] = *(_QWORD *)(v37 + *(int *)(type metadata accessor for PreviousPlanDetail() + 36));
  sub_23C480B50();
  sub_23C480B68();
  sub_23C480B8C();
  v38 = (void *)qword_256BADA90;
  v69(v66, v36, v67);
  v39 = v38;
  *(_QWORD *)&v99[0] = sub_23C480BB0();
  *((_QWORD *)&v99[0] + 1) = v40;
  v41 = sub_23C480964();
  v43 = v42;
  LOBYTE(v36) = v44 & 1;
  sub_23C480934();
  v45 = sub_23C480958();
  v47 = v46;
  LOBYTE(v15) = v48;
  swift_release();
  LOBYTE(v21) = v15 & 1;
  sub_23C468E50(v41, v43, v36);
  swift_bridgeObjectRelease();
  LODWORD(v99[0]) = sub_23C4808F8();
  v49 = sub_23C48094C();
  v51 = v50;
  v53 = v52;
  LOBYTE(v15) = v54 & 1;
  sub_23C468E50(v45, v47, v21);
  swift_bridgeObjectRelease();
  KeyPath = swift_getKeyPath();
  v82 = v49;
  v83 = v51;
  v84 = v15;
  v85 = v53;
  v86 = KeyPath;
  v87 = 2;
  sub_23C480AD8();
  sub_23C4677FC(262.0, 0, 0.0, 1, 0.0, 1, 0.0, 1, v99, 0.0, 1, 0.0, 1);
  sub_23C468E50(v49, v51, v15);
  swift_release();
  swift_bridgeObjectRelease();
  v78 = v99[6];
  v79 = v99[7];
  v80 = v99[8];
  v81 = v99[9];
  v74 = v99[2];
  v75 = v99[3];
  v76 = v99[4];
  v77 = v99[5];
  v72 = v99[0];
  v73 = v99[1];
  v97[6] = v94;
  v97[7] = v95;
  v97[8] = v96;
  v97[2] = v90;
  v97[3] = v91;
  v97[4] = v92;
  v97[5] = v93;
  v97[0] = v88;
  v97[1] = v89;
  v56 = v99[6];
  v57 = v99[7];
  v98[6] = v99[6];
  v98[7] = v99[7];
  v98[8] = v99[8];
  v98[9] = v99[9];
  v58 = v99[2];
  v59 = v99[3];
  v98[2] = v99[2];
  v98[3] = v99[3];
  v60 = v99[4];
  v61 = v99[5];
  v98[4] = v99[4];
  v98[5] = v99[5];
  v62 = v99[0];
  v63 = v99[1];
  v98[0] = v99[0];
  v98[1] = v99[1];
  v99[6] = v94;
  v99[7] = v95;
  v99[2] = v90;
  v99[3] = v91;
  v99[4] = v92;
  v99[5] = v93;
  v99[0] = v88;
  v99[1] = v89;
  v99[15] = v56;
  v99[16] = v57;
  v99[17] = v99[8];
  v99[18] = v99[9];
  v99[12] = v59;
  v99[13] = v60;
  v99[14] = v61;
  v99[8] = v96;
  v99[9] = v62;
  v99[10] = v63;
  v99[11] = v58;
  memcpy(v71, v99, 0x130uLL);
  v100[6] = v78;
  v100[7] = v79;
  v100[8] = v80;
  v100[9] = v81;
  v100[2] = v74;
  v100[3] = v75;
  v100[4] = v76;
  v100[5] = v77;
  v100[0] = v72;
  v100[1] = v73;
  sub_23C469AF0((uint64_t)v97);
  sub_23C469B2C((uint64_t)v98);
  sub_23C469B78((uint64_t)v100);
  v101[6] = v94;
  v101[7] = v95;
  v101[8] = v96;
  v101[2] = v90;
  v101[3] = v91;
  v101[4] = v92;
  v101[5] = v93;
  v101[0] = v88;
  v101[1] = v89;
  return sub_23C469BC4((uint64_t)v101);
}

uint64_t sub_23C468CC0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  v2 = *(_QWORD *)(a1 + 168);
  v3 = *(_QWORD *)(a1 + 176);
  v4 = *(_BYTE *)(a1 + 184);
  sub_23C468D40(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  swift_bridgeObjectRetain();
  sub_23C468D40(v2, v3, v4);
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t sub_23C468D40(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_23C468D50(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  v2 = *(_QWORD *)(a1 + 144);
  v3 = *(_QWORD *)(a1 + 152);
  v4 = *(_BYTE *)(a1 + 160);
  sub_23C468D40(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_bridgeObjectRetain();
  sub_23C468D40(v2, v3, v4);
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t sub_23C468DD0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  v2 = *(_QWORD *)(a1 + 144);
  v3 = *(_QWORD *)(a1 + 152);
  v4 = *(_BYTE *)(a1 + 160);
  sub_23C468E50(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_bridgeObjectRelease();
  sub_23C468E50(v2, v3, v4);
  swift_release();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_23C468E50(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t sub_23C468E60(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  v2 = *(_QWORD *)(a1 + 168);
  v3 = *(_QWORD *)(a1 + 176);
  v4 = *(_BYTE *)(a1 + 184);
  sub_23C468E50(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  swift_bridgeObjectRelease();
  sub_23C468E50(v2, v3, v4);
  swift_release();
  swift_bridgeObjectRelease();
  return a1;
}

unint64_t sub_23C468EE0()
{
  unint64_t result;

  result = qword_256BA74A0;
  if (!qword_256BA74A0)
  {
    result = MEMORY[0x24261FFB0](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_256BA74A0);
  }
  return result;
}

uint64_t sub_23C468F24(char **a1)
{
  char *v2;
  uint64_t v3;
  uint64_t result;
  _QWORD v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23C469D04((uint64_t)v2);
  v3 = *((_QWORD *)v2 + 2);
  v5[0] = v2 + 32;
  v5[1] = v3;
  result = sub_23C468F8C(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_23C468F8C(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  _BYTE *v21;
  unsigned int v22;
  uint64_t v23;
  _BYTE *v24;
  unsigned int v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  BOOL v41;
  unint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  BOOL v51;
  uint64_t v52;
  char v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  BOOL v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD *v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t i;
  unsigned int v79;
  uint64_t v80;
  unsigned int v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  _QWORD *v88;
  unint64_t v89;
  _QWORD *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unsigned __int8 *v95;

  v2 = a1;
  v3 = a1[1];
  result = sub_23C480D48();
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_138;
    if ((unint64_t)v3 >= 2)
    {
      v76 = 0;
      v77 = *v2;
      for (i = 1; i != v3; ++i)
      {
        v79 = *(unsigned __int8 *)(v77 + i);
        v80 = v76;
        do
        {
          v81 = *(unsigned __int8 *)(v77 + v80);
          if (v79 >= v81)
            break;
          if (!v77)
            goto LABEL_142;
          *(_BYTE *)(v77 + v80 + 1) = v81;
          *(_BYTE *)(v77 + v80--) = v79;
        }
        while (v80 != -1);
        ++v76;
      }
    }
  }
  else
  {
    if (v3 >= 0)
      v5 = v3;
    else
      v5 = v3 + 1;
    if (v3 < -1)
      goto LABEL_137;
    v92 = result;
    v93 = v3;
    if (v3 > 1)
    {
      v6 = v5 >> 1;
      result = sub_23C480BEC();
      *(_QWORD *)(result + 16) = v6;
      v3 = v93;
      v91 = result;
      v95 = (unsigned __int8 *)(result + 32);
LABEL_13:
      v8 = 0;
      v90 = v2;
      v9 = *v2;
      v10 = MEMORY[0x24BEE4AF8];
      v94 = *v2;
      while (1)
      {
        v12 = v8++;
        if (v8 < v3)
        {
          v13 = *(unsigned __int8 *)(v9 + v8);
          v14 = *(unsigned __int8 *)(v9 + v12);
          v8 = v12 + 2;
          if (v12 + 2 < v3)
          {
            v15 = v13;
            while (1)
            {
              v16 = *(unsigned __int8 *)(v9 + v8);
              if (v13 < v14 == v16 >= v15)
                break;
              ++v8;
              v15 = v16;
              if (v3 == v8)
              {
                v8 = v3;
                break;
              }
            }
          }
          if (v13 < v14)
          {
            if (v8 < v12)
              goto LABEL_139;
            if (v12 < v8)
            {
              v17 = v8 - 1;
              v18 = v12;
              do
              {
                if (v18 != v17)
                {
                  if (!v9)
                    goto LABEL_145;
                  v19 = *(_BYTE *)(v9 + v18);
                  *(_BYTE *)(v9 + v18) = *(_BYTE *)(v9 + v17);
                  *(_BYTE *)(v9 + v17) = v19;
                }
                v58 = ++v18 < v17--;
              }
              while (v58);
            }
          }
        }
        if (v8 < v3)
        {
          if (__OFSUB__(v8, v12))
            goto LABEL_136;
          if (v8 - v12 < v92)
          {
            v20 = v12 + v92;
            if (__OFADD__(v12, v92))
              goto LABEL_140;
            if (v20 >= v3)
              v20 = v3;
            if (v20 < v12)
            {
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
              return result;
            }
            if (v8 != v20)
            {
              v21 = (_BYTE *)(v9 + v8);
              do
              {
                v22 = *(unsigned __int8 *)(v9 + v8);
                v23 = v12;
                v24 = v21;
                do
                {
                  v25 = *(v24 - 1);
                  if (v22 >= v25)
                    break;
                  if (!v9)
                    goto LABEL_143;
                  *v24 = v25;
                  *--v24 = v22;
                  ++v23;
                }
                while (v8 != v23);
                ++v8;
                ++v21;
              }
              while (v8 != v20);
              v8 = v20;
            }
          }
        }
        if (v8 < v12)
          goto LABEL_131;
        result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          result = (uint64_t)sub_23C469794(0, *(_QWORD *)(v10 + 16) + 1, 1, (char *)v10);
          v10 = result;
        }
        v27 = *(_QWORD *)(v10 + 16);
        v26 = *(_QWORD *)(v10 + 24);
        v11 = v27 + 1;
        v9 = v94;
        if (v27 >= v26 >> 1)
        {
          result = (uint64_t)sub_23C469794((char *)(v26 > 1), v27 + 1, 1, (char *)v10);
          v9 = v94;
          v10 = result;
        }
        *(_QWORD *)(v10 + 16) = v11;
        v28 = v10 + 32;
        v29 = (uint64_t *)(v10 + 32 + 16 * v27);
        *v29 = v12;
        v29[1] = v8;
        if (v27)
        {
          while (1)
          {
            v30 = v11 - 1;
            if (v11 >= 4)
            {
              v35 = v28 + 16 * v11;
              v36 = *(_QWORD *)(v35 - 64);
              v37 = *(_QWORD *)(v35 - 56);
              v41 = __OFSUB__(v37, v36);
              v38 = v37 - v36;
              if (v41)
                goto LABEL_120;
              v40 = *(_QWORD *)(v35 - 48);
              v39 = *(_QWORD *)(v35 - 40);
              v41 = __OFSUB__(v39, v40);
              v33 = v39 - v40;
              v34 = v41;
              if (v41)
                goto LABEL_121;
              v42 = v11 - 2;
              v43 = (uint64_t *)(v28 + 16 * (v11 - 2));
              v45 = *v43;
              v44 = v43[1];
              v41 = __OFSUB__(v44, v45);
              v46 = v44 - v45;
              if (v41)
                goto LABEL_122;
              v41 = __OFADD__(v33, v46);
              v47 = v33 + v46;
              if (v41)
                goto LABEL_124;
              if (v47 >= v38)
              {
                v65 = (uint64_t *)(v28 + 16 * v30);
                v67 = *v65;
                v66 = v65[1];
                v41 = __OFSUB__(v66, v67);
                v68 = v66 - v67;
                if (v41)
                  goto LABEL_130;
                v58 = v33 < v68;
                goto LABEL_84;
              }
            }
            else
            {
              if (v11 != 3)
              {
                v59 = *(_QWORD *)(v10 + 32);
                v60 = *(_QWORD *)(v10 + 40);
                v41 = __OFSUB__(v60, v59);
                v52 = v60 - v59;
                v53 = v41;
                goto LABEL_78;
              }
              v32 = *(_QWORD *)(v10 + 32);
              v31 = *(_QWORD *)(v10 + 40);
              v41 = __OFSUB__(v31, v32);
              v33 = v31 - v32;
              v34 = v41;
            }
            if ((v34 & 1) != 0)
              goto LABEL_123;
            v42 = v11 - 2;
            v48 = (uint64_t *)(v28 + 16 * (v11 - 2));
            v50 = *v48;
            v49 = v48[1];
            v51 = __OFSUB__(v49, v50);
            v52 = v49 - v50;
            v53 = v51;
            if (v51)
              goto LABEL_125;
            v54 = (uint64_t *)(v28 + 16 * v30);
            v56 = *v54;
            v55 = v54[1];
            v41 = __OFSUB__(v55, v56);
            v57 = v55 - v56;
            if (v41)
              goto LABEL_127;
            if (__OFADD__(v52, v57))
              goto LABEL_129;
            if (v52 + v57 >= v33)
            {
              v58 = v33 < v57;
LABEL_84:
              if (v58)
                v30 = v42;
              goto LABEL_86;
            }
LABEL_78:
            if ((v53 & 1) != 0)
              goto LABEL_126;
            v61 = (uint64_t *)(v28 + 16 * v30);
            v63 = *v61;
            v62 = v61[1];
            v41 = __OFSUB__(v62, v63);
            v64 = v62 - v63;
            if (v41)
              goto LABEL_128;
            if (v64 < v52)
              goto LABEL_15;
LABEL_86:
            v69 = v30 - 1;
            if (v30 - 1 >= v11)
            {
              __break(1u);
LABEL_117:
              __break(1u);
LABEL_118:
              __break(1u);
LABEL_119:
              __break(1u);
LABEL_120:
              __break(1u);
LABEL_121:
              __break(1u);
LABEL_122:
              __break(1u);
LABEL_123:
              __break(1u);
LABEL_124:
              __break(1u);
LABEL_125:
              __break(1u);
LABEL_126:
              __break(1u);
LABEL_127:
              __break(1u);
LABEL_128:
              __break(1u);
LABEL_129:
              __break(1u);
LABEL_130:
              __break(1u);
LABEL_131:
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
              goto LABEL_141;
            }
            if (!v9)
              goto LABEL_144;
            v70 = (uint64_t *)(v28 + 16 * v69);
            v71 = *v70;
            v72 = v28;
            v73 = (_QWORD *)(v28 + 16 * v30);
            v74 = v73[1];
            result = sub_23C4695C0((unsigned __int8 *)(v9 + *v70), (unsigned __int8 *)(v9 + *v73), v9 + v74, v95);
            if (v1)
              goto LABEL_114;
            if (v74 < v71)
              goto LABEL_117;
            if (v30 > *(_QWORD *)(v10 + 16))
              goto LABEL_118;
            *v70 = v71;
            *(_QWORD *)(v72 + 16 * v69 + 8) = v74;
            v75 = *(_QWORD *)(v10 + 16);
            if (v30 >= v75)
              goto LABEL_119;
            v11 = v75 - 1;
            result = (uint64_t)memmove(v73, v73 + 2, 16 * (v75 - 1 - v30));
            v28 = v72;
            *(_QWORD *)(v10 + 16) = v75 - 1;
            v9 = v94;
            if (v75 <= 2)
              goto LABEL_15;
          }
        }
        v11 = 1;
LABEL_15:
        v3 = v93;
        if (v8 >= v93)
        {
          v2 = v90;
          v7 = v91;
          goto LABEL_103;
        }
      }
    }
    v7 = MEMORY[0x24BEE4AF8];
    v95 = (unsigned __int8 *)(MEMORY[0x24BEE4AF8] + 32);
    if (v3 == 1)
    {
      v91 = MEMORY[0x24BEE4AF8];
      goto LABEL_13;
    }
    v11 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
    v10 = MEMORY[0x24BEE4AF8];
LABEL_103:
    v91 = v7;
    if (v11 >= 2)
    {
      v82 = *v2;
      do
      {
        v83 = v11 - 2;
        if (v11 < 2)
          goto LABEL_132;
        if (!v82)
          goto LABEL_146;
        v84 = v10;
        v85 = v10 + 32;
        v86 = *(_QWORD *)(v10 + 32 + 16 * v83);
        v87 = *(_QWORD *)(v10 + 32 + 16 * (v11 - 1) + 8);
        result = sub_23C4695C0((unsigned __int8 *)(v82 + v86), (unsigned __int8 *)(v82 + *(_QWORD *)(v85 + 16 * (v11 - 1))), v82 + v87, v95);
        if (v1)
          break;
        if (v87 < v86)
          goto LABEL_133;
        result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          result = (uint64_t)sub_23C46988C(v84);
          v84 = result;
        }
        if (v83 >= *(_QWORD *)(v84 + 16))
          goto LABEL_134;
        v88 = (_QWORD *)(v84 + 32 + 16 * v83);
        *v88 = v86;
        v88[1] = v87;
        v89 = *(_QWORD *)(v84 + 16);
        if (v11 > v89)
          goto LABEL_135;
        result = (uint64_t)memmove((void *)(v84 + 32 + 16 * (v11 - 1)), (const void *)(v84 + 32 + 16 * v11), 16 * (v89 - v11));
        v10 = v84;
        *(_QWORD *)(v84 + 16) = v89 - 1;
        v11 = v89 - 1;
      }
      while (v89 > 2);
    }
LABEL_114:
    swift_bridgeObjectRelease();
    *(_QWORD *)(v91 + 16) = 0;
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_23C4695C0(unsigned __int8 *__dst, unsigned __int8 *__src, unint64_t a3, unsigned __int8 *a4)
{
  unsigned __int8 *v4;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  int64_t v8;
  uint64_t v9;
  unsigned __int8 *v10;
  unsigned int v11;
  BOOL v12;
  unsigned __int8 *v13;
  unsigned __int8 *v14;
  unsigned __int8 *v15;
  unsigned __int8 v16;
  unsigned int v17;

  v4 = a4;
  v6 = __src;
  v7 = __dst;
  v8 = __src - __dst;
  v9 = a3 - (_QWORD)__src;
  if (__src - __dst < (uint64_t)(a3 - (_QWORD)__src))
  {
    if (a4 != __dst || __src <= a4)
      memmove(a4, __dst, v8);
    v10 = &v4[v8];
    if ((unint64_t)v6 >= a3 || v8 < 1)
    {
LABEL_15:
      v6 = v7;
      if (v7 != v4)
        goto LABEL_38;
      goto LABEL_37;
    }
    while (1)
    {
      v11 = *v6;
      if (v11 >= *v4)
        break;
      v12 = v7 == v6++;
      if (!v12)
        goto LABEL_12;
LABEL_13:
      ++v7;
      if (v4 >= v10 || (unint64_t)v6 >= a3)
        goto LABEL_15;
    }
    LOBYTE(v11) = *v4;
    v12 = v7 == v4++;
    if (v12)
      goto LABEL_13;
LABEL_12:
    *v7 = v11;
    goto LABEL_13;
  }
  if (a4 != __src || a3 <= (unint64_t)a4)
    memmove(a4, __src, a3 - (_QWORD)__src);
  v10 = &v4[v9];
  if (v7 >= v6 || v9 < 1)
  {
LABEL_36:
    if (v6 != v4)
      goto LABEL_38;
    goto LABEL_37;
  }
  v13 = (unsigned __int8 *)(a3 - 1);
  v14 = v6;
  while (1)
  {
    v15 = v13 + 1;
    v17 = *--v14;
    v16 = v17;
    if (*(v10 - 1) >= v17)
    {
      v16 = *(v10 - 1);
      v14 = v6;
      if (v15 != v10)
      {
        --v10;
LABEL_32:
        *v13 = v16;
        goto LABEL_33;
      }
      if (v13 >= v10--)
        goto LABEL_32;
    }
    else if (v15 != v6 || v13 >= v6)
    {
      goto LABEL_32;
    }
LABEL_33:
    if (v14 <= v7)
      break;
    --v13;
    v6 = v14;
    if (v10 <= v4)
    {
      v6 = v14;
      goto LABEL_36;
    }
  }
  v6 = v14;
  if (v14 != v4)
  {
LABEL_38:
    memmove(v6, v4, v10 - v4);
    return 1;
  }
LABEL_37:
  if (v6 >= v10)
    goto LABEL_38;
  return 1;
}

char *sub_23C469794(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256BA74C0);
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

char *sub_23C46988C(uint64_t a1)
{
  return sub_23C469794(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

char *sub_23C4698A0(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_23C4698BC(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_23C4698BC(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256BA74B8);
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
  swift_release();
  return v10;
}

char *sub_23C4699BC(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256BA74C8);
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
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_release();
  return v10;
}

uint64_t sub_23C469AA4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23C480868();
  *a1 = result;
  return result;
}

uint64_t sub_23C469ACC()
{
  return sub_23C480874();
}

uint64_t sub_23C469AF0(uint64_t a1)
{
  sub_23C468D40(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_23C469B2C(uint64_t a1)
{
  sub_23C468D40(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t sub_23C469B78(uint64_t a1)
{
  sub_23C468E50(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_release();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_23C469BC4(uint64_t a1)
{
  sub_23C468E50(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_23C469C00(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BDF1EB8] - 8) + 32))(a2, a1);
  return a2;
}

uint64_t sub_23C469C3C(uint64_t a1)
{
  sub_23C468D40(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  return a1;
}

uint64_t sub_23C469C6C(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_23C469C94(uint64_t a1)
{
  swift_retain();
  return a1;
}

uint64_t sub_23C469CBC(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24261FFB0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23C469CFC(uint64_t a1, char a2)
{
  uint64_t v2;

  return sub_23C465B24(a1, a2, *(_QWORD *)(v2 + 16));
}

char *sub_23C469D04(uint64_t a1)
{
  return sub_23C4699BC(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_23C469D18(uint64_t a1, uint64_t (*a2)(uint64_t, _QWORD))
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v13;

  v13 = MEMORY[0x24BEE4AF8];
  sub_23C4698A0(0, 0, 0);
  v3 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (v3)
  {
    v4 = 0;
    do
    {
      v5 = a2(v4, *(unsigned __int8 *)(a1 + 32 + v4));
      v7 = v6;
      v9 = *(_QWORD *)(v13 + 16);
      v8 = *(_QWORD *)(v13 + 24);
      if (v9 >= v8 >> 1)
        sub_23C4698A0((char *)(v8 > 1), v9 + 1, 1);
      ++v4;
      *(_QWORD *)(v13 + 16) = v9 + 1;
      v10 = v13 + 16 * v9;
      *(_QWORD *)(v10 + 32) = v5;
      *(_QWORD *)(v10 + 40) = v7;
    }
    while (v3 != v4);
  }
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t CreateWorkoutPlanButtonEnvironment.init(navigateToPlanCreation:showWorkoutPlanCreationPrompt:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

uint64_t destroy for CreateWorkoutPlanButtonEnvironment()
{
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for CreateWorkoutPlanButtonEnvironment(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = v3;
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for CreateWorkoutPlanButtonEnvironment(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  swift_release();
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

_OWORD *assignWithTake for CreateWorkoutPlanButtonEnvironment(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CreateWorkoutPlanButtonEnvironment(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CreateWorkoutPlanButtonEnvironment(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CreateWorkoutPlanButtonEnvironment()
{
  return &type metadata for CreateWorkoutPlanButtonEnvironment;
}

uint64_t PreviousPlanLockupState.placeholderIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for PreviousPlanLockupState() + 20));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t type metadata accessor for PreviousPlanLockupState()
{
  uint64_t result;

  result = qword_256BA7568;
  if (!qword_256BA7568)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t PreviousPlanLockupState.loadState.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for PreviousPlanLockupState();
  return sub_23C46A830(v1 + *(int *)(v3 + 24), a1, (uint64_t (*)(_QWORD))type metadata accessor for PreviousPlanLockupLoadState);
}

uint64_t PreviousPlanLockupState.loadState.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for PreviousPlanLockupState() + 24);
  return sub_23C46A0C0(a1, v3);
}

uint64_t sub_23C46A0C0(uint64_t a1, uint64_t a2)
{
  uint64_t State;

  State = type metadata accessor for PreviousPlanLockupLoadState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(State - 8) + 40))(a2, a1, State);
  return a2;
}

uint64_t (*PreviousPlanLockupState.loadState.modify())()
{
  type metadata accessor for PreviousPlanLockupState();
  return nullsub_1;
}

uint64_t PreviousPlanLockupState.init(locale:placeholderIdentifier:loadState:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v10 = sub_23C4807A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(a5, a1, v10);
  v11 = type metadata accessor for PreviousPlanLockupState();
  v12 = (_QWORD *)(a5 + *(int *)(v11 + 20));
  *v12 = a2;
  v12[1] = a3;
  return sub_23C46A1A8(a4, a5 + *(int *)(v11 + 24));
}

uint64_t sub_23C46A1A8(uint64_t a1, uint64_t a2)
{
  uint64_t State;

  State = type metadata accessor for PreviousPlanLockupLoadState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(State - 8) + 32))(a2, a1, State);
  return a2;
}

uint64_t sub_23C46A1EC()
{
  _BYTE *v0;
  unint64_t v1;

  v1 = 0xD000000000000015;
  if (*v0 != 1)
    v1 = 0x7461745364616F6CLL;
  if (*v0)
    return v1;
  else
    return 0x656C61636F6CLL;
}

uint64_t sub_23C46A24C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C46BFBC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C46A270()
{
  sub_23C46A478();
  return sub_23C480DA8();
}

uint64_t sub_23C46A298()
{
  sub_23C46A478();
  return sub_23C480DB4();
}

uint64_t PreviousPlanLockupState.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA74D0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C46A478();
  sub_23C480D9C();
  v8[15] = 0;
  sub_23C4807A8();
  sub_23C46A7F0(&qword_256BA74E0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], MEMORY[0x24BDCEEC8]);
  sub_23C480D3C();
  if (!v1)
  {
    type metadata accessor for PreviousPlanLockupState();
    v8[14] = 1;
    sub_23C480D18();
    v8[13] = 2;
    type metadata accessor for PreviousPlanLockupLoadState();
    sub_23C46A7F0(&qword_256BA74E8, (uint64_t (*)(uint64_t))type metadata accessor for PreviousPlanLockupLoadState, (uint64_t)&protocol conformance descriptor for PreviousPlanLockupLoadState);
    sub_23C480D3C();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_23C46A478()
{
  unint64_t result;

  result = qword_256BA74D8;
  if (!qword_256BA74D8)
  {
    result = MEMORY[0x24261FFB0](&unk_23C482554, &type metadata for PreviousPlanLockupState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA74D8);
  }
  return result;
}

uint64_t PreviousPlanLockupState.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t State;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char v27;
  char v28;
  char v29;

  v19 = a2;
  State = type metadata accessor for PreviousPlanLockupLoadState();
  MEMORY[0x24BDAC7A8](State);
  v21 = (uint64_t)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = sub_23C4807A8();
  v4 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v22 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA74F0);
  v6 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for PreviousPlanLockupState();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C46A478();
  v25 = v8;
  v12 = v26;
  sub_23C480D90();
  if (v12)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v13 = v6;
  v29 = 0;
  sub_23C46A7F0(&qword_256BA74F8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], MEMORY[0x24BDCEEE8]);
  v14 = v22;
  sub_23C480CE8();
  v26 = v4;
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v11, v14, v24);
  v28 = 1;
  v15 = sub_23C480CC4();
  v16 = (uint64_t *)&v11[*(int *)(v9 + 20)];
  *v16 = v15;
  v16[1] = v17;
  v27 = 2;
  sub_23C46A7F0(&qword_256BA7500, (uint64_t (*)(uint64_t))type metadata accessor for PreviousPlanLockupLoadState, (uint64_t)&protocol conformance descriptor for PreviousPlanLockupLoadState);
  sub_23C480CE8();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v25, v23);
  sub_23C46A1A8(v21, (uint64_t)&v11[*(int *)(v9 + 24)]);
  sub_23C46A830((uint64_t)v11, v19, (uint64_t (*)(_QWORD))type metadata accessor for PreviousPlanLockupState);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_23C46B588((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for PreviousPlanLockupState);
}

uint64_t sub_23C46A7F0(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x24261FFB0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23C46A830(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23C46A874@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return PreviousPlanLockupState.init(from:)(a1, a2);
}

uint64_t sub_23C46A888(_QWORD *a1)
{
  return PreviousPlanLockupState.encode(to:)(a1);
}

uint64_t static PreviousPlanLockupState.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  BOOL v9;

  if ((MEMORY[0x24261F7AC]() & 1) != 0
    && ((v4 = type metadata accessor for PreviousPlanLockupState(),
         v5 = *(int *)(v4 + 20),
         v6 = *(_QWORD *)(a1 + v5),
         v7 = *(_QWORD *)(a1 + v5 + 8),
         v8 = (_QWORD *)(a2 + v5),
         v6 == *v8)
      ? (v9 = v7 == v8[1])
      : (v9 = 0),
        v9 || (sub_23C480D54() & 1) != 0))
  {
    return _s18FitnessWorkoutPlan08PreviousC15LockupLoadStateO2eeoiySbAC_ACtFZ_0(a1 + *(int *)(v4 + 24), a2 + *(int *)(v4 + 24));
  }
  else
  {
    return 0;
  }
}

uint64_t sub_23C46A924(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  BOOL v10;

  if ((MEMORY[0x24261F7AC]() & 1) != 0
    && ((v6 = *(int *)(a3 + 20),
         v7 = *(_QWORD *)(a1 + v6),
         v8 = *(_QWORD *)(a1 + v6 + 8),
         v9 = (_QWORD *)(a2 + v6),
         v7 == *v9)
      ? (v10 = v8 == v9[1])
      : (v10 = 0),
        v10 || (sub_23C480D54() & 1) != 0))
  {
    return _s18FitnessWorkoutPlan08PreviousC15LockupLoadStateO2eeoiySbAC_ACtFZ_0(a1 + *(int *)(a3 + 24), a2 + *(int *)(a3 + 24));
  }
  else
  {
    return 0;
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for PreviousPlanLockupState(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t State;
  uint64_t v18;
  int *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v30)(char *, char *, uint64_t);
  void (*v31)(char *, char *, uint64_t);
  char *v32;
  char *v33;
  char *v34;
  char *v35;
  uint64_t v36;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v18 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23C4807A8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = *(int *)(a3 + 24);
    v10 = (uint64_t *)((char *)a1 + v8);
    v11 = (uint64_t *)((char *)a2 + v8);
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
    v13 = (uint64_t *)((char *)a1 + v9);
    v14 = (uint64_t *)((char *)a2 + v9);
    swift_bridgeObjectRetain();
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7508);
    v16 = *(_QWORD *)(v15 - 8);
    if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v16 + 48))(v14, 2, v15))
    {
      State = type metadata accessor for PreviousPlanLockupLoadState();
      memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(State - 8) + 64));
    }
    else
    {
      v19 = (int *)type metadata accessor for PreviousPlanDetail();
      v20 = *((_QWORD *)v19 - 1);
      if ((*(unsigned int (**)(_QWORD *, uint64_t, int *))(v20 + 48))(v14, 1, v19))
      {
        memcpy(v13, v14, *(_QWORD *)(v16 + 64));
      }
      else
      {
        v36 = v20;
        v21 = v14[1];
        *v13 = *v14;
        v13[1] = v21;
        v22 = v14[3];
        v13[2] = v14[2];
        v13[3] = v22;
        v23 = v14[5];
        v13[4] = v14[4];
        v13[5] = v23;
        v24 = v14[7];
        v13[6] = v14[6];
        v13[7] = v24;
        v25 = v19[8];
        v32 = (char *)v14 + v25;
        v34 = (char *)v13 + v25;
        v26 = sub_23C48076C();
        v30 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v26 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v30(v34, v32, v26);
        *(_QWORD *)((char *)v13 + v19[9]) = *(_QWORD *)((char *)v14 + v19[9]);
        *(_QWORD *)((char *)v13 + v19[10]) = *(_QWORD *)((char *)v14 + v19[10]);
        *(_QWORD *)((char *)v13 + v19[11]) = *(_QWORD *)((char *)v14 + v19[11]);
        *((_BYTE *)v13 + v19[12]) = *((_BYTE *)v14 + v19[12]);
        *(_QWORD *)((char *)v13 + v19[13]) = *(_QWORD *)((char *)v14 + v19[13]);
        v27 = v19[14];
        v33 = (char *)v14 + v27;
        v35 = (char *)v13 + v27;
        v28 = sub_23C480790();
        v31 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v28 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v31(v35, v33, v28);
        *(_QWORD *)((char *)v13 + v19[15]) = *(_QWORD *)((char *)v14 + v19[15]);
        (*(void (**)(_QWORD *, _QWORD, uint64_t, int *))(v36 + 56))(v13, 0, 1, v19);
      }
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 2, v15);
    }
  }
  return a1;
}

uint64_t destroy for PreviousPlanLockupState(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = sub_23C4807A8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  swift_bridgeObjectRelease();
  v5 = a1 + *(int *)(a2 + 24);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7508);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 48))(v5, 2, v6);
  if (!(_DWORD)result)
  {
    v8 = type metadata accessor for PreviousPlanDetail();
    result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(v5, 1, v8);
    if (!(_DWORD)result)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v9 = v5 + *(int *)(v8 + 32);
      v10 = sub_23C48076C();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v11 = v5 + *(int *)(v8 + 56);
      v12 = sub_23C480790();
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
    }
  }
  return result;
}

uint64_t initializeWithCopy for PreviousPlanLockupState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t State;
  int *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v28)(char *, char *, uint64_t);
  void (*v29)(char *, char *, uint64_t);
  char *v30;
  char *v31;
  char *v32;
  char *v33;
  uint64_t v34;

  v6 = sub_23C4807A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(int *)(a3 + 24);
  v9 = (_QWORD *)(a1 + v7);
  v10 = (_QWORD *)(a2 + v7);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  v12 = (_QWORD *)(a1 + v8);
  v13 = (_QWORD *)(a2 + v8);
  swift_bridgeObjectRetain();
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7508);
  v15 = *(_QWORD *)(v14 - 8);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v15 + 48))(v13, 2, v14))
  {
    State = type metadata accessor for PreviousPlanLockupLoadState();
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(State - 8) + 64));
  }
  else
  {
    v17 = (int *)type metadata accessor for PreviousPlanDetail();
    v18 = *((_QWORD *)v17 - 1);
    if ((*(unsigned int (**)(_QWORD *, uint64_t, int *))(v18 + 48))(v13, 1, v17))
    {
      memcpy(v12, v13, *(_QWORD *)(v15 + 64));
    }
    else
    {
      v34 = v18;
      v19 = v13[1];
      *v12 = *v13;
      v12[1] = v19;
      v20 = v13[3];
      v12[2] = v13[2];
      v12[3] = v20;
      v21 = v13[5];
      v12[4] = v13[4];
      v12[5] = v21;
      v22 = v13[7];
      v12[6] = v13[6];
      v12[7] = v22;
      v23 = v17[8];
      v30 = (char *)v13 + v23;
      v32 = (char *)v12 + v23;
      v24 = sub_23C48076C();
      v28 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v28(v32, v30, v24);
      *(_QWORD *)((char *)v12 + v17[9]) = *(_QWORD *)((char *)v13 + v17[9]);
      *(_QWORD *)((char *)v12 + v17[10]) = *(_QWORD *)((char *)v13 + v17[10]);
      *(_QWORD *)((char *)v12 + v17[11]) = *(_QWORD *)((char *)v13 + v17[11]);
      *((_BYTE *)v12 + v17[12]) = *((_BYTE *)v13 + v17[12]);
      *(_QWORD *)((char *)v12 + v17[13]) = *(_QWORD *)((char *)v13 + v17[13]);
      v25 = v17[14];
      v31 = (char *)v13 + v25;
      v33 = (char *)v12 + v25;
      v26 = sub_23C480790();
      v29 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v26 - 8) + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v29(v33, v31, v26);
      *(_QWORD *)((char *)v12 + v17[15]) = *(_QWORD *)((char *)v13 + v17[15]);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, int *))(v34 + 56))(v12, 0, 1, v17);
    }
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 2, v14);
  }
  return a1;
}

uint64_t assignWithCopy for PreviousPlanLockupState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(_QWORD *, uint64_t, uint64_t);
  int v16;
  int v17;
  int *v18;
  uint64_t v19;
  size_t v20;
  int *v21;
  uint64_t v22;
  uint64_t (*v23)(_QWORD *, uint64_t, int *);
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, char *, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  void (*v44)(char *, char *, uint64_t);
  void (*v45)(char *, char *, uint64_t);
  void (*v46)(char *, char *, uint64_t);
  char *v47;
  char *v48;
  char *v49;
  char *v50;
  char *v51;
  char *v52;
  char *v53;
  char *v54;

  v6 = sub_23C4807A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = *(int *)(a3 + 24);
  v11 = (_QWORD *)(a1 + v10);
  v12 = (_QWORD *)(a2 + v10);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7508);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v14 + 48);
  v16 = v15(v11, 2, v13);
  v17 = v15(v12, 2, v13);
  if (!v16)
  {
    if (!v17)
    {
      v21 = (int *)type metadata accessor for PreviousPlanDetail();
      v22 = *((_QWORD *)v21 - 1);
      v23 = *(uint64_t (**)(_QWORD *, uint64_t, int *))(v22 + 48);
      v24 = v23(v11, 1, v21);
      v25 = v23(v12, 1, v21);
      if (v24)
      {
        if (!v25)
        {
          *v11 = *v12;
          v11[1] = v12[1];
          v11[2] = v12[2];
          v11[3] = v12[3];
          v11[4] = v12[4];
          v11[5] = v12[5];
          v11[6] = v12[6];
          v11[7] = v12[7];
          v26 = v21[8];
          v49 = (char *)v12 + v26;
          v53 = (char *)v11 + v26;
          v27 = sub_23C48076C();
          v46 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v27 - 8) + 16);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v46(v53, v49, v27);
          *(_QWORD *)((char *)v11 + v21[9]) = *(_QWORD *)((char *)v12 + v21[9]);
          *(_QWORD *)((char *)v11 + v21[10]) = *(_QWORD *)((char *)v12 + v21[10]);
          *(_QWORD *)((char *)v11 + v21[11]) = *(_QWORD *)((char *)v12 + v21[11]);
          *((_BYTE *)v11 + v21[12]) = *((_BYTE *)v12 + v21[12]);
          *(_QWORD *)((char *)v11 + v21[13]) = *(_QWORD *)((char *)v12 + v21[13]);
          v28 = v21[14];
          v50 = (char *)v12 + v28;
          v54 = (char *)v11 + v28;
          v29 = sub_23C480790();
          v30 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v29 - 8) + 16);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v30(v54, v50, v29);
          *(_QWORD *)((char *)v11 + v21[15]) = *(_QWORD *)((char *)v12 + v21[15]);
          (*(void (**)(_QWORD *, _QWORD, uint64_t, int *))(v22 + 56))(v11, 0, 1, v21);
          return a1;
        }
      }
      else
      {
        if (!v25)
        {
          *v11 = *v12;
          v11[1] = v12[1];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          v11[2] = v12[2];
          v11[3] = v12[3];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          v11[4] = v12[4];
          v11[5] = v12[5];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          v11[6] = v12[6];
          v11[7] = v12[7];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          v36 = v21[8];
          v37 = (char *)v11 + v36;
          v38 = (char *)v12 + v36;
          v39 = sub_23C48076C();
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v39 - 8) + 24))(v37, v38, v39);
          *(_QWORD *)((char *)v11 + v21[9]) = *(_QWORD *)((char *)v12 + v21[9]);
          *(_QWORD *)((char *)v11 + v21[10]) = *(_QWORD *)((char *)v12 + v21[10]);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          *(_QWORD *)((char *)v11 + v21[11]) = *(_QWORD *)((char *)v12 + v21[11]);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          *((_BYTE *)v11 + v21[12]) = *((_BYTE *)v12 + v21[12]);
          *(_QWORD *)((char *)v11 + v21[13]) = *(_QWORD *)((char *)v12 + v21[13]);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          v40 = v21[14];
          v41 = (char *)v11 + v40;
          v42 = (char *)v12 + v40;
          v43 = sub_23C480790();
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v43 - 8) + 24))(v41, v42, v43);
          *(_QWORD *)((char *)v11 + v21[15]) = *(_QWORD *)((char *)v12 + v21[15]);
          return a1;
        }
        sub_23C46B588((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for PreviousPlanDetail);
      }
      v20 = *(_QWORD *)(v14 + 64);
      goto LABEL_8;
    }
    sub_23C46B5C4((uint64_t)v11);
LABEL_7:
    v20 = *(_QWORD *)(*(_QWORD *)(type metadata accessor for PreviousPlanLockupLoadState() - 8) + 64);
LABEL_8:
    memcpy(v11, v12, v20);
    return a1;
  }
  if (v17)
    goto LABEL_7;
  v18 = (int *)type metadata accessor for PreviousPlanDetail();
  v19 = *((_QWORD *)v18 - 1);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, int *))(v19 + 48))(v12, 1, v18))
  {
    memcpy(v11, v12, *(_QWORD *)(v14 + 64));
  }
  else
  {
    *v11 = *v12;
    v11[1] = v12[1];
    v11[2] = v12[2];
    v11[3] = v12[3];
    v11[4] = v12[4];
    v11[5] = v12[5];
    v11[6] = v12[6];
    v11[7] = v12[7];
    v31 = v18[8];
    v47 = (char *)v12 + v31;
    v51 = (char *)v11 + v31;
    v32 = sub_23C48076C();
    v44 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v32 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v44(v51, v47, v32);
    *(_QWORD *)((char *)v11 + v18[9]) = *(_QWORD *)((char *)v12 + v18[9]);
    *(_QWORD *)((char *)v11 + v18[10]) = *(_QWORD *)((char *)v12 + v18[10]);
    *(_QWORD *)((char *)v11 + v18[11]) = *(_QWORD *)((char *)v12 + v18[11]);
    *((_BYTE *)v11 + v18[12]) = *((_BYTE *)v12 + v18[12]);
    *(_QWORD *)((char *)v11 + v18[13]) = *(_QWORD *)((char *)v12 + v18[13]);
    v33 = v18[14];
    v48 = (char *)v12 + v33;
    v52 = (char *)v11 + v33;
    v34 = sub_23C480790();
    v45 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v34 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v45(v52, v48, v34);
    *(_QWORD *)((char *)v11 + v18[15]) = *(_QWORD *)((char *)v12 + v18[15]);
    (*(void (**)(_QWORD *, _QWORD, uint64_t, int *))(v19 + 56))(v11, 0, 1, v18);
  }
  (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 2, v13);
  return a1;
}

uint64_t sub_23C46B588(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23C46B5C4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7508);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t initializeWithTake for PreviousPlanLockupState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _OWORD *v8;
  _OWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t State;
  int *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;

  v6 = sub_23C4807A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  v8 = (_OWORD *)(a1 + v7);
  v9 = (_OWORD *)(a2 + v7);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7508);
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v11 + 48))(v9, 2, v10))
  {
    State = type metadata accessor for PreviousPlanLockupLoadState();
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(State - 8) + 64));
  }
  else
  {
    v13 = (int *)type metadata accessor for PreviousPlanDetail();
    v14 = *((_QWORD *)v13 - 1);
    if ((*(unsigned int (**)(_OWORD *, uint64_t, int *))(v14 + 48))(v9, 1, v13))
    {
      memcpy(v8, v9, *(_QWORD *)(v11 + 64));
    }
    else
    {
      v15 = v9[1];
      *v8 = *v9;
      v8[1] = v15;
      v16 = v9[3];
      v8[2] = v9[2];
      v8[3] = v16;
      v17 = v13[8];
      v18 = (char *)v8 + v17;
      v19 = (char *)v9 + v17;
      v20 = sub_23C48076C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(v18, v19, v20);
      *(_QWORD *)((char *)v8 + v13[9]) = *(_QWORD *)((char *)v9 + v13[9]);
      *(_QWORD *)((char *)v8 + v13[10]) = *(_QWORD *)((char *)v9 + v13[10]);
      *(_QWORD *)((char *)v8 + v13[11]) = *(_QWORD *)((char *)v9 + v13[11]);
      *((_BYTE *)v8 + v13[12]) = *((_BYTE *)v9 + v13[12]);
      *(_QWORD *)((char *)v8 + v13[13]) = *(_QWORD *)((char *)v9 + v13[13]);
      v21 = v13[14];
      v22 = (char *)v8 + v21;
      v23 = (char *)v9 + v21;
      v24 = sub_23C480790();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 32))(v22, v23, v24);
      *(_QWORD *)((char *)v8 + v13[15]) = *(_QWORD *)((char *)v9 + v13[15]);
      (*(void (**)(_OWORD *, _QWORD, uint64_t, int *))(v14 + 56))(v8, 0, 1, v13);
    }
    (*(void (**)(_OWORD *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 2, v10);
  }
  return a1;
}

uint64_t assignWithTake for PreviousPlanLockupState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  _OWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(_OWORD *, uint64_t, uint64_t);
  int v18;
  int v19;
  int *v20;
  uint64_t v21;
  size_t v22;
  int *v23;
  uint64_t v24;
  uint64_t (*v25)(_OWORD *, uint64_t, int *);
  int v26;
  int v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  char *v59;
  uint64_t v60;

  v6 = sub_23C4807A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  v12 = *(int *)(a3 + 24);
  v13 = (_OWORD *)(a1 + v12);
  v14 = (_OWORD *)(a2 + v12);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7508);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(uint64_t (**)(_OWORD *, uint64_t, uint64_t))(v16 + 48);
  v18 = v17(v13, 2, v15);
  v19 = v17(v14, 2, v15);
  if (!v18)
  {
    if (!v19)
    {
      v23 = (int *)type metadata accessor for PreviousPlanDetail();
      v24 = *((_QWORD *)v23 - 1);
      v25 = *(uint64_t (**)(_OWORD *, uint64_t, int *))(v24 + 48);
      v26 = v25(v13, 1, v23);
      v27 = v25(v14, 1, v23);
      if (v26)
      {
        if (!v27)
        {
          v28 = v14[1];
          *v13 = *v14;
          v13[1] = v28;
          v29 = v14[3];
          v13[2] = v14[2];
          v13[3] = v29;
          v30 = v23[8];
          v31 = (char *)v13 + v30;
          v32 = (char *)v14 + v30;
          v33 = sub_23C48076C();
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v33 - 8) + 32))(v31, v32, v33);
          *(_QWORD *)((char *)v13 + v23[9]) = *(_QWORD *)((char *)v14 + v23[9]);
          *(_QWORD *)((char *)v13 + v23[10]) = *(_QWORD *)((char *)v14 + v23[10]);
          *(_QWORD *)((char *)v13 + v23[11]) = *(_QWORD *)((char *)v14 + v23[11]);
          *((_BYTE *)v13 + v23[12]) = *((_BYTE *)v14 + v23[12]);
          *(_QWORD *)((char *)v13 + v23[13]) = *(_QWORD *)((char *)v14 + v23[13]);
          v34 = v23[14];
          v35 = (char *)v13 + v34;
          v36 = (char *)v14 + v34;
          v37 = sub_23C480790();
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v37 - 8) + 32))(v35, v36, v37);
          *(_QWORD *)((char *)v13 + v23[15]) = *(_QWORD *)((char *)v14 + v23[15]);
          (*(void (**)(_OWORD *, _QWORD, uint64_t, int *))(v24 + 56))(v13, 0, 1, v23);
          return a1;
        }
      }
      else
      {
        if (!v27)
        {
          v49 = *((_QWORD *)v14 + 1);
          *(_QWORD *)v13 = *(_QWORD *)v14;
          *((_QWORD *)v13 + 1) = v49;
          swift_bridgeObjectRelease();
          v50 = *((_QWORD *)v14 + 3);
          *((_QWORD *)v13 + 2) = *((_QWORD *)v14 + 2);
          *((_QWORD *)v13 + 3) = v50;
          swift_bridgeObjectRelease();
          v51 = *((_QWORD *)v14 + 5);
          *((_QWORD *)v13 + 4) = *((_QWORD *)v14 + 4);
          *((_QWORD *)v13 + 5) = v51;
          swift_bridgeObjectRelease();
          v52 = *((_QWORD *)v14 + 7);
          *((_QWORD *)v13 + 6) = *((_QWORD *)v14 + 6);
          *((_QWORD *)v13 + 7) = v52;
          swift_bridgeObjectRelease();
          v53 = v23[8];
          v54 = (char *)v13 + v53;
          v55 = (char *)v14 + v53;
          v56 = sub_23C48076C();
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v56 - 8) + 40))(v54, v55, v56);
          *(_QWORD *)((char *)v13 + v23[9]) = *(_QWORD *)((char *)v14 + v23[9]);
          *(_QWORD *)((char *)v13 + v23[10]) = *(_QWORD *)((char *)v14 + v23[10]);
          swift_bridgeObjectRelease();
          *(_QWORD *)((char *)v13 + v23[11]) = *(_QWORD *)((char *)v14 + v23[11]);
          swift_bridgeObjectRelease();
          *((_BYTE *)v13 + v23[12]) = *((_BYTE *)v14 + v23[12]);
          *(_QWORD *)((char *)v13 + v23[13]) = *(_QWORD *)((char *)v14 + v23[13]);
          swift_bridgeObjectRelease();
          v57 = v23[14];
          v58 = (char *)v13 + v57;
          v59 = (char *)v14 + v57;
          v60 = sub_23C480790();
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v60 - 8) + 40))(v58, v59, v60);
          *(_QWORD *)((char *)v13 + v23[15]) = *(_QWORD *)((char *)v14 + v23[15]);
          return a1;
        }
        sub_23C46B588((uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for PreviousPlanDetail);
      }
      v22 = *(_QWORD *)(v16 + 64);
      goto LABEL_8;
    }
    sub_23C46B5C4((uint64_t)v13);
LABEL_7:
    v22 = *(_QWORD *)(*(_QWORD *)(type metadata accessor for PreviousPlanLockupLoadState() - 8) + 64);
LABEL_8:
    memcpy(v13, v14, v22);
    return a1;
  }
  if (v19)
    goto LABEL_7;
  v20 = (int *)type metadata accessor for PreviousPlanDetail();
  v21 = *((_QWORD *)v20 - 1);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, int *))(v21 + 48))(v14, 1, v20))
  {
    memcpy(v13, v14, *(_QWORD *)(v16 + 64));
  }
  else
  {
    v38 = v14[1];
    *v13 = *v14;
    v13[1] = v38;
    v39 = v14[3];
    v13[2] = v14[2];
    v13[3] = v39;
    v40 = v20[8];
    v41 = (char *)v13 + v40;
    v42 = (char *)v14 + v40;
    v43 = sub_23C48076C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v43 - 8) + 32))(v41, v42, v43);
    *(_QWORD *)((char *)v13 + v20[9]) = *(_QWORD *)((char *)v14 + v20[9]);
    *(_QWORD *)((char *)v13 + v20[10]) = *(_QWORD *)((char *)v14 + v20[10]);
    *(_QWORD *)((char *)v13 + v20[11]) = *(_QWORD *)((char *)v14 + v20[11]);
    *((_BYTE *)v13 + v20[12]) = *((_BYTE *)v14 + v20[12]);
    *(_QWORD *)((char *)v13 + v20[13]) = *(_QWORD *)((char *)v14 + v20[13]);
    v44 = v20[14];
    v45 = (char *)v13 + v44;
    v46 = (char *)v14 + v44;
    v47 = sub_23C480790();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v47 - 8) + 32))(v45, v46, v47);
    *(_QWORD *)((char *)v13 + v20[15]) = *(_QWORD *)((char *)v14 + v20[15]);
    (*(void (**)(_OWORD *, _QWORD, uint64_t, int *))(v21 + 56))(v13, 0, 1, v20);
  }
  (*(void (**)(_OWORD *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 2, v15);
  return a1;
}

uint64_t getEnumTagSinglePayload for PreviousPlanLockupState()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C46BC2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t State;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  unint64_t v11;

  v6 = sub_23C4807A8();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    State = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, State);
  }
  if ((_DWORD)a2 != 0x7FFFFFFF)
  {
    State = type metadata accessor for PreviousPlanLockupLoadState();
    v10 = a1 + *(int *)(a3 + 24);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(State - 8) + 48);
    return v9(v10, a2, State);
  }
  v11 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v11 >= 0xFFFFFFFF)
    LODWORD(v11) = -1;
  return (v11 + 1);
}

uint64_t storeEnumTagSinglePayload for PreviousPlanLockupState()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C46BCE4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t State;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  result = sub_23C4807A8();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    State = result;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
      return result;
    }
    State = type metadata accessor for PreviousPlanLockupLoadState();
    v12 = a1 + *(int *)(a4 + 24);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(State - 8) + 56);
  }
  return v11(v12, a2, a2, State);
}

uint64_t sub_23C46BD8C()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_23C4807A8();
  if (v1 <= 0x3F)
  {
    result = type metadata accessor for PreviousPlanLockupLoadState();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for PreviousPlanLockupState.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C46BE64 + 4 * byte_23C4823C5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23C46BE98 + 4 * asc_23C4823C0[v4]))();
}

uint64_t sub_23C46BE98(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C46BEA0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C46BEA8);
  return result;
}

uint64_t sub_23C46BEB4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C46BEBCLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23C46BEC0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C46BEC8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PreviousPlanLockupState.CodingKeys()
{
  return &type metadata for PreviousPlanLockupState.CodingKeys;
}

unint64_t sub_23C46BEE8()
{
  unint64_t result;

  result = qword_256BA75A8;
  if (!qword_256BA75A8)
  {
    result = MEMORY[0x24261FFB0](&unk_23C48252C, &type metadata for PreviousPlanLockupState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA75A8);
  }
  return result;
}

unint64_t sub_23C46BF30()
{
  unint64_t result;

  result = qword_256BA75B0;
  if (!qword_256BA75B0)
  {
    result = MEMORY[0x24261FFB0](&unk_23C48249C, &type metadata for PreviousPlanLockupState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA75B0);
  }
  return result;
}

unint64_t sub_23C46BF78()
{
  unint64_t result;

  result = qword_256BA75B8;
  if (!qword_256BA75B8)
  {
    result = MEMORY[0x24261FFB0](&unk_23C4824C4, &type metadata for PreviousPlanLockupState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA75B8);
  }
  return result;
}

uint64_t sub_23C46BFBC(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x656C61636F6CLL && a2 == 0xE600000000000000;
  if (v2 || (sub_23C480D54() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x800000023C485160 || (sub_23C480D54() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7461745364616F6CLL && a2 == 0xE900000000000065)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_23C480D54();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

__n128 CreateWorkoutPlanButtonFeature.init(environment:)@<Q0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 16);
  *a2 = *(_OWORD *)a1;
  a2[1] = v3;
  return result;
}

uint64_t CreateWorkoutPlanButtonFeature.reduce(localState:sharedState:sideEffects:action:)(uint64_t a1, uint64_t a2, _QWORD **a3, char a4)
{
  uint64_t *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t result;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  int *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  unint64_t v33;
  unint64_t v34;
  char *v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  _QWORD *v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  char v50;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA75C0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v46 - v14;
  if (a4)
  {
    if (a4 == 1)
    {
      v16 = v4[1];
      v17 = v4[2];
      v18 = v4[3];
      v47 = *v4;
      v48 = v17;
      v19 = *(unsigned __int8 *)(a2 + *(int *)(type metadata accessor for CreateWorkoutPlanButtonState() + 24));
      v20 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_256BA75C8);
      v21 = v20[16];
      v22 = v20[20];
      v23 = v20[24];
      if (v19 == 1)
      {
        v24 = &v15[v21];
        v25 = &v15[v22];
        v26 = &v15[v23];
        v49 = 1;
        sub_23C46C558();
        sub_23C480C70();
        sub_23C480C28();
        v27 = *MEMORY[0x24BE2B580];
        v28 = sub_23C480AFC();
        (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 104))(v24, v27, v28);
        v29 = *MEMORY[0x24BE2B550];
        v30 = sub_23C480AF0();
        (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 104))(v25, v29, v30);
        v31 = (_QWORD *)swift_allocObject();
        v31[2] = v47;
        v31[3] = v16;
        v31[4] = v48;
        v31[5] = v18;
        *(_QWORD *)v26 = &unk_256BA75F0;
        *((_QWORD *)v26 + 1) = v31;
        (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v15, *MEMORY[0x24BE2B438], v8);
        v32 = *a3;
        swift_retain();
        swift_retain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v32 = (_QWORD *)sub_23C46CCE8(0, v32[2] + 1, 1, v32, &qword_256BA7648, &qword_256BA75C0);
        v34 = v32[2];
        v33 = v32[3];
        if (v34 >= v33 >> 1)
          v32 = (_QWORD *)sub_23C46CCE8(v33 > 1, v34 + 1, 1, v32, &qword_256BA7648, &qword_256BA75C0);
        v32[2] = v34 + 1;
        result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v9 + 32))((unint64_t)v32+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(_QWORD *)(v9 + 72) * v34, v15, v8);
        *a3 = v32;
      }
      else
      {
        v35 = &v12[v21];
        v36 = &v12[v22];
        v37 = &v12[v23];
        v50 = 0;
        sub_23C46C558();
        sub_23C480C70();
        sub_23C480C28();
        v38 = *MEMORY[0x24BE2B570];
        v39 = sub_23C480AFC();
        (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 104))(v35, v38, v39);
        v40 = *MEMORY[0x24BE2B550];
        v41 = sub_23C480AF0();
        (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 104))(v36, v40, v41);
        v42 = (_QWORD *)swift_allocObject();
        v42[2] = v47;
        v42[3] = v16;
        v42[4] = v48;
        v42[5] = v18;
        *(_QWORD *)v37 = &unk_256BA75E0;
        *((_QWORD *)v37 + 1) = v42;
        (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v12, *MEMORY[0x24BE2B438], v8);
        v43 = *a3;
        swift_retain();
        swift_retain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v43 = (_QWORD *)sub_23C46CCE8(0, v43[2] + 1, 1, v43, &qword_256BA7648, &qword_256BA75C0);
        v45 = v43[2];
        v44 = v43[3];
        if (v45 >= v44 >> 1)
          v43 = (_QWORD *)sub_23C46CCE8(v44 > 1, v45 + 1, 1, v43, &qword_256BA7648, &qword_256BA75C0);
        v43[2] = v45 + 1;
        result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v9 + 32))((unint64_t)v43+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(_QWORD *)(v9 + 72) * v45, v12, v8);
        *a3 = v43;
      }
    }
    else
    {
      *(_BYTE *)(a2 + 1) = 1;
    }
  }
  return result;
}

unint64_t sub_23C46C558()
{
  unint64_t result;

  result = qword_256BA75D0;
  if (!qword_256BA75D0)
  {
    result = MEMORY[0x24261FFB0](&unk_23C482688, &type metadata for CreateWorkoutPlanButtonFeature.TaskIdentifier);
    atomic_store(result, &qword_256BA75D0);
  }
  return result;
}

uint64_t sub_23C46C59C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;

  *(_QWORD *)(v5 + 16) = a4;
  *(_QWORD *)(v5 + 24) = a5;
  *(_QWORD *)(v5 + 32) = sub_23C480C1C();
  *(_QWORD *)(v5 + 40) = sub_23C480C10();
  *(_BYTE *)(v5 + 72) = 2;
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 48) = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7640);
  *v6 = v5;
  v6[1] = sub_23C46C634;
  return sub_23C480AE4();
}

uint64_t sub_23C46C634()
{
  uint64_t *v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  uint64_t (*v5)(void);
  uint64_t v6;

  v1 = *v0;
  v2 = *(int **)(*v0 + 16);
  v6 = *v0;
  swift_task_dealloc();
  v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 56) = v3;
  *v3 = v6;
  v3[1] = sub_23C46C6AC;
  return v5();
}

uint64_t sub_23C46C6AC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 64) = v0;
  swift_task_dealloc();
  sub_23C480BF8();
  return swift_task_switch();
}

uint64_t sub_23C46C734()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C46C768()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C46C79C(uint64_t a1, int *a2)
{
  _QWORD *v2;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v2[2] = sub_23C480C1C();
  v2[3] = sub_23C480C10();
  v6 = (uint64_t (*)(void))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  v2[4] = v4;
  *v4 = v2;
  v4[1] = sub_23C46C818;
  return v6();
}

uint64_t sub_23C46C818()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 40) = v0;
  swift_task_dealloc();
  sub_23C480BF8();
  return swift_task_switch();
}

uint64_t sub_23C46C8A0()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C46C8D4()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C46C90C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23C46C980;
  return sub_23C46C79C(a1, v4);
}

uint64_t sub_23C46C980()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23C46C9CC(uint64_t a1, uint64_t a2, _QWORD **a3, char *a4)
{
  return CreateWorkoutPlanButtonFeature.reduce(localState:sharedState:sideEffects:action:)(a1, a2, a3, *a4);
}

uint64_t objectdestroyTm()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23C46CA04(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_23C46CE5C;
  return sub_23C46C59C(a1, v4, v5, v7, v6);
}

unint64_t sub_23C46CA7C()
{
  unint64_t result;

  result = qword_256BA75F8;
  if (!qword_256BA75F8)
  {
    result = MEMORY[0x24261FFB0](&protocol conformance descriptor for CreateWorkoutPlanButtonAction, &type metadata for CreateWorkoutPlanButtonAction);
    atomic_store(result, (unint64_t *)&qword_256BA75F8);
  }
  return result;
}

unint64_t sub_23C46CAC4()
{
  unint64_t result;

  result = qword_256BA7600;
  if (!qword_256BA7600)
  {
    result = MEMORY[0x24261FFB0](&protocol conformance descriptor for CreateWorkoutPlanButtonAction, &type metadata for CreateWorkoutPlanButtonAction);
    atomic_store(result, (unint64_t *)&qword_256BA7600);
  }
  return result;
}

unint64_t sub_23C46CB0C()
{
  unint64_t result;

  result = qword_256BA7608;
  if (!qword_256BA7608)
  {
    result = MEMORY[0x24261FFB0](MEMORY[0x24BE2B430], MEMORY[0x24BE2B428]);
    atomic_store(result, (unint64_t *)&qword_256BA7608);
  }
  return result;
}

unint64_t sub_23C46CB54()
{
  unint64_t result;
  uint64_t WorkoutPlanButtonState;

  result = qword_256BA7610;
  if (!qword_256BA7610)
  {
    WorkoutPlanButtonState = type metadata accessor for CreateWorkoutPlanButtonState();
    result = MEMORY[0x24261FFB0](&protocol conformance descriptor for CreateWorkoutPlanButtonState, WorkoutPlanButtonState);
    atomic_store(result, (unint64_t *)&qword_256BA7610);
  }
  return result;
}

ValueMetadata *type metadata accessor for CreateWorkoutPlanButtonFeature()
{
  return &type metadata for CreateWorkoutPlanButtonFeature;
}

uint64_t storeEnumTagSinglePayload for CreateWorkoutPlanButtonFeature.TaskIdentifier(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C46CBF8 + 4 * byte_23C4825B5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C46CC2C + 4 * byte_23C4825B0[v4]))();
}

uint64_t sub_23C46CC2C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C46CC34(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C46CC3CLL);
  return result;
}

uint64_t sub_23C46CC48(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C46CC50);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C46CC54(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C46CC5C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CreateWorkoutPlanButtonFeature.TaskIdentifier()
{
  return &type metadata for CreateWorkoutPlanButtonFeature.TaskIdentifier;
}

unint64_t sub_23C46CC7C()
{
  unint64_t result;

  result = qword_256BA7618;
  if (!qword_256BA7618)
  {
    result = MEMORY[0x24261FFB0](&unk_23C482660, &type metadata for CreateWorkoutPlanButtonFeature.TaskIdentifier);
    atomic_store(result, (unint64_t *)&qword_256BA7618);
  }
  return result;
}

size_t sub_23C46CCC0(size_t a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_23C46CCE8(a1, a2, a3, a4, &qword_256BA7630, &qword_256BA7638);
}

size_t sub_23C46CCD4(size_t a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_23C46CCE8(a1, a2, a3, a4, &qword_256BA7620, &qword_256BA7628);
}

size_t sub_23C46CCE8(size_t result, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t *a6)
{
  char v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  uint64_t v18;
  unint64_t v19;

  v8 = result;
  if ((a3 & 1) != 0)
  {
    v9 = a4[3];
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_30:
        __break(1u);
        return result;
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
  v11 = a4[2];
  if (v10 <= v11)
    v12 = a4[2];
  else
    v12 = v10;
  if (!v12)
  {
    v16 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  v13 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(a6) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v15 == 0x8000000000000000 && v14 == -1)
    goto LABEL_29;
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(result - v15) / v14);
LABEL_19:
  v18 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(a6) - 8);
  if ((v8 & 1) != 0)
  {
    if (v16 < a4
      || (v19 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80),
          (char *)v16 + v19 >= (char *)a4 + v19 + *(_QWORD *)(v18 + 72) * v11))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
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
  return (size_t)v16;
}

uint64_t sub_23C46CE64()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x676E696863746566;
  if (*v0 != 1)
    v1 = 0x64656863746566;
  if (*v0)
    return v1;
  else
    return 1701602409;
}

uint64_t sub_23C46CEB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C46F8FC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C46CEDC()
{
  sub_23C46E04C();
  return sub_23C480DA8();
}

uint64_t sub_23C46CF04()
{
  sub_23C46E04C();
  return sub_23C480DB4();
}

uint64_t sub_23C46CF2C()
{
  return 12383;
}

uint64_t sub_23C46CF38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_23C480D54();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_23C46CFB4()
{
  sub_23C46E11C();
  return sub_23C480DA8();
}

uint64_t sub_23C46CFDC()
{
  sub_23C46E11C();
  return sub_23C480DB4();
}

uint64_t sub_23C46D004()
{
  sub_23C46E160();
  return sub_23C480DA8();
}

uint64_t sub_23C46D02C()
{
  sub_23C46E160();
  return sub_23C480DB4();
}

uint64_t sub_23C46D054()
{
  sub_23C46E1A4();
  return sub_23C480DA8();
}

uint64_t sub_23C46D07C()
{
  sub_23C46E1A4();
  return sub_23C480DB4();
}

uint64_t PreviousPlanLockupLoadState.encode(to:)(_QWORD *a1)
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
  char *v11;
  uint64_t State;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  int v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  char v36;
  char v37;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7650);
  v31 = *(_QWORD *)(v2 - 8);
  v32 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v30 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7508);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v29 = (uint64_t)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7658);
  v27 = *(_QWORD *)(v7 - 8);
  v28 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v26 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7660);
  v24 = *(_QWORD *)(v9 - 8);
  v25 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  State = type metadata accessor for PreviousPlanLockupLoadState();
  MEMORY[0x24BDAC7A8](State);
  v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7668);
  v34 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C46E04C();
  sub_23C480D9C();
  sub_23C46E090(v33, (uint64_t)v14);
  v18 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v14, 2, v4);
  if (v18)
  {
    if (v18 == 1)
    {
      v35 = 0;
      sub_23C46E1A4();
      sub_23C480D00();
      (*(void (**)(char *, uint64_t))(v24 + 8))(v11, v25);
    }
    else
    {
      v36 = 1;
      sub_23C46E160();
      v23 = v26;
      sub_23C480D00();
      (*(void (**)(char *, uint64_t))(v27 + 8))(v23, v28);
    }
    return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v17, v15);
  }
  else
  {
    v19 = v29;
    sub_23C46E0D4((uint64_t)v14, v29);
    v37 = 2;
    sub_23C46E11C();
    v20 = v30;
    sub_23C480D00();
    type metadata accessor for PreviousPlanDetail();
    sub_23C46A7F0(&qword_256BA7680, (uint64_t (*)(uint64_t))type metadata accessor for PreviousPlanDetail, (uint64_t)&protocol conformance descriptor for PreviousPlanDetail);
    v21 = v32;
    sub_23C480D0C();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v20, v21);
    sub_23C46FA40(v19, &qword_256BA7508);
    return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v17, v15);
  }
}

uint64_t PreviousPlanLockupLoadState.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  char *v13;
  uint64_t State;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  char *v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t *v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  char *v55;
  char *v56;
  char *v57;
  _QWORD *v58;
  uint64_t v59;
  char v60;
  char v61;
  char v62;

  v53 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7698);
  v4 = *(_QWORD *)(v3 - 8);
  v51 = v3;
  v52 = v4;
  MEMORY[0x24BDAC7A8](v3);
  v56 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA76A0);
  v49 = *(_QWORD *)(v6 - 8);
  v50 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v55 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA76A8);
  v47 = *(_QWORD *)(v8 - 8);
  v48 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v54 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA76B0);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  State = type metadata accessor for PreviousPlanLockupLoadState();
  v15 = MEMORY[0x24BDAC7A8](State);
  v17 = (char *)&v44 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v44 - v18;
  v20 = a1[3];
  v58 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v20);
  sub_23C46E04C();
  v57 = v13;
  v21 = v59;
  sub_23C480D90();
  if (!v21)
  {
    v22 = v54;
    v23 = v55;
    v45 = v17;
    v46 = v19;
    v24 = v56;
    v59 = v11;
    v25 = sub_23C480CF4();
    v26 = (char *)v25;
    if (*(_QWORD *)(v25 + 16) == 1)
    {
      v27 = v57;
      v28 = v59;
      if (*(_BYTE *)(v25 + 32))
      {
        if (*(_BYTE *)(v25 + 32) != 1)
        {
          v62 = 2;
          sub_23C46E11C();
          v36 = v27;
          sub_23C480CA0();
          v37 = v53;
          type metadata accessor for PreviousPlanDetail();
          v55 = v26;
          sub_23C46A7F0(&qword_256BA76B8, (uint64_t (*)(uint64_t))type metadata accessor for PreviousPlanDetail, (uint64_t)&protocol conformance descriptor for PreviousPlanDetail);
          v40 = (uint64_t)v45;
          v41 = v51;
          sub_23C480CB8();
          (*(void (**)(char *, uint64_t))(v52 + 8))(v24, v41);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v59 + 8))(v36, v10);
          v42 = (uint64_t)v58;
          v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7508);
          (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 56))(v40, 0, 2, v43);
          v30 = (uint64_t)v46;
          sub_23C46E230(v40, (uint64_t)v46, (uint64_t (*)(_QWORD))type metadata accessor for PreviousPlanLockupLoadState);
LABEL_12:
          sub_23C46E230(v30, v37, (uint64_t (*)(_QWORD))type metadata accessor for PreviousPlanLockupLoadState);
          return __swift_destroy_boxed_opaque_existential_1(v42);
        }
        v61 = 1;
        sub_23C46E160();
        sub_23C480CA0();
        (*(void (**)(char *, uint64_t))(v49 + 8))(v23, v50);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v28 + 8))(v27, v10);
        v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7508);
        v30 = (uint64_t)v46;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56))(v46, 2, 2, v29);
      }
      else
      {
        v60 = 0;
        sub_23C46E1A4();
        sub_23C480CA0();
        (*(void (**)(char *, uint64_t))(v47 + 8))(v22, v48);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v28 + 8))(v27, v10);
        v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7508);
        v30 = (uint64_t)v46;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 56))(v46, 1, 2, v39);
      }
      v42 = (uint64_t)v58;
      v37 = v53;
      goto LABEL_12;
    }
    v31 = v10;
    v32 = sub_23C480C94();
    swift_allocError();
    v34 = v33;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7168);
    *v34 = State;
    v35 = v57;
    sub_23C480CAC();
    sub_23C480C88();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v32 - 8) + 104))(v34, *MEMORY[0x24BEE26D0], v32);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v59 + 8))(v35, v31);
  }
  v42 = (uint64_t)v58;
  return __swift_destroy_boxed_opaque_existential_1(v42);
}

uint64_t sub_23C46D99C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return PreviousPlanLockupLoadState.init(from:)(a1, a2);
}

uint64_t sub_23C46D9B0(_QWORD *a1)
{
  return PreviousPlanLockupLoadState.encode(to:)(a1);
}

uint64_t PreviousPlanLockupLoadState.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t State;
  uint64_t v13;
  char *v14;
  uint64_t v16;

  v1 = type metadata accessor for PreviousPlanDetail();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7508);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v16 - v10;
  State = type metadata accessor for PreviousPlanLockupLoadState();
  MEMORY[0x24BDAC7A8](State);
  v14 = (char *)&v16 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23C46E090(v0, (uint64_t)v14);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v14, 2, v5))
    return sub_23C480D6C();
  sub_23C46E0D4((uint64_t)v14, (uint64_t)v11);
  sub_23C480D6C();
  sub_23C46E1E8((uint64_t)v11, (uint64_t)v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v9, 1, v1) == 1)
  {
    sub_23C480D78();
  }
  else
  {
    sub_23C46E230((uint64_t)v9, (uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for PreviousPlanDetail);
    sub_23C480D78();
    PreviousPlanDetail.hash(into:)();
    sub_23C46B588((uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for PreviousPlanDetail);
  }
  return sub_23C46FA40((uint64_t)v11, &qword_256BA7508);
}

uint64_t PreviousPlanLockupLoadState.hashValue.getter()
{
  sub_23C480D60();
  PreviousPlanLockupLoadState.hash(into:)();
  return sub_23C480D84();
}

uint64_t sub_23C46DBDC()
{
  sub_23C480D60();
  PreviousPlanLockupLoadState.hash(into:)();
  return sub_23C480D84();
}

uint64_t sub_23C46DC1C()
{
  sub_23C480D60();
  PreviousPlanLockupLoadState.hash(into:)();
  return sub_23C480D84();
}

uint64_t _s18FitnessWorkoutPlan08PreviousC15LockupLoadStateO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t State;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t (*v23)(char *, uint64_t, uint64_t);
  int v24;
  uint64_t v25;
  uint64_t v27;
  unsigned int (*v28)(uint64_t, uint64_t, uint64_t);
  _QWORD *v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;

  v33 = a1;
  v34 = (_QWORD *)a2;
  v2 = type metadata accessor for PreviousPlanDetail();
  v31 = *(_QWORD *)(v2 - 8);
  v32 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v4 = (uint64_t *)((char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA77A0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7508);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v31 - v13;
  State = type metadata accessor for PreviousPlanLockupLoadState();
  MEMORY[0x24BDAC7A8](State);
  v17 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA77A8);
  v19 = MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v31 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = (uint64_t)&v21[*(int *)(v19 + 48)];
  sub_23C46E090(v33, (uint64_t)v21);
  sub_23C46E090((uint64_t)v34, v22);
  v23 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48);
  v24 = v23(v21, 2, v8);
  if (!v24)
  {
    v34 = v12;
    v25 = v32;
    sub_23C46E090((uint64_t)v21, (uint64_t)v17);
    if (v23((char *)v22, 2, v8))
    {
      sub_23C46FA40((uint64_t)v17, &qword_256BA7508);
      goto LABEL_9;
    }
    sub_23C46E0D4(v22, (uint64_t)v14);
    v27 = (uint64_t)&v7[*(int *)(v5 + 48)];
    sub_23C46E0D4((uint64_t)v17, (uint64_t)v7);
    sub_23C46E1E8((uint64_t)v14, v27);
    v28 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v31 + 48);
    if (v28((uint64_t)v7, 1, v25) == 1)
    {
      sub_23C46FA40((uint64_t)v14, &qword_256BA7508);
      if (v28(v27, 1, v25) == 1)
      {
        sub_23C46FA40((uint64_t)v7, &qword_256BA7508);
        goto LABEL_8;
      }
    }
    else
    {
      v29 = v34;
      sub_23C46E1E8((uint64_t)v7, (uint64_t)v34);
      if (v28(v27, 1, v25) != 1)
      {
        sub_23C46E230(v27, (uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for PreviousPlanDetail);
        v30 = _s18FitnessWorkoutPlan08PreviousC6DetailV2eeoiySbAC_ACtFZ_0(v29, v4);
        sub_23C46B588((uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for PreviousPlanDetail);
        sub_23C46FA40((uint64_t)v14, &qword_256BA7508);
        sub_23C46B588((uint64_t)v29, (uint64_t (*)(_QWORD))type metadata accessor for PreviousPlanDetail);
        sub_23C46FA40((uint64_t)v7, &qword_256BA7508);
        if (v30)
          goto LABEL_8;
LABEL_18:
        sub_23C46B588((uint64_t)v21, (uint64_t (*)(_QWORD))type metadata accessor for PreviousPlanLockupLoadState);
        return 0;
      }
      sub_23C46FA40((uint64_t)v14, &qword_256BA7508);
      sub_23C46B588((uint64_t)v29, (uint64_t (*)(_QWORD))type metadata accessor for PreviousPlanDetail);
    }
    sub_23C46FA40((uint64_t)v7, &qword_256BA77A0);
    goto LABEL_18;
  }
  if (v24 == 1)
  {
    if (v23((char *)v22, 2, v8) != 1)
      goto LABEL_9;
LABEL_8:
    sub_23C46B588((uint64_t)v21, (uint64_t (*)(_QWORD))type metadata accessor for PreviousPlanLockupLoadState);
    return 1;
  }
  if (v23((char *)v22, 2, v8) == 2)
    goto LABEL_8;
LABEL_9:
  sub_23C46FA40((uint64_t)v21, &qword_256BA77A8);
  return 0;
}

uint64_t type metadata accessor for PreviousPlanLockupLoadState()
{
  uint64_t result;

  result = qword_256BA7738;
  if (!qword_256BA7738)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_23C46E04C()
{
  unint64_t result;

  result = qword_256BA7670;
  if (!qword_256BA7670)
  {
    result = MEMORY[0x24261FFB0](&unk_23C482B24, &type metadata for PreviousPlanLockupLoadState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7670);
  }
  return result;
}

uint64_t sub_23C46E090(uint64_t a1, uint64_t a2)
{
  uint64_t State;

  State = type metadata accessor for PreviousPlanLockupLoadState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(State - 8) + 16))(a2, a1, State);
  return a2;
}

uint64_t sub_23C46E0D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7508);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_23C46E11C()
{
  unint64_t result;

  result = qword_256BA7678;
  if (!qword_256BA7678)
  {
    result = MEMORY[0x24261FFB0](&unk_23C482AD4, &type metadata for PreviousPlanLockupLoadState.FetchedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7678);
  }
  return result;
}

unint64_t sub_23C46E160()
{
  unint64_t result;

  result = qword_256BA7688;
  if (!qword_256BA7688)
  {
    result = MEMORY[0x24261FFB0](&unk_23C482A84, &type metadata for PreviousPlanLockupLoadState.FetchingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7688);
  }
  return result;
}

unint64_t sub_23C46E1A4()
{
  unint64_t result;

  result = qword_256BA7690;
  if (!qword_256BA7690)
  {
    result = MEMORY[0x24261FFB0](&unk_23C482A34, &type metadata for PreviousPlanLockupLoadState.IdleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7690);
  }
  return result;
}

uint64_t sub_23C46E1E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7508);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23C46E230(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_23C46E274()
{
  return sub_23C46A7F0(&qword_256BA76C0, (uint64_t (*)(uint64_t))type metadata accessor for PreviousPlanLockupLoadState, (uint64_t)&protocol conformance descriptor for PreviousPlanLockupLoadState);
}

uint64_t *initializeBufferWithCopyOfBuffer for PreviousPlanLockupLoadState(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, char *, uint64_t);
  void (*v22)(char *, char *, uint64_t);
  char *v23;
  char *v24;
  char *v25;
  char *v26;
  uint64_t v27;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7508);
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 2, v7))
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      v10 = (int *)type metadata accessor for PreviousPlanDetail();
      v11 = *((_QWORD *)v10 - 1);
      if ((*(unsigned int (**)(uint64_t *, uint64_t, int *))(v11 + 48))(a2, 1, v10))
      {
        memcpy(a1, a2, *(_QWORD *)(v8 + 64));
      }
      else
      {
        v27 = v11;
        v12 = a2[1];
        *a1 = *a2;
        a1[1] = v12;
        v13 = a2[3];
        a1[2] = a2[2];
        a1[3] = v13;
        v14 = a2[5];
        a1[4] = a2[4];
        a1[5] = v14;
        v15 = a2[7];
        a1[6] = a2[6];
        a1[7] = v15;
        v16 = v10[8];
        v23 = (char *)a2 + v16;
        v25 = (char *)a1 + v16;
        v17 = sub_23C48076C();
        v22 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v22(v25, v23, v17);
        *(uint64_t *)((char *)a1 + v10[9]) = *(uint64_t *)((char *)a2 + v10[9]);
        *(uint64_t *)((char *)a1 + v10[10]) = *(uint64_t *)((char *)a2 + v10[10]);
        *(uint64_t *)((char *)a1 + v10[11]) = *(uint64_t *)((char *)a2 + v10[11]);
        *((_BYTE *)a1 + v10[12]) = *((_BYTE *)a2 + v10[12]);
        *(uint64_t *)((char *)a1 + v10[13]) = *(uint64_t *)((char *)a2 + v10[13]);
        v18 = v10[14];
        v24 = (char *)a2 + v18;
        v26 = (char *)a1 + v18;
        v19 = sub_23C480790();
        v20 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v20(v26, v24, v19);
        *(uint64_t *)((char *)a1 + v10[15]) = *(uint64_t *)((char *)a2 + v10[15]);
        (*(void (**)(uint64_t *, _QWORD, uint64_t, int *))(v27 + 56))(a1, 0, 1, v10);
      }
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 2, v7);
    }
  }
  return a1;
}

uint64_t destroy for PreviousPlanLockupLoadState(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7508);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 2, v2);
  if (!(_DWORD)result)
  {
    v4 = type metadata accessor for PreviousPlanDetail();
    result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, 1, v4);
    if (!(_DWORD)result)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v5 = a1 + *(int *)(v4 + 32);
      v6 = sub_23C48076C();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v7 = a1 + *(int *)(v4 + 56);
      v8 = sub_23C480790();
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
    }
  }
  return result;
}

_QWORD *initializeWithCopy for PreviousPlanLockupLoadState(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(char *, char *, uint64_t);
  void (*v20)(char *, char *, uint64_t);
  char *v21;
  char *v22;
  char *v23;
  char *v24;
  uint64_t v25;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7508);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v7 + 48))(a2, 2, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v8 = (int *)type metadata accessor for PreviousPlanDetail();
    v9 = *((_QWORD *)v8 - 1);
    if ((*(unsigned int (**)(_QWORD *, uint64_t, int *))(v9 + 48))(a2, 1, v8))
    {
      memcpy(a1, a2, *(_QWORD *)(v7 + 64));
    }
    else
    {
      v25 = v9;
      v10 = a2[1];
      *a1 = *a2;
      a1[1] = v10;
      v11 = a2[3];
      a1[2] = a2[2];
      a1[3] = v11;
      v12 = a2[5];
      a1[4] = a2[4];
      a1[5] = v12;
      v13 = a2[7];
      a1[6] = a2[6];
      a1[7] = v13;
      v14 = v8[8];
      v21 = (char *)a2 + v14;
      v23 = (char *)a1 + v14;
      v15 = sub_23C48076C();
      v20 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v20(v23, v21, v15);
      *(_QWORD *)((char *)a1 + v8[9]) = *(_QWORD *)((char *)a2 + v8[9]);
      *(_QWORD *)((char *)a1 + v8[10]) = *(_QWORD *)((char *)a2 + v8[10]);
      *(_QWORD *)((char *)a1 + v8[11]) = *(_QWORD *)((char *)a2 + v8[11]);
      *((_BYTE *)a1 + v8[12]) = *((_BYTE *)a2 + v8[12]);
      *(_QWORD *)((char *)a1 + v8[13]) = *(_QWORD *)((char *)a2 + v8[13]);
      v16 = v8[14];
      v22 = (char *)a2 + v16;
      v24 = (char *)a1 + v16;
      v17 = sub_23C480790();
      v18 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v18(v24, v22, v17);
      *(_QWORD *)((char *)a1 + v8[15]) = *(_QWORD *)((char *)a2 + v8[15]);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, int *))(v25 + 56))(a1, 0, 1, v8);
    }
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  }
  return a1;
}

_QWORD *assignWithCopy for PreviousPlanLockupLoadState(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(_QWORD *, uint64_t, uint64_t);
  int v9;
  int v10;
  int *v11;
  uint64_t v12;
  size_t v13;
  int *v14;
  uint64_t v15;
  uint64_t (*v16)(_QWORD *, uint64_t, int *);
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(char *, char *, uint64_t);
  uint64_t v22;
  char *v23;
  uint64_t v24;
  void (*v25)(char *, char *, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, char *, uint64_t);
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  void (*v40)(char *, char *, uint64_t);
  char *v41;
  char *v42;
  char *v43;
  char *v44;
  char *v45;
  char *v46;
  char *v47;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7508);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 2, v6);
  v10 = v8(a2, 2, v6);
  if (!v9)
  {
    if (!v10)
    {
      v14 = (int *)type metadata accessor for PreviousPlanDetail();
      v15 = *((_QWORD *)v14 - 1);
      v16 = *(uint64_t (**)(_QWORD *, uint64_t, int *))(v15 + 48);
      v17 = v16(a1, 1, v14);
      v18 = v16(a2, 1, v14);
      if (v17)
      {
        if (!v18)
        {
          *a1 = *a2;
          a1[1] = a2[1];
          a1[2] = a2[2];
          a1[3] = a2[3];
          a1[4] = a2[4];
          a1[5] = a2[5];
          a1[6] = a2[6];
          a1[7] = a2[7];
          v19 = v14[8];
          v43 = (char *)a2 + v19;
          v46 = (char *)a1 + v19;
          v20 = sub_23C48076C();
          v21 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v21(v46, v43, v20);
          *(_QWORD *)((char *)a1 + v14[9]) = *(_QWORD *)((char *)a2 + v14[9]);
          *(_QWORD *)((char *)a1 + v14[10]) = *(_QWORD *)((char *)a2 + v14[10]);
          *(_QWORD *)((char *)a1 + v14[11]) = *(_QWORD *)((char *)a2 + v14[11]);
          *((_BYTE *)a1 + v14[12]) = *((_BYTE *)a2 + v14[12]);
          *(_QWORD *)((char *)a1 + v14[13]) = *(_QWORD *)((char *)a2 + v14[13]);
          v22 = v14[14];
          v23 = (char *)a1 + v22;
          v47 = (char *)a2 + v22;
          v24 = sub_23C480790();
          v25 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 16);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v25(v23, v47, v24);
          *(_QWORD *)((char *)a1 + v14[15]) = *(_QWORD *)((char *)a2 + v14[15]);
          (*(void (**)(_QWORD *, _QWORD, uint64_t, int *))(v15 + 56))(a1, 0, 1, v14);
          return a1;
        }
      }
      else
      {
        if (!v18)
        {
          *a1 = *a2;
          a1[1] = a2[1];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          a1[2] = a2[2];
          a1[3] = a2[3];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          a1[4] = a2[4];
          a1[5] = a2[5];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          a1[6] = a2[6];
          a1[7] = a2[7];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          v32 = v14[8];
          v33 = (char *)a1 + v32;
          v34 = (char *)a2 + v32;
          v35 = sub_23C48076C();
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v35 - 8) + 24))(v33, v34, v35);
          *(_QWORD *)((char *)a1 + v14[9]) = *(_QWORD *)((char *)a2 + v14[9]);
          *(_QWORD *)((char *)a1 + v14[10]) = *(_QWORD *)((char *)a2 + v14[10]);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          *(_QWORD *)((char *)a1 + v14[11]) = *(_QWORD *)((char *)a2 + v14[11]);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          *((_BYTE *)a1 + v14[12]) = *((_BYTE *)a2 + v14[12]);
          *(_QWORD *)((char *)a1 + v14[13]) = *(_QWORD *)((char *)a2 + v14[13]);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          v36 = v14[14];
          v37 = (char *)a1 + v36;
          v38 = (char *)a2 + v36;
          v39 = sub_23C480790();
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v39 - 8) + 24))(v37, v38, v39);
          *(_QWORD *)((char *)a1 + v14[15]) = *(_QWORD *)((char *)a2 + v14[15]);
          return a1;
        }
        sub_23C46B588((uint64_t)a1, (uint64_t (*)(_QWORD))type metadata accessor for PreviousPlanDetail);
      }
      v13 = *(_QWORD *)(v7 + 64);
      goto LABEL_8;
    }
    sub_23C46FA40((uint64_t)a1, &qword_256BA7508);
LABEL_7:
    v13 = *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64);
LABEL_8:
    memcpy(a1, a2, v13);
    return a1;
  }
  if (v10)
    goto LABEL_7;
  v11 = (int *)type metadata accessor for PreviousPlanDetail();
  v12 = *((_QWORD *)v11 - 1);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, int *))(v12 + 48))(a2, 1, v11))
  {
    memcpy(a1, a2, *(_QWORD *)(v7 + 64));
  }
  else
  {
    *a1 = *a2;
    a1[1] = a2[1];
    a1[2] = a2[2];
    a1[3] = a2[3];
    a1[4] = a2[4];
    a1[5] = a2[5];
    a1[6] = a2[6];
    a1[7] = a2[7];
    v26 = v11[8];
    v41 = (char *)a2 + v26;
    v44 = (char *)a1 + v26;
    v27 = sub_23C48076C();
    v40 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v27 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v40(v44, v41, v27);
    *(_QWORD *)((char *)a1 + v11[9]) = *(_QWORD *)((char *)a2 + v11[9]);
    *(_QWORD *)((char *)a1 + v11[10]) = *(_QWORD *)((char *)a2 + v11[10]);
    *(_QWORD *)((char *)a1 + v11[11]) = *(_QWORD *)((char *)a2 + v11[11]);
    *((_BYTE *)a1 + v11[12]) = *((_BYTE *)a2 + v11[12]);
    *(_QWORD *)((char *)a1 + v11[13]) = *(_QWORD *)((char *)a2 + v11[13]);
    v28 = v11[14];
    v42 = (char *)a2 + v28;
    v45 = (char *)a1 + v28;
    v29 = sub_23C480790();
    v30 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v29 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v30(v45, v42, v29);
    *(_QWORD *)((char *)a1 + v11[15]) = *(_QWORD *)((char *)a2 + v11[15]);
    (*(void (**)(_QWORD *, _QWORD, uint64_t, int *))(v12 + 56))(a1, 0, 1, v11);
  }
  (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  return a1;
}

_OWORD *initializeWithTake for PreviousPlanLockupLoadState(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7508);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v7 + 48))(a2, 2, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v8 = (int *)type metadata accessor for PreviousPlanDetail();
    v9 = *((_QWORD *)v8 - 1);
    if ((*(unsigned int (**)(_OWORD *, uint64_t, int *))(v9 + 48))(a2, 1, v8))
    {
      memcpy(a1, a2, *(_QWORD *)(v7 + 64));
    }
    else
    {
      v10 = a2[1];
      *a1 = *a2;
      a1[1] = v10;
      v11 = a2[3];
      a1[2] = a2[2];
      a1[3] = v11;
      v12 = v8[8];
      v13 = (char *)a1 + v12;
      v14 = (char *)a2 + v12;
      v15 = sub_23C48076C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v13, v14, v15);
      *(_QWORD *)((char *)a1 + v8[9]) = *(_QWORD *)((char *)a2 + v8[9]);
      *(_QWORD *)((char *)a1 + v8[10]) = *(_QWORD *)((char *)a2 + v8[10]);
      *(_QWORD *)((char *)a1 + v8[11]) = *(_QWORD *)((char *)a2 + v8[11]);
      *((_BYTE *)a1 + v8[12]) = *((_BYTE *)a2 + v8[12]);
      *(_QWORD *)((char *)a1 + v8[13]) = *(_QWORD *)((char *)a2 + v8[13]);
      v16 = v8[14];
      v17 = (char *)a1 + v16;
      v18 = (char *)a2 + v16;
      v19 = sub_23C480790();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v17, v18, v19);
      *(_QWORD *)((char *)a1 + v8[15]) = *(_QWORD *)((char *)a2 + v8[15]);
      (*(void (**)(_OWORD *, _QWORD, uint64_t, int *))(v9 + 56))(a1, 0, 1, v8);
    }
    (*(void (**)(_OWORD *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  }
  return a1;
}

_OWORD *assignWithTake for PreviousPlanLockupLoadState(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(_OWORD *, uint64_t, uint64_t);
  int v9;
  int v10;
  int *v11;
  uint64_t v12;
  size_t v13;
  int *v14;
  uint64_t v15;
  uint64_t (*v16)(_OWORD *, uint64_t, int *);
  int v17;
  int v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7508);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(_OWORD *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 2, v6);
  v10 = v8(a2, 2, v6);
  if (!v9)
  {
    if (!v10)
    {
      v14 = (int *)type metadata accessor for PreviousPlanDetail();
      v15 = *((_QWORD *)v14 - 1);
      v16 = *(uint64_t (**)(_OWORD *, uint64_t, int *))(v15 + 48);
      v17 = v16(a1, 1, v14);
      v18 = v16(a2, 1, v14);
      if (v17)
      {
        if (!v18)
        {
          v19 = a2[1];
          *a1 = *a2;
          a1[1] = v19;
          v20 = a2[3];
          a1[2] = a2[2];
          a1[3] = v20;
          v21 = v14[8];
          v22 = (char *)a1 + v21;
          v23 = (char *)a2 + v21;
          v24 = sub_23C48076C();
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 32))(v22, v23, v24);
          *(_QWORD *)((char *)a1 + v14[9]) = *(_QWORD *)((char *)a2 + v14[9]);
          *(_QWORD *)((char *)a1 + v14[10]) = *(_QWORD *)((char *)a2 + v14[10]);
          *(_QWORD *)((char *)a1 + v14[11]) = *(_QWORD *)((char *)a2 + v14[11]);
          *((_BYTE *)a1 + v14[12]) = *((_BYTE *)a2 + v14[12]);
          *(_QWORD *)((char *)a1 + v14[13]) = *(_QWORD *)((char *)a2 + v14[13]);
          v25 = v14[14];
          v26 = (char *)a1 + v25;
          v27 = (char *)a2 + v25;
          v28 = sub_23C480790();
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v28 - 8) + 32))(v26, v27, v28);
          *(_QWORD *)((char *)a1 + v14[15]) = *(_QWORD *)((char *)a2 + v14[15]);
          (*(void (**)(_OWORD *, _QWORD, uint64_t, int *))(v15 + 56))(a1, 0, 1, v14);
          return a1;
        }
      }
      else
      {
        if (!v18)
        {
          v40 = *((_QWORD *)a2 + 1);
          *(_QWORD *)a1 = *(_QWORD *)a2;
          *((_QWORD *)a1 + 1) = v40;
          swift_bridgeObjectRelease();
          v41 = *((_QWORD *)a2 + 3);
          *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
          *((_QWORD *)a1 + 3) = v41;
          swift_bridgeObjectRelease();
          v42 = *((_QWORD *)a2 + 5);
          *((_QWORD *)a1 + 4) = *((_QWORD *)a2 + 4);
          *((_QWORD *)a1 + 5) = v42;
          swift_bridgeObjectRelease();
          v43 = *((_QWORD *)a2 + 7);
          *((_QWORD *)a1 + 6) = *((_QWORD *)a2 + 6);
          *((_QWORD *)a1 + 7) = v43;
          swift_bridgeObjectRelease();
          v44 = v14[8];
          v45 = (char *)a1 + v44;
          v46 = (char *)a2 + v44;
          v47 = sub_23C48076C();
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v47 - 8) + 40))(v45, v46, v47);
          *(_QWORD *)((char *)a1 + v14[9]) = *(_QWORD *)((char *)a2 + v14[9]);
          *(_QWORD *)((char *)a1 + v14[10]) = *(_QWORD *)((char *)a2 + v14[10]);
          swift_bridgeObjectRelease();
          *(_QWORD *)((char *)a1 + v14[11]) = *(_QWORD *)((char *)a2 + v14[11]);
          swift_bridgeObjectRelease();
          *((_BYTE *)a1 + v14[12]) = *((_BYTE *)a2 + v14[12]);
          *(_QWORD *)((char *)a1 + v14[13]) = *(_QWORD *)((char *)a2 + v14[13]);
          swift_bridgeObjectRelease();
          v48 = v14[14];
          v49 = (char *)a1 + v48;
          v50 = (char *)a2 + v48;
          v51 = sub_23C480790();
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v51 - 8) + 40))(v49, v50, v51);
          *(_QWORD *)((char *)a1 + v14[15]) = *(_QWORD *)((char *)a2 + v14[15]);
          return a1;
        }
        sub_23C46B588((uint64_t)a1, (uint64_t (*)(_QWORD))type metadata accessor for PreviousPlanDetail);
      }
      v13 = *(_QWORD *)(v7 + 64);
      goto LABEL_8;
    }
    sub_23C46FA40((uint64_t)a1, &qword_256BA7508);
LABEL_7:
    v13 = *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64);
LABEL_8:
    memcpy(a1, a2, v13);
    return a1;
  }
  if (v10)
    goto LABEL_7;
  v11 = (int *)type metadata accessor for PreviousPlanDetail();
  v12 = *((_QWORD *)v11 - 1);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, int *))(v12 + 48))(a2, 1, v11))
  {
    memcpy(a1, a2, *(_QWORD *)(v7 + 64));
  }
  else
  {
    v29 = a2[1];
    *a1 = *a2;
    a1[1] = v29;
    v30 = a2[3];
    a1[2] = a2[2];
    a1[3] = v30;
    v31 = v11[8];
    v32 = (char *)a1 + v31;
    v33 = (char *)a2 + v31;
    v34 = sub_23C48076C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v34 - 8) + 32))(v32, v33, v34);
    *(_QWORD *)((char *)a1 + v11[9]) = *(_QWORD *)((char *)a2 + v11[9]);
    *(_QWORD *)((char *)a1 + v11[10]) = *(_QWORD *)((char *)a2 + v11[10]);
    *(_QWORD *)((char *)a1 + v11[11]) = *(_QWORD *)((char *)a2 + v11[11]);
    *((_BYTE *)a1 + v11[12]) = *((_BYTE *)a2 + v11[12]);
    *(_QWORD *)((char *)a1 + v11[13]) = *(_QWORD *)((char *)a2 + v11[13]);
    v35 = v11[14];
    v36 = (char *)a1 + v35;
    v37 = (char *)a2 + v35;
    v38 = sub_23C480790();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v38 - 8) + 32))(v36, v37, v38);
    *(_QWORD *)((char *)a1 + v11[15]) = *(_QWORD *)((char *)a2 + v11[15]);
    (*(void (**)(_OWORD *, _QWORD, uint64_t, int *))(v12 + 56))(a1, 0, 1, v11);
  }
  (*(void (**)(_OWORD *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for PreviousPlanLockupLoadState()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C46F2C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int v5;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7508);
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 3)
    return v5 - 2;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for PreviousPlanLockupLoadState()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C46F324(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  if (a2)
    v5 = (a2 + 2);
  else
    v5 = 0;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7508);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a1, v5, a3, v6);
}

uint64_t sub_23C46F37C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7508);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 2, v2);
}

uint64_t sub_23C46F3B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7508);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, 2, v4);
}

void sub_23C46F3FC()
{
  unint64_t v0;

  sub_23C46F450();
  if (v0 <= 0x3F)
    swift_initEnumMetadataSinglePayload();
}

void sub_23C46F450()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256BA7748)
  {
    type metadata accessor for PreviousPlanDetail();
    v0 = sub_23C480C64();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256BA7748);
  }
}

uint64_t storeEnumTagSinglePayload for PreviousPlanLockupLoadState.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C46F4F0 + 4 * byte_23C4826D5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23C46F524 + 4 * byte_23C4826D0[v4]))();
}

uint64_t sub_23C46F524(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C46F52C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C46F534);
  return result;
}

uint64_t sub_23C46F540(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C46F548);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23C46F54C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C46F554(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PreviousPlanLockupLoadState.CodingKeys()
{
  return &type metadata for PreviousPlanLockupLoadState.CodingKeys;
}

ValueMetadata *type metadata accessor for PreviousPlanLockupLoadState.IdleCodingKeys()
{
  return &type metadata for PreviousPlanLockupLoadState.IdleCodingKeys;
}

ValueMetadata *type metadata accessor for PreviousPlanLockupLoadState.FetchingCodingKeys()
{
  return &type metadata for PreviousPlanLockupLoadState.FetchingCodingKeys;
}

uint64_t storeEnumTagSinglePayload for PreviousPlanLockupLoadState.FetchedCodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23C46F5D0 + 4 * byte_23C4826DA[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23C46F5F0 + 4 * byte_23C4826DF[v4]))();
}

_BYTE *sub_23C46F5D0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23C46F5F0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C46F5F8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C46F600(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C46F608(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C46F610(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for PreviousPlanLockupLoadState.FetchedCodingKeys()
{
  return &type metadata for PreviousPlanLockupLoadState.FetchedCodingKeys;
}

unint64_t sub_23C46F630()
{
  unint64_t result;

  result = qword_256BA7750;
  if (!qword_256BA7750)
  {
    result = MEMORY[0x24261FFB0](&unk_23C4828B4, &type metadata for PreviousPlanLockupLoadState.FetchedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7750);
  }
  return result;
}

unint64_t sub_23C46F678()
{
  unint64_t result;

  result = qword_256BA7758;
  if (!qword_256BA7758)
  {
    result = MEMORY[0x24261FFB0](&unk_23C482A0C, &type metadata for PreviousPlanLockupLoadState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7758);
  }
  return result;
}

unint64_t sub_23C46F6C0()
{
  unint64_t result;

  result = qword_256BA7760;
  if (!qword_256BA7760)
  {
    result = MEMORY[0x24261FFB0](&unk_23C48292C, &type metadata for PreviousPlanLockupLoadState.IdleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7760);
  }
  return result;
}

unint64_t sub_23C46F708()
{
  unint64_t result;

  result = qword_256BA7768;
  if (!qword_256BA7768)
  {
    result = MEMORY[0x24261FFB0](&unk_23C482954, &type metadata for PreviousPlanLockupLoadState.IdleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7768);
  }
  return result;
}

unint64_t sub_23C46F750()
{
  unint64_t result;

  result = qword_256BA7770;
  if (!qword_256BA7770)
  {
    result = MEMORY[0x24261FFB0](&unk_23C4828DC, &type metadata for PreviousPlanLockupLoadState.FetchingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7770);
  }
  return result;
}

unint64_t sub_23C46F798()
{
  unint64_t result;

  result = qword_256BA7778;
  if (!qword_256BA7778)
  {
    result = MEMORY[0x24261FFB0](&unk_23C482904, &type metadata for PreviousPlanLockupLoadState.FetchingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7778);
  }
  return result;
}

unint64_t sub_23C46F7E0()
{
  unint64_t result;

  result = qword_256BA7780;
  if (!qword_256BA7780)
  {
    result = MEMORY[0x24261FFB0](&unk_23C482824, &type metadata for PreviousPlanLockupLoadState.FetchedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7780);
  }
  return result;
}

unint64_t sub_23C46F828()
{
  unint64_t result;

  result = qword_256BA7788;
  if (!qword_256BA7788)
  {
    result = MEMORY[0x24261FFB0](&unk_23C48284C, &type metadata for PreviousPlanLockupLoadState.FetchedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7788);
  }
  return result;
}

unint64_t sub_23C46F870()
{
  unint64_t result;

  result = qword_256BA7790;
  if (!qword_256BA7790)
  {
    result = MEMORY[0x24261FFB0](&unk_23C48297C, &type metadata for PreviousPlanLockupLoadState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7790);
  }
  return result;
}

unint64_t sub_23C46F8B8()
{
  unint64_t result;

  result = qword_256BA7798;
  if (!qword_256BA7798)
  {
    result = MEMORY[0x24261FFB0](&unk_23C4829A4, &type metadata for PreviousPlanLockupLoadState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7798);
  }
  return result;
}

uint64_t sub_23C46F8FC(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 1701602409 && a2 == 0xE400000000000000;
  if (v2 || (sub_23C480D54() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x676E696863746566 && a2 == 0xE800000000000000 || (sub_23C480D54() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x64656863746566 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_23C480D54();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_23C46FA40(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23C46FA7C()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7878);
  sub_23C480A60();
  return v1;
}

uint64_t sub_23C46FACC()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7868);
  sub_23C469CBC(&qword_256BA7870, &qword_256BA7868, MEMORY[0x24BE2B5E8]);
  return sub_23C480814();
}

uint64_t PreviousPlanLockupView.init(store:artworkViewBuilder:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t result;
  char v11;
  uint64_t v12;

  sub_23C480A48();
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a1;
  *(_QWORD *)(result + 24) = a2;
  *(_BYTE *)a5 = v11;
  *(_QWORD *)(a5 + 8) = v12;
  *(_QWORD *)(a5 + 16) = sub_23C46FC00;
  *(_QWORD *)(a5 + 24) = result;
  *(_BYTE *)(a5 + 32) = 0;
  *(_QWORD *)(a5 + 40) = a3;
  *(_QWORD *)(a5 + 48) = a4;
  return result;
}

uint64_t sub_23C46FBDC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23C46FC00()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t PreviousPlanLockupView.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  __int128 *v3;
  __int128 *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
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
  __int128 *v44;
  uint64_t v45;
  _QWORD v46[2];
  _QWORD v47[2];
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  _QWORD v56[2];
  _QWORD v57[2];
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;

  v4 = v3;
  v41 = a3;
  v5 = *(_QWORD *)(a1 + 24);
  v40 = *(_QWORD *)(a1 + 16);
  v39 = v5;
  v6 = type metadata accessor for LockupView(255, v40, v5, a2);
  v7 = sub_23C48082C();
  v57[0] = MEMORY[0x24261FFB0](&protocol conformance descriptor for LockupView<A>, v6);
  v57[1] = MEMORY[0x24BDEDBB8];
  v8 = MEMORY[0x24BDED308];
  v9 = MEMORY[0x24261FFB0](MEMORY[0x24BDED308], v7, v57);
  v48 = v7;
  v49 = v9;
  MEMORY[0x24261FF80](255, &v48, MEMORY[0x24BDF3948], 0);
  v48 = v7;
  v49 = v9;
  swift_getOpaqueTypeConformance2();
  v10 = sub_23C480A84();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256BA77B0);
  v11 = sub_23C48082C();
  v12 = sub_23C469CBC(&qword_256BA77B8, &qword_256BA77B0, MEMORY[0x24BDEDC10]);
  v56[0] = v9;
  v56[1] = v12;
  MEMORY[0x24261FFB0](v8, v11, v56);
  v13 = sub_23C480A84();
  v37 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256BA77C0);
  v36 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256BA77C8);
  v35 = type metadata accessor for RepeatReplaceAlertDetailView();
  v34 = MEMORY[0x24261FFB0](MEMORY[0x24BDF43B0], v13);
  v33 = sub_23C469CBC(&qword_256BA77D0, &qword_256BA77C0, MEMORY[0x24BDF5428]);
  v14 = sub_23C470074();
  v15 = sub_23C46A7F0(qword_256BA77E0, (uint64_t (*)(uint64_t))type metadata accessor for RepeatReplaceAlertDetailView, (uint64_t)&protocol conformance descriptor for RepeatReplaceAlertDetailView);
  v48 = v13;
  v49 = v37;
  v50 = v36;
  v51 = v35;
  v52 = v34;
  v53 = v33;
  v54 = v14;
  v55 = v15;
  MEMORY[0x24261FF80](255, &v48, MEMORY[0x24BDF3588], 0);
  v16 = v10;
  v17 = sub_23C4808E0();
  v18 = sub_23C4808E0();
  v19 = sub_23C480A30();
  v38 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)&v32 - v20;
  v22 = v4[1];
  v58 = *v4;
  v59 = v22;
  v60 = v4[2];
  v61 = *((_QWORD *)v4 + 6);
  v23 = v40;
  v42 = v40;
  v24 = v39;
  v43 = v39;
  v44 = &v58;
  v25 = MEMORY[0x24261FFB0](MEMORY[0x24BDF43B0], v16);
  v48 = v13;
  v49 = v37;
  v50 = v36;
  v51 = v35;
  v52 = v34;
  v53 = v33;
  v54 = v14;
  v55 = v15;
  v47[0] = swift_getOpaqueTypeConformance2();
  v47[1] = v25;
  v26 = MEMORY[0x24BDEF3E0];
  v27 = MEMORY[0x24261FFB0](MEMORY[0x24BDEF3E0], v17, v47);
  v46[0] = v25;
  v46[1] = v27;
  v28 = MEMORY[0x24261FFB0](v26, v18, v46);
  sub_23C480A24();
  v29 = swift_allocObject();
  *(_QWORD *)(v29 + 16) = v23;
  *(_QWORD *)(v29 + 24) = v24;
  v30 = v59;
  *(_OWORD *)(v29 + 32) = v58;
  *(_OWORD *)(v29 + 48) = v30;
  *(_OWORD *)(v29 + 64) = v60;
  *(_QWORD *)(v29 + 80) = v61;
  sub_23C473430((uint64_t)&v58);
  v45 = v28;
  MEMORY[0x24261FFB0](MEMORY[0x24BDF3F50], v19, &v45);
  sub_23C4809DC();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v21, v19);
}

unint64_t sub_23C470074()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256BA77D8;
  if (!qword_256BA77D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256BA77C8);
    v2[0] = MEMORY[0x24BDF1F80];
    v2[1] = MEMORY[0x24BDF1F80];
    result = MEMORY[0x24261FFB0](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256BA77D8);
  }
  return result;
}

uint64_t sub_23C4700D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unsigned __int8 *v5;
  unsigned __int8 *v6;
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
  char *v18;
  uint64_t v19;
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
  void (*v32)(char *, uint64_t);
  char *v33;
  id v34;
  uint64_t v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  __int128 v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  __int128 v63;

  v53 = a4;
  v54 = a5;
  v52 = a3;
  v6 = v5;
  v55 = a1;
  v56 = a2;
  v7 = sub_23C4807A8();
  MEMORY[0x24BDAC7A8](v7);
  v57 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23C480B98();
  MEMORY[0x24BDAC7A8](v9);
  v41 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_23C480B80();
  MEMORY[0x24BDAC7A8](v11);
  v51 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = sub_23C480700();
  v43 = *(_QWORD *)(v50 - 8);
  MEMORY[0x24BDAC7A8](v50);
  v42 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = sub_23C480718();
  v39 = *(_QWORD *)(v40 - 8);
  MEMORY[0x24BDAC7A8](v40);
  v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = sub_23C480730();
  v16 = *(_QWORD *)(v38 - 8);
  MEMORY[0x24BDAC7A8](v38);
  v18 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_23C480748();
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v37 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v23);
  v25 = (char *)&v37 - v24;
  MEMORY[0x24BDAC7A8](v26);
  v28 = (char *)&v37 - v27;
  MEMORY[0x24BDAC7A8](v29);
  v31 = (char *)&v37 - v30;
  v48 = *v6;
  v47 = *((_QWORD *)v6 + 1);
  v46 = *((_QWORD *)v6 + 2);
  v45 = *((_QWORD *)v6 + 3);
  v44 = v6[32];
  v49 = *(_OWORD *)(v6 + 40);
  MEMORY[0x24261F6E0]();
  sub_23C480724();
  sub_23C48073C();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v38);
  v32 = *(void (**)(char *, uint64_t))(v20 + 8);
  v32(v22, v19);
  sub_23C48070C();
  sub_23C4806E8();
  (*(void (**)(char *, uint64_t))(v39 + 8))(v15, v40);
  v32(v25, v19);
  v33 = v42;
  sub_23C4806F4();
  sub_23C4806DC();
  (*(void (**)(char *, uint64_t))(v43 + 8))(v33, v50);
  v32(v28, v19);
  sub_23C480B74();
  sub_23C480B68();
  sub_23C48076C();
  sub_23C46A7F0(&qword_256BA7880, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE2A0], MEMORY[0x24BDCE290]);
  sub_23C468EE0();
  sub_23C480B44();
  sub_23C480B68();
  sub_23C480B8C();
  if (qword_256BA7110 != -1)
    swift_once();
  v58 = v48;
  v59 = v47;
  v60 = v46;
  v61 = v45;
  v62 = v44;
  v63 = v49;
  v34 = (id)qword_256BADA90;
  sub_23C46FACC();
  swift_getKeyPath();
  sub_23C480B08();
  swift_release();
  swift_release();
  v35 = sub_23C480BB0();
  v32(v31, v19);
  return v35;
}

uint64_t sub_23C47059C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
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
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __n128 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t OpaqueTypeConformance2;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t State;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  __int128 v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  __int128 v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void (*v68)(uint64_t, uint64_t);
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  __int128 v83;
  uint64_t v84;
  uint64_t v85;
  void (*v86)(uint64_t, uint64_t);
  uint64_t v87;
  unint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  __int128 v95;
  __int128 v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  char v101;
  __int128 v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  char v110;
  char *v111;
  unint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void (*v116)(uint64_t, uint64_t);
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  unint64_t v122;
  uint64_t v123;
  void (*v124)(uint64_t, uint64_t);
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  char *v136;
  char *v137;
  char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  char *v147;
  char *v148;
  char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t *v154;
  uint64_t v155;
  char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  unint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  _QWORD v175[2];
  _QWORD v176[2];
  _QWORD v177[2];
  _QWORD v178[2];
  __int128 v179;
  __int128 v180;
  __int128 v181;
  unint64_t v182;
  uint64_t v183;
  _QWORD v184[2];
  _QWORD v185[2];

  v166 = a3;
  v159 = a2;
  v160 = a1;
  v165 = a4;
  v6 = sub_23C4807A8();
  MEMORY[0x24BDAC7A8](v6);
  v138 = (char *)&v131 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23C480B98();
  MEMORY[0x24BDAC7A8](v8);
  v137 = (char *)&v131 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_23C480B80();
  MEMORY[0x24BDAC7A8](v10);
  v136 = (char *)&v131 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for LockupView(255, a2, a3, v12);
  v14 = sub_23C48082C();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256BA77B0);
  v15 = sub_23C48082C();
  v185[0] = MEMORY[0x24261FFB0](&protocol conformance descriptor for LockupView<A>, v13);
  v185[1] = MEMORY[0x24BDEDBB8];
  v16 = MEMORY[0x24BDED308];
  v17 = MEMORY[0x24261FFB0](MEMORY[0x24BDED308], v14, v185);
  v18 = sub_23C469CBC(&qword_256BA77B8, &qword_256BA77B0, MEMORY[0x24BDEDC10]);
  v184[0] = v17;
  v184[1] = v18;
  v19 = MEMORY[0x24261FFB0](v16, v15, v184);
  v135 = v15;
  v134 = v19;
  v20 = sub_23C480A84();
  v142 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v147 = (char *)&v131 - v21;
  v22 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256BA77C0);
  v23 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256BA77C8);
  v24 = type metadata accessor for RepeatReplaceAlertDetailView();
  v25 = MEMORY[0x24261FFB0](MEMORY[0x24BDF43B0], v20);
  v26 = sub_23C469CBC(&qword_256BA77D0, &qword_256BA77C0, MEMORY[0x24BDF5428]);
  v27 = sub_23C470074();
  v28 = sub_23C46A7F0(qword_256BA77E0, (uint64_t (*)(uint64_t))type metadata accessor for RepeatReplaceAlertDetailView, (uint64_t)&protocol conformance descriptor for RepeatReplaceAlertDetailView);
  v172 = v20;
  *(_QWORD *)&v179 = v20;
  *((_QWORD *)&v179 + 1) = v22;
  v174 = v22;
  v171 = v23;
  *(_QWORD *)&v180 = v23;
  *((_QWORD *)&v180 + 1) = v24;
  v173 = v24;
  v170 = v25;
  *(_QWORD *)&v181 = v25;
  *((_QWORD *)&v181 + 1) = v26;
  v168 = v26;
  v167 = v27;
  v182 = v27;
  v183 = v28;
  v169 = v28;
  v29 = MEMORY[0x24261FF80](0, &v179, MEMORY[0x24BDF3588], 0);
  v139 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v141 = (uint64_t)&v131 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v31);
  v146 = (uint64_t)&v131 - v32;
  MEMORY[0x24BDAC7A8](v33);
  v140 = (uint64_t)&v131 - v34;
  v145 = type metadata accessor for PreviousPlanDetail();
  v144 = *(_QWORD *)(v145 - 8);
  v35 = MEMORY[0x24BDAC7A8](v145);
  v152 = (uint64_t)&v131 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v179 = v14;
  *((_QWORD *)&v179 + 1) = v17;
  v37 = MEMORY[0x24261FF80](255, &v179, MEMORY[0x24BDF3948], 0, v35);
  *(_QWORD *)&v179 = v14;
  *((_QWORD *)&v179 + 1) = v17;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v155 = v37;
  v154 = (uint64_t *)OpaqueTypeConformance2;
  v39 = sub_23C480A84();
  v151 = v29;
  v40 = sub_23C4808E0();
  v150 = *(_QWORD *)(v40 - 8);
  MEMORY[0x24BDAC7A8](v40);
  v149 = (char *)&v131 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v42);
  v148 = (char *)&v131 - v43;
  v158 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7508);
  v44 = *(_QWORD *)(v158 - 8);
  MEMORY[0x24BDAC7A8](v158);
  v143 = (uint64_t)&v131 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v46);
  v153 = (uint64_t)&v131 - v47;
  v48 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v49);
  v156 = (char *)&v131 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v51);
  v157 = (uint64_t)&v131 - v52;
  State = type metadata accessor for PreviousPlanLockupLoadState();
  MEMORY[0x24BDAC7A8](State);
  v55 = (char *)&v131 - ((v54 + 15) & 0xFFFFFFFFFFFFFFF0);
  v164 = v40;
  v163 = sub_23C4808E0();
  v162 = *(_QWORD *)(v163 - 8);
  MEMORY[0x24BDAC7A8](v163);
  v161 = (char *)&v131 - v56;
  v57 = *(_OWORD *)(v160 + 16);
  v179 = *(_OWORD *)v160;
  v180 = v57;
  v181 = *(_OWORD *)(v160 + 32);
  v58 = v160;
  v182 = *(_QWORD *)(v160 + 48);
  v59 = v159;
  v60 = v166;
  v62 = type metadata accessor for PreviousPlanLockupView(0, v159, v166, v61);
  sub_23C46FACC();
  swift_getKeyPath();
  sub_23C480B08();
  swift_release();
  swift_release();
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v44 + 48))(v55, 2, v158))
  {
    v132 = v48;
    v133 = v62;
    v77 = v152;
    v158 = v39;
    v78 = v153;
    sub_23C46E0D4((uint64_t)v55, v153);
    v79 = v78;
    v80 = v143;
    sub_23C46E1E8(v79, v143);
    v81 = v145;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v144 + 48))(v80, 1, v145) == 1)
    {
      sub_23C46FA40(v80, &qword_256BA7508);
      v82 = swift_allocObject();
      *(_QWORD *)(v82 + 16) = v59;
      *(_QWORD *)(v82 + 24) = v60;
      v83 = *(_OWORD *)(v58 + 16);
      *(_OWORD *)(v82 + 32) = *(_OWORD *)v58;
      *(_OWORD *)(v82 + 48) = v83;
      *(_OWORD *)(v82 + 64) = *(_OWORD *)(v58 + 32);
      *(_QWORD *)(v82 + 80) = *(_QWORD *)(v58 + 48);
      MEMORY[0x24BDAC7A8](v82);
      sub_23C473430(v58);
      v84 = (uint64_t)v156;
      sub_23C480A78();
      v39 = v158;
      MEMORY[0x24261FFB0](MEMORY[0x24BDF43B0], v158);
      v85 = v157;
      sub_23C47FA6C(v84, v39, v157);
      v86 = *(void (**)(uint64_t, uint64_t))(v132 + 8);
      v86(v84, v39);
      sub_23C47D9B0(v85, v39, v84);
      *(_QWORD *)&v179 = v172;
      *((_QWORD *)&v179 + 1) = v174;
      v87 = v171;
      *(_QWORD *)&v180 = v171;
      *((_QWORD *)&v180 + 1) = v173;
      *(_QWORD *)&v181 = v170;
      *((_QWORD *)&v181 + 1) = v168;
      v88 = v167;
      v89 = v169;
      v182 = v167;
      v183 = v169;
      swift_getOpaqueTypeConformance2();
      v90 = (uint64_t)v148;
      sub_23C472AC4(v84, v151, v39);
      v91 = v88;
      v86(v84, v39);
      v92 = v85;
      v93 = v89;
      v86(v92, v39);
LABEL_10:
      v119 = (uint64_t)v149;
      *(_QWORD *)&v179 = v172;
      *((_QWORD *)&v179 + 1) = v174;
      *(_QWORD *)&v180 = v87;
      *((_QWORD *)&v180 + 1) = v173;
      v75 = v170;
      v76 = v168;
      *(_QWORD *)&v181 = v170;
      *((_QWORD *)&v181 + 1) = v168;
      v182 = v91;
      v183 = v93;
      v120 = swift_getOpaqueTypeConformance2();
      v121 = MEMORY[0x24261FFB0](MEMORY[0x24BDF43B0], v39);
      v178[0] = v120;
      v178[1] = v121;
      v70 = v164;
      MEMORY[0x24261FFB0](MEMORY[0x24BDEF3E0], v164, v178);
      sub_23C47D9B0(v90, v70, v119);
      v122 = v91;
      v123 = v90;
      v73 = (uint64_t)v161;
      v74 = v174;
      sub_23C472AC4(v119, v39, v70);
      v124 = *(void (**)(uint64_t, uint64_t))(v150 + 8);
      v124(v119, v70);
      v125 = v123;
      v71 = v122;
      v72 = v169;
      v124(v125, v70);
      sub_23C46FA40(v153, &qword_256BA7508);
      goto LABEL_11;
    }
    sub_23C4654A4(v80, v77);
    v94 = swift_allocObject();
    *(_QWORD *)(v94 + 16) = v59;
    *(_QWORD *)(v94 + 24) = v60;
    v95 = *(_OWORD *)(v58 + 16);
    *(_OWORD *)(v94 + 32) = *(_OWORD *)v58;
    *(_OWORD *)(v94 + 48) = v95;
    *(_OWORD *)(v94 + 64) = *(_OWORD *)(v58 + 32);
    *(_QWORD *)(v94 + 80) = *(_QWORD *)(v58 + 48);
    MEMORY[0x24BDAC7A8](v94);
    sub_23C473430(v58);
    sub_23C480A78();
    if (*(_BYTE *)(v77 + *(int *)(v81 + 48)) == 1)
    {
      sub_23C480B74();
      sub_23C480B68();
      swift_bridgeObjectRetain();
      sub_23C480B5C();
      swift_bridgeObjectRelease();
      sub_23C480B68();
      sub_23C480B8C();
      if (qword_256BA7110 == -1)
        goto LABEL_9;
    }
    else
    {
      sub_23C480B74();
      sub_23C480B68();
      swift_bridgeObjectRetain();
      sub_23C480B5C();
      swift_bridgeObjectRelease();
      sub_23C480B68();
      sub_23C480B8C();
      if (qword_256BA7110 == -1)
      {
LABEL_9:
        v96 = *(_OWORD *)(v58 + 16);
        v179 = *(_OWORD *)v58;
        v180 = v96;
        v181 = *(_OWORD *)(v58 + 32);
        v182 = *(_QWORD *)(v58 + 48);
        (id)qword_256BADA90;
        sub_23C46FACC();
        swift_getKeyPath();
        sub_23C480B08();
        swift_release();
        swift_release();
        *(_QWORD *)&v179 = sub_23C480BB0();
        *((_QWORD *)&v179 + 1) = v97;
        sub_23C468EE0();
        v157 = sub_23C480964();
        v99 = v98;
        v156 = v100;
        LODWORD(v155) = v101 & 1;
        v102 = *(_OWORD *)(v58 + 16);
        v179 = *(_OWORD *)v58;
        v180 = v102;
        v181 = *(_OWORD *)(v58 + 32);
        v182 = *(_QWORD *)(v58 + 48);
        v145 = sub_23C46FA7C();
        v144 = v103;
        v154 = &v131;
        MEMORY[0x24BDAC7A8](v145);
        MEMORY[0x24BDAC7A8](v104);
        MEMORY[0x24BDAC7A8](v105);
        v166 = swift_checkMetadataState();
        v106 = v168;
        v107 = v170;
        v108 = v172;
        v109 = v157;
        v110 = v155;
        v111 = v147;
        sub_23C4809AC();
        swift_release();
        swift_release();
        v87 = v171;
        sub_23C468E50(v109, v99, v110);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v142 + 8))(v111, v108);
        *(_QWORD *)&v179 = v108;
        *((_QWORD *)&v179 + 1) = v174;
        *(_QWORD *)&v180 = v87;
        *((_QWORD *)&v180 + 1) = v166;
        v93 = v169;
        *(_QWORD *)&v181 = v107;
        *((_QWORD *)&v181 + 1) = v106;
        v112 = v167;
        v182 = v167;
        v183 = v169;
        swift_getOpaqueTypeConformance2();
        v113 = v140;
        v114 = v146;
        v115 = v151;
        sub_23C47FA6C(v146, v151, v140);
        v116 = *(void (**)(uint64_t, uint64_t))(v139 + 8);
        v116(v114, v115);
        v117 = v141;
        sub_23C47D9B0(v113, v115, v141);
        v39 = v158;
        MEMORY[0x24261FFB0](MEMORY[0x24BDF43B0], v158);
        v90 = (uint64_t)v148;
        sub_23C472A00(v117, v115);
        v118 = v117;
        v91 = v112;
        v116(v118, v115);
        v116(v113, v115);
        sub_23C46B588(v152, (uint64_t (*)(_QWORD))type metadata accessor for PreviousPlanDetail);
        goto LABEL_10;
      }
    }
    swift_once();
    goto LABEL_9;
  }
  v63 = swift_allocObject();
  *(_QWORD *)(v63 + 16) = v59;
  *(_QWORD *)(v63 + 24) = v60;
  v64 = *(_OWORD *)(v58 + 16);
  *(_OWORD *)(v63 + 32) = *(_OWORD *)v58;
  *(_OWORD *)(v63 + 48) = v64;
  *(_OWORD *)(v63 + 64) = *(_OWORD *)(v58 + 32);
  *(_QWORD *)(v63 + 80) = *(_QWORD *)(v58 + 48);
  MEMORY[0x24BDAC7A8](v63);
  sub_23C473430(v58);
  v65 = (uint64_t)v156;
  sub_23C480A78();
  v66 = MEMORY[0x24261FFB0](MEMORY[0x24BDF43B0], v39);
  v67 = v157;
  sub_23C47FA6C(v65, v39, v157);
  v68 = *(void (**)(uint64_t, uint64_t))(v48 + 8);
  v68(v65, v39);
  sub_23C47D9B0(v67, v39, v65);
  *(_QWORD *)&v179 = v172;
  *((_QWORD *)&v179 + 1) = v174;
  *(_QWORD *)&v180 = v171;
  *((_QWORD *)&v180 + 1) = v173;
  v69 = v168;
  *(_QWORD *)&v181 = v170;
  *((_QWORD *)&v181 + 1) = v168;
  v70 = v164;
  v71 = v167;
  v72 = v169;
  v182 = v167;
  v183 = v169;
  v175[0] = swift_getOpaqueTypeConformance2();
  v175[1] = v66;
  MEMORY[0x24261FFB0](MEMORY[0x24BDEF3E0], v70, v175);
  v73 = (uint64_t)v161;
  sub_23C472A00(v65, v39);
  v68(v65, v39);
  v68(v67, v39);
  v74 = v174;
  v75 = v170;
  v76 = v69;
LABEL_11:
  v126 = MEMORY[0x24261FFB0](MEMORY[0x24BDF43B0], v39);
  *(_QWORD *)&v179 = v172;
  *((_QWORD *)&v179 + 1) = v74;
  *(_QWORD *)&v180 = v171;
  *((_QWORD *)&v180 + 1) = v173;
  *(_QWORD *)&v181 = v75;
  *((_QWORD *)&v181 + 1) = v76;
  v182 = v71;
  v183 = v72;
  v177[0] = swift_getOpaqueTypeConformance2();
  v177[1] = v126;
  v127 = MEMORY[0x24BDEF3E0];
  v128 = MEMORY[0x24261FFB0](MEMORY[0x24BDEF3E0], v70, v177);
  v176[0] = v126;
  v176[1] = v128;
  v129 = v163;
  MEMORY[0x24261FFB0](v127, v163, v176);
  sub_23C47D9B0(v73, v129, v165);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v162 + 8))(v73, v129);
}

uint64_t sub_23C471894@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_23C47059C(v1[4], v1[2], v1[3], a1);
}

uint64_t sub_23C4718A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  char *v31;
  _OWORD *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v41;
  uint64_t (*v42)(void);
  char *v43;
  __int128 v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void (*v57)(uint64_t, uint64_t);
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  _QWORD v76[2];
  _QWORD v77[2];
  __int128 v78;
  __int128 v79;
  uint64_t v80;

  v61 = a3;
  v64 = a1;
  v75 = a5;
  v68 = sub_23C480850();
  MEMORY[0x24BDAC7A8](v68);
  v67 = (char *)&v60 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA78A8);
  MEMORY[0x24BDAC7A8](v74);
  v10 = (char *)&v60 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for PreviousPlanDetail();
  v62 = *(_QWORD *)(v11 - 8);
  v12 = *(_QWORD *)(v62 + 64);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v60 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v60 - v15;
  v18 = type metadata accessor for LockupView(0, a3, a4, v17);
  v65 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v60 - v19;
  v21 = sub_23C48082C();
  v72 = *(_QWORD *)(v21 - 8);
  v70 = v21;
  MEMORY[0x24BDAC7A8](v21);
  v63 = (char *)&v60 - v22;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256BA77B0);
  v66 = sub_23C48082C();
  v73 = *(_QWORD *)(v66 - 8);
  MEMORY[0x24BDAC7A8](v66);
  v69 = (char *)&v60 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v24);
  v71 = (uint64_t)&v60 - v25;
  v26 = v64;
  sub_23C46A830(v64, (uint64_t)v16, (uint64_t (*)(_QWORD))type metadata accessor for PreviousPlanDetail);
  sub_23C46A830(v26, (uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for PreviousPlanDetail);
  v27 = (*(unsigned __int8 *)(v62 + 80) + 88) & ~(unint64_t)*(unsigned __int8 *)(v62 + 80);
  v28 = swift_allocObject();
  v29 = v61;
  *(_QWORD *)(v28 + 16) = v61;
  *(_QWORD *)(v28 + 24) = a4;
  v30 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v28 + 32) = *(_OWORD *)a2;
  *(_OWORD *)(v28 + 48) = v30;
  *(_OWORD *)(v28 + 64) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(v28 + 80) = *(_QWORD *)(a2 + 48);
  sub_23C4654A4((uint64_t)v13, v28 + v27);
  sub_23C473430(a2);
  LockupView.init(planDetail:artworkViewBuilder:)((uint64_t)v16, (uint64_t)sub_23C473CA8, v28, v29, a4, (uint64_t)v20);
  sub_23C480AB4();
  v59 = MEMORY[0x24261FFB0](&protocol conformance descriptor for LockupView<A>, v18);
  v31 = v63;
  sub_23C4809B8();
  (*(void (**)(char *, uint64_t))(v65 + 8))(v20, v18);
  v32 = v67;
  v33 = &v67[*(int *)(v68 + 20)];
  v34 = *MEMORY[0x24BDEEB68];
  v35 = sub_23C4808A4();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 104))(v33, v34, v35);
  __asm { FMOV            V0.2D, #12.0 }
  *v32 = _Q0;
  sub_23C4809F4();
  v41 = sub_23C480A00();
  swift_release();
  sub_23C480820();
  v42 = MEMORY[0x24BDED998];
  sub_23C46A830((uint64_t)v32, (uint64_t)v10, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
  v43 = &v10[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256BA78B0) + 36)];
  v44 = v79;
  *(_OWORD *)v43 = v78;
  *((_OWORD *)v43 + 1) = v44;
  *((_QWORD *)v43 + 4) = v80;
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA78B8);
  *(_QWORD *)&v10[*(int *)(v45 + 52)] = v41;
  *(_WORD *)&v10[*(int *)(v45 + 56)] = 256;
  v46 = sub_23C480AC0();
  v48 = v47;
  v49 = (uint64_t *)&v10[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256BA78C0) + 36)];
  *v49 = v46;
  v49[1] = v48;
  sub_23C46B588((uint64_t)v32, (uint64_t (*)(_QWORD))v42);
  sub_23C480AC0();
  v77[0] = v59;
  v77[1] = MEMORY[0x24BDEDBB8];
  v50 = MEMORY[0x24BDED308];
  v51 = v70;
  v52 = MEMORY[0x24261FFB0](MEMORY[0x24BDED308], v70, v77);
  sub_23C469CBC(&qword_256BA78C8, &qword_256BA78A8, MEMORY[0x24BDED500]);
  v53 = (uint64_t)v69;
  sub_23C4809D0();
  sub_23C46FA40((uint64_t)v10, &qword_256BA78A8);
  (*(void (**)(char *, uint64_t))(v72 + 8))(v31, v51);
  v54 = sub_23C469CBC(&qword_256BA77B8, &qword_256BA77B0, MEMORY[0x24BDEDC10]);
  v76[0] = v52;
  v76[1] = v54;
  v55 = v66;
  MEMORY[0x24261FFB0](v50, v66, v76);
  v56 = v71;
  sub_23C47FA6C(v53, v55, v71);
  v57 = *(void (**)(uint64_t, uint64_t))(v73 + 8);
  v57(v53, v55);
  sub_23C47D9B0(v56, v55, v75);
  return ((uint64_t (*)(uint64_t, uint64_t))v57)(v56, v55);
}

uint64_t sub_23C471E40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void (*v14)(uint64_t, _QWORD);
  uint64_t v15;
  void (*v16)(char *, uint64_t);
  uint64_t v18;

  v7 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v18 - v11;
  v14 = *(void (**)(uint64_t, _QWORD))(v13 + 40);
  v15 = type metadata accessor for PreviousPlanDetail();
  v14(a2 + *(int *)(v15 + 56), *(_QWORD *)(a2 + *(int *)(v15 + 60)));
  sub_23C47FA6C((uint64_t)v9, a3, (uint64_t)v12);
  v16 = *(void (**)(char *, uint64_t))(v7 + 8);
  v16(v9, a3);
  sub_23C47D9B0((uint64_t)v12, a3, a4);
  return ((uint64_t (*)(char *, uint64_t))v16)(v12, a3);
}

uint64_t sub_23C471F38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X8>)
{
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
  char *v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  void (*v41)(char *, char *, uint64_t);
  char *v42;
  char *v43;
  uint64_t v44;
  void (*v45)(char *, char *, uint64_t);
  char *v46;
  char *v47;
  uint64_t v48;
  void (*v49)(char *, uint64_t);
  void (*v50)(char *, uint64_t);
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  char *v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  char *v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;

  v52 = a2;
  v66 = a5;
  v53 = type metadata accessor for PreviousPlanDetail();
  v55 = *(_QWORD *)(v53 - 8);
  MEMORY[0x24BDAC7A8](v53);
  v56 = v8;
  v57 = (uint64_t)&v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7888);
  v64 = *(_QWORD *)(v62 - 8);
  MEMORY[0x24BDAC7A8](v62);
  v65 = (char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v60 = (char *)&v52 - v11;
  MEMORY[0x24BDAC7A8](v12);
  v63 = (char *)&v52 - v13;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7890);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v52 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v52 - v18;
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7898);
  v67 = *(_QWORD *)(v58 - 8);
  MEMORY[0x24BDAC7A8](v58);
  v61 = (char *)&v52 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)&v52 - v22;
  sub_23C4807F0();
  v24 = sub_23C4807FC();
  v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56);
  v26 = 1;
  v25(v19, 0, 1, v24);
  v27 = swift_allocObject();
  *(_QWORD *)(v27 + 16) = a3;
  *(_QWORD *)(v27 + 24) = a4;
  v28 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v27 + 32) = *(_OWORD *)a1;
  *(_OWORD *)(v27 + 48) = v28;
  *(_OWORD *)(v27 + 64) = *(_OWORD *)(a1 + 32);
  *(_QWORD *)(v27 + 80) = *(_QWORD *)(a1 + 48);
  v59 = a3;
  v68 = a3;
  v69 = a4;
  v29 = a4;
  v30 = v52;
  v70 = a1;
  sub_23C473430(a1);
  v54 = v23;
  sub_23C480A6C();
  if (*(_BYTE *)(v30 + *(int *)(v53 + 48)) == 1)
  {
    sub_23C4807E4();
    v26 = 0;
  }
  v25(v16, v26, 1, v24);
  v31 = v57;
  sub_23C46A830(v30, v57, (uint64_t (*)(_QWORD))type metadata accessor for PreviousPlanDetail);
  v32 = (*(unsigned __int8 *)(v55 + 80) + 88) & ~(unint64_t)*(unsigned __int8 *)(v55 + 80);
  v33 = swift_allocObject();
  v34 = v59;
  *(_QWORD *)(v33 + 16) = v59;
  *(_QWORD *)(v33 + 24) = v29;
  v35 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v33 + 32) = *(_OWORD *)a1;
  *(_OWORD *)(v33 + 48) = v35;
  *(_OWORD *)(v33 + 64) = *(_OWORD *)(a1 + 32);
  *(_QWORD *)(v33 + 80) = *(_QWORD *)(a1 + 48);
  v36 = sub_23C4654A4(v31, v33 + v32);
  MEMORY[0x24BDAC7A8](v36);
  *(&v52 - 4) = v34;
  *(&v52 - 3) = v29;
  *(&v52 - 2) = v30;
  *(&v52 - 1) = a1;
  sub_23C473430(a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256BA77C8);
  sub_23C470074();
  v37 = v60;
  sub_23C480A6C();
  v39 = v63;
  v38 = v64;
  v40 = v62;
  (*(void (**)(char *, char *, uint64_t))(v64 + 32))(v63, v37, v62);
  v41 = *(void (**)(char *, char *, uint64_t))(v67 + 16);
  v42 = v61;
  v43 = v54;
  v44 = v58;
  v41(v61, v54, v58);
  v45 = *(void (**)(char *, char *, uint64_t))(v38 + 16);
  v46 = v65;
  v45(v65, v39, v40);
  v47 = v66;
  v41(v66, v42, v44);
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA78A0);
  v45(&v47[*(int *)(v48 + 48)], v46, v40);
  v49 = *(void (**)(char *, uint64_t))(v38 + 8);
  v49(v39, v40);
  v50 = *(void (**)(char *, uint64_t))(v67 + 8);
  v50(v43, v44);
  v49(v46, v40);
  return ((uint64_t (*)(char *, uint64_t))v50)(v42, v44);
}

uint64_t sub_23C4723A4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7878);
  return sub_23C480A54();
}

uint64_t sub_23C4723F8@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t result;
  uint64_t v12;
  char v13;
  uint64_t v14;

  v6 = sub_23C4807A8();
  MEMORY[0x24BDAC7A8](v6);
  v7 = sub_23C480B98();
  MEMORY[0x24BDAC7A8](v7);
  sub_23C480B38();
  if (qword_256BA7110 != -1)
    swift_once();
  v9 = (void *)qword_256BADA90;
  type metadata accessor for PreviousPlanLockupView(0, a1, a2, v8);
  v10 = v9;
  sub_23C46FACC();
  swift_getKeyPath();
  sub_23C480B08();
  swift_release();
  swift_release();
  sub_23C480BB0();
  sub_23C468EE0();
  result = sub_23C480964();
  *(_QWORD *)a3 = result;
  *(_QWORD *)(a3 + 8) = v12;
  *(_BYTE *)(a3 + 16) = v13 & 1;
  *(_QWORD *)(a3 + 24) = v14;
  return result;
}

uint64_t sub_23C4725AC(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _OWORD v16[3];
  uint64_t v17;
  char v18;

  v8 = type metadata accessor for PreviousPlanLockupAction();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (_QWORD *)((char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = *(_OWORD *)(a1 + 16);
  v16[0] = *(_OWORD *)a1;
  v16[1] = v11;
  v16[2] = *(_OWORD *)(a1 + 32);
  v17 = *(_QWORD *)(a1 + 48);
  type metadata accessor for PreviousPlanLockupView(0, a3, a4, v12);
  sub_23C46FACC();
  v13 = a2[1];
  *v10 = *a2;
  v10[1] = v13;
  swift_storeEnumTagMultiPayload();
  swift_bridgeObjectRetain();
  sub_23C480B14();
  swift_release();
  sub_23C46B588((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for PreviousPlanLockupAction);
  v14 = *(_QWORD *)(a1 + 8);
  LOBYTE(v16[0]) = *(_BYTE *)a1 & 1;
  *((_QWORD *)&v16[0] + 1) = v14;
  v18 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7878);
  return sub_23C480A54();
}

double sub_23C4726D8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  double result;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  v10 = sub_23C4807A8();
  MEMORY[0x24BDAC7A8](v10);
  v11 = sub_23C480B98();
  MEMORY[0x24BDAC7A8](v11);
  if (*(_BYTE *)(a1 + *(int *)(type metadata accessor for PreviousPlanDetail() + 48)) == 1)
  {
    sub_23C480B38();
    if (qword_256BA7110 == -1)
      goto LABEL_5;
    goto LABEL_6;
  }
  sub_23C480B38();
  if (qword_256BA7110 != -1)
LABEL_6:
    swift_once();
LABEL_5:
  v13 = (void *)qword_256BADA90;
  v18 = *(_OWORD *)(a2 + 16);
  v19 = *(_OWORD *)(a2 + 32);
  type metadata accessor for PreviousPlanLockupView(0, a3, a4, v12);
  v14 = v13;
  sub_23C46FACC();
  swift_getKeyPath();
  sub_23C480B08();
  swift_release();
  swift_release();
  *(_QWORD *)&v17 = sub_23C480BB0();
  *((_QWORD *)&v17 + 1) = v15;
  sub_23C468EE0();
  sub_23C480964();
  sub_23C4808D4();
  result = *(double *)&v17;
  *(_OWORD *)a5 = v17;
  *(_OWORD *)(a5 + 16) = v18;
  *(_BYTE *)(a5 + 32) = v19;
  return result;
}

uint64_t sub_23C472A00(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v4 = sub_23C4808C8();
  MEMORY[0x24BDAC7A8](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))((char *)&v7 - v5, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_23C4808D4();
}

uint64_t sub_23C472AC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v5 = sub_23C4808C8();
  MEMORY[0x24BDAC7A8](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 16))((char *)&v8 - v6, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_23C4808D4();
}

double sub_23C472B88@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double result;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  v10 = type metadata accessor for PreviousPlanDetail();
  v11 = *(unsigned __int8 *)(a1 + *(int *)(v10 + 48));
  v13 = type metadata accessor for PreviousPlanLockupView(0, a3, a4, v12);
  v18 = *(_OWORD *)(a2 + 16);
  v19 = *(_OWORD *)(a2 + 32);
  if (v11 == 1)
  {
    *(_QWORD *)&v17 = sub_23C4700D0(a1 + *(int *)(v10 + 32), v13, 63, 0xD00000000000003ELL, 0x800000023C485210);
    *((_QWORD *)&v17 + 1) = v14;
    sub_23C468EE0();
    sub_23C480964();
  }
  else
  {
    *(_QWORD *)&v17 = sub_23C4700D0(a1 + *(int *)(v10 + 32), v13, 59, 0xD00000000000003ALL, 0x800000023C4852A0);
    *((_QWORD *)&v17 + 1) = v15;
    sub_23C468EE0();
    sub_23C480964();
  }
  sub_23C4808D4();
  result = *(double *)&v17;
  *(_OWORD *)a5 = v17;
  *(_OWORD *)(a5 + 16) = v18;
  *(_BYTE *)(a5 + 32) = v19;
  return result;
}

uint64_t sub_23C472D24@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v6;

  type metadata accessor for PreviousPlanLockupView(0, a2, a3, a3);
  sub_23C46FACC();
  swift_getKeyPath();
  sub_23C480B08();
  swift_release();
  swift_release();
  v6 = type metadata accessor for RepeatReplaceAlertDetailView();
  return sub_23C46A830(a1, a4 + *(int *)(v6 + 20), (uint64_t (*)(_QWORD))type metadata accessor for PreviousPlanDetail);
}

uint64_t sub_23C472DD0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7878);
  return sub_23C480A54();
}

uint64_t sub_23C472E28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __n128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  void (*v37)(char *, uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD v56[3];

  v49 = a5;
  v41 = a4;
  v53 = a6;
  v9 = sub_23C480844();
  v51 = *(_QWORD *)(v9 - 8);
  v52 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v50 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for PreviousPlanDetail();
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = a2;
  v40 = a3;
  v15 = type metadata accessor for LockupView(0, a2, a3, v14);
  v46 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v42 = (uint64_t)&v39 - v16;
  v17 = sub_23C48082C();
  v47 = *(_QWORD *)(v17 - 8);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v45 = (char *)&v39 - v19;
  v39 = MEMORY[0x24261FFB0](&protocol conformance descriptor for LockupView<A>, v15, v18);
  v56[0] = v39;
  v56[1] = MEMORY[0x24BDEDBB8];
  v20 = MEMORY[0x24261FFB0](MEMORY[0x24BDED308], v17, v56);
  v54 = v17;
  v55 = v20;
  v43 = v20;
  v21 = MEMORY[0x24261FF80](0, &v54, MEMORY[0x24BDF3948], 0);
  v44 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)&v39 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v24);
  v26 = (char *)&v39 - v25;
  if (qword_256BA7118 != -1)
    swift_once();
  v27 = __swift_project_value_buffer(v11, (uint64_t)qword_256BA7CD8);
  v28 = (uint64_t)v13;
  sub_23C46A830(v27, (uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for PreviousPlanDetail);
  v29 = swift_allocObject();
  v30 = v48;
  v31 = v40;
  *(_QWORD *)(v29 + 16) = v48;
  *(_QWORD *)(v29 + 24) = v31;
  v32 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v29 + 32) = *(_OWORD *)a1;
  *(_OWORD *)(v29 + 48) = v32;
  *(_OWORD *)(v29 + 64) = *(_OWORD *)(a1 + 32);
  *(_QWORD *)(v29 + 80) = *(_QWORD *)(a1 + 48);
  sub_23C473430(a1);
  v33 = v42;
  LockupView.init(planDetail:artworkViewBuilder:)(v28, v49, v29, v30, v31, v42);
  sub_23C480AB4();
  v34 = v45;
  sub_23C4809B8();
  (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v33, v15);
  v35 = v50;
  sub_23C480838();
  v36 = v43;
  sub_23C4809E8();
  (*(void (**)(char *, uint64_t))(v51 + 8))(v35, v52);
  (*(void (**)(char *, uint64_t))(v47 + 8))(v34, v17);
  v54 = v17;
  v55 = v36;
  swift_getOpaqueTypeConformance2();
  sub_23C47FA6C((uint64_t)v23, v21, (uint64_t)v26);
  v37 = *(void (**)(char *, uint64_t))(v44 + 8);
  v37(v23, v21);
  sub_23C47D9B0((uint64_t)v26, v21, v53);
  return ((uint64_t (*)(char *, uint64_t))v37)(v26, v21);
}

uint64_t sub_23C4731FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
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
  char *v15;
  void (*v16)(char *, _QWORD);
  void (*v17)(char *, uint64_t);
  uint64_t v19;
  uint64_t v20;

  v20 = a3;
  v5 = sub_23C480790();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v19 - v14;
  v16 = *(void (**)(char *, _QWORD))(a1 + 40);
  sub_23C480784();
  v16(v8, 0);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_23C47FA6C((uint64_t)v12, a2, (uint64_t)v15);
  v17 = *(void (**)(char *, uint64_t))(v9 + 8);
  v17(v12, a2);
  sub_23C47D9B0((uint64_t)v15, a2, v20);
  return ((uint64_t (*)(char *, uint64_t))v17)(v15, a2);
}

uint64_t sub_23C47333C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  __int128 v9;
  uint64_t v10;
  _OWORD v12[3];
  uint64_t v13;

  v6 = type metadata accessor for PreviousPlanLockupAction();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_OWORD *)(a1 + 16);
  v12[0] = *(_OWORD *)a1;
  v12[1] = v9;
  v12[2] = *(_OWORD *)(a1 + 32);
  v13 = *(_QWORD *)(a1 + 48);
  type metadata accessor for PreviousPlanLockupView(0, a2, a3, v10);
  sub_23C46FACC();
  swift_storeEnumTagMultiPayload();
  sub_23C480B14();
  swift_release();
  return sub_23C46B588((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for PreviousPlanLockupAction);
}

uint64_t sub_23C47341C()
{
  return swift_release();
}

uint64_t sub_23C473424()
{
  uint64_t v0;

  return sub_23C47333C(v0 + 32, *(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_23C473430(uint64_t a1)
{
  swift_retain();
  sub_23C47348C();
  swift_retain();
  return a1;
}

uint64_t sub_23C47348C()
{
  return swift_retain();
}

uint64_t sub_23C473494()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23C4734C8()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_23C4734D0()
{
  swift_release();
  sub_23C47341C();
  return swift_release();
}

uint64_t sub_23C473504(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 24);
  v6 = *(_BYTE *)(a2 + 32);
  swift_retain();
  sub_23C47348C();
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  *(_BYTE *)(a1 + 32) = v6;
  v7 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v7;
  swift_retain();
  return a1;
}

uint64_t sub_23C473578(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 24);
  v6 = *(_BYTE *)(a2 + 32);
  sub_23C47348C();
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  *(_BYTE *)(a1 + 32) = v6;
  sub_23C47341C();
  v7 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v7;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_23C47362C(uint64_t a1, uint64_t a2)
{
  char v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_release();
  v4 = *(_BYTE *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = v4;
  sub_23C47341C();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  return a1;
}

uint64_t sub_23C473694(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 56))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_23C4736DC(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 56) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 40) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t type metadata accessor for PreviousPlanLockupView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PreviousPlanLockupView);
}

uint64_t sub_23C473734(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[2];
  uint64_t v28;
  _QWORD v29[2];
  _QWORD v30[2];
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  _QWORD v39[2];
  _QWORD v40[3];

  v4 = type metadata accessor for LockupView(255, *a1, a1[1], a4);
  v5 = sub_23C48082C();
  v40[0] = MEMORY[0x24261FFB0](&protocol conformance descriptor for LockupView<A>, v4);
  v40[1] = MEMORY[0x24BDEDBB8];
  v6 = MEMORY[0x24BDED308];
  v7 = MEMORY[0x24261FFB0](MEMORY[0x24BDED308], v5, v40);
  v31 = v5;
  v32 = v7;
  MEMORY[0x24261FF80](255, &v31, MEMORY[0x24BDF3948], 0);
  v31 = v5;
  v32 = v7;
  swift_getOpaqueTypeConformance2();
  v8 = sub_23C480A84();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256BA77B0);
  v9 = sub_23C48082C();
  v10 = sub_23C469CBC(&qword_256BA77B8, &qword_256BA77B0, MEMORY[0x24BDEDC10]);
  v39[0] = v7;
  v39[1] = v10;
  MEMORY[0x24261FFB0](v6, v9, v39);
  v11 = sub_23C480A84();
  v25 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256BA77C0);
  v24 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256BA77C8);
  v12 = type metadata accessor for RepeatReplaceAlertDetailView();
  v13 = MEMORY[0x24261FFB0](MEMORY[0x24BDF43B0], v11);
  v14 = sub_23C469CBC(&qword_256BA77D0, &qword_256BA77C0, MEMORY[0x24BDF5428]);
  v15 = sub_23C470074();
  v16 = sub_23C46A7F0(qword_256BA77E0, (uint64_t (*)(uint64_t))type metadata accessor for RepeatReplaceAlertDetailView, (uint64_t)&protocol conformance descriptor for RepeatReplaceAlertDetailView);
  v31 = v11;
  v32 = v25;
  v33 = v24;
  v34 = v12;
  v35 = v13;
  v36 = v14;
  v37 = v15;
  v38 = v16;
  MEMORY[0x24261FF80](255, &v31, MEMORY[0x24BDF3588], 0);
  v17 = v8;
  v18 = sub_23C4808E0();
  v19 = sub_23C4808E0();
  v20 = sub_23C480A30();
  v26 = sub_23C48082C();
  v21 = MEMORY[0x24261FFB0](MEMORY[0x24BDF43B0], v17);
  v31 = v11;
  v32 = v25;
  v33 = v24;
  v34 = v12;
  v35 = v13;
  v36 = v14;
  v37 = v15;
  v38 = v16;
  v30[0] = swift_getOpaqueTypeConformance2();
  v30[1] = v21;
  v22 = MEMORY[0x24BDEF3E0];
  v29[0] = v21;
  v29[1] = MEMORY[0x24261FFB0](MEMORY[0x24BDEF3E0], v18, v30);
  v28 = MEMORY[0x24261FFB0](v22, v19, v29);
  v27[0] = MEMORY[0x24261FFB0](MEMORY[0x24BDF3F50], v20, &v28);
  v27[1] = MEMORY[0x24BDF0910];
  return MEMORY[0x24261FFB0](MEMORY[0x24BDED308], v26, v27);
}

uint64_t sub_23C473A40@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_23C472E28(v1[4], v1[2], v1[3], (uint64_t)&unk_250D380D0, (uint64_t)sub_23C473D64, a1);
}

uint64_t sub_23C473A70()
{
  return sub_23C472DD0();
}

uint64_t sub_23C473A8C@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_23C4718A0(v1[4], v1[5], v1[2], v1[3], a1);
}

uint64_t sub_23C473A98@<X0>(char *a1@<X8>)
{
  uint64_t *v1;

  return sub_23C471F38(v1[4], v1[5], v1[2], v1[3], a1);
}

double sub_23C473AA4@<D0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_23C472B88(v1[4], v1[5], v1[2], v1[3], a1);
}

uint64_t sub_23C473AB0@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_23C472D24(v1[5], v1[2], v1[3], a1);
}

uint64_t sub_23C473AC0@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_23C472E28(v1[4], v1[2], v1[3], (uint64_t)&unk_250D38030, (uint64_t)sub_23C473B08, a1);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_23C473B08@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23C4731FC(v1 + 32, *(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_23C473B28()
{
  return sub_23C4723A4();
}

uint64_t sub_23C473B34@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23C4723F8(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_23C473B44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 24);
  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for PreviousPlanDetail() - 8) + 80);
  return sub_23C4725AC(v0 + 32, (_QWORD *)(v0 + ((v3 + 88) & ~v3)), v1, v2);
}

double sub_23C473B90@<D0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_23C4726D8(v1[4], v1[5], v1[2], v1[3], a1);
}

uint64_t objectdestroy_23Tm()
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

  v1 = type metadata accessor for PreviousPlanDetail();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (v2 + 88) & ~v2;
  swift_release();
  sub_23C47341C();
  swift_release();
  v4 = v0 + v3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v5 = v0 + v3 + *(int *)(v1 + 32);
  v6 = sub_23C48076C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v7 = v4 + *(int *)(v1 + 56);
  v8 = sub_23C480790();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  return swift_deallocObject();
}

uint64_t sub_23C473CA8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(v1 + 16);
  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for PreviousPlanDetail() - 8) + 80);
  return sub_23C471E40(v1 + 32, v1 + ((v4 + 88) & ~v4), v3, a1);
}

uint64_t objectdestroy_2Tm()
{
  swift_release();
  sub_23C47341C();
  swift_release();
  return swift_deallocObject();
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x24261FF50](a1, v6, a5);
}

uint64_t CreateWorkoutPlanButtonView.init(store:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a1;
  *(_QWORD *)(result + 24) = a2;
  *(_QWORD *)a3 = sub_23C46FC00;
  *(_QWORD *)(a3 + 8) = result;
  *(_BYTE *)(a3 + 16) = 0;
  return result;
}

uint64_t sub_23C473DC0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t CreateWorkoutPlanButtonView.body.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;

  v1 = *v0;
  v2 = v0[1];
  v3 = *((_BYTE *)v0 + 16);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v1;
  *(_QWORD *)(v4 + 24) = v2;
  *(_BYTE *)(v4 + 32) = v3;
  sub_23C47348C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256BA78D0);
  sub_23C469CBC(&qword_256BA78D8, &qword_256BA78D0, MEMORY[0x24BDF41A8]);
  return sub_23C480A78();
}

uint64_t sub_23C473EAC()
{
  sub_23C47348C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256BA78F0);
  sub_23C469CBC(&qword_256BA78F8, &qword_256BA78F0, MEMORY[0x24BE2B5E8]);
  sub_23C480814();
  sub_23C47341C();
  sub_23C480B14();
  return swift_release();
}

uint64_t sub_23C473F68()
{
  return sub_23C473EAC();
}

uint64_t sub_23C473F78()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23C473F88@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t result;
  uint64_t v6;
  char v7;
  uint64_t v8;

  v2 = sub_23C4807A8();
  MEMORY[0x24BDAC7A8](v2);
  v3 = sub_23C480B98();
  MEMORY[0x24BDAC7A8](v3);
  sub_23C480B38();
  if (qword_256BA7110 != -1)
    swift_once();
  v4 = (id)qword_256BADA90;
  sub_23C47348C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256BA78F0);
  sub_23C469CBC(&qword_256BA78F8, &qword_256BA78F0, MEMORY[0x24BE2B5E8]);
  sub_23C480814();
  sub_23C47341C();
  swift_getKeyPath();
  sub_23C480B08();
  swift_release();
  swift_release();
  sub_23C480BB0();
  sub_23C468EE0();
  result = sub_23C480964();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v6;
  *(_BYTE *)(a1 + 16) = v7 & 1;
  *(_QWORD *)(a1 + 24) = v8;
  return result;
}

uint64_t sub_23C474180()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;

  v1 = *v0;
  v2 = v0[1];
  v3 = *((_BYTE *)v0 + 16);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v1;
  *(_QWORD *)(v4 + 24) = v2;
  *(_BYTE *)(v4 + 32) = v3;
  sub_23C47348C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256BA78D0);
  sub_23C469CBC(&qword_256BA78D8, &qword_256BA78D0, MEMORY[0x24BDF41A8]);
  return sub_23C480A78();
}

uint64_t destroy for CreateWorkoutPlanButtonView()
{
  return sub_23C47341C();
}

uint64_t _s18FitnessWorkoutPlan27CreateWorkoutPlanButtonViewVwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  sub_23C47348C();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for CreateWorkoutPlanButtonView(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  sub_23C47348C();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_23C47341C();
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

uint64_t assignWithTake for CreateWorkoutPlanButtonView(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_23C47341C();
  return a1;
}

uint64_t getEnumTagSinglePayload for CreateWorkoutPlanButtonView(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for CreateWorkoutPlanButtonView(uint64_t result, unsigned int a2, unsigned int a3)
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

ValueMetadata *type metadata accessor for CreateWorkoutPlanButtonView()
{
  return &type metadata for CreateWorkoutPlanButtonView;
}

uint64_t sub_23C4743EC()
{
  return sub_23C469CBC(&qword_256BA78E0, &qword_256BA78E8, MEMORY[0x24BDF43B0]);
}

uint64_t objectdestroy_2Tm_0()
{
  sub_23C47341C();
  return swift_deallocObject();
}

uint64_t sub_23C474444()
{
  return sub_23C480A3C();
}

uint64_t sub_23C4744A8@<X0>(uint64_t a1@<X8>)
{
  return sub_23C473F88(a1);
}

uint64_t CreateWorkoutPlanHandoffAlertState.iconState.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t CreateWorkoutPlanHandoffAlertState.iconState.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result & 1;
  return result;
}

uint64_t (*CreateWorkoutPlanHandoffAlertState.iconState.modify())()
{
  return nullsub_1;
}

uint64_t CreateWorkoutPlanHandoffAlertState.isPresentingAlert.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t CreateWorkoutPlanHandoffAlertState.isPresentingAlert.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 1) = result;
  return result;
}

uint64_t (*CreateWorkoutPlanHandoffAlertState.isPresentingAlert.modify())()
{
  return nullsub_1;
}

FitnessWorkoutPlan::CreateWorkoutPlanHandoffAlertState __swiftcall CreateWorkoutPlanHandoffAlertState.init(iconState:isPresentingAlert:)(FitnessWorkoutPlan::HandoffAlertIconState iconState, Swift::Bool isPresentingAlert)
{
  _BYTE *v2;
  FitnessWorkoutPlan::CreateWorkoutPlanHandoffAlertState result;

  *v2 = iconState & 1;
  v2[1] = isPresentingAlert;
  result.iconState = iconState;
  return result;
}

uint64_t sub_23C47450C()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000011;
  else
    return 0x746174536E6F6369;
}

uint64_t sub_23C474550@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C474CB4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C474574()
{
  sub_23C4746F8();
  return sub_23C480DA8();
}

uint64_t sub_23C47459C()
{
  sub_23C4746F8();
  return sub_23C480DB4();
}

uint64_t CreateWorkoutPlanHandoffAlertState.encode(to:)(_QWORD *a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char v8;
  uint64_t v10;
  int v11;
  char v12;
  char v13;
  char v14;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7900);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v11 = v1[1];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C4746F8();
  sub_23C480D9C();
  v14 = v8;
  v13 = 0;
  sub_23C47473C();
  sub_23C480D3C();
  if (!v2)
  {
    v12 = 1;
    sub_23C480D24();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_23C4746F8()
{
  unint64_t result;

  result = qword_256BA7908;
  if (!qword_256BA7908)
  {
    result = MEMORY[0x24261FFB0](&unk_23C482E88, &type metadata for CreateWorkoutPlanHandoffAlertState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7908);
  }
  return result;
}

unint64_t sub_23C47473C()
{
  unint64_t result;

  result = qword_256BA7910;
  if (!qword_256BA7910)
  {
    result = MEMORY[0x24261FFB0](&protocol conformance descriptor for HandoffAlertIconState, &type metadata for HandoffAlertIconState);
    atomic_store(result, (unint64_t *)&qword_256BA7910);
  }
  return result;
}

uint64_t CreateWorkoutPlanHandoffAlertState.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v9;
  char v10;
  uint64_t v12;
  char v13;
  char v14;
  char v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7918);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C4746F8();
  sub_23C480D90();
  if (!v2)
  {
    v14 = 0;
    sub_23C4748E8();
    sub_23C480CE8();
    v9 = v15;
    v13 = 1;
    v10 = sub_23C480CD0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9;
    a2[1] = v10 & 1;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_23C4748E8()
{
  unint64_t result;

  result = qword_256BA7920;
  if (!qword_256BA7920)
  {
    result = MEMORY[0x24261FFB0](&protocol conformance descriptor for HandoffAlertIconState, &type metadata for HandoffAlertIconState);
    atomic_store(result, (unint64_t *)&qword_256BA7920);
  }
  return result;
}

uint64_t sub_23C47492C@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return CreateWorkoutPlanHandoffAlertState.init(from:)(a1, a2);
}

uint64_t sub_23C474940(_QWORD *a1)
{
  return CreateWorkoutPlanHandoffAlertState.encode(to:)(a1);
}

BOOL static CreateWorkoutPlanHandoffAlertState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2 | a2[1] ^ a1[1]) & 1) == 0;
}

BOOL sub_23C47497C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2 | a2[1] ^ a1[1]) & 1) == 0;
}

_WORD *__swift_memcpy2_1(_WORD *result, _WORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CreateWorkoutPlanHandoffAlertState(unsigned __int16 *a1, unsigned int a2)
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
  if (a2 + 65281 <= 0xFFFEFFFF)
    v2 = 2;
  else
    v2 = 4;
  if (a2 + 65281 < 0xFF0000)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 16)) - 65281;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
      return (*a1 | (v4 << 16)) - 65281;
    }
    v4 = *((unsigned __int8 *)a1 + 2);
    if (*((_BYTE *)a1 + 2))
      return (*a1 | (v4 << 16)) - 65281;
  }
LABEL_17:
  v6 = *(unsigned __int8 *)a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for CreateWorkoutPlanHandoffAlertState(_WORD *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 65281 <= 0xFFFEFFFF)
    v3 = 2;
  else
    v3 = 4;
  if (a3 + 65281 < 0xFF0000)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_23C474A90 + 4 * byte_23C482D05[v4]))();
  *a1 = a2 - 255;
  return ((uint64_t (*)(void))((char *)sub_23C474AC4 + 4 * byte_23C482D00[v4]))();
}

uint64_t sub_23C474AC4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 2) = v1;
  return result;
}

uint64_t sub_23C474ACC(uint64_t result, int a2)
{
  *(_WORD *)(result + 2) = 0;
  if (a2)
    JUMPOUT(0x23C474AD4);
  return result;
}

uint64_t sub_23C474AE0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 2) = 0;
  if (!a2)
    JUMPOUT(0x23C474AE8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C474AEC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 2) = v1;
  return result;
}

uint64_t sub_23C474AF4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 2) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CreateWorkoutPlanHandoffAlertState()
{
  return &type metadata for CreateWorkoutPlanHandoffAlertState;
}

uint64_t storeEnumTagSinglePayload for CreateWorkoutPlanHandoffAlertState.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C474B5C + 4 * byte_23C482D0F[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C474B90 + 4 * byte_23C482D0A[v4]))();
}

uint64_t sub_23C474B90(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C474B98(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C474BA0);
  return result;
}

uint64_t sub_23C474BAC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C474BB4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C474BB8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C474BC0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CreateWorkoutPlanHandoffAlertState.CodingKeys()
{
  return &type metadata for CreateWorkoutPlanHandoffAlertState.CodingKeys;
}

unint64_t sub_23C474BE0()
{
  unint64_t result;

  result = qword_256BA7928;
  if (!qword_256BA7928)
  {
    result = MEMORY[0x24261FFB0](&unk_23C482E60, &type metadata for CreateWorkoutPlanHandoffAlertState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7928);
  }
  return result;
}

unint64_t sub_23C474C28()
{
  unint64_t result;

  result = qword_256BA7930;
  if (!qword_256BA7930)
  {
    result = MEMORY[0x24261FFB0](&unk_23C482DD0, &type metadata for CreateWorkoutPlanHandoffAlertState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7930);
  }
  return result;
}

unint64_t sub_23C474C70()
{
  unint64_t result;

  result = qword_256BA7938;
  if (!qword_256BA7938)
  {
    result = MEMORY[0x24261FFB0](&unk_23C482DF8, &type metadata for CreateWorkoutPlanHandoffAlertState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7938);
  }
  return result;
}

uint64_t sub_23C474CB4(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x746174536E6F6369 && a2 == 0xE900000000000065;
  if (v2 || (sub_23C480D54() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000023C485300)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23C480D54();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23C474DAC()
{
  uint64_t v0;
  unint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  sub_23C480D60();
  sub_23C480D6C();
  if (v1 > 2)
    sub_23C480BBC();
  return sub_23C480D84();
}

uint64_t sub_23C474E38()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 8) <= 2uLL)
    return sub_23C480D6C();
  sub_23C480D6C();
  return sub_23C480BBC();
}

uint64_t sub_23C474EBC()
{
  uint64_t v0;
  unint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  sub_23C480D60();
  sub_23C480D6C();
  if (v1 > 2)
    sub_23C480BBC();
  return sub_23C480D84();
}

uint64_t sub_23C474F44(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  unint64_t v4;

  v3 = a1[1];
  v4 = a2[1];
  switch(v3)
  {
    case 0:
      return v4 == 0;
    case 1:
      return v4 == 1;
    case 2:
      return v4 == 2;
  }
  if (v4 < 3)
    return 0;
  if (*a1 == *a2 && v3 == v4)
    return 1;
  return sub_23C480D54();
}

__n128 PreviousPlanLockupFeature.init(environment:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __int128 v2;
  __n128 result;
  __int128 v4;

  v2 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v2;
  result = *(__n128 *)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 48);
  *(__n128 *)(a2 + 32) = result;
  *(_OWORD *)(a2 + 48) = v4;
  return result;
}

uint64_t PreviousPlanLockupFeature.reduce(localState:sharedState:sideEffects:action:)(uint64_t a1, uint64_t a2, char **a3, uint64_t a4)
{
  __int128 *v4;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t State;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  __int128 v22;
  __int128 v23;
  uint64_t (*v24)(_QWORD);
  int EnumCaseMultiPayload;
  uint64_t v26;
  uint64_t v27;
  int *v28;
  char *v29;
  char *v30;
  char *v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char **v40;
  _QWORD *v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t result;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  int *v54;
  char *v55;
  char *v56;
  unint64_t v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  char *v66;
  unint64_t v67;
  unint64_t v68;
  uint64_t (*v69)(char *, char *, uint64_t);
  uint64_t v70;
  char **v71;
  char *v72;
  char *v73;
  char *v74;
  uint64_t v75;
  __int128 v76;
  __int128 v77;
  char *v78;
  unint64_t v79;
  unint64_t v80;
  uint64_t v81;
  void (*v82)(char *, uint64_t, uint64_t);
  uint64_t v83;
  unint64_t v84;
  uint64_t (*v85)(char *, char *, uint64_t);
  void (*v86)(char *, uint64_t, uint64_t);
  unsigned int v87;
  char *v88;
  unint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char **v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;

  v92 = (char **)a3;
  v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7638);
  v7 = *(_QWORD *)(v91 - 8);
  MEMORY[0x24BDAC7A8](v91);
  v9 = (char *)&v81 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v81 - v11;
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v81 - v14;
  State = type metadata accessor for PreviousPlanLockupLoadState();
  MEMORY[0x24BDAC7A8](State);
  v18 = (char *)&v81 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = type metadata accessor for PreviousPlanLockupAction();
  MEMORY[0x24BDAC7A8](v19);
  v21 = (uint64_t *)((char *)&v81 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  v22 = v4[1];
  v94 = *v4;
  v95 = v22;
  v23 = v4[3];
  v96 = v4[2];
  v97 = v23;
  sub_23C46A830(a4, (uint64_t)v21, v24);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      v26 = *v21;
      v27 = v21[1];
      v28 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_256BA75C8);
      v29 = &v9[v28[16]];
      v30 = &v9[v28[20]];
      v31 = &v9[v28[24]];
      sub_23C475734();
      v93 = 0uLL;
      sub_23C480C70();
      v32 = swift_allocObject();
      v33 = v95;
      *(_OWORD *)(v32 + 16) = v94;
      *(_OWORD *)(v32 + 32) = v33;
      v34 = v97;
      *(_OWORD *)(v32 + 48) = v96;
      *(_OWORD *)(v32 + 64) = v34;
      *(_QWORD *)(v32 + 80) = v26;
      *(_QWORD *)(v32 + 88) = v27;
      *(_QWORD *)v31 = &unk_256BA7950;
      *((_QWORD *)v31 + 1) = v32;
      sub_23C476240((uint64_t)&v94);
      sub_23C480C28();
      v35 = *MEMORY[0x24BE2B578];
      v36 = sub_23C480AFC();
      (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 104))(v29, v35, v36);
      v37 = *MEMORY[0x24BE2B558];
      v38 = sub_23C480AF0();
      (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 104))(v30, v37, v38);
      v39 = v91;
      (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x24BE2B438], v91);
      v40 = v92;
      v41 = *v92;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v41 = (_QWORD *)sub_23C46CCC0(0, v41[2] + 1, 1, v41);
      v43 = v41[2];
      v42 = v41[3];
      if (v43 >= v42 >> 1)
        v41 = (_QWORD *)sub_23C46CCC0(v42 > 1, v43 + 1, 1, v41);
      v41[2] = v43 + 1;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v7 + 32))((unint64_t)v41+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(_QWORD *)(v7 + 72) * v43, v9, v39);
      *v40 = v41;
    }
    else
    {
      v47 = type metadata accessor for PreviousPlanLockupState();
      v48 = (uint64_t *)(a2 + *(int *)(v47 + 20));
      v50 = *v48;
      v49 = v48[1];
      v51 = a2 + *(int *)(v47 + 24);
      sub_23C46A830(v51, (uint64_t)v18, (uint64_t (*)(_QWORD))type metadata accessor for PreviousPlanLockupLoadState);
      v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7508);
      v53 = *(_QWORD *)(v52 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v53 + 48))(v18, 2, v52) == 1)
      {
        swift_bridgeObjectRetain();
        sub_23C46B588((uint64_t)v18, (uint64_t (*)(_QWORD))type metadata accessor for PreviousPlanLockupLoadState);
        sub_23C46B588(v51, (uint64_t (*)(_QWORD))type metadata accessor for PreviousPlanLockupLoadState);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v53 + 56))(v51, 2, 2, v52);
        v54 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_256BA75C8);
        v55 = &v15[v54[16]];
        v88 = &v15[v54[20]];
        v56 = &v15[v54[24]];
        *(_QWORD *)&v93 = v50;
        *((_QWORD *)&v93 + 1) = v49;
        v57 = sub_23C475734();
        swift_bridgeObjectRetain();
        v89 = v57;
        sub_23C480C70();
        sub_23C480C28();
        v58 = swift_allocObject();
        v59 = v95;
        *(_OWORD *)(v58 + 16) = v94;
        *(_OWORD *)(v58 + 32) = v59;
        v60 = v97;
        *(_OWORD *)(v58 + 48) = v96;
        *(_OWORD *)(v58 + 64) = v60;
        v90 = v50;
        *(_QWORD *)(v58 + 80) = v50;
        *(_QWORD *)(v58 + 88) = v49;
        *(_QWORD *)v56 = &unk_256BA7960;
        *((_QWORD *)v56 + 1) = v58;
        v61 = *MEMORY[0x24BE2B578];
        v62 = sub_23C480AFC();
        v86 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v62 - 8) + 104);
        v86(v55, v61, v62);
        v63 = *MEMORY[0x24BE2B558];
        v64 = sub_23C480AF0();
        v82 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v64 - 8) + 104);
        v82(v88, v63, v64);
        v65 = *(char **)(v7 + 104);
        v87 = *MEMORY[0x24BE2B438];
        v88 = v65;
        ((void (*)(char *))v65)(v15);
        v66 = *v92;
        swift_bridgeObjectRetain();
        sub_23C476240((uint64_t)&v94);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v66 = (char *)sub_23C46CCC0(0, *((_QWORD *)v66 + 2) + 1, 1, v66);
        v68 = *((_QWORD *)v66 + 2);
        v67 = *((_QWORD *)v66 + 3);
        if (v68 >= v67 >> 1)
          v66 = (char *)sub_23C46CCC0(v67 > 1, v68 + 1, 1, v66);
        *((_QWORD *)v66 + 2) = v68 + 1;
        v84 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
        v83 = *(_QWORD *)(v7 + 72);
        v69 = *(uint64_t (**)(char *, char *, uint64_t))(v7 + 32);
        v70 = v91;
        v85 = v69;
        v69(&v66[v84 + v83 * v68], v15, v91);
        v71 = v92;
        *v92 = v66;
        v72 = &v12[v54[16]];
        v73 = &v12[v54[20]];
        v74 = &v12[v54[24]];
        v93 = xmmword_23C482EE0;
        sub_23C480C70();
        sub_23C480C28();
        v86(v72, *MEMORY[0x24BE2B580], v62);
        v82(v73, *MEMORY[0x24BE2B550], v64);
        v75 = swift_allocObject();
        v76 = v95;
        *(_OWORD *)(v75 + 16) = v94;
        *(_OWORD *)(v75 + 32) = v76;
        v77 = v97;
        *(_OWORD *)(v75 + 48) = v96;
        *(_OWORD *)(v75 + 64) = v77;
        *(_QWORD *)(v75 + 80) = v90;
        *(_QWORD *)(v75 + 88) = v49;
        *(_QWORD *)v74 = &unk_256BA7970;
        *((_QWORD *)v74 + 1) = v75;
        ((void (*)(char *, _QWORD, uint64_t))v88)(v12, v87, v70);
        v78 = *v71;
        sub_23C476240((uint64_t)&v94);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v78 = (char *)sub_23C46CCC0(0, *((_QWORD *)v78 + 2) + 1, 1, v78);
        v80 = *((_QWORD *)v78 + 2);
        v79 = *((_QWORD *)v78 + 3);
        if (v80 >= v79 >> 1)
          v78 = (char *)sub_23C46CCC0(v79 > 1, v80 + 1, 1, v78);
        *((_QWORD *)v78 + 2) = v80 + 1;
        result = v85(&v78[v84 + v80 * v83], v12, v70);
        *v71 = v78;
      }
      else
      {
        return sub_23C46B588((uint64_t)v18, (uint64_t (*)(_QWORD))type metadata accessor for PreviousPlanLockupLoadState);
      }
    }
  }
  else
  {
    v45 = a2 + *(int *)(type metadata accessor for PreviousPlanLockupState() + 24);
    sub_23C46B588(v45, (uint64_t (*)(_QWORD))type metadata accessor for PreviousPlanLockupLoadState);
    sub_23C46E0D4((uint64_t)v21, v45);
    v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7508);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v46 - 8) + 56))(v45, 0, 2, v46);
  }
  return result;
}

unint64_t sub_23C475734()
{
  unint64_t result;

  result = qword_256BA7940;
  if (!qword_256BA7940)
  {
    result = MEMORY[0x24261FFB0](&unk_23C482FB4, &type metadata for PreviousPlanLockupFeature.TaskIdentifier);
    atomic_store(result, &qword_256BA7940);
  }
  return result;
}

uint64_t sub_23C475778(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t);

  v4[2] = a1;
  v4[3] = type metadata accessor for PreviousPlanLockupAction();
  v4[4] = swift_task_alloc();
  v8 = type metadata accessor for PreviousPlanDetail();
  v4[5] = v8;
  v4[6] = *(_QWORD *)(v8 - 8);
  v9 = swift_task_alloc();
  v4[7] = v9;
  v4[8] = sub_23C480C1C();
  v4[9] = sub_23C480C10();
  v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(int *)*a2 + *a2);
  v10 = (_QWORD *)swift_task_alloc();
  v4[10] = v10;
  *v10 = v4;
  v10[1] = sub_23C475864;
  return v12(v9, a3, a4);
}

uint64_t sub_23C475864()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v1;
  *(_QWORD *)(*v1 + 88) = v0;
  swift_task_dealloc();
  *(_QWORD *)(v2 + 96) = sub_23C480BF8();
  *(_QWORD *)(v2 + 104) = v3;
  return swift_task_switch();
}

uint64_t sub_23C4758F0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = v0[6];
  v2 = v0[4];
  v3 = v0[5];
  sub_23C46A830(v0[7], v2, (uint64_t (*)(_QWORD))type metadata accessor for PreviousPlanDetail);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v1 + 56))(v2, 0, 1, v3);
  swift_storeEnumTagMultiPayload();
  v4 = (_QWORD *)swift_task_alloc();
  v0[14] = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7998);
  *v4 = v0;
  v4[1] = sub_23C4759A0;
  return sub_23C480AE4();
}

uint64_t sub_23C4759A0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 32);
  swift_task_dealloc();
  sub_23C46B588(v1, (uint64_t (*)(_QWORD))type metadata accessor for PreviousPlanLockupAction);
  return swift_task_switch();
}

uint64_t sub_23C475A00()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 56);
  swift_release();
  sub_23C46B588(v1, (uint64_t (*)(_QWORD))type metadata accessor for PreviousPlanDetail);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C475A5C()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C475AA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t);

  *(_QWORD *)(v4 + 104) = a3;
  *(_QWORD *)(v4 + 112) = a4;
  *(_QWORD *)(v4 + 96) = a1;
  *(_QWORD *)(v4 + 120) = type metadata accessor for PreviousPlanLockupAction();
  *(_QWORD *)(v4 + 128) = swift_task_alloc();
  v6 = type metadata accessor for PreviousPlanDetail();
  *(_QWORD *)(v4 + 136) = v6;
  *(_QWORD *)(v4 + 144) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v4 + 152) = swift_task_alloc();
  *(_QWORD *)(v4 + 160) = sub_23C480C1C();
  *(_QWORD *)(v4 + 168) = sub_23C480C10();
  *(_OWORD *)(v4 + 176) = *(_OWORD *)a2;
  v9 = (uint64_t (*)(uint64_t))(**(int **)(a2 + 48) + *(_QWORD *)(a2 + 48));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 192) = v7;
  *v7 = v4;
  v7[1] = sub_23C475B88;
  return v9(v4 + 56);
}

uint64_t sub_23C475B88()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v1;
  *(_QWORD *)(*v1 + 200) = v0;
  swift_task_dealloc();
  *(_QWORD *)(v2 + 208) = sub_23C480BF8();
  *(_QWORD *)(v2 + 216) = v3;
  return swift_task_switch();
}

uint64_t sub_23C475C14()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = v0[10];
  v2 = __swift_project_boxed_opaque_existential_1(v0 + 7, v1);
  v3 = *(_QWORD *)(v1 - 8);
  v4 = swift_task_alloc();
  (*(void (**)(uint64_t, _QWORD *, uint64_t))(v3 + 16))(v4, v2, v1);
  v0[5] = swift_getAssociatedTypeWitness();
  v0[6] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v0 + 2);
  sub_23C480C4C();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
  v0[28] = sub_23C480C10();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v0[5]);
  v5 = (_QWORD *)swift_task_alloc();
  v0[29] = (uint64_t)v5;
  *v5 = v0;
  v5[1] = sub_23C475D74;
  return sub_23C480C04();
}

uint64_t sub_23C475D74()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_23C475DC8()
{
  uint64_t v0;
  _QWORD *v2;
  uint64_t (*v3)(_QWORD, _QWORD, _QWORD);

  if (*(_BYTE *)(v0 + 264) == 1)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v3 = (uint64_t (*)(_QWORD, _QWORD, _QWORD))(**(int **)(v0 + 176) + *(_QWORD *)(v0 + 176));
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 240) = v2;
    *v2 = v0;
    v2[1] = sub_23C475E88;
    return v3(*(_QWORD *)(v0 + 152), *(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 112));
  }
}

uint64_t sub_23C475E88()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 248) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23C475EE8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = v0[18];
  v2 = v0[16];
  v3 = v0[17];
  sub_23C46A830(v0[19], v2, (uint64_t (*)(_QWORD))type metadata accessor for PreviousPlanDetail);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v1 + 56))(v2, 0, 1, v3);
  swift_storeEnumTagMultiPayload();
  v4 = (_QWORD *)swift_task_alloc();
  v0[32] = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7998);
  *v4 = v0;
  v4[1] = sub_23C475F98;
  return sub_23C480AE4();
}

uint64_t sub_23C475F98()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 128);
  swift_task_dealloc();
  sub_23C46B588(v1, (uint64_t (*)(_QWORD))type metadata accessor for PreviousPlanLockupAction);
  return swift_task_switch();
}

uint64_t sub_23C475FF8()
{
  uint64_t *v0;
  _QWORD *v1;

  sub_23C46B588(v0[19], (uint64_t (*)(_QWORD))type metadata accessor for PreviousPlanDetail);
  v0[28] = sub_23C480C10();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v0[5]);
  v1 = (_QWORD *)swift_task_alloc();
  v0[29] = (uint64_t)v1;
  *v1 = v0;
  v1[1] = sub_23C475D74;
  return sub_23C480C04();
}

uint64_t sub_23C4760AC()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C4760F4()
{
  uint64_t v0;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C476148(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, uint64_t);

  v4[2] = sub_23C480C1C();
  v4[3] = sub_23C480C10();
  v10 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 32) + *(_QWORD *)(a2 + 32));
  v8 = (_QWORD *)swift_task_alloc();
  v4[4] = v8;
  *v8 = v4;
  v8[1] = sub_23C46C818;
  return v10(a3, a4);
}

uint64_t sub_23C4761D8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1 + 16;
  v6 = *(_QWORD *)(v1 + 80);
  v5 = *(_QWORD *)(v1 + 88);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_23C46CE5C;
  return sub_23C476148(a1, v4, v6, v5);
}

uint64_t sub_23C476240(uint64_t a1)
{
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_23C4762A0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1 + 2;
  v6 = v1[10];
  v5 = v1[11];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_23C46CE5C;
  return sub_23C475778(a1, v4, v6, v5);
}

uint64_t objectdestroyTm_0()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23C476350(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1 + 16;
  v6 = *(_QWORD *)(v1 + 80);
  v5 = *(_QWORD *)(v1 + 88);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_23C46C980;
  return sub_23C475AA8(a1, v4, v6, v5);
}

uint64_t sub_23C4763B8()
{
  return sub_23C46A7F0(&qword_256BA7978, (uint64_t (*)(uint64_t))type metadata accessor for PreviousPlanLockupAction, (uint64_t)&protocol conformance descriptor for PreviousPlanLockupAction);
}

uint64_t sub_23C4763E4()
{
  return sub_23C46A7F0(&qword_256BA7980, (uint64_t (*)(uint64_t))type metadata accessor for PreviousPlanLockupAction, (uint64_t)&protocol conformance descriptor for PreviousPlanLockupAction);
}

uint64_t sub_23C476410()
{
  return sub_23C46A7F0(&qword_256BA7988, (uint64_t (*)(uint64_t))type metadata accessor for PreviousPlanLockupState, (uint64_t)&protocol conformance descriptor for PreviousPlanLockupState);
}

ValueMetadata *type metadata accessor for PreviousPlanLockupFeature()
{
  return &type metadata for PreviousPlanLockupFeature;
}

unint64_t destroy for PreviousPlanLockupFeature.TaskIdentifier(uint64_t a1)
{
  unint64_t result;

  result = *(_QWORD *)(a1 + 8);
  if (result >= 0xFFFFFFFF)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s18FitnessWorkoutPlan25PreviousPlanLockupFeatureV14TaskIdentifierOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v3;
    swift_bridgeObjectRetain();
  }
  return a1;
}

_QWORD *assignWithCopy for PreviousPlanLockupFeature.TaskIdentifier(_QWORD *a1, _QWORD *a2)
{
  unint64_t v4;

  v4 = a2[1];
  if (a1[1] < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for PreviousPlanLockupFeature.TaskIdentifier(uint64_t a1, uint64_t a2)
{
  unint64_t v4;

  if (*(_QWORD *)(a1 + 8) < 0xFFFFFFFFuLL)
    goto LABEL_5;
  v4 = *(_QWORD *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PreviousPlanLockupFeature.TaskIdentifier(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFD && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 2147483645);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 2;
  if (v4 >= 4)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for PreviousPlanLockupFeature.TaskIdentifier(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFD)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 2147483645;
    if (a3 >= 0x7FFFFFFD)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFD)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2 + 2;
  }
  return result;
}

uint64_t sub_23C47665C(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_23C476674(_QWORD *result, int a2)
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

ValueMetadata *type metadata accessor for PreviousPlanLockupFeature.TaskIdentifier()
{
  return &type metadata for PreviousPlanLockupFeature.TaskIdentifier;
}

unint64_t sub_23C4766A8()
{
  unint64_t result;

  result = qword_256BA7990;
  if (!qword_256BA7990)
  {
    result = MEMORY[0x24261FFB0](&unk_23C482F8C, &type metadata for PreviousPlanLockupFeature.TaskIdentifier);
    atomic_store(result, (unint64_t *)&qword_256BA7990);
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

uint64_t sub_23C476750()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000012;
  else
    return 0x6570704177656976;
}

uint64_t sub_23C4767BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C4785E0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C4767E0()
{
  sub_23C476DC8();
  return sub_23C480DA8();
}

uint64_t sub_23C476808()
{
  sub_23C476DC8();
  return sub_23C480DB4();
}

uint64_t sub_23C476838()
{
  sub_23C476E94();
  return sub_23C480DA8();
}

uint64_t sub_23C476860()
{
  sub_23C476E94();
  return sub_23C480DB4();
}

uint64_t sub_23C476888()
{
  return 0x696669746E656469;
}

uint64_t sub_23C4768A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x696669746E656469 && a2 == 0xEA00000000007265)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_23C480D54();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_23C476944()
{
  sub_23C476E50();
  return sub_23C480DA8();
}

uint64_t sub_23C47696C()
{
  sub_23C476E50();
  return sub_23C480DB4();
}

uint64_t sub_23C476994()
{
  sub_23C476ED8();
  return sub_23C480DA8();
}

uint64_t sub_23C4769BC()
{
  sub_23C476ED8();
  return sub_23C480DB4();
}

uint64_t PreviousPlanLockupAction.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  int EnumCaseMultiPayload;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  char v35;
  char v36;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA79A0);
  v30 = *(_QWORD *)(v2 - 8);
  v31 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v28 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA79A8);
  v27 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v26 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7508);
  MEMORY[0x24BDAC7A8](v5);
  v25 = (uint64_t)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA79B0);
  v7 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for PreviousPlanLockupAction();
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA79B8);
  v33 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C476DC8();
  sub_23C480D9C();
  sub_23C476E0C(v32, (uint64_t)v12);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (!EnumCaseMultiPayload)
  {
    v19 = v25;
    sub_23C46E0D4((uint64_t)v12, v25);
    v35 = 1;
    sub_23C476E94();
    v20 = v26;
    sub_23C480D00();
    type metadata accessor for PreviousPlanDetail();
    sub_23C477518(&qword_256BA7680, (uint64_t)&protocol conformance descriptor for PreviousPlanDetail);
    v21 = v29;
    sub_23C480D0C();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v20, v21);
    sub_23C46B5C4(v19);
    return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v15, v13);
  }
  if (EnumCaseMultiPayload == 1)
  {
    v36 = 2;
    sub_23C476E50();
    v17 = v28;
    sub_23C480D00();
    v18 = v31;
    sub_23C480D18();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v17, v18);
    return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v15, v13);
  }
  v34 = 0;
  sub_23C476ED8();
  sub_23C480D00();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v24);
  return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v15, v13);
}

uint64_t type metadata accessor for PreviousPlanLockupAction()
{
  uint64_t result;

  result = qword_256BA7A70;
  if (!qword_256BA7A70)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_23C476DC8()
{
  unint64_t result;

  result = qword_256BA79C0;
  if (!qword_256BA79C0)
  {
    result = MEMORY[0x24261FFB0](&unk_23C483488, &type metadata for PreviousPlanLockupAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA79C0);
  }
  return result;
}

uint64_t sub_23C476E0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PreviousPlanLockupAction();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_23C476E50()
{
  unint64_t result;

  result = qword_256BA79C8;
  if (!qword_256BA79C8)
  {
    result = MEMORY[0x24261FFB0](&unk_23C483438, &type metadata for PreviousPlanLockupAction.RepeatPlanSelectedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA79C8);
  }
  return result;
}

unint64_t sub_23C476E94()
{
  unint64_t result;

  result = qword_256BA79D0;
  if (!qword_256BA79D0)
  {
    result = MEMORY[0x24261FFB0](&unk_23C4833E8, &type metadata for PreviousPlanLockupAction.PlanDetailsFetchedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA79D0);
  }
  return result;
}

unint64_t sub_23C476ED8()
{
  unint64_t result;

  result = qword_256BA79D8;
  if (!qword_256BA79D8)
  {
    result = MEMORY[0x24261FFB0](&unk_23C483398, &type metadata for PreviousPlanLockupAction.ViewAppearedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA79D8);
  }
  return result;
}

uint64_t PreviousPlanLockupAction.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  char *v23;
  char *v24;
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
  uint64_t *v35;
  uint64_t *v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(char *, uint64_t);
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  char *v60;
  char *v61;
  _QWORD *v62;
  uint64_t v63;
  char v64;
  char v65;
  char v66;

  v56 = a2;
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA79E0);
  v55 = *(_QWORD *)(v52 - 8);
  MEMORY[0x24BDAC7A8](v52);
  v61 = (char *)&v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA79E8);
  v53 = *(_QWORD *)(v4 - 8);
  v54 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v60 = (char *)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA79F0);
  v50 = *(_QWORD *)(v6 - 8);
  v51 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v58 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA79F8);
  v57 = *(_QWORD *)(v59 - 8);
  MEMORY[0x24BDAC7A8](v59);
  v9 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for PreviousPlanLockupAction();
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v46 - v14;
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v46 - v17;
  v19 = a1[3];
  v62 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v19);
  sub_23C476DC8();
  v20 = v9;
  v21 = v63;
  sub_23C480D90();
  if (!v21)
  {
    v47 = v12;
    v48 = v15;
    v22 = v60;
    v23 = v61;
    v49 = v18;
    v63 = v10;
    v24 = v58;
    v25 = v59;
    v26 = sub_23C480CF4();
    if (*(_QWORD *)(v26 + 16) == 1)
    {
      if (*(_BYTE *)(v26 + 32))
      {
        if (*(_BYTE *)(v26 + 32) == 1)
        {
          v65 = 1;
          sub_23C476E94();
          sub_23C480CA0();
          v27 = v56;
          type metadata accessor for PreviousPlanDetail();
          sub_23C477518(&qword_256BA76B8, (uint64_t)&protocol conformance descriptor for PreviousPlanDetail);
          v28 = v54;
          sub_23C480CB8();
          (*(void (**)(char *, uint64_t))(v53 + 8))(v22, v28);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v57 + 8))(v20, v25);
          v29 = (uint64_t)v62;
          v30 = (uint64_t)v48;
          swift_storeEnumTagMultiPayload();
          v31 = v30;
          v32 = (uint64_t)v49;
          sub_23C4774D4(v31, (uint64_t)v49);
LABEL_12:
          sub_23C4774D4(v32, v27);
          return __swift_destroy_boxed_opaque_existential_1(v29);
        }
        v66 = 2;
        sub_23C476E50();
        sub_23C480CA0();
        v38 = v25;
        v39 = v52;
        v40 = sub_23C480CC4();
        v41 = v57;
        v43 = v42;
        v44 = *(void (**)(char *, uint64_t))(v55 + 8);
        v60 = (char *)v40;
        v44(v23, v39);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v41 + 8))(v20, v38);
        v45 = (uint64_t)v47;
        *v47 = v60;
        *(_QWORD *)(v45 + 8) = v43;
        swift_storeEnumTagMultiPayload();
        v32 = (uint64_t)v49;
        sub_23C4774D4(v45, (uint64_t)v49);
      }
      else
      {
        v64 = 0;
        sub_23C476ED8();
        sub_23C480CA0();
        (*(void (**)(char *, uint64_t))(v50 + 8))(v24, v51);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v57 + 8))(v20, v25);
        v32 = (uint64_t)v49;
        swift_storeEnumTagMultiPayload();
      }
      v29 = (uint64_t)v62;
      v27 = v56;
      goto LABEL_12;
    }
    v33 = v25;
    v34 = sub_23C480C94();
    swift_allocError();
    v36 = v35;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7168);
    *v36 = v63;
    sub_23C480CAC();
    sub_23C480C88();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v34 - 8) + 104))(v36, *MEMORY[0x24BEE26D0], v34);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v57 + 8))(v20, v33);
  }
  v29 = (uint64_t)v62;
  return __swift_destroy_boxed_opaque_existential_1(v29);
}

uint64_t sub_23C4774D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PreviousPlanLockupAction();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23C477518(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for PreviousPlanDetail();
    result = MEMORY[0x24261FFB0](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23C477558@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return PreviousPlanLockupAction.init(from:)(a1, a2);
}

uint64_t sub_23C47756C(_QWORD *a1)
{
  return PreviousPlanLockupAction.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for PreviousPlanLockupAction(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  int EnumCaseMultiPayload;
  int *v8;
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
  void (*v19)(char *, char *, uint64_t);
  uint64_t v20;
  char *v21;
  uint64_t v22;
  void (*v23)(char *, char *, uint64_t);
  char *v25;
  char *v26;
  char *v27;
  uint64_t v28;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      v12 = a2[1];
      *a1 = *a2;
      a1[1] = v12;
      swift_bridgeObjectRetain();
LABEL_10:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    if (!EnumCaseMultiPayload)
    {
      v8 = (int *)type metadata accessor for PreviousPlanDetail();
      v9 = *((_QWORD *)v8 - 1);
      if ((*(unsigned int (**)(uint64_t *, uint64_t, int *))(v9 + 48))(a2, 1, v8))
      {
        v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7508);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
      }
      else
      {
        v28 = v9;
        v13 = a2[1];
        *a1 = *a2;
        a1[1] = v13;
        v14 = a2[3];
        a1[2] = a2[2];
        a1[3] = v14;
        v15 = a2[5];
        a1[4] = a2[4];
        a1[5] = v15;
        v16 = a2[7];
        a1[6] = a2[6];
        a1[7] = v16;
        v17 = v8[8];
        v25 = (char *)a2 + v17;
        v26 = (char *)a1 + v17;
        v18 = sub_23C48076C();
        v19 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v19(v26, v25, v18);
        *(uint64_t *)((char *)a1 + v8[9]) = *(uint64_t *)((char *)a2 + v8[9]);
        *(uint64_t *)((char *)a1 + v8[10]) = *(uint64_t *)((char *)a2 + v8[10]);
        *(uint64_t *)((char *)a1 + v8[11]) = *(uint64_t *)((char *)a2 + v8[11]);
        *((_BYTE *)a1 + v8[12]) = *((_BYTE *)a2 + v8[12]);
        *(uint64_t *)((char *)a1 + v8[13]) = *(uint64_t *)((char *)a2 + v8[13]);
        v20 = v8[14];
        v27 = (char *)a1 + v20;
        v21 = (char *)a2 + v20;
        v22 = sub_23C480790();
        v23 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v23(v27, v21, v22);
        *(uint64_t *)((char *)a1 + v8[15]) = *(uint64_t *)((char *)a2 + v8[15]);
        (*(void (**)(uint64_t *, _QWORD, uint64_t, int *))(v28 + 56))(a1, 0, 1, v8);
      }
      goto LABEL_10;
    }
    memcpy(a1, a2, *(_QWORD *)(v5 + 64));
  }
  return a1;
}

uint64_t destroy for PreviousPlanLockupAction(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 1)
    return swift_bridgeObjectRelease();
  if (!(_DWORD)result)
  {
    v3 = type metadata accessor for PreviousPlanDetail();
    result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 48))(a1, 1, v3);
    if (!(_DWORD)result)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v4 = a1 + *(int *)(v3 + 32);
      v5 = sub_23C48076C();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v6 = a1 + *(int *)(v3 + 56);
      v7 = sub_23C480790();
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
    }
  }
  return result;
}

_QWORD *initializeWithCopy for PreviousPlanLockupAction(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, char *, uint64_t);
  uint64_t v18;
  char *v19;
  uint64_t v20;
  void (*v21)(char *, char *, uint64_t);
  char *v23;
  char *v24;
  char *v25;
  uint64_t v26;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    v10 = a2[1];
    *a1 = *a2;
    a1[1] = v10;
    swift_bridgeObjectRetain();
LABEL_8:
    swift_storeEnumTagMultiPayload();
    return a1;
  }
  if (!EnumCaseMultiPayload)
  {
    v7 = (int *)type metadata accessor for PreviousPlanDetail();
    v8 = *((_QWORD *)v7 - 1);
    if ((*(unsigned int (**)(_QWORD *, uint64_t, int *))(v8 + 48))(a2, 1, v7))
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7508);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
    else
    {
      v26 = v8;
      v11 = a2[1];
      *a1 = *a2;
      a1[1] = v11;
      v12 = a2[3];
      a1[2] = a2[2];
      a1[3] = v12;
      v13 = a2[5];
      a1[4] = a2[4];
      a1[5] = v13;
      v14 = a2[7];
      a1[6] = a2[6];
      a1[7] = v14;
      v15 = v7[8];
      v23 = (char *)a2 + v15;
      v24 = (char *)a1 + v15;
      v16 = sub_23C48076C();
      v17 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v17(v24, v23, v16);
      *(_QWORD *)((char *)a1 + v7[9]) = *(_QWORD *)((char *)a2 + v7[9]);
      *(_QWORD *)((char *)a1 + v7[10]) = *(_QWORD *)((char *)a2 + v7[10]);
      *(_QWORD *)((char *)a1 + v7[11]) = *(_QWORD *)((char *)a2 + v7[11]);
      *((_BYTE *)a1 + v7[12]) = *((_BYTE *)a2 + v7[12]);
      *(_QWORD *)((char *)a1 + v7[13]) = *(_QWORD *)((char *)a2 + v7[13]);
      v18 = v7[14];
      v25 = (char *)a1 + v18;
      v19 = (char *)a2 + v18;
      v20 = sub_23C480790();
      v21 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v21(v25, v19, v20);
      *(_QWORD *)((char *)a1 + v7[15]) = *(_QWORD *)((char *)a2 + v7[15]);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, int *))(v26 + 56))(a1, 0, 1, v7);
    }
    goto LABEL_8;
  }
  memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  return a1;
}

_QWORD *assignWithCopy for PreviousPlanLockupAction(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *, char *, uint64_t);
  char *v18;
  char *v19;
  char *v20;

  if (a1 != a2)
  {
    sub_23C477D3C((uint64_t)a1);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
LABEL_9:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    if (!EnumCaseMultiPayload)
    {
      v7 = (int *)type metadata accessor for PreviousPlanDetail();
      v8 = *((_QWORD *)v7 - 1);
      if ((*(unsigned int (**)(_QWORD *, uint64_t, int *))(v8 + 48))(a2, 1, v7))
      {
        v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7508);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
      }
      else
      {
        *a1 = *a2;
        a1[1] = a2[1];
        a1[2] = a2[2];
        a1[3] = a2[3];
        a1[4] = a2[4];
        a1[5] = a2[5];
        a1[6] = a2[6];
        a1[7] = a2[7];
        v10 = v7[8];
        v18 = (char *)a2 + v10;
        v19 = (char *)a1 + v10;
        v11 = sub_23C48076C();
        v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v12(v19, v18, v11);
        *(_QWORD *)((char *)a1 + v7[9]) = *(_QWORD *)((char *)a2 + v7[9]);
        *(_QWORD *)((char *)a1 + v7[10]) = *(_QWORD *)((char *)a2 + v7[10]);
        *(_QWORD *)((char *)a1 + v7[11]) = *(_QWORD *)((char *)a2 + v7[11]);
        *((_BYTE *)a1 + v7[12]) = *((_BYTE *)a2 + v7[12]);
        *(_QWORD *)((char *)a1 + v7[13]) = *(_QWORD *)((char *)a2 + v7[13]);
        v13 = v7[14];
        v20 = (char *)a1 + v13;
        v14 = (char *)a2 + v13;
        v15 = sub_23C480790();
        v16 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v16(v20, v14, v15);
        *(_QWORD *)((char *)a1 + v7[15]) = *(_QWORD *)((char *)a2 + v7[15]);
        (*(void (**)(_QWORD *, _QWORD, uint64_t, int *))(v8 + 56))(a1, 0, 1, v7);
      }
      goto LABEL_9;
    }
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

uint64_t sub_23C477D3C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for PreviousPlanLockupAction();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_OWORD *initializeWithTake for PreviousPlanLockupAction(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;

  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v6 = (int *)type metadata accessor for PreviousPlanDetail();
    v7 = *((_QWORD *)v6 - 1);
    if ((*(unsigned int (**)(_OWORD *, uint64_t, int *))(v7 + 48))(a2, 1, v6))
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7508);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
    }
    else
    {
      v9 = a2[1];
      *a1 = *a2;
      a1[1] = v9;
      v10 = a2[3];
      a1[2] = a2[2];
      a1[3] = v10;
      v11 = v6[8];
      v12 = (char *)a1 + v11;
      v13 = (char *)a2 + v11;
      v14 = sub_23C48076C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v12, v13, v14);
      *(_QWORD *)((char *)a1 + v6[9]) = *(_QWORD *)((char *)a2 + v6[9]);
      *(_QWORD *)((char *)a1 + v6[10]) = *(_QWORD *)((char *)a2 + v6[10]);
      *(_QWORD *)((char *)a1 + v6[11]) = *(_QWORD *)((char *)a2 + v6[11]);
      *((_BYTE *)a1 + v6[12]) = *((_BYTE *)a2 + v6[12]);
      *(_QWORD *)((char *)a1 + v6[13]) = *(_QWORD *)((char *)a2 + v6[13]);
      v15 = v6[14];
      v16 = (char *)a1 + v15;
      v17 = (char *)a2 + v15;
      v18 = sub_23C480790();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v16, v17, v18);
      *(_QWORD *)((char *)a1 + v6[15]) = *(_QWORD *)((char *)a2 + v6[15]);
      (*(void (**)(_OWORD *, _QWORD, uint64_t, int *))(v7 + 56))(a1, 0, 1, v6);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *assignWithTake for PreviousPlanLockupAction(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;

  if (a1 != a2)
  {
    sub_23C477D3C((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v6 = (int *)type metadata accessor for PreviousPlanDetail();
      v7 = *((_QWORD *)v6 - 1);
      if ((*(unsigned int (**)(_OWORD *, uint64_t, int *))(v7 + 48))(a2, 1, v6))
      {
        v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7508);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
      }
      else
      {
        v9 = a2[1];
        *a1 = *a2;
        a1[1] = v9;
        v10 = a2[3];
        a1[2] = a2[2];
        a1[3] = v10;
        v11 = v6[8];
        v12 = (char *)a1 + v11;
        v13 = (char *)a2 + v11;
        v14 = sub_23C48076C();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v12, v13, v14);
        *(_QWORD *)((char *)a1 + v6[9]) = *(_QWORD *)((char *)a2 + v6[9]);
        *(_QWORD *)((char *)a1 + v6[10]) = *(_QWORD *)((char *)a2 + v6[10]);
        *(_QWORD *)((char *)a1 + v6[11]) = *(_QWORD *)((char *)a2 + v6[11]);
        *((_BYTE *)a1 + v6[12]) = *((_BYTE *)a2 + v6[12]);
        *(_QWORD *)((char *)a1 + v6[13]) = *(_QWORD *)((char *)a2 + v6[13]);
        v15 = v6[14];
        v16 = (char *)a1 + v15;
        v17 = (char *)a2 + v15;
        v18 = sub_23C480790();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v16, v17, v18);
        *(_QWORD *)((char *)a1 + v6[15]) = *(_QWORD *)((char *)a2 + v6[15]);
        (*(void (**)(_OWORD *, _QWORD, uint64_t, int *))(v7 + 56))(a1, 0, 1, v6);
      }
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for PreviousPlanLockupAction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for PreviousPlanLockupAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_23C4780BC()
{
  return swift_storeEnumTagMultiPayload();
}

void sub_23C4780CC()
{
  unint64_t v0;

  sub_23C46F450();
  if (v0 <= 0x3F)
    swift_initEnumMetadataMultiPayload();
}

uint64_t storeEnumTagSinglePayload for PreviousPlanLockupAction.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C478184 + 4 * byte_23C483005[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23C4781B8 + 4 * byte_23C483000[v4]))();
}

uint64_t sub_23C4781B8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C4781C0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C4781C8);
  return result;
}

uint64_t sub_23C4781D4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C4781DCLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23C4781E0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C4781E8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PreviousPlanLockupAction.CodingKeys()
{
  return &type metadata for PreviousPlanLockupAction.CodingKeys;
}

ValueMetadata *type metadata accessor for PreviousPlanLockupAction.ViewAppearedCodingKeys()
{
  return &type metadata for PreviousPlanLockupAction.ViewAppearedCodingKeys;
}

ValueMetadata *type metadata accessor for PreviousPlanLockupAction.PlanDetailsFetchedCodingKeys()
{
  return &type metadata for PreviousPlanLockupAction.PlanDetailsFetchedCodingKeys;
}

uint64_t _s18FitnessWorkoutPlan24PreviousPlanLockupActionO28PlanDetailsFetchedCodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23C47826C + 4 * byte_23C48300A[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23C47828C + 4 * byte_23C48300F[v4]))();
}

_BYTE *sub_23C47826C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23C47828C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C478294(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C47829C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C4782A4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C4782AC(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for PreviousPlanLockupAction.RepeatPlanSelectedCodingKeys()
{
  return &type metadata for PreviousPlanLockupAction.RepeatPlanSelectedCodingKeys;
}

unint64_t sub_23C4782CC()
{
  unint64_t result;

  result = qword_256BA7AA8;
  if (!qword_256BA7AA8)
  {
    result = MEMORY[0x24261FFB0](&unk_23C4831B0, &type metadata for PreviousPlanLockupAction.RepeatPlanSelectedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7AA8);
  }
  return result;
}

unint64_t sub_23C478314()
{
  unint64_t result;

  result = qword_256BA7AB0;
  if (!qword_256BA7AB0)
  {
    result = MEMORY[0x24261FFB0](&unk_23C483268, &type metadata for PreviousPlanLockupAction.PlanDetailsFetchedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7AB0);
  }
  return result;
}

unint64_t sub_23C47835C()
{
  unint64_t result;

  result = qword_256BA7AB8;
  if (!qword_256BA7AB8)
  {
    result = MEMORY[0x24261FFB0](&unk_23C483370, &type metadata for PreviousPlanLockupAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7AB8);
  }
  return result;
}

unint64_t sub_23C4783A4()
{
  unint64_t result;

  result = qword_256BA7AC0;
  if (!qword_256BA7AC0)
  {
    result = MEMORY[0x24261FFB0](&unk_23C483290, &type metadata for PreviousPlanLockupAction.ViewAppearedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7AC0);
  }
  return result;
}

unint64_t sub_23C4783EC()
{
  unint64_t result;

  result = qword_256BA7AC8;
  if (!qword_256BA7AC8)
  {
    result = MEMORY[0x24261FFB0](&unk_23C4832B8, &type metadata for PreviousPlanLockupAction.ViewAppearedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7AC8);
  }
  return result;
}

unint64_t sub_23C478434()
{
  unint64_t result;

  result = qword_256BA7AD0;
  if (!qword_256BA7AD0)
  {
    result = MEMORY[0x24261FFB0](&unk_23C4831D8, &type metadata for PreviousPlanLockupAction.PlanDetailsFetchedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7AD0);
  }
  return result;
}

unint64_t sub_23C47847C()
{
  unint64_t result;

  result = qword_256BA7AD8;
  if (!qword_256BA7AD8)
  {
    result = MEMORY[0x24261FFB0](&unk_23C483200, &type metadata for PreviousPlanLockupAction.PlanDetailsFetchedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7AD8);
  }
  return result;
}

unint64_t sub_23C4784C4()
{
  unint64_t result;

  result = qword_256BA7AE0;
  if (!qword_256BA7AE0)
  {
    result = MEMORY[0x24261FFB0](&unk_23C483120, &type metadata for PreviousPlanLockupAction.RepeatPlanSelectedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7AE0);
  }
  return result;
}

unint64_t sub_23C47850C()
{
  unint64_t result;

  result = qword_256BA7AE8;
  if (!qword_256BA7AE8)
  {
    result = MEMORY[0x24261FFB0](&unk_23C483148, &type metadata for PreviousPlanLockupAction.RepeatPlanSelectedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7AE8);
  }
  return result;
}

unint64_t sub_23C478554()
{
  unint64_t result;

  result = qword_256BA7AF0;
  if (!qword_256BA7AF0)
  {
    result = MEMORY[0x24261FFB0](&unk_23C4832E0, &type metadata for PreviousPlanLockupAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7AF0);
  }
  return result;
}

unint64_t sub_23C47859C()
{
  unint64_t result;

  result = qword_256BA7AF8;
  if (!qword_256BA7AF8)
  {
    result = MEMORY[0x24261FFB0](&unk_23C483308, &type metadata for PreviousPlanLockupAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7AF8);
  }
  return result;
}

uint64_t sub_23C4785E0(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6570704177656976 && a2 == 0xEC00000064657261;
  if (v2 || (sub_23C480D54() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000023C485320 || (sub_23C480D54() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000023C485340)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_23C480D54();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

__n128 PlanCompletionFeature.init(environment:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __int128 v2;
  __n128 result;

  v2 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v2;
  result = *(__n128 *)(a1 + 32);
  *(__n128 *)(a2 + 32) = result;
  return result;
}

void PlanCompletionFeature.reduce(localState:sharedState:sideEffects:action:)(uint64_t a1, _BYTE *a2, char **a3, unsigned __int8 *a4)
{
  __int128 *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  int v21;
  __int128 v22;
  int *v23;
  char *v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, _QWORD, uint64_t);
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, _QWORD, uint64_t);
  void (*v34)(_QWORD);
  char *v35;
  unint64_t v36;
  unint64_t v37;
  char *v38;
  char *v39;
  char *v40;
  _OWORD *v41;
  __int128 v42;
  void (*v43)(char *, _QWORD, uint64_t);
  char *v44;
  unint64_t v45;
  unint64_t v46;
  char *v47;
  char *v48;
  char *v49;
  _OWORD *v50;
  __int128 v51;
  char *v52;
  unint64_t v53;
  unint64_t v54;
  int *v55;
  char *v56;
  char *v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _OWORD *v63;
  __int128 v64;
  unint64_t v65;
  unint64_t v66;
  void (*v67)(char *, _QWORD, uint64_t);
  uint64_t v68;
  void (*v69)(char *, _QWORD, uint64_t);
  unint64_t v70;
  void (*v71)(char *, char *, uint64_t);
  unsigned int v72;
  void (*v73)(char *, _QWORD, uint64_t);
  uint64_t v74;
  unsigned int v75;
  unsigned int v76;
  unint64_t v77;
  char **v78;
  char v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7628);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v67 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v67 - v13;
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v67 - v16;
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v67 - v19;
  v21 = *a4;
  v22 = v4[1];
  v80 = *v4;
  v81 = v22;
  v82 = v4[2];
  if (v21 == 1)
  {
    if ((*a2 & 1) != 0)
      return;
    *a2 = 1;
    v23 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_256BA75C8);
    v24 = &v20[v23[16]];
    v25 = &v20[v23[20]];
    v26 = v23[24];
    v78 = a3;
    v27 = &v20[v26];
    v79 = 3;
    v77 = sub_23C478E0C();
    sub_23C480C70();
    sub_23C480C28();
    v28 = *MEMORY[0x24BE2B580];
    v29 = sub_23C480AFC();
    v30 = *(void (**)(char *, _QWORD, uint64_t))(*(_QWORD *)(v29 - 8) + 104);
    v76 = v28;
    v73 = v30;
    v74 = v29;
    ((void (*)(char *, uint64_t))v30)(v24, v28);
    v31 = *MEMORY[0x24BE2B550];
    v32 = sub_23C480AF0();
    v33 = *(void (**)(char *, _QWORD, uint64_t))(*(_QWORD *)(v32 - 8) + 104);
    v72 = v31;
    v69 = v33;
    v33(v25, v31, v32);
    *(_QWORD *)v27 = &unk_256BA7B18;
    *((_QWORD *)v27 + 1) = 0;
    v34 = *(void (**)(_QWORD))(v9 + 104);
    v75 = *MEMORY[0x24BE2B438];
    v67 = (void (*)(char *, _QWORD, uint64_t))v34;
    v34(v20);
    v35 = *v78;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v35 = (char *)sub_23C46CCD4(0, *((_QWORD *)v35 + 2) + 1, 1, v35);
    v37 = *((_QWORD *)v35 + 2);
    v36 = *((_QWORD *)v35 + 3);
    if (v37 >= v36 >> 1)
      v35 = (char *)sub_23C46CCD4(v36 > 1, v37 + 1, 1, v35);
    *((_QWORD *)v35 + 2) = v37 + 1;
    v70 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
    v68 = *(_QWORD *)(v9 + 72);
    v71 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
    v71(&v35[v70 + v68 * v37], v20, v8);
    a3 = v78;
    *v78 = v35;
    v38 = &v17[v23[16]];
    v39 = &v17[v23[20]];
    v40 = &v17[v23[24]];
    v79 = 0;
    sub_23C480C70();
    sub_23C480C40();
    v73(v38, v76, v74);
    v69(v39, v72, v32);
    v41 = (_OWORD *)swift_allocObject();
    v42 = v81;
    v41[1] = v80;
    v41[2] = v42;
    v41[3] = v82;
    *(_QWORD *)v40 = &unk_256BA7B28;
    *((_QWORD *)v40 + 1) = v41;
    v43 = v67;
    v67(v17, v75, v8);
    v44 = *a3;
    sub_23C4795B4((uint64_t)&v80);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v44 = (char *)sub_23C46CCD4(0, *((_QWORD *)v44 + 2) + 1, 1, v44);
    v46 = *((_QWORD *)v44 + 2);
    v45 = *((_QWORD *)v44 + 3);
    if (v46 >= v45 >> 1)
      v44 = (char *)sub_23C46CCD4(v45 > 1, v46 + 1, 1, v44);
    *((_QWORD *)v44 + 2) = v46 + 1;
    v71(&v44[v70 + v46 * v68], v17, v8);
    *a3 = v44;
    v47 = &v14[v23[16]];
    v48 = &v14[v23[20]];
    v49 = &v14[v23[24]];
    v79 = 1;
    sub_23C480C70();
    sub_23C480C28();
    v73(v47, v76, v74);
    v69(v48, v72, v32);
    v50 = (_OWORD *)swift_allocObject();
    v51 = v81;
    v50[1] = v80;
    v50[2] = v51;
    v50[3] = v82;
    *(_QWORD *)v49 = &unk_256BA7B38;
    *((_QWORD *)v49 + 1) = v50;
    v43(v14, v75, v8);
    v52 = *a3;
    sub_23C4795B4((uint64_t)&v80);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v52 = (char *)sub_23C46CCD4(0, *((_QWORD *)v52 + 2) + 1, 1, v52);
    v54 = *((_QWORD *)v52 + 2);
    v53 = *((_QWORD *)v52 + 3);
    if (v54 >= v53 >> 1)
      v52 = (char *)sub_23C46CCD4(v53 > 1, v54 + 1, 1, v52);
    *((_QWORD *)v52 + 2) = v54 + 1;
    v71(&v52[v70 + v54 * v68], v14, v8);
  }
  else
  {
    v55 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_256BA75C8);
    v56 = &v11[v55[16]];
    v57 = &v11[v55[20]];
    v58 = &v11[v55[24]];
    v79 = 2;
    sub_23C478E0C();
    sub_23C480C70();
    sub_23C480C28();
    v59 = *MEMORY[0x24BE2B580];
    v60 = sub_23C480AFC();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v60 - 8) + 104))(v56, v59, v60);
    v61 = *MEMORY[0x24BE2B550];
    v62 = sub_23C480AF0();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v62 - 8) + 104))(v57, v61, v62);
    v63 = (_OWORD *)swift_allocObject();
    v64 = v81;
    v63[1] = v80;
    v63[2] = v64;
    v63[3] = v82;
    *(_QWORD *)v58 = &unk_256BA7B10;
    *((_QWORD *)v58 + 1) = v63;
    (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x24BE2B438], v8);
    v52 = *a3;
    sub_23C4795B4((uint64_t)&v80);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v52 = (char *)sub_23C46CCD4(0, *((_QWORD *)v52 + 2) + 1, 1, v52);
    v66 = *((_QWORD *)v52 + 2);
    v65 = *((_QWORD *)v52 + 3);
    if (v66 >= v65 >> 1)
      v52 = (char *)sub_23C46CCD4(v65 > 1, v66 + 1, 1, v52);
    *((_QWORD *)v52 + 2) = v66 + 1;
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v52[((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(_QWORD *)(v9 + 72) * v66], v11, v8);
  }
  *a3 = v52;
}

unint64_t sub_23C478E0C()
{
  unint64_t result;

  result = qword_256BA7B00;
  if (!qword_256BA7B00)
  {
    result = MEMORY[0x24261FFB0](&unk_23C4835B0, &type metadata for PlanCompletionFeature.TaskIdentifier);
    atomic_store(result, &qword_256BA7B00);
  }
  return result;
}

uint64_t sub_23C478E50()
{
  uint64_t v0;
  _QWORD *v1;

  *(_QWORD *)(v0 + 16) = sub_23C480C1C();
  *(_QWORD *)(v0 + 24) = sub_23C480C10();
  *(_BYTE *)(v0 + 40) = 0;
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7B60);
  *v1 = v0;
  v1[1] = sub_23C478EE0;
  return sub_23C480AE4();
}

uint64_t sub_23C478EE0()
{
  swift_task_dealloc();
  sub_23C480BF8();
  return swift_task_switch();
}

uint64_t sub_23C478F50(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v4;
  uint64_t (*v6)(_QWORD *);

  v2[12] = a1;
  v2[13] = sub_23C480C1C();
  v2[14] = sub_23C480C10();
  v6 = (uint64_t (*)(_QWORD *))(*(int *)*a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  v2[15] = v4;
  *v4 = v2;
  v4[1] = sub_23C478FD8;
  return v6(v2 + 7);
}

uint64_t sub_23C478FD8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v1;
  *(_QWORD *)(*v1 + 128) = v0;
  swift_task_dealloc();
  *(_QWORD *)(v2 + 136) = sub_23C480BF8();
  *(_QWORD *)(v2 + 144) = v3;
  return swift_task_switch();
}

uint64_t sub_23C479064()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = v0[10];
  v2 = __swift_project_boxed_opaque_existential_1(v0 + 7, v1);
  v3 = *(_QWORD *)(v1 - 8);
  v4 = swift_task_alloc();
  (*(void (**)(uint64_t, _QWORD *, uint64_t))(v3 + 16))(v4, v2, v1);
  v0[5] = swift_getAssociatedTypeWitness();
  v0[6] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v0 + 2);
  sub_23C480C4C();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
  v0[19] = sub_23C480C10();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v0[5]);
  v5 = (_QWORD *)swift_task_alloc();
  v0[20] = (uint64_t)v5;
  *v5 = v0;
  v5[1] = sub_23C4791C4;
  return sub_23C480C04();
}

uint64_t sub_23C4791C4()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_23C479218()
{
  uint64_t v0;
  _QWORD *v2;

  if (*(_BYTE *)(v0 + 176) == 1)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    *(_BYTE *)(v0 + 177) = 0;
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 168) = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7B60);
    *v2 = v0;
    v2[1] = sub_23C4792C8;
    return sub_23C480AE4();
  }
}

uint64_t sub_23C4792C8()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23C479314()
{
  uint64_t *v0;
  _QWORD *v1;

  v0[19] = sub_23C480C10();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v0[5]);
  v1 = (_QWORD *)swift_task_alloc();
  v0[20] = (uint64_t)v1;
  *v1 = v0;
  v1[1] = sub_23C4791C4;
  return sub_23C480C04();
}

uint64_t sub_23C4793B8()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C4793EC(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v2[2] = sub_23C480C1C();
  v2[3] = sub_23C480C10();
  v6 = (uint64_t (*)(void))(**(int **)(a2 + 32) + *(_QWORD *)(a2 + 32));
  v4 = (_QWORD *)swift_task_alloc();
  v2[4] = v4;
  *v4 = v2;
  v4[1] = sub_23C46C818;
  return v6();
}

uint64_t sub_23C479460(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v2[2] = sub_23C480C1C();
  v2[3] = sub_23C480C10();
  v6 = (uint64_t (*)(void))(**(int **)(a2 + 32) + *(_QWORD *)(a2 + 32));
  v4 = (_QWORD *)swift_task_alloc();
  v2[4] = v4;
  *v4 = v2;
  v4[1] = sub_23C4794D4;
  return v6();
}

uint64_t sub_23C4794D4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 40) = v0;
  swift_task_dealloc();
  sub_23C480BF8();
  return swift_task_switch();
}

uint64_t sub_23C479560(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23C46CE5C;
  return sub_23C479460(a1, v1 + 16);
}

uint64_t sub_23C4795B4(uint64_t a1)
{
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_23C479608(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23C46C980;
  return sub_23C478F50(a1, (_QWORD *)(v1 + 16));
}

uint64_t objectdestroyTm_1()
{
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23C479694(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23C46CE5C;
  return sub_23C4793EC(a1, v1 + 16);
}

unint64_t sub_23C4796EC()
{
  unint64_t result;

  result = qword_256BA7B40;
  if (!qword_256BA7B40)
  {
    result = MEMORY[0x24261FFB0](&protocol conformance descriptor for PlanCompletionAction, &type metadata for PlanCompletionAction);
    atomic_store(result, (unint64_t *)&qword_256BA7B40);
  }
  return result;
}

unint64_t sub_23C479734()
{
  unint64_t result;

  result = qword_256BA7B48;
  if (!qword_256BA7B48)
  {
    result = MEMORY[0x24261FFB0](&protocol conformance descriptor for PlanCompletionAction, &type metadata for PlanCompletionAction);
    atomic_store(result, (unint64_t *)&qword_256BA7B48);
  }
  return result;
}

unint64_t sub_23C47977C()
{
  unint64_t result;

  result = qword_256BA7B50;
  if (!qword_256BA7B50)
  {
    result = MEMORY[0x24261FFB0](&protocol conformance descriptor for PlanCompletionState, &type metadata for PlanCompletionState);
    atomic_store(result, (unint64_t *)&qword_256BA7B50);
  }
  return result;
}

ValueMetadata *type metadata accessor for PlanCompletionFeature()
{
  return &type metadata for PlanCompletionFeature;
}

uint64_t getEnumTagSinglePayload for PlanCompletionFeature.TaskIdentifier(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for PlanCompletionFeature.TaskIdentifier(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C4798AC + 4 * byte_23C4834E5[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23C4798E0 + 4 * byte_23C4834E0[v4]))();
}

uint64_t sub_23C4798E0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C4798E8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C4798F0);
  return result;
}

uint64_t sub_23C4798FC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C479904);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23C479908(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C479910(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PlanCompletionFeature.TaskIdentifier()
{
  return &type metadata for PlanCompletionFeature.TaskIdentifier;
}

unint64_t sub_23C479930()
{
  unint64_t result;

  result = qword_256BA7B58;
  if (!qword_256BA7B58)
  {
    result = MEMORY[0x24261FFB0](&unk_23C483588, &type metadata for PlanCompletionFeature.TaskIdentifier);
    atomic_store(result, (unint64_t *)&qword_256BA7B58);
  }
  return result;
}

void CreateWorkoutPlanButtonState.handoffAlertState.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;
  char v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
}

_BYTE *CreateWorkoutPlanButtonState.handoffAlertState.setter(_BYTE *result)
{
  _BYTE *v1;
  char v2;

  v2 = result[1];
  *v1 = *result;
  v1[1] = v2;
  return result;
}

uint64_t (*CreateWorkoutPlanButtonState.handoffAlertState.modify())()
{
  return nullsub_1;
}

uint64_t CreateWorkoutPlanButtonState.storefrontLocale.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for CreateWorkoutPlanButtonState() + 20);
  v4 = sub_23C4807A8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t type metadata accessor for CreateWorkoutPlanButtonState()
{
  uint64_t result;

  result = qword_256BA7BE8;
  if (!qword_256BA7BE8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t CreateWorkoutPlanButtonState.supportsHandoffToCompanionDevice.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for CreateWorkoutPlanButtonState() + 24));
}

uint64_t CreateWorkoutPlanButtonState.init(handoffAlertState:storefrontLocale:supportsHandoffToCompanionDevice:)@<X0>(_BYTE *a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, _BYTE *a4@<X8>)
{
  char v7;
  uint64_t WorkoutPlanButtonState;
  _BYTE *v9;
  uint64_t v10;
  uint64_t result;

  v7 = a1[1];
  *a4 = *a1;
  a4[1] = v7;
  WorkoutPlanButtonState = type metadata accessor for CreateWorkoutPlanButtonState();
  v9 = &a4[*(int *)(WorkoutPlanButtonState + 20)];
  v10 = sub_23C4807A8();
  result = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v9, a2, v10);
  a4[*(int *)(WorkoutPlanButtonState + 24)] = a3;
  return result;
}

unint64_t sub_23C479AD8(char a1)
{
  if (!a1)
    return 0xD000000000000011;
  if (a1 == 1)
    return 0xD000000000000010;
  return 0xD000000000000020;
}

unint64_t sub_23C479B34()
{
  char *v0;

  return sub_23C479AD8(*v0);
}

uint64_t sub_23C479B3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C47A83C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C479B60()
{
  sub_23C479D4C();
  return sub_23C480DA8();
}

uint64_t sub_23C479B88()
{
  sub_23C479D4C();
  return sub_23C480DB4();
}

uint64_t CreateWorkoutPlanButtonState.encode(to:)(_QWORD *a1)
{
  _BYTE *v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  char v9;
  _BYTE v11[16];

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7B68);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C479D4C();
  sub_23C480D9C();
  v9 = v3[1];
  v11[14] = *v3;
  v11[15] = v9;
  v11[13] = 0;
  sub_23C479D90();
  sub_23C480D3C();
  if (!v2)
  {
    type metadata accessor for CreateWorkoutPlanButtonState();
    v11[12] = 1;
    sub_23C4807A8();
    sub_23C47A0D0(&qword_256BA74E0, MEMORY[0x24BDCEEC8]);
    sub_23C480D3C();
    v11[11] = 2;
    sub_23C480D24();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_23C479D4C()
{
  unint64_t result;

  result = qword_256BA7B70;
  if (!qword_256BA7B70)
  {
    result = MEMORY[0x24261FFB0](&unk_23C4837A4, &type metadata for CreateWorkoutPlanButtonState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7B70);
  }
  return result;
}

unint64_t sub_23C479D90()
{
  unint64_t result;

  result = qword_256BA7B78;
  if (!qword_256BA7B78)
  {
    result = MEMORY[0x24261FFB0](&protocol conformance descriptor for CreateWorkoutPlanHandoffAlertState, &type metadata for CreateWorkoutPlanHandoffAlertState);
    atomic_store(result, (unint64_t *)&qword_256BA7B78);
  }
  return result;
}

uint64_t CreateWorkoutPlanButtonState.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t WorkoutPlanButtonState;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  _QWORD *v30;
  char v31;
  char v32;
  char v33;
  char v34;
  char v35;

  v25 = a2;
  v3 = sub_23C4807A8();
  v26 = *(_QWORD *)(v3 - 8);
  v27 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7B80);
  v6 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  WorkoutPlanButtonState = type metadata accessor for CreateWorkoutPlanButtonState();
  MEMORY[0x24BDAC7A8](WorkoutPlanButtonState);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C479D4C();
  v28 = v8;
  v12 = (uint64_t)v30;
  sub_23C480D90();
  if (v12)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v24 = WorkoutPlanButtonState;
  v30 = a1;
  v13 = v6;
  v15 = v26;
  v14 = v27;
  v33 = 0;
  sub_23C47A08C();
  v16 = v28;
  v17 = v29;
  sub_23C480CE8();
  v18 = v35;
  v19 = (uint64_t)v11;
  *v11 = v34;
  v11[1] = v18;
  v32 = 1;
  sub_23C47A0D0(&qword_256BA74F8, MEMORY[0x24BDCEEE8]);
  sub_23C480CE8();
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(&v11[*(int *)(v24 + 20)], v5, v14);
  v31 = 2;
  v20 = sub_23C480CD0();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v17);
  v21 = v25;
  *(_BYTE *)(v19 + *(int *)(v24 + 24)) = v20 & 1;
  sub_23C47A110(v19, v21);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  return sub_23C47A154(v19);
}

unint64_t sub_23C47A08C()
{
  unint64_t result;

  result = qword_256BA7B88;
  if (!qword_256BA7B88)
  {
    result = MEMORY[0x24261FFB0](&protocol conformance descriptor for CreateWorkoutPlanHandoffAlertState, &type metadata for CreateWorkoutPlanHandoffAlertState);
    atomic_store(result, (unint64_t *)&qword_256BA7B88);
  }
  return result;
}

uint64_t sub_23C47A0D0(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_23C4807A8();
    result = MEMORY[0x24261FFB0](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23C47A110(uint64_t a1, uint64_t a2)
{
  uint64_t WorkoutPlanButtonState;

  WorkoutPlanButtonState = type metadata accessor for CreateWorkoutPlanButtonState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(WorkoutPlanButtonState - 8) + 16))(a2, a1, WorkoutPlanButtonState);
  return a2;
}

uint64_t sub_23C47A154(uint64_t a1)
{
  uint64_t WorkoutPlanButtonState;

  WorkoutPlanButtonState = type metadata accessor for CreateWorkoutPlanButtonState();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(WorkoutPlanButtonState - 8) + 8))(a1, WorkoutPlanButtonState);
  return a1;
}

uint64_t sub_23C47A190@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return CreateWorkoutPlanButtonState.init(from:)(a1, a2);
}

uint64_t sub_23C47A1A4(_QWORD *a1)
{
  return CreateWorkoutPlanButtonState.encode(to:)(a1);
}

uint64_t _s18FitnessWorkoutPlan06CreatebC11ButtonStateV2eeoiySbAC_ACtFZ_0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  char v2;
  uint64_t WorkoutPlanButtonState;

  v2 = 0;
  if (*a1 == *a2 && ((a1[1] ^ a2[1]) & 1) == 0)
  {
    WorkoutPlanButtonState = type metadata accessor for CreateWorkoutPlanButtonState();
    if ((MEMORY[0x24261F7AC](&a1[*(int *)(WorkoutPlanButtonState + 20)], &a2[*(int *)(WorkoutPlanButtonState + 20)]) & 1) != 0)
      v2 = a1[*(int *)(WorkoutPlanButtonState + 24)] ^ a2[*(int *)(WorkoutPlanButtonState + 24)] ^ 1;
    else
      v2 = 0;
  }
  return v2 & 1;
}

_QWORD *initializeBufferWithCopyOfBuffer for CreateWorkoutPlanButtonState(_WORD *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v11 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *(_WORD *)a2;
    v7 = *(int *)(a3 + 20);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_23C4807A8();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
    *((_BYTE *)v4 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  }
  return v4;
}

uint64_t destroy for CreateWorkoutPlanButtonState(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1 + *(int *)(a2 + 20);
  v3 = sub_23C4807A8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

_WORD *initializeWithCopy for CreateWorkoutPlanButtonState(_WORD *a1, _WORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_23C4807A8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
  *((_BYTE *)a1 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  return a1;
}

_BYTE *assignWithCopy for CreateWorkoutPlanButtonState(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;

  *a1 = *a2;
  a1[1] = a2[1];
  v6 = *(int *)(a3 + 20);
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_23C4807A8();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  a1[*(int *)(a3 + 24)] = a2[*(int *)(a3 + 24)];
  return a1;
}

_WORD *initializeWithTake for CreateWorkoutPlanButtonState(_WORD *a1, _WORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_23C4807A8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  *((_BYTE *)a1 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  return a1;
}

_BYTE *assignWithTake for CreateWorkoutPlanButtonState(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;

  *a1 = *a2;
  a1[1] = a2[1];
  v6 = *(int *)(a3 + 20);
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_23C4807A8();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  a1[*(int *)(a3 + 24)] = a2[*(int *)(a3 + 24)];
  return a1;
}

uint64_t getEnumTagSinglePayload for CreateWorkoutPlanButtonState()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C47A52C(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  unsigned int v4;
  uint64_t v8;

  if ((_DWORD)a2 == 254)
  {
    v4 = *a1;
    if (v4 >= 2)
      return v4 - 1;
    else
      return 0;
  }
  else
  {
    v8 = sub_23C4807A8();
    return (*(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for CreateWorkoutPlanButtonState()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

_BYTE *sub_23C47A5AC(_BYTE *result, uint64_t a2, int a3, uint64_t a4)
{
  _BYTE *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 254)
  {
    *result = a2 + 1;
  }
  else
  {
    v7 = sub_23C4807A8();
    return (_BYTE *)(*(uint64_t (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t sub_23C47A61C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23C4807A8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for CreateWorkoutPlanButtonState.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C47A6E4 + 4 * byte_23C4835F5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23C47A718 + 4 * byte_23C4835F0[v4]))();
}

uint64_t sub_23C47A718(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C47A720(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C47A728);
  return result;
}

uint64_t sub_23C47A734(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C47A73CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23C47A740(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C47A748(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CreateWorkoutPlanButtonState.CodingKeys()
{
  return &type metadata for CreateWorkoutPlanButtonState.CodingKeys;
}

unint64_t sub_23C47A768()
{
  unint64_t result;

  result = qword_256BA7C28;
  if (!qword_256BA7C28)
  {
    result = MEMORY[0x24261FFB0](&unk_23C48377C, &type metadata for CreateWorkoutPlanButtonState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7C28);
  }
  return result;
}

unint64_t sub_23C47A7B0()
{
  unint64_t result;

  result = qword_256BA7C30;
  if (!qword_256BA7C30)
  {
    result = MEMORY[0x24261FFB0](&unk_23C4836EC, &type metadata for CreateWorkoutPlanButtonState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7C30);
  }
  return result;
}

unint64_t sub_23C47A7F8()
{
  unint64_t result;

  result = qword_256BA7C38;
  if (!qword_256BA7C38)
  {
    result = MEMORY[0x24261FFB0](&unk_23C483714, &type metadata for CreateWorkoutPlanButtonState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7C38);
  }
  return result;
}

uint64_t sub_23C47A83C(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000011 && a2 == 0x800000023C485360 || (sub_23C480D54() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000023C485380 || (sub_23C480D54() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000020 && a2 == 0x800000023C4853A0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v5 = sub_23C480D54();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_23C47A978()
{
  return swift_deallocClassInstance();
}

uint64_t localizedWorkoutPlanString(_:locale:comment:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  __n128 v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  _BYTE v15[16];

  v4 = sub_23C4807A8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = &v15[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = sub_23C480B98();
  v9 = MEMORY[0x24BDAC7A8](v8);
  (*(void (**)(_BYTE *, uint64_t, __n128))(v11 + 16))(&v15[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)], a1, v9);
  if (qword_256BA7110 != -1)
    swift_once();
  v12 = (void *)qword_256BADA90;
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  v13 = v12;
  return sub_23C480BB0();
}

id sub_23C47AAC8()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  type metadata accessor for LocalizationBundle();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  qword_256BADA90 = (uint64_t)result;
  return result;
}

uint64_t type metadata accessor for LocalizationBundle()
{
  return objc_opt_self();
}

uint64_t PreviousPlanDetail.placeholderIdentifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PreviousPlanDetail.title.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PreviousPlanDetail.subtitle.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PreviousPlanDetail.caption.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PreviousPlanDetail.startDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for PreviousPlanDetail() + 32);
  v4 = sub_23C48076C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t type metadata accessor for PreviousPlanDetail()
{
  uint64_t result;

  result = qword_256BA7DE8;
  if (!qword_256BA7DE8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t PreviousPlanDetail.workoutPlanLength.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for PreviousPlanDetail() + 36));
}

uint64_t PreviousPlanDetail.weekdays.getter()
{
  type metadata accessor for PreviousPlanDetail();
  return swift_bridgeObjectRetain();
}

uint64_t PreviousPlanDetail.timePerDay.getter()
{
  type metadata accessor for PreviousPlanDetail();
  return swift_bridgeObjectRetain();
}

uint64_t PreviousPlanDetail.hasActivePlan.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for PreviousPlanDetail() + 48));
}

uint64_t PreviousPlanDetail.modalities.getter()
{
  type metadata accessor for PreviousPlanDetail();
  return swift_bridgeObjectRetain();
}

uint64_t PreviousPlanDetail.templateIdentifier.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for PreviousPlanDetail() + 56);
  v4 = sub_23C480790();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t PreviousPlanDetail.modalityIdentifiersCount.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for PreviousPlanDetail() + 60));
}

uint64_t sub_23C47AD78()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int *v8;
  char *v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;

  v0 = sub_23C480790();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_23C48076C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (int *)type metadata accessor for PreviousPlanDetail();
  __swift_allocate_value_buffer((uint64_t)v8, qword_256BA7CD8);
  v9 = (char *)__swift_project_value_buffer((uint64_t)v8, (uint64_t)qword_256BA7CD8);
  sub_23C480760();
  sub_23C480784();
  *(_QWORD *)v9 = 0xD000000000000016;
  *((_QWORD *)v9 + 1) = 0x800000023C485490;
  *((_QWORD *)v9 + 2) = 0xD000000000000011;
  *((_QWORD *)v9 + 3) = 0x800000023C4854B0;
  *((_QWORD *)v9 + 4) = 0xD000000000000014;
  *((_QWORD *)v9 + 5) = 0x800000023C4854D0;
  *((_QWORD *)v9 + 6) = 0xD000000000000013;
  *((_QWORD *)v9 + 7) = 0x800000023C4854F0;
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(&v9[v8[8]], v7, v4);
  *(_QWORD *)&v9[v8[9]] = 0;
  v10 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v9[v8[11]] = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v9[v8[10]] = v10;
  v9[v8[12]] = 0;
  *(_QWORD *)&v9[v8[13]] = v10;
  result = (*(uint64_t (**)(char *, char *, uint64_t))(v1 + 32))(&v9[v8[14]], v3, v0);
  *(_QWORD *)&v9[v8[15]] = 0;
  return result;
}

uint64_t PreviousPlanDetail.init(placeholderIdentifier:title:subtitle:caption:startDate:workoutPlanLength:weekdays:timePerDay:hasActivePlan:modalities:templateIdentifier:modalityIdentifiersCount:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  int *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t result;

  *a9 = a1;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  a9[7] = a8;
  v18 = (int *)type metadata accessor for PreviousPlanDetail();
  v19 = (char *)a9 + v18[8];
  v20 = sub_23C48076C();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(v19, a10, v20);
  *(_QWORD *)((char *)a9 + v18[9]) = a11;
  *(_QWORD *)((char *)a9 + v18[11]) = a13;
  *(_QWORD *)((char *)a9 + v18[10]) = a12;
  *((_BYTE *)a9 + v18[12]) = a14;
  *(_QWORD *)((char *)a9 + v18[13]) = a15;
  v21 = (char *)a9 + v18[14];
  v22 = sub_23C480790();
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 32))(v21, a16, v22);
  *(_QWORD *)((char *)a9 + v18[15]) = a17;
  return result;
}

uint64_t static PreviousPlanDetail.placeholder.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_256BA7118 != -1)
    swift_once();
  v2 = type metadata accessor for PreviousPlanDetail();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_256BA7CD8);
  return sub_23C47B07C(v3, a1);
}

uint64_t sub_23C47B07C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PreviousPlanDetail();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23C47B0C0(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23C47B0FC
                                                                     + 4 * aF[a1]))(0xD000000000000015, 0x800000023C485160);
}

uint64_t sub_23C47B0FC()
{
  return 0x656C746974;
}

uint64_t sub_23C47B110()
{
  return 0x656C746974627573;
}

uint64_t sub_23C47B128()
{
  return 0x6E6F6974706163;
}

uint64_t sub_23C47B140()
{
  return 0x7461447472617473;
}

unint64_t sub_23C47B15C()
{
  return 0xD000000000000011;
}

uint64_t sub_23C47B178()
{
  return 0x737961646B656577;
}

uint64_t sub_23C47B190()
{
  return 0x44726550656D6974;
}

uint64_t sub_23C47B1B0()
{
  return 0x7669746341736168;
}

uint64_t sub_23C47B1D4()
{
  return 0x6974696C61646F6DLL;
}

uint64_t sub_23C47B1F0()
{
  uint64_t v0;

  return v0 + 1;
}

uint64_t sub_23C47B218()
{
  unsigned __int8 *v0;

  return sub_23C47B0C0(*v0);
}

uint64_t sub_23C47B220@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C47D1AC(a1, a2);
  *a3 = result;
  return result;
}

void sub_23C47B244(_BYTE *a1@<X8>)
{
  *a1 = 12;
}

uint64_t sub_23C47B250()
{
  sub_23C47B69C();
  return sub_23C480DA8();
}

uint64_t sub_23C47B278()
{
  sub_23C47B69C();
  return sub_23C480DB4();
}

uint64_t PreviousPlanDetail.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int *v9;
  uint64_t v11;
  uint64_t v12;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7CF0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C47B69C();
  sub_23C480D9C();
  LOBYTE(v12) = 0;
  sub_23C480D18();
  if (!v2)
  {
    LOBYTE(v12) = 1;
    sub_23C480D18();
    LOBYTE(v12) = 2;
    sub_23C480D18();
    LOBYTE(v12) = 3;
    sub_23C480D18();
    v9 = (int *)type metadata accessor for PreviousPlanDetail();
    LOBYTE(v12) = 4;
    sub_23C48076C();
    sub_23C46A7F0(&qword_256BA7D00, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE920]);
    sub_23C480D3C();
    LOBYTE(v12) = 5;
    sub_23C480D30();
    v12 = *(_QWORD *)(v3 + v9[10]);
    HIBYTE(v11) = 6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7D08);
    sub_23C47BEA0(&qword_256BA7D10, (uint64_t (*)(void))sub_23C47B6E0, MEMORY[0x24BEE12A0]);
    sub_23C480D3C();
    v12 = *(_QWORD *)(v3 + v9[11]);
    HIBYTE(v11) = 7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7D20);
    sub_23C47BF4C(&qword_256BA7D28, &qword_256BA7D20, MEMORY[0x24BEE1770], MEMORY[0x24BEE12A0]);
    sub_23C480D3C();
    LOBYTE(v12) = 8;
    sub_23C480D24();
    v12 = *(_QWORD *)(v3 + v9[13]);
    HIBYTE(v11) = 9;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256BA74A8);
    sub_23C47BF4C(&qword_256BA7D30, &qword_256BA74A8, MEMORY[0x24BEE0D08], MEMORY[0x24BEE12A0]);
    sub_23C480D3C();
    LOBYTE(v12) = 10;
    sub_23C480790();
    sub_23C46A7F0(&qword_256BA7D38, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA70]);
    sub_23C480D3C();
    LOBYTE(v12) = 11;
    sub_23C480D30();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_23C47B69C()
{
  unint64_t result;

  result = qword_256BA7CF8;
  if (!qword_256BA7CF8)
  {
    result = MEMORY[0x24261FFB0](&unk_23C483A5C, &type metadata for PreviousPlanDetail.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7CF8);
  }
  return result;
}

unint64_t sub_23C47B6E0()
{
  unint64_t result;

  result = qword_256BA7D18;
  if (!qword_256BA7D18)
  {
    result = MEMORY[0x24261FFB0](&protocol conformance descriptor for PreviousPlanWeekday, &type metadata for PreviousPlanWeekday);
    atomic_store(result, (unint64_t *)&qword_256BA7D18);
  }
  return result;
}

uint64_t PreviousPlanDetail.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  int *v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t *v36;
  char v37;
  uint64_t v38;

  v28 = a2;
  v3 = sub_23C480790();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = sub_23C48076C();
  v31 = *(_QWORD *)(v35 - 8);
  MEMORY[0x24BDAC7A8](v35);
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7D40);
  v9 = *(_QWORD *)(v30 - 8);
  MEMORY[0x24BDAC7A8](v30);
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = (int *)type metadata accessor for PreviousPlanDetail();
  MEMORY[0x24BDAC7A8](v32);
  v36 = (uint64_t *)((char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v13 = a1[3];
  v34 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v13);
  sub_23C47B69C();
  v29 = v11;
  v14 = v33;
  sub_23C480D90();
  if (v14)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
  v27 = v6;
  v33 = v4;
  LOBYTE(v38) = 0;
  v15 = sub_23C480CC4();
  v16 = v35;
  v17 = (char *)v36;
  *v36 = v15;
  *((_QWORD *)v17 + 1) = v18;
  LOBYTE(v38) = 1;
  *((_QWORD *)v17 + 2) = sub_23C480CC4();
  *((_QWORD *)v17 + 3) = v19;
  LOBYTE(v38) = 2;
  *((_QWORD *)v17 + 4) = sub_23C480CC4();
  *((_QWORD *)v17 + 5) = v20;
  LOBYTE(v38) = 3;
  *((_QWORD *)v17 + 6) = sub_23C480CC4();
  *((_QWORD *)v17 + 7) = v21;
  LOBYTE(v38) = 4;
  sub_23C46A7F0(&qword_256BA7D48, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE960]);
  sub_23C480CE8();
  v22 = v32;
  (*(void (**)(char *, char *, uint64_t))(v31 + 32))(&v17[v32[8]], v8, v16);
  LOBYTE(v38) = 5;
  *(_QWORD *)&v17[v22[9]] = sub_23C480CDC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7D08);
  v37 = 6;
  sub_23C47BEA0(&qword_256BA7D50, (uint64_t (*)(void))sub_23C47BF08, MEMORY[0x24BEE12D0]);
  sub_23C480CE8();
  *(_QWORD *)&v17[v22[10]] = v38;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7D20);
  v37 = 7;
  sub_23C47BF4C(&qword_256BA7D60, &qword_256BA7D20, MEMORY[0x24BEE1798], MEMORY[0x24BEE12D0]);
  sub_23C480CE8();
  *(_QWORD *)&v17[v32[11]] = v38;
  LOBYTE(v38) = 8;
  v17[v32[12]] = sub_23C480CD0() & 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256BA74A8);
  v37 = 9;
  sub_23C47BF4C(&qword_256BA7D68, &qword_256BA74A8, MEMORY[0x24BEE0D38], MEMORY[0x24BEE12D0]);
  sub_23C480CE8();
  *(uint64_t *)((char *)v36 + v32[13]) = v38;
  LOBYTE(v38) = 10;
  sub_23C46A7F0(&qword_256BA7D70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAA8]);
  sub_23C480CE8();
  (*(void (**)(char *, char *, uint64_t))(v33 + 32))((char *)v36 + v32[14], v27, v3);
  LOBYTE(v38) = 11;
  v23 = sub_23C480CDC();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v29, v30);
  v24 = (uint64_t)v36;
  *(uint64_t *)((char *)v36 + v32[15]) = v23;
  sub_23C47B07C(v24, v28);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
  return sub_23C47BFA8(v24);
}

uint64_t sub_23C47BEA0(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256BA7D08);
    v8 = a2();
    result = MEMORY[0x24261FFB0](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23C47BF08()
{
  unint64_t result;

  result = qword_256BA7D58;
  if (!qword_256BA7D58)
  {
    result = MEMORY[0x24261FFB0](&protocol conformance descriptor for PreviousPlanWeekday, &type metadata for PreviousPlanWeekday);
    atomic_store(result, (unint64_t *)&qword_256BA7D58);
  }
  return result;
}

uint64_t sub_23C47BF4C(unint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9 = a3;
    result = MEMORY[0x24261FFB0](a4, v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23C47BFA8(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for PreviousPlanDetail();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23C47BFE4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return PreviousPlanDetail.init(from:)(a1, a2);
}

uint64_t sub_23C47BFF8(_QWORD *a1)
{
  return PreviousPlanDetail.encode(to:)(a1);
}

uint64_t PreviousPlanDetail.hash(into:)()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  swift_bridgeObjectRetain();
  sub_23C480BBC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23C480BBC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23C480BBC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23C480BBC();
  swift_bridgeObjectRelease();
  v1 = (int *)type metadata accessor for PreviousPlanDetail();
  sub_23C48076C();
  sub_23C46A7F0(&qword_256BA7D78, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
  sub_23C480B20();
  sub_23C480D6C();
  v2 = *(_QWORD *)(v0 + v1[10]);
  sub_23C480D6C();
  v3 = *(_QWORD *)(v2 + 16);
  if (v3)
  {
    v4 = v2 + 32;
    do
    {
      ++v4;
      sub_23C480D6C();
      --v3;
    }
    while (v3);
  }
  v5 = *(_QWORD *)(v0 + v1[11]);
  sub_23C480D6C();
  v6 = *(_QWORD *)(v5 + 16);
  if (v6)
  {
    v7 = v5 + 32;
    do
    {
      v7 += 8;
      sub_23C480D6C();
      --v6;
    }
    while (v6);
  }
  sub_23C480D78();
  v8 = *(_QWORD *)(v0 + v1[13]);
  sub_23C480D6C();
  v9 = *(_QWORD *)(v8 + 16);
  if (v9)
  {
    swift_bridgeObjectRetain();
    v10 = v8 + 40;
    do
    {
      swift_bridgeObjectRetain();
      sub_23C480BBC();
      swift_bridgeObjectRelease();
      v10 += 16;
      --v9;
    }
    while (v9);
    swift_bridgeObjectRelease();
  }
  sub_23C480790();
  sub_23C46A7F0(&qword_256BA7D80, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23C480B20();
  return sub_23C480D6C();
}

BOOL sub_23C47C258(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _BOOL8 result;
  uint64_t v4;
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  int v7;
  int v8;
  int v9;
  int v10;
  BOOL v12;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  if (*(unsigned __int8 *)(a1 + 32) != *(unsigned __int8 *)(a2 + 32))
    return 0;
  if (v2 == 1)
    return 1;
  v4 = v2 - 2;
  v5 = (unsigned __int8 *)(a1 + 33);
  v6 = (unsigned __int8 *)(a2 + 33);
  do
  {
    v8 = *v5++;
    v7 = v8;
    v10 = *v6++;
    v9 = v10;
    v12 = v4-- != 0;
    result = v7 == v9;
  }
  while (v7 == v9 && v12);
  return result;
}

BOOL sub_23C47C2CC(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  _BOOL8 result;
  uint64_t v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v12;

  v2 = a1[2];
  if (v2 != a2[2])
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  if (a1[4] != a2[4])
    return 0;
  if (v2 == 1)
    return 1;
  v4 = v2 - 2;
  v5 = a1 + 5;
  v6 = a2 + 5;
  do
  {
    v8 = *v5++;
    v7 = v8;
    v10 = *v6++;
    v9 = v10;
    v12 = v4-- != 0;
    result = v7 == v9;
  }
  while (v7 == v9 && v12);
  return result;
}

uint64_t sub_23C47C340(_QWORD *a1, _QWORD *a2)
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
  if (v5 || (v6 = sub_23C480D54(), result = 0, (v6 & 1) != 0))
  {
    v8 = v2 - 1;
    if (!v8)
      return 1;
    v9 = a1 + 7;
    for (i = a2 + 7; ; i += 2)
    {
      v11 = *(v9 - 1) == *(i - 1) && *v9 == *i;
      if (!v11 && (sub_23C480D54() & 1) == 0)
        break;
      v9 += 2;
      if (!--v8)
        return 1;
    }
    return 0;
  }
  return result;
}

uint64_t PreviousPlanDetail.hashValue.getter()
{
  sub_23C480D60();
  PreviousPlanDetail.hash(into:)();
  return sub_23C480D84();
}

uint64_t sub_23C47C440()
{
  sub_23C480D60();
  PreviousPlanDetail.hash(into:)();
  return sub_23C480D84();
}

uint64_t sub_23C47C480()
{
  sub_23C480D60();
  PreviousPlanDetail.hash(into:)();
  return sub_23C480D84();
}

BOOL _s18FitnessWorkoutPlan08PreviousC6DetailV2eeoiySbAC_ACtFZ_0(_QWORD *a1, _QWORD *a2)
{
  BOOL v4;
  char v5;
  _BOOL8 result;
  BOOL v7;
  char v8;
  char v9;
  char v10;
  int *v11;

  v4 = *a1 == *a2 && a1[1] == a2[1];
  if (v4 || (v5 = sub_23C480D54(), result = 0, (v5 & 1) != 0))
  {
    v7 = a1[2] == a2[2] && a1[3] == a2[3];
    if (v7 || (v8 = sub_23C480D54(), result = 0, (v8 & 1) != 0))
    {
      if (a1[4] == a2[4] && a1[5] == a2[5] || (v9 = sub_23C480D54(), result = 0, (v9 & 1) != 0))
      {
        if (a1[6] == a2[6] && a1[7] == a2[7] || (v10 = sub_23C480D54(), result = 0, (v10 & 1) != 0))
        {
          v11 = (int *)type metadata accessor for PreviousPlanDetail();
          return (sub_23C480754() & 1) != 0
              && *(_QWORD *)((char *)a1 + v11[9]) == *(_QWORD *)((char *)a2 + v11[9])
              && sub_23C47C258(*(_QWORD *)((char *)a1 + v11[10]), *(_QWORD *)((char *)a2 + v11[10]))
              && sub_23C47C2CC(*(_QWORD **)((char *)a1 + v11[11]), *(_QWORD **)((char *)a2 + v11[11]))
              && *((unsigned __int8 *)a1 + v11[12]) == *((unsigned __int8 *)a2 + v11[12])
              && (sub_23C47C340(*(_QWORD **)((char *)a1 + v11[13]), *(_QWORD **)((char *)a2 + v11[13])) & 1) != 0
              && (sub_23C480778() & 1) != 0
              && *(_QWORD *)((char *)a1 + v11[15]) == *(_QWORD *)((char *)a2 + v11[15]);
        }
      }
    }
  }
  return result;
}

uint64_t sub_23C47C644()
{
  return sub_23C46A7F0(&qword_256BA7D88, (uint64_t (*)(uint64_t))type metadata accessor for PreviousPlanDetail, (uint64_t)&protocol conformance descriptor for PreviousPlanDetail);
}

_QWORD *initializeBufferWithCopyOfBuffer for PreviousPlanDetail(_QWORD *a1, _QWORD *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  void (*v21)(char *, char *, uint64_t);
  uint64_t v22;
  char *v24;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v22 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v22 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    v9 = a2[5];
    a1[4] = a2[4];
    a1[5] = v9;
    v10 = a2[7];
    v11 = a3[8];
    v24 = (char *)a1 + v11;
    v12 = (char *)a2 + v11;
    a1[6] = a2[6];
    a1[7] = v10;
    v13 = sub_23C48076C();
    v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v14(v24, v12, v13);
    v15 = a3[10];
    *(_QWORD *)((char *)v4 + a3[9]) = *(_QWORD *)((char *)a2 + a3[9]);
    *(_QWORD *)((char *)v4 + v15) = *(_QWORD *)((char *)a2 + v15);
    v16 = a3[12];
    *(_QWORD *)((char *)v4 + a3[11]) = *(_QWORD *)((char *)a2 + a3[11]);
    *((_BYTE *)v4 + v16) = *((_BYTE *)a2 + v16);
    v17 = a3[14];
    *(_QWORD *)((char *)v4 + a3[13]) = *(_QWORD *)((char *)a2 + a3[13]);
    v18 = (char *)v4 + v17;
    v19 = (char *)a2 + v17;
    v20 = sub_23C480790();
    v21 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v21(v18, v19, v20);
    *(_QWORD *)((char *)v4 + a3[15]) = *(_QWORD *)((char *)a2 + a3[15]);
  }
  return v4;
}

uint64_t destroy for PreviousPlanDetail(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 32);
  v5 = sub_23C48076C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v6 = a1 + *(int *)(a2 + 56);
  v7 = sub_23C480790();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
}

_QWORD *initializeWithCopy for PreviousPlanDetail(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  void (*v20)(char *, char *, uint64_t);
  char *v22;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  v9 = a2[7];
  v10 = a3[8];
  v22 = (char *)a1 + v10;
  v11 = (char *)a2 + v10;
  a1[6] = a2[6];
  a1[7] = v9;
  v12 = sub_23C48076C();
  v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v13(v22, v11, v12);
  v14 = a3[10];
  *(_QWORD *)((char *)a1 + a3[9]) = *(_QWORD *)((char *)a2 + a3[9]);
  *(_QWORD *)((char *)a1 + v14) = *(_QWORD *)((char *)a2 + v14);
  v15 = a3[12];
  *(_QWORD *)((char *)a1 + a3[11]) = *(_QWORD *)((char *)a2 + a3[11]);
  *((_BYTE *)a1 + v15) = *((_BYTE *)a2 + v15);
  v16 = a3[14];
  *(_QWORD *)((char *)a1 + a3[13]) = *(_QWORD *)((char *)a2 + a3[13]);
  v17 = (char *)a1 + v16;
  v18 = (char *)a2 + v16;
  v19 = sub_23C480790();
  v20 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v20(v17, v18, v19);
  *(_QWORD *)((char *)a1 + a3[15]) = *(_QWORD *)((char *)a2 + a3[15]);
  return a1;
}

_QWORD *assignWithCopy for PreviousPlanDetail(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[8];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_23C48076C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  *(_QWORD *)((char *)a1 + a3[9]) = *(_QWORD *)((char *)a2 + a3[9]);
  *(_QWORD *)((char *)a1 + a3[10]) = *(_QWORD *)((char *)a2 + a3[10]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)((char *)a1 + a3[11]) = *(_QWORD *)((char *)a2 + a3[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_BYTE *)a1 + a3[12]) = *((_BYTE *)a2 + a3[12]);
  *(_QWORD *)((char *)a1 + a3[13]) = *(_QWORD *)((char *)a2 + a3[13]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = a3[14];
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = sub_23C480790();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 24))(v11, v12, v13);
  *(_QWORD *)((char *)a1 + a3[15]) = *(_QWORD *)((char *)a2 + a3[15]);
  return a1;
}

_OWORD *initializeWithTake for PreviousPlanDetail(_OWORD *a1, _OWORD *a2, int *a3)
{
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  v8 = a3[8];
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_23C48076C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
  v12 = a3[10];
  *(_QWORD *)((char *)a1 + a3[9]) = *(_QWORD *)((char *)a2 + a3[9]);
  *(_QWORD *)((char *)a1 + v12) = *(_QWORD *)((char *)a2 + v12);
  v13 = a3[12];
  *(_QWORD *)((char *)a1 + a3[11]) = *(_QWORD *)((char *)a2 + a3[11]);
  *((_BYTE *)a1 + v13) = *((_BYTE *)a2 + v13);
  v14 = a3[14];
  *(_QWORD *)((char *)a1 + a3[13]) = *(_QWORD *)((char *)a2 + a3[13]);
  v15 = (char *)a1 + v14;
  v16 = (char *)a2 + v14;
  v17 = sub_23C480790();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v15, v16, v17);
  *(_QWORD *)((char *)a1 + a3[15]) = *(_QWORD *)((char *)a2 + a3[15]);
  return a1;
}

_QWORD *assignWithTake for PreviousPlanDetail(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  v9 = a2[7];
  a1[6] = a2[6];
  a1[7] = v9;
  swift_bridgeObjectRelease();
  v10 = a3[8];
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = sub_23C48076C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 40))(v11, v12, v13);
  v14 = a3[10];
  *(_QWORD *)((char *)a1 + a3[9]) = *(_QWORD *)((char *)a2 + a3[9]);
  *(_QWORD *)((char *)a1 + v14) = *(_QWORD *)((char *)a2 + v14);
  swift_bridgeObjectRelease();
  *(_QWORD *)((char *)a1 + a3[11]) = *(_QWORD *)((char *)a2 + a3[11]);
  swift_bridgeObjectRelease();
  v15 = a3[13];
  *((_BYTE *)a1 + a3[12]) = *((_BYTE *)a2 + a3[12]);
  *(_QWORD *)((char *)a1 + v15) = *(_QWORD *)((char *)a2 + v15);
  swift_bridgeObjectRelease();
  v16 = a3[14];
  v17 = (char *)a1 + v16;
  v18 = (char *)a2 + v16;
  v19 = sub_23C480790();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 40))(v17, v18, v19);
  *(_QWORD *)((char *)a1 + a3[15]) = *(_QWORD *)((char *)a2 + a3[15]);
  return a1;
}

uint64_t getEnumTagSinglePayload for PreviousPlanDetail()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C47CD74(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_23C48076C();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = *(int *)(a3 + 32);
    }
    else
    {
      v10 = sub_23C480790();
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a3 + 56);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1 + v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for PreviousPlanDetail()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C47CE20(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v8 = sub_23C48076C();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = *(int *)(a4 + 32);
    }
    else
    {
      v10 = sub_23C480790();
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a4 + 56);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5 + v11, a2, a2, v10);
  }
  return result;
}

uint64_t sub_23C47CEBC()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_23C48076C();
  if (v1 <= 0x3F)
  {
    result = sub_23C480790();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t getEnumTagSinglePayload for PreviousPlanDetail.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF5)
    goto LABEL_17;
  if (a2 + 11 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 11) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 11;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 11;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 11;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xC;
  v8 = v6 - 12;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for PreviousPlanDetail.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 11 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 11) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF5)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF4)
    return ((uint64_t (*)(void))((char *)&loc_23C47D054 + 4 * byte_23C483831[v4]))();
  *a1 = a2 + 11;
  return ((uint64_t (*)(void))((char *)sub_23C47D088 + 4 * byte_23C48382C[v4]))();
}

uint64_t sub_23C47D088(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C47D090(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C47D098);
  return result;
}

uint64_t sub_23C47D0A4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C47D0ACLL);
  *(_BYTE *)result = a2 + 11;
  return result;
}

uint64_t sub_23C47D0B0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C47D0B8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PreviousPlanDetail.CodingKeys()
{
  return &type metadata for PreviousPlanDetail.CodingKeys;
}

unint64_t sub_23C47D0D8()
{
  unint64_t result;

  result = qword_256BA7E48;
  if (!qword_256BA7E48)
  {
    result = MEMORY[0x24261FFB0](&unk_23C483A34, &type metadata for PreviousPlanDetail.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7E48);
  }
  return result;
}

unint64_t sub_23C47D120()
{
  unint64_t result;

  result = qword_256BA7E50;
  if (!qword_256BA7E50)
  {
    result = MEMORY[0x24261FFB0](&unk_23C4839A4, &type metadata for PreviousPlanDetail.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7E50);
  }
  return result;
}

unint64_t sub_23C47D168()
{
  unint64_t result;

  result = qword_256BA7E58;
  if (!qword_256BA7E58)
  {
    result = MEMORY[0x24261FFB0](&unk_23C4839CC, &type metadata for PreviousPlanDetail.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7E58);
  }
  return result;
}

uint64_t sub_23C47D1AC(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000015 && a2 == 0x800000023C485160 || (sub_23C480D54() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656C746974 && a2 == 0xE500000000000000 || (sub_23C480D54() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x656C746974627573 && a2 == 0xE800000000000000 || (sub_23C480D54() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6E6F6974706163 && a2 == 0xE700000000000000 || (sub_23C480D54() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x7461447472617473 && a2 == 0xE900000000000065 || (sub_23C480D54() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000023C485430 || (sub_23C480D54() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x737961646B656577 && a2 == 0xE800000000000000 || (sub_23C480D54() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x44726550656D6974 && a2 == 0xEA00000000007961 || (sub_23C480D54() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x7669746341736168 && a2 == 0xED00006E616C5065 || (sub_23C480D54() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x6974696C61646F6DLL && a2 == 0xEA00000000007365 || (sub_23C480D54() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000023C485450 || (sub_23C480D54() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x800000023C485470)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else
  {
    v5 = sub_23C480D54();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 11;
    else
      return 12;
  }
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

uint64_t PreviousPlanWeekday.rawValue.getter(uint64_t result)
{
  return result;
}

unint64_t sub_23C47D6DC@<X0>(unint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = _s18FitnessWorkoutPlan08PreviousC7WeekdayO8rawValueACSgSi_tcfC_0(*a1);
  *a2 = result;
  return result;
}

void sub_23C47D704(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

uint64_t sub_23C47D710()
{
  sub_23C47D96C();
  return sub_23C480BE0();
}

uint64_t sub_23C47D76C()
{
  sub_23C47D96C();
  return sub_23C480BD4();
}

unint64_t _s18FitnessWorkoutPlan08PreviousC7WeekdayO8rawValueACSgSi_tcfC_0(unint64_t result)
{
  if (result >= 7)
    return 7;
  return result;
}

unint64_t sub_23C47D7CC()
{
  unint64_t result;

  result = qword_256BA7E60;
  if (!qword_256BA7E60)
  {
    result = MEMORY[0x24261FFB0](&protocol conformance descriptor for PreviousPlanWeekday, &type metadata for PreviousPlanWeekday);
    atomic_store(result, (unint64_t *)&qword_256BA7E60);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for PreviousPlanWeekday(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for PreviousPlanWeekday(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C47D8EC + 4 * byte_23C483AB5[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_23C47D920 + 4 * byte_23C483AB0[v4]))();
}

uint64_t sub_23C47D920(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C47D928(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C47D930);
  return result;
}

uint64_t sub_23C47D93C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C47D944);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_23C47D948(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C47D950(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PreviousPlanWeekday()
{
  return &type metadata for PreviousPlanWeekday;
}

unint64_t sub_23C47D96C()
{
  unint64_t result;

  result = qword_256BA7E68;
  if (!qword_256BA7E68)
  {
    result = MEMORY[0x24261FFB0](&protocol conformance descriptor for PreviousPlanWeekday, &type metadata for PreviousPlanWeekday);
    atomic_store(result, (unint64_t *)&qword_256BA7E68);
  }
  return result;
}

uint64_t sub_23C47D9B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))(a3, a1);
}

uint64_t LockupView.init(planDetail:artworkViewBuilder:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _QWORD *v18;
  uint64_t v19;

  v12 = sub_23C4807CC();
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23C4807C0();
  sub_23C47DACC(2, 2, 2, (uint64_t)v14, a4, a5, a6, 16.0, 9.0, 12.0, 0.0, 8.0, 28.0);
  v16 = type metadata accessor for LockupView(0, a4, a5, v15);
  result = sub_23C4654A4(a1, a6 + *(int *)(v16 + 36));
  v18 = (_QWORD *)(a6 + *(int *)(v16 + 40));
  *v18 = a2;
  v18[1] = a3;
  return result;
}

uint64_t sub_23C47DACC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>, double a8@<D0>, double a9@<D1>, double a10@<D2>, double a11@<D3>, double a12@<D4>, double a13@<D5>)
{
  int *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;

  *(double *)a7 = a8;
  *(double *)(a7 + 8) = a9;
  *(double *)(a7 + 16) = a10;
  *(double *)(a7 + 24) = a11;
  *(_QWORD *)(a7 + 32) = a1;
  *(_QWORD *)(a7 + 40) = a2;
  *(_QWORD *)(a7 + 48) = a3;
  v17 = (int *)type metadata accessor for LockupView.Layout(0, a5, a6, a4);
  v18 = a7 + v17[14];
  v19 = sub_23C4807CC();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v18, a4, v19);
  *(double *)(a7 + v17[15]) = a12;
  *(double *)(a7 + v17[16]) = a13;
  return result;
}

uint64_t type metadata accessor for LockupView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for LockupView);
}

uint64_t LockupView.body.getter@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v2;
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
  uint64_t v14;
  uint64_t v15;
  __n128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  void (*v27)(char *, char *, uint64_t);
  void (*v28)(char *, uint64_t);
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[3];

  v37 = a2;
  v4 = *(_QWORD *)(a1 + 16);
  v31 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23C48082C();
  v33 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v30 - v8;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256BA7E70);
  v10 = sub_23C48082C();
  v36 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v30 - v11;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256BA7E78);
  v13 = sub_23C48082C();
  v35 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v32 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v34 = (char *)&v30 - v17;
  (*(void (**)(__n128))(v2 + *(int *)(a1 + 40)))(v16);
  v18 = *(_QWORD *)(a1 + 24);
  sub_23C480988();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v6, v4);
  v43[0] = v18;
  v43[1] = MEMORY[0x24BDEEC40];
  v19 = MEMORY[0x24261FFB0](MEMORY[0x24BDED308], v7, v43);
  sub_23C480994();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v9, v7);
  sub_23C480AA8();
  v38 = v4;
  v39 = v18;
  v40 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7E80);
  v20 = sub_23C469CBC(&qword_256BA7E88, &qword_256BA7E70, MEMORY[0x24BDEB950]);
  v42[0] = v19;
  v42[1] = v20;
  v21 = MEMORY[0x24BDED308];
  v22 = MEMORY[0x24261FFB0](MEMORY[0x24BDED308], v10, v42);
  sub_23C47E6C8();
  v23 = v32;
  sub_23C4809C4();
  (*(void (**)(char *, uint64_t))(v36 + 8))(v12, v10);
  v24 = sub_23C469CBC(qword_256BA7EA8, &qword_256BA7E78, MEMORY[0x24BDEDC10]);
  v41[0] = v22;
  v41[1] = v24;
  MEMORY[0x24261FFB0](v21, v13, v41);
  v26 = v34;
  v25 = v35;
  v27 = *(void (**)(char *, char *, uint64_t))(v35 + 16);
  v27(v34, v23, v13);
  v28 = *(void (**)(char *, uint64_t))(v25 + 8);
  v28(v23, v13);
  v27(v37, v26, v13);
  return ((uint64_t (*)(char *, uint64_t))v28)(v26, v13);
}

void *sub_23C47DEB8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *result;
  _BYTE v28[328];
  _BYTE v29[336];
  _BYTE v30[328];
  char v31;
  _BYTE v32[7];
  _DWORD v33[3];

  v9 = type metadata accessor for LockupView.Layout(0, a2, a3, a4);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = &v28[-v11 - 8];
  v13 = sub_23C4808BC();
  v14 = *(_QWORD *)((char *)a1 + *(int *)(v9 + 60));
  sub_23C47E05C(a1, a2, a3, v15, (uint64_t)v28);
  v29[328] = 0;
  memcpy(&v29[7], v28, 0x141uLL);
  memcpy(v30, v29, sizeof(v30));
  (*(void (**)(_BYTE *, _QWORD *, uint64_t))(v10 + 16))(v12, a1, v9);
  v16 = &v12[*(int *)(v9 + 56)];
  sub_23C4807B4();
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v25 = sub_23C4807CC();
  (*(void (**)(_BYTE *, uint64_t))(*(_QWORD *)(v25 - 8) + 8))(v16, v25);
  LOBYTE(v16) = sub_23C480910();
  v31 = 0;
  *(_QWORD *)a5 = v13;
  *(_QWORD *)(a5 + 8) = v14;
  *(_BYTE *)(a5 + 16) = 0;
  result = memcpy((void *)(a5 + 17), v30, 0x148uLL);
  *(_DWORD *)(a5 + 345) = v33[0];
  *(_DWORD *)(a5 + 348) = *(_DWORD *)((char *)v33 + 3);
  *(_BYTE *)(a5 + 352) = (_BYTE)v16;
  *(_DWORD *)(a5 + 353) = *(_DWORD *)v32;
  *(_DWORD *)(a5 + 356) = *(_DWORD *)&v32[3];
  *(_QWORD *)(a5 + 360) = v18;
  *(_QWORD *)(a5 + 368) = v20;
  *(_QWORD *)(a5 + 376) = v22;
  *(_QWORD *)(a5 + 384) = v24;
  *(_BYTE *)(a5 + 392) = v31;
  return result;
}

void *sub_23C47E050@<X0>(uint64_t a1@<X3>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_23C47DEB8(*(_QWORD **)(v2 + 32), *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), a1, a2);
}

uint64_t sub_23C47E05C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
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
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  char v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v68;
  uint64_t v70;
  uint64_t v72;
  uint64_t v73;
  char v74;
  char v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char v80;
  uint64_t v81;
  char v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t KeyPath;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v91;
  _BYTE v92[7];
  int v93;
  char v94;
  _BYTE v95[7];
  _BYTE v96[7];
  _BYTE v97[7];
  _BYTE v98[7];
  int v99;
  char v100;
  _BYTE v101[7];
  _BYTE v102[7];
  _BYTE v103[7];
  int v104;
  char v105;

  v83 = (char *)a1 + *(int *)(type metadata accessor for LockupView(0, a2, a3, a4) + 36);
  sub_23C468EE0();
  swift_bridgeObjectRetain();
  v6 = sub_23C480964();
  v8 = v7;
  v10 = v9 & 1;
  sub_23C48091C();
  sub_23C480928();
  swift_release();
  v11 = sub_23C480958();
  v13 = v12;
  v15 = v14;
  swift_release();
  sub_23C468E50(v6, v8, v10);
  swift_bridgeObjectRelease();
  sub_23C480A0C();
  v16 = sub_23C480940();
  v88 = v17;
  v89 = v16;
  LOBYTE(v8) = v18;
  v87 = v19;
  swift_release();
  v82 = v8 & 1;
  sub_23C468E50(v11, v13, v15 & 1);
  swift_bridgeObjectRelease();
  v81 = a1[4];
  KeyPath = swift_getKeyPath();
  v80 = sub_23C480910();
  sub_23C480808();
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  swift_bridgeObjectRetain();
  v28 = sub_23C480964();
  v30 = v29;
  LOBYTE(v13) = v31 & 1;
  sub_23C480934();
  v32 = sub_23C480958();
  v34 = v33;
  LOBYTE(v11) = v35;
  swift_release();
  sub_23C468E50(v28, v30, v13);
  swift_bridgeObjectRelease();
  sub_23C480A0C();
  v36 = sub_23C480940();
  v78 = v37;
  v79 = v36;
  LOBYTE(v30) = v38;
  v77 = v39;
  swift_release();
  v74 = v30 & 1;
  sub_23C468E50(v32, v34, v11 & 1);
  swift_bridgeObjectRelease();
  v73 = a1[5];
  v76 = swift_getKeyPath();
  v75 = sub_23C480910();
  sub_23C480808();
  v41 = v40;
  v43 = v42;
  v45 = v44;
  v47 = v46;
  v72 = *(_QWORD *)((char *)a1 + *(int *)(type metadata accessor for LockupView.Layout(0, a2, a3, v48) + 64));
  v91 = *((_QWORD *)v83 + 6);
  swift_bridgeObjectRetain();
  v49 = sub_23C480964();
  v51 = v50;
  v53 = v52 & 1;
  sub_23C480934();
  v54 = sub_23C480958();
  v56 = v55;
  LOBYTE(v32) = v57;
  swift_release();
  sub_23C468E50(v49, v51, v53);
  swift_bridgeObjectRelease();
  sub_23C480A18();
  v84 = sub_23C480940();
  v68 = v59;
  v70 = v58;
  v61 = v60;
  swift_release();
  sub_23C468E50(v54, v56, v32 & 1);
  swift_bridgeObjectRelease();
  v62 = a1[6];
  v85 = swift_getKeyPath();
  LOBYTE(v49) = sub_23C480910();
  sub_23C480808();
  *(_DWORD *)(a5 + 275) = v93;
  *(_DWORD *)(a5 + 284) = *(_DWORD *)&v92[3];
  *(_DWORD *)(a5 + 281) = *(_DWORD *)v92;
  *(_DWORD *)(a5 + 17) = v91;
  *(_DWORD *)(a5 + 20) = *(_DWORD *)((char *)&v91 + 3);
  *(_BYTE *)(a5 + 55) = v105;
  *(_DWORD *)(a5 + 51) = v104;
  *(_DWORD *)(a5 + 60) = *(_DWORD *)&v103[3];
  *(_DWORD *)(a5 + 57) = *(_DWORD *)v103;
  *(_DWORD *)(a5 + 100) = *(_DWORD *)&v102[3];
  *(_DWORD *)(a5 + 97) = *(_DWORD *)v102;
  *(_DWORD *)(a5 + 124) = *(_DWORD *)&v101[3];
  *(_DWORD *)(a5 + 121) = *(_DWORD *)v101;
  *(_BYTE *)(a5 + 159) = v100;
  *(_DWORD *)(a5 + 155) = v99;
  *(_DWORD *)(a5 + 164) = *(_DWORD *)&v98[3];
  *(_DWORD *)(a5 + 161) = *(_DWORD *)v98;
  *(_DWORD *)(a5 + 204) = *(_DWORD *)&v97[3];
  *(_DWORD *)(a5 + 201) = *(_DWORD *)v97;
  *(_DWORD *)(a5 + 220) = *(_DWORD *)&v96[3];
  *(_DWORD *)(a5 + 217) = *(_DWORD *)v96;
  *(_DWORD *)(a5 + 244) = *(_DWORD *)&v95[3];
  *(_DWORD *)(a5 + 241) = *(_DWORD *)v95;
  *(_BYTE *)(a5 + 279) = v94;
  *(_QWORD *)(a5 + 40) = v81;
  *(_BYTE *)(a5 + 56) = v80;
  *(_BYTE *)(a5 + 96) = 0;
  *(_BYTE *)(a5 + 120) = v74;
  *(_QWORD *)(a5 + 144) = v73;
  *(_BYTE *)(a5 + 152) = 0;
  *(_WORD *)(a5 + 273) = 256;
  *(_WORD *)(a5 + 49) = 256;
  *(_WORD *)(a5 + 153) = 256;
  *(_BYTE *)(a5 + 160) = v75;
  *(_BYTE *)(a5 + 200) = 0;
  *(_QWORD *)(a5 + 208) = v72;
  *(_BYTE *)(a5 + 216) = 0;
  *(_BYTE *)(a5 + 240) = v61 & 1;
  *(_QWORD *)(a5 + 264) = v62;
  *(_BYTE *)(a5 + 272) = 0;
  *(_BYTE *)(a5 + 280) = v49;
  *(_BYTE *)(a5 + 320) = 0;
  *(_QWORD *)a5 = v89;
  *(_QWORD *)(a5 + 8) = v88;
  *(_BYTE *)(a5 + 16) = v82;
  *(_QWORD *)(a5 + 24) = v87;
  *(_QWORD *)(a5 + 32) = KeyPath;
  *(_BYTE *)(a5 + 48) = 0;
  *(_QWORD *)(a5 + 64) = v21;
  *(_QWORD *)(a5 + 72) = v23;
  *(_QWORD *)(a5 + 80) = v25;
  *(_QWORD *)(a5 + 88) = v27;
  *(_QWORD *)(a5 + 104) = v79;
  *(_QWORD *)(a5 + 112) = v78;
  *(_QWORD *)(a5 + 128) = v77;
  *(_QWORD *)(a5 + 136) = v76;
  *(_QWORD *)(a5 + 168) = v41;
  *(_QWORD *)(a5 + 176) = v43;
  *(_QWORD *)(a5 + 184) = v45;
  *(_QWORD *)(a5 + 192) = v47;
  *(_QWORD *)(a5 + 224) = v84;
  *(_QWORD *)(a5 + 232) = v70;
  *(_QWORD *)(a5 + 248) = v68;
  *(_QWORD *)(a5 + 256) = v85;
  *(_QWORD *)(a5 + 288) = v63;
  *(_QWORD *)(a5 + 296) = v64;
  *(_QWORD *)(a5 + 304) = v65;
  *(_QWORD *)(a5 + 312) = v66;
  sub_23C468D40(v89, v88, v82);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_23C468D40(v79, v78, v74);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_23C468D40(v84, v70, v61 & 1);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_23C468E50(v84, v70, v61 & 1);
  swift_release();
  swift_bridgeObjectRelease();
  sub_23C468E50(v79, v78, v74);
  swift_release();
  swift_bridgeObjectRelease();
  sub_23C468E50(v89, v88, v82);
  swift_release();
  return swift_bridgeObjectRelease();
}

unint64_t sub_23C47E6C8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256BA7E90;
  if (!qword_256BA7E90)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256BA7E80);
    v2[0] = sub_23C469CBC(&qword_256BA7E98, &qword_256BA7EA0, MEMORY[0x24BDF4700]);
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x24261FFB0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256BA7E90);
  }
  return result;
}

uint64_t sub_23C47E74C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23C47E784(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  unint64_t v5;
  unint64_t v6;

  result = type metadata accessor for LockupView.Layout(319, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), a4);
  if (v5 <= 0x3F)
  {
    result = type metadata accessor for PreviousPlanDetail();
    if (v6 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

_QWORD *sub_23C47E818(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  int v6;
  __int128 v7;
  int *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t, uint64_t);
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  void (*v33)(char *, uint64_t, uint64_t);
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;

  v5 = (_QWORD *)a1;
  v6 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v6 & 0x20000) != 0)
  {
    v31 = *a2;
    *v5 = *a2;
    v5 = (_QWORD *)(v31 + ((v6 + 16) & ~(unint64_t)v6));
  }
  else
  {
    v7 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v7;
    *(_OWORD *)(a1 + 32) = *((_OWORD *)a2 + 2);
    *(_QWORD *)(a1 + 48) = a2[6];
    v9 = (int *)type metadata accessor for LockupView.Layout(0, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24), a4);
    v10 = v9[14];
    v11 = (char *)v5 + v10;
    v12 = (uint64_t)a2 + v10;
    v13 = sub_23C4807CC();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
    *(_QWORD *)((char *)v5 + v9[15]) = *(uint64_t *)((char *)a2 + v9[15]);
    *(_QWORD *)((char *)v5 + v9[16]) = *(uint64_t *)((char *)a2 + v9[16]);
    v14 = *(int *)(a3 + 36);
    v15 = (_QWORD *)((char *)v5 + v14);
    v16 = (uint64_t)a2 + v14;
    v17 = *(uint64_t *)((char *)a2 + v14 + 8);
    *v15 = *(uint64_t *)((char *)a2 + v14);
    v15[1] = v17;
    v18 = *(uint64_t *)((char *)a2 + v14 + 24);
    v15[2] = *(uint64_t *)((char *)a2 + v14 + 16);
    v15[3] = v18;
    v19 = *(uint64_t *)((char *)a2 + v14 + 40);
    v15[4] = *(uint64_t *)((char *)a2 + v14 + 32);
    v15[5] = v19;
    v20 = *(uint64_t *)((char *)a2 + v14 + 56);
    v15[6] = *(uint64_t *)((char *)a2 + v14 + 48);
    v15[7] = v20;
    v21 = (int *)type metadata accessor for PreviousPlanDetail();
    v22 = v21[8];
    v34 = v16 + v22;
    v36 = (char *)v15 + v22;
    v23 = sub_23C48076C();
    v33 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v33(v36, v34, v23);
    *(_QWORD *)((char *)v15 + v21[9]) = *(_QWORD *)(v16 + v21[9]);
    *(_QWORD *)((char *)v15 + v21[10]) = *(_QWORD *)(v16 + v21[10]);
    *(_QWORD *)((char *)v15 + v21[11]) = *(_QWORD *)(v16 + v21[11]);
    *((_BYTE *)v15 + v21[12]) = *(_BYTE *)(v16 + v21[12]);
    *(_QWORD *)((char *)v15 + v21[13]) = *(_QWORD *)(v16 + v21[13]);
    v24 = v21[14];
    v35 = v16 + v24;
    v37 = (char *)v15 + v24;
    v25 = sub_23C480790();
    v26 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v26(v37, v35, v25);
    *(_QWORD *)((char *)v15 + v21[15]) = *(_QWORD *)(v16 + v21[15]);
    v27 = *(int *)(a3 + 40);
    v28 = (_QWORD *)((char *)v5 + v27);
    v29 = (uint64_t *)((char *)a2 + v27);
    v30 = v29[1];
    *v28 = *v29;
    v28[1] = v30;
  }
  swift_retain();
  return v5;
}

uint64_t type metadata accessor for LockupView.Layout(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for LockupView.Layout);
}

uint64_t sub_23C47EA4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = a1
     + *(int *)(type metadata accessor for LockupView.Layout(0, *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24), a4) + 56);
  v7 = sub_23C4807CC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v8 = a1 + *(int *)(a2 + 36);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v9 = type metadata accessor for PreviousPlanDetail();
  v10 = v8 + *(int *)(v9 + 32);
  v11 = sub_23C48076C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v12 = v8 + *(int *)(v9 + 56);
  v13 = sub_23C480790();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v12, v13);
  return swift_release();
}

uint64_t sub_23C47EB5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __int128 v6;
  int *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t, uint64_t);
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  void (*v31)(char *, uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  v8 = (int *)type metadata accessor for LockupView.Layout(0, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24), a4);
  v9 = v8[14];
  v10 = a1 + v9;
  v11 = a2 + v9;
  v12 = sub_23C4807CC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
  *(_QWORD *)(a1 + v8[15]) = *(_QWORD *)(a2 + v8[15]);
  *(_QWORD *)(a1 + v8[16]) = *(_QWORD *)(a2 + v8[16]);
  v13 = *(int *)(a3 + 36);
  v14 = (_QWORD *)(a1 + v13);
  v15 = a2 + v13;
  v16 = *(_QWORD *)(a2 + v13 + 8);
  *v14 = *(_QWORD *)(a2 + v13);
  v14[1] = v16;
  v17 = *(_QWORD *)(a2 + v13 + 24);
  v14[2] = *(_QWORD *)(a2 + v13 + 16);
  v14[3] = v17;
  v18 = *(_QWORD *)(a2 + v13 + 40);
  v14[4] = *(_QWORD *)(a2 + v13 + 32);
  v14[5] = v18;
  v19 = *(_QWORD *)(a2 + v13 + 56);
  v14[6] = *(_QWORD *)(a2 + v13 + 48);
  v14[7] = v19;
  v20 = (int *)type metadata accessor for PreviousPlanDetail();
  v21 = v20[8];
  v32 = v15 + v21;
  v34 = (char *)v14 + v21;
  v22 = sub_23C48076C();
  v31 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v31(v34, v32, v22);
  *(_QWORD *)((char *)v14 + v20[9]) = *(_QWORD *)(v15 + v20[9]);
  *(_QWORD *)((char *)v14 + v20[10]) = *(_QWORD *)(v15 + v20[10]);
  *(_QWORD *)((char *)v14 + v20[11]) = *(_QWORD *)(v15 + v20[11]);
  *((_BYTE *)v14 + v20[12]) = *(_BYTE *)(v15 + v20[12]);
  *(_QWORD *)((char *)v14 + v20[13]) = *(_QWORD *)(v15 + v20[13]);
  v23 = v20[14];
  v33 = v15 + v23;
  v35 = (char *)v14 + v23;
  v24 = sub_23C480790();
  v25 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v25(v35, v33, v24);
  *(_QWORD *)((char *)v14 + v20[15]) = *(_QWORD *)(v15 + v20[15]);
  v26 = *(int *)(a3 + 40);
  v27 = (_QWORD *)(a1 + v26);
  v28 = (_QWORD *)(a2 + v26);
  v29 = v28[1];
  *v27 = *v28;
  v27[1] = v29;
  swift_retain();
  return a1;
}

_QWORD *sub_23C47ED5C(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  int *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  int *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;

  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  v7 = (int *)type metadata accessor for LockupView.Layout(0, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24), a4);
  v8 = v7[14];
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_23C4807CC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 24))(v9, v10, v11);
  *(_QWORD *)((char *)a1 + v7[15]) = *(_QWORD *)((char *)a2 + v7[15]);
  *(_QWORD *)((char *)a1 + v7[16]) = *(_QWORD *)((char *)a2 + v7[16]);
  v12 = *(int *)(a3 + 36);
  v13 = (_QWORD *)((char *)a1 + v12);
  v14 = (_QWORD *)((char *)a2 + v12);
  *v13 = *(_QWORD *)((char *)a2 + v12);
  v13[1] = *(_QWORD *)((char *)a2 + v12 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v13[2] = v14[2];
  v13[3] = v14[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v13[4] = v14[4];
  v13[5] = v14[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v13[6] = v14[6];
  v13[7] = v14[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v15 = (int *)type metadata accessor for PreviousPlanDetail();
  v16 = v15[8];
  v17 = (char *)v13 + v16;
  v18 = (char *)v14 + v16;
  v19 = sub_23C48076C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 24))(v17, v18, v19);
  *(_QWORD *)((char *)v13 + v15[9]) = *(_QWORD *)((char *)v14 + v15[9]);
  *(_QWORD *)((char *)v13 + v15[10]) = *(_QWORD *)((char *)v14 + v15[10]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)((char *)v13 + v15[11]) = *(_QWORD *)((char *)v14 + v15[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_BYTE *)v13 + v15[12]) = *((_BYTE *)v14 + v15[12]);
  *(_QWORD *)((char *)v13 + v15[13]) = *(_QWORD *)((char *)v14 + v15[13]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v20 = v15[14];
  v21 = (char *)v13 + v20;
  v22 = (char *)v14 + v20;
  v23 = sub_23C480790();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 24))(v21, v22, v23);
  *(_QWORD *)((char *)v13 + v15[15]) = *(_QWORD *)((char *)v14 + v15[15]);
  v24 = *(int *)(a3 + 40);
  v25 = (_QWORD *)((char *)a1 + v24);
  v26 = (_QWORD *)((char *)a2 + v24);
  v27 = v26[1];
  *v25 = *v26;
  v25[1] = v27;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_23C47EFB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __int128 v7;
  int *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _OWORD *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  int *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;

  v7 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v7;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  v8 = (int *)type metadata accessor for LockupView.Layout(0, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24), a4);
  v9 = v8[14];
  v10 = a1 + v9;
  v11 = a2 + v9;
  v12 = sub_23C4807CC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
  *(_QWORD *)(a1 + v8[15]) = *(_QWORD *)(a2 + v8[15]);
  *(_QWORD *)(a1 + v8[16]) = *(_QWORD *)(a2 + v8[16]);
  v13 = *(int *)(a3 + 36);
  v14 = (_OWORD *)(a1 + v13);
  v15 = a2 + v13;
  v16 = *(_OWORD *)(a2 + v13 + 16);
  *v14 = *(_OWORD *)(a2 + v13);
  v14[1] = v16;
  v17 = *(_OWORD *)(a2 + v13 + 48);
  v14[2] = *(_OWORD *)(a2 + v13 + 32);
  v14[3] = v17;
  v18 = (int *)type metadata accessor for PreviousPlanDetail();
  v19 = v18[8];
  v20 = (char *)v14 + v19;
  v21 = v15 + v19;
  v22 = sub_23C48076C();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 32))(v20, v21, v22);
  *(_QWORD *)((char *)v14 + v18[9]) = *(_QWORD *)(v15 + v18[9]);
  *(_QWORD *)((char *)v14 + v18[10]) = *(_QWORD *)(v15 + v18[10]);
  *(_QWORD *)((char *)v14 + v18[11]) = *(_QWORD *)(v15 + v18[11]);
  *((_BYTE *)v14 + v18[12]) = *(_BYTE *)(v15 + v18[12]);
  *(_QWORD *)((char *)v14 + v18[13]) = *(_QWORD *)(v15 + v18[13]);
  v23 = v18[14];
  v24 = (char *)v14 + v23;
  v25 = v15 + v23;
  v26 = sub_23C480790();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 32))(v24, v25, v26);
  *(_QWORD *)((char *)v14 + v18[15]) = *(_QWORD *)(v15 + v18[15]);
  *(_OWORD *)(a1 + *(int *)(a3 + 40)) = *(_OWORD *)(a2 + *(int *)(a3 + 40));
  return a1;
}

uint64_t sub_23C47F134(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __int128 v7;
  int *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int *v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;

  v7 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v7;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  v8 = (int *)type metadata accessor for LockupView.Layout(0, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24), a4);
  v9 = v8[14];
  v10 = a1 + v9;
  v11 = a2 + v9;
  v12 = sub_23C4807CC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 40))(v10, v11, v12);
  *(_QWORD *)(a1 + v8[15]) = *(_QWORD *)(a2 + v8[15]);
  *(_QWORD *)(a1 + v8[16]) = *(_QWORD *)(a2 + v8[16]);
  v13 = *(int *)(a3 + 36);
  v14 = (_QWORD *)(a1 + v13);
  v15 = (_QWORD *)(a2 + v13);
  v16 = *(_QWORD *)(a2 + v13 + 8);
  *v14 = *(_QWORD *)(a2 + v13);
  v14[1] = v16;
  swift_bridgeObjectRelease();
  v17 = v15[3];
  v14[2] = v15[2];
  v14[3] = v17;
  swift_bridgeObjectRelease();
  v18 = v15[5];
  v14[4] = v15[4];
  v14[5] = v18;
  swift_bridgeObjectRelease();
  v19 = v15[7];
  v14[6] = v15[6];
  v14[7] = v19;
  swift_bridgeObjectRelease();
  v20 = (int *)type metadata accessor for PreviousPlanDetail();
  v21 = v20[8];
  v22 = (char *)v14 + v21;
  v23 = (char *)v15 + v21;
  v24 = sub_23C48076C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 40))(v22, v23, v24);
  *(_QWORD *)((char *)v14 + v20[9]) = *(_QWORD *)((char *)v15 + v20[9]);
  *(_QWORD *)((char *)v14 + v20[10]) = *(_QWORD *)((char *)v15 + v20[10]);
  swift_bridgeObjectRelease();
  *(_QWORD *)((char *)v14 + v20[11]) = *(_QWORD *)((char *)v15 + v20[11]);
  swift_bridgeObjectRelease();
  *((_BYTE *)v14 + v20[12]) = *((_BYTE *)v15 + v20[12]);
  *(_QWORD *)((char *)v14 + v20[13]) = *(_QWORD *)((char *)v15 + v20[13]);
  swift_bridgeObjectRelease();
  v25 = v20[14];
  v26 = (char *)v14 + v25;
  v27 = (char *)v15 + v25;
  v28 = sub_23C480790();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v28 - 8) + 40))(v26, v27, v28);
  *(_QWORD *)((char *)v14 + v20[15]) = *(_QWORD *)((char *)v15 + v20[15]);
  *(_OWORD *)(a1 + *(int *)(a3 + 40)) = *(_OWORD *)(a2 + *(int *)(a3 + 40));
  swift_release();
  return a1;
}

uint64_t sub_23C47F308()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C47F314(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v15;

  v7 = type metadata accessor for LockupView.Layout(0, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24), a4);
  v8 = *(_QWORD *)(v7 - 8);
  if (*(_DWORD *)(v8 + 84) == (_DWORD)a2)
  {
    v9 = v7;
    v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
    v11 = a1;
    return v10(v11, a2, v9);
  }
  v12 = type metadata accessor for PreviousPlanDetail();
  v13 = *(_QWORD *)(v12 - 8);
  if (*(_DWORD *)(v13 + 84) == (_DWORD)a2)
  {
    v9 = v12;
    v11 = a1 + *(int *)(a3 + 36);
    v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 48);
    return v10(v11, a2, v9);
  }
  v15 = *(_QWORD *)(a1 + *(int *)(a3 + 40));
  if (v15 >= 0xFFFFFFFF)
    LODWORD(v15) = -1;
  return (v15 + 1);
}

uint64_t sub_23C47F3C0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C47F3CC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v8 = type metadata accessor for LockupView.Layout(0, *(_QWORD *)(a4 + 16), *(_QWORD *)(a4 + 24), a4);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  result = type metadata accessor for PreviousPlanDetail();
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v12 = a1 + *(int *)(a4 + 36);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  *(_QWORD *)(a1 + *(int *)(a4 + 40)) = (a2 - 1);
  return result;
}

uint64_t sub_23C47F474(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[2];
  _QWORD v8[2];
  _QWORD v9[2];

  v1 = *(_QWORD *)(a1 + 8);
  v2 = sub_23C48082C();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256BA7E70);
  v3 = sub_23C48082C();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256BA7E78);
  v4 = sub_23C48082C();
  v9[0] = v1;
  v9[1] = MEMORY[0x24BDEEC40];
  v5 = MEMORY[0x24BDED308];
  v8[0] = MEMORY[0x24261FFB0](MEMORY[0x24BDED308], v2, v9);
  v8[1] = sub_23C469CBC(&qword_256BA7E88, &qword_256BA7E70, MEMORY[0x24BDEB950]);
  v7[0] = MEMORY[0x24261FFB0](v5, v3, v8);
  v7[1] = sub_23C469CBC(qword_256BA7EA8, &qword_256BA7E78, MEMORY[0x24BDEDC10]);
  return MEMORY[0x24261FFB0](v5, v4, v7);
}

uint64_t sub_23C47F588()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_23C47F590()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23C4807CC();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_QWORD *sub_23C47F61C(uint64_t a1, uint64_t *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v13 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v7;
    *(_OWORD *)(a1 + 32) = *((_OWORD *)a2 + 2);
    *(_QWORD *)(a1 + 48) = a2[6];
    v8 = a3[14];
    v9 = a1 + v8;
    v10 = (uint64_t)a2 + v8;
    v11 = sub_23C4807CC();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    v12 = a3[16];
    *(_QWORD *)((char *)v4 + a3[15]) = *(uint64_t *)((char *)a2 + a3[15]);
    *(_QWORD *)((char *)v4 + v12) = *(uint64_t *)((char *)a2 + v12);
  }
  return v4;
}

uint64_t sub_23C47F6D8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1 + *(int *)(a2 + 56);
  v3 = sub_23C4807CC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

uint64_t sub_23C47F710(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  v7 = a3[14];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23C4807CC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  v11 = a3[16];
  *(_QWORD *)(a1 + a3[15]) = *(_QWORD *)(a2 + a3[15]);
  *(_QWORD *)(a1 + v11) = *(_QWORD *)(a2 + v11);
  return a1;
}

_QWORD *sub_23C47F7A0(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  v6 = a3[14];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_23C4807CC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  *(_QWORD *)((char *)a1 + a3[15]) = *(_QWORD *)((char *)a2 + a3[15]);
  *(_QWORD *)((char *)a1 + a3[16]) = *(_QWORD *)((char *)a2 + a3[16]);
  return a1;
}

uint64_t sub_23C47F854(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  v7 = a3[14];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23C4807CC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = a3[16];
  *(_QWORD *)(a1 + a3[15]) = *(_QWORD *)(a2 + a3[15]);
  *(_QWORD *)(a1 + v11) = *(_QWORD *)(a2 + v11);
  return a1;
}

uint64_t sub_23C47F8E4(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  v7 = a3[14];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23C4807CC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = a3[16];
  *(_QWORD *)(a1 + a3[15]) = *(_QWORD *)(a2 + a3[15]);
  *(_QWORD *)(a1 + v11) = *(_QWORD *)(a2 + v11);
  return a1;
}

uint64_t sub_23C47F974()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C47F980(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a1 + *(int *)(a3 + 56);
  v5 = sub_23C4807CC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v4, a2, v5);
}

uint64_t sub_23C47F9C0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C47F9CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;

  v5 = a1 + *(int *)(a4 + 56);
  v6 = sub_23C4807CC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, a2, a2, v6);
}

uint64_t sub_23C47FA10@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_23C480880();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_23C47FA40()
{
  return sub_23C48088C();
}

BOOL static HandoffAlertIconState.== infix(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t HandoffAlertIconState.hash(into:)()
{
  return sub_23C480D6C();
}

uint64_t sub_23C47FAA4()
{
  _BYTE *v0;

  if (*v0)
    return 0x656D7269666E6F63;
  else
    return 0x4F6D7269666E6F63;
}

uint64_t sub_23C47FAF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C47FF40(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C47FB14()
{
  sub_23C47FE18();
  return sub_23C480DA8();
}

uint64_t sub_23C47FB3C()
{
  sub_23C47FE18();
  return sub_23C480DB4();
}

uint64_t sub_23C47FB64()
{
  sub_23C47FEA0();
  return sub_23C480DA8();
}

uint64_t sub_23C47FB8C()
{
  sub_23C47FEA0();
  return sub_23C480DB4();
}

uint64_t sub_23C47FBB4()
{
  sub_23C47FE5C();
  return sub_23C480DA8();
}

uint64_t sub_23C47FBDC()
{
  sub_23C47FE5C();
  return sub_23C480DB4();
}

uint64_t HandoffAlertIconState.hashValue.getter()
{
  sub_23C480D60();
  sub_23C480D6C();
  return sub_23C480D84();
}

uint64_t HandoffAlertIconState.encode(to:)(_QWORD *a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  char v18;
  char v19;

  v17 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7FB0);
  v15 = *(_QWORD *)(v3 - 8);
  v16 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7FB8);
  v6 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7FC0);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C47FE18();
  sub_23C480D9C();
  if ((v17 & 1) != 0)
  {
    v19 = 1;
    sub_23C47FE5C();
    sub_23C480D00();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v5, v16);
  }
  else
  {
    v18 = 0;
    sub_23C47FEA0();
    sub_23C480D00();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v14);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

unint64_t sub_23C47FE18()
{
  unint64_t result;

  result = qword_256BA7FC8;
  if (!qword_256BA7FC8)
  {
    result = MEMORY[0x24261FFB0](&unk_23C483FDC, &type metadata for HandoffAlertIconState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7FC8);
  }
  return result;
}

unint64_t sub_23C47FE5C()
{
  unint64_t result;

  result = qword_256BA7FD0;
  if (!qword_256BA7FD0)
  {
    result = MEMORY[0x24261FFB0](&unk_23C483F8C, &type metadata for HandoffAlertIconState.ConfirmedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7FD0);
  }
  return result;
}

unint64_t sub_23C47FEA0()
{
  unint64_t result;

  result = qword_256BA7FD8;
  if (!qword_256BA7FD8)
  {
    result = MEMORY[0x24261FFB0](&unk_23C483F3C, &type metadata for HandoffAlertIconState.ConfirmOnDeviceCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7FD8);
  }
  return result;
}

uint64_t HandoffAlertIconState.init(from:)(_QWORD *a1)
{
  return sub_23C480060(a1) & 1;
}

uint64_t sub_23C47FEFC@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = sub_23C480060(a1);
  if (!v2)
    *a2 = result & 1;
  return result;
}

uint64_t sub_23C47FF28(_QWORD *a1)
{
  unsigned __int8 *v1;

  return HandoffAlertIconState.encode(to:)(a1, *v1);
}

uint64_t sub_23C47FF40(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x4F6D7269666E6F63 && a2 == 0xEF6563697665446ELL;
  if (v2 || (sub_23C480D54() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656D7269666E6F63 && a2 == 0xE900000000000064)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23C480D54();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23C480060(_QWORD *a1)
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
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char v27;
  char v28;

  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA8020);
  v22 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v25 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BA8028);
  v3 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256BA8030);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C47FE18();
  v10 = v26;
  sub_23C480D90();
  if (v10)
    goto LABEL_7;
  v11 = v5;
  v12 = v25;
  v21 = a1;
  v26 = v7;
  v13 = sub_23C480CF4();
  v14 = v6;
  if (*(_QWORD *)(v13 + 16) != 1)
  {
    v16 = sub_23C480C94();
    swift_allocError();
    v17 = v9;
    v19 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256BA7168);
    *v19 = &type metadata for HandoffAlertIconState;
    sub_23C480CAC();
    sub_23C480C88();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v16 - 8) + 104))(v19, *MEMORY[0x24BEE26D0], v16);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v17, v6);
    a1 = v21;
LABEL_7:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return v6;
  }
  v6 = *(unsigned __int8 *)(v13 + 32);
  if ((v6 & 1) != 0)
  {
    v28 = 1;
    sub_23C47FE5C();
    sub_23C480CA0();
    v15 = v26;
    (*(void (**)(char *, uint64_t))(v22 + 8))(v12, v24);
  }
  else
  {
    v27 = 0;
    sub_23C47FEA0();
    sub_23C480CA0();
    v15 = v26;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v11, v23);
  }
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v9, v14);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
  return v6;
}

unint64_t sub_23C480390()
{
  unint64_t result;

  result = qword_256BA7FE0;
  if (!qword_256BA7FE0)
  {
    result = MEMORY[0x24261FFB0](&protocol conformance descriptor for HandoffAlertIconState, &type metadata for HandoffAlertIconState);
    atomic_store(result, (unint64_t *)&qword_256BA7FE0);
  }
  return result;
}

ValueMetadata *type metadata accessor for HandoffAlertIconState()
{
  return &type metadata for HandoffAlertIconState;
}

uint64_t _s18FitnessWorkoutPlan21HandoffAlertIconStateOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C480434 + 4 * byte_23C483CB5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C480468 + 4 * byte_23C483CB0[v4]))();
}

uint64_t sub_23C480468(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C480470(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C480478);
  return result;
}

uint64_t sub_23C480484(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C48048CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C480490(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C480498(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HandoffAlertIconState.CodingKeys()
{
  return &type metadata for HandoffAlertIconState.CodingKeys;
}

ValueMetadata *type metadata accessor for HandoffAlertIconState.ConfirmOnDeviceCodingKeys()
{
  return &type metadata for HandoffAlertIconState.ConfirmOnDeviceCodingKeys;
}

ValueMetadata *type metadata accessor for HandoffAlertIconState.ConfirmedCodingKeys()
{
  return &type metadata for HandoffAlertIconState.ConfirmedCodingKeys;
}

unint64_t sub_23C4804D8()
{
  unint64_t result;

  result = qword_256BA7FE8;
  if (!qword_256BA7FE8)
  {
    result = MEMORY[0x24261FFB0](&unk_23C483F14, &type metadata for HandoffAlertIconState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7FE8);
  }
  return result;
}

unint64_t sub_23C480520()
{
  unint64_t result;

  result = qword_256BA7FF0;
  if (!qword_256BA7FF0)
  {
    result = MEMORY[0x24261FFB0](&unk_23C483E34, &type metadata for HandoffAlertIconState.ConfirmOnDeviceCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7FF0);
  }
  return result;
}

unint64_t sub_23C480568()
{
  unint64_t result;

  result = qword_256BA7FF8;
  if (!qword_256BA7FF8)
  {
    result = MEMORY[0x24261FFB0](&unk_23C483E5C, &type metadata for HandoffAlertIconState.ConfirmOnDeviceCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA7FF8);
  }
  return result;
}

unint64_t sub_23C4805B0()
{
  unint64_t result;

  result = qword_256BA8000;
  if (!qword_256BA8000)
  {
    result = MEMORY[0x24261FFB0](&unk_23C483DE4, &type metadata for HandoffAlertIconState.ConfirmedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA8000);
  }
  return result;
}

unint64_t sub_23C4805F8()
{
  unint64_t result;

  result = qword_256BA8008;
  if (!qword_256BA8008)
  {
    result = MEMORY[0x24261FFB0](&unk_23C483E0C, &type metadata for HandoffAlertIconState.ConfirmedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA8008);
  }
  return result;
}

unint64_t sub_23C480640()
{
  unint64_t result;

  result = qword_256BA8010;
  if (!qword_256BA8010)
  {
    result = MEMORY[0x24261FFB0](&unk_23C483E84, &type metadata for HandoffAlertIconState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA8010);
  }
  return result;
}

unint64_t sub_23C480688()
{
  unint64_t result;

  result = qword_256BA8018;
  if (!qword_256BA8018)
  {
    result = MEMORY[0x24261FFB0](&unk_23C483EAC, &type metadata for HandoffAlertIconState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BA8018);
  }
  return result;
}

uint64_t sub_23C4806D0()
{
  return MEMORY[0x24BDCCB18]();
}

uint64_t sub_23C4806DC()
{
  return MEMORY[0x24BDCE010]();
}

uint64_t sub_23C4806E8()
{
  return MEMORY[0x24BDCE040]();
}

uint64_t sub_23C4806F4()
{
  return MEMORY[0x24BDCE060]();
}

uint64_t sub_23C480700()
{
  return MEMORY[0x24BDCE078]();
}

uint64_t sub_23C48070C()
{
  return MEMORY[0x24BDCE148]();
}

uint64_t sub_23C480718()
{
  return MEMORY[0x24BDCE160]();
}

uint64_t sub_23C480724()
{
  return MEMORY[0x24BDCE1B8]();
}

uint64_t sub_23C480730()
{
  return MEMORY[0x24BDCE1E0]();
}

uint64_t sub_23C48073C()
{
  return MEMORY[0x24BDCE250]();
}

uint64_t sub_23C480748()
{
  return MEMORY[0x24BDCE2A0]();
}

uint64_t sub_23C480754()
{
  return MEMORY[0x24BDCE858]();
}

uint64_t sub_23C480760()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_23C48076C()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_23C480778()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_23C480784()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_23C480790()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_23C48079C()
{
  return MEMORY[0x24BDCECD8]();
}

uint64_t sub_23C4807A8()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_23C4807B4()
{
  return MEMORY[0x24BE34B58]();
}

uint64_t sub_23C4807C0()
{
  return MEMORY[0x24BE34B70]();
}

uint64_t sub_23C4807CC()
{
  return MEMORY[0x24BE34B98]();
}

uint64_t sub_23C4807D8()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_23C4807E4()
{
  return MEMORY[0x24BDEAF80]();
}

uint64_t sub_23C4807F0()
{
  return MEMORY[0x24BDEAF98]();
}

uint64_t sub_23C4807FC()
{
  return MEMORY[0x24BDEAFA8]();
}

uint64_t sub_23C480808()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_23C480814()
{
  return MEMORY[0x24BDEB790]();
}

uint64_t sub_23C480820()
{
  return MEMORY[0x24BDEB7B8]();
}

uint64_t sub_23C48082C()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t sub_23C480838()
{
  return MEMORY[0x24BDED918]();
}

uint64_t sub_23C480844()
{
  return MEMORY[0x24BDED930]();
}

uint64_t sub_23C480850()
{
  return MEMORY[0x24BDED998]();
}

uint64_t sub_23C48085C()
{
  return MEMORY[0x24BDEDBA8]();
}

uint64_t sub_23C480868()
{
  return MEMORY[0x24BDEE288]();
}

uint64_t sub_23C480874()
{
  return MEMORY[0x24BDEE290]();
}

uint64_t sub_23C480880()
{
  return MEMORY[0x24BDEE490]();
}

uint64_t sub_23C48088C()
{
  return MEMORY[0x24BDEE4A0]();
}

uint64_t sub_23C480898()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_23C4808A4()
{
  return MEMORY[0x24BDEEB88]();
}

uint64_t sub_23C4808B0()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_23C4808BC()
{
  return MEMORY[0x24BDEEF78]();
}

uint64_t sub_23C4808C8()
{
  return MEMORY[0x24BDEF380]();
}

uint64_t sub_23C4808D4()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_23C4808E0()
{
  return MEMORY[0x24BDEF3B8]();
}

uint64_t sub_23C4808EC()
{
  return MEMORY[0x24BDEFCA8]();
}

uint64_t sub_23C4808F8()
{
  return MEMORY[0x24BDEFCC8]();
}

uint64_t sub_23C480904()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_23C480910()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_23C48091C()
{
  return MEMORY[0x24BDF15F8]();
}

uint64_t sub_23C480928()
{
  return MEMORY[0x24BDF1600]();
}

uint64_t sub_23C480934()
{
  return MEMORY[0x24BDF17F8]();
}

uint64_t sub_23C480940()
{
  return MEMORY[0x24BDF1D08]();
}

uint64_t sub_23C48094C()
{
  return MEMORY[0x24BDF1D18]();
}

uint64_t sub_23C480958()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_23C480964()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_23C480970()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_23C48097C()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_23C480988()
{
  return MEMORY[0x24BDF22A0]();
}

uint64_t sub_23C480994()
{
  return MEMORY[0x24BDF24B8]();
}

uint64_t sub_23C4809A0()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_23C4809AC()
{
  return MEMORY[0x24BDF3580]();
}

uint64_t sub_23C4809B8()
{
  return MEMORY[0x24BDF3630]();
}

uint64_t sub_23C4809C4()
{
  return MEMORY[0x24BDF37B0]();
}

uint64_t sub_23C4809D0()
{
  return MEMORY[0x24BDF37C8]();
}

uint64_t sub_23C4809DC()
{
  return MEMORY[0x24BDF38C8]();
}

uint64_t sub_23C4809E8()
{
  return MEMORY[0x24BDF3940]();
}

uint64_t sub_23C4809F4()
{
  return MEMORY[0x24BDF3D30]();
}

uint64_t sub_23C480A00()
{
  return MEMORY[0x24BDF3D78]();
}

uint64_t sub_23C480A0C()
{
  return MEMORY[0x24BDF3D88]();
}

uint64_t sub_23C480A18()
{
  return MEMORY[0x24BDF3E08]();
}

uint64_t sub_23C480A24()
{
  return MEMORY[0x24BDF3F18]();
}

uint64_t sub_23C480A30()
{
  return MEMORY[0x24BDF3F28]();
}

uint64_t sub_23C480A3C()
{
  return MEMORY[0x24BDF4150]();
}

uint64_t sub_23C480A48()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_23C480A54()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_23C480A60()
{
  return MEMORY[0x24BDF42B0]();
}

uint64_t sub_23C480A6C()
{
  return MEMORY[0x24BDF4330]();
}

uint64_t sub_23C480A78()
{
  return MEMORY[0x24BDF4340]();
}

uint64_t sub_23C480A84()
{
  return MEMORY[0x24BDF4398]();
}

uint64_t sub_23C480A90()
{
  return MEMORY[0x24BDF4908]();
}

uint64_t sub_23C480A9C()
{
  return MEMORY[0x24BDF4918]();
}

uint64_t sub_23C480AA8()
{
  return MEMORY[0x24BDF4ED0]();
}

uint64_t sub_23C480AB4()
{
  return MEMORY[0x24BDF4EF0]();
}

uint64_t sub_23C480AC0()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_23C480ACC()
{
  return MEMORY[0x24BDF4F20]();
}

uint64_t sub_23C480AD8()
{
  return MEMORY[0x24BDF4F38]();
}

uint64_t sub_23C480AE4()
{
  return MEMORY[0x24BE2B460]();
}

uint64_t sub_23C480AF0()
{
  return MEMORY[0x24BE2B560]();
}

uint64_t sub_23C480AFC()
{
  return MEMORY[0x24BE2B588]();
}

uint64_t sub_23C480B08()
{
  return MEMORY[0x24BE2B598]();
}

uint64_t sub_23C480B14()
{
  return MEMORY[0x24BE2B5A8]();
}

uint64_t sub_23C480B20()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_23C480B2C()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_23C480B38()
{
  return MEMORY[0x24BDCF8D8]();
}

uint64_t sub_23C480B44()
{
  return MEMORY[0x24BDCF8F0]();
}

uint64_t sub_23C480B50()
{
  return MEMORY[0x24BDCF908]();
}

uint64_t sub_23C480B5C()
{
  return MEMORY[0x24BDCF910]();
}

uint64_t sub_23C480B68()
{
  return MEMORY[0x24BDCF930]();
}

uint64_t sub_23C480B74()
{
  return MEMORY[0x24BDCF938]();
}

uint64_t sub_23C480B80()
{
  return MEMORY[0x24BDCF948]();
}

uint64_t sub_23C480B8C()
{
  return MEMORY[0x24BDCF968]();
}

uint64_t sub_23C480B98()
{
  return MEMORY[0x24BDCF978]();
}

uint64_t sub_23C480BA4()
{
  return MEMORY[0x24BDCF990]();
}

uint64_t sub_23C480BB0()
{
  return MEMORY[0x24BE37C28]();
}

uint64_t sub_23C480BBC()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23C480BC8()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23C480BD4()
{
  return MEMORY[0x24BEE1018]();
}

uint64_t sub_23C480BE0()
{
  return MEMORY[0x24BEE1098]();
}

uint64_t sub_23C480BEC()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_23C480BF8()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_23C480C04()
{
  return MEMORY[0x24BEE68D8]();
}

uint64_t sub_23C480C10()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_23C480C1C()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_23C480C28()
{
  return MEMORY[0x24BEE6940]();
}

uint64_t sub_23C480C34()
{
  return MEMORY[0x24BEE6970]();
}

uint64_t sub_23C480C40()
{
  return MEMORY[0x24BEE6980]();
}

uint64_t sub_23C480C4C()
{
  return MEMORY[0x24BEE6C08]();
}

uint64_t sub_23C480C58()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_23C480C64()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23C480C70()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_23C480C7C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23C480C88()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_23C480C94()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_23C480CA0()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_23C480CAC()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_23C480CB8()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_23C480CC4()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_23C480CD0()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_23C480CDC()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_23C480CE8()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_23C480CF4()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_23C480D00()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_23C480D0C()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_23C480D18()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_23C480D24()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_23C480D30()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_23C480D3C()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_23C480D48()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_23C480D54()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23C480D60()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23C480D6C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23C480D78()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_23C480D84()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23C480D90()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_23C480D9C()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23C480DA8()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23C480DB4()
{
  return MEMORY[0x24BEE4A10]();
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
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

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
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

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x24BEE4DC0]();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x24BEE4DC8]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x24BEE4E40]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
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

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
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

