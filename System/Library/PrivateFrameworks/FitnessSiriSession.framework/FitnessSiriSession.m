BOOL static SiriState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_23C41ACB8()
{
  return 0;
}

uint64_t sub_23C41ACC4()
{
  return 0;
}

void sub_23C41ACD0(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_23C41ACDC()
{
  sub_23C41B11C();
  return sub_23C421648();
}

uint64_t sub_23C41AD04()
{
  sub_23C41B11C();
  return sub_23C421654();
}

BOOL sub_23C41AD2C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_23C41AD48()
{
  return sub_23C42160C();
}

uint64_t sub_23C41AD74()
{
  _BYTE *v0;

  if (*v0)
    return 0x657669746361;
  else
    return 1701602409;
}

uint64_t sub_23C41ADA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C41BA30(a1, a2);
  *a3 = result;
  return result;
}

void sub_23C41ADC8(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_23C41ADD4()
{
  sub_23C41B0D8();
  return sub_23C421648();
}

uint64_t sub_23C41ADFC()
{
  sub_23C41B0D8();
  return sub_23C421654();
}

uint64_t sub_23C41AE24@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_23C41AE50()
{
  sub_23C41B160();
  return sub_23C421648();
}

uint64_t sub_23C41AE78()
{
  sub_23C41B160();
  return sub_23C421654();
}

uint64_t SiriState.encode(to:)(_QWORD *a1)
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

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B98C60);
  v16 = *(_QWORD *)(v3 - 8);
  v17 = v3;
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B98C68);
  v14 = *(_QWORD *)(v6 - 8);
  v15 = v6;
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B98C70);
  v18 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C41B0D8();
  sub_23C42163C();
  if ((v12 & 1) != 0)
  {
    v20 = 1;
    sub_23C41B11C();
    sub_23C4215C4();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v17);
  }
  else
  {
    v19 = 0;
    sub_23C41B160();
    sub_23C4215C4();
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
    result = MEMORY[0x24261E4E0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
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

unint64_t sub_23C41B0D8()
{
  unint64_t result;

  result = qword_256B98C78;
  if (!qword_256B98C78)
  {
    result = MEMORY[0x24261E4F8](&unk_23C421AEC, &type metadata for SiriState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B98C78);
  }
  return result;
}

unint64_t sub_23C41B11C()
{
  unint64_t result;

  result = qword_256B98C80;
  if (!qword_256B98C80)
  {
    result = MEMORY[0x24261E4F8](&unk_23C421A9C, &type metadata for SiriState.ActiveCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B98C80);
  }
  return result;
}

unint64_t sub_23C41B160()
{
  unint64_t result;

  result = qword_256B98C88;
  if (!qword_256B98C88)
  {
    result = MEMORY[0x24261E4F8](&unk_23C421A4C, &type metadata for SiriState.IdleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B98C88);
  }
  return result;
}

uint64_t SiriState.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
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
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B98C90);
  v32 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8]();
  v31 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B98C98);
  v4 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B98CA0);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C41B0D8();
  v11 = v33;
  sub_23C421630();
  if (v11)
    goto LABEL_7;
  v26 = v4;
  v27 = a1;
  v12 = v31;
  v13 = v32;
  v33 = v8;
  v14 = sub_23C4215B8();
  v15 = v7;
  if (*(_QWORD *)(v14 + 16) != 1)
  {
    v19 = sub_23C421564();
    swift_allocError();
    v21 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B98CA8);
    *v21 = &type metadata for SiriState;
    sub_23C421588();
    sub_23C421558();
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
    sub_23C41B11C();
    sub_23C42157C();
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
    sub_23C41B160();
    v22 = v6;
    sub_23C42157C();
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

uint64_t sub_23C41B51C@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return SiriState.init(from:)(a1, a2);
}

uint64_t sub_23C41B530(_QWORD *a1)
{
  return SiriState.encode(to:)(a1);
}

uint64_t SiriState.hash(into:)()
{
  return sub_23C42160C();
}

uint64_t SiriState.hashValue.getter()
{
  sub_23C421600();
  sub_23C42160C();
  return sub_23C421624();
}

uint64_t sub_23C41B5B0()
{
  sub_23C421600();
  sub_23C42160C();
  return sub_23C421624();
}

uint64_t sub_23C41B5F4()
{
  sub_23C421600();
  sub_23C42160C();
  return sub_23C421624();
}

unint64_t sub_23C41B638()
{
  unint64_t result;

  result = qword_256B98CB0;
  if (!qword_256B98CB0)
  {
    result = MEMORY[0x24261E4F8](&protocol conformance descriptor for SiriState, &type metadata for SiriState);
    atomic_store(result, (unint64_t *)&qword_256B98CB0);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for SiriState()
{
  return &type metadata for SiriState;
}

uint64_t getEnumTagSinglePayload for SiriSessionFeature.TaskIdentifier(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s18FitnessSiriSession9SiriStateOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C41B784 + 4 * byte_23C4217C5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C41B7B8 + 4 * byte_23C4217C0[v4]))();
}

uint64_t sub_23C41B7B8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C41B7C0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C41B7C8);
  return result;
}

uint64_t sub_23C41B7D4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C41B7DCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C41B7E0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C41B7E8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C41B7F4(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23C41B7FC(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SiriState.CodingKeys()
{
  return &type metadata for SiriState.CodingKeys;
}

ValueMetadata *type metadata accessor for SiriState.IdleCodingKeys()
{
  return &type metadata for SiriState.IdleCodingKeys;
}

ValueMetadata *type metadata accessor for SiriState.ActiveCodingKeys()
{
  return &type metadata for SiriState.ActiveCodingKeys;
}

unint64_t sub_23C41B83C()
{
  unint64_t result;

  result = qword_256B98CB8;
  if (!qword_256B98CB8)
  {
    result = MEMORY[0x24261E4F8](&unk_23C421A24, &type metadata for SiriState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B98CB8);
  }
  return result;
}

unint64_t sub_23C41B884()
{
  unint64_t result;

  result = qword_256B98CC0;
  if (!qword_256B98CC0)
  {
    result = MEMORY[0x24261E4F8](&unk_23C421944, &type metadata for SiriState.IdleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B98CC0);
  }
  return result;
}

unint64_t sub_23C41B8CC()
{
  unint64_t result;

  result = qword_256B98CC8;
  if (!qword_256B98CC8)
  {
    result = MEMORY[0x24261E4F8](&unk_23C42196C, &type metadata for SiriState.IdleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B98CC8);
  }
  return result;
}

unint64_t sub_23C41B914()
{
  unint64_t result;

  result = qword_256B98CD0;
  if (!qword_256B98CD0)
  {
    result = MEMORY[0x24261E4F8](&unk_23C4218F4, &type metadata for SiriState.ActiveCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B98CD0);
  }
  return result;
}

unint64_t sub_23C41B95C()
{
  unint64_t result;

  result = qword_256B98CD8;
  if (!qword_256B98CD8)
  {
    result = MEMORY[0x24261E4F8](&unk_23C42191C, &type metadata for SiriState.ActiveCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B98CD8);
  }
  return result;
}

unint64_t sub_23C41B9A4()
{
  unint64_t result;

  result = qword_256B98CE0;
  if (!qword_256B98CE0)
  {
    result = MEMORY[0x24261E4F8](&unk_23C421994, &type metadata for SiriState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B98CE0);
  }
  return result;
}

unint64_t sub_23C41B9EC()
{
  unint64_t result;

  result = qword_256B98CE8;
  if (!qword_256B98CE8)
  {
    result = MEMORY[0x24261E4F8](&unk_23C4219BC, &type metadata for SiriState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B98CE8);
  }
  return result;
}

uint64_t sub_23C41BA30(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 1701602409 && a2 == 0xE400000000000000;
  if (v2 || (sub_23C4215F4() & 1) != 0)
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
    v6 = sub_23C4215F4();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t static SiriConstants.startWorkoutCandidateData.getter()
{
  return 0x74616469646E6163;
}

unint64_t static SiriConstants.startWorkoutPersonalizationMethod.getter()
{
  return 0xD000000000000015;
}

unint64_t static SiriConstants.startWorkoutHealthKitActivityType.getter()
{
  return 0xD000000000000015;
}

ValueMetadata *type metadata accessor for SiriConstants()
{
  return &type metadata for SiriConstants;
}

uint64_t SiriBeginSessionCriteria.healthKitActivityType.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t SiriBeginSessionCriteria.candidates.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SiriBeginSessionCriteria.personalizationMethod.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 24);
}

uint64_t SiriBeginSessionCriteria.init(healthKitActivityType:candidates:personalizationMethod:)@<X0>(uint64_t result@<X0>, char a2@<W1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  *(_QWORD *)a5 = result;
  *(_BYTE *)(a5 + 8) = a2 & 1;
  *(_QWORD *)(a5 + 16) = a3;
  *(_BYTE *)(a5 + 24) = a4;
  return result;
}

BOOL sub_23C41BBB4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_23C41BBC8()
{
  _BYTE *v0;
  unint64_t v1;

  v1 = 0x74616469646E6163;
  if (*v0 != 1)
    v1 = 0xD000000000000015;
  if (*v0)
    return v1;
  else
    return 0xD000000000000015;
}

uint64_t sub_23C41BC28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C41CFA0(a1, a2);
  *a3 = result;
  return result;
}

void sub_23C41BC4C(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_23C41BC58()
{
  sub_23C41BE58();
  return sub_23C421648();
}

uint64_t sub_23C41BC80()
{
  sub_23C41BE58();
  return sub_23C421654();
}

uint64_t SiriBeginSessionCriteria.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  char v15;
  char v16;
  char v17;
  char v18;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B98CF0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)(v1 + 16);
  v14 = *(unsigned __int8 *)(v1 + 24);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C41BE58();
  sub_23C42163C();
  v18 = 0;
  v7 = v12;
  sub_23C4215D0();
  if (!v7)
  {
    v8 = v14;
    v13 = v11;
    v17 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B98D00);
    sub_23C41C178(&qword_256B98D08, (uint64_t (*)(void))sub_23C41BEE0, MEMORY[0x24BEE1700]);
    sub_23C4215E8();
    v16 = v8;
    v15 = 2;
    sub_23C41BF24();
    sub_23C4215E8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_23C41BE58()
{
  unint64_t result;

  result = qword_256B98CF8;
  if (!qword_256B98CF8)
  {
    result = MEMORY[0x24261E4F8](&unk_23C421D1C, &type metadata for SiriBeginSessionCriteria.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B98CF8);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24261E4EC](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_23C41BEE0()
{
  unint64_t result;

  result = qword_256B98D10;
  if (!qword_256B98D10)
  {
    result = MEMORY[0x24261E4F8](&protocol conformance descriptor for SiriStartWorkoutCandidate, &type metadata for SiriStartWorkoutCandidate);
    atomic_store(result, (unint64_t *)&qword_256B98D10);
  }
  return result;
}

unint64_t sub_23C41BF24()
{
  unint64_t result;

  result = qword_256B98D18;
  if (!qword_256B98D18)
  {
    result = MEMORY[0x24261E4F8](&protocol conformance descriptor for SiriPersonalizationMethod, &type metadata for SiriPersonalizationMethod);
    atomic_store(result, (unint64_t *)&qword_256B98D18);
  }
  return result;
}

uint64_t SiriBeginSessionCriteria.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  char v13;
  _QWORD v15[2];
  char v16;
  char v17;
  char v18;
  char v19;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B98D20);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C41BE58();
  sub_23C421630();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v19 = 0;
  v9 = sub_23C421594();
  v11 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B98D00);
  v18 = 1;
  sub_23C41C178(&qword_256B98D28, (uint64_t (*)(void))sub_23C41C1E0, MEMORY[0x24BEE1720]);
  sub_23C4215AC();
  v12 = v15[1];
  v16 = 2;
  sub_23C41C224();
  v15[0] = v12;
  swift_bridgeObjectRetain();
  sub_23C4215AC();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v13 = v17;
  *(_QWORD *)a2 = v9;
  *(_BYTE *)(a2 + 8) = v11 & 1;
  *(_QWORD *)(a2 + 16) = v15[0];
  *(_BYTE *)(a2 + 24) = v13;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C41C178(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B98D00);
    v8 = a2();
    result = MEMORY[0x24261E4F8](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23C41C1E0()
{
  unint64_t result;

  result = qword_256B98D30;
  if (!qword_256B98D30)
  {
    result = MEMORY[0x24261E4F8](&protocol conformance descriptor for SiriStartWorkoutCandidate, &type metadata for SiriStartWorkoutCandidate);
    atomic_store(result, (unint64_t *)&qword_256B98D30);
  }
  return result;
}

unint64_t sub_23C41C224()
{
  unint64_t result;

  result = qword_256B98D38;
  if (!qword_256B98D38)
  {
    result = MEMORY[0x24261E4F8](&protocol conformance descriptor for SiriPersonalizationMethod, &type metadata for SiriPersonalizationMethod);
    atomic_store(result, (unint64_t *)&qword_256B98D38);
  }
  return result;
}

uint64_t sub_23C41C268@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return SiriBeginSessionCriteria.init(from:)(a1, a2);
}

uint64_t sub_23C41C27C(_QWORD *a1)
{
  return SiriBeginSessionCriteria.encode(to:)(a1);
}

uint64_t SiriBeginSessionCriteria.hash(into:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 + 16);
  if (*(_BYTE *)(v1 + 8) == 1)
  {
    sub_23C421618();
  }
  else
  {
    sub_23C421618();
    sub_23C42160C();
  }
  swift_bridgeObjectRetain();
  sub_23C41C898(a1, v3);
  swift_bridgeObjectRelease();
  sub_23C4214E0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C41C334(uint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  int v26;
  BOOL v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  unint64_t v34;
  int64_t v35;

  if (result == a2)
    return 1;
  if (*(_QWORD *)(result + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v3 = 0;
  v4 = *(_QWORD *)(result + 56);
  v31 = result;
  v32 = result + 56;
  v5 = 1 << *(_BYTE *)(result + 32);
  if (v5 < 64)
    v6 = ~(-1 << v5);
  else
    v6 = -1;
  v7 = v6 & v4;
  v33 = (unint64_t)(v5 + 63) >> 6;
  v8 = a2 + 56;
  if ((v6 & v4) == 0)
    goto LABEL_8;
  while (2)
  {
    v9 = __clz(__rbit64(v7));
    v10 = (v7 - 1) & v7;
    v11 = v9 | (v3 << 6);
LABEL_24:
    v15 = *(_QWORD *)(result + 48) + 24 * v11;
    v17 = *(_QWORD *)v15;
    v16 = *(_QWORD *)(v15 + 8);
    v18 = *(unsigned __int8 *)(v15 + 16);
    sub_23C421600();
    swift_bridgeObjectRetain();
    sub_23C4214E0();
    v34 = v10;
    v35 = v3;
    sub_23C4214E0();
    swift_bridgeObjectRelease();
    v19 = sub_23C421624();
    v20 = -1 << *(_BYTE *)(a2 + 32);
    v21 = v19 & ~v20;
    if (((*(_QWORD *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) == 0)
    {
LABEL_54:
      swift_bridgeObjectRelease();
      return 0;
    }
    v22 = ~v20;
    while (1)
    {
      v25 = *(_QWORD *)(a2 + 48) + 24 * v21;
      v26 = *(unsigned __int8 *)(v25 + 16);
      v27 = *(_QWORD *)v25 == v17 && *(_QWORD *)(v25 + 8) == v16;
      if (!v27 && (sub_23C4215F4() & 1) == 0)
        goto LABEL_29;
      if (v26)
        break;
      v28 = 0xE500000000000000;
      v29 = 0x6E61656C63;
      if (!v18)
        goto LABEL_26;
LABEL_42:
      if (v18 == 1)
        v30 = 0x746963696C707865;
      else
        v30 = 0x6669636570736E75;
      if (v18 == 1)
        v23 = 0xE800000000000000;
      else
        v23 = 0xEB00000000646569;
      if (v29 == v30)
        goto LABEL_27;
LABEL_28:
      v24 = sub_23C4215F4();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v24 & 1) != 0)
        goto LABEL_51;
LABEL_29:
      v21 = (v21 + 1) & v22;
      if (((*(_QWORD *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) == 0)
        goto LABEL_54;
    }
    if (v26 == 1)
    {
      v28 = 0xE800000000000000;
      v29 = 0x746963696C707865;
      if (!v18)
        goto LABEL_26;
      goto LABEL_42;
    }
    v29 = 0x6669636570736E75;
    v28 = 0xEB00000000646569;
    if (v18)
      goto LABEL_42;
LABEL_26:
    v23 = 0xE500000000000000;
    if (v29 != 0x6E61656C63)
      goto LABEL_28;
LABEL_27:
    if (v28 != v23)
      goto LABEL_28;
    swift_bridgeObjectRelease_n();
LABEL_51:
    swift_bridgeObjectRelease();
    result = v31;
    v7 = v34;
    v3 = v35;
    if (v34)
      continue;
    break;
  }
LABEL_8:
  v12 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
    goto LABEL_57;
  }
  if (v12 >= v33)
    return 1;
  v13 = *(_QWORD *)(v32 + 8 * v12);
  ++v3;
  if (v13)
    goto LABEL_23;
  v3 = v12 + 1;
  if (v12 + 1 >= v33)
    return 1;
  v13 = *(_QWORD *)(v32 + 8 * v3);
  if (v13)
    goto LABEL_23;
  v3 = v12 + 2;
  if (v12 + 2 >= v33)
    return 1;
  v13 = *(_QWORD *)(v32 + 8 * v3);
  if (v13)
    goto LABEL_23;
  v3 = v12 + 3;
  if (v12 + 3 >= v33)
    return 1;
  v13 = *(_QWORD *)(v32 + 8 * v3);
  if (v13)
    goto LABEL_23;
  v14 = v12 + 4;
  if (v14 >= v33)
    return 1;
  v13 = *(_QWORD *)(v32 + 8 * v14);
  if (v13)
  {
    v3 = v14;
LABEL_23:
    v10 = (v13 - 1) & v13;
    v11 = __clz(__rbit64(v13)) + (v3 << 6);
    goto LABEL_24;
  }
  while (1)
  {
    v3 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v3 >= v33)
      return 1;
    v13 = *(_QWORD *)(v32 + 8 * v3);
    ++v14;
    if (v13)
      goto LABEL_23;
  }
LABEL_57:
  __break(1u);
  return result;
}

uint64_t SiriBeginSessionCriteria.hashValue.getter()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  _BYTE v4[72];

  v1 = *(unsigned __int8 *)(v0 + 8);
  v2 = *(_QWORD *)(v0 + 16);
  sub_23C421600();
  sub_23C421618();
  if (v1 != 1)
    sub_23C42160C();
  swift_bridgeObjectRetain();
  sub_23C41C898((uint64_t)v4, v2);
  swift_bridgeObjectRelease();
  sub_23C4214E0();
  swift_bridgeObjectRelease();
  return sub_23C421624();
}

uint64_t sub_23C41C7DC()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  _BYTE v4[72];

  v1 = *(unsigned __int8 *)(v0 + 8);
  v2 = *(_QWORD *)(v0 + 16);
  sub_23C421600();
  sub_23C421618();
  if (v1 != 1)
    sub_23C42160C();
  swift_bridgeObjectRetain();
  sub_23C41C898((uint64_t)v4, v2);
  swift_bridgeObjectRelease();
  sub_23C4214E0();
  swift_bridgeObjectRelease();
  return sub_23C421624();
}

uint64_t sub_23C41C898(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t result;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v13;
  int64_t v14;

  sub_23C421624();
  v3 = a2 + 56;
  v4 = 1 << *(_BYTE *)(a2 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(a2 + 56);
  v7 = (unint64_t)(v4 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v9 = 0;
  v10 = 0;
  while (1)
  {
    if (v6)
    {
      v6 &= v6 - 1;
      goto LABEL_16;
    }
    if (__OFADD__(v10++, 1))
      goto LABEL_19;
    if (v10 >= v7)
    {
LABEL_17:
      swift_release();
      return sub_23C42160C();
    }
    v13 = *(_QWORD *)(v3 + 8 * v10);
    if (!v13)
      break;
LABEL_15:
    v6 = (v13 - 1) & v13;
LABEL_16:
    sub_23C421600();
    swift_bridgeObjectRetain();
    sub_23C4214E0();
    sub_23C4214E0();
    swift_bridgeObjectRelease();
    v11 = sub_23C421624();
    result = swift_bridgeObjectRelease();
    v9 ^= v11;
  }
  v14 = v10 + 1;
  if (v10 + 1 >= v7)
    goto LABEL_17;
  v13 = *(_QWORD *)(v3 + 8 * v14);
  if (v13)
  {
    ++v10;
    goto LABEL_15;
  }
  while (1)
  {
    v10 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v10 >= v7)
      goto LABEL_17;
    v13 = *(_QWORD *)(v3 + 8 * v10);
    ++v14;
    if (v13)
      goto LABEL_15;
  }
  __break(1u);
LABEL_19:
  __break(1u);
  return result;
}

uint64_t _s18FitnessSiriSession0b5BeginC8CriteriaV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;

  v4 = *(_BYTE *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v6 = *(char *)(a1 + 24);
  v7 = *(unsigned __int8 *)(a2 + 8);
  v8 = *(_QWORD *)(a2 + 16);
  v9 = *(char *)(a2 + 24);
  if ((v4 & 1) != 0)
  {
    if (!v7)
    {
LABEL_11:
      v11 = 0;
      return v11 & 1;
    }
  }
  else
  {
    if (*(_QWORD *)a1 == *(_QWORD *)a2)
      v10 = v7;
    else
      v10 = 1;
    if ((v10 & 1) != 0)
      goto LABEL_11;
  }
  if ((sub_23C41C334(v5, v8) & 1) == 0)
    goto LABEL_11;
  if (*(_QWORD *)&aLast_1[8 * v6] == *(_QWORD *)&aLast_1[8 * v9])
    v11 = 1;
  else
    v11 = sub_23C4215F4();
  swift_bridgeObjectRelease_n();
  return v11 & 1;
}

unint64_t sub_23C41CB4C()
{
  unint64_t result;

  result = qword_256B98D40;
  if (!qword_256B98D40)
  {
    result = MEMORY[0x24261E4F8](&protocol conformance descriptor for SiriBeginSessionCriteria, &type metadata for SiriBeginSessionCriteria);
    atomic_store(result, (unint64_t *)&qword_256B98D40);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for SiriBeginSessionCriteria(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SiriBeginSessionCriteria()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SiriBeginSessionCriteria(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SiriBeginSessionCriteria(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;

  v4 = *a2;
  *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 16) = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 24) = *((_BYTE *)a2 + 24);
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for SiriBeginSessionCriteria(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriBeginSessionCriteria(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 25))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriBeginSessionCriteria(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 25) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 25) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriBeginSessionCriteria()
{
  return &type metadata for SiriBeginSessionCriteria;
}

uint64_t getEnumTagSinglePayload for ContentRating(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SiriBeginSessionCriteria.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C41CE40 + 4 * byte_23C421B65[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23C41CE74 + 4 * asc_23C421B60[v4]))();
}

uint64_t sub_23C41CE74(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C41CE7C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C41CE84);
  return result;
}

uint64_t sub_23C41CE90(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C41CE98);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23C41CE9C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C41CEA4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_23C41CEB0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SiriBeginSessionCriteria.CodingKeys()
{
  return &type metadata for SiriBeginSessionCriteria.CodingKeys;
}

unint64_t sub_23C41CECC()
{
  unint64_t result;

  result = qword_256B98D48;
  if (!qword_256B98D48)
  {
    result = MEMORY[0x24261E4F8](&unk_23C421CF4, &type metadata for SiriBeginSessionCriteria.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B98D48);
  }
  return result;
}

unint64_t sub_23C41CF14()
{
  unint64_t result;

  result = qword_256B98D50;
  if (!qword_256B98D50)
  {
    result = MEMORY[0x24261E4F8](&unk_23C421C64, &type metadata for SiriBeginSessionCriteria.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B98D50);
  }
  return result;
}

unint64_t sub_23C41CF5C()
{
  unint64_t result;

  result = qword_256B98D58;
  if (!qword_256B98D58)
  {
    result = MEMORY[0x24261E4F8](&unk_23C421C8C, &type metadata for SiriBeginSessionCriteria.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B98D58);
  }
  return result;
}

uint64_t sub_23C41CFA0(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000015 && a2 == 0x800000023C422970 || (sub_23C4215F4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x74616469646E6163 && a2 == 0xEA00000000007365 || (sub_23C4215F4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x800000023C422950)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v5 = sub_23C4215F4();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

__n128 SiriSessionFeature.init(environment:)@<Q0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 16);
  *a2 = *(_OWORD *)a1;
  a2[1] = v3;
  return result;
}

uint64_t SiriSessionFeature.reduce(localState:sharedState:sideEffects:action:)(uint64_t a1, _BYTE *a2, _QWORD **a3, uint64_t *a4)
{
  uint64_t *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t result;
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
  int *v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int *v41;
  char *v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  char *v54;
  uint64_t v55;
  char *v56;
  _QWORD **v57;
  char v58;
  char v59;

  v57 = a3;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B98D60);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v11 = (char *)&v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v51 - v13;
  v15 = a4[2];
  v16 = *v4;
  v17 = v4[1];
  v18 = v4[2];
  v19 = v4[3];
  if (v15)
  {
    LODWORD(v55) = *((unsigned __int8 *)a4 + 24);
    v53 = *((_DWORD *)a4 + 2);
    v56 = (char *)v7;
    v20 = *a4;
    v51 = v19;
    v52 = v20;
    v21 = v18;
    v22 = v16;
    v23 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_256B98D68);
    v24 = &v11[v23[16]];
    v54 = &v11[v23[20]];
    v25 = &v11[v23[24]];
    v59 = 0;
    sub_23C41D54C();
    swift_bridgeObjectRetain();
    sub_23C42154C();
    sub_23C421534();
    v26 = *MEMORY[0x24BE2B570];
    v27 = sub_23C4214D4();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 104))(v24, v26, v27);
    v28 = swift_allocObject();
    *(_QWORD *)(v28 + 16) = v22;
    *(_QWORD *)(v28 + 24) = v17;
    v30 = v51;
    v29 = v52;
    *(_QWORD *)(v28 + 32) = v21;
    *(_QWORD *)(v28 + 40) = v30;
    *(_QWORD *)(v28 + 48) = v29;
    v31 = (uint64_t)v56;
    *(_BYTE *)(v28 + 56) = v53 & 1;
    *(_QWORD *)(v28 + 64) = v15;
    *(_BYTE *)(v28 + 72) = v55;
    *(_QWORD *)v25 = &unk_256B98D80;
    *((_QWORD *)v25 + 1) = v28;
    v32 = *MEMORY[0x24BE2B558];
    v33 = sub_23C4214C8();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 104))(v54, v32, v33);
    (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v11, *MEMORY[0x24BE2B438], v31);
    v34 = *v57;
    swift_retain();
    swift_retain();
    v35 = v8;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v34 = (_QWORD *)sub_23C41DD2C(0, v34[2] + 1, 1, v34);
    v37 = v34[2];
    v36 = v34[3];
    v38 = v37 + 1;
    if (v37 >= v36 >> 1)
      v34 = (_QWORD *)sub_23C41DD2C(v36 > 1, v37 + 1, 1, v34);
    v14 = v11;
  }
  else
  {
    if ((*a2 & 1) != 0)
      return result;
    *a2 = 1;
    v39 = v19;
    v55 = v18;
    v40 = v16;
    v41 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_256B98D68);
    v56 = &v14[v41[16]];
    v42 = &v14[v41[20]];
    v43 = v7;
    v44 = &v14[v41[24]];
    v58 = 1;
    sub_23C41D54C();
    sub_23C42154C();
    sub_23C421534();
    v45 = *MEMORY[0x24BE2B550];
    v46 = sub_23C4214C8();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v46 - 8) + 104))(v42, v45, v46);
    v47 = (_QWORD *)swift_allocObject();
    v47[2] = v40;
    v47[3] = v17;
    v47[4] = v55;
    v47[5] = v39;
    *(_QWORD *)v44 = &unk_256B98D90;
    *((_QWORD *)v44 + 1) = v47;
    v31 = v43;
    v48 = *MEMORY[0x24BE2B578];
    v49 = sub_23C4214D4();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v49 - 8) + 104))(v56, v48, v49);
    v35 = v8;
    (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v14, *MEMORY[0x24BE2B438], v31);
    v34 = *v57;
    swift_retain();
    swift_retain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v34 = (_QWORD *)sub_23C41DD2C(0, v34[2] + 1, 1, v34);
    v37 = v34[2];
    v50 = v34[3];
    v38 = v37 + 1;
    if (v37 >= v50 >> 1)
      v34 = (_QWORD *)sub_23C41DD2C(v50 > 1, v37 + 1, 1, v34);
  }
  v34[2] = v38;
  result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v35 + 32))((unint64_t)v34+ ((*(unsigned __int8 *)(v35 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80))+ *(_QWORD *)(v35 + 72) * v37, v14, v31);
  *v57 = v34;
  return result;
}

unint64_t sub_23C41D54C()
{
  unint64_t result;

  result = qword_256B98D70;
  if (!qword_256B98D70)
  {
    result = MEMORY[0x24261E4F8](&unk_23C421E5C, &type metadata for SiriSessionFeature.TaskIdentifier);
    atomic_store(result, &qword_256B98D70);
  }
  return result;
}

uint64_t sub_23C41D590(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  _QWORD *v4;
  _QWORD *v6;
  uint64_t (*v8)(_QWORD *);

  v4[20] = a1;
  v4[21] = sub_23C421528();
  v4[22] = sub_23C42151C();
  v8 = (uint64_t (*)(_QWORD *))((char *)a4 + *a4);
  v6 = (_QWORD *)swift_task_alloc();
  v4[23] = v6;
  *v6 = v4;
  v6[1] = sub_23C41D620;
  return v8(v4 + 7);
}

uint64_t sub_23C41D620()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v1;
  *(_QWORD *)(*v1 + 192) = v0;
  swift_task_dealloc();
  *(_QWORD *)(v2 + 200) = sub_23C421504();
  *(_QWORD *)(v2 + 208) = v3;
  return swift_task_switch();
}

uint64_t sub_23C41D6AC()
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
  sub_23C421540();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
  v0[27] = sub_23C42151C();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v0[5]);
  v5 = (_QWORD *)swift_task_alloc();
  v0[28] = (uint64_t)v5;
  *v5 = v0;
  v5[1] = sub_23C41D80C;
  return sub_23C421510();
}

uint64_t sub_23C41D80C()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_23C41D860()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  _QWORD *v5;

  v1 = *(_QWORD *)(v0 + 96);
  v2 = *(_QWORD *)(v0 + 104);
  v3 = *(_QWORD *)(v0 + 112);
  *(_QWORD *)(v0 + 232) = v3;
  if (v3)
  {
    v4 = *(_BYTE *)(v0 + 120);
    *(_QWORD *)(v0 + 128) = v1;
    *(_QWORD *)(v0 + 136) = v2 & 1;
    *(_QWORD *)(v0 + 144) = v3;
    *(_BYTE *)(v0 + 152) = v4;
    v5 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 240) = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B98DC0);
    *v5 = v0;
    v5[1] = sub_23C41D924;
    return sub_23C4214BC();
  }
  else
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23C41D924()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_23C41D978()
{
  uint64_t *v0;
  _QWORD *v1;

  v0[27] = sub_23C42151C();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v0[5]);
  v1 = (_QWORD *)swift_task_alloc();
  v0[28] = (uint64_t)v1;
  *v1 = v0;
  v1[1] = sub_23C41D80C;
  return sub_23C421510();
}

uint64_t sub_23C41DA1C()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C41DA50(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v13;
  uint64_t (*v15)(uint64_t);
  char v16;

  *(_QWORD *)(v8 + 48) = sub_23C421528();
  *(_QWORD *)(v8 + 56) = sub_23C42151C();
  *(_QWORD *)(v8 + 16) = a6;
  *(_BYTE *)(v8 + 24) = a7 & 1;
  *(_QWORD *)(v8 + 32) = a8;
  *(_BYTE *)(v8 + 40) = v16;
  v15 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v8 + 64) = v13;
  *v13 = v8;
  v13[1] = sub_23C41DB08;
  return v15(v8 + 16);
}

uint64_t sub_23C41DB08()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc();
  sub_23C421504();
  return swift_task_switch();
}

uint64_t sub_23C41DB9C()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C41DBD0()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C41DC04()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23C41DC38(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = *(int **)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_QWORD *)(v1 + 40);
  v8 = *(_QWORD *)(v1 + 48);
  v9 = *(_BYTE *)(v1 + 56);
  v10 = *(_QWORD *)(v1 + 64);
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_23C41DCDC;
  return sub_23C41DA50(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_23C41DCDC()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

size_t sub_23C41DD2C(size_t result, int64_t a2, char a3, _QWORD *a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B98DC8);
  v10 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256B98D60) - 8);
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
  v15 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256B98D60) - 8);
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

uint64_t sub_23C41DEA8()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23C41DED4(uint64_t a1)
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
  v7[1] = sub_23C41E398;
  return sub_23C41D590(a1, v4, v5, v6);
}

unint64_t sub_23C41DF4C()
{
  unint64_t result;

  result = qword_256B98D98;
  if (!qword_256B98D98)
  {
    result = MEMORY[0x24261E4F8](&protocol conformance descriptor for SiriSessionAction, &type metadata for SiriSessionAction);
    atomic_store(result, (unint64_t *)&qword_256B98D98);
  }
  return result;
}

unint64_t sub_23C41DF94()
{
  unint64_t result;

  result = qword_256B98DA0;
  if (!qword_256B98DA0)
  {
    result = MEMORY[0x24261E4F8](&protocol conformance descriptor for SiriSessionAction, &type metadata for SiriSessionAction);
    atomic_store(result, (unint64_t *)&qword_256B98DA0);
  }
  return result;
}

unint64_t sub_23C41DFDC()
{
  unint64_t result;

  result = qword_256B98DA8;
  if (!qword_256B98DA8)
  {
    result = MEMORY[0x24261E4F8](MEMORY[0x24BE2B430], MEMORY[0x24BE2B428]);
    atomic_store(result, (unint64_t *)&qword_256B98DA8);
  }
  return result;
}

unint64_t sub_23C41E024()
{
  unint64_t result;

  result = qword_256B98DB0;
  if (!qword_256B98DB0)
  {
    result = MEMORY[0x24261E4F8](&protocol conformance descriptor for SiriSessionState, &type metadata for SiriSessionState);
    atomic_store(result, (unint64_t *)&qword_256B98DB0);
  }
  return result;
}

uint64_t destroy for SiriSessionEnvironment()
{
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for SiriSessionEnvironment(uint64_t a1, uint64_t a2)
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

_QWORD *assignWithCopy for SiriSessionEnvironment(_QWORD *a1, _QWORD *a2)
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

_OWORD *assignWithTake for SiriSessionEnvironment(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriSessionEnvironment(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SiriSessionEnvironment(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SiriSessionFeature()
{
  return &type metadata for SiriSessionFeature;
}

uint64_t storeEnumTagSinglePayload for SiriSessionFeature.TaskIdentifier(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C41E268 + 4 * byte_23C421D95[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C41E29C + 4 * asc_23C421D90[v4]))();
}

uint64_t sub_23C41E29C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C41E2A4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C41E2ACLL);
  return result;
}

uint64_t sub_23C41E2B8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C41E2C0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C41E2C4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C41E2CC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SiriSessionFeature.TaskIdentifier()
{
  return &type metadata for SiriSessionFeature.TaskIdentifier;
}

unint64_t sub_23C41E2EC()
{
  unint64_t result;

  result = qword_256B98DB8;
  if (!qword_256B98DB8)
  {
    result = MEMORY[0x24261E4F8](&unk_23C421E34, &type metadata for SiriSessionFeature.TaskIdentifier);
    atomic_store(result, (unint64_t *)&qword_256B98DB8);
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

uint64_t SiriPersonalizationMethod.rawValue.getter(char a1)
{
  return *(_QWORD *)&aLast_2[8 * a1];
}

uint64_t sub_23C41E3B8(char *a1, char *a2)
{
  char v2;

  if (*(_QWORD *)&aLast_2[8 * *a1] == *(_QWORD *)&aLast_2[8 * *a2])
    v2 = 1;
  else
    v2 = sub_23C4215F4();
  swift_bridgeObjectRelease_n();
  return v2 & 1;
}

uint64_t sub_23C41E41C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = _s18FitnessSiriSession0B21PersonalizationMethodO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

void sub_23C41E448(_QWORD *a1@<X8>)
{
  char *v1;

  *a1 = *(_QWORD *)&aLast_2[8 * *v1];
  a1[1] = 0xE400000000000000;
}

uint64_t sub_23C41E464()
{
  sub_23C41E740();
  return sub_23C4214F8();
}

uint64_t sub_23C41E4C0()
{
  sub_23C41E740();
  return sub_23C4214EC();
}

uint64_t sub_23C41E50C()
{
  sub_23C421600();
  sub_23C4214E0();
  swift_bridgeObjectRelease();
  return sub_23C421624();
}

uint64_t sub_23C41E564()
{
  sub_23C4214E0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C41E590()
{
  sub_23C421600();
  sub_23C4214E0();
  swift_bridgeObjectRelease();
  return sub_23C421624();
}

uint64_t _s18FitnessSiriSession0B21PersonalizationMethodO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0;

  v0 = sub_23C421570();
  swift_bridgeObjectRelease();
  if (v0 >= 3)
    return 3;
  else
    return v0;
}

unint64_t sub_23C41E630()
{
  unint64_t result;

  result = qword_256B98DD0;
  if (!qword_256B98DD0)
  {
    result = MEMORY[0x24261E4F8](&protocol conformance descriptor for SiriPersonalizationMethod, &type metadata for SiriPersonalizationMethod);
    atomic_store(result, (unint64_t *)&qword_256B98DD0);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for SiriPersonalizationMethod(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C41E6C0 + 4 * byte_23C421EA5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23C41E6F4 + 4 * byte_23C421EA0[v4]))();
}

uint64_t sub_23C41E6F4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C41E6FC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C41E704);
  return result;
}

uint64_t sub_23C41E710(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C41E718);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23C41E71C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C41E724(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SiriPersonalizationMethod()
{
  return &type metadata for SiriPersonalizationMethod;
}

unint64_t sub_23C41E740()
{
  unint64_t result;

  result = qword_256B98DD8;
  if (!qword_256B98DD8)
  {
    result = MEMORY[0x24261E4F8](&protocol conformance descriptor for SiriPersonalizationMethod, &type metadata for SiriPersonalizationMethod);
    atomic_store(result, (unint64_t *)&qword_256B98DD8);
  }
  return result;
}

void SiriSessionState.state.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

_BYTE *SiriSessionState.state.setter(_BYTE *result)
{
  _BYTE *v1;

  *v1 = *result;
  return result;
}

uint64_t (*SiriSessionState.state.modify())()
{
  return nullsub_1;
}

FitnessSiriSession::SiriSessionState __swiftcall SiriSessionState.init(state:)(FitnessSiriSession::SiriSessionState state)
{
  _BYTE *v1;

  *v1 = *(_BYTE *)state.state;
  return state;
}

BOOL static SiriSessionState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_23C41E7D0()
{
  return 1;
}

uint64_t sub_23C41E7D8()
{
  sub_23C421600();
  sub_23C42160C();
  return sub_23C421624();
}

uint64_t sub_23C41E818()
{
  return sub_23C42160C();
}

uint64_t sub_23C41E83C()
{
  sub_23C421600();
  sub_23C42160C();
  return sub_23C421624();
}

uint64_t sub_23C41E878()
{
  return 0x6574617473;
}

uint64_t sub_23C41E88C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
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
    v5 = sub_23C4215F4();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_23C41E918()
{
  sub_23C41EA64();
  return sub_23C421648();
}

uint64_t sub_23C41E940()
{
  sub_23C41EA64();
  return sub_23C421654();
}

uint64_t SiriSessionState.encode(to:)(_QWORD *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char v7;
  uint64_t v9;
  char v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B98DE0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C41EA64();
  sub_23C42163C();
  v10 = v7;
  sub_23C41EAA8();
  sub_23C4215E8();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_23C41EA64()
{
  unint64_t result;

  result = qword_256B98DE8;
  if (!qword_256B98DE8)
  {
    result = MEMORY[0x24261E4F8](&unk_23C422144, &type metadata for SiriSessionState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B98DE8);
  }
  return result;
}

unint64_t sub_23C41EAA8()
{
  unint64_t result;

  result = qword_256B98DF0;
  if (!qword_256B98DF0)
  {
    result = MEMORY[0x24261E4F8](&protocol conformance descriptor for SiriState, &type metadata for SiriState);
    atomic_store(result, (unint64_t *)&qword_256B98DF0);
  }
  return result;
}

uint64_t SiriSessionState.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;
  char v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B98DF8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C41EA64();
  sub_23C421630();
  if (!v2)
  {
    sub_23C41EC08();
    sub_23C4215AC();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v11;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_23C41EC08()
{
  unint64_t result;

  result = qword_256B98E00;
  if (!qword_256B98E00)
  {
    result = MEMORY[0x24261E4F8](&protocol conformance descriptor for SiriState, &type metadata for SiriState);
    atomic_store(result, (unint64_t *)&qword_256B98E00);
  }
  return result;
}

uint64_t sub_23C41EC4C@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return SiriSessionState.init(from:)(a1, a2);
}

uint64_t sub_23C41EC60(_QWORD *a1)
{
  return SiriSessionState.encode(to:)(a1);
}

uint64_t storeEnumTagSinglePayload for SiriSessionState(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C41ECC0 + 4 * byte_23C421FE5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C41ECF4 + 4 * asc_23C421FE0[v4]))();
}

uint64_t sub_23C41ECF4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C41ECFC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C41ED04);
  return result;
}

uint64_t sub_23C41ED10(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C41ED18);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C41ED1C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C41ED24(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SiriSessionState()
{
  return &type metadata for SiriSessionState;
}

uint64_t getEnumTagSinglePayload for SiriSessionState.CodingKeys(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SiriSessionState.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23C41EDD4 + 4 * byte_23C421FEA[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23C41EDF4 + 4 * byte_23C421FEF[v4]))();
}

_BYTE *sub_23C41EDD4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23C41EDF4(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C41EDFC(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C41EE04(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C41EE0C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C41EE14(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_23C41EE20()
{
  return 0;
}

ValueMetadata *type metadata accessor for SiriSessionState.CodingKeys()
{
  return &type metadata for SiriSessionState.CodingKeys;
}

unint64_t sub_23C41EE3C()
{
  unint64_t result;

  result = qword_256B98E08;
  if (!qword_256B98E08)
  {
    result = MEMORY[0x24261E4F8](&unk_23C42211C, &type metadata for SiriSessionState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B98E08);
  }
  return result;
}

unint64_t sub_23C41EE84()
{
  unint64_t result;

  result = qword_256B98E10;
  if (!qword_256B98E10)
  {
    result = MEMORY[0x24261E4F8](&unk_23C42208C, &type metadata for SiriSessionState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B98E10);
  }
  return result;
}

unint64_t sub_23C41EECC()
{
  unint64_t result;

  result = qword_256B98E18;
  if (!qword_256B98E18)
  {
    result = MEMORY[0x24261E4F8](&unk_23C4220B4, &type metadata for SiriSessionState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B98E18);
  }
  return result;
}

uint64_t sub_23C41EF10(unsigned __int8 a1, unsigned __int8 a2)
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
      v3 = 0x746963696C707865;
    else
      v3 = 0x6669636570736E75;
    if (v2 == 1)
      v4 = 0xE800000000000000;
    else
      v4 = 0xEB00000000646569;
    v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1)
        v6 = 0x746963696C707865;
      else
        v6 = 0x6669636570736E75;
      if (v5 == 1)
        v7 = 0xE800000000000000;
      else
        v7 = 0xEB00000000646569;
      if (v3 != v6)
        goto LABEL_21;
      goto LABEL_19;
    }
  }
  else
  {
    v4 = 0xE500000000000000;
    v3 = 0x6E61656C63;
    v5 = a2;
    if (a2)
      goto LABEL_9;
  }
  v7 = 0xE500000000000000;
  if (v3 != 0x6E61656C63)
  {
LABEL_21:
    v8 = sub_23C4215F4();
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

uint64_t SiriStartWorkoutCandidate.identifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SiriStartWorkoutCandidate.contentRating.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 16);
}

FitnessSiriSession::SiriStartWorkoutCandidate __swiftcall SiriStartWorkoutCandidate.init(identifier:contentRating:)(Swift::String identifier, FitnessSiriSession::ContentRating contentRating)
{
  uint64_t v2;
  FitnessSiriSession::SiriStartWorkoutCandidate result;

  *(Swift::String *)v2 = identifier;
  *(_BYTE *)(v2 + 16) = contentRating;
  result.identifier = identifier;
  result.contentRating = contentRating;
  return result;
}

uint64_t sub_23C41F070()
{
  _BYTE *v0;

  if (*v0)
    return 0x52746E65746E6F63;
  else
    return 0x696669746E656469;
}

uint64_t sub_23C41F0BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C41FD78(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C41F0E0()
{
  sub_23C41F278();
  return sub_23C421648();
}

uint64_t sub_23C41F108()
{
  sub_23C41F278();
  return sub_23C421654();
}

uint64_t SiriStartWorkoutCandidate.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;
  uint64_t v9;
  int v10;
  char v11;
  char v12;
  char v13;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B98E20);
  v9 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(unsigned __int8 *)(v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C41F278();
  sub_23C42163C();
  v13 = 0;
  sub_23C4215DC();
  if (!v2)
  {
    v12 = v10;
    v11 = 1;
    sub_23C41F2BC();
    sub_23C4215E8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v6, v4);
}

unint64_t sub_23C41F278()
{
  unint64_t result;

  result = qword_256B98E28;
  if (!qword_256B98E28)
  {
    result = MEMORY[0x24261E4F8](&unk_23C422350, &type metadata for SiriStartWorkoutCandidate.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B98E28);
  }
  return result;
}

unint64_t sub_23C41F2BC()
{
  unint64_t result;

  result = qword_256B98E30;
  if (!qword_256B98E30)
  {
    result = MEMORY[0x24261E4F8](&protocol conformance descriptor for ContentRating, &type metadata for ContentRating);
    atomic_store(result, (unint64_t *)&qword_256B98E30);
  }
  return result;
}

uint64_t SiriStartWorkoutCandidate.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v14;
  char v15;
  char v16;
  char v17;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B98E38);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C41F278();
  sub_23C421630();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v17 = 0;
  v9 = sub_23C4215A0();
  v11 = v10;
  v15 = 1;
  sub_23C41F4A0();
  swift_bridgeObjectRetain();
  sub_23C4215AC();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v12 = v16;
  *(_QWORD *)a2 = v9;
  *(_QWORD *)(a2 + 8) = v11;
  *(_BYTE *)(a2 + 16) = v12;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

unint64_t sub_23C41F4A0()
{
  unint64_t result;

  result = qword_256B98E40;
  if (!qword_256B98E40)
  {
    result = MEMORY[0x24261E4F8](&protocol conformance descriptor for ContentRating, &type metadata for ContentRating);
    atomic_store(result, (unint64_t *)&qword_256B98E40);
  }
  return result;
}

uint64_t sub_23C41F4E4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return SiriStartWorkoutCandidate.init(from:)(a1, a2);
}

uint64_t sub_23C41F4F8(_QWORD *a1)
{
  return SiriStartWorkoutCandidate.encode(to:)(a1);
}

uint64_t SiriStartWorkoutCandidate.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_23C4214E0();
  swift_bridgeObjectRelease();
  sub_23C4214E0();
  return swift_bridgeObjectRelease();
}

uint64_t static SiriStartWorkoutCandidate.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  BOOL v4;
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;

  v2 = *(unsigned __int8 *)(a1 + 16);
  v3 = *(unsigned __int8 *)(a2 + 16);
  v4 = *(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8);
  if (v4 || (v5 = 0, (sub_23C4215F4() & 1) != 0))
  {
    v6 = 0xE800000000000000;
    v7 = 0x746963696C707865;
    if (v2 != 1)
    {
      v7 = 0x6669636570736E75;
      v6 = 0xEB00000000646569;
    }
    if (v2)
      v8 = v7;
    else
      v8 = 0x6E61656C63;
    if (v2)
      v9 = v6;
    else
      v9 = 0xE500000000000000;
    v10 = 0xE800000000000000;
    v11 = 0x746963696C707865;
    if (v3 != 1)
    {
      v11 = 0x6669636570736E75;
      v10 = 0xEB00000000646569;
    }
    if (v3)
      v12 = v11;
    else
      v12 = 0x6E61656C63;
    if (v3)
      v13 = v10;
    else
      v13 = 0xE500000000000000;
    if (v8 == v12 && v9 == v13)
      v5 = 1;
    else
      v5 = sub_23C4215F4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v5 & 1;
}

uint64_t SiriStartWorkoutCandidate.hashValue.getter()
{
  sub_23C421600();
  sub_23C4214E0();
  sub_23C4214E0();
  swift_bridgeObjectRelease();
  return sub_23C421624();
}

uint64_t sub_23C41F7A0()
{
  sub_23C421600();
  sub_23C4214E0();
  sub_23C4214E0();
  swift_bridgeObjectRelease();
  return sub_23C421624();
}

uint64_t sub_23C41F860()
{
  sub_23C4214E0();
  sub_23C4214E0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C41F8F0()
{
  sub_23C421600();
  sub_23C4214E0();
  sub_23C4214E0();
  swift_bridgeObjectRelease();
  return sub_23C421624();
}

uint64_t sub_23C41F9AC(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v2;
  unsigned __int8 v3;
  BOOL v4;

  v2 = *(_BYTE *)(a1 + 16);
  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8);
  if (v4 || (sub_23C4215F4() & 1) != 0)
    return sub_23C41EF10(v2, v3);
  else
    return 0;
}

unint64_t sub_23C41FA14()
{
  unint64_t result;

  result = qword_256B98E48;
  if (!qword_256B98E48)
  {
    result = MEMORY[0x24261E4F8](&protocol conformance descriptor for SiriStartWorkoutCandidate, &type metadata for SiriStartWorkoutCandidate);
    atomic_store(result, (unint64_t *)&qword_256B98E48);
  }
  return result;
}

uint64_t destroy for SiriStartWorkoutCandidate()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s18FitnessSiriSession25SiriStartWorkoutCandidateVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SiriStartWorkoutCandidate(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for SiriStartWorkoutCandidate(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriStartWorkoutCandidate(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SiriStartWorkoutCandidate(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SiriStartWorkoutCandidate()
{
  return &type metadata for SiriStartWorkoutCandidate;
}

uint64_t storeEnumTagSinglePayload for SiriStartWorkoutCandidate.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C41FC20 + 4 * byte_23C4221A5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C41FC54 + 4 * byte_23C4221A0[v4]))();
}

uint64_t sub_23C41FC54(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C41FC5C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C41FC64);
  return result;
}

uint64_t sub_23C41FC70(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C41FC78);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C41FC7C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C41FC84(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SiriStartWorkoutCandidate.CodingKeys()
{
  return &type metadata for SiriStartWorkoutCandidate.CodingKeys;
}

unint64_t sub_23C41FCA4()
{
  unint64_t result;

  result = qword_256B98E50;
  if (!qword_256B98E50)
  {
    result = MEMORY[0x24261E4F8](&unk_23C422328, &type metadata for SiriStartWorkoutCandidate.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B98E50);
  }
  return result;
}

unint64_t sub_23C41FCEC()
{
  unint64_t result;

  result = qword_256B98E58;
  if (!qword_256B98E58)
  {
    result = MEMORY[0x24261E4F8](&unk_23C422298, &type metadata for SiriStartWorkoutCandidate.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B98E58);
  }
  return result;
}

unint64_t sub_23C41FD34()
{
  unint64_t result;

  result = qword_256B98E60;
  if (!qword_256B98E60)
  {
    result = MEMORY[0x24261E4F8](&unk_23C4222C0, &type metadata for SiriStartWorkoutCandidate.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B98E60);
  }
  return result;
}

uint64_t sub_23C41FD78(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v2 || (sub_23C4215F4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x52746E65746E6F63 && a2 == 0xED0000676E697461)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23C4215F4();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23C41FE98()
{
  return 0x6169726574697263;
}

uint64_t sub_23C41FEB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x6169726574697263 && a2 == 0xE800000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_23C4215F4();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_23C41FF44()
{
  sub_23C420334();
  return sub_23C421648();
}

uint64_t sub_23C41FF6C()
{
  sub_23C420334();
  return sub_23C421654();
}

uint64_t sub_23C41FF94()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000015;
  else
    return 0x6570704177656976;
}

uint64_t sub_23C41FFDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C420CCC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C420000()
{
  sub_23C4202F0();
  return sub_23C421648();
}

uint64_t sub_23C420028()
{
  sub_23C4202F0();
  return sub_23C421654();
}

uint64_t sub_23C420050()
{
  sub_23C4203BC();
  return sub_23C421648();
}

uint64_t sub_23C420078()
{
  sub_23C4203BC();
  return sub_23C421654();
}

uint64_t SiriSessionAction.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  char v27;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B98E68);
  v21 = *(_QWORD *)(v3 - 8);
  v22 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B98E70);
  v16 = *(_QWORD *)(v6 - 8);
  v17 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B98E78);
  v23 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = v1[1];
  v13 = v1[2];
  v18 = *v1;
  v19 = v12;
  v20 = *((unsigned __int8 *)v1 + 24);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C4202F0();
  sub_23C42163C();
  if (v13)
  {
    LOBYTE(v24) = 1;
    sub_23C420334();
    sub_23C4215C4();
    v24 = v18;
    v25 = v19 & 1;
    v26 = v13;
    v27 = v20;
    sub_23C420378();
    v14 = v22;
    sub_23C4215E8();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v5, v14);
  }
  else
  {
    LOBYTE(v24) = 0;
    sub_23C4203BC();
    sub_23C4215C4();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v8, v17);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v11, v9);
}

unint64_t sub_23C4202F0()
{
  unint64_t result;

  result = qword_256B98E80;
  if (!qword_256B98E80)
  {
    result = MEMORY[0x24261E4F8](&unk_23C4226F0, &type metadata for SiriSessionAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B98E80);
  }
  return result;
}

unint64_t sub_23C420334()
{
  unint64_t result;

  result = qword_256B98E88;
  if (!qword_256B98E88)
  {
    result = MEMORY[0x24261E4F8](&unk_23C4226A0, &type metadata for SiriSessionAction.BeginSessionRequestedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B98E88);
  }
  return result;
}

unint64_t sub_23C420378()
{
  unint64_t result;

  result = qword_256B98E90;
  if (!qword_256B98E90)
  {
    result = MEMORY[0x24261E4F8](&protocol conformance descriptor for SiriBeginSessionCriteria, &type metadata for SiriBeginSessionCriteria);
    atomic_store(result, (unint64_t *)&qword_256B98E90);
  }
  return result;
}

unint64_t sub_23C4203BC()
{
  unint64_t result;

  result = qword_256B98E98;
  if (!qword_256B98E98)
  {
    result = MEMORY[0x24261E4F8](&unk_23C422650, &type metadata for SiriSessionAction.ViewAppearedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B98E98);
  }
  return result;
}

uint64_t SiriSessionAction.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
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
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  char *v36;
  _QWORD *v37;
  uint64_t v38;
  unsigned __int8 v39;
  uint64_t v40;
  char v41;
  uint64_t v42;

  v35 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B98EA0);
  v4 = *(_QWORD *)(v3 - 8);
  v33 = v3;
  v34 = v4;
  MEMORY[0x24BDAC7A8](v3);
  v36 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B98EA8);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B98EB0);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = a1[3];
  v37 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v14);
  sub_23C4202F0();
  v15 = v42;
  sub_23C421630();
  if (v15)
    goto LABEL_7;
  v16 = v7;
  v32 = v6;
  v17 = v36;
  v42 = v11;
  v18 = sub_23C4215B8();
  if (*(_QWORD *)(v18 + 16) != 1)
  {
    v26 = sub_23C421564();
    swift_allocError();
    v28 = v27;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B98CA8);
    *v28 = &type metadata for SiriSessionAction;
    sub_23C421588();
    sub_23C421558();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v26 - 8) + 104))(v28, *MEMORY[0x24BEE26D0], v26);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v42 + 8))(v13, v10);
LABEL_7:
    v29 = (uint64_t)v37;
    return __swift_destroy_boxed_opaque_existential_1(v29);
  }
  v19 = v13;
  if ((*(_BYTE *)(v18 + 32) & 1) != 0)
  {
    LOBYTE(v38) = 1;
    sub_23C420334();
    v20 = v17;
    sub_23C42157C();
    sub_23C4207AC();
    v21 = v33;
    sub_23C4215AC();
    (*(void (**)(char *, uint64_t))(v34 + 8))(v20, v21);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v42 + 8))(v19, v10);
    v22 = v38;
    v23 = v39;
    v24 = v40;
    v25 = v41;
  }
  else
  {
    LOBYTE(v38) = 0;
    sub_23C4203BC();
    sub_23C42157C();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v9, v32);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v42 + 8))(v13, v10);
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
  }
  v29 = (uint64_t)v37;
  v31 = v35;
  *v35 = v22;
  v31[1] = v23;
  v31[2] = v24;
  *((_BYTE *)v31 + 24) = v25;
  return __swift_destroy_boxed_opaque_existential_1(v29);
}

unint64_t sub_23C4207AC()
{
  unint64_t result;

  result = qword_256B98EB8;
  if (!qword_256B98EB8)
  {
    result = MEMORY[0x24261E4F8](&protocol conformance descriptor for SiriBeginSessionCriteria, &type metadata for SiriBeginSessionCriteria);
    atomic_store(result, (unint64_t *)&qword_256B98EB8);
  }
  return result;
}

uint64_t sub_23C4207F0@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return SiriSessionAction.init(from:)(a1, a2);
}

uint64_t sub_23C420804(_QWORD *a1)
{
  return SiriSessionAction.encode(to:)(a1);
}

uint64_t getEnumTagSinglePayload for SiriSessionAction(uint64_t a1, unsigned int a2)
{
  unint64_t v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 25))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  if ((v3 + 1) >= 2)
    return v3;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SiriSessionAction(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_DWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 25) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 25) = 0;
    if (a2)
      *(_QWORD *)(result + 16) = a2;
  }
  return result;
}

uint64_t sub_23C4208C4(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

uint64_t sub_23C4208DC(uint64_t result, int a2)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
  }
  else if (a2)
  {
    *(_QWORD *)(result + 16) = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriSessionAction()
{
  return &type metadata for SiriSessionAction;
}

uint64_t storeEnumTagSinglePayload for SiriSessionAction.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C420960 + 4 * byte_23C4223B5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C420994 + 4 * byte_23C4223B0[v4]))();
}

uint64_t sub_23C420994(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C42099C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C4209A4);
  return result;
}

uint64_t sub_23C4209B0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C4209B8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C4209BC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C4209C4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SiriSessionAction.CodingKeys()
{
  return &type metadata for SiriSessionAction.CodingKeys;
}

ValueMetadata *type metadata accessor for SiriSessionAction.ViewAppearedCodingKeys()
{
  return &type metadata for SiriSessionAction.ViewAppearedCodingKeys;
}

uint64_t storeEnumTagSinglePayload for SiriSessionAction.BeginSessionRequestedCodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23C420A30 + 4 * byte_23C4223BA[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23C420A50 + 4 * byte_23C4223BF[v4]))();
}

_BYTE *sub_23C420A30(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23C420A50(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C420A58(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C420A60(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C420A68(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C420A70(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for SiriSessionAction.BeginSessionRequestedCodingKeys()
{
  return &type metadata for SiriSessionAction.BeginSessionRequestedCodingKeys;
}

unint64_t sub_23C420A90()
{
  unint64_t result;

  result = qword_256B98EC0;
  if (!qword_256B98EC0)
  {
    result = MEMORY[0x24261E4F8](&unk_23C422520, &type metadata for SiriSessionAction.BeginSessionRequestedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B98EC0);
  }
  return result;
}

unint64_t sub_23C420AD8()
{
  unint64_t result;

  result = qword_256B98EC8;
  if (!qword_256B98EC8)
  {
    result = MEMORY[0x24261E4F8](&unk_23C422628, &type metadata for SiriSessionAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B98EC8);
  }
  return result;
}

unint64_t sub_23C420B20()
{
  unint64_t result;

  result = qword_256B98ED0;
  if (!qword_256B98ED0)
  {
    result = MEMORY[0x24261E4F8](&unk_23C422548, &type metadata for SiriSessionAction.ViewAppearedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B98ED0);
  }
  return result;
}

unint64_t sub_23C420B68()
{
  unint64_t result;

  result = qword_256B98ED8;
  if (!qword_256B98ED8)
  {
    result = MEMORY[0x24261E4F8](&unk_23C422570, &type metadata for SiriSessionAction.ViewAppearedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B98ED8);
  }
  return result;
}

unint64_t sub_23C420BB0()
{
  unint64_t result;

  result = qword_256B98EE0;
  if (!qword_256B98EE0)
  {
    result = MEMORY[0x24261E4F8](&unk_23C422490, &type metadata for SiriSessionAction.BeginSessionRequestedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B98EE0);
  }
  return result;
}

unint64_t sub_23C420BF8()
{
  unint64_t result;

  result = qword_256B98EE8;
  if (!qword_256B98EE8)
  {
    result = MEMORY[0x24261E4F8](&unk_23C4224B8, &type metadata for SiriSessionAction.BeginSessionRequestedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B98EE8);
  }
  return result;
}

unint64_t sub_23C420C40()
{
  unint64_t result;

  result = qword_256B98EF0;
  if (!qword_256B98EF0)
  {
    result = MEMORY[0x24261E4F8](&unk_23C422598, &type metadata for SiriSessionAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B98EF0);
  }
  return result;
}

unint64_t sub_23C420C88()
{
  unint64_t result;

  result = qword_256B98EF8;
  if (!qword_256B98EF8)
  {
    result = MEMORY[0x24261E4F8](&unk_23C4225C0, &type metadata for SiriSessionAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B98EF8);
  }
  return result;
}

uint64_t sub_23C420CCC(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6570704177656976 && a2 == 0xEC00000064657261;
  if (v2 || (sub_23C4215F4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x800000023C422990)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23C4215F4();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

void *static ContentRating.allCases.getter()
{
  return &unk_250D2F9F8;
}

uint64_t ContentRating.rawValue.getter(char a1)
{
  if (!a1)
    return 0x6E61656C63;
  if (a1 == 1)
    return 0x746963696C707865;
  return 0x6669636570736E75;
}

uint64_t sub_23C420E3C(_BYTE *a1, _BYTE *a2)
{
  int v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char v11;

  v2 = *a1;
  v3 = 0xE800000000000000;
  v4 = 0x746963696C707865;
  if (v2 != 1)
  {
    v4 = 0x6669636570736E75;
    v3 = 0xEB00000000646569;
  }
  if (*a1)
    v5 = v4;
  else
    v5 = 0x6E61656C63;
  if (v2)
    v6 = v3;
  else
    v6 = 0xE500000000000000;
  v7 = 0xE800000000000000;
  v8 = 0x746963696C707865;
  if (*a2 != 1)
  {
    v8 = 0x6669636570736E75;
    v7 = 0xEB00000000646569;
  }
  if (*a2)
    v9 = v8;
  else
    v9 = 0x6E61656C63;
  if (*a2)
    v10 = v7;
  else
    v10 = 0xE500000000000000;
  if (v5 == v9 && v6 == v10)
    v11 = 1;
  else
    v11 = sub_23C4215F4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v11 & 1;
}

uint64_t sub_23C420F4C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = _s18FitnessSiriSession13ContentRatingO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

void sub_23C420F78(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  int v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v2 = *v1;
  v3 = 0xE500000000000000;
  v4 = 0xE800000000000000;
  v5 = 0x746963696C707865;
  if (v2 != 1)
  {
    v5 = 0x6669636570736E75;
    v4 = 0xEB00000000646569;
  }
  v6 = v2 == 0;
  if (*v1)
    v7 = v5;
  else
    v7 = 0x6E61656C63;
  if (!v6)
    v3 = v4;
  *a1 = v7;
  a1[1] = v3;
}

void sub_23C420FDC(_QWORD *a1@<X8>)
{
  *a1 = &unk_250D2FA20;
}

uint64_t sub_23C420FEC()
{
  sub_23C421404();
  return sub_23C4214F8();
}

uint64_t sub_23C421048()
{
  sub_23C421404();
  return sub_23C4214EC();
}

uint64_t sub_23C421094()
{
  sub_23C421600();
  sub_23C4214E0();
  swift_bridgeObjectRelease();
  return sub_23C421624();
}

uint64_t sub_23C421138()
{
  sub_23C4214E0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C4211B8()
{
  sub_23C421600();
  sub_23C4214E0();
  swift_bridgeObjectRelease();
  return sub_23C421624();
}

uint64_t _s18FitnessSiriSession13ContentRatingO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0;

  v0 = sub_23C421570();
  swift_bridgeObjectRelease();
  if (v0 >= 3)
    return 3;
  else
    return v0;
}

unint64_t sub_23C4212A4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256B98F00;
  if (!qword_256B98F00)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B98F08);
    result = MEMORY[0x24261E4F8](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_256B98F00);
  }
  return result;
}

unint64_t sub_23C4212F4()
{
  unint64_t result;

  result = qword_256B98F10;
  if (!qword_256B98F10)
  {
    result = MEMORY[0x24261E4F8](&protocol conformance descriptor for ContentRating, &type metadata for ContentRating);
    atomic_store(result, (unint64_t *)&qword_256B98F10);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for ContentRating(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C421384 + 4 * byte_23C422745[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23C4213B8 + 4 * byte_23C422740[v4]))();
}

uint64_t sub_23C4213B8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C4213C0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C4213C8);
  return result;
}

uint64_t sub_23C4213D4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C4213DCLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23C4213E0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C4213E8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ContentRating()
{
  return &type metadata for ContentRating;
}

unint64_t sub_23C421404()
{
  unint64_t result;

  result = qword_256B98F18;
  if (!qword_256B98F18)
  {
    result = MEMORY[0x24261E4F8](&protocol conformance descriptor for ContentRating, &type metadata for ContentRating);
    atomic_store(result, (unint64_t *)&qword_256B98F18);
  }
  return result;
}

uint64_t SiriSessionEnvironment.handleSiriStartWorkoutRequest.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_retain();
  return v1;
}

uint64_t SiriSessionEnvironment.makeSiriBeginSessionRequestedStream.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_retain();
  return v1;
}

uint64_t SiriSessionEnvironment.init(handleSiriStartWorkoutRequest:makeSiriBeginSessionRequestedStream:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

ValueMetadata *type metadata accessor for SiriSessionEnvironment()
{
  return &type metadata for SiriSessionEnvironment;
}

uint64_t sub_23C4214BC()
{
  return MEMORY[0x24BE2B460]();
}

uint64_t sub_23C4214C8()
{
  return MEMORY[0x24BE2B560]();
}

uint64_t sub_23C4214D4()
{
  return MEMORY[0x24BE2B588]();
}

uint64_t sub_23C4214E0()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23C4214EC()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_23C4214F8()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_23C421504()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_23C421510()
{
  return MEMORY[0x24BEE68D8]();
}

uint64_t sub_23C42151C()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_23C421528()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_23C421534()
{
  return MEMORY[0x24BEE6940]();
}

uint64_t sub_23C421540()
{
  return MEMORY[0x24BEE6C08]();
}

uint64_t sub_23C42154C()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_23C421558()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_23C421564()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_23C421570()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_23C42157C()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_23C421588()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_23C421594()
{
  return MEMORY[0x24BEE3300]();
}

uint64_t sub_23C4215A0()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_23C4215AC()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_23C4215B8()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_23C4215C4()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_23C4215D0()
{
  return MEMORY[0x24BEE3450]();
}

uint64_t sub_23C4215DC()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_23C4215E8()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_23C4215F4()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23C421600()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23C42160C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23C421618()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_23C421624()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23C421630()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_23C42163C()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23C421648()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23C421654()
{
  return MEMORY[0x24BEE4A10]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
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

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
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

