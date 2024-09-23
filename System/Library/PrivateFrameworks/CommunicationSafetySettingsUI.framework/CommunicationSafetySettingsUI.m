uint64_t NudityDetectionAppsRootView.init()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  type metadata accessor for NudityDetectionRootModel(0);
  sub_238375D70(&qword_2568FCAC8, type metadata accessor for NudityDetectionRootModel, (uint64_t)&protocol conformance descriptor for NudityDetectionRootModel);
  result = sub_23838664C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t NudityDetectionAppsRootView.body.getter@<X0>(uint64_t a1@<X8>)
{
  __int128 *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v18 = a1;
  v2 = sub_23838661C();
  v17 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FCAD0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FCAD8);
  v16 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = *v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FCAE0);
  sub_2383772F0(&qword_2568FCAE8, &qword_2568FCAE0, MEMORY[0x24BDF5428]);
  sub_238386730();
  sub_238386814();
  v12 = sub_2383772F0(&qword_2568FCAF0, &qword_2568FCAD0, MEMORY[0x24BDF1988]);
  v13 = sub_238375D70(&qword_2568FCAF8, (uint64_t (*)(uint64_t))MEMORY[0x24BDED668], MEMORY[0x24BDED650]);
  sub_238386790();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v4, v2);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v20 = v5;
  v21 = v2;
  v22 = v12;
  v23 = v13;
  swift_getOpaqueTypeConformance2();
  sub_238386760();
  return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v11, v9);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B832150]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_238375A68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t result;
  _BYTE v20[4];
  int v21;
  uint64_t v22;
  uint64_t v23;
  unsigned __int8 v24;

  type metadata accessor for SafetyResourcesSection(0);
  v4 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v6 = (uint64_t *)&v20[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v4);
  v8 = &v20[-v7];
  type metadata accessor for NudityDetectionRootModel(0);
  sub_238375D70(&qword_2568FCAC8, type metadata accessor for NudityDetectionRootModel, (uint64_t)&protocol conformance descriptor for NudityDetectionRootModel);
  swift_retain();
  sub_238386628();
  swift_release();
  swift_getKeyPath();
  sub_238386640();
  swift_release();
  swift_release();
  v9 = v22;
  v10 = v23;
  v21 = v24;
  *v6 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FCBE0);
  swift_storeEnumTagMultiPayload();
  sub_238376ED8((uint64_t)v6, (uint64_t)v8);
  if (a1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_238386598();
    swift_release();
    swift_release();
    swift_release();
    if ((v22 & 1) != 0)
    {
      v11 = sub_23838664C();
      v13 = v12;
      v14 = sub_23838664C();
      v16 = v15;
    }
    else
    {
      v13 = 0;
      v14 = 0;
      v16 = 0;
      v11 = 1;
    }
    sub_238376F1C((uint64_t)v8, (uint64_t)v6);
    *(_QWORD *)a2 = v9;
    *(_QWORD *)(a2 + 8) = v10;
    *(_BYTE *)(a2 + 16) = v21;
    *(_QWORD *)(a2 + 24) = 0;
    *(_QWORD *)(a2 + 32) = 0;
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FCBE8);
    sub_238376F1C((uint64_t)v6, a2 + *(int *)(v17 + 48));
    v18 = (uint64_t *)(a2 + *(int *)(v17 + 64));
    *v18 = v11;
    v18[1] = v13;
    v18[2] = v14;
    v18[3] = v16;
    swift_retain();
    swift_retain();
    sub_238376F60(v11);
    sub_238376F94((uint64_t)v8);
    sub_238376FD0(v11);
    sub_238376F94((uint64_t)v6);
    swift_bridgeObjectRelease();
    swift_release();
    return swift_release();
  }
  else
  {
    result = sub_238386634();
    __break(1u);
  }
  return result;
}

uint64_t sub_238375D24@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_238375A68(*(_QWORD *)(v1 + 16), a1);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B83215C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_238375D70(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B832168](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_238375DB0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_238375DC8@<X0>(uint64_t a1@<X8>)
{
  __int128 *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v18 = a1;
  v2 = sub_23838661C();
  v17 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FCAD0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FCAD8);
  v16 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = *v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FCAE0);
  sub_2383772F0(&qword_2568FCAE8, &qword_2568FCAE0, MEMORY[0x24BDF5428]);
  sub_238386730();
  sub_238386814();
  v12 = sub_2383772F0(&qword_2568FCAF0, &qword_2568FCAD0, MEMORY[0x24BDF1988]);
  v13 = sub_238375D70(&qword_2568FCAF8, (uint64_t (*)(uint64_t))MEMORY[0x24BDED668], MEMORY[0x24BDED650]);
  sub_238386790();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v4, v2);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v20 = v5;
  v21 = v2;
  v22 = v12;
  v23 = v13;
  swift_getOpaqueTypeConformance2();
  sub_238386760();
  return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v11, v9);
}

_QWORD *initializeBufferWithCopyOfBuffer for NudityDetectionAppsRootView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for NudityDetectionAppsRootView()
{
  return swift_release();
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for NudityDetectionAppsRootView(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  return a1;
}

ValueMetadata *type metadata accessor for NudityDetectionAppsRootView()
{
  return &type metadata for NudityDetectionAppsRootView;
}

uint64_t sub_23837607C()
{
  uint64_t (*v0)(uint64_t);

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568FCAD8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568FCAD0);
  sub_23838661C();
  v0 = (uint64_t (*)(uint64_t))MEMORY[0x24BDED668];
  sub_2383772F0(&qword_2568FCAF0, &qword_2568FCAD0, MEMORY[0x24BDF1988]);
  sub_238375D70(&qword_2568FCAF8, v0, MEMORY[0x24BDED650]);
  swift_getOpaqueTypeConformance2();
  return swift_getOpaqueTypeConformance2();
}

void type metadata accessor for MOUserSafetyScannableServices(uint64_t a1)
{
  sub_238376174(a1, &qword_2542CBCD0);
}

void type metadata accessor for Name(uint64_t a1)
{
  sub_238376174(a1, &qword_2542CBCB8);
}

void sub_238376174(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

_QWORD *assignWithCopy for AnalyticsSection(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for AnalyticsSection(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 16))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AnalyticsSection(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for NudityDetectionEntryListSection()
{
  return &type metadata for NudityDetectionEntryListSection;
}

uint64_t sub_2383762C0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2383762D0()
{
  id v0;

  sub_2383866DC();
  if (qword_2542CBCE0 != -1)
    swift_once();
  swift_beginAccess();
  v0 = (id)qword_2542CB6A0;
  sub_23838673C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FCBB0);
  sub_238376E24();
  return sub_2383867E4();
}

uint64_t sub_238376404@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t result;
  uint64_t v9;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FCBB0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_238386598();
    swift_release();
    swift_release();
    swift_release();
    swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542CBC58);
    sub_2383772F0(&qword_2568FCBD0, (uint64_t *)&unk_2542CBC58, MEMORY[0x24BEE12D8]);
    sub_238376E88();
    sub_2383867D8();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(a2, v7, v4);
  }
  else
  {
    type metadata accessor for NudityDetectionRootModel(0);
    sub_238375D70(&qword_2568FCAC8, type metadata accessor for NudityDetectionRootModel, (uint64_t)&protocol conformance descriptor for NudityDetectionRootModel);
    result = sub_238386634();
    __break(1u);
  }
  return result;
}

uint64_t sub_2383765B4@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;

  v2 = (_QWORD *)(*a1 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI20NudityDetectionEntry_defaultsKey);
  v3 = v2[1];
  *a2 = *v2;
  a2[1] = v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2383765D4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  type metadata accessor for NudityDetectionEntry(0);
  sub_238375D70(&qword_2568FCBD8, type metadata accessor for NudityDetectionEntry, (uint64_t)&unk_2383877F0);
  swift_retain();
  result = sub_2383865F8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_238376640()
{
  return sub_2383762D0();
}

uint64_t sub_238376648@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  char v4;
  uint64_t v5;

  sub_238377280();
  swift_bridgeObjectRetain();
  result = sub_238386754();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = v4 & 1;
  *(_QWORD *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_2383766B0()
{
  return sub_238386784();
}

uint64_t sub_2383766C8()
{
  type metadata accessor for NudityDetectionEntry(0);
  sub_238375D70(&qword_2568FCBD8, type metadata accessor for NudityDetectionEntry, (uint64_t)&unk_2383877F0);
  sub_238386604();
  swift_getKeyPath();
  sub_238386610();
  swift_release();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FCC00);
  sub_2383772F0(&qword_2568FCC08, &qword_2568FCC00, MEMORY[0x24BDF41A8]);
  return sub_2383867B4();
}

uint64_t sub_2383767D4@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_238386598();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_238376850()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  swift_retain();
  return sub_2383865A4();
}

uint64_t sub_2383768C8(uint64_t a1, uint64_t a2)
{
  return sub_238376A28(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_2383768E4(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_23838688C();
  *a2 = 0;
  return result;
}

uint64_t sub_238376958(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_238386898();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_2383769D4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_2383868A4();
  v2 = sub_238386880();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_238376A14(uint64_t a1, uint64_t a2)
{
  return sub_238376A28(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_238376A28(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_2383868A4();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_238376A64()
{
  sub_2383868A4();
  sub_2383868C8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_238376AA4()
{
  uint64_t v0;

  sub_2383868A4();
  sub_238386B44();
  sub_2383868C8();
  v0 = sub_238386B5C();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_238376B18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_2383868A4();
  v2 = v1;
  if (v0 == sub_2383868A4() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_238386B2C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_238376BA0()
{
  sub_238375D70(&qword_2568FCB90, (uint64_t (*)(uint64_t))type metadata accessor for MOUserSafetyScannableServices, (uint64_t)&unk_2383873D8);
  sub_238375D70((unint64_t *)&unk_2568FCB98, (uint64_t (*)(uint64_t))type metadata accessor for MOUserSafetyScannableServices, (uint64_t)&unk_238387380);
  return sub_238386B14();
}

uint64_t sub_238376C24@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_238386880();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_238376C68@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_2383868A4();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_238376C90()
{
  sub_238375D70(&qword_2542CBCA0, (uint64_t (*)(uint64_t))type metadata accessor for Name, (uint64_t)&unk_238387460);
  sub_238375D70(&qword_2568FCBA8, (uint64_t (*)(uint64_t))type metadata accessor for Name, (uint64_t)&unk_238387280);
  return sub_238386B14();
}

uint64_t sub_238376D14()
{
  return sub_238375D70(&qword_2568FCB60, (uint64_t (*)(uint64_t))type metadata accessor for Name, (uint64_t)&unk_238387248);
}

uint64_t sub_238376D40()
{
  return sub_238375D70(&qword_2568FCB68, (uint64_t (*)(uint64_t))type metadata accessor for Name, (uint64_t)&unk_238387220);
}

uint64_t sub_238376D6C()
{
  return sub_238375D70(&qword_2568FCB70, (uint64_t (*)(uint64_t))type metadata accessor for MOUserSafetyScannableServices, (uint64_t)&unk_238387348);
}

uint64_t sub_238376D98()
{
  return sub_238375D70(&qword_2568FCB78, (uint64_t (*)(uint64_t))type metadata accessor for MOUserSafetyScannableServices, (uint64_t)&unk_238387320);
}

uint64_t sub_238376DC4()
{
  return sub_238375D70((unint64_t *)&unk_2568FCB80, (uint64_t (*)(uint64_t))type metadata accessor for MOUserSafetyScannableServices, (uint64_t)&unk_2383873B0);
}

uint64_t sub_238376DF0()
{
  return sub_238375D70((unint64_t *)&unk_2542CBCA8, (uint64_t (*)(uint64_t))type metadata accessor for Name, (uint64_t)&unk_2383872B0);
}

uint64_t sub_238376E1C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_238376404(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_238376E24()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_2568FCBB8;
  if (!qword_2568FCBB8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568FCBB0);
    v2 = sub_238376E88();
    result = MEMORY[0x23B832168](MEMORY[0x24BDF4A08], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2568FCBB8);
  }
  return result;
}

unint64_t sub_238376E88()
{
  unint64_t result;

  result = qword_2568FCBC0;
  if (!qword_2568FCBC0)
  {
    result = MEMORY[0x23B832168](&unk_2383875A8, &type metadata for NudityDetectionEntryRow);
    atomic_store(result, (unint64_t *)&qword_2568FCBC0);
  }
  return result;
}

uint64_t sub_238376ED8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SafetyResourcesSection(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_238376F1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SafetyResourcesSection(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_238376F60(uint64_t result)
{
  if (result != 1)
  {
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_238376F94(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SafetyResourcesSection(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_238376FD0(uint64_t result)
{
  if (result != 1)
  {
    swift_release();
    return swift_release();
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for NudityDetectionEntryRow(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for NudityDetectionEntryRow()
{
  return swift_release();
}

_QWORD *assignWithCopy for NudityDetectionEntryRow(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

_QWORD *assignWithTake for NudityDetectionEntryRow(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for NudityDetectionEntryRow(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for NudityDetectionEntryRow(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
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
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for NudityDetectionEntryRow()
{
  return &type metadata for NudityDetectionEntryRow;
}

unint64_t sub_23837713C()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[3];

  result = qword_2568FCBF0;
  if (!qword_2568FCBF0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568FCBF8);
    v2 = sub_238376E24();
    v3[0] = MEMORY[0x24BDF1F80];
    v3[1] = v2;
    v3[2] = MEMORY[0x24BDF5138];
    result = MEMORY[0x23B832168](MEMORY[0x24BDF4AF8], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2568FCBF0);
  }
  return result;
}

uint64_t sub_2383771B4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2383771CC()
{
  return sub_23838679C();
}

uint64_t sub_23837722C@<X0>(uint64_t a1@<X8>)
{
  return sub_238376648(a1);
}

uint64_t sub_238377234@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v3 = *(uint64_t (**)(uint64_t))(**(_QWORD **)(v1 + 24) + 144);
  v4 = swift_retain();
  v5 = v3(v4);
  result = swift_release();
  *a1 = v5;
  return result;
}

unint64_t sub_238377280()
{
  unint64_t result;

  result = qword_2568FCC10;
  if (!qword_2568FCC10)
  {
    result = MEMORY[0x23B832168](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2568FCC10);
  }
  return result;
}

uint64_t sub_2383772C4()
{
  return sub_2383772F0(&qword_2568FCC18, (uint64_t *)&unk_2568FCC20, MEMORY[0x24BDF46D0]);
}

uint64_t sub_2383772F0(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x23B832168](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t static Logger.CSSUI.getter()
{
  return sub_238386568();
}

unint64_t sub_238377374()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;

  v0 = sub_2383868A4();
  v2 = v1;
  if (v0 == sub_2383868A4() && v2 == v3)
  {
    swift_bridgeObjectRelease_n();
LABEL_15:
    if (qword_2542CBCE0 == -1)
      goto LABEL_34;
    goto LABEL_37;
  }
  v5 = sub_238386B2C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v5 & 1) != 0)
    goto LABEL_15;
  v6 = sub_2383868A4();
  v8 = v7;
  if (v6 == sub_2383868A4() && v8 == v9)
  {
    swift_bridgeObjectRelease_n();
LABEL_18:
    if (qword_2542CBCE0 == -1)
      goto LABEL_34;
    goto LABEL_37;
  }
  v11 = sub_238386B2C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v11 & 1) != 0)
    goto LABEL_18;
  v12 = sub_2383868A4();
  v14 = v13;
  if (v12 == sub_2383868A4() && v14 == v15)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_21;
  }
  v16 = sub_238386B2C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v16 & 1) != 0)
  {
LABEL_21:
    if (qword_2542CBCE0 == -1)
      goto LABEL_34;
    goto LABEL_37;
  }
  v17 = sub_2383868A4();
  v19 = v18;
  if (v17 == sub_2383868A4() && v19 == v20)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_27;
  }
  v21 = sub_238386B2C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v21 & 1) != 0)
  {
LABEL_27:
    if (qword_2542CBCE0 == -1)
      goto LABEL_34;
    goto LABEL_37;
  }
  v22 = sub_2383868A4();
  v24 = v23;
  if (v22 == sub_2383868A4() && v24 == v25)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v26 = sub_238386B2C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v26 & 1) == 0)
      return 0xD000000000000010;
  }
  if (qword_2542CBCE0 != -1)
LABEL_37:
    swift_once();
LABEL_34:
  swift_beginAccess();
  v27 = (id)qword_2542CB6A0;
  v28 = (void *)sub_238386880();
  v29 = objc_msgSend(v27, sel_localizedStringForKey_value_table_, v28, 0, 0);

  v30 = sub_2383868A4();
  return v30;
}

uint64_t sub_23837784C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
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
  uint64_t v18;
  char v19;
  id v20;
  void *v21;
  id v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t *v26;
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
  char v37;
  id v38;
  void *v39;
  id v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  id v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;

  v70 = a1;
  v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FCC90);
  MEMORY[0x24BDAC7A8](v65);
  v69 = (uint64_t)&v61 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FCC98);
  MEMORY[0x24BDAC7A8](v62);
  v3 = (char *)&v61 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FCCA0);
  MEMORY[0x24BDAC7A8](v64);
  v5 = (char *)&v61 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FCF00);
  MEMORY[0x24BDAC7A8](v67);
  v7 = (char *)&v61 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v66 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2568FCEF0);
  MEMORY[0x24BDAC7A8](v66);
  v9 = (char *)&v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FCCA8);
  v68 = *(_QWORD *)(v10 - 8);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v61 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v63 = (char *)&v61 - v14;
  v15 = sub_2383868A4();
  v17 = v16;
  if (v15 == sub_2383868A4() && v17 == v18)
  {
    swift_bridgeObjectRelease_n();
LABEL_5:
    v20 = objc_allocWithZone(MEMORY[0x24BE51A90]);
    v21 = (void *)sub_238386880();
    objc_msgSend(v20, sel_initWithType_, v21);

    v22 = objc_msgSend((id)objc_opt_self(), sel_imageDescriptorNamed_, *MEMORY[0x24BE51AF0]);
    v23 = v63;
    sub_238386550();
    v24 = v5;
    v25 = v68;
    (*(void (**)(char *, char *, uint64_t))(v68 + 16))(v24, v23, v10);
    swift_storeEnumTagMultiPayload();
    sub_238378424();
    sub_238386700();
    sub_2383784F0((uint64_t)v7, (uint64_t)v3, &qword_2568FCF00);
    swift_storeEnumTagMultiPayload();
    sub_238378470();
    sub_238386700();
    sub_238378534((uint64_t)v7, &qword_2568FCF00);
    v26 = (uint64_t *)&unk_2568FCEF0;
    sub_2383784F0((uint64_t)v9, v69, (uint64_t *)&unk_2568FCEF0);
    swift_storeEnumTagMultiPayload();
    sub_23837848C((unint64_t *)&qword_2568FCCB0, (uint64_t *)&unk_2568FCEF0, sub_238378470);
    v27 = v25;
LABEL_15:
    sub_238386700();
    v43 = (uint64_t)v9;
    goto LABEL_16;
  }
  v19 = sub_238386B2C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v19 & 1) != 0)
    goto LABEL_5;
  v28 = sub_2383868A4();
  v30 = v29;
  if (v28 == sub_2383868A4() && v30 == v31)
    goto LABEL_8;
  v32 = sub_238386B2C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v32 & 1) != 0)
    goto LABEL_14;
  v33 = sub_2383868A4();
  v35 = v34;
  if (v33 == sub_2383868A4() && v35 == v36)
    goto LABEL_8;
  v37 = sub_238386B2C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v37 & 1) != 0)
    goto LABEL_14;
  v45 = sub_2383868A4();
  v47 = v46;
  if (v45 == sub_2383868A4() && v47 == v48)
  {
LABEL_8:
    swift_bridgeObjectRelease_n();
LABEL_14:
    v38 = objc_allocWithZone(MEMORY[0x24BE51A90]);
    v39 = (void *)sub_238386880();
    objc_msgSend(v38, sel_initWithBundleIdentifier_, v39);

    v40 = objc_msgSend((id)objc_opt_self(), sel_imageDescriptorNamed_, *MEMORY[0x24BE51AF0]);
    v41 = v63;
    sub_238386550();
    v42 = v68;
    (*(void (**)(char *, char *, uint64_t))(v68 + 16))(v5, v41, v10);
    swift_storeEnumTagMultiPayload();
    sub_238378424();
    sub_238386700();
    sub_2383784F0((uint64_t)v7, (uint64_t)v3, &qword_2568FCF00);
    swift_storeEnumTagMultiPayload();
    sub_238378470();
    sub_238386700();
    sub_238378534((uint64_t)v7, &qword_2568FCF00);
    v26 = (uint64_t *)&unk_2568FCEF0;
    sub_2383784F0((uint64_t)v9, v69, (uint64_t *)&unk_2568FCEF0);
    swift_storeEnumTagMultiPayload();
    sub_23837848C((unint64_t *)&qword_2568FCCB0, (uint64_t *)&unk_2568FCEF0, sub_238378470);
    v27 = v42;
    v23 = v41;
    goto LABEL_15;
  }
  v49 = sub_238386B2C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v49 & 1) != 0)
    goto LABEL_14;
  v50 = sub_2383868A4();
  v52 = v51;
  if (v50 == sub_2383868A4() && v52 == v53)
  {
    swift_bridgeObjectRelease_n();
    v27 = v68;
  }
  else
  {
    v54 = sub_238386B2C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v27 = v68;
    if ((v54 & 1) == 0)
    {
      v58 = objc_allocWithZone(MEMORY[0x24BE51A90]);
      v59 = (void *)sub_238386880();
      objc_msgSend(v58, sel_initWithSymbolName_, v59);

      v60 = objc_msgSend((id)objc_opt_self(), sel_imageDescriptorNamed_, *MEMORY[0x24BE51AF0]);
      sub_238386550();
      (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v5, v13, v10);
      swift_storeEnumTagMultiPayload();
      sub_238378424();
      sub_238386700();
      sub_2383784F0((uint64_t)v7, v69, &qword_2568FCF00);
      swift_storeEnumTagMultiPayload();
      sub_23837848C((unint64_t *)&qword_2568FCCB0, (uint64_t *)&unk_2568FCEF0, sub_238378470);
      sub_238378470();
      sub_238386700();
      sub_238378534((uint64_t)v7, &qword_2568FCF00);
      v23 = v13;
      return (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v23, v10);
    }
  }
  v55 = objc_allocWithZone(MEMORY[0x24BE51A90]);
  v56 = (void *)sub_238386880();
  objc_msgSend(v55, sel_initWithType_, v56);

  v57 = objc_msgSend((id)objc_opt_self(), sel_imageDescriptorNamed_, *MEMORY[0x24BE51AF0]);
  v23 = v63;
  sub_238386550();
  (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v5, v23, v10);
  swift_storeEnumTagMultiPayload();
  sub_238378424();
  sub_238386700();
  v26 = &qword_2568FCF00;
  sub_2383784F0((uint64_t)v7, v69, &qword_2568FCF00);
  swift_storeEnumTagMultiPayload();
  sub_23837848C((unint64_t *)&qword_2568FCCB0, (uint64_t *)&unk_2568FCEF0, sub_238378470);
  sub_238378470();
  sub_238386700();
  v43 = (uint64_t)v7;
LABEL_16:
  sub_238378534(v43, v26);
  return (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v23, v10);
}

unint64_t sub_238378424()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2568FCED0;
  if (!qword_2568FCED0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568FCCA8);
    result = MEMORY[0x23B832168](MEMORY[0x24BEC6520], v1);
    atomic_store(result, (unint64_t *)&qword_2568FCED0);
  }
  return result;
}

uint64_t sub_238378470()
{
  return sub_23837848C((unint64_t *)&unk_2568FCCB8, &qword_2568FCF00, (uint64_t (*)(void))sub_238378424);
}

uint64_t sub_23837848C(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t result;
  uint64_t v6;
  _QWORD v7[2];

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7[0] = a3();
    v7[1] = v7[0];
    result = MEMORY[0x23B832168](MEMORY[0x24BDEF3E0], v6, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2383784F0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_238378534(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

id sub_2383785AC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_2383785E0()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  type metadata accessor for FindClass();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  qword_2542CB6A0 = (uint64_t)result;
  return result;
}

id static NSBundle.communicationSafetySettingsUI.getter()
{
  if (qword_2542CBCE0 != -1)
    swift_once();
  swift_beginAccess();
  return (id)qword_2542CB6A0;
}

void static NSBundle.communicationSafetySettingsUI.setter(uint64_t a1)
{
  void *v2;

  if (qword_2542CBCE0 != -1)
    swift_once();
  swift_beginAccess();
  v2 = (void *)qword_2542CB6A0;
  qword_2542CB6A0 = a1;

}

uint64_t (*static NSBundle.communicationSafetySettingsUI.modify())()
{
  if (qword_2542CBCE0 != -1)
    swift_once();
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t type metadata accessor for FindClass()
{
  return objc_opt_self();
}

uint64_t sub_2383787A0@<X0>(_BYTE *a1@<X8>)
{
  return sub_23837888C(a1);
}

void sub_2383787B4()
{
  unsigned __int8 v0;

  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_2383865A4();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_238386598();
  swift_release();
  swift_release();
  sub_23837C7EC(v0);
}

uint64_t sub_238378878@<X0>(_BYTE *a1@<X8>)
{
  return sub_23837888C(a1);
}

uint64_t sub_23837888C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_238386598();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_238378904()
{
  return sub_238378928();
}

uint64_t sub_238378928()
{
  uint64_t v0;
  void (*v1)(_QWORD);
  unsigned __int8 v3;

  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_2383865A4();
  v1 = *(void (**)(_QWORD))(v0 + 32);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_238386598();
  swift_release();
  swift_release();
  v1(v3);
  return swift_release();
}

uint64_t sub_238378A00()
{
  return sub_2383867C0();
}

uint64_t sub_238378A14()
{
  return sub_238379874();
}

uint64_t sub_238378A28()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI20NudityDetectionEntry_defaultsKey);
  swift_bridgeObjectRetain();
  return v1;
}

unint64_t sub_238378A60()
{
  return 0xD00000000000001ALL;
}

uint64_t sub_238378A7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  swift_release();
  v1 = v0 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI20NudityDetectionEntry__enabled;
  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2568FCCC8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_238378AF4@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  v2 = (_QWORD *)(*v1 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI20NudityDetectionEntry_defaultsKey);
  v3 = v2[1];
  *a1 = *v2;
  a1[1] = v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_238378B10()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 256))();
}

uint64_t sub_238378B38@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for NudityDetectionEntry(0);
  result = sub_238386580();
  *a1 = result;
  return result;
}

uint64_t sub_238378B74()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  uint64_t v6;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FCED8);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = *(id *)(v0 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI28NudityDetectionSystemService_service);
  sub_23837784C((uint64_t)v3);

  sub_238381EB0();
  return sub_2383867C0();
}

uint64_t sub_238378C08()
{
  sub_238386A0C();
  sub_2383868D4();
  type metadata accessor for MOUserSafetyScannableServices(0);
  sub_238386A84();
  sub_2383868D4();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_238386598();
  swift_release();
  swift_release();
  sub_2383868D4();
  swift_bridgeObjectRelease();
  sub_2383868D4();
  return 0;
}

void sub_238378D70()
{
  uint64_t v0;

}

uint64_t sub_238378D80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  swift_release();
  v1 = v0 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI20NudityDetectionEntry__enabled;
  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2568FCCC8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

_QWORD *sub_238378E08(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  _QWORD *v4;
  _QWORD *v5;
  char *v9;
  _QWORD *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;

  v5 = v4;
  v9 = (char *)v4 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI18NudityDetectionApp__displayScale;
  *(_QWORD *)v9 = swift_getKeyPath();
  v9[8] = 0;
  v10 = (_QWORD *)((char *)v4 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI18NudityDetectionApp_iconBundleID);
  *v10 = 0;
  v10[1] = 0;
  swift_retain();
  v11 = objc_msgSend(a4, sel_bundleIdentifier);
  if (v11)
  {
    v12 = v11;
    v13 = sub_2383868A4();
    v15 = v14;

    *(_QWORD *)((char *)v4 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI18NudityDetectionApp_application) = a4;
    v16 = a4;
    swift_release();
    v4[2] = 0;
    v4[3] = 0xE000000000000000;
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v4[4] = a1;
    v4[5] = a2;
    swift_beginAccess();
    swift_retain();
    sub_23838658C();
    swift_endAccess();
    v17 = (_QWORD *)((char *)v4 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI20NudityDetectionEntry_defaultsKey);
    *v17 = v13;
    v17[1] = v15;
    swift_release();
    sub_238381F8C(0, &qword_2568FCF20);
    swift_bridgeObjectRetain();
    swift_retain();
    v18 = sub_2383791C4();
    v21 = v18;
    if (v18)
    {
      swift_bridgeObjectRelease();
      swift_retain();
      v22 = objc_msgSend(v21, sel_localizedName);
      v23 = sub_2383868A4();
      v25 = v24;

      v5[2] = v23;
      v5[3] = v25;
      swift_release();
      swift_bridgeObjectRelease();
      v26 = objc_msgSend(v21, sel_bundleIdentifier);
      if (v26)
      {
        v27 = v26;
        v28 = sub_2383868A4();
        v30 = v29;

        swift_release();
        swift_release();

      }
      else
      {

        swift_release();
        swift_release();

        v28 = 0;
        v30 = 0;
      }
      v36 = (_QWORD *)((char *)v5 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI18NudityDetectionApp_iconBundleID);
      *v36 = v28;
      v36[1] = v30;
    }
    else
    {
      v19 = objc_allocWithZone(MEMORY[0x24BDC1540]);
      swift_bridgeObjectRetain();
      v20 = sub_23837E6E4(v13, v15, 1);
      v31 = v20;
      if (v20)
      {
        swift_bridgeObjectRelease();
        swift_retain();
        v32 = objc_msgSend(v31, sel_localizedName);
        v33 = sub_2383868A4();
        v35 = v34;

        swift_release();
        swift_release();

        v5[2] = v33;
        v5[3] = v35;
        swift_release();
      }
      else
      {
        swift_release();

        swift_release();
        v5[2] = v13;
        v5[3] = v15;
      }
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_release();

    sub_238381EA4(*(_QWORD *)v9, v9[8]);
    swift_release();
    swift_bridgeObjectRelease();
    type metadata accessor for NudityDetectionApp(0);
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v5;
}

id sub_2383791C4()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  id v5[2];

  v5[1] = *(id *)MEMORY[0x24BDAC8D0];
  v0 = (void *)sub_238386880();
  swift_bridgeObjectRelease();
  v5[0] = 0;
  v1 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_bundleRecordWithApplicationIdentifier_error_, v0, v5);

  if (v1)
  {
    v2 = v5[0];
  }
  else
  {
    v3 = v5[0];
    sub_2383864D8();

    swift_willThrow();
  }
  return v1;
}

uint64_t sub_238379298()
{
  uint64_t v0;
  id v1;
  void *v2;
  id v3;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FCCA8);
  MEMORY[0x24BDAC7A8](v0);
  v1 = objc_allocWithZone(MEMORY[0x24BE51A90]);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_238386880();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_initWithBundleIdentifier_, v2);

  v3 = objc_msgSend((id)objc_opt_self(), sel_imageDescriptorNamed_, *MEMORY[0x24BE51AF0]);
  sub_238386550();
  sub_2383772F0((unint64_t *)&qword_2568FCED0, &qword_2568FCCA8, MEMORY[0x24BEC6520]);
  return sub_2383867C0();
}

unint64_t sub_2383793C8()
{
  sub_238386A0C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2383868D4();
  swift_bridgeObjectRelease();
  sub_2383868D4();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_238386598();
  swift_release();
  swift_release();
  sub_2383868D4();
  swift_bridgeObjectRelease();
  sub_2383868D4();
  return 0xD000000000000012;
}

uint64_t sub_238379524()
{
  uint64_t v0;

  sub_238381EA4(*(_QWORD *)(v0 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI18NudityDetectionApp__displayScale), *(_BYTE *)(v0 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI18NudityDetectionApp__displayScale + 8));

  return swift_bridgeObjectRelease();
}

uint64_t sub_23837956C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  swift_release();
  v1 = v0 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI20NudityDetectionEntry__enabled;
  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2568FCCC8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  sub_238381EA4(*(_QWORD *)(v0 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI18NudityDetectionApp__displayScale), *(_BYTE *)(v0 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI18NudityDetectionApp__displayScale + 8));

  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_238379620()
{
  uint64_t v0;
  uint64_t result;

  type metadata accessor for NudityDetectionRootModel(0);
  v0 = swift_allocObject();
  result = NudityDetectionRootModel.init()();
  qword_2542CB850 = v0;
  return result;
}

uint64_t NudityDetectionRootModel.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  NudityDetectionRootModel.init()();
  return v0;
}

uint64_t static NudityDetectionRootModel.shared.getter()
{
  if (qword_2542CB858 != -1)
    swift_once();
  swift_beginAccess();
  return swift_retain();
}

uint64_t static NudityDetectionRootModel.shared.setter(uint64_t a1)
{
  if (qword_2542CB858 != -1)
    swift_once();
  swift_beginAccess();
  qword_2542CB850 = a1;
  return swift_release();
}

uint64_t (*static NudityDetectionRootModel.shared.modify())()
{
  if (qword_2542CB858 != -1)
    swift_once();
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_2383797DC()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_238386598();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_23837984C()
{
  return sub_238379874();
}

uint64_t sub_238379860()
{
  return sub_238379874();
}

uint64_t sub_238379874()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_238386598();
  swift_release();
  swift_release();
  return v1;
}

void sub_2383798DC()
{
  void *v0;
  void *v1;
  void *v2;

  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_2383865A4();
  if (qword_2542CBC90 != -1)
    swift_once();
  v0 = (void *)qword_2542CC0A8;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_238386598();
  swift_release();
  swift_release();
  v1 = (void *)sub_238386934();
  v2 = (void *)sub_238386880();
  objc_msgSend(v0, sel_setValue_forKey_, v1, v2);

}

id sub_238379A08()
{
  id v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;

  v0 = objc_allocWithZone(MEMORY[0x24BE63F38]);
  v1 = (void *)sub_238386880();
  v2 = (void *)sub_238386880();
  v3 = objc_msgSend(v0, sel_initWithName_sharedContainer_, v1, v2);

  v4 = v3;
  v5 = objc_msgSend(v4, sel_userSafety);
  v6 = objc_msgSend(v5, sel_scanningPolicy);

  if (!v6 || (v7 = objc_msgSend(v6, sel_policy), v6, !v7))
    objc_msgSend(v4, sel_setActive_, 0);
  objc_msgSend(v4, sel_setSyncToWatch_, 1);

  return v4;
}

uint64_t NudityDetectionRootModel.init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
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
  uint64_t v14;
  void *v15;
  uint64_t inited;
  void *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  void (*v26)(char *, uint64_t);
  uint64_t v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  unsigned __int8 v32;
  void *v33;
  void *v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  _QWORD *v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  void (*v47)(char *, uint64_t);
  char *v48;
  _QWORD aBlock[6];
  unsigned __int8 v50;

  v1 = v0;
  v2 = sub_238386574();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v48 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v47 - v6;
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542CBC38);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = v1 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel__detectionEntries;
  aBlock[0] = MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542CBC58);
  sub_23838658C();
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v12, v11, v8);
  v13 = OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_effectiveStore;
  *(_QWORD *)(v1 + v13) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE63F28]), sel_init);
  v14 = OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_effectivePublisher;
  v15 = (void *)objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542CBD00);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_238387640;
  v17 = (void *)*MEMORY[0x24BE63ED8];
  *(_QWORD *)(inited + 32) = *MEMORY[0x24BE63ED8];
  v18 = v17;
  sub_238381134(inited);
  swift_setDeallocating();
  type metadata accessor for Name(0);
  swift_arrayDestroy();
  sub_238375D70(&qword_2542CBCA0, (uint64_t (*)(uint64_t))type metadata accessor for Name, (uint64_t)&unk_238387460);
  v19 = (void *)sub_238386940();
  swift_bridgeObjectRelease();
  v20 = objc_msgSend(v15, sel_publisherForGroups_, v19);

  *(_QWORD *)(v1 + v14) = v20;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_effectivePublisherSink) = 0;
  v21 = OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_localStore;
  *(_QWORD *)(v1 + v21) = sub_238379A08();
  v22 = OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_scanningPolicy;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_scanningPolicy) = 0;
  sub_238386568();
  v23 = sub_23838655C();
  v24 = sub_238386988();
  if (os_log_type_enabled(v23, v24))
  {
    v25 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v25 = 0;
    _os_log_impl(&dword_238373000, v23, v24, "init NudityDetectionModel", v25, 2u);
    MEMORY[0x23B832204](v25, -1, -1);
  }

  v26 = *(void (**)(char *, uint64_t))(v3 + 8);
  v26(v7, v2);
  v27 = OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_localStore;
  v28 = objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_localStore), sel_userSafety);
  v29 = objc_msgSend(v28, sel_scanningPolicy);

  v30 = *(void **)(v1 + v22);
  *(_QWORD *)(v1 + v22) = v29;

  v31 = *(void **)(v1 + v22);
  if (v31 && objc_msgSend(v31, sel_policy))
    v32 = objc_msgSend(*(id *)(v1 + v27), sel_active);
  else
    v32 = 0;
  swift_beginAccess();
  v50 = v32;
  sub_23838658C();
  swift_endAccess();
  if (qword_2542CBC90 != -1)
    swift_once();
  v33 = (void *)qword_2542CC0A8;
  v34 = (void *)sub_238386880();
  LOBYTE(v33) = objc_msgSend(v33, sel_BOOLForKey_, v34);

  swift_beginAccess();
  v50 = v33;
  sub_23838658C();
  swift_endAccess();
  sub_238386568();
  swift_retain_n();
  v35 = sub_23838655C();
  v36 = sub_238386988();
  if (os_log_type_enabled(v35, v36))
  {
    v37 = (uint8_t *)swift_slowAlloc();
    v38 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v37 = 138412290;
    v47 = v26;
    v39 = v2;
    v40 = *(void **)(v1 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_effectiveStore);
    aBlock[0] = v40;
    v41 = v40;
    sub_2383869AC();
    *v38 = v40;
    v2 = v39;
    v26 = v47;
    swift_release_n();
    _os_log_impl(&dword_238373000, v35, v36, "effective publisher: %@", v37, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542CBCF0);
    swift_arrayDestroy();
    MEMORY[0x23B832204](v38, -1, -1);
    MEMORY[0x23B832204](v37, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  v26(v48, v2);
  v42 = *(void **)(v1 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_effectivePublisher);
  aBlock[4] = sub_238381360;
  aBlock[5] = v1;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23837A884;
  aBlock[3] = &block_descriptor;
  v43 = _Block_copy(aBlock);
  swift_retain();
  v44 = v42;
  swift_release();
  v45 = objc_msgSend(v44, sel_sinkWithReceiveInput_, v43);
  _Block_release(v43);

  *(_QWORD *)(v1 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_effectivePublisherSink) = v45;
  swift_unknownObjectRelease();
  sub_23837A904();
  return v1;
}

void sub_23837A198(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t);
  id v22;
  char v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  _QWORD v31[2];
  uint64_t v32;
  char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;

  v4 = sub_238386574();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v31 - v9;
  v35 = "App & Service Access";
  sub_238386568();
  swift_bridgeObjectRetain_n();
  v11 = sub_23838655C();
  v12 = sub_238386988();
  if (os_log_type_enabled(v11, v12))
  {
    v32 = v5;
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v34 = v4;
    v15 = v14;
    v37 = v14;
    v33 = v8;
    *(_DWORD *)v13 = 136315138;
    v31[1] = v13 + 4;
    type metadata accessor for Name(0);
    sub_238375D70(&qword_2542CBCA0, (uint64_t (*)(uint64_t))type metadata accessor for Name, (uint64_t)&unk_238387460);
    v16 = a2;
    swift_bridgeObjectRetain();
    v17 = sub_238386958();
    v19 = v18;
    swift_bridgeObjectRelease();
    v36 = sub_2383842F4(v17, v19, &v37);
    v8 = v33;
    sub_2383869AC();
    swift_bridgeObjectRelease_n();
    a2 = v16;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_238373000, v11, v12, "effective store publisher updated: %s", v13, 0xCu);
    swift_arrayDestroy();
    v20 = v15;
    v4 = v34;
    MEMORY[0x23B832204](v20, -1, -1);
    MEMORY[0x23B832204](v13, -1, -1);

    v21 = *(void (**)(char *, uint64_t))(v32 + 8);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    v21 = *(void (**)(char *, uint64_t))(v5 + 8);
  }
  v21(v10, v4);
  v22 = (id)*MEMORY[0x24BE63ED8];
  v23 = sub_23837A564((uint64_t)v22, a1);

  if ((v23 & 1) != 0)
  {
    sub_238386568();
    v24 = sub_23838655C();
    v25 = sub_238386988();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_238373000, v24, v25, "updating our effective store", v26, 2u);
      MEMORY[0x23B832204](v26, -1, -1);
    }

    v21(v8, v4);
    v27 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE63F28]), sel_init);
    v28 = *(void **)(a2 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_effectiveStore);
    *(_QWORD *)(a2 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_effectiveStore) = v27;

    v29 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
    v30 = (void *)sub_238386880();
    objc_msgSend(v29, sel_postNotificationName_object_, v30, a2);

  }
}

uint64_t sub_23837A564(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v20;

  if (*(_QWORD *)(a2 + 16))
  {
    sub_2383868A4();
    sub_238386B44();
    sub_2383868C8();
    v3 = sub_238386B5C();
    swift_bridgeObjectRelease();
    v4 = -1 << *(_BYTE *)(a2 + 32);
    v5 = v3 & ~v4;
    v6 = a2 + 56;
    if (((*(_QWORD *)(a2 + 56 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
    {
      v7 = sub_2383868A4();
      v9 = v8;
      if (v7 == sub_2383868A4() && v9 == v10)
      {
LABEL_17:
        swift_bridgeObjectRelease_n();
        goto LABEL_18;
      }
      v12 = sub_238386B2C();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v12 & 1) != 0)
      {
LABEL_18:
        v20 = 1;
        return v20 & 1;
      }
      v13 = ~v4;
      v14 = (v5 + 1) & v13;
      if (((*(_QWORD *)(v6 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0)
      {
        while (1)
        {
          v15 = sub_2383868A4();
          v17 = v16;
          if (v15 == sub_2383868A4() && v17 == v18)
            break;
          v20 = sub_238386B2C();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v20 & 1) == 0)
          {
            v14 = (v14 + 1) & v13;
            if (((*(_QWORD *)(v6 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0)
              continue;
          }
          return v20 & 1;
        }
        goto LABEL_17;
      }
    }
  }
  v20 = 0;
  return v20 & 1;
}

uint64_t sub_23837A728(void *a1, uint64_t a2)
{
  id v3;
  char v4;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  char v11;
  char v12;
  uint64_t v13;
  unint64_t v14;
  id v15;

  if ((a2 & 0xC000000000000001) != 0)
  {
    v3 = a1;
    v4 = sub_2383869F4();

    return v4 & 1;
  }
  if (!*(_QWORD *)(a2 + 16)
    || (v6 = sub_238386994(),
        v7 = -1 << *(_BYTE *)(a2 + 32),
        v8 = v6 & ~v7,
        v9 = a2 + 56,
        ((*(_QWORD *)(a2 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0))
  {
LABEL_11:
    v12 = 0;
    return v12 & 1;
  }
  sub_238381F8C(0, (unint64_t *)&unk_2542CBC78);
  v10 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v8);
  v11 = sub_2383869A0();

  if ((v11 & 1) == 0)
  {
    v13 = ~v7;
    v14 = (v8 + 1) & v13;
    if (((*(_QWORD *)(v9 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0)
    {
      do
      {
        v15 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v14);
        v12 = sub_2383869A0();

        if ((v12 & 1) != 0)
          break;
        v14 = (v14 + 1) & v13;
      }
      while (((*(_QWORD *)(v9 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0);
      return v12 & 1;
    }
    goto LABEL_11;
  }
  v12 = 1;
  return v12 & 1;
}

uint64_t sub_23837A884(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  type metadata accessor for Name(0);
  sub_238375D70(&qword_2542CBCA0, (uint64_t (*)(uint64_t))type metadata accessor for Name, (uint64_t)&unk_238387460);
  v2 = sub_23838694C();
  swift_retain();
  v1(v2);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23837A904()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(char *, uint64_t);
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  _BOOL4 v13;
  uint8_t *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  void (*v19)(char *, uint64_t);
  uint64_t inited;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  NSObject *v32;
  os_log_type_t v33;
  _BOOL4 v34;
  uint8_t *v35;
  uint64_t v36;
  id v37;
  id v38;
  void *v39;
  uint64_t v40;
  unint64_t v41;
  char *v42;
  id v43;
  id v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  NSObject *v48;
  os_log_type_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  void *v62;
  unint64_t v63;
  uint64_t v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  uint64_t v71;
  _QWORD *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  id v76;
  id v77;
  id v78;
  id v79;
  const char *v80;
  char v81;
  unint64_t v82;
  uint64_t v83;
  _BOOL8 v84;
  uint64_t v85;
  char v86;
  unint64_t v87;
  char v88;
  unint64_t v89;
  char v90;
  char v91;
  const char *v92;
  char v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  BOOL v98;
  uint64_t v99;
  id v100;
  char *v101;
  uint64_t v102;
  id v103;
  void *v104;
  uint64_t v105;
  id v106;
  unint64_t v107;
  id v108;
  uint64_t v109;
  uint64_t v110;
  char isUniquelyReferenced_nonNull_native;
  char v112;
  uint64_t v113;
  _BOOL8 v114;
  uint64_t v115;
  char v116;
  unint64_t v117;
  char v118;
  uint64_t v119;
  id v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  unint64_t v124;
  unint64_t v125;
  void *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  id v130;
  unint64_t v131;
  char v132;
  char v133;
  char v134;
  void *v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  void *v139;
  void *v140;
  id v141;
  uint64_t v142;
  void (*v143)(char *, uint64_t);
  void *v144;
  id v145;
  id v146;
  uint64_t result;
  uint64_t v148;
  void (*v149)(char *, uint64_t);
  uint64_t v150;
  char *v151;
  unint64_t v152;
  char *v153;
  const char *v154;
  id v155;
  uint64_t v156[3];
  unint64_t v157;
  unint64_t v158;
  void *v159;
  _QWORD *v160;

  v1 = v0;
  v2 = sub_238386574();
  v3 = *(void (**)(char *, uint64_t))(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v148 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v153 = (char *)&v148 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v148 - v9;
  sub_238386568();
  swift_retain_n();
  v11 = sub_23838655C();
  v12 = sub_238386988();
  v13 = os_log_type_enabled(v11, v12);
  v150 = v1;
  v151 = v6;
  v154 = "App & Service Access";
  if (v13)
  {
    v149 = v3;
    v14 = (uint8_t *)swift_slowAlloc();
    v15 = swift_slowAlloc();
    *(_DWORD *)v14 = 136315138;
    v156[0] = v15;
    v155 = *(id *)(v1 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_scanningPolicy);
    v16 = v155;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542CBCC0);
    v17 = sub_2383868BC();
    v155 = (id)sub_2383842F4(v17, v18, v156);
    v1 = v150;
    sub_2383869AC();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_238373000, v11, v12, "reload entries from policy: %s", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B832204](v15, -1, -1);
    MEMORY[0x23B832204](v14, -1, -1);

    v19 = (void (*)(char *, uint64_t))*((_QWORD *)v149 + 1);
  }
  else
  {

    swift_release_n();
    v19 = (void (*)(char *, uint64_t))*((_QWORD *)v3 + 1);
  }
  v19(v10, v2);
  v160 = (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542CBD08);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_238387650;
  v21 = (void *)*MEMORY[0x24BE63EE8];
  *(_QWORD *)(inited + 32) = *MEMORY[0x24BE63EE8];
  v22 = (void *)*MEMORY[0x24BE63EF0];
  v23 = (void *)*MEMORY[0x24BE63EF8];
  *(_QWORD *)(inited + 40) = *MEMORY[0x24BE63EF0];
  *(_QWORD *)(inited + 48) = v23;
  v24 = (void *)*MEMORY[0x24BE63F08];
  *(_QWORD *)(inited + 56) = *MEMORY[0x24BE63F08];
  swift_retain();
  v25 = v21;
  v26 = v22;
  v27 = v23;
  v28 = v24;
  v29 = sub_2383817D0(inited, v1, &v160);
  swift_release();
  swift_setDeallocating();
  type metadata accessor for MOUserSafetyScannableServices(0);
  v148 = v30;
  swift_arrayDestroy();
  v159 = (void *)v29;
  v31 = v153;
  sub_238386568();
  swift_retain_n();
  v32 = sub_23838655C();
  v33 = sub_238386988();
  v34 = os_log_type_enabled(v32, v33);
  v152 = v2;
  v149 = v19;
  if (v34)
  {
    v35 = (uint8_t *)swift_slowAlloc();
    v36 = swift_slowAlloc();
    v156[0] = v36;
    *(_DWORD *)v35 = 136315138;
    v37 = objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_effectiveStore), sel_userSafety);
    v38 = objc_msgSend(v37, sel_allowedClients);

    if (v38)
    {
      sub_238381F8C(0, (unint64_t *)&unk_2542CBC78);
      sub_238381DB4();
      v39 = (void *)sub_23838694C();

    }
    else
    {
      v39 = 0;
    }
    v155 = v39;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542CBC68);
    v40 = sub_2383868BC();
    v155 = (id)sub_2383842F4(v40, v41, v156);
    sub_2383869AC();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_238373000, v32, v33, "reload apps from effective store: %s", v35, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B832204](v36, -1, -1);
    MEMORY[0x23B832204](v35, -1, -1);

    v2 = v152;
    v19 = v149;
    v149(v153, v152);
  }
  else
  {

    swift_release_n();
    v19(v31, v2);
  }
  v42 = v151;
  v158 = MEMORY[0x24BEE4AF8];
  v43 = objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_effectiveStore), sel_userSafety);
  v44 = objc_msgSend(v43, sel_allowedClients);

  if (v44)
  {
    sub_238381F8C(0, (unint64_t *)&unk_2542CBC78);
    sub_238381DB4();
    v45 = sub_23838694C();

  }
  else
  {
    v45 = MEMORY[0x24BEE4B08];
  }
  swift_retain();
  sub_2383818CC(v45, v1, &v158);
  v47 = v46;
  swift_bridgeObjectRelease();
  swift_release();
  v157 = v47;
  sub_23837C288(&v157);
  sub_238386568();
  v48 = sub_23838655C();
  v49 = sub_238386988();
  if (os_log_type_enabled(v48, v49))
  {
    v50 = swift_slowAlloc();
    v51 = swift_slowAlloc();
    v156[0] = v51;
    *(_DWORD *)v50 = 136315394;
    swift_beginAccess();
    v52 = type metadata accessor for NudityDetectionEntry(0);
    v53 = swift_bridgeObjectRetain();
    v54 = MEMORY[0x23B831BB0](v53, v52);
    v56 = v55;
    swift_bridgeObjectRelease();
    v155 = (id)sub_2383842F4(v54, v56, v156);
    sub_2383869AC();
    swift_bridgeObjectRelease();
    *(_WORD *)(v50 + 12) = 2080;
    swift_beginAccess();
    v57 = swift_bridgeObjectRetain();
    v58 = MEMORY[0x23B831BB0](v57, v52);
    v60 = v59;
    swift_bridgeObjectRelease();
    v155 = (id)sub_2383842F4(v58, v60, v156);
    sub_2383869AC();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_238373000, v48, v49, "loadedServices: %s,\napps: %s", (uint8_t *)v50, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B832204](v51, -1, -1);
    MEMORY[0x23B832204](v50, -1, -1);

    v149(v42, v152);
  }
  else
  {

    v19(v42, v2);
  }
  swift_beginAccess();
  swift_beginAccess();
  v61 = swift_bridgeObjectRetain();
  sub_23837C30C(v61);
  swift_endAccess();
  v62 = v159;
  swift_getKeyPath();
  swift_getKeyPath();
  v155 = v62;
  v63 = v150;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_2383865A4();
  if (v158 >> 62)
    goto LABEL_95;
  if (!*(_QWORD *)((v158 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_97:
    swift_bridgeObjectRelease();
LABEL_100:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
LABEL_18:
  v64 = OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_scanningPolicy;
  v65 = *(void **)(v63 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_scanningPolicy);
  if (v65 && (v66 = objc_msgSend(v65, sel_allServices)) != 0)
  {
    v67 = v66;
    sub_238381F8C(0, (unint64_t *)&unk_2568FCE90);
    sub_238375D70(&qword_2568FCB90, (uint64_t (*)(uint64_t))type metadata accessor for MOUserSafetyScannableServices, (uint64_t)&unk_2383873D8);
    v154 = (const char *)sub_23838682C();

  }
  else
  {
    v154 = (const char *)sub_23837C4C4(MEMORY[0x24BEE4AF8]);
  }
  v149 = (void (*)(char *, uint64_t))v64;
  v68 = *(void **)(v63 + v64);
  if (v68 && (v69 = objc_msgSend(v68, sel_allApplications)) != 0)
  {
    v70 = v69;
    sub_238381F8C(0, (unint64_t *)&unk_2542CBC78);
    sub_238381F8C(0, (unint64_t *)&unk_2568FCE90);
    sub_238381DB4();
    v71 = sub_23838682C();

  }
  else
  {
    v71 = sub_23837C5CC(MEMORY[0x24BEE4AF8]);
  }
  v72 = v160;
  v153 = (char *)v160[2];
  if (!v153)
  {
LABEL_47:
    v101 = (char *)v158;
    if (v158 >> 62)
    {
      swift_bridgeObjectRetain_n();
      v63 = sub_238386ACC();
      swift_bridgeObjectRelease();
      if (!v63)
      {
LABEL_99:
        swift_bridgeObjectRelease();
        v138 = (void *)objc_opt_self();
        sub_238381F8C(0, (unint64_t *)&unk_2568FCE90);
        sub_238375D70(&qword_2568FCB90, (uint64_t (*)(uint64_t))type metadata accessor for MOUserSafetyScannableServices, (uint64_t)&unk_2383873D8);
        v139 = (void *)sub_238386820();
        swift_bridgeObjectRelease();
        sub_238381F8C(0, (unint64_t *)&unk_2542CBC78);
        sub_238381DB4();
        v140 = (void *)sub_238386820();
        swift_bridgeObjectRelease();
        v141 = objc_msgSend(v138, sel_nudityDetectionPolicyWithAllServices_allApplications_, v139, v140);

        v142 = v150;
        v143 = v149;
        v144 = *(void **)((char *)v149 + v150);
        *(_QWORD *)((char *)v149 + v150) = v141;

        v145 = objc_msgSend(*(id *)(v142 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_localStore), sel_userSafety);
        v146 = *(id *)((char *)v143 + v142);
        objc_msgSend(v145, sel_setScanningPolicy_, v146);

        swift_bridgeObjectRelease();
        goto LABEL_100;
      }
    }
    else
    {
      v63 = *(_QWORD *)((v158 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (!v63)
        goto LABEL_99;
    }
    v153 = (char *)((unint64_t)v101 & 0xC000000000000001);
    v102 = 4;
    v151 = v101;
    v152 = v63;
    while (1)
    {
      if (v153)
        v103 = (id)MEMORY[0x23B831CDC](v102 - 4, v101);
      else
        v103 = *(id *)&v101[8 * v102];
      v104 = v103;
      v105 = v102 - 3;
      if (__OFADD__(v102 - 4, 1))
      {
        __break(1u);
LABEL_89:
        __break(1u);
LABEL_90:
        __break(1u);
LABEL_91:
        __break(1u);
LABEL_92:
        __break(1u);
LABEL_93:
        __break(1u);
LABEL_94:
        __break(1u);
LABEL_95:
        swift_bridgeObjectRetain();
        v136 = sub_238386ACC();
        swift_bridgeObjectRelease();
        if (!v136)
        {
          swift_bridgeObjectRetain();
          v137 = sub_238386ACC();
          swift_bridgeObjectRelease();
          if (!v137)
            goto LABEL_97;
        }
        goto LABEL_18;
      }
      v106 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, 1);
      v107 = v71 & 0xC000000000000001;
      if (v106)
      {
        v108 = v106;
        if (v107)
        {
          if (v71 < 0)
            v109 = v71;
          else
            v109 = v71 & 0xFFFFFFFFFFFFFF8;
          v110 = sub_238386A9C();
          if (__OFADD__(v110, 1))
            goto LABEL_91;
          v71 = sub_23837EBEC(v109, v110 + 1);
        }
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v155 = (id)v71;
        v63 = sub_23837E8C8((uint64_t)v104);
        v113 = *(_QWORD *)(v71 + 16);
        v114 = (v112 & 1) == 0;
        v115 = v113 + v114;
        if (__OFADD__(v113, v114))
          goto LABEL_90;
        v116 = v112;
        if (*(_QWORD *)(v71 + 24) >= v115)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            sub_23837FDF4();
        }
        else
        {
          sub_23837EE3C(v115, isUniquelyReferenced_nonNull_native);
          v117 = sub_23837E8C8((uint64_t)v104);
          if ((v116 & 1) != (v118 & 1))
            goto LABEL_102;
          v63 = v117;
        }
        v71 = (uint64_t)v155;
        if ((v116 & 1) != 0)
        {
          v127 = *((_QWORD *)v155 + 7);

          *(_QWORD *)(v127 + 8 * v63) = v108;
        }
        else
        {
          *((_QWORD *)v155 + (v63 >> 6) + 8) |= 1 << v63;
          *(_QWORD *)(*(_QWORD *)(v71 + 48) + 8 * v63) = v104;
          *(_QWORD *)(*(_QWORD *)(v71 + 56) + 8 * v63) = v108;
          v128 = *(_QWORD *)(v71 + 16);
          v98 = __OFADD__(v128, 1);
          v129 = v128 + 1;
          if (v98)
            goto LABEL_93;
          *(_QWORD *)(v71 + 16) = v129;
          v130 = v104;
        }

        swift_bridgeObjectRelease();
        v101 = v151;
      }
      else if (v107)
      {
        if (v71 < 0)
          v119 = v71;
        else
          v119 = v71 & 0xFFFFFFFFFFFFFF8;
        v120 = v104;
        swift_bridgeObjectRetain();
        v121 = sub_238386AA8();

        if (!v121)
        {

          swift_bridgeObjectRelease();
          goto LABEL_80;
        }
        swift_unknownObjectRelease();
        v122 = sub_238386A9C();
        v123 = sub_23837EBEC(v119, v122);
        swift_retain();
        v124 = sub_23837E8C8((uint64_t)v120);
        v63 = v125;
        swift_release();
        if ((v63 & 1) == 0)
          goto LABEL_94;

        v126 = *(void **)(*(_QWORD *)(v123 + 56) + 8 * v124);
        sub_23837F438(v124, v123);

        swift_bridgeObjectRelease();
        v71 = v123;
      }
      else
      {
        swift_bridgeObjectRetain();
        v131 = sub_23837E8C8((uint64_t)v104);
        v133 = v132;
        swift_bridgeObjectRelease();
        if ((v133 & 1) != 0)
        {
          v134 = swift_isUniquelyReferenced_nonNull_native();
          v155 = (id)v71;
          if ((v134 & 1) == 0)
          {
            sub_23837FDF4();
            v71 = (uint64_t)v155;
          }

          v135 = *(void **)(*(_QWORD *)(v71 + 56) + 8 * v131);
          sub_23837F438(v131, v71);

          swift_bridgeObjectRelease();
        }
        else
        {

        }
      }
      v63 = v152;
LABEL_80:
      ++v102;
      if (v105 == v63)
        goto LABEL_99;
    }
  }
  swift_bridgeObjectRetain();
  v73 = 0;
  while (1)
  {
    v75 = (void *)v72[v73 + 4];
    v76 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
    v77 = v75;
    v78 = objc_msgSend(v76, sel_initWithBool_, 1);
    if (v78)
      break;
    swift_bridgeObjectRetain();
    v89 = sub_23837E8F8((uint64_t)v77);
    v91 = v90;
    swift_bridgeObjectRelease();
    if ((v91 & 1) == 0)
    {

      goto LABEL_30;
    }
    v92 = v154;
    v93 = swift_isUniquelyReferenced_nonNull_native();
    v155 = (id)v92;
    if ((v93 & 1) == 0)
    {
      sub_23837FF98();
      v154 = (const char *)v155;
    }
    v94 = (uint64_t)v154;

    v95 = *(void **)(*(_QWORD *)(v94 + 56) + 8 * v89);
    sub_23837F5E8(v89, v94);

LABEL_29:
    swift_bridgeObjectRelease();
LABEL_30:
    if (v153 == (char *)++v73)
    {
      swift_bridgeObjectRelease();
      goto LABEL_47;
    }
  }
  v79 = v78;
  v80 = v154;
  v63 = swift_isUniquelyReferenced_nonNull_native();
  v155 = (id)v80;
  v82 = sub_23837E8F8((uint64_t)v77);
  v83 = *((_QWORD *)v80 + 2);
  v84 = (v81 & 1) == 0;
  v85 = v83 + v84;
  if (__OFADD__(v83, v84))
    goto LABEL_89;
  v86 = v81;
  if (*((_QWORD *)v154 + 3) >= v85)
  {
    if ((v63 & 1) == 0)
      sub_23837FF98();
LABEL_42:
    v154 = (const char *)v155;
    if ((v86 & 1) != 0)
    {
      v74 = *((_QWORD *)v154 + 7);

      *(_QWORD *)(v74 + 8 * v82) = v79;
    }
    else
    {
      v96 = v154;
      *(_QWORD *)&v154[8 * (v82 >> 6) + 64] |= 1 << v82;
      *(_QWORD *)(*((_QWORD *)v96 + 6) + 8 * v82) = v77;
      *(_QWORD *)(*((_QWORD *)v96 + 7) + 8 * v82) = v79;
      v97 = *((_QWORD *)v96 + 2);
      v98 = __OFADD__(v97, 1);
      v99 = v97 + 1;
      if (v98)
        goto LABEL_92;
      *((_QWORD *)v154 + 2) = v99;
      v100 = v77;
    }
    goto LABEL_29;
  }
  sub_23837F10C(v85, v63);
  v87 = sub_23837E8F8((uint64_t)v77);
  if ((v86 & 1) == (v88 & 1))
  {
    v82 = v87;
    goto LABEL_42;
  }
  sub_238386B38();
  __break(1u);
LABEL_102:
  sub_238381F8C(0, (unint64_t *)&unk_2542CBC78);
  result = sub_238386B38();
  __break(1u);
  return result;
}

uint64_t sub_23837BACC@<X0>(void **a1@<X0>, uint64_t a2@<X1>, _QWORD **a3@<X2>, _QWORD *a4@<X8>)
{
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  char v13;
  char v14;
  _QWORD *v15;
  id v16;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  id v26;
  unint64_t v27;
  char v28;
  id v29;
  id v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t *v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t result;

  v6 = *a1;
  v7 = OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_scanningPolicy;
  v8 = *(void **)(a2 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_scanningPolicy);
  if (v8)
  {
    v9 = objc_msgSend(v8, sel_allServices);
    if (v9)
    {
      v10 = v9;
      type metadata accessor for MOUserSafetyScannableServices(0);
      sub_238381F8C(0, (unint64_t *)&unk_2568FCE90);
      sub_238375D70(&qword_2568FCB90, (uint64_t (*)(uint64_t))type metadata accessor for MOUserSafetyScannableServices, (uint64_t)&unk_2383873D8);
      v11 = sub_23838682C();

      if (*(_QWORD *)(v11 + 16))
      {
        v12 = v6;
        sub_23837E8F8((uint64_t)v12);
        v14 = v13;

        if ((v14 & 1) != 0)
        {
          swift_bridgeObjectRelease();
          goto LABEL_12;
        }
      }
      swift_bridgeObjectRelease();
    }
  }
  v15 = *a3;
  v16 = v6;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a3 = v15;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v15 = sub_23837E7BC(0, v15[2] + 1, 1, v15);
    *a3 = v15;
  }
  v19 = v15[2];
  v18 = v15[3];
  if (v19 >= v18 >> 1)
    v15 = sub_23837E7BC((_QWORD *)(v18 > 1), v19 + 1, 1, v15);
  v15[2] = v19 + 1;
  v15[v19 + 4] = v16;
  *a3 = v15;
LABEL_12:
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = a2;
  *(_QWORD *)(v20 + 24) = v6;
  v21 = *(void **)(a2 + v7);
  if (!v21)
  {
    v30 = v6;
    swift_retain();
    goto LABEL_21;
  }
  v22 = v6;
  swift_retain();
  v23 = objc_msgSend(v21, sel_allServices);
  if (v23)
  {
    v24 = v23;
    type metadata accessor for MOUserSafetyScannableServices(0);
    sub_238381F8C(0, (unint64_t *)&unk_2568FCE90);
    sub_238375D70(&qword_2568FCB90, (uint64_t (*)(uint64_t))type metadata accessor for MOUserSafetyScannableServices, (uint64_t)&unk_2383873D8);
    v25 = sub_23838682C();

    if (*(_QWORD *)(v25 + 16))
    {
      v26 = v22;
      v27 = sub_23837E8F8((uint64_t)v26);
      if ((v28 & 1) != 0)
      {
        v29 = *(id *)(*(_QWORD *)(v25 + 56) + 8 * v27);

        swift_bridgeObjectRelease();
        objc_msgSend(v29, sel_BOOLValue);

        goto LABEL_21;
      }

    }
    swift_bridgeObjectRelease();
  }
LABEL_21:
  type metadata accessor for NudityDetectionSystemService(0);
  v31 = (_QWORD *)swift_allocObject();
  *(_QWORD *)((char *)v31 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI28NudityDetectionSystemService_service) = v6;
  v32 = sub_2383868A4();
  v34 = v33;
  v31[2] = 0;
  v31[3] = 0xE000000000000000;
  v35 = v6;
  swift_retain();
  swift_bridgeObjectRelease();
  v31[4] = sub_23838206C;
  v31[5] = v20;
  swift_beginAccess();
  swift_retain();
  sub_23838658C();
  swift_endAccess();
  v36 = (_QWORD *)((char *)v31 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI20NudityDetectionEntry_defaultsKey);
  *v36 = v32;
  v36[1] = v34;
  swift_release();
  swift_retain();
  v37 = sub_238377374();
  v39 = v38;
  swift_release();
  v31[2] = v37;
  v31[3] = v39;
  swift_release();
  result = swift_bridgeObjectRelease();
  *a4 = v31;
  return result;
}

void *sub_23837BE9C(void *a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  char v7;
  id v8;
  void *v10;

  if ((a2 & 0xC000000000000001) == 0)
  {
    if (*(_QWORD *)(a2 + 16))
    {
      v6 = sub_23837E8C8((uint64_t)a1);
      if ((v7 & 1) != 0)
      {
        v5 = *(void **)(*(_QWORD *)(a2 + 56) + 8 * v6);
        v8 = v5;
        return v5;
      }
    }
    return 0;
  }
  v3 = a1;
  v4 = sub_238386AA8();

  if (!v4)
    return 0;
  sub_238381F8C(0, (unint64_t *)&unk_2568FCE90);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  v5 = v10;
  swift_unknownObjectRelease();
  return v5;
}

id sub_23837BF70@<X0>(id *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, _QWORD *a4@<X8>)
{
  void *v4;
  id v8;
  id result;
  void *v10;
  uint64_t v11;
  void *v12;
  __objc2_ivar *v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  id v29;

  v8 = *a1;
  result = objc_msgSend(*a1, sel_bundleIdentifier);
  if (result)
  {
    v10 = result;
    sub_2383868A4();

    sub_238381F8C(0, &qword_2568FCF20);
    result = sub_2383791C4();
    if (v4)
    {

      result = 0;
      goto LABEL_19;
    }
    if (!result)
      goto LABEL_19;

    v11 = OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_scanningPolicy;
    v12 = *(void **)(a2 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_scanningPolicy);
    v13 = &stru_250A0A000;
    if (!v12)
      goto LABEL_9;
    v14 = objc_msgSend(v12, sel_allApplications);
    if (!v14)
      goto LABEL_9;
    v15 = v14;
    sub_238381F8C(0, (unint64_t *)&unk_2542CBC78);
    sub_238381F8C(0, (unint64_t *)&unk_2568FCE90);
    sub_238381DB4();
    v16 = sub_23838682C();

    v17 = v8;
    v18 = sub_23837BE9C(v17, v16);

    v13 = &stru_250A0A000;
    swift_bridgeObjectRelease();
    if (v18)
    {

    }
    else
    {
LABEL_9:
      v19 = v8;
      MEMORY[0x23B831BA4]();
      if (*(_QWORD *)((*a3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*a3 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      {
        sub_238386910();
        v13 = &stru_250A0A000;
      }
      sub_238386928();
      sub_238386904();
    }
    v20 = swift_allocObject();
    *(_QWORD *)(v20 + 16) = a2;
    *(_QWORD *)(v20 + 24) = v8;
    v21 = *(void **)(a2 + v11);
    if (v21)
    {
      v22 = v8;
      swift_retain();
      v23 = objc_msgSend(v21, v13[10].type);
      if (v23)
      {
        v24 = v23;
        sub_238381F8C(0, (unint64_t *)&unk_2542CBC78);
        sub_238381F8C(0, (unint64_t *)&unk_2568FCE90);
        sub_238381DB4();
        v25 = sub_23838682C();

        v26 = v22;
        v27 = sub_23837BE9C(v26, v25);

        swift_bridgeObjectRelease();
        if (v27)
        {
          v28 = (uint64_t)objc_msgSend(v27, sel_BOOLValue);

LABEL_18:
          type metadata accessor for NudityDetectionApp(0);
          swift_allocObject();
          result = sub_238378E08((uint64_t)sub_238381FC8, v20, v28, v8);
          goto LABEL_19;
        }
      }
    }
    else
    {
      v29 = v8;
      swift_retain();
    }
    v28 = 1;
    goto LABEL_18;
  }
LABEL_19:
  *a4 = result;
  return result;
}

uint64_t sub_23837C288(unint64_t *a1)
{
  unint64_t v2;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v4;
  uint64_t v6[2];

  v2 = *a1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *a1 = v2;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v2 & 0x8000000000000000) != 0
    || (v2 & 0x4000000000000000) != 0)
  {
    sub_2383810CC(v2);
  }
  v4 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v6[0] = (v2 & 0xFFFFFFFFFFFFFF8) + 32;
  v6[1] = v4;
  sub_23838013C(v6);
  return sub_238386904();
}

uint64_t sub_23837C30C(unint64_t a1)
{
  unint64_t *v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_238386ACC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_238386ACC();
    swift_bridgeObjectRelease();
    v6 = v5 + v3;
    if (!__OFADD__(v5, v3))
      goto LABEL_5;
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
    goto LABEL_23;
LABEL_5:
  v4 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v4;
  v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v5 = 1;
  }
  if (v4 >> 62)
    goto LABEL_25;
  v9 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6)
      v9 = v6;
    swift_bridgeObjectRetain();
    v4 = MEMORY[0x23B831CE8](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_238380EC0(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_238386ACC();
    swift_bridgeObjectRelease();
  }
  if (v11 < 1)
    goto LABEL_19;
  v12 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v13 = __OFADD__(v12, v11);
  v14 = v12 + v11;
  if (!v13)
  {
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
LABEL_19:
    swift_bridgeObjectRelease();
    return sub_238386904();
  }
  __break(1u);
  return result;
}

unint64_t sub_23837C4C4(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void **v4;
  void *v5;
  id v6;
  id v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FCEA8);
  v2 = (_QWORD *)sub_238386AFC();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (void **)(a1 + 40);
  while (1)
  {
    v5 = *v4;
    v6 = *(v4 - 1);
    v7 = v5;
    result = sub_23837E8F8((uint64_t)v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = 8 * result;
    *(_QWORD *)(v2[6] + v10) = v6;
    *(_QWORD *)(v2[7] + v10) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v2[2] = v13;
    v4 += 2;
    if (!--v3)
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

unint64_t sub_23837C5CC(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void **v4;
  void *v5;
  id v6;
  id v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FCEA0);
  v2 = (_QWORD *)sub_238386AFC();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (void **)(a1 + 40);
  while (1)
  {
    v5 = *v4;
    v6 = *(v4 - 1);
    v7 = v5;
    result = sub_23837E8C8((uint64_t)v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = 8 * result;
    *(_QWORD *)(v2[6] + v10) = v6;
    *(_QWORD *)(v2[7] + v10) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v2[2] = v13;
    v4 += 2;
    if (!--v3)
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

unint64_t sub_23837C6D4(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void **v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2568FCEC0);
  v2 = (_QWORD *)sub_238386AFC();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (void **)(a1 + 48);
  while (1)
  {
    v5 = (uint64_t)*(v4 - 2);
    v6 = (uint64_t)*(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    v8 = v7;
    result = sub_23837E978(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v8;
    v12 = v2[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v2[2] = v14;
    v4 += 3;
    if (!--v3)
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

void sub_23837C7EC(int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  NSObject *v8;
  os_log_type_t v9;
  _BOOL4 v10;
  char v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t KeyPath;
  void *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  void (*v26)(_QWORD);
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  _BOOL8 v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  unint64_t v41;
  char v42;
  char v43;
  char isUniquelyReferenced_nonNull_native;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  BOOL v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  unint64_t v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  _BOOL8 v64;
  uint64_t v65;
  unint64_t v66;
  char v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char v73;
  char v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  id v78;
  unint64_t v79;
  char v80;
  char v81;
  char v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  uint64_t v88;
  void *v89;
  id v90;
  id v91;
  char v92;
  void *v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  int v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  uint64_t v103;
  uint64_t aBlock[6];

  v2 = v1;
  v4 = sub_238386574();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v96 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_238386568();
  v8 = sub_23838655C();
  v9 = sub_238386988();
  v10 = os_log_type_enabled(v8, v9);
  v98 = a1;
  v99 = v2;
  if (v10)
  {
    v11 = a1;
    v12 = (uint8_t *)swift_slowAlloc();
    v13 = swift_slowAlloc();
    *(_DWORD *)v12 = 136315138;
    aBlock[0] = v13;
    if ((v11 & 1) != 0)
      v14 = 0x64656C62616E65;
    else
      v14 = 0x64656C6261736964;
    if ((v11 & 1) != 0)
      v15 = 0xE700000000000000;
    else
      v15 = 0xE800000000000000;
    v103 = sub_2383842F4(v14, v15, aBlock);
    sub_2383869AC();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_238373000, v8, v9, "toggle all %s", v12, 0xCu);
    swift_arrayDestroy();
    v16 = v13;
    v2 = v99;
    MEMORY[0x23B832204](v16, -1, -1);
    MEMORY[0x23B832204](v12, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  KeyPath = OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_scanningPolicy;
  v18 = *(void **)(v2 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_scanningPolicy);
  v19 = (_QWORD *)&unk_2542CC000;
  if (v18 && objc_msgSend(v18, sel_policy))
    goto LABEL_79;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_238386598();
  swift_release();
  swift_release();
  v20 = aBlock[0];
  if ((unint64_t)aBlock[0] >> 62)
    goto LABEL_77;
  v21 = *(_QWORD *)((aBlock[0] & 0xFFFFFFFFFFFFF8) + 0x10);
  v97 = KeyPath;
  if (!v21)
  {
LABEL_78:
    swift_bridgeObjectRelease();
    v84 = (void *)objc_opt_self();
    type metadata accessor for MOUserSafetyScannableServices(0);
    sub_238381F8C(0, (unint64_t *)&unk_2568FCE90);
    sub_238375D70(&qword_2568FCB90, (uint64_t (*)(uint64_t))type metadata accessor for MOUserSafetyScannableServices, (uint64_t)&unk_2383873D8);
    v85 = (void *)sub_238386820();
    swift_bridgeObjectRelease();
    sub_238381F8C(0, (unint64_t *)&unk_2542CBC78);
    sub_238381DB4();
    v86 = (void *)sub_238386820();
    swift_bridgeObjectRelease();
    v87 = objc_msgSend(v84, sel_nudityDetectionPolicyWithAllServices_allApplications_, v85, v86);

    v2 = v99;
    v88 = v97;
    v89 = *(void **)(v99 + v97);
    *(_QWORD *)(v99 + v97) = v87;

    v19 = &unk_2542CC000;
    v90 = objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_localStore), sel_userSafety);
    v91 = *(id *)(v2 + v88);
    objc_msgSend(v90, sel_setScanningPolicy_, v91);

LABEL_79:
    v92 = v98 & 1;
    objc_msgSend(*(id *)(v2 + v19[15]), sel_setActive_, v98 & 1);
    v93 = (void *)sub_238386880();
    v94 = swift_allocObject();
    *(_BYTE *)(v94 + 16) = v92;
    aBlock[4] = (uint64_t)sub_238381E1C;
    aBlock[5] = v94;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_23837D37C;
    aBlock[3] = (uint64_t)&block_descriptor_3;
    v95 = _Block_copy(aBlock);
    swift_release();
    AnalyticsSendEventLazy();
    _Block_release(v95);

    return;
  }
  while (v21 >= 1)
  {
    v22 = 0;
    v102 = v20 & 0xC000000000000001;
    v23 = MEMORY[0x24BEE4B00];
    v24 = (_QWORD *)MEMORY[0x24BEE4B00];
    v100 = v20;
    v101 = v21;
    while (1)
    {
      if (v102)
      {
        v27 = MEMORY[0x23B831CDC](v22, v20);
      }
      else
      {
        v27 = *(_QWORD *)(v20 + 8 * v22 + 32);
        swift_retain();
      }
      type metadata accessor for NudityDetectionSystemService(0);
      v28 = swift_dynamicCastClass();
      if (!v28)
        goto LABEL_40;
      v29 = *(void **)(v28 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI28NudityDetectionSystemService_service);
      v30 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
      swift_retain();
      v31 = v29;
      v32 = objc_msgSend(v30, sel_initWithBool_, 1);
      if (v32)
        break;
      swift_bridgeObjectRetain();
      v41 = sub_23837E8F8((uint64_t)v31);
      v43 = v42;
      swift_bridgeObjectRelease();
      if ((v43 & 1) != 0)
      {
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        aBlock[0] = (uint64_t)v24;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_23837FF98();
          v24 = (_QWORD *)aBlock[0];
        }

        v45 = *(void **)(v24[7] + 8 * v41);
        sub_23837F5E8(v41, (uint64_t)v24);
        swift_release();

        swift_bridgeObjectRelease();
      }
      else
      {
        swift_release();

      }
LABEL_40:
      type metadata accessor for NudityDetectionApp(0);
      v52 = swift_dynamicCastClass();
      if (v52)
      {
        v53 = *(void **)(v52 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI18NudityDetectionApp_application);
        v54 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
        swift_retain();
        v55 = v53;
        v56 = objc_msgSend(v54, sel_initWithBool_, 1);
        v57 = v23 & 0xC000000000000001;
        if (v56)
        {
          v58 = v56;
          if (v57)
          {
            if (v23 < 0)
              v59 = v23;
            else
              v59 = v23 & 0xFFFFFFFFFFFFFF8;
            v60 = sub_238386A9C();
            if (__OFADD__(v60, 1))
              goto LABEL_73;
            v23 = sub_23837EBEC(v59, v60 + 1);
          }
          KeyPath = swift_isUniquelyReferenced_nonNull_native();
          aBlock[0] = v23;
          v62 = sub_23837E8C8((uint64_t)v55);
          v63 = *(_QWORD *)(v23 + 16);
          v64 = (v61 & 1) == 0;
          v65 = v63 + v64;
          if (__OFADD__(v63, v64))
            goto LABEL_72;
          v20 = v61;
          if (*(_QWORD *)(v23 + 24) >= v65)
          {
            if ((KeyPath & 1) == 0)
              sub_23837FDF4();
          }
          else
          {
            sub_23837EE3C(v65, KeyPath);
            v66 = sub_23837E8C8((uint64_t)v55);
            if ((v20 & 1) != (v67 & 1))
              goto LABEL_82;
            v62 = v66;
          }
          v23 = aBlock[0];
          if ((v20 & 1) != 0)
          {
            v25 = *(_QWORD *)(aBlock[0] + 56);

            *(_QWORD *)(v25 + 8 * v62) = v58;
          }
          else
          {
            *(_QWORD *)(aBlock[0] + 8 * (v62 >> 6) + 64) |= 1 << v62;
            *(_QWORD *)(*(_QWORD *)(v23 + 48) + 8 * v62) = v55;
            *(_QWORD *)(*(_QWORD *)(v23 + 56) + 8 * v62) = v58;
            v76 = *(_QWORD *)(v23 + 16);
            v49 = __OFADD__(v76, 1);
            v77 = v76 + 1;
            if (v49)
              goto LABEL_75;
            *(_QWORD *)(v23 + 16) = v77;
            v78 = v55;
          }
          swift_release();

          swift_bridgeObjectRelease();
          v20 = v100;
        }
        else
        {
          if (!v57)
          {
            swift_bridgeObjectRetain();
            v79 = sub_23837E8C8((uint64_t)v55);
            v81 = v80;
            swift_bridgeObjectRelease();
            if ((v81 & 1) == 0)
            {
              swift_release();

              goto LABEL_17;
            }
            v82 = swift_isUniquelyReferenced_nonNull_native();
            aBlock[0] = v23;
            if ((v82 & 1) == 0)
            {
              sub_23837FDF4();
              v23 = aBlock[0];
            }

            v83 = *(void **)(*(_QWORD *)(v23 + 56) + 8 * v79);
            sub_23837F438(v79, v23);
            swift_release();

            goto LABEL_69;
          }
          if (v23 < 0)
            v68 = v23;
          else
            v68 = v23 & 0xFFFFFFFFFFFFFF8;
          v69 = v55;
          swift_bridgeObjectRetain();
          v70 = sub_238386AA8();

          if (!v70)
          {
            swift_release();

LABEL_69:
            swift_bridgeObjectRelease();
            goto LABEL_17;
          }
          swift_unknownObjectRelease();
          v71 = sub_238386A9C();
          v72 = sub_23837EBEC(v68, v71);
          swift_retain();
          KeyPath = sub_23837E8C8((uint64_t)v69);
          v74 = v73;
          swift_release();
          if ((v74 & 1) == 0)
            goto LABEL_76;

          v75 = *(void **)(*(_QWORD *)(v72 + 56) + 8 * KeyPath);
          sub_23837F438(KeyPath, v72);
          swift_release();

          swift_bridgeObjectRelease();
          v23 = v72;
        }
      }
LABEL_17:
      ++v22;
      swift_getKeyPath();
      swift_getKeyPath();
      LOBYTE(aBlock[0]) = 1;
      swift_retain();
      sub_2383865A4();
      v26 = *(void (**)(_QWORD))(v27 + 32);
      swift_getKeyPath();
      KeyPath = swift_getKeyPath();
      swift_retain();
      sub_238386598();
      swift_release();
      swift_release();
      v26(LOBYTE(aBlock[0]));
      swift_release();
      swift_release();
      if (v101 == v22)
        goto LABEL_78;
    }
    v33 = v32;
    KeyPath = swift_isUniquelyReferenced_nonNull_native();
    aBlock[0] = (uint64_t)v24;
    v35 = sub_23837E8F8((uint64_t)v31);
    v36 = v24[2];
    v37 = (v34 & 1) == 0;
    v38 = v36 + v37;
    if (!__OFADD__(v36, v37))
    {
      v20 = v34;
      if (v24[3] >= v38)
      {
        if ((KeyPath & 1) != 0)
        {
          v24 = (_QWORD *)aBlock[0];
          if ((v34 & 1) == 0)
            goto LABEL_37;
        }
        else
        {
          sub_23837FF98();
          v24 = (_QWORD *)aBlock[0];
          if ((v20 & 1) == 0)
            goto LABEL_37;
        }
      }
      else
      {
        sub_23837F10C(v38, KeyPath);
        v39 = sub_23837E8F8((uint64_t)v31);
        if ((v20 & 1) != (v40 & 1))
          goto LABEL_81;
        v35 = v39;
        v24 = (_QWORD *)aBlock[0];
        if ((v20 & 1) == 0)
        {
LABEL_37:
          v24[(v35 >> 6) + 8] |= 1 << v35;
          v47 = 8 * v35;
          *(_QWORD *)(v24[6] + v47) = v31;
          *(_QWORD *)(v24[7] + v47) = v33;
          v48 = v24[2];
          v49 = __OFADD__(v48, 1);
          v50 = v48 + 1;
          if (v49)
            goto LABEL_74;
          v24[2] = v50;
          v51 = v31;
          goto LABEL_39;
        }
      }
      v46 = v24[7];
      KeyPath = 8 * v35;

      *(_QWORD *)(v46 + 8 * v35) = v33;
LABEL_39:
      swift_release();

      swift_bridgeObjectRelease();
      v20 = v100;
      goto LABEL_40;
    }
    __break(1u);
LABEL_72:
    __break(1u);
LABEL_73:
    __break(1u);
LABEL_74:
    __break(1u);
LABEL_75:
    __break(1u);
LABEL_76:
    __break(1u);
LABEL_77:
    swift_bridgeObjectRetain();
    v21 = sub_238386ACC();
    swift_bridgeObjectRelease();
    v97 = KeyPath;
    if (!v21)
      goto LABEL_78;
  }
  __break(1u);
LABEL_81:
  type metadata accessor for MOUserSafetyScannableServices(0);
  sub_238386B38();
  __break(1u);
LABEL_82:
  sub_238381F8C(0, (unint64_t *)&unk_2542CBC78);
  sub_238386B38();
  __break(1u);
}

unint64_t sub_23837D2F4(char a1)
{
  uint64_t inited;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FCEB8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_238387640;
  *(_QWORD *)(inited + 32) = 0x64656C62616E65;
  *(_QWORD *)(inited + 40) = 0xE700000000000000;
  *(_QWORD *)(inited + 48) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, a1 & 1);
  return sub_23837C6D4(inited);
}

id sub_23837D37C(uint64_t a1)
{
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_238381F8C(0, &qword_2568FCEB0);
    v4 = (void *)sub_238386820();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

void sub_23837D400(void *a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  char isUniquelyReferenced_nonNull_native;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  void *v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v3 = v2;
  v6 = sub_238386574();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_238386568();
  v10 = a1;
  v11 = sub_23838655C();
  v12 = sub_238386988();
  v13 = os_log_type_enabled(v11, v12);
  v46 = a2;
  if (v13)
  {
    v14 = swift_slowAlloc();
    v45 = v7;
    v15 = v14;
    v16 = swift_slowAlloc();
    v49 = v16;
    *(_DWORD *)v15 = 136315394;
    v17 = sub_2383868A4();
    v44 = v6;
    v19 = sub_2383842F4(v17, v18, &v49);
    v47 = v3;
    v48 = v19;
    sub_2383869AC();

    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2080;
    if ((a2 & 1) != 0)
      v20 = 0x64656C62616E65;
    else
      v20 = 0x64656C6261736964;
    if ((a2 & 1) != 0)
      v21 = 0xE700000000000000;
    else
      v21 = 0xE800000000000000;
    v48 = sub_2383842F4(v20, v21, &v49);
    v3 = v47;
    sub_2383869AC();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_238373000, v11, v12, "toggle service %s: %s", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B832204](v16, -1, -1);
    MEMORY[0x23B832204](v15, -1, -1);

    (*(void (**)(char *, uint64_t))(v45 + 8))(v9, v44);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  v22 = OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_scanningPolicy;
  v23 = *(void **)(v3 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_scanningPolicy);
  if (v23)
  {
    v24 = v23;
    if (objc_msgSend(v24, sel_policy) == (id)1)
    {
      v25 = objc_msgSend(v24, sel_allServices);
      if (v25)
      {
        v26 = v25;
        v47 = v3;
        type metadata accessor for MOUserSafetyScannableServices(0);
        sub_238381F8C(0, (unint64_t *)&unk_2568FCE90);
        sub_238375D70(&qword_2568FCB90, (uint64_t (*)(uint64_t))type metadata accessor for MOUserSafetyScannableServices, (uint64_t)&unk_2383873D8);
        v27 = sub_23838682C();

        v49 = v27;
        v28 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
        v29 = v10;
        v30 = objc_msgSend(v28, sel_initWithBool_, v46 & 1);
        if (v30)
        {
          v31 = (uint64_t)v30;
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v48 = v27;
          sub_23837F938(v31, v29, isUniquelyReferenced_nonNull_native);
          v49 = v48;

          swift_bridgeObjectRelease();
        }
        else
        {
          v33 = (void *)sub_23837EB28((uint64_t)v29);

        }
        v34 = (void *)sub_238386820();
        swift_bridgeObjectRelease();
        v35 = objc_msgSend(v24, sel_allApplications);
        if (v35)
        {
          v36 = v35;
          sub_238381F8C(0, (unint64_t *)&unk_2542CBC78);
          sub_238381DB4();
          sub_23838682C();

        }
        else
        {
          sub_23837C5CC(MEMORY[0x24BEE4AF8]);
        }
        v37 = (void *)objc_opt_self();
        sub_238381F8C(0, (unint64_t *)&unk_2542CBC78);
        sub_238381DB4();
        v38 = (void *)sub_238386820();
        swift_bridgeObjectRelease();
        v39 = objc_msgSend(v37, sel_nudityDetectionPolicyWithAllServices_allApplications_, v34, v38);

        v40 = v47;
        v41 = *(void **)(v47 + v22);
        *(_QWORD *)(v47 + v22) = v39;

        v42 = objc_msgSend(*(id *)(v40 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_localStore), sel_userSafety);
        v43 = *(id *)(v40 + v22);
        objc_msgSend(v42, sel_setScanningPolicy_, v43);

      }
    }

  }
}

void sub_23837D910(void *a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  id v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  os_log_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  char isUniquelyReferenced_nonNull_native;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  void *v43;
  id v44;
  id v45;
  uint64_t v46;
  os_log_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  v3 = v2;
  v6 = sub_238386574();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_238386568();
  v10 = a1;
  v11 = sub_23838655C();
  v12 = sub_238386988();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = swift_slowAlloc();
    v50 = v7;
    v14 = v13;
    v15 = swift_slowAlloc();
    v47 = v11;
    v16 = (_QWORD *)v15;
    v48 = swift_slowAlloc();
    v52 = (uint64_t)v10;
    v53 = v48;
    *(_DWORD *)v14 = 138412546;
    v51 = v3;
    v49 = v6;
    v17 = v10;
    v18 = v10;
    sub_2383869AC();
    *v16 = v17;

    v10 = v17;
    *(_WORD *)(v14 + 12) = 2080;
    if ((a2 & 1) != 0)
      v19 = 0x64656C62616E65;
    else
      v19 = 0x64656C6261736964;
    if ((a2 & 1) != 0)
      v20 = 0xE700000000000000;
    else
      v20 = 0xE800000000000000;
    v52 = sub_2383842F4(v19, v20, &v53);
    sub_2383869AC();
    v3 = v51;
    swift_bridgeObjectRelease();
    v21 = v47;
    _os_log_impl(&dword_238373000, v47, v12, "toggle app %@: %s", (uint8_t *)v14, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542CBCF0);
    swift_arrayDestroy();
    MEMORY[0x23B832204](v16, -1, -1);
    v22 = v48;
    swift_arrayDestroy();
    MEMORY[0x23B832204](v22, -1, -1);
    MEMORY[0x23B832204](v14, -1, -1);

    (*(void (**)(char *, uint64_t))(v50 + 8))(v9, v49);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  v23 = OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_scanningPolicy;
  v24 = *(void **)(v3 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_scanningPolicy);
  if (v24)
  {
    v25 = v24;
    if (objc_msgSend(v25, sel_policy) == (id)1)
    {
      v26 = objc_msgSend(v25, sel_allApplications);
      if (v26)
      {
        v27 = v26;
        v51 = v3;
        sub_238381F8C(0, (unint64_t *)&unk_2542CBC78);
        sub_238381F8C(0, (unint64_t *)&unk_2568FCE90);
        sub_238381DB4();
        v28 = sub_23838682C();

        v53 = v28;
        v29 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
        v30 = v10;
        v31 = objc_msgSend(v29, sel_initWithBool_, a2 & 1);
        if (v31)
        {
          v32 = (uint64_t)v31;
          if ((v28 & 0xC000000000000001) != 0)
          {
            if (v28 >= 0)
              v28 &= 0xFFFFFFFFFFFFFF8uLL;
            v33 = sub_238386A9C();
            if (__OFADD__(v33, 1))
            {
              __break(1u);
              return;
            }
            v28 = sub_23837EBEC(v28, v33 + 1);
          }
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v52 = v28;
          sub_23837F7D8(v32, v30, isUniquelyReferenced_nonNull_native);
          v53 = v52;

          swift_bridgeObjectRelease();
        }
        else
        {
          v35 = (void *)sub_23837E9DC((unint64_t)v30);

        }
        v36 = objc_msgSend(v25, sel_allServices);
        if (v36)
        {
          v37 = v36;
          type metadata accessor for MOUserSafetyScannableServices(0);
          sub_238375D70(&qword_2568FCB90, (uint64_t (*)(uint64_t))type metadata accessor for MOUserSafetyScannableServices, (uint64_t)&unk_2383873D8);
          sub_23838682C();

        }
        else
        {
          sub_23837C4C4(MEMORY[0x24BEE4AF8]);
        }
        v38 = (void *)objc_opt_self();
        type metadata accessor for MOUserSafetyScannableServices(0);
        sub_238375D70(&qword_2568FCB90, (uint64_t (*)(uint64_t))type metadata accessor for MOUserSafetyScannableServices, (uint64_t)&unk_2383873D8);
        v39 = (void *)sub_238386820();
        swift_bridgeObjectRelease();
        v40 = (void *)sub_238386820();
        swift_bridgeObjectRelease();
        v41 = objc_msgSend(v38, sel_nudityDetectionPolicyWithAllServices_allApplications_, v39, v40);

        v42 = v51;
        v43 = *(void **)(v51 + v23);
        *(_QWORD *)(v51 + v23) = v41;

        v44 = objc_msgSend(*(id *)(v42 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_localStore), sel_userSafety);
        v45 = *(id *)(v42 + v23);
        objc_msgSend(v44, sel_setScanningPolicy_, v45);

      }
    }

  }
}

BOOL sub_23837DE98()
{
  uint64_t v0;
  id v1;
  id v2;
  id v3;

  v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_effectiveStore), sel_userSafety);
  v2 = objc_msgSend(v1, sel_scanningPolicy);

  if (!v2)
    return 0;
  v3 = objc_msgSend(v2, sel_policy);

  return v3 == (id)2;
}

uint64_t sub_23837DF1C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  uint64_t inited;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;

  v3 = sub_238381C3C(a1, a2);
  if (v3)
  {
    v4 = v3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542CBD08);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_238387650;
    v6 = (void *)*MEMORY[0x24BE63EE8];
    *(_QWORD *)(inited + 32) = *MEMORY[0x24BE63EE8];
    v7 = (void *)*MEMORY[0x24BE63EF0];
    v8 = (void *)*MEMORY[0x24BE63EF8];
    *(_QWORD *)(inited + 40) = *MEMORY[0x24BE63EF0];
    *(_QWORD *)(inited + 48) = v8;
    v9 = (void *)*MEMORY[0x24BE63F08];
    *(_QWORD *)(inited + 56) = *MEMORY[0x24BE63F08];
    v10 = v6;
    v11 = v7;
    v12 = v8;
    v13 = v9;
    v14 = sub_23837E104((uint64_t)v4, inited);
    swift_setDeallocating();
    type metadata accessor for MOUserSafetyScannableServices(0);
    swift_arrayDestroy();

    return v14 & 1;
  }
  v16 = objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_effectiveStore), sel_userSafety);
  v17 = objc_msgSend(v16, sel_allowedClients);

  if (!v17)
  {
    v14 = 0;
    return v14 & 1;
  }
  sub_238381F8C(0, (unint64_t *)&unk_2542CBC78);
  sub_238381DB4();
  v18 = sub_23838694C();

  v19 = objc_allocWithZone(MEMORY[0x24BE63F10]);
  swift_bridgeObjectRetain();
  v20 = (void *)sub_238386880();
  swift_bridgeObjectRelease();
  v21 = objc_msgSend(v19, sel_initWithBundleIdentifier_, v20);

  LOBYTE(v19) = sub_23837A728(v21, v18);
  swift_bridgeObjectRelease();
  return v19 & 1;
}

uint64_t sub_23837E104(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v17;

  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
    return 0;
  v3 = sub_2383868A4();
  v5 = v4;
  if (v3 == sub_2383868A4() && v5 == v6)
  {
LABEL_20:
    swift_bridgeObjectRelease_n();
    return 1;
  }
  v8 = sub_238386B2C();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  if ((v8 & 1) != 0)
  {
LABEL_7:
    swift_bridgeObjectRelease();
    return 1;
  }
  if (v2 == 1)
  {
LABEL_17:
    swift_bridgeObjectRelease();
    return 0;
  }
  v10 = 5;
  while (1)
  {
    v11 = v10 - 3;
    if (__OFADD__(v10 - 4, 1))
      break;
    v12 = sub_2383868A4();
    v14 = v13;
    if (v12 == sub_2383868A4() && v14 == v15)
    {
      swift_bridgeObjectRelease();
      goto LABEL_20;
    }
    v17 = sub_238386B2C();
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    if ((v17 & 1) != 0)
      goto LABEL_7;
    ++v10;
    if (v11 == v2)
      goto LABEL_17;
  }
  __break(1u);
  return result;
}

uint64_t sub_23837E258(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  unint64_t v13;
  char v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;

  v3 = sub_238381C3C(a1, a2);
  if (!v3)
  {
    v17 = objc_allocWithZone(MEMORY[0x24BE63F10]);
    swift_bridgeObjectRetain();
    v18 = (void *)sub_238386880();
    swift_bridgeObjectRelease();
    v4 = objc_msgSend(v17, sel_initWithBundleIdentifier_, v18);

    v19 = objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_effectiveStore), sel_userSafety);
    v20 = objc_msgSend(v19, sel_scanningPolicy);

    if (!v20)
      goto LABEL_16;
    v7 = objc_msgSend(v20, sel_policy);

    if (!v7)
      goto LABEL_16;
    if (v7 == (id)1)
    {
      v22 = *(void **)(v2 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_scanningPolicy);
      if (v22)
      {
        v23 = objc_msgSend(v22, sel_allApplications);
        if (v23)
        {
          v24 = v23;
          sub_238381F8C(0, (unint64_t *)&unk_2542CBC78);
          sub_238381F8C(0, (unint64_t *)&unk_2568FCE90);
          sub_238381DB4();
          v25 = sub_23838682C();

          v26 = v4;
          v27 = sub_23837BE9C(v26, v25);

          swift_bridgeObjectRelease();
          if (v27)
          {
            v16 = objc_msgSend(v27, sel_BOOLValue);

            return (uint64_t)v16;
          }

          return 1;
        }
      }
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  v4 = v3;
  v5 = objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_effectiveStore), sel_userSafety);
  v6 = objc_msgSend(v5, sel_scanningPolicy);

  if (!v6)
    goto LABEL_16;
  v7 = objc_msgSend(v6, sel_policy);

  if (!v7)
    goto LABEL_16;
  if (v7 != (id)1)
  {
LABEL_13:
    if (v7 == (id)2)
    {
LABEL_14:

      return 1;
    }
LABEL_16:

    return 0;
  }
  v8 = *(void **)(v2 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_scanningPolicy);
  if (!v8)
    goto LABEL_14;
  v9 = objc_msgSend(v8, sel_allServices);
  if (!v9)
    goto LABEL_14;
  v10 = v9;
  type metadata accessor for MOUserSafetyScannableServices(0);
  sub_238381F8C(0, (unint64_t *)&unk_2568FCE90);
  sub_238375D70(&qword_2568FCB90, (uint64_t (*)(uint64_t))type metadata accessor for MOUserSafetyScannableServices, (uint64_t)&unk_2383873D8);
  v11 = sub_23838682C();

  if (!*(_QWORD *)(v11 + 16))
  {

LABEL_24:
    swift_bridgeObjectRelease();
    return 1;
  }
  v12 = v4;
  v13 = sub_23837E8F8((uint64_t)v12);
  if ((v14 & 1) == 0)
  {

    goto LABEL_24;
  }
  v15 = *(id *)(*(_QWORD *)(v11 + 56) + 8 * v13);

  swift_bridgeObjectRelease();
  v16 = objc_msgSend(v15, sel_BOOLValue);

  return (uint64_t)v16;
}

uint64_t NudityDetectionRootModel.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);

  v1 = v0 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel__detectionEntries;
  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542CBC38);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel__nudityDetectionEnabled;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2568FCCC8);
  v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5(v0 + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel__nudityDetectionAnalyticsEnabled, v4);

  swift_unknownObjectRelease();
  return v0;
}

uint64_t NudityDetectionRootModel.__deallocating_deinit()
{
  NudityDetectionRootModel.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_23837E6A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for NudityDetectionRootModel(0);
  result = sub_238386580();
  *a1 = result;
  return result;
}

id sub_23837E6E4(uint64_t a1, uint64_t a2, char a3)
{
  void *v3;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v10[2];

  v10[1] = *(id *)MEMORY[0x24BDAC8D0];
  v5 = (void *)sub_238386880();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  v6 = objc_msgSend(v3, sel_initWithBundleIdentifier_allowPlaceholder_error_, v5, a3 & 1, v10);

  if (v6)
  {
    v7 = v10[0];
  }
  else
  {
    v8 = v10[0];
    sub_2383864D8();

    swift_willThrow();
  }
  return v6;
}

_QWORD *sub_23837E7BC(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2542CBD08);
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
    sub_2383816CC(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_23837E8C8(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_238386994();
  return sub_23837FA88(a1, v2);
}

unint64_t sub_23837E8F8(uint64_t a1)
{
  uint64_t v2;

  sub_2383868A4();
  sub_238386B44();
  sub_2383868C8();
  v2 = sub_238386B5C();
  swift_bridgeObjectRelease();
  return sub_23837FBA0(a1, v2);
}

unint64_t sub_23837E978(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_238386B44();
  sub_2383868C8();
  v4 = sub_238386B5C();
  return sub_23837FD14(a1, a2, v4);
}

uint64_t sub_23837E9DC(unint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  char v12;
  char v13;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v15;
  uint64_t v17;

  v2 = v1;
  v4 = *v1;
  if ((v4 & 0xC000000000000001) == 0)
  {
LABEL_8:
    swift_bridgeObjectRetain();
    a1 = sub_23837E8C8(a1);
    v13 = v12;
    swift_bridgeObjectRelease();
    if ((v13 & 1) != 0)
    {
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v9 = *v2;
      v17 = *v2;
      *v2 = 0x8000000000000000;
      if (!isUniquelyReferenced_nonNull_native)
      {
        sub_23837FDF4();
        v9 = v17;
      }
      goto LABEL_11;
    }
    return 0;
  }
  if (v4 < 0)
    v5 = v4;
  else
    v5 = v4 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain();
  v6 = (id)a1;
  v7 = sub_238386AA8();

  if (!v7)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_unknownObjectRelease();
  v8 = sub_238386A9C();
  v9 = sub_23837EBEC(v5, v8);
  swift_retain();
  a1 = sub_23837E8C8((uint64_t)v6);
  v11 = v10;
  swift_release();
  if ((v11 & 1) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
LABEL_11:

  v15 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * a1);
  sub_23837F438(a1, v9);
  *v2 = v9;
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_23837EB28(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  unint64_t v4;
  char v5;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v2 = v1;
  swift_bridgeObjectRetain();
  v4 = sub_23837E8F8(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v7 = *v2;
  v10 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_23837FF98();
    v7 = v10;
  }

  v8 = *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v4);
  sub_23837F5E8(v4, v7);
  *v2 = v7;
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_23837EBEC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  unint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568FCEA0);
    v2 = sub_238386AF0();
    v18 = v2;
    sub_238386A90();
    v3 = sub_238386AB4();
    if (v3)
    {
      v4 = v3;
      sub_238381F8C(0, (unint64_t *)&unk_2542CBC78);
      do
      {
        swift_dynamicCast();
        sub_238381F8C(0, (unint64_t *)&unk_2568FCE90);
        swift_dynamicCast();
        v2 = v18;
        v12 = *(_QWORD *)(v18 + 16);
        if (*(_QWORD *)(v18 + 24) <= v12)
        {
          sub_23837EE3C(v12 + 1, 1);
          v2 = v18;
        }
        result = sub_238386994();
        v6 = v2 + 64;
        v7 = -1 << *(_BYTE *)(v2 + 32);
        v8 = result & ~v7;
        v9 = v8 >> 6;
        if (((-1 << v8) & ~*(_QWORD *)(v2 + 64 + 8 * (v8 >> 6))) != 0)
        {
          v10 = __clz(__rbit64((-1 << v8) & ~*(_QWORD *)(v2 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v13 = 0;
          v14 = (unint64_t)(63 - v7) >> 6;
          do
          {
            if (++v9 == v14 && (v13 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v15 = v9 == v14;
            if (v9 == v14)
              v9 = 0;
            v13 |= v15;
            v16 = *(_QWORD *)(v6 + 8 * v9);
          }
          while (v16 == -1);
          v10 = __clz(__rbit64(~v16)) + (v9 << 6);
        }
        *(_QWORD *)(v6 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
        v11 = 8 * v10;
        *(_QWORD *)(*(_QWORD *)(v2 + 48) + v11) = v17;
        *(_QWORD *)(*(_QWORD *)(v2 + 56) + v11) = v4;
        ++*(_QWORD *)(v2 + 16);
        v4 = sub_238386AB4();
      }
      while (v4);
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x24BEE4B00];
  }
  return v2;
}

uint64_t sub_23837EE3C(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FCEA0);
  v6 = sub_238386AE4();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v2;
  v37 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v37 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v11)
        goto LABEL_33;
      v24 = *(_QWORD *)(v37 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          v3 = v36;
          if ((a2 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v37 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v14 >= v11)
              goto LABEL_33;
            v24 = *(_QWORD *)(v37 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v14 = v25;
      }
    }
LABEL_30:
    v10 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    v30 = 8 * v21;
    v31 = *(void **)(*(_QWORD *)(v5 + 48) + v30);
    v32 = *(void **)(*(_QWORD *)(v5 + 56) + v30);
    if ((a2 & 1) == 0)
    {
      v33 = v31;
      v34 = v32;
    }
    result = sub_238386994();
    v15 = -1 << *(_BYTE *)(v7 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v28 = v17 == v27;
        if (v17 == v27)
          v17 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = 8 * v18;
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + v19) = v31;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v19) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v36;
  v23 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_23837F10C(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  int64_t v37;
  uint64_t v38;
  char v39;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FCEA8);
  v39 = a2;
  v6 = sub_238386AE4();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v38 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v36 = v2;
  v37 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v21 = v20 | (v13 << 6);
      goto LABEL_31;
    }
    v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v37)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v38 + 8 * v22);
    ++v13;
    if (!v24)
    {
      v13 = v22 + 1;
      if (v22 + 1 >= v37)
        goto LABEL_33;
      v24 = *(_QWORD *)(v38 + 8 * v13);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_33:
          swift_release();
          v3 = v36;
          if ((v39 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v38 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v13 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v13 >= v37)
              goto LABEL_33;
            v24 = *(_QWORD *)(v38 + 8 * v13);
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v13 = v25;
      }
    }
LABEL_30:
    v10 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v13 << 6);
LABEL_31:
    v30 = 8 * v21;
    v31 = *(void **)(*(_QWORD *)(v5 + 48) + v30);
    v32 = *(void **)(*(_QWORD *)(v5 + 56) + v30);
    if ((v39 & 1) == 0)
    {
      v33 = v31;
      v34 = v32;
    }
    sub_2383868A4();
    sub_238386B44();
    sub_2383868C8();
    v14 = sub_238386B5C();
    result = swift_bridgeObjectRelease();
    v15 = -1 << *(_BYTE *)(v7 + 32);
    v16 = v14 & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v11 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v11 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v28 = v17 == v27;
        if (v17 == v27)
          v17 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v11 + 8 * v17);
      }
      while (v29 == -1);
      v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(_QWORD *)(v11 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = 8 * v18;
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + v19) = v31;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v19) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v36;
  v23 = (_QWORD *)(v5 + 64);
  if ((v39 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

void sub_23837F438(unint64_t a1, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v3 = a1;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (a1 + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    v8 = sub_2383869D0();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        v10 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v6);
        v11 = sub_238386994();

        v12 = v11 & v7;
        if (v3 >= (uint64_t)v9)
        {
          if (v12 >= v9 && v3 >= (uint64_t)v12)
          {
LABEL_16:
            v15 = *(_QWORD *)(a2 + 48);
            v16 = (_QWORD *)(v15 + 8 * v3);
            v17 = (_QWORD *)(v15 + 8 * v6);
            if (v3 != v6 || v16 >= v17 + 1)
              *v16 = *v17;
            v18 = *(_QWORD *)(a2 + 56);
            v19 = (_QWORD *)(v18 + 8 * v3);
            v20 = (_QWORD *)(v18 + 8 * v6);
            if (v3 != v6 || (v3 = v6, v19 >= v20 + 1))
            {
              *v19 = *v20;
              v3 = v6;
            }
          }
        }
        else if (v12 >= v9 || v3 >= (uint64_t)v12)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v21 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v22 = *v21;
    v23 = (-1 << v3) - 1;
  }
  else
  {
    v21 = (uint64_t *)(v4 + 8 * (a1 >> 6));
    v23 = *v21;
    v22 = (-1 << a1) - 1;
  }
  *v21 = v23 & v22;
  v24 = *(_QWORD *)(a2 + 16);
  v25 = __OFSUB__(v24, 1);
  v26 = v24 - 1;
  if (v25)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v26;
    ++*(_DWORD *)(a2 + 36);
  }
}

unint64_t sub_23837F5E8(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_2383869D0();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        v9 = *(void **)(*(_QWORD *)(a2 + 48) + 8 * v6);
        sub_2383868A4();
        sub_238386B44();
        v10 = v9;
        sub_2383868C8();
        v11 = sub_238386B5C();

        result = swift_bridgeObjectRelease();
        v12 = v11 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v12 < v8)
            goto LABEL_5;
        }
        else if (v12 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v12)
        {
LABEL_11:
          v13 = *(_QWORD *)(a2 + 48);
          v14 = (_QWORD *)(v13 + 8 * v3);
          v15 = (_QWORD *)(v13 + 8 * v6);
          if (v3 != v6 || v14 >= v15 + 1)
            *v14 = *v15;
          v16 = *(_QWORD *)(a2 + 56);
          v17 = (_QWORD *)(v16 + 8 * v3);
          v18 = (_QWORD *)(v16 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v17 >= v18 + 1))
          {
            *v17 = *v18;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v20 = *v19;
    v21 = (-1 << v3) - 1;
  }
  else
  {
    v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    v21 = *v19;
    v20 = (-1 << result) - 1;
  }
  *v19 = v21 & v20;
  v22 = *(_QWORD *)(a2 + 16);
  v23 = __OFSUB__(v22, 1);
  v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void sub_23837F7D8(uint64_t a1, void *a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v7;
  char v8;
  unint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  id v23;

  v4 = v3;
  v7 = *v3;
  v9 = sub_23837E8C8((uint64_t)a2);
  v10 = *(_QWORD *)(v7 + 16);
  v11 = (v8 & 1) == 0;
  v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v13 = v8;
  v14 = *(_QWORD *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0)
    goto LABEL_7;
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_23837FDF4();
LABEL_7:
    v15 = (_QWORD *)*v4;
    if ((v13 & 1) != 0)
    {
LABEL_8:
      v16 = v15[7];

      *(_QWORD *)(v16 + 8 * v9) = a1;
      return;
    }
LABEL_11:
    v15[(v9 >> 6) + 8] |= 1 << v9;
    v19 = 8 * v9;
    *(_QWORD *)(v15[6] + v19) = a2;
    *(_QWORD *)(v15[7] + v19) = a1;
    v20 = v15[2];
    v21 = __OFADD__(v20, 1);
    v22 = v20 + 1;
    if (!v21)
    {
      v15[2] = v22;
      v23 = a2;
      return;
    }
    goto LABEL_14;
  }
  sub_23837EE3C(v12, a3 & 1);
  v17 = sub_23837E8C8((uint64_t)a2);
  if ((v13 & 1) == (v18 & 1))
  {
    v9 = v17;
    v15 = (_QWORD *)*v4;
    if ((v13 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_238381F8C(0, (unint64_t *)&unk_2542CBC78);
  sub_238386B38();
  __break(1u);
}

void sub_23837F938(uint64_t a1, void *a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v7;
  char v8;
  unint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  id v23;

  v4 = v3;
  v7 = *v3;
  v9 = sub_23837E8F8((uint64_t)a2);
  v10 = *(_QWORD *)(v7 + 16);
  v11 = (v8 & 1) == 0;
  v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v13 = v8;
  v14 = *(_QWORD *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0)
    goto LABEL_7;
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_23837FF98();
LABEL_7:
    v15 = (_QWORD *)*v4;
    if ((v13 & 1) != 0)
    {
LABEL_8:
      v16 = v15[7];

      *(_QWORD *)(v16 + 8 * v9) = a1;
      return;
    }
LABEL_11:
    v15[(v9 >> 6) + 8] |= 1 << v9;
    v19 = 8 * v9;
    *(_QWORD *)(v15[6] + v19) = a2;
    *(_QWORD *)(v15[7] + v19) = a1;
    v20 = v15[2];
    v21 = __OFADD__(v20, 1);
    v22 = v20 + 1;
    if (!v21)
    {
      v15[2] = v22;
      v23 = a2;
      return;
    }
    goto LABEL_14;
  }
  sub_23837F10C(v12, a3 & 1);
  v17 = sub_23837E8F8((uint64_t)a2);
  if ((v13 & 1) == (v18 & 1))
  {
    v9 = v17;
    v15 = (_QWORD *)*v4;
    if ((v13 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  type metadata accessor for MOUserSafetyScannableServices(0);
  sub_238386B38();
  __break(1u);
}

unint64_t sub_23837FA88(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t i;
  id v6;
  char v7;
  uint64_t v8;
  id v9;
  char v10;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  i = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    sub_238381F8C(0, (unint64_t *)&unk_2542CBC78);
    v6 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
    v7 = sub_2383869A0();

    if ((v7 & 1) == 0)
    {
      v8 = ~v4;
      for (i = (i + 1) & v8; ((*(_QWORD *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v8)
      {
        v9 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
        v10 = sub_2383869A0();

        if ((v10 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

unint64_t sub_23837FBA0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = sub_2383868A4();
    v8 = v7;
    if (v6 == sub_2383868A4() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_238386B2C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      v12 = ~v4;
      v5 = (v5 + 1) & v12;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v13 = sub_2383868A4();
          v15 = v14;
          if (v13 == sub_2383868A4() && v15 == v16)
            break;
          v18 = sub_238386B2C();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            v5 = (v5 + 1) & v12;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

unint64_t sub_23837FD14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_238386B2C() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_238386B2C() & 1) == 0);
    }
  }
  return v6;
}

id sub_23837FDF4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FCEA0);
  v2 = *v0;
  v3 = sub_238386AD8();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
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
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    v18 = *(void **)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v18;
    v19 = v17;
    result = v18;
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_23837FF98()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FCEA8);
  v2 = *v0;
  v3 = sub_238386AD8();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
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
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    v18 = *(void **)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v18;
    v19 = v17;
    result = v18;
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_23838013C(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *i;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  char *v37;
  char *v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  BOOL v50;
  unint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  BOOL v60;
  uint64_t v61;
  char v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  BOOL v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  char *v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  char *v83;
  unint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  char *v89;
  uint64_t v90;
  unint64_t v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  unint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;

  v2 = v1;
  v3 = a1;
  v4 = a1[1];
  result = sub_238386B20();
  v104 = v4;
  if (result >= v4)
  {
    if (v4 < 0)
      goto LABEL_140;
    if ((unint64_t)v4 < 2)
      return result;
    v11 = (uint64_t *)*v3;
    v12 = -1;
    v13 = 1;
    sub_238377280();
    for (i = v11; ; ++i)
    {
      v15 = v12;
      v16 = i;
      do
      {
        result = sub_2383869C4();
        if (result != -1)
          break;
        if (!v11)
        {
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
          goto LABEL_149;
        }
        v17 = *v16;
        *v16 = v16[1];
        v16[1] = v17;
        --v16;
      }
      while (!__CFADD__(v15++, 1));
      ++v13;
      --v12;
      if (v13 == v4)
        return result;
    }
  }
  if (v4 >= 0)
    v6 = v4;
  else
    v6 = v4 + 1;
  if (v4 < -1)
  {
LABEL_149:
    result = sub_238386AC0();
    __break(1u);
    return result;
  }
  v7 = result;
  v97 = v3;
  if (v4 < 2)
  {
    v19 = (char *)MEMORY[0x24BEE4AF8];
    v106 = MEMORY[0x24BEE4AF8];
    v103 = (char *)((MEMORY[0x24BEE4AF8] & 0xFFFFFFFFFFFFFF8) + 32);
    if (v4 != 1)
    {
      v22 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      goto LABEL_106;
    }
  }
  else
  {
    v8 = v3;
    v9 = v6 >> 1;
    type metadata accessor for NudityDetectionEntry(0);
    v10 = sub_23838691C();
    *(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10) = v9;
    v3 = v8;
    v103 = (char *)((v10 & 0xFFFFFFFFFFFFFF8) + 32);
    v106 = v10;
  }
  v100 = v7;
  v20 = 0;
  v21 = *v3;
  v98 = *v3 - 8;
  v99 = *v3 + 16;
  v19 = (char *)MEMORY[0x24BEE4AF8];
  do
  {
    v23 = v20++;
    v101 = v23;
    if (v20 < v4)
    {
      sub_238377280();
      v24 = sub_2383869C4();
      v20 = v23 + 2;
      if (v23 + 2 < v4)
      {
        v25 = v99 + 8 * v23;
        while ((v24 == -1) != (sub_2383869C4() != -1))
        {
          ++v20;
          v25 += 8;
          if (v104 == v20)
          {
            v20 = v104;
            v4 = v104;
            goto LABEL_29;
          }
        }
        v4 = v104;
      }
LABEL_29:
      if (v24 == -1)
      {
        if (v20 < v23)
          goto LABEL_144;
        if (v23 < v20)
        {
          v26 = (uint64_t *)(v98 + 8 * v20);
          v27 = v20;
          v28 = v23;
          v29 = (uint64_t *)(v21 + 8 * v23);
          do
          {
            if (v28 != --v27)
            {
              if (!v21)
                goto LABEL_147;
              v30 = *v29;
              *v29 = *v26;
              *v26 = v30;
            }
            ++v28;
            --v26;
            ++v29;
          }
          while (v28 < v27);
        }
      }
    }
    if (v20 < v4)
    {
      if (__OFSUB__(v20, v23))
        goto LABEL_139;
      if (v20 - v23 < v100)
      {
        if (__OFADD__(v23, v100))
          goto LABEL_141;
        if (v23 + v100 >= v4)
          v31 = v4;
        else
          v31 = v23 + v100;
        if (v31 < v23)
        {
LABEL_142:
          __break(1u);
          goto LABEL_143;
        }
        if (v20 != v31)
        {
          sub_238377280();
          v32 = (uint64_t *)(v98 + 8 * v20);
          do
          {
            v33 = v32;
            do
            {
              if (sub_2383869C4() != -1)
                break;
              if (!v21)
                goto LABEL_145;
              v34 = *v33;
              *v33 = v33[1];
              v33[1] = v34;
              --v33;
              ++v23;
            }
            while (v20 != v23);
            ++v20;
            ++v32;
            v23 = v101;
          }
          while (v20 != v31);
          v20 = v31;
        }
      }
    }
    if (v20 < v23)
      goto LABEL_134;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v19 = sub_238380C20(0, *((_QWORD *)v19 + 2) + 1, 1, v19);
    v36 = *((_QWORD *)v19 + 2);
    v35 = *((_QWORD *)v19 + 3);
    v22 = v36 + 1;
    if (v36 >= v35 >> 1)
      v19 = sub_238380C20((char *)(v35 > 1), v36 + 1, 1, v19);
    *((_QWORD *)v19 + 2) = v22;
    v37 = v19 + 32;
    v38 = &v19[16 * v36 + 32];
    *(_QWORD *)v38 = v23;
    *((_QWORD *)v38 + 1) = v20;
    if (v36)
    {
      v102 = v20;
      while (1)
      {
        v39 = v22 - 1;
        if (v22 >= 4)
        {
          v44 = &v37[16 * v22];
          v45 = *((_QWORD *)v44 - 8);
          v46 = *((_QWORD *)v44 - 7);
          v50 = __OFSUB__(v46, v45);
          v47 = v46 - v45;
          if (v50)
            goto LABEL_123;
          v49 = *((_QWORD *)v44 - 6);
          v48 = *((_QWORD *)v44 - 5);
          v50 = __OFSUB__(v48, v49);
          v42 = v48 - v49;
          v43 = v50;
          if (v50)
            goto LABEL_124;
          v51 = v22 - 2;
          v52 = &v37[16 * v22 - 32];
          v54 = *(_QWORD *)v52;
          v53 = *((_QWORD *)v52 + 1);
          v50 = __OFSUB__(v53, v54);
          v55 = v53 - v54;
          if (v50)
            goto LABEL_126;
          v50 = __OFADD__(v42, v55);
          v56 = v42 + v55;
          if (v50)
            goto LABEL_129;
          if (v56 >= v47)
          {
            v74 = &v37[16 * v39];
            v76 = *(_QWORD *)v74;
            v75 = *((_QWORD *)v74 + 1);
            v50 = __OFSUB__(v75, v76);
            v77 = v75 - v76;
            if (v50)
              goto LABEL_133;
            v67 = v42 < v77;
            goto LABEL_93;
          }
        }
        else
        {
          if (v22 != 3)
          {
            v68 = *((_QWORD *)v19 + 4);
            v69 = *((_QWORD *)v19 + 5);
            v50 = __OFSUB__(v69, v68);
            v61 = v69 - v68;
            v62 = v50;
            goto LABEL_87;
          }
          v41 = *((_QWORD *)v19 + 4);
          v40 = *((_QWORD *)v19 + 5);
          v50 = __OFSUB__(v40, v41);
          v42 = v40 - v41;
          v43 = v50;
        }
        if ((v43 & 1) != 0)
          goto LABEL_125;
        v51 = v22 - 2;
        v57 = &v37[16 * v22 - 32];
        v59 = *(_QWORD *)v57;
        v58 = *((_QWORD *)v57 + 1);
        v60 = __OFSUB__(v58, v59);
        v61 = v58 - v59;
        v62 = v60;
        if (v60)
          goto LABEL_128;
        v63 = &v37[16 * v39];
        v65 = *(_QWORD *)v63;
        v64 = *((_QWORD *)v63 + 1);
        v50 = __OFSUB__(v64, v65);
        v66 = v64 - v65;
        if (v50)
          goto LABEL_131;
        if (__OFADD__(v61, v66))
          goto LABEL_132;
        if (v61 + v66 >= v42)
        {
          v67 = v42 < v66;
LABEL_93:
          if (v67)
            v39 = v51;
          goto LABEL_95;
        }
LABEL_87:
        if ((v62 & 1) != 0)
          goto LABEL_127;
        v70 = &v37[16 * v39];
        v72 = *(_QWORD *)v70;
        v71 = *((_QWORD *)v70 + 1);
        v50 = __OFSUB__(v71, v72);
        v73 = v71 - v72;
        if (v50)
          goto LABEL_130;
        if (v73 < v61)
          goto LABEL_21;
LABEL_95:
        v78 = v39 - 1;
        if (v39 - 1 >= v22)
        {
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
LABEL_141:
          __break(1u);
          goto LABEL_142;
        }
        if (!v21)
          goto LABEL_146;
        v79 = v19;
        v80 = v21;
        v81 = &v37[16 * v78];
        v82 = *(_QWORD *)v81;
        v83 = v37;
        v84 = v39;
        v85 = &v37[16 * v39];
        v86 = *((_QWORD *)v85 + 1);
        v87 = v80;
        sub_238380928((char *)(v80 + 8 * *(_QWORD *)v81), (char *)(v80 + 8 * *(_QWORD *)v85), v80 + 8 * v86, v103);
        if (v1)
          goto LABEL_103;
        if (v86 < v82)
          goto LABEL_120;
        if (v84 > *((_QWORD *)v79 + 2))
          goto LABEL_121;
        *(_QWORD *)v81 = v82;
        *(_QWORD *)&v83[16 * v78 + 8] = v86;
        v88 = *((_QWORD *)v79 + 2);
        if (v84 >= v88)
          goto LABEL_122;
        v19 = v79;
        v22 = v88 - 1;
        memmove(v85, v85 + 16, 16 * (v88 - 1 - v84));
        v37 = v83;
        *((_QWORD *)v79 + 2) = v88 - 1;
        v21 = v87;
        v20 = v102;
        if (v88 <= 2)
          goto LABEL_21;
      }
    }
    v22 = 1;
LABEL_21:
    v4 = v104;
  }
  while (v20 < v104);
  v2 = v1;
LABEL_106:
  v89 = v19;
  v105 = v2;
  if (v22 >= 2)
  {
    v90 = *v97;
    do
    {
      v91 = v22 - 2;
      if (v22 < 2)
        goto LABEL_135;
      if (!v90)
        goto LABEL_148;
      v92 = v89;
      v93 = *(_QWORD *)&v89[16 * v91 + 32];
      v94 = *(_QWORD *)&v89[16 * v22 + 24];
      sub_238380928((char *)(v90 + 8 * v93), (char *)(v90 + 8 * *(_QWORD *)&v89[16 * v22 + 16]), v90 + 8 * v94, v103);
      if (v105)
        break;
      if (v94 < v93)
        goto LABEL_136;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v92 = sub_238380DC0((uint64_t)v92);
      if (v91 >= *((_QWORD *)v92 + 2))
        goto LABEL_137;
      v95 = &v92[16 * v91 + 32];
      *(_QWORD *)v95 = v93;
      *((_QWORD *)v95 + 1) = v94;
      v96 = *((_QWORD *)v92 + 2);
      if (v22 > v96)
        goto LABEL_138;
      memmove(&v92[16 * v22 + 16], &v92[16 * v22 + 32], 16 * (v96 - v22));
      v89 = v92;
      *((_QWORD *)v92 + 2) = v96 - 1;
      v22 = v96 - 1;
    }
    while (v96 > 2);
  }
LABEL_103:
  swift_bridgeObjectRelease();
  *(_QWORD *)((v106 & 0xFFFFFFFFFFFFF8) + 0x10) = 0;
  sub_238386904();
  return swift_bridgeObjectRelease();
}

uint64_t sub_238380928(char *__src, char *a2, unint64_t a3, char *a4)
{
  char *v5;
  char *v6;
  int64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t result;
  char *v21;
  char *v22;
  char *v23;

  v5 = a2;
  v6 = __src;
  v7 = a2 - __src;
  v8 = a2 - __src + 7;
  if (a2 - __src >= 0)
    v8 = a2 - __src;
  v9 = v8 >> 3;
  v10 = a3 - (_QWORD)a2;
  v11 = a3 - (_QWORD)a2 + 7;
  if ((uint64_t)(a3 - (_QWORD)a2) >= 0)
    v11 = a3 - (_QWORD)a2;
  v12 = v11 >> 3;
  v23 = __src;
  v22 = a4;
  if (v9 >= v11 >> 3)
  {
    if (v10 >= -7)
    {
      if (a4 != a2 || &a2[8 * v12] <= a4)
        memmove(a4, a2, 8 * v12);
      v15 = &a4[8 * v12];
      v21 = v15;
      v23 = v5;
      if (v6 < v5 && v10 >= 8)
      {
        sub_238377280();
        v16 = (char *)(a3 - 8);
        v17 = v5;
        while (1)
        {
          v18 = v16 + 8;
          v17 -= 8;
          if (sub_2383869C4() == -1)
          {
            if (v18 != v5 || v16 >= v5)
              *(_QWORD *)v16 = *(_QWORD *)v17;
            v23 = v17;
            if (v17 <= v6)
              goto LABEL_43;
          }
          else
          {
            v21 = v15 - 8;
            if (v18 < v15 || v16 >= v15 || v18 != v15)
              *(_QWORD *)v16 = *((_QWORD *)v15 - 1);
            v17 = v5;
            v15 -= 8;
            if (v5 <= v6)
              goto LABEL_43;
          }
          v16 -= 8;
          v5 = v17;
          if (v15 <= a4)
            goto LABEL_43;
        }
      }
      goto LABEL_43;
    }
  }
  else if (v7 >= -7)
  {
    if (a4 != __src || &__src[8 * v9] <= a4)
      memmove(a4, __src, 8 * v9);
    v21 = &a4[8 * v9];
    if ((unint64_t)v5 < a3 && v7 >= 8)
    {
      sub_238377280();
      v13 = a4;
      do
      {
        if (sub_2383869C4() == -1)
        {
          v14 = v5 + 8;
          if (v6 < v5 || v6 >= v14 || v6 != v5)
            *(_QWORD *)v6 = *(_QWORD *)v5;
        }
        else
        {
          if (v6 != v13)
            *(_QWORD *)v6 = *(_QWORD *)v13;
          v13 += 8;
          v22 = v13;
          v14 = v5;
        }
        v6 += 8;
        if (v13 >= &a4[8 * v9])
          break;
        v5 = v14;
      }
      while ((unint64_t)v14 < a3);
      v23 = v6;
    }
LABEL_43:
    sub_238380D18((void **)&v23, (const void **)&v22, &v21);
    return 1;
  }
  result = sub_238386B08();
  __break(1u);
  return result;
}

char *sub_238380C20(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568FCF18);
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

char *sub_238380D18(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *result;
  uint64_t v7;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  v5 = v4 + 7;
  if (v4 >= 0)
    v5 = *a3 - (_QWORD)v3;
  if (v4 <= -8)
  {
    result = (char *)sub_238386B08();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
      return (char *)memmove(result, v3, 8 * v7);
  }
  return result;
}

char *sub_238380DC0(uint64_t a1)
{
  return sub_238380C20(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

void (*sub_238380DD4(uint64_t (**a1)(), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  uint64_t (*v6)();

  v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_238380E54(v6, a2, a3);
  return sub_238380E28;
}

void sub_238380E28(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t (*sub_238380E54(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t *v3;
  uint64_t v4;

  v3 = (uint64_t *)result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = MEMORY[0x23B831CDC](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = swift_retain();
LABEL_5:
    *v3 = v4;
    return destroy for NudityDetectionAppsRootView;
  }
  __break(1u);
  return result;
}

uint64_t sub_238380EC0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  void (*v12)(_QWORD *);
  uint64_t *v13;
  uint64_t v14;
  uint64_t result;
  uint64_t (*v16[4])();

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_238386ACC();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_238386ACC();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_2383772F0((unint64_t *)&unk_2568FCF08, (uint64_t *)&unk_2542CBC58, MEMORY[0x24BEE12E0]);
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542CBC58);
          v12 = sub_238380DD4(v16, i, a3);
          v14 = *v13;
          swift_retain();
          ((void (*)(uint64_t (**)(), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    type metadata accessor for NudityDetectionEntry(0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_238386B08();
  __break(1u);
  return result;
}

void sub_2383810CC(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_238386ACC();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x23B831CE8);
}

uint64_t sub_238381134(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542CBCF8);
    v3 = sub_238386A00();
    v4 = 0;
    v5 = v3 + 56;
    v31 = v1;
    v32 = a1 + 32;
    while (1)
    {
      v6 = *(void **)(v32 + 8 * v4);
      sub_2383868A4();
      sub_238386B44();
      v7 = v6;
      sub_2383868C8();
      v8 = sub_238386B5C();
      result = swift_bridgeObjectRelease();
      v10 = -1 << *(_BYTE *)(v3 + 32);
      v11 = v8 & ~v10;
      v12 = v11 >> 6;
      v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
      v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        v15 = sub_2383868A4();
        v17 = v16;
        if (v15 == sub_2383868A4() && v17 == v18)
        {
LABEL_3:
          swift_bridgeObjectRelease_n();
LABEL_4:

          goto LABEL_5;
        }
        v20 = sub_238386B2C();
        swift_bridgeObjectRelease();
        result = swift_bridgeObjectRelease();
        if ((v20 & 1) != 0)
          goto LABEL_4;
        v21 = ~v10;
        while (1)
        {
          v11 = (v11 + 1) & v21;
          v12 = v11 >> 6;
          v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
          v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0)
            break;
          v22 = sub_2383868A4();
          v24 = v23;
          if (v22 == sub_2383868A4() && v24 == v25)
            goto LABEL_3;
          v27 = sub_238386B2C();
          swift_bridgeObjectRelease();
          result = swift_bridgeObjectRelease();
          if ((v27 & 1) != 0)
            goto LABEL_4;
        }
      }
      *(_QWORD *)(v5 + 8 * v12) = v14 | v13;
      *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v11) = v7;
      v28 = *(_QWORD *)(v3 + 16);
      v29 = __OFADD__(v28, 1);
      v30 = v28 + 1;
      if (v29)
      {
        __break(1u);
        return result;
      }
      *(_QWORD *)(v3 + 16) = v30;
LABEL_5:
      if (++v4 == v31)
        return v3;
    }
  }
  return MEMORY[0x24BEE4B08];
}

void sub_238381360(uint64_t a1)
{
  uint64_t v1;

  sub_23837A198(a1, v1);
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

uint64_t sub_238381380()
{
  return MEMORY[0x24BDB9D70];
}

uint64_t sub_23838138C()
{
  return type metadata accessor for NudityDetectionEntry(0);
}

uint64_t type metadata accessor for NudityDetectionEntry(uint64_t a1)
{
  return sub_23838156C(a1, qword_2542CB6C0);
}

void sub_2383813A8()
{
  unint64_t v0;

  sub_23838142C();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_23838142C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2542CBC50)
  {
    v0 = sub_2383865B0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2542CBC50);
  }
}

uint64_t sub_238381480()
{
  return type metadata accessor for NudityDetectionSystemService(0);
}

uint64_t type metadata accessor for NudityDetectionSystemService(uint64_t a1)
{
  return sub_23838156C(a1, qword_2542CBAB0);
}

uint64_t sub_23838149C()
{
  return swift_updateClassMetadata2();
}

uint64_t sub_2383814DC()
{
  return type metadata accessor for NudityDetectionApp(0);
}

uint64_t type metadata accessor for NudityDetectionApp(uint64_t a1)
{
  return sub_23838156C(a1, qword_2568FCD08);
}

uint64_t sub_2383814F8()
{
  return swift_updateClassMetadata2();
}

uint64_t sub_238381550()
{
  return type metadata accessor for NudityDetectionRootModel(0);
}

uint64_t type metadata accessor for NudityDetectionRootModel(uint64_t a1)
{
  return sub_23838156C(a1, qword_2542CB868);
}

uint64_t sub_23838156C(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

void sub_2383815A0()
{
  unint64_t v0;
  unint64_t v1;

  sub_238381668();
  if (v0 <= 0x3F)
  {
    sub_23838142C();
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for NudityDetectionRootModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of NudityDetectionRootModel.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 360))();
}

uint64_t dispatch thunk of NudityDetectionRootModel.communicationSafetyModeEnabled.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 408))();
}

void sub_238381668()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2542CBC48)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_2542CBC58);
    v0 = sub_2383865B0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2542CBC48);
  }
}

uint64_t sub_2383816C0()
{
  return MEMORY[0x24BEE0D10];
}

uint64_t sub_2383816CC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 8 * a1 + 32;
    v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      type metadata accessor for MOUserSafetyScannableServices(0);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_238386B08();
  __break(1u);
  return result;
}

uint64_t sub_2383817D0(uint64_t a1, uint64_t a2, _QWORD **a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t result;
  void **i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v5 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x24BEE4AF8];
  if (v5)
  {
    v13 = MEMORY[0x24BEE4AF8];
    sub_238386A60();
    for (i = (void **)(a1 + 32); ; ++i)
    {
      v11 = *i;
      v10 = v11;
      sub_23837BACC(&v11, a2, a3, &v12);

      if (v3)
        break;
      sub_238386A48();
      sub_238386A6C();
      sub_238386A78();
      sub_238386A54();
      if (!--v5)
        return v13;
    }
    return swift_release();
  }
  return result;
}

void sub_2383818CC(unint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v6;
  id v7;
  int64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  id v18;
  unint64_t v19;
  int64_t v20;
  char *v21;
  int64_t v22;
  _QWORD *v23;
  uint64_t v25;
  id v26[6];
  uint64_t v27;

  v4 = v3;
  v6 = a1;
  v27 = MEMORY[0x24BEE4AF8];
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_2383869DC();
    sub_238381F8C(0, (unint64_t *)&unk_2542CBC78);
    sub_238381DB4();
    sub_238386964();
    v6 = (unint64_t)v26[1];
    v23 = v26[2];
    v7 = v26[3];
    v8 = (int64_t)v26[4];
    v9 = (unint64_t)v26[5];
  }
  else
  {
    v10 = -1 << *(_BYTE *)(a1 + 32);
    v23 = (_QWORD *)(a1 + 56);
    v11 = ~v10;
    v12 = -v10;
    if (v12 < 64)
      v13 = ~(-1 << v12);
    else
      v13 = -1;
    v9 = v13 & *(_QWORD *)(a1 + 56);
    swift_bridgeObjectRetain();
    v7 = (id)v11;
    v8 = 0;
  }
  v22 = ((unint64_t)v7 + 64) >> 6;
  while ((v6 & 0x8000000000000000) != 0)
  {
    v17 = sub_2383869E8();
    if (!v17)
      goto LABEL_39;
    v25 = v17;
    sub_238381F8C(0, (unint64_t *)&unk_2542CBC78);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v18 = v26[0];
    swift_unknownObjectRelease();
    v16 = v8;
    v14 = v9;
    if (!v18)
      goto LABEL_39;
LABEL_28:
    v26[0] = v18;
    sub_23837BF70(v26, a2, a3, &v25);

    if (v4)
    {
      sub_238381F84();
      swift_bridgeObjectRelease();
      return;
    }
    if (v25)
    {
      MEMORY[0x23B831BA4]();
      if (*(_QWORD *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_238386910();
      sub_238386928();
      sub_238386904();
    }
    v8 = v16;
    v9 = v14;
  }
  if (v9)
  {
    v14 = (v9 - 1) & v9;
    v15 = __clz(__rbit64(v9)) | (v8 << 6);
    v16 = v8;
LABEL_27:
    v18 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v15);
    if (!v18)
      goto LABEL_39;
    goto LABEL_28;
  }
  v16 = v8 + 1;
  if (!__OFADD__(v8, 1))
  {
    if (v16 >= v22)
      goto LABEL_39;
    v19 = v23[v16];
    if (!v19)
    {
      v20 = v8 + 2;
      if (v8 + 2 >= v22)
        goto LABEL_39;
      v19 = v23[v20];
      if (v19)
        goto LABEL_25;
      v20 = v8 + 3;
      if (v8 + 3 >= v22)
        goto LABEL_39;
      v19 = v23[v20];
      if (v19)
        goto LABEL_25;
      v20 = v8 + 4;
      if (v8 + 4 >= v22)
        goto LABEL_39;
      v19 = v23[v20];
      if (v19)
      {
LABEL_25:
        v16 = v20;
      }
      else
      {
        v16 = v8 + 5;
        if (v8 + 5 >= v22)
          goto LABEL_39;
        v19 = v23[v16];
        if (!v19)
        {
          v21 = (char *)(v8 + 6);
          while ((char *)v22 != v21)
          {
            v19 = v23[(_QWORD)v21++];
            if (v19)
            {
              v16 = (int64_t)(v21 - 1);
              goto LABEL_26;
            }
          }
LABEL_39:
          sub_238381F84();
          return;
        }
      }
    }
LABEL_26:
    v14 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v16 << 6);
    goto LABEL_27;
  }
  __break(1u);
}

id sub_238381C3C(uint64_t a1, uint64_t a2)
{
  id *v4;
  id v5;
  id v6;

  if (a1 == 0xD000000000000013 && a2 == 0x8000000238389290 || (sub_238386B2C() & 1) != 0)
  {
    v4 = (id *)MEMORY[0x24BE63EF8];
  }
  else if (a1 == 0xD00000000000001BLL && a2 == 0x80000002383892B0 || (sub_238386B2C() & 1) != 0)
  {
    v4 = (id *)MEMORY[0x24BE63EF0];
  }
  else if (a1 == 0xD000000000000019 && a2 == 0x8000000238389270 || (sub_238386B2C() & 1) != 0)
  {
    v4 = (id *)MEMORY[0x24BE63F00];
  }
  else
  {
    if ((a1 != 0xD000000000000012 || a2 != 0x80000002383895E0) && (sub_238386B2C() & 1) == 0)
      return 0;
    v4 = (id *)MEMORY[0x24BE63F08];
  }
  v5 = *v4;
  v6 = *v4;
  return v5;
}

unint64_t sub_238381DB4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2542CBC88;
  if (!qword_2542CBC88)
  {
    v1 = sub_238381F8C(255, (unint64_t *)&unk_2542CBC78);
    result = MEMORY[0x23B832168](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_2542CBC88);
  }
  return result;
}

uint64_t sub_238381E0C()
{
  return swift_deallocObject();
}

unint64_t sub_238381E1C()
{
  uint64_t v0;

  return sub_23837D2F4(*(_BYTE *)(v0 + 16));
}

uint64_t sub_238381E2C@<X0>(_BYTE *a1@<X8>)
{
  return sub_23837888C(a1);
}

uint64_t sub_238381E50()
{
  return sub_238378928();
}

uint64_t sub_238381E7C@<X0>(_BYTE *a1@<X8>)
{
  return sub_23837888C(a1);
}

uint64_t sub_238381EA4(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_release();
  return result;
}

unint64_t sub_238381EB0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2568FCEE0;
  if (!qword_2568FCEE0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568FCED8);
    v2[0] = sub_238381F1C();
    v2[1] = sub_238378470();
    result = MEMORY[0x23B832168](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2568FCEE0);
  }
  return result;
}

unint64_t sub_238381F1C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2568FCCB0;
  if (!qword_2568FCCB0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_2568FCEF0);
    v2[0] = sub_238378470();
    v2[1] = v2[0];
    result = MEMORY[0x23B832168](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2568FCCB0);
  }
  return result;
}

uint64_t sub_238381F84()
{
  return swift_release();
}

uint64_t sub_238381F8C(uint64_t a1, unint64_t *a2)
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

void sub_238381FC8(char a1)
{
  uint64_t v1;

  sub_23837D910(*(void **)(v1 + 24), a1);
}

uint64_t sub_238381FF0@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_238386658();
  *a1 = v3;
  return result;
}

uint64_t sub_238382018()
{
  return sub_238386664();
}

uint64_t objectdestroy_25Tm()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

void sub_23838206C(int a1)
{
  uint64_t v1;

  sub_23837D400(*(void **)(v1 + 24), a1);
}

ValueMetadata *type metadata accessor for AnalyticsSection()
{
  return &type metadata for AnalyticsSection;
}

uint64_t *sub_2383820AC(uint64_t *a1, uint64_t *a2)
{
  int v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_DWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2568FCBE0) - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v6 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v6 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v5 = sub_238386718();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a1, a2, v5);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_238382174(uint64_t a1)
{
  uint64_t v2;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FCBE0);
  if (swift_getEnumCaseMultiPayload() != 1)
    return swift_release();
  v2 = sub_238386718();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

_QWORD *sub_2383821D8(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FCBE0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_238386718();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

_QWORD *sub_238382274(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  if (a1 != a2)
  {
    sub_238378534((uint64_t)a1, &qword_2568FCBE0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568FCBE0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v4 = sub_238386718();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_238382328(void *a1, const void *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FCBE0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v5 = sub_238386718();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a1, a2, v5);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
  }
  return a1;
}

void *sub_2383823C0(void *a1, const void *a2)
{
  uint64_t v4;
  uint64_t v5;

  if (a1 != a2)
  {
    sub_238378534((uint64_t)a1, &qword_2568FCBE0);
    v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FCBE0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v5 = sub_238386718();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a1, a2, v5);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_238382470()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23838247C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_2568FCF28);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t sub_2383824BC()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2383824C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_2568FCF28);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for SafetyResourcesSection(uint64_t a1)
{
  return sub_23838156C(a1, (uint64_t *)&unk_2568FCF88);
}

void sub_238382520()
{
  unint64_t v0;

  sub_238382588();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_238382588()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2568FCF98[0])
  {
    sub_238386718();
    v0 = sub_2383865BC();
    if (!v1)
      atomic_store(v0, qword_2568FCF98);
  }
}

uint64_t initializeBufferWithCopyOfBuffer for NudityDetectionToggleSection(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for NudityDetectionToggleSection()
{
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for NudityDetectionToggleSection(uint64_t a1, uint64_t a2)
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
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for NudityDetectionToggleSection(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
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

uint64_t assignWithTake for NudityDetectionToggleSection(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for NudityDetectionToggleSection(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for NudityDetectionToggleSection(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for NudityDetectionToggleSection()
{
  return &type metadata for NudityDetectionToggleSection;
}

uint64_t sub_23838281C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23838282C()
{
  id v0;

  sub_2383866DC();
  if (qword_2542CBCE0 != -1)
    swift_once();
  swift_beginAccess();
  v0 = (id)qword_2542CB6A0;
  sub_23838673C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FCFE0);
  sub_2383772F0(&qword_2568FCFE8, &qword_2568FCFE0, MEMORY[0x24BDF43B0]);
  return sub_2383867FC();
}

uint64_t sub_238382978(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v2 = type metadata accessor for SafetyResourcesSection(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  sub_2383853EC(a1, (uint64_t)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for SafetyResourcesSection);
  v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v6 = swift_allocObject();
  sub_238384A5C((uint64_t)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v6 + v5, type metadata accessor for SafetyResourcesSection);
  return sub_2383867A8();
}

uint64_t sub_238382A5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = sub_238386718();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_238384078((uint64_t)v3);
  sub_23838670C();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

void sub_238382AE8(void *a1)
{
  id v2;

  if (a1)
  {
    v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE853F0]), sel_init);
    objc_msgSend(a1, sel_presentViewController_animated_completion_, v2, 1, 0);

  }
}

uint64_t sub_238382B50@<X0>(uint64_t a1@<X8>)
{
  return sub_238382F44(a1);
}

uint64_t sub_238382B70(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  _BYTE *v9;
  id v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  id *v14;
  void *v15;
  _BYTE v17[16];
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;

  v4 = type metadata accessor for ImproveNudityDetectionExplainerText(0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (uint64_t *)&v17[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v5);
  v9 = &v17[-v8];
  v18 = a1;
  v19 = a2;
  sub_2383866DC();
  if (qword_2542CBCE0 != -1)
    swift_once();
  swift_beginAccess();
  v10 = (id)qword_2542CB6A0;
  v20 = sub_23838673C();
  v21 = v11;
  v22 = v12 & 1;
  v23 = v13;
  *v7 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FCBE0);
  swift_storeEnumTagMultiPayload();
  v14 = (id *)((char *)v7 + *(int *)(v4 + 20));
  *v14 = sub_238383020();
  v14[1] = v15;
  sub_238384A5C((uint64_t)v7, (uint64_t)v9, type metadata accessor for ImproveNudityDetectionExplainerText);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FCFC8);
  sub_2383772F0(&qword_2568FCFD0, &qword_2568FCFC8, MEMORY[0x24BDF46D0]);
  sub_238375D70(&qword_2568FCFD8, type metadata accessor for ImproveNudityDetectionExplainerText, (uint64_t)&unk_238387CCC);
  return sub_2383867F0();
}

uint64_t sub_238382DAC()
{
  type metadata accessor for NudityDetectionRootModel(0);
  sub_238375D70(&qword_2568FCAC8, type metadata accessor for NudityDetectionRootModel, (uint64_t)&protocol conformance descriptor for NudityDetectionRootModel);
  sub_238386628();
  swift_getKeyPath();
  sub_238386640();
  swift_release();
  swift_release();
  return sub_2383867B4();
}

uint64_t sub_238382E88@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_238386598();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

void sub_238382F04()
{
  sub_2383798DC();
}

uint64_t sub_238382F28@<X0>(uint64_t a1@<X8>)
{
  return sub_238382F44(a1);
}

uint64_t sub_238382F44@<X0>(uint64_t a1@<X8>)
{
  id v2;
  uint64_t result;
  uint64_t v4;
  char v5;
  uint64_t v6;

  sub_2383866DC();
  if (qword_2542CBCE0 != -1)
    swift_once();
  swift_beginAccess();
  v2 = (id)qword_2542CB6A0;
  result = sub_23838673C();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5 & 1;
  *(_QWORD *)(a1 + 24) = v6;
  return result;
}

uint64_t sub_238383018()
{
  uint64_t *v0;

  return sub_238382B70(*v0, v0[1]);
}

id sub_238383020()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void *v4;
  id v5;
  id result;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17[3];

  v0 = sub_238386574();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v17[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = (void *)sub_238386880();
  v5 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v4);

  if (!v5)
    goto LABEL_6;
  result = objc_msgSend((id)objc_opt_self(), sel_flowWithBundle_, v5);
  if (result)
  {
    v7 = result;
    v8 = objc_msgSend(result, sel_localizedButtonTitle);

    if (v8)
    {
      v9 = sub_2383868A4();

LABEL_11:
      return (id)v9;
    }

LABEL_6:
    sub_238386568();
    v10 = sub_23838655C();
    v11 = sub_238386970();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      v13 = swift_slowAlloc();
      v17[0] = v13;
      *(_DWORD *)v12 = 136315138;
      v16 = sub_2383842F4(0xD00000000000001FLL, 0x8000000238389860, v17);
      sub_2383869AC();
      _os_log_impl(&dword_238373000, v10, v11, "We couldn't find our bundle for %s, falling back to placeholder text", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B832204](v13, -1, -1);
      MEMORY[0x23B832204](v12, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    if (qword_2542CBCE0 != -1)
      swift_once();
    swift_beginAccess();
    v14 = (id)qword_2542CB6A0;
    v15 = (void *)sub_238386880();
    v5 = objc_msgSend(v14, sel_localizedStringForKey_value_table_, v15, 0, 0);

    v9 = sub_2383868A4();
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

uint64_t sub_238383338@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;
  uint64_t KeyPath;
  unint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v30 = a2;
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FD0E0);
  MEMORY[0x24BDAC7A8](v31);
  v4 = (uint64_t *)((char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = type metadata accessor for ImproveNudityDetectionExplainerText(0);
  v28 = *(_QWORD *)(v5 - 8);
  v6 = *(_QWORD *)(v28 + 64);
  MEMORY[0x24BDAC7A8](v5);
  v7 = sub_2383865EC();
  v32 = *(_QWORD *)(v7 - 8);
  v33 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v29 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_2383866D0();
  MEMORY[0x24BDAC7A8](v9);
  sub_2383866C4();
  sub_2383866B8();
  v10 = a1;
  sub_2383866AC();
  sub_2383866B8();
  sub_2383866E8();
  if (qword_2542CBCE0 != -1)
    swift_once();
  swift_beginAccess();
  v11 = (id)qword_2542CB6A0;
  v12 = sub_23838673C();
  v14 = v13;
  v16 = v15;
  v18 = v17 & 1;
  KeyPath = swift_getKeyPath();
  sub_2383853EC(v10, (uint64_t)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for ImproveNudityDetectionExplainerText);
  v20 = (*(unsigned __int8 *)(v28 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80);
  v21 = swift_allocObject();
  sub_238384A5C((uint64_t)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v21 + v20, type metadata accessor for ImproveNudityDetectionExplainerText);
  v22 = v29;
  sub_2383865E0();
  v23 = v32;
  v24 = v33;
  (*(void (**)(char *, char *, uint64_t))(v32 + 16))((char *)v4 + *(int *)(v31 + 28), v22, v33);
  *v4 = KeyPath;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FD0E8);
  v26 = v30;
  sub_2383784F0((uint64_t)v4, v30 + *(int *)(v25 + 36), &qword_2568FD0E0);
  *(_QWORD *)v26 = v12;
  *(_QWORD *)(v26 + 8) = v14;
  *(_BYTE *)(v26 + 16) = v18;
  *(_QWORD *)(v26 + 24) = v16;
  sub_238385534(v12, v14, v18);
  swift_bridgeObjectRetain();
  sub_238378534((uint64_t)v4, &qword_2568FD0E0);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v22, v24);
  sub_238385544(v12, v14, v18);
  return swift_bridgeObjectRelease();
}

uint64_t sub_238383694(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_2383865EC();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_238386688();
}

void sub_238383710()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;

  v0 = sub_238386718();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_238386574();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (void *)sub_238386880();
  v9 = objc_msgSend((id)objc_opt_self(), sel_presenterForPrivacySplashWithIdentifier_, v8);

  if (v9)
  {
    v10 = v9;
    v11 = sub_238384078((uint64_t)v3);
    MEMORY[0x24BDAC7A8](v11);
    *(&v15 - 2) = (uint64_t)v10;
    sub_23838670C();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    sub_2383865D4();

  }
  else
  {
    sub_238386568();
    v12 = sub_23838655C();
    v13 = sub_238386970();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_238373000, v12, v13, "Failed to create privacyPresenter for com.apple.onboarding.improvescw", v14, 2u);
      MEMORY[0x23B832204](v14, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    sub_2383865C8();
  }
}

void sub_238383934(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  NSObject *v8;
  uint64_t v9;
  uint8_t *v10;
  uint64_t v11;
  id v12;

  v4 = sub_238386574();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v12 = a1;
    objc_msgSend(a2, sel_setPresentingViewController_, v12);
    objc_msgSend(a2, sel_present);

  }
  else
  {
    sub_238386568();
    v8 = sub_23838655C();
    v9 = sub_238386970();
    if (os_log_type_enabled(v8, (os_log_type_t)v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_238373000, v8, (os_log_type_t)v9, "Failed to get hosting controller", v10, 2u);
      MEMORY[0x23B832204](v10, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_238383A94@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  *(_QWORD *)a1 = sub_2383866F4();
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FD0D8);
  return sub_238383338(v1, a1 + *(int *)(v3 + 44));
}

uint64_t sub_238383ADC(uint64_t *a1)
{
  uint64_t v2;

  v2 = *a1;
  sub_238384B18((uint64_t)&v2);
  swift_retain();
  sub_238386808();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FD008);
  sub_2383867CC();
  swift_release();
  sub_238384B40((uint64_t)&v2);
  swift_release();
  sub_238384B68();
  return sub_2383867B4();
}

uint64_t sub_238383BA8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FCFF0);
  sub_2383772F0(&qword_2568FCFF8, &qword_2568FCFF0, MEMORY[0x24BDF46D0]);
  sub_238384AD4();
  return sub_2383867FC();
}

uint64_t sub_238383C48()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_238383C58()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t type metadata accessor for ImproveNudityDetectionExplainerText(uint64_t a1)
{
  return sub_23838156C(a1, qword_2568FD070);
}

uint64_t sub_238383C7C()
{
  return sub_238382DAC();
}

uint64_t sub_238383C84@<X0>(uint64_t a1@<X8>)
{
  id v2;
  uint64_t result;
  uint64_t v4;
  char v5;
  uint64_t v6;

  sub_2383866DC();
  if (qword_2542CBCE0 != -1)
    swift_once();
  swift_beginAccess();
  v2 = (id)qword_2542CB6A0;
  result = sub_23838673C();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5 & 1;
  *(_QWORD *)(a1 + 24) = v6;
  return result;
}

uint64_t sub_238383D70@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
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
  char *v13;
  id v14;
  id v15;
  uint64_t result;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;

  v2 = sub_238386538();
  MEMORY[0x24BDAC7A8](v2);
  v23 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_2383864E4();
  v21 = *(_QWORD *)(v4 - 8);
  v22 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_238386874();
  MEMORY[0x24BDAC7A8](v7);
  v8 = sub_23838685C();
  MEMORY[0x24BDAC7A8](v8);
  v9 = sub_2383864F0();
  MEMORY[0x24BDAC7A8](v9);
  v10 = sub_238386520();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = objc_msgSend((id)objc_opt_self(), sel_learnMoreAboutSensitiveContentWarningURL);
  sub_238386514();

  sub_238386508();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  sub_238386850();
  sub_238386844();
  sub_238386838();
  swift_bridgeObjectRelease();
  sub_238386844();
  sub_238386868();
  if (qword_2542CBCE0 != -1)
    swift_once();
  swift_beginAccess();
  v15 = objc_msgSend((id)qword_2542CB6A0, sel_bundleURL);
  sub_238386514();

  (*(void (**)(char *, _QWORD, uint64_t))(v21 + 104))(v6, *MEMORY[0x24BDCD330], v22);
  sub_23838652C();
  sub_2383864FC();
  result = sub_238386748();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v17;
  *(_BYTE *)(a1 + 16) = v18 & 1;
  *(_QWORD *)(a1 + 24) = v19;
  return result;
}

uint64_t sub_238384078@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  os_log_type_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[3];
  uint64_t v20;

  v2 = v1;
  v4 = sub_2383866A0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FCBE0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2383784F0(v2, (uint64_t)v10, &qword_2568FCBE0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v11 = sub_238386718();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    v13 = sub_23838697C();
    v14 = sub_238386724();
    v15 = v13;
    if (os_log_type_enabled(v14, v13))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      v17 = swift_slowAlloc();
      v19[1] = a1;
      v18 = v17;
      v20 = v17;
      *(_DWORD *)v16 = 136315138;
      v19[2] = sub_2383842F4(0xD000000000000022, 0x8000000238389B50, &v20);
      sub_2383869AC();
      _os_log_impl(&dword_238373000, v14, v15, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B832204](v18, -1, -1);
      MEMORY[0x23B832204](v16, -1, -1);
    }

    sub_238386694();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_2383842B4()
{
  return sub_238386670();
}

uint64_t sub_2383842D4()
{
  return sub_238386670();
}

uint64_t sub_2383842F4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2383843C4(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_238384954((uint64_t)v12, *a3);
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
      sub_238384954((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_2383843C4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2383869B8();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_23838457C(a5, a6);
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
  v8 = sub_238386A3C();
  if (!v8)
  {
    sub_238386AC0();
    __break(1u);
LABEL_17:
    result = sub_238386B08();
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

uint64_t sub_23838457C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_238384610(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2383847E8(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_2383847E8(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_238384610(uint64_t a1, unint64_t a2)
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
      v3 = sub_238384784(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_238386A18();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_238386AC0();
      __break(1u);
LABEL_10:
      v2 = sub_2383868E0();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_238386B08();
    __break(1u);
LABEL_14:
    result = sub_238386AC0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_238384784(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542CBD10);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2383847E8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542CBD10);
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
  result = sub_238386B08();
  __break(1u);
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_238384954(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_238384994()
{
  sub_2383798DC();
}

uint64_t sub_2383849B8()
{
  uint64_t v0;

  return sub_238382978(*(_QWORD *)(v0 + 16));
}

uint64_t sub_2383849C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for SafetyResourcesSection(0) - 8) + 80);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FCBE0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v2 = sub_238386718();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v0 + ((v1 + 16) & ~v1), v2);
  }
  else
  {
    swift_release();
  }
  return swift_deallocObject();
}

uint64_t sub_238384A5C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_238384AA0()
{
  type metadata accessor for SafetyResourcesSection(0);
  return sub_238382A5C();
}

uint64_t sub_238384ACC()
{
  uint64_t v0;

  return sub_238383ADC(*(uint64_t **)(v0 + 16));
}

unint64_t sub_238384AD4()
{
  unint64_t result;

  result = qword_2568FD000;
  if (!qword_2568FD000)
  {
    result = MEMORY[0x23B832168](&unk_238387C7C, &type metadata for NudityDetectionToggleText);
    atomic_store(result, (unint64_t *)&qword_2568FD000);
  }
  return result;
}

uint64_t sub_238384B18(uint64_t a1)
{
  swift_retain();
  return a1;
}

uint64_t sub_238384B40(uint64_t a1)
{
  swift_release();
  return a1;
}

unint64_t sub_238384B68()
{
  unint64_t result;

  result = qword_2568FD010;
  if (!qword_2568FD010)
  {
    result = MEMORY[0x23B832168](&unk_238387C2C, &type metadata for NudityDetectionToggleLabel);
    atomic_store(result, (unint64_t *)&qword_2568FD010);
  }
  return result;
}

uint64_t *sub_238384BAC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568FCBE0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_238386718();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v9 = *(int *)(a3 + 20);
    v10 = (uint64_t *)((char *)a1 + v9);
    v11 = (uint64_t *)((char *)a2 + v9);
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_238384C90(uint64_t a1)
{
  uint64_t v2;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FCBE0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v2 = sub_238386718();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  }
  else
  {
    swift_release();
  }
  return swift_bridgeObjectRelease();
}

_QWORD *sub_238384D04(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FCBE0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_238386718();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)((char *)a1 + v7);
  v9 = (_QWORD *)((char *)a2 + v7);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *sub_238384DBC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;

  if (a1 != a2)
  {
    sub_238378534((uint64_t)a1, &qword_2568FCBE0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568FCBE0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_238386718();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)((char *)a1 + v7);
  v9 = (_QWORD *)((char *)a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *sub_238384EA0(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FCBE0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_238386718();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  *(_OWORD *)&a1[*(int *)(a3 + 20)] = *(_OWORD *)&a2[*(int *)(a3 + 20)];
  return a1;
}

char *sub_238384F48(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  if (a1 != a2)
  {
    sub_238378534((uint64_t)a1, &qword_2568FCBE0);
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568FCBE0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_238386718();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  v8 = *(int *)(a3 + 20);
  v9 = &a1[v8];
  v10 = &a2[v8];
  v12 = *(_QWORD *)v10;
  v11 = *((_QWORD *)v10 + 1);
  *(_QWORD *)v9 = v12;
  *((_QWORD *)v9 + 1) = v11;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_238385018()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_238385024(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_2568FCF28);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_2383850A8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2383850B4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = __swift_instantiateConcreteTypeFromMangledName(qword_2568FCF28);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  return result;
}

void sub_238385134()
{
  unint64_t v0;

  sub_238382588();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

ValueMetadata *type metadata accessor for NudityDetectionToggleText()
{
  return &type metadata for NudityDetectionToggleText;
}

ValueMetadata *type metadata accessor for NudityDetectionToggleLabel()
{
  return &type metadata for NudityDetectionToggleLabel;
}

unint64_t sub_2383851C8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[3];

  result = qword_2568FD0A8;
  if (!qword_2568FD0A8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568FD0B0);
    v2 = sub_2383772F0(&qword_2568FCFD0, &qword_2568FCFC8, MEMORY[0x24BDF46D0]);
    v3 = sub_238375D70(&qword_2568FCFD8, type metadata accessor for ImproveNudityDetectionExplainerText, (uint64_t)&unk_238387CCC);
    v4[0] = MEMORY[0x24BDF1F80];
    v4[1] = v2;
    v4[2] = v3;
    result = MEMORY[0x23B832168](MEMORY[0x24BDF4AF8], v1, v4);
    atomic_store(result, (unint64_t *)&qword_2568FD0A8);
  }
  return result;
}

unint64_t sub_238385274()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[3];

  result = qword_2568FD0B8;
  if (!qword_2568FD0B8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568FD0C0);
    v2 = sub_2383772F0(&qword_2568FCFE8, &qword_2568FCFE0, MEMORY[0x24BDF43B0]);
    v3[0] = MEMORY[0x24BDF5138];
    v3[1] = v2;
    v3[2] = MEMORY[0x24BDF1F80];
    result = MEMORY[0x23B832168](MEMORY[0x24BDF4AF8], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2568FD0B8);
  }
  return result;
}

unint64_t sub_238385308()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[3];

  result = qword_2568FD0C8;
  if (!qword_2568FD0C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568FD0D0);
    v2 = sub_2383772F0(&qword_2568FCFF8, &qword_2568FCFF0, MEMORY[0x24BDF46D0]);
    v3 = sub_238384AD4();
    v4[0] = MEMORY[0x24BDF5138];
    v4[1] = v2;
    v4[2] = v3;
    result = MEMORY[0x23B832168](MEMORY[0x24BDF4AF8], v1, v4);
    atomic_store(result, (unint64_t *)&qword_2568FD0C8);
  }
  return result;
}

uint64_t sub_238385398()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2383853A8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2383853B8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2383853C8()
{
  return sub_23838667C();
}

uint64_t sub_2383853EC(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_238385430()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for ImproveNudityDetectionExplainerText(0) - 8) + 80);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568FCBE0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v2 = sub_238386718();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v0 + ((v1 + 16) & ~v1), v2);
  }
  else
  {
    swift_release();
  }
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_2383854E8()
{
  type metadata accessor for ImproveNudityDetectionExplainerText(0);
  sub_238383710();
}

uint64_t sub_238385534(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_238385544(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

void sub_238385554(void *a1)
{
  uint64_t v1;

  sub_238383934(a1, *(void **)(v1 + 16));
}

uint64_t sub_23838555C()
{
  return sub_2383772F0(&qword_2568FD0F0, &qword_2568FD0F8, MEMORY[0x24BDF4700]);
}

uint64_t sub_238385588()
{
  return MEMORY[0x24BDF1F80];
}

void sub_238385594()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x24BDBCF50]);
  v1 = (void *)sub_238386880();
  v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  if (v2)
    qword_2542CC0A8 = (uint64_t)v2;
  else
    __break(1u);
}

id sub_2383857E0(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  void *v3;

  a3();
  v3 = (void *)sub_238386880();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_238385920()
{
  return 1;
}

uint64_t sub_238385928()
{
  sub_238386B44();
  sub_238386B50();
  return sub_238386B5C();
}

uint64_t sub_238385968()
{
  return sub_238386B50();
}

uint64_t sub_23838598C()
{
  sub_238386B44();
  sub_238386B50();
  return sub_238386B5C();
}

const char *sub_2383859C8()
{
  return "CommunicationSafetySettingsUI";
}

const char *sub_2383859DC()
{
  return "Enabled";
}

NudityDetectionPreferencesHelper __swiftcall NudityDetectionPreferencesHelper.init()()
{
  return (NudityDetectionPreferencesHelper)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

id NudityDetectionPreferencesHelper.init()()
{
  objc_super v1;

  v1.super_class = (Class)NudityDetectionPreferencesHelper;
  return objc_msgSendSuper2(&v1, sel_init);
}

unint64_t type metadata accessor for NudityDetectionPreferencesHelper()
{
  unint64_t result;

  result = qword_2568FD100;
  if (!qword_2568FD100)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2568FD100);
  }
  return result;
}

unint64_t sub_238385B04()
{
  unint64_t result;

  result = qword_2542CBCD8;
  if (!qword_2542CBCD8)
  {
    result = MEMORY[0x23B832168](&unk_238387DEC, &_s5FlagsON);
    atomic_store(result, (unint64_t *)&qword_2542CBCD8);
  }
  return result;
}

BOOL sub_238385B48()
{
  void *v0;
  id v1;
  id v2;
  id v3;

  if (qword_2542CB858 != -1)
    swift_once();
  swift_beginAccess();
  v0 = *(void **)(qword_2542CB850
                + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_effectiveStore);
  swift_retain();
  v1 = objc_msgSend(v0, sel_userSafety);
  v2 = objc_msgSend(v1, sel_scanningPolicy);

  if (v2)
  {
    v3 = objc_msgSend(v2, sel_policy);
    swift_release();

    return v3 != (id)2;
  }
  else
  {
    swift_release();
    return 1;
  }
}

uint64_t sub_238385C44()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;

  if (qword_2542CB858 != -1)
    swift_once();
  swift_beginAccess();
  v0 = *(void **)(qword_2542CB850
                + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_effectiveStore);
  swift_retain();
  v1 = objc_msgSend(v0, sel_userSafety);
  v2 = objc_msgSend(v1, sel_scanningPolicy);

  if (v2)
  {
    v3 = objc_msgSend(v2, sel_policy);
    swift_release();

    if (v3)
    {
      if (qword_2542CBCE0 == -1)
        goto LABEL_9;
      goto LABEL_10;
    }
  }
  else
  {
    swift_release();
  }
  if (qword_2542CBCE0 != -1)
LABEL_10:
    swift_once();
LABEL_9:
  swift_beginAccess();
  v4 = (id)qword_2542CB6A0;
  v5 = (void *)sub_238386880();
  v6 = objc_msgSend(v4, sel_localizedStringForKey_value_table_, v5, 0, 0);

  v7 = sub_2383868A4();
  return v7;
}

uint64_t sub_238385E3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v14;

  v0 = sub_238386538();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_238386874();
  MEMORY[0x24BDAC7A8](v1);
  v2 = sub_23838685C();
  MEMORY[0x24BDAC7A8](v2);
  v3 = sub_238386520();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (objc_msgSend((id)objc_opt_self(), sel_nudityDetectionRowEnabled))
  {
    v7 = objc_msgSend((id)objc_opt_self(), sel_learnMoreAboutSensitiveContentWarningURL);
    sub_238386514();

    sub_238386508();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    sub_238386850();
    sub_238386844();
    sub_238386838();
    swift_bridgeObjectRelease();
    sub_238386844();
    sub_238386868();
    if (qword_2542CBCE0 != -1)
      swift_once();
    swift_beginAccess();
    v8 = (id)qword_2542CB6A0;
    sub_23838652C();
    return sub_2383868B0();
  }
  else
  {
    if (qword_2542CBCE0 != -1)
      swift_once();
    swift_beginAccess();
    v10 = (id)qword_2542CB6A0;
    v11 = (void *)sub_238386880();
    v12 = objc_msgSend(v10, sel_localizedStringForKey_value_table_, v11, 0, 0);

    v9 = sub_2383868A4();
  }
  return v9;
}

uint64_t sub_238386158(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  id v6;
  id v7;
  char v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;

  if (qword_2542CB858 != -1)
    swift_once();
  swift_beginAccess();
  v4 = *(void **)(qword_2542CB850
                + OBJC_IVAR____TtC29CommunicationSafetySettingsUI24NudityDetectionRootModel_effectiveStore);
  swift_retain();
  v5 = objc_msgSend(v4, sel_userSafety);
  v6 = objc_msgSend(v5, sel_scanningPolicy);

  if (v6)
  {
    v7 = objc_msgSend(v6, sel_policy);
    swift_release();

    if (v7)
    {
      swift_retain();
      v8 = sub_23837E258(a1, a2);
      swift_release();
      if ((v8 & 1) != 0)
      {
        if (qword_2542CBCE0 == -1)
          goto LABEL_10;
        goto LABEL_11;
      }
    }
  }
  else
  {
    swift_release();
  }
  if (qword_2542CBCE0 != -1)
LABEL_11:
    swift_once();
LABEL_10:
  swift_beginAccess();
  v9 = (id)qword_2542CB6A0;
  v10 = (void *)sub_238386880();
  v11 = objc_msgSend(v9, sel_localizedStringForKey_value_table_, v10, 0, 0);

  v12 = sub_2383868A4();
  return v12;
}

uint64_t _s5FlagsOwet(unsigned int *a1, int a2)
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

uint64_t _s5FlagsOwst(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_238386428 + 4 * byte_238387D50[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_238386448 + 4 * byte_238387D55[v4]))();
}

_BYTE *sub_238386428(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_238386448(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_238386450(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_238386458(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_238386460(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_238386468(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_238386474()
{
  return 0;
}

ValueMetadata *_s5FlagsOMa()
{
  return &_s5FlagsON;
}

unint64_t sub_238386490()
{
  unint64_t result;

  result = qword_2568FD108;
  if (!qword_2568FD108)
  {
    result = MEMORY[0x23B832168](&unk_238387DC4, &_s5FlagsON);
    atomic_store(result, (unint64_t *)&qword_2568FD108);
  }
  return result;
}

uint64_t sub_2383864D8()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_2383864E4()
{
  return MEMORY[0x24BDCD340]();
}

uint64_t sub_2383864F0()
{
  return MEMORY[0x24BDCD380]();
}

uint64_t sub_2383864FC()
{
  return MEMORY[0x24BDCD3B0]();
}

uint64_t sub_238386508()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_238386514()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_238386520()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_23838652C()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_238386538()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_238386544()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t sub_238386550()
{
  return MEMORY[0x24BEC6500]();
}

uint64_t sub_23838655C()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_238386568()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_238386574()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_238386580()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_23838658C()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t sub_238386598()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_2383865A4()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_2383865B0()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t sub_2383865BC()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t sub_2383865C8()
{
  return MEMORY[0x24BDEC2A0]();
}

uint64_t sub_2383865D4()
{
  return MEMORY[0x24BDEC2B8]();
}

uint64_t sub_2383865E0()
{
  return MEMORY[0x24BDEC2C8]();
}

uint64_t sub_2383865EC()
{
  return MEMORY[0x24BDEC2E0]();
}

uint64_t sub_2383865F8()
{
  return MEMORY[0x24BDEC998]();
}

uint64_t sub_238386604()
{
  return MEMORY[0x24BDEC9A0]();
}

uint64_t sub_238386610()
{
  return MEMORY[0x24BDEC9B0]();
}

uint64_t sub_23838661C()
{
  return MEMORY[0x24BDED668]();
}

uint64_t sub_238386628()
{
  return MEMORY[0x24BDEDE40]();
}

uint64_t sub_238386634()
{
  return MEMORY[0x24BDEDE50]();
}

uint64_t sub_238386640()
{
  return MEMORY[0x24BDEDE58]();
}

uint64_t sub_23838664C()
{
  return MEMORY[0x24BDEDE60]();
}

uint64_t sub_238386658()
{
  return MEMORY[0x24BDEDF68]();
}

uint64_t sub_238386664()
{
  return MEMORY[0x24BDEDF70]();
}

uint64_t sub_238386670()
{
  return MEMORY[0x24BDEE318]();
}

uint64_t sub_23838667C()
{
  return MEMORY[0x24BDEE400]();
}

uint64_t sub_238386688()
{
  return MEMORY[0x24BDEE410]();
}

uint64_t sub_238386694()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_2383866A0()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_2383866AC()
{
  return MEMORY[0x24BDEEA18]();
}

uint64_t sub_2383866B8()
{
  return MEMORY[0x24BDEEA28]();
}

uint64_t sub_2383866C4()
{
  return MEMORY[0x24BDEEA30]();
}

uint64_t sub_2383866D0()
{
  return MEMORY[0x24BDEEA40]();
}

uint64_t sub_2383866DC()
{
  return MEMORY[0x24BDEEA50]();
}

uint64_t sub_2383866E8()
{
  return MEMORY[0x24BDEEA60]();
}

uint64_t sub_2383866F4()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_238386700()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_23838670C()
{
  return MEMORY[0x24BDF1308]();
}

uint64_t sub_238386718()
{
  return MEMORY[0x24BDF1310]();
}

uint64_t sub_238386724()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_238386730()
{
  return MEMORY[0x24BDF1960]();
}

uint64_t sub_23838673C()
{
  return MEMORY[0x24BDF1FC0]();
}

uint64_t sub_238386748()
{
  return MEMORY[0x24BDF1FE0]();
}

uint64_t sub_238386754()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_238386760()
{
  return MEMORY[0x24BE85518]();
}

uint64_t sub_23838676C()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_238386778()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_238386784()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_238386790()
{
  return MEMORY[0x24BDF3A10]();
}

uint64_t sub_23838679C()
{
  return MEMORY[0x24BDF4150]();
}

uint64_t sub_2383867A8()
{
  return MEMORY[0x24BDF4340]();
}

uint64_t sub_2383867B4()
{
  return MEMORY[0x24BDF4678]();
}

uint64_t sub_2383867C0()
{
  return MEMORY[0x24BDF4790]();
}

uint64_t sub_2383867CC()
{
  return MEMORY[0x24BDF4810]();
}

uint64_t sub_2383867D8()
{
  return MEMORY[0x24BDF49A0]();
}

uint64_t sub_2383867E4()
{
  return MEMORY[0x24BDF4AA0]();
}

uint64_t sub_2383867F0()
{
  return MEMORY[0x24BDF4AB8]();
}

uint64_t sub_2383867FC()
{
  return MEMORY[0x24BDF4AD8]();
}

uint64_t sub_238386808()
{
  return MEMORY[0x24BDF4FE0]();
}

uint64_t sub_238386814()
{
  return MEMORY[0x24BDF5170]();
}

uint64_t sub_238386820()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_23838682C()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_238386838()
{
  return MEMORY[0x24BDCF910]();
}

uint64_t sub_238386844()
{
  return MEMORY[0x24BDCF930]();
}

uint64_t sub_238386850()
{
  return MEMORY[0x24BDCF938]();
}

uint64_t sub_23838685C()
{
  return MEMORY[0x24BDCF948]();
}

uint64_t sub_238386868()
{
  return MEMORY[0x24BDCF968]();
}

uint64_t sub_238386874()
{
  return MEMORY[0x24BDCF978]();
}

uint64_t sub_238386880()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23838688C()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_238386898()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_2383868A4()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2383868B0()
{
  return MEMORY[0x24BDCFB20]();
}

uint64_t sub_2383868BC()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_2383868C8()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2383868D4()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2383868E0()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2383868EC()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_2383868F8()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_238386904()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_238386910()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_23838691C()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_238386928()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_238386934()
{
  return MEMORY[0x24BDCFC08]();
}

uint64_t sub_238386940()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_23838694C()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_238386958()
{
  return MEMORY[0x24BEE1598]();
}

uint64_t sub_238386964()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_238386970()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23838697C()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_238386988()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_238386994()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_2383869A0()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_2383869AC()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2383869B8()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2383869C4()
{
  return MEMORY[0x24BDD05A0]();
}

uint64_t sub_2383869D0()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_2383869DC()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_2383869E8()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_2383869F4()
{
  return MEMORY[0x24BEE2360]();
}

uint64_t sub_238386A00()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_238386A0C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_238386A18()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_238386A24()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_238386A30()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_238386A3C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_238386A48()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_238386A54()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_238386A60()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_238386A6C()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_238386A78()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_238386A84()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_238386A90()
{
  return MEMORY[0x24BEE2EA8]();
}

uint64_t sub_238386A9C()
{
  return MEMORY[0x24BEE2EE0]();
}

uint64_t sub_238386AA8()
{
  return MEMORY[0x24BEE2F08]();
}

uint64_t sub_238386AB4()
{
  return MEMORY[0x24BEE2F18]();
}

uint64_t sub_238386AC0()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_238386ACC()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_238386AD8()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_238386AE4()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_238386AF0()
{
  return MEMORY[0x24BEE3090]();
}

uint64_t sub_238386AFC()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_238386B08()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_238386B14()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_238386B20()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_238386B2C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_238386B38()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_238386B44()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_238386B50()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_238386B5C()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
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

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
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

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x24BEE4CE8]();
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

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
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

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
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

