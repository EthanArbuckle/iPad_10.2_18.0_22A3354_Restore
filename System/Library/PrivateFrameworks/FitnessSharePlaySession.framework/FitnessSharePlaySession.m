void SharePlaySessionState.state.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

_BYTE *SharePlaySessionState.state.setter(_BYTE *result)
{
  _BYTE *v1;

  *v1 = *result;
  return result;
}

uint64_t (*SharePlaySessionState.state.modify())()
{
  return nullsub_1;
}

FitnessSharePlaySession::SharePlaySessionState __swiftcall SharePlaySessionState.init(state:)(FitnessSharePlaySession::SharePlaySessionState state)
{
  _BYTE *v1;

  *v1 = *(_BYTE *)state.state;
  return state;
}

uint64_t sub_23C4111AC()
{
  return 1;
}

uint64_t sub_23C4111B4()
{
  sub_23C416F1C();
  sub_23C416F28();
  return sub_23C416F34();
}

uint64_t sub_23C4111F4()
{
  return sub_23C416F28();
}

uint64_t sub_23C411218()
{
  sub_23C416F1C();
  sub_23C416F28();
  return sub_23C416F34();
}

uint64_t sub_23C411254()
{
  return 0x6574617473;
}

uint64_t sub_23C411268@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
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
    v5 = sub_23C416F10();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_23C4112F4()
{
  return 0;
}

void sub_23C411300(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_23C41130C()
{
  sub_23C4114BC();
  return sub_23C416F58();
}

uint64_t sub_23C411334()
{
  sub_23C4114BC();
  return sub_23C416F64();
}

uint64_t SharePlaySessionState.encode(to:)(_QWORD *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char v7;
  uint64_t v9;
  char v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B97000);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C4114BC();
  sub_23C416F4C();
  v10 = v7;
  sub_23C411500();
  sub_23C416F04();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24261E1FC]((char *)a1 + (int)result, -(result >> 32), 0, 0);
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

unint64_t sub_23C4114BC()
{
  unint64_t result;

  result = qword_256B97008;
  if (!qword_256B97008)
  {
    result = MEMORY[0x24261E208](&unk_23C41728C, &type metadata for SharePlaySessionState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B97008);
  }
  return result;
}

unint64_t sub_23C411500()
{
  unint64_t result;

  result = qword_256B97010;
  if (!qword_256B97010)
  {
    result = MEMORY[0x24261E208](&protocol conformance descriptor for SharePlayState, &type metadata for SharePlayState);
    atomic_store(result, (unint64_t *)&qword_256B97010);
  }
  return result;
}

uint64_t SharePlaySessionState.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;
  char v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B97018);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C4114BC();
  sub_23C416F40();
  if (!v2)
  {
    sub_23C411680();
    sub_23C416EC8();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v11;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
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

unint64_t sub_23C411680()
{
  unint64_t result;

  result = qword_256B97020;
  if (!qword_256B97020)
  {
    result = MEMORY[0x24261E208](&protocol conformance descriptor for SharePlayState, &type metadata for SharePlayState);
    atomic_store(result, (unint64_t *)&qword_256B97020);
  }
  return result;
}

uint64_t sub_23C4116C4@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return SharePlaySessionState.init(from:)(a1, a2);
}

uint64_t sub_23C4116D8(_QWORD *a1)
{
  return SharePlaySessionState.encode(to:)(a1);
}

BOOL static SharePlaySessionState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

BOOL sub_23C411704(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SharePlaySessionState(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SharePlaySessionState(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C411808 + 4 * byte_23C417105[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C41183C + 4 * byte_23C417100[v4]))();
}

uint64_t sub_23C41183C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C411844(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C41184CLL);
  return result;
}

uint64_t sub_23C411858(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C411860);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C411864(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C41186C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SharePlaySessionState()
{
  return &type metadata for SharePlaySessionState;
}

uint64_t getEnumTagSinglePayload for SharePlaySessionState.CodingKeys(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SharePlaySessionState.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23C41191C + 4 * byte_23C41710A[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23C41193C + 4 * byte_23C41710F[v4]))();
}

_BYTE *sub_23C41191C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23C41193C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C411944(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C41194C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C411954(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C41195C(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_23C411968()
{
  return 0;
}

ValueMetadata *type metadata accessor for SharePlaySessionState.CodingKeys()
{
  return &type metadata for SharePlaySessionState.CodingKeys;
}

unint64_t sub_23C411984()
{
  unint64_t result;

  result = qword_256B97028;
  if (!qword_256B97028)
  {
    result = MEMORY[0x24261E208](&unk_23C417264, &type metadata for SharePlaySessionState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B97028);
  }
  return result;
}

unint64_t sub_23C4119CC()
{
  unint64_t result;

  result = qword_256B97030;
  if (!qword_256B97030)
  {
    result = MEMORY[0x24261E208](&unk_23C4171D4, &type metadata for SharePlaySessionState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B97030);
  }
  return result;
}

unint64_t sub_23C411A14()
{
  unint64_t result;

  result = qword_256B97038;
  if (!qword_256B97038)
  {
    result = MEMORY[0x24261E208](&unk_23C4171FC, &type metadata for SharePlaySessionState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B97038);
  }
  return result;
}

uint64_t SharePlayActivity.sessionIdentifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SharePlayActivity.workoutIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SharePlayActivity.title.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SharePlayActivity.fallbackURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for SharePlayActivity() + 28);
  v4 = sub_23C416DE4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t type metadata accessor for SharePlayActivity()
{
  uint64_t result;

  result = qword_256B970D0;
  if (!qword_256B970D0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t SharePlayActivity.activityType.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for SharePlayActivity() + 32));
}

uint64_t SharePlayActivity.init(sessionIdentifier:workoutIdentifier:title:fallbackURL:activityType:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>)
{
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t result;

  *a9 = a1;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  v12 = type metadata accessor for SharePlayActivity();
  v13 = (char *)a9 + *(int *)(v12 + 28);
  v14 = sub_23C416DE4();
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v13, a7, v14);
  *(_QWORD *)((char *)a9 + *(int *)(v12 + 32)) = a8;
  return result;
}

uint64_t sub_23C411BFC(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23C411C34 + 4 * byte_23C4172E0[a1]))(0xD000000000000011, 0x800000023C4187B0);
}

uint64_t sub_23C411C48()
{
  return 0x656C746974;
}

uint64_t sub_23C411C5C()
{
  return 0x6B6361626C6C6166;
}

uint64_t sub_23C411C7C()
{
  return 0x7974697669746361;
}

BOOL sub_23C411C9C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23C411CB0()
{
  sub_23C416F1C();
  sub_23C416F28();
  return sub_23C416F34();
}

uint64_t sub_23C411CF4()
{
  return sub_23C416F28();
}

uint64_t sub_23C411D1C()
{
  sub_23C416F1C();
  sub_23C416F28();
  return sub_23C416F34();
}

uint64_t sub_23C411D5C()
{
  unsigned __int8 *v0;

  return sub_23C411BFC(*v0);
}

uint64_t sub_23C411D64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C41276C(a1, a2);
  *a3 = result;
  return result;
}

void sub_23C411D88(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_23C411D94()
{
  sub_23C412A88();
  return sub_23C416F58();
}

uint64_t sub_23C411DBC()
{
  sub_23C412A88();
  return sub_23C416F64();
}

uint64_t SharePlayActivity.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_23C416E20();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23C416E20();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23C416E20();
  swift_bridgeObjectRelease();
  type metadata accessor for SharePlayActivity();
  sub_23C416DE4();
  sub_23C412B78(&qword_256B97040, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
  sub_23C416E14();
  return sub_23C416F28();
}

uint64_t SharePlayActivity.hashValue.getter()
{
  sub_23C416F1C();
  swift_bridgeObjectRetain();
  sub_23C416E20();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23C416E20();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23C416E20();
  swift_bridgeObjectRelease();
  type metadata accessor for SharePlayActivity();
  sub_23C416DE4();
  sub_23C412B78(&qword_256B97040, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
  sub_23C416E14();
  sub_23C416F28();
  return sub_23C416F34();
}

uint64_t sub_23C411FF4()
{
  swift_bridgeObjectRetain();
  sub_23C416E20();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23C416E20();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23C416E20();
  swift_bridgeObjectRelease();
  sub_23C416DE4();
  sub_23C412B78(&qword_256B97040, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
  sub_23C416E14();
  return sub_23C416F28();
}

uint64_t sub_23C4120E8()
{
  sub_23C416F1C();
  swift_bridgeObjectRetain();
  sub_23C416E20();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23C416E20();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23C416E20();
  swift_bridgeObjectRelease();
  sub_23C416DE4();
  sub_23C412B78(&qword_256B97040, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
  sub_23C416E14();
  sub_23C416F28();
  return sub_23C416F34();
}

uint64_t SharePlayActivity.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B97048);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C412A88();
  sub_23C416F4C();
  v8[15] = 0;
  sub_23C416EEC();
  if (!v1)
  {
    v8[14] = 1;
    sub_23C416EEC();
    v8[13] = 2;
    sub_23C416EEC();
    type metadata accessor for SharePlayActivity();
    v8[12] = 3;
    sub_23C416DE4();
    sub_23C412B78(&qword_256B97058, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAE0]);
    sub_23C416F04();
    v8[11] = 4;
    sub_23C416EF8();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t SharePlayActivity.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  char *v12;
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
  _QWORD v24[2];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  char v31;
  char v32;
  char v33;
  char v34;
  char v35;

  v25 = a2;
  v3 = sub_23C416DE4();
  v26 = *(_QWORD *)(v3 - 8);
  v27 = v3;
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B97060);
  v6 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for SharePlayActivity();
  MEMORY[0x24BDAC7A8]();
  v11 = (_QWORD *)((char *)v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C412A88();
  v29 = v8;
  v12 = v30;
  sub_23C416F40();
  if (v12)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v30 = v5;
  v13 = v6;
  v14 = v27;
  v35 = 0;
  v15 = (uint64_t)v11;
  *v11 = sub_23C416EB0();
  v11[1] = v16;
  v34 = 1;
  v11[2] = sub_23C416EB0();
  v11[3] = v17;
  v33 = 2;
  v18 = sub_23C416EB0();
  v24[1] = 0;
  v11[4] = v18;
  v11[5] = v19;
  v32 = 3;
  sub_23C412B78(&qword_256B97068, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB10]);
  v20 = v30;
  sub_23C416EC8();
  (*(void (**)(uint64_t, char *, uint64_t))(v26 + 32))(v15 + *(int *)(v9 + 28), v20, v14);
  v31 = 4;
  v21 = v28;
  v22 = sub_23C416EBC();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v29, v21);
  *(_QWORD *)(v15 + *(int *)(v9 + 32)) = v22;
  sub_23C412ACC(v15, v25);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_23C412B10(v15);
}

uint64_t sub_23C412744@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return SharePlayActivity.init(from:)(a1, a2);
}

uint64_t sub_23C412758(_QWORD *a1)
{
  return SharePlayActivity.encode(to:)(a1);
}

uint64_t sub_23C41276C(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000011 && a2 == 0x800000023C4187B0 || (sub_23C416F10() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000023C4187D0 || (sub_23C416F10() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x656C746974 && a2 == 0xE500000000000000 || (sub_23C416F10() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6B6361626C6C6166 && a2 == 0xEB000000004C5255 || (sub_23C416F10() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x7974697669746361 && a2 == 0xEC00000065707954)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v5 = sub_23C416F10();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

BOOL _s23FitnessSharePlaySession0bC8ActivityV2eeoiySbAC_ACtFZ_0(_QWORD *a1, _QWORD *a2)
{
  BOOL v4;
  char v5;
  _BOOL8 result;
  BOOL v7;
  char v8;
  char v9;
  uint64_t v10;

  v4 = *a1 == *a2 && a1[1] == a2[1];
  if (v4 || (v5 = sub_23C416F10(), result = 0, (v5 & 1) != 0))
  {
    v7 = a1[2] == a2[2] && a1[3] == a2[3];
    if (v7 || (v8 = sub_23C416F10(), result = 0, (v8 & 1) != 0))
    {
      if (a1[4] == a2[4] && a1[5] == a2[5] || (v9 = sub_23C416F10(), result = 0, (v9 & 1) != 0))
      {
        v10 = type metadata accessor for SharePlayActivity();
        return (MEMORY[0x24261DFB0]((char *)a1 + *(int *)(v10 + 28), (char *)a2 + *(int *)(v10 + 28)) & 1) != 0
            && *(_QWORD *)((char *)a1 + *(int *)(v10 + 32)) == *(_QWORD *)((char *)a2 + *(int *)(v10 + 32));
      }
    }
  }
  return result;
}

unint64_t sub_23C412A88()
{
  unint64_t result;

  result = qword_256B97050;
  if (!qword_256B97050)
  {
    result = MEMORY[0x24261E208](&unk_23C4174C4, &type metadata for SharePlayActivity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B97050);
  }
  return result;
}

uint64_t sub_23C412ACC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SharePlayActivity();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23C412B10(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SharePlayActivity();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23C412B4C()
{
  return sub_23C412B78(&qword_256B97070, (uint64_t (*)(uint64_t))type metadata accessor for SharePlayActivity, (uint64_t)&protocol conformance descriptor for SharePlayActivity);
}

uint64_t sub_23C412B78(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x24261E208](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for SharePlayActivity(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
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
    v10 = *(int *)(a3 + 28);
    v11 = (char *)a1 + v10;
    v12 = (char *)a2 + v10;
    a1[4] = a2[4];
    a1[5] = v9;
    v13 = sub_23C416DE4();
    v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v14(v11, v12, v13);
    *(uint64_t *)((char *)v4 + *(int *)(a3 + 32)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 32));
  }
  return v4;
}

uint64_t destroy for SharePlayActivity(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 28);
  v5 = sub_23C416DE4();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *initializeWithCopy for SharePlayActivity(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  v8 = a2[5];
  v9 = *(int *)(a3 + 28);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  a1[4] = a2[4];
  a1[5] = v8;
  v12 = sub_23C416DE4();
  v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v13(v10, v11, v12);
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 32)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 32));
  return a1;
}

_QWORD *assignWithCopy for SharePlayActivity(_QWORD *a1, _QWORD *a2, uint64_t a3)
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
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 28);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_23C416DE4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 32)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 32));
  return a1;
}

_OWORD *initializeWithTake for SharePlayActivity(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  v7 = *(int *)(a3 + 28);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_23C416DE4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 32)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 32));
  return a1;
}

_QWORD *assignWithTake for SharePlayActivity(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

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
  v9 = *(int *)(a3 + 28);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_23C416DE4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 40))(v10, v11, v12);
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 32)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 32));
  return a1;
}

uint64_t getEnumTagSinglePayload for SharePlayActivity()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C412FA0(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_23C416DE4();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 28), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for SharePlayActivity()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C413028(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_23C416DE4();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 28), a2, a2, v7);
  }
  return result;
}

uint64_t sub_23C41309C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23C416DE4();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SharePlayActivity.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFC)
    goto LABEL_17;
  if (a2 + 4 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 4) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 4;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 4;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 4;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v8 = v6 - 5;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for SharePlayActivity.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_23C4131FC + 4 * byte_23C4172EA[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_23C413230 + 4 * byte_23C4172E5[v4]))();
}

uint64_t sub_23C413230(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C413238(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C413240);
  return result;
}

uint64_t sub_23C41324C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C413254);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_23C413258(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C413260(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C41326C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23C413274(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SharePlayActivity.CodingKeys()
{
  return &type metadata for SharePlayActivity.CodingKeys;
}

unint64_t sub_23C413290()
{
  unint64_t result;

  result = qword_256B97118;
  if (!qword_256B97118)
  {
    result = MEMORY[0x24261E208](&unk_23C41749C, &type metadata for SharePlayActivity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B97118);
  }
  return result;
}

unint64_t sub_23C4132D8()
{
  unint64_t result;

  result = qword_256B97120;
  if (!qword_256B97120)
  {
    result = MEMORY[0x24261E208](&unk_23C41740C, &type metadata for SharePlayActivity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B97120);
  }
  return result;
}

unint64_t sub_23C413320()
{
  unint64_t result;

  result = qword_256B97128;
  if (!qword_256B97128)
  {
    result = MEMORY[0x24261E208](&unk_23C417434, &type metadata for SharePlayActivity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B97128);
  }
  return result;
}

uint64_t SharePlaySessionEnvironment.handleSharePlayBeginActivityRequested.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_retain();
  return v1;
}

uint64_t SharePlaySessionEnvironment.makeSharePlayBeginActivityRequestedStream.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_retain();
  return v1;
}

uint64_t SharePlaySessionEnvironment.init(handleSharePlayBeginActivityRequested:makeSharePlayBeginActivityRequestedStream:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for SharePlaySessionEnvironment(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SharePlaySessionEnvironment()
{
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for SharePlaySessionEnvironment(uint64_t a1, uint64_t a2)
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

_QWORD *assignWithCopy for SharePlaySessionEnvironment(_QWORD *a1, _QWORD *a2)
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

_OWORD *assignWithTake for SharePlaySessionEnvironment(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SharePlaySessionEnvironment(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SharePlaySessionEnvironment(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SharePlaySessionEnvironment()
{
  return &type metadata for SharePlaySessionEnvironment;
}

uint64_t sub_23C4135AC()
{
  return 12383;
}

uint64_t sub_23C4135B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
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
    v5 = sub_23C416F10();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_23C413634()
{
  sub_23C413B80();
  return sub_23C416F58();
}

uint64_t sub_23C41365C()
{
  sub_23C413B80();
  return sub_23C416F64();
}

uint64_t sub_23C413684()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000016;
  else
    return 0x6570704177656976;
}

uint64_t sub_23C4136CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C414D4C(a1, a2);
  *a3 = result;
  return result;
}

void sub_23C4136F0(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_23C4136FC()
{
  sub_23C413AF8();
  return sub_23C416F58();
}

uint64_t sub_23C413724()
{
  sub_23C413AF8();
  return sub_23C416F64();
}

uint64_t sub_23C41374C()
{
  return 0;
}

uint64_t sub_23C413758@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_23C413784()
{
  sub_23C413BC4();
  return sub_23C416F58();
}

uint64_t sub_23C4137AC()
{
  sub_23C413BC4();
  return sub_23C416F64();
}

uint64_t SharePlaySessionAction.encode(to:)(_QWORD *a1)
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
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  char v30;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B97130);
  v25 = *(_QWORD *)(v2 - 8);
  v26 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v24 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for SharePlayActivity();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v23 = (uint64_t)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B97138);
  v21 = *(_QWORD *)(v7 - 8);
  v22 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for SharePlaySessionAction();
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B97140);
  v28 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C413AF8();
  sub_23C416F4C();
  sub_23C413B3C(v27, (uint64_t)v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v12, 1, v4) == 1)
  {
    v29 = 0;
    sub_23C413BC4();
    sub_23C416EE0();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v9, v22);
  }
  else
  {
    v17 = v23;
    sub_23C414088((uint64_t)v12, v23, (uint64_t (*)(_QWORD))type metadata accessor for SharePlayActivity);
    v30 = 1;
    sub_23C413B80();
    v18 = v24;
    sub_23C416EE0();
    sub_23C414048(&qword_256B97158, (uint64_t)&protocol conformance descriptor for SharePlayActivity);
    v19 = v26;
    sub_23C416F04();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v18, v19);
    sub_23C412B10(v17);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v15, v13);
}

uint64_t type metadata accessor for SharePlaySessionAction()
{
  uint64_t result;

  result = qword_256B97200;
  if (!qword_256B97200)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_23C413AF8()
{
  unint64_t result;

  result = qword_256B97148;
  if (!qword_256B97148)
  {
    result = MEMORY[0x24261E208](&unk_23C4178D4, &type metadata for SharePlaySessionAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B97148);
  }
  return result;
}

uint64_t sub_23C413B3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SharePlaySessionAction();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_23C413B80()
{
  unint64_t result;

  result = qword_256B97150;
  if (!qword_256B97150)
  {
    result = MEMORY[0x24261E208](&unk_23C417884, &type metadata for SharePlaySessionAction.BeginActivityRequestedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B97150);
  }
  return result;
}

unint64_t sub_23C413BC4()
{
  unint64_t result;

  result = qword_256B97160;
  if (!qword_256B97160)
  {
    result = MEMORY[0x24261E208](&unk_23C417834, &type metadata for SharePlaySessionAction.ViewAppearedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B97160);
  }
  return result;
}

uint64_t SharePlaySessionAction.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
  char *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  char v42;
  char v43;

  v41 = a1;
  v39 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B97168);
  v4 = *(_QWORD *)(v3 - 8);
  v35 = v3;
  v36 = v4;
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v38 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B97170);
  v33 = *(_QWORD *)(v6 - 8);
  v34 = v6;
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v37 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B97178);
  v9 = *(_QWORD *)(v8 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for SharePlaySessionAction();
  v13 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v15 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v32 - v16;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C413AF8();
  v18 = v40;
  sub_23C416F40();
  if (!v18)
  {
    v32 = v12;
    v19 = v37;
    v20 = v38;
    v40 = v9;
    v21 = v39;
    v22 = sub_23C416ED4();
    if (*(_QWORD *)(v22 + 16) == 1)
    {
      if ((*(_BYTE *)(v22 + 32) & 1) != 0)
      {
        v37 = (char *)v22;
        v43 = 1;
        sub_23C413B80();
        sub_23C416E98();
        v27 = type metadata accessor for SharePlayActivity();
        sub_23C414048(&qword_256B97188, (uint64_t)&protocol conformance descriptor for SharePlayActivity);
        v28 = v20;
        v29 = v27;
        v30 = v35;
        sub_23C416EC8();
        (*(void (**)(char *, uint64_t))(v36 + 8))(v28, v30);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v40 + 8))(v11, v8);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56))(v15, 0, 1, v29);
        sub_23C414088((uint64_t)v15, (uint64_t)v17, (uint64_t (*)(_QWORD))type metadata accessor for SharePlaySessionAction);
      }
      else
      {
        v42 = 0;
        sub_23C413BC4();
        sub_23C416E98();
        (*(void (**)(char *, uint64_t))(v33 + 8))(v19, v34);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v40 + 8))(v11, v8);
        v31 = type metadata accessor for SharePlayActivity();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v17, 1, 1, v31);
      }
      sub_23C414088((uint64_t)v17, v21, (uint64_t (*)(_QWORD))type metadata accessor for SharePlaySessionAction);
    }
    else
    {
      v23 = sub_23C416E8C();
      swift_allocError();
      v25 = v24;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256B97180);
      *v25 = v32;
      sub_23C416EA4();
      sub_23C416E80();
      (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v23 - 8) + 104))(v25, *MEMORY[0x24BEE26D0], v23);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v40 + 8))(v11, v8);
    }
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
}

uint64_t sub_23C414048(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for SharePlayActivity();
    result = MEMORY[0x24261E208](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23C414088(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_23C4140CC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return SharePlaySessionAction.init(from:)(a1, a2);
}

uint64_t sub_23C4140E0(_QWORD *a1)
{
  return SharePlaySessionAction.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for SharePlaySessionAction(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *, char *, uint64_t);
  char *v18;

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
    v7 = type metadata accessor for SharePlayActivity();
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      v10 = a2[1];
      *a1 = *a2;
      a1[1] = v10;
      v11 = a2[3];
      a1[2] = a2[2];
      a1[3] = v11;
      v12 = a2[5];
      a1[4] = a2[4];
      a1[5] = v12;
      v13 = *(int *)(v7 + 28);
      v18 = (char *)a1 + v13;
      v14 = (char *)a2 + v13;
      v15 = sub_23C416DE4();
      v16 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v16(v18, v14, v15);
      *(uint64_t *)((char *)a1 + *(int *)(v7 + 32)) = *(uint64_t *)((char *)a2 + *(int *)(v7 + 32));
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t destroy for SharePlaySessionAction(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v2 = type metadata accessor for SharePlayActivity();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 1, v2);
  if (!(_DWORD)result)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v4 = a1 + *(int *)(v2 + 28);
    v5 = sub_23C416DE4();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  return result;
}

_QWORD *initializeWithCopy for SharePlaySessionAction(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  char *v16;

  v6 = type metadata accessor for SharePlayActivity();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v8 = a2[1];
    *a1 = *a2;
    a1[1] = v8;
    v9 = a2[3];
    a1[2] = a2[2];
    a1[3] = v9;
    v10 = a2[5];
    a1[4] = a2[4];
    a1[5] = v10;
    v11 = *(int *)(v6 + 28);
    v16 = (char *)a1 + v11;
    v12 = (char *)a2 + v11;
    v13 = sub_23C416DE4();
    v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v14(v16, v12, v13);
    *(_QWORD *)((char *)a1 + *(int *)(v6 + 32)) = *(_QWORD *)((char *)a2 + *(int *)(v6 + 32));
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

_QWORD *assignWithCopy for SharePlaySessionAction(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(_QWORD *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;

  v6 = type metadata accessor for SharePlayActivity();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
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
      v16 = *(int *)(v6 + 28);
      v17 = (char *)a1 + v16;
      v18 = (char *)a2 + v16;
      v19 = sub_23C416DE4();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 24))(v17, v18, v19);
      *(_QWORD *)((char *)a1 + *(int *)(v6 + 32)) = *(_QWORD *)((char *)a2 + *(int *)(v6 + 32));
      return a1;
    }
    sub_23C412B10((uint64_t)a1);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  v11 = *(int *)(v6 + 28);
  v20 = (char *)a1 + v11;
  v12 = (char *)a2 + v11;
  v13 = sub_23C416DE4();
  v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v14(v20, v12, v13);
  *(_QWORD *)((char *)a1 + *(int *)(v6 + 32)) = *(_QWORD *)((char *)a2 + *(int *)(v6 + 32));
  (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

_OWORD *initializeWithTake for SharePlaySessionAction(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  v6 = type metadata accessor for SharePlayActivity();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v8 = a2[1];
    *a1 = *a2;
    a1[1] = v8;
    a1[2] = a2[2];
    v9 = *(int *)(v6 + 28);
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = sub_23C416DE4();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
    *(_QWORD *)((char *)a1 + *(int *)(v6 + 32)) = *(_QWORD *)((char *)a2 + *(int *)(v6 + 32));
    (*(void (**)(_OWORD *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

_QWORD *assignWithTake for SharePlaySessionAction(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(_QWORD *, uint64_t, uint64_t);
  int v9;
  int v10;
  __int128 v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;

  v6 = type metadata accessor for SharePlayActivity();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      v17 = a2[1];
      *a1 = *a2;
      a1[1] = v17;
      swift_bridgeObjectRelease();
      v18 = a2[3];
      a1[2] = a2[2];
      a1[3] = v18;
      swift_bridgeObjectRelease();
      v19 = a2[5];
      a1[4] = a2[4];
      a1[5] = v19;
      swift_bridgeObjectRelease();
      v20 = *(int *)(v6 + 28);
      v21 = (char *)a1 + v20;
      v22 = (char *)a2 + v20;
      v23 = sub_23C416DE4();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 40))(v21, v22, v23);
      *(_QWORD *)((char *)a1 + *(int *)(v6 + 32)) = *(_QWORD *)((char *)a2 + *(int *)(v6 + 32));
      return a1;
    }
    sub_23C412B10((uint64_t)a1);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  v11 = *((_OWORD *)a2 + 1);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v11;
  *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
  v12 = *(int *)(v6 + 28);
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = sub_23C416DE4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v13, v14, v15);
  *(_QWORD *)((char *)a1 + *(int *)(v6 + 32)) = *(_QWORD *)((char *)a2 + *(int *)(v6 + 32));
  (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for SharePlaySessionAction()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C414814(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int v5;

  v4 = type metadata accessor for SharePlayActivity();
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 2)
    return v5 - 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SharePlaySessionAction()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C41486C(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  if (a2)
    v5 = (a2 + 1);
  else
    v5 = 0;
  v6 = type metadata accessor for SharePlayActivity();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a1, v5, a3, v6);
}

uint64_t sub_23C4148BC(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SharePlayActivity();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 1, v2);
}

uint64_t sub_23C4148F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SharePlayActivity();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, 1, v4);
}

uint64_t sub_23C414934()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for SharePlayActivity();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for SharePlaySessionAction.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C4149D4 + 4 * byte_23C417595[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C414A08 + 4 * byte_23C417590[v4]))();
}

uint64_t sub_23C414A08(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C414A10(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C414A18);
  return result;
}

uint64_t sub_23C414A24(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C414A2CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C414A30(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C414A38(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_23C414A44(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SharePlaySessionAction.CodingKeys()
{
  return &type metadata for SharePlaySessionAction.CodingKeys;
}

ValueMetadata *type metadata accessor for SharePlaySessionAction.ViewAppearedCodingKeys()
{
  return &type metadata for SharePlaySessionAction.ViewAppearedCodingKeys;
}

uint64_t storeEnumTagSinglePayload for SharePlaySessionAction.BeginActivityRequestedCodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23C414AB0 + 4 * byte_23C41759A[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23C414AD0 + 4 * byte_23C41759F[v4]))();
}

_BYTE *sub_23C414AB0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23C414AD0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C414AD8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C414AE0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C414AE8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C414AF0(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for SharePlaySessionAction.BeginActivityRequestedCodingKeys()
{
  return &type metadata for SharePlaySessionAction.BeginActivityRequestedCodingKeys;
}

unint64_t sub_23C414B10()
{
  unint64_t result;

  result = qword_256B97210;
  if (!qword_256B97210)
  {
    result = MEMORY[0x24261E208](&unk_23C417704, &type metadata for SharePlaySessionAction.BeginActivityRequestedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B97210);
  }
  return result;
}

unint64_t sub_23C414B58()
{
  unint64_t result;

  result = qword_256B97218;
  if (!qword_256B97218)
  {
    result = MEMORY[0x24261E208](&unk_23C41780C, &type metadata for SharePlaySessionAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B97218);
  }
  return result;
}

unint64_t sub_23C414BA0()
{
  unint64_t result;

  result = qword_256B97220;
  if (!qword_256B97220)
  {
    result = MEMORY[0x24261E208](&unk_23C41772C, &type metadata for SharePlaySessionAction.ViewAppearedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B97220);
  }
  return result;
}

unint64_t sub_23C414BE8()
{
  unint64_t result;

  result = qword_256B97228;
  if (!qword_256B97228)
  {
    result = MEMORY[0x24261E208](&unk_23C417754, &type metadata for SharePlaySessionAction.ViewAppearedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B97228);
  }
  return result;
}

unint64_t sub_23C414C30()
{
  unint64_t result;

  result = qword_256B97230;
  if (!qword_256B97230)
  {
    result = MEMORY[0x24261E208](&unk_23C417674, &type metadata for SharePlaySessionAction.BeginActivityRequestedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B97230);
  }
  return result;
}

unint64_t sub_23C414C78()
{
  unint64_t result;

  result = qword_256B97238;
  if (!qword_256B97238)
  {
    result = MEMORY[0x24261E208](&unk_23C41769C, &type metadata for SharePlaySessionAction.BeginActivityRequestedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B97238);
  }
  return result;
}

unint64_t sub_23C414CC0()
{
  unint64_t result;

  result = qword_256B97240;
  if (!qword_256B97240)
  {
    result = MEMORY[0x24261E208](&unk_23C41777C, &type metadata for SharePlaySessionAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B97240);
  }
  return result;
}

unint64_t sub_23C414D08()
{
  unint64_t result;

  result = qword_256B97248;
  if (!qword_256B97248)
  {
    result = MEMORY[0x24261E208](&unk_23C4177A4, &type metadata for SharePlaySessionAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B97248);
  }
  return result;
}

uint64_t sub_23C414D4C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6570704177656976 && a2 == 0xEC00000064657261;
  if (v2 || (sub_23C416F10() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x800000023C418820)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23C416F10();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

BOOL static SharePlayState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_23C414E68()
{
  sub_23C4151CC();
  return sub_23C416F58();
}

uint64_t sub_23C414E90()
{
  sub_23C4151CC();
  return sub_23C416F64();
}

uint64_t sub_23C414EC0()
{
  _BYTE *v0;

  if (*v0)
    return 0x657669746361;
  else
    return 1701602409;
}

uint64_t sub_23C414EF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C415984(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C414F14()
{
  sub_23C415188();
  return sub_23C416F58();
}

uint64_t sub_23C414F3C()
{
  sub_23C415188();
  return sub_23C416F64();
}

uint64_t sub_23C414F64()
{
  sub_23C415210();
  return sub_23C416F58();
}

uint64_t sub_23C414F8C()
{
  sub_23C415210();
  return sub_23C416F64();
}

uint64_t SharePlayState.encode(to:)(_QWORD *a1)
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

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B97250);
  v16 = *(_QWORD *)(v3 - 8);
  v17 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B97258);
  v14 = *(_QWORD *)(v6 - 8);
  v15 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B97260);
  v18 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C415188();
  sub_23C416F4C();
  if ((v12 & 1) != 0)
  {
    v20 = 1;
    sub_23C4151CC();
    sub_23C416EE0();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v17);
  }
  else
  {
    v19 = 0;
    sub_23C415210();
    sub_23C416EE0();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v15);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v11, v9);
}

unint64_t sub_23C415188()
{
  unint64_t result;

  result = qword_256B97268;
  if (!qword_256B97268)
  {
    result = MEMORY[0x24261E208](&unk_23C417C4C, &type metadata for SharePlayState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B97268);
  }
  return result;
}

unint64_t sub_23C4151CC()
{
  unint64_t result;

  result = qword_256B97270;
  if (!qword_256B97270)
  {
    result = MEMORY[0x24261E208](&unk_23C417BFC, &type metadata for SharePlayState.ActiveCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B97270);
  }
  return result;
}

unint64_t sub_23C415210()
{
  unint64_t result;

  result = qword_256B97278;
  if (!qword_256B97278)
  {
    result = MEMORY[0x24261E208](&unk_23C417BAC, &type metadata for SharePlayState.IdleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B97278);
  }
  return result;
}

uint64_t SharePlayState.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
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
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B97280);
  v32 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v31 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B97288);
  v4 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B97290);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C415188();
  v11 = v33;
  sub_23C416F40();
  if (v11)
    goto LABEL_7;
  v26 = v4;
  v27 = a1;
  v12 = v31;
  v13 = v32;
  v33 = v8;
  v14 = sub_23C416ED4();
  v15 = v7;
  if (*(_QWORD *)(v14 + 16) != 1)
  {
    v19 = sub_23C416E8C();
    swift_allocError();
    v21 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B97180);
    *v21 = &type metadata for SharePlayState;
    sub_23C416EA4();
    sub_23C416E80();
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
    sub_23C4151CC();
    sub_23C416E98();
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
    sub_23C415210();
    v22 = v6;
    sub_23C416E98();
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

uint64_t sub_23C4155AC@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return SharePlayState.init(from:)(a1, a2);
}

uint64_t sub_23C4155C0(_QWORD *a1)
{
  return SharePlayState.encode(to:)(a1);
}

uint64_t SharePlayState.hash(into:)()
{
  return sub_23C416F28();
}

uint64_t SharePlayState.hashValue.getter()
{
  sub_23C416F1C();
  sub_23C416F28();
  return sub_23C416F34();
}

unint64_t sub_23C415644()
{
  unint64_t result;

  result = qword_256B97298;
  if (!qword_256B97298)
  {
    result = MEMORY[0x24261E208](&protocol conformance descriptor for SharePlayState, &type metadata for SharePlayState);
    atomic_store(result, (unint64_t *)&qword_256B97298);
  }
  return result;
}

ValueMetadata *type metadata accessor for SharePlayState()
{
  return &type metadata for SharePlayState;
}

uint64_t _s23FitnessSharePlaySession14SharePlayStateOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C4156EC + 4 * byte_23C417935[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C415720 + 4 * byte_23C417930[v4]))();
}

uint64_t sub_23C415720(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C415728(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C415730);
  return result;
}

uint64_t sub_23C41573C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C415744);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C415748(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C415750(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SharePlayState.CodingKeys()
{
  return &type metadata for SharePlayState.CodingKeys;
}

ValueMetadata *type metadata accessor for SharePlayState.IdleCodingKeys()
{
  return &type metadata for SharePlayState.IdleCodingKeys;
}

ValueMetadata *type metadata accessor for SharePlayState.ActiveCodingKeys()
{
  return &type metadata for SharePlayState.ActiveCodingKeys;
}

unint64_t sub_23C415790()
{
  unint64_t result;

  result = qword_256B972A0;
  if (!qword_256B972A0)
  {
    result = MEMORY[0x24261E208](&unk_23C417B84, &type metadata for SharePlayState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B972A0);
  }
  return result;
}

unint64_t sub_23C4157D8()
{
  unint64_t result;

  result = qword_256B972A8;
  if (!qword_256B972A8)
  {
    result = MEMORY[0x24261E208](&unk_23C417AA4, &type metadata for SharePlayState.IdleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B972A8);
  }
  return result;
}

unint64_t sub_23C415820()
{
  unint64_t result;

  result = qword_256B972B0;
  if (!qword_256B972B0)
  {
    result = MEMORY[0x24261E208](&unk_23C417ACC, &type metadata for SharePlayState.IdleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B972B0);
  }
  return result;
}

unint64_t sub_23C415868()
{
  unint64_t result;

  result = qword_256B972B8;
  if (!qword_256B972B8)
  {
    result = MEMORY[0x24261E208](&unk_23C417A54, &type metadata for SharePlayState.ActiveCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B972B8);
  }
  return result;
}

unint64_t sub_23C4158B0()
{
  unint64_t result;

  result = qword_256B972C0;
  if (!qword_256B972C0)
  {
    result = MEMORY[0x24261E208](&unk_23C417A7C, &type metadata for SharePlayState.ActiveCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B972C0);
  }
  return result;
}

unint64_t sub_23C4158F8()
{
  unint64_t result;

  result = qword_256B972C8;
  if (!qword_256B972C8)
  {
    result = MEMORY[0x24261E208](&unk_23C417AF4, &type metadata for SharePlayState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B972C8);
  }
  return result;
}

unint64_t sub_23C415940()
{
  unint64_t result;

  result = qword_256B972D0;
  if (!qword_256B972D0)
  {
    result = MEMORY[0x24261E208](&unk_23C417B1C, &type metadata for SharePlayState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B972D0);
  }
  return result;
}

uint64_t sub_23C415984(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 1701602409 && a2 == 0xE400000000000000;
  if (v2 || (sub_23C416F10() & 1) != 0)
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
    v6 = sub_23C416F10();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

__n128 SharePlaySessionFeature.init(environment:)@<Q0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 16);
  *a2 = *(_OWORD *)a1;
  a2[1] = v3;
  return result;
}

uint64_t SharePlaySessionFeature.reduce(localState:sharedState:sideEffects:action:)(uint64_t a1, char *a2, _QWORD **a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
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
  uint64_t (*v24)(_QWORD);
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  int *v28;
  char *v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  _QWORD *v38;
  unint64_t v39;
  unint64_t v40;
  int *v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  _QWORD *v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  char *v57;
  char *v58;
  char *v59;
  uint64_t v60;
  _QWORD **v61;
  uint64_t v62;
  uint64_t v63;
  char v64;
  char v65;

  v61 = a3;
  v57 = a2;
  v6 = type metadata accessor for SharePlayActivity();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v58 = (char *)&v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v57 - v10;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B972D8);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v57 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v59 = (char *)&v57 - v17;
  v18 = type metadata accessor for SharePlaySessionAction();
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v57 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = v4[1];
  v62 = *v4;
  v63 = v21;
  v22 = v4[2];
  v23 = v4[3];
  v60 = v22;
  sub_23C4166F8(a4, (uint64_t)v20, v24);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48))(v20, 1, v6);
  if ((_DWORD)result == 1)
  {
    v26 = v62;
    v27 = v63;
    if ((*v57 & 1) == 0)
    {
      *v57 = 1;
      v28 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_256B972E0);
      v29 = v59;
      v58 = &v59[v28[16]];
      v30 = &v59[v28[20]];
      v31 = &v59[v28[24]];
      v64 = 1;
      sub_23C415FE8();
      sub_23C416E74();
      sub_23C416E5C();
      v32 = *MEMORY[0x24BE2B550];
      v33 = sub_23C416DFC();
      (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 104))(v30, v32, v33);
      v34 = (_QWORD *)swift_allocObject();
      v34[2] = v26;
      v34[3] = v27;
      v34[4] = v60;
      v34[5] = v23;
      *(_QWORD *)v31 = &unk_256B97308;
      *((_QWORD *)v31 + 1) = v34;
      v35 = *MEMORY[0x24BE2B578];
      v36 = sub_23C416E08();
      (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 104))(v58, v35, v36);
      (*(void (**)(char *, _QWORD, uint64_t))(v13 + 104))(v29, *MEMORY[0x24BE2B438], v12);
      v37 = v61;
      v38 = *v61;
      swift_retain();
      swift_retain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v38 = (_QWORD *)sub_23C4168D8(0, v38[2] + 1, 1, v38);
      v40 = v38[2];
      v39 = v38[3];
      if (v40 >= v39 >> 1)
        v38 = (_QWORD *)sub_23C4168D8(v39 > 1, v40 + 1, 1, v38);
      v38[2] = v40 + 1;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v13 + 32))((unint64_t)v38+ ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80))+ *(_QWORD *)(v13 + 72) * v40, v59, v12);
      *v37 = v38;
    }
  }
  else
  {
    sub_23C415FA4((uint64_t)v20, (uint64_t)v11);
    v41 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_256B972E0);
    v42 = &v16[v41[16]];
    v57 = &v16[v41[20]];
    v43 = &v16[v41[24]];
    v65 = 0;
    sub_23C415FE8();
    sub_23C416E74();
    sub_23C416E5C();
    v44 = *MEMORY[0x24BE2B570];
    v45 = sub_23C416E08();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v45 - 8) + 104))(v42, v44, v45);
    v59 = v11;
    v46 = (uint64_t)v58;
    sub_23C4166F8((uint64_t)v11, (uint64_t)v58, (uint64_t (*)(_QWORD))type metadata accessor for SharePlayActivity);
    v47 = (*(unsigned __int8 *)(v7 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    v48 = (_QWORD *)swift_allocObject();
    v49 = v63;
    v48[2] = v62;
    v48[3] = v49;
    v48[4] = v60;
    v48[5] = v23;
    sub_23C415FA4(v46, (uint64_t)v48 + v47);
    *(_QWORD *)v43 = &unk_256B972F8;
    *((_QWORD *)v43 + 1) = v48;
    v50 = *MEMORY[0x24BE2B558];
    v51 = sub_23C416DFC();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v51 - 8) + 104))(v57, v50, v51);
    (*(void (**)(char *, _QWORD, uint64_t))(v13 + 104))(v16, *MEMORY[0x24BE2B438], v12);
    v52 = v61;
    v53 = *v61;
    swift_retain();
    swift_retain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v53 = (_QWORD *)sub_23C4168D8(0, v53[2] + 1, 1, v53);
    v55 = v53[2];
    v54 = v53[3];
    v56 = (uint64_t)v59;
    if (v55 >= v54 >> 1)
      v53 = (_QWORD *)sub_23C4168D8(v54 > 1, v55 + 1, 1, v53);
    v53[2] = v55 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v13 + 32))((unint64_t)v53+ ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80))+ *(_QWORD *)(v13 + 72) * v55, v16, v12);
    *v52 = v53;
    return sub_23C416D94(v56, (uint64_t (*)(_QWORD))type metadata accessor for SharePlayActivity);
  }
  return result;
}

uint64_t sub_23C415FA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SharePlayActivity();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_23C415FE8()
{
  unint64_t result;

  result = qword_256B972E8;
  if (!qword_256B972E8)
  {
    result = MEMORY[0x24261E208](&unk_23C417D70, &type metadata for SharePlaySessionFeature.TaskIdentifier);
    atomic_store(result, &qword_256B972E8);
  }
  return result;
}

uint64_t sub_23C41602C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  _QWORD *v4;
  _QWORD *v6;
  uint64_t (*v8)(_QWORD *);

  v4[12] = a1;
  type metadata accessor for SharePlaySessionAction();
  v4[13] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B97338);
  v4[14] = swift_task_alloc();
  v4[15] = sub_23C416E50();
  v4[16] = sub_23C416E44();
  v8 = (uint64_t (*)(_QWORD *))((char *)a4 + *a4);
  v6 = (_QWORD *)swift_task_alloc();
  v4[17] = v6;
  *v6 = v4;
  v6[1] = sub_23C416100;
  return v8(v4 + 7);
}

uint64_t sub_23C416100()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v1;
  *(_QWORD *)(*v1 + 144) = v0;
  swift_task_dealloc();
  *(_QWORD *)(v2 + 152) = sub_23C416E2C();
  *(_QWORD *)(v2 + 160) = v3;
  return swift_task_switch();
}

uint64_t sub_23C41618C()
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
  sub_23C416E68();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
  v0[21] = sub_23C416E44();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v0[5]);
  v5 = (_QWORD *)swift_task_alloc();
  v0[22] = (uint64_t)v5;
  *v5 = v0;
  v5[1] = sub_23C4162E8;
  return sub_23C416E38();
}

uint64_t sub_23C4162E8()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_23C41633C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  _QWORD *v6;

  v1 = *(_QWORD *)(v0 + 112);
  v2 = type metadata accessor for SharePlayActivity();
  v3 = *(_QWORD *)(v2 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v5 = *(_QWORD *)(v0 + 104);
    sub_23C415FA4(v1, v5);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v3 + 56))(v5, 0, 1, v2);
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 184) = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B97340);
    *v6 = v0;
    v6[1] = sub_23C416440;
    return sub_23C416DF0();
  }
}

uint64_t sub_23C416440()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 104);
  swift_task_dealloc();
  sub_23C416D94(v1, (uint64_t (*)(_QWORD))type metadata accessor for SharePlaySessionAction);
  return swift_task_switch();
}

uint64_t sub_23C4164A0()
{
  uint64_t *v0;
  _QWORD *v1;

  v0[21] = sub_23C416E44();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v0[5]);
  v1 = (_QWORD *)swift_task_alloc();
  v0[22] = (uint64_t)v1;
  *v1 = v0;
  v1[1] = sub_23C4162E8;
  return sub_23C416E38();
}

uint64_t sub_23C416538()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C416580(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t);

  v6[2] = sub_23C416E50();
  v6[3] = sub_23C416E44();
  v11 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v9 = (_QWORD *)swift_task_alloc();
  v6[4] = v9;
  *v9 = v6;
  v9[1] = sub_23C416608;
  return v11(a6);
}

uint64_t sub_23C416608()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 40) = v0;
  swift_task_dealloc();
  sub_23C416E2C();
  return swift_task_switch();
}

uint64_t sub_23C416690()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C4166C4()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C4166F8(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23C41673C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for SharePlayActivity();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (v2 + 48) & ~v2;
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = v0 + v3 + *(int *)(v1 + 28);
  v5 = sub_23C416DE4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return swift_deallocObject();
}

uint64_t sub_23C4167E8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for SharePlayActivity() - 8) + 80);
  v5 = (int *)v1[2];
  v6 = v1[3];
  v7 = v1[4];
  v8 = v1[5];
  v9 = (uint64_t)v1 + ((v4 + 48) & ~v4);
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = sub_23C41687C;
  return sub_23C416580(a1, v5, v6, v7, v8, v9);
}

uint64_t sub_23C41687C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

_BYTE *SharePlaySessionFeature.dispose(localState:sharedState:)(_BYTE *result)
{
  *result = 0;
  return result;
}

void sub_23C4168CC(uint64_t a1, _BYTE *a2)
{
  *a2 = 0;
}

size_t sub_23C4168D8(size_t result, int64_t a2, char a3, _QWORD *a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B97348);
  v10 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256B972D8) - 8);
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
  v15 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256B972D8) - 8);
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

uint64_t sub_23C416A54()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23C416A80(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_23C416DD4;
  return sub_23C41602C(a1, v4, v5, v6);
}

uint64_t sub_23C416AF4()
{
  return sub_23C416B3C(&qword_256B97310, (uint64_t)&protocol conformance descriptor for SharePlaySessionAction);
}

uint64_t sub_23C416B18()
{
  return sub_23C416B3C(&qword_256B97318, (uint64_t)&protocol conformance descriptor for SharePlaySessionAction);
}

uint64_t sub_23C416B3C(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for SharePlaySessionAction();
    result = MEMORY[0x24261E208](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23C416B80()
{
  unint64_t result;

  result = qword_256B97320;
  if (!qword_256B97320)
  {
    result = MEMORY[0x24261E208](MEMORY[0x24BE2B430], MEMORY[0x24BE2B428]);
    atomic_store(result, (unint64_t *)&qword_256B97320);
  }
  return result;
}

unint64_t sub_23C416BC8()
{
  unint64_t result;

  result = qword_256B97328;
  if (!qword_256B97328)
  {
    result = MEMORY[0x24261E208](&protocol conformance descriptor for SharePlaySessionState, &type metadata for SharePlaySessionState);
    atomic_store(result, (unint64_t *)&qword_256B97328);
  }
  return result;
}

ValueMetadata *type metadata accessor for SharePlaySessionFeature()
{
  return &type metadata for SharePlaySessionFeature;
}

uint64_t storeEnumTagSinglePayload for SharePlaySessionFeature.TaskIdentifier(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C416C68 + 4 * byte_23C417CA5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C416C9C + 4 * byte_23C417CA0[v4]))();
}

uint64_t sub_23C416C9C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C416CA4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C416CACLL);
  return result;
}

uint64_t sub_23C416CB8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C416CC0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C416CC4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C416CCC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SharePlaySessionFeature.TaskIdentifier()
{
  return &type metadata for SharePlaySessionFeature.TaskIdentifier;
}

unint64_t sub_23C416CEC()
{
  unint64_t result;

  result = qword_256B97330;
  if (!qword_256B97330)
  {
    result = MEMORY[0x24261E208](&unk_23C417D48, &type metadata for SharePlaySessionFeature.TaskIdentifier);
    atomic_store(result, (unint64_t *)&qword_256B97330);
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

uint64_t sub_23C416D94(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23C416DD8()
{
  return MEMORY[0x24BDCD988]();
}

uint64_t sub_23C416DE4()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_23C416DF0()
{
  return MEMORY[0x24BE2B460]();
}

uint64_t sub_23C416DFC()
{
  return MEMORY[0x24BE2B560]();
}

uint64_t sub_23C416E08()
{
  return MEMORY[0x24BE2B588]();
}

uint64_t sub_23C416E14()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_23C416E20()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23C416E2C()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_23C416E38()
{
  return MEMORY[0x24BEE68D8]();
}

uint64_t sub_23C416E44()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_23C416E50()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_23C416E5C()
{
  return MEMORY[0x24BEE6940]();
}

uint64_t sub_23C416E68()
{
  return MEMORY[0x24BEE6C08]();
}

uint64_t sub_23C416E74()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_23C416E80()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_23C416E8C()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_23C416E98()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_23C416EA4()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_23C416EB0()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_23C416EBC()
{
  return MEMORY[0x24BEE3378]();
}

uint64_t sub_23C416EC8()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_23C416ED4()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_23C416EE0()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_23C416EEC()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_23C416EF8()
{
  return MEMORY[0x24BEE34C8]();
}

uint64_t sub_23C416F04()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_23C416F10()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23C416F1C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23C416F28()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23C416F34()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23C416F40()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_23C416F4C()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23C416F58()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23C416F64()
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

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
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

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
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

