BOOL static RemoteBrowsingIdleMonitorAction.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t RemoteBrowsingIdleMonitorAction.hash(into:)()
{
  return sub_23C38ADE8();
}

uint64_t sub_23C37F2A0()
{
  return 0;
}

uint64_t sub_23C37F2AC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_23C37F2D8()
{
  return 0;
}

void sub_23C37F2E4(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_23C37F2F0()
{
  sub_23C37F7F0();
  return sub_23C38AE24();
}

uint64_t sub_23C37F318()
{
  sub_23C37F7F0();
  return sub_23C38AE30();
}

uint64_t sub_23C37F340(char a1)
{
  if ((a1 & 1) != 0)
    return 0x4F656C6449707061;
  else
    return 0x6570704177656976;
}

BOOL sub_23C37F38C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_23C37F3A8()
{
  return sub_23C38ADE8();
}

uint64_t sub_23C37F3D4()
{
  char *v0;

  return sub_23C37F340(*v0);
}

uint64_t sub_23C37F3DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C380014(a1, a2);
  *a3 = result;
  return result;
}

void sub_23C37F400(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_23C37F40C()
{
  sub_23C37F7AC();
  return sub_23C38AE24();
}

uint64_t sub_23C37F434()
{
  sub_23C37F7AC();
  return sub_23C38AE30();
}

uint64_t sub_23C37F45C()
{
  sub_23C37F834();
  return sub_23C38AE24();
}

uint64_t sub_23C37F484()
{
  sub_23C37F834();
  return sub_23C38AE30();
}

uint64_t RemoteBrowsingIdleMonitorAction.hashValue.getter()
{
  sub_23C38ADDC();
  sub_23C38ADE8();
  return sub_23C38AE00();
}

uint64_t sub_23C37F4F0()
{
  sub_23C38ADDC();
  sub_23C38ADE8();
  return sub_23C38AE00();
}

uint64_t sub_23C37F534()
{
  sub_23C38ADDC();
  sub_23C38ADE8();
  return sub_23C38AE00();
}

uint64_t RemoteBrowsingIdleMonitorAction.encode(to:)(_QWORD *a1)
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

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B7FF38);
  v16 = *(_QWORD *)(v3 - 8);
  v17 = v3;
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B7FF40);
  v14 = *(_QWORD *)(v6 - 8);
  v15 = v6;
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B7FF48);
  v18 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C37F7AC();
  sub_23C38AE18();
  if ((v12 & 1) != 0)
  {
    v20 = 1;
    sub_23C37F7F0();
    sub_23C38AD88();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v17);
  }
  else
  {
    v19 = 0;
    sub_23C37F834();
    sub_23C38AD88();
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
    result = MEMORY[0x24261CC64]((char *)a1 + (int)result, -(result >> 32), 0, 0);
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

unint64_t sub_23C37F7AC()
{
  unint64_t result;

  result = qword_256B7FF50;
  if (!qword_256B7FF50)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38B414, &type metadata for RemoteBrowsingIdleMonitorAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B7FF50);
  }
  return result;
}

unint64_t sub_23C37F7F0()
{
  unint64_t result;

  result = qword_256B7FF58;
  if (!qword_256B7FF58)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38B3C4, &type metadata for RemoteBrowsingIdleMonitorAction.AppIdleOccuredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B7FF58);
  }
  return result;
}

unint64_t sub_23C37F834()
{
  unint64_t result;

  result = qword_256B7FF60;
  if (!qword_256B7FF60)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38B374, &type metadata for RemoteBrowsingIdleMonitorAction.ViewAppearedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B7FF60);
  }
  return result;
}

uint64_t RemoteBrowsingIdleMonitorAction.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
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
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B7FF68);
  v32 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8]();
  v31 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B7FF70);
  v4 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B7FF78);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C37F7AC();
  v11 = v33;
  sub_23C38AE0C();
  if (v11)
    goto LABEL_7;
  v26 = v4;
  v27 = a1;
  v12 = v31;
  v13 = v32;
  v33 = v8;
  v14 = sub_23C38AD7C();
  v15 = v7;
  if (*(_QWORD *)(v14 + 16) != 1)
  {
    v19 = sub_23C38ACF8();
    swift_allocError();
    v21 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B7FF80);
    *v21 = &type metadata for RemoteBrowsingIdleMonitorAction;
    sub_23C38AD34();
    sub_23C38ACEC();
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
    sub_23C37F7F0();
    sub_23C38AD28();
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
    sub_23C37F834();
    v22 = v6;
    sub_23C38AD28();
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

unint64_t sub_23C37FBF4()
{
  unint64_t result;

  result = qword_256B7FF88;
  if (!qword_256B7FF88)
  {
    result = MEMORY[0x24261CC7C](&protocol conformance descriptor for RemoteBrowsingIdleMonitorAction, &type metadata for RemoteBrowsingIdleMonitorAction);
    atomic_store(result, (unint64_t *)&qword_256B7FF88);
  }
  return result;
}

uint64_t sub_23C37FC38@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return RemoteBrowsingIdleMonitorAction.init(from:)(a1, a2);
}

uint64_t sub_23C37FC4C(_QWORD *a1)
{
  return RemoteBrowsingIdleMonitorAction.encode(to:)(a1);
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for RemoteBrowsingIdleMonitorAction()
{
  return &type metadata for RemoteBrowsingIdleMonitorAction;
}

uint64_t getEnumTagSinglePayload for SubscriptionHandoffFeature.TaskIdentifier(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s21FitnessRemoteBrowsing31RemoteBrowsingIdleMonitorActionOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C37FD68 + 4 * byte_23C38B0B5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C37FD9C + 4 * byte_23C38B0B0[v4]))();
}

uint64_t sub_23C37FD9C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C37FDA4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C37FDACLL);
  return result;
}

uint64_t sub_23C37FDB8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C37FDC0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C37FDC4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C37FDCC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C37FDD8(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23C37FDE0(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for RemoteBrowsingIdleMonitorAction.CodingKeys()
{
  return &type metadata for RemoteBrowsingIdleMonitorAction.CodingKeys;
}

ValueMetadata *type metadata accessor for RemoteBrowsingIdleMonitorAction.ViewAppearedCodingKeys()
{
  return &type metadata for RemoteBrowsingIdleMonitorAction.ViewAppearedCodingKeys;
}

ValueMetadata *type metadata accessor for RemoteBrowsingIdleMonitorAction.AppIdleOccuredCodingKeys()
{
  return &type metadata for RemoteBrowsingIdleMonitorAction.AppIdleOccuredCodingKeys;
}

unint64_t sub_23C37FE20()
{
  unint64_t result;

  result = qword_256B7FF90;
  if (!qword_256B7FF90)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38B34C, &type metadata for RemoteBrowsingIdleMonitorAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B7FF90);
  }
  return result;
}

unint64_t sub_23C37FE68()
{
  unint64_t result;

  result = qword_256B7FF98;
  if (!qword_256B7FF98)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38B26C, &type metadata for RemoteBrowsingIdleMonitorAction.ViewAppearedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B7FF98);
  }
  return result;
}

unint64_t sub_23C37FEB0()
{
  unint64_t result;

  result = qword_256B7FFA0;
  if (!qword_256B7FFA0)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38B294, &type metadata for RemoteBrowsingIdleMonitorAction.ViewAppearedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B7FFA0);
  }
  return result;
}

unint64_t sub_23C37FEF8()
{
  unint64_t result;

  result = qword_256B7FFA8;
  if (!qword_256B7FFA8)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38B21C, &type metadata for RemoteBrowsingIdleMonitorAction.AppIdleOccuredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B7FFA8);
  }
  return result;
}

unint64_t sub_23C37FF40()
{
  unint64_t result;

  result = qword_256B7FFB0;
  if (!qword_256B7FFB0)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38B244, &type metadata for RemoteBrowsingIdleMonitorAction.AppIdleOccuredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B7FFB0);
  }
  return result;
}

unint64_t sub_23C37FF88()
{
  unint64_t result;

  result = qword_256B7FFB8;
  if (!qword_256B7FFB8)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38B2BC, &type metadata for RemoteBrowsingIdleMonitorAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B7FFB8);
  }
  return result;
}

unint64_t sub_23C37FFD0()
{
  unint64_t result;

  result = qword_256B7FFC0;
  if (!qword_256B7FFC0)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38B2E4, &type metadata for RemoteBrowsingIdleMonitorAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B7FFC0);
  }
  return result;
}

uint64_t sub_23C380014(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6570704177656976 && a2 == 0xEC00000064657261;
  if (v3 || (sub_23C38ADD0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4F656C6449707061 && a2 == 0xEE00646572756363)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23C38ADD0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

BOOL static SubscriptionHandoffAction.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t SubscriptionHandoffAction.hash(into:)()
{
  return sub_23C38ADE8();
}

uint64_t sub_23C38016C(char a1)
{
  if (!a1)
    return 0x6570704177656976;
  if (a1 == 1)
    return 0xD000000000000031;
  return 0xD00000000000002FLL;
}

uint64_t sub_23C3801D0()
{
  sub_23C38068C();
  return sub_23C38AE24();
}

uint64_t sub_23C3801F8()
{
  sub_23C38068C();
  return sub_23C38AE30();
}

BOOL sub_23C380220(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23C380234()
{
  char *v0;

  return sub_23C38016C(*v0);
}

uint64_t sub_23C38023C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C380FFC(a1, a2);
  *a3 = result;
  return result;
}

void sub_23C380260(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_23C38026C()
{
  sub_23C380604();
  return sub_23C38AE24();
}

uint64_t sub_23C380294()
{
  sub_23C380604();
  return sub_23C38AE30();
}

uint64_t sub_23C3802BC()
{
  sub_23C380648();
  return sub_23C38AE24();
}

uint64_t sub_23C3802E4()
{
  sub_23C380648();
  return sub_23C38AE30();
}

uint64_t sub_23C38030C()
{
  sub_23C3806D0();
  return sub_23C38AE24();
}

uint64_t sub_23C380334()
{
  sub_23C3806D0();
  return sub_23C38AE30();
}

uint64_t SubscriptionHandoffAction.hashValue.getter()
{
  sub_23C38ADDC();
  sub_23C38ADE8();
  return sub_23C38AE00();
}

uint64_t SubscriptionHandoffAction.encode(to:)(_QWORD *a1)
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
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B7FFC8);
  v22 = *(_QWORD *)(v4 - 8);
  v23 = v4;
  MEMORY[0x24BDAC7A8]();
  v21 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B7FFD0);
  v19 = *(_QWORD *)(v6 - 8);
  v20 = v6;
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B7FFD8);
  v9 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B7FFE0);
  v24 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8]();
  v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *v2;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C380604();
  sub_23C38AE18();
  if (v15)
  {
    if (v15 == 1)
    {
      v26 = 1;
      sub_23C38068C();
      sub_23C38AD88();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v8, v20);
    }
    else
    {
      v27 = 2;
      sub_23C380648();
      v16 = v21;
      sub_23C38AD88();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v16, v23);
    }
  }
  else
  {
    v25 = 0;
    sub_23C3806D0();
    sub_23C38AD88();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v18);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v14, v12);
}

unint64_t sub_23C380604()
{
  unint64_t result;

  result = qword_256B7FFE8;
  if (!qword_256B7FFE8)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38B8B4, &type metadata for SubscriptionHandoffAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B7FFE8);
  }
  return result;
}

unint64_t sub_23C380648()
{
  unint64_t result;

  result = qword_256B7FFF0;
  if (!qword_256B7FFF0)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38B864, &type metadata for SubscriptionHandoffAction.EndRemoteBrowsingServiceSubscriptionObservationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B7FFF0);
  }
  return result;
}

unint64_t sub_23C38068C()
{
  unint64_t result;

  result = qword_256B7FFF8;
  if (!qword_256B7FFF8)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38B814, &type metadata for SubscriptionHandoffAction.BeginRemoteBrowsingServiceSubscriptionObservationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B7FFF8);
  }
  return result;
}

unint64_t sub_23C3806D0()
{
  unint64_t result;

  result = qword_256B80000;
  if (!qword_256B80000)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38B7C4, &type metadata for SubscriptionHandoffAction.ViewAppearedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B80000);
  }
  return result;
}

uint64_t SubscriptionHandoffAction.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
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
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B80008);
  v34 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8]();
  v40 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B80010);
  v35 = *(_QWORD *)(v4 - 8);
  v36 = v4;
  MEMORY[0x24BDAC7A8]();
  v39 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B80018);
  v6 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B80020);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8]();
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C380604();
  v13 = v41;
  sub_23C38AE0C();
  if (v13)
    goto LABEL_7;
  v31 = v6;
  v32 = v10;
  v14 = v39;
  v15 = v40;
  v41 = a1;
  v16 = v12;
  v17 = sub_23C38AD7C();
  v18 = v9;
  if (*(_QWORD *)(v17 + 16) != 1)
  {
    v23 = sub_23C38ACF8();
    swift_allocError();
    v25 = v24;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B7FF80);
    *v25 = &type metadata for SubscriptionHandoffAction;
    sub_23C38AD34();
    sub_23C38ACEC();
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
      sub_23C38068C();
      v20 = v9;
      sub_23C38AD28();
      v21 = v38;
      v22 = v32;
      (*(void (**)(char *, uint64_t))(v35 + 8))(v14, v36);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v16, v20);
    }
    else
    {
      v44 = 2;
      sub_23C380648();
      v28 = v15;
      sub_23C38AD28();
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
    sub_23C3806D0();
    sub_23C38AD28();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v8, v33);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v16, v9);
    v21 = v38;
  }
  *v21 = v19;
  v26 = (uint64_t)v41;
  return __swift_destroy_boxed_opaque_existential_1(v26);
}

unint64_t sub_23C380B5C()
{
  unint64_t result;

  result = qword_256B80028;
  if (!qword_256B80028)
  {
    result = MEMORY[0x24261CC7C](&protocol conformance descriptor for SubscriptionHandoffAction, &type metadata for SubscriptionHandoffAction);
    atomic_store(result, (unint64_t *)&qword_256B80028);
  }
  return result;
}

uint64_t sub_23C380BA0@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return SubscriptionHandoffAction.init(from:)(a1, a2);
}

uint64_t sub_23C380BB4(_QWORD *a1)
{
  return SubscriptionHandoffAction.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for SubscriptionHandoffAction()
{
  return &type metadata for SubscriptionHandoffAction;
}

uint64_t _s21FitnessRemoteBrowsing25SubscriptionHandoffActionOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s21FitnessRemoteBrowsing25SubscriptionHandoffActionOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C380CBC + 4 * byte_23C38B475[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23C380CF0 + 4 * byte_23C38B470[v4]))();
}

uint64_t sub_23C380CF0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C380CF8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C380D00);
  return result;
}

uint64_t sub_23C380D0C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C380D14);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23C380D18(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C380D20(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_23C380D2C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SubscriptionHandoffAction.CodingKeys()
{
  return &type metadata for SubscriptionHandoffAction.CodingKeys;
}

ValueMetadata *type metadata accessor for SubscriptionHandoffAction.ViewAppearedCodingKeys()
{
  return &type metadata for SubscriptionHandoffAction.ViewAppearedCodingKeys;
}

ValueMetadata *type metadata accessor for SubscriptionHandoffAction.BeginRemoteBrowsingServiceSubscriptionObservationCodingKeys()
{
  return &type metadata for SubscriptionHandoffAction.BeginRemoteBrowsingServiceSubscriptionObservationCodingKeys;
}

ValueMetadata *type metadata accessor for SubscriptionHandoffAction.EndRemoteBrowsingServiceSubscriptionObservationCodingKeys()
{
  return &type metadata for SubscriptionHandoffAction.EndRemoteBrowsingServiceSubscriptionObservationCodingKeys;
}

unint64_t sub_23C380D78()
{
  unint64_t result;

  result = qword_256B80030;
  if (!qword_256B80030)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38B79C, &type metadata for SubscriptionHandoffAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B80030);
  }
  return result;
}

unint64_t sub_23C380DC0()
{
  unint64_t result;

  result = qword_256B80038;
  if (!qword_256B80038)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38B6BC, &type metadata for SubscriptionHandoffAction.ViewAppearedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B80038);
  }
  return result;
}

unint64_t sub_23C380E08()
{
  unint64_t result;

  result = qword_256B80040;
  if (!qword_256B80040)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38B6E4, &type metadata for SubscriptionHandoffAction.ViewAppearedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B80040);
  }
  return result;
}

unint64_t sub_23C380E50()
{
  unint64_t result;

  result = qword_256B80048;
  if (!qword_256B80048)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38B66C, &type metadata for SubscriptionHandoffAction.BeginRemoteBrowsingServiceSubscriptionObservationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B80048);
  }
  return result;
}

unint64_t sub_23C380E98()
{
  unint64_t result;

  result = qword_256B80050;
  if (!qword_256B80050)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38B694, &type metadata for SubscriptionHandoffAction.BeginRemoteBrowsingServiceSubscriptionObservationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B80050);
  }
  return result;
}

unint64_t sub_23C380EE0()
{
  unint64_t result;

  result = qword_256B80058;
  if (!qword_256B80058)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38B61C, &type metadata for SubscriptionHandoffAction.EndRemoteBrowsingServiceSubscriptionObservationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B80058);
  }
  return result;
}

unint64_t sub_23C380F28()
{
  unint64_t result;

  result = qword_256B80060;
  if (!qword_256B80060)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38B644, &type metadata for SubscriptionHandoffAction.EndRemoteBrowsingServiceSubscriptionObservationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B80060);
  }
  return result;
}

unint64_t sub_23C380F70()
{
  unint64_t result;

  result = qword_256B80068;
  if (!qword_256B80068)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38B70C, &type metadata for SubscriptionHandoffAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B80068);
  }
  return result;
}

unint64_t sub_23C380FB8()
{
  unint64_t result;

  result = qword_256B80070;
  if (!qword_256B80070)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38B734, &type metadata for SubscriptionHandoffAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B80070);
  }
  return result;
}

uint64_t sub_23C380FFC(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6570704177656976 && a2 == 0xEC00000064657261;
  if (v3 || (sub_23C38ADD0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000031 && a2 == 0x800000023C38D8A0 || (sub_23C38ADD0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD00000000000002FLL && a2 == 0x800000023C38D8E0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_23C38ADD0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

__n128 SubscriptionHandoffFeature.init(environment:)@<Q0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 16);
  *a2 = *(_OWORD *)a1;
  a2[1] = v3;
  return result;
}

uint64_t SubscriptionHandoffFeature.reduce(localState:sharedState:sideEffects:action:)(uint64_t a1, uint64_t a2, unint64_t *a3, _BYTE *a4)
{
  uint64_t *v4;
  uint64_t v7;
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
  char *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int *v24;
  char *v25;
  char *v26;
  uint64_t v27;
  char *v28;
  unint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t result;
  int *v41;
  char *v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  void (*v51)(char *, _QWORD, uint64_t);
  unint64_t v52;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  unint64_t *v57;
  int *v58;
  char *v59;
  char *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  _QWORD *v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  void (*v74)(unint64_t, char *, uint64_t);
  void (*v75)(char *, _QWORD, uint64_t);
  uint64_t v76;
  unint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  char v80;
  char v81;
  char v82;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B80078);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v11 = (char *)&v71 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v71 - v13;
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&v71 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v71 - v18;
  v20 = *a4;
  if (*a4)
  {
    v79 = v7;
    v21 = *v4;
    v22 = v4[1];
    v23 = v4[3];
    v78 = v4[2];
    if (v20 == 1)
    {
      v24 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_256B800A0);
      v77 = (unint64_t *)&v17[v24[20]];
      v25 = &v17[v24[24]];
      v26 = &v17[v24[28]];
      v27 = v21;
      v28 = &v17[v24[32]];
      v80 = 0;
      sub_23C381854();
      sub_23C38ACD4();
      *((_QWORD *)v17 + 5) = 0x4014000000000000;
      v17[48] = 1;
      v29 = a3;
      v30 = *MEMORY[0x24BE2B570];
      v31 = sub_23C38ABE4();
      v32 = v30;
      a3 = v29;
      (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 104))(v25, v32, v31);
      v33 = *MEMORY[0x24BE2B550];
      v34 = sub_23C38ABD8();
      (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 104))(v26, v33, v34);
      v35 = (_QWORD *)swift_allocObject();
      v35[2] = v27;
      v35[3] = v22;
      v35[4] = v78;
      v35[5] = v23;
      *(_QWORD *)v28 = &unk_256B800B0;
      *((_QWORD *)v28 + 1) = v35;
      swift_retain();
      swift_retain();
      sub_23C38AC98();
      v36 = v79;
      (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v17, *MEMORY[0x24BE2B440], v79);
      v37 = *a3;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v37 = sub_23C382408(0, *(_QWORD *)(v37 + 16) + 1, 1, v37, &qword_256B80110, &qword_256B80078);
      v39 = *(_QWORD *)(v37 + 16);
      v38 = *(_QWORD *)(v37 + 24);
      if (v39 >= v38 >> 1)
        v37 = sub_23C382408(v38 > 1, v39 + 1, 1, v37, &qword_256B80110, &qword_256B80078);
      *(_QWORD *)(v37 + 16) = v39 + 1;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v8 + 32))(v37+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(_QWORD *)(v8 + 72) * v39, v17, v36);
    }
    else
    {
      v82 = 0;
      sub_23C381854();
      sub_23C38ACD4();
      v51 = *(void (**)(char *, _QWORD, uint64_t))(v8 + 104);
      v51(v14, *MEMORY[0x24BE2B448], v79);
      v77 = a3;
      v52 = *a3;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v75 = v51;
      v76 = v21;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        v52 = sub_23C382408(0, *(_QWORD *)(v52 + 16) + 1, 1, v52, &qword_256B80110, &qword_256B80078);
      v55 = *(_QWORD *)(v52 + 16);
      v54 = *(_QWORD *)(v52 + 24);
      if (v55 >= v54 >> 1)
        v52 = sub_23C382408(v54 > 1, v55 + 1, 1, v52, &qword_256B80110, &qword_256B80078);
      *(_QWORD *)(v52 + 16) = v55 + 1;
      v73 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      v72 = *(_QWORD *)(v8 + 72);
      v56 = v79;
      v74 = *(void (**)(unint64_t, char *, uint64_t))(v8 + 32);
      v74(v52 + v73 + v72 * v55, v14, v79);
      v57 = v77;
      *v77 = v52;
      v58 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_256B80088);
      v59 = &v11[v58[16]];
      v60 = &v11[v58[20]];
      v61 = &v11[v58[24]];
      v81 = 1;
      sub_23C38ACD4();
      v62 = *MEMORY[0x24BE2B570];
      v63 = sub_23C38ABE4();
      (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v63 - 8) + 104))(v59, v62, v63);
      v64 = *MEMORY[0x24BE2B550];
      v65 = sub_23C38ABD8();
      v66 = v60;
      a3 = v57;
      (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v65 - 8) + 104))(v66, v64, v65);
      v67 = (_QWORD *)swift_allocObject();
      v67[2] = v76;
      v67[3] = v22;
      v68 = v56;
      v67[4] = v78;
      v67[5] = v23;
      *(_QWORD *)v61 = &unk_256B80098;
      *((_QWORD *)v61 + 1) = v67;
      swift_retain();
      swift_retain();
      sub_23C38AC98();
      v75(v11, *MEMORY[0x24BE2B438], v56);
      v37 = *v57;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v37 = sub_23C382408(0, *(_QWORD *)(v37 + 16) + 1, 1, v37, &qword_256B80110, &qword_256B80078);
      v70 = *(_QWORD *)(v37 + 16);
      v69 = *(_QWORD *)(v37 + 24);
      if (v70 >= v69 >> 1)
        v37 = sub_23C382408(v69 > 1, v70 + 1, 1, v37, &qword_256B80110, &qword_256B80078);
      *(_QWORD *)(v37 + 16) = v70 + 1;
      result = ((uint64_t (*)(unint64_t, char *, uint64_t))v74)(v37 + v73 + v70 * v72, v11, v68);
    }
  }
  else
  {
    v41 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_256B80088);
    v42 = &v19[v41[16]];
    v43 = &v19[v41[20]];
    v44 = &v19[v41[24]];
    *(_OWORD *)v19 = 0u;
    *((_OWORD *)v19 + 1) = 0u;
    *((_QWORD *)v19 + 4) = 0;
    *(_QWORD *)v44 = &unk_256B800B8;
    *((_QWORD *)v44 + 1) = 0;
    sub_23C38AC98();
    v45 = *MEMORY[0x24BE2B578];
    v46 = sub_23C38ABE4();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v46 - 8) + 104))(v42, v45, v46);
    v47 = *MEMORY[0x24BE2B558];
    v48 = sub_23C38ABD8();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v48 - 8) + 104))(v43, v47, v48);
    (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v19, *MEMORY[0x24BE2B438], v7);
    v37 = *a3;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v37 = sub_23C382408(0, *(_QWORD *)(v37 + 16) + 1, 1, v37, &qword_256B80110, &qword_256B80078);
    v50 = *(_QWORD *)(v37 + 16);
    v49 = *(_QWORD *)(v37 + 24);
    if (v50 >= v49 >> 1)
      v37 = sub_23C382408(v49 > 1, v50 + 1, 1, v37, &qword_256B80110, &qword_256B80078);
    *(_QWORD *)(v37 + 16) = v50 + 1;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v8 + 32))(v37+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(_QWORD *)(v8 + 72) * v50, v19, v7);
  }
  *a3 = v37;
  return result;
}

unint64_t sub_23C381854()
{
  unint64_t result;

  result = qword_256B80080;
  if (!qword_256B80080)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38B9E4, &type metadata for SubscriptionHandoffFeature.TaskIdentifier);
    atomic_store(result, (unint64_t *)&qword_256B80080);
  }
  return result;
}

uint64_t sub_23C381898()
{
  uint64_t v0;
  _QWORD *v1;

  *(_QWORD *)(v0 + 16) = sub_23C38AC8C();
  *(_QWORD *)(v0 + 24) = sub_23C38AC80();
  *(_BYTE *)(v0 + 40) = 1;
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B800F8);
  *v1 = v0;
  v1[1] = sub_23C38192C;
  return sub_23C38ABCC();
}

uint64_t sub_23C38192C()
{
  swift_task_dealloc();
  sub_23C38AC68();
  return swift_task_switch();
}

uint64_t sub_23C38199C()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C3819D0(uint64_t a1, int *a2)
{
  _QWORD *v2;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v2[4] = a1;
  v2[5] = sub_23C38AC8C();
  v2[6] = sub_23C38AC80();
  v6 = (uint64_t (*)(void))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  v2[7] = v4;
  *v4 = v2;
  v4[1] = sub_23C381A50;
  return v6();
}

uint64_t sub_23C381A50()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = *v1;
  *(_QWORD *)(v2 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    sub_23C38AC68();
    return swift_task_switch();
  }
  else
  {
    *(_BYTE *)(v2 + 80) = 2;
    v4 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v2 + 72) = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B800F8);
    *v4 = v2;
    v4[1] = sub_23C381B24;
    return sub_23C38ABCC();
  }
}

uint64_t sub_23C381B24()
{
  swift_task_dealloc();
  sub_23C38AC68();
  return swift_task_switch();
}

uint64_t sub_23C381B94()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C381BC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  BOOL v5;
  uint64_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v12;

  swift_release();
  if (qword_256B7FF30 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 64);
  v2 = sub_23C38AB0C();
  __swift_project_value_buffer(v2, (uint64_t)qword_256B842C0);
  MEMORY[0x24261CBF8](v1);
  MEMORY[0x24261CBF8](v1);
  v3 = sub_23C38AAF4();
  v4 = sub_23C38ACB0();
  v5 = os_log_type_enabled(v3, v4);
  v6 = *(_QWORD *)(v0 + 64);
  if (v5)
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v12 = v8;
    *(_DWORD *)v7 = 136315138;
    *(_QWORD *)(v0 + 16) = v6;
    MEMORY[0x24261CBF8](v6);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B80100);
    v9 = sub_23C38AC20();
    *(_QWORD *)(v0 + 24) = sub_23C382614(v9, v10, &v12);
    sub_23C38ACBC();
    swift_bridgeObjectRelease();
    MEMORY[0x24261CBEC](v6);
    MEMORY[0x24261CBEC](v6);
    _os_log_impl(&dword_23C37D000, v3, v4, "Observation of remote browsing service subscription returns %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24261CCDC](v8, -1, -1);
    MEMORY[0x24261CCDC](v7, -1, -1);

    MEMORY[0x24261CBEC](v6);
  }
  else
  {
    MEMORY[0x24261CBEC](*(_QWORD *)(v0 + 64));
    MEMORY[0x24261CBEC](v6);
    MEMORY[0x24261CBEC](v6);

  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C381DC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[2] = a4;
  v5[3] = a5;
  sub_23C38AC8C();
  v5[4] = sub_23C38AC80();
  sub_23C38AC68();
  return swift_task_switch();
}

uint64_t sub_23C381E30()
{
  uint64_t v0;
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(v0 + 16);
  v2 = swift_release();
  v1(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C381E78(uint64_t a1)
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
  v8[1] = sub_23C382DC4;
  return sub_23C381DC4(a1, v4, v5, v7, v6);
}

uint64_t objectdestroyTm()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23C381F1C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23C381F90;
  return sub_23C3819D0(a1, v4);
}

uint64_t sub_23C381F90()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

unint64_t sub_23C381FDC()
{
  unint64_t result;

  result = qword_256B800C0;
  if (!qword_256B800C0)
  {
    result = MEMORY[0x24261CC7C](&protocol conformance descriptor for SubscriptionHandoffAction, &type metadata for SubscriptionHandoffAction);
    atomic_store(result, (unint64_t *)&qword_256B800C0);
  }
  return result;
}

unint64_t sub_23C382024()
{
  unint64_t result;

  result = qword_256B800C8;
  if (!qword_256B800C8)
  {
    result = MEMORY[0x24261CC7C](&protocol conformance descriptor for SubscriptionHandoffAction, &type metadata for SubscriptionHandoffAction);
    atomic_store(result, (unint64_t *)&qword_256B800C8);
  }
  return result;
}

unint64_t sub_23C38206C()
{
  unint64_t result;

  result = qword_256B800D0;
  if (!qword_256B800D0)
  {
    result = MEMORY[0x24261CC7C](MEMORY[0x24BE2B430], MEMORY[0x24BE2B428]);
    atomic_store(result, (unint64_t *)&qword_256B800D0);
  }
  return result;
}

unint64_t sub_23C3820B4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256B800D8;
  if (!qword_256B800D8)
  {
    v1 = type metadata accessor for SubscriptionHandoffState();
    result = MEMORY[0x24261CC7C](&protocol conformance descriptor for SubscriptionHandoffState, v1);
    atomic_store(result, (unint64_t *)&qword_256B800D8);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for SubscriptionHandoffEnvironment(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SubscriptionHandoffEnvironment()
{
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for SubscriptionHandoffEnvironment(uint64_t a1, uint64_t a2)
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

_QWORD *assignWithCopy for SubscriptionHandoffEnvironment(_QWORD *a1, _QWORD *a2)
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

_OWORD *assignWithTake for SubscriptionHandoffEnvironment(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SubscriptionHandoffEnvironment(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SubscriptionHandoffEnvironment(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SubscriptionHandoffFeature()
{
  return &type metadata for SubscriptionHandoffFeature;
}

uint64_t storeEnumTagSinglePayload for SubscriptionHandoffFeature.TaskIdentifier(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C38232C + 4 * byte_23C38B915[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C382360 + 4 * byte_23C38B910[v4]))();
}

uint64_t sub_23C382360(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C382368(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C382370);
  return result;
}

uint64_t sub_23C38237C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C382384);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C382388(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C382390(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SubscriptionHandoffFeature.TaskIdentifier()
{
  return &type metadata for SubscriptionHandoffFeature.TaskIdentifier;
}

unint64_t sub_23C3823B0()
{
  unint64_t result;

  result = qword_256B800E0;
  if (!qword_256B800E0)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38B9BC, &type metadata for SubscriptionHandoffFeature.TaskIdentifier);
    atomic_store(result, (unint64_t *)&qword_256B800E0);
  }
  return result;
}

uint64_t sub_23C3823F4(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_23C382408(a1, a2, a3, a4, &qword_256B800E8, &qword_256B800F0);
}

uint64_t sub_23C382408(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t *a6)
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
  v13 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(a6) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  v17 = _swift_stdlib_malloc_size(v16);
  if (!v14 || (v17 - v15 == 0x8000000000000000 ? (v18 = v14 == -1) : (v18 = 0), v18))
  {
LABEL_29:
    result = sub_23C38AD10();
    __break(1u);
    return result;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  v19 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(a6) - 8);
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
    sub_23C382C54(0, v11, v21, a4, a6);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v16;
}

uint64_t sub_23C382614(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_23C3826E4(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_23C382D88((uint64_t)v12, *a3);
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
      sub_23C382D88((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_23C3826E4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_23C38ACC8();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_23C38289C(a5, a6);
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
  v8 = sub_23C38AD04();
  if (!v8)
  {
    sub_23C38AD10();
    __break(1u);
LABEL_17:
    result = sub_23C38AD1C();
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

uint64_t sub_23C38289C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23C382930(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23C382B08(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_23C382B08(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23C382930(uint64_t a1, unint64_t a2)
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
      v3 = sub_23C382AA4(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_23C38ACE0();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_23C38AD10();
      __break(1u);
LABEL_10:
      v2 = sub_23C38AC44();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_23C38AD1C();
    __break(1u);
LABEL_14:
    result = sub_23C38AD10();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_23C382AA4(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B80108);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23C382B08(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B80108);
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
  result = sub_23C38AD1C();
  __break(1u);
  return result;
}

uint64_t sub_23C382C54(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
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
    v9 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(a5) - 8);
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
  result = sub_23C38AD1C();
  __break(1u);
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_23C382D88(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t RemoteBrowsingIdleMonitorEnvironment.init(invalidateRemoteBrowsing:makeAppIdleOccurredStream:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

ValueMetadata *type metadata accessor for RemoteBrowsingIdleMonitorEnvironment()
{
  return &type metadata for RemoteBrowsingIdleMonitorEnvironment;
}

__n128 RemoteBrowsingIdleMonitorFeature.init(environment:)@<Q0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 16);
  *a2 = *(_OWORD *)a1;
  a2[1] = v3;
  return result;
}

uint64_t RemoteBrowsingIdleMonitorFeature.reduce(localState:sharedState:sideEffects:action:)(uint64_t a1, _BYTE *a2, unint64_t *a3, char *a4)
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
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  int *v25;
  char *v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  char *v34;
  unint64_t *v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  int *v40;
  char *v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  unint64_t v53;
  uint64_t v54;
  unint64_t *v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  char v60;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B800F0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v54 - v14;
  v16 = *a4;
  v18 = *v4;
  v17 = v4[1];
  v19 = v4[2];
  v20 = v4[3];
  if ((v16 & 1) != 0)
  {
    v56 = (char *)v9;
    if (*a2 != 1)
      return result;
    v57 = v18;
    v58 = v19;
    if (qword_256B7FF30 != -1)
      swift_once();
    v55 = a3;
    v21 = sub_23C38AB0C();
    __swift_project_value_buffer(v21, (uint64_t)qword_256B842C0);
    v22 = sub_23C38AAF4();
    v23 = sub_23C38ACB0();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_23C37D000, v22, v23, "App Idle Occured", v24, 2u);
      MEMORY[0x24261CCDC](v24, -1, -1);
    }

    v25 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_256B80088);
    v26 = &v12[v25[16]];
    v27 = &v12[v25[20]];
    v28 = &v12[v25[24]];
    v60 = 1;
    sub_23C3839A0();
    sub_23C38ACD4();
    v29 = *MEMORY[0x24BE2B570];
    v30 = sub_23C38ABE4();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 104))(v26, v29, v30);
    v31 = *MEMORY[0x24BE2B550];
    v32 = sub_23C38ABD8();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 104))(v27, v31, v32);
    v33 = (_QWORD *)swift_allocObject();
    v33[2] = v57;
    v33[3] = v17;
    v33[4] = v58;
    v33[5] = v20;
    *(_QWORD *)v28 = &unk_256B80128;
    *((_QWORD *)v28 + 1) = v33;
    swift_retain();
    swift_retain();
    sub_23C38AC98();
    v34 = v56;
    (*((void (**)(char *, _QWORD, uint64_t))v56 + 13))(v12, *MEMORY[0x24BE2B438], v8);
    v35 = v55;
    v36 = *v55;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v36 = sub_23C3823F4(0, *(_QWORD *)(v36 + 16) + 1, 1, v36);
    v38 = *(_QWORD *)(v36 + 16);
    v37 = *(_QWORD *)(v36 + 24);
    v39 = v38 + 1;
    if (v38 >= v37 >> 1)
      v36 = sub_23C3823F4(v37 > 1, v38 + 1, 1, v36);
    v15 = v12;
  }
  else
  {
    a2[1] = 1;
    v57 = v18;
    v58 = v19;
    v40 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_256B80088);
    v56 = &v15[v40[12]];
    v41 = &v15[v40[16]];
    v42 = &v15[v40[20]];
    v43 = &v15[v40[24]];
    v59 = 0;
    sub_23C3839A0();
    sub_23C38ACD4();
    v44 = v20;
    v45 = v8;
    v46 = a3;
    v47 = *MEMORY[0x24BE2B570];
    v48 = sub_23C38ABE4();
    v49 = v47;
    v35 = v46;
    v8 = v45;
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v48 - 8) + 104))(v41, v49, v48);
    v50 = *MEMORY[0x24BE2B550];
    v51 = sub_23C38ABD8();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v51 - 8) + 104))(v42, v50, v51);
    v52 = (_QWORD *)swift_allocObject();
    v52[2] = v57;
    v52[3] = v17;
    v52[4] = v58;
    v52[5] = v44;
    *(_QWORD *)v43 = &unk_256B80138;
    *((_QWORD *)v43 + 1) = v52;
    swift_retain();
    swift_retain();
    sub_23C38AC98();
    (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v15, *MEMORY[0x24BE2B438], v45);
    v36 = *v35;
    v34 = (char *)v9;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v36 = sub_23C3823F4(0, *(_QWORD *)(v36 + 16) + 1, 1, v36);
    v38 = *(_QWORD *)(v36 + 16);
    v53 = *(_QWORD *)(v36 + 24);
    v39 = v38 + 1;
    if (v38 >= v53 >> 1)
      v36 = sub_23C3823F4(v53 > 1, v38 + 1, 1, v36);
  }
  *(_QWORD *)(v36 + 16) = v39;
  result = (*((uint64_t (**)(unint64_t, char *, uint64_t))v34 + 4))(v36+ ((v34[80] + 32) & ~(unint64_t)v34[80])+ *((_QWORD *)v34 + 9) * v38, v15, v8);
  *v35 = v36;
  return result;
}

uint64_t sub_23C3832A4(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  _QWORD *v4;
  _QWORD *v6;
  uint64_t (*v8)(_QWORD *);

  v4[12] = a1;
  v4[13] = sub_23C38AC8C();
  v4[14] = sub_23C38AC80();
  v8 = (uint64_t (*)(_QWORD *))((char *)a4 + *a4);
  v6 = (_QWORD *)swift_task_alloc();
  v4[15] = v6;
  *v6 = v4;
  v6[1] = sub_23C383334;
  return v8(v4 + 7);
}

uint64_t sub_23C383334()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v1;
  *(_QWORD *)(*v1 + 128) = v0;
  swift_task_dealloc();
  *(_QWORD *)(v2 + 136) = sub_23C38AC68();
  *(_QWORD *)(v2 + 144) = v3;
  return swift_task_switch();
}

uint64_t sub_23C3833C0()
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
  sub_23C38ACA4();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
  v0[19] = sub_23C38AC80();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v0[5]);
  v5 = (_QWORD *)swift_task_alloc();
  v0[20] = (uint64_t)v5;
  *v5 = v0;
  v5[1] = sub_23C383520;
  return sub_23C38AC74();
}

uint64_t sub_23C383520()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_23C383574()
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
    *(_BYTE *)(v0 + 177) = 1;
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 168) = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B80160);
    *v2 = v0;
    v2[1] = sub_23C383628;
    return sub_23C38ABCC();
  }
}

uint64_t sub_23C383628()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23C383674()
{
  uint64_t *v0;
  _QWORD *v1;

  v0[19] = sub_23C38AC80();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v0[5]);
  v1 = (_QWORD *)swift_task_alloc();
  v0[20] = (uint64_t)v1;
  *v1 = v0;
  v1[1] = sub_23C383520;
  return sub_23C38AC74();
}

uint64_t sub_23C383718()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C38374C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;

  v3[2] = a2;
  v3[3] = a3;
  sub_23C38AC8C();
  v3[4] = sub_23C38AC80();
  v3[5] = sub_23C38AC68();
  v3[6] = v4;
  return swift_task_switch();
}

uint64_t sub_23C3837B8()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  int *v5;
  _QWORD *v6;
  uint64_t (*v8)(void);

  if (qword_256B7FF30 != -1)
    swift_once();
  v1 = sub_23C38AB0C();
  __swift_project_value_buffer(v1, (uint64_t)qword_256B842C0);
  v2 = sub_23C38AAF4();
  v3 = sub_23C38ACB0();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_23C37D000, v2, v3, "Invalidating Remote Browsing", v4, 2u);
    MEMORY[0x24261CCDC](v4, -1, -1);
  }
  v5 = *(int **)(v0 + 16);

  v8 = (uint64_t (*)(void))((char *)v5 + *v5);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v6;
  *v6 = v0;
  v6[1] = sub_23C3838C4;
  return v8();
}

uint64_t sub_23C3838C4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 64) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23C383924()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C383958()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t RemoteBrowsingIdleMonitorFeature.dispose(localState:sharedState:)(uint64_t result)
{
  *(_BYTE *)(result + 1) = 0;
  return result;
}

void sub_23C383994(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(a2 + 1) = 0;
}

unint64_t sub_23C3839A0()
{
  unint64_t result;

  result = qword_256B80118;
  if (!qword_256B80118)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38BB78, &type metadata for RemoteBrowsingIdleMonitorFeature.TaskIdentifier);
    atomic_store(result, &qword_256B80118);
  }
  return result;
}

uint64_t sub_23C3839E8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_23C381F90;
  return sub_23C38374C(a1, v4, v5);
}

uint64_t sub_23C383A60(uint64_t a1)
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
  v7[1] = sub_23C382DC4;
  return sub_23C3832A4(a1, v4, v5, v6);
}

unint64_t sub_23C383AD8()
{
  unint64_t result;

  result = qword_256B80140;
  if (!qword_256B80140)
  {
    result = MEMORY[0x24261CC7C](&protocol conformance descriptor for RemoteBrowsingIdleMonitorAction, &type metadata for RemoteBrowsingIdleMonitorAction);
    atomic_store(result, (unint64_t *)&qword_256B80140);
  }
  return result;
}

unint64_t sub_23C383B20()
{
  unint64_t result;

  result = qword_256B80148;
  if (!qword_256B80148)
  {
    result = MEMORY[0x24261CC7C](&protocol conformance descriptor for RemoteBrowsingIdleMonitorAction, &type metadata for RemoteBrowsingIdleMonitorAction);
    atomic_store(result, (unint64_t *)&qword_256B80148);
  }
  return result;
}

unint64_t sub_23C383B68()
{
  unint64_t result;

  result = qword_256B80150;
  if (!qword_256B80150)
  {
    result = MEMORY[0x24261CC7C](&protocol conformance descriptor for RemoteBrowsingIdleMonitorState, &type metadata for RemoteBrowsingIdleMonitorState);
    atomic_store(result, (unint64_t *)&qword_256B80150);
  }
  return result;
}

ValueMetadata *type metadata accessor for RemoteBrowsingIdleMonitorFeature()
{
  return &type metadata for RemoteBrowsingIdleMonitorFeature;
}

uint64_t storeEnumTagSinglePayload for RemoteBrowsingIdleMonitorFeature.TaskIdentifier(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C383C08 + 4 * byte_23C38BAA5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C383C3C + 4 * byte_23C38BAA0[v4]))();
}

uint64_t sub_23C383C3C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C383C44(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C383C4CLL);
  return result;
}

uint64_t sub_23C383C58(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C383C60);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C383C64(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C383C6C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RemoteBrowsingIdleMonitorFeature.TaskIdentifier()
{
  return &type metadata for RemoteBrowsingIdleMonitorFeature.TaskIdentifier;
}

unint64_t sub_23C383C8C()
{
  unint64_t result;

  result = qword_256B80158;
  if (!qword_256B80158)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38BB50, &type metadata for RemoteBrowsingIdleMonitorFeature.TaskIdentifier);
    atomic_store(result, (unint64_t *)&qword_256B80158);
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

void RemoteBrowsingIdleMonitorState.state.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 1);
}

_BYTE *RemoteBrowsingIdleMonitorState.state.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 1) = *result;
  return result;
}

uint64_t (*RemoteBrowsingIdleMonitorState.state.modify())()
{
  return nullsub_1;
}

FitnessRemoteBrowsing::RemoteBrowsingIdleMonitorState __swiftcall RemoteBrowsingIdleMonitorState.init(isRemoteBrowsingActive:state:)(Swift::Bool isRemoteBrowsingActive, FitnessRemoteBrowsing::RemoteBrowsingIdleMonitorLoadState state)
{
  Swift::Bool *v2;
  char v3;
  FitnessRemoteBrowsing::RemoteBrowsingIdleMonitorState result;

  v3 = *(_BYTE *)state;
  *v2 = isRemoteBrowsingActive;
  v2[1] = v3;
  result.isRemoteBrowsingActive = isRemoteBrowsingActive;
  return result;
}

uint64_t sub_23C383D6C(char a1)
{
  if ((a1 & 1) != 0)
    return 0x6574617473;
  else
    return 0xD000000000000016;
}

uint64_t sub_23C383DA4()
{
  char *v0;

  return sub_23C383D6C(*v0);
}

uint64_t sub_23C383DAC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C384524(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C383DD0()
{
  sub_23C383F58();
  return sub_23C38AE24();
}

uint64_t sub_23C383DF8()
{
  sub_23C383F58();
  return sub_23C38AE30();
}

uint64_t RemoteBrowsingIdleMonitorState.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;
  int v10;
  char v11;
  char v12;
  char v13;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B80168);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(unsigned __int8 *)(v1 + 1);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C383F58();
  sub_23C38AE18();
  v13 = 0;
  sub_23C38ADB8();
  if (!v2)
  {
    v12 = v10;
    v11 = 1;
    sub_23C383F9C();
    sub_23C38ADC4();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_23C383F58()
{
  unint64_t result;

  result = qword_256B80170;
  if (!qword_256B80170)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38BD34, &type metadata for RemoteBrowsingIdleMonitorState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B80170);
  }
  return result;
}

unint64_t sub_23C383F9C()
{
  unint64_t result;

  result = qword_256B80178;
  if (!qword_256B80178)
  {
    result = MEMORY[0x24261CC7C](&protocol conformance descriptor for RemoteBrowsingIdleMonitorLoadState, &type metadata for RemoteBrowsingIdleMonitorLoadState);
    atomic_store(result, (unint64_t *)&qword_256B80178);
  }
  return result;
}

uint64_t RemoteBrowsingIdleMonitorState.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
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

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B80180);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C383F58();
  sub_23C38AE0C();
  if (!v2)
  {
    v15 = 0;
    v9 = sub_23C38AD64();
    v13 = 1;
    sub_23C384148();
    sub_23C38AD70();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v10 = v14;
    *a2 = v9 & 1;
    a2[1] = v10;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_23C384148()
{
  unint64_t result;

  result = qword_256B80188;
  if (!qword_256B80188)
  {
    result = MEMORY[0x24261CC7C](&protocol conformance descriptor for RemoteBrowsingIdleMonitorLoadState, &type metadata for RemoteBrowsingIdleMonitorLoadState);
    atomic_store(result, (unint64_t *)&qword_256B80188);
  }
  return result;
}

uint64_t sub_23C38418C@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return RemoteBrowsingIdleMonitorState.init(from:)(a1, a2);
}

uint64_t sub_23C3841A0(_QWORD *a1)
{
  return RemoteBrowsingIdleMonitorState.encode(to:)(a1);
}

BOOL static RemoteBrowsingIdleMonitorState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2 | a2[1] ^ a1[1]) & 1) == 0;
}

BOOL sub_23C3841DC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2 | a2[1] ^ a1[1]) & 1) == 0;
}

_WORD *__swift_memcpy2_1(_WORD *result, _WORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for RemoteBrowsingIdleMonitorState(unsigned __int16 *a1, unsigned int a2)
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
  v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for RemoteBrowsingIdleMonitorState(_WORD *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C384300 + 4 * byte_23C38BBC5[v4]))();
  *a1 = a2 - 255;
  return ((uint64_t (*)(void))((char *)sub_23C384334 + 4 * byte_23C38BBC0[v4]))();
}

uint64_t sub_23C384334(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 2) = v1;
  return result;
}

uint64_t sub_23C38433C(uint64_t result, int a2)
{
  *(_WORD *)(result + 2) = 0;
  if (a2)
    JUMPOUT(0x23C384344);
  return result;
}

uint64_t sub_23C384350(uint64_t result, int a2)
{
  *(_DWORD *)(result + 2) = 0;
  if (!a2)
    JUMPOUT(0x23C384358);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C38435C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 2) = v1;
  return result;
}

uint64_t sub_23C384364(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 2) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RemoteBrowsingIdleMonitorState()
{
  return &type metadata for RemoteBrowsingIdleMonitorState;
}

uint64_t storeEnumTagSinglePayload for RemoteBrowsingIdleMonitorState.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C3843CC + 4 * byte_23C38BBCF[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C384400 + 4 * byte_23C38BBCA[v4]))();
}

uint64_t sub_23C384400(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C384408(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C384410);
  return result;
}

uint64_t sub_23C38441C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C384424);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C384428(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C384430(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RemoteBrowsingIdleMonitorState.CodingKeys()
{
  return &type metadata for RemoteBrowsingIdleMonitorState.CodingKeys;
}

unint64_t sub_23C384450()
{
  unint64_t result;

  result = qword_256B80190;
  if (!qword_256B80190)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38BD0C, &type metadata for RemoteBrowsingIdleMonitorState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B80190);
  }
  return result;
}

unint64_t sub_23C384498()
{
  unint64_t result;

  result = qword_256B80198;
  if (!qword_256B80198)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38BC7C, &type metadata for RemoteBrowsingIdleMonitorState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B80198);
  }
  return result;
}

unint64_t sub_23C3844E0()
{
  unint64_t result;

  result = qword_256B801A0;
  if (!qword_256B801A0)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38BCA4, &type metadata for RemoteBrowsingIdleMonitorState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B801A0);
  }
  return result;
}

uint64_t sub_23C384524(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000016 && a2 == 0x800000023C38DC00 || (sub_23C38ADD0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6574617473 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v5 = sub_23C38ADD0();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t RemoteParticipantDiscoveryInterface.rawValue.getter(uint64_t result)
{
  return result;
}

unint64_t sub_23C384614@<X0>(unint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = _s21FitnessRemoteBrowsing0B29ParticipantDiscoveryInterfaceO8rawValueACSgSi_tcfC_0(*a1);
  *a2 = result;
  return result;
}

void sub_23C38463C(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

uint64_t sub_23C384648()
{
  sub_23C3848A4();
  return sub_23C38AC5C();
}

uint64_t sub_23C3846A4()
{
  sub_23C3848A4();
  return sub_23C38AC50();
}

unint64_t _s21FitnessRemoteBrowsing0B29ParticipantDiscoveryInterfaceO8rawValueACSgSi_tcfC_0(unint64_t result)
{
  if (result >= 5)
    return 5;
  return result;
}

unint64_t sub_23C384704()
{
  unint64_t result;

  result = qword_256B801A8;
  if (!qword_256B801A8)
  {
    result = MEMORY[0x24261CC7C](&protocol conformance descriptor for RemoteParticipantDiscoveryInterface, &type metadata for RemoteParticipantDiscoveryInterface);
    atomic_store(result, (unint64_t *)&qword_256B801A8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for RemoteParticipantDiscoveryInterface(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for RemoteParticipantDiscoveryInterface(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C384824 + 4 * byte_23C38BD95[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_23C384858 + 4 * byte_23C38BD90[v4]))();
}

uint64_t sub_23C384858(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C384860(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C384868);
  return result;
}

uint64_t sub_23C384874(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C38487CLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_23C384880(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C384888(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RemoteParticipantDiscoveryInterface()
{
  return &type metadata for RemoteParticipantDiscoveryInterface;
}

unint64_t sub_23C3848A4()
{
  unint64_t result;

  result = qword_256B801B0;
  if (!qword_256B801B0)
  {
    result = MEMORY[0x24261CC7C](&protocol conformance descriptor for RemoteParticipantDiscoveryInterface, &type metadata for RemoteParticipantDiscoveryInterface);
    atomic_store(result, (unint64_t *)&qword_256B801B0);
  }
  return result;
}

uint64_t SubscriptionHandoffEnvironment.init(requireRemoteBrowsingServiceSubscription:dismiss:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

ValueMetadata *type metadata accessor for SubscriptionHandoffEnvironment()
{
  return &type metadata for SubscriptionHandoffEnvironment;
}

uint64_t sub_23C384904()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for LocalizationBundle()
{
  return objc_opt_self();
}

uint64_t sub_23C384934()
{
  uint64_t v0;

  v0 = sub_23C38AB0C();
  __swift_allocate_value_buffer(v0, qword_256B842C0);
  __swift_project_value_buffer(v0, (uint64_t)qword_256B842C0);
  return sub_23C38AB00();
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

BOOL static RemoteBrowsingIdleMonitorLoadState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_23C384A0C(char a1)
{
  if ((a1 & 1) != 0)
    return 0x657669746361;
  else
    return 1701602409;
}

uint64_t sub_23C384A38()
{
  sub_23C384D6C();
  return sub_23C38AE24();
}

uint64_t sub_23C384A60()
{
  sub_23C384D6C();
  return sub_23C38AE30();
}

uint64_t sub_23C384A88()
{
  char *v0;

  return sub_23C384A0C(*v0);
}

uint64_t sub_23C384A90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C385520(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C384AB4()
{
  sub_23C384D28();
  return sub_23C38AE24();
}

uint64_t sub_23C384ADC()
{
  sub_23C384D28();
  return sub_23C38AE30();
}

uint64_t sub_23C384B04()
{
  sub_23C384DB0();
  return sub_23C38AE24();
}

uint64_t sub_23C384B2C()
{
  sub_23C384DB0();
  return sub_23C38AE30();
}

uint64_t RemoteBrowsingIdleMonitorLoadState.encode(to:)(_QWORD *a1)
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

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B80250);
  v16 = *(_QWORD *)(v3 - 8);
  v17 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B80258);
  v14 = *(_QWORD *)(v6 - 8);
  v15 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B80260);
  v18 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C384D28();
  sub_23C38AE18();
  if ((v12 & 1) != 0)
  {
    v20 = 1;
    sub_23C384D6C();
    sub_23C38AD88();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v17);
  }
  else
  {
    v19 = 0;
    sub_23C384DB0();
    sub_23C38AD88();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v15);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v11, v9);
}

unint64_t sub_23C384D28()
{
  unint64_t result;

  result = qword_256B80268;
  if (!qword_256B80268)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38C23C, &type metadata for RemoteBrowsingIdleMonitorLoadState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B80268);
  }
  return result;
}

unint64_t sub_23C384D6C()
{
  unint64_t result;

  result = qword_256B80270;
  if (!qword_256B80270)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38C1EC, &type metadata for RemoteBrowsingIdleMonitorLoadState.ActiveCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B80270);
  }
  return result;
}

unint64_t sub_23C384DB0()
{
  unint64_t result;

  result = qword_256B80278;
  if (!qword_256B80278)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38C19C, &type metadata for RemoteBrowsingIdleMonitorLoadState.IdleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B80278);
  }
  return result;
}

uint64_t RemoteBrowsingIdleMonitorLoadState.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
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
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B80280);
  v32 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v31 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B80288);
  v4 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B80290);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C384D28();
  v11 = v33;
  sub_23C38AE0C();
  if (v11)
    goto LABEL_7;
  v26 = v4;
  v27 = a1;
  v12 = v31;
  v13 = v32;
  v33 = v8;
  v14 = sub_23C38AD7C();
  v15 = v7;
  if (*(_QWORD *)(v14 + 16) != 1)
  {
    v19 = sub_23C38ACF8();
    swift_allocError();
    v21 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B7FF80);
    *v21 = &type metadata for RemoteBrowsingIdleMonitorLoadState;
    sub_23C38AD34();
    sub_23C38ACEC();
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
    sub_23C384D6C();
    sub_23C38AD28();
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
    sub_23C384DB0();
    v22 = v6;
    sub_23C38AD28();
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

uint64_t sub_23C38514C@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return RemoteBrowsingIdleMonitorLoadState.init(from:)(a1, a2);
}

uint64_t sub_23C385160(_QWORD *a1)
{
  return RemoteBrowsingIdleMonitorLoadState.encode(to:)(a1);
}

uint64_t RemoteBrowsingIdleMonitorLoadState.hash(into:)()
{
  return sub_23C38ADE8();
}

uint64_t RemoteBrowsingIdleMonitorLoadState.hashValue.getter()
{
  sub_23C38ADDC();
  sub_23C38ADE8();
  return sub_23C38AE00();
}

unint64_t sub_23C3851E4()
{
  unint64_t result;

  result = qword_256B80298;
  if (!qword_256B80298)
  {
    result = MEMORY[0x24261CC7C](&protocol conformance descriptor for RemoteBrowsingIdleMonitorLoadState, &type metadata for RemoteBrowsingIdleMonitorLoadState);
    atomic_store(result, (unint64_t *)&qword_256B80298);
  }
  return result;
}

ValueMetadata *type metadata accessor for RemoteBrowsingIdleMonitorLoadState()
{
  return &type metadata for RemoteBrowsingIdleMonitorLoadState;
}

uint64_t _s21FitnessRemoteBrowsing34RemoteBrowsingIdleMonitorLoadStateOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C385288 + 4 * byte_23C38BF15[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C3852BC + 4 * asc_23C38BF10[v4]))();
}

uint64_t sub_23C3852BC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C3852C4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C3852CCLL);
  return result;
}

uint64_t sub_23C3852D8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C3852E0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C3852E4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C3852EC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RemoteBrowsingIdleMonitorLoadState.CodingKeys()
{
  return &type metadata for RemoteBrowsingIdleMonitorLoadState.CodingKeys;
}

ValueMetadata *type metadata accessor for RemoteBrowsingIdleMonitorLoadState.IdleCodingKeys()
{
  return &type metadata for RemoteBrowsingIdleMonitorLoadState.IdleCodingKeys;
}

ValueMetadata *type metadata accessor for RemoteBrowsingIdleMonitorLoadState.ActiveCodingKeys()
{
  return &type metadata for RemoteBrowsingIdleMonitorLoadState.ActiveCodingKeys;
}

unint64_t sub_23C38532C()
{
  unint64_t result;

  result = qword_256B802A0;
  if (!qword_256B802A0)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38C174, &type metadata for RemoteBrowsingIdleMonitorLoadState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B802A0);
  }
  return result;
}

unint64_t sub_23C385374()
{
  unint64_t result;

  result = qword_256B802A8;
  if (!qword_256B802A8)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38C094, &type metadata for RemoteBrowsingIdleMonitorLoadState.IdleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B802A8);
  }
  return result;
}

unint64_t sub_23C3853BC()
{
  unint64_t result;

  result = qword_256B802B0;
  if (!qword_256B802B0)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38C0BC, &type metadata for RemoteBrowsingIdleMonitorLoadState.IdleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B802B0);
  }
  return result;
}

unint64_t sub_23C385404()
{
  unint64_t result;

  result = qword_256B802B8;
  if (!qword_256B802B8)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38C044, &type metadata for RemoteBrowsingIdleMonitorLoadState.ActiveCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B802B8);
  }
  return result;
}

unint64_t sub_23C38544C()
{
  unint64_t result;

  result = qword_256B802C0;
  if (!qword_256B802C0)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38C06C, &type metadata for RemoteBrowsingIdleMonitorLoadState.ActiveCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B802C0);
  }
  return result;
}

unint64_t sub_23C385494()
{
  unint64_t result;

  result = qword_256B802C8;
  if (!qword_256B802C8)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38C0E4, &type metadata for RemoteBrowsingIdleMonitorLoadState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B802C8);
  }
  return result;
}

unint64_t sub_23C3854DC()
{
  unint64_t result;

  result = qword_256B802D0;
  if (!qword_256B802D0)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38C10C, &type metadata for RemoteBrowsingIdleMonitorLoadState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B802D0);
  }
  return result;
}

uint64_t sub_23C385520(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 1701602409 && a2 == 0xE400000000000000;
  if (v3 || (sub_23C38ADD0() & 1) != 0)
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
    v6 = sub_23C38ADD0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t RemoteParticipant.identifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t RemoteParticipant.role.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t RemoteParticipant.deviceOwner.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  sub_23C385654(v1, *(_QWORD *)(v0 + 32));
  return v1;
}

uint64_t sub_23C385654(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >= 3)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t RemoteParticipant.idsIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t RemoteParticipant.name.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 56);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t RemoteParticipant.discoveryInterface.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 72);
}

uint64_t RemoteParticipant.deviceType.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 73);
}

uint64_t RemoteParticipant.init(identifier:role:deviceOwner:discoveryInterface:idsIdentifier:name:deviceType:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, char a12)
{
  *(_QWORD *)a9 = result;
  *(_QWORD *)(a9 + 8) = a2;
  *(_BYTE *)(a9 + 16) = a3;
  *(_QWORD *)(a9 + 24) = a4;
  *(_QWORD *)(a9 + 32) = a5;
  *(_QWORD *)(a9 + 40) = a7;
  *(_QWORD *)(a9 + 48) = a8;
  *(_QWORD *)(a9 + 56) = a10;
  *(_QWORD *)(a9 + 64) = a11;
  *(_BYTE *)(a9 + 72) = a6;
  *(_BYTE *)(a9 + 73) = a12;
  return result;
}

uint64_t sub_23C3856F8(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23C385730 + 4 * byte_23C38C290[a1]))(0xD000000000000012, 0x800000023C38DC70);
}

uint64_t sub_23C385730()
{
  return 0x696669746E656469;
}

uint64_t sub_23C385750()
{
  return 1701605234;
}

uint64_t sub_23C385760()
{
  return 0x774F656369766564;
}

uint64_t sub_23C385780()
{
  return 0x746E656449736469;
}

uint64_t sub_23C3857A4()
{
  return 1701667182;
}

uint64_t sub_23C3857B4()
{
  return 0x7954656369766564;
}

uint64_t sub_23C3857D0()
{
  unsigned __int8 *v0;

  return sub_23C3856F8(*v0);
}

uint64_t sub_23C3857D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C386D80(a1, a2);
  *a3 = result;
  return result;
}

void sub_23C3857FC(_BYTE *a1@<X8>)
{
  *a1 = 7;
}

uint64_t sub_23C385808()
{
  sub_23C385AEC();
  return sub_23C38AE24();
}

uint64_t sub_23C385830()
{
  sub_23C385AEC();
  return sub_23C38AE30();
}

uint64_t sub_23C385858@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t RemoteParticipant.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v14;
  int v15;
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
  char v26;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B802D8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = *(unsigned __int8 *)(v1 + 16);
  v7 = *(_QWORD *)(v1 + 24);
  v20 = *(_QWORD *)(v1 + 32);
  v21 = v7;
  v8 = *(_QWORD *)(v1 + 40);
  v18 = *(_QWORD *)(v1 + 48);
  v19 = v8;
  v9 = *(_QWORD *)(v1 + 64);
  v16 = *(_QWORD *)(v1 + 56);
  v17 = v9;
  LODWORD(v8) = *(unsigned __int8 *)(v1 + 72);
  v14 = *(unsigned __int8 *)(v1 + 73);
  v15 = v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C385AEC();
  sub_23C38AE18();
  LOBYTE(v23) = 0;
  v10 = v22;
  sub_23C38ADAC();
  if (!v10)
  {
    v12 = v20;
    v11 = v21;
    LOBYTE(v23) = v25;
    v26 = 1;
    sub_23C385B30();
    sub_23C38ADC4();
    v23 = v11;
    v24 = v12;
    v26 = 2;
    sub_23C385B74();
    sub_23C38ADC4();
    LOBYTE(v23) = 3;
    sub_23C38AD94();
    LOBYTE(v23) = 4;
    sub_23C38AD94();
    LOBYTE(v23) = v15;
    v26 = 5;
    sub_23C385BB8();
    sub_23C38ADC4();
    LOBYTE(v23) = v14;
    v26 = 6;
    sub_23C385BFC();
    sub_23C38ADA0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_23C385AEC()
{
  unint64_t result;

  result = qword_256B802E0;
  if (!qword_256B802E0)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38C498, &type metadata for RemoteParticipant.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B802E0);
  }
  return result;
}

unint64_t sub_23C385B30()
{
  unint64_t result;

  result = qword_256B802E8;
  if (!qword_256B802E8)
  {
    result = MEMORY[0x24261CC7C](&protocol conformance descriptor for RemoteParticipantRole, &type metadata for RemoteParticipantRole);
    atomic_store(result, (unint64_t *)&qword_256B802E8);
  }
  return result;
}

unint64_t sub_23C385B74()
{
  unint64_t result;

  result = qword_256B802F0;
  if (!qword_256B802F0)
  {
    result = MEMORY[0x24261CC7C](&protocol conformance descriptor for RemoteParticipantDeviceOwner, &type metadata for RemoteParticipantDeviceOwner);
    atomic_store(result, (unint64_t *)&qword_256B802F0);
  }
  return result;
}

unint64_t sub_23C385BB8()
{
  unint64_t result;

  result = qword_256B802F8;
  if (!qword_256B802F8)
  {
    result = MEMORY[0x24261CC7C](&protocol conformance descriptor for RemoteParticipantDiscoveryInterface, &type metadata for RemoteParticipantDiscoveryInterface);
    atomic_store(result, (unint64_t *)&qword_256B802F8);
  }
  return result;
}

unint64_t sub_23C385BFC()
{
  unint64_t result;

  result = qword_256B80300;
  if (!qword_256B80300)
  {
    result = MEMORY[0x24261CC7C](&protocol conformance descriptor for RemoteParticipantDeviceType, &type metadata for RemoteParticipantDeviceType);
    atomic_store(result, (unint64_t *)&qword_256B80300);
  }
  return result;
}

uint64_t RemoteParticipant.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  int v32;
  char v33;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B80308);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C385AEC();
  sub_23C38AE0C();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  LOBYTE(v30) = 0;
  v9 = sub_23C38AD58();
  v11 = v10;
  v33 = 1;
  sub_23C3860A0();
  swift_bridgeObjectRetain();
  sub_23C38AD70();
  v32 = v30;
  v33 = 2;
  sub_23C3860E4();
  sub_23C38AD70();
  v13 = v30;
  LOBYTE(v30) = 3;
  v28 = v31;
  v29 = v13;
  sub_23C385654(v13, v31);
  v14 = sub_23C38AD40();
  v27 = v15;
  v24 = v14;
  LOBYTE(v30) = 4;
  swift_bridgeObjectRetain();
  v25 = 0;
  v23 = sub_23C38AD40();
  v33 = 5;
  v17 = v16;
  sub_23C386128();
  v26 = v17;
  swift_bridgeObjectRetain();
  sub_23C38AD70();
  HIDWORD(v22) = v30;
  v33 = 6;
  sub_23C38616C();
  sub_23C38AD4C();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  LOBYTE(v17) = v30;
  swift_bridgeObjectRetain();
  v19 = v28;
  v18 = v29;
  sub_23C385654(v29, v28);
  sub_23C38608C(v18, v19);
  swift_bridgeObjectRelease();
  *(_QWORD *)a2 = v9;
  *(_QWORD *)(a2 + 8) = v11;
  *(_BYTE *)(a2 + 16) = v32;
  *(_QWORD *)(a2 + 24) = v18;
  *(_QWORD *)(a2 + 32) = v19;
  v21 = v26;
  v20 = v27;
  *(_QWORD *)(a2 + 40) = v24;
  *(_QWORD *)(a2 + 48) = v20;
  *(_QWORD *)(a2 + 56) = v23;
  *(_QWORD *)(a2 + 64) = v21;
  *(_BYTE *)(a2 + 72) = BYTE4(v22);
  *(_BYTE *)(a2 + 73) = v17;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  sub_23C38608C(v18, v19);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C38608C(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >= 3)
    return swift_bridgeObjectRelease();
  return result;
}

unint64_t sub_23C3860A0()
{
  unint64_t result;

  result = qword_256B80310;
  if (!qword_256B80310)
  {
    result = MEMORY[0x24261CC7C](&protocol conformance descriptor for RemoteParticipantRole, &type metadata for RemoteParticipantRole);
    atomic_store(result, (unint64_t *)&qword_256B80310);
  }
  return result;
}

unint64_t sub_23C3860E4()
{
  unint64_t result;

  result = qword_256B80318;
  if (!qword_256B80318)
  {
    result = MEMORY[0x24261CC7C](&protocol conformance descriptor for RemoteParticipantDeviceOwner, &type metadata for RemoteParticipantDeviceOwner);
    atomic_store(result, (unint64_t *)&qword_256B80318);
  }
  return result;
}

unint64_t sub_23C386128()
{
  unint64_t result;

  result = qword_256B80320;
  if (!qword_256B80320)
  {
    result = MEMORY[0x24261CC7C](&protocol conformance descriptor for RemoteParticipantDiscoveryInterface, &type metadata for RemoteParticipantDiscoveryInterface);
    atomic_store(result, (unint64_t *)&qword_256B80320);
  }
  return result;
}

unint64_t sub_23C38616C()
{
  unint64_t result;

  result = qword_256B80328;
  if (!qword_256B80328)
  {
    result = MEMORY[0x24261CC7C](&protocol conformance descriptor for RemoteParticipantDeviceType, &type metadata for RemoteParticipantDeviceType);
    atomic_store(result, (unint64_t *)&qword_256B80328);
  }
  return result;
}

uint64_t sub_23C3861B0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return RemoteParticipant.init(from:)(a1, a2);
}

uint64_t sub_23C3861C4(_QWORD *a1)
{
  return RemoteParticipant.encode(to:)(a1);
}

uint64_t RemoteParticipant.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 48);
  v4 = *(_QWORD *)(v0 + 64);
  v5 = *(unsigned __int8 *)(v0 + 73);
  swift_bridgeObjectRetain();
  sub_23C38AC38();
  swift_bridgeObjectRelease();
  sub_23C38ADE8();
  if (v2 <= 2)
  {
    sub_23C38ADE8();
    if (v3)
      goto LABEL_3;
LABEL_6:
    sub_23C38ADF4();
    if (v4)
      goto LABEL_4;
    goto LABEL_7;
  }
  sub_23C38ADE8();
  swift_bridgeObjectRetain();
  sub_23C38AC38();
  sub_23C38608C(v1, v2);
  if (!v3)
    goto LABEL_6;
LABEL_3:
  sub_23C38ADF4();
  swift_bridgeObjectRetain();
  sub_23C38AC38();
  swift_bridgeObjectRelease();
  if (v4)
  {
LABEL_4:
    sub_23C38ADF4();
    swift_bridgeObjectRetain();
    sub_23C38AC38();
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
LABEL_7:
  sub_23C38ADF4();
LABEL_8:
  sub_23C38ADE8();
  if (v5 == 4)
    return sub_23C38ADF4();
  sub_23C38ADF4();
  return sub_23C38ADE8();
}

uint64_t RemoteParticipant.hashValue.getter()
{
  sub_23C38ADDC();
  RemoteParticipant.hash(into:)();
  return sub_23C38AE00();
}

uint64_t sub_23C3863D4()
{
  sub_23C38ADDC();
  RemoteParticipant.hash(into:)();
  return sub_23C38AE00();
}

uint64_t sub_23C386448()
{
  sub_23C38ADDC();
  RemoteParticipant.hash(into:)();
  return sub_23C38AE00();
}

uint64_t _s21FitnessRemoteBrowsing0B11ParticipantV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  int v24;
  char v25;
  uint64_t result;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  char v32;
  int v33;
  char v34;
  char v35;
  int v36;
  char v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  int v45;

  v2 = *(unsigned __int8 *)(a1 + 16);
  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 64);
  v9 = *(unsigned __int8 *)(a1 + 72);
  v45 = *(unsigned __int8 *)(a1 + 73);
  v10 = *(unsigned __int8 *)(a2 + 16);
  v12 = *(_QWORD *)(a2 + 24);
  v11 = *(_QWORD *)(a2 + 32);
  v14 = *(_QWORD *)(a2 + 40);
  v13 = *(_QWORD *)(a2 + 48);
  v16 = *(_QWORD *)(a2 + 56);
  v15 = *(_QWORD *)(a2 + 64);
  v17 = *(unsigned __int8 *)(a2 + 72);
  v44 = *(unsigned __int8 *)(a2 + 73);
  if (*(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8))
  {
    if (v2 != v10)
      return 0;
  }
  else
  {
    v38 = *(_QWORD *)(a2 + 24);
    v39 = *(_QWORD *)(a2 + 32);
    v40 = *(_QWORD *)(a1 + 24);
    v41 = *(_QWORD *)(a2 + 40);
    v42 = *(_QWORD *)(a2 + 48);
    v43 = *(_QWORD *)(a1 + 48);
    v18 = *(_QWORD *)(a1 + 40);
    v19 = *(_QWORD *)(a2 + 56);
    v20 = *(_QWORD *)(a2 + 64);
    v21 = *(_QWORD *)(a1 + 64);
    v22 = *(_QWORD *)(a1 + 56);
    v23 = *(unsigned __int8 *)(a2 + 72);
    v24 = *(unsigned __int8 *)(a1 + 72);
    v25 = sub_23C38ADD0();
    result = 0;
    if ((v25 & 1) == 0)
      return result;
    v9 = v24;
    v17 = v23;
    v8 = v22;
    v7 = v21;
    v15 = v20;
    v16 = v19;
    v6 = v18;
    v13 = v42;
    v5 = v43;
    v3 = v40;
    v14 = v41;
    v12 = v38;
    v11 = v39;
    if (v2 != v10)
      return result;
  }
  switch(v4)
  {
    case 0:
      if (v11)
        return 0;
      goto LABEL_20;
    case 1:
      if (v11 != 1)
        return 0;
LABEL_20:
      if (v5)
      {
        if (!v13)
          return 0;
        if (v6 != v14 || v5 != v13)
        {
          v33 = v9;
          v34 = sub_23C38ADD0();
          v9 = v33;
          v35 = v34;
          result = 0;
          if ((v35 & 1) == 0)
            return result;
        }
      }
      else if (v13)
      {
        return 0;
      }
      if (!v7)
      {
        result = 0;
        if (v15 || v9 != v17)
          return result;
LABEL_38:
        if (v45 == 4)
        {
          if (v44 != 4)
            return 0;
        }
        else if (v44 == 4 || v45 != v44)
        {
          return 0;
        }
        return 1;
      }
      if (v15)
      {
        if (v8 == v16 && v7 == v15)
        {
          if (v9 != v17)
            return 0;
        }
        else
        {
          v36 = v9;
          v37 = sub_23C38ADD0();
          result = 0;
          if ((v37 & 1) == 0 || v36 != v17)
            return result;
        }
        goto LABEL_38;
      }
      return 0;
    case 2:
      if (v11 != 2)
        return 0;
      goto LABEL_20;
  }
  if (v11 < 3)
    return 0;
  if (v3 == v12 && v4 == v11)
    goto LABEL_20;
  v27 = v9;
  v28 = v5;
  v29 = v13;
  v30 = v14;
  v31 = sub_23C38ADD0();
  v14 = v30;
  v13 = v29;
  v5 = v28;
  v9 = v27;
  v32 = v31;
  result = 0;
  if ((v32 & 1) != 0)
    goto LABEL_20;
  return result;
}

uint64_t sub_23C38674C()
{
  return MEMORY[0x24BEE0D10];
}

unint64_t sub_23C38675C()
{
  unint64_t result;

  result = qword_256B80330;
  if (!qword_256B80330)
  {
    result = MEMORY[0x24261CC7C](&protocol conformance descriptor for RemoteParticipant, &type metadata for RemoteParticipant);
    atomic_store(result, (unint64_t *)&qword_256B80330);
  }
  return result;
}

uint64_t destroy for RemoteParticipant(uint64_t a1)
{
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(a1 + 32) >= 3uLL)
    swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for RemoteParticipant(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v5 = (_QWORD *)(a2 + 24);
  v6 = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  if (v6 >= 3)
  {
    *(_QWORD *)(a1 + 24) = *v5;
    *(_QWORD *)(a1 + 32) = v6;
    swift_bridgeObjectRetain();
  }
  else
  {
    *(_OWORD *)(a1 + 24) = *(_OWORD *)v5;
  }
  v7 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v7;
  v8 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v8;
  *(_WORD *)(a1 + 72) = *(_WORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for RemoteParticipant(uint64_t a1, uint64_t a2)
{
  unint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 32);
  if (*(_QWORD *)(a1 + 32) >= 3uLL)
  {
    if (v4 >= 3)
    {
      *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
      *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
    sub_23C386990(a1 + 24);
    goto LABEL_6;
  }
  if (v4 < 3)
  {
LABEL_6:
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    goto LABEL_8;
  }
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
LABEL_8:
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_BYTE *)(a1 + 73) = *(_BYTE *)(a2 + 73);
  return a1;
}

uint64_t sub_23C386990(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B80338);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

__n128 __swift_memcpy74_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 58) = *(_OWORD *)(a2 + 58);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for RemoteParticipant(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v5 = (_QWORD *)(a2 + 24);
  if (*(_QWORD *)(a1 + 32) >= 3uLL)
  {
    v6 = *(_QWORD *)(a2 + 32);
    if (v6 >= 3)
    {
      *(_QWORD *)(a1 + 24) = *v5;
      *(_QWORD *)(a1 + 32) = v6;
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_23C386990(a1 + 24);
  }
  *(_OWORD *)(a1 + 24) = *(_OWORD *)v5;
LABEL_6:
  v7 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v8;
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 72) = *(_WORD *)(a2 + 72);
  return a1;
}

uint64_t getEnumTagSinglePayload for RemoteParticipant(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 74))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RemoteParticipant(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 72) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 74) = 1;
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
    *(_BYTE *)(result + 74) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for RemoteParticipant()
{
  return &type metadata for RemoteParticipant;
}

uint64_t getEnumTagSinglePayload for RemoteParticipantRole(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for RemoteParticipant.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C386C28 + 4 * byte_23C38C29C[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_23C386C5C + 4 * byte_23C38C297[v4]))();
}

uint64_t sub_23C386C5C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C386C64(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C386C6CLL);
  return result;
}

uint64_t sub_23C386C78(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C386C80);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_23C386C84(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C386C8C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RemoteParticipant.CodingKeys()
{
  return &type metadata for RemoteParticipant.CodingKeys;
}

unint64_t sub_23C386CAC()
{
  unint64_t result;

  result = qword_256B80340;
  if (!qword_256B80340)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38C470, &type metadata for RemoteParticipant.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B80340);
  }
  return result;
}

unint64_t sub_23C386CF4()
{
  unint64_t result;

  result = qword_256B80348;
  if (!qword_256B80348)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38C3E0, &type metadata for RemoteParticipant.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B80348);
  }
  return result;
}

unint64_t sub_23C386D3C()
{
  unint64_t result;

  result = qword_256B80350;
  if (!qword_256B80350)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38C408, &type metadata for RemoteParticipant.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B80350);
  }
  return result;
}

uint64_t sub_23C386D80(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0x696669746E656469 && a2 == 0xEA00000000007265 || (sub_23C38ADD0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701605234 && a2 == 0xE400000000000000 || (sub_23C38ADD0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x774F656369766564 && a2 == 0xEB0000000072656ELL || (sub_23C38ADD0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x746E656449736469 && a2 == 0xED00007265696669 || (sub_23C38ADD0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 1701667182 && a2 == 0xE400000000000000 || (sub_23C38ADD0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000023C38DC70 || (sub_23C38ADD0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x7954656369766564 && a2 == 0xEA00000000006570)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    v5 = sub_23C38ADD0();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 6;
    else
      return 7;
  }
}

uint64_t static RemoteParticipantDeviceOwner.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  switch(a2)
  {
    case 0:
      return !a4;
    case 1:
      return a4 == 1;
    case 2:
      return a4 == 2;
  }
  if (a4 < 3)
    return 0;
  if (a1 == a3 && a2 == a4)
    return 1;
  else
    return sub_23C38ADD0();
}

uint64_t sub_23C3870C0(char a1)
{
  return *(_QWORD *)&aUnknown_2[8 * a1];
}

uint64_t sub_23C3870E0()
{
  char *v0;

  return sub_23C3870C0(*v0);
}

uint64_t sub_23C3870E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C387B98(a1, a2);
  *a3 = result;
  return result;
}

void sub_23C38710C(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_23C387118()
{
  sub_23C3876D4();
  return sub_23C38AE24();
}

uint64_t sub_23C387140()
{
  sub_23C3876D4();
  return sub_23C38AE30();
}

uint64_t sub_23C387168()
{
  return 1;
}

uint64_t sub_23C387170()
{
  sub_23C38ADDC();
  sub_23C38ADE8();
  return sub_23C38AE00();
}

uint64_t sub_23C3871B0()
{
  return sub_23C38ADE8();
}

uint64_t sub_23C3871D4()
{
  sub_23C38ADDC();
  sub_23C38ADE8();
  return sub_23C38AE00();
}

unint64_t sub_23C387210()
{
  return 0xD000000000000011;
}

uint64_t sub_23C38722C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C387D10(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23C387254()
{
  sub_23C38775C();
  return sub_23C38AE24();
}

uint64_t sub_23C38727C()
{
  sub_23C38775C();
  return sub_23C38AE30();
}

uint64_t sub_23C3872A4()
{
  sub_23C387718();
  return sub_23C38AE24();
}

uint64_t sub_23C3872CC()
{
  sub_23C387718();
  return sub_23C38AE30();
}

uint64_t sub_23C3872F4()
{
  sub_23C3877A0();
  return sub_23C38AE24();
}

uint64_t sub_23C38731C()
{
  sub_23C3877A0();
  return sub_23C38AE30();
}

uint64_t sub_23C387344()
{
  sub_23C3877E4();
  return sub_23C38AE24();
}

uint64_t sub_23C38736C()
{
  sub_23C3877E4();
  return sub_23C38AE30();
}

uint64_t RemoteParticipantDeviceOwner.encode(to:)(_QWORD *a1, uint64_t a2, uint64_t a3)
{
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
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  char v37;
  char v38;
  char v39;

  v33 = a2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B80358);
  v31 = *(_QWORD *)(v5 - 8);
  v32 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v28 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B80360);
  v29 = *(_QWORD *)(v7 - 8);
  v30 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v27 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B80368);
  v25 = *(_QWORD *)(v9 - 8);
  v26 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B80370);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B80378);
  v34 = *(_QWORD *)(v16 - 8);
  v35 = v16;
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C3876D4();
  sub_23C38AE18();
  switch(a3)
  {
    case 0:
      v36 = 0;
      sub_23C3877E4();
      v21 = v35;
      sub_23C38AD88();
      (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
      return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v18, v21);
    case 1:
      v37 = 1;
      sub_23C3877A0();
      v21 = v35;
      sub_23C38AD88();
      (*(void (**)(char *, uint64_t))(v25 + 8))(v11, v26);
      return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v18, v21);
    case 2:
      v39 = 3;
      sub_23C387718();
      v19 = v28;
      v20 = v35;
      sub_23C38AD88();
      (*(void (**)(char *, uint64_t))(v31 + 8))(v19, v32);
      break;
    default:
      v38 = 2;
      sub_23C38775C();
      v23 = v27;
      v20 = v35;
      sub_23C38AD88();
      v24 = v30;
      sub_23C38ADAC();
      (*(void (**)(char *, uint64_t))(v29 + 8))(v23, v24);
      break;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v18, v20);
}

unint64_t sub_23C3876D4()
{
  unint64_t result;

  result = qword_256B80380;
  if (!qword_256B80380)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38C9E4, &type metadata for RemoteParticipantDeviceOwner.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B80380);
  }
  return result;
}

unint64_t sub_23C387718()
{
  unint64_t result;

  result = qword_256B80388;
  if (!qword_256B80388)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38C994, &type metadata for RemoteParticipantDeviceOwner.GuestCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B80388);
  }
  return result;
}

unint64_t sub_23C38775C()
{
  unint64_t result;

  result = qword_256B80390;
  if (!qword_256B80390)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38C944, &type metadata for RemoteParticipantDeviceOwner.FamilyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B80390);
  }
  return result;
}

unint64_t sub_23C3877A0()
{
  unint64_t result;

  result = qword_256B80398;
  if (!qword_256B80398)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38C8F4, &type metadata for RemoteParticipantDeviceOwner.MeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B80398);
  }
  return result;
}

unint64_t sub_23C3877E4()
{
  unint64_t result;

  result = qword_256B803A0;
  if (!qword_256B803A0)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38C8A4, &type metadata for RemoteParticipantDeviceOwner.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B803A0);
  }
  return result;
}

uint64_t RemoteParticipantDeviceOwner.init(from:)(_QWORD *a1)
{
  return sub_23C387D94(a1);
}

uint64_t sub_23C38783C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;

  result = sub_23C387D94(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

uint64_t sub_23C387864(_QWORD *a1)
{
  uint64_t *v1;

  return RemoteParticipantDeviceOwner.encode(to:)(a1, *v1, v1[1]);
}

uint64_t RemoteParticipantDeviceOwner.hash(into:)(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a3 <= 2)
    return sub_23C38ADE8();
  sub_23C38ADE8();
  return sub_23C38AC38();
}

uint64_t RemoteParticipantDeviceOwner.hashValue.getter(uint64_t a1, unint64_t a2)
{
  sub_23C38ADDC();
  sub_23C38ADE8();
  if (a2 > 2)
    sub_23C38AC38();
  return sub_23C38AE00();
}

uint64_t sub_23C387988()
{
  uint64_t v0;
  unint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  sub_23C38ADDC();
  sub_23C38ADE8();
  if (v1 > 2)
    sub_23C38AC38();
  return sub_23C38AE00();
}

uint64_t sub_23C387A14()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 8) <= 2uLL)
    return sub_23C38ADE8();
  sub_23C38ADE8();
  return sub_23C38AC38();
}

uint64_t sub_23C387A98()
{
  uint64_t v0;
  unint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  sub_23C38ADDC();
  sub_23C38ADE8();
  if (v1 > 2)
    sub_23C38AC38();
  return sub_23C38AE00();
}

uint64_t sub_23C387B20(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  unint64_t v4;

  v3 = a1[1];
  v4 = a2[1];
  switch(v3)
  {
    case 0:
      return !v4;
    case 1:
      return v4 == 1;
    case 2:
      return v4 == 2;
  }
  if (v4 < 3)
    return 0;
  if (*a1 == *a2 && v3 == v4)
    return 1;
  return sub_23C38ADD0();
}

uint64_t sub_23C387B98(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6E776F6E6B6E75 && a2 == 0xE700000000000000;
  if (v3 || (sub_23C38ADD0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 25965 && a2 == 0xE200000000000000 || (sub_23C38ADD0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x796C696D6166 && a2 == 0xE600000000000000 || (sub_23C38ADD0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x7473657567 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_23C38ADD0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_23C387D10(uint64_t a1, uint64_t a2)
{
  char v2;
  char v3;

  if (a1 == 0xD000000000000011 && a2 == 0x800000023C38DC90)
  {
    swift_bridgeObjectRelease();
    v2 = 0;
  }
  else
  {
    v3 = sub_23C38ADD0();
    swift_bridgeObjectRelease();
    v2 = v3 ^ 1;
  }
  return v2 & 1;
}

uint64_t sub_23C387D94(_QWORD *a1)
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD v18[3];
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  char *v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;

  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B80410);
  v22 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v26 = (char *)v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B80418);
  v23 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v24 = (char *)v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B80420);
  v20 = *(_QWORD *)(v4 - 8);
  v21 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v25 = (char *)v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B80428);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B80430);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a1[3];
  v28 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v12);
  sub_23C3876D4();
  v13 = v29;
  sub_23C38AE0C();
  if (!v13)
  {
    v18[1] = v7;
    v18[2] = v6;
    v29 = v9;
    v14 = sub_23C38AD7C();
    if (*(_QWORD *)(v14 + 16) == 1)
      __asm { BR              X10 }
    v7 = sub_23C38ACF8();
    swift_allocError();
    v16 = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B7FF80);
    *v16 = &type metadata for RemoteParticipantDeviceOwner;
    sub_23C38AD34();
    sub_23C38ACEC();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v7 - 8) + 104))(v16, *MEMORY[0x24BEE26D0], v7);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v11, v8);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
  return v7;
}

unint64_t sub_23C3882B0()
{
  unint64_t result;

  result = qword_256B803A8;
  if (!qword_256B803A8)
  {
    result = MEMORY[0x24261CC7C](&protocol conformance descriptor for RemoteParticipantDeviceOwner, &type metadata for RemoteParticipantDeviceOwner);
    atomic_store(result, (unint64_t *)&qword_256B803A8);
  }
  return result;
}

unint64_t destroy for RemoteParticipantDeviceOwner(uint64_t a1)
{
  unint64_t result;

  result = *(_QWORD *)(a1 + 8);
  if (result >= 0xFFFFFFFF)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s21FitnessRemoteBrowsing28RemoteParticipantDeviceOwnerOwCP_0(uint64_t a1, uint64_t a2)
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

_QWORD *assignWithCopy for RemoteParticipantDeviceOwner(_QWORD *a1, _QWORD *a2)
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

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for RemoteParticipantDeviceOwner(uint64_t a1, uint64_t a2)
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

uint64_t getEnumTagSinglePayload for RemoteParticipantDeviceOwner(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for RemoteParticipantDeviceOwner(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_23C388510(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_23C388528(_QWORD *result, int a2)
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

ValueMetadata *type metadata accessor for RemoteParticipantDeviceOwner()
{
  return &type metadata for RemoteParticipantDeviceOwner;
}

uint64_t getEnumTagSinglePayload for RemoteParticipantDeviceType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for RemoteParticipantDeviceOwner.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C388634 + 4 * byte_23C38C4F9[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23C388668 + 4 * byte_23C38C4F4[v4]))();
}

uint64_t sub_23C388668(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C388670(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C388678);
  return result;
}

uint64_t sub_23C388684(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C38868CLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23C388690(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C388698(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RemoteParticipantDeviceOwner.CodingKeys()
{
  return &type metadata for RemoteParticipantDeviceOwner.CodingKeys;
}

ValueMetadata *type metadata accessor for RemoteParticipantDeviceOwner.UnknownCodingKeys()
{
  return &type metadata for RemoteParticipantDeviceOwner.UnknownCodingKeys;
}

ValueMetadata *type metadata accessor for RemoteParticipantDeviceOwner.MeCodingKeys()
{
  return &type metadata for RemoteParticipantDeviceOwner.MeCodingKeys;
}

uint64_t getEnumTagSinglePayload for RemoteParticipantDeviceOwner.FamilyCodingKeys(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for RemoteParticipantDeviceOwner.FamilyCodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23C388768 + 4 * byte_23C38C4FE[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23C388788 + 4 * byte_23C38C503[v4]))();
}

_BYTE *sub_23C388768(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23C388788(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C388790(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C388798(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C3887A0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C3887A8(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_23C3887B4()
{
  return 0;
}

ValueMetadata *type metadata accessor for RemoteParticipantDeviceOwner.FamilyCodingKeys()
{
  return &type metadata for RemoteParticipantDeviceOwner.FamilyCodingKeys;
}

ValueMetadata *type metadata accessor for RemoteParticipantDeviceOwner.GuestCodingKeys()
{
  return &type metadata for RemoteParticipantDeviceOwner.GuestCodingKeys;
}

unint64_t sub_23C3887E0()
{
  unint64_t result;

  result = qword_256B803B0;
  if (!qword_256B803B0)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38C724, &type metadata for RemoteParticipantDeviceOwner.FamilyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B803B0);
  }
  return result;
}

unint64_t sub_23C388828()
{
  unint64_t result;

  result = qword_256B803B8;
  if (!qword_256B803B8)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38C87C, &type metadata for RemoteParticipantDeviceOwner.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B803B8);
  }
  return result;
}

unint64_t sub_23C388870()
{
  unint64_t result;

  result = qword_256B803C0;
  if (!qword_256B803C0)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38C79C, &type metadata for RemoteParticipantDeviceOwner.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B803C0);
  }
  return result;
}

unint64_t sub_23C3888B8()
{
  unint64_t result;

  result = qword_256B803C8;
  if (!qword_256B803C8)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38C7C4, &type metadata for RemoteParticipantDeviceOwner.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B803C8);
  }
  return result;
}

unint64_t sub_23C388900()
{
  unint64_t result;

  result = qword_256B803D0;
  if (!qword_256B803D0)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38C74C, &type metadata for RemoteParticipantDeviceOwner.MeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B803D0);
  }
  return result;
}

unint64_t sub_23C388948()
{
  unint64_t result;

  result = qword_256B803D8;
  if (!qword_256B803D8)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38C774, &type metadata for RemoteParticipantDeviceOwner.MeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B803D8);
  }
  return result;
}

unint64_t sub_23C388990()
{
  unint64_t result;

  result = qword_256B803E0;
  if (!qword_256B803E0)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38C694, &type metadata for RemoteParticipantDeviceOwner.FamilyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B803E0);
  }
  return result;
}

unint64_t sub_23C3889D8()
{
  unint64_t result;

  result = qword_256B803E8;
  if (!qword_256B803E8)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38C6BC, &type metadata for RemoteParticipantDeviceOwner.FamilyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B803E8);
  }
  return result;
}

unint64_t sub_23C388A20()
{
  unint64_t result;

  result = qword_256B803F0;
  if (!qword_256B803F0)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38C644, &type metadata for RemoteParticipantDeviceOwner.GuestCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B803F0);
  }
  return result;
}

unint64_t sub_23C388A68()
{
  unint64_t result;

  result = qword_256B803F8;
  if (!qword_256B803F8)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38C66C, &type metadata for RemoteParticipantDeviceOwner.GuestCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B803F8);
  }
  return result;
}

unint64_t sub_23C388AB0()
{
  unint64_t result;

  result = qword_256B80400;
  if (!qword_256B80400)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38C7EC, &type metadata for RemoteParticipantDeviceOwner.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B80400);
  }
  return result;
}

unint64_t sub_23C388AF8()
{
  unint64_t result;

  result = qword_256B80408;
  if (!qword_256B80408)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38C814, &type metadata for RemoteParticipantDeviceOwner.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B80408);
  }
  return result;
}

uint64_t RemoteParticipantRole.rawValue.getter(uint64_t result)
{
  return result;
}

unint64_t sub_23C388B48@<X0>(unint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = _s21FitnessRemoteBrowsing0B15ParticipantRoleO8rawValueACSgSi_tcfC_0(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_23C388B70()
{
  sub_23C388DEC();
  return sub_23C38AC5C();
}

uint64_t sub_23C388BCC()
{
  sub_23C388DEC();
  return sub_23C38AC50();
}

void *static RemoteParticipantRole.allCases.getter()
{
  return &unk_250D25090;
}

void sub_23C388C24(_QWORD *a1@<X8>)
{
  *a1 = &unk_250D25090;
}

unint64_t _s21FitnessRemoteBrowsing0B15ParticipantRoleO8rawValueACSgSi_tcfC_0(unint64_t result)
{
  if (result >= 7)
    return 7;
  return result;
}

unint64_t sub_23C388C48()
{
  unint64_t result;

  result = qword_256B80438;
  if (!qword_256B80438)
  {
    result = MEMORY[0x24261CC7C](&protocol conformance descriptor for RemoteParticipantRole, &type metadata for RemoteParticipantRole);
    atomic_store(result, (unint64_t *)&qword_256B80438);
  }
  return result;
}

unint64_t sub_23C388C90()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256B80440;
  if (!qword_256B80440)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B80448);
    result = MEMORY[0x24261CC7C](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_256B80440);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24261CC70](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for RemoteParticipantRole(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C388D6C + 4 * byte_23C38CA85[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_23C388DA0 + 4 * byte_23C38CA80[v4]))();
}

uint64_t sub_23C388DA0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C388DA8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C388DB0);
  return result;
}

uint64_t sub_23C388DBC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C388DC4);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_23C388DC8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C388DD0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RemoteParticipantRole()
{
  return &type metadata for RemoteParticipantRole;
}

unint64_t sub_23C388DEC()
{
  unint64_t result;

  result = qword_256B80450;
  if (!qword_256B80450)
  {
    result = MEMORY[0x24261CC7C](&protocol conformance descriptor for RemoteParticipantRole, &type metadata for RemoteParticipantRole);
    atomic_store(result, (unint64_t *)&qword_256B80450);
  }
  return result;
}

uint64_t RemoteParticipantDeviceType.rawValue.getter(unsigned __int8 a1)
{
  return a1 + 1;
}

uint64_t sub_23C388E40@<X0>(unint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = _s21FitnessRemoteBrowsing0B21ParticipantDeviceTypeO8rawValueACSgSi_tcfC_0(*a1);
  *a2 = result;
  return result;
}

void sub_23C388E68(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1 + 1;
}

uint64_t sub_23C388E78()
{
  sub_23C389108();
  return sub_23C38AC5C();
}

uint64_t sub_23C388ED4()
{
  sub_23C389108();
  return sub_23C38AC50();
}

uint64_t sub_23C388F20()
{
  sub_23C38ADDC();
  sub_23C38ADE8();
  return sub_23C38AE00();
}

uint64_t sub_23C388F64()
{
  return sub_23C38ADE8();
}

uint64_t sub_23C388F90()
{
  sub_23C38ADDC();
  sub_23C38ADE8();
  return sub_23C38AE00();
}

uint64_t _s21FitnessRemoteBrowsing0B21ParticipantDeviceTypeO8rawValueACSgSi_tcfC_0(unint64_t a1)
{
  if (a1 >= 5)
    return 4;
  else
    return (0x302010004uLL >> (8 * a1));
}

unint64_t sub_23C388FF8()
{
  unint64_t result;

  result = qword_256B80458;
  if (!qword_256B80458)
  {
    result = MEMORY[0x24261CC7C](&protocol conformance descriptor for RemoteParticipantDeviceType, &type metadata for RemoteParticipantDeviceType);
    atomic_store(result, (unint64_t *)&qword_256B80458);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for RemoteParticipantDeviceType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C389088 + 4 * byte_23C38CBE5[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23C3890BC + 4 * asc_23C38CBE0[v4]))();
}

uint64_t sub_23C3890BC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C3890C4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C3890CCLL);
  return result;
}

uint64_t sub_23C3890D8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C3890E0);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23C3890E4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C3890EC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RemoteParticipantDeviceType()
{
  return &type metadata for RemoteParticipantDeviceType;
}

unint64_t sub_23C389108()
{
  unint64_t result;

  result = qword_256B80460;
  if (!qword_256B80460)
  {
    result = MEMORY[0x24261CC7C](&protocol conformance descriptor for RemoteParticipantDeviceType, &type metadata for RemoteParticipantDeviceType);
    atomic_store(result, (unint64_t *)&qword_256B80460);
  }
  return result;
}

uint64_t SubscriptionHandoffView.init(store:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a1;
  *(_QWORD *)(result + 24) = a2;
  *(_QWORD *)a3 = sub_23C3891C4;
  *(_QWORD *)(a3 + 8) = result;
  *(_BYTE *)(a3 + 16) = 0;
  return result;
}

uint64_t sub_23C3891A0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23C3891C4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t SubscriptionHandoffView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  char v14;
  _OWORD v16[11];
  uint64_t v17;
  _OWORD v18[12];
  char v19;
  char v20;

  v4 = *v1;
  v3 = v1[1];
  v5 = *((_BYTE *)v1 + 16);
  v6 = sub_23C38AB48();
  sub_23C389364((uint64_t)v16);
  *(_OWORD *)((char *)&v18[8] + 7) = v16[8];
  *(_OWORD *)((char *)&v18[9] + 7) = v16[9];
  *(_OWORD *)((char *)&v18[10] + 7) = v16[10];
  *(_OWORD *)((char *)&v18[4] + 7) = v16[4];
  *(_OWORD *)((char *)&v18[5] + 7) = v16[5];
  *(_OWORD *)((char *)&v18[6] + 7) = v16[6];
  *(_OWORD *)((char *)&v18[7] + 7) = v16[7];
  *(_OWORD *)((char *)v18 + 7) = v16[0];
  *(_OWORD *)((char *)&v18[1] + 7) = v16[1];
  *(_OWORD *)((char *)&v18[2] + 7) = v16[2];
  v19 = 1;
  *(_QWORD *)((char *)&v18[11] + 7) = v17;
  *(_OWORD *)((char *)&v18[3] + 7) = v16[3];
  v7 = sub_23C38AB60();
  v20 = 0;
  v8 = swift_allocObject();
  v9 = v18[9];
  *(_OWORD *)(a1 + 145) = v18[8];
  *(_OWORD *)(a1 + 161) = v9;
  *(_OWORD *)(a1 + 177) = v18[10];
  *(_OWORD *)(a1 + 192) = *(_OWORD *)((char *)&v18[10] + 15);
  v10 = v18[5];
  *(_OWORD *)(a1 + 81) = v18[4];
  *(_OWORD *)(a1 + 97) = v10;
  v11 = v18[7];
  *(_OWORD *)(a1 + 113) = v18[6];
  *(_OWORD *)(a1 + 129) = v11;
  v12 = v18[1];
  *(_OWORD *)(a1 + 17) = v18[0];
  *(_OWORD *)(a1 + 33) = v12;
  v13 = v18[3];
  *(_OWORD *)(a1 + 49) = v18[2];
  *(_QWORD *)(v8 + 16) = v4;
  *(_QWORD *)(v8 + 24) = v3;
  *(_BYTE *)(v8 + 32) = v5;
  v14 = v20;
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  *(_OWORD *)(a1 + 65) = v13;
  *(_BYTE *)(a1 + 208) = v7;
  *(_OWORD *)(a1 + 216) = xmmword_23C38CD00;
  *(_OWORD *)(a1 + 232) = xmmword_23C38CD00;
  *(_BYTE *)(a1 + 248) = v14;
  *(_QWORD *)(a1 + 256) = sub_23C3899B4;
  *(_QWORD *)(a1 + 264) = v8;
  *(_QWORD *)(a1 + 272) = 0;
  *(_QWORD *)(a1 + 280) = 0;
  return sub_23C3899C0();
}

uint64_t sub_23C389364@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t ObjCClassFromMetadata;
  id v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  char v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  char v26;
  char v27;
  char v28;
  uint64_t v29;
  uint64_t KeyPath;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[25];
  char v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  char v60;
  __int128 v61;
  char v62;
  char v63;
  char v64;

  v2 = sub_23C38AB54();
  sub_23C389598((uint64_t)&v41);
  v4 = v41;
  v3 = v42;
  v5 = v43;
  v6 = v44;
  v7 = v45;
  v9 = v46;
  v8 = v47;
  v10 = v48;
  v11 = v49;
  v12 = v50;
  v31 = sub_23C38ABA8();
  KeyPath = swift_getKeyPath();
  v64 = 0;
  v63 = v5;
  v62 = v10;
  type metadata accessor for LocalizationBundle();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v14 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v29 = sub_23C38ABB4();
  sub_23C38ABC0();
  sub_23C38AB24();
  v15 = v57;
  v16 = v58;
  v17 = v59;
  v18 = v60;
  v26 = v64;
  v27 = v63;
  v28 = v62;
  *(_QWORD *)&v32 = v2;
  *((_QWORD *)&v32 + 1) = 0x4041800000000000;
  LOBYTE(v33) = v64;
  *((_QWORD *)&v33 + 1) = v4;
  *(_QWORD *)&v34 = v3;
  BYTE8(v34) = v63;
  *(_QWORD *)&v35 = v6;
  *((_QWORD *)&v35 + 1) = v7;
  *(_QWORD *)&v36 = v9;
  *((_QWORD *)&v36 + 1) = v8;
  LOBYTE(v37) = v62;
  *((_QWORD *)&v37 + 1) = v11;
  *(_QWORD *)v38 = v12;
  *(_QWORD *)&v38[8] = v31;
  *(_QWORD *)&v38[16] = KeyPath;
  v38[24] = 1;
  v19 = v32;
  v20 = v33;
  v21 = v35;
  *(_OWORD *)(a1 + 32) = v34;
  *(_OWORD *)(a1 + 48) = v21;
  *(_OWORD *)a1 = v19;
  *(_OWORD *)(a1 + 16) = v20;
  v22 = v36;
  v23 = v37;
  v24 = *(_OWORD *)v38;
  *(_OWORD *)(a1 + 105) = *(_OWORD *)&v38[9];
  *(_OWORD *)(a1 + 80) = v23;
  *(_OWORD *)(a1 + 96) = v24;
  *(_OWORD *)(a1 + 64) = v22;
  v40 = v16;
  v39 = v18;
  *(_QWORD *)(a1 + 128) = v29;
  *(_QWORD *)(a1 + 136) = v15;
  *(_BYTE *)(a1 + 144) = v16;
  *(_QWORD *)(a1 + 152) = v17;
  *(_BYTE *)(a1 + 160) = v18;
  *(_OWORD *)(a1 + 168) = v61;
  sub_23C389D20((uint64_t)&v32);
  v41 = v2;
  v42 = 0x4041800000000000;
  v43 = v26;
  v44 = v4;
  v45 = v3;
  LOBYTE(v46) = v27;
  v47 = v6;
  v48 = v7;
  v49 = v9;
  v50 = v8;
  v51 = v28;
  v52 = v11;
  v53 = v12;
  v54 = v31;
  v55 = KeyPath;
  v56 = 1;
  return sub_23C389DBC((uint64_t)&v41);
}

id sub_23C389598@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t ObjCClassFromMetadata;
  void *v5;
  id v6;
  void *v7;
  id result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  id v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v2 = sub_23C38AAE8();
  MEMORY[0x24BDAC7A8](v2);
  v3 = sub_23C38AC14();
  MEMORY[0x24BDAC7A8](v3);
  sub_23C38AC08();
  type metadata accessor for LocalizationBundle();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v5 = (void *)objc_opt_self();
  v25 = ObjCClassFromMetadata;
  v6 = objc_msgSend(v5, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_23C38AADC();
  sub_23C38AC2C();
  v7 = (void *)objc_opt_self();
  result = objc_msgSend(v7, sel__preferredFontForTextStyle_addingSymbolicTraits_, *MEMORY[0x24BEBE240], 2);
  if (result)
  {
    sub_23C38AB6C();
    v9 = sub_23C38AB78();
    v11 = v10;
    v13 = v12;
    v24 = v14;
    swift_bridgeObjectRelease();
    swift_release();
    sub_23C38AC08();
    v15 = objc_msgSend(v5, sel_bundleForClass_, v25);
    sub_23C38AADC();
    sub_23C38AC2C();
    result = objc_msgSend(v7, sel__preferredFontForTextStyle_variant_, *MEMORY[0x24BEBE250], 1024);
    if (result)
    {
      v16 = v13 & 1;
      sub_23C38AB6C();
      v17 = sub_23C38AB78();
      v19 = v18;
      v21 = v20;
      v23 = v22;
      swift_bridgeObjectRelease();
      swift_release();
      *(_QWORD *)a1 = v9;
      *(_QWORD *)(a1 + 8) = v11;
      *(_BYTE *)(a1 + 16) = v16;
      *(_QWORD *)(a1 + 24) = v24;
      *(_QWORD *)(a1 + 32) = 0x3FE0000000000000;
      *(_QWORD *)(a1 + 40) = v17;
      *(_QWORD *)(a1 + 48) = v19;
      *(_BYTE *)(a1 + 56) = v21 & 1;
      *(_QWORD *)(a1 + 64) = v23;
      *(_QWORD *)(a1 + 72) = 0x3FD3333333333333;
      sub_23C389DAC(v9, v11, v16);
      swift_bridgeObjectRetain();
      sub_23C389DAC(v17, v19, v21 & 1);
      swift_bridgeObjectRetain();
      sub_23C389E48(v17, v19, v21 & 1);
      swift_bridgeObjectRelease();
      sub_23C389E48(v9, v11, v16);
      return (id)swift_bridgeObjectRelease();
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_23C3898D0()
{
  sub_23C3899C0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B80498);
  sub_23C389C94(&qword_256B804A0, &qword_256B80498, MEMORY[0x24BE2B5E8]);
  sub_23C38AB18();
  sub_23C3899AC();
  sub_23C38ABF0();
  return swift_release();
}

uint64_t sub_23C389984()
{
  sub_23C3899AC();
  return swift_deallocObject();
}

uint64_t sub_23C3899AC()
{
  return swift_release();
}

uint64_t sub_23C3899B4()
{
  return sub_23C3898D0();
}

uint64_t sub_23C3899C0()
{
  return swift_retain();
}

uint64_t sub_23C3899C8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23C3899E0()
{
  return sub_23C38AB9C();
}

uint64_t destroy for SubscriptionHandoffView()
{
  return sub_23C3899AC();
}

uint64_t _s21FitnessRemoteBrowsing23SubscriptionHandoffViewVwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  sub_23C3899C0();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for SubscriptionHandoffView(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  sub_23C3899C0();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_23C3899AC();
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

uint64_t assignWithTake for SubscriptionHandoffView(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_23C3899AC();
  return a1;
}

uint64_t getEnumTagSinglePayload for SubscriptionHandoffView(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SubscriptionHandoffView(uint64_t result, unsigned int a2, unsigned int a3)
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

ValueMetadata *type metadata accessor for SubscriptionHandoffView()
{
  return &type metadata for SubscriptionHandoffView;
}

unint64_t sub_23C389BA4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256B80468;
  if (!qword_256B80468)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B80470);
    v2[0] = sub_23C389C10();
    v2[1] = MEMORY[0x24BDF0910];
    result = MEMORY[0x24261CC7C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256B80468);
  }
  return result;
}

unint64_t sub_23C389C10()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256B80478;
  if (!qword_256B80478)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B80480);
    v2[0] = sub_23C389C94(&qword_256B80488, &qword_256B80490, MEMORY[0x24BDF4498]);
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x24261CC7C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256B80478);
  }
  return result;
}

uint64_t sub_23C389C94(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24261CC7C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23C389CD4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23C38AB30();
  *a1 = result;
  return result;
}

uint64_t sub_23C389CFC()
{
  return sub_23C38AB3C();
}

uint64_t sub_23C389D20(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  v2 = *(_QWORD *)(a1 + 64);
  v3 = *(_QWORD *)(a1 + 72);
  v4 = *(_BYTE *)(a1 + 80);
  sub_23C389DAC(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  swift_bridgeObjectRetain();
  sub_23C389DAC(v2, v3, v4);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_23C389DAC(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_23C389DBC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  v2 = *(_QWORD *)(a1 + 64);
  v3 = *(_QWORD *)(a1 + 72);
  v4 = *(_BYTE *)(a1 + 80);
  sub_23C389E48(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  swift_bridgeObjectRelease();
  sub_23C389E48(v2, v3, v4);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_23C389E48(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t SubscriptionHandoffState.init(locale:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  v4 = sub_23C38AAE8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
}

uint64_t sub_23C389E98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C38AA20(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23C389EC0()
{
  sub_23C38A020();
  return sub_23C38AE24();
}

uint64_t sub_23C389EE8()
{
  sub_23C38A020();
  return sub_23C38AE30();
}

uint64_t SubscriptionHandoffState.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B804A8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C38A020();
  sub_23C38AE18();
  sub_23C38AAE8();
  sub_23C38A5EC(&qword_256B804B8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], MEMORY[0x24BDCEEC8]);
  sub_23C38ADC4();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_23C38A020()
{
  unint64_t result;

  result = qword_256B804B0;
  if (!qword_256B804B0)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38CF6C, &type metadata for SubscriptionHandoffState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B804B0);
  }
  return result;
}

uint64_t SubscriptionHandoffState.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;

  v15 = a2;
  v17 = sub_23C38AAE8();
  v14 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v16 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B804C0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for SubscriptionHandoffState();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C38A020();
  sub_23C38AE0C();
  if (!v2)
  {
    sub_23C38A5EC(&qword_256B804C8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], MEMORY[0x24BDCEEE8]);
    sub_23C38AD70();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v11, v16, v17);
    sub_23C38A264((uint64_t)v11, v15);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t type metadata accessor for SubscriptionHandoffState()
{
  uint64_t result;

  result = qword_256B80530;
  if (!qword_256B80530)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23C38A264(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SubscriptionHandoffState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23C38A2A8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return SubscriptionHandoffState.init(from:)(a1, a2);
}

uint64_t sub_23C38A2BC(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B804A8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C38A020();
  sub_23C38AE18();
  sub_23C38AAE8();
  sub_23C38A5EC(&qword_256B804B8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], MEMORY[0x24BDCEEC8]);
  sub_23C38ADC4();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t SubscriptionHandoffState.hash(into:)()
{
  sub_23C38AAE8();
  sub_23C38A5EC(&qword_256B804D0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], MEMORY[0x24BDCEED0]);
  return sub_23C38ABFC();
}

uint64_t SubscriptionHandoffState.hashValue.getter()
{
  sub_23C38ADDC();
  sub_23C38AAE8();
  sub_23C38A5EC(&qword_256B804D0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], MEMORY[0x24BDCEED0]);
  sub_23C38ABFC();
  return sub_23C38AE00();
}

uint64_t sub_23C38A494()
{
  sub_23C38ADDC();
  sub_23C38AAE8();
  sub_23C38A5EC(&qword_256B804D0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], MEMORY[0x24BDCEED0]);
  sub_23C38ABFC();
  return sub_23C38AE00();
}

uint64_t sub_23C38A500()
{
  sub_23C38AAE8();
  sub_23C38A5EC(&qword_256B804D0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], MEMORY[0x24BDCEED0]);
  return sub_23C38ABFC();
}

uint64_t sub_23C38A558()
{
  sub_23C38ADDC();
  sub_23C38AAE8();
  sub_23C38A5EC(&qword_256B804D0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], MEMORY[0x24BDCEED0]);
  sub_23C38ABFC();
  return sub_23C38AE00();
}

uint64_t sub_23C38A5C0()
{
  return sub_23C38A5EC((unint64_t *)&qword_256B800D8, (uint64_t (*)(uint64_t))type metadata accessor for SubscriptionHandoffState, (uint64_t)&protocol conformance descriptor for SubscriptionHandoffState);
}

uint64_t sub_23C38A5EC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x24261CC7C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for SubscriptionHandoffState(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23C38AAE8();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t destroy for SubscriptionHandoffState(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23C38AAE8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for SubscriptionHandoffState(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23C38AAE8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for SubscriptionHandoffState(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23C38AAE8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for SubscriptionHandoffState(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23C38AAE8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for SubscriptionHandoffState(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23C38AAE8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for SubscriptionHandoffState()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C38A7BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23C38AAE8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for SubscriptionHandoffState()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C38A804(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23C38AAE8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t sub_23C38A844()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23C38AAE8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for SubscriptionHandoffState.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23C38A8EC + 4 * byte_23C38CDC0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23C38A90C + 4 * byte_23C38CDC5[v4]))();
}

_BYTE *sub_23C38A8EC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23C38A90C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C38A914(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C38A91C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C38A924(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C38A92C(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for SubscriptionHandoffState.CodingKeys()
{
  return &type metadata for SubscriptionHandoffState.CodingKeys;
}

unint64_t sub_23C38A94C()
{
  unint64_t result;

  result = qword_256B80568;
  if (!qword_256B80568)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38CF44, &type metadata for SubscriptionHandoffState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B80568);
  }
  return result;
}

unint64_t sub_23C38A994()
{
  unint64_t result;

  result = qword_256B80570;
  if (!qword_256B80570)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38CEB4, &type metadata for SubscriptionHandoffState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B80570);
  }
  return result;
}

unint64_t sub_23C38A9DC()
{
  unint64_t result;

  result = qword_256B80578;
  if (!qword_256B80578)
  {
    result = MEMORY[0x24261CC7C](&unk_23C38CEDC, &type metadata for SubscriptionHandoffState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B80578);
  }
  return result;
}

uint64_t sub_23C38AA20(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x656C61636F6CLL && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_23C38ADD0();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23C38AA9C()
{
  return 0x656C61636F6CLL;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t sub_23C38AAD0()
{
  return MEMORY[0x24BDCECD8]();
}

uint64_t sub_23C38AADC()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_23C38AAE8()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_23C38AAF4()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23C38AB00()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_23C38AB0C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23C38AB18()
{
  return MEMORY[0x24BDEB790]();
}

uint64_t sub_23C38AB24()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_23C38AB30()
{
  return MEMORY[0x24BDEE288]();
}

uint64_t sub_23C38AB3C()
{
  return MEMORY[0x24BDEE290]();
}

uint64_t sub_23C38AB48()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_23C38AB54()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_23C38AB60()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_23C38AB6C()
{
  return MEMORY[0x24BDF1950]();
}

uint64_t sub_23C38AB78()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_23C38AB84()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_23C38AB90()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_23C38AB9C()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_23C38ABA8()
{
  return MEMORY[0x24BDF3D30]();
}

uint64_t sub_23C38ABB4()
{
  return MEMORY[0x24BDF4130]();
}

uint64_t sub_23C38ABC0()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_23C38ABCC()
{
  return MEMORY[0x24BE2B460]();
}

uint64_t sub_23C38ABD8()
{
  return MEMORY[0x24BE2B560]();
}

uint64_t sub_23C38ABE4()
{
  return MEMORY[0x24BE2B588]();
}

uint64_t sub_23C38ABF0()
{
  return MEMORY[0x24BE2B5A8]();
}

uint64_t sub_23C38ABFC()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_23C38AC08()
{
  return MEMORY[0x24BDCF8D8]();
}

uint64_t sub_23C38AC14()
{
  return MEMORY[0x24BDCF978]();
}

uint64_t sub_23C38AC20()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_23C38AC2C()
{
  return MEMORY[0x24BE37C28]();
}

uint64_t sub_23C38AC38()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23C38AC44()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23C38AC50()
{
  return MEMORY[0x24BEE1018]();
}

uint64_t sub_23C38AC5C()
{
  return MEMORY[0x24BEE1098]();
}

uint64_t sub_23C38AC68()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_23C38AC74()
{
  return MEMORY[0x24BEE68D8]();
}

uint64_t sub_23C38AC80()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_23C38AC8C()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_23C38AC98()
{
  return MEMORY[0x24BEE6940]();
}

uint64_t sub_23C38ACA4()
{
  return MEMORY[0x24BEE6C08]();
}

uint64_t sub_23C38ACB0()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_23C38ACBC()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23C38ACC8()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23C38ACD4()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_23C38ACE0()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23C38ACEC()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_23C38ACF8()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_23C38AD04()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23C38AD10()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23C38AD1C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23C38AD28()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_23C38AD34()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_23C38AD40()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_23C38AD4C()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_23C38AD58()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_23C38AD64()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_23C38AD70()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_23C38AD7C()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_23C38AD88()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_23C38AD94()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_23C38ADA0()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_23C38ADAC()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_23C38ADB8()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_23C38ADC4()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_23C38ADD0()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23C38ADDC()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23C38ADE8()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23C38ADF4()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_23C38AE00()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23C38AE0C()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_23C38AE18()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23C38AE24()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23C38AE30()
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

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
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

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x24BEE4DC0]();
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

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

