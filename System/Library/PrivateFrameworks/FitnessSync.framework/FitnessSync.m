void SyncMonitorLocalState.activationState.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

_BYTE *SyncMonitorLocalState.activationState.setter(_BYTE *result)
{
  _BYTE *v1;

  *v1 = *result;
  return result;
}

uint64_t (*SyncMonitorLocalState.activationState.modify())()
{
  return nullsub_1;
}

double SyncMonitorLocalState.syncInterval.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 8);
}

void SyncMonitorLocalState.syncInterval.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 8) = a1;
}

uint64_t (*SyncMonitorLocalState.syncInterval.modify())()
{
  return nullsub_1;
}

FitnessSync::SyncMonitorLocalState __swiftcall SyncMonitorLocalState.init(activationState:syncInterval:)(FitnessSync::SyncMonitorActivationState activationState, Swift::Double syncInterval)
{
  uint64_t v2;
  FitnessSync::SyncMonitorLocalState result;

  *(_BYTE *)v2 = *(_BYTE *)activationState;
  *(Swift::Double *)(v2 + 8) = syncInterval;
  result.syncInterval = syncInterval;
  result.activationState = activationState;
  return result;
}

uint64_t sub_23C425F48(char a1)
{
  if ((a1 & 1) != 0)
    return 0x65746E49636E7973;
  else
    return 0x6974617669746361;
}

BOOL sub_23C425F94(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_23C425FAC()
{
  sub_23C42BCA0();
  sub_23C42BCAC();
  return sub_23C42BCB8();
}

uint64_t sub_23C425FF0()
{
  return sub_23C42BCAC();
}

uint64_t sub_23C426018()
{
  sub_23C42BCA0();
  sub_23C42BCAC();
  return sub_23C42BCB8();
}

uint64_t sub_23C426058()
{
  char *v0;

  return sub_23C425F48(*v0);
}

uint64_t sub_23C426060@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C426860(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C426084()
{
  return 0;
}

void sub_23C426090(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_23C42609C()
{
  sub_23C42628C();
  return sub_23C42BCDC();
}

uint64_t sub_23C4260C4()
{
  sub_23C42628C();
  return sub_23C42BCE8();
}

uint64_t SyncMonitorLocalState.encode(to:)(_QWORD *a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  char v8;
  _BYTE v10[16];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9B238);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = &v10[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C42628C();
  sub_23C42BCD0();
  v10[15] = v8;
  v10[14] = 0;
  sub_23C4262D0();
  sub_23C42BC88();
  if (!v2)
  {
    v10[13] = 1;
    sub_23C42BC7C();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24261E828]((char *)a1 + (int)result, -(result >> 32), 0, 0);
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

unint64_t sub_23C42628C()
{
  unint64_t result;

  result = qword_256B9B240;
  if (!qword_256B9B240)
  {
    result = MEMORY[0x24261E834](&unk_23C42C00C, &type metadata for SyncMonitorLocalState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9B240);
  }
  return result;
}

unint64_t sub_23C4262D0()
{
  unint64_t result;

  result = qword_256B9B248;
  if (!qword_256B9B248)
  {
    result = MEMORY[0x24261E834](&protocol conformance descriptor for SyncMonitorActivationState, &type metadata for SyncMonitorActivationState);
    atomic_store(result, (unint64_t *)&qword_256B9B248);
  }
  return result;
}

uint64_t SyncMonitorLocalState.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE v13[16];

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9B250);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = &v13[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C42628C();
  sub_23C42BCC4();
  if (!v2)
  {
    v13[14] = 0;
    sub_23C4264A4();
    sub_23C42BC4C();
    v9 = v13[15];
    v13[13] = 1;
    sub_23C42BC40();
    v11 = v10;
    (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
    *(_BYTE *)a2 = v9;
    *(_QWORD *)(a2 + 8) = v11;
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

unint64_t sub_23C4264A4()
{
  unint64_t result;

  result = qword_256B9B258;
  if (!qword_256B9B258)
  {
    result = MEMORY[0x24261E834](&protocol conformance descriptor for SyncMonitorActivationState, &type metadata for SyncMonitorActivationState);
    atomic_store(result, (unint64_t *)&qword_256B9B258);
  }
  return result;
}

uint64_t sub_23C4264E8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return SyncMonitorLocalState.init(from:)(a1, a2);
}

uint64_t sub_23C4264FC(_QWORD *a1)
{
  return SyncMonitorLocalState.encode(to:)(a1);
}

BOOL static SyncMonitorLocalState.== infix(_:_:)(double *a1, double *a2)
{
  return *(unsigned __int8 *)a1 == *(unsigned __int8 *)a2 && a1[1] == a2[1];
}

BOOL sub_23C42653C(double *a1, double *a2)
{
  return *(unsigned __int8 *)a1 == *(unsigned __int8 *)a2 && a1[1] == a2[1];
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SyncMonitorLocalState(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && a1[16])
    return (*(_DWORD *)a1 + 255);
  v3 = *a1;
  v4 = v3 >= 2;
  v5 = v3 - 2;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SyncMonitorLocalState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for SyncMonitorLocalState()
{
  return &type metadata for SyncMonitorLocalState;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SyncMonitorLocalState.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SyncMonitorLocalState.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C4266F4 + 4 * byte_23C42BE95[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C426728 + 4 * byte_23C42BE90[v4]))();
}

uint64_t sub_23C426728(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C426730(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C426738);
  return result;
}

uint64_t sub_23C426744(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C42674CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C426750(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C426758(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C426764(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23C42676C(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SyncMonitorLocalState.CodingKeys()
{
  return &type metadata for SyncMonitorLocalState.CodingKeys;
}

unint64_t sub_23C42678C()
{
  unint64_t result;

  result = qword_256B9B260;
  if (!qword_256B9B260)
  {
    result = MEMORY[0x24261E834](&unk_23C42BFE4, &type metadata for SyncMonitorLocalState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9B260);
  }
  return result;
}

unint64_t sub_23C4267D4()
{
  unint64_t result;

  result = qword_256B9B268;
  if (!qword_256B9B268)
  {
    result = MEMORY[0x24261E834](&unk_23C42BF54, &type metadata for SyncMonitorLocalState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9B268);
  }
  return result;
}

unint64_t sub_23C42681C()
{
  unint64_t result;

  result = qword_256B9B270;
  if (!qword_256B9B270)
  {
    result = MEMORY[0x24261E834](&unk_23C42BF7C, &type metadata for SyncMonitorLocalState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9B270);
  }
  return result;
}

uint64_t sub_23C426860(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6974617669746361 && a2 == 0xEF65746174536E6FLL;
  if (v3 || (sub_23C42BC94() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65746E49636E7973 && a2 == 0xEC0000006C617672)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23C42BC94();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

BOOL static SyncMonitorActivationState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t SyncMonitorActivationState.hash(into:)()
{
  return sub_23C42BCAC();
}

uint64_t sub_23C4269B0(char a1)
{
  if ((a1 & 1) != 0)
    return 0x657669746361;
  else
    return 0x6576697463616E69;
}

uint64_t sub_23C4269E4()
{
  return 0;
}

uint64_t sub_23C4269F0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

void sub_23C426A1C(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_23C426A28()
{
  sub_23C426DA8();
  return sub_23C42BCDC();
}

uint64_t sub_23C426A50()
{
  sub_23C426DA8();
  return sub_23C42BCE8();
}

uint64_t sub_23C426A80()
{
  char *v0;

  return sub_23C4269B0(*v0);
}

uint64_t sub_23C426A88@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C4274F4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C426AAC()
{
  sub_23C426D64();
  return sub_23C42BCDC();
}

uint64_t sub_23C426AD4()
{
  sub_23C426D64();
  return sub_23C42BCE8();
}

uint64_t sub_23C426AFC()
{
  sub_23C426DEC();
  return sub_23C42BCDC();
}

uint64_t sub_23C426B24()
{
  sub_23C426DEC();
  return sub_23C42BCE8();
}

uint64_t SyncMonitorActivationState.hashValue.getter()
{
  sub_23C42BCA0();
  sub_23C42BCAC();
  return sub_23C42BCB8();
}

uint64_t SyncMonitorActivationState.encode(to:)(_QWORD *a1)
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

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9B278);
  v16 = *(_QWORD *)(v3 - 8);
  v17 = v3;
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9B280);
  v14 = *(_QWORD *)(v6 - 8);
  v15 = v6;
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9B288);
  v18 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C426D64();
  sub_23C42BCD0();
  if ((v12 & 1) != 0)
  {
    v20 = 1;
    sub_23C426DA8();
    sub_23C42BC64();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v17);
  }
  else
  {
    v19 = 0;
    sub_23C426DEC();
    sub_23C42BC64();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v15);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v11, v9);
}

unint64_t sub_23C426D64()
{
  unint64_t result;

  result = qword_256B9B290;
  if (!qword_256B9B290)
  {
    result = MEMORY[0x24261E834](&unk_23C42C38C, &type metadata for SyncMonitorActivationState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9B290);
  }
  return result;
}

unint64_t sub_23C426DA8()
{
  unint64_t result;

  result = qword_256B9B298;
  if (!qword_256B9B298)
  {
    result = MEMORY[0x24261E834](&unk_23C42C33C, &type metadata for SyncMonitorActivationState.ActiveCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9B298);
  }
  return result;
}

unint64_t sub_23C426DEC()
{
  unint64_t result;

  result = qword_256B9B2A0;
  if (!qword_256B9B2A0)
  {
    result = MEMORY[0x24261E834](&unk_23C42C2EC, &type metadata for SyncMonitorActivationState.InactiveCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9B2A0);
  }
  return result;
}

uint64_t SyncMonitorActivationState.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
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
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9B2A8);
  v32 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8]();
  v31 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9B2B0);
  v4 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9B2B8);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C426D64();
  v11 = v33;
  sub_23C42BCC4();
  if (v11)
    goto LABEL_7;
  v26 = v4;
  v27 = a1;
  v12 = v31;
  v13 = v32;
  v33 = v8;
  v14 = sub_23C42BC58();
  v15 = v7;
  if (*(_QWORD *)(v14 + 16) != 1)
  {
    v19 = sub_23C42BBF8();
    swift_allocError();
    v21 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B9B2C0);
    *v21 = &type metadata for SyncMonitorActivationState;
    sub_23C42BC28();
    sub_23C42BBEC();
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
    sub_23C426DA8();
    sub_23C42BC1C();
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
    sub_23C426DEC();
    v22 = v6;
    sub_23C42BC1C();
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

unint64_t sub_23C42718C()
{
  unint64_t result;

  result = qword_256B9B2C8;
  if (!qword_256B9B2C8)
  {
    result = MEMORY[0x24261E834](&protocol conformance descriptor for SyncMonitorActivationState, &type metadata for SyncMonitorActivationState);
    atomic_store(result, (unint64_t *)&qword_256B9B2C8);
  }
  return result;
}

uint64_t sub_23C4271D0@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return SyncMonitorActivationState.init(from:)(a1, a2);
}

uint64_t sub_23C4271E4(_QWORD *a1)
{
  return SyncMonitorActivationState.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for SyncMonitorActivationState()
{
  return &type metadata for SyncMonitorActivationState;
}

uint64_t _s11FitnessSync26SyncMonitorActivationStateOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C42725C + 4 * byte_23C42C065[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C427290 + 4 * byte_23C42C060[v4]))();
}

uint64_t sub_23C427290(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C427298(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C4272A0);
  return result;
}

uint64_t sub_23C4272AC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C4272B4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C4272B8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C4272C0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SyncMonitorActivationState.CodingKeys()
{
  return &type metadata for SyncMonitorActivationState.CodingKeys;
}

ValueMetadata *type metadata accessor for SyncMonitorActivationState.InactiveCodingKeys()
{
  return &type metadata for SyncMonitorActivationState.InactiveCodingKeys;
}

ValueMetadata *type metadata accessor for SyncMonitorActivationState.ActiveCodingKeys()
{
  return &type metadata for SyncMonitorActivationState.ActiveCodingKeys;
}

unint64_t sub_23C427300()
{
  unint64_t result;

  result = qword_256B9B2D0;
  if (!qword_256B9B2D0)
  {
    result = MEMORY[0x24261E834](&unk_23C42C2C4, &type metadata for SyncMonitorActivationState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9B2D0);
  }
  return result;
}

unint64_t sub_23C427348()
{
  unint64_t result;

  result = qword_256B9B2D8;
  if (!qword_256B9B2D8)
  {
    result = MEMORY[0x24261E834](&unk_23C42C1E4, &type metadata for SyncMonitorActivationState.InactiveCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9B2D8);
  }
  return result;
}

unint64_t sub_23C427390()
{
  unint64_t result;

  result = qword_256B9B2E0;
  if (!qword_256B9B2E0)
  {
    result = MEMORY[0x24261E834](&unk_23C42C20C, &type metadata for SyncMonitorActivationState.InactiveCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9B2E0);
  }
  return result;
}

unint64_t sub_23C4273D8()
{
  unint64_t result;

  result = qword_256B9B2E8;
  if (!qword_256B9B2E8)
  {
    result = MEMORY[0x24261E834](&unk_23C42C194, &type metadata for SyncMonitorActivationState.ActiveCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9B2E8);
  }
  return result;
}

unint64_t sub_23C427420()
{
  unint64_t result;

  result = qword_256B9B2F0;
  if (!qword_256B9B2F0)
  {
    result = MEMORY[0x24261E834](&unk_23C42C1BC, &type metadata for SyncMonitorActivationState.ActiveCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9B2F0);
  }
  return result;
}

unint64_t sub_23C427468()
{
  unint64_t result;

  result = qword_256B9B2F8;
  if (!qword_256B9B2F8)
  {
    result = MEMORY[0x24261E834](&unk_23C42C234, &type metadata for SyncMonitorActivationState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9B2F8);
  }
  return result;
}

unint64_t sub_23C4274B0()
{
  unint64_t result;

  result = qword_256B9B300;
  if (!qword_256B9B300)
  {
    result = MEMORY[0x24261E834](&unk_23C42C25C, &type metadata for SyncMonitorActivationState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9B300);
  }
  return result;
}

uint64_t sub_23C4274F4(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6576697463616E69 && a2 == 0xE800000000000000;
  if (v3 || (sub_23C42BC94() & 1) != 0)
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
    v6 = sub_23C42BC94();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

BOOL sub_23C4275E0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t SyncMonitorFeature.environment.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + 40);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v1 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(v1 + 24);
  *(_QWORD *)(a1 + 40) = v2;
  swift_retain();
  swift_retain();
  return swift_retain();
}

__n128 SyncMonitorFeature.init(environment:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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

void SyncMonitorFeature.reduce(localState:sharedState:sideEffects:action:)(uint64_t a1, unint64_t a2, NSObject *a3, unsigned __int8 *a4)
{
  __int128 *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  char *v32;
  int v33;
  __int128 v34;
  int *v35;
  char *v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  NSObject *v45;
  unint64_t isa;
  unint64_t v47;
  unint64_t v48;
  int *v49;
  char *v50;
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  void (*v55)(char *, _QWORD, uint64_t);
  uint64_t v56;
  uint64_t v57;
  void (*v58)(char *, uint64_t, uint64_t);
  char *v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t v63;
  unint64_t *v64;
  char *v65;
  char *v66;
  char *v67;
  char *v68;
  _OWORD *v69;
  __int128 v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  uint64_t v74;
  _QWORD *v75;
  uint64_t (*v76)(char *, uint64_t, uint64_t);
  int v77;
  uint64_t v78;
  os_log_type_t v79;
  uint8_t *v80;
  double v81;
  double v82;
  void (*v83)(char *, uint64_t);
  uint64_t v84;
  NSObject *v85;
  os_log_type_t v86;
  uint8_t *v87;
  uint64_t v88;
  uint64_t v89;
  NSObject *v90;
  os_log_type_t v91;
  uint8_t *v92;
  int *v93;
  char *v94;
  char *v95;
  char *v96;
  char *v97;
  unint64_t v98;
  uint64_t v99;
  uint64_t v100;
  _QWORD *v101;
  uint64_t v102;
  uint64_t v103;
  _OWORD *v104;
  __int128 v105;
  char *v106;
  unint64_t v107;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v109;
  unint64_t v110;
  unint64_t v111;
  uint64_t v112;
  unint64_t v113;
  void (*v114)(unint64_t, char *, uint64_t);
  NSObject *v115;
  os_log_type_t v116;
  uint8_t *v117;
  char *v118;
  char *v119;
  char *v120;
  char *v121;
  _OWORD *v122;
  __int128 v123;
  char *v124;
  uint64_t v125;
  NSObject *v126;
  unint64_t v127;
  unint64_t v128;
  unint64_t v129;
  uint64_t v130;
  NSObject *v131;
  os_log_type_t v132;
  uint8_t *v133;
  uint64_t v134;
  uint64_t v135;
  char *v136;
  void (*v137)(char *, uint64_t, uint64_t);
  void (*v138)(char *, _QWORD, uint64_t);
  char *v139;
  char *v140;
  _QWORD *v141;
  unint64_t v142;
  char *v143;
  unint64_t v144;
  uint64_t v145;
  NSObject *v146;
  char v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;

  v146 = a3;
  v142 = a2;
  v7 = sub_23C42BB20();
  v141 = *(_QWORD **)(v7 - 8);
  v8 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v10 = (char *)&v134 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v134 - v11;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9B308);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v140 = (char *)&v134 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v134 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v134 - v19;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9B310);
  v144 = *(_QWORD *)(v21 - 8);
  v145 = v21;
  v22 = MEMORY[0x24BDAC7A8](v21);
  v23 = MEMORY[0x24BDAC7A8](v22);
  v24 = MEMORY[0x24BDAC7A8](v23);
  v26 = (char *)&v134 - v25;
  v27 = MEMORY[0x24BDAC7A8](v24);
  v143 = (char *)&v134 - v28;
  MEMORY[0x24BDAC7A8](v27);
  v32 = (char *)&v134 - v31;
  v33 = *a4;
  v34 = v4[1];
  v148 = *v4;
  v149 = v34;
  v150 = v4[2];
  if (v33)
  {
    if (v33 == 1)
    {
      v35 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_256B9B318);
      v36 = &v26[v35[16]];
      v37 = &v26[v35[20]];
      v38 = &v26[v35[24]];
      v147 = 1;
      sub_23C428CF8();
      sub_23C42BBE0();
      sub_23C42BBA4();
      v39 = *MEMORY[0x24BE2B580];
      v40 = sub_23C42BB68();
      (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 104))(v36, v39, v40);
      v41 = *MEMORY[0x24BE2B550];
      v42 = sub_23C42BB5C();
      (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v42 - 8) + 104))(v37, v41, v42);
      *(_QWORD *)v38 = &unk_256B9B348;
      *((_QWORD *)v38 + 1) = 0;
      v44 = v144;
      v43 = v145;
      (*(void (**)(char *, _QWORD, uint64_t))(v144 + 104))(v26, *MEMORY[0x24BE2B438], v145);
      v45 = v146;
      isa = (unint64_t)v146->isa;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        isa = sub_23C428DDC(0, *(_QWORD *)(isa + 16) + 1, 1, isa);
      v48 = *(_QWORD *)(isa + 16);
      v47 = *(_QWORD *)(isa + 24);
      if (v48 >= v47 >> 1)
        isa = sub_23C428DDC(v47 > 1, v48 + 1, 1, isa);
      *(_QWORD *)(isa + 16) = v48 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v44 + 32))(isa+ ((*(unsigned __int8 *)(v44 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v44 + 80))+ *(_QWORD *)(v44 + 72) * v48, v26, v43);
      v45->isa = (Class)isa;
      return;
    }
    if (*(_BYTE *)a1 == 1)
    {
      v143 = v30;
      v139 = v29;
      v74 = v142;
      sub_23C428C28(v142, (uint64_t)v20);
      v75 = v141;
      v76 = (uint64_t (*)(char *, uint64_t, uint64_t))v141[6];
      v77 = v76(v20, 1, v7);
      sub_23C428C70((uint64_t)v20);
      sub_23C42BB08();
      sub_23C428C28(v74, (uint64_t)v18);
      if (v76(v18, 1, v7) == 1)
      {
        sub_23C42BAF0();
        sub_23C428C70((uint64_t)v18);
      }
      else
      {
        ((void (*)(char *, char *, uint64_t))v75[4])(v10, v18, v7);
      }
      sub_23C42BAFC();
      v82 = v81;
      v83 = (void (*)(char *, uint64_t))v75[1];
      v83(v10, v7);
      v83(v12, v7);
      if (v77 != 1 && *(double *)(a1 + 8) > v82)
      {
        if (qword_256B9B230 != -1)
          swift_once();
        v84 = sub_23C42BB44();
        __swift_project_value_buffer(v84, (uint64_t)qword_256B9CF50);
        v85 = sub_23C42BB2C();
        v86 = sub_23C42BBC8();
        if (os_log_type_enabled(v85, v86))
        {
          v87 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v87 = 0;
          _os_log_impl(&dword_23C424000, v85, v86, "[SyncMonitorFeature] Skipping catalog sync - interval has not expired", v87, 2u);
          MEMORY[0x24261E888](v87, -1, -1);
        }

LABEL_50:
        if (qword_256B9B230 != -1)
          swift_once();
        v130 = sub_23C42BB44();
        __swift_project_value_buffer(v130, (uint64_t)qword_256B9CF50);
        v131 = sub_23C42BB2C();
        v132 = sub_23C42BBC8();
        if (os_log_type_enabled(v131, v132))
        {
          v133 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v133 = 0;
          _os_log_impl(&dword_23C424000, v131, v132, "[SyncMonitorFeature] Skipping user data sync - already synced", v133, 2u);
          MEMORY[0x24261E888](v133, -1, -1);
        }

        return;
      }
      LODWORD(v138) = v77;
      v88 = (uint64_t)v140;
      sub_23C42BB14();
      ((void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v75[7])(v88, 0, 1, v7);
      sub_23C428CB0(v88, v74);
      if (qword_256B9B230 != -1)
        swift_once();
      v89 = sub_23C42BB44();
      __swift_project_value_buffer(v89, (uint64_t)qword_256B9CF50);
      v90 = sub_23C42BB2C();
      v91 = sub_23C42BBC8();
      if (os_log_type_enabled(v90, v91))
      {
        v92 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v92 = 0;
        _os_log_impl(&dword_23C424000, v90, v91, "[SyncMonitorFeature] Syncing catalog", v92, 2u);
        MEMORY[0x24261E888](v92, -1, -1);
      }

      v93 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_256B9B318);
      v94 = v143;
      v95 = &v143[v93[16]];
      v96 = &v143[v93[20]];
      v97 = &v143[v93[24]];
      v147 = 2;
      v98 = sub_23C428CF8();
      sub_23C42BBE0();
      sub_23C42BBA4();
      v99 = *MEMORY[0x24BE2B580];
      v100 = sub_23C42BB68();
      v101 = *(_QWORD **)(*(_QWORD *)(v100 - 8) + 104);
      LODWORD(v142) = v99;
      v141 = v101;
      ((void (*)(char *, uint64_t, uint64_t))v101)(v95, v99, v100);
      v102 = *MEMORY[0x24BE2B558];
      v103 = sub_23C42BB5C();
      v137 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v103 - 8) + 104);
      v137(v96, v102, v103);
      v104 = (_OWORD *)swift_allocObject();
      v105 = v149;
      v104[1] = v148;
      v104[2] = v105;
      v104[3] = v150;
      *(_QWORD *)v97 = &unk_256B9B330;
      *((_QWORD *)v97 + 1) = v104;
      LODWORD(v97) = *MEMORY[0x24BE2B438];
      v106 = *(char **)(v144 + 104);
      ((void (*)(char *, _QWORD, uint64_t))v106)(v94, *MEMORY[0x24BE2B438], v145);
      v107 = (unint64_t)v146->isa;
      sub_23C428D94((uint64_t)&v148);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      LODWORD(v140) = v102;
      LODWORD(v135) = (_DWORD)v97;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        v107 = sub_23C428DDC(0, *(_QWORD *)(v107 + 16) + 1, 1, v107);
      v110 = *(_QWORD *)(v107 + 16);
      v109 = *(_QWORD *)(v107 + 24);
      v136 = v106;
      if (v110 >= v109 >> 1)
        v107 = sub_23C428DDC(v109 > 1, v110 + 1, 1, v107);
      *(_QWORD *)(v107 + 16) = v110 + 1;
      v111 = (*(unsigned __int8 *)(v144 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v144 + 80);
      v112 = *(_QWORD *)(v144 + 72);
      v113 = v107 + v111 + v112 * v110;
      v114 = *(void (**)(unint64_t, char *, uint64_t))(v144 + 32);
      v114(v113, v143, v145);
      v146->isa = (Class)v107;
      if ((_DWORD)v138 != 1)
        goto LABEL_50;
      v144 = v98;
      v115 = sub_23C42BB2C();
      v116 = sub_23C42BBC8();
      if (os_log_type_enabled(v115, v116))
      {
        v117 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v117 = 0;
        _os_log_impl(&dword_23C424000, v115, v116, "[SyncMonitorFeature] Syncing user data", v117, 2u);
        MEMORY[0x24261E888](v117, -1, -1);
      }

      v118 = v139;
      v119 = &v139[v93[16]];
      v120 = &v139[v93[20]];
      v121 = &v139[v93[24]];
      v147 = 3;
      sub_23C42BBE0();
      sub_23C42BBA4();
      ((void (*)(char *, _QWORD, uint64_t))v141)(v119, v142, v100);
      v137(v120, v140, v103);
      v122 = (_OWORD *)swift_allocObject();
      v123 = v149;
      v122[1] = v148;
      v122[2] = v123;
      v122[3] = v150;
      *(_QWORD *)v121 = &unk_256B9B340;
      *((_QWORD *)v121 + 1) = v122;
      v124 = v118;
      v125 = v145;
      ((void (*)(char *, _QWORD, uint64_t))v136)(v124, v135, v145);
      v126 = v146;
      v127 = (unint64_t)v146->isa;
      sub_23C428D94((uint64_t)&v148);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v127 = sub_23C428DDC(0, *(_QWORD *)(v127 + 16) + 1, 1, v127);
      v129 = *(_QWORD *)(v127 + 16);
      v128 = *(_QWORD *)(v127 + 24);
      if (v129 >= v128 >> 1)
        v127 = sub_23C428DDC(v128 > 1, v129 + 1, 1, v127);
      *(_QWORD *)(v127 + 16) = v129 + 1;
      v114(v127 + v111 + v129 * v112, v139, v125);
      v126->isa = (Class)v127;
    }
    else
    {
      if (qword_256B9B230 != -1)
        swift_once();
      v78 = sub_23C42BB44();
      __swift_project_value_buffer(v78, (uint64_t)qword_256B9CF50);
      v146 = sub_23C42BB2C();
      v79 = sub_23C42BBC8();
      if (os_log_type_enabled(v146, v79))
      {
        v80 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v80 = 0;
        _os_log_impl(&dword_23C424000, v146, v79, "[SyncMonitorFeature] Skipping sync - inactive", v80, 2u);
        MEMORY[0x24261E888](v80, -1, -1);
      }

    }
  }
  else if ((*(_BYTE *)a1 & 1) == 0)
  {
    *(_BYTE *)a1 = 1;
    v49 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_256B9B318);
    v50 = &v32[v49[16]];
    v51 = &v32[v49[20]];
    v52 = &v32[v49[24]];
    v147 = 1;
    v142 = sub_23C428CF8();
    sub_23C42BBE0();
    sub_23C42BBA4();
    v53 = *MEMORY[0x24BE2B580];
    v54 = sub_23C42BB68();
    v55 = *(void (**)(char *, _QWORD, uint64_t))(*(_QWORD *)(v54 - 8) + 104);
    LODWORD(v141) = v53;
    v138 = v55;
    v55(v50, v53, v54);
    v56 = *MEMORY[0x24BE2B550];
    v57 = sub_23C42BB5C();
    v58 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v57 - 8) + 104);
    LODWORD(v137) = v56;
    v58(v51, v56, v57);
    *(_QWORD *)v52 = &unk_256B9B350;
    *((_QWORD *)v52 + 1) = 0;
    v59 = *(char **)(v144 + 104);
    LODWORD(v139) = *MEMORY[0x24BE2B438];
    v140 = v59;
    ((void (*)(char *))v59)(v32);
    v60 = (unint64_t)v146->isa;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v60 = sub_23C428DDC(0, *(_QWORD *)(v60 + 16) + 1, 1, v60);
    v62 = *(_QWORD *)(v60 + 16);
    v61 = *(_QWORD *)(v60 + 24);
    if (v62 >= v61 >> 1)
      v60 = sub_23C428DDC(v61 > 1, v62 + 1, 1, v60);
    *(_QWORD *)(v60 + 16) = v62 + 1;
    v136 = (char *)((*(unsigned __int8 *)(v144 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v144 + 80));
    v135 = *(_QWORD *)(v144 + 72);
    v63 = v145;
    v144 = *(_QWORD *)(v144 + 32);
    ((void (*)(char *, char *, uint64_t))v144)(&v136[v60 + v135 * v62], v32, v145);
    v64 = (unint64_t *)v146;
    v146->isa = (Class)v60;
    v65 = v143;
    v66 = &v143[v49[16]];
    v67 = &v143[v49[20]];
    v68 = &v143[v49[24]];
    v147 = 0;
    sub_23C42BBE0();
    sub_23C42BBA4();
    v138(v66, v141, v54);
    v58(v67, v137, v57);
    v69 = (_OWORD *)swift_allocObject();
    v70 = v149;
    v69[1] = v148;
    v69[2] = v70;
    v69[3] = v150;
    *(_QWORD *)v68 = &unk_256B9B360;
    *((_QWORD *)v68 + 1) = v69;
    ((void (*)(char *, _QWORD, uint64_t))v140)(v65, v139, v63);
    v71 = *v64;
    sub_23C428D94((uint64_t)&v148);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v71 = sub_23C428DDC(0, *(_QWORD *)(v71 + 16) + 1, 1, v71);
    v73 = *(_QWORD *)(v71 + 16);
    v72 = *(_QWORD *)(v71 + 24);
    if (v73 >= v72 >> 1)
      v71 = sub_23C428DDC(v72 > 1, v73 + 1, 1, v71);
    *(_QWORD *)(v71 + 16) = v73 + 1;
    ((void (*)(char *, char *, uint64_t))v144)(&v136[v71 + v73 * v135], v143, v63);
    *v64 = v71;
  }
}

uint64_t sub_23C428458()
{
  uint64_t v0;
  _QWORD *v1;

  *(_QWORD *)(v0 + 16) = sub_23C42BB98();
  *(_QWORD *)(v0 + 24) = sub_23C42BB8C();
  *(_BYTE *)(v0 + 40) = 2;
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B9B3A0);
  *v1 = v0;
  v1[1] = sub_23C4284EC;
  return sub_23C42BB50();
}

uint64_t sub_23C4284EC()
{
  swift_task_dealloc();
  sub_23C42BB80();
  return swift_task_switch();
}

uint64_t sub_23C42855C(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t);

  v2[2] = a1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9B390);
  v2[3] = v4;
  v2[4] = *(_QWORD *)(v4 - 8);
  v5 = swift_task_alloc();
  v2[5] = v5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9B398);
  v2[6] = v6;
  v2[7] = *(_QWORD *)(v6 - 8);
  v2[8] = swift_task_alloc();
  v2[9] = sub_23C42BB98();
  v2[10] = sub_23C42BB8C();
  v9 = (uint64_t (*)(uint64_t))(*(int *)*a2 + *a2);
  v7 = (_QWORD *)swift_task_alloc();
  v2[11] = v7;
  *v7 = v2;
  v7[1] = sub_23C42863C;
  return v9(v5);
}

uint64_t sub_23C42863C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v1;
  *(_QWORD *)(*v1 + 96) = v0;
  swift_task_dealloc();
  *(_QWORD *)(v2 + 104) = sub_23C42BB80();
  *(_QWORD *)(v2 + 112) = v3;
  return swift_task_switch();
}

uint64_t sub_23C4286C8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = v0[4];
  v1 = v0[5];
  v3 = v0[3];
  sub_23C42BBB0();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v0[15] = sub_23C42BB8C();
  v4 = (_QWORD *)swift_task_alloc();
  v0[16] = v4;
  *v4 = v0;
  v4[1] = sub_23C42876C;
  return sub_23C42BBBC();
}

uint64_t sub_23C42876C()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_23C4287C0()
{
  uint64_t v0;
  _QWORD *v2;

  if (*(_BYTE *)(v0 + 144) == 1)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 56) + 8))(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 48));
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    *(_BYTE *)(v0 + 145) = 1;
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 136) = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B9B3A0);
    *v2 = v0;
    v2[1] = sub_23C428890;
    return sub_23C42BB50();
  }
}

uint64_t sub_23C428890()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23C4288DC()
{
  uint64_t v0;
  _QWORD *v1;

  *(_QWORD *)(v0 + 120) = sub_23C42BB8C();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 128) = v1;
  *v1 = v0;
  v1[1] = sub_23C42876C;
  return sub_23C42BBBC();
}

uint64_t sub_23C42895C()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C4289A8(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v2[2] = sub_23C42BB98();
  v2[3] = sub_23C42BB8C();
  v6 = (uint64_t (*)(void))(**(int **)(a2 + 16) + *(_QWORD *)(a2 + 16));
  v4 = (_QWORD *)swift_task_alloc();
  v2[4] = v4;
  *v4 = v2;
  v4[1] = sub_23C428A1C;
  return v6();
}

uint64_t sub_23C428A1C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 40) = v0;
  swift_task_dealloc();
  sub_23C42BB80();
  return swift_task_switch();
}

uint64_t sub_23C428AA4()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C428AD8()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C428B0C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v2[2] = sub_23C42BB98();
  v2[3] = sub_23C42BB8C();
  v6 = (uint64_t (*)(void))(**(int **)(a2 + 32) + *(_QWORD *)(a2 + 32));
  v4 = (_QWORD *)swift_task_alloc();
  v2[4] = v4;
  *v4 = v2;
  v4[1] = sub_23C428B80;
  return v6();
}

uint64_t sub_23C428B80()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 40) = v0;
  swift_task_dealloc();
  sub_23C42BB80();
  return swift_task_switch();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_23C428C28(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9B308);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23C428C70(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9B308);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23C428CB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9B308);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_23C428CF8()
{
  unint64_t result;

  result = qword_256B9B320;
  if (!qword_256B9B320)
  {
    result = MEMORY[0x24261E834](&unk_23C42C4AC, &type metadata for SyncMonitorFeature.TaskIdentifier);
    atomic_store(result, &qword_256B9B320);
  }
  return result;
}

uint64_t sub_23C428D40(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23C429754;
  return sub_23C4289A8(a1, v1 + 16);
}

uint64_t sub_23C428D94(uint64_t a1)
{
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_23C428DDC(char a1, int64_t a2, char a3, unint64_t a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B9B3A8);
  v10 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256B9B310) - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_23C42BC04();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256B9B310) - 8);
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
    sub_23C429630(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_23C428FF0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23C429754;
  return sub_23C428B0C(a1, v1 + 16);
}

uint64_t objectdestroyTm()
{
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23C42907C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23C4290D0;
  return sub_23C42855C(a1, (_QWORD *)(v1 + 16));
}

uint64_t sub_23C4290D0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

unint64_t sub_23C42911C()
{
  unint64_t result;

  result = qword_256B9B368;
  if (!qword_256B9B368)
  {
    result = MEMORY[0x24261E834](&protocol conformance descriptor for SyncMonitorAction, &type metadata for SyncMonitorAction);
    atomic_store(result, (unint64_t *)&qword_256B9B368);
  }
  return result;
}

unint64_t sub_23C429164()
{
  unint64_t result;

  result = qword_256B9B370;
  if (!qword_256B9B370)
  {
    result = MEMORY[0x24261E834](&protocol conformance descriptor for SyncMonitorAction, &type metadata for SyncMonitorAction);
    atomic_store(result, (unint64_t *)&qword_256B9B370);
  }
  return result;
}

unint64_t sub_23C4291AC()
{
  unint64_t result;

  result = qword_256B9B378;
  if (!qword_256B9B378)
  {
    result = MEMORY[0x24261E834](&protocol conformance descriptor for SyncMonitorLocalState, &type metadata for SyncMonitorLocalState);
    atomic_store(result, (unint64_t *)&qword_256B9B378);
  }
  return result;
}

unint64_t sub_23C4291F4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256B9B380;
  if (!qword_256B9B380)
  {
    v1 = type metadata accessor for SyncMonitorSharedState();
    result = MEMORY[0x24261E834](&protocol conformance descriptor for SyncMonitorSharedState, v1);
    atomic_store(result, (unint64_t *)&qword_256B9B380);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for SyncMonitorEnvironment(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SyncMonitorEnvironment()
{
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for SyncMonitorEnvironment(uint64_t a1, uint64_t a2)
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

_QWORD *assignWithCopy for SyncMonitorEnvironment(_QWORD *a1, _QWORD *a2)
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

_OWORD *assignWithTake for SyncMonitorEnvironment(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  a1[2] = a2[2];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SyncMonitorEnvironment(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SyncMonitorEnvironment(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SyncMonitorFeature()
{
  return &type metadata for SyncMonitorFeature;
}

uint64_t getEnumTagSinglePayload for SyncMonitorFeature.TaskIdentifier(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SyncMonitorFeature.TaskIdentifier(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C429560 + 4 * byte_23C42C3E5[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23C429594 + 4 * byte_23C42C3E0[v4]))();
}

uint64_t sub_23C429594(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C42959C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C4295A4);
  return result;
}

uint64_t sub_23C4295B0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C4295B8);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23C4295BC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C4295C4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_23C4295D0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SyncMonitorFeature.TaskIdentifier()
{
  return &type metadata for SyncMonitorFeature.TaskIdentifier;
}

unint64_t sub_23C4295EC()
{
  unint64_t result;

  result = qword_256B9B388;
  if (!qword_256B9B388)
  {
    result = MEMORY[0x24261E834](&unk_23C42C484, &type metadata for SyncMonitorFeature.TaskIdentifier);
    atomic_store(result, (unint64_t *)&qword_256B9B388);
  }
  return result;
}

uint64_t sub_23C429630(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v8 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256B9B310) - 8);
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
  result = sub_23C42BC10();
  __break(1u);
  return result;
}

uint64_t SyncMonitorSharedState.lastSyncDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23C428C28(v1, a1);
}

uint64_t SyncMonitorSharedState.lastSyncDate.setter(uint64_t a1)
{
  uint64_t v1;

  return sub_23C428CB0(a1, v1);
}

uint64_t (*SyncMonitorSharedState.lastSyncDate.modify())()
{
  return nullsub_1;
}

uint64_t SyncMonitorSharedState.init(lastSyncDate:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  v4 = sub_23C42BB20();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a2, 1, 1, v4);
  return sub_23C428CB0(a1, a2);
}

uint64_t sub_23C4297CC()
{
  return 1;
}

uint64_t sub_23C4297D4()
{
  sub_23C42BCA0();
  sub_23C42BCAC();
  return sub_23C42BCB8();
}

uint64_t sub_23C429814()
{
  return sub_23C42BCAC();
}

uint64_t sub_23C429838()
{
  sub_23C42BCA0();
  sub_23C42BCAC();
  return sub_23C42BCB8();
}

uint64_t sub_23C429878@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C42A854(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23C4298A0()
{
  sub_23C4299F8();
  return sub_23C42BCDC();
}

uint64_t sub_23C4298C8()
{
  sub_23C4299F8();
  return sub_23C42BCE8();
}

uint64_t SyncMonitorSharedState.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9B3B0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C4299F8();
  sub_23C42BCD0();
  sub_23C42BB20();
  sub_23C42A944(&qword_256B9B3C0, MEMORY[0x24BDCE920]);
  sub_23C42BC70();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_23C4299F8()
{
  unint64_t result;

  result = qword_256B9B3B8;
  if (!qword_256B9B3B8)
  {
    result = MEMORY[0x24261E834](&unk_23C42C65C, &type metadata for SyncMonitorSharedState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9B3B8);
  }
  return result;
}

uint64_t SyncMonitorSharedState.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v14 = a2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9B308);
  MEMORY[0x24BDAC7A8](v4);
  v16 = (uint64_t)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9B3C8);
  v15 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for SyncMonitorSharedState();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_23C42BB20();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C4299F8();
  sub_23C42BCC4();
  if (!v2)
  {
    sub_23C42A944(&qword_256B9B3D0, MEMORY[0x24BDCE960]);
    sub_23C42BC34();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v8, v6);
    sub_23C428CB0(v16, (uint64_t)v11);
    sub_23C429C98((uint64_t)v11, v14);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_23C429C5C((uint64_t)v11);
}

uint64_t type metadata accessor for SyncMonitorSharedState()
{
  uint64_t result;

  result = qword_256B9B430;
  if (!qword_256B9B430)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23C429C5C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SyncMonitorSharedState();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23C429C98(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SyncMonitorSharedState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23C429CDC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return SyncMonitorSharedState.init(from:)(a1, a2);
}

uint64_t sub_23C429CF0(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9B3B0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C4299F8();
  sub_23C42BCD0();
  sub_23C42BB20();
  sub_23C42A944(&qword_256B9B3C0, MEMORY[0x24BDCE920]);
  sub_23C42BC70();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

BOOL _s11FitnessSync0B18MonitorSharedStateV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  unsigned int (*v21)(uint64_t, uint64_t, uint64_t);
  char v22;
  void (*v23)(char *, uint64_t);
  uint64_t v25;

  v4 = sub_23C42BB20();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9B488);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9B308);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&v25 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v25 - v18;
  sub_23C428C28(a1, (uint64_t)&v25 - v18);
  sub_23C428C28(a2, (uint64_t)v17);
  v20 = (uint64_t)&v10[*(int *)(v8 + 48)];
  sub_23C428C28((uint64_t)v19, (uint64_t)v10);
  sub_23C428C28((uint64_t)v17, v20);
  v21 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (v21((uint64_t)v10, 1, v4) == 1)
  {
    sub_23C42A908((uint64_t)v17, &qword_256B9B308);
    sub_23C42A908((uint64_t)v19, &qword_256B9B308);
    if (v21(v20, 1, v4) == 1)
    {
      sub_23C42A908((uint64_t)v10, &qword_256B9B308);
      return 1;
    }
    goto LABEL_6;
  }
  sub_23C428C28((uint64_t)v10, (uint64_t)v14);
  if (v21(v20, 1, v4) == 1)
  {
    sub_23C42A908((uint64_t)v17, &qword_256B9B308);
    sub_23C42A908((uint64_t)v19, &qword_256B9B308);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v14, v4);
LABEL_6:
    sub_23C42A908((uint64_t)v10, &qword_256B9B488);
    return 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v7, v20, v4);
  sub_23C42A944(&qword_256B9B490, MEMORY[0x24BDCE958]);
  v22 = sub_23C42BB74();
  v23 = *(void (**)(char *, uint64_t))(v5 + 8);
  v23(v7, v4);
  sub_23C42A908((uint64_t)v17, &qword_256B9B308);
  sub_23C42A908((uint64_t)v19, &qword_256B9B308);
  v23(v14, v4);
  sub_23C42A908((uint64_t)v10, &qword_256B9B308);
  return (v22 & 1) != 0;
}

uint64_t *initializeBufferWithCopyOfBuffer for SyncMonitorSharedState(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256B9B308) - 8);
  v5 = *(_DWORD *)(v4 + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = sub_23C42BB20();
    v7 = *(_QWORD *)(v6 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
    {
      memcpy(a1, a2, *(_QWORD *)(v4 + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(a1, a2, v6);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
    }
  }
  return a1;
}

uint64_t destroy for SyncMonitorSharedState(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = sub_23C42BB20();
  v3 = *(_QWORD *)(v2 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, 1, v2);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  return result;
}

void *initializeWithCopy for SyncMonitorSharedState(void *a1, const void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_23C42BB20();
  v5 = *(_QWORD *)(v4 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
  {
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9B308);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 16))(a1, a2, v4);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  return a1;
}

void *assignWithCopy for SyncMonitorSharedState(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void *, uint64_t, uint64_t);
  int v7;
  int v8;
  uint64_t v9;

  v4 = sub_23C42BB20();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  v7 = v6(a1, 1, v4);
  v8 = v6(a2, 1, v4);
  if (!v7)
  {
    if (!v8)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 24))(a1, a2, v4);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v5 + 8))(a1, v4);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9B308);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v5 + 16))(a1, a2, v4);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  return a1;
}

void *initializeWithTake for SyncMonitorSharedState(void *a1, const void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_23C42BB20();
  v5 = *(_QWORD *)(v4 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
  {
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9B308);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 32))(a1, a2, v4);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  return a1;
}

void *assignWithTake for SyncMonitorSharedState(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void *, uint64_t, uint64_t);
  int v7;
  int v8;
  uint64_t v9;

  v4 = sub_23C42BB20();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  v7 = v6(a1, 1, v4);
  v8 = v6(a2, 1, v4);
  if (!v7)
  {
    if (!v8)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 40))(a1, a2, v4);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v5 + 8))(a1, v4);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9B308);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v5 + 32))(a1, a2, v4);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for SyncMonitorSharedState()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C42A538(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9B308);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for SyncMonitorSharedState()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C42A584(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9B308);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

void sub_23C42A5C8()
{
  unint64_t v0;

  sub_23C42A630();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_23C42A630()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256B9B440)
  {
    sub_23C42BB20();
    v0 = sub_23C42BBD4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256B9B440);
  }
}

uint64_t getEnumTagSinglePayload for SyncMonitorSharedState.CodingKeys(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SyncMonitorSharedState.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23C42A718 + 4 * byte_23C42C4F0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23C42A738 + 4 * byte_23C42C4F5[v4]))();
}

_BYTE *sub_23C42A718(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23C42A738(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C42A740(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C42A748(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C42A750(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C42A758(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_23C42A764()
{
  return 0;
}

ValueMetadata *type metadata accessor for SyncMonitorSharedState.CodingKeys()
{
  return &type metadata for SyncMonitorSharedState.CodingKeys;
}

unint64_t sub_23C42A780()
{
  unint64_t result;

  result = qword_256B9B470;
  if (!qword_256B9B470)
  {
    result = MEMORY[0x24261E834](&unk_23C42C634, &type metadata for SyncMonitorSharedState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9B470);
  }
  return result;
}

unint64_t sub_23C42A7C8()
{
  unint64_t result;

  result = qword_256B9B478;
  if (!qword_256B9B478)
  {
    result = MEMORY[0x24261E834](&unk_23C42C5A4, &type metadata for SyncMonitorSharedState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9B478);
  }
  return result;
}

unint64_t sub_23C42A810()
{
  unint64_t result;

  result = qword_256B9B480;
  if (!qword_256B9B480)
  {
    result = MEMORY[0x24261E834](&unk_23C42C5CC, &type metadata for SyncMonitorSharedState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9B480);
  }
  return result;
}

uint64_t sub_23C42A854(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x636E79537473616CLL && a2 == 0xEC00000065746144)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_23C42BC94();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23C42A8E8()
{
  return 0x636E79537473616CLL;
}

uint64_t sub_23C42A908(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23C42A944(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_23C42BB20();
    result = MEMORY[0x24261E834](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23C42A984()
{
  uint64_t v0;

  v0 = sub_23C42BB44();
  __swift_allocate_value_buffer(v0, qword_256B9CF50);
  __swift_project_value_buffer(v0, (uint64_t)qword_256B9CF50);
  return sub_23C42BB38();
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

BOOL static SyncMonitorAction.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t SyncMonitorAction.hash(into:)()
{
  return sub_23C42BCAC();
}

uint64_t sub_23C42AA6C(char a1)
{
  if (!a1)
    return 0x6570704177656976;
  if (a1 == 1)
    return 0xD000000000000012;
  return 0x654E6649636E7973;
}

uint64_t sub_23C42AADC()
{
  sub_23C42AF84();
  return sub_23C42BCDC();
}

uint64_t sub_23C42AB04()
{
  sub_23C42AF84();
  return sub_23C42BCE8();
}

uint64_t sub_23C42AB2C()
{
  char *v0;

  return sub_23C42AA6C(*v0);
}

uint64_t sub_23C42AB34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C42B8EC(a1, a2);
  *a3 = result;
  return result;
}

void sub_23C42AB58(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_23C42AB64()
{
  sub_23C42AEFC();
  return sub_23C42BCDC();
}

uint64_t sub_23C42AB8C()
{
  sub_23C42AEFC();
  return sub_23C42BCE8();
}

uint64_t sub_23C42ABB4()
{
  sub_23C42AF40();
  return sub_23C42BCDC();
}

uint64_t sub_23C42ABDC()
{
  sub_23C42AF40();
  return sub_23C42BCE8();
}

uint64_t sub_23C42AC04()
{
  sub_23C42AFC8();
  return sub_23C42BCDC();
}

uint64_t sub_23C42AC2C()
{
  sub_23C42AFC8();
  return sub_23C42BCE8();
}

uint64_t SyncMonitorAction.hashValue.getter()
{
  sub_23C42BCA0();
  sub_23C42BCAC();
  return sub_23C42BCB8();
}

uint64_t SyncMonitorAction.encode(to:)(_QWORD *a1)
{
  unsigned __int8 *v1;
  unsigned __int8 *v2;
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
  int v15;
  char *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  char v27;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9B498);
  v22 = *(_QWORD *)(v4 - 8);
  v23 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v21 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9B4A0);
  v19 = *(_QWORD *)(v6 - 8);
  v20 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9B4A8);
  v9 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9B4B0);
  v24 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *v2;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C42AEFC();
  sub_23C42BCD0();
  if (v15)
  {
    if (v15 == 1)
    {
      v26 = 1;
      sub_23C42AF84();
      sub_23C42BC64();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v8, v20);
    }
    else
    {
      v27 = 2;
      sub_23C42AF40();
      v16 = v21;
      sub_23C42BC64();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v16, v23);
    }
  }
  else
  {
    v25 = 0;
    sub_23C42AFC8();
    sub_23C42BC64();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v18);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v14, v12);
}

unint64_t sub_23C42AEFC()
{
  unint64_t result;

  result = qword_256B9B4B8;
  if (!qword_256B9B4B8)
  {
    result = MEMORY[0x24261E834](&unk_23C42CAA0, &type metadata for SyncMonitorAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9B4B8);
  }
  return result;
}

unint64_t sub_23C42AF40()
{
  unint64_t result;

  result = qword_256B9B4C0;
  if (!qword_256B9B4C0)
  {
    result = MEMORY[0x24261E834](&unk_23C42CA50, &type metadata for SyncMonitorAction.SyncIfNeededCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9B4C0);
  }
  return result;
}

unint64_t sub_23C42AF84()
{
  unint64_t result;

  result = qword_256B9B4C8;
  if (!qword_256B9B4C8)
  {
    result = MEMORY[0x24261E834](&unk_23C42CA00, &type metadata for SyncMonitorAction.AppDidBecomeActiveCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9B4C8);
  }
  return result;
}

unint64_t sub_23C42AFC8()
{
  unint64_t result;

  result = qword_256B9B4D0;
  if (!qword_256B9B4D0)
  {
    result = MEMORY[0x24261E834](&unk_23C42C9B0, &type metadata for SyncMonitorAction.ViewAppearedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9B4D0);
  }
  return result;
}

uint64_t SyncMonitorAction.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
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
  _QWORD *v13;
  char *v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _BYTE *v38;
  char *v39;
  char *v40;
  _QWORD *v41;
  char v42;
  char v43;
  char v44;

  v38 = a2;
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9B4D8);
  v34 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v37);
  v40 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9B4E0);
  v35 = *(_QWORD *)(v4 - 8);
  v36 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v39 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9B4E8);
  v6 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9B4F0);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C42AEFC();
  v13 = v41;
  sub_23C42BCC4();
  if (v13)
    goto LABEL_7;
  v31 = v6;
  v32 = v10;
  v14 = v39;
  v15 = v40;
  v41 = a1;
  v16 = v12;
  v17 = sub_23C42BC58();
  v18 = v9;
  if (*(_QWORD *)(v17 + 16) != 1)
  {
    v23 = sub_23C42BBF8();
    swift_allocError();
    v25 = v24;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B9B2C0);
    *v25 = &type metadata for SyncMonitorAction;
    sub_23C42BC28();
    sub_23C42BBEC();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v23 - 8) + 104))(v25, *MEMORY[0x24BEE26D0], v23);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v16, v9);
    a1 = v41;
LABEL_7:
    v26 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v26);
  }
  v19 = *(unsigned __int8 *)(v17 + 32);
  if (*(_BYTE *)(v17 + 32))
  {
    if (v19 == 1)
    {
      v43 = 1;
      sub_23C42AF84();
      v20 = v9;
      sub_23C42BC1C();
      v21 = v38;
      v22 = v32;
      (*(void (**)(char *, uint64_t))(v35 + 8))(v14, v36);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v16, v20);
    }
    else
    {
      v44 = 2;
      sub_23C42AF40();
      v28 = v15;
      sub_23C42BC1C();
      v21 = v38;
      v29 = v32;
      (*(void (**)(char *, uint64_t))(v34 + 8))(v28, v37);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v29 + 8))(v16, v18);
    }
  }
  else
  {
    v42 = 0;
    sub_23C42AFC8();
    sub_23C42BC1C();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v8, v33);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v16, v9);
    v21 = v38;
  }
  *v21 = v19;
  v26 = (uint64_t)v41;
  return __swift_destroy_boxed_opaque_existential_1(v26);
}

unint64_t sub_23C42B454()
{
  unint64_t result;

  result = qword_256B9B4F8;
  if (!qword_256B9B4F8)
  {
    result = MEMORY[0x24261E834](&protocol conformance descriptor for SyncMonitorAction, &type metadata for SyncMonitorAction);
    atomic_store(result, (unint64_t *)&qword_256B9B4F8);
  }
  return result;
}

uint64_t sub_23C42B498@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return SyncMonitorAction.init(from:)(a1, a2);
}

uint64_t sub_23C42B4AC(_QWORD *a1)
{
  return SyncMonitorAction.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for SyncMonitorAction()
{
  return &type metadata for SyncMonitorAction;
}

uint64_t _s11FitnessSync17SyncMonitorActionOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s11FitnessSync17SyncMonitorActionOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C42B5B4 + 4 * byte_23C42C6B5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23C42B5E8 + 4 * byte_23C42C6B0[v4]))();
}

uint64_t sub_23C42B5E8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C42B5F0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C42B5F8);
  return result;
}

uint64_t sub_23C42B604(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C42B60CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23C42B610(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C42B618(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SyncMonitorAction.CodingKeys()
{
  return &type metadata for SyncMonitorAction.CodingKeys;
}

ValueMetadata *type metadata accessor for SyncMonitorAction.ViewAppearedCodingKeys()
{
  return &type metadata for SyncMonitorAction.ViewAppearedCodingKeys;
}

ValueMetadata *type metadata accessor for SyncMonitorAction.AppDidBecomeActiveCodingKeys()
{
  return &type metadata for SyncMonitorAction.AppDidBecomeActiveCodingKeys;
}

ValueMetadata *type metadata accessor for SyncMonitorAction.SyncIfNeededCodingKeys()
{
  return &type metadata for SyncMonitorAction.SyncIfNeededCodingKeys;
}

unint64_t sub_23C42B668()
{
  unint64_t result;

  result = qword_256B9B500;
  if (!qword_256B9B500)
  {
    result = MEMORY[0x24261E834](&unk_23C42C988, &type metadata for SyncMonitorAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9B500);
  }
  return result;
}

unint64_t sub_23C42B6B0()
{
  unint64_t result;

  result = qword_256B9B508;
  if (!qword_256B9B508)
  {
    result = MEMORY[0x24261E834](&unk_23C42C8A8, &type metadata for SyncMonitorAction.ViewAppearedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9B508);
  }
  return result;
}

unint64_t sub_23C42B6F8()
{
  unint64_t result;

  result = qword_256B9B510;
  if (!qword_256B9B510)
  {
    result = MEMORY[0x24261E834](&unk_23C42C8D0, &type metadata for SyncMonitorAction.ViewAppearedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9B510);
  }
  return result;
}

unint64_t sub_23C42B740()
{
  unint64_t result;

  result = qword_256B9B518;
  if (!qword_256B9B518)
  {
    result = MEMORY[0x24261E834](&unk_23C42C858, &type metadata for SyncMonitorAction.AppDidBecomeActiveCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9B518);
  }
  return result;
}

unint64_t sub_23C42B788()
{
  unint64_t result;

  result = qword_256B9B520;
  if (!qword_256B9B520)
  {
    result = MEMORY[0x24261E834](&unk_23C42C880, &type metadata for SyncMonitorAction.AppDidBecomeActiveCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9B520);
  }
  return result;
}

unint64_t sub_23C42B7D0()
{
  unint64_t result;

  result = qword_256B9B528;
  if (!qword_256B9B528)
  {
    result = MEMORY[0x24261E834](&unk_23C42C808, &type metadata for SyncMonitorAction.SyncIfNeededCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9B528);
  }
  return result;
}

unint64_t sub_23C42B818()
{
  unint64_t result;

  result = qword_256B9B530;
  if (!qword_256B9B530)
  {
    result = MEMORY[0x24261E834](&unk_23C42C830, &type metadata for SyncMonitorAction.SyncIfNeededCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9B530);
  }
  return result;
}

unint64_t sub_23C42B860()
{
  unint64_t result;

  result = qword_256B9B538;
  if (!qword_256B9B538)
  {
    result = MEMORY[0x24261E834](&unk_23C42C8F8, &type metadata for SyncMonitorAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9B538);
  }
  return result;
}

unint64_t sub_23C42B8A8()
{
  unint64_t result;

  result = qword_256B9B540;
  if (!qword_256B9B540)
  {
    result = MEMORY[0x24261E834](&unk_23C42C920, &type metadata for SyncMonitorAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9B540);
  }
  return result;
}

uint64_t sub_23C42B8EC(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0x6570704177656976 && a2 == 0xEC00000064657261 || (sub_23C42BC94() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000023C42D610 || (sub_23C42BC94() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x654E6649636E7973 && a2 == 0xEC00000064656465)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v5 = sub_23C42BC94();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t SyncMonitorEnvironment.makeAppDidBecomeActiveStream.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_retain();
  return v1;
}

uint64_t SyncMonitorEnvironment.syncCatalog.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_retain();
  return v1;
}

uint64_t SyncMonitorEnvironment.syncUserData.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_retain();
  return v1;
}

uint64_t SyncMonitorEnvironment.init(makeAppDidBecomeActiveStream:syncCatalog:syncUserData:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, _QWORD *a7@<X8>)
{
  *a7 = result;
  a7[1] = a2;
  a7[2] = a3;
  a7[3] = a4;
  a7[4] = a5;
  a7[5] = a6;
  return result;
}

ValueMetadata *type metadata accessor for SyncMonitorEnvironment()
{
  return &type metadata for SyncMonitorEnvironment;
}

uint64_t sub_23C42BAF0()
{
  return MEMORY[0x24BDCE2F8]();
}

uint64_t sub_23C42BAFC()
{
  return MEMORY[0x24BDCE330]();
}

uint64_t sub_23C42BB08()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_23C42BB14()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_23C42BB20()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_23C42BB2C()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23C42BB38()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_23C42BB44()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23C42BB50()
{
  return MEMORY[0x24BE2B460]();
}

uint64_t sub_23C42BB5C()
{
  return MEMORY[0x24BE2B560]();
}

uint64_t sub_23C42BB68()
{
  return MEMORY[0x24BE2B588]();
}

uint64_t sub_23C42BB74()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_23C42BB80()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_23C42BB8C()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_23C42BB98()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_23C42BBA4()
{
  return MEMORY[0x24BEE6980]();
}

uint64_t sub_23C42BBB0()
{
  return MEMORY[0x24BEE6A50]();
}

uint64_t sub_23C42BBBC()
{
  return MEMORY[0x24BEE6A58]();
}

uint64_t sub_23C42BBC8()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_23C42BBD4()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23C42BBE0()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_23C42BBEC()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_23C42BBF8()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_23C42BC04()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23C42BC10()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23C42BC1C()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_23C42BC28()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_23C42BC34()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_23C42BC40()
{
  return MEMORY[0x24BEE3360]();
}

uint64_t sub_23C42BC4C()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_23C42BC58()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_23C42BC64()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_23C42BC70()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_23C42BC7C()
{
  return MEMORY[0x24BEE34B0]();
}

uint64_t sub_23C42BC88()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_23C42BC94()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23C42BCA0()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23C42BCAC()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23C42BCB8()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23C42BCC4()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_23C42BCD0()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23C42BCDC()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23C42BCE8()
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

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
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

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
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

