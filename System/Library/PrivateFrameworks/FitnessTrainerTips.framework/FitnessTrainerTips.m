BOOL static SubscriptionState.== infix(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_23C42F8E0(char a1)
{
  return *(_QWORD *)&aUnknown_0[8 * a1];
}

BOOL sub_23C42F900(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23C42F918()
{
  return sub_23C4360BC();
}

uint64_t sub_23C42F944()
{
  char *v0;

  return sub_23C42F8E0(*v0);
}

uint64_t sub_23C42F94C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C430024(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C42F970()
{
  return 0;
}

void sub_23C42F97C(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_23C42F988()
{
  sub_23C42FDD4();
  return sub_23C4360EC();
}

uint64_t sub_23C42F9B0()
{
  sub_23C42FDD4();
  return sub_23C4360F8();
}

uint64_t sub_23C42F9D8()
{
  return 0;
}

void sub_23C42F9E4(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_23C42F9F0()
{
  sub_23C42FE5C();
  return sub_23C4360EC();
}

uint64_t sub_23C42FA18()
{
  sub_23C42FE5C();
  return sub_23C4360F8();
}

uint64_t sub_23C42FA40@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_23C42FA6C()
{
  sub_23C42FEA0();
  return sub_23C4360EC();
}

uint64_t sub_23C42FA94()
{
  sub_23C42FEA0();
  return sub_23C4360F8();
}

uint64_t sub_23C42FABC()
{
  sub_23C42FE18();
  return sub_23C4360EC();
}

uint64_t sub_23C42FAE4()
{
  sub_23C42FE18();
  return sub_23C4360F8();
}

uint64_t SubscriptionState.encode(to:)(_QWORD *a1, int a2)
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
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9CF78);
  v21 = *(_QWORD *)(v3 - 8);
  v22 = v3;
  MEMORY[0x24BDAC7A8]();
  v20 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9CF80);
  v18 = *(_QWORD *)(v5 - 8);
  v19 = v5;
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9CF88);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9CF90);
  v23 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8]();
  v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C42FDD4();
  sub_23C4360E0();
  if ((_BYTE)v24)
  {
    if (v24 == 1)
    {
      v26 = 1;
      sub_23C42FE5C();
      sub_23C436044();
      (*(void (**)(char *, uint64_t))(v18 + 8))(v7, v19);
    }
    else
    {
      v27 = 2;
      sub_23C42FE18();
      v15 = v20;
      sub_23C436044();
      (*(void (**)(char *, uint64_t))(v21 + 8))(v15, v22);
    }
  }
  else
  {
    v25 = 0;
    sub_23C42FEA0();
    sub_23C436044();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v14, v12);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24261EBA0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
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

unint64_t sub_23C42FDD4()
{
  unint64_t result;

  result = qword_256B9CF98;
  if (!qword_256B9CF98)
  {
    result = MEMORY[0x24261EBAC](&unk_23C4366A0, &type metadata for SubscriptionState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9CF98);
  }
  return result;
}

unint64_t sub_23C42FE18()
{
  unint64_t result;

  result = qword_256B9CFA0;
  if (!qword_256B9CFA0)
  {
    result = MEMORY[0x24261EBAC](&unk_23C436650, &type metadata for SubscriptionState.UnsubscribedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9CFA0);
  }
  return result;
}

unint64_t sub_23C42FE5C()
{
  unint64_t result;

  result = qword_256B9CFA8;
  if (!qword_256B9CFA8)
  {
    result = MEMORY[0x24261EBAC](&unk_23C436600, &type metadata for SubscriptionState.SubscribedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9CFA8);
  }
  return result;
}

unint64_t sub_23C42FEA0()
{
  unint64_t result;

  result = qword_256B9CFB0;
  if (!qword_256B9CFB0)
  {
    result = MEMORY[0x24261EBAC](&unk_23C4365B0, &type metadata for SubscriptionState.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9CFB0);
  }
  return result;
}

_QWORD *SubscriptionState.init(from:)(_QWORD *a1)
{
  return sub_23C430180(a1);
}

_QWORD *sub_23C42FEF8@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  _QWORD *result;

  result = sub_23C430180(a1);
  if (!v2)
    *a2 = (_BYTE)result;
  return result;
}

uint64_t sub_23C42FF20(_QWORD *a1)
{
  unsigned __int8 *v1;

  return SubscriptionState.encode(to:)(a1, *v1);
}

uint64_t SubscriptionState.hash(into:)()
{
  return sub_23C4360BC();
}

uint64_t SubscriptionState.hashValue.getter()
{
  sub_23C4360B0();
  sub_23C4360BC();
  return sub_23C4360C8();
}

uint64_t sub_23C42FFA0()
{
  sub_23C4360B0();
  sub_23C4360BC();
  return sub_23C4360C8();
}

uint64_t sub_23C42FFE4()
{
  sub_23C4360B0();
  sub_23C4360BC();
  return sub_23C4360C8();
}

uint64_t sub_23C430024(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6E776F6E6B6E75 && a2 == 0xE700000000000000;
  if (v3 || (sub_23C436074() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6269726373627573 && a2 == 0xEA00000000006465 || (sub_23C436074() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7263736275736E75 && a2 == 0xEC00000064656269)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_23C436074();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

_QWORD *sub_23C430180(_QWORD *a1)
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

  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9D008);
  v25 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8]();
  v29 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9D010);
  v23 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8]();
  v28 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9D018);
  v4 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9D020);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (uint64_t *)((char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C42FDD4();
  v11 = (uint64_t)v30;
  sub_23C4360D4();
  if (v11)
    goto LABEL_7;
  v21 = v4;
  v22 = v8;
  v12 = v29;
  v30 = a1;
  v13 = v10;
  v14 = sub_23C436038();
  v15 = v7;
  if (*(_QWORD *)(v14 + 16) != 1)
  {
    v18 = sub_23C435FD8();
    swift_allocError();
    v10 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B9D028);
    *v10 = &type metadata for SubscriptionState;
    sub_23C436008();
    sub_23C435FCC();
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
      sub_23C42FE5C();
      v16 = v28;
      sub_23C435FFC();
      v17 = v22;
      (*(void (**)(char *, uint64_t))(v23 + 8))(v16, v26);
    }
    else
    {
      v33 = 2;
      sub_23C42FE18();
      sub_23C435FFC();
      v17 = v22;
      (*(void (**)(char *, uint64_t))(v25 + 8))(v12, v27);
    }
    swift_bridgeObjectRelease();
    (*(void (**)(_QWORD *, uint64_t))(v17 + 8))(v13, v15);
  }
  else
  {
    v31 = 0;
    sub_23C42FEA0();
    sub_23C435FFC();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v6, v24);
    swift_bridgeObjectRelease();
    (*(void (**)(_QWORD *, uint64_t))(v22 + 8))(v13, v7);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  return v10;
}

unint64_t sub_23C43055C()
{
  unint64_t result;

  result = qword_256B9CFB8;
  if (!qword_256B9CFB8)
  {
    result = MEMORY[0x24261EBAC](&protocol conformance descriptor for SubscriptionState, &type metadata for SubscriptionState);
    atomic_store(result, (unint64_t *)&qword_256B9CFB8);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for SubscriptionState()
{
  return &type metadata for SubscriptionState;
}

uint64_t getEnumTagSinglePayload for TrainerTipUpsellMonitorAction.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s18FitnessTrainerTips17SubscriptionStateOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C4306A8 + 4 * byte_23C4362A5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23C4306DC + 4 * byte_23C4362A0[v4]))();
}

uint64_t sub_23C4306DC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C4306E4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C4306ECLL);
  return result;
}

uint64_t sub_23C4306F8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C430700);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23C430704(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C43070C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C430718(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23C430720(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SubscriptionState.CodingKeys()
{
  return &type metadata for SubscriptionState.CodingKeys;
}

ValueMetadata *type metadata accessor for SubscriptionState.UnknownCodingKeys()
{
  return &type metadata for SubscriptionState.UnknownCodingKeys;
}

ValueMetadata *type metadata accessor for SubscriptionState.SubscribedCodingKeys()
{
  return &type metadata for SubscriptionState.SubscribedCodingKeys;
}

ValueMetadata *type metadata accessor for SubscriptionState.UnsubscribedCodingKeys()
{
  return &type metadata for SubscriptionState.UnsubscribedCodingKeys;
}

unint64_t sub_23C43076C()
{
  unint64_t result;

  result = qword_256B9CFC0;
  if (!qword_256B9CFC0)
  {
    result = MEMORY[0x24261EBAC](&unk_23C436588, &type metadata for SubscriptionState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9CFC0);
  }
  return result;
}

unint64_t sub_23C4307B4()
{
  unint64_t result;

  result = qword_256B9CFC8;
  if (!qword_256B9CFC8)
  {
    result = MEMORY[0x24261EBAC](&unk_23C4364A8, &type metadata for SubscriptionState.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9CFC8);
  }
  return result;
}

unint64_t sub_23C4307FC()
{
  unint64_t result;

  result = qword_256B9CFD0;
  if (!qword_256B9CFD0)
  {
    result = MEMORY[0x24261EBAC](&unk_23C4364D0, &type metadata for SubscriptionState.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9CFD0);
  }
  return result;
}

unint64_t sub_23C430844()
{
  unint64_t result;

  result = qword_256B9CFD8;
  if (!qword_256B9CFD8)
  {
    result = MEMORY[0x24261EBAC](&unk_23C436458, &type metadata for SubscriptionState.SubscribedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9CFD8);
  }
  return result;
}

unint64_t sub_23C43088C()
{
  unint64_t result;

  result = qword_256B9CFE0;
  if (!qword_256B9CFE0)
  {
    result = MEMORY[0x24261EBAC](&unk_23C436480, &type metadata for SubscriptionState.SubscribedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9CFE0);
  }
  return result;
}

unint64_t sub_23C4308D4()
{
  unint64_t result;

  result = qword_256B9CFE8;
  if (!qword_256B9CFE8)
  {
    result = MEMORY[0x24261EBAC](&unk_23C436408, &type metadata for SubscriptionState.UnsubscribedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9CFE8);
  }
  return result;
}

unint64_t sub_23C43091C()
{
  unint64_t result;

  result = qword_256B9CFF0;
  if (!qword_256B9CFF0)
  {
    result = MEMORY[0x24261EBAC](&unk_23C436430, &type metadata for SubscriptionState.UnsubscribedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9CFF0);
  }
  return result;
}

unint64_t sub_23C430964()
{
  unint64_t result;

  result = qword_256B9CFF8;
  if (!qword_256B9CFF8)
  {
    result = MEMORY[0x24261EBAC](&unk_23C4364F8, &type metadata for SubscriptionState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9CFF8);
  }
  return result;
}

unint64_t sub_23C4309AC()
{
  unint64_t result;

  result = qword_256B9D000;
  if (!qword_256B9D000)
  {
    result = MEMORY[0x24261EBAC](&unk_23C436520, &type metadata for SubscriptionState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9D000);
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

uint64_t sub_23C430A24(char a1)
{
  uint64_t result;

  result = 0xD000000000000017;
  if (a1)
  {
    if (a1 == 1)
      return 0xD000000000000019;
    else
      return 0x6570704177656976;
  }
  return result;
}

uint64_t sub_23C430A8C()
{
  char *v0;

  return sub_23C430A24(*v0);
}

uint64_t sub_23C430A94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C431B60(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C430AB8()
{
  sub_23C430F9C();
  return sub_23C4360EC();
}

uint64_t sub_23C430AE0()
{
  sub_23C430F9C();
  return sub_23C4360F8();
}

uint64_t sub_23C430B08()
{
  sub_23C4310AC();
  return sub_23C4360EC();
}

uint64_t sub_23C430B30()
{
  sub_23C4310AC();
  return sub_23C4360F8();
}

uint64_t sub_23C430B58()
{
  return 1;
}

uint64_t sub_23C430B60()
{
  sub_23C4360B0();
  sub_23C4360BC();
  return sub_23C4360C8();
}

uint64_t sub_23C430BA0()
{
  return sub_23C4360BC();
}

uint64_t sub_23C430BC4()
{
  sub_23C4360B0();
  sub_23C4360BC();
  return sub_23C4360C8();
}

uint64_t sub_23C430C04@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C431CBC(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23C430C2C()
{
  sub_23C431024();
  return sub_23C4360EC();
}

uint64_t sub_23C430C54()
{
  sub_23C431024();
  return sub_23C4360F8();
}

uint64_t sub_23C430C7C()
{
  sub_23C430FE0();
  return sub_23C4360EC();
}

uint64_t sub_23C430CA4()
{
  sub_23C430FE0();
  return sub_23C4360F8();
}

uint64_t TrainerTipUpsellMonitorAction.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
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
  int v15;
  char *v16;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9D030);
  v24 = *(_QWORD *)(v3 - 8);
  v25 = v3;
  MEMORY[0x24BDAC7A8]();
  v22 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9D038);
  v26 = *(_QWORD *)(v5 - 8);
  v27 = v5;
  MEMORY[0x24BDAC7A8]();
  v23 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9D040);
  v7 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9D048);
  v28 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8]();
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *v1;
  v14 = v1[1];
  v15 = *((unsigned __int8 *)v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C430F9C();
  sub_23C4360E0();
  if (v15 == 2)
  {
    LOBYTE(v29) = 0;
    sub_23C4310AC();
    sub_23C436044();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v21);
    return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v12, v10);
  }
  if (v15 == 3)
  {
    LOBYTE(v29) = 2;
    sub_23C430FE0();
    v16 = v22;
    sub_23C436044();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v16, v25);
    return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v12, v10);
  }
  LOBYTE(v29) = 1;
  sub_23C431024();
  v18 = v23;
  sub_23C436044();
  v29 = v13;
  v30 = v14;
  v31 = v15 & 1;
  sub_23C431068();
  v19 = v27;
  sub_23C436068();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v18, v19);
  return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v12, v10);
}

unint64_t sub_23C430F9C()
{
  unint64_t result;

  result = qword_256B9D050;
  if (!qword_256B9D050)
  {
    result = MEMORY[0x24261EBAC](&unk_23C436B58, &type metadata for TrainerTipUpsellMonitorAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9D050);
  }
  return result;
}

unint64_t sub_23C430FE0()
{
  unint64_t result;

  result = qword_256B9D058;
  if (!qword_256B9D058)
  {
    result = MEMORY[0x24261EBAC](&unk_23C436B08, &type metadata for TrainerTipUpsellMonitorAction.ViewAppearedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9D058);
  }
  return result;
}

unint64_t sub_23C431024()
{
  unint64_t result;

  result = qword_256B9D060;
  if (!qword_256B9D060)
  {
    result = MEMORY[0x24261EBAC](&unk_23C436AB8, &type metadata for TrainerTipUpsellMonitorAction.TrainerTipPlayerDismissedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9D060);
  }
  return result;
}

unint64_t sub_23C431068()
{
  unint64_t result;

  result = qword_256B9D068;
  if (!qword_256B9D068)
  {
    result = MEMORY[0x24261EBAC](&protocol conformance descriptor for TrainerTipPlayerDismissedEvent, &type metadata for TrainerTipPlayerDismissedEvent);
    atomic_store(result, (unint64_t *)&qword_256B9D068);
  }
  return result;
}

unint64_t sub_23C4310AC()
{
  unint64_t result;

  result = qword_256B9D070;
  if (!qword_256B9D070)
  {
    result = MEMORY[0x24261EBAC](&unk_23C436A68, &type metadata for TrainerTipUpsellMonitorAction.PresentTrainerTipUpsellCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9D070);
  }
  return result;
}

uint64_t TrainerTipUpsellMonitorAction.init(from:)@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  char v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  _OWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _OWORD *v33;
  char *v34;
  char *v35;
  _QWORD *v36;
  __int128 v37;
  char v38;
  uint64_t v39;

  v33 = a2;
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9D078);
  v31 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8]();
  v35 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9D080);
  v32 = *(_QWORD *)(v30 - 8);
  MEMORY[0x24BDAC7A8]();
  v34 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9D088);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9D090);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8]();
  v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = a1[3];
  v36 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v13);
  sub_23C430F9C();
  v14 = v39;
  sub_23C4360D4();
  if (v14)
    goto LABEL_9;
  v28 = v5;
  v15 = v34;
  v16 = v35;
  v39 = v10;
  v17 = sub_23C436038();
  if (*(_QWORD *)(v17 + 16) != 1)
  {
    v21 = sub_23C435FD8();
    swift_allocError();
    v23 = v22;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B9D028);
    *v23 = &type metadata for TrainerTipUpsellMonitorAction;
    sub_23C436008();
    sub_23C435FCC();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v21 - 8) + 104))(v23, *MEMORY[0x24BEE26D0], v21);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v39 + 8))(v12, v9);
LABEL_9:
    v24 = (uint64_t)v36;
    return __swift_destroy_boxed_opaque_existential_1(v24);
  }
  if (*(_BYTE *)(v17 + 32))
  {
    if (*(_BYTE *)(v17 + 32) == 1)
    {
      LOBYTE(v37) = 1;
      sub_23C431024();
      sub_23C435FFC();
      sub_23C431548();
      v18 = v30;
      sub_23C43602C();
      (*(void (**)(char *, uint64_t))(v32 + 8))(v15, v18);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v39 + 8))(v12, v9);
      v19 = v37;
      v20 = v38;
    }
    else
    {
      LOBYTE(v37) = 2;
      sub_23C430FE0();
      sub_23C435FFC();
      (*(void (**)(char *, uint64_t))(v31 + 8))(v16, v29);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v39 + 8))(v12, v9);
      v19 = 0uLL;
      v20 = 3;
    }
  }
  else
  {
    LOBYTE(v37) = 0;
    sub_23C4310AC();
    sub_23C435FFC();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v28);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v39 + 8))(v12, v9);
    v19 = 0uLL;
    v20 = 2;
  }
  v24 = (uint64_t)v36;
  v26 = v33;
  *v33 = v19;
  *((_BYTE *)v26 + 16) = v20;
  return __swift_destroy_boxed_opaque_existential_1(v24);
}

unint64_t sub_23C431548()
{
  unint64_t result;

  result = qword_256B9D098;
  if (!qword_256B9D098)
  {
    result = MEMORY[0x24261EBAC](&protocol conformance descriptor for TrainerTipPlayerDismissedEvent, &type metadata for TrainerTipPlayerDismissedEvent);
    atomic_store(result, (unint64_t *)&qword_256B9D098);
  }
  return result;
}

uint64_t sub_23C43158C@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  return TrainerTipUpsellMonitorAction.init(from:)(a1, a2);
}

uint64_t sub_23C4315A0(_QWORD *a1)
{
  return TrainerTipUpsellMonitorAction.encode(to:)(a1);
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for TrainerTipUpsellMonitorAction(uint64_t a1, unsigned int a2)
{
  uint64_t result;
  unsigned int v3;
  unsigned int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 253);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 < 2)
    return 0;
  v4 = (v3 + 2147483646) & 0x7FFFFFFF;
  result = v4 - 1;
  if (v4 <= 1)
    return 0;
  return result;
}

uint64_t storeEnumTagSinglePayload for TrainerTipUpsellMonitorAction(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_BYTE *)(result + 16) = 0;
    *(_DWORD *)result = a2 - 253;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = a2 + 3;
  }
  return result;
}

uint64_t sub_23C431658(uint64_t a1)
{
  unsigned int v1;
  BOOL v2;
  int v3;

  v1 = *(unsigned __int8 *)(a1 + 16);
  v2 = v1 >= 2;
  v3 = (v1 + 2147483646) & 0x7FFFFFFF;
  if (v2)
    return (v3 + 1);
  else
    return 0;
}

uint64_t sub_23C431674(uint64_t result, unsigned int a2)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
  }
  else if (a2)
  {
    *(_BYTE *)(result + 16) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for TrainerTipUpsellMonitorAction()
{
  return &type metadata for TrainerTipUpsellMonitorAction;
}

uint64_t storeEnumTagSinglePayload for TrainerTipUpsellMonitorAction.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C4316F8 + 4 * byte_23C436735[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23C43172C + 4 * byte_23C436730[v4]))();
}

uint64_t sub_23C43172C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C431734(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C43173CLL);
  return result;
}

uint64_t sub_23C431748(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C431750);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23C431754(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C43175C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TrainerTipUpsellMonitorAction.CodingKeys()
{
  return &type metadata for TrainerTipUpsellMonitorAction.CodingKeys;
}

ValueMetadata *type metadata accessor for TrainerTipUpsellMonitorAction.PresentTrainerTipUpsellCodingKeys()
{
  return &type metadata for TrainerTipUpsellMonitorAction.PresentTrainerTipUpsellCodingKeys;
}

uint64_t getEnumTagSinglePayload for TrainerTipUpsellMonitorAction.TrainerTipPlayerDismissedCodingKeys(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for TrainerTipUpsellMonitorAction.TrainerTipPlayerDismissedCodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23C43181C + 4 * byte_23C43673A[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23C43183C + 4 * byte_23C43673F[v4]))();
}

_BYTE *sub_23C43181C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23C43183C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C431844(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C43184C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C431854(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C43185C(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_23C431868()
{
  return 0;
}

ValueMetadata *type metadata accessor for TrainerTipUpsellMonitorAction.TrainerTipPlayerDismissedCodingKeys()
{
  return &type metadata for TrainerTipUpsellMonitorAction.TrainerTipPlayerDismissedCodingKeys;
}

ValueMetadata *type metadata accessor for TrainerTipUpsellMonitorAction.ViewAppearedCodingKeys()
{
  return &type metadata for TrainerTipUpsellMonitorAction.ViewAppearedCodingKeys;
}

unint64_t sub_23C431894()
{
  unint64_t result;

  result = qword_256B9D0A0;
  if (!qword_256B9D0A0)
  {
    result = MEMORY[0x24261EBAC](&unk_23C436938, &type metadata for TrainerTipUpsellMonitorAction.TrainerTipPlayerDismissedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9D0A0);
  }
  return result;
}

unint64_t sub_23C4318DC()
{
  unint64_t result;

  result = qword_256B9D0A8;
  if (!qword_256B9D0A8)
  {
    result = MEMORY[0x24261EBAC](&unk_23C436A40, &type metadata for TrainerTipUpsellMonitorAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9D0A8);
  }
  return result;
}

unint64_t sub_23C431924()
{
  unint64_t result;

  result = qword_256B9D0B0;
  if (!qword_256B9D0B0)
  {
    result = MEMORY[0x24261EBAC](&unk_23C436960, &type metadata for TrainerTipUpsellMonitorAction.PresentTrainerTipUpsellCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9D0B0);
  }
  return result;
}

unint64_t sub_23C43196C()
{
  unint64_t result;

  result = qword_256B9D0B8;
  if (!qword_256B9D0B8)
  {
    result = MEMORY[0x24261EBAC](&unk_23C436988, &type metadata for TrainerTipUpsellMonitorAction.PresentTrainerTipUpsellCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9D0B8);
  }
  return result;
}

unint64_t sub_23C4319B4()
{
  unint64_t result;

  result = qword_256B9D0C0;
  if (!qword_256B9D0C0)
  {
    result = MEMORY[0x24261EBAC](&unk_23C4368A8, &type metadata for TrainerTipUpsellMonitorAction.TrainerTipPlayerDismissedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9D0C0);
  }
  return result;
}

unint64_t sub_23C4319FC()
{
  unint64_t result;

  result = qword_256B9D0C8;
  if (!qword_256B9D0C8)
  {
    result = MEMORY[0x24261EBAC](&unk_23C4368D0, &type metadata for TrainerTipUpsellMonitorAction.TrainerTipPlayerDismissedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9D0C8);
  }
  return result;
}

unint64_t sub_23C431A44()
{
  unint64_t result;

  result = qword_256B9D0D0;
  if (!qword_256B9D0D0)
  {
    result = MEMORY[0x24261EBAC](&unk_23C436858, &type metadata for TrainerTipUpsellMonitorAction.ViewAppearedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9D0D0);
  }
  return result;
}

unint64_t sub_23C431A8C()
{
  unint64_t result;

  result = qword_256B9D0D8;
  if (!qword_256B9D0D8)
  {
    result = MEMORY[0x24261EBAC](&unk_23C436880, &type metadata for TrainerTipUpsellMonitorAction.ViewAppearedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9D0D8);
  }
  return result;
}

unint64_t sub_23C431AD4()
{
  unint64_t result;

  result = qword_256B9D0E0;
  if (!qword_256B9D0E0)
  {
    result = MEMORY[0x24261EBAC](&unk_23C4369B0, &type metadata for TrainerTipUpsellMonitorAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9D0E0);
  }
  return result;
}

unint64_t sub_23C431B1C()
{
  unint64_t result;

  result = qword_256B9D0E8;
  if (!qword_256B9D0E8)
  {
    result = MEMORY[0x24261EBAC](&unk_23C4369D8, &type metadata for TrainerTipUpsellMonitorAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9D0E8);
  }
  return result;
}

uint64_t sub_23C431B60(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000017 && a2 == 0x800000023C437F60 || (sub_23C436074() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000019 && a2 == 0x800000023C437F80 || (sub_23C436074() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6570704177656976 && a2 == 0xEC00000064657261)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v5 = sub_23C436074();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_23C431CBC(uint64_t a1, uint64_t a2)
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
    v3 = sub_23C436074();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23C431D28()
{
  return 12383;
}

double TrainerTipUpsellConfiguration.interval.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

uint64_t TrainerTipUpsellConfiguration.nativeRulesEnabled.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 8);
}

uint64_t TrainerTipUpsellConfiguration.placementIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

double TrainerTipUpsellConfiguration.minimumRatioComplete.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 32);
}

uint64_t TrainerTipUpsellConfiguration.subscriptionCheckEnabled.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 40);
}

void __swiftcall TrainerTipUpsellConfiguration.init(interval:nativeRulesEnabled:placementIdentifier:minimumRatioComplete:subscriptionCheckEnabled:)(FitnessTrainerTips::TrainerTipUpsellConfiguration *__return_ptr retstr, Swift::Double interval, Swift::Bool nativeRulesEnabled, Swift::String placementIdentifier, Swift::Double minimumRatioComplete, Swift::Bool subscriptionCheckEnabled)
{
  retstr->interval = interval;
  retstr->nativeRulesEnabled = nativeRulesEnabled;
  retstr->placementIdentifier = placementIdentifier;
  retstr->minimumRatioComplete = minimumRatioComplete;
  retstr->subscriptionCheckEnabled = subscriptionCheckEnabled;
}

uint64_t initializeBufferWithCopyOfBuffer for TrainerTipUpsellConfiguration(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for TrainerTipUpsellConfiguration()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for TrainerTipUpsellConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TrainerTipUpsellConfiguration(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
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

uint64_t assignWithTake for TrainerTipUpsellConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for TrainerTipUpsellConfiguration(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 41))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TrainerTipUpsellConfiguration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 40) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 41) = 1;
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
    *(_BYTE *)(result + 41) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for TrainerTipUpsellConfiguration()
{
  return &type metadata for TrainerTipUpsellConfiguration;
}

double TrainerTipPlayerDismissedEvent.elapsedTime.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

double TrainerTipPlayerDismissedEvent.duration.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 8);
}

uint64_t TrainerTipPlayerDismissedEvent.isUpsellEnabled.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 16);
}

FitnessTrainerTips::TrainerTipPlayerDismissedEvent __swiftcall TrainerTipPlayerDismissedEvent.init(elapsedTime:duration:isUpsellEnabled:)(Swift::Double elapsedTime, Swift::Double duration, Swift::Bool isUpsellEnabled)
{
  uint64_t v3;
  FitnessTrainerTips::TrainerTipPlayerDismissedEvent result;

  *(Swift::Double *)v3 = elapsedTime;
  *(Swift::Double *)(v3 + 8) = duration;
  *(_BYTE *)(v3 + 16) = isUpsellEnabled;
  result.duration = duration;
  result.elapsedTime = elapsedTime;
  result.isUpsellEnabled = isUpsellEnabled;
  return result;
}

uint64_t sub_23C431FB8(char a1)
{
  return *(_QWORD *)&aElapsedtdurati[8 * a1];
}

uint64_t sub_23C431FD8()
{
  char *v0;

  return sub_23C431FB8(*v0);
}

uint64_t sub_23C431FE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C4325D8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C432004()
{
  sub_23C4321A0();
  return sub_23C4360EC();
}

uint64_t sub_23C43202C()
{
  sub_23C4321A0();
  return sub_23C4360F8();
}

uint64_t TrainerTipPlayerDismissedEvent.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;
  char v9;
  char v10;
  char v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9D0F0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C4321A0();
  sub_23C4360E0();
  v11 = 0;
  sub_23C43605C();
  if (!v1)
  {
    v10 = 1;
    sub_23C43605C();
    v9 = 2;
    sub_23C436050();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_23C4321A0()
{
  unint64_t result;

  result = qword_256B9D0F8;
  if (!qword_256B9D0F8)
  {
    result = MEMORY[0x24261EBAC](&unk_23C436D44, &type metadata for TrainerTipPlayerDismissedEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9D0F8);
  }
  return result;
}

uint64_t TrainerTipPlayerDismissedEvent.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;
  char v17;
  char v18;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9D100);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C4321A0();
  sub_23C4360D4();
  if (!v2)
  {
    v18 = 0;
    sub_23C436020();
    v10 = v9;
    v17 = 1;
    sub_23C436020();
    v13 = v12;
    v16 = 2;
    v14 = sub_23C436014();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *(_QWORD *)a2 = v10;
    *(_QWORD *)(a2 + 8) = v13;
    *(_BYTE *)(a2 + 16) = v14 & 1;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_23C432364@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return TrainerTipPlayerDismissedEvent.init(from:)(a1, a2);
}

uint64_t sub_23C432378(_QWORD *a1)
{
  return TrainerTipPlayerDismissedEvent.encode(to:)(a1);
}

uint64_t getEnumTagSinglePayload for TrainerTipPlayerDismissedEvent(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 16);
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for TrainerTipPlayerDismissedEvent(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(_BYTE *)(result + 16) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for TrainerTipPlayerDismissedEvent()
{
  return &type metadata for TrainerTipPlayerDismissedEvent;
}

uint64_t storeEnumTagSinglePayload for TrainerTipPlayerDismissedEvent.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C432480 + 4 * byte_23C436BF5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23C4324B4 + 4 * asc_23C436BF0[v4]))();
}

uint64_t sub_23C4324B4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C4324BC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C4324C4);
  return result;
}

uint64_t sub_23C4324D0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C4324D8);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23C4324DC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C4324E4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TrainerTipPlayerDismissedEvent.CodingKeys()
{
  return &type metadata for TrainerTipPlayerDismissedEvent.CodingKeys;
}

unint64_t sub_23C432504()
{
  unint64_t result;

  result = qword_256B9D108;
  if (!qword_256B9D108)
  {
    result = MEMORY[0x24261EBAC](&unk_23C436D1C, &type metadata for TrainerTipPlayerDismissedEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9D108);
  }
  return result;
}

unint64_t sub_23C43254C()
{
  unint64_t result;

  result = qword_256B9D110;
  if (!qword_256B9D110)
  {
    result = MEMORY[0x24261EBAC](&unk_23C436C8C, &type metadata for TrainerTipPlayerDismissedEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9D110);
  }
  return result;
}

unint64_t sub_23C432594()
{
  unint64_t result;

  result = qword_256B9D118;
  if (!qword_256B9D118)
  {
    result = MEMORY[0x24261EBAC](&unk_23C436CB4, &type metadata for TrainerTipPlayerDismissedEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9D118);
  }
  return result;
}

uint64_t sub_23C4325D8(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x5464657370616C65 && a2 == 0xEB00000000656D69;
  if (v3 || (sub_23C436074() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E6F697461727564 && a2 == 0xE800000000000000 || (sub_23C436074() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6C6C657370557369 && a2 == 0xEF64656C62616E45)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_23C436074();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_23C432744()
{
  uint64_t v0;

  v0 = sub_23C435F30();
  __swift_allocate_value_buffer(v0, qword_256B9EE78);
  __swift_project_value_buffer(v0, (uint64_t)qword_256B9EE78);
  return sub_23C435F24();
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t TrainerTipUpsellMonitorFeature.environment.getter@<X0>(_OWORD *a1@<X8>)
{
  _OWORD *v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _OWORD v10[2];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v3 = v1[5];
  v13 = v1[4];
  v2 = v13;
  v14 = v3;
  v5 = v1[7];
  v15 = v1[6];
  v4 = v15;
  v16 = v5;
  v6 = v1[1];
  v10[0] = *v1;
  v10[1] = v6;
  v8 = v1[3];
  v11 = v1[2];
  v7 = v11;
  v12 = v8;
  *a1 = v10[0];
  a1[1] = v6;
  a1[2] = v7;
  a1[3] = v8;
  a1[4] = v2;
  a1[5] = v3;
  a1[6] = v4;
  a1[7] = v5;
  return sub_23C4345CC((uint64_t)v10);
}

__n128 TrainerTipUpsellMonitorFeature.init(environment:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;

  v2 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(a2 + 80) = v2;
  v3 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(a2 + 112) = v3;
  v4 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v4;
  result = *(__n128 *)(a1 + 32);
  v6 = *(_OWORD *)(a1 + 48);
  *(__n128 *)(a2 + 32) = result;
  *(_OWORD *)(a2 + 48) = v6;
  return result;
}

uint64_t TrainerTipUpsellMonitorFeature.reduce(localState:sharedState:sideEffects:action:)(_BYTE *a1, uint64_t a2, unint64_t *a3, uint64_t *a4)
{
  __int128 *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t result;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  int *v26;
  _BYTE *v27;
  _BYTE *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _OWORD *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  int *v43;
  _BYTE *v44;
  _BYTE *v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _OWORD *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  unint64_t v56;
  char v57;
  int *v58;
  _BYTE *v59;
  _BYTE *v60;
  _QWORD *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  unint64_t v71;
  _BYTE v72[15];
  char v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9D120);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v12 = &v72[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = &v72[-v14];
  result = MEMORY[0x24BDAC7A8](v13);
  v18 = &v72[-v17];
  v19 = *a4;
  v20 = a4[1];
  v21 = *((unsigned __int8 *)a4 + 16);
  v22 = v4[5];
  v78 = v4[4];
  v79 = v22;
  v23 = v4[7];
  v80 = v4[6];
  v81 = v23;
  v24 = v4[1];
  v74 = *v4;
  v75 = v24;
  v25 = v4[3];
  v76 = v4[2];
  v77 = v25;
  if (v21 == 2)
  {
    v43 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_256B9D128);
    v44 = &v12[v43[16]];
    v45 = &v12[v43[20]];
    v46 = &v12[v43[24]];
    v73 = 1;
    sub_23C432E3C();
    sub_23C435FC0();
    sub_23C435F90();
    v47 = *MEMORY[0x24BE2B580];
    v48 = sub_23C435F54();
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v48 - 8) + 104))(v44, v47, v48);
    v49 = *MEMORY[0x24BE2B558];
    v50 = sub_23C435F48();
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 104))(v45, v49, v50);
    v51 = (_OWORD *)swift_allocObject();
    v52 = v79;
    v51[5] = v78;
    v51[6] = v52;
    v53 = v81;
    v51[7] = v80;
    v51[8] = v53;
    v54 = v75;
    v51[1] = v74;
    v51[2] = v54;
    v55 = v77;
    v51[3] = v76;
    v51[4] = v55;
    *v46 = &unk_256B9D140;
    v46[1] = v51;
    (*(void (**)(_BYTE *, _QWORD, uint64_t))(v9 + 104))(v12, *MEMORY[0x24BE2B438], v8);
    v39 = *a3;
    sub_23C4345CC((uint64_t)&v74);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v39 = sub_23C4348DC(0, *(_QWORD *)(v39 + 16) + 1, 1, v39);
    v41 = *(_QWORD *)(v39 + 16);
    v56 = *(_QWORD *)(v39 + 24);
    v42 = v41 + 1;
    if (v41 >= v56 >> 1)
      v39 = sub_23C4348DC(v56 > 1, v41 + 1, 1, v39);
    v18 = v12;
  }
  else if (v21 == 3)
  {
    if ((*a1 & 1) != 0)
      return result;
    *a1 = 1;
    v26 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_256B9D128);
    v27 = &v18[v26[16]];
    v28 = &v18[v26[20]];
    v29 = &v18[v26[24]];
    v73 = 0;
    sub_23C432E3C();
    sub_23C435FC0();
    sub_23C435F90();
    v30 = *MEMORY[0x24BE2B580];
    v31 = sub_23C435F54();
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 104))(v27, v30, v31);
    v32 = *MEMORY[0x24BE2B550];
    v33 = sub_23C435F48();
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 104))(v28, v32, v33);
    v34 = (_OWORD *)swift_allocObject();
    v35 = v79;
    v34[5] = v78;
    v34[6] = v35;
    v36 = v81;
    v34[7] = v80;
    v34[8] = v36;
    v37 = v75;
    v34[1] = v74;
    v34[2] = v37;
    v38 = v77;
    v34[3] = v76;
    v34[4] = v38;
    *v29 = &unk_256B9D160;
    v29[1] = v34;
    (*(void (**)(_BYTE *, _QWORD, uint64_t))(v9 + 104))(v18, *MEMORY[0x24BE2B438], v8);
    v39 = *a3;
    sub_23C4345CC((uint64_t)&v74);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v39 = sub_23C4348DC(0, *(_QWORD *)(v39 + 16) + 1, 1, v39);
    v41 = *(_QWORD *)(v39 + 16);
    v40 = *(_QWORD *)(v39 + 24);
    v42 = v41 + 1;
    if (v41 >= v40 >> 1)
      v39 = sub_23C4348DC(v40 > 1, v41 + 1, 1, v39);
  }
  else
  {
    v57 = v21 & 1;
    v58 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_256B9D128);
    v59 = &v15[v58[16]];
    v60 = &v15[v58[20]];
    v61 = &v15[v58[24]];
    v73 = 2;
    sub_23C432E3C();
    sub_23C435FC0();
    sub_23C435F90();
    v62 = *MEMORY[0x24BE2B580];
    v63 = sub_23C435F54();
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v63 - 8) + 104))(v59, v62, v63);
    v64 = *MEMORY[0x24BE2B558];
    v65 = sub_23C435F48();
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v65 - 8) + 104))(v60, v64, v65);
    v66 = swift_allocObject();
    v67 = v79;
    *(_OWORD *)(v66 + 80) = v78;
    *(_OWORD *)(v66 + 96) = v67;
    v68 = v81;
    *(_OWORD *)(v66 + 112) = v80;
    *(_OWORD *)(v66 + 128) = v68;
    v69 = v75;
    *(_OWORD *)(v66 + 16) = v74;
    *(_OWORD *)(v66 + 32) = v69;
    v70 = v77;
    *(_OWORD *)(v66 + 48) = v76;
    *(_OWORD *)(v66 + 64) = v70;
    *(_QWORD *)(v66 + 144) = v19;
    *(_QWORD *)(v66 + 152) = v20;
    *(_BYTE *)(v66 + 160) = v57;
    *v61 = &unk_256B9D150;
    v61[1] = v66;
    (*(void (**)(_BYTE *, _QWORD, uint64_t))(v9 + 104))(v15, *MEMORY[0x24BE2B438], v8);
    v39 = *a3;
    sub_23C4345CC((uint64_t)&v74);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v39 = sub_23C4348DC(0, *(_QWORD *)(v39 + 16) + 1, 1, v39);
    v41 = *(_QWORD *)(v39 + 16);
    v71 = *(_QWORD *)(v39 + 24);
    v42 = v41 + 1;
    if (v41 >= v71 >> 1)
      v39 = sub_23C4348DC(v71 > 1, v41 + 1, 1, v39);
    v18 = v15;
  }
  *(_QWORD *)(v39 + 16) = v42;
  result = (*(uint64_t (**)(unint64_t, _BYTE *, uint64_t))(v9 + 32))(v39+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(_QWORD *)(v9 + 72) * v41, v18, v8);
  *a3 = v39;
  return result;
}

unint64_t sub_23C432E3C()
{
  unint64_t result;

  result = qword_256B9D130;
  if (!qword_256B9D130)
  {
    result = MEMORY[0x24261EBAC](&unk_23C436EA8, &type metadata for TrainerTipUpsellMonitorFeature.TaskIdentifier);
    atomic_store(result, &qword_256B9D130);
  }
  return result;
}

uint64_t sub_23C432E80(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v4;
  uint64_t (*v6)(_QWORD *);

  v2[18] = a1;
  v2[19] = sub_23C435F84();
  v2[20] = sub_23C435F78();
  v6 = (uint64_t (*)(_QWORD *))(**(int **)(a2 + 80) + *(_QWORD *)(a2 + 80));
  v4 = (_QWORD *)swift_task_alloc();
  v2[21] = v4;
  *v4 = v2;
  v4[1] = sub_23C432F08;
  return v6(v2 + 7);
}

uint64_t sub_23C432F08()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v1;
  *(_QWORD *)(*v1 + 176) = v0;
  swift_task_dealloc();
  *(_QWORD *)(v2 + 184) = sub_23C435F60();
  *(_QWORD *)(v2 + 192) = v3;
  return swift_task_switch();
}

uint64_t sub_23C432F94()
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
  sub_23C435F9C();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
  v0[25] = sub_23C435F78();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v0[5]);
  v5 = (_QWORD *)swift_task_alloc();
  v0[26] = (uint64_t)v5;
  *v5 = v0;
  v5[1] = sub_23C4330F4;
  return sub_23C435F6C();
}

uint64_t sub_23C4330F4()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_23C433148()
{
  uint64_t v0;
  int v1;
  _QWORD *v3;

  v1 = *(unsigned __int8 *)(v0 + 112);
  if (v1 == 2)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    *(_OWORD *)(v0 + 120) = *(_OWORD *)(v0 + 96);
    *(_BYTE *)(v0 + 136) = v1 & 1;
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 216) = v3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B9D190);
    *v3 = v0;
    v3[1] = sub_23C433204;
    return sub_23C435F3C();
  }
}

uint64_t sub_23C433204()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23C433250()
{
  uint64_t *v0;
  _QWORD *v1;

  v0[25] = sub_23C435F78();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v0[5]);
  v1 = (_QWORD *)swift_task_alloc();
  v0[26] = (uint64_t)v1;
  *v1 = v0;
  v1[1] = sub_23C4330F4;
  return sub_23C435F6C();
}

uint64_t sub_23C4332F4()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C433328(uint64_t a1, _OWORD *a2, char a3, double a4, double a5)
{
  uint64_t v5;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _QWORD *v14;

  *(_QWORD *)(v5 + 192) = a1;
  *(_QWORD *)(v5 + 200) = sub_23C435F84();
  *(_QWORD *)(v5 + 208) = sub_23C435F78();
  v10 = a2[5];
  *(_OWORD *)(v5 + 80) = a2[4];
  *(_OWORD *)(v5 + 96) = v10;
  v11 = a2[7];
  *(_OWORD *)(v5 + 112) = a2[6];
  *(_OWORD *)(v5 + 128) = v11;
  v12 = a2[1];
  *(_OWORD *)(v5 + 16) = *a2;
  *(_OWORD *)(v5 + 32) = v12;
  v13 = a2[3];
  *(_OWORD *)(v5 + 48) = a2[2];
  *(_OWORD *)(v5 + 64) = v13;
  *(double *)(v5 + 144) = a4;
  *(double *)(v5 + 152) = a5;
  *(_BYTE *)(v5 + 160) = a3;
  v14 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 216) = v14;
  *v14 = v5;
  v14[1] = sub_23C4333E4;
  return sub_23C4335F8((__int128 *)(v5 + 144));
}

uint64_t sub_23C4333E4(char a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  *(_QWORD *)(*v2 + 224) = v1;
  swift_task_dealloc();
  if (v1)
  {
    sub_23C435F60();
  }
  else
  {
    *(_BYTE *)(v4 + 161) = a1 & 1;
    *(_QWORD *)(v4 + 232) = sub_23C435F60();
    *(_QWORD *)(v4 + 240) = v5;
  }
  return swift_task_switch();
}

uint64_t sub_23C433494()
{
  uint64_t v0;
  _QWORD *v1;

  if (*(_BYTE *)(v0 + 161) == 1)
  {
    *(_QWORD *)(v0 + 168) = 0;
    *(_QWORD *)(v0 + 176) = 0;
    *(_BYTE *)(v0 + 184) = 2;
    v1 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 248) = v1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B9D190);
    *v1 = v0;
    v1[1] = sub_23C433544;
    return sub_23C435F3C();
  }
  else
  {
    swift_release();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23C433544()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23C433590()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C4335C4()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C4335F8(__int128 *a1)
{
  __int128 *v1;
  uint64_t v2;
  __int128 v3;
  __int128 v4;
  int *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _QWORD *v9;
  uint64_t (*v11)(void);

  *(_QWORD *)(v2 + 304) = v1;
  v3 = *a1;
  *(_BYTE *)(v2 + 233) = *((_BYTE *)a1 + 16);
  v4 = *v1;
  *(_OWORD *)(v2 + 312) = v3;
  *(_OWORD *)(v2 + 328) = v4;
  v5 = (int *)*((_QWORD *)v1 + 4);
  *(_QWORD *)(v2 + 344) = v5;
  v6 = *(__int128 *)((char *)v1 + 56);
  *(_OWORD *)(v2 + 352) = *(__int128 *)((char *)v1 + 40);
  *(_OWORD *)(v2 + 368) = v6;
  *(_QWORD *)(v2 + 384) = *((_QWORD *)v1 + 9);
  v7 = v1[5];
  v8 = v1[7];
  *(_OWORD *)(v2 + 160) = v1[6];
  *(_OWORD *)(v2 + 176) = v8;
  *(_OWORD *)(v2 + 144) = v7;
  v11 = (uint64_t (*)(void))((char *)v5 + *v5);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 392) = v9;
  *v9 = v2;
  v9[1] = sub_23C43369C;
  return v11();
}

uint64_t sub_23C43369C(char a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = *v2;
  swift_task_dealloc();
  if (v1)
    return (*(uint64_t (**)(_QWORD))(v5 + 8))(0);
  *(_BYTE *)(v4 + 234) = a1 & 1;
  return swift_task_switch();
}

uint64_t sub_23C433720()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  const char *v7;
  uint64_t v8;
  uint64_t (*v9)(void);

  if (*(_BYTE *)(v0 + 234) != 1)
  {
    if (qword_256B9CF70 != -1)
      swift_once();
    v3 = sub_23C435F30();
    __swift_project_value_buffer(v3, (uint64_t)qword_256B9EE78);
    v4 = sub_23C435F18();
    v5 = sub_23C435FA8();
    if (!os_log_type_enabled(v4, v5))
      goto LABEL_13;
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    v7 = "[TrainerTipUpsellMonitorFeature] Platform does not support tips upsell, skipping upsell";
    goto LABEL_12;
  }
  if (*(_BYTE *)(v0 + 233) == 1)
  {
    v9 = (uint64_t (*)(void))(**(int **)(v0 + 328) + *(_QWORD *)(v0 + 328));
    v1 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 400) = v1;
    *v1 = v0;
    v1[1] = sub_23C4338EC;
    return v9();
  }
  if (qword_256B9CF70 != -1)
    swift_once();
  v8 = sub_23C435F30();
  __swift_project_value_buffer(v8, (uint64_t)qword_256B9EE78);
  v4 = sub_23C435F18();
  v5 = sub_23C435FA8();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    v7 = "[TrainerTipUpsellMonitorFeature] Options do not contain upsell, skipping upsell";
LABEL_12:
    _os_log_impl(&dword_23C42E000, v4, v5, v7, v6, 2u);
    MEMORY[0x24261EC00](v6, -1, -1);
  }
LABEL_13:

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_23C4338EC(char a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = *v2;
  swift_task_dealloc();
  if (v1)
    return (*(uint64_t (**)(_QWORD))(v5 + 8))(0);
  *(_BYTE *)(v4 + 235) = a1 & 1;
  return swift_task_switch();
}

uint64_t sub_23C433970()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  _QWORD *v6;
  uint64_t (*v7)(uint64_t);

  if ((*(_BYTE *)(v0 + 235) & 1) != 0)
  {
    if (qword_256B9CF70 != -1)
      swift_once();
    v1 = sub_23C435F30();
    __swift_project_value_buffer(v1, (uint64_t)qword_256B9EE78);
    v2 = sub_23C435F18();
    v3 = sub_23C435FA8();
    if (os_log_type_enabled(v2, v3))
    {
      v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_23C42E000, v2, v3, "[TrainerTipUpsellMonitorFeature] forcing tips upsell with user default, requesting upsell", v4, 2u);
      MEMORY[0x24261EC00](v4, -1, -1);
    }

    return (*(uint64_t (**)(uint64_t))(v0 + 8))(1);
  }
  else
  {
    v7 = (uint64_t (*)(uint64_t))(**(int **)(v0 + 376) + *(_QWORD *)(v0 + 376));
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 408) = v6;
    *v6 = v0;
    v6[1] = sub_23C433AB0;
    return v7(v0 + 192);
  }
}

uint64_t sub_23C433AB0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 416) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23C433B14()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  _QWORD *v7;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD *v18;
  uint64_t (*v19)(void);

  v1 = *(_QWORD *)(v0 + 192);
  *(_QWORD *)(v0 + 424) = v1;
  v2 = *(unsigned __int8 *)(v0 + 200);
  v4 = *(_QWORD *)(v0 + 208);
  v3 = *(_QWORD *)(v0 + 216);
  *(_QWORD *)(v0 + 432) = v4;
  *(_QWORD *)(v0 + 440) = v3;
  v5 = *(_QWORD *)(v0 + 224);
  *(_QWORD *)(v0 + 448) = v5;
  v6 = *(unsigned __int8 *)(v0 + 232);
  *(_BYTE *)(v0 + 236) = v6;
  if (v2 == 1)
  {
    if (v6)
    {
      v19 = (uint64_t (*)(void))(**(int **)(v0 + 360) + *(_QWORD *)(v0 + 360));
      v7 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 456) = v7;
      *v7 = v0;
      v7[1] = sub_23C433D00;
      return v19();
    }
    else
    {
      v13 = *(_QWORD *)(v0 + 304);
      v14 = *(_OWORD *)(v0 + 344);
      *(_OWORD *)(v0 + 16) = *(_OWORD *)(v0 + 328);
      v15 = *(_OWORD *)(v0 + 360);
      v16 = *(_OWORD *)(v0 + 376);
      *(_OWORD *)(v0 + 32) = *(_OWORD *)(v13 + 16);
      *(_OWORD *)(v0 + 48) = v14;
      *(_OWORD *)(v0 + 64) = v15;
      *(_OWORD *)(v0 + 80) = v16;
      v17 = *(_OWORD *)(v0 + 160);
      *(_OWORD *)(v0 + 96) = *(_OWORD *)(v0 + 144);
      *(_OWORD *)(v0 + 112) = v17;
      *(_OWORD *)(v0 + 128) = *(_OWORD *)(v0 + 176);
      *(_QWORD *)(v0 + 240) = v1;
      *(_BYTE *)(v0 + 248) = 1;
      *(_QWORD *)(v0 + 256) = v4;
      *(_QWORD *)(v0 + 264) = v3;
      *(_QWORD *)(v0 + 272) = v5;
      *(_BYTE *)(v0 + 280) = 0;
      v18 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 472) = v18;
      *v18 = v0;
      v18[1] = sub_23C433F40;
      return sub_23C434668((_QWORD *)(v0 + 240));
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    if (qword_256B9CF70 != -1)
      swift_once();
    v9 = sub_23C435F30();
    __swift_project_value_buffer(v9, (uint64_t)qword_256B9EE78);
    v10 = sub_23C435F18();
    v11 = sub_23C435FA8();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_23C42E000, v10, v11, "[TrainerTipUpsellMonitorFeature] native rules not enabled, requesting upsell", v12, 2u);
      MEMORY[0x24261EC00](v12, -1, -1);
    }

    return (*(uint64_t (**)(uint64_t))(v0 + 8))(1);
  }
}

uint64_t sub_23C433D00(char a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 464) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_BYTE *)(v4 + 237) = a1;
  return swift_task_switch();
}

uint64_t sub_23C433D74()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD *v16;

  if (*(_BYTE *)(v0 + 237) == 1)
  {
    swift_bridgeObjectRelease();
    if (qword_256B9CF70 != -1)
      swift_once();
    v1 = sub_23C435F30();
    __swift_project_value_buffer(v1, (uint64_t)qword_256B9EE78);
    v2 = sub_23C435F18();
    v3 = sub_23C435FA8();
    if (os_log_type_enabled(v2, v3))
    {
      v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_23C42E000, v2, v3, "[TrainerTipUpsellMonitorFeature] subscription status not allowed, not requesting upsell", v4, 2u);
      MEMORY[0x24261EC00](v4, -1, -1);
    }

    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  }
  else
  {
    v6 = *(_BYTE *)(v0 + 236);
    v7 = *(_QWORD *)(v0 + 448);
    v9 = *(_QWORD *)(v0 + 432);
    v8 = *(_QWORD *)(v0 + 440);
    v10 = *(_QWORD *)(v0 + 424);
    v11 = *(_QWORD *)(v0 + 304);
    v12 = *(_OWORD *)(v0 + 344);
    *(_OWORD *)(v0 + 16) = *(_OWORD *)(v0 + 328);
    v13 = *(_OWORD *)(v0 + 360);
    v14 = *(_OWORD *)(v0 + 376);
    *(_OWORD *)(v0 + 32) = *(_OWORD *)(v11 + 16);
    *(_OWORD *)(v0 + 48) = v12;
    *(_OWORD *)(v0 + 64) = v13;
    *(_OWORD *)(v0 + 80) = v14;
    v15 = *(_OWORD *)(v0 + 160);
    *(_OWORD *)(v0 + 96) = *(_OWORD *)(v0 + 144);
    *(_OWORD *)(v0 + 112) = v15;
    *(_OWORD *)(v0 + 128) = *(_OWORD *)(v0 + 176);
    *(_QWORD *)(v0 + 240) = v10;
    *(_BYTE *)(v0 + 248) = 1;
    *(_QWORD *)(v0 + 256) = v9;
    *(_QWORD *)(v0 + 264) = v8;
    *(_QWORD *)(v0 + 272) = v7;
    *(_BYTE *)(v0 + 280) = v6;
    v16 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 472) = v16;
    *v16 = v0;
    v16[1] = sub_23C433F40;
    return sub_23C434668((_QWORD *)(v0 + 240));
  }
}

uint64_t sub_23C433F08()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_23C433F40(char a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 480) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_BYTE *)(v4 + 238) = a1 & 1;
  return swift_task_switch();
}

uint64_t sub_23C433FB8()
{
  uint64_t v0;
  int v1;
  double v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  os_log_type_t v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint32_t v14;
  uint64_t v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;

  v1 = *(unsigned __int8 *)(v0 + 238);
  swift_bridgeObjectRelease();
  if (v1 == 1)
  {
    v2 = *(double *)(v0 + 320);
    if (v2 > 0.0 && *(double *)(v0 + 448) <= *(double *)(v0 + 312) / v2)
    {
      if (qword_256B9CF70 != -1)
        swift_once();
      v3 = sub_23C435F30();
      __swift_project_value_buffer(v3, (uint64_t)qword_256B9EE78);
      v4 = sub_23C435F18();
      v5 = sub_23C435FA8();
      if (!os_log_type_enabled(v4, v5))
      {
        v7 = 1;
        goto LABEL_20;
      }
      v6 = swift_slowAlloc();
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_23C42E000, v4, v5, "[TrainerTipUpsellMonitorFeature] all checks passed, requesting upsell", (uint8_t *)v6, 2u);
      v7 = 1;
      goto LABEL_17;
    }
    if (qword_256B9CF70 != -1)
      swift_once();
    v15 = sub_23C435F30();
    __swift_project_value_buffer(v15, (uint64_t)qword_256B9EE78);
    v4 = sub_23C435F18();
    v16 = sub_23C435FA8();
    if (os_log_type_enabled(v4, v16))
    {
      v18 = *(_QWORD *)(v0 + 312);
      v17 = *(_QWORD *)(v0 + 320);
      v6 = swift_slowAlloc();
      *(_DWORD *)v6 = 134218240;
      *(_QWORD *)(v0 + 288) = v18;
      sub_23C435FB4();
      *(_WORD *)(v6 + 12) = 2048;
      *(_QWORD *)(v0 + 296) = v17;
      sub_23C435FB4();
      v10 = "[TrainerTipUpsellMonitorFeature] minimum ratio complete not reached, not requesting upsell - elapsedTime = %"
            "f, duration = %f";
      v11 = v4;
      v12 = v16;
      v13 = (uint8_t *)v6;
      v14 = 22;
      goto LABEL_16;
    }
LABEL_18:
    v7 = 0;
    goto LABEL_20;
  }
  if (qword_256B9CF70 != -1)
    swift_once();
  v8 = sub_23C435F30();
  __swift_project_value_buffer(v8, (uint64_t)qword_256B9EE78);
  v4 = sub_23C435F18();
  v9 = sub_23C435FA8();
  if (!os_log_type_enabled(v4, v9))
    goto LABEL_18;
  v6 = swift_slowAlloc();
  *(_WORD *)v6 = 0;
  v10 = "[TrainerTipUpsellMonitorFeature] interval not expired, not requesting upsell";
  v11 = v4;
  v12 = v9;
  v13 = (uint8_t *)v6;
  v14 = 2;
LABEL_16:
  _os_log_impl(&dword_23C42E000, v11, v12, v10, v13, v14);
  v7 = 0;
LABEL_17:
  MEMORY[0x24261EC00](v6, -1, -1);
LABEL_20:

  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v7);
}

uint64_t sub_23C434270()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_23C434280()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_23C4342B8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  int *v5;
  _QWORD *v6;
  uint64_t (*v8)(void);

  v4 = sub_23C435F0C();
  *(_QWORD *)(v2 + 16) = v4;
  *(_QWORD *)(v2 + 24) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v2 + 32) = swift_task_alloc();
  *(_QWORD *)(v2 + 40) = sub_23C435F84();
  *(_QWORD *)(v2 + 48) = sub_23C435F78();
  v5 = *(int **)(a2 + 96);
  *(_OWORD *)(v2 + 56) = *(_OWORD *)(a2 + 112);
  v8 = (uint64_t (*)(void))((char *)v5 + *v5);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 72) = v6;
  *v6 = v2;
  v6[1] = sub_23C43435C;
  return v8();
}

uint64_t sub_23C43435C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v1;
  *(_QWORD *)(*v1 + 80) = v0;
  swift_task_dealloc();
  *(_QWORD *)(v2 + 88) = sub_23C435F60();
  *(_QWORD *)(v2 + 96) = v3;
  return swift_task_switch();
}

uint64_t sub_23C4343E8()
{
  _QWORD *v0;
  int *v1;
  _QWORD *v2;
  uint64_t (*v4)(_QWORD);

  v1 = (int *)v0[7];
  sub_23C435F00();
  v4 = (uint64_t (*)(_QWORD))((char *)v1 + *v1);
  v2 = (_QWORD *)swift_task_alloc();
  v0[13] = v2;
  *v2 = v0;
  v2[1] = sub_23C434450;
  return v4(v0[4]);
}

uint64_t sub_23C434450()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (_QWORD *)*v1;
  swift_task_dealloc();
  v4 = v2[3];
  v3 = v2[4];
  v5 = v2[2];
  if (v0)
  {
    MEMORY[0x24261EB7C](v0);
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v4 + 8))(v2[4], v2[2]);
  }
  return swift_task_switch();
}

uint64_t sub_23C4344F0()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C434530()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C434570()
{
  return objectdestroyTm();
}

uint64_t sub_23C434578(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23C435418;
  return sub_23C4342B8(a1, v1 + 16);
}

uint64_t sub_23C4345CC(uint64_t a1)
{
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_23C434668(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t);

  __swift_instantiateConcreteTypeFromMangledName(&qword_256B9D1A8);
  v4 = swift_task_alloc();
  v2[2] = v4;
  v5 = sub_23C435F0C();
  v2[3] = v5;
  v2[4] = *(_QWORD *)(v5 - 8);
  v2[5] = swift_task_alloc();
  v2[6] = swift_task_alloc();
  v2[7] = *a1;
  v8 = (uint64_t (*)(uint64_t))(**(int **)(v1 + 16) + *(_QWORD *)(v1 + 16));
  v6 = (_QWORD *)swift_task_alloc();
  v2[8] = v6;
  *v6 = v2;
  v6[1] = sub_23C43473C;
  return v8(v4);
}

uint64_t sub_23C43473C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23C4347A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BOOL8 v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  void (*v10)(uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 16);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_23C4352B4(v3);
    v4 = 1;
  }
  else
  {
    v5 = *(double *)(v0 + 56);
    v7 = *(_QWORD *)(v0 + 40);
    v6 = *(_QWORD *)(v0 + 48);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v6, v3, v1);
    sub_23C435F00();
    sub_23C435EF4();
    v9 = v8;
    v10 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
    v10(v7, v1);
    v10(v6, v1);
    v4 = v5 < v9;
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_BOOL8))(v0 + 8))(v4);
}

uint64_t sub_23C434890()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_23C4348DC(char a1, int64_t a2, char a3, unint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  BOOL v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B9D1B0);
  v10 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256B9D120) - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_23C435FE4();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256B9D120) - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (unint64_t)v13 + v17;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(_QWORD *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_23C4352F4(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_23C434AEC()
{
  return objectdestroyTm();
}

uint64_t sub_23C434AF4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _OWORD *v4;
  double v5;
  double v6;
  char v7;
  _QWORD *v8;

  v4 = (_OWORD *)(v1 + 16);
  v5 = *(double *)(v1 + 144);
  v6 = *(double *)(v1 + 152);
  v7 = *(_BYTE *)(v1 + 160);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_23C434B6C;
  return sub_23C433328(a1, v4, v7, v5, v6);
}

uint64_t sub_23C434B6C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23C434BB4()
{
  return objectdestroyTm();
}

uint64_t objectdestroyTm()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23C434C24(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23C435418;
  return sub_23C432E80(a1, v1 + 16);
}

unint64_t sub_23C434C7C()
{
  unint64_t result;

  result = qword_256B9D168;
  if (!qword_256B9D168)
  {
    result = MEMORY[0x24261EBAC](&protocol conformance descriptor for TrainerTipUpsellMonitorAction, &type metadata for TrainerTipUpsellMonitorAction);
    atomic_store(result, (unint64_t *)&qword_256B9D168);
  }
  return result;
}

unint64_t sub_23C434CC4()
{
  unint64_t result;

  result = qword_256B9D170;
  if (!qword_256B9D170)
  {
    result = MEMORY[0x24261EBAC](&protocol conformance descriptor for TrainerTipUpsellMonitorAction, &type metadata for TrainerTipUpsellMonitorAction);
    atomic_store(result, (unint64_t *)&qword_256B9D170);
  }
  return result;
}

unint64_t sub_23C434D0C()
{
  unint64_t result;

  result = qword_256B9D178;
  if (!qword_256B9D178)
  {
    result = MEMORY[0x24261EBAC](&protocol conformance descriptor for TrainerTipUpsellMonitorLocalState, &type metadata for TrainerTipUpsellMonitorLocalState);
    atomic_store(result, (unint64_t *)&qword_256B9D178);
  }
  return result;
}

unint64_t sub_23C434D54()
{
  unint64_t result;

  result = qword_256B9D180;
  if (!qword_256B9D180)
  {
    result = MEMORY[0x24261EBAC](MEMORY[0x24BE2B430], MEMORY[0x24BE2B428]);
    atomic_store(result, (unint64_t *)&qword_256B9D180);
  }
  return result;
}

uint64_t destroy for TrainerTipUpsellMonitorEnvironment()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for TrainerTipUpsellMonitorEnvironment(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  v3 = *(_QWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 120) = v3;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for TrainerTipUpsellMonitorEnvironment(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

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
  v8 = a2[9];
  a1[8] = a2[8];
  a1[9] = v8;
  swift_retain();
  swift_release();
  v9 = a2[11];
  a1[10] = a2[10];
  a1[11] = v9;
  swift_retain();
  swift_release();
  v10 = a2[13];
  a1[12] = a2[12];
  a1[13] = v10;
  swift_retain();
  swift_release();
  v11 = a2[15];
  a1[14] = a2[14];
  a1[15] = v11;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy128_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;
  __int128 v7;

  v2 = *a2;
  v3 = a2[1];
  v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  result = (__n128)a2[4];
  v6 = a2[5];
  v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 64) = result;
  *(_OWORD *)(a1 + 80) = v6;
  return result;
}

_OWORD *assignWithTake for TrainerTipUpsellMonitorEnvironment(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  a1[2] = a2[2];
  swift_release();
  a1[3] = a2[3];
  swift_release();
  a1[4] = a2[4];
  swift_release();
  a1[5] = a2[5];
  swift_release();
  a1[6] = a2[6];
  swift_release();
  a1[7] = a2[7];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for TrainerTipUpsellMonitorEnvironment(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 128))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TrainerTipUpsellMonitorEnvironment(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 128) = 1;
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
    *(_BYTE *)(result + 128) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for TrainerTipUpsellMonitorFeature()
{
  return &type metadata for TrainerTipUpsellMonitorFeature;
}

uint64_t storeEnumTagSinglePayload for TrainerTipUpsellMonitorFeature.TaskIdentifier(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C435188 + 4 * byte_23C436DD5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23C4351BC + 4 * byte_23C436DD0[v4]))();
}

uint64_t sub_23C4351BC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C4351C4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C4351CCLL);
  return result;
}

uint64_t sub_23C4351D8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C4351E0);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23C4351E4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C4351EC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TrainerTipUpsellMonitorFeature.TaskIdentifier()
{
  return &type metadata for TrainerTipUpsellMonitorFeature.TaskIdentifier;
}

unint64_t sub_23C43520C()
{
  unint64_t result;

  result = qword_256B9D188;
  if (!qword_256B9D188)
  {
    result = MEMORY[0x24261EBAC](&unk_23C436E80, &type metadata for TrainerTipUpsellMonitorFeature.TaskIdentifier);
    atomic_store(result, (unint64_t *)&qword_256B9D188);
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

uint64_t sub_23C4352B4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9D1A8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23C4352F4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v8 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256B9D120) - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = *(_QWORD *)(v8 + 72);
    v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
    v12 = v10 * v4;
    v13 = a3 + v12;
    v14 = v11 + v12;
    if (v11 >= v13 || v14 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  result = sub_23C435FF0();
  __break(1u);
  return result;
}

BOOL static TrainerTipUpsellMonitorError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t TrainerTipUpsellMonitorError.hash(into:)()
{
  return sub_23C4360BC();
}

uint64_t TrainerTipUpsellMonitorError.hashValue.getter()
{
  sub_23C4360B0();
  sub_23C4360BC();
  return sub_23C4360C8();
}

unint64_t sub_23C4354A0()
{
  unint64_t result;

  result = qword_256B9D1B8;
  if (!qword_256B9D1B8)
  {
    result = MEMORY[0x24261EBAC](&protocol conformance descriptor for TrainerTipUpsellMonitorError, &type metadata for TrainerTipUpsellMonitorError);
    atomic_store(result, (unint64_t *)&qword_256B9D1B8);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for TrainerTipUpsellMonitorError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C435540 + 4 * byte_23C436EF5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23C435574 + 4 * byte_23C436EF0[v4]))();
}

uint64_t sub_23C435574(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C43557C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C435584);
  return result;
}

uint64_t sub_23C435590(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C435598);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23C43559C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C4355A4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TrainerTipUpsellMonitorError()
{
  return &type metadata for TrainerTipUpsellMonitorError;
}

uint64_t TrainerTipUpsellMonitorLocalState.isActivated.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t TrainerTipUpsellMonitorLocalState.isActivated.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*TrainerTipUpsellMonitorLocalState.isActivated.modify())()
{
  return nullsub_1;
}

FitnessTrainerTips::TrainerTipUpsellMonitorLocalState __swiftcall TrainerTipUpsellMonitorLocalState.init(isActivated:)(FitnessTrainerTips::TrainerTipUpsellMonitorLocalState isActivated)
{
  FitnessTrainerTips::TrainerTipUpsellMonitorLocalState *v1;

  v1->isActivated = isActivated.isActivated;
  return isActivated;
}

uint64_t sub_23C4355EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C435CA4(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23C435614()
{
  sub_23C43574C();
  return sub_23C4360EC();
}

uint64_t sub_23C43563C()
{
  sub_23C43574C();
  return sub_23C4360F8();
}

uint64_t TrainerTipUpsellMonitorLocalState.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9D1C0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C43574C();
  sub_23C4360E0();
  sub_23C436050();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_23C43574C()
{
  unint64_t result;

  result = qword_256B9D1C8;
  if (!qword_256B9D1C8)
  {
    result = MEMORY[0x24261EBAC](&unk_23C437158, &type metadata for TrainerTipUpsellMonitorLocalState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9D1C8);
  }
  return result;
}

uint64_t TrainerTipUpsellMonitorLocalState.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v9;
  uint64_t v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9D1D0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C43574C();
  sub_23C4360D4();
  if (!v2)
  {
    v9 = sub_23C436014();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9 & 1;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_23C435898@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return TrainerTipUpsellMonitorLocalState.init(from:)(a1, a2);
}

uint64_t sub_23C4358AC(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9D1C0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C43574C();
  sub_23C4360E0();
  sub_23C436050();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

BOOL static TrainerTipUpsellMonitorLocalState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

BOOL sub_23C4359AC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t getEnumTagSinglePayload for TrainerTipUpsellMonitorLocalState(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for TrainerTipUpsellMonitorLocalState(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C435AB0 + 4 * byte_23C436FE5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C435AE4 + 4 * byte_23C436FE0[v4]))();
}

uint64_t sub_23C435AE4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C435AEC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C435AF4);
  return result;
}

uint64_t sub_23C435B00(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C435B08);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C435B0C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C435B14(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TrainerTipUpsellMonitorLocalState()
{
  return &type metadata for TrainerTipUpsellMonitorLocalState;
}

uint64_t storeEnumTagSinglePayload for TrainerTipUpsellMonitorLocalState.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23C435B70 + 4 * byte_23C436FEA[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23C435B90 + 4 * byte_23C436FEF[v4]))();
}

_BYTE *sub_23C435B70(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23C435B90(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C435B98(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C435BA0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C435BA8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C435BB0(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for TrainerTipUpsellMonitorLocalState.CodingKeys()
{
  return &type metadata for TrainerTipUpsellMonitorLocalState.CodingKeys;
}

unint64_t sub_23C435BD0()
{
  unint64_t result;

  result = qword_256B9D1D8;
  if (!qword_256B9D1D8)
  {
    result = MEMORY[0x24261EBAC](&unk_23C437130, &type metadata for TrainerTipUpsellMonitorLocalState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9D1D8);
  }
  return result;
}

unint64_t sub_23C435C18()
{
  unint64_t result;

  result = qword_256B9D1E0;
  if (!qword_256B9D1E0)
  {
    result = MEMORY[0x24261EBAC](&unk_23C4370A0, &type metadata for TrainerTipUpsellMonitorLocalState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9D1E0);
  }
  return result;
}

unint64_t sub_23C435C60()
{
  unint64_t result;

  result = qword_256B9D1E8;
  if (!qword_256B9D1E8)
  {
    result = MEMORY[0x24261EBAC](&unk_23C4370C8, &type metadata for TrainerTipUpsellMonitorLocalState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9D1E8);
  }
  return result;
}

uint64_t sub_23C435CA4(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x6176697463417369 && a2 == 0xEB00000000646574)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_23C436074();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23C435D38()
{
  return 0x6176697463417369;
}

uint64_t TrainerTipUpsellMonitorEnvironment.fetchForceTrainerTipUpsellEnabled.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_retain();
  return v1;
}

uint64_t TrainerTipUpsellMonitorEnvironment.fetchLastTrainerTipUpsellViewedDate.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_retain();
  return v1;
}

uint64_t TrainerTipUpsellMonitorEnvironment.fetchPlatformSupportsTrainerTipUpsell.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_retain();
  return v1;
}

uint64_t TrainerTipUpsellMonitorEnvironment.fetchSubscriptionStatus.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  swift_retain();
  return v1;
}

uint64_t TrainerTipUpsellMonitorEnvironment.fetchTrainerTipUpsellConfiguration.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 64);
  swift_retain();
  return v1;
}

uint64_t TrainerTipUpsellMonitorEnvironment.makeTrainerTipPlayerDismissedStream.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 80);
  swift_retain();
  return v1;
}

uint64_t TrainerTipUpsellMonitorEnvironment.presentTrainerTipUpsell.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 96);
  swift_retain();
  return v1;
}

uint64_t TrainerTipUpsellMonitorEnvironment.updateLastTrainerTipUpsellViewedDate.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 112);
  swift_retain();
  return v1;
}

__n128 TrainerTipUpsellMonitorEnvironment.init(fetchForceTrainerTipUpsellEnabled:fetchLastTrainerTipUpsellViewedDate:fetchPlatformSupportsTrainerTipUpsell:fetchSubscriptionStatus:fetchTrainerTipUpsellConfiguration:makeTrainerTipPlayerDismissedStream:presentTrainerTipUpsell:updateLastTrainerTipUpsellViewedDate:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, __int128 a10, __int128 a11, __n128 a12, uint64_t a13, uint64_t a14)
{
  __n128 result;

  result = a12;
  *(_QWORD *)a9 = a1;
  *(_QWORD *)(a9 + 8) = a2;
  *(_QWORD *)(a9 + 16) = a3;
  *(_QWORD *)(a9 + 24) = a4;
  *(_QWORD *)(a9 + 32) = a5;
  *(_QWORD *)(a9 + 40) = a6;
  *(_QWORD *)(a9 + 48) = a7;
  *(_QWORD *)(a9 + 56) = a8;
  *(_OWORD *)(a9 + 64) = a10;
  *(_OWORD *)(a9 + 80) = a11;
  *(__n128 *)(a9 + 96) = a12;
  *(_QWORD *)(a9 + 112) = a13;
  *(_QWORD *)(a9 + 120) = a14;
  return result;
}

ValueMetadata *type metadata accessor for TrainerTipUpsellMonitorEnvironment()
{
  return &type metadata for TrainerTipUpsellMonitorEnvironment;
}

uint64_t sub_23C435EF4()
{
  return MEMORY[0x24BDCE330]();
}

uint64_t sub_23C435F00()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_23C435F0C()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_23C435F18()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23C435F24()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_23C435F30()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23C435F3C()
{
  return MEMORY[0x24BE2B460]();
}

uint64_t sub_23C435F48()
{
  return MEMORY[0x24BE2B560]();
}

uint64_t sub_23C435F54()
{
  return MEMORY[0x24BE2B588]();
}

uint64_t sub_23C435F60()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_23C435F6C()
{
  return MEMORY[0x24BEE68D8]();
}

uint64_t sub_23C435F78()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_23C435F84()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_23C435F90()
{
  return MEMORY[0x24BEE6940]();
}

uint64_t sub_23C435F9C()
{
  return MEMORY[0x24BEE6C08]();
}

uint64_t sub_23C435FA8()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_23C435FB4()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23C435FC0()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_23C435FCC()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_23C435FD8()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_23C435FE4()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23C435FF0()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23C435FFC()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_23C436008()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_23C436014()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_23C436020()
{
  return MEMORY[0x24BEE3360]();
}

uint64_t sub_23C43602C()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_23C436038()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_23C436044()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_23C436050()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_23C43605C()
{
  return MEMORY[0x24BEE34B0]();
}

uint64_t sub_23C436068()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_23C436074()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23C436080()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_23C43608C()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_23C436098()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_23C4360A4()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_23C4360B0()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23C4360BC()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23C4360C8()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23C4360D4()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_23C4360E0()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23C4360EC()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23C4360F8()
{
  return MEMORY[0x24BEE4A10]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
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

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
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

