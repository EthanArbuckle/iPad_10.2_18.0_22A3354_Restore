uint64_t dispatch thunk of TabBarItemProtocol.allowsPinnedPlacement.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of TabBarItemProtocol.identifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of TabBarItemProtocol.systemImageName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of TabBarItemProtocol.title(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_23BC9AE78(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_23BC9AE98(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGSize(uint64_t a1)
{
  sub_23BC9B43C(a1, &qword_256A94948);
}

uint64_t sub_23BC9AED4(uint64_t a1, uint64_t a2)
{
  return sub_23BC9AF9C(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_23BC9AEE0()
{
  sub_23BCD8164();
  sub_23BCD817C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23BC9AF20()
{
  uint64_t v0;

  sub_23BCD8164();
  sub_23BCD85C0();
  sub_23BCD817C();
  v0 = sub_23BCD85F0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_23BC9AF90(uint64_t a1, uint64_t a2)
{
  return sub_23BC9AF9C(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_23BC9AF9C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_23BCD8164();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_23BC9AFD8(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_23BCD814C();
  *a2 = 0;
  return result;
}

uint64_t sub_23BC9B04C(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_23BCD8158();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_23BC9B0C8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_23BCD8164();
  v2 = sub_23BCD8140();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_23BC9B108()
{
  return sub_23BCD8290();
}

uint64_t sub_23BC9B110(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  char v4;
  int v5;
  int v6;
  char v7;

  v6 = 0;
  v7 = 1;
  result = MEMORY[0x24260F7C4](a1, &v6);
  v4 = v7;
  v5 = v6;
  if (v7)
    v5 = 0;
  *(_DWORD *)a2 = v5;
  *(_BYTE *)(a2 + 4) = v4;
  return result;
}

uint64_t sub_23BC9B160(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;
  int v5;
  int v7;
  char v8;

  v7 = 0;
  v8 = 1;
  v3 = MEMORY[0x24260F7D0](a1, &v7);
  v4 = v8;
  v5 = v7;
  if (v8)
    v5 = 0;
  *(_DWORD *)a2 = v5;
  *(_BYTE *)(a2 + 4) = v4;
  return v3 & 1;
}

void sub_23BC9B1B4(float *a1@<X8>)
{
  *a1 = MEMORY[0x24260F7DC]();
}

uint64_t sub_23BC9B1D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_23BCD8164();
  v2 = v1;
  if (v0 == sub_23BCD8164() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_23BCD85A8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_23BC9B260@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_23BCD8140();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_23BC9B2A4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_23BCD8164();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_23BC9B2CC()
{
  sub_23BC9B4D8((unint64_t *)&qword_256A94998, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_23BCD9308);
  sub_23BC9B4D8(&qword_256A949A0, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_23BCD925C);
  return sub_23BCD84DC();
}

_DWORD *sub_23BC9B350@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(_BYTE *)(a2 + 4) = 0;
  return result;
}

float sub_23BC9B360@<S0>(_DWORD *a1@<X8>)
{
  float *v1;
  float result;

  result = *v1;
  *a1 = *(_DWORD *)v1;
  return result;
}

uint64_t sub_23BC9B36C()
{
  sub_23BC9B4D8(&qword_256A949A8, (uint64_t (*)(uint64_t))type metadata accessor for UILayoutPriority, (uint64_t)&unk_23BCD9158);
  sub_23BC9B4D8((unint64_t *)&unk_256A949B0, (uint64_t (*)(uint64_t))type metadata accessor for UILayoutPriority, (uint64_t)&unk_23BCD90F8);
  return sub_23BCD84DC();
}

void type metadata accessor for CGColor(uint64_t a1)
{
  sub_23BC9B43C(a1, &qword_256A94950);
}

void type metadata accessor for Key(uint64_t a1)
{
  sub_23BC9B43C(a1, &qword_256A94958);
}

void type metadata accessor for UILayoutPriority(uint64_t a1)
{
  sub_23BC9B43C(a1, &qword_256A94960);
}

void sub_23BC9B43C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_23BC9B480()
{
  return sub_23BC9B4D8(&qword_256A94968, (uint64_t (*)(uint64_t))type metadata accessor for UILayoutPriority, (uint64_t)&unk_23BCD90BC);
}

uint64_t sub_23BC9B4AC()
{
  return sub_23BC9B4D8(&qword_256A94970, (uint64_t (*)(uint64_t))type metadata accessor for UILayoutPriority, (uint64_t)&unk_23BCD9090);
}

uint64_t sub_23BC9B4D8(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x24260FFB0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23BC9B518()
{
  return sub_23BCD82C0();
}

uint64_t sub_23BC9B520()
{
  return sub_23BCD85E4();
}

void sub_23BC9B550()
{
  JUMPOUT(0x24260FADCLL);
}

BOOL sub_23BC9B564(float *a1, float *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23BC9B578()
{
  return sub_23BC9B4D8(&qword_256A94978, (uint64_t (*)(uint64_t))type metadata accessor for UILayoutPriority, (uint64_t)&unk_23BCD912C);
}

uint64_t sub_23BC9B5A4()
{
  return sub_23BC9B4D8(&qword_256A94980, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_23BCD9220);
}

uint64_t sub_23BC9B5D0()
{
  return sub_23BC9B4D8(&qword_256A94988, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_23BCD91F4);
}

uint64_t sub_23BC9B5FC()
{
  return sub_23BC9B4D8(&qword_256A94990, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_23BCD9290);
}

BOOL sub_23BC9B628(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23BC9B63C()
{
  sub_23BCD85C0();
  sub_23BCD85CC();
  return sub_23BCD85F0();
}

uint64_t sub_23BC9B680()
{
  return sub_23BCD85CC();
}

uint64_t sub_23BC9B6A8()
{
  sub_23BCD85C0();
  sub_23BCD85CC();
  return sub_23BCD85F0();
}

uint64_t sub_23BC9B6E8()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x656E676953746F6ELL;
  if (*v0 == 1)
    v1 = 0x6E4964656E676973;
  if (*v0)
    return v1;
  else
    return 0x6E4964656E676973;
}

uint64_t sub_23BC9B748@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23BC9C868(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23BC9B76C()
{
  return 0;
}

void sub_23BC9B778(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_23BC9B784()
{
  sub_23BC9BEB8();
  return sub_23BCD8614();
}

uint64_t sub_23BC9B7AC()
{
  sub_23BC9BEB8();
  return sub_23BCD8620();
}

uint64_t sub_23BC9B7D4()
{
  return 0;
}

uint64_t sub_23BC9B7E0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

void sub_23BC9B80C(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_23BC9B818()
{
  sub_23BC9BF40();
  return sub_23BCD8614();
}

uint64_t sub_23BC9B840()
{
  sub_23BC9BF40();
  return sub_23BCD8620();
}

uint64_t sub_23BC9B868()
{
  return 1;
}

uint64_t sub_23BC9B878()
{
  return 12383;
}

uint64_t sub_23BC9B888()
{
  sub_23BC9BF84();
  return sub_23BCD8614();
}

uint64_t sub_23BC9B8B0()
{
  sub_23BC9BF84();
  return sub_23BCD8620();
}

uint64_t sub_23BC9B8D8()
{
  sub_23BCD85C0();
  sub_23BCD85CC();
  return sub_23BCD85F0();
}

uint64_t sub_23BC9B918()
{
  return sub_23BCD85CC();
}

uint64_t sub_23BC9B93C()
{
  sub_23BCD85C0();
  sub_23BCD85CC();
  return sub_23BCD85F0();
}

uint64_t sub_23BC9B978@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
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
    v5 = sub_23BCD85A8();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_23BC9B9F4()
{
  sub_23BC9BFC8();
  return sub_23BCD8614();
}

uint64_t sub_23BC9BA1C()
{
  sub_23BC9BFC8();
  return sub_23BCD8620();
}

uint64_t AccountState.encode(to:)(_QWORD *a1)
{
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
  char *v14;
  int EnumCaseMultiPayload;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  char v41;
  char v42;

  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A94A20);
  v31 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34);
  v28 = (char *)&v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A94A28);
  v32 = *(_QWORD *)(v35 - 8);
  MEMORY[0x24BDAC7A8](v35);
  v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A94A30);
  v5 = *(_QWORD *)(v36 - 8);
  MEMORY[0x24BDAC7A8](v36);
  v30 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = sub_23BCD793C();
  v29 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for AccountState();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A94A38);
  v38 = *(_QWORD *)(v12 - 8);
  v39 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23BC9BEB8();
  sub_23BCD8608();
  sub_23BC9BEFC(v37, (uint64_t)v11);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      v41 = 1;
      sub_23BC9BF84();
      v16 = v39;
      sub_23BCD8554();
      v17 = v35;
      sub_23BCD8560();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v32 + 8))(v4, v17);
      return (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v14, v16);
    }
    else
    {
      v42 = 2;
      sub_23BC9BF40();
      v25 = v28;
      v26 = v39;
      sub_23BCD8554();
      (*(void (**)(char *, uint64_t))(v31 + 8))(v25, v34);
      return (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v14, v26);
    }
  }
  else
  {
    v19 = v29;
    v20 = v11;
    v21 = v33;
    (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v8, v20, v33);
    v40 = 0;
    sub_23BC9BFC8();
    v22 = v30;
    v23 = v39;
    sub_23BCD8554();
    sub_23BC9B4D8(&qword_256A94A60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCCC10], MEMORY[0x24BDCCC20]);
    v24 = v36;
    sub_23BCD8584();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v22, v24);
    (*(void (**)(char *, uint64_t))(v19 + 8))(v8, v21);
    return (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v14, v23);
  }
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24260FF98]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for AccountState()
{
  uint64_t result;

  result = qword_256A94B18;
  if (!qword_256A94B18)
    return swift_getSingletonMetadata();
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_23BC9BEB8()
{
  unint64_t result;

  result = qword_256A94A40;
  if (!qword_256A94A40)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCD9830, &type metadata for AccountState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A94A40);
  }
  return result;
}

uint64_t sub_23BC9BEFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AccountState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_23BC9BF40()
{
  unint64_t result;

  result = qword_256A94A48;
  if (!qword_256A94A48)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCD97E0, &type metadata for AccountState.NotSignedInCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A94A48);
  }
  return result;
}

unint64_t sub_23BC9BF84()
{
  unint64_t result;

  result = qword_256A94A50;
  if (!qword_256A94A50)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCD9790, &type metadata for AccountState.SignedInAsGuestCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A94A50);
  }
  return result;
}

unint64_t sub_23BC9BFC8()
{
  unint64_t result;

  result = qword_256A94A58;
  if (!qword_256A94A58)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCD9740, &type metadata for AccountState.SignedInCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A94A58);
  }
  return result;
}

uint64_t AccountState.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  char *v36;
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
  uint64_t *v47;
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  _QWORD *v62;
  uint64_t v63;
  char v64;
  char v65;
  char v66;

  v61 = a2;
  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A94A68);
  v51 = *(_QWORD *)(v54 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v60 = (char *)&v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A94A70);
  v55 = *(_QWORD *)(v53 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v56 = (char *)&v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A94A78);
  v50 = *(_QWORD *)(v52 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v58 = (char *)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A94A80);
  v57 = *(_QWORD *)(v59 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v7 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for AccountState();
  v9 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v11 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v46 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v46 - v15;
  v17 = a1[3];
  v62 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v17);
  sub_23BC9BEB8();
  v18 = v7;
  v19 = v63;
  sub_23BCD85FC();
  if (v19)
    goto LABEL_7;
  v47 = (uint64_t *)v11;
  v48 = v14;
  v21 = v58;
  v20 = v59;
  v49 = v16;
  v63 = v8;
  v23 = v60;
  v22 = v61;
  v24 = v18;
  v25 = sub_23BCD853C();
  v26 = v20;
  if (*(_QWORD *)(v25 + 16) != 1)
  {
    v29 = sub_23BCD8458();
    swift_allocError();
    v31 = v30;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A94A88);
    *v31 = v63;
    sub_23BCD8500();
    sub_23BCD844C();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v29 - 8) + 104))(v31, *MEMORY[0x24BEE26D0], v29);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v57 + 8))(v24, v26);
LABEL_7:
    v32 = (uint64_t)v62;
    return __swift_destroy_boxed_opaque_existential_1(v32);
  }
  if (*(_BYTE *)(v25 + 32))
  {
    if (*(_BYTE *)(v25 + 32) == 1)
    {
      v65 = 1;
      sub_23BC9BF84();
      v27 = v56;
      v28 = v24;
      sub_23BCD84F4();
      v34 = v53;
      v35 = sub_23BCD850C();
      v36 = v27;
      v37 = v57;
      v41 = v35;
      v43 = v42;
      (*(void (**)(char *, uint64_t))(v55 + 8))(v36, v34);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v37 + 8))(v28, v26);
      v44 = (uint64_t)v47;
      *v47 = v41;
      *(_QWORD *)(v44 + 8) = v43;
      swift_storeEnumTagMultiPayload();
      v45 = (uint64_t)v49;
      sub_23BC9C5E0(v44, (uint64_t)v49);
    }
    else
    {
      v66 = 2;
      sub_23BC9BF40();
      sub_23BCD84F4();
      (*(void (**)(char *, uint64_t))(v51 + 8))(v23, v54);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v57 + 8))(v24, v20);
      v45 = (uint64_t)v49;
      swift_storeEnumTagMultiPayload();
    }
    v32 = (uint64_t)v62;
    v38 = v22;
  }
  else
  {
    v64 = 0;
    sub_23BC9BFC8();
    sub_23BCD84F4();
    v38 = v22;
    sub_23BCD793C();
    sub_23BC9B4D8(&qword_256A94A90, (uint64_t (*)(uint64_t))MEMORY[0x24BDCCC10], MEMORY[0x24BDCCC38]);
    v39 = (uint64_t)v48;
    v40 = v52;
    sub_23BCD8530();
    (*(void (**)(char *, uint64_t))(v50 + 8))(v21, v40);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v57 + 8))(v24, v20);
    v32 = (uint64_t)v62;
    swift_storeEnumTagMultiPayload();
    v45 = (uint64_t)v49;
    sub_23BC9C5E0(v39, (uint64_t)v49);
  }
  sub_23BC9C5E0(v45, v38);
  return __swift_destroy_boxed_opaque_existential_1(v32);
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

uint64_t sub_23BC9C5E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AccountState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23BC9C624@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return AccountState.init(from:)(a1, a2);
}

uint64_t sub_23BC9C638(_QWORD *a1)
{
  return AccountState.encode(to:)(a1);
}

uint64_t AccountState.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int EnumCaseMultiPayload;
  uint64_t v10;

  v1 = sub_23BCD793C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for AccountState();
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23BC9BEFC(v0, (uint64_t)v7);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      sub_23BCD85CC();
      sub_23BCD817C();
      return swift_bridgeObjectRelease();
    }
    else
    {
      return sub_23BCD85CC();
    }
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v4, v7, v1);
    sub_23BCD85CC();
    sub_23BC9B4D8(&qword_256A94A98, (uint64_t (*)(uint64_t))MEMORY[0x24BDCCC10], MEMORY[0x24BDCCC28]);
    sub_23BCD8110();
    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
}

uint64_t AccountState.hashValue.getter()
{
  sub_23BCD85C0();
  AccountState.hash(into:)();
  return sub_23BCD85F0();
}

uint64_t sub_23BC9C7EC()
{
  sub_23BCD85C0();
  AccountState.hash(into:)();
  return sub_23BCD85F0();
}

uint64_t sub_23BC9C82C()
{
  sub_23BCD85C0();
  AccountState.hash(into:)();
  return sub_23BCD85F0();
}

uint64_t sub_23BC9C868(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6E4964656E676973 && a2 == 0xE800000000000000;
  if (v2 || (sub_23BCD85A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E4964656E676973 && a2 == 0xEF74736575477341 || (sub_23BCD85A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x656E676953746F6ELL && a2 == 0xEB000000006E4964)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_23BCD85A8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t _s14FitnessAppRoot12AccountStateO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  int EnumCaseMultiPayload;
  uint64_t v20;
  uint64_t v21;
  char v23;
  char v24;
  void (*v25)(char *, uint64_t);
  uint64_t v27;

  v4 = sub_23BCD793C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for AccountState();
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (uint64_t *)((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v27 - v12;
  v14 = __swift_instantiateConcreteTypeFromMangledName(qword_256A94BA8);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = &v17[*(int *)(v15 + 48)];
  sub_23BC9BEFC(a1, (uint64_t)v17);
  sub_23BC9BEFC(a2, (uint64_t)v18);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (!EnumCaseMultiPayload)
  {
    sub_23BC9BEFC((uint64_t)v17, (uint64_t)v13);
    if (!swift_getEnumCaseMultiPayload())
    {
      (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v18, v4);
      v24 = sub_23BCD7924();
      v25 = *(void (**)(char *, uint64_t))(v5 + 8);
      v25(v7, v4);
      v25(v13, v4);
      sub_23BC9CF40((uint64_t)v17);
      return v24 & 1;
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v13, v4);
    goto LABEL_15;
  }
  if (EnumCaseMultiPayload != 1)
  {
    if (swift_getEnumCaseMultiPayload() == 2)
      goto LABEL_19;
LABEL_15:
    sub_23BC9D6E8((uint64_t)v17);
    goto LABEL_16;
  }
  sub_23BC9BEFC((uint64_t)v17, (uint64_t)v11);
  v21 = *v11;
  v20 = v11[1];
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  if (v21 == *(_QWORD *)v18 && v20 == *((_QWORD *)v18 + 1))
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_19;
  }
  v23 = sub_23BCD85A8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v23 & 1) != 0)
  {
LABEL_19:
    sub_23BC9CF40((uint64_t)v17);
    v24 = 1;
    return v24 & 1;
  }
  sub_23BC9CF40((uint64_t)v17);
LABEL_16:
  v24 = 0;
  return v24 & 1;
}

uint64_t sub_23BC9CC64()
{
  return sub_23BC9B4D8(&qword_256A94AA0, (uint64_t (*)(uint64_t))type metadata accessor for AccountState, (uint64_t)&protocol conformance descriptor for AccountState);
}

uint64_t *initializeBufferWithCopyOfBuffer for AccountState(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

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
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      v10 = a2[1];
      *a1 = *a2;
      a1[1] = v10;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      v8 = sub_23BCD793C();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t destroy for AccountState(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 1)
    return swift_bridgeObjectRelease();
  if (!(_DWORD)result)
  {
    v3 = sub_23BCD793C();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  }
  return result;
}

_QWORD *initializeWithCopy for AccountState(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    v8 = a2[1];
    *a1 = *a2;
    a1[1] = v8;
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v7 = sub_23BCD793C();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_QWORD *assignWithCopy for AccountState(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;

  if (a1 != a2)
  {
    sub_23BC9CF40((uint64_t)a1);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v7 = sub_23BCD793C();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_23BC9CF40(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for AccountState();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *initializeWithTake for AccountState(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v6 = sub_23BCD793C();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *assignWithTake for AccountState(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_23BC9CF40((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v6 = sub_23BCD793C();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for AccountState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for AccountState(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_23BC9D0BC()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_23BC9D0CC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23BCD793C();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AccountState.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AccountState.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23BC9D220 + 4 * byte_23BCD9355[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23BC9D254 + 4 * byte_23BCD9350[v4]))();
}

uint64_t sub_23BC9D254(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BC9D25C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23BC9D264);
  return result;
}

uint64_t sub_23BC9D270(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23BC9D278);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23BC9D27C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BC9D284(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BC9D290(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23BC9D298(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AccountState.CodingKeys()
{
  return &type metadata for AccountState.CodingKeys;
}

uint64_t sub_23BC9D2BC()
{
  return 0;
}

ValueMetadata *type metadata accessor for AccountState.SignedInCodingKeys()
{
  return &type metadata for AccountState.SignedInCodingKeys;
}

uint64_t getEnumTagSinglePayload for SignOutAction.UpdateAccountStateCodingKeys(unsigned int *a1, int a2)
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

uint64_t _s14FitnessAppRoot12AccountStateO18SignedInCodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23BC9D364 + 4 * byte_23BCD935A[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23BC9D384 + 4 * byte_23BCD935F[v4]))();
}

_BYTE *sub_23BC9D364(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23BC9D384(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23BC9D38C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23BC9D394(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23BC9D39C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23BC9D3A4(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for AccountState.SignedInAsGuestCodingKeys()
{
  return &type metadata for AccountState.SignedInAsGuestCodingKeys;
}

ValueMetadata *type metadata accessor for AccountState.NotSignedInCodingKeys()
{
  return &type metadata for AccountState.NotSignedInCodingKeys;
}

unint64_t sub_23BC9D3D4()
{
  unint64_t result;

  result = qword_256A94B50;
  if (!qword_256A94B50)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCD95A8, &type metadata for AccountState.SignedInAsGuestCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A94B50);
  }
  return result;
}

unint64_t sub_23BC9D41C()
{
  unint64_t result;

  result = qword_256A94B58;
  if (!qword_256A94B58)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCD9660, &type metadata for AccountState.SignedInCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A94B58);
  }
  return result;
}

unint64_t sub_23BC9D464()
{
  unint64_t result;

  result = qword_256A94B60;
  if (!qword_256A94B60)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCD9718, &type metadata for AccountState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A94B60);
  }
  return result;
}

unint64_t sub_23BC9D4AC()
{
  unint64_t result;

  result = qword_256A94B68;
  if (!qword_256A94B68)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCD95D0, &type metadata for AccountState.SignedInCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A94B68);
  }
  return result;
}

unint64_t sub_23BC9D4F4()
{
  unint64_t result;

  result = qword_256A94B70;
  if (!qword_256A94B70)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCD95F8, &type metadata for AccountState.SignedInCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A94B70);
  }
  return result;
}

unint64_t sub_23BC9D53C()
{
  unint64_t result;

  result = qword_256A94B78;
  if (!qword_256A94B78)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCD9518, &type metadata for AccountState.SignedInAsGuestCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A94B78);
  }
  return result;
}

unint64_t sub_23BC9D584()
{
  unint64_t result;

  result = qword_256A94B80;
  if (!qword_256A94B80)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCD9540, &type metadata for AccountState.SignedInAsGuestCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A94B80);
  }
  return result;
}

unint64_t sub_23BC9D5CC()
{
  unint64_t result;

  result = qword_256A94B88;
  if (!qword_256A94B88)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCD94C8, &type metadata for AccountState.NotSignedInCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A94B88);
  }
  return result;
}

unint64_t sub_23BC9D614()
{
  unint64_t result;

  result = qword_256A94B90;
  if (!qword_256A94B90)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCD94F0, &type metadata for AccountState.NotSignedInCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A94B90);
  }
  return result;
}

unint64_t sub_23BC9D65C()
{
  unint64_t result;

  result = qword_256A94B98;
  if (!qword_256A94B98)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCD9688, &type metadata for AccountState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A94B98);
  }
  return result;
}

unint64_t sub_23BC9D6A4()
{
  unint64_t result;

  result = qword_256A94BA0;
  if (!qword_256A94BA0)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCD96B0, &type metadata for AccountState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A94BA0);
  }
  return result;
}

uint64_t sub_23BC9D6E8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(qword_256A94BA8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t SidebarState.selectedIndex.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t SidebarState.selectedIndex.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 8) = result;
  return result;
}

uint64_t (*SidebarState.selectedIndex.modify())()
{
  return nullsub_1;
}

uint64_t SidebarState.isSidebarVisible.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t SidebarState.isSidebarVisible.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 16) = result;
  return result;
}

uint64_t (*SidebarState.isSidebarVisible.modify())()
{
  return nullsub_1;
}

uint64_t SidebarState.init(items:selectedIndex:isSidebarVisible:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  *(_QWORD *)a4 = result;
  *(_QWORD *)(a4 + 8) = a2;
  *(_BYTE *)(a4 + 16) = a3;
  return result;
}

BOOL sub_23BC9D778(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_23BC9D788()
{
  return sub_23BCD85CC();
}

uint64_t sub_23BC9D7AC(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x736D657469 && a2 == 0xE500000000000000;
  if (v2 || (sub_23BCD85A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x64657463656C6573 && a2 == 0xED00007865646E49 || (sub_23BCD85A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000023BCE5730)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_23BCD85A8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_23BC9D918()
{
  sub_23BCD85C0();
  sub_23BCD85CC();
  return sub_23BCD85F0();
}

uint64_t sub_23BC9D95C(char a1)
{
  if (!a1)
    return 0x736D657469;
  if (a1 == 1)
    return 0x64657463656C6573;
  return 0xD000000000000010;
}

BOOL sub_23BC9D9C0(char *a1, char *a2)
{
  return sub_23BC9D778(*a1, *a2);
}

uint64_t sub_23BC9D9D4()
{
  return sub_23BC9D918();
}

uint64_t sub_23BC9D9E0()
{
  return sub_23BC9D788();
}

uint64_t sub_23BC9D9EC()
{
  sub_23BCD85C0();
  sub_23BC9D788();
  return sub_23BCD85F0();
}

uint64_t sub_23BC9DA30()
{
  char *v0;

  return sub_23BC9D95C(*v0);
}

uint64_t sub_23BC9DA3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23BC9D7AC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23BC9DA68@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23BC9E204();
  *a1 = result;
  return result;
}

uint64_t sub_23BC9DA90(uint64_t a1)
{
  MEMORY[0x24260FFB0](&unk_23BCD9A30, a1);
  return sub_23BCD8614();
}

uint64_t sub_23BC9DAC4(uint64_t a1)
{
  MEMORY[0x24260FFB0](&unk_23BCD9A30, a1);
  return sub_23BCD8620();
}

uint64_t SidebarState.encode(to:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  _DWORD v16[2];
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;

  v6 = *(_QWORD *)(a2 + 24);
  v19 = *(_QWORD *)(a2 + 16);
  v20 = v6;
  v7 = type metadata accessor for SidebarState.CodingKeys(255, v19, v6, a4);
  MEMORY[0x24260FFB0](&unk_23BCD9A30, v7);
  v8 = sub_23BCD8590();
  v18 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v16 - v9;
  v11 = *v4;
  v17 = v4[1];
  v16[1] = *((unsigned __int8 *)v4 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23BCD8608();
  v24 = v11;
  v23 = 0;
  v12 = sub_23BCD8200();
  v22 = *(_QWORD *)(v20 + 16);
  MEMORY[0x24260FFB0](MEMORY[0x24BEE12A0], v12, &v22);
  v13 = v21;
  sub_23BCD8584();
  if (v13)
    return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v10, v8);
  v15 = v18;
  LOBYTE(v24) = 1;
  sub_23BCD8578();
  LOBYTE(v24) = 2;
  sub_23BCD856C();
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v10, v8);
}

uint64_t type metadata accessor for SidebarState.CodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SidebarState.CodingKeys);
}

uint64_t SidebarState.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;

  v19 = a5;
  v20 = a3;
  v7 = type metadata accessor for SidebarState.CodingKeys(255, a2, a3, a4);
  MEMORY[0x24260FFB0](&unk_23BCD9A30, v7);
  v21 = sub_23BCD8548();
  v8 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v10 = (char *)&v18 - v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23BCD85FC();
  if (v5)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v11 = v19;
  v12 = sub_23BCD8200();
  v23 = 0;
  v22 = *(_QWORD *)(v20 + 8);
  MEMORY[0x24260FFB0](MEMORY[0x24BEE12D0], v12, &v22);
  v13 = v21;
  sub_23BCD8530();
  v14 = v24;
  LOBYTE(v24) = 1;
  swift_bridgeObjectRetain();
  v20 = sub_23BCD8524();
  LOBYTE(v24) = 2;
  v16 = sub_23BCD8518();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v13);
  v17 = v20;
  *(_QWORD *)v11 = v14;
  *(_QWORD *)(v11 + 8) = v17;
  *(_BYTE *)(v11 + 16) = v16 & 1;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23BC9DEF0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  return SidebarState.init(from:)(a1, *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24), a3, a4);
}

uint64_t sub_23BC9DF0C(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return SidebarState.encode(to:)(a1, a2, a3, a4);
}

uint64_t static SidebarState.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  int v5;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(unsigned __int8 *)(a1 + 16);
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(unsigned __int8 *)(a2 + 16);
  return sub_23BCD8218() & (v2 == v4) & (v3 ^ v5 ^ 1);
}

uint64_t sub_23BC9DF7C(uint64_t a1, uint64_t a2)
{
  return static SidebarState.== infix(_:_:)(a1, a2);
}

uint64_t sub_23BC9DF88()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_23BC9DF94()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23BC9DF9C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_23BC9DFD0(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
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

uint64_t sub_23BC9E038(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t sub_23BC9E07C(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 17))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_23BC9E0C4(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 17) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t type metadata accessor for SidebarState(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SidebarState);
}

uint64_t sub_23BC9E110()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_23BC9E118(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23BC9E164 + 4 * byte_23BCD988D[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23BC9E198 + 4 * byte_23BCD9888[v4]))();
}

uint64_t sub_23BC9E198(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BC9E1A0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23BC9E1A8);
  return result;
}

uint64_t sub_23BC9E1B4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23BC9E1BCLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23BC9E1C0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BC9E1C8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void sub_23BC9E1D4()
{
  JUMPOUT(0x24260FFB0);
}

void sub_23BC9E1E4()
{
  JUMPOUT(0x24260FFB0);
}

void sub_23BC9E1F4()
{
  JUMPOUT(0x24260FFB0);
}

uint64_t sub_23BC9E204()
{
  return 3;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x24260FF2C](a1, v6, a5);
}

uint64_t static Color.keyTint.getter()
{
  return sub_23BC9E270(0.650980392, 1.0, 0.0);
}

uint64_t static Color.meditationTeal.getter()
{
  return sub_23BC9E270(0.419607843, 0.984313725, 0.97254902);
}

uint64_t sub_23BC9E270(double a1, double a2, double a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;

  v6 = sub_23BCD7EA0();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD))(v9 + 104))(v8, *MEMORY[0x24BDF3C28]);
  return MEMORY[0x24260F410](v8, a1, a2, a3, 1.0);
}

uint64_t static ShapeStyle<>.keyTint.getter()
{
  return sub_23BC9E270(0.650980392, 1.0, 0.0);
}

uint64_t static ShapeStyle<>.meditationTeal.getter()
{
  return sub_23BC9E270(0.419607843, 0.984313725, 0.97254902);
}

uint64_t DynamicContentState.init(locale:networkConditions:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t result;

  v6 = sub_23BCD7984();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a3, a1, v6);
  result = type metadata accessor for DynamicContentState();
  *(_BYTE *)(a3 + *(int *)(result + 20)) = a2;
  return result;
}

uint64_t type metadata accessor for DynamicContentState()
{
  uint64_t result;

  result = qword_256A94D40;
  if (!qword_256A94D40)
    return swift_getSingletonMetadata();
  return result;
}

BOOL sub_23BC9E3E0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_23BC9E3F8()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000011;
  else
    return 0x656C61636F6CLL;
}

uint64_t sub_23BC9E434@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23BC9F0C8(a1, a2);
  *a3 = result;
  return result;
}

void sub_23BC9E458(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_23BC9E464()
{
  sub_23BC9E614();
  return sub_23BCD8614();
}

uint64_t sub_23BC9E48C()
{
  sub_23BC9E614();
  return sub_23BCD8620();
}

uint64_t DynamicContentState.encode(to:)(_QWORD *a1)
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
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A94CB0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23BC9E614();
  sub_23BCD8608();
  v10[15] = 0;
  sub_23BCD7984();
  sub_23BC9E91C(&qword_256A94CC0, MEMORY[0x24BDCEEC8]);
  sub_23BCD8584();
  if (!v2)
  {
    v10[14] = *(_BYTE *)(v3 + *(int *)(type metadata accessor for DynamicContentState() + 20));
    v10[13] = 1;
    sub_23BC9E658();
    sub_23BCD8584();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_23BC9E614()
{
  unint64_t result;

  result = qword_256A94CB8;
  if (!qword_256A94CB8)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCD9C34, &type metadata for DynamicContentState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A94CB8);
  }
  return result;
}

unint64_t sub_23BC9E658()
{
  unint64_t result;

  result = qword_256A94CC8;
  if (!qword_256A94CC8)
  {
    result = MEMORY[0x24260FFB0](&protocol conformance descriptor for NetworkConditions, &type metadata for NetworkConditions);
    atomic_store(result, (unint64_t *)&qword_256A94CC8);
  }
  return result;
}

uint64_t DynamicContentState.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
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
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  char v27;

  v20 = a2;
  v24 = sub_23BCD7984();
  v21 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v22 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A94CD0);
  v5 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DynamicContentState();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23BC9E614();
  sub_23BCD85FC();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v18 = a1;
  v19 = v5;
  v11 = (uint64_t)v10;
  v12 = v21;
  v27 = 0;
  sub_23BC9E91C(&qword_256A94CD8, MEMORY[0x24BDCEEE8]);
  v14 = v22;
  v13 = v23;
  v15 = v24;
  sub_23BCD8530();
  (*(void (**)(uint64_t, char *, uint64_t))(v12 + 32))(v11, v14, v15);
  v25 = 1;
  sub_23BC9E95C();
  sub_23BCD8530();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v7, v13);
  *(_BYTE *)(v11 + *(int *)(v8 + 20)) = v26;
  sub_23BC9E9A0(v11, v20);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  return sub_23BC9E9E4(v11);
}

uint64_t sub_23BC9E91C(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_23BCD7984();
    result = MEMORY[0x24260FFB0](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23BC9E95C()
{
  unint64_t result;

  result = qword_256A94CE0;
  if (!qword_256A94CE0)
  {
    result = MEMORY[0x24260FFB0](&protocol conformance descriptor for NetworkConditions, &type metadata for NetworkConditions);
    atomic_store(result, (unint64_t *)&qword_256A94CE0);
  }
  return result;
}

uint64_t sub_23BC9E9A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for DynamicContentState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23BC9E9E4(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for DynamicContentState();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23BC9EA20@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return DynamicContentState.init(from:)(a1, a2);
}

uint64_t sub_23BC9EA34(_QWORD *a1)
{
  return DynamicContentState.encode(to:)(a1);
}

BOOL static DynamicContentState.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if ((MEMORY[0x24260EEA0]() & 1) == 0)
    return 0;
  v4 = type metadata accessor for DynamicContentState();
  return *(unsigned __int8 *)(a1 + *(int *)(v4 + 20)) == *(unsigned __int8 *)(a2 + *(int *)(v4 + 20));
}

BOOL sub_23BC9EA94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (MEMORY[0x24260EEA0]() & 1) != 0
      && *(unsigned __int8 *)(a1 + *(int *)(a3 + 20)) == *(unsigned __int8 *)(a2 + *(int *)(a3 + 20));
}

_QWORD *initializeBufferWithCopyOfBuffer for DynamicContentState(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23BCD7984();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t destroy for DynamicContentState(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23BCD7984();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for DynamicContentState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_23BCD7984();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithCopy for DynamicContentState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_23BCD7984();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t initializeWithTake for DynamicContentState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_23BCD7984();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for DynamicContentState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_23BCD7984();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t getEnumTagSinglePayload for DynamicContentState()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23BC9ED1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v9;

  v6 = sub_23BCD7984();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 3)
    return v9 - 2;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for DynamicContentState()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23BC9EDA0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_23BCD7984();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_BYTE *)(a1 + *(int *)(a4 + 20)) = a2 + 2;
  return result;
}

uint64_t sub_23BC9EE18()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23BCD7984();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for DynamicContentState.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for DynamicContentState.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23BC9EF64 + 4 * byte_23BCD9AB5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23BC9EF98 + 4 * byte_23BCD9AB0[v4]))();
}

uint64_t sub_23BC9EF98(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BC9EFA0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23BC9EFA8);
  return result;
}

uint64_t sub_23BC9EFB4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23BC9EFBCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23BC9EFC0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BC9EFC8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_23BC9EFD4(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for DynamicContentState.CodingKeys()
{
  return &type metadata for DynamicContentState.CodingKeys;
}

unint64_t sub_23BC9EFF4()
{
  unint64_t result;

  result = qword_256A94D78;
  if (!qword_256A94D78)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCD9C0C, &type metadata for DynamicContentState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A94D78);
  }
  return result;
}

unint64_t sub_23BC9F03C()
{
  unint64_t result;

  result = qword_256A94D80;
  if (!qword_256A94D80)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCD9B7C, &type metadata for DynamicContentState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A94D80);
  }
  return result;
}

unint64_t sub_23BC9F084()
{
  unint64_t result;

  result = qword_256A94D88;
  if (!qword_256A94D88)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCD9BA4, &type metadata for DynamicContentState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A94D88);
  }
  return result;
}

uint64_t sub_23BC9F0C8(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x656C61636F6CLL && a2 == 0xE600000000000000;
  if (v2 || (sub_23BCD85A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000023BCE5750)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23BCD85A8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23BC9F1AC()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23BC9F1E4 + 4 * byte_23BCD9C90[*v0]))(0x6570704177656976, 0xEC00000064657261);
}

unint64_t sub_23BC9F1E4()
{
  return 0xD000000000000011;
}

unint64_t sub_23BC9F200()
{
  return 0xD000000000000012;
}

uint64_t sub_23BC9F220()
{
  return 0x5374754F6E676973;
}

uint64_t sub_23BC9F244@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23BCA0E90(a1, a2);
  *a3 = result;
  return result;
}

void sub_23BC9F268(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_23BC9F274()
{
  sub_23BC9F83C();
  return sub_23BCD8614();
}

uint64_t sub_23BC9F29C()
{
  sub_23BC9F83C();
  return sub_23BCD8620();
}

uint64_t sub_23BC9F2C4()
{
  sub_23BC9F94C();
  return sub_23BCD8614();
}

uint64_t sub_23BC9F2EC()
{
  sub_23BC9F94C();
  return sub_23BCD8620();
}

uint64_t sub_23BC9F314()
{
  sub_23BC9F8C4();
  return sub_23BCD8614();
}

uint64_t sub_23BC9F33C()
{
  sub_23BC9F8C4();
  return sub_23BCD8620();
}

uint64_t sub_23BC9F364()
{
  sub_23BC9F908();
  return sub_23BCD8614();
}

uint64_t sub_23BC9F38C()
{
  sub_23BC9F908();
  return sub_23BCD8620();
}

uint64_t sub_23BC9F3B4()
{
  sub_23BC9F990();
  return sub_23BCD8614();
}

uint64_t sub_23BC9F3DC()
{
  sub_23BC9F990();
  return sub_23BCD8620();
}

void SignOutAction.encode(to:)(_QWORD *a1)
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
  char *v14;
  uint64_t v15;
  char *v16;
  _QWORD v17[16];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A94D90);
  v17[11] = *(_QWORD *)(v2 - 8);
  v17[12] = v2;
  MEMORY[0x24BDAC7A8](v2);
  v17[10] = (char *)v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A94D98);
  v17[5] = *(_QWORD *)(v4 - 8);
  v17[6] = v4;
  MEMORY[0x24BDAC7A8](v4);
  v17[4] = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for AccountState();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v17[3] = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A94DA0);
  v17[8] = *(_QWORD *)(v9 - 8);
  v17[9] = v9;
  MEMORY[0x24BDAC7A8](v9);
  v17[7] = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A94DA8);
  v17[1] = *(_QWORD *)(v11 - 8);
  v17[2] = v11;
  MEMORY[0x24BDAC7A8](v11);
  v12 = type metadata accessor for SignOutAction();
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A94DB0);
  v17[13] = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23BC9F83C();
  sub_23BCD8608();
  sub_23BC9F880(v17[15], (uint64_t)v14);
  v16 = (char *)sub_23BC9F650
      + 4 * byte_23BCD9C94[(*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v14, 3, v6)];
  __asm { BR              X10 }
}

uint64_t sub_23BC9F650()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(v3 - 184);
  sub_23BC9FFF0(v2, v4, (uint64_t (*)(_QWORD))type metadata accessor for AccountState);
  *(_BYTE *)(v3 - 66) = 2;
  sub_23BC9F908();
  v5 = *(_QWORD *)(v3 - 176);
  sub_23BCD8554();
  sub_23BCA0034(&qword_256A94DD0, (uint64_t)&protocol conformance descriptor for AccountState);
  v6 = *(_QWORD *)(v3 - 160);
  sub_23BCD8584();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 168) + 8))(v5, v6);
  sub_23BC9CF40(v4);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 104) + 8))(v1, v0);
}

uint64_t type metadata accessor for SignOutAction()
{
  uint64_t result;

  result = qword_256A94E88;
  if (!qword_256A94E88)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_23BC9F83C()
{
  unint64_t result;

  result = qword_256A94DB8;
  if (!qword_256A94DB8)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDA15C, &type metadata for SignOutAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A94DB8);
  }
  return result;
}

uint64_t sub_23BC9F880(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SignOutAction();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_23BC9F8C4()
{
  unint64_t result;

  result = qword_256A94DC0;
  if (!qword_256A94DC0)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDA10C, &type metadata for SignOutAction.SignOutSelectedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A94DC0);
  }
  return result;
}

unint64_t sub_23BC9F908()
{
  unint64_t result;

  result = qword_256A94DC8;
  if (!qword_256A94DC8)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDA0BC, &type metadata for SignOutAction.UpdateAccountStateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A94DC8);
  }
  return result;
}

unint64_t sub_23BC9F94C()
{
  unint64_t result;

  result = qword_256A94DD8;
  if (!qword_256A94DD8)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDA06C, &type metadata for SignOutAction.FetchAccountStateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A94DD8);
  }
  return result;
}

unint64_t sub_23BC9F990()
{
  unint64_t result;

  result = qword_256A94DE0;
  if (!qword_256A94DE0)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDA01C, &type metadata for SignOutAction.ViewAppearedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A94DE0);
  }
  return result;
}

uint64_t SignOutAction.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t *v28;
  _QWORD v30[13];
  uint64_t v31;
  _QWORD *v32;
  char *v33;

  v30[11] = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A94DE8);
  v30[4] = *(_QWORD *)(v3 - 8);
  v30[5] = v3;
  MEMORY[0x24BDAC7A8](v3);
  v30[10] = (char *)v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A94DF0);
  v6 = *(_QWORD *)(v5 - 8);
  v30[6] = v5;
  v30[7] = v6;
  MEMORY[0x24BDAC7A8](v5);
  v30[9] = (char *)v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A94DF8);
  v30[3] = *(_QWORD *)(v31 - 8);
  MEMORY[0x24BDAC7A8](v31);
  v30[12] = (char *)v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A94E00);
  v30[1] = *(_QWORD *)(v9 - 8);
  v30[2] = v9;
  MEMORY[0x24BDAC7A8](v9);
  v30[8] = (char *)v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A94E08);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for SignOutAction();
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)v30 - v19;
  v21 = a1[3];
  v32 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v21);
  sub_23BC9F83C();
  v22 = v33;
  sub_23BCD85FC();
  if (!v22)
  {
    v23 = v15;
    v30[0] = v18;
    v33 = v20;
    v24 = sub_23BCD853C();
    if (*(_QWORD *)(v24 + 16) == 1)
      __asm { BR              X10 }
    v25 = sub_23BCD8458();
    swift_allocError();
    v26 = v11;
    v28 = v27;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A94A88);
    *v28 = v23;
    sub_23BCD8500();
    sub_23BCD844C();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v25 - 8) + 104))(v28, *MEMORY[0x24BEE26D0], v25);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v26);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
}

uint64_t sub_23BC9FFF0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_23BCA0034(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for AccountState();
    result = MEMORY[0x24260FFB0](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23BCA0074@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return SignOutAction.init(from:)(a1, a2);
}

void sub_23BCA0088(_QWORD *a1)
{
  SignOutAction.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for SignOutAction(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int EnumCaseMultiPayload;
  uint64_t v11;
  uint64_t v12;

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
    v7 = type metadata accessor for AccountState();
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 3, v7))
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
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
        swift_storeEnumTagMultiPayload();
      }
      else if (EnumCaseMultiPayload)
      {
        memcpy(a1, a2, *(_QWORD *)(v8 + 64));
      }
      else
      {
        v11 = sub_23BCD793C();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(a1, a2, v11);
        swift_storeEnumTagMultiPayload();
      }
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 3, v7);
    }
  }
  return a1;
}

uint64_t destroy for SignOutAction(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  v2 = type metadata accessor for AccountState();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 3, v2);
  if (!(_DWORD)result)
  {
    result = swift_getEnumCaseMultiPayload();
    if ((_DWORD)result == 1)
    {
      return swift_bridgeObjectRelease();
    }
    else if (!(_DWORD)result)
    {
      v4 = sub_23BCD793C();
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
    }
  }
  return result;
}

_QWORD *initializeWithCopy for SignOutAction(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int EnumCaseMultiPayload;
  uint64_t v9;
  uint64_t v10;

  v6 = type metadata accessor for AccountState();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v7 + 48))(a2, 3, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      v10 = a2[1];
      *a1 = *a2;
      a1[1] = v10;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(v7 + 64));
    }
    else
    {
      v9 = sub_23BCD793C();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(a1, a2, v9);
      swift_storeEnumTagMultiPayload();
    }
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
  }
  return a1;
}

_QWORD *assignWithCopy for SignOutAction(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(_QWORD *, uint64_t, uint64_t);
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  size_t v13;
  int EnumCaseMultiPayload;
  uint64_t v15;

  v6 = type metadata accessor for AccountState();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 3, v6);
  v10 = v8(a2, 3, v6);
  if (!v9)
  {
    if (!v10)
    {
      if (a1 == a2)
        return a1;
      sub_23BC9CF40((uint64_t)a1);
      EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload == 1)
      {
        *a1 = *a2;
        a1[1] = a2[1];
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        return a1;
      }
      if (!EnumCaseMultiPayload)
      {
        v15 = sub_23BCD793C();
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(a1, a2, v15);
        swift_storeEnumTagMultiPayload();
        return a1;
      }
      v13 = *(_QWORD *)(v7 + 64);
      goto LABEL_9;
    }
    sub_23BC9CF40((uint64_t)a1);
LABEL_8:
    v13 = *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64);
LABEL_9:
    memcpy(a1, a2, v13);
    return a1;
  }
  if (v10)
    goto LABEL_8;
  v11 = swift_getEnumCaseMultiPayload();
  if (v11 == 1)
  {
    *a1 = *a2;
    a1[1] = a2[1];
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  else if (v11)
  {
    memcpy(a1, a2, *(_QWORD *)(v7 + 64));
  }
  else
  {
    v12 = sub_23BCD793C();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(a1, a2, v12);
    swift_storeEnumTagMultiPayload();
  }
  (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
  return a1;
}

void *initializeWithTake for SignOutAction(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = type metadata accessor for AccountState();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 3, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(_QWORD *)(v7 + 64));
    }
    else
    {
      v8 = sub_23BCD793C();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
    }
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
  }
  return a1;
}

void *assignWithTake for SignOutAction(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void *, uint64_t, uint64_t);
  int v9;
  int v10;
  size_t v11;
  uint64_t v12;
  uint64_t v14;

  v6 = type metadata accessor for AccountState();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 3, v6);
  v10 = v8(a2, 3, v6);
  if (!v9)
  {
    if (!v10)
    {
      if (a1 == a2)
        return a1;
      sub_23BC9CF40((uint64_t)a1);
      if (!swift_getEnumCaseMultiPayload())
      {
        v14 = sub_23BCD793C();
        (*(void (**)(void *, void *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(a1, a2, v14);
        swift_storeEnumTagMultiPayload();
        return a1;
      }
      v11 = *(_QWORD *)(v7 + 64);
      goto LABEL_8;
    }
    sub_23BC9CF40((uint64_t)a1);
LABEL_7:
    v11 = *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64);
LABEL_8:
    memcpy(a1, a2, v11);
    return a1;
  }
  if (v10)
    goto LABEL_7;
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(_QWORD *)(v7 + 64));
  }
  else
  {
    v12 = sub_23BCD793C();
    (*(void (**)(void *, void *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(a1, a2, v12);
    swift_storeEnumTagMultiPayload();
  }
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for SignOutAction()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23BCA0790(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int v5;

  v4 = type metadata accessor for AccountState();
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 4)
    return v5 - 3;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SignOutAction()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23BCA07E8(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  if (a2)
    v5 = (a2 + 3);
  else
    v5 = 0;
  v6 = type metadata accessor for AccountState();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a1, v5, a3, v6);
}

uint64_t sub_23BCA083C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for AccountState();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 3, v2);
}

uint64_t sub_23BCA0874(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AccountState();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, 3, v4);
}

uint64_t sub_23BCA08B4()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for AccountState();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SignOutAction.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SignOutAction.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23BCA09E4 + 4 * byte_23BCD9CA1[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23BCA0A18 + 4 * byte_23BCD9C9C[v4]))();
}

uint64_t sub_23BCA0A18(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BCA0A20(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23BCA0A28);
  return result;
}

uint64_t sub_23BCA0A34(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23BCA0A3CLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23BCA0A40(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BCA0A48(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SignOutAction.CodingKeys()
{
  return &type metadata for SignOutAction.CodingKeys;
}

ValueMetadata *type metadata accessor for SignOutAction.ViewAppearedCodingKeys()
{
  return &type metadata for SignOutAction.ViewAppearedCodingKeys;
}

ValueMetadata *type metadata accessor for SignOutAction.FetchAccountStateCodingKeys()
{
  return &type metadata for SignOutAction.FetchAccountStateCodingKeys;
}

uint64_t storeEnumTagSinglePayload for SignOutAction.UpdateAccountStateCodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23BCA0AC4 + 4 * byte_23BCD9CA6[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23BCA0AE4 + 4 * byte_23BCD9CAB[v4]))();
}

_BYTE *sub_23BCA0AC4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23BCA0AE4(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23BCA0AEC(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23BCA0AF4(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23BCA0AFC(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23BCA0B04(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for SignOutAction.UpdateAccountStateCodingKeys()
{
  return &type metadata for SignOutAction.UpdateAccountStateCodingKeys;
}

ValueMetadata *type metadata accessor for SignOutAction.SignOutSelectedCodingKeys()
{
  return &type metadata for SignOutAction.SignOutSelectedCodingKeys;
}

unint64_t sub_23BCA0B34()
{
  unint64_t result;

  result = qword_256A94E98;
  if (!qword_256A94E98)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCD9E9C, &type metadata for SignOutAction.UpdateAccountStateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A94E98);
  }
  return result;
}

unint64_t sub_23BCA0B7C()
{
  unint64_t result;

  result = qword_256A94EA0;
  if (!qword_256A94EA0)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCD9FF4, &type metadata for SignOutAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A94EA0);
  }
  return result;
}

unint64_t sub_23BCA0BC4()
{
  unint64_t result;

  result = qword_256A94EA8;
  if (!qword_256A94EA8)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCD9F14, &type metadata for SignOutAction.ViewAppearedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A94EA8);
  }
  return result;
}

unint64_t sub_23BCA0C0C()
{
  unint64_t result;

  result = qword_256A94EB0;
  if (!qword_256A94EB0)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCD9F3C, &type metadata for SignOutAction.ViewAppearedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A94EB0);
  }
  return result;
}

unint64_t sub_23BCA0C54()
{
  unint64_t result;

  result = qword_256A94EB8;
  if (!qword_256A94EB8)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCD9EC4, &type metadata for SignOutAction.FetchAccountStateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A94EB8);
  }
  return result;
}

unint64_t sub_23BCA0C9C()
{
  unint64_t result;

  result = qword_256A94EC0;
  if (!qword_256A94EC0)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCD9EEC, &type metadata for SignOutAction.FetchAccountStateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A94EC0);
  }
  return result;
}

unint64_t sub_23BCA0CE4()
{
  unint64_t result;

  result = qword_256A94EC8;
  if (!qword_256A94EC8)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCD9E0C, &type metadata for SignOutAction.UpdateAccountStateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A94EC8);
  }
  return result;
}

unint64_t sub_23BCA0D2C()
{
  unint64_t result;

  result = qword_256A94ED0;
  if (!qword_256A94ED0)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCD9E34, &type metadata for SignOutAction.UpdateAccountStateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A94ED0);
  }
  return result;
}

unint64_t sub_23BCA0D74()
{
  unint64_t result;

  result = qword_256A94ED8;
  if (!qword_256A94ED8)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCD9DBC, &type metadata for SignOutAction.SignOutSelectedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A94ED8);
  }
  return result;
}

unint64_t sub_23BCA0DBC()
{
  unint64_t result;

  result = qword_256A94EE0;
  if (!qword_256A94EE0)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCD9DE4, &type metadata for SignOutAction.SignOutSelectedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A94EE0);
  }
  return result;
}

unint64_t sub_23BCA0E04()
{
  unint64_t result;

  result = qword_256A94EE8;
  if (!qword_256A94EE8)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCD9F64, &type metadata for SignOutAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A94EE8);
  }
  return result;
}

unint64_t sub_23BCA0E4C()
{
  unint64_t result;

  result = qword_256A94EF0[0];
  if (!qword_256A94EF0[0])
  {
    result = MEMORY[0x24260FFB0](&unk_23BCD9F8C, &type metadata for SignOutAction.CodingKeys);
    atomic_store(result, qword_256A94EF0);
  }
  return result;
}

uint64_t sub_23BCA0E90(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6570704177656976 && a2 == 0xEC00000064657261;
  if (v2 || (sub_23BCD85A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000023BCE5770 || (sub_23BCD85A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000023BCE5790 || (sub_23BCD85A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x5374754F6E676973 && a2 == 0xEF64657463656C65)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_23BCD85A8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t SidebarModalitiesEnvironment.init(resolveSidebarModalities:navigateToModality:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for SidebarModalitiesEnvironment(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SidebarModalitiesEnvironment()
{
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for SidebarModalitiesEnvironment(uint64_t a1, uint64_t a2)
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

_QWORD *assignWithCopy for SidebarModalitiesEnvironment(_QWORD *a1, _QWORD *a2)
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

_OWORD *assignWithTake for SidebarModalitiesEnvironment(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SidebarModalitiesEnvironment(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SidebarModalitiesEnvironment(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SidebarModalitiesEnvironment()
{
  return &type metadata for SidebarModalitiesEnvironment;
}

char *AnotherTabView.init(tabBarStyle:store:viewBuilder:)@<X0>(char *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  char v6;

  v6 = *result;
  *(_QWORD *)a6 = a2;
  *(_QWORD *)(a6 + 8) = a3;
  *(_BYTE *)(a6 + 16) = v6;
  *(_QWORD *)(a6 + 24) = a4;
  *(_QWORD *)(a6 + 32) = a5;
  return result;
}

char *AnotherTabView.makeUIViewController(context:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23BCA13D8(a2, a2, a3, a4);
}

char *sub_23BCA128C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23BCA13D8(a2, a2, a3, a4);
}

uint64_t sub_23BCA12A0()
{
  return sub_23BCD7CD8();
}

uint64_t sub_23BCA12D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x24260FFB0](&protocol conformance descriptor for AnotherTabView<A>, a3);
  return sub_23BCD7D14();
}

uint64_t sub_23BCA1334(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x24260FFB0](&protocol conformance descriptor for AnotherTabView<A>, a3);
  return sub_23BCD7CE4();
}

uint64_t sub_23BCA1390()
{
  return sub_23BCD7E28();
}

void sub_23BCA13A8(uint64_t a1)
{
  MEMORY[0x24260FFB0](&protocol conformance descriptor for AnotherTabView<A>, a1);
  sub_23BCD7D08();
  __break(1u);
}

char *sub_23BCA13D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t (*v5)(void);
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  char v11;

  v5 = *(uint64_t (**)(void))v4;
  v6 = *(_QWORD *)(v4 + 8);
  v7 = *(_BYTE *)(v4 + 16);
  v9 = *(_QWORD *)(v4 + 24);
  v8 = *(_QWORD *)(v4 + 32);
  type metadata accessor for AnotherTabBarController(0, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), a4);
  v11 = v7;
  swift_retain();
  swift_retain();
  return AnotherTabBarController.__allocating_init(tabBarStyle:store:viewBuilder:)(&v11, v5, v6, v9, v8);
}

void sub_23BCA1454()
{
  JUMPOUT(0x24260FFB0);
}

uint64_t sub_23BCA1464()
{
  return MEMORY[0x24BDF5560];
}

uint64_t sub_23BCA1470()
{
  swift_release();
  return swift_release();
}

uint64_t sub_23BCA1498(uint64_t a1, uint64_t a2)
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
  return a1;
}

uint64_t sub_23BCA14DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v5;
  swift_retain();
  swift_release();
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

uint64_t sub_23BCA1554(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  return a1;
}

uint64_t sub_23BCA15A0(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_23BCA15E8(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t type metadata accessor for AnotherTabView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AnotherTabView);
}

char *TabBarViewController.__allocating_init(store:viewBuilder:)(uint64_t (*a1)(void), uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_class *v4;
  id v9;

  v9 = objc_allocWithZone(v4);
  return TabBarViewController.init(store:viewBuilder:)(a1, a2, a3, a4);
}

char *TabBarViewController.init(store:viewBuilder:)(uint64_t (*a1)(void), uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  char v14;
  objc_class *v15;
  _BYTE *v16;
  uint64_t v17;
  id v18;
  _BYTE *v19;
  char *v20;
  void *v21;
  char *v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  objc_class *ObjectType;
  objc_super v28;
  objc_super v29;
  char v30;
  char v31;

  ObjectType = (objc_class *)swift_getObjectType();
  v8 = *MEMORY[0x24BEE4EA0] & *v4;
  v9 = qword_256A94F80;
  v10 = *(_QWORD *)(v8 + 0x50);
  v11 = v4;
  *(_QWORD *)((char *)v4 + v9) = sub_23BCD81DC();
  *(_QWORD *)((char *)v11 + qword_256A94F88) = MEMORY[0x24BEE4AF8];
  *((_BYTE *)v11 + qword_256A94F90) = 0;
  *(_QWORD *)((char *)v11 + qword_256A94F98) = a1();
  v12 = (_QWORD *)((char *)v11 + qword_256A94FA0);
  *v12 = a3;
  v12[1] = a4;
  v13 = *(_QWORD *)(v8 + 88);
  swift_getKeyPath();
  swift_retain();
  sub_23BCD80A4();
  swift_release();
  swift_getKeyPath();
  sub_23BCD80A4();
  swift_release();
  LOBYTE(v8) = v31;
  swift_getKeyPath();
  sub_23BCD80A4();
  swift_release();
  v14 = v30;
  v15 = (objc_class *)type metadata accessor for TabBarController();
  v16 = objc_allocWithZone(v15);
  *(_QWORD *)&v16[OBJC_IVAR____TtC14FitnessAppRoot16TabBarController_floatingTitleView] = 0;
  v16[OBJC_IVAR____TtC14FitnessAppRoot16TabBarController_needsSegmentedControlLayout] = 0;
  v17 = OBJC_IVAR____TtC14FitnessAppRoot16TabBarController_topConstraint;
  v18 = objc_allocWithZone(MEMORY[0x24BDD1628]);
  v19 = v16;
  *(_QWORD *)&v16[v17] = objc_msgSend(v18, sel_init);
  swift_unknownObjectWeakInit();
  v19[OBJC_IVAR____TtC14FitnessAppRoot16TabBarController_prefersTightPadding] = v8;
  v19[OBJC_IVAR____TtC14FitnessAppRoot16TabBarController_tabBarStyle] = v14;

  v29.receiver = v19;
  v29.super_class = v15;
  *(_QWORD *)((char *)v11 + qword_256A94FA8) = objc_msgSendSuper2(&v29, sel_initWithNibName_bundle_, 0, 0);

  v28.receiver = v11;
  v28.super_class = ObjectType;
  v20 = (char *)objc_msgSendSuper2(&v28, sel_initWithNibName_bundle_, 0, 0);
  v21 = *(void **)&v20[qword_256A94FA8];
  v22 = v20;
  objc_msgSend(v21, sel_setDelegate_, v22);
  sub_23BCD80B0();
  v23 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v24 = (_QWORD *)swift_allocObject();
  v24[2] = v10;
  v24[3] = v13;
  v24[4] = v23;
  v25 = swift_allocObject();
  *(_QWORD *)(v25 + 16) = sub_23BCA3410;
  *(_QWORD *)(v25 + 24) = v24;
  sub_23BCD79F0();
  sub_23BCD79FC();
  swift_release();
  swift_release();
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256A94FB0);
  sub_23BCA37E0((unint64_t *)&qword_256A95180, (uint64_t *)&unk_256A94FB0, MEMORY[0x24BEE12E8]);
  sub_23BCD79E4();
  swift_endAccess();
  swift_release();

  swift_release();
  swift_release();
  return v22;
}

void sub_23BCA1A4C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x2426100E8](v1);
  if (v2)
  {
    v3 = (void *)v2;
    sub_23BCA232C();
    sub_23BCA2548();
    sub_23BCA25FC();

  }
}

uint64_t sub_23BCA1AA4(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

void sub_23BCA1AC4(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  v3 = a3;
  sub_23BCA34A4();
}

Swift::Void __swiftcall TabBarViewController.viewDidLoad()()
{
  char *v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  objc_super v40;
  uint64_t v41;
  objc_super v42;

  v1 = v0;
  v42.receiver = v0;
  v42.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v42, sel_viewDidLoad);
  v2 = *(void **)&v0[qword_256A94FA8];
  objc_msgSend(v0, sel_addChildViewController_, v2);
  v3 = objc_msgSend(v2, sel_view);
  if (!v3)
  {
    __break(1u);
    goto LABEL_14;
  }
  v4 = v3;
  objc_msgSend(v3, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  v5 = objc_msgSend(v1, sel_view);
  if (!v5)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v6 = v5;
  v7 = objc_msgSend(v2, sel_view);
  if (!v7)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v8 = v7;
  objc_msgSend(v6, sel_addSubview_, v7);

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256A94FC0);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_23BCDA2E0;
  v10 = objc_msgSend(v2, sel_view);
  if (!v10)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v11 = v10;
  v12 = objc_msgSend(v10, sel_topAnchor);

  v13 = objc_msgSend(v1, sel_view);
  if (!v13)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v14 = v13;
  v15 = objc_msgSend(v13, sel_topAnchor);

  v16 = objc_msgSend(v12, sel_constraintEqualToAnchor_, v15);
  *(_QWORD *)(v9 + 32) = v16;
  v17 = objc_msgSend(v2, sel_view);
  if (!v17)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v18 = v17;
  v19 = objc_msgSend(v17, sel_bottomAnchor);

  v20 = objc_msgSend(v1, sel_view);
  if (!v20)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v21 = v20;
  v22 = objc_msgSend(v20, sel_bottomAnchor);

  v23 = objc_msgSend(v19, sel_constraintEqualToAnchor_, v22);
  *(_QWORD *)(v9 + 40) = v23;
  v24 = objc_msgSend(v2, sel_view);
  if (!v24)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v25 = v24;
  v26 = objc_msgSend(v24, sel_leadingAnchor);

  v27 = objc_msgSend(v1, sel_view);
  if (!v27)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v28 = v27;
  v29 = objc_msgSend(v27, sel_leadingAnchor);

  v30 = objc_msgSend(v26, sel_constraintEqualToAnchor_, v29);
  *(_QWORD *)(v9 + 48) = v30;
  v31 = objc_msgSend(v2, sel_view);
  if (!v31)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v32 = v31;
  v33 = objc_msgSend(v31, sel_trailingAnchor);

  v34 = objc_msgSend(v1, sel_view);
  if (v34)
  {
    v35 = v34;
    v36 = (void *)objc_opt_self();
    v37 = objc_msgSend(v35, sel_trailingAnchor);

    v38 = objc_msgSend(v33, sel_constraintEqualToAnchor_, v37);
    *(_QWORD *)(v9 + 56) = v38;
    v41 = v9;
    sub_23BCD81C4();
    sub_23BCA3724(0, &qword_256A96280);
    v39 = (void *)sub_23BCD81AC();
    swift_bridgeObjectRelease();
    objc_msgSend(v36, sel_activateConstraints_, v39);

    v40.receiver = v2;
    v40.super_class = (Class)type metadata accessor for TabBarController();
    objc_msgSendSuper2(&v40, sel_didMoveToParentViewController_, v1);
    sub_23BCB8138();
    sub_23BCA232C();
    sub_23BCA2548();
    sub_23BCA25FC();
    return;
  }
LABEL_23:
  __break(1u);
}

void sub_23BCA1F3C(void *a1)
{
  id v1;

  v1 = a1;
  TabBarViewController.viewDidLoad()();

}

uint64_t sub_23BCA1F74(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = a1;
  v9 = _s14FitnessAppRoot20TabBarViewControllerC03tabeG0_12shouldSelectSbSo05UITabeG0C_So06UIViewG0CtF_0(v6);

  return v9 & 1;
}

Swift::Void __swiftcall TabBarViewController.tabBarController(_:didSelect:)(UITabBarController *_, UIViewController *didSelect)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  NSArray *v10;
  NSArray *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;

  v6 = type metadata accessor for TabBarAction(0, *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v3) + 0x50), *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v3) + 0x58), v2);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (uint64_t *)((char *)&v16 - v8);
  if ((*((_BYTE *)v3 + qword_256A94F90) & 1) != 0)
  {
    *((_BYTE *)v3 + qword_256A94F90) = 0;
  }
  else if (*(UITabBarController **)((char *)v3 + qword_256A94FA8) == _)
  {
    v10 = -[UITabBarController viewControllers](_, sel_viewControllers);
    if (v10)
    {
      v11 = v10;
      sub_23BCA3724(0, qword_256A94FD0);
      v12 = sub_23BCD81B8();

      sub_23BCA212C((uint64_t)didSelect, v12);
      v14 = v13;
      LOBYTE(v11) = v15;
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {
        *v9 = v14;
        swift_storeEnumTagMultiPayload();
        sub_23BCD80BC();
        (*(void (**)(_QWORD *, uint64_t))(v7 + 8))(v9, v6);
      }
    }
  }
}

void sub_23BCA212C(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  char v6;
  uint64_t i;
  id v8;
  void *v9;
  char v10;
  unint64_t v11;

  if (a2 >> 62)
    goto LABEL_20;
  v3 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v3)
  {
    while (1)
    {
      if ((a2 & 0xC000000000000001) != 0)
      {
        v4 = (id)MEMORY[0x24260F968](0, a2);
      }
      else
      {
        if (!*(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          return;
        }
        v4 = *(id *)(a2 + 32);
      }
      v5 = v4;
      sub_23BCA3724(0, qword_256A94FD0);
      v6 = sub_23BCD838C();

      if ((v6 & 1) == 0)
      {
        for (i = 0; ; ++i)
        {
          v11 = i + 1;
          if (__OFADD__(i, 1))
            break;
          if (v11 == v3)
            return;
          if ((a2 & 0xC000000000000001) != 0)
          {
            v8 = (id)MEMORY[0x24260F968](i + 1, a2);
          }
          else
          {
            if ((v11 & 0x8000000000000000) != 0)
              goto LABEL_18;
            if (v11 >= *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
              goto LABEL_19;
            v8 = *(id *)(a2 + 32 + 8 * v11);
          }
          v9 = v8;
          v10 = sub_23BCD838C();

          if ((v10 & 1) != 0)
            return;
        }
        __break(1u);
LABEL_18:
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        swift_bridgeObjectRetain();
        v3 = sub_23BCD84B8();
        swift_bridgeObjectRelease();
        if (v3)
          continue;
      }
      return;
    }
  }
}

void sub_23BCA22C4(void *a1, uint64_t a2, void *a3, void *a4)
{
  UITabBarController *v6;
  UIViewController *v7;
  id v8;

  v6 = a3;
  v7 = a4;
  v8 = a1;
  TabBarViewController.tabBarController(_:didSelect:)(v6, v7);

}

void sub_23BCA232C()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;

  v1 = *(_QWORD **)((*MEMORY[0x24BEE4EA0] & *v0) + 0x50);
  v2 = *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v0) + 0x58);
  v16 = v1;
  v17 = v2;
  swift_getKeyPath();
  sub_23BCD80A4();
  swift_release();
  v3 = qword_256A94F80;
  swift_bridgeObjectRetain();
  v4 = sub_23BCD8218();
  swift_bridgeObjectRelease();
  v5 = swift_bridgeObjectRelease();
  if ((v4 & 1) == 0)
  {
    MEMORY[0x24BDAC7A8](v5);
    v14 = v1;
    v15 = v2;
    swift_getKeyPath();
    sub_23BCD80A4();
    swift_release();
    *(_QWORD *)((char *)v0 + v3) = v18;
    v6 = swift_bridgeObjectRelease();
    v7 = *(void **)((char *)v0 + qword_256A94FA8);
    v18 = *(_QWORD *)((char *)v0 + v3);
    MEMORY[0x24BDAC7A8](v6);
    v14 = v0;
    v8 = sub_23BCD8200();
    v9 = (char *)sub_23BCA3724(0, qword_256A94FD0);
    swift_bridgeObjectRetain();
    v10 = MEMORY[0x24260FFB0](MEMORY[0x24BEE12E0], v8);
    sub_23BCBA904((void (*)(char *, char *))sub_23BCA383C, (uint64_t)&v13, v8, v9, MEMORY[0x24BEE4078], v10, MEMORY[0x24BEE40A8], v11);
    swift_bridgeObjectRelease();
    v12 = (void *)sub_23BCD81AC();
    swift_bridgeObjectRelease();
    objc_msgSend(v7, sel_setViewControllers_, v12, v16, v17);

  }
}

id sub_23BCA2548()
{
  _QWORD *v0;
  void *v1;
  id result;
  __int128 v3;
  objc_super v4;
  uint64_t v5;

  v1 = *(void **)((char *)v0 + qword_256A94FA8);
  v3 = *(_OWORD *)((*MEMORY[0x24BEE4EA0] & *v0) + 0x50);
  swift_getKeyPath();
  sub_23BCD80A4();
  swift_release();
  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for TabBarController();
  result = objc_msgSendSuper2(&v4, sel_setSelectedIndex_, v5, v3);
  *((_BYTE *)v1 + OBJC_IVAR____TtC14FitnessAppRoot16TabBarController_needsSegmentedControlLayout) = 1;
  return result;
}

uint64_t sub_23BCA25FC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  _QWORD *v21;
  void *v22;
  uint64_t v23;
  _QWORD *v24;
  void *v25;
  const void *v26;
  uint64_t v27;
  _QWORD *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t aBlock;
  uint64_t v37;
  uint64_t (*v38)(uint64_t);
  void *v39;
  uint64_t (*v40)(uint64_t, uint64_t, uint64_t, uint64_t);
  _QWORD *v41;

  v1 = *MEMORY[0x24BEE4EA0] & *v0;
  v2 = sub_23BCD80D4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23BCD80EC();
  v33 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(v1 + 80);
  v10 = *(_QWORD *)(v1 + 88);
  v34 = v9;
  v35 = v10;
  swift_getKeyPath();
  sub_23BCD80A4();
  result = swift_release();
  if (aBlock == 1)
  {
    v32 = v3;
    v12 = objc_msgSend(*(id *)((char *)v0 + qword_256A94FA8), sel_selectedViewController);
    v31 = v6;
    if (v12)
    {
      v13 = v12;
      objc_opt_self();
      v14 = (void *)swift_dynamicCastObjCClass();
      if (v14)
      {
        v15 = v14;
        v30 = v2;
        v16 = objc_msgSend(v14, sel_viewControllers);
        sub_23BCA3724(0, qword_256A94FD0);
        v17 = sub_23BCD81B8();

        if (v17 >> 62)
        {
          swift_bridgeObjectRetain();
          v18 = sub_23BCD84B8();
          swift_bridgeObjectRelease();
        }
        else
        {
          v18 = *(_QWORD *)((v17 & 0xFFFFFFFFFFFFF8) + 0x10);
        }
        swift_bridgeObjectRelease();
        if (v18 == 1)
        {
          sub_23BCB742C(1);
          sub_23BCA3724(0, (unint64_t *)&unk_256A95300);
          v19 = (void *)sub_23BCD8368();
          v20 = swift_allocObject();
          swift_unknownObjectWeakInit();
          v21 = (_QWORD *)swift_allocObject();
          v21[2] = v9;
          v21[3] = v10;
          v21[4] = v20;
          v40 = sub_23BCA3874;
          v41 = v21;
          aBlock = MEMORY[0x24BDAC760];
          v37 = 1107296256;
          v38 = sub_23BCA4214;
          v39 = &block_descriptor_28;
          v22 = _Block_copy(&aBlock);
          swift_release();
          sub_23BCD80E0();
          aBlock = MEMORY[0x24BEE4AF8];
          sub_23BCA3798();
          __swift_instantiateConcreteTypeFromMangledName(&qword_256A95310);
          sub_23BCA37E0((unint64_t *)&unk_256A95070, &qword_256A95310, MEMORY[0x24BEE12C8]);
          v2 = v30;
          sub_23BCD83C8();
          MEMORY[0x24260F89C](0, v8, v5, v22);
          _Block_release(v22);

LABEL_12:
          (*(void (**)(char *, uint64_t))(v32 + 8))(v5, v2);
          return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v8, v31);
        }

        sub_23BCA3724(0, (unint64_t *)&unk_256A95300);
        v19 = (void *)sub_23BCD8368();
        v27 = swift_allocObject();
        swift_unknownObjectWeakInit();
        v28 = (_QWORD *)swift_allocObject();
        v28[2] = v9;
        v28[3] = v10;
        v28[4] = v27;
        v40 = sub_23BCA3820;
        v41 = v28;
        aBlock = MEMORY[0x24BDAC760];
        v37 = 1107296256;
        v38 = sub_23BCA4214;
        v39 = &block_descriptor_21;
        v29 = _Block_copy(&aBlock);
        swift_release();
        sub_23BCD80E0();
        aBlock = MEMORY[0x24BEE4AF8];
        sub_23BCA3798();
        __swift_instantiateConcreteTypeFromMangledName(&qword_256A95310);
        sub_23BCA37E0((unint64_t *)&unk_256A95070, &qword_256A95310, MEMORY[0x24BEE12C8]);
        v2 = v30;
        sub_23BCD83C8();
        MEMORY[0x24260F89C](0, v8, v5, v29);

        v26 = v29;
LABEL_11:
        _Block_release(v26);
        goto LABEL_12;
      }

    }
    sub_23BCA3724(0, (unint64_t *)&unk_256A95300);
    v19 = (void *)sub_23BCD8368();
    v23 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v24 = (_QWORD *)swift_allocObject();
    v24[2] = v9;
    v24[3] = v10;
    v24[4] = v23;
    v40 = sub_23BCA3874;
    v41 = v24;
    aBlock = MEMORY[0x24BDAC760];
    v37 = 1107296256;
    v38 = sub_23BCA4214;
    v39 = &block_descriptor;
    v25 = _Block_copy(&aBlock);
    swift_release();
    sub_23BCD80E0();
    aBlock = MEMORY[0x24BEE4AF8];
    sub_23BCA3798();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A95310);
    sub_23BCA37E0((unint64_t *)&unk_256A95070, &qword_256A95310, MEMORY[0x24BEE12C8]);
    sub_23BCD83C8();
    MEMORY[0x24260F89C](0, v8, v5, v25);
    v26 = v25;
    goto LABEL_11;
  }
  return result;
}

uint64_t sub_23BCA2C08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t result;
  void *v10;
  uint64_t v11;

  v5 = type metadata accessor for TabBarAction(0, a2, a3, a4);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v11 - v7;
  swift_beginAccess();
  result = MEMORY[0x2426100E8](a1 + 16);
  if (result)
  {
    v10 = (void *)result;
    swift_retain();

    swift_storeEnumTagMultiPayload();
    sub_23BCD80BC();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return result;
}

void sub_23BCA2CE4(uint64_t a1@<X0>, _QWORD *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t (*v10)(uint64_t, _QWORD, _QWORD);
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  _QWORD v51[2];
  _QWORD *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;

  v52 = a3;
  v5 = *MEMORY[0x24BEE4EA0] & *a2;
  v59 = *(_QWORD *)(v5 + 0x50);
  v54 = *(_QWORD *)(v59 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v53 = (char *)v51 - v6;
  v55 = sub_23BCD7984();
  v7 = *(_QWORD *)(v55 - 8);
  MEMORY[0x24BDAC7A8](v55);
  v9 = (char *)v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))((char *)a2 + qword_256A94FA0);
  v56 = a1;
  v11 = (void *)v10(a1, 0, 0);
  v12 = objc_msgSend(v11, sel_tabBarItem);
  if (!v12)
  {
    __break(1u);
    goto LABEL_18;
  }
  v13 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v14 = *(_QWORD *)(v5 + 88);
  v15 = v59;
  v51[-2] = v59;
  v51[-1] = v14;
  swift_getKeyPath();
  sub_23BCD80A4();
  swift_release();
  v16 = v56;
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 72))(v9, v15, v14);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v55);
  v17 = (void *)sub_23BCD8140();
  swift_bridgeObjectRelease();
  objc_msgSend(v13, sel_setTitle_, v17);

  v18 = objc_msgSend(v11, sel_tabBarItem);
  if (!v18)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v19 = v18;
  v20 = v11;
  v21 = v59;
  (*(void (**)(uint64_t, uint64_t))(v14 + 64))(v59, v14);
  v22 = (void *)sub_23BCD8140();
  swift_bridgeObjectRelease();
  v23 = objc_msgSend((id)objc_opt_self(), sel_systemImageNamed_, v22);

  objc_msgSend(v19, sel_setImage_, v23);
  v24 = objc_msgSend(v20, sel_tabBarItem);
  if (!v24)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v25 = v24;
  v57 = 0;
  v58 = 0xE000000000000000;
  sub_23BCD8428();
  v51[0] = "init(nibName:bundle:)";
  sub_23BCD8188();
  sub_23BCD859C();
  v26 = (void *)sub_23BCD8140();
  swift_bridgeObjectRelease();
  objc_msgSend(v25, sel_setAccessibilityIdentifier_, v26);

  v27 = *(uint64_t (**)(uint64_t, uint64_t))(v14 + 56);
  v28 = v27(v21, v14);
  v30 = v29;
  v31 = objc_msgSend(v20, sel_tabBarItem);
  if (!v31)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v32 = v31;
  v51[1] = v28;
  v55 = v30;
  v33 = objc_msgSend(v31, sel_title);

  if (v33)
  {
    sub_23BCD8164();
    v35 = v34;

    v37 = v53;
    v36 = v54;
    (*(void (**)(char *, uint64_t, uint64_t))(v54 + 16))(v53, v16, v21);
    if (v35)
      goto LABEL_10;
  }
  else
  {
    v37 = v53;
    v36 = v54;
    (*(void (**)(char *, uint64_t, uint64_t))(v54 + 16))(v53, v16, v21);
  }
  v27(v21, v14);
LABEL_10:
  (*(void (**)(char *, uint64_t))(v36 + 8))(v37, v21);
  v38 = objc_msgSend(v20, sel_tabBarItem);
  if (!v38)
  {
LABEL_21:
    __break(1u);
    return;
  }
  v39 = v38;
  v40 = v20;
  v41 = objc_msgSend(v38, sel_image);

  v42 = objc_allocWithZone(MEMORY[0x24BEBDD58]);
  v43 = (void *)sub_23BCD8140();
  swift_bridgeObjectRelease();
  v44 = (void *)sub_23BCD8140();
  swift_bridgeObjectRelease();
  v45 = objc_msgSend(v42, sel_initWithIdentifier_title_image_, v43, v44, v41);

  objc_msgSend(v40, sel__uip_setTabElement_, v45);
  v46 = objc_msgSend(v40, sel__uip_tabElement);
  if (v46)
  {
    v47 = v46;
    v57 = 0;
    v58 = 0xE000000000000000;
    sub_23BCD8428();
    sub_23BCD8188();
    sub_23BCD859C();
    v48 = (void *)sub_23BCD8140();
    swift_bridgeObjectRelease();
    objc_msgSend(v47, sel_setAccessibilityIdentifier_, v48);

  }
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v14 + 48))(v21, v14) & 1) != 0)
  {
    v49 = objc_msgSend(v40, sel__uip_tabElement);
    if (v49)
    {
      v50 = v49;
      objc_msgSend(v49, sel__setTabBarPlacement_, 1);

    }
  }
  *v52 = v40;
}

id TabBarViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_23BCD8140();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void TabBarViewController.init(nibName:bundle:)()
{
  sub_23BCA365C();
}

void sub_23BCA3310(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v4;

  v4 = a4;
  sub_23BCA365C();
}

id TabBarViewController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_23BCA3380(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

uint64_t sub_23BCA33EC()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_23BCA3410()
{
  uint64_t v0;

  sub_23BCA1A4C(*(_QWORD *)(v0 + 32));
}

uint64_t sub_23BCA341C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23BCA3440()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24260FFA4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_23BCA34A4()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = qword_256A94F80;
  *(_QWORD *)&v0[v1] = sub_23BCD81DC();
  *(_QWORD *)&v0[qword_256A94F88] = MEMORY[0x24BEE4AF8];
  v0[qword_256A94F90] = 0;

  sub_23BCD84AC();
  __break(1u);
}

uint64_t _s14FitnessAppRoot20TabBarViewControllerC03tabeG0_12shouldSelectSbSo05UITabeG0C_So06UIViewG0CtF_0(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;
  uint64_t v7;

  v2 = objc_msgSend(a1, sel_selectedViewController);
  if (v2)
  {
    v3 = v2;
    objc_opt_self();
    v4 = (void *)swift_dynamicCastObjCClass();
    if (v4)
    {
      v5 = objc_msgSend(v4, sel_viewControllers);
      sub_23BCA3724(0, qword_256A94FD0);
      v6 = sub_23BCD81B8();

      if (v6 >> 62)
      {
        swift_bridgeObjectRetain();
        v7 = sub_23BCD84B8();

        swift_bridgeObjectRelease_n();
      }
      else
      {
        v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRelease();

      }
      *(_BYTE *)(v1 + qword_256A94F90) = v7 > 1;
    }
    else
    {

    }
  }
  return 1;
}

void sub_23BCA365C()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_23BCA368C()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for TabBarViewController(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for TabBarViewController);
}

uint64_t method lookup function for TabBarViewController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TabBarViewController.__allocating_init(store:viewBuilder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t sub_23BCA3724(uint64_t a1, unint64_t *a2)
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

uint64_t sub_23BCA375C()
{
  swift_release();
  return swift_deallocObject();
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

unint64_t sub_23BCA3798()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256A95060;
  if (!qword_256A95060)
  {
    v1 = sub_23BCD80D4();
    result = MEMORY[0x24260FFB0](MEMORY[0x24BEE5468], v1);
    atomic_store(result, (unint64_t *)&qword_256A95060);
  }
  return result;
}

uint64_t sub_23BCA37E0(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24260FFB0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23BCA3820(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;

  return sub_23BCA2C08(v4[4], v4[2], v4[3], a4);
}

void sub_23BCA383C(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  sub_23BCA2CE4(a1, *(_QWORD **)(v2 + 16), a2);
}

uint64_t NetworkUnavailableView.init(locale:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  v4 = sub_23BCD7984();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
}

uint64_t NetworkUnavailableView.body.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A95080);
  sub_23BCA37E0(&qword_256A95088, &qword_256A95080, MEMORY[0x24BDF41A8]);
  return sub_23BCD7C24();
}

uint64_t sub_23BCA3970()
{
  return sub_23BCD7F3C();
}

uint64_t sub_23BCA39CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t ObjCClassFromMetadata;
  id v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;

  v4 = sub_23BCD7984();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23BCD8134();
  MEMORY[0x24BDAC7A8](v8);
  sub_23BCD8128();
  type metadata accessor for LocalizableBundle();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v10 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  result = sub_23BCD8170();
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v12;
  *(_BYTE *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = MEMORY[0x24BEE4AF8];
  return result;
}

id sub_23BCA3B20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id result;
  void *v10;
  uint64_t ObjCClassFromMetadata;
  id v12;
  uint64_t v13;
  uint64_t v14;

  v4 = sub_23BCD7984();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23BCD8134();
  MEMORY[0x24BDAC7A8](v8);
  result = (id)MobileGestalt_get_current_device();
  if (result)
  {
    v10 = result;
    MobileGestalt_get_wapiCapability();

    sub_23BCD8128();
    type metadata accessor for LocalizableBundle();
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v12 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
    result = (id)sub_23BCD8170();
    *(_QWORD *)a2 = result;
    *(_QWORD *)(a2 + 8) = v13;
    *(_BYTE *)(a2 + 16) = 0;
    *(_QWORD *)(a2 + 24) = MEMORY[0x24BEE4AF8];
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_23BCA3CC0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23BCA3B20(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_23BCA3CC8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23BCA3CE0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A95080);
  sub_23BCA37E0(&qword_256A95088, &qword_256A95080, MEMORY[0x24BDF41A8]);
  return sub_23BCD7C24();
}

uint64_t initializeBufferWithCopyOfBuffer for NetworkUnavailableView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23BCD7984();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t initializeWithCopy for NetworkUnavailableView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23BCD7984();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for NetworkUnavailableView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23BCD7984();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for NetworkUnavailableView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23BCD7984();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for NetworkUnavailableView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23BCD7984();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for NetworkUnavailableView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23BCA3EF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23BCD7984();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for NetworkUnavailableView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23BCA3F3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23BCD7984();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for NetworkUnavailableView()
{
  uint64_t result;

  result = qword_256A950E8;
  if (!qword_256A950E8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23BCA3FB8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23BCD7984();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23BCA4020()
{
  return sub_23BCA37E0(&qword_256A95120, &qword_256A95128, MEMORY[0x24BDEFC28]);
}

uint64_t sub_23BCA404C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23BCA39CC(*(_QWORD *)(v1 + 16), a1);
}

uint64_t SidebarEnvironment.init(resetContext:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for SidebarEnvironment(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for SidebarEnvironment()
{
  return swift_release();
}

_QWORD *assignWithCopy for SidebarEnvironment(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for SidebarEnvironment(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SidebarEnvironment(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SidebarEnvironment(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SidebarEnvironment()
{
  return &type metadata for SidebarEnvironment;
}

uint64_t DynamicContentEnvironment.init(handleNetworkStatusChange:makeNetworkConditionsUpdatedStream:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

ValueMetadata *type metadata accessor for DynamicContentEnvironment()
{
  return &type metadata for DynamicContentEnvironment;
}

char *AnotherTabBarController.__allocating_init(tabBarStyle:store:viewBuilder:)(char *a1, uint64_t (*a2)(void), uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_class *v5;
  id v11;

  v11 = objc_allocWithZone(v5);
  return AnotherTabBarController.init(tabBarStyle:store:viewBuilder:)(a1, a2, a3, a4, a5);
}

uint64_t sub_23BCA4214(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

BOOL static AnotherTabBarController.TabBarStyle.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t AnotherTabBarController.TabBarStyle.hash(into:)()
{
  return sub_23BCD85CC();
}

uint64_t AnotherTabBarController.TabBarStyle.hashValue.getter()
{
  sub_23BCD85C0();
  sub_23BCD85CC();
  return sub_23BCD85F0();
}

uint64_t sub_23BCA42D0()
{
  sub_23BCD85C0();
  AnotherTabBarController.TabBarStyle.hash(into:)();
  return sub_23BCD85F0();
}

uint64_t AnotherTabBarController.selectedIndex.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + qword_256A95130;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t AnotherTabBarController.items.getter()
{
  return sub_23BCA4368();
}

uint64_t AnotherTabBarController.viewControllers.getter()
{
  return sub_23BCA4368();
}

uint64_t sub_23BCA4368()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t AnotherTabBarController.selectedViewController.getter()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t *v2;
  id v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t result;
  uint64_t v8;
  id v9;

  v1 = v0;
  v2 = (unint64_t *)(v0 + qword_256A95130);
  swift_beginAccess();
  v3 = 0;
  if ((v2[1] & 1) != 0)
    return (uint64_t)v3;
  v4 = *v2;
  swift_beginAccess();
  v5 = sub_23BCD8200();
  MEMORY[0x24260FFB0](MEMORY[0x24BEE12D8], v5);
  sub_23BCD82E4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A95148);
  v3 = 0;
  if ((sub_23BCD8344() & 1) == 0)
    return (uint64_t)v3;
  v6 = (uint64_t *)(v1 + qword_256A95140);
  result = swift_beginAccess();
  v8 = *v6;
  if ((*v6 & 0xC000000000000001) != 0)
  {
    v9 = (id)MEMORY[0x24260F968](v4);
    goto LABEL_7;
  }
  if ((v4 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v4 < *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v9 = *(id *)(v8 + 8 * v4 + 32);
LABEL_7:
    v3 = v9;
    swift_endAccess();
    return (uint64_t)v3;
  }
  __break(1u);
  return result;
}

char *AnotherTabBarController.init(tabBarStyle:store:viewBuilder:)(char *a1, uint64_t (*a2)(void), uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v9;
  char v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  id v18;
  id v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  objc_class *ObjectType;
  objc_super v29;

  ObjectType = (objc_class *)swift_getObjectType();
  v9 = *MEMORY[0x24BEE4EA0] & *v5;
  v10 = *a1;
  swift_unknownObjectWeakInit();
  v11 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)((char *)v5 + qword_256A95158) = MEMORY[0x24BEE4AF8];
  v12 = (char *)v5 + qword_256A95130;
  *(_QWORD *)v12 = 0;
  v12[8] = 1;
  v13 = qword_256A95138;
  v14 = *(_QWORD *)(v9 + 80);
  v15 = v5;
  *(_QWORD *)((char *)v5 + v13) = sub_23BCD81DC();
  *(_QWORD *)((char *)v15 + qword_256A95140) = v11;
  *(_QWORD *)((char *)v15 + qword_256A95160) = a2();
  v16 = (_QWORD *)((char *)v15 + qword_256A95168);
  *v16 = a4;
  v16[1] = a5;
  v17 = *(_QWORD *)(v9 + 88);
  if ((v10 & 1) != 0)
  {
    swift_retain();
    v18 = 0;
  }
  else
  {
    type metadata accessor for FloatingTitleView();
    v19 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
    swift_retain();
    v18 = objc_msgSend(v19, sel_init);
  }
  *(_QWORD *)((char *)v15 + qword_256A95170) = v18;

  v29.receiver = v15;
  v29.super_class = ObjectType;
  v20 = (char *)objc_msgSendSuper2(&v29, sel_initWithNibName_bundle_, 0, 0);
  v21 = *(_QWORD *)&v20[qword_256A95170];
  if (v21)
  {
    *(_QWORD *)(v21 + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_delegate + 8) = &off_250CC9658;
    swift_unknownObjectWeakAssign();
  }
  v22 = v20;
  sub_23BCD80B0();
  v23 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v24 = (_QWORD *)swift_allocObject();
  v24[2] = v14;
  v24[3] = v17;
  v24[4] = v23;
  v25 = swift_allocObject();
  *(_QWORD *)(v25 + 16) = sub_23BCA7154;
  *(_QWORD *)(v25 + 24) = v24;
  sub_23BCD79F0();
  sub_23BCD79FC();
  swift_release();
  swift_release();
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256A94FB0);
  sub_23BCA37E0((unint64_t *)&qword_256A95180, (uint64_t *)&unk_256A94FB0, MEMORY[0x24BEE12E8]);
  sub_23BCD79E4();
  swift_endAccess();
  swift_release();

  swift_release();
  swift_release();
  return v22;
}

void sub_23BCA4828(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x2426100E8](v1);
  if (v2)
  {
    v3 = (void *)v2;
    sub_23BCA4878();

  }
}

void sub_23BCA4878()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;

  if (objc_msgSend(v0, sel_isViewLoaded))
  {
    sub_23BCA4CAC();
    v1 = sub_23BCA5048();
    MEMORY[0x24BDAC7A8](v1);
    swift_getKeyPath();
    sub_23BCD80A4();
    swift_release();
    sub_23BCA52B4(v2, 0, 0, 0);
  }
}

void sub_23BCA4948(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  v3 = a3;
  sub_23BCA7670();
}

Swift::Void __swiftcall AnotherTabBarController.viewDidLoad()()
{
  void *v0;
  uint64_t v1;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v2, sel_viewDidLoad);
  if (qword_256A94940 != -1)
    swift_once();
  v1 = sub_23BCD79CC();
  __swift_project_value_buffer(v1, (uint64_t)qword_256AA0FA0);
  sub_23BCD79A8();
  sub_23BCA4878();
}

void sub_23BCA4A30(void *a1)
{
  id v1;

  v1 = a1;
  AnotherTabBarController.viewDidLoad()();

}

Swift::Void __swiftcall AnotherTabBarController.viewWillAppear(_:)(Swift::Bool a1)
{
  _QWORD *v1;
  objc_class *ObjectType;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  v5 = type metadata accessor for TabBarAction(0, *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v1) + 0x50), *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v1) + 0x58), v4);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v9 - v7;
  v9.receiver = v1;
  v9.super_class = ObjectType;
  objc_msgSendSuper2(&v9, sel_viewWillAppear_, a1);
  swift_storeEnumTagMultiPayload();
  sub_23BCD80BC();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

void sub_23BCA4B3C(void *a1, uint64_t a2, Swift::Bool a3)
{
  id v4;

  v4 = a1;
  AnotherTabBarController.viewWillAppear(_:)(a3);

}

Swift::Void __swiftcall AnotherTabBarController._observeScrollViewDidScroll(_:)(UIScrollView_optional *a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v3 = AnotherTabBarController.selectedViewController.getter();
  if (v3)
  {
    v9 = (id)v3;
    objc_opt_self();
    v4 = (void *)swift_dynamicCastObjCClass();
    if (!v4)
      goto LABEL_9;
    v5 = objc_msgSend(v4, sel_topViewController);
    if (!v5)
      goto LABEL_9;
    v6 = v5;
    if (!*(_QWORD *)(v1 + qword_256A95170))
    {
LABEL_8:

LABEL_9:
      return;
    }
    if (a1)
    {
      v7 = objc_msgSend(v5, sel_view);
      if (v7)
      {
        v8 = v7;
        objc_msgSend(v7, sel_safeAreaInsets);

        goto LABEL_8;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
}

void sub_23BCA4C54(void *a1, uint64_t a2, UIScrollView_optional *a3)
{
  UIScrollView_optional *v5;
  id v6;

  v5 = a3;
  v6 = a1;
  AnotherTabBarController._observeScrollViewDidScroll(_:)(a3);

}

uint64_t sub_23BCA4CAC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v1 = (uint64_t)v0;
  v2 = *MEMORY[0x24BEE4EA0] & *v0;
  v3 = (uint64_t *)(v1 + qword_256A95138);
  swift_beginAccess();
  v4 = *(_QWORD *)(v2 + 80);
  v5 = *(_QWORD *)(v2 + 88);
  v26 = v4;
  v27 = v5;
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  sub_23BCD80A4();
  swift_release();
  v6 = sub_23BCD8218();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  if ((v6 & 1) == 0)
  {
    if (qword_256A94940 != -1)
      swift_once();
    v8 = sub_23BCD79CC();
    __swift_project_value_buffer(v8, (uint64_t)qword_256AA0FA0);
    v9 = sub_23BCD79A8();
    MEMORY[0x24BDAC7A8](v9);
    v24 = v4;
    v25 = v5;
    swift_getKeyPath();
    sub_23BCD80A4();
    swift_release();
    *v3 = v28;
    v10 = swift_bridgeObjectRelease();
    v28 = *v3;
    MEMORY[0x24BDAC7A8](v10);
    v24 = v1;
    v11 = sub_23BCD8200();
    v12 = (char *)sub_23BCA3724(0, qword_256A94FD0);
    swift_bridgeObjectRetain();
    v13 = MEMORY[0x24260FFB0](MEMORY[0x24BEE12E0], v11);
    v15 = sub_23BCBA904((void (*)(char *, char *))sub_23BCA7A78, (uint64_t)&v23, v11, v12, MEMORY[0x24BEE4078], v13, MEMORY[0x24BEE40A8], v14);
    swift_bridgeObjectRelease();
    v16 = (uint64_t *)(v1 + qword_256A95140);
    swift_beginAccess();
    *v16 = v15;
    swift_bridgeObjectRelease();
    v17 = *(_QWORD *)(v1 + qword_256A95170);
    if (v17)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(v17 + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_floatingTabView)+ OBJC_IVAR____TtC14FitnessAppRoot15FloatingTabView_segmentedControl), sel_removeAllSegments, v26, v27);
      sub_23BCCB264();
    }
    v18 = *v16;
    if ((unint64_t)*v16 >> 62)
    {
      swift_bridgeObjectRetain_n();
      result = sub_23BCD84B8();
      v19 = result;
      if (result)
        goto LABEL_8;
    }
    else
    {
      v19 = *(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10);
      result = swift_bridgeObjectRetain_n();
      if (v19)
      {
LABEL_8:
        if (v19 < 1)
        {
          __break(1u);
          return result;
        }
        for (i = 0; i != v19; ++i)
        {
          if ((v18 & 0xC000000000000001) != 0)
            v21 = (id)MEMORY[0x24260F968](i, v18);
          else
            v21 = *(id *)(v18 + 8 * i + 32);
          v22 = v21;
          sub_23BCA61D0(i, v21, v1);

        }
      }
    }
    return swift_bridgeObjectRelease_n();
  }
  return result;
}

uint64_t sub_23BCA5048()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t result;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  double v15;
  __int128 v16;
  char v17;

  v1 = v0;
  v16 = *(_OWORD *)((*MEMORY[0x24BEE4EA0] & *v0) + 0x50);
  swift_getKeyPath();
  sub_23BCD80A4();
  result = swift_release();
  if (v17 == 1)
  {
    v3 = AnotherTabBarController.selectedViewController.getter();
    if (!v3)
      return sub_23BCA63B4(v1);
    v4 = (void *)v3;
    objc_opt_self();
    v5 = swift_dynamicCastObjCClass();
    if (v5)
    {
      v6 = (void *)v5;
      if (qword_256A94940 != -1)
        swift_once();
      v7 = sub_23BCD79CC();
      __swift_project_value_buffer(v7, (uint64_t)qword_256AA0FA0);
      sub_23BCD79A8();
      v8 = objc_msgSend(v6, sel_viewControllers, v16);
      sub_23BCA3724(0, qword_256A94FD0);
      v9 = sub_23BCD81B8();

      if (v9 >> 62)
      {
        swift_bridgeObjectRetain();
        v10 = sub_23BCD84B8();
        swift_bridgeObjectRelease();
      }
      else
      {
        v10 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      if (v10 != 1)
      {
        v12 = objc_msgSend(v6, sel_popToRootViewControllerAnimated_, 1);
LABEL_13:

        goto LABEL_14;
      }
      v11 = objc_msgSend(v6, sel_topViewController);
      if (v11)
      {
        v12 = v11;
        v13 = objc_msgSend(v11, sel_contentScrollViewForEdge_, 1);
        if (v13)
        {
          v14 = v13;
          objc_msgSend(v13, sel_adjustedContentInset);
          objc_msgSend(v14, sel_setContentOffset_animated_, 1, 0.0, -v15);

          v4 = v14;
        }
        goto LABEL_13;
      }
    }
LABEL_14:

    return sub_23BCA63B4(v1);
  }
  return result;
}

void sub_23BCA52B4(uint64_t a1, char a2, void (*a3)(void), uint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;

  v9 = v4 + qword_256A95130;
  swift_beginAccess();
  if ((*(_BYTE *)(v9 + 8) & 1) != 0 || *(_QWORD *)v9 != a1)
  {
    if (qword_256A94940 != -1)
      swift_once();
    v10 = sub_23BCD79CC();
    __swift_project_value_buffer(v10, (uint64_t)qword_256AA0FA0);
    sub_23BCD79A8();
    v11 = a2 & 1;
    sub_23BCA5554(v11, 0, 0);
    *(_QWORD *)v9 = a1;
    *(_BYTE *)(v9 + 8) = 0;
    v12 = *(_QWORD *)(v4 + qword_256A95170);
    if (v12)
      objc_msgSend(*(id *)(*(_QWORD *)(v12 + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_floatingTabView)+ OBJC_IVAR____TtC14FitnessAppRoot15FloatingTabView_segmentedControl), sel_setSelectedSegmentIndex_, a1);
    sub_23BCA5828(v11, a3, a4);
  }
}

Swift::Void __swiftcall AnotherTabBarController.selectItem(at:)(Swift::Int at)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  Swift::Int *v7;
  uint64_t v8;
  uint64_t v9;

  v4 = type metadata accessor for TabBarAction(0, *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v2) + 0x50), *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v2) + 0x58), v1);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (uint64_t *)((char *)&v9 - v6);
  if (qword_256A94940 != -1)
    swift_once();
  v8 = sub_23BCD79CC();
  __swift_project_value_buffer(v8, (uint64_t)qword_256AA0FA0);
  sub_23BCD79A8();
  *v7 = at;
  swift_storeEnumTagMultiPayload();
  sub_23BCD80BC();
  (*(void (**)(Swift::Int *, uint64_t))(v5 + 8))(v7, v4);
}

void sub_23BCA5554(char a1, void (*a2)(void), uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  uint64_t aBlock;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD *v26;

  v7 = AnotherTabBarController.selectedViewController.getter();
  if (v7)
  {
    v20 = (id)v7;
    if (qword_256A94940 != -1)
      swift_once();
    v8 = sub_23BCD79CC();
    __swift_project_value_buffer(v8, (uint64_t)qword_256AA0FA0);
    sub_23BCD79A8();
    if (*(_QWORD *)(v3 + qword_256A95170))
      sub_23BCA730C(0, v20);
    objc_msgSend(v20, sel_willMoveToParentViewController_, 0);
    if ((a1 & 1) != 0)
    {
      v9 = (void *)objc_opt_self();
      v10 = swift_allocObject();
      *(_QWORD *)(v10 + 16) = v20;
      v25 = sub_23BCA7A10;
      v26 = (_QWORD *)v10;
      v11 = MEMORY[0x24BDAC760];
      aBlock = MEMORY[0x24BDAC760];
      v22 = 1107296256;
      v23 = sub_23BCA4214;
      v24 = &block_descriptor_31;
      v12 = _Block_copy(&aBlock);
      v13 = v20;
      swift_release();
      v14 = (_QWORD *)swift_allocObject();
      v14[2] = v13;
      v14[3] = a2;
      v14[4] = a3;
      v25 = sub_23BCA7A60;
      v26 = v14;
      aBlock = v11;
      v22 = 1107296256;
      v23 = sub_23BCA6660;
      v24 = &block_descriptor_37;
      v15 = _Block_copy(&aBlock);
      v16 = v13;
      sub_23BCA79B4((uint64_t)a2);
      swift_release();
      objc_msgSend(v9, sel_animateWithDuration_animations_completion_, v12, v15, 0.33);
      _Block_release(v15);
      _Block_release(v12);

    }
    else
    {
      v17 = objc_msgSend(v20, sel_view);
      if (v17)
      {
        v18 = v17;
        objc_msgSend(v17, sel_removeFromSuperview);

        v19 = objc_msgSend(v20, sel_removeFromParentViewController);
        if (a2)
          ((void (*)(id))a2)(v19);

      }
      else
      {
        __break(1u);
      }
    }
  }
  else if (a2)
  {
    a2();
  }
}

void sub_23BCA5828(char a1, void (*a2)(void), uint64_t a3)
{
  char *v3;
  void *v4;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void (*v38)(void);
  char v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  id v58;
  _QWORD *v59;
  void *v60;
  id v61;
  id v62;
  id v63;
  uint64_t v64;
  id v65;
  uint64_t aBlock;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  _QWORD *v71;

  v4 = v3;
  v8 = AnotherTabBarController.selectedViewController.getter();
  if (!v8)
  {
    if (a2)
      a2();
    return;
  }
  v65 = (id)v8;
  if (qword_256A94940 != -1)
    swift_once();
  v9 = sub_23BCD79CC();
  __swift_project_value_buffer(v9, (uint64_t)qword_256AA0FA0);
  sub_23BCD79A8();
  v10 = *(void **)&v3[qword_256A95170];
  if (v10)
  {
    v11 = v10;
    sub_23BCA730C((uint64_t)v10, v65);

  }
  objc_msgSend(v4, sel_addChildViewController_, v65, a3);
  v12 = objc_msgSend(v4, sel_view);
  if (!v12)
  {
    __break(1u);
    goto LABEL_27;
  }
  v13 = v12;
  v14 = objc_msgSend(v65, sel_view);
  if (!v14)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v15 = v14;
  objc_msgSend(v13, sel_addSubview_, v14);

  v16 = objc_msgSend(v65, sel_view);
  if (!v16)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v17 = v16;
  objc_msgSend(v16, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256A94FC0);
  v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_23BCDA2E0;
  v19 = objc_msgSend(v65, sel_view);
  if (!v19)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  v20 = v19;
  v21 = objc_msgSend(v19, sel_topAnchor);

  v22 = objc_msgSend(v4, sel_view);
  if (!v22)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  v23 = v22;
  v24 = objc_msgSend(v22, sel_topAnchor);

  v25 = objc_msgSend(v21, sel_constraintEqualToAnchor_, v24);
  *(_QWORD *)(v18 + 32) = v25;
  v26 = objc_msgSend(v65, sel_view);
  if (!v26)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  v27 = v26;
  v28 = objc_msgSend(v26, sel_bottomAnchor);

  v29 = objc_msgSend(v4, sel_view);
  if (!v29)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v30 = v29;
  v31 = objc_msgSend(v29, sel_bottomAnchor);

  v32 = objc_msgSend(v28, sel_constraintEqualToAnchor_, v31);
  *(_QWORD *)(v18 + 40) = v32;
  v33 = objc_msgSend(v65, sel_view);
  if (!v33)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  v34 = v33;
  v35 = objc_msgSend(v33, sel_leadingAnchor);

  v36 = objc_msgSend(v4, sel_view);
  if (!v36)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  v37 = v36;
  v38 = a2;
  v39 = a1;
  v40 = objc_msgSend(v36, sel_leadingAnchor);

  v41 = objc_msgSend(v35, sel_constraintEqualToAnchor_, v40);
  *(_QWORD *)(v18 + 48) = v41;
  v42 = objc_msgSend(v65, sel_view);
  if (!v42)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  v43 = v42;
  v44 = objc_msgSend(v42, sel_trailingAnchor);

  v45 = objc_msgSend(v4, sel_view);
  if (!v45)
  {
LABEL_36:
    __break(1u);
LABEL_37:
    __break(1u);
    return;
  }
  v46 = v45;
  v47 = (void *)objc_opt_self();
  v48 = objc_msgSend(v46, sel_trailingAnchor);

  v49 = objc_msgSend(v44, sel_constraintEqualToAnchor_, v48);
  *(_QWORD *)(v18 + 56) = v49;
  aBlock = v18;
  sub_23BCD81C4();
  sub_23BCA3724(0, &qword_256A96280);
  v50 = (void *)sub_23BCD81AC();
  swift_bridgeObjectRelease();
  objc_msgSend(v47, sel_activateConstraints_, v50);

  if ((v39 & 1) != 0)
  {
    v51 = objc_msgSend(v65, sel_view);
    if (v51)
    {
      v52 = v51;
      v53 = (uint64_t)v38;
      objc_msgSend(v51, sel_setAlpha_, 0.0);

      v54 = (void *)objc_opt_self();
      v55 = swift_allocObject();
      *(_QWORD *)(v55 + 16) = v65;
      v70 = sub_23BCA78F4;
      v71 = (_QWORD *)v55;
      v56 = MEMORY[0x24BDAC760];
      aBlock = MEMORY[0x24BDAC760];
      v67 = 1107296256;
      v68 = sub_23BCA4214;
      v69 = &block_descriptor_0;
      v57 = _Block_copy(&aBlock);
      v58 = v65;
      swift_release();
      v59 = (_QWORD *)swift_allocObject();
      v59[2] = v58;
      v59[3] = v4;
      v59[4] = v53;
      v59[5] = v64;
      v70 = sub_23BCA7964;
      v71 = v59;
      aBlock = v56;
      v67 = 1107296256;
      v68 = sub_23BCA6660;
      v69 = &block_descriptor_16;
      v60 = _Block_copy(&aBlock);
      v61 = v58;
      v62 = v4;
      sub_23BCA79B4(v53);
      swift_release();
      objc_msgSend(v54, sel_animateWithDuration_animations_completion_, v57, v60, 0.33);
      _Block_release(v60);
      _Block_release(v57);

      return;
    }
    goto LABEL_37;
  }
  objc_msgSend(v65, sel_didMoveToParentViewController_, v4);
  v63 = objc_msgSend(v65, sel_setNeedsFocusUpdate);
  if (v38)
    ((void (*)(id))v38)(v63);

}

void sub_23BCA5EE4(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  id v28;

  v24 = a3;
  v25 = sub_23BCD7984();
  v5 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = (id)(*(uint64_t (**)(uint64_t, uint64_t, _UNKNOWN **))(a2 + qword_256A95168))(a1, a2, &protocol witness table for AnotherTabBarController<A>);
  v8 = objc_msgSend(v28, sel_tabBarItem);
  if (!v8)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v9 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v11 = *(_QWORD *)(v10 + 80);
  v12 = *(_QWORD *)(v10 + 88);
  *(&v23 - 2) = v11;
  *(&v23 - 1) = v12;
  swift_getKeyPath();
  sub_23BCD80A4();
  swift_release();
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 72))(v7, v11, v12);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v25);
  v13 = (void *)sub_23BCD8140();
  swift_bridgeObjectRelease();
  objc_msgSend(v9, sel_setTitle_, v13);

  v14 = (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 48))(v11, v12);
  v15 = v28;
  if ((v14 & 1) == 0)
  {
LABEL_5:
    v20 = objc_msgSend(v15, sel_tabBarItem);
    if (v20)
    {
      v21 = v20;
      v26 = 0;
      v27 = 0xE000000000000000;
      sub_23BCD8428();
      sub_23BCD8188();
      sub_23BCD859C();
      v22 = (void *)sub_23BCD8140();
      swift_bridgeObjectRelease();
      objc_msgSend(v21, sel_setAccessibilityIdentifier_, v22);

      *v24 = v15;
      return;
    }
    goto LABEL_8;
  }
  v16 = objc_msgSend(v28, sel_tabBarItem);
  if (v16)
  {
    v17 = v16;
    (*(void (**)(uint64_t, uint64_t))(v12 + 64))(v11, v12);
    v18 = (void *)sub_23BCD8140();
    swift_bridgeObjectRelease();
    v19 = objc_msgSend((id)objc_opt_self(), sel_systemImageNamed_, v18);

    objc_msgSend(v17, sel_setImage_, v19);
    goto LABEL_5;
  }
LABEL_9:
  __break(1u);
}

void sub_23BCA61D0(uint64_t a1, id a2, uint64_t a3)
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v6 = objc_msgSend(a2, sel_tabBarItem);
  if (!v6)
  {
    __break(1u);
    goto LABEL_15;
  }
  v7 = v6;
  v13 = objc_msgSend(v6, sel_image);

  v8 = *(_QWORD *)(a3 + qword_256A95170);
  if (v13)
  {
    if (v8)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(v8 + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_floatingTabView)+ OBJC_IVAR____TtC14FitnessAppRoot15FloatingTabView_segmentedControl), sel_insertSegmentWithImage_atIndex_animated_);
      sub_23BCCB264();
    }

    return;
  }
  if (!v8)
    return;
  v9 = objc_msgSend(a2, sel_tabBarItem);
  if (!v9)
  {
LABEL_15:
    __break(1u);
    return;
  }
  v10 = v9;
  v11 = objc_msgSend(v9, sel_title);

  if (v11)
  {
    sub_23BCD8164();

    v12 = *(void **)(*(_QWORD *)(v8 + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_floatingTabView)
                   + OBJC_IVAR____TtC14FitnessAppRoot15FloatingTabView_segmentedControl);
    v11 = (id)sub_23BCD8140();
  }
  else
  {
    v12 = *(void **)(*(_QWORD *)(v8 + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_floatingTabView)
                   + OBJC_IVAR____TtC14FitnessAppRoot15FloatingTabView_segmentedControl);
  }
  objc_msgSend(v12, sel_insertSegmentWithTitle_atIndex_animated_, v11, a1, 0);

  sub_23BCCB264();
  swift_bridgeObjectRelease();
}

uint64_t sub_23BCA63B4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  _QWORD aBlock[6];

  v1 = *MEMORY[0x24BEE4EA0] & *a1;
  v2 = sub_23BCD80D4();
  v15 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23BCD80EC();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23BCA3724(0, (unint64_t *)&unk_256A95300);
  v9 = (void *)sub_23BCD8368();
  v10 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = *(_QWORD *)(v1 + 80);
  v11[3] = *(_QWORD *)(v1 + 88);
  v11[4] = v10;
  aBlock[4] = sub_23BCA7A6C;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23BCA4214;
  aBlock[3] = &block_descriptor_45;
  v12 = _Block_copy(aBlock);
  swift_release();
  sub_23BCD80E0();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_23BCA3798();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A95310);
  sub_23BCA37E0((unint64_t *)&unk_256A95070, &qword_256A95310, MEMORY[0x24BEE12C8]);
  sub_23BCD83C8();
  MEMORY[0x24260F89C](0, v8, v4, v12);
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v15 + 8))(v4, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

id sub_23BCA65E8(int a1, id a2, uint64_t (*a3)(id))
{
  id result;
  id v6;

  result = objc_msgSend(a2, sel_view);
  if (result)
  {
    v6 = result;
    objc_msgSend(result, sel_removeFromSuperview);

    result = objc_msgSend(a2, sel_removeFromParentViewController);
    if (a3)
      return (id)a3(result);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_23BCA6660(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

void sub_23BCA669C(void *a1, double a2)
{
  id v3;
  id v4;

  v3 = objc_msgSend(a1, sel_view);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_setAlpha_, a2);

  }
  else
  {
    __break(1u);
  }
}

void __swiftcall AnotherTabBarController.contentScrollView(for:)(UIScrollView_optional *__return_ptr retstr, NSDirectionalRectEdge a2)
{
  void *v2;
  objc_class *ObjectType;
  void *v5;
  void *v6;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v5 = (void *)AnotherTabBarController.selectedViewController.getter();
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, sel_contentScrollViewForEdge_, a2);

  }
  else
  {
    v7.receiver = v2;
    v7.super_class = ObjectType;
    -[UIScrollView_optional contentScrollViewForEdge:](&v7, sel_contentScrollViewForEdge_, a2);
  }
}

id sub_23BCA6784(void *a1, uint64_t a2, NSDirectionalRectEdge a3)
{
  id v4;
  UIScrollView_optional *v5;
  void *v6;
  void *v7;

  v4 = a1;
  AnotherTabBarController.contentScrollView(for:)(v5, a3);
  v7 = v6;

  return v7;
}

id sub_23BCA67BC(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  v2 = AnotherTabBarController.supportedInterfaceOrientations.getter();

  return v2;
}

id AnotherTabBarController.supportedInterfaceOrientations.getter()
{
  void *v0;
  objc_class *ObjectType;
  void *v2;
  void *v3;
  id v4;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v2 = (void *)AnotherTabBarController.selectedViewController.getter();
  if (v2)
  {
    v3 = v2;
    v4 = objc_msgSend(v2, sel_supportedInterfaceOrientations);

    return v4;
  }
  else
  {
    v6.receiver = v0;
    v6.super_class = ObjectType;
    return objc_msgSendSuper2(&v6, sel_supportedInterfaceOrientations);
  }
}

id sub_23BCA685C(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = a1;
  v2 = AnotherTabBarController.keyCommands.getter();

  if (v2)
  {
    sub_23BCA3724(0, qword_256A96160);
    v3 = (void *)sub_23BCD81AC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

uint64_t AnotherTabBarController.keyCommands.getter()
{
  void *v0;
  objc_class *ObjectType;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  v2 = (void *)AnotherTabBarController.selectedViewController.getter();
  if (!v2)
  {
    v9.receiver = v0;
    v9.super_class = ObjectType;
    v7 = objc_msgSendSuper2(&v9, sel_keyCommands);
    if (v7)
    {
      v3 = v7;
      sub_23BCA3724(0, qword_256A96160);
      v6 = sub_23BCD81B8();
      goto LABEL_6;
    }
    return 0;
  }
  v3 = v2;
  v4 = objc_msgSend(v2, sel_keyCommands);
  if (!v4)
  {

    return 0;
  }
  v5 = v4;
  sub_23BCA3724(0, qword_256A96160);
  v6 = sub_23BCD81B8();

LABEL_6:
  return v6;
}

id sub_23BCA69B4(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  AnotherTabBarController.preferredFocusEnvironments.getter();

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256A96270);
  v2 = (void *)sub_23BCD81AC();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t AnotherTabBarController.preferredFocusEnvironments.getter()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  __swift_instantiateConcreteTypeFromMangledName(qword_256A951F0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23BCDA510;
  *(_QWORD *)(inited + 32) = AnotherTabBarController.selectedViewController.getter();
  sub_23BCD81C4();
  v1 = MEMORY[0x24BEE4AF8];
  v4 = MEMORY[0x24BEE4AF8];
  if (*(_QWORD *)(inited + 32))
  {
    v2 = swift_unknownObjectRetain();
    MEMORY[0x24260F6C8](v2);
    if (*(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_23BCD81D0();
    sub_23BCD81E8();
    sub_23BCD81C4();
    v1 = v4;
  }
  swift_bridgeObjectRelease();
  return v1;
}

id sub_23BCA6AE8(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  v2 = AnotherTabBarController.childForStatusBarStyle.getter();

  return v2;
}

id AnotherTabBarController.childForStatusBarStyle.getter()
{
  return sub_23BCA6C40((SEL *)&selRef_childViewControllerForStatusBarStyle);
}

id sub_23BCA6B24(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  v2 = AnotherTabBarController.childForStatusBarHidden.getter();

  return v2;
}

id AnotherTabBarController.childForStatusBarHidden.getter()
{
  return sub_23BCA6C40((SEL *)&selRef_childViewControllerForStatusBarHidden);
}

uint64_t sub_23BCA6B60(void *a1)
{
  id v1;
  unsigned __int8 v2;

  v1 = a1;
  v2 = AnotherTabBarController.prefersHomeIndicatorAutoHidden.getter();

  return v2 & 1;
}

id AnotherTabBarController.prefersHomeIndicatorAutoHidden.getter()
{
  void *v0;
  objc_class *ObjectType;
  void *v2;
  void *v3;
  id v4;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v2 = (void *)AnotherTabBarController.selectedViewController.getter();
  if (v2)
  {
    v3 = v2;
    v4 = objc_msgSend(v2, sel_prefersHomeIndicatorAutoHidden);

  }
  else
  {
    v6.receiver = v0;
    v6.super_class = ObjectType;
    return objc_msgSendSuper2(&v6, sel_prefersHomeIndicatorAutoHidden);
  }
  return v4;
}

id sub_23BCA6C04(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  v2 = AnotherTabBarController.childForHomeIndicatorAutoHidden.getter();

  return v2;
}

id AnotherTabBarController.childForHomeIndicatorAutoHidden.getter()
{
  return sub_23BCA6C40((SEL *)&selRef_childViewControllerForHomeIndicatorAutoHidden);
}

id sub_23BCA6C40(SEL *a1)
{
  void *v1;
  objc_class *ObjectType;
  id result;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  result = (id)AnotherTabBarController.selectedViewController.getter();
  if (!result)
  {
    v5.receiver = v1;
    v5.super_class = ObjectType;
    return objc_msgSendSuper2(&v5, *a1);
  }
  return result;
}

void sub_23BCA6C98(void *a1, double a2, CGFloat a3)
{
  CGColorSpace *DeviceRGB;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  const __CFArray *v14;
  CGGradient *v15;
  CGContext *v16;
  __int128 v17;
  uint64_t v18;
  CGPoint v19;
  CGPoint v20;

  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256A94FC0);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_23BCDA520;
  v8 = (void *)objc_opt_self();
  v9 = objc_msgSend(v8, sel_blackColor);
  v10 = objc_msgSend(v9, sel_colorWithAlphaComponent_, 0.8);

  v11 = objc_msgSend(v10, sel_CGColor);
  *(_QWORD *)(v7 + 32) = v11;
  v12 = objc_msgSend(v8, sel_clearColor);
  v13 = objc_msgSend(v12, sel_CGColor);

  *(_QWORD *)(v7 + 40) = v13;
  v18 = v7;
  sub_23BCD81C4();
  type metadata accessor for CGColor(0);
  v14 = (const __CFArray *)sub_23BCD81AC();
  swift_bridgeObjectRelease();
  v17 = xmmword_23BCDA530;
  v15 = CGGradientCreateWithColors(DeviceRGB, v14, (const CGFloat *)&v17);

  if (v15)
  {
    v16 = (CGContext *)objc_msgSend(a1, sel_CGContext);
    v19.y = 0.0;
    v19.x = a2 * 0.5;
    v20.x = a2 * 0.5;
    v20.y = a3;
    CGContextDrawLinearGradient(v16, v15, v19, v20, 0);

  }
}

void sub_23BCA6E64(uint64_t a1, void *a2)
{
  void (*v2)(void);
  id v3;

  v2 = *(void (**)(void))(a1 + 32);
  v3 = a2;
  v2();

}

id AnotherTabBarController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_23BCD8140();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void AnotherTabBarController.init(nibName:bundle:)()
{
  sub_23BCA774C();
}

void sub_23BCA6F28(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v4;

  v4 = a4;
  sub_23BCA774C();
}

id AnotherTabBarController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23BCA6F98(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_23BCA7024(int a1, Swift::Int at)
{
  j___s14FitnessAppRoot23AnotherTabBarControllerC10selectItem2atySi_tF(at);
}

uint64_t sub_23BCA7030(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t result;
  void *v10;
  uint64_t v11;

  v5 = type metadata accessor for TabBarAction(0, a2, a3, a4);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v11 - v7;
  swift_beginAccess();
  result = MEMORY[0x2426100E8](a1 + 16);
  if (result)
  {
    v10 = (void *)result;
    swift_retain();

    swift_storeEnumTagMultiPayload();
    sub_23BCD80BC();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return result;
}

uint64_t sub_23BCA710C()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_23BCA7130()
{
  swift_release();
  return swift_deallocObject();
}

void sub_23BCA7154()
{
  uint64_t v0;

  sub_23BCA4828(*(_QWORD *)(v0 + 32));
}

uint64_t sub_23BCA7160()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23BCA7184(uint64_t a1)
{
  uint64_t v1;

  return sub_23BCA1AA4(a1, *(uint64_t (**)(void))(v1 + 16));
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_23BCA71A4(double a1, double a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t result;
  _QWORD v10[6];

  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD618]), sel_initWithSize_, a1, a2);
  v5 = swift_allocObject();
  *(double *)(v5 + 16) = a1;
  *(double *)(v5 + 24) = a2;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_23BCA79D4;
  *(_QWORD *)(v6 + 24) = v5;
  v10[4] = sub_23BCA3440;
  v10[5] = v6;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1107296256;
  v10[2] = sub_23BCA6E64;
  v10[3] = &block_descriptor_25;
  v7 = _Block_copy(v10);
  swift_retain();
  swift_release();
  v8 = objc_msgSend(v4, sel_imageWithActions_, v7);

  _Block_release(v7);
  LOBYTE(v4) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((v4 & 1) == 0)
    return (uint64_t)v8;
  __break(1u);
  return result;
}

void sub_23BCA730C(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  unint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;

  objc_opt_self();
  v4 = swift_dynamicCastObjCClass();
  if (!v4)
  {
    v23 = objc_msgSend(a2, sel_navigationItem);
    objc_msgSend(v23, sel_setTitleView_, a1);
LABEL_13:

    return;
  }
  v5 = (void *)v4;
  v6 = a2;
  v7 = objc_msgSend(v5, sel_viewControllers);
  sub_23BCA3724(0, qword_256A94FD0);
  v8 = sub_23BCD81B8();

  if (v8 >> 62)
  {
    swift_bridgeObjectRetain();
    v12 = sub_23BCD84B8();
    swift_bridgeObjectRelease();
    if (v12)
      goto LABEL_4;
LABEL_10:
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  if (!*(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_10;
LABEL_4:
  if ((v8 & 0xC000000000000001) != 0)
  {
    v9 = (id)MEMORY[0x24260F968](0, v8);
  }
  else
  {
    if (!*(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_16;
    }
    v9 = *(id *)(v8 + 32);
  }
  v10 = v9;
  swift_bridgeObjectRelease();
  v11 = objc_msgSend(v10, sel_navigationItem);

  objc_msgSend(v11, sel_setTitleView_, a1);
LABEL_11:
  v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD790]), sel_init);
  objc_msgSend(v13, sel_configureWithTransparentBackground);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256A94FC0);
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_23BCDA540;
  v15 = v13;
  v16 = (void *)sub_23BCA71A4(100.0, 100.0);
  v17 = objc_msgSend((id)objc_opt_self(), sel_effectWithVariableBlurRadius_imageMask_, v16, 25.0);

  if (v17)
  {
    *(_QWORD *)(v14 + 32) = v17;
    sub_23BCD81C4();
    sub_23BCA3724(0, &qword_256A952F8);
    v18 = (void *)sub_23BCD81AC();
    swift_bridgeObjectRelease();
    objc_msgSend(v15, sel_setBackgroundEffects_, v18);

    v19 = (void *)sub_23BCA71A4(100.0, 100.0);
    objc_msgSend(v15, sel_setBackgroundImage_, v19);

    objc_msgSend(v15, sel_setBackgroundImageContentMode_, 0);
    v20 = (void *)objc_opt_self();
    v21 = v15;
    v22 = objc_msgSend(v20, sel_clearColor);
    objc_msgSend(v21, sel_setShadowColor_, v22);

    v23 = objc_msgSend(v5, sel_navigationBar);
    objc_msgSend(v23, sel_setStandardAppearance_, v21);

    goto LABEL_13;
  }
LABEL_16:
  __break(1u);
}

void sub_23BCA7670()
{
  char *v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;

  swift_unknownObjectWeakInit();
  v1 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v0[qword_256A95158] = MEMORY[0x24BEE4AF8];
  v2 = &v0[qword_256A95130];
  *(_QWORD *)v2 = 0;
  v2[8] = 1;
  v3 = qword_256A95138;
  *(_QWORD *)&v0[v3] = sub_23BCD81DC();
  *(_QWORD *)&v0[qword_256A95140] = v1;

  sub_23BCD84AC();
  __break(1u);
}

void sub_23BCA774C()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_23BCA7778()
{
  JUMPOUT(0x24260FFB0);
}

uint64_t sub_23BCA7788()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for AnotherTabBarController(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AnotherTabBarController);
}

uint64_t method lookup function for AnotherTabBarController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AnotherTabBarController.__allocating_init(tabBarStyle:store:viewBuilder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t sub_23BCA7828(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23BCA7874 + 4 * byte_23BCDA555[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23BCA78A8 + 4 * byte_23BCDA550[v4]))();
}

uint64_t sub_23BCA78A8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BCA78B0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23BCA78B8);
  return result;
}

uint64_t sub_23BCA78C4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23BCA78CCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23BCA78D0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BCA78D8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t type metadata accessor for AnotherTabBarController.TabBarStyle(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AnotherTabBarController.TabBarStyle);
}

void sub_23BCA78F4()
{
  uint64_t v0;

  sub_23BCA669C(*(void **)(v0 + 16), 1.0);
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

uint64_t sub_23BCA7928()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 32))
    swift_release();
  return swift_deallocObject();
}

id sub_23BCA7964()
{
  _QWORD *v0;
  void *v1;
  uint64_t (*v2)(id);
  id result;

  v1 = (void *)v0[2];
  v2 = (uint64_t (*)(id))v0[4];
  objc_msgSend(v1, sel_didMoveToParentViewController_, v0[3]);
  result = objc_msgSend(v1, sel_setNeedsFocusUpdate);
  if (v2)
    return (id)v2(result);
  return result;
}

uint64_t sub_23BCA79B4(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_23BCA79C4()
{
  return swift_deallocObject();
}

void sub_23BCA79D4(void *a1)
{
  uint64_t v1;

  sub_23BCA6C98(a1, *(double *)(v1 + 16), *(CGFloat *)(v1 + 24));
}

uint64_t sub_23BCA79DC()
{
  return swift_deallocObject();
}

uint64_t sub_23BCA79EC()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_23BCA7A10()
{
  uint64_t v0;

  sub_23BCA669C(*(void **)(v0 + 16), 0.0);
}

uint64_t sub_23BCA7A2C()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 24))
    swift_release();
  return swift_deallocObject();
}

id sub_23BCA7A60(int a1)
{
  uint64_t v1;

  return sub_23BCA65E8(a1, *(id *)(v1 + 16), *(uint64_t (**)(id))(v1 + 24));
}

uint64_t sub_23BCA7A6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;

  return sub_23BCA7030(v4[4], v4[2], v4[3], a4);
}

void sub_23BCA7A78(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  sub_23BCA5EE4(a1, *(_QWORD *)(v2 + 16), a2);
}

uint64_t sub_23BCA7AC4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  MEMORY[0x24BDAC7A8](a1);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23BCD85C0();
  sub_23BCA8DD0(v1, (uint64_t)v3, type metadata accessor for DynamicContentFeature.TaskIdentifier);
  sub_23BCD85CC();
  v4 = sub_23BCD796C();
  sub_23BC9B4D8(&qword_256A95490, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23BCD8110();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  return sub_23BCD85F0();
}

uint64_t sub_23BCA7B9C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  MEMORY[0x24BDAC7A8](a1);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23BCA8DD0(v1, (uint64_t)v3, type metadata accessor for DynamicContentFeature.TaskIdentifier);
  sub_23BCD85CC();
  v4 = sub_23BCD796C();
  sub_23BC9B4D8(&qword_256A95490, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23BCD8110();
  return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

uint64_t sub_23BCA7C60(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  MEMORY[0x24BDAC7A8](a1);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23BCD85C0();
  sub_23BCA8DD0(v1, (uint64_t)v3, type metadata accessor for DynamicContentFeature.TaskIdentifier);
  sub_23BCD85CC();
  v4 = sub_23BCD796C();
  sub_23BC9B4D8(&qword_256A95490, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23BCD8110();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  return sub_23BCD85F0();
}

uint64_t sub_23BCA7D34(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  uint64_t v15;

  v4 = sub_23BCD796C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95498);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (uint64_t)&v11[*(int *)(v9 + 48)];
  sub_23BCA8DD0(a1, (uint64_t)v11, type metadata accessor for DynamicContentFeature.TaskIdentifier);
  sub_23BCA8DD0(a2, v12, type metadata accessor for DynamicContentFeature.TaskIdentifier);
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v11, v4);
  LOBYTE(a2) = sub_23BCD7954();
  v13 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v13(v12, v4);
  v13((uint64_t)v7, v4);
  return a2 & 1;
}

uint64_t DynamicContentFeature.init(environment:)@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X8>)
{
  _OWORD *v3;
  __int128 v4;

  v3 = (_OWORD *)(a2 + *(int *)(type metadata accessor for DynamicContentFeature(0) + 20));
  v4 = a1[1];
  *v3 = *a1;
  v3[1] = v4;
  return sub_23BCD7960();
}

uint64_t type metadata accessor for DynamicContentFeature(uint64_t a1)
{
  return sub_23BCA8464(a1, qword_256A953C8);
}

uint64_t DynamicContentFeature.reduce(localState:sharedState:sideEffects:action:)(uint64_t a1, uint64_t a2, unint64_t *a3, unsigned __int8 *a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  int v28;
  void (*v29)(char *, uint64_t, uint64_t);
  uint64_t v30;
  int *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t *v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t result;
  char v46;
  int *v47;
  char *v48;
  char *v49;
  char *v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t *v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  char *v63;
  char *v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t *v71;
  uint64_t v72;

  v71 = a3;
  v5 = type metadata accessor for DynamicContentFeature(0);
  v68 = *(_QWORD *)(v5 - 8);
  v6 = *(_QWORD *)(v68 + 64);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v63 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v63 - v9;
  v11 = type metadata accessor for DynamicContentFeature.TaskIdentifier(0);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v63 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v63 - v15;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95318);
  v69 = *(_QWORD *)(v17 - 8);
  v70 = v17;
  v18 = MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v63 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v63 - v21;
  v23 = sub_23BCD796C();
  MEMORY[0x24BDAC7A8](v23);
  v27 = (char *)&v63 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = *a4;
  if (v28 == 2)
  {
    v66 = v25;
    v29 = *(void (**)(char *, uint64_t, uint64_t))(v25 + 16);
    v30 = v24;
    v29(v27, v72, v24);
    v31 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_256A95320);
    v63 = &v22[v31[16]];
    v64 = &v22[v31[20]];
    v65 = &v22[v31[24]];
    v67 = v30;
    v29(v16, (uint64_t)v27, v30);
    sub_23BCA8DD0((uint64_t)v16, (uint64_t)v14, type metadata accessor for DynamicContentFeature.TaskIdentifier);
    sub_23BC9B4D8(&qword_256A95338, type metadata accessor for DynamicContentFeature.TaskIdentifier, (uint64_t)&unk_23BCDA7F8);
    sub_23BCD841C();
    sub_23BCA8E14((uint64_t)v16);
    sub_23BCD8260();
    v32 = *MEMORY[0x24BE2B580];
    v33 = sub_23BCD8098();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 104))(v63, v32, v33);
    v34 = *MEMORY[0x24BE2B550];
    v35 = sub_23BCD808C();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 104))(v64, v34, v35);
    sub_23BCA8DD0(v72, (uint64_t)v10, type metadata accessor for DynamicContentFeature);
    v36 = (*(unsigned __int8 *)(v68 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v68 + 80);
    v37 = swift_allocObject();
    sub_23BCA8BAC((uint64_t)v10, v37 + v36);
    v38 = v65;
    *(_QWORD *)v65 = &unk_256A95348;
    *((_QWORD *)v38 + 1) = v37;
    v40 = v69;
    v39 = v70;
    (*(void (**)(char *, _QWORD, uint64_t))(v69 + 104))(v22, *MEMORY[0x24BE2B438], v70);
    v41 = v71;
    v42 = *v71;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v42 = sub_23BCA98BC(0, *(_QWORD *)(v42 + 16) + 1, 1, v42, qword_256A954E8, &qword_256A95318);
    v44 = *(_QWORD *)(v42 + 16);
    v43 = *(_QWORD *)(v42 + 24);
    if (v44 >= v43 >> 1)
      v42 = sub_23BCA98BC(v43 > 1, v44 + 1, 1, v42, qword_256A954E8, &qword_256A95318);
    *(_QWORD *)(v42 + 16) = v44 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v40 + 32))(v42+ ((*(unsigned __int8 *)(v40 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80))+ *(_QWORD *)(v40 + 72) * v44, v22, v39);
    *v41 = v42;
    return (*(uint64_t (**)(char *, uint64_t))(v66 + 8))(v27, v67);
  }
  else
  {
    v46 = v28 & 1;
    v47 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_256A95320);
    v48 = &v20[v47[16]];
    v49 = &v20[v47[20]];
    v50 = &v20[v47[24]];
    *(_OWORD *)v20 = 0u;
    *((_OWORD *)v20 + 1) = 0u;
    *((_QWORD *)v20 + 4) = 0;
    sub_23BCA8DD0(v72, (uint64_t)v8, type metadata accessor for DynamicContentFeature);
    v51 = (*(unsigned __int8 *)(v68 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v68 + 80);
    v52 = swift_allocObject();
    sub_23BCA8BAC((uint64_t)v8, v52 + v51);
    *(_BYTE *)(v52 + v51 + v6) = v46;
    *(_QWORD *)v50 = &unk_256A95330;
    *((_QWORD *)v50 + 1) = v52;
    sub_23BCD8260();
    v53 = *MEMORY[0x24BE2B578];
    v54 = sub_23BCD8098();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v54 - 8) + 104))(v48, v53, v54);
    v55 = *MEMORY[0x24BE2B558];
    v56 = sub_23BCD808C();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v56 - 8) + 104))(v49, v55, v56);
    v58 = v69;
    v57 = v70;
    (*(void (**)(char *, _QWORD, uint64_t))(v69 + 104))(v20, *MEMORY[0x24BE2B438], v70);
    v59 = v71;
    v60 = *v71;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v60 = sub_23BCA98BC(0, *(_QWORD *)(v60 + 16) + 1, 1, v60, qword_256A954E8, &qword_256A95318);
    v62 = *(_QWORD *)(v60 + 16);
    v61 = *(_QWORD *)(v60 + 24);
    if (v62 >= v61 >> 1)
      v60 = sub_23BCA98BC(v61 > 1, v62 + 1, 1, v60, qword_256A954E8, &qword_256A95318);
    *(_QWORD *)(v60 + 16) = v62 + 1;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v58 + 32))(v60+ ((*(unsigned __int8 *)(v58 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v58 + 80))+ *(_QWORD *)(v58 + 72) * v62, v20, v57);
    *v59 = v60;
  }
  return result;
}

uint64_t type metadata accessor for DynamicContentFeature.TaskIdentifier(uint64_t a1)
{
  return sub_23BCA8464(a1, (uint64_t *)&unk_256A95478);
}

uint64_t sub_23BCA8464(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23BCA8498(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v2[12] = a1;
  v2[13] = a2;
  v2[14] = sub_23BCD8254();
  v2[15] = sub_23BCD8248();
  v2[16] = sub_23BCD8230();
  v2[17] = v3;
  return swift_task_switch();
}

uint64_t sub_23BCA8508()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  v1 = *(_QWORD *)(v0 + 104);
  v2 = v1 + *(int *)(type metadata accessor for DynamicContentFeature(0) + 20);
  v5 = (uint64_t (*)(uint64_t))(**(int **)(v2 + 16) + *(_QWORD *)(v2 + 16));
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 144) = v3;
  *v3 = v0;
  v3[1] = sub_23BCA8580;
  return v5(v0 + 16);
}

uint64_t sub_23BCA8580()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 152) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23BCA85E0()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = v0[5];
  v2 = __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  v3 = *(_QWORD *)(v1 - 8);
  v4 = swift_task_alloc();
  (*(void (**)(uint64_t, _QWORD *, uint64_t))(v3 + 16))(v4, v2, v1);
  v0[10] = swift_getAssociatedTypeWitness();
  v0[11] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v0 + 7);
  sub_23BCD8284();
  swift_task_dealloc();
  v0[20] = sub_23BCD8248();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 7), v0[10]);
  v5 = (_QWORD *)swift_task_alloc();
  v0[21] = v5;
  *v5 = v0;
  v5[1] = sub_23BCA8734;
  return sub_23BCD823C();
}

uint64_t sub_23BCA8734()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_23BCA8788()
{
  uint64_t v0;
  int v1;
  _QWORD *v3;

  v1 = *(unsigned __int8 *)(v0 + 184);
  if (v1 == 2)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 56);
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    *(_BYTE *)(v0 + 185) = v1 & 1;
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 176) = v3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A954E0);
    *v3 = v0;
    v3[1] = sub_23BCA8848;
    return sub_23BCD8080();
  }
}

uint64_t sub_23BCA8848()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23BCA8894()
{
  uint64_t *v0;
  _QWORD *v1;

  v0[20] = sub_23BCD8248();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 7), v0[10]);
  v1 = (_QWORD *)swift_task_alloc();
  v0[21] = (uint64_t)v1;
  *v1 = v0;
  v1[1] = sub_23BCA8734;
  return sub_23BCD823C();
}

uint64_t sub_23BCA8938()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23BCA896C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v4;

  *(_BYTE *)(v3 + 64) = a3;
  *(_QWORD *)(v3 + 16) = a2;
  sub_23BCD8254();
  *(_QWORD *)(v3 + 24) = sub_23BCD8248();
  *(_QWORD *)(v3 + 32) = sub_23BCD8230();
  *(_QWORD *)(v3 + 40) = v4;
  return swift_task_switch();
}

uint64_t sub_23BCA89DC()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t (*v5)(_QWORD);

  v1 = *(_QWORD *)(v0 + 16);
  v2 = (_QWORD *)(v1 + *(int *)(type metadata accessor for DynamicContentFeature(0) + 20));
  v5 = (uint64_t (*)(_QWORD))(*(int *)*v2 + *v2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v3;
  *v3 = v0;
  v3[1] = sub_23BCA8A4C;
  return v5(*(unsigned __int8 *)(v0 + 64));
}

uint64_t sub_23BCA8A4C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 56) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23BCA8AAC()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23BCA8AE0()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23BCA8B14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for DynamicContentFeature(0) - 8) + 80);
  v2 = v0 + ((v1 + 16) & ~v1);
  v3 = sub_23BCD796C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23BCA8BAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for DynamicContentFeature(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23BCA8BF0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  char v7;
  _QWORD *v8;

  v4 = *(_QWORD *)(type metadata accessor for DynamicContentFeature(0) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = v1 + v5;
  v7 = *(_BYTE *)(v1 + v5 + *(_QWORD *)(v4 + 64));
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_23BCA8C74;
  return sub_23BCA896C(a1, v6, v7);
}

uint64_t sub_23BCA8C74()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

_QWORD *sub_23BCA8CC4(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_256A954B8);
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
    sub_23BCA9BE8(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_23BCA8DD0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23BCA8E14(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for DynamicContentFeature.TaskIdentifier(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23BCA8E50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for DynamicContentFeature(0) - 8) + 80);
  v2 = v0 + ((v1 + 16) & ~v1);
  v3 = sub_23BCD796C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23BCA8EE4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for DynamicContentFeature(0) - 8) + 80);
  v5 = v1 + ((v4 + 16) & ~v4);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_23BCAA044;
  return sub_23BCA8498(a1, v5);
}

unint64_t sub_23BCA8F54()
{
  unint64_t result;

  result = qword_256A95350;
  if (!qword_256A95350)
  {
    result = MEMORY[0x24260FFB0](&protocol conformance descriptor for DynamicContentAction, &type metadata for DynamicContentAction);
    atomic_store(result, (unint64_t *)&qword_256A95350);
  }
  return result;
}

unint64_t sub_23BCA8F9C()
{
  unint64_t result;

  result = qword_256A95358;
  if (!qword_256A95358)
  {
    result = MEMORY[0x24260FFB0](&protocol conformance descriptor for DynamicContentAction, &type metadata for DynamicContentAction);
    atomic_store(result, (unint64_t *)&qword_256A95358);
  }
  return result;
}

unint64_t sub_23BCA8FE4()
{
  unint64_t result;

  result = qword_256A95360;
  if (!qword_256A95360)
  {
    result = MEMORY[0x24260FFB0](MEMORY[0x24BE2B430], MEMORY[0x24BE2B428]);
    atomic_store(result, (unint64_t *)&qword_256A95360);
  }
  return result;
}

uint64_t sub_23BCA9028()
{
  return sub_23BC9B4D8(&qword_256A95368, (uint64_t (*)(uint64_t))type metadata accessor for DynamicContentState, (uint64_t)&protocol conformance descriptor for DynamicContentState);
}

uint64_t *initializeBufferWithCopyOfBuffer for DynamicContentFeature(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    v4 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v7 = sub_23BCD796C();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v4, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)v4 + v8;
    v10 = (char *)a2 + v8;
    *(_QWORD *)v9 = *(_QWORD *)v10;
    v11 = *((_QWORD *)v10 + 3);
    *(_OWORD *)(v9 + 8) = *(_OWORD *)(v10 + 8);
    *((_QWORD *)v9 + 3) = v11;
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t destroy for DynamicContentFeature(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23BCD796C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for DynamicContentFeature(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_23BCD796C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  *(_QWORD *)v8 = *(_QWORD *)v9;
  v10 = *(_QWORD *)(v9 + 24);
  *(_OWORD *)(v8 + 8) = *(_OWORD *)(v9 + 8);
  *(_QWORD *)(v8 + 24) = v10;
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for DynamicContentFeature(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = sub_23BCD796C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  swift_retain();
  swift_release();
  v11 = v9[3];
  v8[2] = v9[2];
  v8[3] = v11;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for DynamicContentFeature(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _OWORD *v8;
  _OWORD *v9;
  __int128 v10;

  v6 = sub_23BCD796C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_OWORD *)(a1 + v7);
  v9 = (_OWORD *)(a2 + v7);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  return a1;
}

uint64_t assignWithTake for DynamicContentFeature(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;

  v6 = sub_23BCD796C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = (_OWORD *)(a2 + v7);
  *(_OWORD *)(a1 + v7) = *v9;
  swift_release();
  *(_OWORD *)(v8 + 16) = v9[1];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for DynamicContentFeature()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23BCA934C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_23BCD796C();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for DynamicContentFeature()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23BCA93D4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_23BCD796C();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

uint64_t sub_23BCA944C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23BCD796C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_23BCA94BC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v6;
  uint64_t v7;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = sub_23BCD796C();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  }
  return a1;
}

uint64_t sub_23BCA952C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23BCD796C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t sub_23BCA9560(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23BCD796C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_23BCA95A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23BCD796C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_23BCA95E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23BCD796C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_23BCA962C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23BCD796C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_23BCA9670(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_256A95400);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t sub_23BCA96B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_256A95400);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a1, a2, a3, v6);
}

uint64_t sub_23BCA9700(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  uint64_t v4;

  result = sub_23BCD796C();
  if (v3 <= 0x3F)
  {
    v4 = *(_QWORD *)(result - 8);
    swift_initEnumMetadataSingleCase();
    result = 0;
    *(_DWORD *)(*(_QWORD *)(a1 - 8) + 84) = *(_DWORD *)(v4 + 84);
  }
  return result;
}

uint64_t sub_23BCA975C()
{
  return sub_23BC9B4D8(&qword_256A95488, type metadata accessor for DynamicContentFeature.TaskIdentifier, (uint64_t)&unk_23BCDA7D0);
}

_QWORD *sub_23BCA9788(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  _QWORD *v12;

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
      __swift_instantiateConcreteTypeFromMangledName(&qword_256A954D0);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[5 * v8 + 4])
          memmove(v12, a4 + 4, 40 * v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v12 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_23BCA9DBC(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_23BCA98A8(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_23BCA98BC(a1, a2, a3, a4, &qword_256A954C0, &qword_256A954C8);
}

uint64_t sub_23BCA98BC(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t *a6)
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
    result = sub_23BCD84A0();
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
    sub_23BCA9EC8(0, v11, v21, a4, a6);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v16;
}

_QWORD *sub_23BCA9AC8(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_256A954A0);
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
    sub_23BCA9CD0(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_23BCA9BD4(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_23BCA98BC(a1, a2, a3, a4, &qword_256A954A8, &qword_256A954B0);
}

char *sub_23BCA9BE8(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
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
    v5 = (char *)(a4 + 16 * a1 + 32);
    v6 = 16 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_23BCD84D0();
  __break(1u);
  return result;
}

char *sub_23BCA9CD0(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
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
  result = (char *)sub_23BCD84D0();
  __break(1u);
  return result;
}

uint64_t sub_23BCA9DBC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 40 * a1 + 32;
    v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_256A954D8);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_23BCD84D0();
  __break(1u);
  return result;
}

uint64_t sub_23BCA9EC8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
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
  result = sub_23BCD84D0();
  __break(1u);
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

uint64_t sub_23BCAA048()
{
  _QWORD *v0;
  uint64_t (*v1)(_QWORD);
  uint64_t result;

  v1 = (uint64_t (*)(_QWORD))v0[1];
  if (v1)
    return v1(*v0);
  return result;
}

uint64_t sub_23BCAA078()
{
  _QWORD *v0;
  uint64_t (*v1)(_QWORD);
  uint64_t result;

  v1 = (uint64_t (*)(_QWORD))v0[3];
  if (v1)
    return v1(*v0);
  return result;
}

uint64_t sub_23BCAA0A8()
{
  return sub_23BCAA048();
}

uint64_t sub_23BCAA0E0()
{
  return sub_23BCAA078();
}

id HeadlessFeatureHosting<>.attach<A>(store:onAppear:onDisappear:)(uint64_t (*a1)(void), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  return (id)sub_23BCAA370(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
}

uint64_t HeadlessFeatureHosting<>.onAppear()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  v3 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 8))(a1, a3);
  v4 = *(_QWORD *)(v3 + 16);
  if (!v4)
    return swift_bridgeObjectRelease();
  v5 = v3 + 32;
  do
  {
    sub_23BCAA504(v5, (uint64_t)v9);
    v6 = v10;
    v7 = v11;
    __swift_project_boxed_opaque_existential_1(v9, v10);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v7);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
    v5 += 40;
    --v4;
  }
  while (v4);
  return swift_bridgeObjectRelease();
}

uint64_t HeadlessFeatureHosting<>.onDisappear()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  v3 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 8))(a1, a3);
  v4 = *(_QWORD *)(v3 + 16);
  if (!v4)
    return swift_bridgeObjectRelease();
  v5 = v3 + 32;
  do
  {
    sub_23BCAA504(v5, (uint64_t)v9);
    v6 = v10;
    v7 = v11;
    __swift_project_boxed_opaque_existential_1(v9, v10);
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v6, v7);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
    v5 += 40;
    --v4;
  }
  while (v4);
  return swift_bridgeObjectRelease();
}

id sub_23BCAA2AC@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>, uint64_t a10, uint64_t a11)
{
  void *v12;

  v12 = (void *)sub_23BCAA370(a1, a2, a3, a4, a5, a6, a10, a7, a11, (uint64_t)&protocol witness table for DynamicContentContainerViewController<A, B>, a8);
  *a9 = v12;
  return v12;
}

uint64_t sub_23BCAA2F8(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t *boxed_opaque_existential_1;
  uint64_t v10;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  v13 = a4;
  v14 = a5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v12);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 32))(boxed_opaque_existential_1, a2, a4);
  v10 = *a3;
  *(_QWORD *)(v10 + 16) = a1 + 1;
  return sub_23BCAA58C(&v12, v10 + 40 * a1 + 32);
}

uint64_t sub_23BCAA370(uint64_t (*a1)(void), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v18;
  uint64_t (*v19)(_BYTE *, uint64_t, uint64_t);
  void (*v20)(_BYTE *, _QWORD);
  uint64_t *v21;
  uint64_t *v22;
  _QWORD *v23;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  _QWORD v31[5];
  _BYTE v32[32];

  v12 = v11;
  v18 = a1();
  v19 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(a10 + 24);
  sub_23BCA79B4(a3);
  sub_23BCA79B4(a5);
  swift_retain();
  sub_23BCA79B4(a3);
  sub_23BCA79B4(a5);
  v20 = (void (*)(_BYTE *, _QWORD))v19(v32, a7, a10);
  v22 = v21;
  v23 = (_QWORD *)*v21;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v22 = (uint64_t)v23;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v23 = sub_23BCA9788(0, v23[2] + 1, 1, v23);
    *v22 = (uint64_t)v23;
  }
  v27 = v23[2];
  v26 = v23[3];
  if (v27 >= v26 >> 1)
    *v22 = (uint64_t)sub_23BCA9788((_QWORD *)(v26 > 1), v27 + 1, 1, v23);
  v31[0] = v18;
  v31[1] = a3;
  v31[2] = a4;
  v31[3] = a5;
  v31[4] = a6;
  v28 = type metadata accessor for HeadlessFeature(0, a8, a11, v25);
  sub_23BCAA2F8(v27, (uint64_t)v31, v22, v28, (uint64_t)&off_250CC9B88);
  v20(v32, 0);
  swift_release();
  sub_23BCAA57C(a3);
  sub_23BCAA57C(a5);
  return v12;
}

uint64_t sub_23BCAA504(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t dispatch thunk of HeadlessFeatureProtocol.onAppeared()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of HeadlessFeatureProtocol.onDisappeared()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of HeadlessFeatureHosting.headlessFeatures.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of HeadlessFeatureHosting.headlessFeatures.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of HeadlessFeatureHosting.headlessFeatures.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t type metadata accessor for HeadlessFeature(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for HeadlessFeature);
}

uint64_t sub_23BCAA57C(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_23BCAA58C(__int128 *a1, uint64_t a2)
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

uint64_t sub_23BCAA5A4(uint64_t a1)
{
  uint64_t result;

  result = swift_release();
  if (*(_QWORD *)(a1 + 8))
    result = swift_release();
  if (*(_QWORD *)(a1 + 24))
    return swift_release();
  return result;
}

_QWORD *sub_23BCAA5F0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  _OWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *a1 = *a2;
  v5 = a2 + 1;
  v4 = a2[1];
  swift_retain();
  if (v4)
  {
    v6 = a2[2];
    a1[1] = v4;
    a1[2] = v6;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 1) = *v5;
  }
  v7 = a2[3];
  if (v7)
  {
    v8 = a2[4];
    a1[3] = v7;
    a1[4] = v8;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 3) = *(_OWORD *)(a2 + 3);
  }
  return a1;
}

_QWORD *sub_23BCAA680(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *a1 = *a2;
  swift_retain();
  swift_release();
  v4 = a2[1];
  if (a1[1])
  {
    if (v4)
    {
      v5 = a2[2];
      a1[1] = v4;
      a1[2] = v5;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    v6 = a2[2];
    a1[1] = v4;
    a1[2] = v6;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 1);
LABEL_8:
  v7 = a2[3];
  if (!a1[3])
  {
    if (v7)
    {
      v9 = a2[4];
      a1[3] = v7;
      a1[4] = v9;
      swift_retain();
      return a1;
    }
LABEL_14:
    *(_OWORD *)(a1 + 3) = *(_OWORD *)(a2 + 3);
    return a1;
  }
  if (!v7)
  {
    swift_release();
    goto LABEL_14;
  }
  v8 = a2[4];
  a1[3] = v7;
  a1[4] = v8;
  swift_retain();
  swift_release();
  return a1;
}

_QWORD *sub_23BCAA774(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *a1 = *a2;
  swift_release();
  v4 = a2[1];
  if (a1[1])
  {
    if (v4)
    {
      v5 = a2[2];
      a1[1] = v4;
      a1[2] = v5;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    v6 = a2[2];
    a1[1] = v4;
    a1[2] = v6;
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 1);
LABEL_8:
  v7 = a2[3];
  if (!a1[3])
  {
    if (v7)
    {
      v9 = a2[4];
      a1[3] = v7;
      a1[4] = v9;
      return a1;
    }
LABEL_14:
    *(_OWORD *)(a1 + 3) = *(_OWORD *)(a2 + 3);
    return a1;
  }
  if (!v7)
  {
    swift_release();
    goto LABEL_14;
  }
  v8 = a2[4];
  a1[3] = v7;
  a1[4] = v8;
  swift_release();
  return a1;
}

__n128 SignOutFeature.init(environment:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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

void SignOutFeature.reduce(localState:sharedState:sideEffects:action:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __int128 *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  __int128 v12;
  __int128 v13;
  uint64_t (*v14)(_QWORD);
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;

  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A954C8);
  v6 = MEMORY[0x24BDAC7A8](v18);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v8 = MEMORY[0x24BDAC7A8](v7);
  MEMORY[0x24BDAC7A8](v8);
  v9 = type metadata accessor for SignOutAction();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = v4[1];
  v19 = *v4;
  v20 = v12;
  v13 = v4[3];
  v21 = v4[2];
  v22 = v13;
  sub_23BCA8DD0(a4, (uint64_t)v11, v14);
  v15 = type metadata accessor for AccountState();
  v16 = (char *)sub_23BCAA9AC
      + 4
      * byte_23BCDA8C0[(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 48))(v11, 3, v15)];
  __asm { BR              X10 }
}

uint64_t sub_23BCAA9AC()
{
  uint64_t v0;
  uint64_t v1;

  return sub_23BCABE28(v1, v0);
}

unint64_t sub_23BCAB024()
{
  unint64_t result;

  result = qword_256A95570;
  if (!qword_256A95570)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDA984, &type metadata for SignOutFeature.TaskIdentifier);
    atomic_store(result, &qword_256A95570);
  }
  return result;
}

uint64_t sub_23BCAB068(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t);

  v2[2] = a1;
  type metadata accessor for SignOutAction();
  v2[3] = swift_task_alloc();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A955E0);
  v2[4] = v4;
  v2[5] = *(_QWORD *)(v4 - 8);
  v5 = swift_task_alloc();
  v2[6] = v5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_256A955E8);
  v2[7] = v6;
  v2[8] = *(_QWORD *)(v6 - 8);
  v2[9] = swift_task_alloc();
  v2[10] = sub_23BCD8254();
  v2[11] = sub_23BCD8248();
  v9 = (uint64_t (*)(uint64_t))(**(int **)(a2 + 16) + *(_QWORD *)(a2 + 16));
  v7 = (_QWORD *)swift_task_alloc();
  v2[12] = v7;
  *v7 = v2;
  v7[1] = sub_23BCAB168;
  return v9(v5);
}

uint64_t sub_23BCAB168()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *v0;
  swift_task_dealloc();
  *(_QWORD *)(v1 + 104) = sub_23BCD8230();
  *(_QWORD *)(v1 + 112) = v2;
  return swift_task_switch();
}

uint64_t sub_23BCAB1DC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = v0[5];
  v1 = v0[6];
  v3 = v0[4];
  sub_23BCD826C();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v0[15] = sub_23BCD8248();
  v4 = (_QWORD *)swift_task_alloc();
  v0[16] = v4;
  *v4 = v0;
  v4[1] = sub_23BCAB280;
  return sub_23BCD8278();
}

uint64_t sub_23BCAB280()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_23BCAB2D4()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  if (*(_BYTE *)(v0 + 144) == 1)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 64) + 8))(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 56));
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v2 = *(_QWORD *)(v0 + 24);
    v3 = type metadata accessor for AccountState();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v2, 2, 3, v3);
    v4 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 136) = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A955D8);
    *v4 = v0;
    v4[1] = sub_23BCAB3C8;
    return sub_23BCD8080();
  }
}

uint64_t sub_23BCAB3C8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 24);
  swift_task_dealloc();
  sub_23BCAC3AC(v1, (uint64_t (*)(_QWORD))type metadata accessor for SignOutAction);
  return swift_task_switch();
}

uint64_t sub_23BCAB428()
{
  uint64_t v0;
  _QWORD *v1;

  *(_QWORD *)(v0 + 120) = sub_23BCD8248();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 128) = v1;
  *v1 = v0;
  v1[1] = sub_23BCAB280;
  return sub_23BCD8278();
}

uint64_t sub_23BCAB4A8(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v4;
  uint64_t (*v6)(_QWORD *);

  v2[12] = a1;
  type metadata accessor for SignOutAction();
  v2[13] = swift_task_alloc();
  v2[14] = sub_23BCD8254();
  v2[15] = sub_23BCD8248();
  v6 = (uint64_t (*)(_QWORD *))(**(int **)(a2 + 32) + *(_QWORD *)(a2 + 32));
  v4 = (_QWORD *)swift_task_alloc();
  v2[16] = v4;
  *v4 = v2;
  v4[1] = sub_23BCAB550;
  return v6(v2 + 7);
}

uint64_t sub_23BCAB550()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *v0;
  swift_task_dealloc();
  *(_QWORD *)(v1 + 136) = sub_23BCD8230();
  *(_QWORD *)(v1 + 144) = v2;
  return swift_task_switch();
}

uint64_t sub_23BCAB5C4()
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
  sub_23BCD8284();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
  v0[19] = sub_23BCD8248();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v0[5]);
  v5 = (_QWORD *)swift_task_alloc();
  v0[20] = (uint64_t)v5;
  *v5 = v0;
  v5[1] = sub_23BCAB724;
  return sub_23BCD823C();
}

uint64_t sub_23BCAB724()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_23BCAB778()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  if (*(_BYTE *)(v0 + 176) == 1)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v2 = *(_QWORD *)(v0 + 104);
    v3 = type metadata accessor for AccountState();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v2, 2, 3, v3);
    v4 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 168) = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A955D8);
    *v4 = v0;
    v4[1] = sub_23BCAB844;
    return sub_23BCD8080();
  }
}

uint64_t sub_23BCAB844()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 104);
  swift_task_dealloc();
  sub_23BCAC3AC(v1, (uint64_t (*)(_QWORD))type metadata accessor for SignOutAction);
  return swift_task_switch();
}

uint64_t sub_23BCAB8A4()
{
  uint64_t *v0;
  _QWORD *v1;

  v0[19] = sub_23BCD8248();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v0[5]);
  v1 = (_QWORD *)swift_task_alloc();
  v0[20] = (uint64_t)v1;
  *v1 = v0;
  v1[1] = sub_23BCAB724;
  return sub_23BCD823C();
}

uint64_t sub_23BCAB948(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t);

  v2[2] = a1;
  type metadata accessor for SignOutAction();
  v2[3] = swift_task_alloc();
  v4 = type metadata accessor for AccountState();
  v2[4] = v4;
  v2[5] = *(_QWORD *)(v4 - 8);
  v5 = swift_task_alloc();
  v2[6] = v5;
  v2[7] = sub_23BCD8254();
  v2[8] = sub_23BCD8248();
  v8 = (uint64_t (*)(uint64_t))(*(int *)*a2 + *a2);
  v6 = (_QWORD *)swift_task_alloc();
  v2[9] = v6;
  *v6 = v2;
  v6[1] = sub_23BCABA18;
  return v8(v5);
}

uint64_t sub_23BCABA18()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v1;
  *(_QWORD *)(*v1 + 80) = v0;
  swift_task_dealloc();
  *(_QWORD *)(v2 + 88) = sub_23BCD8230();
  *(_QWORD *)(v2 + 96) = v3;
  return swift_task_switch();
}

uint64_t sub_23BCABAA4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = v0[5];
  v2 = v0[3];
  v3 = v0[4];
  sub_23BCA8DD0(v0[6], v2, (uint64_t (*)(_QWORD))type metadata accessor for AccountState);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v1 + 56))(v2, 0, 3, v3);
  v4 = (_QWORD *)swift_task_alloc();
  v0[13] = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A955D8);
  *v4 = v0;
  v4[1] = sub_23BCABB3C;
  return sub_23BCD8080();
}

uint64_t sub_23BCABB3C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 24);
  swift_task_dealloc();
  sub_23BCAC3AC(v1, (uint64_t (*)(_QWORD))type metadata accessor for SignOutAction);
  return swift_task_switch();
}

uint64_t sub_23BCABB9C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  swift_release();
  sub_23BCAC3AC(v1, (uint64_t (*)(_QWORD))type metadata accessor for AccountState);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23BCABBF8()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23BCABC44(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v2[2] = sub_23BCD8254();
  v2[3] = sub_23BCD8248();
  v6 = (uint64_t (*)(void))(**(int **)(a2 + 48) + *(_QWORD *)(a2 + 48));
  v4 = (_QWORD *)swift_task_alloc();
  v2[4] = v4;
  *v4 = v2;
  v4[1] = sub_23BCABCB8;
  return v6();
}

uint64_t sub_23BCABCB8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 40) = v0;
  swift_task_dealloc();
  sub_23BCD8230();
  return swift_task_switch();
}

uint64_t sub_23BCABD40()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23BCABD78(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23BCAA044;
  return sub_23BCABC44(a1, v1 + 16);
}

uint64_t sub_23BCABDCC(uint64_t a1)
{
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_23BCABE28(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AccountState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_23BCABE70(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23BCA8C74;
  return sub_23BCAB948(a1, (_QWORD *)(v1 + 16));
}

uint64_t sub_23BCABEC8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23BCAA044;
  return sub_23BCAB068(a1, v1 + 16);
}

uint64_t objectdestroyTm()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23BCABF5C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23BCAA044;
  return sub_23BCAB4A8(a1, v1 + 16);
}

uint64_t sub_23BCABFB0()
{
  return sub_23BC9B4D8(&qword_256A955B8, (uint64_t (*)(uint64_t))type metadata accessor for SignOutAction, (uint64_t)&protocol conformance descriptor for SignOutAction);
}

uint64_t sub_23BCABFDC()
{
  return sub_23BC9B4D8(&qword_256A955C0, (uint64_t (*)(uint64_t))type metadata accessor for SignOutAction, (uint64_t)&protocol conformance descriptor for SignOutAction);
}

uint64_t sub_23BCAC008()
{
  return sub_23BC9B4D8(&qword_256A955C8, (uint64_t (*)(uint64_t))type metadata accessor for SignOutState, (uint64_t)&protocol conformance descriptor for SignOutState);
}

uint64_t destroy for SignOutEnvironment()
{
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for SignOutEnvironment(uint64_t a1, uint64_t a2)
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

_QWORD *assignWithCopy for SignOutEnvironment(_QWORD *a1, _QWORD *a2)
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

_OWORD *assignWithTake for SignOutEnvironment(_OWORD *a1, _OWORD *a2)
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

uint64_t getEnumTagSinglePayload for SignOutEnvironment(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SignOutEnvironment(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SignOutFeature()
{
  return &type metadata for SignOutFeature;
}

uint64_t storeEnumTagSinglePayload for SignOutFeature.TaskIdentifier(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23BCAC2E4 + 4 * byte_23BCDA8C9[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23BCAC318 + 4 * byte_23BCDA8C4[v4]))();
}

uint64_t sub_23BCAC318(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BCAC320(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23BCAC328);
  return result;
}

uint64_t sub_23BCAC334(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23BCAC33CLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23BCAC340(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BCAC348(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SignOutFeature.TaskIdentifier()
{
  return &type metadata for SignOutFeature.TaskIdentifier;
}

unint64_t sub_23BCAC368()
{
  unint64_t result;

  result = qword_256A955D0;
  if (!qword_256A955D0)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDA95C, &type metadata for SignOutFeature.TaskIdentifier);
    atomic_store(result, (unint64_t *)&qword_256A955D0);
  }
  return result;
}

uint64_t sub_23BCAC3AC(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23BCAC3E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))(a3, a1);
}

uint64_t sub_23BCAC400()
{
  uint64_t v0;

  v0 = sub_23BCD80C8();
  MEMORY[0x24260FFB0](MEMORY[0x24BE2B5E8], v0);
  return sub_23BCD7A5C();
}

uint64_t sub_23BCAC45C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  _QWORD *v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  char v22;

  v18 = (_QWORD *)swift_allocObject();
  v18[2] = a7;
  v18[3] = a8;
  v18[4] = a1;
  v18[5] = a2;
  v19 = sub_23BCD80C8();
  MEMORY[0x24260FFB0](MEMORY[0x24BE2B5E8], v19);
  result = sub_23BCD7A50();
  *(_QWORD *)a9 = result;
  *(_QWORD *)(a9 + 8) = v21;
  *(_BYTE *)(a9 + 16) = v22 & 1;
  *(_QWORD *)(a9 + 24) = a3;
  *(_QWORD *)(a9 + 32) = a4;
  *(_QWORD *)(a9 + 40) = a5;
  *(_QWORD *)(a9 + 48) = a6;
  return result;
}

uint64_t HeadlessFeatureViewModifier.body(content:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  __int128 *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  void (*v27)(char *, char *, uint64_t);
  void (*v28)(char *, uint64_t);
  _QWORD v30[2];
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  _QWORD v35[2];
  _QWORD v36[2];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  v30[1] = a1;
  v34 = a3;
  MEMORY[0x24260FFB0](&protocol conformance descriptor for HeadlessFeatureViewModifier<A>);
  v5 = sub_23BCD7C18();
  v6 = sub_23BCD7B04();
  v33 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v30 - v7;
  v9 = sub_23BCD7B04();
  v32 = *(_QWORD *)(v9 - 8);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v31 = (char *)v30 - v13;
  v14 = v3[1];
  v37 = *v3;
  v38 = v14;
  v39 = v3[2];
  v40 = *((_QWORD *)v3 + 6);
  v15 = swift_allocObject();
  v17 = *(_QWORD *)(a2 + 16);
  v16 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(v15 + 16) = v17;
  *(_QWORD *)(v15 + 24) = v16;
  v18 = v3[1];
  *(_OWORD *)(v15 + 32) = *v3;
  *(_OWORD *)(v15 + 48) = v18;
  *(_OWORD *)(v15 + 64) = v3[2];
  *(_QWORD *)(v15 + 80) = *((_QWORD *)v3 + 6);
  sub_23BCAC868((uint64_t)&v37);
  v19 = MEMORY[0x24260FFB0](MEMORY[0x24BDEFB78], v5);
  sub_23BCD7E7C();
  swift_release();
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = v17;
  *(_QWORD *)(v20 + 24) = v16;
  v21 = v38;
  *(_OWORD *)(v20 + 32) = v37;
  *(_OWORD *)(v20 + 48) = v21;
  *(_OWORD *)(v20 + 64) = v39;
  *(_QWORD *)(v20 + 80) = v40;
  sub_23BCAC868((uint64_t)&v37);
  v22 = MEMORY[0x24BDF0910];
  v36[0] = v19;
  v36[1] = MEMORY[0x24BDF0910];
  v23 = MEMORY[0x24BDED308];
  v24 = MEMORY[0x24260FFB0](MEMORY[0x24BDED308], v6, v36);
  sub_23BCD7E04();
  swift_release();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v8, v6);
  v35[0] = v24;
  v35[1] = v22;
  MEMORY[0x24260FFB0](v23, v9, v35);
  v26 = v31;
  v25 = v32;
  v27 = *(void (**)(char *, char *, uint64_t))(v32 + 16);
  v27(v31, v12, v9);
  v28 = *(void (**)(char *, uint64_t))(v25 + 8);
  v28(v12, v9);
  v27(v34, v26, v9);
  return ((uint64_t (*)(char *, uint64_t))v28)(v26, v9);
}

uint64_t sub_23BCAC7D0()
{
  return swift_release();
}

uint64_t sub_23BCAC7D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23BCAC928((uint64_t (*)(uint64_t))HeadlessFeatureViewModifier.onAppeared(), a2, a3, a4);
}

Swift::Void __swiftcall HeadlessFeatureViewModifier.onAppeared()()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v0 + 24);
  if (v1)
  {
    v2 = sub_23BCAC400();
    v1(v2, v3, v4, v5);
    swift_release();
  }
}

uint64_t sub_23BCAC868(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 40);
  sub_23BCAC8C8();
  sub_23BCA79B4(v2);
  sub_23BCA79B4(v3);
  return a1;
}

uint64_t sub_23BCAC8C8()
{
  return swift_retain();
}

uint64_t objectdestroyTm_0()
{
  uint64_t v0;

  sub_23BCAC7D0();
  if (*(_QWORD *)(v0 + 56))
    swift_release();
  if (*(_QWORD *)(v0 + 72))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_23BCAC91C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23BCAC928((uint64_t (*)(uint64_t))HeadlessFeatureViewModifier.onDisappeared(), a2, a3, a4);
}

uint64_t sub_23BCAC928(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;

  v6 = type metadata accessor for HeadlessFeatureViewModifier(0, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24), a4);
  return a1(v6);
}

Swift::Void __swiftcall HeadlessFeatureViewModifier.onDisappeared()()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v0 + 40);
  if (v1)
  {
    v2 = sub_23BCAC400();
    v1(v2, v3, v4, v5, v6, v7, v8);
    swift_release();
  }
}

uint64_t sub_23BCAC9F4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23BCACA30()
{
  return sub_23BCD7AB0();
}

uint64_t sub_23BCACA54(uint64_t a1)
{
  uint64_t result;

  result = sub_23BCAC7D0();
  if (*(_QWORD *)(a1 + 24))
    result = swift_release();
  if (*(_QWORD *)(a1 + 40))
    return swift_release();
  return result;
}

uint64_t sub_23BCACAA8(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = *a2;
  v5 = a2[1];
  v6 = *((_BYTE *)a2 + 16);
  sub_23BCAC8C8();
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6;
  v7 = a2[3];
  if (v7)
  {
    v8 = a2[4];
    *(_QWORD *)(a1 + 24) = v7;
    *(_QWORD *)(a1 + 32) = v8;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 3);
  }
  v9 = a2[5];
  if (v9)
  {
    v10 = a2[6];
    *(_QWORD *)(a1 + 40) = v9;
    *(_QWORD *)(a1 + 48) = v10;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 5);
  }
  return a1;
}

uint64_t sub_23BCACB4C(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = *a2;
  v5 = a2[1];
  v6 = *((_BYTE *)a2 + 16);
  sub_23BCAC8C8();
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6;
  sub_23BCAC7D0();
  v7 = a2[3];
  if (*(_QWORD *)(a1 + 24))
  {
    if (v7)
    {
      v8 = a2[4];
      *(_QWORD *)(a1 + 24) = v7;
      *(_QWORD *)(a1 + 32) = v8;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v7)
  {
    v9 = a2[4];
    *(_QWORD *)(a1 + 24) = v7;
    *(_QWORD *)(a1 + 32) = v9;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 3);
LABEL_8:
  v10 = a2[5];
  if (!*(_QWORD *)(a1 + 40))
  {
    if (v10)
    {
      v12 = a2[6];
      *(_QWORD *)(a1 + 40) = v10;
      *(_QWORD *)(a1 + 48) = v12;
      swift_retain();
      return a1;
    }
LABEL_14:
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 5);
    return a1;
  }
  if (!v10)
  {
    swift_release();
    goto LABEL_14;
  }
  v11 = a2[6];
  *(_QWORD *)(a1 + 40) = v10;
  *(_QWORD *)(a1 + 48) = v11;
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

uint64_t sub_23BCACC78(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = *(_BYTE *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v4;
  sub_23BCAC7D0();
  v5 = *(_QWORD *)(a2 + 24);
  if (*(_QWORD *)(a1 + 24))
  {
    if (v5)
    {
      v6 = *(_QWORD *)(a2 + 32);
      *(_QWORD *)(a1 + 24) = v5;
      *(_QWORD *)(a1 + 32) = v6;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v5)
  {
    v7 = *(_QWORD *)(a2 + 32);
    *(_QWORD *)(a1 + 24) = v5;
    *(_QWORD *)(a1 + 32) = v7;
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
LABEL_8:
  v8 = *(_QWORD *)(a2 + 40);
  if (!*(_QWORD *)(a1 + 40))
  {
    if (v8)
    {
      v10 = *(_QWORD *)(a2 + 48);
      *(_QWORD *)(a1 + 40) = v8;
      *(_QWORD *)(a1 + 48) = v10;
      return a1;
    }
LABEL_14:
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
    return a1;
  }
  if (!v8)
  {
    swift_release();
    goto LABEL_14;
  }
  v9 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  swift_release();
  return a1;
}

uint64_t sub_23BCACD5C(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 56))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t sub_23BCACDB8(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 56) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 56) = 0;
    if (a2)
      *(_QWORD *)(result + 24) = a2;
  }
  return result;
}

uint64_t type metadata accessor for HeadlessFeatureViewModifier(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for HeadlessFeatureViewModifier);
}

uint64_t sub_23BCACE24(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[2];
  _QWORD v13[2];

  v4 = type metadata accessor for HeadlessFeatureViewModifier(255, *a1, a1[1], a4);
  MEMORY[0x24260FFB0](&protocol conformance descriptor for HeadlessFeatureViewModifier<A>, v4);
  v5 = sub_23BCD7C18();
  v6 = sub_23BCD7B04();
  v7 = sub_23BCD7B04();
  v8 = MEMORY[0x24260FFB0](MEMORY[0x24BDEFB78], v5);
  v9 = MEMORY[0x24BDF0910];
  v13[0] = v8;
  v13[1] = MEMORY[0x24BDF0910];
  v10 = MEMORY[0x24BDED308];
  v12[0] = MEMORY[0x24260FFB0](MEMORY[0x24BDED308], v6, v13);
  v12[1] = v9;
  return MEMORY[0x24260FFB0](v10, v7, v12);
}

uint64_t sub_23BCACEF8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23BCACF1C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 32))();
}

ValueMetadata *type metadata accessor for SidebarToolbarLeadItemButtonStyle()
{
  return &type metadata for SidebarToolbarLeadItemButtonStyle;
}

uint64_t sub_23BCACF50()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23BCACF60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = sub_23BCD7C84();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23BCD7C90();
  sub_23BCAD010();
  sub_23BCAD058();
  sub_23BCD7DE0();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

unint64_t sub_23BCAD010()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256A95670;
  if (!qword_256A95670)
  {
    v1 = sub_23BCD7C84();
    result = MEMORY[0x24260FFB0](MEMORY[0x24BDF0438], v1);
    atomic_store(result, (unint64_t *)&qword_256A95670);
  }
  return result;
}

unint64_t sub_23BCAD058()
{
  unint64_t result;

  result = qword_256A95678;
  if (!qword_256A95678)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDD064, &type metadata for SidebarToolbarLeadItemLabelStyle);
    atomic_store(result, (unint64_t *)&qword_256A95678);
  }
  return result;
}

uint64_t sub_23BCAD09C()
{
  sub_23BCD7C84();
  sub_23BCAD010();
  sub_23BCAD058();
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23BCAD0F8(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_retain();
  return result;
}

uint64_t destroy for OutlineHoverModifier(uint64_t a1)
{
  sub_23BCAD130(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
  return swift_release();
}

uint64_t sub_23BCAD130(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_release();
  return result;
}

uint64_t initializeWithCopy for OutlineHoverModifier(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;

  v4 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a2 + 8);
  sub_23BCAD0F8(*(_QWORD *)a2, v5);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for OutlineHoverModifier(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;

  v4 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a2 + 8);
  sub_23BCAD0F8(*(_QWORD *)a2, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  sub_23BCAD130(v6, v7);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for OutlineHoverModifier(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;

  v4 = *a2;
  v5 = *((_BYTE *)a2 + 8);
  v6 = *(_QWORD *)a1;
  v7 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  sub_23BCAD130(v6, v7);
  *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
  *(_QWORD *)(a1 + 24) = a2[3];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for OutlineHoverModifier(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for OutlineHoverModifier(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 32) = 0;
    if (a2)
      *(_QWORD *)(result + 24) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for OutlineHoverModifier()
{
  return &type metadata for OutlineHoverModifier;
}

uint64_t sub_23BCAD324()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23BCAD334@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, unsigned __int8 a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unsigned __int8 v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;

  v48 = a3;
  v51 = a2;
  v52 = a6;
  v45 = a1;
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95680);
  MEMORY[0x24BDAC7A8](v43);
  v9 = (char *)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95688);
  MEMORY[0x24BDAC7A8](v46);
  v11 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95690);
  MEMORY[0x24BDAC7A8](v49);
  v50 = (uint64_t)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = a4 & 1;
  LOBYTE(v56) = a4;
  v57 = a5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A95698);
  sub_23BCD7F60();
  v44 = v53;
  v13 = sub_23BCD8008();
  v15 = v14;
  v16 = 0.0;
  sub_23BCD7A68();
  v17 = v56;
  v18 = v58;
  v19 = v59;
  v20 = v60;
  v21 = sub_23BCD7EC4();
  v53 = a4;
  v54 = a5;
  sub_23BCD7F60();
  if (v55)
    v16 = 1.0;
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A956A0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(v9, v45, v22);
  v23 = &v9[*(int *)(v43 + 36)];
  *(_QWORD *)v23 = 0xC004000000000000;
  v24 = v57;
  *((_QWORD *)v23 + 1) = v17;
  *((_QWORD *)v23 + 2) = v24;
  *((_QWORD *)v23 + 3) = v18;
  *((_QWORD *)v23 + 4) = v19;
  *((_QWORD *)v23 + 5) = v20;
  *((_QWORD *)v23 + 6) = v21;
  v25 = a5;
  *((double *)v23 + 7) = v16;
  *((_QWORD *)v23 + 8) = sub_23BCAE1C8;
  *((_QWORD *)v23 + 9) = 0;
  *((_QWORD *)v23 + 10) = v13;
  *((_QWORD *)v23 + 11) = v15;
  v26 = sub_23BCD8008();
  v28 = v27;
  v53 = a4;
  v54 = a5;
  sub_23BCD7F60();
  if (v55 == 1)
  {
    sub_23BCD7EAC();
    v29 = sub_23BCD7ED0();
    swift_release();
  }
  else
  {
    v29 = sub_23BCD7EB8();
  }
  if (v44)
    v30 = 1.16;
  else
    v30 = 1.0;
  sub_23BCAD8AC((uint64_t)v9, (uint64_t)v11, &qword_256A95680);
  v31 = &v11[*(int *)(v46 + 36)];
  *(_QWORD *)v31 = v29;
  *(_OWORD *)(v31 + 8) = xmmword_23BCDAB00;
  *((_QWORD *)v31 + 3) = 0x4022000000000000;
  *((_QWORD *)v31 + 4) = sub_23BCAD748;
  *((_QWORD *)v31 + 5) = 0;
  *((_QWORD *)v31 + 6) = v26;
  *((_QWORD *)v31 + 7) = v28;
  sub_23BCADC80((uint64_t)v9, &qword_256A95680);
  sub_23BCD8044();
  v33 = v32;
  v35 = v34;
  v36 = v50;
  sub_23BCAD8AC((uint64_t)v11, v50, &qword_256A95688);
  v37 = v36 + *(int *)(v49 + 36);
  *(double *)v37 = v30;
  *(double *)(v37 + 8) = v30;
  *(_QWORD *)(v37 + 16) = v33;
  *(_QWORD *)(v37 + 24) = v35;
  sub_23BCADC80((uint64_t)v11, &qword_256A95688);
  v38 = v48 & 1;
  v39 = v51;
  sub_23BCAD0F8(v51, v48 & 1);
  v40 = sub_23BCAD8F0(v39, v38);
  sub_23BCAD130(v39, v38);
  v53 = v40 & 1;
  v41 = swift_allocObject();
  *(_QWORD *)(v41 + 16) = v39;
  *(_BYTE *)(v41 + 24) = v38;
  *(_BYTE *)(v41 + 32) = v47;
  *(_QWORD *)(v41 + 40) = v25;
  sub_23BCAD0F8(v39, v38);
  sub_23BCADAF4();
  swift_retain();
  sub_23BCD7E94();
  swift_release();
  return sub_23BCADC80(v36, &qword_256A95690);
}

uint64_t sub_23BCAD748()
{
  return sub_23BCD7A8C();
}

uint64_t sub_23BCAD76C()
{
  sub_23BCD8014();
  sub_23BCD7AC8();
  return swift_release();
}

uint64_t sub_23BCAD7F8(uint64_t a1, char a2)
{
  char v3;

  v3 = a2 & 1;
  sub_23BCAD0F8(a1, a2 & 1);
  sub_23BCAD8F0(a1, v3);
  sub_23BCAD130(a1, v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A95698);
  return sub_23BCD7F6C();
}

uint64_t sub_23BCAD890@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_23BCAD334(a1, *(_QWORD *)v2, *(unsigned __int8 *)(v2 + 8), *(_BYTE *)(v2 + 16), *(_QWORD *)(v2 + 24), a2);
}

uint64_t sub_23BCAD8AC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23BCAD8F0(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  os_log_type_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  unint64_t v14;
  uint64_t v15;

  v4 = sub_23BCD7B58();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
    return a1 & 1;
  swift_retain();
  v8 = sub_23BCD8350();
  v9 = sub_23BCD7D5C();
  v10 = v8;
  if (os_log_type_enabled(v9, v8))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v15 = v12;
    *(_DWORD *)v11 = 136315138;
    v14 = sub_23BCADCE8(1819242306, 0xE400000000000000, &v15);
    sub_23BCD83A4();
    _os_log_impl(&dword_23BC99000, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x242610064](v12, -1, -1);
    MEMORY[0x242610064](v11, -1, -1);
  }

  sub_23BCD7B4C();
  swift_getAtKeyPath();
  sub_23BCAD130(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v15;
}

uint64_t sub_23BCADAA8()
{
  uint64_t v0;

  sub_23BCAD130(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23BCADAD8()
{
  return sub_23BCAD76C();
}

unint64_t sub_23BCADAF4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256A956A8;
  if (!qword_256A956A8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A95690);
    v2[0] = sub_23BCADB60();
    v2[1] = MEMORY[0x24BDEBF50];
    result = MEMORY[0x24260FFB0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256A956A8);
  }
  return result;
}

unint64_t sub_23BCADB60()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256A956B0;
  if (!qword_256A956B0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A95688);
    v2[0] = sub_23BCADBE4();
    v2[1] = sub_23BCA37E0(&qword_256A956D8, &qword_256A956E0, MEMORY[0x24BDEF370]);
    result = MEMORY[0x24260FFB0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256A956B0);
  }
  return result;
}

unint64_t sub_23BCADBE4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256A956B8;
  if (!qword_256A956B8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A95680);
    v2[0] = sub_23BCA37E0(&qword_256A956C0, &qword_256A956A0, MEMORY[0x24BDEFB78]);
    v2[1] = sub_23BCA37E0(&qword_256A956C8, &qword_256A956D0, MEMORY[0x24BDEDC10]);
    result = MEMORY[0x24260FFB0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256A956B8);
  }
  return result;
}

uint64_t sub_23BCADC80(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23BCADCBC()
{
  uint64_t v0;

  return sub_23BCAD7F8(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
}

unint64_t sub_23BCADCE8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_23BCADDB8(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_23BCADEB4((uint64_t)v12, *a3);
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
      sub_23BCADEB4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

unint64_t sub_23BCADDB8(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  unint64_t result;
  uint64_t v10;
  unint64_t v11;
  _QWORD v12[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v10 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v10)
        {
          v12[0] = a5;
          v12[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          memcpy(__dst, v12, HIBYTE(a6) & 0xF);
          result = 0;
          *((_BYTE *)__dst + v10) = 0;
          *a1 = (unint64_t)__dst;
          return result;
        }
      }
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_23BCADEF0(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    result = sub_23BCD8464();
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  *a1 = result;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_23BCADEB4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23BCADEF0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23BCADF84(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_23BCAE080(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_23BCAE080((char *)(v3 > 1), v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23BCADF84(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;
  char v5;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_9;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_23BCAE01C(v2, 0);
      result = sub_23BCD8434();
      if ((v5 & 1) != 0)
        break;
      if (result == v2)
        return (uint64_t)v3;
      __break(1u);
LABEL_9:
      v2 = sub_23BCD8194();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_23BCAE01C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A956E8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_23BCAE080(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A956E8);
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
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_23BCAE168()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A95690);
  sub_23BCADAF4();
  return swift_getOpaqueTypeConformance2();
}

uint64_t HeadlessFeatureAttaching.attach<A>(store:onAppear:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t))(a7 + 8))(a1, a2, a3, a4, 0, 0, a6);
}

uint64_t View.attach<A>(store:onAppear:onDisappear:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v23[2];
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[2];
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  swift_retain();
  sub_23BCA79B4(a3);
  sub_23BCA79B4(a5);
  sub_23BCAC45C(a1, a2, a3, a4, a5, a6, a8, a10, (uint64_t)v29);
  v17 = v31;
  v18 = v33;
  v23[0] = v29[0];
  v23[1] = v29[1];
  v24 = v30;
  v25 = v31;
  v26 = v32;
  v27 = v33;
  v28 = v34;
  v20 = type metadata accessor for HeadlessFeatureViewModifier(0, a8, a10, v19);
  MEMORY[0x24260F398](v23, a7, v20, a9);
  sub_23BCAC7D0();
  sub_23BCAA57C(v17);
  return sub_23BCAA57C(v18);
}

uint64_t dispatch thunk of HeadlessFeatureAttaching.attach<A>(store:onAppear:onDisappear:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return (*(uint64_t (**)(void))(a10 + 8))();
}

uint64_t sub_23BCAE338(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[2];

  v4 = a1[2];
  v5 = type metadata accessor for HeadlessFeatureViewModifier(255, a1[1], a1[3], a4);
  v6 = sub_23BCD7B04();
  v8[0] = v4;
  v8[1] = MEMORY[0x24260FFB0](&protocol conformance descriptor for HeadlessFeatureViewModifier<A>, v5);
  return MEMORY[0x24260FFB0](MEMORY[0x24BDED308], v6, v8);
}

uint64_t sub_23BCAE3B0(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  char v12;
  uint64_t v13;

  v2 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    v3 = sub_23BCD83D4();
    v5 = v4;
    v6 = sub_23BCD8410();
    v8 = MEMORY[0x24260F908](v3, v5, v6, v7);
    swift_bridgeObjectRelease();
    if ((v8 & 1) != 0)
    {
LABEL_3:
      sub_23BCAFBDC(v3, v5, v2 != 0);
      return 0;
    }
LABEL_7:
    sub_23BCAF974(v3, v5, v2 != 0, a1);
    v9 = v13;
    sub_23BCAFBDC(v3, v5, v2 != 0);
    return v9;
  }
  result = sub_23BCAFBE8(a1);
  if ((v12 & 1) == 0)
  {
    v5 = v11;
    if (*(_DWORD *)(a1 + 36) == (_DWORD)v11)
    {
      v3 = result;
      if (result == 1 << *(_BYTE *)(a1 + 32))
        goto LABEL_3;
      goto LABEL_7;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

id sub_23BCAE518(void *a1, uint64_t a2, SEL *a3)
{
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)type metadata accessor for VibrantSegmentedControl();
  return objc_msgSendSuper2(&v5, *a3);
}

void sub_23BCAE568(void *a1, uint64_t a2, uint64_t a3, SEL *a4, SEL *a5)
{
  objc_class *v9;
  const char *v10;
  id v11;
  objc_super v12;
  objc_super v13;

  v9 = (objc_class *)type metadata accessor for VibrantSegmentedControl();
  v13.receiver = a1;
  v13.super_class = v9;
  v10 = *a4;
  v11 = a1;
  LODWORD(v10) = objc_msgSendSuper2(&v13, v10);
  v12.receiver = v11;
  v12.super_class = v9;
  objc_msgSendSuper2(&v12, *a5, a3);
  if ((_DWORD)v10 != objc_msgSend(v11, *a4))
    sub_23BCAF084(objc_msgSend(v11, sel_state));

}

id sub_23BCAE610(double a1, double a2, double a3, double a4)
{
  _BYTE *v4;
  id v9;
  void *v10;
  id v11;
  id v12;
  objc_super v14;

  v4[OBJC_IVAR____TtC14FitnessAppRoot23VibrantSegmentedControl_lastTouchStayedOnSelectedSegment] = 0;
  v14.receiver = v4;
  v14.super_class = (Class)type metadata accessor for VibrantSegmentedControl();
  v9 = objc_msgSendSuper2(&v14, sel_initWithFrame_, a1, a2, a3, a4);
  objc_msgSend(v9, sel_setApportionsSegmentWidthsByContent_, 1);
  v10 = (void *)objc_opt_self();
  v11 = v9;
  v12 = objc_msgSend(v10, sel_systemFillColor);
  objc_msgSend(v11, sel_setSelectedSegmentTintColor_, v12);

  objc_msgSend(v11, sel_setTransparentBackground_, 1);
  objc_msgSend(v11, sel__setAlwaysEmitValueChanged_, 1);

  return v11;
}

void sub_23BCAE7B0(void *a1, uint64_t a2, char a3)
{
  void *v3;
  void *v4;
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  unint64_t v13;
  char v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  objc_super v19;
  __int128 v20;
  __int128 v21;

  v4 = v3;
  v7 = a1;
  v8 = a1;
  v9 = objc_msgSend(v3, sel_titleTextAttributesForState_, objc_msgSend(v3, sel_state));
  if (!v9)
  {
    v20 = 0u;
    v21 = 0u;
    goto LABEL_13;
  }
  v10 = v9;
  type metadata accessor for Key(0);
  sub_23BCAF8D4();
  v11 = sub_23BCD8104();

  if (!*(_QWORD *)(v11 + 16))
  {
    v20 = 0u;
    v21 = 0u;
LABEL_12:
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  v12 = (id)*MEMORY[0x24BEBB360];
  v13 = sub_23BCAF6E0((uint64_t)v12);
  if ((v14 & 1) == 0)
  {
    v20 = 0u;
    v21 = 0u;

    goto LABEL_12;
  }
  sub_23BCADEB4(*(_QWORD *)(v11 + 56) + 32 * v13, (uint64_t)&v20);

  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v21 + 1))
  {
LABEL_13:
    sub_23BCAF6A0((uint64_t)&v20);
    goto LABEL_14;
  }
  sub_23BCA3724(0, &qword_256A95728);
  if ((swift_dynamicCast() & 1) != 0)
  {
    if (v7)
    {
      v15 = (void *)objc_opt_self();
      v16 = v8;
      v17 = objc_msgSend(v15, sel_configurationWithFont_, v18);
      v7 = objc_msgSend(v16, sel_imageWithConfiguration_, v17);

    }
  }
LABEL_14:
  v19.receiver = v4;
  v19.super_class = (Class)type metadata accessor for VibrantSegmentedControl();
  objc_msgSendSuper2(&v19, sel_insertSegmentWithImage_atIndex_animated_, v7, a2, a3 & 1);

}

void sub_23BCAEA24(id a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  objc_super v10;

  v3 = v2;
  v6 = objc_msgSend(v3, sel_titleTextAttributesForState_, objc_msgSend(v3, sel_state));
  if (v6)
  {
    v7 = v6;
    type metadata accessor for Key(0);
    sub_23BCAF8D4();
    v8 = sub_23BCD8104();

    if (a1)
      a1 = sub_23BCAF4F0(v8);
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = a1;
  }
  v10.receiver = v3;
  v10.super_class = (Class)type metadata accessor for VibrantSegmentedControl();
  objc_msgSendSuper2(&v10, sel_setImage_forSegmentAtIndex_, a1, a2);

}

void sub_23BCAEDFC(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  void *v16;
  objc_super v17;
  objc_super v18;
  CGPoint v19;
  CGRect v20;

  v4 = swift_bridgeObjectRetain();
  v5 = (void *)sub_23BCAE3B0(v4);
  swift_bridgeObjectRelease();
  if (v5)
  {
    objc_msgSend(v2, sel_bounds);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    objc_msgSend(v5, sel_locationInView_, v2);
    v19.x = v14;
    v19.y = v15;
    v20.origin.x = v7;
    v20.origin.y = v9;
    v20.size.width = v11;
    v20.size.height = v13;
    if (!CGRectContainsPoint(v20, v19))
      *((_BYTE *)v2 + OBJC_IVAR____TtC14FitnessAppRoot23VibrantSegmentedControl_lastTouchStayedOnSelectedSegment) = 0;
    sub_23BCA3724(0, &qword_256A95730);
    sub_23BCAF91C();
    v16 = (void *)sub_23BCD82CC();
    v17.receiver = v2;
    v17.super_class = (Class)type metadata accessor for VibrantSegmentedControl();
    objc_msgSendSuper2(&v17, sel_touchesEnded_withEvent_, v16, a2);

  }
  else
  {
    *((_BYTE *)v2 + OBJC_IVAR____TtC14FitnessAppRoot23VibrantSegmentedControl_lastTouchStayedOnSelectedSegment) = 0;
    sub_23BCA3724(0, &qword_256A95730);
    sub_23BCAF91C();
    v16 = (void *)sub_23BCD82CC();
    v18.receiver = v2;
    v18.super_class = (Class)type metadata accessor for VibrantSegmentedControl();
    objc_msgSendSuper2(&v18, sel_touchesEnded_withEvent_, v16, a2);
  }

}

uint64_t sub_23BCAF084(id a1)
{
  void *v1;
  void *v2;
  uint64_t result;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  SEL *v10;
  void *v11;
  uint64_t v12;
  id i;
  id v14;
  id v15;
  void *v16;
  id v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;

  v2 = v1;
  result = (uint64_t)objc_msgSend(v1, sel_titleTextAttributesForState_, a1);
  if (result)
  {
    v5 = (void *)result;
    type metadata accessor for Key(0);
    sub_23BCAF8D4();
    v6 = MEMORY[0x24BEE4AD8];
    v7 = sub_23BCD8104();

    if (objc_msgSend(v2, sel_state) != a1)
      return swift_bridgeObjectRelease();
    result = (uint64_t)objc_msgSend(v2, sel_numberOfSegments);
    if (result < 0)
    {
      __break(1u);
      return result;
    }
    v8 = result;
    if (!result)
      return swift_bridgeObjectRelease();
    v9 = 0;
    v10 = (SEL *)&unk_250CCD000;
    v11 = (void *)*MEMORY[0x24BEBB360];
    v12 = v6 + 8;
    for (i = objc_msgSend(v2, sel_imageForSegmentAtIndex_, 0, *MEMORY[0x24BEBB360]);
          ;
          i = objc_msgSend(v2, v10[446], v9, v22))
    {
      v15 = i;
      if (v15)
        break;
LABEL_10:
      if (v8 == ++v9)
        return swift_bridgeObjectRelease();
    }
    v16 = v15;
    if (*(_QWORD *)(v7 + 16))
    {
      v17 = v11;
      v18 = sub_23BCAF6E0((uint64_t)v17);
      if ((v19 & 1) != 0)
      {
        sub_23BCADEB4(*(_QWORD *)(v7 + 56) + 32 * v18, (uint64_t)&v24);
      }
      else
      {
        v24 = 0u;
        v25 = 0u;
      }

      if (*((_QWORD *)&v25 + 1))
      {
        sub_23BCA3724(0, &qword_256A95728);
        if (swift_dynamicCast())
        {
          v20 = v12;
          v21 = objc_msgSend((id)objc_opt_self(), sel_configurationWithFont_, v23);
          v14 = objc_msgSend(v16, sel_imageWithConfiguration_, v21);

          v12 = v20;
          v11 = v22;
          v10 = (SEL *)&unk_250CCD000;
          goto LABEL_9;
        }
LABEL_8:
        v14 = v16;
LABEL_9:
        objc_msgSend(v2, sel_setImage_forSegmentAtIndex_, v14, v9);

        goto LABEL_10;
      }
    }
    else
    {
      v24 = 0u;
      v25 = 0u;
    }
    sub_23BCAF6A0((uint64_t)&v24);
    goto LABEL_8;
  }
  return result;
}

void sub_23BCAF2F0(uint64_t a1, id a2)
{
  void *v2;
  void *v3;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  SEL *v9;
  SEL *v10;
  id i;
  id v12;
  id v13;
  void *v14;
  id v15;
  unint64_t v16;
  char v17;
  SEL *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;

  v3 = v2;
  if (objc_msgSend(v3, sel_state) == a2)
  {
    v5 = (unint64_t)objc_msgSend(v3, sel_numberOfSegments);
    if ((v5 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else
    {
      v6 = v5;
      if (v5)
      {
        v7 = 0;
        v8 = (void *)*MEMORY[0x24BEBB360];
        v9 = (SEL *)&unk_250CCD000;
        v10 = (SEL *)&unk_250CCD000;
        for (i = objc_msgSend(v3, sel_imageForSegmentAtIndex_, 0, MEMORY[0x24BEE4AD8] + 8);
              ;
              i = objc_msgSend(v3, v9[446], v7, v21))
        {
          v13 = i;
          if (v13)
            break;
LABEL_9:
          if (v6 == ++v7)
            return;
        }
        v14 = v13;
        if (a1 && *(_QWORD *)(a1 + 16))
        {
          v15 = v8;
          v16 = sub_23BCAF6E0((uint64_t)v15);
          if ((v17 & 1) != 0)
          {
            sub_23BCADEB4(*(_QWORD *)(a1 + 56) + 32 * v16, (uint64_t)&v23);
          }
          else
          {
            v23 = 0u;
            v24 = 0u;
          }

          if (*((_QWORD *)&v24 + 1))
          {
            sub_23BCA3724(0, &qword_256A95728);
            if (swift_dynamicCast())
            {
              v18 = v10;
              v19 = v8;
              v20 = objc_msgSend((id)objc_opt_self(), sel_configurationWithFont_, v22);
              v12 = objc_msgSend(v14, sel_imageWithConfiguration_, v20);

              v8 = v19;
              v10 = v18;
              v9 = (SEL *)&unk_250CCD000;

              goto LABEL_8;
            }
LABEL_7:
            v12 = v14;
LABEL_8:
            objc_msgSend(v3, v10[447], v12, v7);

            goto LABEL_9;
          }
        }
        else
        {
          v23 = 0u;
          v24 = 0u;
        }
        sub_23BCAF6A0((uint64_t)&v23);
        goto LABEL_7;
      }
    }
  }
}

id sub_23BCAF4F0(uint64_t a1)
{
  void *v1;
  void *v2;
  id v4;
  unint64_t v5;
  char v6;
  id v7;
  id v8;
  void *v10;
  __int128 v11;
  __int128 v12;

  v2 = v1;
  if (!a1 || !*(_QWORD *)(a1 + 16))
  {
    v11 = 0u;
    v12 = 0u;
    goto LABEL_9;
  }
  v4 = (id)*MEMORY[0x24BEBB360];
  v5 = sub_23BCAF6E0((uint64_t)v4);
  if ((v6 & 1) == 0)
  {
    v11 = 0u;
    v12 = 0u;

    goto LABEL_9;
  }
  sub_23BCADEB4(*(_QWORD *)(a1 + 56) + 32 * v5, (uint64_t)&v11);

  if (!*((_QWORD *)&v12 + 1))
  {
LABEL_9:
    sub_23BCAF6A0((uint64_t)&v11);
    return v2;
  }
  sub_23BCA3724(0, &qword_256A95728);
  if ((swift_dynamicCast() & 1) == 0)
    return v2;
  v7 = objc_msgSend((id)objc_opt_self(), sel_configurationWithFont_, v10);
  v8 = objc_msgSend(v2, sel_imageWithConfiguration_, v7);

  return v8;
}

id sub_23BCAF650()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VibrantSegmentedControl();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for VibrantSegmentedControl()
{
  return objc_opt_self();
}

uint64_t sub_23BCAF6A0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95720);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23BCAF6E0(uint64_t a1)
{
  uint64_t v2;

  sub_23BCD8164();
  sub_23BCD85C0();
  sub_23BCD817C();
  v2 = sub_23BCD85F0();
  swift_bridgeObjectRelease();
  return sub_23BCAF760(a1, v2);
}

unint64_t sub_23BCAF760(uint64_t a1, uint64_t a2)
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
    v6 = sub_23BCD8164();
    v8 = v7;
    if (v6 == sub_23BCD8164() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_23BCD85A8();
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
          v13 = sub_23BCD8164();
          v15 = v14;
          if (v13 == sub_23BCD8164() && v15 == v16)
            break;
          v18 = sub_23BCD85A8();
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

unint64_t sub_23BCAF8D4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256A94998;
  if (!qword_256A94998)
  {
    type metadata accessor for Key(255);
    result = MEMORY[0x24260FFB0](&unk_23BCD9308, v1);
    atomic_store(result, (unint64_t *)&qword_256A94998);
  }
  return result;
}

unint64_t sub_23BCAF91C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256A95738[0];
  if (!qword_256A95738[0])
  {
    v1 = sub_23BCA3724(255, &qword_256A95730);
    result = MEMORY[0x24260FFB0](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, qword_256A95738);
  }
  return result;
}

void sub_23BCAF974(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  void *v4;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  char v11;
  uint64_t v12;
  id v13;
  char v14;
  id v15;
  void *v16;

  v6 = a1;
  if ((a4 & 0xC000000000000001) == 0)
  {
    if ((a3 & 1) != 0)
      goto LABEL_13;
    if (a1 < 0 || 1 << *(_BYTE *)(a4 + 32) <= a1)
    {
      __break(1u);
    }
    else if (((*(_QWORD *)(a4 + (((unint64_t)a1 >> 3) & 0xFFFFFFFFFFFFF8) + 56) >> a1) & 1) != 0)
    {
      if (*(_DWORD *)(a4 + 36) == (_DWORD)a2)
        goto LABEL_20;
      __break(1u);
LABEL_13:
      if (sub_23BCD83EC() == *(_DWORD *)(a4 + 36))
      {
        sub_23BCD83F8();
        sub_23BCA3724(0, &qword_256A95730);
        swift_unknownObjectRetain();
        swift_dynamicCast();
        v4 = v16;
        swift_unknownObjectRelease();
        v8 = sub_23BCD8380();
        v9 = -1 << *(_BYTE *)(a4 + 32);
        v6 = v8 & ~v9;
        if (((*(_QWORD *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
        {
          v10 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v6);
          v11 = sub_23BCD838C();

          if ((v11 & 1) == 0)
          {
            v12 = ~v9;
            do
            {
              v6 = (v6 + 1) & v12;
              if (((*(_QWORD *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
                goto LABEL_24;
              v13 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v6);
              v14 = sub_23BCD838C();

            }
            while ((v14 & 1) == 0);
          }

LABEL_20:
          v15 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v6);
          return;
        }
LABEL_24:

        __break(1u);
        goto LABEL_25;
      }
LABEL_23:
      __break(1u);
      goto LABEL_24;
    }
    __break(1u);
    goto LABEL_23;
  }
  if ((a3 & 1) == 0)
  {
LABEL_25:
    __break(1u);
    return;
  }
  if (a4 < 0)
    v7 = a4;
  else
    v7 = a4 & 0xFFFFFFFFFFFFFF8;
  MEMORY[0x24260F92C](a1, a2, v7);
  sub_23BCA3724(0, &qword_256A95730);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  swift_unknownObjectRelease();
}

uint64_t sub_23BCAFBDC(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_23BCAFBE8(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  v1 = *(_QWORD *)(a1 + 56);
  if (v1)
  {
    v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v3 = 1 << v5;
  if (v6 < 7)
    return v3;
  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2)
    v7 = 2;
  v8 = v7 - 2;
  v9 = (unint64_t *)(a1 + 72);
  v2 = 64;
  while (v8)
  {
    v10 = *v9++;
    v1 = v10;
    --v8;
    v2 += 64;
    if (v10)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

uint64_t sub_23BCAFC70(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x657461676976616ELL && a2 == 0xEF6B636174536F54;
  if (v2 || (sub_23BCD85A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x74497463656C6573 && a2 == 0xEA00000000006D65 || (sub_23BCD85A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E497463656C6573 && a2 == 0xEB00000000786564 || (sub_23BCD85A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000024 && a2 == 0x800000023BCE6080 || (sub_23BCD85A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6570704177656976 && a2 == 0xEC00000064657261)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v6 = sub_23BCD85A8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

uint64_t sub_23BCAFEE4(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23BCAFF24 + 4 * byte_23BCDABC0[a1]))(0x657461676976616ELL, 0xEF6B636174536F54);
}

uint64_t sub_23BCAFF24()
{
  return 0x74497463656C6573;
}

uint64_t sub_23BCAFF40()
{
  return 0x6E497463656C6573;
}

unint64_t sub_23BCAFF60()
{
  return 0xD000000000000024;
}

uint64_t sub_23BCAFF7C()
{
  return 0x6570704177656976;
}

uint64_t sub_23BCAFF9C(uint64_t a1, uint64_t a2)
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
    v3 = sub_23BCD85A8();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23BCB0008()
{
  unsigned __int8 *v0;

  return sub_23BCAFEE4(*v0);
}

uint64_t sub_23BCB0014@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23BCAFC70(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23BCB0040@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23BCB3294();
  *a1 = result;
  return result;
}

uint64_t sub_23BCB0068(uint64_t a1)
{
  MEMORY[0x24260FFB0](&unk_23BCDB1C8, a1);
  return sub_23BCD8614();
}

uint64_t sub_23BCB009C(uint64_t a1)
{
  MEMORY[0x24260FFB0](&unk_23BCDB1C8, a1);
  return sub_23BCD8620();
}

uint64_t sub_23BCB00D0(uint64_t a1)
{
  MEMORY[0x24260FFB0](&unk_23BCDB218, a1);
  return sub_23BCD8614();
}

uint64_t sub_23BCB0104(uint64_t a1)
{
  MEMORY[0x24260FFB0](&unk_23BCDB218, a1);
  return sub_23BCD8620();
}

uint64_t sub_23BCB0138@<X0>(uint64_t a1@<X2>, _BYTE *a2@<X8>)
{
  return sub_23BCB02D8(a1, (uint64_t (*)(_QWORD, _QWORD))sub_23BC9B868, a2);
}

uint64_t sub_23BCB0144(uint64_t a1)
{
  MEMORY[0x24260FFB0](&unk_23BCDB308, a1);
  return sub_23BCD8614();
}

uint64_t sub_23BCB0178(uint64_t a1)
{
  MEMORY[0x24260FFB0](&unk_23BCDB308, a1);
  return sub_23BCD8620();
}

uint64_t sub_23BCB01AC(uint64_t a1)
{
  MEMORY[0x24260FFB0](&unk_23BCDB2B8, a1);
  return sub_23BCD8614();
}

uint64_t sub_23BCB01E0(uint64_t a1)
{
  MEMORY[0x24260FFB0](&unk_23BCDB2B8, a1);
  return sub_23BCD8620();
}

uint64_t sub_23BCB0214@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23BCAFF9C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23BCB0244@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23BC9B868();
  *a1 = result & 1;
  return result;
}

uint64_t sub_23BCB0270(uint64_t a1)
{
  MEMORY[0x24260FFB0](&unk_23BCDB268, a1);
  return sub_23BCD8614();
}

uint64_t sub_23BCB02A4(uint64_t a1)
{
  MEMORY[0x24260FFB0](&unk_23BCDB268, a1);
  return sub_23BCD8620();
}

uint64_t sub_23BCB02D8@<X0>(uint64_t a1@<X2>, uint64_t (*a2)(_QWORD, _QWORD)@<X4>, _BYTE *a3@<X8>)
{
  char v4;
  uint64_t result;

  v4 = a2(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
  result = swift_bridgeObjectRelease();
  *a3 = v4 & 1;
  return result;
}

uint64_t sub_23BCB031C(uint64_t a1)
{
  MEMORY[0x24260FFB0](&unk_23BCDB358, a1);
  return sub_23BCD8614();
}

uint64_t sub_23BCB0350(uint64_t a1)
{
  MEMORY[0x24260FFB0](&unk_23BCDB358, a1);
  return sub_23BCD8620();
}

void TabBarAction.encode(to:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
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
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  _QWORD v39[3];
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;

  v67 = a2;
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v8 = type metadata accessor for TabBarAction.ViewAppearedCodingKeys(255, v5, v6, a4);
  v62 = MEMORY[0x24260FFB0](&unk_23BCDB358, v8);
  v63 = v8;
  v9 = sub_23BCD8590();
  v60 = *(_QWORD *)(v9 - 8);
  v61 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v59 = (char *)v39 - v10;
  v12 = type metadata accessor for TabBarAction.ScrolledToSelectedIndexContentOffsetCodingKeys(255, v5, v6, v11);
  v13 = MEMORY[0x24260FFB0](&unk_23BCDB308, v12);
  v58 = v12;
  v56 = v13;
  v14 = sub_23BCD8590();
  v54 = *(_QWORD *)(v14 - 8);
  v55 = v14;
  MEMORY[0x24BDAC7A8](v14);
  v53 = (char *)v39 - v15;
  v17 = type metadata accessor for TabBarAction.SelectIndexCodingKeys(255, v5, v6, v16);
  v18 = MEMORY[0x24260FFB0](&unk_23BCDB2B8, v17);
  v50 = v17;
  v48 = v18;
  v19 = sub_23BCD8590();
  v51 = *(_QWORD *)(v19 - 8);
  v52 = v19;
  MEMORY[0x24BDAC7A8](v19);
  v49 = (char *)v39 - v20;
  v22 = type metadata accessor for TabBarAction.SelectItemCodingKeys(255, v5, v6, v21);
  v23 = MEMORY[0x24260FFB0](&unk_23BCDB268, v22);
  v44 = v22;
  v41 = v23;
  v47 = sub_23BCD8590();
  v46 = *(_QWORD *)(v47 - 8);
  v24 = MEMORY[0x24BDAC7A8](v47);
  v43 = (char *)v39 - v25;
  v45 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v42 = (char *)v39 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = type metadata accessor for TabBarAction.NavigateToStackCodingKeys(255, v5, v6, v27);
  v39[0] = MEMORY[0x24260FFB0](&unk_23BCDB218, v28);
  v40 = sub_23BCD8590();
  v39[2] = *(_QWORD *)(v40 - 8);
  v29 = MEMORY[0x24BDAC7A8](v40);
  v39[1] = (char *)v39 - v30;
  v31 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v33 = (char *)v39 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57 = v6;
  v35 = type metadata accessor for TabBarAction.CodingKeys(255, v5, v6, v34);
  MEMORY[0x24260FFB0](&unk_23BCDB1C8, v35);
  v66 = sub_23BCD8590();
  v64 = *(_QWORD *)(v66 - 8);
  MEMORY[0x24BDAC7A8](v66);
  v37 = (char *)v39 - v36;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v65 = v37;
  sub_23BCD8608();
  (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v33, v68, v67);
  v38 = (char *)sub_23BCB0744 + 4 * byte_23BCDABC5[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23BCB0744()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_BYTE *)(v0 - 69) = 0;
  v1 = *(_QWORD *)(v0 - 344);
  v3 = *(_QWORD *)(v0 - 128);
  v2 = *(_QWORD *)(v0 - 120);
  sub_23BCD8554();
  v4 = *(_QWORD *)(v0 - 328);
  sub_23BCD8578();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 - 336) + 8))(v1, v4);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 - 136) + 8))(v3, v2);
}

uint64_t type metadata accessor for TabBarAction.ViewAppearedCodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for TabBarAction.ViewAppearedCodingKeys);
}

uint64_t type metadata accessor for TabBarAction.ScrolledToSelectedIndexContentOffsetCodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for TabBarAction.ScrolledToSelectedIndexContentOffsetCodingKeys);
}

uint64_t type metadata accessor for TabBarAction.SelectIndexCodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for TabBarAction.SelectIndexCodingKeys);
}

uint64_t type metadata accessor for TabBarAction.SelectItemCodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for TabBarAction.SelectItemCodingKeys);
}

uint64_t type metadata accessor for TabBarAction.NavigateToStackCodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for TabBarAction.NavigateToStackCodingKeys);
}

uint64_t type metadata accessor for TabBarAction.CodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for TabBarAction.CodingKeys);
}

uint64_t TabBarAction.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
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
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  char v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t *v55;
  uint64_t v56;
  __int128 v58;
  char *v59;
  char *v60;
  char *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  char *v70;
  char *v71;
  char *v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  _QWORD *v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  uint64_t v101;

  v75 = a5;
  v89 = type metadata accessor for TabBarAction.ViewAppearedCodingKeys(255, a2, a3, a4);
  v86 = MEMORY[0x24260FFB0](&unk_23BCDB358, v89);
  v8 = sub_23BCD8548();
  v87 = *(_QWORD *)(v8 - 8);
  v88 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v73 = (char *)&v58 - v9;
  v11 = type metadata accessor for TabBarAction.ScrolledToSelectedIndexContentOffsetCodingKeys(255, a2, a3, v10);
  v12 = MEMORY[0x24260FFB0](&unk_23BCDB308, v11);
  v85 = v11;
  v82 = v12;
  v84 = sub_23BCD8548();
  v83 = *(_QWORD *)(v84 - 8);
  MEMORY[0x24BDAC7A8](v84);
  v72 = (char *)&v58 - v13;
  v15 = type metadata accessor for TabBarAction.SelectIndexCodingKeys(255, a2, a3, v14);
  v16 = MEMORY[0x24260FFB0](&unk_23BCDB2B8, v15);
  v81 = v15;
  v80 = v16;
  v68 = sub_23BCD8548();
  v67 = *(_QWORD *)(v68 - 8);
  MEMORY[0x24BDAC7A8](v68);
  v71 = (char *)&v58 - v17;
  v19 = type metadata accessor for TabBarAction.SelectItemCodingKeys(255, a2, a3, v18);
  v20 = MEMORY[0x24260FFB0](&unk_23BCDB268, v19);
  v79 = v19;
  v78 = v20;
  v66 = sub_23BCD8548();
  v64 = *(_QWORD *)(v66 - 8);
  MEMORY[0x24BDAC7A8](v66);
  v70 = (char *)&v58 - v21;
  v23 = type metadata accessor for TabBarAction.NavigateToStackCodingKeys(255, a2, a3, v22);
  v24 = MEMORY[0x24260FFB0](&unk_23BCDB218, v23);
  v77 = v23;
  v76 = v24;
  v65 = sub_23BCD8548();
  v63 = *(_QWORD *)(v65 - 8);
  MEMORY[0x24BDAC7A8](v65);
  v69 = (char *)&v58 - v25;
  v27 = type metadata accessor for TabBarAction.CodingKeys(255, a2, a3, v26);
  MEMORY[0x24260FFB0](&unk_23BCDB1C8, v27);
  v95 = sub_23BCD8548();
  v91 = *(_QWORD *)(v95 - 8);
  MEMORY[0x24BDAC7A8](v95);
  v29 = (char *)&v58 - v28;
  v92 = a2;
  v93 = a3;
  v90 = type metadata accessor for TabBarAction(0, a2, a3, v30);
  v74 = *(_QWORD *)(v90 - 8);
  v31 = MEMORY[0x24BDAC7A8](v90);
  v33 = (char *)&v58 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = MEMORY[0x24BDAC7A8](v31);
  v36 = (char *)&v58 - v35;
  v37 = MEMORY[0x24BDAC7A8](v34);
  v39 = (char *)&v58 - v38;
  MEMORY[0x24BDAC7A8](v37);
  v41 = (char *)&v58 - v40;
  v42 = a1[3];
  v96 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v42);
  v94 = v29;
  v43 = v101;
  sub_23BCD85FC();
  if (!v43)
  {
    v59 = v39;
    v61 = v36;
    v60 = v33;
    v101 = 0;
    v62 = v41;
    v44 = v94;
    *(_QWORD *)&v97 = sub_23BCD853C();
    v45 = sub_23BCD8200();
    MEMORY[0x24260FFB0](MEMORY[0x24BEE12C8], v45);
    *(_QWORD *)&v99 = sub_23BCD83BC();
    *((_QWORD *)&v99 + 1) = v46;
    *(_QWORD *)&v100 = v47;
    *((_QWORD *)&v100 + 1) = v48;
    v49 = sub_23BCD83B0();
    MEMORY[0x24260FFB0](MEMORY[0x24BEE2190], v49);
    sub_23BCD8314();
    v50 = v97;
    v51 = v44;
    if (v97 != 5)
    {
      v58 = v99;
      v97 = v99;
      v98 = v100;
      v52 = sub_23BCD8320();
      v51 = v94;
      if ((v52 & 1) != 0)
        __asm { BR              X9 }
    }
    v53 = sub_23BCD8458();
    swift_allocError();
    v55 = v54;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A94A88);
    *v55 = v90;
    v56 = v95;
    sub_23BCD8500();
    sub_23BCD844C();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v53 - 8) + 104))(v55, *MEMORY[0x24BEE26D0], v53);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v91 + 8))(v51, v56);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v96);
}

void sub_23BCB1078()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v2 - 160) = 1;
  v3 = *(_QWORD *)(v2 - 376);
  v4 = *(_QWORD *)(v2 - 176);
  sub_23BCD84F4();
  if (v1)
  {
    swift_unknownObjectRelease();
    JUMPOUT(0x23BCB1048);
  }
  v5 = *(_QWORD *)(v2 - 408);
  sub_23BCD8530();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 424) + 8))(v3, v5);
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 208) + 8))(v0, v4);
  swift_storeEnumTagMultiPayload();
  JUMPOUT(0x23BCB1470);
}

void sub_23BCB10D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_BYTE *)(v1 - 160) = 2;
  v2 = *(_QWORD *)(v1 - 368);
  v3 = *(_QWORD *)(v1 - 176);
  sub_23BCD84F4();
  if (v0)
    JUMPOUT(0x23BCB1110);
  v4 = *(_QWORD *)(v1 - 392);
  v5 = sub_23BCD8524();
  v6 = *(_QWORD *)(v1 - 208);
  v7 = v5;
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 400) + 8))(v2, v4);
  swift_unknownObjectRelease();
  (*(void (**)(_QWORD, uint64_t))(v6 + 8))(*(_QWORD *)(v1 - 184), v3);
  **(_QWORD **)(v1 - 456) = v7;
  JUMPOUT(0x23BCB13ECLL);
}

void sub_23BCB1130()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_BYTE *)(v4 - 160) = 3;
  v5 = *(_QWORD *)(v4 - 360);
  v6 = *(_QWORD *)(v4 - 176);
  sub_23BCD84F4();
  if (v1)
  {
    swift_unknownObjectRelease();
    JUMPOUT(0x23BCB1298);
  }
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v5, v2);
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 208) + 8))(v0, v6);
  swift_storeEnumTagMultiPayload();
  JUMPOUT(0x23BCB1484);
}

void sub_23BCB1188()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_BYTE *)(v4 - 160) = 4;
  v5 = *(_QWORD *)(v4 - 352);
  v6 = *(_QWORD *)(v4 - 176);
  sub_23BCD84F4();
  if (v1)
  {
    swift_unknownObjectRelease();
    JUMPOUT(0x23BCB1298);
  }
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v5, v2);
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 208) + 8))(v0, v6);
  JUMPOUT(0x23BCB132CLL);
}

uint64_t type metadata accessor for TabBarAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for TabBarAction);
}

uint64_t sub_23BCB14A8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  return TabBarAction.init(from:)(a1, *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24), a3, a4);
}

void sub_23BCB14C4(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  TabBarAction.encode(to:)(a1, a2, a3, a4);
}

void TabBarAction.hash(into:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  v3 = MEMORY[0x24BDAC7A8](a1);
  MEMORY[0x24BDAC7A8](v3);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v6, a2);
  v7 = (char *)sub_23BCB1590 + 4 * byte_23BCDABCF[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23BCB1590()
{
  sub_23BCD85CC();
  return sub_23BCD85CC();
}

void static TabBarAction.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t TupleTypeMetadata2;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void (*v16)(char *, uint64_t, uint64_t);
  char *v17;
  _QWORD v18[5];
  uint64_t v19;

  v19 = a2;
  v18[2] = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v18[0] = v5;
  v18[1] = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for TabBarAction(0, v6, v5, v5);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v18[3] = (char *)v18 - v11;
  MEMORY[0x24BDAC7A8](v10);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v13 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v15 = (char *)v18 + *(int *)(v13 + 48) - v14;
  v18[4] = v8;
  v16 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v16((char *)v18 - v14, a1, v7);
  v16(v15, v19, v7);
  v17 = (char *)sub_23BCB1798 + 4 * byte_23BCDABD4[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

BOOL sub_23BCB1798()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  void (*v4)(_QWORD *, uint64_t, uint64_t);
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  BOOL v8;

  v4(v3, v1, v0);
  if (swift_getEnumCaseMultiPayload())
  {
    v8 = 0;
  }
  else
  {
    v8 = *v3 == *v6;
    v5 = *(_QWORD *)(v7 - 96);
    v2 = v0;
  }
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v1, v2);
  return v8;
}

uint64_t TabBarAction.hashValue.getter(uint64_t a1)
{
  _BYTE v3[72];

  sub_23BCD85C0();
  TabBarAction.hash(into:)((uint64_t)v3, a1);
  return sub_23BCD85F0();
}

uint64_t sub_23BCB194C(uint64_t a1, uint64_t a2)
{
  _BYTE v4[72];

  sub_23BCD85C0();
  TabBarAction.hash(into:)((uint64_t)v4, a2);
  return sub_23BCD85F0();
}

void sub_23BCB198C()
{
  JUMPOUT(0x24260FFB0);
}

void sub_23BCB199C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  static TabBarAction.== infix(_:_:)(a1, a2, *(_QWORD *)(a3 + 16));
}

uint64_t sub_23BCB19A8()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_23BCB19B0()
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

_QWORD *sub_23BCB1A28(char *__dst, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int v7;
  int v8;
  unsigned int v9;
  unsigned int v11;
  uint64_t v14;
  uint64_t v16;
  unsigned int v17;
  int v18;
  unsigned int v19;
  unsigned int v20;

  v3 = __dst;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  if (*(_QWORD *)(v4 + 64) <= 8uLL)
    v5 = 8;
  else
    v5 = *(_QWORD *)(v4 + 64);
  if (v5 > 3)
  {
    v6 = v5 + 1;
    v7 = *(_DWORD *)(v4 + 80);
    v8 = v7 & 0x1000F8;
    goto LABEL_9;
  }
  v9 = ((1 << (8 * v5)) + 1) >> (8 * v5);
  v7 = *(_DWORD *)(v4 + 80);
  if (v9 > 0xFFFC)
  {
    if ((unint64_t)(v5 + 4) > 0x18 || (v7 & 0x1000F8) != 0)
      goto LABEL_27;
    v11 = *(_DWORD *)((char *)a2 + v5);
    if (v11 < 3)
      goto LABEL_34;
    goto LABEL_30;
  }
  v8 = v7 & 0x1000F8;
  if (v9 > 0xFC)
  {
    if ((unint64_t)(v5 + 2) > 0x18 || v8 != 0)
      goto LABEL_27;
    v11 = *(unsigned __int16 *)((char *)a2 + v5);
    if (v11 < 3)
      goto LABEL_34;
LABEL_30:
    if (v5 <= 3)
      v16 = v5;
    else
      v16 = 4;
    __asm { BR              X13 }
  }
  v6 = v5 + 1;
LABEL_9:
  if (v6 > 0x18 || v8 != 0)
  {
LABEL_27:
    v14 = *a2;
    *v3 = *a2;
    v3 = (_QWORD *)(v14 + (((v7 & 0xF8 | 7u) + 16) & ~(unint64_t)(v7 & 0xF8 | 7u)));
    swift_retain();
    return v3;
  }
  v11 = *((unsigned __int8 *)a2 + v5);
  if (v11 >= 3)
    goto LABEL_30;
LABEL_34:
  if (v11 == 2)
  {
    *(_QWORD *)__dst = *a2;
    if (v5 <= 3)
    {
      v17 = ((1 << (8 * v5)) + 1) >> (8 * v5);
      if (v17 > 0xFFFC)
      {
        v18 = 2;
        goto LABEL_50;
      }
      if (v17 > 0xFC)
      {
        LOWORD(v18) = 2;
        goto LABEL_53;
      }
    }
    __dst[v5] = 2;
    return v3;
  }
  if (v11 == 1)
  {
    (*(void (**)(char *))(v4 + 16))(__dst);
    if (v5 > 3)
    {
LABEL_45:
      *((_BYTE *)v3 + v5) = 1;
      return v3;
    }
    v18 = 1;
    v19 = ((1 << (8 * v5)) + 1) >> (8 * v5);
    if (v19 <= 0xFFFC)
    {
      if (v19 <= 0xFC)
        goto LABEL_45;
LABEL_53:
      *(_WORD *)((char *)v3 + v5) = v18;
      return v3;
    }
LABEL_50:
    *(_DWORD *)((char *)v3 + v5) = v18;
    return v3;
  }
  *(_QWORD *)__dst = *a2;
  if (v5 > 3)
    goto LABEL_37;
  v20 = ((1 << (8 * v5)) + 1) >> (8 * v5);
  if (v20 > 0xFFFC)
  {
    *(_DWORD *)&__dst[v5] = 0;
    return v3;
  }
  if (v20 <= 0xFC)
LABEL_37:
    __dst[v5] = 0;
  else
    *(_WORD *)&__dst[v5] = 0;
  return v3;
}

uint64_t sub_23BCB1CE8(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;

  v2 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  v3 = *(_QWORD *)(v2 + 64);
  if (v3 <= 8)
    v3 = 8;
  if (v3 <= 3)
  {
    v5 = ((1 << (8 * v3)) + 1) >> (8 * v3);
    if (v5 > 0xFFFC)
    {
      v4 = *(_DWORD *)(result + v3);
      if (v4 < 3)
        goto LABEL_9;
    }
    else
    {
      if (v5 <= 0xFC)
        goto LABEL_4;
      v4 = *(unsigned __int16 *)(result + v3);
      if (v4 < 3)
        goto LABEL_9;
    }
LABEL_12:
    if (v3 <= 3)
      v6 = v3;
    else
      v6 = 4;
    return ((uint64_t (*)(void))((char *)&loc_23BCB1D88 + 4 * byte_23BCDABDE[v6]))();
  }
LABEL_4:
  v4 = *(unsigned __int8 *)(result + v3);
  if (v4 >= 3)
    goto LABEL_12;
LABEL_9:
  if (v4 == 1)
    return (*(uint64_t (**)(void))(v2 + 8))();
  return result;
}

char *sub_23BCB1DDC(char *__dst, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  int v10;
  unsigned int v11;
  unsigned int v12;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  if (*(_QWORD *)(v4 + 64) <= 8uLL)
    v5 = 8;
  else
    v5 = *(_QWORD *)(v4 + 64);
  if (v5 > 3)
    goto LABEL_7;
  v6 = ((1 << (8 * v5)) + 1) >> (8 * v5);
  if (v6 <= 0xFFFC)
  {
    if (v6 > 0xFC)
    {
      v7 = *(unsigned __int16 *)((char *)a2 + v5);
      if (v7 < 3)
        goto LABEL_16;
      goto LABEL_12;
    }
LABEL_7:
    v7 = *((unsigned __int8 *)a2 + v5);
    if (v7 < 3)
      goto LABEL_16;
LABEL_12:
    if (v5 <= 3)
      v8 = v5;
    else
      v8 = 4;
    __asm { BR              X13 }
  }
  v7 = *(_DWORD *)((char *)a2 + v5);
  if (v7 >= 3)
    goto LABEL_12;
LABEL_16:
  if (v7 == 2)
  {
    *(_QWORD *)__dst = *a2;
    if (v5 <= 3)
    {
      v9 = ((1 << (8 * v5)) + 1) >> (8 * v5);
      if (v9 > 0xFFFC)
      {
        v10 = 2;
        goto LABEL_32;
      }
      if (v9 > 0xFC)
      {
        LOWORD(v10) = 2;
        goto LABEL_35;
      }
    }
    __dst[v5] = 2;
    return __dst;
  }
  if (v7 == 1)
  {
    (*(void (**)(char *))(v4 + 16))(__dst);
    if (v5 > 3)
    {
LABEL_27:
      __dst[v5] = 1;
      return __dst;
    }
    v10 = 1;
    v11 = ((1 << (8 * v5)) + 1) >> (8 * v5);
    if (v11 <= 0xFFFC)
    {
      if (v11 <= 0xFC)
        goto LABEL_27;
LABEL_35:
      *(_WORD *)&__dst[v5] = v10;
      return __dst;
    }
LABEL_32:
    *(_DWORD *)&__dst[v5] = v10;
    return __dst;
  }
  *(_QWORD *)__dst = *a2;
  if (v5 > 3)
    goto LABEL_19;
  v12 = ((1 << (8 * v5)) + 1) >> (8 * v5);
  if (v12 > 0xFFFC)
  {
    *(_DWORD *)&__dst[v5] = 0;
    return __dst;
  }
  if (v12 <= 0xFC)
LABEL_19:
    __dst[v5] = 0;
  else
    *(_WORD *)&__dst[v5] = 0;
  return __dst;
}

char *sub_23BCB2024(char *__dst, char *__src, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  unsigned int v15;
  int v16;
  unsigned int v17;
  unsigned int v18;

  if (__dst == __src)
    return __dst;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  if (*(_QWORD *)(v6 + 64) <= 8uLL)
    v7 = 8;
  else
    v7 = *(_QWORD *)(v6 + 64);
  v8 = 8 * v7;
  if (v7 > 3)
  {
LABEL_8:
    v10 = __dst[v7];
    if (v10 < 3)
      goto LABEL_9;
LABEL_14:
    if (v7 <= 3)
      v11 = v7;
    else
      v11 = 4;
    __asm { BR              X11 }
  }
  v9 = ((1 << v8) + 1) >> v8;
  if (v9 > 0xFFFC)
  {
    v10 = *(_DWORD *)&__dst[v7];
    if (v10 >= 3)
      goto LABEL_14;
  }
  else
  {
    if (v9 <= 0xFC)
      goto LABEL_8;
    v10 = *(unsigned __int16 *)&__dst[v7];
    if (v10 >= 3)
      goto LABEL_14;
  }
LABEL_9:
  if (v10 == 1)
    (*(void (**)(char *, _QWORD))(v6 + 8))(__dst, *(_QWORD *)(a3 + 16));
  if (v7 > 3)
    goto LABEL_21;
  v12 = ((1 << v8) + 1) >> v8;
  if (v12 <= 0xFFFC)
  {
    if (v12 > 0xFC)
    {
      v13 = *(unsigned __int16 *)&__src[v7];
      if (v13 < 3)
        goto LABEL_30;
      goto LABEL_26;
    }
LABEL_21:
    v13 = __src[v7];
    if (v13 < 3)
      goto LABEL_30;
LABEL_26:
    if (v7 <= 3)
      v14 = v7;
    else
      v14 = 4;
    __asm { BR              X12 }
  }
  v13 = *(_DWORD *)&__src[v7];
  if (v13 >= 3)
    goto LABEL_26;
LABEL_30:
  if (v13 == 2)
  {
    *(_QWORD *)__dst = *(_QWORD *)__src;
    if (v7 <= 3)
    {
      v15 = ((1 << v8) + 1) >> v8;
      if (v15 > 0xFFFC)
      {
        v16 = 2;
        goto LABEL_46;
      }
      if (v15 > 0xFC)
      {
        LOWORD(v16) = 2;
        goto LABEL_49;
      }
    }
    __dst[v7] = 2;
    return __dst;
  }
  if (v13 == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(__dst, __src, v5);
    if (v7 > 3)
    {
LABEL_41:
      __dst[v7] = 1;
      return __dst;
    }
    v16 = 1;
    v17 = ((1 << v8) + 1) >> v8;
    if (v17 <= 0xFFFC)
    {
      if (v17 <= 0xFC)
        goto LABEL_41;
LABEL_49:
      *(_WORD *)&__dst[v7] = v16;
      return __dst;
    }
LABEL_46:
    *(_DWORD *)&__dst[v7] = v16;
    return __dst;
  }
  *(_QWORD *)__dst = *(_QWORD *)__src;
  if (v7 > 3)
    goto LABEL_33;
  v18 = ((1 << v8) + 1) >> v8;
  if (v18 > 0xFFFC)
  {
    *(_DWORD *)&__dst[v7] = 0;
    return __dst;
  }
  if (v18 <= 0xFC)
LABEL_33:
    __dst[v7] = 0;
  else
    *(_WORD *)&__dst[v7] = 0;
  return __dst;
}

char *sub_23BCB2358(char *__dst, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  int v10;
  unsigned int v11;
  unsigned int v12;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  if (*(_QWORD *)(v4 + 64) <= 8uLL)
    v5 = 8;
  else
    v5 = *(_QWORD *)(v4 + 64);
  if (v5 > 3)
    goto LABEL_7;
  v6 = ((1 << (8 * v5)) + 1) >> (8 * v5);
  if (v6 <= 0xFFFC)
  {
    if (v6 > 0xFC)
    {
      v7 = *(unsigned __int16 *)((char *)a2 + v5);
      if (v7 < 3)
        goto LABEL_16;
      goto LABEL_12;
    }
LABEL_7:
    v7 = *((unsigned __int8 *)a2 + v5);
    if (v7 < 3)
      goto LABEL_16;
LABEL_12:
    if (v5 <= 3)
      v8 = v5;
    else
      v8 = 4;
    __asm { BR              X13 }
  }
  v7 = *(_DWORD *)((char *)a2 + v5);
  if (v7 >= 3)
    goto LABEL_12;
LABEL_16:
  if (v7 == 2)
  {
    *(_QWORD *)__dst = *a2;
    if (v5 <= 3)
    {
      v9 = ((1 << (8 * v5)) + 1) >> (8 * v5);
      if (v9 > 0xFFFC)
      {
        v10 = 2;
        goto LABEL_32;
      }
      if (v9 > 0xFC)
      {
        LOWORD(v10) = 2;
        goto LABEL_35;
      }
    }
    __dst[v5] = 2;
    return __dst;
  }
  if (v7 == 1)
  {
    (*(void (**)(char *))(v4 + 32))(__dst);
    if (v5 > 3)
    {
LABEL_27:
      __dst[v5] = 1;
      return __dst;
    }
    v10 = 1;
    v11 = ((1 << (8 * v5)) + 1) >> (8 * v5);
    if (v11 <= 0xFFFC)
    {
      if (v11 <= 0xFC)
        goto LABEL_27;
LABEL_35:
      *(_WORD *)&__dst[v5] = v10;
      return __dst;
    }
LABEL_32:
    *(_DWORD *)&__dst[v5] = v10;
    return __dst;
  }
  *(_QWORD *)__dst = *a2;
  if (v5 > 3)
    goto LABEL_19;
  v12 = ((1 << (8 * v5)) + 1) >> (8 * v5);
  if (v12 > 0xFFFC)
  {
    *(_DWORD *)&__dst[v5] = 0;
    return __dst;
  }
  if (v12 <= 0xFC)
LABEL_19:
    __dst[v5] = 0;
  else
    *(_WORD *)&__dst[v5] = 0;
  return __dst;
}

char *sub_23BCB25A0(char *__dst, char *__src, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  unsigned int v15;
  int v16;
  unsigned int v17;
  unsigned int v18;

  if (__dst == __src)
    return __dst;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  if (*(_QWORD *)(v6 + 64) <= 8uLL)
    v7 = 8;
  else
    v7 = *(_QWORD *)(v6 + 64);
  v8 = 8 * v7;
  if (v7 > 3)
  {
LABEL_8:
    v10 = __dst[v7];
    if (v10 < 3)
      goto LABEL_9;
LABEL_14:
    if (v7 <= 3)
      v11 = v7;
    else
      v11 = 4;
    __asm { BR              X11 }
  }
  v9 = ((1 << v8) + 1) >> v8;
  if (v9 > 0xFFFC)
  {
    v10 = *(_DWORD *)&__dst[v7];
    if (v10 >= 3)
      goto LABEL_14;
  }
  else
  {
    if (v9 <= 0xFC)
      goto LABEL_8;
    v10 = *(unsigned __int16 *)&__dst[v7];
    if (v10 >= 3)
      goto LABEL_14;
  }
LABEL_9:
  if (v10 == 1)
    (*(void (**)(char *, _QWORD))(v6 + 8))(__dst, *(_QWORD *)(a3 + 16));
  if (v7 > 3)
    goto LABEL_21;
  v12 = ((1 << v8) + 1) >> v8;
  if (v12 <= 0xFFFC)
  {
    if (v12 > 0xFC)
    {
      v13 = *(unsigned __int16 *)&__src[v7];
      if (v13 < 3)
        goto LABEL_30;
      goto LABEL_26;
    }
LABEL_21:
    v13 = __src[v7];
    if (v13 < 3)
      goto LABEL_30;
LABEL_26:
    if (v7 <= 3)
      v14 = v7;
    else
      v14 = 4;
    __asm { BR              X12 }
  }
  v13 = *(_DWORD *)&__src[v7];
  if (v13 >= 3)
    goto LABEL_26;
LABEL_30:
  if (v13 == 2)
  {
    *(_QWORD *)__dst = *(_QWORD *)__src;
    if (v7 <= 3)
    {
      v15 = ((1 << v8) + 1) >> v8;
      if (v15 > 0xFFFC)
      {
        v16 = 2;
        goto LABEL_46;
      }
      if (v15 > 0xFC)
      {
        LOWORD(v16) = 2;
        goto LABEL_49;
      }
    }
    __dst[v7] = 2;
    return __dst;
  }
  if (v13 == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(__dst, __src, v5);
    if (v7 > 3)
    {
LABEL_41:
      __dst[v7] = 1;
      return __dst;
    }
    v16 = 1;
    v17 = ((1 << v8) + 1) >> v8;
    if (v17 <= 0xFFFC)
    {
      if (v17 <= 0xFC)
        goto LABEL_41;
LABEL_49:
      *(_WORD *)&__dst[v7] = v16;
      return __dst;
    }
LABEL_46:
    *(_DWORD *)&__dst[v7] = v16;
    return __dst;
  }
  *(_QWORD *)__dst = *(_QWORD *)__src;
  if (v7 > 3)
    goto LABEL_33;
  v18 = ((1 << v8) + 1) >> v8;
  if (v18 > 0xFFFC)
  {
    *(_DWORD *)&__dst[v7] = 0;
    return __dst;
  }
  if (v18 <= 0xFC)
LABEL_33:
    __dst[v7] = 0;
  else
    *(_WORD *)&__dst[v7] = 0;
  return __dst;
}

uint64_t sub_23BCB28D4(uint64_t a1, unsigned int a2, uint64_t a3)
{
  unint64_t v3;
  int v4;
  unsigned int v5;
  char v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  int v12;
  unsigned int v13;
  int v14;
  int v16;
  unsigned int v17;
  unsigned int v18;
  char v19;
  int v20;
  unsigned int v21;
  int v22;
  int v23;
  unsigned int v24;

  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
  if (v3 <= 8)
    v3 = 8;
  if (v3 > 3)
  {
    v4 = 4;
LABEL_7:
    v6 = 8;
    goto LABEL_8;
  }
  v5 = ((1 << (8 * v3)) + 1) >> (8 * v3);
  if (v5 > 0xFFFC)
    goto LABEL_11;
  v4 = v5 + 3;
  if (v5 <= 0xFC)
    goto LABEL_7;
  v6 = 16;
LABEL_8:
  v7 = (1 << v6) - v4;
  if ((v7 & 0x80000000) == 0)
  {
    if (v3 > 3)
      goto LABEL_15;
LABEL_12:
    v8 = ((1 << (8 * v3)) + 1) >> (8 * v3);
    v9 = 2;
    if (v8 > 0xFFFC)
      v9 = 4;
    if (v8 > 0xFC)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_11:
  v7 = 0x7FFFFFFF;
  if (v3 <= 3)
    goto LABEL_12;
LABEL_15:
  v9 = 1;
LABEL_16:
  if (!a2)
    return 0;
  if (a2 <= v7)
    goto LABEL_34;
  v10 = v9 + v3;
  v11 = 8 * v10;
  if (v10 <= 3)
  {
    v13 = ((a2 - v7 + ~(-1 << v11)) >> v11) + 1;
    if (HIWORD(v13))
    {
      v12 = *(_DWORD *)(a1 + v10);
      if (!v12)
        goto LABEL_34;
      goto LABEL_27;
    }
    if (v13 > 0xFF)
    {
      v12 = *(unsigned __int16 *)(a1 + v10);
      if (!*(_WORD *)(a1 + v10))
        goto LABEL_34;
      goto LABEL_27;
    }
    if (v13 < 2)
    {
LABEL_34:
      if (v7)
      {
        if (v3 <= 3)
        {
          v21 = ((1 << (8 * v3)) + 1) >> (8 * v3);
          if (v21 > 0xFFFC)
          {
            v17 = *(_DWORD *)(a1 + v3);
            v18 = ~v17;
LABEL_44:
            v24 = 0x7FFFFFFF;
LABEL_45:
            if (v24 > v18)
              return -v17;
            else
              return 0;
          }
          v20 = v21 + 3;
          if (v21 > 0xFC)
          {
            v23 = *(unsigned __int16 *)(a1 + v3);
            v17 = v23 | 0xFFFF0000;
            v18 = v23 ^ 0xFFFF;
            v19 = 16;
          }
          else
          {
            v22 = *(unsigned __int8 *)(a1 + v3);
            v17 = v22 | 0xFFFFFF00;
            v18 = v22 ^ 0xFF;
            v19 = 8;
          }
        }
        else
        {
          v16 = *(unsigned __int8 *)(a1 + v3);
          v17 = v16 | 0xFFFFFF00;
          v18 = v16 ^ 0xFF;
          v19 = 8;
          v20 = 4;
        }
        v24 = (1 << v19) - v20;
        if ((v24 & 0x80000000) == 0)
          goto LABEL_45;
        goto LABEL_44;
      }
      return 0;
    }
  }
  v12 = *(unsigned __int8 *)(a1 + v10);
  if (!*(_BYTE *)(a1 + v10))
    goto LABEL_34;
LABEL_27:
  v14 = (v12 - 1) << v11;
  if (v10 > 3)
    v14 = 0;
  if (!(_DWORD)v10)
    return v7 + v14 + 1;
  if (v10 > 3)
    LODWORD(v10) = 4;
  return ((uint64_t (*)(void))((char *)&loc_23BCB2A30 + 4 * byte_23BCDAC01[(v10 - 1)]))();
}

void sub_23BCB2B14(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5;
  char v6;
  int v7;
  char v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  size_t v13;
  unsigned int v14;
  int v15;
  unsigned int v16;
  int v17;

  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 16) - 8) + 64);
  if (v5 <= 8)
    v5 = 8;
  v6 = 8 * v5;
  if (v5 <= 3)
  {
    v10 = ((1 << v6) + 1) >> v6;
    if (v10 > 0xFFFC)
      goto LABEL_12;
    v7 = v10 + 3;
    if (v10 > 0xFC)
    {
      v8 = 16;
LABEL_6:
      v9 = (1 << v8) - v7;
      if ((v9 & 0x80000000) == 0)
      {
        if (v5 > 3)
          goto LABEL_16;
LABEL_13:
        v11 = ((1 << v6) + 1) >> v6;
        v12 = 2;
        if (v11 > 0xFFFC)
          v12 = 4;
        if (v11 > 0xFC)
        {
LABEL_17:
          v13 = v12 + v5;
          if (a3 <= v9)
          {
            v14 = 0;
          }
          else if (v13 <= 3)
          {
            v16 = ((a3 - v9 + ~(-1 << (8 * v13))) >> (8 * v13)) + 1;
            if (HIWORD(v16))
            {
              v14 = 4u;
            }
            else if (v16 >= 0x100)
            {
              v14 = 2;
            }
            else
            {
              v14 = v16 > 1;
            }
          }
          else
          {
            v14 = 1u;
          }
          if (v9 < a2)
          {
            v15 = ~v9 + a2;
            if (v13 < 4)
            {
              if ((_DWORD)v13)
              {
                v17 = v15 & ~(-1 << (8 * v13));
                bzero(a1, v13);
                if ((_DWORD)v13 == 3)
                {
                  *a1 = v17;
                  *((_BYTE *)a1 + 2) = BYTE2(v17);
                }
                else if ((_DWORD)v13 == 2)
                {
                  *a1 = v17;
                }
                else
                {
                  *(_BYTE *)a1 = v17;
                }
              }
            }
            else
            {
              bzero(a1, v13);
              *(_DWORD *)a1 = v15;
            }
            __asm { BR              X10 }
          }
          __asm { BR              X12 }
        }
LABEL_16:
        v12 = 1;
        goto LABEL_17;
      }
LABEL_12:
      v9 = 0x7FFFFFFF;
      if (v5 > 3)
        goto LABEL_16;
      goto LABEL_13;
    }
  }
  else
  {
    v7 = 4;
  }
  v8 = 8;
  goto LABEL_6;
}

uint64_t sub_23BCB2D94(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  uint64_t v5;

  v2 = 8;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64) > 8uLL)
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64);
  if (v2 > 3)
    goto LABEL_4;
  v4 = ((1 << (8 * v2)) + 1) >> (8 * v2);
  if (v4 > 0xFFFC)
  {
    v3 = *(unsigned int *)(a1 + v2);
  }
  else
  {
    if (v4 <= 0xFC)
    {
LABEL_4:
      v3 = *(unsigned __int8 *)(a1 + v2);
      goto LABEL_9;
    }
    v3 = *(unsigned __int16 *)(a1 + v2);
  }
LABEL_9:
  if (v3 < 3)
    return v3;
  if (v2 <= 3)
    v5 = v2;
  else
    v5 = 4;
  return ((uint64_t (*)(void))((char *)&loc_23BCB2E1C + 4 * byte_23BCDAC0F[v5]))();
}

_BYTE *sub_23BCB2E64(_BYTE *result, unsigned int a2, uint64_t a3)
{
  size_t v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int *v7;
  unsigned int v8;
  int v9;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64) <= 8uLL)
    v4 = 8;
  else
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
  if (a2 > 2)
  {
    if (v4 < 4)
    {
      v6 = ((a2 - 3) >> (8 * v4)) + 3;
      v7 = (unsigned int *)&result[v4];
      v8 = ((1 << (8 * v4)) + 1) >> (8 * v4);
      if (v8 > 0xFFFC)
      {
        *v7 = v6;
      }
      else if (v8 > 0xFC)
      {
        *(_WORD *)v7 = v6;
      }
      else
      {
        *(_BYTE *)v7 = v6;
      }
    }
    else
    {
      result[v4] = 3;
    }
    if (v4 <= 3)
      v9 = v4;
    else
      v9 = 4;
    bzero(result, v4);
    __asm { BR              X10 }
  }
  if (v4 > 3)
    goto LABEL_6;
  v5 = ((1 << (8 * v4)) + 1) >> (8 * v4);
  if (v5 > 0xFFFC)
  {
    *(_DWORD *)&result[v4] = a2;
  }
  else
  {
    if (v5 <= 0xFC)
    {
LABEL_6:
      result[v4] = a2;
      return result;
    }
    *(_WORD *)&result[v4] = a2;
  }
  return result;
}

uint64_t sub_23BCB2FB8(unsigned __int8 *a1, unsigned int a2)
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

uint64_t sub_23BCB3048(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23BCB3094 + 4 * byte_23BCDAC1D[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_23BCB30C8 + 4 * byte_23BCDAC18[v4]))();
}

uint64_t sub_23BCB30C8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BCB30D0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23BCB30D8);
  return result;
}

uint64_t sub_23BCB30E4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23BCB30ECLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_23BCB30F0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BCB30F8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BCB3108(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23BCB3148 + 4 * byte_23BCDAC22[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23BCB3168 + 4 * byte_23BCDAC27[v4]))();
}

_BYTE *sub_23BCB3148(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23BCB3168(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23BCB3170(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23BCB3178(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23BCB3180(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23BCB3188(_DWORD *result)
{
  *result = 0;
  return result;
}

void sub_23BCB3194()
{
  JUMPOUT(0x24260FFB0);
}

void sub_23BCB31A4()
{
  JUMPOUT(0x24260FFB0);
}

void sub_23BCB31B4()
{
  JUMPOUT(0x24260FFB0);
}

void sub_23BCB31C4()
{
  JUMPOUT(0x24260FFB0);
}

void sub_23BCB31D4()
{
  JUMPOUT(0x24260FFB0);
}

void sub_23BCB31E4()
{
  JUMPOUT(0x24260FFB0);
}

void sub_23BCB31F4()
{
  JUMPOUT(0x24260FFB0);
}

void sub_23BCB3204()
{
  JUMPOUT(0x24260FFB0);
}

void sub_23BCB3214()
{
  JUMPOUT(0x24260FFB0);
}

void sub_23BCB3224()
{
  JUMPOUT(0x24260FFB0);
}

void sub_23BCB3234()
{
  JUMPOUT(0x24260FFB0);
}

void sub_23BCB3244()
{
  JUMPOUT(0x24260FFB0);
}

void sub_23BCB3254()
{
  JUMPOUT(0x24260FFB0);
}

void sub_23BCB3264()
{
  JUMPOUT(0x24260FFB0);
}

void sub_23BCB3274()
{
  JUMPOUT(0x24260FFB0);
}

void sub_23BCB3284()
{
  JUMPOUT(0x24260FFB0);
}

uint64_t sub_23BCB3294()
{
  return 5;
}

uint64_t sub_23BCB32A4()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000010;
  else
    return 0x6570704177656976;
}

uint64_t sub_23BCB32EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23BCB481C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23BCB3310()
{
  sub_23BCB3724();
  return sub_23BCD8614();
}

uint64_t sub_23BCB3338()
{
  sub_23BCB3724();
  return sub_23BCD8620();
}

uint64_t sub_23BCB3360()
{
  sub_23BCB37AC();
  return sub_23BCD8614();
}

uint64_t sub_23BCB3388()
{
  sub_23BCB37AC();
  return sub_23BCD8620();
}

uint64_t sub_23BCB33B0()
{
  sub_23BCB382C();
  return sub_23BCD8614();
}

uint64_t sub_23BCB33D8()
{
  sub_23BCB382C();
  return sub_23BCD8620();
}

uint64_t SidebarModalitiesAction.encode(to:)(_QWORD *a1)
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

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95AC0);
  v25 = *(_QWORD *)(v2 - 8);
  v26 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v24 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for SidebarModality();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v23 = (uint64_t)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95AC8);
  v21 = *(_QWORD *)(v7 - 8);
  v22 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for SidebarModalitiesAction();
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95AD0);
  v28 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23BCB3724();
  sub_23BCD8608();
  sub_23BCB3768(v27, (uint64_t)v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v12, 1, v4) == 1)
  {
    v29 = 0;
    sub_23BCB382C();
    sub_23BCD8554();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v9, v22);
  }
  else
  {
    v17 = v23;
    sub_23BC9FFF0((uint64_t)v12, v23, (uint64_t (*)(_QWORD))type metadata accessor for SidebarModality);
    v30 = 1;
    sub_23BCB37AC();
    v18 = v24;
    sub_23BCD8554();
    sub_23BCB3CB0(&qword_256A95AE8, (uint64_t)&protocol conformance descriptor for SidebarModality);
    v19 = v26;
    sub_23BCD8584();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v18, v19);
    sub_23BCB37F0(v17);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v15, v13);
}

uint64_t type metadata accessor for SidebarModalitiesAction()
{
  uint64_t result;

  result = qword_256A95B88;
  if (!qword_256A95B88)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_23BCB3724()
{
  unint64_t result;

  result = qword_256A95AD8;
  if (!qword_256A95AD8)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDB6EC, &type metadata for SidebarModalitiesAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A95AD8);
  }
  return result;
}

uint64_t sub_23BCB3768(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SidebarModalitiesAction();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_23BCB37AC()
{
  unint64_t result;

  result = qword_256A95AE0;
  if (!qword_256A95AE0)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDB69C, &type metadata for SidebarModalitiesAction.ModalitySelectedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A95AE0);
  }
  return result;
}

uint64_t sub_23BCB37F0(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SidebarModality();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23BCB382C()
{
  unint64_t result;

  result = qword_256A95AF0;
  if (!qword_256A95AF0)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDB64C, &type metadata for SidebarModalitiesAction.ViewAppearedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A95AF0);
  }
  return result;
}

uint64_t SidebarModalitiesAction.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95AF8);
  v4 = *(_QWORD *)(v3 - 8);
  v35 = v3;
  v36 = v4;
  MEMORY[0x24BDAC7A8](v3);
  v38 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95B00);
  v33 = *(_QWORD *)(v6 - 8);
  v34 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v37 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95B08);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for SidebarModalitiesAction();
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v32 - v16;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23BCB3724();
  v18 = v40;
  sub_23BCD85FC();
  if (!v18)
  {
    v32 = v12;
    v19 = v37;
    v20 = v38;
    v40 = v9;
    v21 = v39;
    v22 = sub_23BCD853C();
    if (*(_QWORD *)(v22 + 16) == 1)
    {
      if ((*(_BYTE *)(v22 + 32) & 1) != 0)
      {
        v37 = (char *)v22;
        v43 = 1;
        sub_23BCB37AC();
        sub_23BCD84F4();
        v27 = type metadata accessor for SidebarModality();
        sub_23BCB3CB0(&qword_256A95B10, (uint64_t)&protocol conformance descriptor for SidebarModality);
        v28 = v20;
        v29 = v27;
        v30 = v35;
        sub_23BCD8530();
        (*(void (**)(char *, uint64_t))(v36 + 8))(v28, v30);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v40 + 8))(v11, v8);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56))(v15, 0, 1, v29);
        sub_23BC9FFF0((uint64_t)v15, (uint64_t)v17, (uint64_t (*)(_QWORD))type metadata accessor for SidebarModalitiesAction);
      }
      else
      {
        v42 = 0;
        sub_23BCB382C();
        sub_23BCD84F4();
        (*(void (**)(char *, uint64_t))(v33 + 8))(v19, v34);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v40 + 8))(v11, v8);
        v31 = type metadata accessor for SidebarModality();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v17, 1, 1, v31);
      }
      sub_23BC9FFF0((uint64_t)v17, v21, (uint64_t (*)(_QWORD))type metadata accessor for SidebarModalitiesAction);
    }
    else
    {
      v23 = sub_23BCD8458();
      swift_allocError();
      v25 = v24;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256A94A88);
      *v25 = v32;
      sub_23BCD8500();
      sub_23BCD844C();
      (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v23 - 8) + 104))(v25, *MEMORY[0x24BEE26D0], v23);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v40 + 8))(v11, v8);
    }
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
}

uint64_t sub_23BCB3CB0(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for SidebarModality();
    result = MEMORY[0x24260FFB0](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23BCB3CF0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return SidebarModalitiesAction.init(from:)(a1, a2);
}

uint64_t sub_23BCB3D04(_QWORD *a1)
{
  return SidebarModalitiesAction.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for SidebarModalitiesAction(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  void (*v15)(char *, char *, uint64_t);

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
    v7 = type metadata accessor for SidebarModality();
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
      *((_BYTE *)a1 + 16) = *((_BYTE *)a2 + 16);
      v11 = *(int *)(v7 + 24);
      v12 = (char *)a1 + v11;
      v13 = (char *)a2 + v11;
      v14 = sub_23BCD7900();
      v15 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
      swift_bridgeObjectRetain();
      v15(v12, v13, v14);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t destroy for SidebarModalitiesAction(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v2 = type metadata accessor for SidebarModality();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 1, v2);
  if (!(_DWORD)result)
  {
    swift_bridgeObjectRelease();
    v4 = a1 + *(int *)(v2 + 24);
    v5 = sub_23BCD7900();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  return result;
}

_QWORD *initializeWithCopy for SidebarModalitiesAction(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);

  v6 = type metadata accessor for SidebarModality();
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
    *((_BYTE *)a1 + 16) = *((_BYTE *)a2 + 16);
    v9 = *(int *)(v6 + 24);
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = sub_23BCD7900();
    v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    v13(v10, v11, v12);
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

uint64_t assignWithCopy for SidebarModalitiesAction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v6 = type metadata accessor for SidebarModality();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      *(_QWORD *)a1 = *(_QWORD *)a2;
      *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
      v17 = *(int *)(v6 + 24);
      v18 = a1 + v17;
      v19 = a2 + v17;
      v20 = sub_23BCD7900();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 24))(v18, v19, v20);
      return a1;
    }
    sub_23BCB37F0(a1);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy((void *)a1, (const void *)a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v11 = *(int *)(v6 + 24);
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = sub_23BCD7900();
  v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
  swift_bridgeObjectRetain();
  v15(v12, v13, v14);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

_BYTE *initializeWithTake for SidebarModalitiesAction(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  _BYTE *v10;
  uint64_t v11;

  v6 = type metadata accessor for SidebarModality();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    a1[16] = a2[16];
    v8 = *(int *)(v6 + 24);
    v9 = &a1[v8];
    v10 = &a2[v8];
    v11 = sub_23BCD7900();
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

_BYTE *assignWithTake for SidebarModalitiesAction(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(_BYTE *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  _BYTE *v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  _BYTE *v19;
  uint64_t v20;

  v6 = type metadata accessor for SidebarModality();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      v16 = *((_QWORD *)a2 + 1);
      *(_QWORD *)a1 = *(_QWORD *)a2;
      *((_QWORD *)a1 + 1) = v16;
      swift_bridgeObjectRelease();
      a1[16] = a2[16];
      v17 = *(int *)(v6 + 24);
      v18 = &a1[v17];
      v19 = &a2[v17];
      v20 = sub_23BCD7900();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v20 - 8) + 40))(v18, v19, v20);
      return a1;
    }
    sub_23BCB37F0((uint64_t)a1);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
  a1[16] = a2[16];
  v11 = *(int *)(v6 + 24);
  v12 = &a1[v11];
  v13 = &a2[v11];
  v14 = sub_23BCD7900();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v12, v13, v14);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for SidebarModalitiesAction()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23BCB42F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int v5;

  v4 = type metadata accessor for SidebarModality();
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 2)
    return v5 - 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SidebarModalitiesAction()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23BCB4348(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  if (a2)
    v5 = (a2 + 1);
  else
    v5 = 0;
  v6 = type metadata accessor for SidebarModality();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a1, v5, a3, v6);
}

uint64_t sub_23BCB4398(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SidebarModality();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 1, v2);
}

uint64_t sub_23BCB43D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SidebarModality();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, 1, v4);
}

uint64_t sub_23BCB4410()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for SidebarModality();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for SidebarModalitiesAction.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23BCB44B0 + 4 * byte_23BCDB3B5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23BCB44E4 + 4 * byte_23BCDB3B0[v4]))();
}

uint64_t sub_23BCB44E4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BCB44EC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23BCB44F4);
  return result;
}

uint64_t sub_23BCB4500(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23BCB4508);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23BCB450C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BCB4514(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SidebarModalitiesAction.CodingKeys()
{
  return &type metadata for SidebarModalitiesAction.CodingKeys;
}

ValueMetadata *type metadata accessor for SidebarModalitiesAction.ViewAppearedCodingKeys()
{
  return &type metadata for SidebarModalitiesAction.ViewAppearedCodingKeys;
}

uint64_t storeEnumTagSinglePayload for SidebarModalitiesAction.ModalitySelectedCodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23BCB4580 + 4 * byte_23BCDB3BA[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23BCB45A0 + 4 * byte_23BCDB3BF[v4]))();
}

_BYTE *sub_23BCB4580(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23BCB45A0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23BCB45A8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23BCB45B0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23BCB45B8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23BCB45C0(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for SidebarModalitiesAction.ModalitySelectedCodingKeys()
{
  return &type metadata for SidebarModalitiesAction.ModalitySelectedCodingKeys;
}

unint64_t sub_23BCB45E0()
{
  unint64_t result;

  result = qword_256A95B98;
  if (!qword_256A95B98)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDB51C, &type metadata for SidebarModalitiesAction.ModalitySelectedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A95B98);
  }
  return result;
}

unint64_t sub_23BCB4628()
{
  unint64_t result;

  result = qword_256A95BA0;
  if (!qword_256A95BA0)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDB624, &type metadata for SidebarModalitiesAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A95BA0);
  }
  return result;
}

unint64_t sub_23BCB4670()
{
  unint64_t result;

  result = qword_256A95BA8;
  if (!qword_256A95BA8)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDB544, &type metadata for SidebarModalitiesAction.ViewAppearedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A95BA8);
  }
  return result;
}

unint64_t sub_23BCB46B8()
{
  unint64_t result;

  result = qword_256A95BB0;
  if (!qword_256A95BB0)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDB56C, &type metadata for SidebarModalitiesAction.ViewAppearedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A95BB0);
  }
  return result;
}

unint64_t sub_23BCB4700()
{
  unint64_t result;

  result = qword_256A95BB8;
  if (!qword_256A95BB8)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDB48C, &type metadata for SidebarModalitiesAction.ModalitySelectedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A95BB8);
  }
  return result;
}

unint64_t sub_23BCB4748()
{
  unint64_t result;

  result = qword_256A95BC0;
  if (!qword_256A95BC0)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDB4B4, &type metadata for SidebarModalitiesAction.ModalitySelectedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A95BC0);
  }
  return result;
}

unint64_t sub_23BCB4790()
{
  unint64_t result;

  result = qword_256A95BC8;
  if (!qword_256A95BC8)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDB594, &type metadata for SidebarModalitiesAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A95BC8);
  }
  return result;
}

unint64_t sub_23BCB47D8()
{
  unint64_t result;

  result = qword_256A95BD0;
  if (!qword_256A95BD0)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDB5BC, &type metadata for SidebarModalitiesAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A95BD0);
  }
  return result;
}

uint64_t sub_23BCB481C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6570704177656976 && a2 == 0xEC00000064657261;
  if (v2 || (sub_23BCD85A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000023BCE60B0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23BCD85A8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t SidebarModalitiesView.init(store:textViewBuilder:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  uint64_t result;
  _QWORD *v12;

  v10 = type metadata accessor for SidebarModalitiesView();
  type metadata accessor for SidebarModality();
  sub_23BCB4A08();
  sub_23BCD7A38();
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a1;
  *(_QWORD *)(result + 24) = a2;
  *(_QWORD *)a5 = sub_23BCA3440;
  *(_QWORD *)(a5 + 8) = result;
  *(_BYTE *)(a5 + 16) = 0;
  v12 = (_QWORD *)(a5 + *(int *)(v10 + 24));
  *v12 = a3;
  v12[1] = a4;
  return result;
}

uint64_t type metadata accessor for SidebarModalitiesView()
{
  uint64_t result;

  result = qword_256A95CC8;
  if (!qword_256A95CC8)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_23BCB4A08()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256A95BD8;
  if (!qword_256A95BD8)
  {
    v1 = type metadata accessor for SidebarModality();
    result = MEMORY[0x24260FFB0](&protocol conformance descriptor for SidebarModality, v1);
    atomic_store(result, (unint64_t *)&qword_256A95BD8);
  }
  return result;
}

uint64_t sub_23BCB4A50()
{
  swift_release();
  return swift_deallocObject();
}

void SidebarModalitiesView.body.getter(uint64_t a1@<X8>)
{
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
  char *v15;
  _QWORD v16[8];
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;

  v21 = a1;
  v2 = sub_23BCD7984();
  MEMORY[0x24BDAC7A8](v2);
  v16[2] = (char *)v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_23BCD8134();
  MEMORY[0x24BDAC7A8](v4);
  v16[1] = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95BE0);
  v16[4] = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v16[3] = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95BE8);
  MEMORY[0x24BDAC7A8](v18);
  v19 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for SidebarModalitiesView();
  v16[5] = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v16[6] = v9;
  v16[7] = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95BF0);
  MEMORY[0x24BDAC7A8](v10);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95BF8);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v16 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A95C00);
  sub_23BCA37E0(&qword_256A95C08, &qword_256A95C00, MEMORY[0x24BE2B5E8]);
  sub_23BCD7A5C();
  swift_getKeyPath();
  sub_23BCD80A4();
  swift_release();
  swift_release();
  sub_23BCD805C();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  v15 = (char *)&loc_23BCB4CFC + dword_23BCB5024[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23BCB4D0C(uint64_t a1)
{
  uint64_t v1;
  uint64_t ObjCClassFromMetadata;
  id v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  MEMORY[0x24BDAC7A8](a1);
  sub_23BCD8128();
  type metadata accessor for LocalizableBundle();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_23BCD7A5C();
  swift_getKeyPath();
  sub_23BCD80A4();
  swift_release();
  swift_release();
  *(_QWORD *)(v1 - 112) = sub_23BCD8170();
  *(_QWORD *)(v1 - 104) = v4;
  sub_23BCB5304();
  *(_QWORD *)(v1 - 112) = sub_23BCD7DB0();
  *(_QWORD *)(v1 - 104) = v5;
  *(_BYTE *)(v1 - 96) = v6 & 1;
  *(_QWORD *)(v1 - 88) = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A95C20);
  sub_23BCB5348();
  v8 = *(_QWORD *)(v1 - 200);
  sub_23BCD7FF0();
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(v1 - 192);
  v10 = *(_QWORD *)(v1 - 136);
  (*(void (**)(_QWORD, uint64_t, uint64_t))(v9 + 16))(*(_QWORD *)(v1 - 144), v8, v10);
  swift_storeEnumTagMultiPayload();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A95C50);
  sub_23BCB5474();
  sub_23BCB54D8();
  sub_23BCD7BDC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
}

uint64_t sub_23BCB5038()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v5;

  v0 = type metadata accessor for SidebarModalitiesAction();
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v5 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A95C00);
  sub_23BCA37E0(&qword_256A95C08, &qword_256A95C00, MEMORY[0x24BE2B5E8]);
  sub_23BCD7A5C();
  v3 = type metadata accessor for SidebarModality();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v2, 1, 1, v3);
  sub_23BCD80BC();
  swift_release();
  return sub_23BCAC3AC((uint64_t)v2, (uint64_t (*)(_QWORD))type metadata accessor for SidebarModalitiesAction);
}

uint64_t sub_23BCB513C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD v14[6];

  v4 = type metadata accessor for SidebarModalitiesView();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v14[5] = a1;
  swift_getKeyPath();
  sub_23BCA8DD0(a2, (uint64_t)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for SidebarModalitiesView);
  v7 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v8 = swift_allocObject();
  sub_23BC9FFF0((uint64_t)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v8 + v7, (uint64_t (*)(_QWORD))type metadata accessor for SidebarModalitiesView);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A95D20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A95D28);
  sub_23BCA37E0(&qword_256A95D30, &qword_256A95D20, MEMORY[0x24BEE12D8]);
  v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A95C30);
  v10 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A95C38);
  v11 = sub_23BCA37E0(&qword_256A95C40, &qword_256A95C30, MEMORY[0x24BDF43B0]);
  v12 = sub_23BCB5410();
  v14[1] = v9;
  v14[2] = v10;
  v14[3] = v11;
  v14[4] = v12;
  swift_getOpaqueTypeConformance2();
  return sub_23BCD7FCC();
}

uint64_t sub_23BCB52FC()
{
  uint64_t v0;

  return sub_23BCB513C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

unint64_t sub_23BCB5304()
{
  unint64_t result;

  result = qword_256A95C18;
  if (!qword_256A95C18)
  {
    result = MEMORY[0x24260FFB0](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_256A95C18);
  }
  return result;
}

unint64_t sub_23BCB5348()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[5];

  result = qword_256A95C28;
  if (!qword_256A95C28)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A95C20);
    v2[1] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A95C30);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A95C38);
    v2[3] = sub_23BCA37E0(&qword_256A95C40, &qword_256A95C30, MEMORY[0x24BDF43B0]);
    v2[4] = sub_23BCB5410();
    v2[0] = swift_getOpaqueTypeConformance2();
    result = MEMORY[0x24260FFB0](MEMORY[0x24BDF4A08], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256A95C28);
  }
  return result;
}

unint64_t sub_23BCB5410()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_256A95C48;
  if (!qword_256A95C48)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A95C38);
    v2 = sub_23BCB4A08();
    result = MEMORY[0x24260FFB0](MEMORY[0x24BEE4AB0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_256A95C48);
  }
  return result;
}

unint64_t sub_23BCB5474()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256A95C58;
  if (!qword_256A95C58)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A95C50);
    v2[0] = MEMORY[0x24BDF3E20];
    v2[1] = MEMORY[0x24BDF0910];
    result = MEMORY[0x24260FFB0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256A95C58);
  }
  return result;
}

unint64_t sub_23BCB54D8()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[3];

  result = qword_256A95C60;
  if (!qword_256A95C60)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A95BE0);
    v2 = sub_23BCB5348();
    v3[0] = MEMORY[0x24BDF1F80];
    v3[1] = v2;
    v3[2] = MEMORY[0x24BDF5138];
    result = MEMORY[0x24260FFB0](MEMORY[0x24BDF4AF8], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256A95C60);
  }
  return result;
}

uint64_t sub_23BCB5554()
{
  type metadata accessor for SidebarModalitiesView();
  return sub_23BCB5038();
}

uint64_t sub_23BCB5580()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23BCB5590@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
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
  char *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v24 = a1;
  v32 = a3;
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95C38);
  MEMORY[0x24BDAC7A8](v31);
  v27 = (uint64_t)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95D38);
  MEMORY[0x24BDAC7A8](v5);
  v28 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = type metadata accessor for SidebarModality();
  v7 = *(_QWORD *)(v29 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v29);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = type metadata accessor for SidebarModalitiesView();
  v10 = *(_QWORD *)(v25 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x24BDAC7A8](v25);
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95C30);
  v30 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23BCA8DD0(a2, (uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for SidebarModalitiesView);
  v15 = v24;
  sub_23BCA8DD0(v24, (uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for SidebarModality);
  v16 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v17 = (v11 + *(unsigned __int8 *)(v7 + 80) + v16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v18 = swift_allocObject();
  sub_23BC9FFF0((uint64_t)v12, v18 + v16, (uint64_t (*)(_QWORD))type metadata accessor for SidebarModalitiesView);
  sub_23BC9FFF0((uint64_t)v9, v18 + v17, (uint64_t (*)(_QWORD))type metadata accessor for SidebarModality);
  v33 = a2;
  v34 = v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A95D40);
  sub_23BCA37E0(&qword_256A95D48, &qword_256A95D40, MEMORY[0x24BDF41A8]);
  sub_23BCD7F78();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A95C68);
  v19 = (uint64_t)v28;
  sub_23BCD7A14();
  v20 = v27;
  sub_23BCA8DD0(v15, v27, (uint64_t (*)(_QWORD))type metadata accessor for SidebarModality);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v7 + 56))(v20, 0, 1, v29);
  sub_23BCA37E0(&qword_256A95C40, &qword_256A95C30, MEMORY[0x24BDF43B0]);
  sub_23BCB5410();
  v21 = v26;
  sub_23BCD7E40();
  sub_23BCADC80(v20, &qword_256A95C38);
  sub_23BCADC80(v19, &qword_256A95D38);
  return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v14, v21);
}

uint64_t sub_23BCB58BC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v8;

  v3 = type metadata accessor for SidebarModalitiesAction();
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A95C00);
  sub_23BCA37E0(&qword_256A95C08, &qword_256A95C00, MEMORY[0x24BE2B5E8]);
  sub_23BCD7A5C();
  sub_23BCA8DD0(a2, (uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for SidebarModality);
  v6 = type metadata accessor for SidebarModality();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 0, 1, v6);
  sub_23BCD80BC();
  swift_release();
  return sub_23BCAC3AC((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for SidebarModalitiesAction);
}

uint64_t sub_23BCB59DC()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A95D50);
  sub_23BCB7254();
  return sub_23BCD7F3C();
}

uint64_t sub_23BCB5A54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  char v9;
  uint64_t v10;

  v5 = *(uint64_t (**)(uint64_t))(a1 + *(int *)(type metadata accessor for SidebarModalitiesView() + 24));
  v6 = type metadata accessor for SidebarModality();
  result = v5(a2 + *(int *)(v6 + 24));
  *(_QWORD *)a3 = result;
  *(_QWORD *)(a3 + 8) = v8;
  *(_BYTE *)(a3 + 16) = v9 & 1;
  *(_QWORD *)(a3 + 24) = v10;
  return result;
}

uint64_t sub_23BCB5AB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
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
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  unsigned int (*v23)(uint64_t, uint64_t, uint64_t);
  uint64_t *v24;
  uint64_t v25;
  uint64_t result;
  uint64_t *v27;
  char v28;
  int v29;
  char *v30;
  __n128 v31;
  __n128 v32;
  __n128 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;

  v39 = a3;
  v40 = a2;
  v4 = sub_23BCD7EA0();
  v35 = *(_QWORD *)(v4 - 8);
  v36 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v37 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for SidebarModality();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(qword_256A95D70);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95C38);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)&v34 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v34 - v20;
  v41 = *(_BYTE *)(a1 + 16);
  sub_23BCBE2A4();
  v38 = sub_23BCD7F24();
  type metadata accessor for SidebarModalitiesView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A95C68);
  sub_23BCD7A08();
  sub_23BCA8DD0(a1, (uint64_t)v19, (uint64_t (*)(_QWORD))type metadata accessor for SidebarModality);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v19, 0, 1, v6);
  v22 = (uint64_t)&v12[*(int *)(v10 + 48)];
  sub_23BCB72D8((uint64_t)v21, (uint64_t)v12);
  sub_23BCB72D8((uint64_t)v19, v22);
  v23 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  if (v23((uint64_t)v12, 1, v6) == 1)
  {
    sub_23BCADC80((uint64_t)v19, &qword_256A95C38);
    sub_23BCADC80((uint64_t)v21, &qword_256A95C38);
    if (v23(v22, 1, v6) == 1)
    {
      sub_23BCADC80((uint64_t)v12, &qword_256A95C38);
      v25 = v38;
      v24 = v39;
LABEL_4:
      result = sub_23BCD7EDC();
      goto LABEL_21;
    }
    v27 = qword_256A95D70;
    goto LABEL_16;
  }
  sub_23BCB72D8((uint64_t)v12, (uint64_t)v16);
  if (v23(v22, 1, v6) == 1)
  {
    v27 = qword_256A95D70;
LABEL_15:
    sub_23BCADC80((uint64_t)v19, &qword_256A95C38);
    sub_23BCADC80((uint64_t)v21, &qword_256A95C38);
    sub_23BCAC3AC((uint64_t)v16, (uint64_t (*)(_QWORD))type metadata accessor for SidebarModality);
LABEL_16:
    v25 = v38;
    v24 = v39;
    sub_23BCADC80((uint64_t)v12, v27);
    goto LABEL_17;
  }
  sub_23BC9FFF0(v22, (uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for SidebarModality);
  if ((*(_QWORD *)v16 != *(_QWORD *)v9 || *((_QWORD *)v16 + 1) != *((_QWORD *)v9 + 1)) && (sub_23BCD85A8() & 1) == 0
    || v16[16] != v9[16])
  {
    sub_23BCAC3AC((uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for SidebarModality);
    v27 = &qword_256A95C38;
    goto LABEL_15;
  }
  v28 = sub_23BCD78F4();
  sub_23BCAC3AC((uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for SidebarModality);
  sub_23BCADC80((uint64_t)v19, &qword_256A95C38);
  sub_23BCADC80((uint64_t)v21, &qword_256A95C38);
  sub_23BCAC3AC((uint64_t)v16, (uint64_t (*)(_QWORD))type metadata accessor for SidebarModality);
  sub_23BCADC80((uint64_t)v12, &qword_256A95C38);
  v25 = v38;
  v24 = v39;
  if ((v28 & 1) != 0)
    goto LABEL_4;
LABEL_17:
  v29 = *(unsigned __int8 *)(a1 + 16);
  v30 = v37;
  (*(void (**)(char *, _QWORD, uint64_t))(v35 + 104))(v37, *MEMORY[0x24BDF3C28], v36);
  if (v29 == 6)
  {
    v31.n128_u64[0] = 0x3FDADADADADADADBLL;
    v32.n128_u64[0] = 0x3FEF7F7F7F7F7F7FLL;
    v33.n128_u64[0] = 0x3FEF1F1F1F1F1F1FLL;
  }
  else
  {
    v31.n128_u64[0] = 0x3FE4D4D4D4D4D4D5;
    v32.n128_u64[0] = 1.0;
    v33.n128_u64[0] = 0;
  }
  result = MEMORY[0x24260F410](v30, v31, v32, v33, 1.0);
LABEL_21:
  *v24 = v25;
  v24[1] = result;
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for SidebarModalitiesView(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int (*v15)(_QWORD *, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(char *, char *, uint64_t);
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  void (*v32)(char *, char *, uint64_t);
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v17 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = v17 + ((v5 + 16) & ~(unint64_t)v5);
  }
  else
  {
    v7 = *a2;
    v8 = a2[1];
    v9 = *((_BYTE *)a2 + 16);
    sub_23BCAC8C8();
    *(_QWORD *)a1 = v7;
    *(_QWORD *)(a1 + 8) = v8;
    *(_BYTE *)(a1 + 16) = v9;
    v10 = *(int *)(a3 + 20);
    v11 = (_QWORD *)(a1 + v10);
    v12 = (uint64_t *)((char *)a2 + v10);
    v13 = type metadata accessor for SidebarModality();
    v14 = *(_QWORD *)(v13 - 8);
    v15 = *(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v14 + 48);
    if (v15(v12, 1, v13))
    {
      v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95C38);
      memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    }
    else
    {
      v40 = v14;
      v18 = v12[1];
      *v11 = *v12;
      v11[1] = v18;
      *((_BYTE *)v11 + 16) = *((_BYTE *)v12 + 16);
      v19 = *(int *)(v13 + 24);
      v38 = (char *)v12 + v19;
      v39 = (char *)v11 + v19;
      v20 = sub_23BCD7900();
      v21 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16);
      v14 = v40;
      swift_bridgeObjectRetain();
      v21(v39, v38, v20);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v40 + 56))(v11, 0, 1, v13);
    }
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95C68);
    *(_QWORD *)((char *)v11 + *(int *)(v22 + 36)) = *(_QWORD *)((char *)v12 + *(int *)(v22 + 36));
    v23 = *(int *)(v22 + 40);
    v24 = (_QWORD *)((char *)v11 + v23);
    v25 = (_QWORD *)((char *)v12 + v23);
    swift_retain();
    if (v15(v25, 1, v13))
    {
      v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95C38);
      memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
    }
    else
    {
      v41 = v14;
      v27 = v25[1];
      *v24 = *v25;
      v24[1] = v27;
      *((_BYTE *)v24 + 16) = *((_BYTE *)v25 + 16);
      v28 = *(int *)(v13 + 24);
      v29 = (char *)v24 + v28;
      v30 = (char *)v25 + v28;
      v31 = sub_23BCD7900();
      v32 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v31 - 8) + 16);
      swift_bridgeObjectRetain();
      v32(v29, v30, v31);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v41 + 56))(v24, 0, 1, v13);
    }
    v33 = *(int *)(a3 + 24);
    v34 = (_QWORD *)(a1 + v33);
    v35 = (uint64_t *)((char *)a2 + v33);
    v36 = v35[1];
    *v34 = *v35;
    v34[1] = v36;
  }
  swift_retain();
  return a1;
}

uint64_t destroy for SidebarModalitiesView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  sub_23BCAC7D0();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = type metadata accessor for SidebarModality();
  v6 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48);
  if (!v6(v4, 1, v5))
  {
    swift_bridgeObjectRelease();
    v7 = v4 + *(int *)(v5 + 24);
    v8 = sub_23BCD7900();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  }
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95C68);
  swift_release();
  v10 = v4 + *(int *)(v9 + 40);
  if (!v6(v10, 1, v5))
  {
    swift_bridgeObjectRelease();
    v11 = v10 + *(int *)(v5 + 24);
    v12 = sub_23BCD7900();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
  }
  return swift_release();
}

uint64_t initializeWithCopy for SidebarModalitiesView(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int (*v14)(_QWORD *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, char *, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  void (*v32)(char *, char *, uint64_t);
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;

  v6 = *a2;
  v7 = a2[1];
  v8 = *((_BYTE *)a2 + 16);
  sub_23BCAC8C8();
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  *(_BYTE *)(a1 + 16) = v8;
  v9 = *(int *)(a3 + 20);
  v10 = (_QWORD *)(a1 + v9);
  v11 = (uint64_t *)((char *)a2 + v9);
  v12 = type metadata accessor for SidebarModality();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v13 + 48);
  if (v14(v11, 1, v12))
  {
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95C38);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
  }
  else
  {
    v40 = v13;
    v16 = v11[1];
    *v10 = *v11;
    v10[1] = v16;
    *((_BYTE *)v10 + 16) = *((_BYTE *)v11 + 16);
    v17 = *(int *)(v12 + 24);
    v38 = (char *)v11 + v17;
    v39 = (char *)v10 + v17;
    v18 = a3;
    v19 = sub_23BCD7900();
    v20 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 16);
    v13 = v40;
    swift_bridgeObjectRetain();
    v21 = v19;
    a3 = v18;
    v20(v39, v38, v21);
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v40 + 56))(v10, 0, 1, v12);
  }
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95C68);
  *(_QWORD *)((char *)v10 + *(int *)(v22 + 36)) = *(_QWORD *)((char *)v11 + *(int *)(v22 + 36));
  v23 = *(int *)(v22 + 40);
  v24 = (_QWORD *)((char *)v10 + v23);
  v25 = (_QWORD *)((char *)v11 + v23);
  swift_retain();
  if (v14(v25, 1, v12))
  {
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95C38);
    memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
  }
  else
  {
    v41 = v13;
    v27 = v25[1];
    *v24 = *v25;
    v24[1] = v27;
    *((_BYTE *)v24 + 16) = *((_BYTE *)v25 + 16);
    v28 = *(int *)(v12 + 24);
    v29 = (char *)v24 + v28;
    v30 = (char *)v25 + v28;
    v31 = sub_23BCD7900();
    v32 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v31 - 8) + 16);
    swift_bridgeObjectRetain();
    v32(v29, v30, v31);
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v41 + 56))(v24, 0, 1, v12);
  }
  v33 = *(int *)(a3 + 24);
  v34 = (_QWORD *)(a1 + v33);
  v35 = (uint64_t *)((char *)a2 + v33);
  v36 = v35[1];
  *v34 = *v35;
  v34[1] = v36;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for SidebarModalitiesView(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t);
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v38;
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

  v6 = *a2;
  v7 = a2[1];
  v8 = *((_BYTE *)a2 + 16);
  sub_23BCAC8C8();
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  *(_BYTE *)(a1 + 16) = v8;
  sub_23BCAC7D0();
  v49 = a3;
  v9 = *(int *)(a3 + 20);
  v10 = a1 + v9;
  v11 = (uint64_t)a2 + v9;
  v12 = type metadata accessor for SidebarModality();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 48);
  v15 = v14(v10, 1, v12);
  v16 = v14(v11, 1, v12);
  if (v15)
  {
    if (!v16)
    {
      *(_QWORD *)v10 = *(_QWORD *)v11;
      *(_QWORD *)(v10 + 8) = *(_QWORD *)(v11 + 8);
      *(_BYTE *)(v10 + 16) = *(_BYTE *)(v11 + 16);
      v17 = *(int *)(v12 + 24);
      v46 = v11 + v17;
      v47 = v10 + v17;
      v48 = v13;
      v18 = sub_23BCD7900();
      v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 16);
      swift_bridgeObjectRetain();
      v20 = v18;
      v13 = v48;
      v19(v47, v46, v20);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v48 + 56))(v10, 0, 1, v12);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v16)
  {
    sub_23BCAC3AC(v10, (uint64_t (*)(_QWORD))type metadata accessor for SidebarModality);
LABEL_6:
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95C38);
    memcpy((void *)v10, (const void *)v11, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    goto LABEL_7;
  }
  *(_QWORD *)v10 = *(_QWORD *)v11;
  *(_QWORD *)(v10 + 8) = *(_QWORD *)(v11 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(v10 + 16) = *(_BYTE *)(v11 + 16);
  v38 = *(int *)(v12 + 24);
  v39 = v10 + v38;
  v40 = v11 + v38;
  v41 = sub_23BCD7900();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 24))(v39, v40, v41);
LABEL_7:
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95C68);
  *(_QWORD *)(v10 + *(int *)(v22 + 36)) = *(_QWORD *)(v11 + *(int *)(v22 + 36));
  swift_retain();
  swift_release();
  v23 = *(int *)(v22 + 40);
  v24 = v10 + v23;
  v25 = v11 + v23;
  LODWORD(v22) = v14(v24, 1, v12);
  v26 = v14(v25, 1, v12);
  if (!(_DWORD)v22)
  {
    if (!v26)
    {
      *(_QWORD *)v24 = *(_QWORD *)v25;
      *(_QWORD *)(v24 + 8) = *(_QWORD *)(v25 + 8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_BYTE *)(v24 + 16) = *(_BYTE *)(v25 + 16);
      v42 = *(int *)(v12 + 24);
      v43 = v24 + v42;
      v44 = v25 + v42;
      v45 = sub_23BCD7900();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v45 - 8) + 24))(v43, v44, v45);
      goto LABEL_13;
    }
    sub_23BCAC3AC(v24, (uint64_t (*)(_QWORD))type metadata accessor for SidebarModality);
    goto LABEL_12;
  }
  if (v26)
  {
LABEL_12:
    v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95C38);
    memcpy((void *)v24, (const void *)v25, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
    goto LABEL_13;
  }
  *(_QWORD *)v24 = *(_QWORD *)v25;
  *(_QWORD *)(v24 + 8) = *(_QWORD *)(v25 + 8);
  *(_BYTE *)(v24 + 16) = *(_BYTE *)(v25 + 16);
  v27 = *(int *)(v12 + 24);
  v28 = v24 + v27;
  v29 = v25 + v27;
  v30 = sub_23BCD7900();
  v31 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 16);
  swift_bridgeObjectRetain();
  v31(v28, v29, v30);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v13 + 56))(v24, 0, 1, v12);
LABEL_13:
  v33 = *(int *)(v49 + 24);
  v34 = (_QWORD *)(a1 + v33);
  v35 = (uint64_t *)((char *)a2 + v33);
  v36 = v35[1];
  *v34 = *v35;
  v34[1] = v36;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for SidebarModalitiesView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int (*v11)(_BYTE *, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  _BYTE *v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE *v23;
  _BYTE *v24;
  uint64_t v25;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v6 = *(int *)(a3 + 20);
  v7 = (_BYTE *)(a1 + v6);
  v8 = (_BYTE *)(a2 + v6);
  v9 = type metadata accessor for SidebarModality();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v10 + 48);
  if (v11(v8, 1, v9))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95C38);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    *(_OWORD *)v7 = *(_OWORD *)v8;
    v7[16] = v8[16];
    v13 = *(int *)(v9 + 24);
    v14 = &v7[v13];
    v15 = &v8[v13];
    v16 = sub_23BCD7900();
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v14, v15, v16);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95C68);
  *(_QWORD *)&v7[*(int *)(v17 + 36)] = *(_QWORD *)&v8[*(int *)(v17 + 36)];
  v18 = *(int *)(v17 + 40);
  v19 = &v7[v18];
  v20 = &v8[v18];
  if (v11(v20, 1, v9))
  {
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95C38);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
  }
  else
  {
    *(_OWORD *)v19 = *(_OWORD *)v20;
    v19[16] = v20[16];
    v22 = *(int *)(v9 + 24);
    v23 = &v19[v22];
    v24 = &v20[v22];
    v25 = sub_23BCD7900();
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v25 - 8) + 32))(v23, v24, v25);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v19, 0, 1, v9);
  }
  *(_OWORD *)(a1 + *(int *)(a3 + 24)) = *(_OWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t assignWithTake for SidebarModalitiesView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  _BYTE *v23;
  int v24;
  uint64_t v25;
  _BYTE *v26;
  _BYTE *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _BYTE *v38;
  _BYTE *v39;
  uint64_t v40;

  v6 = *(_BYTE *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v6;
  sub_23BCAC7D0();
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = type metadata accessor for SidebarModality();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      *(_OWORD *)v8 = *(_OWORD *)v9;
      *(_BYTE *)(v8 + 16) = *(_BYTE *)(v9 + 16);
      v15 = *(int *)(v10 + 24);
      v16 = v8 + v15;
      v17 = v9 + v15;
      v18 = sub_23BCD7900();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v16, v17, v18);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    sub_23BCAC3AC(v8, (uint64_t (*)(_QWORD))type metadata accessor for SidebarModality);
LABEL_6:
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95C38);
    memcpy((void *)v8, (const void *)v9, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    goto LABEL_7;
  }
  v31 = *(_QWORD *)(v9 + 8);
  *(_QWORD *)v8 = *(_QWORD *)v9;
  *(_QWORD *)(v8 + 8) = v31;
  swift_bridgeObjectRelease();
  *(_BYTE *)(v8 + 16) = *(_BYTE *)(v9 + 16);
  v32 = *(int *)(v10 + 24);
  v33 = v8 + v32;
  v34 = v9 + v32;
  v35 = sub_23BCD7900();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 40))(v33, v34, v35);
LABEL_7:
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95C68);
  *(_QWORD *)(v8 + *(int *)(v20 + 36)) = *(_QWORD *)(v9 + *(int *)(v20 + 36));
  swift_release();
  v21 = *(int *)(v20 + 40);
  v22 = (_BYTE *)(v8 + v21);
  v23 = (_BYTE *)(v9 + v21);
  LODWORD(v20) = v12((uint64_t)v22, 1, v10);
  v24 = v12((uint64_t)v23, 1, v10);
  if (!(_DWORD)v20)
  {
    if (!v24)
    {
      v36 = *((_QWORD *)v23 + 1);
      *(_QWORD *)v22 = *(_QWORD *)v23;
      *((_QWORD *)v22 + 1) = v36;
      swift_bridgeObjectRelease();
      v22[16] = v23[16];
      v37 = *(int *)(v10 + 24);
      v38 = &v22[v37];
      v39 = &v23[v37];
      v40 = sub_23BCD7900();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v40 - 8) + 40))(v38, v39, v40);
      goto LABEL_13;
    }
    sub_23BCAC3AC((uint64_t)v22, (uint64_t (*)(_QWORD))type metadata accessor for SidebarModality);
    goto LABEL_12;
  }
  if (v24)
  {
LABEL_12:
    v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95C38);
    memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
    goto LABEL_13;
  }
  *(_OWORD *)v22 = *(_OWORD *)v23;
  v22[16] = v23[16];
  v25 = *(int *)(v10 + 24);
  v26 = &v22[v25];
  v27 = &v23[v25];
  v28 = sub_23BCD7900();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v28 - 8) + 32))(v26, v27, v28);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v22, 0, 1, v10);
LABEL_13:
  *(_OWORD *)(a1 + *(int *)(a3 + 24)) = *(_OWORD *)(a2 + *(int *)(a3 + 24));
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SidebarModalitiesView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23BCB6C30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95C68);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + *(int *)(a3 + 20), a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for SidebarModalitiesView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23BCB6CC0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95C68);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + *(int *)(a4 + 20), a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  return result;
}

void sub_23BCB6D40()
{
  unint64_t v0;

  sub_23BCB6DC0();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_23BCB6DC0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256A95CD8[0])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A95C38);
    sub_23BCB5410();
    v0 = sub_23BCD7A44();
    if (!v1)
      atomic_store(v0, qword_256A95CD8);
  }
}

unint64_t sub_23BCB6E28()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256A95D10;
  if (!qword_256A95D10)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A95D18);
    v2[0] = sub_23BCB5474();
    v2[1] = sub_23BCB54D8();
    result = MEMORY[0x24260FFB0](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256A95D10);
  }
  return result;
}

uint64_t objectdestroy_4Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int (*v5)(uint64_t, uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = type metadata accessor for SidebarModalitiesView();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  sub_23BCAC7D0();
  v3 = v0 + ((v2 + 16) & ~v2) + *(int *)(v1 + 20);
  v4 = type metadata accessor for SidebarModality();
  v5 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48);
  if (!v5(v3, 1, v4))
  {
    swift_bridgeObjectRelease();
    v6 = v3 + *(int *)(v4 + 24);
    v7 = sub_23BCD7900();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  }
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95C68);
  swift_release();
  v9 = v3 + *(int *)(v8 + 40);
  if (!v5(v9, 1, v4))
  {
    swift_bridgeObjectRelease();
    v10 = v9 + *(int *)(v4 + 24);
    v11 = sub_23BCD7900();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
  }
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23BCB6FE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for SidebarModalitiesView() - 8) + 80);
  return sub_23BCB5590(a1, v2 + ((v5 + 16) & ~v5), a2);
}

uint64_t sub_23BCB7030()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unsigned int (*v8)(unint64_t, uint64_t, uint64_t);
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v18;

  v1 = type metadata accessor for SidebarModalitiesView();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v18 = *(_QWORD *)(v2 + 64);
  v4 = type metadata accessor for SidebarModality();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  sub_23BCAC7D0();
  v7 = v0 + v3 + *(int *)(v1 + 20);
  v8 = *(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v5 + 48);
  if (!v8(v7, 1, v4))
  {
    swift_bridgeObjectRelease();
    v9 = v7 + *(int *)(v4 + 24);
    v10 = sub_23BCD7900();
    (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  }
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95C68);
  swift_release();
  v12 = v7 + *(int *)(v11 + 40);
  if (!v8(v12, 1, v4))
  {
    swift_bridgeObjectRelease();
    v13 = v12 + *(int *)(v4 + 24);
    v14 = sub_23BCD7900();
    (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v13, v14);
  }
  swift_release();
  swift_bridgeObjectRelease();
  v15 = v0 + ((v3 + v18 + v6) & ~v6) + *(int *)(v4 + 24);
  v16 = sub_23BCD7900();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(v15, v16);
  return swift_deallocObject();
}

uint64_t sub_23BCB71DC()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(type metadata accessor for SidebarModalitiesView() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = *(_QWORD *)(v1 + 64);
  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for SidebarModality() - 8) + 80);
  return sub_23BCB58BC(v0 + v2, v0 + ((v2 + v3 + v4) & ~v4));
}

uint64_t sub_23BCB723C()
{
  return sub_23BCB59DC();
}

uint64_t sub_23BCB7244@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23BCB5A54(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_23BCB724C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_23BCB5AB8(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

unint64_t sub_23BCB7254()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_256A95D58;
  if (!qword_256A95D58)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A95D50);
    v2 = sub_23BCA37E0(&qword_256A95D60, &qword_256A95D68, MEMORY[0x24BDF0710]);
    v3[0] = MEMORY[0x24BDF40E8];
    v3[1] = v2;
    result = MEMORY[0x24260FFB0](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256A95D58);
  }
  return result;
}

uint64_t sub_23BCB72D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95C38);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23BCB7320()
{
  uint64_t v0;

  v0 = sub_23BCD79CC();
  __swift_allocate_value_buffer(v0, qword_256AA0FA0);
  __swift_project_value_buffer(v0, (uint64_t)qword_256AA0FA0);
  return sub_23BCD79C0();
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

uint64_t TabBarFeatureEnvironment.init(navigateToStack:resolveUpNextCount:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

uint64_t type metadata accessor for TabBarFeatureEnvironment(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for TabBarFeatureEnvironment);
}

Swift::Void __swiftcall TabBarController.didMove(toParent:)(UIViewController_optional *toParent)
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)swift_getObjectType();
  -[UIViewController_optional didMoveToParentViewController:](&v3, sel_didMoveToParentViewController_, toParent);
  sub_23BCB8138();
}

void sub_23BCB742C(char a1)
{
  void *v1;
  void *v2;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  double v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  _QWORD *v15;
  id v16;
  id v17;
  id v18;

  v2 = v1;
  v4 = objc_msgSend(v2, sel_selectedViewController);
  if (v4)
  {
    v18 = v4;
    objc_opt_self();
    v5 = (void *)swift_dynamicCastObjCClass();
    if (v5)
    {
      v6 = objc_msgSend(v5, sel_topViewController);
      if (v6)
      {
        v7 = v6;
        v8 = objc_msgSend(v6, sel_contentScrollViewForEdge_, 4);
        if (v8)
        {
          v17 = v8;
          objc_msgSend(v8, sel_adjustedContentInset);
          objc_msgSend(v17, sel_setContentOffset_animated_, a1 & 1, 0.0, -v9);

          return;
        }
        if (qword_256A94940 != -1)
          swift_once();
        v10 = sub_23BCD79CC();
        __swift_project_value_buffer(v10, (uint64_t)qword_256AA0FA0);
        v11 = v7;
        v12 = sub_23BCD79B4();
        v13 = sub_23BCD835C();
        if (os_log_type_enabled(v12, v13))
        {
          v14 = (uint8_t *)swift_slowAlloc();
          v15 = (_QWORD *)swift_slowAlloc();
          *(_DWORD *)v14 = 138412290;
          v16 = v11;
          sub_23BCD83A4();
          *v15 = v7;

          _os_log_impl(&dword_23BC99000, v12, v13, "[TabBarController] Cannot find scroll view in %@", v14, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256A95ED0);
          swift_arrayDestroy();
          MEMORY[0x242610064](v15, -1, -1);
          MEMORY[0x242610064](v14, -1, -1);

          return;
        }

      }
    }

  }
}

id TabBarController.selectedIndex.setter(uint64_t a1)
{
  void *v1;
  id result;
  objc_super v4;

  v4.receiver = v1;
  v4.super_class = (Class)swift_getObjectType();
  result = objc_msgSendSuper2(&v4, sel_setSelectedIndex_, a1);
  *((_BYTE *)v1 + OBJC_IVAR____TtC14FitnessAppRoot16TabBarController_needsSegmentedControlLayout) = 1;
  return result;
}

id TabBarController.selectedIndex.getter()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_selectedIndex);
}

void (*TabBarController.selectedIndex.modify(objc_super **a1))(objc_super **a1, char a2)
{
  objc_class *v1;
  objc_super *v3;
  uint64_t ObjectType;

  v3 = (objc_super *)malloc(0x48uLL);
  *a1 = v3;
  v3[3].super_class = v1;
  ObjectType = swift_getObjectType();
  v3[4].receiver = (id)ObjectType;
  v3->receiver = v1;
  v3->super_class = (Class)ObjectType;
  v3[3].receiver = -[objc_super selectedIndex](v3, sel_selectedIndex);
  return sub_23BCB783C;
}

void sub_23BCB783C(objc_super **a1, char a2)
{
  objc_super *v2;
  id receiver;
  objc_class *v4;
  Class super_class;
  objc_super *v6;

  v2 = *a1;
  receiver = (*a1)[3].receiver;
  super_class = (*a1)[3].super_class;
  v4 = (objc_class *)(*a1)[4].receiver;
  v6 = *a1;
  if ((a2 & 1) != 0)
  {
    v6[1].receiver = super_class;
    v6[1].super_class = v4;
    objc_msgSendSuper2(v6 + 1, sel_setSelectedIndex_, receiver);
  }
  else
  {
    v6[2].receiver = super_class;
    v6[2].super_class = v4;
    objc_msgSendSuper2(v6 + 2, sel_setSelectedIndex_, receiver);
    *((_BYTE *)super_class + OBJC_IVAR____TtC14FitnessAppRoot16TabBarController_needsSegmentedControlLayout) = 1;
  }
  free(v2);
}

Swift::Void __swiftcall TabBarController.viewDidLoad()()
{
  char *v0;
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = v0;
  v7.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v7, sel_viewDidLoad);
  if (v0[OBJC_IVAR____TtC14FitnessAppRoot16TabBarController_tabBarStyle])
  {
    if (v0[OBJC_IVAR____TtC14FitnessAppRoot16TabBarController_tabBarStyle] == 1)
    {
      v1 = objc_msgSend(v0, sel_tabBar);
      objc_msgSend(v1, sel_setHidden_, 1);

    }
  }
  else
  {
    v2 = objc_msgSend(v0, sel_tabBar);
    objc_msgSend(v2, sel_setHidden_, 1);

    type metadata accessor for FloatingTitleView();
    v3 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
    v4 = OBJC_IVAR____TtC14FitnessAppRoot16TabBarController_floatingTitleView;
    v5 = *(void **)&v0[OBJC_IVAR____TtC14FitnessAppRoot16TabBarController_floatingTitleView];
    *(_QWORD *)&v0[OBJC_IVAR____TtC14FitnessAppRoot16TabBarController_floatingTitleView] = v3;

    v6 = *(_QWORD *)&v0[v4];
    if (v6)
    {
      *(_QWORD *)(v6 + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_delegate + 8) = &off_250CCA690;
      swift_unknownObjectWeakAssign();
    }
    sub_23BCB8138();
  }
}

Swift::Void __swiftcall TabBarController.viewWillLayoutSubviews()()
{
  char *v0;
  char *v1;
  objc_class *ObjectType;
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  id v18;
  void *v19;
  void *v20;
  objc_super v21;
  objc_super v22;
  objc_super v23;

  v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  v3 = ObjectType;
  if (v0[OBJC_IVAR____TtC14FitnessAppRoot16TabBarController_tabBarStyle])
  {
    v23.receiver = v0;
    v23.super_class = ObjectType;
    objc_msgSendSuper2(&v23, sel_viewWillLayoutSubviews);
    return;
  }
  v4 = objc_msgSend(v0, sel_selectedViewController);
  if (!v4)
    goto LABEL_16;
  v5 = v4;
  objc_opt_self();
  v6 = (void *)swift_dynamicCastObjCClass();
  if (!v6 || (v7 = objc_msgSend(v6, sel_topViewController)) == 0)
  {

LABEL_16:
    v22.receiver = v0;
    v22.super_class = v3;
    objc_msgSendSuper2(&v22, sel_viewWillLayoutSubviews);
    return;
  }
  v8 = v7;
  v9 = objc_msgSend(v7, sel_contentScrollViewForEdge_, 1);
  v10 = objc_msgSend(v8, sel_contentScrollViewForEdge_, 4);
  v11 = v10;
  if (v9)
  {
    if (v10)
    {
      sub_23BCA3724(0, (unint64_t *)&unk_256A95E20);
      v12 = v9;
      v13 = v11;
      if ((sub_23BCD838C() & 1) == 0)
      {
        if (qword_256A94940 != -1)
          swift_once();
        v14 = sub_23BCD79CC();
        __swift_project_value_buffer(v14, (uint64_t)qword_256AA0FA0);
        v15 = sub_23BCD79B4();
        v16 = sub_23BCD835C();
        if (os_log_type_enabled(v15, v16))
        {
          v17 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v17 = 0;
          _os_log_impl(&dword_23BC99000, v15, v16, "[TabBarController] Different scroll views found for top and bottom edge. Observing top edge.", v17, 2u);
          MEMORY[0x242610064](v17, -1, -1);
        }

      }
    }
    else
    {
      v18 = v9;
    }
    if ((objc_msgSend(v9, sel__isScrollViewScrollObserver_, v1) & 1) == 0)
    {
      v19 = (void *)MEMORY[0x2426100E8](&v1[OBJC_IVAR____TtC14FitnessAppRoot16TabBarController_currentContentScrollView]);
      if (v19)
      {
        v20 = v19;
        objc_msgSend(v19, sel__removeScrollViewScrollObserver_, v1);

      }
      objc_msgSend(v9, sel__addScrollViewScrollObserver_, v1);
      swift_unknownObjectWeakAssign();
    }

  }
  v21.receiver = v1;
  v21.super_class = v3;
  objc_msgSendSuper2(&v21, sel_viewWillLayoutSubviews);

}

Swift::Void __swiftcall TabBarController.setViewControllers(_:animated:)(Swift::OpaquePointer_optional _, Swift::Bool animated)
{
  char *v2;
  unint64_t rawValue;
  objc_class *ObjectType;
  void *v5;
  char *v6;
  BOOL v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  char *v18;
  uint64_t v19;
  char *v20;
  Swift::Bool is_nil;
  objc_super v22;

  is_nil = _.is_nil;
  rawValue = (unint64_t)_.value._rawValue;
  ObjectType = (objc_class *)swift_getObjectType();
  if (rawValue)
  {
    sub_23BCA3724(0, qword_256A94FD0);
    v5 = (void *)sub_23BCD81AC();
  }
  else
  {
    v5 = 0;
  }
  v22.receiver = v2;
  v22.super_class = ObjectType;
  objc_msgSendSuper2(&v22, sel_setViewControllers_animated_, v5, is_nil);

  v6 = *(char **)&v2[OBJC_IVAR____TtC14FitnessAppRoot16TabBarController_floatingTitleView];
  if (v6)
    v7 = rawValue == 0;
  else
    v7 = 1;
  if (v7)
    return;
  if (!(rawValue >> 62))
  {
    v8 = *(_QWORD *)((rawValue & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    v9 = v6;
    if (v8)
      goto LABEL_10;
LABEL_22:

    swift_bridgeObjectRelease_n();
    return;
  }
LABEL_21:
  swift_bridgeObjectRetain_n();
  v18 = v6;
  v8 = sub_23BCD84B8();
  if (!v8)
    goto LABEL_22;
LABEL_10:
  v20 = v6;
  v10 = 4;
  v19 = OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_floatingTabView;
  while (1)
  {
    if ((rawValue & 0xC000000000000001) != 0)
      v12 = (id)MEMORY[0x24260F968](v10 - 4, rawValue);
    else
      v12 = *(id *)(rawValue + 8 * v10);
    v13 = v12;
    v14 = v10 - 3;
    if (__OFADD__(v10 - 4, 1))
    {
      __break(1u);
      goto LABEL_21;
    }
    v15 = objc_msgSend(v12, sel_tabBarItem);
    if (!v15)
      break;
    v16 = v15;
    v17 = objc_msgSend(v15, sel_title);

    if (v17)
    {
      sub_23BCD8164();

      v11 = *(void **)(*(_QWORD *)&v6[v19] + OBJC_IVAR____TtC14FitnessAppRoot15FloatingTabView_segmentedControl);
      v14 = v10 - 3;
      v17 = (id)sub_23BCD8140();
    }
    else
    {
      v11 = *(void **)(*(_QWORD *)&v6[v19] + OBJC_IVAR____TtC14FitnessAppRoot15FloatingTabView_segmentedControl);
    }
    objc_msgSend(v11, sel_insertSegmentWithTitle_atIndex_animated_, v17, v10 - 4, is_nil, v19);

    sub_23BCCB264();
    swift_bridgeObjectRelease();
    ++v10;
    v6 = v20;
    if (v14 == v8)
      goto LABEL_22;
  }
  __break(1u);
}

Swift::Void __swiftcall TabBarController._setSelectedViewController(_:performUpdates:)(UIViewController_optional *_, Swift::Bool performUpdates)
{
  char *v2;
  objc_class *ObjectType;
  uint64_t v6;
  void *v7;
  char *v8;
  id v9;
  objc_super v10;
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType();
  v11.receiver = v2;
  v11.super_class = ObjectType;
  -[UIViewController_optional _setSelectedViewController:performUpdates:](&v11, sel__setSelectedViewController_performUpdates_, _, performUpdates);
  v6 = *(_QWORD *)&v2[OBJC_IVAR____TtC14FitnessAppRoot16TabBarController_floatingTitleView];
  if (v6)
  {
    v7 = *(void **)(v6 + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_floatingTabView);
    v10.receiver = v2;
    v10.super_class = ObjectType;
    v8 = v7;
    v9 = -[UIViewController_optional selectedIndex](&v10, sel_selectedIndex);
    objc_msgSend(*(id *)&v8[OBJC_IVAR____TtC14FitnessAppRoot15FloatingTabView_segmentedControl], sel_setSelectedSegmentIndex_, v9, v10.receiver, v10.super_class);

  }
  sub_23BCB8138();
}

void sub_23BCB8138()
{
  char *v0;
  char *v1;
  id v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  unint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;

  if (v0[OBJC_IVAR____TtC14FitnessAppRoot16TabBarController_tabBarStyle])
  {
    v1 = (char *)objc_msgSend(v0, sel_parentViewController);
    if (!v1)
      v1 = v0;
    v2 = objc_msgSend(v1, sel_navigationItem);
    v3 = objc_msgSend(v0, sel_selectedViewController);
    if (v3
      && (v4 = v3,
          v5 = objc_msgSend(v3, sel_navigationItem),
          v4,
          v6 = objc_msgSend(v5, sel_title),
          v5,
          v6))
    {
      sub_23BCD8164();

      v18 = (id)sub_23BCD8140();
      swift_bridgeObjectRelease();
      v7 = v18;
    }
    else
    {
      v7 = 0;
    }
    v19 = v7;
    objc_msgSend(v2, sel_setTitle_);

    goto LABEL_9;
  }
  v8 = objc_msgSend(v0, sel_selectedViewController);
  if (!v8)
    return;
  v19 = v8;
  objc_opt_self();
  v9 = (void *)swift_dynamicCastObjCClass();
  if (!v9)
  {
LABEL_9:

    return;
  }
  v10 = objc_msgSend(v9, sel_viewControllers);
  sub_23BCA3724(0, qword_256A94FD0);
  v11 = sub_23BCD81B8();

  if (v11 >> 62)
  {
    swift_bridgeObjectRetain();
    v17 = sub_23BCD84B8();
    swift_bridgeObjectRelease();
    v12 = v19;
    if (v17)
      goto LABEL_14;
LABEL_20:

    swift_bridgeObjectRelease();
    return;
  }
  v12 = v19;
  if (!*(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_20;
LABEL_14:
  if ((v11 & 0xC000000000000001) != 0)
  {
    v13 = (id)MEMORY[0x24260F968](0, v11);
    goto LABEL_17;
  }
  if (*(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v13 = *(id *)(v11 + 32);
LABEL_17:
    v14 = v13;
    swift_bridgeObjectRelease();
    v15 = objc_msgSend(v14, sel_navigationItem);

    v16 = *(id *)&v0[OBJC_IVAR____TtC14FitnessAppRoot16TabBarController_floatingTitleView];
    objc_msgSend(v15, sel_setTitleView_, v16);

    goto LABEL_9;
  }
  __break(1u);
}

id TabBarController.__allocating_init(tabs:)()
{
  objc_class *v0;
  id v1;
  void *v2;
  id v3;

  v1 = objc_allocWithZone(v0);
  sub_23BCA3724(0, &qword_256A95E30);
  v2 = (void *)sub_23BCD81AC();
  swift_bridgeObjectRelease();
  v3 = objc_msgSend(v1, sel_initWithTabs_, v2);

  return v3;
}

void TabBarController.init(tabs:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id TabBarController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_23BCD8140();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void TabBarController.init(nibName:bundle:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id TabBarController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_23BCB86F0(uint64_t a1, unint64_t a2)
{
  sub_23BCB89B4(a2);
}

Swift::Void __swiftcall TabBarController._observeScrollViewDidScroll(_:)(UIScrollView_optional *a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;

  v2 = objc_msgSend(v1, sel_selectedViewController);
  if (v2)
  {
    v4 = v2;
    objc_opt_self();
    v3 = (void *)swift_dynamicCastObjCClass();
    if (v3)

  }
}

uint64_t type metadata accessor for TabBarController()
{
  return objc_opt_self();
}

uint64_t method lookup function for TabBarController()
{
  return swift_lookUpClassMethod();
}

void sub_23BCB8854(uint64_t a1)
{
  void *v1;
  id v2;
  unint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  if (!a1)
    return;
  objc_opt_self();
  v1 = (void *)swift_dynamicCastObjCClass();
  if (!v1)
    return;
  v2 = objc_msgSend(v1, sel_viewControllers);
  sub_23BCA3724(0, qword_256A94FD0);
  v3 = sub_23BCD81B8();

  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    v6 = sub_23BCD84B8();
    swift_bridgeObjectRelease();
    if (v6)
      goto LABEL_5;
LABEL_11:
    swift_bridgeObjectRelease();
    return;
  }
  if (!*(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_11;
LABEL_5:
  if ((v3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x24260F968](0, v3);
    goto LABEL_8;
  }
  if (*(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v4 = *(id *)(v3 + 32);
LABEL_8:
    v5 = v4;
    swift_bridgeObjectRelease();
    v7 = objc_msgSend(v5, sel_navigationItem);

    objc_msgSend(v7, sel_setTitleView_, 0);
    return;
  }
  __break(1u);
}

void sub_23BCB89B4(unint64_t a1)
{
  char *v1;
  SEL *v2;
  SEL *v3;
  objc_class *ObjectType;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  unsigned int v11;
  id v12;
  void *v13;
  uint64_t v14;
  id i;
  void *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  objc_super v25;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = objc_msgSend(v1, sel_selectedViewController);
  if (v6)
  {
    v7 = v6;
    objc_opt_self();
    v8 = (void *)swift_dynamicCastObjCClass();
    if (!v8)
    {
LABEL_5:

      goto LABEL_6;
    }
    v9 = objc_msgSend(v8, sel_topViewController);

    if (v9)
    {
      v7 = objc_msgSend(v9, sel_navigationItem);

      objc_msgSend(v7, sel_setTitleView_, 0);
      goto LABEL_5;
    }
  }
LABEL_6:
  v25.receiver = v1;
  v25.super_class = ObjectType;
  objc_msgSendSuper2(&v25, sel_setSelectedIndex_, a1);
  v1[OBJC_IVAR____TtC14FitnessAppRoot16TabBarController_needsSegmentedControlLayout] = 1;
  v10 = objc_msgSend(v1, sel_delegate);
  if (!v10)
    goto LABEL_18;
  v2 = (SEL *)&unk_250CCD000;
  v3 = (SEL *)&unk_250CCD000;
  v11 = objc_msgSend(v10, sel_respondsToSelector_, sel_tabBarController_didSelectViewController_);
  swift_unknownObjectRelease();
  if (!v11)
    goto LABEL_18;
  v12 = objc_msgSend(v1, sel_viewControllers);
  if (!v12)
    goto LABEL_18;
  v13 = v12;
  sub_23BCA3724(0, qword_256A94FD0);
  v14 = sub_23BCD81B8();

  if ((v14 & 0xC000000000000001) != 0)
    goto LABEL_31;
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10) > a1)
  {
    for (i = *(id *)(v14 + 8 * a1 + 32); ; i = (id)MEMORY[0x24260F968](a1, v14))
    {
      v16 = i;
      swift_bridgeObjectRelease();
      v17 = objc_msgSend(v1, sel_delegate);
      if (v17)
      {
        v18 = v17;
        if ((objc_msgSend(v17, v3[483], v2[482]) & 1) != 0)
          objc_msgSend(v18, v2[482], v1, v16);

        swift_unknownObjectRelease();
      }
      else
      {

      }
LABEL_18:
      v19 = objc_msgSend(v1, sel_viewControllers);
      if (!v19)
        return;
      v14 = (uint64_t)v19;
      sub_23BCA3724(0, qword_256A94FD0);
      v20 = sub_23BCD81B8();

      if ((v20 & 0xC000000000000001) != 0)
        break;
      if ((a1 & 0x8000000000000000) != 0)
      {
        __break(1u);
      }
      else if (*(_QWORD *)((v20 & 0xFFFFFFFFFFFFF8) + 0x10) > a1)
      {
        v21 = *(id *)(v20 + 8 * a1 + 32);
LABEL_23:
        v22 = v21;
        swift_bridgeObjectRelease();
        objc_opt_self();
        v23 = (void *)swift_dynamicCastObjCClass();
        if (v23)
        {
          v24 = objc_msgSend(v23, sel_topViewController);

          if (!v24)
            return;
          v22 = objc_msgSend(v24, sel_navigationItem);

          objc_msgSend(v22, sel_setTitleView_, *(_QWORD *)&v1[OBJC_IVAR____TtC14FitnessAppRoot16TabBarController_floatingTitleView]);
        }

        return;
      }
      __break(1u);
LABEL_31:
      ;
    }
    v21 = (id)MEMORY[0x24260F968](a1, v20);
    goto LABEL_23;
  }
  __break(1u);
}

_QWORD *sub_23BCB8CFC(unint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  CGFloat Width;
  unint64_t v12;
  unint64_t v13;
  CGRect v15;

  if (a1 >> 62)
  {
LABEL_18:
    swift_bridgeObjectRetain();
    v2 = sub_23BCD84B8();
    if (v2)
      goto LABEL_3;
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v2)
    {
LABEL_3:
      v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v4 = 4;
      while (1)
      {
        v5 = v4 - 4;
        if ((a1 & 0xC000000000000001) != 0)
        {
          v6 = (id)MEMORY[0x24260F968](v4 - 4, a1);
          v7 = v4 - 3;
          if (__OFADD__(v5, 1))
            goto LABEL_17;
        }
        else
        {
          v6 = *(id *)(a1 + 8 * v4);
          v7 = v4 - 3;
          if (__OFADD__(v5, 1))
          {
LABEL_17:
            __break(1u);
            goto LABEL_18;
          }
        }
        v8 = v6;
        v9 = objc_msgSend(v8, sel_customView);
        if (v9)
        {
          v10 = v9;
          objc_msgSend(v10, sel_frame);
          Width = CGRectGetWidth(v15);

          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v3 = sub_23BCA9AC8(0, v3[2] + 1, 1, v3);
          v13 = v3[2];
          v12 = v3[3];
          if (v13 >= v12 >> 1)
            v3 = sub_23BCA9AC8((_QWORD *)(v12 > 1), v13 + 1, 1, v3);
          v3[2] = v13 + 1;
          *(CGFloat *)&v3[v13 + 4] = Width;
        }
        else
        {

        }
        ++v4;
        if (v7 == v2)
          goto LABEL_20;
      }
    }
  }
  v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_20:
  swift_bridgeObjectRelease();
  return v3;
}

char *sub_23BCB8EB8(double a1, double a2, double a3, double a4)
{
  char *v4;
  objc_class *ObjectType;
  uint64_t v10;
  id v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  id v18;
  id v19;
  double v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t inited;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  int v56;
  uint64_t v57;
  objc_super v58;

  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)&v4[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  v10 = OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_floatingTabView;
  v11 = objc_allocWithZone((Class)type metadata accessor for FloatingTabView());
  v12 = v4;
  sub_23BCCA970(0, 0.0, 0.0, 0.0, 0.0);
  *(_QWORD *)&v4[v10] = v13;
  *(_QWORD *)&v12[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_leadingConstraint] = 0;
  *(_QWORD *)&v12[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_trailingConstraint] = 0;

  v58.receiver = v12;
  v58.super_class = ObjectType;
  v14 = (char *)objc_msgSendSuper2(&v58, sel_initWithFrame_, a1, a2, a3, a4);
  v15 = OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_floatingTabView;
  v16 = *(char **)&v14[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_floatingTabView];
  *(_QWORD *)&v16[OBJC_IVAR____TtC14FitnessAppRoot15FloatingTabView_delegate + 8] = &off_250CCA6A8;
  swift_unknownObjectWeakAssign();
  v17 = v14;
  objc_msgSend(v16, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v17, sel_addSubview_, v16);
  objc_msgSend(v17, sel_setHideStandardTitle_, 1);
  v18 = objc_msgSend(v16, sel_heightAnchor);
  v19 = objc_msgSend(v18, sel_constraintEqualToConstant_, 36.0);

  type metadata accessor for UILayoutPriority(0);
  sub_23BCB9940();
  sub_23BCD79D8();
  LODWORD(v20) = v56;
  objc_msgSend(v19, sel_setPriority_, v20);
  v21 = objc_msgSend(*(id *)&v14[v15], sel_leadingAnchor);
  v22 = objc_msgSend(v17, sel_leadingAnchor);
  v23 = objc_msgSend(v21, sel_constraintEqualToAnchor_constant_, v22, 20.0);

  v24 = OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_leadingConstraint;
  v25 = *(void **)&v17[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_leadingConstraint];
  *(_QWORD *)&v17[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_leadingConstraint] = v23;

  v26 = objc_msgSend(*(id *)&v14[v15], sel_trailingAnchor);
  v27 = objc_msgSend(v17, sel_trailingAnchor);
  v28 = objc_msgSend(v26, sel_constraintEqualToAnchor_constant_, v27, -20.0);

  v29 = OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_trailingConstraint;
  v30 = *(void **)&v17[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_trailingConstraint];
  *(_QWORD *)&v17[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_trailingConstraint] = v28;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256A95F38);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23BCDB8D0;
  v32 = *(void **)&v17[v24];
  *(_QWORD *)(inited + 32) = v32;
  v33 = *(void **)&v17[v29];
  *(_QWORD *)(inited + 40) = v33;
  v34 = *(void **)&v14[v15];
  v35 = v33;
  v36 = v32;
  v37 = objc_msgSend(v34, sel_centerYAnchor);
  v38 = objc_msgSend(v17, sel_centerYAnchor);
  v39 = objc_msgSend(v37, sel_constraintEqualToAnchor_, v38);

  *(_QWORD *)(inited + 48) = v39;
  v40 = objc_msgSend(*(id *)&v14[v15], sel_heightAnchor);
  v41 = objc_msgSend(v40, sel_constraintGreaterThanOrEqualToConstant_, 36.0);

  *(_QWORD *)(inited + 56) = v41;
  *(_QWORD *)(inited + 64) = v19;
  sub_23BCD81C4();
  v57 = MEMORY[0x24BEE4AF8];
  v42 = *(void **)(inited + 32);
  if (!v42)
  {
    v45 = v19;
    v44 = *(void **)(inited + 40);
    if (!v44)
      goto LABEL_10;
    goto LABEL_7;
  }
  v43 = v42;
  MEMORY[0x24260F6C8](v19);
  if (*(_QWORD *)((v57 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v57 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_23BCD81D0();
  sub_23BCD81E8();
  sub_23BCD81C4();
  v44 = *(void **)(inited + 40);
  if (v44)
  {
LABEL_7:
    v46 = v44;
    MEMORY[0x24260F6C8]();
    if (*(_QWORD *)((v57 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v57 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_23BCD81D0();
    sub_23BCD81E8();
    sub_23BCD81C4();
  }
LABEL_10:
  v47 = *(void **)(inited + 48);
  if (v47)
  {
    v48 = v47;
    MEMORY[0x24260F6C8]();
    if (*(_QWORD *)((v57 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v57 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_23BCD81D0();
    sub_23BCD81E8();
    sub_23BCD81C4();
  }
  v49 = *(void **)(inited + 56);
  if (v49)
  {
    v50 = v49;
    MEMORY[0x24260F6C8]();
    if (*(_QWORD *)((v57 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v57 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_23BCD81D0();
    sub_23BCD81E8();
    sub_23BCD81C4();
  }
  v51 = *(void **)(inited + 64);
  if (v51)
  {
    v52 = v51;
    MEMORY[0x24260F6C8]();
    if (*(_QWORD *)((v57 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v57 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_23BCD81D0();
    sub_23BCD81E8();
    sub_23BCD81C4();
  }
  v53 = (void *)objc_opt_self();
  swift_bridgeObjectRelease();
  sub_23BCA3724(0, &qword_256A96280);
  v54 = (void *)sub_23BCD81AC();
  swift_bridgeObjectRelease();
  objc_msgSend(v53, sel_activateConstraints_, v54);

  return v17;
}

id sub_23BCB95F0()
{
  char *v0;
  id v1;
  double v2;
  double v3;
  void *v4;
  id v5;
  unint64_t v6;
  id v7;
  void *v8;
  id v9;
  unint64_t v10;
  void *v11;
  double v12;
  id result;
  double v14;

  v1 = objc_msgSend(v0, sel_navigationItem);
  v2 = 0.0;
  v3 = 0.0;
  if (v1)
  {
    v4 = v1;
    v5 = objc_msgSend(v1, sel_leftBarButtonItems);

    if (v5)
    {
      sub_23BCA3724(0, &qword_256A95F28);
      v6 = sub_23BCD81B8();

      v3 = sub_23BCB97EC(v6);
      swift_bridgeObjectRelease();
    }
  }
  v7 = objc_msgSend(v0, sel_navigationItem);
  if (v7)
  {
    v8 = v7;
    v9 = objc_msgSend(v7, sel_rightBarButtonItems);

    if (v9)
    {
      sub_23BCA3724(0, &qword_256A95F28);
      v10 = sub_23BCD81B8();

      v2 = sub_23BCB97EC(v10);
      swift_bridgeObjectRelease();
    }
  }
  v11 = *(void **)&v0[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_leadingConstraint];
  if (v11)
  {
    v12 = 0.0;
    if (v3 > 0.0)
      v12 = 10.0;
    objc_msgSend(v11, sel_setConstant_, v3 + 20.0 + v12);
  }
  result = *(id *)&v0[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_trailingConstraint];
  if (result)
  {
    v14 = 0.0;
    if (v2 > 0.0)
      v14 = -10.0;
    return objc_msgSend(result, sel_setConstant_, -20.0 - v2 + v14);
  }
  return result;
}

double sub_23BCB97EC(unint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  double v4;
  double *v5;
  uint64_t v6;
  uint64_t v7;
  double *v8;
  double v9;

  v1 = sub_23BCB8CFC(a1);
  v2 = v1[2];
  if (!v2)
  {
    v4 = 0.0;
    goto LABEL_10;
  }
  if (v2 == 1)
  {
    v3 = 0;
    v4 = 0.0;
LABEL_8:
    v7 = v2 - v3;
    v8 = (double *)&v1[v3 + 4];
    do
    {
      v9 = *v8++;
      v4 = v4 + v9;
      --v7;
    }
    while (v7);
    goto LABEL_10;
  }
  v3 = v2 & 0x7FFFFFFFFFFFFFFELL;
  v5 = (double *)(v1 + 5);
  v4 = 0.0;
  v6 = v2 & 0x7FFFFFFFFFFFFFFELL;
  do
  {
    v4 = v4 + *(v5 - 1) + *v5;
    v5 += 2;
    v6 -= 2;
  }
  while (v6);
  if (v2 != v3)
    goto LABEL_8;
LABEL_10:
  swift_bridgeObjectRelease();
  return v4;
}

id sub_23BCB9894()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for FloatingTitleView()
{
  return objc_opt_self();
}

unint64_t sub_23BCB9940()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256A95F30;
  if (!qword_256A95F30)
  {
    type metadata accessor for UILayoutPriority(255);
    result = MEMORY[0x24260FFB0](MEMORY[0x24BEBCC60], v1);
    atomic_store(result, (unint64_t *)&qword_256A95F30);
  }
  return result;
}

uint64_t sub_23BCB9988(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

BOOL static NetworkConditions.== infix(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_23BCB99BC()
{
  sub_23BCB9EC0();
  return sub_23BCD8614();
}

uint64_t sub_23BCB99E4()
{
  sub_23BCB9EC0();
  return sub_23BCD8620();
}

uint64_t sub_23BCB9A14()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x616C696176616E75;
  if (*v0 != 1)
    v1 = 0x6E776F6E6B6E75;
  if (*v0)
    return v1;
  else
    return 0x6C62616C69617661;
}

uint64_t sub_23BCB9A7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23BCB9FC0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23BCB9AA0()
{
  sub_23BCB9DF4();
  return sub_23BCD8614();
}

uint64_t sub_23BCB9AC8()
{
  sub_23BCB9DF4();
  return sub_23BCD8620();
}

uint64_t sub_23BCB9AF0()
{
  sub_23BCB9E7C();
  return sub_23BCD8614();
}

uint64_t sub_23BCB9B18()
{
  sub_23BCB9E7C();
  return sub_23BCD8620();
}

uint64_t sub_23BCB9B40()
{
  sub_23BCB9E38();
  return sub_23BCD8614();
}

uint64_t sub_23BCB9B68()
{
  sub_23BCB9E38();
  return sub_23BCD8620();
}

uint64_t NetworkConditions.encode(to:)(_QWORD *a1, int a2)
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
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95F40);
  v21 = *(_QWORD *)(v3 - 8);
  v22 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v20 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95F48);
  v18 = *(_QWORD *)(v5 - 8);
  v19 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95F50);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95F58);
  v23 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23BCB9DF4();
  sub_23BCD8608();
  if ((_BYTE)v24)
  {
    if (v24 == 1)
    {
      v26 = 1;
      sub_23BCB9E7C();
      sub_23BCD8554();
      (*(void (**)(char *, uint64_t))(v18 + 8))(v7, v19);
    }
    else
    {
      v27 = 2;
      sub_23BCB9E38();
      v15 = v20;
      sub_23BCD8554();
      (*(void (**)(char *, uint64_t))(v21 + 8))(v15, v22);
    }
  }
  else
  {
    v25 = 0;
    sub_23BCB9EC0();
    sub_23BCD8554();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v14, v12);
}

unint64_t sub_23BCB9DF4()
{
  unint64_t result;

  result = qword_256A95F60;
  if (!qword_256A95F60)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDBCEC, &type metadata for NetworkConditions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A95F60);
  }
  return result;
}

unint64_t sub_23BCB9E38()
{
  unint64_t result;

  result = qword_256A95F68;
  if (!qword_256A95F68)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDBC9C, &type metadata for NetworkConditions.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A95F68);
  }
  return result;
}

unint64_t sub_23BCB9E7C()
{
  unint64_t result;

  result = qword_256A95F70;
  if (!qword_256A95F70)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDBC4C, &type metadata for NetworkConditions.UnavailableCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A95F70);
  }
  return result;
}

unint64_t sub_23BCB9EC0()
{
  unint64_t result;

  result = qword_256A95F78;
  if (!qword_256A95F78)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDBBFC, &type metadata for NetworkConditions.AvailableCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A95F78);
  }
  return result;
}

_QWORD *NetworkConditions.init(from:)(_QWORD *a1)
{
  return sub_23BCBA138(a1);
}

_QWORD *sub_23BCB9F18@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  _QWORD *result;

  result = sub_23BCBA138(a1);
  if (!v2)
    *a2 = (_BYTE)result;
  return result;
}

uint64_t sub_23BCB9F40(_QWORD *a1)
{
  unsigned __int8 *v1;

  return NetworkConditions.encode(to:)(a1, *v1);
}

uint64_t NetworkConditions.hash(into:)()
{
  return sub_23BCD85CC();
}

uint64_t NetworkConditions.hashValue.getter()
{
  sub_23BCD85C0();
  sub_23BCD85CC();
  return sub_23BCD85F0();
}

uint64_t sub_23BCB9FC0(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6C62616C69617661 && a2 == 0xE900000000000065;
  if (v2 || (sub_23BCD85A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x616C696176616E75 && a2 == 0xEB00000000656C62 || (sub_23BCD85A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E776F6E6B6E75 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_23BCD85A8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

_QWORD *sub_23BCBA138(_QWORD *a1)
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

  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95FD0);
  v25 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v29 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95FD8);
  v23 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v28 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95FE0);
  v4 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256A95FE8);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (uint64_t *)((char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23BCB9DF4();
  v11 = (uint64_t)v30;
  sub_23BCD85FC();
  if (v11)
    goto LABEL_7;
  v21 = v4;
  v22 = v8;
  v12 = v29;
  v30 = a1;
  v13 = v10;
  v14 = sub_23BCD853C();
  v15 = v7;
  if (*(_QWORD *)(v14 + 16) != 1)
  {
    v18 = sub_23BCD8458();
    swift_allocError();
    v10 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A94A88);
    *v10 = &type metadata for NetworkConditions;
    sub_23BCD8500();
    sub_23BCD844C();
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
      sub_23BCB9E7C();
      v16 = v28;
      sub_23BCD84F4();
      v17 = v22;
      (*(void (**)(char *, uint64_t))(v23 + 8))(v16, v26);
    }
    else
    {
      v33 = 2;
      sub_23BCB9E38();
      sub_23BCD84F4();
      v17 = v22;
      (*(void (**)(char *, uint64_t))(v25 + 8))(v12, v27);
    }
    swift_bridgeObjectRelease();
    (*(void (**)(_QWORD *, uint64_t))(v17 + 8))(v13, v15);
  }
  else
  {
    v31 = 0;
    sub_23BCB9EC0();
    sub_23BCD84F4();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v6, v24);
    swift_bridgeObjectRelease();
    (*(void (**)(_QWORD *, uint64_t))(v22 + 8))(v13, v7);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  return v10;
}

unint64_t sub_23BCBA514()
{
  unint64_t result;

  result = qword_256A95F80;
  if (!qword_256A95F80)
  {
    result = MEMORY[0x24260FFB0](&protocol conformance descriptor for NetworkConditions, &type metadata for NetworkConditions);
    atomic_store(result, (unint64_t *)&qword_256A95F80);
  }
  return result;
}

ValueMetadata *type metadata accessor for NetworkConditions()
{
  return &type metadata for NetworkConditions;
}

uint64_t _s14FitnessAppRoot17NetworkConditionsOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23BCBA5BC + 4 * byte_23BCDB915[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23BCBA5F0 + 4 * byte_23BCDB910[v4]))();
}

uint64_t sub_23BCBA5F0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BCBA5F8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23BCBA600);
  return result;
}

uint64_t sub_23BCBA60C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23BCBA614);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23BCBA618(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BCBA620(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for NetworkConditions.CodingKeys()
{
  return &type metadata for NetworkConditions.CodingKeys;
}

ValueMetadata *type metadata accessor for NetworkConditions.AvailableCodingKeys()
{
  return &type metadata for NetworkConditions.AvailableCodingKeys;
}

ValueMetadata *type metadata accessor for NetworkConditions.UnavailableCodingKeys()
{
  return &type metadata for NetworkConditions.UnavailableCodingKeys;
}

ValueMetadata *type metadata accessor for NetworkConditions.UnknownCodingKeys()
{
  return &type metadata for NetworkConditions.UnknownCodingKeys;
}

unint64_t sub_23BCBA670()
{
  unint64_t result;

  result = qword_256A95F88;
  if (!qword_256A95F88)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDBBD4, &type metadata for NetworkConditions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A95F88);
  }
  return result;
}

unint64_t sub_23BCBA6B8()
{
  unint64_t result;

  result = qword_256A95F90;
  if (!qword_256A95F90)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDBAF4, &type metadata for NetworkConditions.AvailableCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A95F90);
  }
  return result;
}

unint64_t sub_23BCBA700()
{
  unint64_t result;

  result = qword_256A95F98;
  if (!qword_256A95F98)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDBB1C, &type metadata for NetworkConditions.AvailableCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A95F98);
  }
  return result;
}

unint64_t sub_23BCBA748()
{
  unint64_t result;

  result = qword_256A95FA0;
  if (!qword_256A95FA0)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDBAA4, &type metadata for NetworkConditions.UnavailableCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A95FA0);
  }
  return result;
}

unint64_t sub_23BCBA790()
{
  unint64_t result;

  result = qword_256A95FA8;
  if (!qword_256A95FA8)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDBACC, &type metadata for NetworkConditions.UnavailableCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A95FA8);
  }
  return result;
}

unint64_t sub_23BCBA7D8()
{
  unint64_t result;

  result = qword_256A95FB0;
  if (!qword_256A95FB0)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDBA54, &type metadata for NetworkConditions.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A95FB0);
  }
  return result;
}

unint64_t sub_23BCBA820()
{
  unint64_t result;

  result = qword_256A95FB8;
  if (!qword_256A95FB8)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDBA7C, &type metadata for NetworkConditions.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A95FB8);
  }
  return result;
}

unint64_t sub_23BCBA868()
{
  unint64_t result;

  result = qword_256A95FC0;
  if (!qword_256A95FC0)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDBB44, &type metadata for NetworkConditions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A95FC0);
  }
  return result;
}

unint64_t sub_23BCBA8B0()
{
  unint64_t result;

  result = qword_256A95FC8;
  if (!qword_256A95FC8)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDBB6C, &type metadata for NetworkConditions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A95FC8);
  }
  return result;
}

uint64_t sub_23BCBA904(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  char *v21;
  void (*v22)(char *, _QWORD);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  void (*v33)(char *, char *);
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  char v38[32];
  uint64_t v39;

  v27 = a5;
  v28 = a8;
  v33 = a1;
  v34 = a2;
  v26 = *(_QWORD *)(a5 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v35 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v11 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v12 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v31 = (char *)&v24 - v13;
  v36 = a4;
  MEMORY[0x24BDAC7A8](v12);
  v30 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = swift_getAssociatedTypeWitness();
  v29 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v24 - v16;
  v18 = sub_23BCD82FC();
  if (!v18)
    return sub_23BCD81DC();
  v19 = v18;
  v25 = v15;
  v39 = sub_23BCD8488();
  v32 = sub_23BCD8494();
  sub_23BCD8470();
  v36 = v17;
  result = sub_23BCD82F0();
  if (v19 < 0)
  {
    __break(1u);
  }
  else
  {
    v21 = v31;
    while (1)
    {
      v22 = (void (*)(char *, _QWORD))sub_23BCD8338();
      (*(void (**)(char *))(v11 + 16))(v21);
      v22(v38, 0);
      v23 = v37;
      v33(v21, v35);
      if (v23)
        break;
      v37 = 0;
      (*(void (**)(char *, uint64_t))(v11 + 8))(v21, AssociatedTypeWitness);
      sub_23BCD847C();
      sub_23BCD8308();
      if (!--v19)
      {
        (*(void (**)(char *, uint64_t))(v29 + 8))(v36, v25);
        return v39;
      }
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v21, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v36, v25);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v26 + 32))(v28, v35, v27);
  }
  return result;
}

uint64_t sub_23BCBABE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  v4 = type metadata accessor for TabBarFeature(255, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), a4);
  MEMORY[0x24260FFB0](&protocol conformance descriptor for TabBarFeature<A>, v4);
  v5 = sub_23BCD80C8();
  MEMORY[0x24260FFB0](MEMORY[0x24BE2B5E8], v5);
  return sub_23BCD7A5C();
}

uint64_t TabBarView.init(store:viewBuilder:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;
  uint64_t v19;
  char v20;

  v14 = (_QWORD *)swift_allocObject();
  v14[2] = a5;
  v14[3] = a6;
  v14[4] = a1;
  v14[5] = a2;
  v16 = type metadata accessor for TabBarFeature(255, a5, a6, v15);
  MEMORY[0x24260FFB0](&protocol conformance descriptor for TabBarFeature<A>, v16);
  v17 = sub_23BCD80C8();
  MEMORY[0x24260FFB0](MEMORY[0x24BE2B5E8], v17);
  result = sub_23BCD7A50();
  *(_QWORD *)a7 = result;
  *(_QWORD *)(a7 + 8) = v19;
  *(_BYTE *)(a7 + 16) = v20 & 1;
  *(_QWORD *)(a7 + 24) = a3;
  *(_QWORD *)(a7 + 32) = a4;
  return result;
}

uint64_t sub_23BCBAD3C()
{
  swift_release();
  return swift_deallocObject();
}

id TabBarView.makeCoordinator()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  type metadata accessor for TabBarControllerCoordinator(0, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), a4);
  v8 = sub_23BCBABE0(a1, v5, v6, v7);
  return sub_23BCBADDC(v8);
}

uint64_t type metadata accessor for TabBarControllerCoordinator(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for TabBarControllerCoordinator);
}

id sub_23BCBADDC(uint64_t a1)
{
  objc_class *v1;
  char *v3;
  objc_class *ObjectType;
  objc_super v6;

  v3 = (char *)objc_allocWithZone(v1);
  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)&v3[qword_256A95FF8] = a1;
  v6.receiver = v3;
  v6.super_class = ObjectType;
  return objc_msgSendSuper2(&v6, sel_init);
}

id TabBarView.makeUIViewController(context:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __int128 *v4;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  objc_class *v18;
  _BYTE *v19;
  uint64_t v20;
  id v21;
  _BYTE *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  _BYTE v36[16];
  uint64_t v37;
  uint64_t v38;
  __int128 *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  objc_super v48;
  char v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;

  v6 = v4[1];
  v54 = *v4;
  v55 = v6;
  v56 = *((_QWORD *)v4 + 4);
  v7 = v4[1];
  v51 = *v4;
  v52 = v7;
  v53 = *((_QWORD *)v4 + 4);
  sub_23BCBABE0(a2, a2, a3, a4);
  v9 = *(_QWORD *)(a2 + 24);
  v46 = *(_QWORD *)(a2 + 16);
  v8 = v46;
  v47 = v9;
  swift_getKeyPath();
  sub_23BCD80A4();
  swift_release();
  swift_release();
  sub_23BCBABE0(a2, v10, v11, v12);
  v44 = v46;
  v45 = v9;
  swift_getKeyPath();
  sub_23BCD80A4();
  swift_release();
  swift_release();
  v13 = v49;
  v51 = v54;
  v52 = v55;
  v53 = v56;
  sub_23BCBABE0(a2, v14, v15, v16);
  v42 = v46;
  v43 = v9;
  swift_getKeyPath();
  sub_23BCD80A4();
  swift_release();
  swift_release();
  v17 = v54;
  v18 = (objc_class *)type metadata accessor for TabBarController();
  v19 = objc_allocWithZone(v18);
  *(_QWORD *)&v19[OBJC_IVAR____TtC14FitnessAppRoot16TabBarController_floatingTitleView] = 0;
  v19[OBJC_IVAR____TtC14FitnessAppRoot16TabBarController_needsSegmentedControlLayout] = 0;
  v20 = OBJC_IVAR____TtC14FitnessAppRoot16TabBarController_topConstraint;
  v21 = objc_allocWithZone(MEMORY[0x24BDD1628]);
  v22 = v19;
  *(_QWORD *)&v19[v20] = objc_msgSend(v21, sel_init);
  swift_unknownObjectWeakInit();
  v22[OBJC_IVAR____TtC14FitnessAppRoot16TabBarController_prefersTightPadding] = v13;
  v22[OBJC_IVAR____TtC14FitnessAppRoot16TabBarController_tabBarStyle] = v17;

  v48.receiver = v22;
  v48.super_class = v18;
  v23 = objc_msgSendSuper2(&v48, sel_initWithNibName_bundle_, 0, 0);
  v51 = v54;
  v52 = v55;
  v53 = v56;
  v24 = v23;
  sub_23BCBABE0(a2, v25, v26, v27);
  v40 = v8;
  v41 = v9;
  swift_getKeyPath();
  sub_23BCD80A4();
  swift_release();
  swift_release();
  v50 = v51;
  v37 = v8;
  v38 = v9;
  v39 = &v54;
  v28 = sub_23BCD8200();
  v29 = (char *)sub_23BCBB618();
  v30 = MEMORY[0x24260FFB0](MEMORY[0x24BEE12E0], v28);
  sub_23BCBA904((void (*)(char *, char *))sub_23BCBB5F8, (uint64_t)v36, v28, v29, MEMORY[0x24BEE4078], v30, MEMORY[0x24BEE40A8], v31);
  swift_bridgeObjectRelease();
  v32 = (void *)sub_23BCD81AC();
  swift_bridgeObjectRelease();
  objc_msgSend(v24, sel_setViewControllers_, v32);

  v33 = v24;
  MEMORY[0x24260FFB0](&protocol conformance descriptor for TabBarView<A>, a2);
  sub_23BCD7D50();
  sub_23BCD7D44();
  v34 = (void *)v51;
  objc_msgSend(v33, sel_setDelegate_, (_QWORD)v51);

  return v33;
}

void sub_23BCBB198(uint64_t a1@<X0>, __int128 *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  uint64_t v31;
  id v32;
  void *v33;
  uint64_t v34;
  id v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  uint64_t v57;

  v50 = a5;
  v51 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v52 = (char *)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = sub_23BCD7984();
  v10 = *(_QWORD *)(v53 - 8);
  MEMORY[0x24BDAC7A8](v53);
  v12 = (char *)&v49 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (uint64_t (*)(uint64_t))*((_QWORD *)a2 + 3);
  v57 = a1;
  v14 = (void *)v13(a1);
  v15 = objc_msgSend(v14, sel_tabBarItem);
  if (!v15)
  {
    __break(1u);
    goto LABEL_15;
  }
  v17 = v15;
  v18 = a2[1];
  v54 = *a2;
  v55 = v18;
  v56 = *((_QWORD *)a2 + 4);
  v19 = type metadata accessor for TabBarView(0, a3, a4, v16);
  v23 = sub_23BCBABE0(v19, v20, v21, v22);
  MEMORY[0x24BDAC7A8](v23);
  *(&v49 - 2) = a3;
  *(&v49 - 1) = a4;
  swift_getKeyPath();
  sub_23BCD80A4();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t, uint64_t))(a4 + 72))(v12, a3, a4);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v53);
  v24 = (void *)sub_23BCD8140();
  swift_bridgeObjectRelease();
  objc_msgSend(v17, sel_setTitle_, v24);

  v25 = objc_msgSend(v14, sel_tabBarItem);
  if (!v25)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v26 = v25;
  v27 = v14;
  (*(void (**)(uint64_t, uint64_t))(a4 + 64))(a3, a4);
  v28 = (void *)sub_23BCD8140();
  swift_bridgeObjectRelease();
  v29 = objc_msgSend((id)objc_opt_self(), sel_systemImageNamed_, v28);

  objc_msgSend(v26, sel_setImage_, v29);
  v30 = *(uint64_t (**)(uint64_t, uint64_t))(a4 + 56);
  v31 = v30(a3, a4);
  v32 = objc_msgSend(v27, sel_tabBarItem);
  if (!v32)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v33 = v32;
  v34 = a3;
  v53 = v31;
  v35 = objc_msgSend(v32, sel_title);

  v36 = v52;
  if (v35)
  {
    sub_23BCD8164();
    v38 = v37;

    v39 = v51;
    (*(void (**)(char *, uint64_t, uint64_t))(v51 + 16))(v36, v57, v34);
    if (v38)
      goto LABEL_9;
  }
  else
  {
    v39 = v51;
    (*(void (**)(char *, uint64_t, uint64_t))(v51 + 16))(v52, v57, v34);
  }
  v30(v34, a4);
LABEL_9:
  (*(void (**)(char *, uint64_t))(v39 + 8))(v36, v34);
  v40 = objc_msgSend(v27, sel_tabBarItem);
  if (!v40)
  {
LABEL_17:
    __break(1u);
    return;
  }
  v41 = v40;
  v42 = objc_msgSend(v40, sel_image);

  v43 = objc_allocWithZone(MEMORY[0x24BEBDD58]);
  v44 = (void *)sub_23BCD8140();
  swift_bridgeObjectRelease();
  v45 = (void *)sub_23BCD8140();
  swift_bridgeObjectRelease();
  v46 = objc_msgSend(v43, sel_initWithIdentifier_title_image_, v44, v45, v42);

  objc_msgSend(v27, sel__uip_setTabElement_, v46);
  if (((*(uint64_t (**)(uint64_t, uint64_t))(a4 + 48))(v34, a4) & 1) != 0)
  {
    v47 = objc_msgSend(v27, sel__uip_tabElement);
    if (v47)
    {
      v48 = v47;
      objc_msgSend(v47, sel__setTabBarPlacement_, 1);

    }
  }
  *v50 = v27;
}

void sub_23BCBB5F8(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  sub_23BCBB198(a1, *(__int128 **)(v2 + 32), *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), a2);
}

unint64_t sub_23BCBB618()
{
  unint64_t result;

  result = qword_256A94FD0[0];
  if (!qword_256A94FD0[0])
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, qword_256A94FD0);
  }
  return result;
}

id TabBarView.updateUIViewController(_:context:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23BCBBA38(a1, a3, a3, a4);
}

id sub_23BCBB660(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23BCBBA38(a1, a3, a3, a4);
}

id sub_23BCBB668@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  id result;

  result = TabBarView.makeCoordinator()(a1, a2, a3, a4);
  *a5 = result;
  return result;
}

uint64_t sub_23BCBB68C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x24260FFB0](&protocol conformance descriptor for TabBarView<A>, a3);
  return sub_23BCD7D14();
}

uint64_t sub_23BCBB6E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x24260FFB0](&protocol conformance descriptor for TabBarView<A>, a3);
  return sub_23BCD7CE4();
}

void sub_23BCBB744(uint64_t a1)
{
  MEMORY[0x24260FFB0](&protocol conformance descriptor for TabBarView<A>, a1);
  sub_23BCD7D08();
  __break(1u);
}

Swift::Bool __swiftcall TabBarControllerCoordinator.tabBarController(_:shouldSelect:)(UITabBarController *_, UIViewController *shouldSelect)
{
  Swift::Bool result;

  sub_23BCBBAF8();
  return result;
}

uint64_t sub_23BCBB790(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  char v9;
  char v10;

  v6 = a3;
  v7 = a4;
  v8 = a1;
  sub_23BCBBAF8();
  v10 = v9;

  return v10 & 1;
}

Swift::Void __swiftcall TabBarControllerCoordinator.tabBarController(_:didSelect:)(UITabBarController *_, UIViewController *didSelect)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  NSArray *v10;
  NSArray *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;

  v6 = type metadata accessor for TabBarAction(0, *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v3) + 0x50), *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v3) + 0x58), v2);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (uint64_t *)((char *)&v16 - v8);
  v10 = -[UITabBarController viewControllers](_, sel_viewControllers);
  if (v10)
  {
    v11 = v10;
    sub_23BCBB618();
    v12 = sub_23BCD81B8();

    sub_23BCA212C((uint64_t)didSelect, v12);
    v14 = v13;
    LOBYTE(v11) = v15;
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      *v9 = v14;
      swift_storeEnumTagMultiPayload();
      sub_23BCD80BC();
      (*(void (**)(_QWORD *, uint64_t))(v7 + 8))(v9, v6);
    }
  }
}

void sub_23BCBB934(void *a1, uint64_t a2, void *a3, void *a4)
{
  UITabBarController *v6;
  UIViewController *v7;
  id v8;

  v6 = a3;
  v7 = a4;
  v8 = a1;
  TabBarControllerCoordinator.tabBarController(_:didSelect:)(v6, v7);

}

id TabBarControllerCoordinator.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void TabBarControllerCoordinator.init()()
{
  sub_23BCBBCB0();
}

void sub_23BCBB9D8()
{
  sub_23BCBBCB0();
}

id TabBarControllerCoordinator.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23BCBBA28()
{
  return swift_release();
}

id sub_23BCBBA38(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __int128 *v4;
  char v7;
  id result;
  __int128 v9;
  objc_super v10;
  __int128 v11;
  char v12;
  __int128 v13;

  v7 = *((_BYTE *)v4 + 16);
  v11 = *v4;
  v12 = v7;
  v13 = *(__int128 *)((char *)v4 + 24);
  sub_23BCBABE0(a2, a2, a3, a4);
  v9 = *(_OWORD *)(a2 + 16);
  swift_getKeyPath();
  sub_23BCD80A4();
  swift_release();
  swift_release();
  v10.receiver = a1;
  v10.super_class = (Class)type metadata accessor for TabBarController();
  result = objc_msgSendSuper2(&v10, sel_setSelectedIndex_, (_QWORD)v11, v9);
  *((_BYTE *)a1 + OBJC_IVAR____TtC14FitnessAppRoot16TabBarController_needsSegmentedControlLayout) = 1;
  return result;
}

void sub_23BCBBAF8()
{
  _BYTE *v0;
  _BYTE *v1;
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  unint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;

  type metadata accessor for TabBarController();
  v0 = (_BYTE *)swift_dynamicCastClass();
  if (!v0)
    return;
  v1 = v0;
  if (v0[OBJC_IVAR____TtC14FitnessAppRoot16TabBarController_tabBarStyle])
    return;
  v2 = objc_msgSend(v0, sel_selectedViewController);
  sub_23BCB8854((uint64_t)v2);

  v3 = *(void **)&v1[OBJC_IVAR____TtC14FitnessAppRoot16TabBarController_floatingTitleView];
  objc_opt_self();
  v4 = swift_dynamicCastObjCClass();
  if (!v4)
    return;
  v5 = (void *)v4;
  v6 = v3;
  v7 = objc_msgSend(v5, sel_viewControllers);
  sub_23BCBB618();
  v8 = sub_23BCD81B8();

  if (v8 >> 62)
  {
    swift_bridgeObjectRetain();
    v12 = sub_23BCD84B8();
    swift_bridgeObjectRelease();
    if (v12)
      goto LABEL_7;
LABEL_12:

    swift_bridgeObjectRelease();
    return;
  }
  if (!*(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_12;
LABEL_7:
  if ((v8 & 0xC000000000000001) != 0)
  {
    v9 = (id)MEMORY[0x24260F968](0, v8);
    goto LABEL_10;
  }
  if (*(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v9 = *(id *)(v8 + 32);
LABEL_10:
    v10 = v9;
    swift_bridgeObjectRelease();
    v11 = objc_msgSend(v10, sel_navigationItem);

    objc_msgSend(v11, sel_setTitleView_, v6);
    return;
  }
  __break(1u);
}

void sub_23BCBBCB0()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_23BCBBCDC()
{
  JUMPOUT(0x24260FFB0);
}

uint64_t sub_23BCBBCEC()
{
  sub_23BCAC7D0();
  return swift_release();
}

uint64_t sub_23BCBBD1C(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;

  v4 = *a2;
  v5 = a2[1];
  v6 = *((_BYTE *)a2 + 16);
  sub_23BCAC8C8();
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6;
  v7 = a2[4];
  *(_QWORD *)(a1 + 24) = a2[3];
  *(_QWORD *)(a1 + 32) = v7;
  swift_retain();
  return a1;
}

uint64_t sub_23BCBBD7C(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;

  v4 = *a2;
  v5 = a2[1];
  v6 = *((_BYTE *)a2 + 16);
  sub_23BCAC8C8();
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6;
  sub_23BCAC7D0();
  v7 = a2[4];
  *(_QWORD *)(a1 + 24) = a2[3];
  *(_QWORD *)(a1 + 32) = v7;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_23BCBBDF4(uint64_t a1, uint64_t a2)
{
  char v4;

  v4 = *(_BYTE *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v4;
  sub_23BCAC7D0();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  return a1;
}

uint64_t sub_23BCBBE48(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_23BCBBE90(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t type metadata accessor for TabBarView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for TabBarView);
}

uint64_t sub_23BCBBEE4()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for TabBarControllerCoordinator()
{
  return swift_lookUpClassMethod();
}

uint64_t DynamicContentContainerViewController.TabItem.init(titleLocalizationKey:systemImageName:bundle:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  _QWORD *v17;

  v14 = sub_23BCD8134();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(a7, a1, v14);
  result = type metadata accessor for DynamicContentContainerViewController.TabItem(0, a5, a6, v15);
  v17 = (_QWORD *)(a7 + *(int *)(result + 36));
  *v17 = a2;
  v17[1] = a3;
  *(_QWORD *)(a7 + *(int *)(result + 40)) = a4;
  return result;
}

uint64_t type metadata accessor for DynamicContentContainerViewController.TabItem(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for DynamicContentContainerViewController.TabItem);
}

id sub_23BCBBFD0(uint64_t a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v2 = *(id *)(v1 + *(int *)(a1 + 36) + 8);
  if (v2)
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_23BCD8140();
    swift_bridgeObjectRelease();
    v2 = objc_msgSend((id)objc_opt_self(), sel__systemImageNamed_, v3);

  }
  return v2;
}

uint64_t sub_23BCBC04C()
{
  swift_beginAccess();
  return swift_unknownObjectWeakAssign();
}

uint64_t DynamicContentContainerViewController.currentViewController.getter()
{
  _QWORD *v0;
  char *v1;

  v1 = (char *)v0 + *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v0) + 0x88);
  swift_beginAccess();
  return MEMORY[0x2426100E8](v1);
}

void DynamicContentContainerViewController.currentViewController.setter(void *a1)
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();

}

void (*DynamicContentContainerViewController.currentViewController.modify(_QWORD *a1))(id **a1, char a2)
{
  _QWORD *v1;
  _QWORD *v3;
  uint64_t v4;
  char *v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = v1;
  v4 = *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v1) + 0x88);
  v3[5] = v4;
  v5 = (char *)v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x2426100E8](v5);
  return sub_23BCBC1F0;
}

void sub_23BCBC1F0(id **a1, char a2)
{
  id *v3;
  id v4;

  v3 = *a1;
  v4 = (*a1)[3];
  swift_unknownObjectWeakAssign();
  if ((a2 & 1) != 0)
  {

    swift_endAccess();
  }
  else
  {
    swift_endAccess();

  }
  free(v3);
}

uint64_t DynamicContentContainerViewController.headlessFeatures.getter()
{
  sub_23BCBD84C();
  return swift_bridgeObjectRetain();
}

uint64_t DynamicContentContainerViewController.headlessFeatures.setter(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v3;

  v3 = (_QWORD *)((char *)v1 + *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v1) + 0x90));
  swift_beginAccess();
  *v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*DynamicContentContainerViewController.headlessFeatures.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id DynamicContentContainerViewController.__allocating_init(store:tabItem:contentViewController:offlineContentViewController:)(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  objc_class *v4;
  objc_class *v5;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;

  v5 = v4;
  v10 = objc_allocWithZone(v4);
  v11 = sub_23BCBD8A0(a1, a2, a3, a4);

  type metadata accessor for DynamicContentContainerViewController.TabItem(255, *((_QWORD *)v5 + 10), *((_QWORD *)v5 + 11), v12);
  v13 = sub_23BCD8398();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(a2, v13);
  swift_release();
  return v11;
}

id DynamicContentContainerViewController.init(store:tabItem:contentViewController:offlineContentViewController:)(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  _QWORD *v4;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;

  v8 = *MEMORY[0x24BEE4EA0] & *v4;
  v9 = sub_23BCBD8A0(a1, a2, a3, a4);

  type metadata accessor for DynamicContentContainerViewController.TabItem(255, *(_QWORD *)(v8 + 80), *(_QWORD *)(v8 + 88), v10);
  v11 = sub_23BCD8398();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(a2, v11);
  swift_release();
  return v9;
}

id sub_23BCBC458()
{
  char *v0;
  char *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  id result;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;

  v1 = v0;
  v2 = (uint64_t *)(*MEMORY[0x24BEE4EA0] & *(_QWORD *)v0);
  v3 = sub_23BCD7984();
  MEMORY[0x24BDAC7A8](v3);
  v27 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = sub_23BCD8134();
  v5 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for DynamicContentContainerViewController.TabItem(255, v2[10], v2[11], v8);
  v10 = sub_23BCD8398();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v25 - v13;
  v15 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&v25 - v16;
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, &v1[v2[15]], v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v14, 1, v9) == 1)
    return (id)(*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v17, v14, v9);
  result = objc_msgSend(v1, sel_tabBarItem);
  if (!result)
  {
    __break(1u);
    goto LABEL_8;
  }
  v19 = result;
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v7, v17, v26);
  v20 = *(void **)&v17[*(int *)(v9 + 40)];
  swift_getKeyPath();
  v21 = v20;
  sub_23BCD80A4();
  swift_release();
  sub_23BCD8170();
  v22 = (void *)sub_23BCD8140();
  swift_bridgeObjectRelease();
  objc_msgSend(v19, sel_setTitle_, v22);

  result = objc_msgSend(v1, sel_tabBarItem);
  if (!result)
  {
LABEL_8:
    __break(1u);
    return result;
  }
  v23 = result;
  v24 = sub_23BCBBFD0(v9);
  objc_msgSend(v23, sel_setImage_, v24);

  return (id)(*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v9);
}

void sub_23BCBC728(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x2426100E8](v1);
  if (v2)
  {
    v3 = (void *)v2;
    sub_23BCBC778();

  }
}

id sub_23BCBC778()
{
  _QWORD *v0;
  id result;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;

  result = objc_msgSend(v0, sel_isViewLoaded);
  if ((_DWORD)result)
  {
    sub_23BCBC458();
    v2 = (_QWORD *)MEMORY[0x24BEE4EA0];
    swift_getKeyPath();
    sub_23BCD80A4();
    swift_release();
    if (v5 == 1)
    {
      v3 = *(_QWORD *)((*v2 & *v0) + 0x68);
      v4 = *(_QWORD *)((*v2 & *v0) + 0x70);
    }
    else
    {
      v4 = *(_QWORD *)((*v2 & *v0) + 0x68);
      v3 = *(_QWORD *)((*v2 & *v0) + 0x70);
    }
    return sub_23BCBCA4C(*(void **)((char *)v0 + v4), *(id *)((char *)v0 + v3));
  }
  return result;
}

void sub_23BCBC83C(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  v3 = a3;
  sub_23BCBDB40();
}

Swift::Void __swiftcall DynamicContentContainerViewController.viewDidLoad()()
{
  void *v0;
  objc_super v1;

  v1.receiver = v0;
  v1.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v1, sel_viewDidLoad);
  sub_23BCBC778();
}

void sub_23BCBC898(void *a1)
{
  id v1;

  v1 = a1;
  DynamicContentContainerViewController.viewDidLoad()();

}

Swift::Void __swiftcall DynamicContentContainerViewController.viewWillAppear(_:)(Swift::Bool a1)
{
  void *v1;
  void *v2;
  objc_class *ObjectType;
  objc_super v5;

  v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  v5.receiver = v2;
  v5.super_class = ObjectType;
  objc_msgSendSuper2(&v5, sel_viewWillAppear_, a1);
  sub_23BCD80BC();
  HeadlessFeatureHosting<>.onAppear()((uint64_t)ObjectType, (uint64_t)&protocol witness table for DynamicContentContainerViewController<A, B>, (uint64_t)&protocol witness table for DynamicContentContainerViewController<A, B>);
}

void sub_23BCBC968(void *a1, uint64_t a2, Swift::Bool a3)
{
  id v4;

  v4 = a1;
  DynamicContentContainerViewController.viewWillAppear(_:)(a3);

}

Swift::Void __swiftcall DynamicContentContainerViewController.viewDidDisappear(_:)(Swift::Bool a1)
{
  void *v1;
  objc_class *ObjectType;
  objc_super v4;

  ObjectType = (objc_class *)swift_getObjectType();
  HeadlessFeatureHosting<>.onDisappear()((uint64_t)ObjectType, (uint64_t)&protocol witness table for DynamicContentContainerViewController<A, B>, (uint64_t)&protocol witness table for DynamicContentContainerViewController<A, B>);
  v4.receiver = v1;
  v4.super_class = ObjectType;
  objc_msgSendSuper2(&v4, sel_viewDidDisappear_, a1);
}

void sub_23BCBCA0C(void *a1, uint64_t a2, Swift::Bool a3)
{
  id v4;

  v4 = a1;
  DynamicContentContainerViewController.viewDidDisappear(_:)(a3);

}

id sub_23BCBCA4C(void *a1, id a2)
{
  void *v2;
  void *v3;
  id result;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  void *v33;

  v3 = v2;
  objc_msgSend(a2, sel_willMoveToParentViewController_, 0);
  result = objc_msgSend(a2, sel_view);
  if (!result)
  {
    __break(1u);
    goto LABEL_15;
  }
  v7 = result;
  objc_msgSend(result, sel_removeFromSuperview);

  objc_msgSend(a2, sel_removeFromParentViewController);
  objc_msgSend(v3, sel_addChildViewController_, a1);
  result = objc_msgSend(v3, sel_view);
  if (!result)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v8 = result;
  result = objc_msgSend(a1, sel_view);
  if (!result)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v9 = result;
  objc_msgSend(v8, sel_addSubview_, result);

  result = objc_msgSend(a1, sel_view);
  if (!result)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v10 = result;
  objc_msgSend(result, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256A94FC0);
  v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_23BCDA2E0;
  result = objc_msgSend(a1, sel_view);
  if (!result)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v12 = result;
  v13 = objc_msgSend(result, sel_topAnchor);

  result = objc_msgSend(v3, sel_view);
  if (!result)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v14 = result;
  v15 = objc_msgSend(result, sel_topAnchor);

  v16 = objc_msgSend(v13, sel_constraintEqualToAnchor_, v15);
  *(_QWORD *)(v11 + 32) = v16;
  result = objc_msgSend(a1, sel_view);
  if (!result)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v17 = result;
  v18 = objc_msgSend(result, sel_bottomAnchor);

  result = objc_msgSend(v3, sel_view);
  if (!result)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v19 = result;
  v20 = objc_msgSend(result, sel_bottomAnchor);

  v21 = objc_msgSend(v18, sel_constraintEqualToAnchor_, v20);
  *(_QWORD *)(v11 + 40) = v21;
  result = objc_msgSend(a1, sel_view);
  if (!result)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v22 = result;
  v23 = objc_msgSend(result, sel_leadingAnchor);

  result = objc_msgSend(v3, sel_view);
  if (!result)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v24 = result;
  v25 = objc_msgSend(result, sel_leadingAnchor);

  v26 = objc_msgSend(v23, sel_constraintEqualToAnchor_, v25);
  *(_QWORD *)(v11 + 48) = v26;
  result = objc_msgSend(a1, sel_view);
  if (!result)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v27 = result;
  v28 = objc_msgSend(result, sel_trailingAnchor);

  result = objc_msgSend(v3, sel_view);
  if (result)
  {
    v29 = result;
    v30 = (void *)objc_opt_self();
    v31 = objc_msgSend(v29, sel_trailingAnchor);

    v32 = objc_msgSend(v28, sel_constraintEqualToAnchor_, v31);
    *(_QWORD *)(v11 + 56) = v32;
    sub_23BCD81C4();
    sub_23BCA3724(0, &qword_256A96280);
    v33 = (void *)sub_23BCD81AC();
    swift_bridgeObjectRelease();
    objc_msgSend(v30, sel_activateConstraints_, v33);

    objc_msgSend(a1, sel_didMoveToParentViewController_, v3);
    swift_beginAccess();
    return (id)swift_unknownObjectWeakAssign();
  }
LABEL_25:
  __break(1u);
  return result;
}

void __swiftcall DynamicContentContainerViewController.contentScrollView(for:)(UIScrollView_optional *__return_ptr retstr, NSDirectionalRectEdge a2)
{
  _QWORD *v2;
  objc_class *ObjectType;
  char *v5;
  void *v6;
  void *v7;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  v5 = (char *)v2 + *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v2) + 0x88);
  swift_beginAccess();
  v6 = (void *)MEMORY[0x2426100E8](v5);
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, sel_contentScrollViewForEdge_, a2);

  }
  else
  {
    v8.receiver = v2;
    v8.super_class = ObjectType;
    -[UIScrollView_optional contentScrollViewForEdge:](&v8, sel_contentScrollViewForEdge_, a2);
  }
}

id sub_23BCBCFB0(void *a1, uint64_t a2, NSDirectionalRectEdge a3)
{
  id v4;
  UIScrollView_optional *v5;
  void *v6;
  void *v7;

  v4 = a1;
  DynamicContentContainerViewController.contentScrollView(for:)(v5, a3);
  v7 = v6;

  return v7;
}

id sub_23BCBCFE8(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  v2 = DynamicContentContainerViewController.supportedInterfaceOrientations.getter();

  return v2;
}

id DynamicContentContainerViewController.supportedInterfaceOrientations.getter()
{
  _QWORD *v0;
  objc_class *ObjectType;
  char *v2;
  void *v3;
  void *v4;
  id v5;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v2 = (char *)v0 + *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v0) + 0x88);
  swift_beginAccess();
  v3 = (void *)MEMORY[0x2426100E8](v2);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v3, sel_supportedInterfaceOrientations);

  }
  else
  {
    v7.receiver = v0;
    v7.super_class = ObjectType;
    return objc_msgSendSuper2(&v7, sel_supportedInterfaceOrientations);
  }
  return v5;
}

id sub_23BCBD0C0(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = a1;
  v2 = DynamicContentContainerViewController.keyCommands.getter();

  if (v2)
  {
    sub_23BCA3724(0, qword_256A96160);
    v3 = (void *)sub_23BCD81AC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

uint64_t DynamicContentContainerViewController.keyCommands.getter()
{
  _QWORD *v0;
  objc_class *ObjectType;
  char *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  v2 = (char *)v0 + *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v0) + 0x88);
  swift_beginAccess();
  v3 = (void *)MEMORY[0x2426100E8](v2);
  if (!v3)
  {
    v10.receiver = v0;
    v10.super_class = ObjectType;
    v8 = objc_msgSendSuper2(&v10, sel_keyCommands);
    if (v8)
    {
      v4 = v8;
      sub_23BCA3724(0, qword_256A96160);
      v7 = sub_23BCD81B8();
      goto LABEL_6;
    }
    return 0;
  }
  v4 = v3;
  v5 = objc_msgSend(v3, sel_keyCommands);
  if (!v5)
  {

    return 0;
  }
  v6 = v5;
  sub_23BCA3724(0, qword_256A96160);
  v7 = sub_23BCD81B8();

LABEL_6:
  return v7;
}

id sub_23BCBD24C(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  DynamicContentContainerViewController.preferredFocusEnvironments.getter();

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256A96270);
  v2 = (void *)sub_23BCD81AC();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t DynamicContentContainerViewController.preferredFocusEnvironments.getter()
{
  _QWORD *v0;
  uint64_t inited;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  __swift_instantiateConcreteTypeFromMangledName(qword_256A951F0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23BCDA510;
  v2 = (char *)v0 + *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v0) + 0x88);
  swift_beginAccess();
  *(_QWORD *)(inited + 32) = MEMORY[0x2426100E8](v2);
  sub_23BCD81C4();
  v3 = MEMORY[0x24BEE4AF8];
  v6 = MEMORY[0x24BEE4AF8];
  if (*(_QWORD *)(inited + 32))
  {
    v4 = swift_unknownObjectRetain();
    MEMORY[0x24260F6C8](v4);
    if (*(_QWORD *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_23BCD81D0();
    sub_23BCD81E8();
    sub_23BCD81C4();
    v3 = v6;
  }
  swift_bridgeObjectRelease();
  return v3;
}

id sub_23BCBD3B4(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  v2 = DynamicContentContainerViewController.childForStatusBarStyle.getter();

  return v2;
}

id DynamicContentContainerViewController.childForStatusBarStyle.getter()
{
  return sub_23BCBD540((SEL *)&selRef_childViewControllerForStatusBarStyle);
}

id sub_23BCBD3F0(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  v2 = DynamicContentContainerViewController.childForStatusBarHidden.getter();

  return v2;
}

id DynamicContentContainerViewController.childForStatusBarHidden.getter()
{
  return sub_23BCBD540((SEL *)&selRef_childViewControllerForStatusBarHidden);
}

uint64_t sub_23BCBD42C(void *a1)
{
  id v1;
  unsigned __int8 v2;

  v1 = a1;
  v2 = DynamicContentContainerViewController.prefersHomeIndicatorAutoHidden.getter();

  return v2 & 1;
}

id DynamicContentContainerViewController.prefersHomeIndicatorAutoHidden.getter()
{
  _QWORD *v0;
  objc_class *ObjectType;
  char *v2;
  void *v3;
  void *v4;
  id v5;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v2 = (char *)v0 + *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v0) + 0x88);
  swift_beginAccess();
  v3 = (void *)MEMORY[0x2426100E8](v2);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v3, sel_prefersHomeIndicatorAutoHidden);

  }
  else
  {
    v7.receiver = v0;
    v7.super_class = ObjectType;
    return objc_msgSendSuper2(&v7, sel_prefersHomeIndicatorAutoHidden);
  }
  return v5;
}

id sub_23BCBD504(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  v2 = DynamicContentContainerViewController.childForHomeIndicatorAutoHidden.getter();

  return v2;
}

id DynamicContentContainerViewController.childForHomeIndicatorAutoHidden.getter()
{
  return sub_23BCBD540((SEL *)&selRef_childViewControllerForHomeIndicatorAutoHidden);
}

id sub_23BCBD540(SEL *a1)
{
  _QWORD *v1;
  objc_class *ObjectType;
  char *v4;
  id result;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (char *)v1 + *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v1) + 0x88);
  swift_beginAccess();
  result = (id)MEMORY[0x2426100E8](v4);
  if (!result)
  {
    v6.receiver = v1;
    v6.super_class = ObjectType;
    return objc_msgSendSuper2(&v6, *a1);
  }
  return result;
}

id DynamicContentContainerViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_23BCD8140();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void DynamicContentContainerViewController.init(nibName:bundle:)()
{
  sub_23BCBDBF8();
}

void sub_23BCBD65C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v4;

  v4 = a4;
  sub_23BCBDBF8();
}

id DynamicContentContainerViewController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23BCBD6CC(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v3 = *MEMORY[0x24BEE4EA0] & *a1;
  swift_release();

  v4 = (char *)a1 + *(_QWORD *)((*v2 & *a1) + 0x78);
  type metadata accessor for DynamicContentContainerViewController.TabItem(255, *(_QWORD *)(v3 + 80), *(_QWORD *)(v3 + 88), v5);
  v6 = sub_23BCD8398();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v4, v6);
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23BCBD7C4()
{
  sub_23BCBD84C();
  return swift_bridgeObjectRetain();
}

void (*sub_23BCBD7DC(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = DynamicContentContainerViewController.headlessFeatures.modify();
  return sub_23BCBD820;
}

void sub_23BCBD820(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t sub_23BCBD84C()
{
  _QWORD *v0;
  char *v1;

  v1 = (char *)v0 + *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v0) + 0x90);
  swift_beginAccess();
  return *(_QWORD *)v1;
}

id sub_23BCBD8A0(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  _QWORD *v4;
  _QWORD *v5;
  objc_class *ObjectType;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  objc_super v26;

  v5 = v4;
  ObjectType = (objc_class *)swift_getObjectType();
  v11 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v12 = (_QWORD *)(*MEMORY[0x24BEE4EA0] & *v5);
  v13 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)((char *)v5 + v12[16]) = MEMORY[0x24BEE4AF8];
  swift_unknownObjectWeakInit();
  *(_QWORD *)((char *)v5 + *(_QWORD *)((*v11 & *v5) + 0x90)) = v13;
  *(_QWORD *)((char *)v5 + *(_QWORD *)((*v11 & *v5) + 0x60)) = a1;
  v14 = (char *)v5 + *(_QWORD *)((*v11 & *v5) + 0x78);
  v15 = v12[10];
  v16 = v12[11];
  type metadata accessor for DynamicContentContainerViewController.TabItem(255, v15, v16, v17);
  v18 = sub_23BCD8398();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v14, a2, v18);
  *(_QWORD *)((char *)v5 + *(_QWORD *)((*v11 & *v5) + 0x68)) = a3;
  *(_QWORD *)((char *)v5 + *(_QWORD *)((*v11 & *v5) + 0x70)) = a4;
  v26.receiver = v5;
  v26.super_class = ObjectType;
  swift_retain();
  v19 = a3;
  v20 = a4;
  v21 = objc_msgSendSuper2(&v26, sel_initWithNibName_bundle_, 0, 0);
  sub_23BCBC458();
  sub_23BCD80B0();
  v22 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v23 = (_QWORD *)swift_allocObject();
  v23[2] = v15;
  v23[3] = v16;
  v23[4] = v22;
  v24 = swift_allocObject();
  *(_QWORD *)(v24 + 16) = sub_23BCBE228;
  *(_QWORD *)(v24 + 24) = v23;
  sub_23BCD79F0();
  sub_23BCD79FC();
  swift_release();
  swift_release();
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256A94FB0);
  sub_23BCBE258();
  sub_23BCD79E4();
  swift_endAccess();
  swift_release();

  return v21;
}

void sub_23BCBDB40()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;

  v1 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v2 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)((char *)v0 + *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v0) + 0x80)) = MEMORY[0x24BEE4AF8];
  swift_unknownObjectWeakInit();
  *(_QWORD *)((char *)v0 + *(_QWORD *)((*v1 & *v0) + 0x90)) = v2;

  sub_23BCD84AC();
  __break(1u);
}

void sub_23BCBDBF8()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_23BCBDC24@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1 + *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *(_QWORD *)*a1) + 0x88);
  swift_beginAccess();
  result = MEMORY[0x2426100E8](v3);
  *a2 = result;
  return result;
}

uint64_t sub_23BCBDC8C()
{
  return 16;
}

__n128 sub_23BCBDC98(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_23BCBDCA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  unint64_t v5;

  type metadata accessor for DynamicContentContainerViewController.TabItem(255, *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), a4);
  result = sub_23BCD8398();
  if (v5 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for DynamicContentContainerViewController(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for DynamicContentContainerViewController);
}

uint64_t method lookup function for DynamicContentContainerViewController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DynamicContentContainerViewController.__allocating_init(store:tabItem:contentViewController:offlineContentViewController:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t sub_23BCBDD74()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23BCD8134();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_23BCBDDF4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23BCD8134();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 36);
    v9 = *(int *)(a3 + 40);
    v10 = (uint64_t *)((char *)a1 + v8);
    v11 = (uint64_t *)((char *)a2 + v8);
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
    v13 = *(void **)((char *)a2 + v9);
    *(uint64_t *)((char *)a1 + v9) = (uint64_t)v13;
    swift_bridgeObjectRetain();
    v14 = v13;
  }
  return a1;
}

void sub_23BCBDE94(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23BCD8134();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  swift_bridgeObjectRelease();

}

uint64_t sub_23BCBDEE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v6 = sub_23BCD8134();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 36);
  v8 = *(int *)(a3 + 40);
  v9 = (_QWORD *)(a1 + v7);
  v10 = (_QWORD *)(a2 + v7);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  v12 = *(void **)(a2 + v8);
  *(_QWORD *)(a1 + v8) = v12;
  swift_bridgeObjectRetain();
  v13 = v12;
  return a1;
}

uint64_t sub_23BCBDF5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v6 = sub_23BCD8134();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 36);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = *(int *)(a3 + 40);
  v11 = *(void **)(a2 + v10);
  v12 = *(void **)(a1 + v10);
  *(_QWORD *)(a1 + v10) = v11;
  v13 = v11;

  return a1;
}

uint64_t sub_23BCBDFF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_23BCD8134();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 40);
  *(_OWORD *)(a1 + *(int *)(a3 + 36)) = *(_OWORD *)(a2 + *(int *)(a3 + 36));
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  return a1;
}

uint64_t sub_23BCBE054(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v6 = sub_23BCD8134();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 36);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  v12 = *(int *)(a3 + 40);
  v13 = *(void **)(a1 + v12);
  *(_QWORD *)(a1 + v12) = *(_QWORD *)(a2 + v12);

  return a1;
}

uint64_t sub_23BCBE0D4()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23BCBE0E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_23BCD8134();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 40));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_23BCBE15C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23BCBE168(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_23BCD8134();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 40)) = (a2 - 1);
  return result;
}

uint64_t sub_23BCBE1E0()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_23BCBE204()
{
  swift_release();
  return swift_deallocObject();
}

void sub_23BCBE228()
{
  uint64_t v0;

  sub_23BCBC728(*(_QWORD *)(v0 + 32));
}

uint64_t sub_23BCBE234()
{
  swift_release();
  return swift_deallocObject();
}

unint64_t sub_23BCBE258()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256A95180;
  if (!qword_256A95180)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_256A94FB0);
    result = MEMORY[0x24260FFB0](MEMORY[0x24BEE12E8], v1);
    atomic_store(result, (unint64_t *)&qword_256A95180);
  }
  return result;
}

uint64_t sub_23BCBE2A4()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23BCBE2E0 + 4 * byte_23BCDC028[*v0]))(0x632E657275676966, 0xEF6E776F646C6F6FLL);
}

unint64_t sub_23BCBE2E0()
{
  return 0xD000000000000014;
}

uint64_t sub_23BCBE3F8()
{
  return 0x792E657275676966;
}

uint64_t sub_23BCBE418()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for LocalizableBundle()
{
  return objc_opt_self();
}

uint64_t SidebarModality.identifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

void SidebarModality.kind.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 16);
}

uint64_t SidebarModality.name.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for SidebarModality() + 24);
  v4 = sub_23BCD7900();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t type metadata accessor for SidebarModality()
{
  uint64_t result;

  result = qword_256A963C0;
  if (!qword_256A963C0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t SidebarModality.init(identifier:kind:name:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  char v7;
  uint64_t v8;
  uint64_t v9;

  v7 = *a3;
  *(_QWORD *)a5 = a1;
  *(_QWORD *)(a5 + 8) = a2;
  *(_BYTE *)(a5 + 16) = v7;
  v8 = a5 + *(int *)(type metadata accessor for SidebarModality() + 24);
  v9 = sub_23BCD7900();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8, a4, v9);
}

uint64_t sub_23BCBE55C()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 1684957547;
  if (*v0 != 1)
    v1 = 1701667182;
  if (*v0)
    return v1;
  else
    return 0x696669746E656469;
}

uint64_t sub_23BCBE5AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23BCBF5A4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23BCBE5D0()
{
  sub_23BCBE7B4();
  return sub_23BCD8614();
}

uint64_t sub_23BCBE5F8()
{
  sub_23BCBE7B4();
  return sub_23BCD8620();
}

uint64_t SidebarModality.encode(to:)(_QWORD *a1)
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
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A96320);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23BCBE7B4();
  sub_23BCD8608();
  v10[15] = 0;
  sub_23BCD8560();
  if (!v2)
  {
    v10[14] = *(_BYTE *)(v3 + 16);
    v10[13] = 1;
    sub_23BCBE7F8();
    sub_23BCD8584();
    type metadata accessor for SidebarModality();
    v10[12] = 2;
    sub_23BCD7900();
    sub_23BC9B4D8(&qword_256A96338, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC5A8], MEMORY[0x24BDCC5B8]);
    sub_23BCD8584();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_23BCBE7B4()
{
  unint64_t result;

  result = qword_256A96328;
  if (!qword_256A96328)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDC23C, &type metadata for SidebarModality.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A96328);
  }
  return result;
}

unint64_t sub_23BCBE7F8()
{
  unint64_t result;

  result = qword_256A96330;
  if (!qword_256A96330)
  {
    result = MEMORY[0x24260FFB0](&protocol conformance descriptor for SidebarModalityKind, &type metadata for SidebarModalityKind);
    atomic_store(result, (unint64_t *)&qword_256A96330);
  }
  return result;
}

uint64_t SidebarModality.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char v24;
  char v25;
  char v26;
  char v27;

  v19 = a2;
  v20 = sub_23BCD7900();
  v18 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A96340);
  v5 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for SidebarModality();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23BCBE7B4();
  v22 = v7;
  v11 = v23;
  sub_23BCD85FC();
  if (v11)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v23 = v8;
  v12 = v5;
  v14 = v20;
  v13 = v21;
  v27 = 0;
  *(_QWORD *)v10 = sub_23BCD850C();
  *((_QWORD *)v10 + 1) = v15;
  v25 = 1;
  sub_23BCBEAEC();
  sub_23BCD8530();
  v10[16] = v26;
  v24 = 2;
  sub_23BC9B4D8(&qword_256A96350, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC5A8], MEMORY[0x24BDCC5D0]);
  v16 = v22;
  sub_23BCD8530();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v16, v13);
  (*(void (**)(char *, char *, uint64_t))(v18 + 32))(&v10[*(int *)(v23 + 24)], v4, v14);
  sub_23BCBEB30((uint64_t)v10, v19);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_23BCB37F0((uint64_t)v10);
}

unint64_t sub_23BCBEAEC()
{
  unint64_t result;

  result = qword_256A96348;
  if (!qword_256A96348)
  {
    result = MEMORY[0x24260FFB0](&protocol conformance descriptor for SidebarModalityKind, &type metadata for SidebarModalityKind);
    atomic_store(result, (unint64_t *)&qword_256A96348);
  }
  return result;
}

uint64_t sub_23BCBEB30(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SidebarModality();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23BCBEB74@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return SidebarModality.init(from:)(a1, a2);
}

uint64_t sub_23BCBEB88(_QWORD *a1)
{
  return SidebarModality.encode(to:)(a1);
}

uint64_t SidebarModality.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_23BCD817C();
  swift_bridgeObjectRelease();
  sub_23BCD85CC();
  type metadata accessor for SidebarModality();
  sub_23BCD7900();
  sub_23BC9B4D8(&qword_256A96358, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC5A8], MEMORY[0x24BDCC5C0]);
  return sub_23BCD8110();
}

uint64_t SidebarModality.hashValue.getter()
{
  sub_23BCD85C0();
  swift_bridgeObjectRetain();
  sub_23BCD817C();
  swift_bridgeObjectRelease();
  sub_23BCD85CC();
  type metadata accessor for SidebarModality();
  sub_23BCD7900();
  sub_23BC9B4D8(&qword_256A96358, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC5A8], MEMORY[0x24BDCC5C0]);
  sub_23BCD8110();
  return sub_23BCD85F0();
}

uint64_t sub_23BCBED04()
{
  sub_23BCD85C0();
  swift_bridgeObjectRetain();
  sub_23BCD817C();
  swift_bridgeObjectRelease();
  sub_23BCD85CC();
  sub_23BCD7900();
  sub_23BC9B4D8(&qword_256A96358, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC5A8], MEMORY[0x24BDCC5C0]);
  sub_23BCD8110();
  return sub_23BCD85F0();
}

uint64_t sub_23BCBEDBC()
{
  swift_bridgeObjectRetain();
  sub_23BCD817C();
  swift_bridgeObjectRelease();
  sub_23BCD85CC();
  sub_23BCD7900();
  sub_23BC9B4D8(&qword_256A96358, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC5A8], MEMORY[0x24BDCC5C0]);
  return sub_23BCD8110();
}

uint64_t sub_23BCBEE60()
{
  sub_23BCD85C0();
  swift_bridgeObjectRetain();
  sub_23BCD817C();
  swift_bridgeObjectRelease();
  sub_23BCD85CC();
  sub_23BCD7900();
  sub_23BC9B4D8(&qword_256A96358, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC5A8], MEMORY[0x24BDCC5C0]);
  sub_23BCD8110();
  return sub_23BCD85F0();
}

uint64_t _s14FitnessAppRoot15SidebarModalityV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  BOOL v4;

  v4 = *(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8);
  if (!v4 && (sub_23BCD85A8() & 1) == 0 || *(unsigned __int8 *)(a1 + 16) != *(unsigned __int8 *)(a2 + 16))
    return 0;
  type metadata accessor for SidebarModality();
  return sub_23BCD78F4();
}

uint64_t sub_23BCBEF90()
{
  return sub_23BC9B4D8(&qword_256A96360, (uint64_t (*)(uint64_t))type metadata accessor for SidebarModality, (uint64_t)&protocol conformance descriptor for SidebarModality);
}

_QWORD *initializeBufferWithCopyOfBuffer for SidebarModality(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t v11;

  v3 = (_QWORD *)a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v11 = *a2;
    *v3 = *a2;
    v3 = (_QWORD *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v5;
    *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
    v6 = *(int *)(a3 + 24);
    v7 = a1 + v6;
    v8 = (uint64_t)a2 + v6;
    v9 = sub_23BCD7900();
    v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v3;
}

uint64_t destroy for SidebarModality(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_23BCD7900();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t initializeWithCopy for SidebarModality(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v5 = *(int *)(a3 + 24);
  v6 = a1 + v5;
  v7 = a2 + v5;
  v8 = sub_23BCD7900();
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16);
  swift_bridgeObjectRetain();
  v9(v6, v7, v8);
  return a1;
}

uint64_t assignWithCopy for SidebarModality(uint64_t a1, uint64_t a2, uint64_t a3)
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
  v9 = sub_23BCD7900();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t initializeWithTake for SidebarModality(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v4 = *(int *)(a3 + 24);
  v5 = a1 + v4;
  v6 = a2 + v4;
  v7 = sub_23BCD7900();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t assignWithTake for SidebarModality(uint64_t a1, uint64_t a2, uint64_t a3)
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
  v10 = sub_23BCD7900();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for SidebarModality()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23BCBF288(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_23BCD7900();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 24), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for SidebarModality()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23BCBF310(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_23BCD7900();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

uint64_t sub_23BCBF384()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23BCD7900();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for SidebarModality.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23BCBF44C + 4 * byte_23BCDC05D[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23BCBF480 + 4 * asc_23BCDC058[v4]))();
}

uint64_t sub_23BCBF480(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BCBF488(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23BCBF490);
  return result;
}

uint64_t sub_23BCBF49C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23BCBF4A4);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23BCBF4A8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BCBF4B0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SidebarModality.CodingKeys()
{
  return &type metadata for SidebarModality.CodingKeys;
}

unint64_t sub_23BCBF4D0()
{
  unint64_t result;

  result = qword_256A96400;
  if (!qword_256A96400)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDC214, &type metadata for SidebarModality.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A96400);
  }
  return result;
}

unint64_t sub_23BCBF518()
{
  unint64_t result;

  result = qword_256A96408;
  if (!qword_256A96408)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDC184, &type metadata for SidebarModality.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A96408);
  }
  return result;
}

unint64_t sub_23BCBF560()
{
  unint64_t result;

  result = qword_256A96410;
  if (!qword_256A96410)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDC1AC, &type metadata for SidebarModality.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A96410);
  }
  return result;
}

uint64_t sub_23BCBF5A4(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v2 || (sub_23BCD85A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1684957547 && a2 == 0xE400000000000000 || (sub_23BCD85A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1701667182 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_23BCD85A8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

unint64_t sub_23BCBF6E4()
{
  return 0xD000000000000011;
}

uint64_t sub_23BCBF700@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23BCC03A0(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23BCBF728()
{
  sub_23BCBFA34();
  return sub_23BCD8614();
}

uint64_t sub_23BCBF750()
{
  sub_23BCBFA34();
  return sub_23BCD8620();
}

uint64_t sub_23BCBF778()
{
  sub_23BCBFABC();
  return sub_23BCD8614();
}

uint64_t sub_23BCBF7A0()
{
  sub_23BCBFABC();
  return sub_23BCD8620();
}

uint64_t AnotherNavigationSplitViewAction.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  char *v3;
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A96418);
  v23 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_23BCD7CB4();
  v4 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for AnotherNavigationSplitViewAction();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A96420);
  v22 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23BCBFA34();
  v13 = v20;
  sub_23BCD8608();
  sub_23BCBFA78(v21, (uint64_t)v9);
  v14 = v9;
  v15 = v10;
  v16 = v19;
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v14, v19);
  sub_23BCBFABC();
  sub_23BCD8554();
  sub_23BCBFDFC(&qword_256A96438, MEMORY[0x24BDF0E58]);
  sub_23BCD8584();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v3, v13);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v16);
  return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v12, v15);
}

uint64_t type metadata accessor for AnotherNavigationSplitViewAction()
{
  uint64_t result;

  result = qword_256A964C8;
  if (!qword_256A964C8)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_23BCBFA34()
{
  unint64_t result;

  result = qword_256A96428;
  if (!qword_256A96428)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDC50C, &type metadata for AnotherNavigationSplitViewAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A96428);
  }
  return result;
}

uint64_t sub_23BCBFA78(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AnotherNavigationSplitViewAction();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_23BCBFABC()
{
  unint64_t result;

  result = qword_256A96430;
  if (!qword_256A96430)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDC4BC, &type metadata for AnotherNavigationSplitViewAction.VisibilityChangedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A96430);
  }
  return result;
}

uint64_t AnotherNavigationSplitViewAction.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _QWORD *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  _QWORD *v29;

  v24 = a2;
  v25 = type metadata accessor for AnotherNavigationSplitViewAction();
  MEMORY[0x24BDAC7A8](v25);
  v27 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A96440);
  v4 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A96448);
  v7 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23BCBFA34();
  v10 = v29;
  sub_23BCD85FC();
  if (!v10)
  {
    v11 = v6;
    v22 = v4;
    v23 = v7;
    v29 = a1;
    v12 = v26;
    v13 = (uint64_t)v27;
    v14 = v28;
    if (*(_QWORD *)(sub_23BCD853C() + 16) == 1)
    {
      sub_23BCBFABC();
      sub_23BCD84F4();
      v15 = v23;
      sub_23BCD7CB4();
      sub_23BCBFDFC(&qword_256A96450, MEMORY[0x24BDF0E68]);
      sub_23BCD8530();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v11, v12);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v15 + 8))(v9, v14);
      a1 = v29;
      sub_23BCBFE3C(v13, v24);
    }
    else
    {
      v16 = sub_23BCD8458();
      swift_allocError();
      v18 = v17;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256A94A88);
      *v18 = v25;
      sub_23BCD8500();
      sub_23BCD844C();
      (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v16 - 8) + 104))(v18, *MEMORY[0x24BEE26D0], v16);
      swift_willThrow();
      v19 = v23;
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v9, v14);
      a1 = v29;
    }
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_23BCBFDFC(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_23BCD7CB4();
    result = MEMORY[0x24260FFB0](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23BCBFE3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AnotherNavigationSplitViewAction();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23BCBFE80@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return AnotherNavigationSplitViewAction.init(from:)(a1, a2);
}

uint64_t sub_23BCBFE94(_QWORD *a1)
{
  return AnotherNavigationSplitViewAction.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for AnotherNavigationSplitViewAction(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v6;
  uint64_t v7;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = sub_23BCD7CB4();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  }
  return a1;
}

uint64_t destroy for AnotherNavigationSplitViewAction(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23BCD7CB4();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for AnotherNavigationSplitViewAction(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23BCD7CB4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for AnotherNavigationSplitViewAction(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23BCD7CB4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for AnotherNavigationSplitViewAction(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23BCD7CB4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for AnotherNavigationSplitViewAction(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23BCD7CB4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for AnotherNavigationSplitViewAction(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23BCD7CB4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for AnotherNavigationSplitViewAction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_23BCD7CB4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a1, a2, a3, v6);
}

uint64_t sub_23BCC00E4(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  uint64_t v4;

  result = sub_23BCD7CB4();
  if (v3 <= 0x3F)
  {
    v4 = *(_QWORD *)(result - 8);
    swift_initEnumMetadataSingleCase();
    result = 0;
    *(_DWORD *)(*(_QWORD *)(a1 - 8) + 84) = *(_DWORD *)(v4 + 84);
  }
  return result;
}

ValueMetadata *type metadata accessor for AnotherNavigationSplitViewAction.CodingKeys()
{
  return &type metadata for AnotherNavigationSplitViewAction.CodingKeys;
}

uint64_t _s14FitnessAppRoot32AnotherNavigationSplitViewActionO10CodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23BCC0194 + 4 * byte_23BCDC290[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23BCC01B4 + 4 * byte_23BCDC295[v4]))();
}

_BYTE *sub_23BCC0194(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23BCC01B4(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23BCC01BC(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23BCC01C4(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23BCC01CC(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23BCC01D4(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for AnotherNavigationSplitViewAction.VisibilityChangedCodingKeys()
{
  return &type metadata for AnotherNavigationSplitViewAction.VisibilityChangedCodingKeys;
}

unint64_t sub_23BCC01F4()
{
  unint64_t result;

  result = qword_256A964D8;
  if (!qword_256A964D8)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDC3DC, &type metadata for AnotherNavigationSplitViewAction.VisibilityChangedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A964D8);
  }
  return result;
}

unint64_t sub_23BCC023C()
{
  unint64_t result;

  result = qword_256A964E0;
  if (!qword_256A964E0)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDC494, &type metadata for AnotherNavigationSplitViewAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A964E0);
  }
  return result;
}

unint64_t sub_23BCC0284()
{
  unint64_t result;

  result = qword_256A964E8;
  if (!qword_256A964E8)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDC34C, &type metadata for AnotherNavigationSplitViewAction.VisibilityChangedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A964E8);
  }
  return result;
}

unint64_t sub_23BCC02CC()
{
  unint64_t result;

  result = qword_256A964F0;
  if (!qword_256A964F0)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDC374, &type metadata for AnotherNavigationSplitViewAction.VisibilityChangedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A964F0);
  }
  return result;
}

unint64_t sub_23BCC0314()
{
  unint64_t result;

  result = qword_256A964F8;
  if (!qword_256A964F8)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDC404, &type metadata for AnotherNavigationSplitViewAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A964F8);
  }
  return result;
}

unint64_t sub_23BCC035C()
{
  unint64_t result;

  result = qword_256A96500[0];
  if (!qword_256A96500[0])
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDC42C, &type metadata for AnotherNavigationSplitViewAction.CodingKeys);
    atomic_store(result, qword_256A96500);
  }
  return result;
}

uint64_t sub_23BCC03A0(uint64_t a1, uint64_t a2)
{
  char v2;
  char v3;

  if (a1 == 0xD000000000000011 && a2 == 0x800000023BCE6560)
  {
    swift_bridgeObjectRelease();
    v2 = 0;
  }
  else
  {
    v3 = sub_23BCD85A8();
    swift_bridgeObjectRelease();
    v2 = v3 ^ 1;
  }
  return v2 & 1;
}

uint64_t dispatch thunk of ScrollViewObserving.contentScrollViewsDidChange()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_23BCC042C(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x656C65536D657469 && a2 == 0xEC00000064657463)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_23BCD85A8();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23BCC04C8()
{
  return 0x656C65536D657469;
}

uint64_t sub_23BCC04E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23BCC042C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23BCC0518(uint64_t a1)
{
  MEMORY[0x24260FFB0](&unk_23BCDC7C8, a1);
  return sub_23BCD8614();
}

uint64_t sub_23BCC054C(uint64_t a1)
{
  MEMORY[0x24260FFB0](&unk_23BCDC7C8, a1);
  return sub_23BCD8620();
}

uint64_t sub_23BCC0580(uint64_t a1)
{
  MEMORY[0x24260FFB0](&unk_23BCDC818, a1);
  return sub_23BCD8614();
}

uint64_t sub_23BCC05B4(uint64_t a1)
{
  MEMORY[0x24260FFB0](&unk_23BCDC818, a1);
  return sub_23BCD8620();
}

uint64_t SidebarAction.encode(to:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
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
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v7 = *(_QWORD *)(a2 + 24);
  v6 = *(_QWORD *)(a2 + 16);
  v29 = v7;
  v33 = type metadata accessor for SidebarAction.ItemSelectedCodingKeys(255, v6, v7, a4);
  v34 = MEMORY[0x24260FFB0](&unk_23BCDC818, v33);
  v30 = sub_23BCD8590();
  v36 = *(_QWORD *)(v30 - 8);
  v8 = MEMORY[0x24BDAC7A8](v30);
  v31 = (char *)&v25 - v9;
  v28 = *(_QWORD *)(v6 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v27 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for SidebarAction.CodingKeys(255, v6, v7, v14);
  MEMORY[0x24260FFB0](&unk_23BCDC7C8, v15);
  v16 = sub_23BCD8590();
  v32 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v25 - v17;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v19 = v30;
  v21 = v27;
  v20 = v28;
  sub_23BCD8608();
  (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v13, v35, a2);
  v22 = v13;
  v23 = v31;
  (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v21, v22, v6);
  sub_23BCD8554();
  sub_23BCD8584();
  (*(void (**)(char *, uint64_t))(v36 + 8))(v23, v19);
  (*(void (**)(char *, uint64_t))(v20 + 8))(v21, v6);
  return (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v18, v16);
}

uint64_t type metadata accessor for SidebarAction.ItemSelectedCodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SidebarAction.ItemSelectedCodingKeys);
}

uint64_t type metadata accessor for SidebarAction.CodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SidebarAction.CodingKeys);
}

uint64_t SidebarAction.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;

  v40 = a5;
  v47 = type metadata accessor for SidebarAction(0, a2, a3, a4);
  v39 = *(_QWORD *)(v47 - 8);
  MEMORY[0x24BDAC7A8](v47);
  v42 = (char *)&v35 - v8;
  v10 = type metadata accessor for SidebarAction.ItemSelectedCodingKeys(255, a2, a3, v9);
  v44 = MEMORY[0x24260FFB0](&unk_23BCDC818, v10);
  v45 = v10;
  v41 = sub_23BCD8548();
  v43 = *(_QWORD *)(v41 - 8);
  MEMORY[0x24BDAC7A8](v41);
  v46 = (char *)&v35 - v11;
  v13 = type metadata accessor for SidebarAction.CodingKeys(255, a2, a3, v12);
  MEMORY[0x24260FFB0](&unk_23BCDC7C8, v13);
  v48 = sub_23BCD8548();
  v14 = *(_QWORD *)(v48 - 8);
  MEMORY[0x24BDAC7A8](v48);
  v16 = (char *)&v35 - v15;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v17 = v53;
  sub_23BCD85FC();
  if (!v17)
  {
    v36 = a3;
    v53 = v14;
    v37 = 0;
    v38 = a1;
    v18 = v48;
    *(_QWORD *)&v49 = sub_23BCD853C();
    v19 = sub_23BCD8200();
    MEMORY[0x24260FFB0](MEMORY[0x24BEE12C8], v19);
    *(_QWORD *)&v51 = sub_23BCD83BC();
    *((_QWORD *)&v51 + 1) = v20;
    *(_QWORD *)&v52 = v21;
    *((_QWORD *)&v52 + 1) = v22;
    v23 = sub_23BCD83B0();
    MEMORY[0x24260FFB0](MEMORY[0x24BEE2190], v23);
    sub_23BCD8314();
    v24 = v16;
    if ((v49 & 1) != 0 || (v35 = v51, v49 = v51, v50 = v52, (sub_23BCD8320() & 1) == 0))
    {
      v27 = sub_23BCD8458();
      swift_allocError();
      v29 = v28;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256A94A88);
      *v29 = v47;
      sub_23BCD8500();
      sub_23BCD844C();
      (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v27 - 8) + 104))(v29, *MEMORY[0x24BEE26D0], v27);
      swift_willThrow();
    }
    else
    {
      v25 = v46;
      v26 = v37;
      sub_23BCD84F4();
      if (!v26)
      {
        v32 = v42;
        v33 = v41;
        sub_23BCD8530();
        v34 = v53;
        (*(void (**)(char *, uint64_t))(v43 + 8))(v25, v33);
        swift_unknownObjectRelease();
        (*(void (**)(char *, uint64_t))(v34 + 8))(v24, v18);
        (*(void (**)(uint64_t, char *, uint64_t))(v39 + 32))(v40, v32, v47);
        v30 = (uint64_t)v38;
        return __swift_destroy_boxed_opaque_existential_1(v30);
      }
    }
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v53 + 8))(v24, v18);
    a1 = v38;
  }
  v30 = (uint64_t)a1;
  return __swift_destroy_boxed_opaque_existential_1(v30);
}

uint64_t type metadata accessor for SidebarAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SidebarAction);
}

uint64_t sub_23BCC0C98@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  return SidebarAction.init(from:)(a1, *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24), a3, a4);
}

uint64_t sub_23BCC0CB4(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return SidebarAction.encode(to:)(a1, a2, a3, a4);
}

uint64_t sub_23BCC0CC8(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  uint64_t v4;

  result = swift_checkMetadataState();
  if (v3 <= 0x3F)
  {
    v4 = *(_QWORD *)(result - 8);
    swift_initEnumMetadataSingleCase();
    result = 0;
    *(_DWORD *)(*(_QWORD *)(a1 - 8) + 84) = *(_DWORD *)(v4 + 84);
  }
  return result;
}

uint64_t *sub_23BCC0D28(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;

  v3 = a1;
  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if (v6 <= 7 && *(_QWORD *)(v5 + 64) <= 0x18uLL && (*(_DWORD *)(v5 + 80) & 0x100000) == 0)
  {
    (*(void (**)(uint64_t *, uint64_t *, _QWORD))(v5 + 16))(a1, a2, *(_QWORD *)(a3 + 16));
    (*(void (**)(uint64_t *, _QWORD, _QWORD, uint64_t))(v5 + 56))(v3, 0, 0, v4);
  }
  else
  {
    v9 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v9 + ((v6 + 16) & ~v6));
    swift_retain();
  }
  return v3;
}

uint64_t sub_23BCC0DBC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))();
}

uint64_t sub_23BCC0DCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(a1, a2, v4);
  (*(void (**)(uint64_t, _QWORD, _QWORD, uint64_t))(v5 + 56))(a1, 0, 0, v4);
  return a1;
}

uint64_t sub_23BCC0E20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 24))();
  return a1;
}

uint64_t sub_23BCC0E50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(a1, a2, v4);
  (*(void (**)(uint64_t, _QWORD, _QWORD, uint64_t))(v5 + 56))(a1, 0, 0, v4);
  return a1;
}

uint64_t sub_23BCC0EA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 40))();
  return a1;
}

uint64_t sub_23BCC0ED4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 48))();
}

uint64_t sub_23BCC0EE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a4 + 16) - 8) + 56))();
}

uint64_t sub_23BCC0EF8(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23BCC0F38 + 4 * asc_23BCDC580[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23BCC0F58 + 4 * byte_23BCDC585[v4]))();
}

_BYTE *sub_23BCC0F38(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23BCC0F58(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23BCC0F60(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23BCC0F68(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23BCC0F70(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23BCC0F78(_DWORD *result)
{
  *result = 0;
  return result;
}

void sub_23BCC0F84()
{
  JUMPOUT(0x24260FFB0);
}

void sub_23BCC0F94()
{
  JUMPOUT(0x24260FFB0);
}

void sub_23BCC0FA4()
{
  JUMPOUT(0x24260FFB0);
}

void sub_23BCC0FB4()
{
  JUMPOUT(0x24260FFB0);
}

void sub_23BCC0FC4()
{
  JUMPOUT(0x24260FFB0);
}

void sub_23BCC0FD4()
{
  JUMPOUT(0x24260FFB0);
}

uint64_t AnotherNavigationSplitViewFeature.reduce(localState:sharedState:sideEffects:action:)(uint64_t a1, BOOL *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void (*v17)(char *, uint64_t);
  uint64_t result;
  uint64_t v19;

  v6 = sub_23BCD7CB4();
  v7 = (uint64_t (*)(uint64_t))MEMORY[0x24BDF0E48];
  v8 = *(_QWORD *)(v6 - 8);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v19 - v12;
  v14 = type metadata accessor for AnotherNavigationSplitViewAction();
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23BCBFA78(a4, (uint64_t)v16);
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v13, v16, v6);
  sub_23BCD7C9C();
  sub_23BC9B4D8(&qword_256A96688, v7, MEMORY[0x24BDF0E60]);
  LOBYTE(a4) = sub_23BCD811C();
  v17 = *(void (**)(char *, uint64_t))(v8 + 8);
  v17(v11, v6);
  result = ((uint64_t (*)(char *, uint64_t))v17)(v13, v6);
  *a2 = (a4 & 1) == 0;
  return result;
}

uint64_t sub_23BCC1138()
{
  return sub_23BC9B4D8(&qword_256A96690, (uint64_t (*)(uint64_t))type metadata accessor for AnotherNavigationSplitViewAction, (uint64_t)&protocol conformance descriptor for AnotherNavigationSplitViewAction);
}

uint64_t sub_23BCC1164()
{
  return sub_23BC9B4D8(&qword_256A96698, (uint64_t (*)(uint64_t))type metadata accessor for AnotherNavigationSplitViewAction, (uint64_t)&protocol conformance descriptor for AnotherNavigationSplitViewAction);
}

unint64_t sub_23BCC1194()
{
  unint64_t result;

  result = qword_256A966A0[0];
  if (!qword_256A966A0[0])
  {
    result = MEMORY[0x24260FFB0](&protocol conformance descriptor for AnotherNavigationSplitViewState, &type metadata for AnotherNavigationSplitViewState);
    atomic_store(result, qword_256A966A0);
  }
  return result;
}

uint64_t sub_23BCC11D8(uint64_t a1, BOOL *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void (*v17)(char *, uint64_t);
  uint64_t result;
  uint64_t v19;

  v6 = sub_23BCD7CB4();
  v7 = (uint64_t (*)(uint64_t))MEMORY[0x24BDF0E48];
  v8 = *(_QWORD *)(v6 - 8);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v19 - v12;
  v14 = type metadata accessor for AnotherNavigationSplitViewAction();
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23BCBFA78(a4, (uint64_t)v16);
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v13, v16, v6);
  sub_23BCD7C9C();
  sub_23BC9B4D8(&qword_256A96688, v7, MEMORY[0x24BDF0E60]);
  LOBYTE(a4) = sub_23BCD811C();
  v17 = *(void (**)(char *, uint64_t))(v8 + 8);
  v17(v11, v6);
  result = ((uint64_t (*)(char *, uint64_t))v17)(v13, v6);
  *a2 = (a4 & 1) == 0;
  return result;
}

ValueMetadata *type metadata accessor for AnotherNavigationSplitViewFeature()
{
  return &type metadata for AnotherNavigationSplitViewFeature;
}

uint64_t sub_23BCC1334(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  v4 = type metadata accessor for SidebarFeature(255, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 48), a4);
  MEMORY[0x24260FFB0](&protocol conformance descriptor for SidebarFeature<A>, v4);
  v5 = sub_23BCD80C8();
  MEMORY[0x24260FFB0](MEMORY[0x24BE2B5E8], v5);
  return sub_23BCD7A5C();
}

uint64_t sub_23BCC13B8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v4;

  v2 = sub_23BCD8398();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 24);
  MEMORY[0x24260FFB0](MEMORY[0x24BEE4AB0], v2, &v4);
  sub_23BCD7A44();
  return sub_23BCD7A14();
}

uint64_t sub_23BCC1438()
{
  unsigned __int8 v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256A96728);
  sub_23BCD7A08();
  return v1;
}

uint64_t sub_23BCC1494()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256A96728);
  sub_23BCD7A14();
  return v1;
}

uint64_t sub_23BCC14F4()
{
  unsigned __int8 v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256A95698);
  sub_23BCD7F60();
  return v1;
}

uint64_t sub_23BCC1548()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A95698);
  return sub_23BCD7F6C();
}

uint64_t sub_23BCC15A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;

  sub_23BCC1334(a1, a2, a3, a4);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = *(_OWORD *)(a1 + 24);
  *(_QWORD *)(v5 + 32) = *(_QWORD *)(a1 + 40);
  *(_OWORD *)(v5 + 40) = *(_OWORD *)(a1 + 56);
  *(_QWORD *)(v5 + 56) = *(_QWORD *)(a1 + 72);
  return sub_23BCD7FB4();
}

uint64_t sub_23BCC1624()
{
  swift_getKeyPath();
  sub_23BCD80A4();
  swift_release();
  swift_getKeyPath();
  sub_23BCD80A4();
  swift_release();
  sub_23BCD8224();
  return swift_bridgeObjectRelease();
}

void SidebarView.init(store:labelViewBuilder:signOutViewBuilder:currentTimeViewBuilder:)()
{
  type metadata accessor for SidebarView();
}

uint64_t sub_23BCC1790(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;
  char v21;
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

  sub_23BCD7A38();
  v11 = v3 + *(int *)(a1 + 100);
  *(_BYTE *)v11 = sub_23BCD7A2C() & 1;
  *(_QWORD *)(v11 + 8) = v12;
  *(_BYTE *)(v11 + 16) = v13 & 1;
  v14 = v3 + *(int *)(a1 + 104);
  *(_BYTE *)(v9 - 89) = 1;
  sub_23BCD7F54();
  *(_BYTE *)v14 = v31;
  *(_QWORD *)(v14 + 8) = v32;
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = v1;
  v15[3] = v8;
  v15[4] = v6;
  v15[5] = v5;
  v15[6] = v7;
  v15[7] = v4;
  v15[8] = v2;
  v15[9] = v22;
  v15[10] = v23;
  v15[11] = v24;
  v17 = type metadata accessor for SidebarFeature(255, v1, v7, v16);
  MEMORY[0x24260FFB0](&protocol conformance descriptor for SidebarFeature<A>, v17);
  v18 = sub_23BCD80C8();
  MEMORY[0x24260FFB0](MEMORY[0x24BE2B5E8], v18);
  result = sub_23BCD7A50();
  *(_QWORD *)v3 = result;
  *(_QWORD *)(v3 + 8) = v20;
  *(_BYTE *)(v3 + 16) = v21 & 1;
  *(_QWORD *)(v3 + 24) = v25;
  *(_QWORD *)(v3 + 32) = v26;
  *(_QWORD *)(v3 + 40) = v27;
  *(_QWORD *)(v3 + 48) = v28;
  *(_QWORD *)(v3 + 56) = v29;
  *(_QWORD *)(v3 + 64) = v30;
  return result;
}

void type metadata accessor for SidebarView()
{
  JUMPOUT(0x24260FF2CLL);
}

uint64_t sub_23BCC18F0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23BCC1914()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t SidebarView.body.getter@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t AssociatedTypeWitness;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t OpaqueTypeConformance2;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t AssociatedConformanceWitness;
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
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  char *v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  void (*v74)(char *, _QWORD, uint64_t, uint64_t);
  char *v75;
  char *v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  unint64_t v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  void (*v107)(uint64_t, uint64_t);
  _QWORD v109[3];
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  char *v119;
  uint64_t v120;
  char *v121;
  uint64_t v122;
  uint64_t v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  char *v130;
  char *v131;
  char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  char *v137;
  uint64_t v138;
  uint64_t v139;
  char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  _QWORD *v146;
  char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  _QWORD v179[2];
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;

  v143 = a2;
  v3 = *(_QWORD *)(*(a1 - 1) + 64);
  v141 = *(a1 - 1);
  v142 = v3;
  MEMORY[0x24BDAC7A8](a1);
  v140 = (char *)v109 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23BCD7D38();
  v138 = *(_QWORD *)(v5 - 8);
  v139 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v137 = (char *)v109 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1[2];
  v151 = sub_23BCD7FC0();
  v135 = *(_QWORD *)(v151 - 8);
  MEMORY[0x24BDAC7A8](v151);
  v132 = (char *)v109 - v8;
  v9 = sub_23BCD8398();
  v136 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v131 = (char *)v109 - v10;
  v11 = *(_QWORD *)(a1[6] + 24);
  v156 = a1[6];
  v157 = v11;
  v185 = v11;
  v12 = MEMORY[0x24260FFB0](MEMORY[0x24BEE4AB0], v9, &v185);
  v13 = sub_23BCD7A20();
  v133 = *(_QWORD *)(v13 - 8);
  v134 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v130 = (char *)v109 - v14;
  v154 = v7;
  v155 = sub_23BCD8200();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v146 = a1;
  v158 = a1[3];
  v153 = a1[7];
  v16 = sub_23BCD7F84();
  v17 = MEMORY[0x24260FFB0](MEMORY[0x24BDF43B0], v16);
  v180 = v16;
  v181 = v17;
  v18 = MEMORY[0x24260FF74](255, &v180, MEMORY[0x24BE37C20], 0);
  v180 = v16;
  v181 = v17;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v180 = v18;
  v181 = v9;
  v149 = v9;
  v150 = v12;
  v182 = OpaqueTypeConformance2;
  v183 = v12;
  v20 = MEMORY[0x24260FF74](255, &v180, MEMORY[0x24BDF3748], 0);
  v180 = v18;
  v181 = v9;
  v182 = OpaqueTypeConformance2;
  v183 = v12;
  v21 = swift_getOpaqueTypeConformance2();
  v22 = v154;
  v180 = v20;
  v181 = v154;
  v23 = v157;
  v182 = v21;
  v183 = v157;
  MEMORY[0x24260FF74](255, &v180, MEMORY[0x24BDF2230], 0);
  v24 = sub_23BCD7B04();
  v25 = v155;
  v26 = MEMORY[0x24260FFB0](MEMORY[0x24BEE12D8], v155);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v180 = v25;
  v181 = AssociatedTypeWitness;
  v182 = v24;
  v183 = v26;
  v184 = AssociatedConformanceWitness;
  v28 = sub_23BCD7FE4();
  v126 = v28;
  v180 = v20;
  v181 = v22;
  v29 = v22;
  v182 = v21;
  v183 = v23;
  v179[0] = swift_getOpaqueTypeConformance2();
  v179[1] = MEMORY[0x24BDECC60];
  v178 = MEMORY[0x24260FFB0](MEMORY[0x24BDED308], v24, v179);
  v125 = MEMORY[0x24260FFB0](MEMORY[0x24BDF4A08], v28, &v178);
  v30 = sub_23BCD7F9C();
  v129 = *(_QWORD *)(v30 - 8);
  MEMORY[0x24BDAC7A8](v30);
  v119 = (char *)v109 - v31;
  v32 = MEMORY[0x24260FFB0](MEMORY[0x24BDF4700], v30);
  v180 = v30;
  v33 = v30;
  v122 = v30;
  v123 = v32;
  v34 = v149;
  v35 = v150;
  v181 = v149;
  v182 = v32;
  v36 = v32;
  v183 = v150;
  v37 = MEMORY[0x24260FF74](0, &v180, MEMORY[0x24BDF24C8], 0);
  v128 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v37);
  v121 = (char *)v109 - v38;
  v180 = v33;
  v181 = v34;
  v182 = v36;
  v183 = v35;
  v39 = swift_getOpaqueTypeConformance2();
  v40 = *(_QWORD *)(v156 + 40);
  v180 = v37;
  v181 = v29;
  v110 = v37;
  v111 = v40;
  v41 = v29;
  v182 = v39;
  v183 = v40;
  v112 = v39;
  v145 = MEMORY[0x24260FF74](0, &v180, MEMORY[0x24BDF2D68], 0);
  v127 = *(_QWORD *)(v145 - 8);
  MEMORY[0x24BDAC7A8](v145);
  v124 = (char *)v109 - v42;
  v43 = (uint64_t)v146;
  v44 = v146[8];
  v180 = v146[4];
  v181 = v44;
  v45 = v180;
  v155 = v180;
  v46 = v44;
  v157 = v44;
  MEMORY[0x24260FF74](255, &v180, MEMORY[0x24BDF3758], 0);
  v180 = v45;
  v181 = v46;
  swift_getOpaqueTypeConformance2();
  sub_23BCD7A80();
  v144 = *(_QWORD *)(v43 + 40);
  v47 = v144;
  v48 = sub_23BCD8398();
  v148 = *(_QWORD *)(v43 + 72);
  v177 = v148;
  MEMORY[0x24260FFB0](MEMORY[0x24BDF5578], v48, &v177);
  v49 = sub_23BCD7F9C();
  MEMORY[0x24260FFB0](MEMORY[0x24BDF4700], v49);
  sub_23BCD7A80();
  swift_getTupleTypeMetadata2();
  v50 = sub_23BCD7BB8();
  v180 = v37;
  v181 = v41;
  v51 = v41;
  v182 = v39;
  v183 = v40;
  v52 = swift_getOpaqueTypeConformance2();
  v53 = MEMORY[0x24260FFB0](MEMORY[0x24BDEF170], v50);
  v54 = v145;
  v180 = v145;
  v181 = v50;
  v109[0] = v50;
  v109[1] = v53;
  v182 = v52;
  v183 = v53;
  v109[2] = v52;
  v55 = v53;
  v56 = MEMORY[0x24260FF74](0, &v180, MEMORY[0x24BDF3858], 0);
  v120 = *(_QWORD *)(v56 - 8);
  v57 = v56;
  v116 = v56;
  MEMORY[0x24BDAC7A8](v56);
  v147 = (char *)v109 - v58;
  v180 = v54;
  v181 = v50;
  v182 = v52;
  v183 = v55;
  v114 = swift_getOpaqueTypeConformance2();
  v180 = v57;
  v181 = MEMORY[0x24BEE1328];
  v182 = v114;
  v183 = MEMORY[0x24BEE1340];
  v59 = MEMORY[0x24260FF74](0, &v180, MEMORY[0x24BDF38E8], 0);
  v60 = *(_QWORD *)(v59 - 8);
  v117 = v59;
  v118 = v60;
  v61 = MEMORY[0x24BDAC7A8](v59);
  v113 = (char *)v109 - ((v62 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v61);
  v115 = (uint64_t)v109 - v63;
  v64 = v51;
  v168 = v51;
  v169 = v158;
  v170 = v155;
  v171 = v47;
  v172 = v156;
  v173 = v153;
  v174 = v157;
  v175 = v148;
  v176 = v152;
  sub_23BCD7B70();
  v65 = v119;
  sub_23BCD7F90();
  v66 = v130;
  sub_23BCC13B8(v43);
  v67 = v132;
  sub_23BCC15A0(v43, v68, v69, v70);
  v71 = v131;
  v72 = v151;
  MEMORY[0x24260F4D0](v151);
  v135 = *(_QWORD *)(v135 + 8);
  ((void (*)(char *, uint64_t))v135)(v67, v72);
  v73 = v64;
  v74 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v64 - 8) + 56);
  v75 = v71;
  v74(v71, 0, 1, v73);
  v76 = v137;
  sub_23BCD7D2C();
  v77 = v121;
  v78 = v122;
  v79 = v149;
  MEMORY[0x24260F338](v66, v75, v76, v122, v149, v123, v150);
  (*(void (**)(char *, uint64_t))(v138 + 8))(v76, v139);
  (*(void (**)(char *, uint64_t))(v136 + 8))(v75, v79);
  (*(void (**)(char *, uint64_t))(v133 + 8))(v66, v134);
  (*(void (**)(char *, uint64_t))(v129 + 8))(v65, v78);
  v80 = (uint64_t)v146;
  v81 = v152;
  sub_23BCC15A0((uint64_t)v146, v82, v83, v84);
  v85 = v124;
  v86 = v110;
  v87 = v154;
  sub_23BCD7E34();
  ((void (*)(char *, uint64_t))v135)(v67, v151);
  (*(void (**)(char *, uint64_t))(v128 + 8))(v77, v86);
  v159 = v87;
  v160 = v158;
  v88 = v156;
  v161 = v155;
  v162 = v144;
  v89 = v153;
  v163 = v156;
  v164 = v153;
  v90 = v148;
  v165 = v157;
  v166 = v148;
  v167 = v81;
  swift_checkMetadataState();
  v91 = v145;
  sub_23BCD7E64();
  (*(void (**)(char *, uint64_t))(v127 + 8))(v85, v91);
  LOBYTE(v180) = sub_23BCC1438() & 1;
  v93 = v140;
  v92 = v141;
  (*(void (**)(char *, uint64_t, uint64_t))(v141 + 16))(v140, v81, v80);
  v94 = v92;
  v95 = (*(unsigned __int8 *)(v92 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v92 + 80);
  v96 = (char *)swift_allocObject();
  v97 = v158;
  *((_QWORD *)v96 + 2) = v154;
  *((_QWORD *)v96 + 3) = v97;
  v98 = v144;
  *((_QWORD *)v96 + 4) = v155;
  *((_QWORD *)v96 + 5) = v98;
  *((_QWORD *)v96 + 6) = v88;
  *((_QWORD *)v96 + 7) = v89;
  *((_QWORD *)v96 + 8) = v157;
  *((_QWORD *)v96 + 9) = v90;
  (*(void (**)(char *, char *, uint64_t))(v94 + 32))(&v96[v95], v93, v80);
  v100 = (uint64_t)v113;
  v99 = v114;
  v101 = v116;
  v102 = MEMORY[0x24BEE1328];
  v103 = MEMORY[0x24BEE1340];
  v104 = v147;
  sub_23BCD7E88();
  swift_release();
  (*(void (**)(char *, uint64_t))(v120 + 8))(v104, v101);
  v180 = v101;
  v181 = v102;
  v182 = v99;
  v183 = v103;
  swift_getOpaqueTypeConformance2();
  v105 = v115;
  v106 = v117;
  sub_23BCACF3C(v100, v117, v115);
  v107 = *(void (**)(uint64_t, uint64_t))(v118 + 8);
  v107(v100, v106);
  sub_23BCAC3E8(v105, v106, v143);
  return ((uint64_t (*)(uint64_t, uint64_t))v107)(v105, v106);
}

void sub_23BCC23EC()
{
  type metadata accessor for SidebarView();
}

uint64_t sub_23BCC247C(uint64_t a1)
{
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
  uint64_t OpaqueTypeConformance2;
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
  uint64_t AssociatedConformanceWitness;
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
  uint64_t v39;
  unint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(uint64_t, uint64_t);
  _BYTE v53[80];

  *(_QWORD *)(v3 - 384) = a1;
  v4 = *(_QWORD *)(a1 - 8);
  *(_QWORD *)(v3 - 328) = v4;
  *(_QWORD *)(v3 - 320) = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8](a1);
  *(_QWORD *)(v3 - 336) = &v53[-v5];
  v6 = sub_23BCD8200();
  v7 = *(_QWORD *)(v1 + 32);
  *(_QWORD *)(v3 - 296) = v1;
  *(_QWORD *)(v3 - 424) = v7;
  *(_QWORD *)(v3 - 304) = swift_getAssociatedTypeWitness();
  v8 = sub_23BCD7F84();
  v9 = MEMORY[0x24260FFB0](MEMORY[0x24BDF43B0], v8);
  *(_QWORD *)(v3 - 152) = v8;
  *(_QWORD *)(v3 - 144) = v9;
  v10 = MEMORY[0x24260FF74](255, v3 - 152, MEMORY[0x24BE37C20], 0);
  v11 = sub_23BCD8398();
  *(_QWORD *)(v3 - 152) = v8;
  *(_QWORD *)(v3 - 144) = v9;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v13 = *(_QWORD *)(v1 + 24);
  *(_QWORD *)(v3 - 160) = v13;
  v14 = v13;
  *(_QWORD *)(v3 - 408) = v13;
  v15 = MEMORY[0x24260FFB0](MEMORY[0x24BEE4AB0], v11, v3 - 160);
  *(_QWORD *)(v3 - 152) = v10;
  *(_QWORD *)(v3 - 144) = v11;
  *(_QWORD *)(v3 - 136) = OpaqueTypeConformance2;
  *(_QWORD *)(v3 - 128) = v15;
  v16 = MEMORY[0x24260FF74](255, v3 - 152, MEMORY[0x24BDF3748], 0);
  *(_QWORD *)(v3 - 400) = v16;
  *(_QWORD *)(v3 - 152) = v10;
  *(_QWORD *)(v3 - 144) = v11;
  *(_QWORD *)(v3 - 136) = OpaqueTypeConformance2;
  *(_QWORD *)(v3 - 128) = v15;
  v17 = swift_getOpaqueTypeConformance2();
  *(_QWORD *)(v3 - 416) = v17;
  *(_QWORD *)(v3 - 152) = v16;
  *(_QWORD *)(v3 - 144) = v2;
  v18 = v2;
  *(_QWORD *)(v3 - 136) = v17;
  *(_QWORD *)(v3 - 128) = v14;
  MEMORY[0x24260FF74](255, v3 - 152, MEMORY[0x24BDF2230], 0);
  v19 = sub_23BCD7B04();
  *(_QWORD *)(v3 - 456) = v19;
  v20 = MEMORY[0x24BEE12D8];
  *(_QWORD *)(v3 - 432) = v6;
  v21 = MEMORY[0x24260FFB0](v20, v6);
  *(_QWORD *)(v3 - 440) = v21;
  v22 = *(_QWORD *)(v3 - 304);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  *(_QWORD *)(v3 - 152) = v6;
  *(_QWORD *)(v3 - 144) = v22;
  *(_QWORD *)(v3 - 136) = v19;
  *(_QWORD *)(v3 - 128) = v21;
  *(_QWORD *)(v3 - 120) = AssociatedConformanceWitness;
  v24 = sub_23BCD7FE4();
  *(_QWORD *)(v3 - 472) = v24;
  *(_QWORD *)(v3 - 392) = *(_QWORD *)(v24 - 8);
  v25 = MEMORY[0x24BDAC7A8](v24);
  *(_QWORD *)(v3 - 464) = &v53[-((v26 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v25);
  *(_QWORD *)(v3 - 448) = &v53[-v27];
  v28 = *(_QWORD *)(v3 - 384);
  v29 = *(_QWORD *)(v3 - 376);
  sub_23BCC1334(v28, v30, v31, v32);
  *(_QWORD *)(v3 - 272) = v18;
  *(_QWORD *)(v3 - 264) = *(_QWORD *)(v3 - 288);
  v33 = *(_QWORD *)(v3 - 360);
  v34 = *(_QWORD *)(v3 - 352);
  *(_QWORD *)(v3 - 256) = v33;
  *(_QWORD *)(v3 - 248) = v34;
  v35 = *(_QWORD *)(v3 - 280);
  *(_QWORD *)(v3 - 240) = *(_QWORD *)(v3 - 296);
  *(_QWORD *)(v3 - 232) = v35;
  v36 = *(_QWORD *)(v3 - 344);
  v37 = *(_QWORD *)(v3 - 368);
  *(_QWORD *)(v3 - 224) = v36;
  *(_QWORD *)(v3 - 216) = v37;
  swift_getKeyPath();
  sub_23BCD80A4();
  swift_release();
  swift_release();
  *(_QWORD *)(v3 - 176) = *(_QWORD *)(v3 - 168);
  v38 = *(_QWORD *)(v3 - 328);
  v39 = *(_QWORD *)(v3 - 336);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 16))(v39, v29, v28);
  v40 = (*(unsigned __int8 *)(v38 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80);
  v41 = (char *)swift_allocObject();
  v42 = *(_QWORD *)(v3 - 288);
  *((_QWORD *)v41 + 2) = v18;
  *((_QWORD *)v41 + 3) = v42;
  *((_QWORD *)v41 + 4) = v33;
  *((_QWORD *)v41 + 5) = v34;
  v43 = *(_QWORD *)(v3 - 280);
  *((_QWORD *)v41 + 6) = *(_QWORD *)(v3 - 296);
  *((_QWORD *)v41 + 7) = v43;
  *((_QWORD *)v41 + 8) = v36;
  *((_QWORD *)v41 + 9) = v37;
  (*(void (**)(char *, uint64_t, uint64_t))(v38 + 32))(&v41[v40], v39, v28);
  *(_QWORD *)(v3 - 152) = *(_QWORD *)(v3 - 400);
  *(_QWORD *)(v3 - 144) = v18;
  v44 = *(_QWORD *)(v3 - 408);
  *(_QWORD *)(v3 - 136) = *(_QWORD *)(v3 - 416);
  *(_QWORD *)(v3 - 128) = v44;
  v45 = swift_getOpaqueTypeConformance2();
  v46 = MEMORY[0x24BDECC60];
  *(_QWORD *)(v3 - 192) = v45;
  *(_QWORD *)(v3 - 184) = v46;
  v47 = MEMORY[0x24260FFB0](MEMORY[0x24BDED308], *(_QWORD *)(v3 - 456), v3 - 192);
  v48 = *(_QWORD *)(v3 - 464);
  sub_23BCD7FD8();
  *(_QWORD *)(v3 - 200) = v47;
  v49 = *(_QWORD *)(v3 - 472);
  MEMORY[0x24260FFB0](MEMORY[0x24BDF4A08], v49, v3 - 200);
  v50 = *(_QWORD *)(v3 - 448);
  sub_23BCACF3C(v48, v49, v50);
  v51 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 392) + 8);
  v51(v48, v49);
  sub_23BCAC3E8(v50, v49, *(_QWORD *)(v3 - 312));
  return ((uint64_t (*)(uint64_t, uint64_t))v51)(v50, v49);
}

void sub_23BCC2994()
{
  sub_23BCC58A4((void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23BCC23EC);
}

void sub_23BCC29A0(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11)
{
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[35];
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
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
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v22[10] = a6;
  v22[8] = a5;
  v29 = a2;
  v30 = a1;
  v25 = a9;
  v22[9] = a11;
  v22[7] = a10;
  v17 = sub_23BCD8398();
  v24 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v22[33] = (char *)v22 - v18;
  v31 = *(_QWORD *)(a7 + 24);
  v22[11] = a7;
  v41 = v31;
  v27 = MEMORY[0x24260FFB0](MEMORY[0x24BEE4AB0], v17, &v41);
  v23 = sub_23BCD7A20();
  v22[34] = *(_QWORD *)(v23 - 8);
  v19 = MEMORY[0x24BDAC7A8](v23);
  v22[32] = (char *)v22 - v20;
  v26 = a3;
  v32 = *(_QWORD *)(a3 - 8);
  v22[6] = *(_QWORD *)(v32 + 64);
  MEMORY[0x24BDAC7A8](v19);
  v28 = (char *)v22 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = a3;
  v34 = a4;
  v35 = a5;
  v36 = a6;
  v37 = a7;
  v38 = a8;
  v22[5] = a8;
  v39 = a10;
  v40 = a11;
  type metadata accessor for SidebarView();
}

uint64_t sub_23BCC2B5C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v14;
  uint64_t v15;
  uint64_t OpaqueTypeConformance2;
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
  void (*v34)(_QWORD, _QWORD, uint64_t);
  unint64_t v35;
  unint64_t v36;
  char *v37;
  uint64_t v38;
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
  uint64_t (*v50)(uint64_t, uint64_t);
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void (*v71)(uint64_t, uint64_t);
  _BYTE v73[96];

  *(_QWORD *)(v3 - 328) = a1;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 - 8) + 64);
  v5 = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v7 = &v73[-v6];
  *(_QWORD *)(v3 - 616) = &v73[-v6];
  v8 = v1;
  *(_QWORD *)(v3 - 632) = v1;
  v9 = sub_23BCD7F84();
  *(_QWORD *)(v3 - 408) = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  *(_QWORD *)(v3 - 536) = &v73[-v10];
  v11 = MEMORY[0x24260FFB0](MEMORY[0x24BDF43B0], v9);
  *(_QWORD *)(v3 - 160) = v9;
  *(_QWORD *)(v3 - 152) = v11;
  *(_QWORD *)(v3 - 528) = v9;
  v12 = v11;
  *(_QWORD *)(v3 - 512) = v11;
  v13 = MEMORY[0x24260FF74](0, v3 - 160, MEMORY[0x24BE37C20], 0);
  *(_QWORD *)(v3 - 392) = *(_QWORD *)(v13 - 8);
  v14 = v13;
  MEMORY[0x24BDAC7A8](v13);
  *(_QWORD *)(v3 - 520) = &v73[-v15];
  *(_QWORD *)(v3 - 160) = v9;
  *(_QWORD *)(v3 - 152) = v12;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  *(_QWORD *)(v3 - 160) = v14;
  *(_QWORD *)(v3 - 152) = v2;
  v17 = v14;
  *(_QWORD *)(v3 - 488) = v14;
  *(_QWORD *)(v3 - 496) = v2;
  v18 = OpaqueTypeConformance2;
  *(_QWORD *)(v3 - 480) = OpaqueTypeConformance2;
  v19 = *(_QWORD *)(v3 - 320);
  *(_QWORD *)(v3 - 144) = OpaqueTypeConformance2;
  *(_QWORD *)(v3 - 136) = v19;
  v20 = MEMORY[0x24260FF74](0, v3 - 160, MEMORY[0x24BDF3748], 0);
  *(_QWORD *)(v3 - 416) = *(_QWORD *)(v20 - 8);
  v21 = v20;
  *(_QWORD *)(v3 - 456) = v20;
  MEMORY[0x24BDAC7A8](v20);
  *(_QWORD *)(v3 - 504) = &v73[-v22];
  *(_QWORD *)(v3 - 160) = v17;
  *(_QWORD *)(v3 - 152) = v2;
  *(_QWORD *)(v3 - 144) = v18;
  *(_QWORD *)(v3 - 136) = v19;
  v23 = swift_getOpaqueTypeConformance2();
  *(_QWORD *)(v3 - 464) = v23;
  v24 = *(_QWORD *)(v3 - 336);
  *(_QWORD *)(v3 - 160) = v21;
  *(_QWORD *)(v3 - 152) = v24;
  v25 = *(_QWORD *)(v3 - 288);
  *(_QWORD *)(v3 - 144) = v23;
  *(_QWORD *)(v3 - 136) = v25;
  v26 = MEMORY[0x24260FF74](0, v3 - 160, MEMORY[0x24BDF2230], 0);
  *(_QWORD *)(v3 - 424) = *(_QWORD *)(v26 - 8);
  *(_QWORD *)(v3 - 448) = v26;
  MEMORY[0x24BDAC7A8](v26);
  *(_QWORD *)(v3 - 544) = &v73[-v27];
  v28 = sub_23BCD7B04();
  *(_QWORD *)(v3 - 432) = v28;
  *(_QWORD *)(v3 - 400) = *(_QWORD *)(v28 - 8);
  v29 = MEMORY[0x24BDAC7A8](v28);
  *(_QWORD *)(v3 - 472) = &v73[-((v30 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v29);
  *(_QWORD *)(v3 - 440) = &v73[-v31];
  *(_QWORD *)(v3 - 624) = v5;
  v32 = *(_QWORD *)(v3 - 328);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v5 + 16))(v7, *(_QWORD *)(v3 - 304), v32);
  v33 = *(_QWORD *)(v3 - 280);
  v34 = *(void (**)(_QWORD, _QWORD, uint64_t))(v33 + 16);
  *(_QWORD *)(v3 - 608) = v34;
  v34(*(_QWORD *)(v3 - 312), *(_QWORD *)(v3 - 296), v24);
  v35 = (*(unsigned __int8 *)(v5 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v36 = (v4 + *(unsigned __int8 *)(v33 + 80) + v35) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80);
  v37 = (char *)swift_allocObject();
  *((_QWORD *)v37 + 2) = v24;
  *((_QWORD *)v37 + 3) = v8;
  v38 = *(_QWORD *)(v3 - 576);
  v39 = *(_QWORD *)(v3 - 560);
  *((_QWORD *)v37 + 4) = v38;
  *((_QWORD *)v37 + 5) = v39;
  v40 = *(_QWORD *)(v3 - 552);
  v41 = *(_QWORD *)(v3 - 600);
  *((_QWORD *)v37 + 6) = v40;
  *((_QWORD *)v37 + 7) = v41;
  v42 = *(_QWORD *)(v3 - 584);
  v43 = *(_QWORD *)(v3 - 568);
  *((_QWORD *)v37 + 8) = v42;
  *((_QWORD *)v37 + 9) = v43;
  (*(void (**)(char *, _QWORD, uint64_t))(*(_QWORD *)(v3 - 624) + 32))(&v37[v35], *(_QWORD *)(v3 - 616), v32);
  v44 = *(_QWORD *)(v3 - 336);
  (*(void (**)(char *, _QWORD, uint64_t))(*(_QWORD *)(v3 - 280) + 32))(&v37[v36], *(_QWORD *)(v3 - 312), v44);
  v45 = *(_QWORD *)(v3 - 632);
  *(_QWORD *)(v3 - 256) = v44;
  *(_QWORD *)(v3 - 248) = v45;
  *(_QWORD *)(v3 - 240) = v38;
  *(_QWORD *)(v3 - 232) = v39;
  *(_QWORD *)(v3 - 224) = v40;
  *(_QWORD *)(v3 - 216) = v41;
  *(_QWORD *)(v3 - 208) = v42;
  *(_QWORD *)(v3 - 200) = v43;
  v46 = *(_QWORD *)(v3 - 296);
  *(_QWORD *)(v3 - 192) = *(_QWORD *)(v3 - 304);
  *(_QWORD *)(v3 - 184) = v46;
  v47 = *(_QWORD *)(v3 - 536);
  sub_23BCD7F78();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A96730);
  v48 = swift_allocObject();
  *(_OWORD *)(v48 + 16) = xmmword_23BCDA510;
  v49 = v40;
  v50 = *(uint64_t (**)(uint64_t, uint64_t))(v40 + 56);
  v51 = v46;
  v52 = v44;
  *(_QWORD *)(v48 + 32) = v50(v44, v49);
  *(_QWORD *)(v48 + 40) = v53;
  v54 = *(_QWORD *)(v3 - 520);
  v55 = *(_QWORD *)(v3 - 528);
  sub_23BCD7DBC();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 408) + 8))(v47, v55);
  v56 = *(_QWORD *)(v3 - 384);
  sub_23BCC13B8(*(_QWORD *)(v3 - 328));
  v57 = *(_QWORD *)(v3 - 376);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 - 608))(v57, v51, v52);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v3 - 280) + 56))(v57, 0, 1, v52);
  v58 = *(_QWORD *)(v3 - 504);
  v59 = *(_QWORD *)(v3 - 488);
  v60 = *(_QWORD *)(v3 - 496);
  sub_23BCD7E40();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 352) + 8))(v57, v60);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v3 - 368) + 8))(v56, *(_QWORD *)(v3 - 360));
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 392) + 8))(v54, v59);
  v61 = *(_QWORD *)(v3 - 544);
  v62 = *(_QWORD *)(v3 - 456);
  v63 = *(_QWORD *)(v3 - 464);
  v64 = *(_QWORD *)(v3 - 288);
  sub_23BCD7DEC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 416) + 8))(v58, v62);
  sub_23BCD7D74();
  *(_QWORD *)(v3 - 160) = v62;
  *(_QWORD *)(v3 - 152) = v52;
  *(_QWORD *)(v3 - 144) = v63;
  *(_QWORD *)(v3 - 136) = v64;
  v65 = swift_getOpaqueTypeConformance2();
  v66 = *(_QWORD *)(v3 - 472);
  v67 = *(_QWORD *)(v3 - 448);
  sub_23BCD7E58();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 424) + 8))(v61, v67);
  v68 = MEMORY[0x24BDECC60];
  *(_QWORD *)(v3 - 176) = v65;
  *(_QWORD *)(v3 - 168) = v68;
  v69 = *(_QWORD *)(v3 - 432);
  MEMORY[0x24260FFB0](MEMORY[0x24BDED308], v69, v3 - 176);
  v70 = *(_QWORD *)(v3 - 440);
  sub_23BCACF3C(v66, v69, v70);
  v71 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 400) + 8);
  v71(v66, v69);
  sub_23BCAC3E8(v70, v69, *(_QWORD *)(v3 - 344));
  return ((uint64_t (*)(uint64_t, uint64_t))v71)(v70, v69);
}

void sub_23BCC3288(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;

  v7 = type metadata accessor for SidebarAction(0, a3, a7, a4);
  MEMORY[0x24BDAC7A8](v7);
  type metadata accessor for SidebarView();
}

uint64_t sub_23BCC3324(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_23BCC1334(a1, a2, a3, a4);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(v7, *(_QWORD *)(v8 - 152), v5);
  sub_23BCD80BC();
  swift_release();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v7, v6);
}

uint64_t sub_23BCC3388@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t);
  uint64_t v15;

  v5 = *(_QWORD *)(a2 - 8);
  v6 = MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)&v15 - v10;
  (*(void (**)(uint64_t))(v9 + 24))(v12);
  sub_23BCACF3C((uint64_t)v8, a2, (uint64_t)v11);
  v13 = *(void (**)(char *, uint64_t))(v5 + 8);
  v13(v8, a2);
  sub_23BCAC3E8((uint64_t)v11, a2, a3);
  return ((uint64_t (*)(char *, uint64_t))v13)(v11, a2);
}

uint64_t sub_23BCC3464@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t);
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, uint64_t);
  uint64_t v36;
  uint64_t OpaqueTypeConformance2;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;

  v49 = a7;
  v55 = a6;
  v44 = a5;
  v39 = a3;
  v47 = a1;
  v54 = a9;
  v45 = a10;
  v14 = sub_23BCD8398();
  MEMORY[0x24260FFB0](MEMORY[0x24BDF5578], v14, &a10);
  v52 = sub_23BCD7F9C();
  v50 = MEMORY[0x24260FFB0](MEMORY[0x24BDF4700], v52);
  v51 = sub_23BCD7A80();
  v53 = *(_QWORD *)(v51 - 8);
  v15 = MEMORY[0x24BDAC7A8](v51);
  v46 = (char *)&OpaqueTypeConformance2 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v48 = (char *)&OpaqueTypeConformance2 - v17;
  v18 = sub_23BCD7C0C();
  MEMORY[0x24BDAC7A8](v18);
  v74 = a4;
  v75 = a8;
  v43 = MEMORY[0x24260FF74](255, &v74, MEMORY[0x24BDF3758], 0);
  v74 = a4;
  v75 = a8;
  v40 = a4;
  v41 = a8;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v19 = sub_23BCD7A80();
  v20 = *(_QWORD *)(v19 - 8);
  v21 = MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&OpaqueTypeConformance2 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)&OpaqueTypeConformance2 - v24;
  v42 = (uint64_t)&OpaqueTypeConformance2 - v24;
  sub_23BCD7BF4();
  v65 = a2;
  v66 = a3;
  v26 = v44;
  v67 = a4;
  v68 = v44;
  v27 = v49;
  v69 = v55;
  v70 = v49;
  v71 = a8;
  v28 = v45;
  v29 = v47;
  v72 = v45;
  v73 = v47;
  sub_23BCD7A74();
  v43 = MEMORY[0x24260FFB0](MEMORY[0x24BDEB848], v19);
  (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v25, v23, v19);
  v30 = *(void (**)(char *, uint64_t))(v20 + 8);
  v30(v23, v19);
  sub_23BCD7C00();
  v56 = a2;
  v57 = v39;
  v58 = v40;
  v59 = v26;
  v60 = v55;
  v61 = v27;
  v62 = v41;
  v63 = v28;
  v64 = v29;
  v31 = v46;
  sub_23BCD7A74();
  v32 = v51;
  MEMORY[0x24260FFB0](MEMORY[0x24BDEB848], v51);
  v33 = v53;
  v34 = (uint64_t)v48;
  (*(void (**)(char *, char *, uint64_t))(v53 + 16))(v48, v31, v32);
  v35 = *(void (**)(char *, uint64_t))(v33 + 8);
  v35(v31, v32);
  v36 = v42;
  sub_23BCC3E14(v42, v34, v19, v32);
  v35((char *)v34, v32);
  return ((uint64_t (*)(uint64_t, uint64_t))v30)(v36, v19);
}

void sub_23BCC387C()
{
  sub_23BCC58A4((void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23BCC3464);
}

void sub_23BCC3888(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  MEMORY[0x24BDAC7A8](a1);
  v22 = v14;
  v23 = v15;
  v16 = MEMORY[0x24260FF74](0, &v22, MEMORY[0x24BDF3758], 0);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v18 = MEMORY[0x24BDAC7A8](v17);
  (*(void (**)(uint64_t))(a1 + 40))(v18);
  v22 = a2;
  v23 = a3;
  v24 = a4;
  v25 = a5;
  v26 = a6;
  v27 = a7;
  v28 = a8;
  v29 = a9;
  type metadata accessor for SidebarView();
}

uint64_t sub_23BCC39A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);

  sub_23BCC1494();
  sub_23BCD7E4C();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 168) + 8))(v5, v2);
  *(_QWORD *)(v6 - 144) = v2;
  *(_QWORD *)(v6 - 136) = v0;
  swift_getOpaqueTypeConformance2();
  sub_23BCACF3C(v4, v1, v3);
  v7 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 160) + 8);
  v7(v4, v1);
  sub_23BCAC3E8(v3, v1, *(_QWORD *)(v6 - 152));
  return ((uint64_t (*)(uint64_t, uint64_t))v7)(v3, v1);
}

uint64_t sub_23BCC3A70@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  void (*v22)(char *, uint64_t);
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

  v27 = a7;
  v28 = a8;
  v25 = a1;
  v26 = a6;
  v29 = a9;
  v24 = a10;
  v14 = sub_23BCD8398();
  MEMORY[0x24260FFB0](MEMORY[0x24BDF5578], v14, &a10);
  v15 = sub_23BCD7F9C();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v24 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v24 - v20;
  v30 = a2;
  v31 = a3;
  v32 = a4;
  v33 = a5;
  v34 = v26;
  v35 = v27;
  v36 = v28;
  v37 = v24;
  v38 = v25;
  sub_23BCD7B70();
  sub_23BCD7F90();
  MEMORY[0x24260FFB0](MEMORY[0x24BDF4700], v15);
  sub_23BCACF3C((uint64_t)v19, v15, (uint64_t)v21);
  v22 = *(void (**)(char *, uint64_t))(v16 + 8);
  v22(v19, v15);
  sub_23BCAC3E8((uint64_t)v21, v15, v29);
  return ((uint64_t (*)(char *, uint64_t))v22)(v21, v15);
}

void sub_23BCC3C00(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = MEMORY[0x24BDAC7A8](a1);
  MEMORY[0x24BDAC7A8](v1);
  v2 = sub_23BCD8398();
  v3 = MEMORY[0x24BDAC7A8](v2);
  MEMORY[0x24BDAC7A8](v3);
  type metadata accessor for SidebarView();
}

uint64_t sub_23BCC3D14()
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
  void (*v11)(uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);

  if ((sub_23BCC14F4() & 1) != 0)
  {
    (*(void (**)(void))(v0 + 56))();
    sub_23BCACF3C(v7, v3, v6);
    v10 = *(_QWORD *)(v9 - 168);
    v11 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
    v11(v7, v3);
    sub_23BCAC3E8(v6, v3, v5);
    v11(v6, v3);
    v12 = 0;
    v13 = v10;
  }
  else
  {
    v12 = 1;
    v13 = *(_QWORD *)(v9 - 168);
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 56))(v5, v12, 1, v3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v4, v5, v2);
  v14 = *(void (**)(uint64_t, uint64_t))(v1 + 8);
  v14(v5, v2);
  *(_QWORD *)(v9 - 152) = v8;
  MEMORY[0x24260FFB0](MEMORY[0x24BDF5578], v2, v9 - 152);
  sub_23BCAC3E8(v4, v2, *(_QWORD *)(v9 - 160));
  return ((uint64_t (*)(uint64_t, uint64_t))v14)(v4, v2);
}

uint64_t sub_23BCC3E14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t TupleTypeMetadata2;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v13;

  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v9 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v11 = (char *)&v13 + *(int *)(v9 + 48) - v10;
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 16))((char *)&v13 - v10, a1, a3);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 16))(v11, a2, a4);
  return sub_23BCD7BC4();
}

uint64_t sub_23BCC3EE8()
{
  sub_23BCD8020();
  sub_23BCD7AC8();
  return swift_release();
}

void sub_23BCC3F68()
{
  type metadata accessor for SidebarView();
}

uint64_t sub_23BCC3FBC()
{
  return sub_23BCC3EE8();
}

uint64_t sub_23BCC4018()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23BCC4058()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_23BCC4060(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  unint64_t v4;
  _QWORD v5[8];

  v5[1] = &unk_23BCDC998;
  v5[2] = MEMORY[0x24BEE4AF0] + 64;
  v5[3] = MEMORY[0x24BEE4AF0] + 64;
  v5[4] = MEMORY[0x24BEE4AF0] + 64;
  v2 = sub_23BCD8398();
  v5[0] = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 24);
  MEMORY[0x24260FFB0](MEMORY[0x24BEE4AB0], v2, v5);
  result = sub_23BCD7A44();
  if (v4 <= 0x3F)
  {
    v5[5] = *(_QWORD *)(result - 8) + 64;
    v5[6] = &unk_23BCDC9B0;
    v5[7] = &unk_23BCDC9C8;
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23BCC4130(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  unint64_t v8;
  size_t v9;
  size_t v10;
  int v11;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  char v19;
  unint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  void *v28;
  const void *v29;
  unsigned int (*v30)(const void *, uint64_t, uint64_t);
  _QWORD *v31;
  _QWORD *v32;
  void *v33;
  const void *v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v40;
  uint64_t v41;
  size_t v42;

  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  v7 = v6;
  v8 = v6 & 0xF8 ^ 0xFFFFFFFFFFFFFFF8;
  if (*(_DWORD *)(v5 + 84))
    v9 = *(_QWORD *)(v5 + 64);
  else
    v9 = *(_QWORD *)(v5 + 64) + 1;
  v10 = v9 + 7;
  v11 = v6 & 0x100000;
  if (v7 > 7
    || v11 != 0
    || (((v8 & (v7 + 72)) + ((v7 + 8 + ((v9 + 7) & 0xFFFFFFFFFFFFFFF8)) & ~v7) + v9 + 31) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    v14 = *(_QWORD *)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    v15 = v14 + (v8 & (v7 + 16));
  }
  else
  {
    v41 = v7 + 8;
    v42 = ((v7 + 8 + ((v9 + 7) & 0xFFFFFFFFFFFFFFF8)) & ~v7) + v9;
    v40 = ~v7;
    v17 = *(_QWORD *)a2;
    v18 = *(_QWORD *)(a2 + 8);
    v19 = *(_BYTE *)(a2 + 16);
    sub_23BCAC8C8();
    *(_QWORD *)a1 = v17;
    *(_QWORD *)(a1 + 8) = v18;
    *(_BYTE *)(a1 + 16) = v19;
    v20 = a1 & 0xFFFFFFFFFFFFFFF8;
    v21 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFFF8) + 32);
    *(_QWORD *)(v20 + 24) = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFFF8) + 24);
    *(_QWORD *)(v20 + 32) = v21;
    v22 = (_QWORD *)(((a1 & 0xFFFFFFFFFFFFFFF8) + 47) & 0xFFFFFFFFFFFFFFF8);
    v23 = (_QWORD *)(((a2 & 0xFFFFFFFFFFFFFFF8) + 47) & 0xFFFFFFFFFFFFFFF8);
    v24 = v23[1];
    *v22 = *v23;
    v22[1] = v24;
    v25 = (_QWORD *)(((unint64_t)v22 + 23) & 0xFFFFFFFFFFFFFFF8);
    v26 = (_QWORD *)(((unint64_t)v23 + 23) & 0xFFFFFFFFFFFFFFF8);
    v27 = v26[1];
    *v25 = *v26;
    v25[1] = v27;
    v28 = (void *)(v8 & ((unint64_t)v25 + 23));
    v29 = (const void *)(v8 & ((unint64_t)v26 + 23));
    v30 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48);
    swift_retain();
    swift_retain();
    swift_retain();
    if (v30(v29, 1, v4))
    {
      memcpy(v28, v29, v9);
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v5 + 16))(v28, v29, v4);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v28, 0, 1, v4);
    }
    v31 = (_QWORD *)(((unint64_t)v28 + v10) & 0xFFFFFFFFFFFFFFF8);
    v32 = (_QWORD *)(((unint64_t)v29 + v10) & 0xFFFFFFFFFFFFFFF8);
    *v31 = *v32;
    v33 = (void *)(((unint64_t)v31 + v41) & v40);
    v34 = (const void *)(((unint64_t)v32 + v41) & v40);
    swift_retain();
    if (v30(v34, 1, v4))
    {
      memcpy(v33, v34, v9);
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v5 + 16))(v33, v34, v4);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v33, 0, 1, v4);
    }
    v35 = ((unint64_t)v28 + v42 + 7) & 0xFFFFFFFFFFFFFFF8;
    v36 = ((unint64_t)v29 + v42 + 7) & 0xFFFFFFFFFFFFFFF8;
    *(_BYTE *)v35 = *(_BYTE *)v36;
    *(_QWORD *)(v35 + 8) = *(_QWORD *)(v36 + 8);
    *(_BYTE *)(v35 + 16) = *(_BYTE *)(v36 + 16);
    v37 = ((unint64_t)v28 + v42 + 31) & 0xFFFFFFFFFFFFFFF8;
    v38 = ((unint64_t)v29 + v42 + 31) & 0xFFFFFFFFFFFFFFF8;
    *(_BYTE *)v37 = *(_BYTE *)v38;
    *(_QWORD *)(v37 + 8) = *(_QWORD *)(v38 + 8);
    swift_retain();
    v15 = a1;
  }
  swift_retain();
  return v15;
}

uint64_t sub_23BCC43D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unsigned int (*v8)(unint64_t, uint64_t, uint64_t);
  uint64_t v9;
  unint64_t v10;

  sub_23BCAC7D0();
  swift_release();
  swift_release();
  swift_release();
  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  v7 = ((((((a1 & 0xFFFFFFFFFFFFFFF8) + 47) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + (v6 | 7) + 16) & ~(v6 | 7);
  v8 = *(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v5 + 48);
  if (!v8(v7, 1, v4))
    (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v7, v4);
  if (*(_DWORD *)(v5 + 84))
    v9 = *(_QWORD *)(v5 + 64);
  else
    v9 = *(_QWORD *)(v5 + 64) + 1;
  swift_release();
  v10 = (v6 + 8 + (((v7 | 7) + v9) & 0xFFFFFFFFFFFFFFF8)) & ~v6;
  if (!v8(v10, 1, v4))
    (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v10, v4);
  swift_release();
  return swift_release();
}

uint64_t sub_23BCC4514(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int (*v23)(const void *, uint64_t, uint64_t);
  int v24;
  size_t v25;
  size_t v26;
  size_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const void *v33;
  size_t v34;
  size_t v35;
  size_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unsigned int (*v42)(const void *, uint64_t, uint64_t);

  v6 = *(_QWORD *)a2;
  v7 = *(_QWORD *)(a2 + 8);
  v8 = *(_BYTE *)(a2 + 16);
  sub_23BCAC8C8();
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  *(_BYTE *)(a1 + 16) = v8;
  v9 = a1 & 0xFFFFFFFFFFFFFFF8;
  v10 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFFF8) + 32);
  *(_QWORD *)(v9 + 24) = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFFF8) + 24);
  *(_QWORD *)(v9 + 32) = v10;
  v11 = (_QWORD *)(((a1 & 0xFFFFFFFFFFFFFFF8) + 47) & 0xFFFFFFFFFFFFFFF8);
  v12 = (_QWORD *)(((a2 & 0xFFFFFFFFFFFFFFF8) + 47) & 0xFFFFFFFFFFFFFFF8);
  v13 = v12[1];
  *v11 = *v12;
  v11[1] = v13;
  v14 = (_QWORD *)(((unint64_t)v11 + 23) & 0xFFFFFFFFFFFFFFF8);
  v15 = (_QWORD *)(((unint64_t)v12 + 23) & 0xFFFFFFFFFFFFFFF8);
  v16 = v15[1];
  *v14 = *v15;
  v14[1] = v16;
  v17 = *(_QWORD *)(a3 + 16);
  v18 = *(_QWORD *)(v17 - 8);
  v19 = *(_DWORD *)(v18 + 80);
  v20 = *(_DWORD *)(v18 + 80) & 0xF8 ^ 0xFFFFFFFFFFFFFFF8;
  v21 = ((unint64_t)v14 + v19 + 16) & v20;
  v22 = ((unint64_t)v15 + v19 + 16) & v20;
  v23 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v18 + 48);
  swift_retain();
  swift_retain();
  swift_retain();
  v42 = v23;
  if (v23((const void *)v22, 1, v17))
  {
    v24 = *(_DWORD *)(v18 + 84);
    v25 = *(_QWORD *)(v18 + 64);
    if (v24)
      v26 = *(_QWORD *)(v18 + 64);
    else
      v26 = v25 + 1;
    memcpy((void *)v21, (const void *)v22, v26);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v21, v22, v17);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v18 + 56))(v21, 0, 1, v17);
    v24 = *(_DWORD *)(v18 + 84);
    v25 = *(_QWORD *)(v18 + 64);
  }
  if (v24)
    v27 = v25;
  else
    v27 = v25 + 1;
  v28 = (_QWORD *)(((v21 | 7) + v27) & 0xFFFFFFFFFFFFFFF8);
  v29 = (_QWORD *)(((v22 | 7) + v27) & 0xFFFFFFFFFFFFFFF8);
  *v28 = *v29;
  v30 = v19 + 8;
  v31 = ~v19;
  v32 = (void *)(((unint64_t)v28 + v19 + 8) & ~v19);
  v33 = (const void *)(((unint64_t)v29 + v19 + 8) & ~v19);
  swift_retain();
  if (v42(v33, 1, v17))
  {
    memcpy(v32, v33, v27);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v18 + 16))(v32, v33, v17);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v32, 0, 1, v17);
  }
  v34 = ((v30 + ((v27 + 7) & 0xFFFFFFFFFFFFFFF8)) & v31) + v27;
  v35 = v34 + v21;
  v36 = v34 + v22;
  v37 = (v35 + 7) & 0xFFFFFFFFFFFFFFF8;
  v38 = (v36 + 7) & 0xFFFFFFFFFFFFFFF8;
  *(_BYTE *)v37 = *(_BYTE *)v38;
  *(_QWORD *)(v37 + 8) = *(_QWORD *)(v38 + 8);
  *(_BYTE *)(v37 + 16) = *(_BYTE *)(v38 + 16);
  v39 = (v35 + 31) & 0xFFFFFFFFFFFFFFF8;
  v40 = (v36 + 31) & 0xFFFFFFFFFFFFFFF8;
  *(_BYTE *)v39 = *(_BYTE *)v40;
  *(_QWORD *)(v39 + 8) = *(_QWORD *)(v40 + 8);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_23BCC4780(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t, uint64_t);
  int v24;
  size_t v25;
  size_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  void *v30;
  const void *v31;
  int v32;
  size_t v33;
  size_t v34;
  size_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v6 = *(_QWORD *)a2;
  v7 = *(_QWORD *)(a2 + 8);
  v8 = *(_BYTE *)(a2 + 16);
  sub_23BCAC8C8();
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  *(_BYTE *)(a1 + 16) = v8;
  sub_23BCAC7D0();
  v9 = a1 & 0xFFFFFFFFFFFFFFF8;
  v10 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFFF8) + 32);
  *(_QWORD *)(v9 + 24) = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFFF8) + 24);
  *(_QWORD *)(v9 + 32) = v10;
  swift_retain();
  swift_release();
  v11 = (_QWORD *)(((a1 & 0xFFFFFFFFFFFFFFF8) + 47) & 0xFFFFFFFFFFFFFFF8);
  v12 = (_QWORD *)(((a2 & 0xFFFFFFFFFFFFFFF8) + 47) & 0xFFFFFFFFFFFFFFF8);
  v13 = v12[1];
  *v11 = *v12;
  v11[1] = v13;
  swift_retain();
  swift_release();
  v14 = (_QWORD *)(((unint64_t)v11 + 23) & 0xFFFFFFFFFFFFFFF8);
  v15 = (_QWORD *)(((unint64_t)v12 + 23) & 0xFFFFFFFFFFFFFFF8);
  v16 = v15[1];
  *v14 = *v15;
  v14[1] = v16;
  swift_retain();
  swift_release();
  v17 = *(_QWORD *)(a3 + 16);
  v18 = *(_QWORD *)(v17 - 8);
  v19 = *(_DWORD *)(v18 + 80);
  v20 = *(_DWORD *)(v18 + 80) & 0xF8 ^ 0xFFFFFFFFFFFFFFF8;
  v21 = ((unint64_t)v14 + v19 + 16) & v20;
  v22 = ((unint64_t)v15 + v19 + 16) & v20;
  v23 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v18 + 48);
  LODWORD(v15) = v23(v21, 1, v17);
  v24 = v23(v22, 1, v17);
  if ((_DWORD)v15)
  {
    if (!v24)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v21, v22, v17);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v18 + 56))(v21, 0, 1, v17);
      goto LABEL_10;
    }
  }
  else
  {
    if (!v24)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 24))(v21, v22, v17);
      goto LABEL_10;
    }
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v21, v17);
  }
  if (*(_DWORD *)(v18 + 84))
    v25 = *(_QWORD *)(v18 + 64);
  else
    v25 = *(_QWORD *)(v18 + 64) + 1;
  memcpy((void *)v21, (const void *)v22, v25);
LABEL_10:
  if (*(_DWORD *)(v18 + 84))
    v26 = *(_QWORD *)(v18 + 64);
  else
    v26 = *(_QWORD *)(v18 + 64) + 1;
  v42 = v22;
  v43 = v21;
  v27 = (_QWORD *)(((v21 | 7) + v26) & 0xFFFFFFFFFFFFFFF8);
  v28 = (_QWORD *)(((v22 | 7) + v26) & 0xFFFFFFFFFFFFFFF8);
  *v27 = *v28;
  swift_retain();
  swift_release();
  v29 = v19 + 8;
  v41 = ~v19;
  v30 = (void *)(((unint64_t)v27 + v19 + 8) & ~v19);
  v31 = (const void *)(((unint64_t)v28 + v19 + 8) & ~v19);
  LODWORD(v27) = v23((uint64_t)v30, 1, v17);
  v32 = v23((uint64_t)v31, 1, v17);
  if (!(_DWORD)v27)
  {
    if (!v32)
    {
      (*(void (**)(void *, const void *, uint64_t))(v18 + 24))(v30, v31, v17);
      goto LABEL_19;
    }
    (*(void (**)(void *, uint64_t))(v18 + 8))(v30, v17);
    goto LABEL_18;
  }
  if (v32)
  {
LABEL_18:
    memcpy(v30, v31, v26);
    goto LABEL_19;
  }
  (*(void (**)(void *, const void *, uint64_t))(v18 + 16))(v30, v31, v17);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v30, 0, 1, v17);
LABEL_19:
  v33 = ((v29 + ((v26 + 7) & 0xFFFFFFFFFFFFFFF8)) & v41) + v26;
  v34 = v33 + v43;
  v35 = v33 + v42;
  v36 = (v33 + v43 + 7) & 0xFFFFFFFFFFFFFFF8;
  v37 = (v33 + v42 + 7) & 0xFFFFFFFFFFFFFFF8;
  *(_BYTE *)v36 = *(_BYTE *)v37;
  *(_QWORD *)(v36 + 8) = *(_QWORD *)(v37 + 8);
  swift_retain();
  swift_release();
  *(_BYTE *)(v36 + 16) = *(_BYTE *)(v37 + 16);
  v38 = (v34 + 31) & 0xFFFFFFFFFFFFFFF8;
  v39 = (v35 + 31) & 0xFFFFFFFFFFFFFFF8;
  *(_BYTE *)v38 = *(_BYTE *)v39;
  *(_QWORD *)(v38 + 8) = *(_QWORD *)(v39 + 8);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_23BCC4AC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _OWORD *v3;
  _OWORD *v4;
  _OWORD *v5;
  _OWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(uint64_t, uint64_t, uint64_t);
  int v14;
  size_t v15;
  size_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const void *v22;
  size_t v23;
  size_t v24;
  size_t v25;
  unint64_t v26;
  unint64_t v27;
  __int128 v28;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_OWORD *)((a1 & 0xFFFFFFFFFFFFFFF8) + 24) = *(_OWORD *)((a2 & 0xFFFFFFFFFFFFFFF8) + 24);
  v3 = (_OWORD *)(((a1 & 0xFFFFFFFFFFFFFFF8) + 47) & 0xFFFFFFFFFFFFF8);
  v4 = (_OWORD *)(((a2 & 0xFFFFFFFFFFFFFFF8) + 47) & 0xFFFFFFFFFFFFF8);
  *v3 = *v4;
  v5 = (_OWORD *)(((unint64_t)v3 + 23) & 0xFFFFFFFFFFFFFFF8);
  v6 = (_OWORD *)(((unint64_t)v4 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v5 = *v6;
  v7 = *(_QWORD *)(a3 + 16);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_DWORD *)(v8 + 80);
  v10 = *(_DWORD *)(v8 + 80) & 0xF8 ^ 0xFFFFFFFFFFFFFFF8;
  v11 = ((unint64_t)v5 + v9 + 16) & v10;
  v12 = ((unint64_t)v6 + v9 + 16) & v10;
  v13 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
  if (v13(v12, 1, v7))
  {
    v14 = *(_DWORD *)(v8 + 84);
    v15 = *(_QWORD *)(v8 + 64);
    if (v14)
      v16 = *(_QWORD *)(v8 + 64);
    else
      v16 = v15 + 1;
    memcpy((void *)v11, (const void *)v12, v16);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v11, v12, v7);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v8 + 56))(v11, 0, 1, v7);
    v14 = *(_DWORD *)(v8 + 84);
    v15 = *(_QWORD *)(v8 + 64);
  }
  if (!v14)
    ++v15;
  v17 = (_QWORD *)(((v11 | 7) + v15) & 0xFFFFFFFFFFFFFFF8);
  v18 = (_QWORD *)(((v12 | 7) + v15) & 0xFFFFFFFFFFFFFFF8);
  *v17 = *v18;
  v19 = v9 + 8;
  v20 = ~v9;
  v21 = (void *)(((unint64_t)v17 + v9 + 8) & ~v9);
  v22 = (const void *)(((unint64_t)v18 + v9 + 8) & ~v9);
  if (v13((uint64_t)v22, 1, v7))
  {
    memcpy(v21, v22, v15);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v8 + 32))(v21, v22, v7);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v21, 0, 1, v7);
  }
  v23 = ((v19 + ((v15 + 7) & 0xFFFFFFFFFFFFFFF8)) & v20) + v15;
  v24 = v23 + v11;
  v25 = v23 + v12;
  v26 = (v24 + 7) & 0xFFFFFFFFFFFFFFF8;
  v27 = (v25 + 7) & 0xFFFFFFFFFFFFFFF8;
  v28 = *(_OWORD *)v27;
  *(_BYTE *)(v26 + 16) = *(_BYTE *)(v27 + 16);
  *(_OWORD *)v26 = v28;
  *(_OWORD *)((v24 + 31) & 0xFFFFFFFFFFFFF8) = *(_OWORD *)((v25 + 31) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_23BCC4CD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  char v6;
  _OWORD *v7;
  _OWORD *v8;
  _OWORD *v9;
  _OWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t, uint64_t);
  int v18;
  size_t v19;
  size_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  void *v24;
  const void *v25;
  int v26;
  size_t v27;
  size_t v28;
  size_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v35;
  uint64_t v36;

  v4 = a2;
  v6 = *(_BYTE *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v6;
  sub_23BCAC7D0();
  v4 &= 0xFFFFFFFFFFFFFFF8;
  *(_OWORD *)((a1 & 0xFFFFFFFFFFFFFFF8) + 24) = *(_OWORD *)(v4 + 24);
  swift_release();
  v7 = (_OWORD *)(((a1 & 0xFFFFFFFFFFFFFFF8) + 47) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_OWORD *)((v4 + 47) & 0xFFFFFFFFFFFFF8);
  *v7 = *v8;
  swift_release();
  v9 = (_OWORD *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8);
  v10 = (_OWORD *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v9 = *v10;
  swift_release();
  v11 = *(_QWORD *)(a3 + 16);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_DWORD *)(v12 + 80);
  v14 = *(_DWORD *)(v12 + 80) & 0xF8 ^ 0xFFFFFFFFFFFFFFF8;
  v15 = ((unint64_t)v9 + v13 + 16) & v14;
  v16 = ((unint64_t)v10 + v13 + 16) & v14;
  v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  LODWORD(v9) = v17(v15, 1, v11);
  v18 = v17(v16, 1, v11);
  if ((_DWORD)v9)
  {
    if (!v18)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 32))(v15, v16, v11);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v12 + 56))(v15, 0, 1, v11);
      goto LABEL_10;
    }
  }
  else
  {
    if (!v18)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 40))(v15, v16, v11);
      goto LABEL_10;
    }
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v15, v11);
  }
  if (*(_DWORD *)(v12 + 84))
    v19 = *(_QWORD *)(v12 + 64);
  else
    v19 = *(_QWORD *)(v12 + 64) + 1;
  memcpy((void *)v15, (const void *)v16, v19);
LABEL_10:
  if (*(_DWORD *)(v12 + 84))
    v20 = *(_QWORD *)(v12 + 64);
  else
    v20 = *(_QWORD *)(v12 + 64) + 1;
  v21 = (_QWORD *)(((v15 | 7) + v20) & 0xFFFFFFFFFFFFFFF8);
  v36 = v16;
  v22 = (_QWORD *)(((v16 | 7) + v20) & 0xFFFFFFFFFFFFFFF8);
  *v21 = *v22;
  swift_release();
  v23 = v13 + 8;
  v35 = ~v13;
  v24 = (void *)(((unint64_t)v21 + v13 + 8) & ~v13);
  v25 = (const void *)(((unint64_t)v22 + v13 + 8) & ~v13);
  LODWORD(v22) = v17((uint64_t)v24, 1, v11);
  v26 = v17((uint64_t)v25, 1, v11);
  if (!(_DWORD)v22)
  {
    if (!v26)
    {
      (*(void (**)(void *, const void *, uint64_t))(v12 + 40))(v24, v25, v11);
      goto LABEL_19;
    }
    (*(void (**)(void *, uint64_t))(v12 + 8))(v24, v11);
    goto LABEL_18;
  }
  if (v26)
  {
LABEL_18:
    memcpy(v24, v25, v20);
    goto LABEL_19;
  }
  (*(void (**)(void *, const void *, uint64_t))(v12 + 32))(v24, v25, v11);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v24, 0, 1, v11);
LABEL_19:
  v27 = ((v23 + ((v20 + 7) & 0xFFFFFFFFFFFFFFF8)) & v35) + v20;
  v28 = v27 + v15;
  v29 = v27 + v36;
  v30 = (v28 + 7) & 0xFFFFFFFFFFFFFFF8;
  v31 = (v27 + v36 + 7) & 0xFFFFFFFFFFFFFFF8;
  *(_BYTE *)v30 = *(_BYTE *)v31;
  *(_QWORD *)(v30 + 8) = *(_QWORD *)(v31 + 8);
  swift_release();
  *(_BYTE *)(v30 + 16) = *(_BYTE *)(v31 + 16);
  v32 = (v28 + 31) & 0xFFFFFFFFFFFFFFF8;
  v33 = (v29 + 31) & 0xFFFFFFFFFFFFFFF8;
  *(_BYTE *)v32 = *(_BYTE *)v33;
  *(_QWORD *)(v32 + 8) = *(_QWORD *)(v33 + 8);
  swift_release();
  return a1;
}

uint64_t sub_23BCC4FDC(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  unint64_t v15;
  unint64_t v16;
  unsigned int v17;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5)
    v6 = v5 - 1;
  else
    v6 = 0;
  if (v6 <= 0x7FFFFFFF)
    v7 = 0x7FFFFFFF;
  else
    v7 = v6;
  if (v5)
    v8 = *(_QWORD *)(v4 + 64);
  else
    v8 = *(_QWORD *)(v4 + 64) + 1;
  if (!a2)
    return 0;
  v9 = *(unsigned __int8 *)(v4 + 80);
  v10 = v9 | 7;
  if (v7 < a2)
  {
    if ((((((_DWORD)v8
           + (((_DWORD)v9 + 72) & ~(_DWORD)v10)
           + (((_DWORD)v9 + (((_DWORD)v8 + 7) & 0xFFFFFFF8) + 8) & ~(_DWORD)v9)
           + 31) & 0xFFFFFFF8)
         + 16) & 0xFFFFFFF8) != 0)
      v11 = 2;
    else
      v11 = a2 - v7 + 1;
    if (v11 >= 0x10000)
      v12 = 4;
    else
      v12 = 2;
    if (v11 < 0x100)
      v12 = 1;
    if (v11 >= 2)
      v13 = v12;
    else
      v13 = 0;
    __asm { BR              X16 }
  }
  v15 = a1 & 0xFFFFFFFFFFFFFFF8;
  if ((v6 & 0x80000000) != 0)
  {
    v17 = (*(uint64_t (**)(unint64_t))(v4 + 48))((((((v15 + 47) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
                                                                 + v10
                                                                 + 16) & ~v10);
    if (v17 >= 2)
      return v17 - 1;
    else
      return 0;
  }
  else
  {
    v16 = *(_QWORD *)(v15 + 24);
    if (v16 >= 0xFFFFFFFF)
      LODWORD(v16) = -1;
    return (v16 + 1);
  }
}

void sub_23BCC5150(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  int v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  unsigned int v15;

  v6 = 0;
  v7 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v8 = *(_DWORD *)(v7 + 84);
  if (v8)
    v9 = v8 - 1;
  else
    v9 = 0;
  if (v9 <= 0x7FFFFFFF)
    v10 = 0x7FFFFFFF;
  else
    v10 = v9;
  v11 = *(_QWORD *)(v7 + 64);
  if (!v8)
    ++v11;
  if (v10 < a3)
  {
    v12 = a3 - v10;
    if ((((_DWORD)v11
         + ((*(unsigned __int8 *)(v7 + 80) + 72) & ~(*(unsigned __int8 *)(v7 + 80) | 7))
         + ((*(unsigned __int8 *)(v7 + 80) + (((_DWORD)v11 + 7) & 0xFFFFFFF8) + 8) & ~*(unsigned __int8 *)(v7 + 80))
         + 31) & 0xFFFFFFF8) == 0xFFFFFFF0)
      v13 = v12 + 1;
    else
      v13 = 2;
    if (v13 >= 0x10000)
      v14 = 4;
    else
      v14 = 2;
    if (v13 < 0x100)
      v14 = 1;
    if (v13 >= 2)
      v6 = v14;
    else
      v6 = 0;
  }
  if (a2 > v10)
  {
    if ((((_DWORD)v11
         + ((*(unsigned __int8 *)(v7 + 80) + 72) & ~(*(unsigned __int8 *)(v7 + 80) | 7))
         + ((*(unsigned __int8 *)(v7 + 80) + (((_DWORD)v11 + 7) & 0xFFFFFFF8) + 8) & ~*(unsigned __int8 *)(v7 + 80))
         + 31) & 0xFFFFFFF8) != 0xFFFFFFF0)
    {
      v15 = ~v10 + a2;
      bzero(a1, ((v11+ ((*(unsigned __int8 *)(v7 + 80) + 72) & ~(*(unsigned __int8 *)(v7 + 80) | 7))+ ((*(unsigned __int8 *)(v7 + 80) + ((v11 + 7) & 0xFFFFFFFFFFFFFFF8) + 8) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ 31) & 0xFFFFFFFFFFFFFFF8)+ 16);
      *a1 = v15;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X15 }
}

uint64_t sub_23BCC5278@<X0>(unsigned int a1@<W1>, size_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t result;

  *(_BYTE *)(v14 + v15) = 0;
  if (a1)
  {
    v16 = v14 & 0xFFFFFFFFFFFFFFF8;
    if ((v11 & 0x80000000) != 0)
    {
      if (v11 >= a1)
      {
        return (*(uint64_t (**)(unint64_t, _QWORD))(v12 + 56))((((((v16 + 47) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + v13 + 16) & v10, a1 + 1);
      }
      else if ((_DWORD)a2)
      {
        if (a2 <= 3)
          v18 = a2;
        else
          v18 = 4;
        bzero((void *)((((((v16 + 47) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + v13 + 16) & v10), a2);
        __asm { BR              X10 }
      }
    }
    else
    {
      if ((a1 & 0x80000000) != 0)
      {
        v17 = a1 ^ 0x80000000;
        *(_QWORD *)(v16 + 32) = 0;
      }
      else
      {
        v17 = a1 - 1;
      }
      *(_QWORD *)(v16 + 24) = v17;
    }
  }
  return result;
}

void sub_23BCC5380()
{
  _WORD *v0;
  __int16 v1;

  *v0 = v1;
}

void sub_23BCC5388()
{
  uint64_t v0;
  int v1;

  *(_WORD *)v0 = v1;
  *(_BYTE *)(v0 + 2) = BYTE2(v1);
}

void sub_23BCC5398()
{
  _DWORD *v0;
  int v1;

  *v0 = v1;
}

uint64_t sub_23BCC53A4(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t OpaqueTypeConformance2;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t AssociatedConformanceWitness;
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
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[2];
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v1 = *a1;
  v2 = a1[4];
  v34 = a1[6];
  v35 = a1[2];
  v36 = a1[7];
  v32 = sub_23BCD8200();
  v3 = v2;
  v33 = v2;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = sub_23BCD7F84();
  v6 = MEMORY[0x24260FFB0](MEMORY[0x24BDF43B0], v5);
  v40 = v5;
  v41 = v6;
  v7 = MEMORY[0x24260FF74](255, &v40, MEMORY[0x24BE37C20], 0);
  v8 = sub_23BCD8398();
  v40 = v5;
  v41 = v6;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v45 = *(_QWORD *)(v3 + 24);
  v10 = v45;
  v11 = MEMORY[0x24260FFB0](MEMORY[0x24BEE4AB0], v8, &v45);
  v40 = v7;
  v41 = v8;
  v42 = OpaqueTypeConformance2;
  v43 = v11;
  v12 = MEMORY[0x24260FF74](255, &v40, MEMORY[0x24BDF3748], 0);
  v40 = v7;
  v41 = v8;
  v42 = OpaqueTypeConformance2;
  v43 = v11;
  v13 = swift_getOpaqueTypeConformance2();
  v40 = v12;
  v41 = v1;
  v42 = v13;
  v43 = v10;
  MEMORY[0x24260FF74](255, &v40, MEMORY[0x24BDF2230], 0);
  v14 = sub_23BCD7B04();
  v15 = MEMORY[0x24260FFB0](MEMORY[0x24BEE12D8], v32);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v40 = v32;
  v41 = AssociatedTypeWitness;
  v42 = v14;
  v43 = v15;
  v44 = AssociatedConformanceWitness;
  v17 = sub_23BCD7FE4();
  v40 = v12;
  v41 = v1;
  v42 = v13;
  v43 = v10;
  v39[0] = swift_getOpaqueTypeConformance2();
  v39[1] = MEMORY[0x24BDECC60];
  v38 = MEMORY[0x24260FFB0](MEMORY[0x24BDED308], v14, v39);
  MEMORY[0x24260FFB0](MEMORY[0x24BDF4A08], v17, &v38);
  v18 = sub_23BCD7F9C();
  v19 = MEMORY[0x24260FFB0](MEMORY[0x24BDF4700], v18);
  v40 = v18;
  v41 = v8;
  v42 = v19;
  v43 = v11;
  v20 = MEMORY[0x24260FF74](255, &v40, MEMORY[0x24BDF24C8], 0);
  v40 = v18;
  v41 = v8;
  v42 = v19;
  v43 = v11;
  v21 = swift_getOpaqueTypeConformance2();
  v22 = *(_QWORD *)(v33 + 40);
  v40 = v20;
  v41 = v1;
  v42 = v21;
  v43 = v22;
  v23 = MEMORY[0x24260FF74](255, &v40, MEMORY[0x24BDF2D68], 0);
  v40 = v35;
  v41 = v34;
  MEMORY[0x24260FF74](255, &v40, MEMORY[0x24BDF3758], 0);
  v40 = v35;
  v41 = v34;
  swift_getOpaqueTypeConformance2();
  sub_23BCD7A80();
  v24 = sub_23BCD8398();
  v37 = v36;
  MEMORY[0x24260FFB0](MEMORY[0x24BDF5578], v24, &v37);
  v25 = sub_23BCD7F9C();
  MEMORY[0x24260FFB0](MEMORY[0x24BDF4700], v25);
  sub_23BCD7A80();
  swift_getTupleTypeMetadata2();
  v26 = sub_23BCD7BB8();
  v40 = v20;
  v41 = v1;
  v42 = v21;
  v43 = v22;
  v27 = swift_getOpaqueTypeConformance2();
  v28 = MEMORY[0x24260FFB0](MEMORY[0x24BDEF170], v26);
  v40 = v23;
  v41 = v26;
  v42 = v27;
  v43 = v28;
  v29 = MEMORY[0x24260FF74](255, &v40, MEMORY[0x24BDF3858], 0);
  v40 = v23;
  v41 = v26;
  v42 = v27;
  v43 = v28;
  v30 = swift_getOpaqueTypeConformance2();
  v40 = v29;
  v41 = MEMORY[0x24BEE1328];
  v42 = v30;
  v43 = MEMORY[0x24BEE1340];
  return swift_getOpaqueTypeConformance2();
}

void sub_23BCC5818()
{
  type metadata accessor for SidebarView();
}

uint64_t sub_23BCC5854()
{
  return sub_23BCC1548();
}

void sub_23BCC5880()
{
  sub_23BCC58A4((void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23BCC3888);
}

void sub_23BCC588C()
{
  sub_23BCC58A4((void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23BCC3A70);
}

void sub_23BCC5898()
{
  sub_23BCC58A4((void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23BCC3C00);
}

void sub_23BCC58A4(void (*a1)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v1;

  a1(v1[10], v1[2], v1[3], v1[4], v1[5], v1[6], v1[7], v1[8], v1[9]);
  JUMPOUT(0x23BCC58D0);
}

uint64_t sub_23BCC58DC()
{
  return swift_deallocObject();
}

uint64_t sub_23BCC58EC()
{
  return sub_23BCC1624();
}

void objectdestroy_2Tm()
{
  type metadata accessor for SidebarView();
}

uint64_t sub_23BCC5944(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = v1
     + ((*(unsigned __int8 *)(*(_QWORD *)(a1 - 8) + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(a1 - 8) + 80));
  sub_23BCAC7D0();
  swift_release();
  swift_release();
  swift_release();
  v4 = v3 + *(int *)(a1 + 96);
  v5 = *(_QWORD *)(v11 - 8);
  v6 = *(unsigned int (**)(uint64_t, uint64_t))(v5 + 48);
  if (!v6(v4, 1))
    (*(void (**)(uint64_t))(v5 + 8))(v4);
  v7 = sub_23BCD8398();
  v13 = *(_QWORD *)(v12 + 24);
  MEMORY[0x24260FFB0](MEMORY[0x24BEE4AB0], v7, &v13);
  v8 = sub_23BCD7A44();
  swift_release();
  v9 = v4 + *(int *)(v8 + 40);
  if (!v6(v9, 1))
    (*(void (**)(uint64_t))(v5 + 8))(v9);
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_23BCC5AA0()
{
  type metadata accessor for SidebarView();
}

#error "23BCC5B2C: call analysis failed (funcsize=15)"

void sub_23BCC5B50()
{
  type metadata accessor for SidebarView();
}

uint64_t sub_23BCC5B94(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unsigned int (*v8)(unint64_t, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;

  v3 = *(_QWORD *)(a1 - 8);
  v4 = v15;
  v5 = *(_QWORD *)(v15 - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  v14 = *(_QWORD *)(v3 + 64);
  v16 = (*(unsigned __int8 *)(v3 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  sub_23BCAC7D0();
  swift_release();
  swift_release();
  swift_release();
  v7 = v1 + v16 + *(int *)(a1 + 96);
  v8 = *(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v5 + 48);
  if (!v8(v7, 1, v4))
    (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v7, v4);
  v9 = sub_23BCD8398();
  v17 = *(_QWORD *)(v13 + 24);
  MEMORY[0x24260FFB0](MEMORY[0x24BEE4AB0], v9, &v17);
  v10 = sub_23BCD7A44();
  swift_release();
  v11 = v7 + *(int *)(v10 + 40);
  if (!v8(v11, 1, v4))
    (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v11, v4);
  swift_release();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v1 + ((v16 + v14 + v6) & ~v6), v4);
  return swift_deallocObject();
}

void sub_23BCC5D20()
{
  type metadata accessor for SidebarView();
}

void sub_23BCC5D6C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v7 = *(_QWORD *)(a1 - 8);
  v8 = (*(unsigned __int8 *)(v7 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v9 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  sub_23BCC3288(v2 + v8, v2 + ((v8 + *(_QWORD *)(v7 + 64) + v9) & ~v9), v1, v3, v4, v5, v6);
}

uint64_t sub_23BCC5DDC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23BCC3388(*(_QWORD *)(v1 + 80), *(_QWORD *)(v1 + 24), a1);
}

uint64_t SignOutState.accountState.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23BCA8DD0(v1, a1, (uint64_t (*)(_QWORD))type metadata accessor for AccountState);
}

uint64_t SignOutState.accountState.setter(uint64_t a1)
{
  uint64_t v1;

  return sub_23BCABE28(a1, v1);
}

uint64_t (*SignOutState.accountState.modify())()
{
  return nullsub_1;
}

uint64_t SignOutState.isSidebarVisible.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for SignOutState() + 20));
}

uint64_t type metadata accessor for SignOutState()
{
  uint64_t result;

  result = qword_256A967B0;
  if (!qword_256A967B0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t SignOutState.isSidebarVisible.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for SignOutState();
  *(_BYTE *)(v1 + *(int *)(result + 20)) = a1;
  return result;
}

uint64_t (*SignOutState.isSidebarVisible.modify())(_QWORD, _QWORD, _QWORD)
{
  type metadata accessor for SignOutState();
  return nullsub_1;
}

uint64_t SignOutState.init(accountState:isSidebarVisible:locale:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  sub_23BC9C5E0(a1, a4);
  v7 = type metadata accessor for SignOutState();
  *(_BYTE *)(a4 + *(int *)(v7 + 20)) = a2;
  v8 = a4 + *(int *)(v7 + 24);
  v9 = sub_23BCD7984();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8, a3, v9);
}

uint64_t SignOutState.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t (*v9)(_QWORD);
  int EnumCaseMultiPayload;
  uint64_t v12;

  v1 = v0;
  v2 = sub_23BCD793C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for AccountState();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23BCA8DD0(v1, (uint64_t)v8, v9);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      sub_23BCD85CC();
      sub_23BCD817C();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_23BCD85CC();
    }
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v8, v2);
    sub_23BCD85CC();
    sub_23BC9B4D8(&qword_256A94A98, (uint64_t (*)(uint64_t))MEMORY[0x24BDCCC10], MEMORY[0x24BDCCC28]);
    sub_23BCD8110();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  type metadata accessor for SignOutState();
  sub_23BCD85D8();
  sub_23BCD7984();
  sub_23BC9B4D8(&qword_256A96738, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], MEMORY[0x24BDCEED0]);
  return sub_23BCD8110();
}

uint64_t static SignOutState.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if ((_s14FitnessAppRoot12AccountStateO2eeoiySbAC_ACtFZ_0(a1, a2) & 1) != 0)
  {
    v4 = type metadata accessor for SignOutState();
    if (*(unsigned __int8 *)(a1 + *(int *)(v4 + 20)) == *(unsigned __int8 *)(a2 + *(int *)(v4 + 20)))
      JUMPOUT(0x24260EEA0);
  }
  return 0;
}

uint64_t sub_23BCC6194()
{
  _BYTE *v0;
  unint64_t v1;

  v1 = 0xD000000000000010;
  if (*v0 != 1)
    v1 = 0x656C61636F6CLL;
  if (*v0)
    return v1;
  else
    return 0x53746E756F636361;
}

uint64_t sub_23BCC61F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23BCC71D8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23BCC621C()
{
  sub_23BCC687C();
  return sub_23BCD8614();
}

uint64_t sub_23BCC6244()
{
  sub_23BCC687C();
  return sub_23BCD8620();
}

uint64_t SignOutState.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A96740);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23BCC687C();
  sub_23BCD8608();
  v8[15] = 0;
  type metadata accessor for AccountState();
  sub_23BC9B4D8(&qword_256A94DD0, (uint64_t (*)(uint64_t))type metadata accessor for AccountState, (uint64_t)&protocol conformance descriptor for AccountState);
  sub_23BCD8584();
  if (!v1)
  {
    type metadata accessor for SignOutState();
    v8[14] = 1;
    sub_23BCD856C();
    v8[13] = 2;
    sub_23BCD7984();
    sub_23BC9B4D8(&qword_256A94CC0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], MEMORY[0x24BDCEEC8]);
    sub_23BCD8584();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t SignOutState.hashValue.getter()
{
  sub_23BCD85C0();
  SignOutState.hash(into:)();
  return sub_23BCD85F0();
}

uint64_t SignOutState.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  char v26;
  char v27;
  char v28;

  v20 = a2;
  v21 = sub_23BCD7984();
  v19 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = type metadata accessor for AccountState();
  MEMORY[0x24BDAC7A8](v22);
  v23 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A96750);
  v6 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for SignOutState();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23BCC687C();
  sub_23BCD85FC();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v12 = v6;
  v28 = 0;
  sub_23BC9B4D8(&qword_256A94E10, (uint64_t (*)(uint64_t))type metadata accessor for AccountState, (uint64_t)&protocol conformance descriptor for AccountState);
  v13 = (uint64_t)v23;
  sub_23BCD8530();
  sub_23BC9C5E0(v13, (uint64_t)v11);
  v27 = 1;
  v11[*(int *)(v9 + 20)] = sub_23BCD8518() & 1;
  v26 = 2;
  sub_23BC9B4D8(&qword_256A94CD8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], MEMORY[0x24BDCEEE8]);
  v14 = (uint64_t)v11;
  v15 = v21;
  v16 = v25;
  sub_23BCD8530();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v8, v16);
  (*(void (**)(uint64_t, char *, uint64_t))(v19 + 32))(v14 + *(int *)(v9 + 24), v24, v15);
  sub_23BCA8DD0(v14, v20, (uint64_t (*)(_QWORD))type metadata accessor for SignOutState);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_23BCAC3AC(v14, (uint64_t (*)(_QWORD))type metadata accessor for SignOutState);
}

uint64_t sub_23BCC6774@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return SignOutState.init(from:)(a1, a2);
}

uint64_t sub_23BCC6788(_QWORD *a1)
{
  return SignOutState.encode(to:)(a1);
}

uint64_t sub_23BCC679C()
{
  sub_23BCD85C0();
  SignOutState.hash(into:)();
  return sub_23BCD85F0();
}

uint64_t sub_23BCC67DC()
{
  sub_23BCD85C0();
  SignOutState.hash(into:)();
  return sub_23BCD85F0();
}

uint64_t sub_23BCC6814(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((_s14FitnessAppRoot12AccountStateO2eeoiySbAC_ACtFZ_0(a1, a2) & 1) != 0
    && *(unsigned __int8 *)(a1 + *(int *)(a3 + 20)) == *(unsigned __int8 *)(a2 + *(int *)(a3 + 20)))
  {
    JUMPOUT(0x24260EEA0);
  }
  return 0;
}

unint64_t sub_23BCC687C()
{
  unint64_t result;

  result = qword_256A96748;
  if (!qword_256A96748)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDCBFC, &type metadata for SignOutState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A96748);
  }
  return result;
}

uint64_t sub_23BCC68C0()
{
  return sub_23BC9B4D8(&qword_256A955C8, (uint64_t (*)(uint64_t))type metadata accessor for SignOutState, (uint64_t)&protocol conformance descriptor for SignOutState);
}

uint64_t *initializeBufferWithCopyOfBuffer for SignOutState(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  int EnumCaseMultiPayload;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = type metadata accessor for AccountState();
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      v11 = a2[1];
      *a1 = *a2;
      a1[1] = v11;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
    }
    else
    {
      v9 = sub_23BCD793C();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(a1, a2, v9);
      swift_storeEnumTagMultiPayload();
    }
    v12 = *(int *)(a3 + 24);
    *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
    v13 = (char *)a1 + v12;
    v14 = (char *)a2 + v12;
    v15 = sub_23BCD7984();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
  }
  return a1;
}

uint64_t destroy for SignOutState(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  type metadata accessor for AccountState();
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    swift_bridgeObjectRelease();
  }
  else if (!EnumCaseMultiPayload)
  {
    v5 = sub_23BCD793C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  }
  v6 = a1 + *(int *)(a2 + 24);
  v7 = sub_23BCD7984();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
}

_QWORD *initializeWithCopy for SignOutState(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;

  v6 = type metadata accessor for AccountState();
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    v9 = a2[1];
    *a1 = *a2;
    a1[1] = v9;
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  else
  {
    v8 = sub_23BCD793C();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
    swift_storeEnumTagMultiPayload();
  }
  v10 = *(int *)(a3 + 24);
  *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = sub_23BCD7984();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
  return a1;
}

_QWORD *assignWithCopy for SignOutState(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  if (a1 != a2)
  {
    sub_23BCAC3AC((uint64_t)a1, (uint64_t (*)(_QWORD))type metadata accessor for AccountState);
    v6 = type metadata accessor for AccountState();
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
    else
    {
      v8 = sub_23BCD793C();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
    }
  }
  *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
  v9 = *(int *)(a3 + 24);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_23BCD7984();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

char *initializeWithTake for SignOutState(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;

  v6 = type metadata accessor for AccountState();
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  else
  {
    v7 = sub_23BCD793C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  v8 = *(int *)(a3 + 24);
  a1[*(int *)(a3 + 20)] = a2[*(int *)(a3 + 20)];
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = sub_23BCD7984();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
  return a1;
}

char *assignWithTake for SignOutState(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;

  if (a1 != a2)
  {
    sub_23BCAC3AC((uint64_t)a1, (uint64_t (*)(_QWORD))type metadata accessor for AccountState);
    v6 = type metadata accessor for AccountState();
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
    else
    {
      v7 = sub_23BCD793C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
  }
  v8 = *(int *)(a3 + 24);
  a1[*(int *)(a3 + 20)] = a2[*(int *)(a3 + 20)];
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = sub_23BCD7984();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for SignOutState()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23BCC6E48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  unsigned int v11;

  v6 = type metadata accessor for AccountState();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  if ((_DWORD)a2 != 254)
  {
    v8 = sub_23BCD7984();
    v10 = a1 + *(int *)(a3 + 24);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
    return v9(v10, a2, v8);
  }
  v11 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
  if (v11 >= 2)
    return ((v11 + 2147483646) & 0x7FFFFFFF) + 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SignOutState()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23BCC6F08(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  result = type metadata accessor for AccountState();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    if (a3 == 254)
    {
      *(_BYTE *)(a1 + *(int *)(a4 + 20)) = a2 + 1;
      return result;
    }
    v10 = sub_23BCD7984();
    v12 = a1 + *(int *)(a4 + 24);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t sub_23BCC6FA8()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = type metadata accessor for AccountState();
  if (v1 <= 0x3F)
  {
    result = sub_23BCD7984();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for SignOutState.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23BCC7080 + 4 * byte_23BCDCA35[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23BCC70B4 + 4 * byte_23BCDCA30[v4]))();
}

uint64_t sub_23BCC70B4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BCC70BC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23BCC70C4);
  return result;
}

uint64_t sub_23BCC70D0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23BCC70D8);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23BCC70DC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BCC70E4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SignOutState.CodingKeys()
{
  return &type metadata for SignOutState.CodingKeys;
}

unint64_t sub_23BCC7104()
{
  unint64_t result;

  result = qword_256A967F0;
  if (!qword_256A967F0)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDCBD4, &type metadata for SignOutState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A967F0);
  }
  return result;
}

unint64_t sub_23BCC714C()
{
  unint64_t result;

  result = qword_256A967F8;
  if (!qword_256A967F8)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDCB44, &type metadata for SignOutState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A967F8);
  }
  return result;
}

unint64_t sub_23BCC7194()
{
  unint64_t result;

  result = qword_256A96800;
  if (!qword_256A96800)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDCB6C, &type metadata for SignOutState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A96800);
  }
  return result;
}

uint64_t sub_23BCC71D8(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x53746E756F636361 && a2 == 0xEC00000065746174;
  if (v2 || (sub_23BCD85A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000023BCE5730 || (sub_23BCD85A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x656C61636F6CLL && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_23BCD85A8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_23BCC7334()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000018;
  else
    return 0x6570704177656976;
}

uint64_t sub_23BCC737C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23BCC8174(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23BCC73A0()
{
  sub_23BCC7754();
  return sub_23BCD8614();
}

uint64_t sub_23BCC73C8()
{
  sub_23BCC7754();
  return sub_23BCD8620();
}

uint64_t sub_23BCC73F0()
{
  return 0x656E696C66666FLL;
}

uint64_t sub_23BCC7408@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x656E696C66666FLL && a2 == 0xE700000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_23BCD85A8();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_23BCC749C()
{
  sub_23BCC7798();
  return sub_23BCD8614();
}

uint64_t sub_23BCC74C4()
{
  sub_23BCC7798();
  return sub_23BCD8620();
}

uint64_t sub_23BCC74EC()
{
  sub_23BCC77DC();
  return sub_23BCD8614();
}

uint64_t sub_23BCC7514()
{
  sub_23BCC77DC();
  return sub_23BCD8620();
}

uint64_t DynamicContentAction.encode(to:)(_QWORD *a1)
{
  unsigned __int8 *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A96808);
  v17 = *(_QWORD *)(v3 - 8);
  v18 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A96810);
  v15 = *(_QWORD *)(v6 - 8);
  v16 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A96818);
  v19 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23BCC7754();
  sub_23BCD8608();
  if (v12 == 2)
  {
    v20 = 0;
    sub_23BCC77DC();
    sub_23BCD8554();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v8, v16);
  }
  else
  {
    v21 = 1;
    sub_23BCC7798();
    sub_23BCD8554();
    v14 = v18;
    sub_23BCD856C();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v5, v14);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v11, v9);
}

unint64_t sub_23BCC7754()
{
  unint64_t result;

  result = qword_256A96820;
  if (!qword_256A96820)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDCFA4, &type metadata for DynamicContentAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A96820);
  }
  return result;
}

unint64_t sub_23BCC7798()
{
  unint64_t result;

  result = qword_256A96828;
  if (!qword_256A96828)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDCF54, &type metadata for DynamicContentAction.NetworkConditionsUpdatedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A96828);
  }
  return result;
}

unint64_t sub_23BCC77DC()
{
  unint64_t result;

  result = qword_256A96830;
  if (!qword_256A96830)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDCF04, &type metadata for DynamicContentAction.ViewAppearedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A96830);
  }
  return result;
}

uint64_t DynamicContentAction.init(from:)@<X0>(_QWORD *a1@<X0>, char *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  char *v23;
  uint64_t v24;
  char v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  char *v34;
  _QWORD *v35;
  char v36;
  char v37;

  v31 = a2;
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A96838);
  v30 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v32 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A96840);
  v4 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A96848);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23BCC7754();
  v34 = v10;
  v11 = v35;
  sub_23BCD85FC();
  if (v11)
    goto LABEL_6;
  v12 = v4;
  v14 = v32;
  v13 = v33;
  v28 = v8;
  v35 = a1;
  v15 = sub_23BCD853C();
  v16 = v7;
  if (*(_QWORD *)(v15 + 16) != 1)
  {
    v20 = sub_23BCD8458();
    swift_allocError();
    v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A94A88);
    *v22 = &type metadata for DynamicContentAction;
    v23 = v34;
    sub_23BCD8500();
    sub_23BCD844C();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v20 - 8) + 104))(v22, *MEMORY[0x24BEE26D0], v20);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v23, v7);
    a1 = v35;
LABEL_6:
    v24 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v24);
  }
  v18 = v34;
  v17 = (uint64_t)v35;
  if ((*(_BYTE *)(v15 + 32) & 1) != 0)
  {
    v37 = 1;
    sub_23BCC7798();
    v19 = v16;
    sub_23BCD84F4();
    v26 = sub_23BCD8518();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v14, v13);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v18, v19);
    v27 = v26 & 1;
    v17 = (uint64_t)v35;
  }
  else
  {
    v36 = 0;
    sub_23BCC77DC();
    sub_23BCD84F4();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v6, v29);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v18, v16);
    v27 = 2;
  }
  *v31 = v27;
  v24 = v17;
  return __swift_destroy_boxed_opaque_existential_1(v24);
}

uint64_t sub_23BCC7BD8@<X0>(_QWORD *a1@<X0>, char *a2@<X8>)
{
  return DynamicContentAction.init(from:)(a1, a2);
}

uint64_t sub_23BCC7BEC(_QWORD *a1)
{
  return DynamicContentAction.encode(to:)(a1);
}

uint64_t getEnumTagSinglePayload for DynamicContentAction(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t v4;
  unsigned int v6;
  BOOL v7;
  unsigned int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
  {
    v6 = *a1;
    v7 = v6 >= 2;
    v8 = (v6 + 2147483646) & 0x7FFFFFFF;
    if (!v7)
      v8 = -1;
    if (v8 + 1 >= 2)
      return v8;
    else
      return 0;
  }
  else
  {
    v2 = a2 + 2;
    if (a2 + 2 >= 0xFFFF00)
      v3 = 4;
    else
      v3 = 2;
    if (v2 >> 8 < 0xFF)
      v3 = 1;
    if (v2 >= 0x100)
      v4 = v3;
    else
      v4 = 0;
    return ((uint64_t (*)(void))((char *)&loc_23BCC7C50 + 4 * byte_23BCDCC50[v4]))();
  }
}

uint64_t storeEnumTagSinglePayload for DynamicContentAction(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  unsigned int v3;
  int v4;
  uint64_t v5;

  v3 = a3 + 2;
  if (a3 + 2 >= 0xFFFF00)
    v4 = 4;
  else
    v4 = 2;
  if (v3 >> 8 < 0xFF)
    v4 = 1;
  if (v3 >= 0x100)
    LODWORD(v5) = v4;
  else
    LODWORD(v5) = 0;
  if (a3 >= 0xFE)
    v5 = v5;
  else
    v5 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_23BCC7D08 + 4 * byte_23BCDCC5A[v5]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23BCC7D3C + 4 * byte_23BCDCC55[v5]))();
}

uint64_t sub_23BCC7D3C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BCC7D44(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23BCC7D4CLL);
  return result;
}

uint64_t sub_23BCC7D58(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23BCC7D60);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23BCC7D64(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BCC7D6C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BCC7D78(unsigned __int8 *a1)
{
  unsigned int v1;
  BOOL v2;
  int v3;

  v1 = *a1;
  v2 = v1 >= 2;
  v3 = (v1 + 2147483646) & 0x7FFFFFFF;
  if (v2)
    return (v3 + 1);
  else
    return 0;
}

_BYTE *sub_23BCC7D94(_BYTE *result, int a2)
{
  if (a2)
    *result = a2 + 1;
  return result;
}

ValueMetadata *type metadata accessor for DynamicContentAction()
{
  return &type metadata for DynamicContentAction;
}

uint64_t storeEnumTagSinglePayload for DynamicContentAction.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23BCC7E08 + 4 * byte_23BCDCC64[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23BCC7E3C + 4 * byte_23BCDCC5F[v4]))();
}

uint64_t sub_23BCC7E3C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BCC7E44(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23BCC7E4CLL);
  return result;
}

uint64_t sub_23BCC7E58(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23BCC7E60);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23BCC7E64(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BCC7E6C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DynamicContentAction.CodingKeys()
{
  return &type metadata for DynamicContentAction.CodingKeys;
}

ValueMetadata *type metadata accessor for DynamicContentAction.ViewAppearedCodingKeys()
{
  return &type metadata for DynamicContentAction.ViewAppearedCodingKeys;
}

uint64_t storeEnumTagSinglePayload for DynamicContentAction.NetworkConditionsUpdatedCodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23BCC7ED8 + 4 * byte_23BCDCC69[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23BCC7EF8 + 4 * byte_23BCDCC6E[v4]))();
}

_BYTE *sub_23BCC7ED8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23BCC7EF8(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23BCC7F00(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23BCC7F08(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23BCC7F10(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23BCC7F18(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for DynamicContentAction.NetworkConditionsUpdatedCodingKeys()
{
  return &type metadata for DynamicContentAction.NetworkConditionsUpdatedCodingKeys;
}

unint64_t sub_23BCC7F38()
{
  unint64_t result;

  result = qword_256A96850;
  if (!qword_256A96850)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDCDD4, &type metadata for DynamicContentAction.NetworkConditionsUpdatedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A96850);
  }
  return result;
}

unint64_t sub_23BCC7F80()
{
  unint64_t result;

  result = qword_256A96858;
  if (!qword_256A96858)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDCEDC, &type metadata for DynamicContentAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A96858);
  }
  return result;
}

unint64_t sub_23BCC7FC8()
{
  unint64_t result;

  result = qword_256A96860;
  if (!qword_256A96860)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDCDFC, &type metadata for DynamicContentAction.ViewAppearedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A96860);
  }
  return result;
}

unint64_t sub_23BCC8010()
{
  unint64_t result;

  result = qword_256A96868;
  if (!qword_256A96868)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDCE24, &type metadata for DynamicContentAction.ViewAppearedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A96868);
  }
  return result;
}

unint64_t sub_23BCC8058()
{
  unint64_t result;

  result = qword_256A96870;
  if (!qword_256A96870)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDCD44, &type metadata for DynamicContentAction.NetworkConditionsUpdatedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A96870);
  }
  return result;
}

unint64_t sub_23BCC80A0()
{
  unint64_t result;

  result = qword_256A96878;
  if (!qword_256A96878)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDCD6C, &type metadata for DynamicContentAction.NetworkConditionsUpdatedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A96878);
  }
  return result;
}

unint64_t sub_23BCC80E8()
{
  unint64_t result;

  result = qword_256A96880;
  if (!qword_256A96880)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDCE4C, &type metadata for DynamicContentAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A96880);
  }
  return result;
}

unint64_t sub_23BCC8130()
{
  unint64_t result;

  result = qword_256A96888;
  if (!qword_256A96888)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDCE74, &type metadata for DynamicContentAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A96888);
  }
  return result;
}

uint64_t sub_23BCC8174(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6570704177656976 && a2 == 0xEC00000064657261;
  if (v2 || (sub_23BCD85A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x800000023BCE6580)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23BCD85A8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

ValueMetadata *type metadata accessor for SidebarToolbarLeadItemLabelStyle()
{
  return &type metadata for SidebarToolbarLeadItemLabelStyle;
}

uint64_t sub_23BCC8288()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23BCC8298@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
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
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t KeyPath;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  void (*v40)(char *, char *, uint64_t);
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(char *, uint64_t);
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  char v63;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint64_t v68;
  __int128 v69;
  uint64_t v70;
  uint64_t v71;

  v60 = a2;
  v61 = a1;
  v59 = sub_23BCD7C6C();
  v58 = *(_QWORD *)(v59 - 8);
  v2 = MEMORY[0x24BDAC7A8](v59);
  v57 = (char *)&v47 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v56 = (char *)&v47 - v4;
  *(_QWORD *)&v51 = sub_23BCD7EA0();
  v50 = *(_QWORD *)(v51 - 8);
  MEMORY[0x24BDAC7A8](v51);
  v6 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23BCD7C54();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A96898);
  MEMORY[0x24BDAC7A8](v48);
  v12 = (char *)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A968A0);
  MEMORY[0x24BDAC7A8](v49);
  v14 = (char *)&v47 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A968A8);
  MEMORY[0x24BDAC7A8](v53);
  v16 = (char *)&v47 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A968B0);
  MEMORY[0x24BDAC7A8](v52);
  v18 = (char *)&v47 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A968B8);
  v19 = MEMORY[0x24BDAC7A8](v55);
  v21 = (char *)&v47 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v54 = (uint64_t)&v47 - v22;
  sub_23BCD7C60();
  sub_23BCD8008();
  sub_23BCD7ABC();
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v12, v10, v7);
  v23 = &v12[*(int *)(v48 + 36)];
  v24 = v66;
  *(_OWORD *)v23 = v65;
  *((_OWORD *)v23 + 1) = v24;
  *((_OWORD *)v23 + 2) = v67;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  LOBYTE(v10) = sub_23BCD7D68();
  sub_23BCAD8AC((uint64_t)v12, (uint64_t)v14, &qword_256A96898);
  v14[*(int *)(v49 + 36)] = (char)v10;
  sub_23BCADC80((uint64_t)v12, &qword_256A96898);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A968C0);
  v25 = swift_allocObject();
  *(_OWORD *)(v25 + 16) = xmmword_23BCDD000;
  v26 = *MEMORY[0x24BDF3C28];
  v27 = *(void (**)(char *, uint64_t, uint64_t))(v50 + 104);
  v28 = v51;
  v27(v6, v26, v51);
  *(_QWORD *)(v25 + 32) = MEMORY[0x24260F410](v6, 0.517647059, 0.537254902, 0.576470588, 1.0);
  v27(v6, v26, v28);
  *(_QWORD *)(v25 + 40) = MEMORY[0x24260F410](v6, 0.647058824, 0.670588235, 0.721568627, 1.0);
  v68 = v25;
  sub_23BCD81C4();
  v29 = v68;
  sub_23BCD8038();
  sub_23BCD802C();
  MEMORY[0x24260F524](v29);
  sub_23BCD7AD4();
  v30 = v68;
  v51 = v69;
  v31 = v70;
  v32 = v71;
  sub_23BCAD8AC((uint64_t)v14, (uint64_t)v16, &qword_256A968A0);
  v33 = &v16[*(int *)(v53 + 36)];
  *(_QWORD *)v33 = v30;
  *(_OWORD *)(v33 + 8) = v51;
  *((_QWORD *)v33 + 3) = v31;
  *((_QWORD *)v33 + 4) = v32;
  sub_23BCADC80((uint64_t)v14, &qword_256A968A0);
  sub_23BCAD8AC((uint64_t)v16, (uint64_t)v18, &qword_256A968A8);
  *(_WORD *)&v18[*(int *)(v52 + 36)] = 256;
  sub_23BCADC80((uint64_t)v16, &qword_256A968A8);
  KeyPath = swift_getKeyPath();
  v62 = 0;
  sub_23BCD7F54();
  LOBYTE(v26) = v63;
  v35 = v64;
  sub_23BCAD8AC((uint64_t)v18, (uint64_t)v21, &qword_256A968B0);
  v36 = &v21[*(int *)(v55 + 36)];
  *(_QWORD *)v36 = KeyPath;
  v36[8] = 0;
  v36[16] = v26;
  *((_QWORD *)v36 + 3) = v35;
  sub_23BCADC80((uint64_t)v18, &qword_256A968B0);
  v37 = v54;
  sub_23BCC8938((uint64_t)v21, v54);
  v38 = v56;
  sub_23BCD7C78();
  sub_23BCAD8AC(v37, (uint64_t)v21, &qword_256A968B8);
  v39 = v58;
  v40 = *(void (**)(char *, char *, uint64_t))(v58 + 16);
  v41 = v57;
  v42 = v59;
  v40(v57, v38, v59);
  v43 = v60;
  sub_23BCAD8AC((uint64_t)v21, v60, &qword_256A968B8);
  v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A968C8);
  v40((char *)(v43 + *(int *)(v44 + 48)), v41, v42);
  v45 = *(void (**)(char *, uint64_t))(v39 + 8);
  v45(v38, v42);
  sub_23BCADC80(v37, &qword_256A968B8);
  v45(v41, v42);
  return sub_23BCADC80((uint64_t)v21, &qword_256A968B8);
}

uint64_t sub_23BCC88C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  *(_QWORD *)a2 = sub_23BCD7B64();
  *(_QWORD *)(a2 + 8) = 0x4028000000000000;
  *(_BYTE *)(a2 + 16) = 0;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A96890);
  return sub_23BCC8298(a1, a2 + *(int *)(v4 + 44));
}

uint64_t sub_23BCC890C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23BCD7B40();
  *a1 = result & 1;
  return result;
}

uint64_t sub_23BCC8938(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A968B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_23BCC8984()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256A968D0;
  if (!qword_256A968D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A968D8);
    result = MEMORY[0x24260FFB0](MEMORY[0x24BDF4498], v1);
    atomic_store(result, (unint64_t *)&qword_256A968D0);
  }
  return result;
}

uint64_t sub_23BCC89D4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *MEMORY[0x24BE2B558];
  v3 = sub_23BCD808C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(a1, v2, v3);
}

BOOL sub_23BCC8A18(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_23BCC8A28()
{
  return sub_23BCD85CC();
}

uint64_t sub_23BCC8A4C()
{
  sub_23BCD85C0();
  sub_23BCD85CC();
  return sub_23BCD85F0();
}

BOOL sub_23BCC8A90(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_23BCC8A18(*a1, *a2);
}

uint64_t sub_23BCC8AA4()
{
  return sub_23BCC8A4C();
}

uint64_t sub_23BCC8AB4()
{
  return sub_23BCC8A28();
}

uint64_t sub_23BCC8AC4()
{
  sub_23BCD85C0();
  sub_23BCC8A28();
  return sub_23BCD85F0();
}

__n128 TabBarFeature.init(environment:)@<Q0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 16);
  *a2 = *(_OWORD *)a1;
  a2[1] = v3;
  return result;
}

void TabBarFeature.reduce(localState:sharedState:sideEffects:action:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t *v5;
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
  char *v21;
  _QWORD v22[7];
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v27 = a3;
  v28 = a2;
  v22[1] = a1;
  v7 = *(_QWORD *)(a5 + 16);
  v29 = *(_QWORD *)(a5 + 24);
  v8 = type metadata accessor for TabBarAction(255, v7, v29, a4);
  v23 = sub_23BCD8074();
  v22[5] = *(_QWORD *)(v23 - 8);
  v9 = MEMORY[0x24BDAC7A8](v23);
  v22[6] = (char *)v22 - v10;
  v22[4] = *(_QWORD *)(v7 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v22[2] = (char *)v22 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v22[3] = (char *)v22 - v15;
  v16 = *(_QWORD *)(v8 - 8);
  v17 = MEMORY[0x24BDAC7A8](v14);
  MEMORY[0x24BDAC7A8](v17);
  v18 = *v5;
  v26 = v5[1];
  v19 = v5[2];
  v24 = v18;
  v25 = v19;
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))((char *)v22 - v20, a4, v8);
  v21 = (char *)sub_23BCC8CAC + 4 * word_23BCDD0D0[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23BCC8CAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v7 = v5;
  v8 = *(_QWORD *)(v6 - 168);
  type metadata accessor for TabBarState(0, v5, v8, a4);
  v9 = *(_QWORD *)(v6 - 248);
  sub_23BCD8224();
  v10 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_256A95320);
  v11 = v10[12];
  v12 = *(_QWORD *)(v6 - 224);
  *(_QWORD *)(v6 - 272) = v4;
  *(_QWORD *)(v6 - 264) = v12 + v11;
  v13 = v12 + v10[16];
  *(_QWORD *)(v6 - 176) = v12 + v10[20];
  v14 = (_QWORD *)(v12 + v10[24]);
  *(_BYTE *)(v6 - 160) = 0;
  v16 = type metadata accessor for TabBarFeature.TaskIdentifier(0, v7, v8, v15);
  MEMORY[0x24260FFB0](&unk_23BCDD1D0, v16);
  sub_23BCD84E8();
  v17 = *MEMORY[0x24BE2B570];
  v18 = sub_23BCD8098();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 104))(v13, v17, v18);
  v19 = *(_QWORD *)(v6 - 240);
  v20 = *(_QWORD *)(v6 - 256);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v20, v9, v7);
  v21 = (*(unsigned __int8 *)(v19 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v22 = (char *)swift_allocObject();
  *((_QWORD *)v22 + 2) = v7;
  *((_QWORD *)v22 + 3) = v8;
  v23 = *(_QWORD *)(v6 - 192);
  *((_QWORD *)v22 + 4) = *(_QWORD *)(v6 - 208);
  *((_QWORD *)v22 + 5) = v23;
  v24 = *(_QWORD *)(v6 - 272);
  *((_QWORD *)v22 + 6) = *(_QWORD *)(v6 - 200);
  *((_QWORD *)v22 + 7) = v24;
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 32))(&v22[v21], v20, v7);
  *v14 = &unk_256A968F8;
  v14[1] = v22;
  swift_retain();
  swift_retain();
  sub_23BCD8260();
  v25 = *MEMORY[0x24BE2B558];
  v26 = sub_23BCD808C();
  (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 104))(*(_QWORD *)(v6 - 176), v25, v26);
  (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v6 - 232) + 104))(v12, *MEMORY[0x24BE2B438], *(_QWORD *)(v6 - 216));
  sub_23BCD8200();
  sub_23BCD81F4();
  return (*(uint64_t (**)(_QWORD, uint64_t))(v19 + 8))(*(_QWORD *)(v6 - 248), v7);
}

uint64_t type metadata accessor for TabBarFeature.TaskIdentifier(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for TabBarFeature.TaskIdentifier);
}

uint64_t sub_23BCC9210(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t);

  v6[2] = sub_23BCD8254();
  v6[3] = sub_23BCD8248();
  v11 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v9 = (_QWORD *)swift_task_alloc();
  v6[4] = v9;
  *v9 = v6;
  v9[1] = sub_23BCABCB8;
  return v11(a6);
}

uint64_t sub_23BCC9298(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  _QWORD *v4;
  _QWORD *v6;
  uint64_t (*v8)(void);

  v4[2] = sub_23BCD8254();
  v4[3] = sub_23BCD8248();
  v8 = (uint64_t (*)(void))((char *)a4 + *a4);
  v6 = (_QWORD *)swift_task_alloc();
  v4[4] = v6;
  *v6 = v4;
  v6[1] = sub_23BCC9314;
  return v8();
}

uint64_t sub_23BCC9314()
{
  swift_task_dealloc();
  sub_23BCD8230();
  return swift_task_switch();
}

uint64_t sub_23BCC9384()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23BCC93B0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[4];
  v5 = v1[5];
  v6 = (int *)v1[6];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_23BCAA044;
  return sub_23BCC9298(a1, v4, v5, v6);
}

uint64_t sub_23BCC9438()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_23BCC94AC(uint64_t a1)
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

  v4 = *(unsigned __int8 *)(*(_QWORD *)(v1[2] - 8) + 80);
  v5 = (int *)v1[4];
  v6 = v1[5];
  v7 = v1[6];
  v8 = v1[7];
  v9 = (uint64_t)v1 + ((v4 + 64) & ~v4);
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = sub_23BCA8C74;
  return sub_23BCC9210(a1, v5, v6, v7, v8, v9);
}

uint64_t TabBarFeature.dispose(localState:sharedState:)(uint64_t a1, uint64_t a2)
{
  return nullsub_1(a1, *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24));
}

uint64_t sub_23BCC9558(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return nullsub_1(a2, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24));
}

void sub_23BCC9568()
{
  JUMPOUT(0x24260FFB0);
}

void sub_23BCC9578()
{
  JUMPOUT(0x24260FFB0);
}

void sub_23BCC9588()
{
  JUMPOUT(0x24260FFB0);
}

uint64_t type metadata accessor for TabBarFeature(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for TabBarFeature);
}

uint64_t sub_23BCC95A4(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23BCC95F0 + 4 * byte_23BCDD0DF[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23BCC9624 + 4 * byte_23BCDD0DA[v4]))();
}

uint64_t sub_23BCC9624(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BCC962C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23BCC9634);
  return result;
}

uint64_t sub_23BCC9640(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23BCC9648);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23BCC964C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BCC9654(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void sub_23BCC9660()
{
  JUMPOUT(0x24260FFB0);
}

uint64_t sub_23BCC9674()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A96A80);
  sub_23BCCA924();
  return sub_23BCD7A5C();
}

void DynamicContentContainerView.init(store:contentViewBuilder:offlineContentViewBuilder:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  *(_QWORD *)a3 = sub_23BCA3440;
  *(_QWORD *)(a3 + 8) = v6;
  *(_BYTE *)(a3 + 16) = 0;
  type metadata accessor for DynamicContentContainerView();
}

uint64_t sub_23BCC9748()
{
  uint64_t (*v0)(uint64_t);
  uint64_t v1;
  uint64_t v2;
  void (*v4)(uint64_t);

  v1 = swift_retain();
  v2 = v0(v1);
  v4(v2);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_23BCC97B4()
{
  swift_release();
  return swift_deallocObject();
}

void type metadata accessor for DynamicContentContainerView()
{
  JUMPOUT(0x24260FF2CLL);
}

uint64_t DynamicContentContainerView.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
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
  unint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
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
  uint64_t v47;
  _QWORD v48[2];
  uint64_t v49;
  _QWORD v50[3];

  v42 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 - 8) + 64);
  v37 = *(_QWORD *)(a1 - 8);
  v38 = v4;
  v5 = MEMORY[0x24BDAC7A8](a1);
  v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = v7;
  v8 = *(_QWORD *)(v5 + 24);
  v34 = *(_QWORD *)(v5 + 16);
  v9 = v34;
  v10 = v8;
  v33 = v8;
  v11 = sub_23BCD7BE8();
  v12 = sub_23BCD7F00();
  v40 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v35 = (char *)&v31 - v13;
  v14 = sub_23BCD7B04();
  v41 = *(_QWORD *)(v14 - 8);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v36 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v39 = (uint64_t)&v31 - v17;
  v43 = v9;
  v44 = v10;
  v19 = *(_QWORD *)(a1 + 32);
  v18 = *(_QWORD *)(a1 + 40);
  v45 = v19;
  v46 = v18;
  v47 = v2;
  v50[0] = v19;
  v50[1] = v18;
  v20 = MEMORY[0x24260FFB0](MEMORY[0x24BDEF3E0], v11, v50);
  sub_23BCD7EF4();
  v21 = v37;
  (*(void (**)(char *, uint64_t, uint64_t))(v37 + 16))(v7, v2, a1);
  v22 = (*(unsigned __int8 *)(v21 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  v23 = (char *)swift_allocObject();
  v24 = v33;
  *((_QWORD *)v23 + 2) = v34;
  *((_QWORD *)v23 + 3) = v24;
  *((_QWORD *)v23 + 4) = v19;
  *((_QWORD *)v23 + 5) = v18;
  (*(void (**)(char *, char *, uint64_t))(v21 + 32))(&v23[v22], v32, a1);
  v49 = v20;
  v25 = MEMORY[0x24260FFB0](MEMORY[0x24BDF3F50], v12, &v49);
  v26 = v35;
  v27 = (uint64_t)v36;
  sub_23BCD7E7C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v26, v12);
  v48[0] = v25;
  v48[1] = MEMORY[0x24BDF0910];
  MEMORY[0x24260FFB0](MEMORY[0x24BDED308], v14, v48);
  v28 = v39;
  sub_23BCACF3C(v27, v14, v39);
  v29 = *(void (**)(uint64_t, uint64_t))(v41 + 8);
  v29(v27, v14);
  sub_23BCAC3E8(v28, v14, v42);
  return ((uint64_t (*)(uint64_t, uint64_t))v29)(v28, v14);
}

void sub_23BCC9AB8(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[14];

  v17[7] = a6;
  v17[3] = *(_QWORD *)(a3 - 8);
  v10 = MEMORY[0x24BDAC7A8](a1);
  v17[2] = (char *)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v17[1] = (char *)v17 - v13;
  v17[0] = *(_QWORD *)(v14 - 8);
  v15 = MEMORY[0x24BDAC7A8](v12);
  MEMORY[0x24BDAC7A8](v15);
  v16 = sub_23BCD7BE8();
  v17[4] = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v17[10] = a2;
  v17[11] = a3;
  v17[5] = a4;
  v17[6] = a5;
  v17[12] = a4;
  v17[13] = a5;
  type metadata accessor for DynamicContentContainerView();
}

uint64_t sub_23BCC9BE0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t, uint64_t);

  v10 = v7;
  sub_23BCC9674();
  swift_getKeyPath();
  sub_23BCD80A4();
  swift_release();
  swift_release();
  if (*(_BYTE *)(v8 - 112) == 1)
  {
    v11 = v7 + *(int *)(a1 + 56);
    v12 = *(_QWORD *)(v8 - 184);
    v13 = *(_QWORD *)(v8 - 144);
    sub_23BCACF3C(v11, v3, v12);
    v14 = *(_QWORD *)(v8 - 176);
    sub_23BCAC3E8(v12, v3, v14);
    v15 = *(_QWORD *)(v8 - 152);
    sub_23BCCFF28(v14, v4, v3);
    v16 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 168) + 8);
    v16(v14, v3);
    v16(v12, v3);
  }
  else
  {
    v15 = *(_QWORD *)(v8 - 152);
    sub_23BCACF3C(v10 + *(int *)(a1 + 52), v4, v2);
    sub_23BCAC3E8(v2, v4, v1);
    v13 = *(_QWORD *)(v8 - 144);
    sub_23BCCFE64(v1, v4);
    v17 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 192) + 8);
    v17(v1, v4);
    v17(v2, v4);
  }
  *(_QWORD *)(v8 - 128) = v15;
  *(_QWORD *)(v8 - 120) = v13;
  MEMORY[0x24260FFB0](MEMORY[0x24BDEF3E0], v5, v8 - 128);
  sub_23BCAC3E8(v6, v5, *(_QWORD *)(v8 - 136));
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 160) + 8))(v6, v5);
}

void sub_23BCC9D74(uint64_t a1@<X8>)
{
  uint64_t *v1;

  sub_23BCC9AB8(v1[6], v1[2], v1[3], v1[4], v1[5], a1);
}

void sub_23BCC9D84()
{
  type metadata accessor for DynamicContentContainerView();
}

uint64_t sub_23BCC9DAC()
{
  sub_23BCC9674();
  sub_23BCD80BC();
  return swift_release();
}

void sub_23BCC9DDC()
{
  type metadata accessor for DynamicContentContainerView();
}

uint64_t sub_23BCC9E1C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(a1 - 8) + 80);
  v5 = v2 + ((v4 + 48) & ~v4);
  sub_23BCAC7D0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v5 + *(int *)(a1 + 52), v1);
  (*(void (**)(uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v5 + *(int *)(a1 + 56));
  return swift_deallocObject();
}

void sub_23BCC9EA8()
{
  type metadata accessor for DynamicContentContainerView();
}

void sub_23BCC9EDC()
{
  sub_23BCC9D84();
}

uint64_t sub_23BCC9F18()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23BCC9F50()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_23BCC9F58()
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

uint64_t sub_23BCC9FF0(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(_DWORD *)(v5 + 80);
  v7 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v8 = *(_DWORD *)(v7 + 80);
  v9 = *(_QWORD *)(v5 + 64) + v8;
  if ((v8 | v6) > 7
    || ((*(_DWORD *)(v7 + 80) | *(_DWORD *)(v5 + 80)) & 0x100000) != 0
    || ((v9 + ((v6 + 17) & ~v6)) & ~v8) + *(_QWORD *)(v7 + 64) > 0x18)
  {
    v12 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = v12 + (((v8 | v6) & 0xF8 ^ 0x1F8) & ((v8 | v6) + 16));
    swift_retain();
  }
  else
  {
    v13 = ~v6;
    v19 = ~v8;
    v20 = *(_QWORD *)(a3 + 24);
    v14 = *a2;
    v15 = a2[1];
    v16 = *((_BYTE *)a2 + 16);
    v18 = *(_QWORD *)(a3 + 16);
    sub_23BCAC8C8();
    *(_QWORD *)a1 = v14;
    *(_QWORD *)(a1 + 8) = v15;
    *(_BYTE *)(a1 + 16) = v16;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v5 + 16))((a1 + v6 + 17) & v13, ((unint64_t)a2 + v6 + 17) & v13, v18);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v7 + 16))((((a1 + v6 + 17) & v13) + v9) & v19, ((((unint64_t)a2 + v6 + 17) & v13) + v9) & v19, v20);
  }
  return a1;
}

uint64_t sub_23BCCA130(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;

  sub_23BCAC7D0();
  v4 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  v5 = (a1 + *(unsigned __int8 *)(v4 + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  (*(void (**)(unint64_t))(v4 + 8))(v5);
  return (*(uint64_t (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 8))((v5 + *(_QWORD *)(v4 + 64) + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 80));
}

uint64_t sub_23BCCA1AC(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = *a2;
  v7 = a2[1];
  v8 = *((_BYTE *)a2 + 16);
  sub_23BCAC8C8();
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  *(_BYTE *)(a1 + 16) = v8;
  v9 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v10 = *(unsigned __int8 *)(v9 + 80);
  v11 = (v10 + 17 + a1) & ~v10;
  v12 = ((unint64_t)a2 + v10 + 17) & ~v10;
  (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v11, v12);
  v13 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v13 + 16))((*(_QWORD *)(v9 + 64) + *(unsigned __int8 *)(v13 + 80) + v11) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80), (*(_QWORD *)(v9 + 64) + *(unsigned __int8 *)(v13 + 80) + v12) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80));
  return a1;
}

uint64_t sub_23BCCA260(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = *a2;
  v7 = a2[1];
  v8 = *((_BYTE *)a2 + 16);
  sub_23BCAC8C8();
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  *(_BYTE *)(a1 + 16) = v8;
  sub_23BCAC7D0();
  v9 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v10 = *(unsigned __int8 *)(v9 + 80);
  v11 = (v10 + 17 + a1) & ~v10;
  v12 = ((unint64_t)a2 + v10 + 17) & ~v10;
  (*(void (**)(uint64_t, uint64_t))(v9 + 24))(v11, v12);
  v13 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v13 + 24))((*(_QWORD *)(v9 + 64) + *(unsigned __int8 *)(v13 + 80) + v11) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80), (*(_QWORD *)(v9 + 64) + *(unsigned __int8 *)(v13 + 80) + v12) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80));
  return a1;
}

uint64_t sub_23BCCA320(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  v7 = (v6 + 17 + a1) & ~v6;
  v8 = (v6 + 17 + a2) & ~v6;
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(v7, v8);
  v9 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v9 + 32))((*(_QWORD *)(v5 + 64) + *(unsigned __int8 *)(v9 + 80) + v7) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80), (*(_QWORD *)(v5 + 64) + *(unsigned __int8 *)(v9 + 80) + v8) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
  return a1;
}

uint64_t sub_23BCCA3C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = *(_BYTE *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v6;
  sub_23BCAC7D0();
  v7 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = (v8 + 17 + a1) & ~v8;
  v10 = (v8 + 17 + a2) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v7 + 40))(v9, v10);
  v11 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v11 + 40))((*(_QWORD *)(v7 + 64) + *(unsigned __int8 *)(v11 + 80) + v9) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80), (*(_QWORD *)(v7 + 64) + *(unsigned __int8 *)(v11 + 80) + v10) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
  return a1;
}

uint64_t sub_23BCCA474(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3;
  unsigned int v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  int v13;
  unsigned int v15;
  int v16;
  int v17;
  unsigned int v18;
  uint64_t v19;

  v3 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v4 = *(_DWORD *)(v3 + 84);
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  if (v4 <= *(_DWORD *)(v5 + 84))
    v6 = *(_DWORD *)(v5 + 84);
  else
    v6 = *(_DWORD *)(v3 + 84);
  if (v6 <= 0xFE)
    v7 = 254;
  else
    v7 = v6;
  if (!a2)
    return 0;
  v8 = *(unsigned __int8 *)(v3 + 80);
  v9 = *(_QWORD *)(v3 + 64);
  v10 = *(unsigned __int8 *)(v5 + 80);
  if (a2 <= v7)
    goto LABEL_27;
  v11 = ((v9 + v10 + ((v8 + 17) & ~v8)) & ~v10) + *(_QWORD *)(v5 + 64);
  v12 = 8 * v11;
  if (v11 <= 3)
  {
    v15 = ((a2 - v7 + ~(-1 << v12)) >> v12) + 1;
    if (HIWORD(v15))
    {
      v13 = *(_DWORD *)(a1 + v11);
      if (!v13)
        goto LABEL_27;
      goto LABEL_18;
    }
    if (v15 > 0xFF)
    {
      v13 = *(unsigned __int16 *)(a1 + v11);
      if (!*(_WORD *)(a1 + v11))
        goto LABEL_27;
      goto LABEL_18;
    }
    if (v15 < 2)
    {
LABEL_27:
      if (v6 > 0xFE)
      {
        v19 = (a1 + v8 + 17) & ~v8;
        if (v4 == v7)
          return (*(uint64_t (**)(uint64_t, _QWORD))(v3 + 48))(v19, *(unsigned int *)(v3 + 84));
        else
          return (*(uint64_t (**)(uint64_t))(v5 + 48))((v19 + v9 + v10) & ~v10);
      }
      else
      {
        v18 = *(unsigned __int8 *)(a1 + 16);
        if (v18 > 1)
          return (v18 ^ 0xFF) + 1;
        else
          return 0;
      }
    }
  }
  v13 = *(unsigned __int8 *)(a1 + v11);
  if (!*(_BYTE *)(a1 + v11))
    goto LABEL_27;
LABEL_18:
  v16 = (v13 - 1) << v12;
  if (v11 > 3)
    v16 = 0;
  if (!(_DWORD)v11)
    return v7 + v16 + 1;
  if (v11 <= 3)
    v17 = ((v9 + v10 + ((v8 + 17) & ~(_DWORD)v8)) & ~(_DWORD)v10) + *(_DWORD *)(v5 + 64);
  else
    v17 = 4;
  return ((uint64_t (*)(void))((char *)&loc_23BCCA574 + 4 * byte_23BCDD210[v17 - 1]))();
}

void sub_23BCCA614(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  size_t v9;
  unsigned int v10;
  int v11;
  unsigned int v12;
  int v13;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 24) - 8);
  if (*(_DWORD *)(v5 + 84) <= *(_DWORD *)(v6 + 84))
    v7 = *(_DWORD *)(v6 + 84);
  else
    v7 = *(_DWORD *)(v5 + 84);
  if (v7 <= 0xFE)
    v8 = 254;
  else
    v8 = v7;
  v9 = ((*(_QWORD *)(v5 + 64)
       + *(unsigned __int8 *)(v6 + 80)
       + ((*(unsigned __int8 *)(v5 + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))
     + *(_QWORD *)(v6 + 64);
  if (a3 > v8)
  {
    if (v9 <= 3)
    {
      v12 = ((a3 - v8 + ~(-1 << (8 * v9))) >> (8 * v9)) + 1;
      if (HIWORD(v12))
      {
        v10 = 4u;
      }
      else if (v12 >= 0x100)
      {
        v10 = 2;
      }
      else
      {
        v10 = v12 > 1;
      }
    }
    else
    {
      v10 = 1u;
    }
  }
  else
  {
    v10 = 0;
  }
  if (v8 < a2)
  {
    v11 = ~v8 + a2;
    if (v9 < 4)
    {
      if ((_DWORD)v9)
      {
        v13 = v11 & ~(-1 << (8 * v9));
        bzero(a1, v9);
        if ((_DWORD)v9 == 3)
        {
          *a1 = v13;
          *((_BYTE *)a1 + 2) = BYTE2(v13);
        }
        else if ((_DWORD)v9 == 2)
        {
          *a1 = v13;
        }
        else
        {
          *(_BYTE *)a1 = v13;
        }
      }
    }
    else
    {
      bzero(a1, v9);
      *(_DWORD *)a1 = v11;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X6 }
}

uint64_t sub_23BCCA86C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[2];
  uint64_t v7;
  __int128 v8;

  v2 = sub_23BCD7BE8();
  v3 = sub_23BCD7F00();
  v4 = sub_23BCD7B04();
  v8 = *(_OWORD *)(a1 + 16);
  v7 = MEMORY[0x24260FFB0](MEMORY[0x24BDEF3E0], v2, &v8);
  v6[0] = MEMORY[0x24260FFB0](MEMORY[0x24BDF3F50], v3, &v7);
  v6[1] = MEMORY[0x24BDF0910];
  return MEMORY[0x24260FFB0](MEMORY[0x24BDED308], v4, v6);
}

unint64_t sub_23BCCA924()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256A96A88;
  if (!qword_256A96A88)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A96A80);
    result = MEMORY[0x24260FFB0](MEMORY[0x24BE2B5E8], v1);
    atomic_store(result, (unint64_t *)&qword_256A96A88);
  }
  return result;
}

void sub_23BCCA970(char a1, double a2, double a3, double a4, double a5)
{
  char *v5;
  objc_class *ObjectType;
  uint64_t v12;
  id v13;
  char *v14;
  char *v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  double v24;
  char *v25;
  uint64_t v26;
  void *v27;
  char *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  id v60;
  objc_super v61;
  uint64_t v62;

  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)&v5[OBJC_IVAR____TtC14FitnessAppRoot15FloatingTabView_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v5[OBJC_IVAR____TtC14FitnessAppRoot15FloatingTabView_minimumInterTextSpacing] = 0x4030000000000000;
  v12 = OBJC_IVAR____TtC14FitnessAppRoot15FloatingTabView_segmentedControl;
  v13 = objc_allocWithZone((Class)type metadata accessor for VibrantSegmentedControl());
  v14 = v5;
  *(_QWORD *)&v5[v12] = objc_msgSend(v13, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  *(_QWORD *)&v14[OBJC_IVAR____TtC14FitnessAppRoot15FloatingTabView_contentSizes] = MEMORY[0x24BEE4AF8];
  v15 = &v14[OBJC_IVAR____TtC14FitnessAppRoot15FloatingTabView_segmentedControlIntrinsicSize];
  *(_QWORD *)v15 = 0;
  *((_QWORD *)v15 + 1) = 0;
  v16 = OBJC_IVAR____TtC14FitnessAppRoot15FloatingTabView_heightConstraint;
  *(_QWORD *)&v14[v16] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1628]), sel_init);
  v14[OBJC_IVAR____TtC14FitnessAppRoot15FloatingTabView_prefersTightPadding] = a1;
  v17 = objc_msgSend((id)objc_opt_self(), sel_effectWithStyle_, 8);
  v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.75, 0.75, 1.0, 0.06);
  v19 = (void *)objc_opt_self();
  v20 = objc_msgSend(v19, sel_effectCompositingColor_, v18);

  if (v20)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256A94FC0);
    v21 = swift_allocObject();
    *(_OWORD *)(v21 + 16) = xmmword_23BCDA520;
    *(_QWORD *)(v21 + 32) = v17;
    *(_QWORD *)(v21 + 40) = v20;
    v62 = v21;
    sub_23BCD81C4();
    sub_23BCA3724(0, &qword_256A952F8);
    v60 = v17;
    v59 = v20;
    v22 = (void *)sub_23BCD81AC();
    swift_bridgeObjectRelease();
    v58 = objc_msgSend(v19, sel_effectCombiningEffects_, v22);

    v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB38]), sel_initWithEffect_, v58);
    *(_QWORD *)&v14[OBJC_IVAR____TtC14FitnessAppRoot15FloatingTabView_backgroundVisualEffectView] = v23;
    v24 = 14.0;
    if ((a1 & 1) != 0)
      v24 = 18.0;
    *(double *)&v14[OBJC_IVAR____TtC14FitnessAppRoot15FloatingTabView_horizontalPadding] = v24;

    v61.receiver = v14;
    v61.super_class = ObjectType;
    v25 = (char *)objc_msgSendSuper2(&v61, sel_initWithFrame_, a2, a3, a4, a5);
    v26 = OBJC_IVAR____TtC14FitnessAppRoot15FloatingTabView_backgroundVisualEffectView;
    v27 = *(void **)&v25[OBJC_IVAR____TtC14FitnessAppRoot15FloatingTabView_backgroundVisualEffectView];
    v28 = v25;
    objc_msgSend(v27, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    objc_msgSend(v28, sel_addSubview_, v27);
    v29 = OBJC_IVAR____TtC14FitnessAppRoot15FloatingTabView_segmentedControl;
    v30 = *(void **)&v28[OBJC_IVAR____TtC14FitnessAppRoot15FloatingTabView_segmentedControl];
    objc_msgSend(v30, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    objc_msgSend(v28, sel_addSubview_, v30);
    objc_msgSend(v30, sel_addTarget_action_forControlEvents_, v28, sel_valueChanged_, 4096);
    v57 = (id)objc_opt_self();
    v31 = swift_allocObject();
    *(_OWORD *)(v31 + 16) = xmmword_23BCDD2F0;
    v32 = objc_msgSend(v27, sel_leadingAnchor);
    v33 = objc_msgSend(v28, (SEL)&stru_250CCD130.name + 6);
    v34 = objc_msgSend(v32, sel_constraintEqualToAnchor_, v33);

    *(_QWORD *)(v31 + 32) = v34;
    v35 = objc_msgSend(*(id *)&v25[v26], sel_trailingAnchor);
    v36 = objc_msgSend(v28, (SEL)&stru_250CCD648);
    v37 = objc_msgSend(v35, sel_constraintEqualToAnchor_, v36);

    *(_QWORD *)(v31 + 40) = v37;
    v38 = objc_msgSend(*(id *)&v25[v26], sel_topAnchor);
    v39 = objc_msgSend(v28, sel_topAnchor);
    v40 = objc_msgSend(v38, sel_constraintEqualToAnchor_, v39);

    *(_QWORD *)(v31 + 48) = v40;
    v41 = objc_msgSend(*(id *)&v25[v26], sel_bottomAnchor);
    v42 = objc_msgSend(v28, sel_bottomAnchor);
    v43 = objc_msgSend(v41, sel_constraintEqualToAnchor_, v42);

    *(_QWORD *)(v31 + 56) = v43;
    v44 = objc_msgSend(*(id *)&v28[v29], sel_leadingAnchor);
    v45 = objc_msgSend(v28, sel_leadingAnchor);
    v46 = objc_msgSend(v44, sel_constraintEqualToAnchor_, v45);

    *(_QWORD *)(v31 + 64) = v46;
    v47 = objc_msgSend(*(id *)&v28[v29], sel_trailingAnchor);
    v48 = objc_msgSend(v28, sel_trailingAnchor);
    v49 = objc_msgSend(v47, sel_constraintEqualToAnchor_, v48);

    *(_QWORD *)(v31 + 72) = v49;
    v50 = objc_msgSend(*(id *)&v28[v29], sel_topAnchor);
    v51 = objc_msgSend(v28, sel_topAnchor);
    v52 = objc_msgSend(v50, sel_constraintEqualToAnchor_, v51);

    *(_QWORD *)(v31 + 80) = v52;
    v53 = objc_msgSend(*(id *)&v28[v29], sel_bottomAnchor);
    v54 = objc_msgSend(v28, sel_bottomAnchor);
    v55 = objc_msgSend(v53, sel_constraintEqualToAnchor_, v54);

    *(_QWORD *)(v31 + 88) = v55;
    v62 = v31;
    sub_23BCD81C4();
    sub_23BCA3724(0, &qword_256A96280);
    v56 = (void *)sub_23BCD81AC();
    swift_bridgeObjectRelease();
    objc_msgSend(v57, sel_activateConstraints_, v56);

  }
  else
  {
    __break(1u);
  }
}

void sub_23BCCB07C()
{
  char *v0;
  void *v1;
  void *v2;
  id v3;
  double v4;
  double Width;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  objc_super v19;
  CGRect v20;
  CGRect v21;

  v19.receiver = v0;
  v19.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v19, sel_layoutSubviews);
  sub_23BCCB264();
  v1 = *(void **)&v0[OBJC_IVAR____TtC14FitnessAppRoot15FloatingTabView_backgroundVisualEffectView];
  objc_msgSend(v1, sel_bounds);
  objc_msgSend(v1, sel__setCornerRadius_continuous_maskedCorners_, 1, 15, CGRectGetHeight(v20) * 0.5);
  v2 = *(void **)&v0[OBJC_IVAR____TtC14FitnessAppRoot15FloatingTabView_segmentedControl];
  v3 = objc_msgSend(v2, sel_numberOfSegments);
  v4 = *(double *)&v0[OBJC_IVAR____TtC14FitnessAppRoot15FloatingTabView_horizontalPadding];
  objc_msgSend(v0, sel_bounds);
  Width = CGRectGetWidth(v21);
  v6 = (uint64_t)v3 - 1;
  if (!__OFSUB__(v3, 1))
  {
    v7 = v4 + v4;
    v8 = Width - *(double *)&v0[OBJC_IVAR____TtC14FitnessAppRoot15FloatingTabView_segmentedControlIntrinsicSize];
    v9 = (double)v6;
    v10 = v8 * 0.5 / (double)v6;
    v11 = *(double *)&v0[OBJC_IVAR____TtC14FitnessAppRoot15FloatingTabView_minimumInterTextSpacing];
    v12 = &v0[OBJC_IVAR____TtC14FitnessAppRoot15FloatingTabView_contentSizes];
    swift_beginAccess();
    v13 = *(_QWORD *)(*(_QWORD *)v12 + 16);
    if (!v13)
    {
LABEL_6:
      objc_msgSend(v2, sel__setInterSegmentSpacing_, CGRound(v11 + v10) - v7);
      return;
    }
    v14 = 0;
    v15 = (v8 - v10 * v9) / (double)(uint64_t)v3;
    v16 = 32;
    while (1)
    {
      v17 = *(_QWORD *)v12;
      if ((unint64_t)v14 >= *(_QWORD *)(*(_QWORD *)v12 + 16))
        break;
      v18 = CGRound(v15 * (double)v14);
      objc_msgSend(v2, sel_setWidth_forSegmentAtIndex_, v14, CGRound(v15 * (double)(v14 + 1) - v18) + v7 + *(double *)(v17 + v16));
      v16 += 16;
      if (++v14 == v13)
        goto LABEL_6;
    }
    __break(1u);
  }
  __break(1u);
}

void sub_23BCCB264()
{
  void *v0;
  uint64_t v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t inited;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  _QWORD *v25;
  double *v26;
  unint64_t v27;
  id v28;
  unint64_t v29;
  double *v30;
  double v31;
  double v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  id v46;
  uint64_t v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  _QWORD *v56;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v58;
  unint64_t v59;
  id v60;
  id v61;
  uint64_t v62;
  id v63;
  id v64;
  id v65;
  uint64_t v66;
  id v67;
  id v68;
  char *v69;
  uint64_t v70;

  v0 = (void *)objc_opt_self();
  v1 = *MEMORY[0x24BEBE098];
  v2 = objc_msgSend(v0, sel__preferredFontForTextStyle_variant_maximumContentSizeCategory_, *MEMORY[0x24BEBE1D0], 8, *MEMORY[0x24BEBE098]);
  if (!v2)
    return;
  v67 = v2;
  v3 = objc_msgSend(v0, sel__preferredFontForTextStyle_maximumContentSizeCategory_, *MEMORY[0x24BEBE200], v1);
  if (!v3)
  {

    return;
  }
  v4 = v3;
  v5 = *(void **)(v70 + OBJC_IVAR____TtC14FitnessAppRoot15FloatingTabView_segmentedControl);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A96B00);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23BCDD000;
  v7 = (void *)*MEMORY[0x24BEBB360];
  *(_QWORD *)(inited + 32) = *MEMORY[0x24BEBB360];
  v66 = sub_23BCA3724(0, &qword_256A95728);
  *(_QWORD *)(inited + 40) = v67;
  v8 = (void *)*MEMORY[0x24BEBB368];
  *(_QWORD *)(inited + 64) = v66;
  *(_QWORD *)(inited + 72) = v8;
  v60 = (id)objc_opt_self();
  v9 = v7;
  v68 = v67;
  v10 = v8;
  v11 = objc_msgSend(v60, sel_secondaryLabelColor);
  v12 = sub_23BCA3724(0, &qword_256A96B08);
  *(_QWORD *)(inited + 104) = v12;
  v62 = v12;
  *(_QWORD *)(inited + 80) = v11;
  sub_23BCCBA74(inited);
  type metadata accessor for Key(0);
  sub_23BCAF8D4();
  v13 = (void *)sub_23BCD80F8();
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_setTitleTextAttributes_forState_, v13, 0);

  v14 = v5;
  v15 = swift_initStackObject();
  *(_OWORD *)(v15 + 16) = xmmword_23BCDD000;
  *(_QWORD *)(v15 + 32) = v9;
  *(_QWORD *)(v15 + 40) = v4;
  *(_QWORD *)(v15 + 64) = v66;
  *(_QWORD *)(v15 + 72) = v10;
  v16 = v9;
  v65 = v4;
  v17 = v10;
  v18 = objc_msgSend(v60, sel_labelColor);
  *(_QWORD *)(v15 + 104) = v12;
  *(_QWORD *)(v15 + 80) = v18;
  sub_23BCCBA74(v15);
  v19 = (void *)sub_23BCD80F8();
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_setTitleTextAttributes_forState_, v19, 4);

  v20 = swift_initStackObject();
  *(_OWORD *)(v20 + 16) = xmmword_23BCDD000;
  *(_QWORD *)(v20 + 32) = v16;
  *(_QWORD *)(v20 + 40) = v68;
  *(_QWORD *)(v20 + 64) = v66;
  *(_QWORD *)(v20 + 72) = v17;
  v64 = v68;
  v63 = v16;
  v21 = v17;
  v22 = objc_msgSend(v60, sel_secondaryLabelColor);
  v23 = objc_msgSend(v22, sel_colorWithAlphaComponent_, 0.3);

  *(_QWORD *)(v20 + 104) = v62;
  *(_QWORD *)(v20 + 80) = v23;
  sub_23BCCBA74(v20);
  v24 = (void *)sub_23BCD80F8();
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_setTitleTextAttributes_forState_, v24, 2);

  v25 = (_QWORD *)(v70 + OBJC_IVAR____TtC14FitnessAppRoot15FloatingTabView_contentSizes);
  swift_beginAccess();
  *v25 = MEMORY[0x24BEE4AF8];
  swift_bridgeObjectRelease();
  v26 = (double *)(v70 + OBJC_IVAR____TtC14FitnessAppRoot15FloatingTabView_segmentedControlIntrinsicSize);
  *v26 = 0.0;
  v26[1] = 0.0;
  v27 = (unint64_t)objc_msgSend(v5, sel_numberOfSegments);
  if ((v27 & 0x8000000000000000) != 0)
    goto LABEL_29;
  v28 = (id)v27;
  if (!v27)
  {
LABEL_25:

    *v26 = *v26
         + *(double *)(v70 + OBJC_IVAR____TtC14FitnessAppRoot15FloatingTabView_horizontalPadding)
         + *(double *)(v70 + OBJC_IVAR____TtC14FitnessAppRoot15FloatingTabView_horizontalPadding)
         - *(double *)(v70 + OBJC_IVAR____TtC14FitnessAppRoot15FloatingTabView_minimumInterTextSpacing);
    return;
  }
  v29 = 0;
  v69 = (char *)OBJC_IVAR____TtC14FitnessAppRoot15FloatingTabView_minimumInterTextSpacing;
  v61 = (id)v27;
  while (1)
  {
    v33 = objc_msgSend(v14, sel_titleForSegmentAtIndex_, v29);
    if (v33)
      break;
    v51 = objc_msgSend(v14, sel_imageForSegmentAtIndex_, v29);
    if (v51)
    {
      v52 = v51;
      objc_msgSend(v51, sel_size);
      v54 = v53;
      v44 = v55;

      v45 = CGCeiling(v54);
      goto LABEL_20;
    }
LABEL_9:
    if (v28 == (id)++v29)
      goto LABEL_25;
  }
  v34 = v33;
  sub_23BCD8164();
  if ((id)v29 == objc_msgSend(v14, sel_selectedSegmentIndex))
    v35 = v65;
  else
    v35 = v64;
  v36 = swift_initStackObject();
  *(_OWORD *)(v36 + 16) = xmmword_23BCDA510;
  *(_QWORD *)(v36 + 64) = v66;
  v37 = v14;
  *(_QWORD *)(v36 + 32) = v63;
  *(_QWORD *)(v36 + 40) = v35;
  v38 = v35;
  v39 = v63;
  sub_23BCCBA74(v36);
  v40 = (void *)sub_23BCD80F8();
  swift_bridgeObjectRelease();
  objc_msgSend(v34, sel_sizeWithAttributes_, v40);
  v42 = v41;
  v44 = v43;

  v14 = v37;
  v45 = CGCeiling(v42);
  v46 = objc_msgSend(v37, sel_subviews);
  sub_23BCA3724(0, &qword_256A96B10);
  v47 = sub_23BCD81B8();

  if ((v47 & 0xC000000000000001) != 0)
  {
    v48 = (id)MEMORY[0x24260F968](v29, v47);
    goto LABEL_17;
  }
  if (v29 < *(_QWORD *)((v47 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v48 = *(id *)(v47 + 8 * v29 + 32);
LABEL_17:
    v49 = v48;
    swift_bridgeObjectRelease();
    sub_23BCD8428();
    swift_bridgeObjectRelease();
    sub_23BCD8188();
    swift_bridgeObjectRelease();
    v50 = (void *)sub_23BCD8140();
    swift_bridgeObjectRelease();
    objc_msgSend(v49, sel_setAccessibilityIdentifier_, v50);

    v28 = v61;
LABEL_20:
    swift_beginAccess();
    v56 = (_QWORD *)*v25;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v25 = v56;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v56 = sub_23BCA8CC4(0, v56[2] + 1, 1, v56);
      *v25 = v56;
    }
    v59 = v56[2];
    v58 = v56[3];
    if (v59 >= v58 >> 1)
    {
      v56 = sub_23BCA8CC4((_QWORD *)(v58 > 1), v59 + 1, 1, v56);
      *v25 = v56;
    }
    v56[2] = v59 + 1;
    v30 = (double *)&v56[2 * v59];
    v30[4] = v45;
    v30[5] = v44;
    swift_endAccess();
    v31 = CGCeiling(v44) + 12.0;
    v32 = *v26;
    if (v31 <= v26[1])
      v31 = v26[1];
    v26[1] = v31;
    *v26 = v32 + v45 + *(double *)&v69[v70];
    goto LABEL_9;
  }
  __break(1u);
LABEL_29:
  __break(1u);
}

unint64_t sub_23BCCBA74(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A96B18);
  v2 = sub_23BCD84C4();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_23BCCBE78(v6, (uint64_t)&v13);
    v7 = v13;
    result = sub_23BCAF6E0(v13);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v7;
    result = (unint64_t)sub_23BCCBEC0(&v14, (_OWORD *)(v3[7] + 32 * result));
    v10 = v3[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
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

uint64_t sub_23BCCBB8C(void *a1)
{
  char *v1;
  uint64_t result;
  uint64_t v4;
  char *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t ObjectType;

  result = MEMORY[0x2426100E8](&v1[OBJC_IVAR____TtC14FitnessAppRoot15FloatingTabView_delegate]);
  if (result)
  {
    v4 = result;
    v5 = v1;
    v6 = objc_msgSend(a1, sel_selectedSegmentIndex);
    v7 = v4 + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_delegate;
    if (MEMORY[0x2426100E8](v4 + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_delegate))
    {
      v8 = *(_QWORD *)(v7 + 8);
      ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v8 + 8))(v4, v6, ObjectType, v8);

      swift_unknownObjectRelease();
    }
    else
    {

    }
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t type metadata accessor for FloatingTabView()
{
  return objc_opt_self();
}

double CGRound(double a1)
{
  return round(a1);
}

void sub_23BCCBD6C()
{
  char *v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;

  *(_QWORD *)&v0[OBJC_IVAR____TtC14FitnessAppRoot15FloatingTabView_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v0[OBJC_IVAR____TtC14FitnessAppRoot15FloatingTabView_minimumInterTextSpacing] = 0x4030000000000000;
  v1 = OBJC_IVAR____TtC14FitnessAppRoot15FloatingTabView_segmentedControl;
  *(_QWORD *)&v0[v1] = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for VibrantSegmentedControl()), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  *(_QWORD *)&v0[OBJC_IVAR____TtC14FitnessAppRoot15FloatingTabView_contentSizes] = MEMORY[0x24BEE4AF8];
  v2 = &v0[OBJC_IVAR____TtC14FitnessAppRoot15FloatingTabView_segmentedControlIntrinsicSize];
  *(_QWORD *)v2 = 0;
  *((_QWORD *)v2 + 1) = 0;
  v3 = OBJC_IVAR____TtC14FitnessAppRoot15FloatingTabView_heightConstraint;
  *(_QWORD *)&v0[v3] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1628]), sel_init);

  sub_23BCD84AC();
  __break(1u);
}

double CGCeiling(double a1)
{
  return ceil(a1);
}

uint64_t sub_23BCCBE78(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A96B20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_23BCCBEC0(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

BOOL static TabBarStyle.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t TabBarStyle.hash(into:)()
{
  return sub_23BCD85CC();
}

uint64_t sub_23BCCBF0C()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 1701736302;
  if (*v0 != 1)
    v1 = 0x647261646E617473;
  if (*v0)
    return v1;
  else
    return 0x676E6974616F6C66;
}

uint64_t sub_23BCCBF60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23BCCCCC8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23BCCBF84()
{
  sub_23BCCC328();
  return sub_23BCD8614();
}

uint64_t sub_23BCCBFAC()
{
  sub_23BCCC328();
  return sub_23BCD8620();
}

uint64_t sub_23BCCBFD4()
{
  sub_23BCCC3F4();
  return sub_23BCD8614();
}

uint64_t sub_23BCCBFFC()
{
  sub_23BCCC3F4();
  return sub_23BCD8620();
}

uint64_t sub_23BCCC024()
{
  sub_23BCCC3B0();
  return sub_23BCD8614();
}

uint64_t sub_23BCCC04C()
{
  sub_23BCCC3B0();
  return sub_23BCD8620();
}

uint64_t sub_23BCCC074()
{
  sub_23BCCC36C();
  return sub_23BCD8614();
}

uint64_t sub_23BCCC09C()
{
  sub_23BCCC36C();
  return sub_23BCD8620();
}

uint64_t TabBarStyle.encode(to:)(_QWORD *a1)
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
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A96B28);
  v22 = *(_QWORD *)(v4 - 8);
  v23 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v21 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A96B30);
  v19 = *(_QWORD *)(v6 - 8);
  v20 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A96B38);
  v9 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A96B40);
  v24 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *v2;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23BCCC328();
  sub_23BCD8608();
  if (v15)
  {
    if (v15 == 1)
    {
      v26 = 1;
      sub_23BCCC3B0();
      sub_23BCD8554();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v8, v20);
    }
    else
    {
      v27 = 2;
      sub_23BCCC36C();
      v16 = v21;
      sub_23BCD8554();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v16, v23);
    }
  }
  else
  {
    v25 = 0;
    sub_23BCCC3F4();
    sub_23BCD8554();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v18);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v14, v12);
}

unint64_t sub_23BCCC328()
{
  unint64_t result;

  result = qword_256A96B48;
  if (!qword_256A96B48)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDD70C, &type metadata for TabBarStyle.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A96B48);
  }
  return result;
}

unint64_t sub_23BCCC36C()
{
  unint64_t result;

  result = qword_256A96B50;
  if (!qword_256A96B50)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDD6BC, &type metadata for TabBarStyle.StandardCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A96B50);
  }
  return result;
}

unint64_t sub_23BCCC3B0()
{
  unint64_t result;

  result = qword_256A96B58;
  if (!qword_256A96B58)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDD66C, &type metadata for TabBarStyle.NoneCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A96B58);
  }
  return result;
}

unint64_t sub_23BCCC3F4()
{
  unint64_t result;

  result = qword_256A96B60;
  if (!qword_256A96B60)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDD61C, &type metadata for TabBarStyle.FloatingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A96B60);
  }
  return result;
}

uint64_t TabBarStyle.hashValue.getter()
{
  sub_23BCD85C0();
  sub_23BCD85CC();
  return sub_23BCD85F0();
}

uint64_t TabBarStyle.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
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
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A96B68);
  v34 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v37);
  v40 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A96B70);
  v35 = *(_QWORD *)(v4 - 8);
  v36 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v39 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A96B78);
  v6 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A96B80);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23BCCC328();
  v13 = v41;
  sub_23BCD85FC();
  if (v13)
    goto LABEL_7;
  v31 = v6;
  v32 = v10;
  v14 = v39;
  v15 = v40;
  v41 = a1;
  v16 = v12;
  v17 = sub_23BCD853C();
  v18 = v9;
  if (*(_QWORD *)(v17 + 16) != 1)
  {
    v23 = sub_23BCD8458();
    swift_allocError();
    v25 = v24;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A94A88);
    *v25 = &type metadata for TabBarStyle;
    sub_23BCD8500();
    sub_23BCD844C();
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
      sub_23BCCC3B0();
      v20 = v9;
      sub_23BCD84F4();
      v21 = v38;
      v22 = v32;
      (*(void (**)(char *, uint64_t))(v35 + 8))(v14, v36);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v16, v20);
    }
    else
    {
      v44 = 2;
      sub_23BCCC36C();
      v28 = v15;
      sub_23BCD84F4();
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
    sub_23BCCC3F4();
    sub_23BCD84F4();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v8, v33);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v16, v9);
    v21 = v38;
  }
  *v21 = v19;
  v26 = (uint64_t)v41;
  return __swift_destroy_boxed_opaque_existential_1(v26);
}

uint64_t sub_23BCCC8C0@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return TabBarStyle.init(from:)(a1, a2);
}

uint64_t sub_23BCCC8D4(_QWORD *a1)
{
  return TabBarStyle.encode(to:)(a1);
}

unint64_t sub_23BCCC8EC()
{
  unint64_t result;

  result = qword_256A96B88;
  if (!qword_256A96B88)
  {
    result = MEMORY[0x24260FFB0](&protocol conformance descriptor for TabBarStyle, &type metadata for TabBarStyle);
    atomic_store(result, (unint64_t *)&qword_256A96B88);
  }
  return result;
}

ValueMetadata *type metadata accessor for TabBarStyle()
{
  return &type metadata for TabBarStyle;
}

uint64_t _s14FitnessAppRoot11TabBarStyleOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23BCCC990 + 4 * byte_23BCDD335[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23BCCC9C4 + 4 * byte_23BCDD330[v4]))();
}

uint64_t sub_23BCCC9C4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BCCC9CC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23BCCC9D4);
  return result;
}

uint64_t sub_23BCCC9E0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23BCCC9E8);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23BCCC9EC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BCCC9F4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TabBarStyle.CodingKeys()
{
  return &type metadata for TabBarStyle.CodingKeys;
}

ValueMetadata *type metadata accessor for TabBarStyle.FloatingCodingKeys()
{
  return &type metadata for TabBarStyle.FloatingCodingKeys;
}

ValueMetadata *type metadata accessor for TabBarStyle.NoneCodingKeys()
{
  return &type metadata for TabBarStyle.NoneCodingKeys;
}

ValueMetadata *type metadata accessor for TabBarStyle.StandardCodingKeys()
{
  return &type metadata for TabBarStyle.StandardCodingKeys;
}

unint64_t sub_23BCCCA44()
{
  unint64_t result;

  result = qword_256A96B90;
  if (!qword_256A96B90)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDD5F4, &type metadata for TabBarStyle.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A96B90);
  }
  return result;
}

unint64_t sub_23BCCCA8C()
{
  unint64_t result;

  result = qword_256A96B98;
  if (!qword_256A96B98)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDD514, &type metadata for TabBarStyle.FloatingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A96B98);
  }
  return result;
}

unint64_t sub_23BCCCAD4()
{
  unint64_t result;

  result = qword_256A96BA0;
  if (!qword_256A96BA0)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDD53C, &type metadata for TabBarStyle.FloatingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A96BA0);
  }
  return result;
}

unint64_t sub_23BCCCB1C()
{
  unint64_t result;

  result = qword_256A96BA8;
  if (!qword_256A96BA8)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDD4C4, &type metadata for TabBarStyle.NoneCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A96BA8);
  }
  return result;
}

unint64_t sub_23BCCCB64()
{
  unint64_t result;

  result = qword_256A96BB0;
  if (!qword_256A96BB0)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDD4EC, &type metadata for TabBarStyle.NoneCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A96BB0);
  }
  return result;
}

unint64_t sub_23BCCCBAC()
{
  unint64_t result;

  result = qword_256A96BB8;
  if (!qword_256A96BB8)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDD474, &type metadata for TabBarStyle.StandardCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A96BB8);
  }
  return result;
}

unint64_t sub_23BCCCBF4()
{
  unint64_t result;

  result = qword_256A96BC0;
  if (!qword_256A96BC0)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDD49C, &type metadata for TabBarStyle.StandardCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A96BC0);
  }
  return result;
}

unint64_t sub_23BCCCC3C()
{
  unint64_t result;

  result = qword_256A96BC8;
  if (!qword_256A96BC8)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDD564, &type metadata for TabBarStyle.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A96BC8);
  }
  return result;
}

unint64_t sub_23BCCCC84()
{
  unint64_t result;

  result = qword_256A96BD0;
  if (!qword_256A96BD0)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDD58C, &type metadata for TabBarStyle.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A96BD0);
  }
  return result;
}

uint64_t sub_23BCCCCC8(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x676E6974616F6C66 && a2 == 0xE800000000000000;
  if (v2 || (sub_23BCD85A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701736302 && a2 == 0xE400000000000000 || (sub_23BCD85A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x647261646E617473 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_23BCD85A8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t SignOutEnvironment.init(fetchAccountState:makeAccountChangedStream:makeRemoteBrowsingIdentityUpdatedStream:signOut:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>)
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

ValueMetadata *type metadata accessor for SignOutEnvironment()
{
  return &type metadata for SignOutEnvironment;
}

uint64_t sub_23BCCCE30()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  sub_23BCD85C0();
  sub_23BCD85CC();
  if (v1)
    sub_23BCD817C();
  return sub_23BCD85F0();
}

uint64_t sub_23BCCCE9C()
{
  uint64_t v0;

  if (!*(_QWORD *)(v0 + 8))
    return sub_23BCD85CC();
  sub_23BCD85CC();
  return sub_23BCD817C();
}

uint64_t sub_23BCCCF00()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  sub_23BCD85C0();
  sub_23BCD85CC();
  if (v1)
    sub_23BCD817C();
  return sub_23BCD85F0();
}

uint64_t sub_23BCCCF68(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a1[1];
  v4 = a2[1];
  if (!v3)
    return v4 == 0;
  if (!v4)
    return 0;
  if (*a1 == *a2 && v3 == v4)
    return 1;
  else
    return sub_23BCD85A8();
}

__n128 SidebarModalitiesFeature.init(environment:)@<Q0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 16);
  *a2 = *(_OWORD *)a1;
  a2[1] = v3;
  return result;
}

uint64_t SidebarModalitiesFeature.reduce(localState:sharedState:sideEffects:action:)(uint64_t a1, char *a2, unint64_t *a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(_QWORD);
  int *v26;
  char *v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t *v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t result;
  int *v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t *v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  char *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t *v67;
  uint64_t v68;
  uint64_t v69;

  v67 = a3;
  v61 = a2;
  v6 = type metadata accessor for SidebarModality();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v60 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (uint64_t *)((char *)&v60 - v11);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A954B0);
  v65 = *(_QWORD *)(v13 - 8);
  v66 = v13;
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v60 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v60 - v17;
  v19 = type metadata accessor for SidebarModalitiesAction();
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)&v60 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = *v4;
  v64 = v4[1];
  v23 = v4[2];
  v24 = v4[3];
  v62 = v22;
  v63 = v23;
  sub_23BCA8DD0(a4, (uint64_t)v21, v25);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v21, 1, v6) == 1)
  {
    v26 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_256A95320);
    v27 = &v18[v26[16]];
    v28 = &v18[v26[20]];
    v29 = &v18[v26[24]];
    sub_23BCCD530();
    v68 = 0;
    v69 = 0;
    sub_23BCD841C();
    v30 = *MEMORY[0x24BE2B570];
    v31 = sub_23BCD8098();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 104))(v27, v30, v31);
    v32 = (_QWORD *)swift_allocObject();
    v33 = v64;
    v32[2] = v62;
    v32[3] = v33;
    v32[4] = v63;
    v32[5] = v24;
    *(_QWORD *)v29 = &unk_256A96BF8;
    *((_QWORD *)v29 + 1) = v32;
    swift_retain();
    swift_retain();
    sub_23BCD8260();
    v34 = *MEMORY[0x24BE2B558];
    v35 = sub_23BCD808C();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 104))(v28, v34, v35);
    v37 = v65;
    v36 = v66;
    (*(void (**)(char *, _QWORD, uint64_t))(v65 + 104))(v18, *MEMORY[0x24BE2B438], v66);
    v38 = v67;
    v39 = *v67;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v39 = sub_23BCA9BD4(0, *(_QWORD *)(v39 + 16) + 1, 1, v39);
    v41 = *(_QWORD *)(v39 + 16);
    v40 = *(_QWORD *)(v39 + 24);
    if (v41 >= v40 >> 1)
      v39 = sub_23BCA9BD4(v40 > 1, v41 + 1, 1, v39);
    *(_QWORD *)(v39 + 16) = v41 + 1;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v37 + 32))(v39+ ((*(unsigned __int8 *)(v37 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80))+ *(_QWORD *)(v37 + 72) * v41, v18, v36);
    *v38 = v39;
  }
  else
  {
    sub_23BCCD4EC((uint64_t)v21, (uint64_t)v12);
    v61[*(int *)(type metadata accessor for SidebarModalitiesState() + 24)] = 0;
    v43 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_256A95320);
    v60 = &v16[v43[12]];
    v44 = &v16[v43[16]];
    v61 = &v16[v43[20]];
    v45 = &v16[v43[24]];
    v46 = v12[1];
    v68 = *v12;
    v69 = v46;
    sub_23BCCD530();
    swift_bridgeObjectRetain();
    sub_23BCD841C();
    v47 = *MEMORY[0x24BE2B570];
    v48 = sub_23BCD8098();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v48 - 8) + 104))(v44, v47, v48);
    sub_23BCA8DD0((uint64_t)v12, (uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for SidebarModality);
    v49 = (*(unsigned __int8 *)(v7 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    v50 = (_QWORD *)swift_allocObject();
    v51 = v64;
    v50[2] = v62;
    v50[3] = v51;
    v50[4] = v63;
    v50[5] = v24;
    sub_23BCCD4EC((uint64_t)v10, (uint64_t)v50 + v49);
    *(_QWORD *)v45 = &unk_256A96BE8;
    *((_QWORD *)v45 + 1) = v50;
    swift_retain();
    swift_retain();
    sub_23BCD8260();
    v52 = *MEMORY[0x24BE2B558];
    v53 = sub_23BCD808C();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v53 - 8) + 104))(v61, v52, v53);
    v55 = v65;
    v54 = v66;
    (*(void (**)(char *, _QWORD, uint64_t))(v65 + 104))(v16, *MEMORY[0x24BE2B438], v66);
    v56 = v67;
    v57 = *v67;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v57 = sub_23BCA9BD4(0, *(_QWORD *)(v57 + 16) + 1, 1, v57);
    v59 = *(_QWORD *)(v57 + 16);
    v58 = *(_QWORD *)(v57 + 24);
    if (v59 >= v58 >> 1)
      v57 = sub_23BCA9BD4(v58 > 1, v59 + 1, 1, v57);
    *(_QWORD *)(v57 + 16) = v59 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v55 + 32))(v57+ ((*(unsigned __int8 *)(v55 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v55 + 80))+ *(_QWORD *)(v55 + 72) * v59, v16, v54);
    *v56 = v57;
    return sub_23BCB37F0((uint64_t)v12);
  }
  return result;
}

uint64_t sub_23BCCD4EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SidebarModality();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_23BCCD530()
{
  unint64_t result;

  result = qword_256A96BD8;
  if (!qword_256A96BD8)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDD840, &type metadata for SidebarModalitiesFeature.TaskIdentifier);
    atomic_store(result, &qword_256A96BD8);
  }
  return result;
}

uint64_t sub_23BCCD574(uint64_t a1, int *a2)
{
  _QWORD *v2;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v2[2] = sub_23BCD8254();
  v2[3] = sub_23BCD8248();
  v6 = (uint64_t (*)(void))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  v2[4] = v4;
  *v4 = v2;
  v4[1] = sub_23BCCD5F0;
  return v6();
}

uint64_t sub_23BCCD5F0()
{
  swift_task_dealloc();
  sub_23BCD8230();
  return swift_task_switch();
}

uint64_t sub_23BCCD660(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;

  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  sub_23BCD8254();
  v6[5] = sub_23BCD8248();
  v6[6] = sub_23BCD8230();
  v6[7] = v7;
  return swift_task_switch();
}

uint64_t sub_23BCCD6D0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t, uint64_t);

  v1 = *(uint64_t **)(v0 + 32);
  v3 = *v1;
  v2 = v1[1];
  v6 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(v0 + 16) + *(_QWORD *)(v0 + 16));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v4;
  *v4 = v0;
  v4[1] = sub_23BCCD740;
  return v6(v3, v2);
}

uint64_t sub_23BCCD740()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23BCCD7A0()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23BCCD7D4()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23BCCD808()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for SidebarModality();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (v2 + 48) & ~v2;
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  v4 = v0 + v3 + *(int *)(v1 + 24);
  v5 = sub_23BCD7900();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return swift_deallocObject();
}

uint64_t sub_23BCCD8A4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for SidebarModality() - 8) + 80);
  v5 = v1[2];
  v6 = v1[3];
  v7 = v1[4];
  v8 = v1[5];
  v9 = (uint64_t)v1 + ((v4 + 48) & ~v4);
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = sub_23BCA8C74;
  return sub_23BCCD660(a1, v5, v6, v7, v8, v9);
}

uint64_t sub_23BCCD940()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23BCCD96C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23BCAA044;
  return sub_23BCCD574(a1, v4);
}

uint64_t sub_23BCCD9E0()
{
  return sub_23BC9B4D8(&qword_256A96C00, (uint64_t (*)(uint64_t))type metadata accessor for SidebarModalitiesAction, (uint64_t)&protocol conformance descriptor for SidebarModalitiesAction);
}

uint64_t sub_23BCCDA0C()
{
  return sub_23BC9B4D8(&qword_256A96C08, (uint64_t (*)(uint64_t))type metadata accessor for SidebarModalitiesAction, (uint64_t)&protocol conformance descriptor for SidebarModalitiesAction);
}

uint64_t sub_23BCCDA38()
{
  return sub_23BC9B4D8(&qword_256A96C10, (uint64_t (*)(uint64_t))type metadata accessor for SidebarModalitiesState, (uint64_t)&protocol conformance descriptor for SidebarModalitiesState);
}

ValueMetadata *type metadata accessor for SidebarModalitiesFeature()
{
  return &type metadata for SidebarModalitiesFeature;
}

_QWORD *initializeBufferWithCopyOfBuffer for SidebarModalitiesFeature.TaskIdentifier(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for SidebarModalitiesFeature.TaskIdentifier()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for SidebarModalitiesFeature.TaskIdentifier(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for SidebarModalitiesFeature.TaskIdentifier(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SidebarModalitiesFeature.TaskIdentifier(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SidebarModalitiesFeature.TaskIdentifier(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_23BCCDBBC(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_23BCCDBD4(_QWORD *result, int a2)
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

ValueMetadata *type metadata accessor for SidebarModalitiesFeature.TaskIdentifier()
{
  return &type metadata for SidebarModalitiesFeature.TaskIdentifier;
}

unint64_t sub_23BCCDC08()
{
  unint64_t result;

  result = qword_256A96C18;
  if (!qword_256A96C18)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDD818, &type metadata for SidebarModalitiesFeature.TaskIdentifier);
    atomic_store(result, (unint64_t *)&qword_256A96C18);
  }
  return result;
}

uint64_t TabBarState.items.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t TabBarState.shouldScrollToOrigin.getter(uint64_t a1)
{
  uint64_t v1;

  return *(unsigned __int8 *)(v1 + *(int *)(a1 + 52));
}

uint64_t TabBarState.shouldScrollToOrigin.setter(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  *(_BYTE *)(v2 + *(int *)(a2 + 52)) = result;
  return result;
}

uint64_t (*TabBarState.shouldScrollToOrigin.modify())(_QWORD, _QWORD, _QWORD)
{
  return nullsub_1;
}

uint64_t TabBarState.selectedIndex.getter(uint64_t a1)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + *(int *)(a1 + 56));
}

uint64_t TabBarState.selectedIndex.setter(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + *(int *)(a2 + 56)) = result;
  return result;
}

uint64_t (*TabBarState.selectedIndex.modify())(_QWORD, _QWORD, _QWORD)
{
  return nullsub_1;
}

uint64_t TabBarState.init(items:style:prefersTightPadding:locale:upNextCount:selectedIndex:shouldScrollToOrigin:)@<X0>(uint64_t a1@<X0>, char *a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char a7@<W6>, uint64_t a8@<X7>, _BYTE *a9@<X8>, uint64_t a10)
{
  char v17;
  int *v18;
  _BYTE *v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  uint64_t result;

  v17 = *a2;
  v18 = (int *)type metadata accessor for TabBarState(0, a8, a10, a4);
  *(_QWORD *)&a9[v18[12]] = a1;
  a9[1] = v17;
  *a9 = a3;
  v19 = &a9[v18[10]];
  v20 = sub_23BCD7984();
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(v19, a4, v20);
  v21 = &a9[v18[11]];
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A96C20);
  result = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 32))(v21, a5, v22);
  *(_QWORD *)&a9[v18[14]] = a6;
  a9[v18[13]] = a7;
  return result;
}

uint64_t type metadata accessor for TabBarState(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for TabBarState);
}

uint64_t TabBarState.hash(into:)()
{
  sub_23BCD85D8();
  sub_23BCD85CC();
  sub_23BCD7984();
  sub_23BC9E91C(&qword_256A96738, MEMORY[0x24BDCEED0]);
  sub_23BCD8110();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A96C20);
  sub_23BCCDE9C();
  sub_23BCD8110();
  swift_bridgeObjectRetain();
  sub_23BCD820C();
  swift_bridgeObjectRelease();
  sub_23BCD85D8();
  return sub_23BCD85CC();
}

unint64_t sub_23BCCDE9C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_256A96C28;
  if (!qword_256A96C28)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A96C20);
    v2 = MEMORY[0x24BEE1778];
    result = MEMORY[0x24260FFB0](MEMORY[0x24BE2B400], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_256A96C28);
  }
  return result;
}

BOOL static TabBarState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4)
{
  int *v6;

  if (*a1 == *a2
    && a1[1] == a2[1]
    && (v6 = (int *)type metadata accessor for TabBarState(0, a3, a4, a4),
        (MEMORY[0x24260EEA0](&a1[v6[10]], &a2[v6[10]]) & 1) != 0)
    && (sub_23BCD8050() & 1) != 0
    && (sub_23BCD8218() & 1) != 0
    && a1[v6[13]] == a2[v6[13]])
  {
    return *(_QWORD *)&a1[v6[14]] == *(_QWORD *)&a2[v6[14]];
  }
  else
  {
    return 0;
  }
}

uint64_t sub_23BCCDFEC(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000013 && a2 == 0x800000023BCE6170 || (sub_23BCD85A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656C797473 && a2 == 0xE500000000000000 || (sub_23BCD85A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x656C61636F6CLL && a2 == 0xE600000000000000 || (sub_23BCD85A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6F437478654E7075 && a2 == 0xEB00000000746E75 || (sub_23BCD85A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x736D657469 && a2 == 0xE500000000000000 || (sub_23BCD85A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x800000023BCE6730 || (sub_23BCD85A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x64657463656C6573 && a2 == 0xED00007865646E49)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    v5 = sub_23BCD85A8();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 6;
    else
      return 7;
  }
}

uint64_t sub_23BCCE2EC(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23BCCE324 + 4 * byte_23BCDD880[a1]))(0xD000000000000013, 0x800000023BCE6170);
}

uint64_t sub_23BCCE324()
{
  return 0x656C797473;
}

uint64_t sub_23BCCE338()
{
  return 0x656C61636F6CLL;
}

uint64_t sub_23BCCE34C()
{
  return 0x6F437478654E7075;
}

uint64_t sub_23BCCE36C()
{
  return 0x736D657469;
}

uint64_t sub_23BCCE380(uint64_t a1)
{
  return a1 + 1;
}

uint64_t sub_23BCCE398()
{
  return 0x64657463656C6573;
}

uint64_t sub_23BCCE3BC()
{
  unsigned __int8 *v0;

  return sub_23BCCE2EC(*v0);
}

uint64_t sub_23BCCE3C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23BCCDFEC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23BCCE3F4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23BCCF6F4();
  *a1 = result;
  return result;
}

uint64_t sub_23BCCE41C(uint64_t a1)
{
  MEMORY[0x24260FFB0](&unk_23BCDDA98, a1);
  return sub_23BCD8614();
}

uint64_t sub_23BCCE450(uint64_t a1)
{
  MEMORY[0x24260FFB0](&unk_23BCDDA98, a1);
  return sub_23BCD8620();
}

uint64_t TabBarState.encode(to:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  uint64_t v20;
  uint64_t v21;
  char v22;

  v6 = *(_QWORD *)(a2 + 24);
  v16 = *(_QWORD *)(a2 + 16);
  v17 = v6;
  v7 = type metadata accessor for TabBarState.CodingKeys(255, v16, v6, a4);
  MEMORY[0x24260FFB0](&unk_23BCDDA98, v7);
  v8 = sub_23BCD8590();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v16 - v10;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v12 = v18;
  sub_23BCD8608();
  LOBYTE(v21) = 0;
  v13 = v19;
  sub_23BCD856C();
  if (!v13)
  {
    LOBYTE(v21) = *(_BYTE *)(v12 + 1);
    v22 = 1;
    sub_23BCCED80();
    sub_23BCD8584();
    LOBYTE(v21) = 2;
    sub_23BCD7984();
    sub_23BC9E91C(&qword_256A94CC0, MEMORY[0x24BDCEEC8]);
    sub_23BCD8584();
    LOBYTE(v21) = 3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A96C20);
    sub_23BCCEE08(&qword_256A96C38, MEMORY[0x24BE2B3F8]);
    sub_23BCD8584();
    v21 = *(_QWORD *)(v12 + *(int *)(a2 + 48));
    v22 = 4;
    v14 = sub_23BCD8200();
    v20 = *(_QWORD *)(v17 + 16);
    MEMORY[0x24260FFB0](MEMORY[0x24BEE12A0], v14, &v20);
    sub_23BCD8584();
    LOBYTE(v21) = 5;
    sub_23BCD856C();
    LOBYTE(v21) = 6;
    sub_23BCD8578();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t TabBarState.hashValue.getter()
{
  sub_23BCD85C0();
  TabBarState.hash(into:)();
  return sub_23BCD85F0();
}

uint64_t TabBarState.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
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
  char v18;
  _BYTE *v19;
  int *v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  _BYTE *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;

  v30 = a4;
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A96C20);
  v35 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39);
  v32 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23BCD7984();
  v36 = *(_QWORD *)(v8 - 8);
  v37 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v33 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for TabBarState.CodingKeys(255, a2, a3, v10);
  MEMORY[0x24260FFB0](&unk_23BCDDA98, v11);
  v34 = sub_23BCD8548();
  v12 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34);
  v31 = a3;
  v41 = type metadata accessor for TabBarState(0, a2, a3, v13);
  v14 = *(_QWORD *)(v41 - 8);
  MEMORY[0x24BDAC7A8](v41);
  v40 = (char *)&v29 - v15;
  v16 = a1[3];
  v38 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v16);
  v17 = v42;
  sub_23BCD85FC();
  if (v17)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v38);
  v42 = a2;
  v29 = v14;
  LOBYTE(v44) = 0;
  v18 = sub_23BCD8518();
  v19 = v40;
  *v40 = v18 & 1;
  v45 = 1;
  sub_23BCCEDC4();
  sub_23BCD8530();
  v20 = (int *)v41;
  v19[1] = v44;
  LOBYTE(v44) = 2;
  sub_23BC9E91C(&qword_256A94CD8, MEMORY[0x24BDCEEE8]);
  v21 = v33;
  v22 = v37;
  sub_23BCD8530();
  (*(void (**)(_BYTE *, char *, uint64_t))(v36 + 32))(&v19[v20[10]], v21, v22);
  LOBYTE(v44) = 3;
  sub_23BCCEE08(qword_256A96C48, MEMORY[0x24BE2B410]);
  v23 = v32;
  v24 = v39;
  sub_23BCD8530();
  (*(void (**)(_BYTE *, char *, uint64_t))(v35 + 32))(&v19[v20[11]], v23, v24);
  v25 = sub_23BCD8200();
  v45 = 4;
  v43 = *(_QWORD *)(v31 + 8);
  MEMORY[0x24260FFB0](MEMORY[0x24BEE12D0], v25, &v43);
  sub_23BCD8530();
  *(_QWORD *)&v19[v20[12]] = v44;
  LOBYTE(v44) = 5;
  v19[v20[13]] = sub_23BCD8518() & 1;
  LOBYTE(v44) = 6;
  v26 = sub_23BCD8524();
  (*(void (**)(_QWORD, uint64_t))(v12 + 8))(0, v34);
  *(_QWORD *)&v19[v20[14]] = v26;
  v27 = v29;
  (*(void (**)(uint64_t, _BYTE *, int *))(v29 + 16))(v30, v19, v20);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v38);
  return (*(uint64_t (**)(_BYTE *, int *))(v27 + 8))(v19, v20);
}

uint64_t sub_23BCCECF0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return TabBarState.init(from:)(a1, *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24), a3);
}

uint64_t sub_23BCCED0C(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return TabBarState.encode(to:)(a1, a2, a3, a4);
}

uint64_t sub_23BCCED28()
{
  sub_23BCD85C0();
  TabBarState.hash(into:)();
  return sub_23BCD85F0();
}

BOOL sub_23BCCED68(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  return static TabBarState.== infix(_:_:)(a1, a2, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24));
}

uint64_t type metadata accessor for TabBarState.CodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for TabBarState.CodingKeys);
}

unint64_t sub_23BCCED80()
{
  unint64_t result;

  result = qword_256A96C30;
  if (!qword_256A96C30)
  {
    result = MEMORY[0x24260FFB0](&protocol conformance descriptor for TabBarStyle, &type metadata for TabBarStyle);
    atomic_store(result, (unint64_t *)&qword_256A96C30);
  }
  return result;
}

unint64_t sub_23BCCEDC4()
{
  unint64_t result;

  result = qword_256A96C40;
  if (!qword_256A96C40)
  {
    result = MEMORY[0x24260FFB0](&protocol conformance descriptor for TabBarStyle, &type metadata for TabBarStyle);
    atomic_store(result, (unint64_t *)&qword_256A96C40);
  }
  return result;
}

uint64_t sub_23BCCEE08(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  _QWORD v6[2];

  result = *a1;
  if (!result)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A96C20);
    v6[0] = MEMORY[0x24BEE1798];
    v6[1] = MEMORY[0x24BEE1770];
    result = MEMORY[0x24260FFB0](a2, v5, v6);
    atomic_store(result, a1);
  }
  return result;
}

void sub_23BCCEE6C()
{
  JUMPOUT(0x24260FFB0);
}

void sub_23BCCEE7C()
{
  unint64_t v0;
  unint64_t v1;

  sub_23BCD7984();
  if (v0 <= 0x3F)
  {
    sub_23BCCF51C();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

_QWORD *sub_23BCCEF30(_WORD *a1, _QWORD *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *(_WORD *)a2;
    v7 = a3[10];
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_23BCD7984();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
    v11 = a3[11];
    v12 = (char *)v4 + v11;
    v13 = (char *)a2 + v11;
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A96C20);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
    v15 = a3[13];
    *(_QWORD *)((char *)v4 + a3[12]) = *(_QWORD *)((char *)a2 + a3[12]);
    *((_BYTE *)v4 + v15) = *((_BYTE *)a2 + v15);
    *(_QWORD *)((char *)v4 + a3[14]) = *(_QWORD *)((char *)a2 + a3[14]);
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_23BCCF01C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a1 + *(int *)(a2 + 40);
  v5 = sub_23BCD7984();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = a1 + *(int *)(a2 + 44);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A96C20);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  return swift_bridgeObjectRelease();
}

_WORD *sub_23BCCF098(_WORD *a1, _WORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;

  *a1 = *a2;
  v6 = a3[10];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_23BCD7984();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
  v10 = a3[11];
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A96C20);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
  v14 = a3[13];
  *(_QWORD *)((char *)a1 + a3[12]) = *(_QWORD *)((char *)a2 + a3[12]);
  *((_BYTE *)a1 + v14) = *((_BYTE *)a2 + v14);
  *(_QWORD *)((char *)a1 + a3[14]) = *(_QWORD *)((char *)a2 + a3[14]);
  swift_bridgeObjectRetain();
  return a1;
}

_BYTE *sub_23BCCF158(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  _BYTE *v12;
  uint64_t v13;

  *a1 = *a2;
  a1[1] = a2[1];
  v6 = a3[10];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_23BCD7984();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = a3[11];
  v11 = &a1[v10];
  v12 = &a2[v10];
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A96C20);
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v13 - 8) + 24))(v11, v12, v13);
  *(_QWORD *)&a1[a3[12]] = *(_QWORD *)&a2[a3[12]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[a3[13]] = a2[a3[13]];
  *(_QWORD *)&a1[a3[14]] = *(_QWORD *)&a2[a3[14]];
  return a1;
}

_WORD *sub_23BCCF230(_WORD *a1, _WORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;

  *a1 = *a2;
  v6 = a3[10];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_23BCD7984();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[11];
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A96C20);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v11, v12, v13);
  v14 = a3[13];
  *(_QWORD *)((char *)a1 + a3[12]) = *(_QWORD *)((char *)a2 + a3[12]);
  *((_BYTE *)a1 + v14) = *((_BYTE *)a2 + v14);
  *(_QWORD *)((char *)a1 + a3[14]) = *(_QWORD *)((char *)a2 + a3[14]);
  return a1;
}

_BYTE *sub_23BCCF2EC(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;

  *a1 = *a2;
  a1[1] = a2[1];
  v6 = a3[10];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_23BCD7984();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  v10 = a3[11];
  v11 = &a1[v10];
  v12 = &a2[v10];
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A96C20);
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v13 - 8) + 40))(v11, v12, v13);
  *(_QWORD *)&a1[a3[12]] = *(_QWORD *)&a2[a3[12]];
  swift_bridgeObjectRelease();
  v14 = a3[14];
  a1[a3[13]] = a2[a3[13]];
  *(_QWORD *)&a1[v14] = *(_QWORD *)&a2[v14];
  return a1;
}

uint64_t sub_23BCCF3B8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23BCCF3C4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v12;

  v6 = sub_23BCD7984();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = a3[10];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + v9, a2, v8);
  }
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A96C20);
  v7 = *(_QWORD *)(v10 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v10;
    v9 = a3[11];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + v9, a2, v8);
  }
  v12 = *(_QWORD *)(a1 + a3[12]);
  if (v12 >= 0xFFFFFFFF)
    LODWORD(v12) = -1;
  return (v12 + 1);
}

uint64_t sub_23BCCF46C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23BCCF478(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;

  v8 = sub_23BCD7984();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = a4[10];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + v11, a2, a2, v10);
  }
  result = __swift_instantiateConcreteTypeFromMangledName(&qword_256A96C20);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = a4[11];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + v11, a2, a2, v10);
  }
  *(_QWORD *)(a1 + a4[12]) = (a2 - 1);
  return result;
}

void sub_23BCCF51C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256A96CD0[0])
  {
    v0 = sub_23BCD8068();
    if (!v1)
      atomic_store(v0, qword_256A96CD0);
  }
}

uint64_t sub_23BCCF578(unsigned __int8 *a1, unsigned int a2)
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

uint64_t sub_23BCCF608(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23BCCF654 + 4 * byte_23BCDD88C[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_23BCCF688 + 4 * byte_23BCDD887[v4]))();
}

uint64_t sub_23BCCF688(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BCCF690(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23BCCF698);
  return result;
}

uint64_t sub_23BCCF6A4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23BCCF6ACLL);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_23BCCF6B0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BCCF6B8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void sub_23BCCF6C4()
{
  JUMPOUT(0x24260FFB0);
}

void sub_23BCCF6D4()
{
  JUMPOUT(0x24260FFB0);
}

void sub_23BCCF6E4()
{
  JUMPOUT(0x24260FFB0);
}

uint64_t sub_23BCCF6F4()
{
  return 7;
}

uint64_t AnotherNavigationSplitViewState.isSidebarVisible.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t AnotherNavigationSplitViewState.isSidebarVisible.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*AnotherNavigationSplitViewState.isSidebarVisible.modify())(_QWORD, _QWORD, _QWORD)
{
  return nullsub_1;
}

FitnessAppRoot::AnotherNavigationSplitViewState __swiftcall AnotherNavigationSplitViewState.init(isSidebarVisible:)(FitnessAppRoot::AnotherNavigationSplitViewState isSidebarVisible)
{
  FitnessAppRoot::AnotherNavigationSplitViewState *v1;

  v1->isSidebarVisible = isSidebarVisible.isSidebarVisible;
  return isSidebarVisible;
}

unint64_t sub_23BCCF724()
{
  return 0xD000000000000010;
}

uint64_t sub_23BCCF740@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23BCCFDE0(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23BCCF768()
{
  sub_23BCCF8A0();
  return sub_23BCD8614();
}

uint64_t sub_23BCCF790()
{
  sub_23BCCF8A0();
  return sub_23BCD8620();
}

uint64_t AnotherNavigationSplitViewState.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A96D58);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23BCCF8A0();
  sub_23BCD8608();
  sub_23BCD856C();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_23BCCF8A0()
{
  unint64_t result;

  result = qword_256A96D60;
  if (!qword_256A96D60)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDDC64, &type metadata for AnotherNavigationSplitViewState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A96D60);
  }
  return result;
}

uint64_t AnotherNavigationSplitViewState.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v9;
  uint64_t v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A96D68);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23BCCF8A0();
  sub_23BCD85FC();
  if (!v2)
  {
    v9 = sub_23BCD8518();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9 & 1;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_23BCCF9EC@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return AnotherNavigationSplitViewState.init(from:)(a1, a2);
}

uint64_t sub_23BCCFA00(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A96D58);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23BCCF8A0();
  sub_23BCD8608();
  sub_23BCD856C();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

BOOL static AnotherNavigationSplitViewState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t getEnumTagSinglePayload for AnotherNavigationSplitViewState(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AnotherNavigationSplitViewState(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23BCCFBEC + 4 * byte_23BCDDAF5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23BCCFC20 + 4 * byte_23BCDDAF0[v4]))();
}

uint64_t sub_23BCCFC20(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BCCFC28(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23BCCFC30);
  return result;
}

uint64_t sub_23BCCFC3C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23BCCFC44);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23BCCFC48(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BCCFC50(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AnotherNavigationSplitViewState()
{
  return &type metadata for AnotherNavigationSplitViewState;
}

uint64_t storeEnumTagSinglePayload for AnotherNavigationSplitViewState.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23BCCFCAC + 4 * byte_23BCDDAFA[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23BCCFCCC + 4 * byte_23BCDDAFF[v4]))();
}

_BYTE *sub_23BCCFCAC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23BCCFCCC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23BCCFCD4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23BCCFCDC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23BCCFCE4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23BCCFCEC(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for AnotherNavigationSplitViewState.CodingKeys()
{
  return &type metadata for AnotherNavigationSplitViewState.CodingKeys;
}

unint64_t sub_23BCCFD0C()
{
  unint64_t result;

  result = qword_256A96D70;
  if (!qword_256A96D70)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDDC3C, &type metadata for AnotherNavigationSplitViewState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A96D70);
  }
  return result;
}

unint64_t sub_23BCCFD54()
{
  unint64_t result;

  result = qword_256A96D78;
  if (!qword_256A96D78)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDDBAC, &type metadata for AnotherNavigationSplitViewState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A96D78);
  }
  return result;
}

unint64_t sub_23BCCFD9C()
{
  unint64_t result;

  result = qword_256A96D80;
  if (!qword_256A96D80)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDDBD4, &type metadata for AnotherNavigationSplitViewState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A96D80);
  }
  return result;
}

uint64_t sub_23BCCFDE0(uint64_t a1, uint64_t a2)
{
  char v2;
  char v3;

  if (a1 == 0xD000000000000010 && a2 == 0x800000023BCE5730)
  {
    swift_bridgeObjectRelease();
    v2 = 0;
  }
  else
  {
    v3 = sub_23BCD85A8();
    swift_bridgeObjectRelease();
    v2 = v3 ^ 1;
  }
  return v2 & 1;
}

uint64_t sub_23BCCFE64(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v4 = sub_23BCD7BD0();
  MEMORY[0x24BDAC7A8](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))((char *)&v7 - v5, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_23BCD7BDC();
}

uint64_t sub_23BCCFF28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v5 = sub_23BCD7BD0();
  MEMORY[0x24BDAC7A8](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 16))((char *)&v8 - v6, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_23BCD7BDC();
}

uint64_t sub_23BCCFFEC()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A96E80);
  sub_23BCA37E0(&qword_256A96E88, &qword_256A96E80, MEMORY[0x24BE2B5E8]);
  return sub_23BCD7A5C();
}

uint64_t sub_23BCD005C()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256A96728);
  sub_23BCD7A14();
  return v1;
}

uint64_t SignOutView.init(store:monogramViewBuilder:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  char v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  char v15;
  uint64_t result;
  char v17;
  uint64_t v18;

  v10 = sub_23BCD7A2C();
  v12 = v11;
  v13 = v10 & 1;
  v15 = v14 & 1;
  sub_23BCD7F54();
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a1;
  *(_QWORD *)(result + 24) = a2;
  *(_QWORD *)a5 = sub_23BCA3440;
  *(_QWORD *)(a5 + 8) = result;
  *(_BYTE *)(a5 + 16) = 0;
  *(_QWORD *)(a5 + 24) = a3;
  *(_QWORD *)(a5 + 32) = a4;
  *(_BYTE *)(a5 + 40) = v13;
  *(_QWORD *)(a5 + 48) = v12;
  *(_BYTE *)(a5 + 56) = v15;
  *(_BYTE *)(a5 + 64) = v17;
  *(_QWORD *)(a5 + 72) = v18;
  return result;
}

uint64_t sub_23BCD0178()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t SignOutView.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __int128 *v2;
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
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t OpaqueTypeConformance2;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void (*v59)(uint64_t, uint64_t);
  _QWORD v61[2];
  char *v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  char *v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  __int128 *v88;
  _QWORD v89[2];
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _QWORD v95[2];
  _QWORD v96[2];
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  char v102;

  v84 = a2;
  v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A96D88);
  v85 = *(_QWORD *)(a1 + 16);
  v5 = a1;
  v83 = a1;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A96D90);
  v6 = sub_23BCD7BE8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A96D98);
  v7 = sub_23BCD7BE8();
  v8 = sub_23BCA37E0(&qword_256A96DA0, &qword_256A96D88, MEMORY[0x24BDF4700]);
  v77 = *(_QWORD *)(v5 + 24);
  v96[0] = v77;
  v96[1] = sub_23BCD08C4();
  v9 = MEMORY[0x24BDEF3E0];
  v95[0] = MEMORY[0x24260FFB0](MEMORY[0x24BDEF3E0], v6, v96);
  v95[1] = sub_23BCD0948();
  v10 = MEMORY[0x24260FFB0](v9, v7, v95);
  *(_QWORD *)&v97 = v4;
  *((_QWORD *)&v97 + 1) = v7;
  *(_QWORD *)&v98 = v8;
  *((_QWORD *)&v98 + 1) = v10;
  v73 = sub_23BCD7F48();
  v72 = MEMORY[0x24260FFB0](MEMORY[0x24BDF41A8], v73);
  v11 = sub_23BCD7F84();
  v75 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v67 = (char *)v61 - v12;
  v13 = MEMORY[0x24260FFB0](MEMORY[0x24BDF43B0], v11);
  v14 = sub_23BCD0A78();
  *(_QWORD *)&v97 = v11;
  *((_QWORD *)&v97 + 1) = &type metadata for SidebarToolbarLeadItemButtonStyle;
  *(_QWORD *)&v98 = v13;
  *((_QWORD *)&v98 + 1) = v14;
  v65 = v14;
  v66 = v13;
  v15 = v14;
  v16 = MEMORY[0x24260FF74](0, &v97, MEMORY[0x24BDF22E0], 0);
  v69 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)v61 - v17;
  *(_QWORD *)&v97 = v11;
  *((_QWORD *)&v97 + 1) = &type metadata for SidebarToolbarLeadItemButtonStyle;
  *(_QWORD *)&v98 = v13;
  *((_QWORD *)&v98 + 1) = v15;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  *(_QWORD *)&v97 = v16;
  *((_QWORD *)&v97 + 1) = OpaqueTypeConformance2;
  v20 = OpaqueTypeConformance2;
  v61[1] = OpaqueTypeConformance2;
  v21 = MEMORY[0x24260FF74](0, &v97, MEMORY[0x24BE37C20], 0);
  v70 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)v61 - v22;
  *(_QWORD *)&v97 = v16;
  *((_QWORD *)&v97 + 1) = v20;
  v24 = swift_getOpaqueTypeConformance2();
  *(_QWORD *)&v97 = v21;
  *((_QWORD *)&v97 + 1) = v24;
  v63 = v24;
  v25 = MEMORY[0x24260FF74](0, &v97, MEMORY[0x24BDF3758], 0);
  v79 = *(_QWORD *)(v25 - 8);
  v26 = v25;
  v74 = v25;
  MEMORY[0x24BDAC7A8](v25);
  v62 = (char *)v61 - v27;
  *(_QWORD *)&v97 = v21;
  *((_QWORD *)&v97 + 1) = v24;
  v71 = swift_getOpaqueTypeConformance2();
  *(_QWORD *)&v97 = v26;
  *((_QWORD *)&v97 + 1) = MEMORY[0x24BEE1328];
  *(_QWORD *)&v98 = v71;
  *((_QWORD *)&v98 + 1) = MEMORY[0x24BEE1340];
  v28 = MEMORY[0x24260FF74](0, &v97, MEMORY[0x24BDF38E8], 0);
  v81 = *(_QWORD *)(v28 - 8);
  v78 = v28;
  MEMORY[0x24BDAC7A8](v28);
  v68 = (char *)v61 - v29;
  v64 = sub_23BCD7B04();
  v82 = *(_QWORD *)(v64 - 8);
  v30 = MEMORY[0x24BDAC7A8](v64);
  v76 = (char *)v61 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v30);
  v80 = (uint64_t)v61 - v32;
  v33 = v2[3];
  v99 = v2[2];
  v100 = v33;
  v101 = v2[4];
  v34 = v2[1];
  v97 = *v2;
  v98 = v34;
  v35 = swift_allocObject();
  v36 = v85;
  v37 = v77;
  *(_QWORD *)(v35 + 16) = v85;
  *(_QWORD *)(v35 + 24) = v37;
  v38 = v2[3];
  *(_OWORD *)(v35 + 64) = v2[2];
  *(_OWORD *)(v35 + 80) = v38;
  *(_OWORD *)(v35 + 96) = v2[4];
  v39 = v2[1];
  *(_OWORD *)(v35 + 32) = *v2;
  *(_OWORD *)(v35 + 48) = v39;
  v86 = v36;
  v87 = v37;
  v40 = v36;
  v88 = &v97;
  sub_23BCD0CE4((uint64_t)&v97);
  v41 = v67;
  sub_23BCD7F78();
  sub_23BCD7DF8();
  (*(void (**)(char *, uint64_t))(v75 + 8))(v41, v11);
  sub_23BCD7DBC();
  (*(void (**)(char *, uint64_t))(v69 + 8))(v18, v16);
  v92 = v99;
  v93 = v100;
  v94 = v101;
  v90 = v97;
  v91 = v98;
  sub_23BCD005C();
  v42 = v62;
  sub_23BCD7E4C();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v70 + 8))(v23, v21);
  LOBYTE(v90) = BYTE8(v99) & 1;
  *((_QWORD *)&v90 + 1) = v100;
  LOBYTE(v91) = BYTE8(v100) & 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A96728);
  sub_23BCD7A08();
  LOBYTE(v90) = v102;
  v43 = swift_allocObject();
  *(_QWORD *)(v43 + 16) = v40;
  *(_QWORD *)(v43 + 24) = v37;
  v44 = v100;
  *(_OWORD *)(v43 + 64) = v99;
  *(_OWORD *)(v43 + 80) = v44;
  *(_OWORD *)(v43 + 96) = v101;
  v45 = v98;
  *(_OWORD *)(v43 + 32) = v97;
  *(_OWORD *)(v43 + 48) = v45;
  sub_23BCD0CE4((uint64_t)&v97);
  v46 = v68;
  v47 = v74;
  v48 = MEMORY[0x24BEE1328];
  v49 = v71;
  v50 = MEMORY[0x24BEE1340];
  sub_23BCD7E88();
  swift_release();
  (*(void (**)(char *, uint64_t))(v79 + 8))(v42, v47);
  v51 = swift_allocObject();
  *(_QWORD *)(v51 + 16) = v85;
  *(_QWORD *)(v51 + 24) = v37;
  v52 = v100;
  *(_OWORD *)(v51 + 64) = v99;
  *(_OWORD *)(v51 + 80) = v52;
  *(_OWORD *)(v51 + 96) = v101;
  v53 = v98;
  *(_OWORD *)(v51 + 32) = v97;
  *(_OWORD *)(v51 + 48) = v53;
  sub_23BCD0CE4((uint64_t)&v97);
  *(_QWORD *)&v90 = v47;
  *((_QWORD *)&v90 + 1) = v48;
  *(_QWORD *)&v91 = v49;
  *((_QWORD *)&v91 + 1) = v50;
  v54 = swift_getOpaqueTypeConformance2();
  v55 = (uint64_t)v76;
  v56 = v78;
  sub_23BCD7E7C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v81 + 8))(v46, v56);
  v89[0] = v54;
  v89[1] = MEMORY[0x24BDF0910];
  v57 = v64;
  MEMORY[0x24260FFB0](MEMORY[0x24BDED308], v64, v89);
  v58 = v80;
  sub_23BCACF3C(v55, v57, v80);
  v59 = *(void (**)(uint64_t, uint64_t))(v82 + 8);
  v59(v55, v57);
  sub_23BCAC3E8(v58, v57, v84);
  return ((uint64_t (*)(uint64_t, uint64_t))v59)(v58, v57);
}

unint64_t sub_23BCD08C4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_256A96DA8;
  if (!qword_256A96DA8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A96D90);
    v2 = sub_23BCA37E0(&qword_256A96DB0, &qword_256A96DB8, MEMORY[0x24BDF1028]);
    v3[0] = MEMORY[0x24BDF40E8];
    v3[1] = v2;
    result = MEMORY[0x24260FFB0](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256A96DA8);
  }
  return result;
}

unint64_t sub_23BCD0948()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_256A96DC0;
  if (!qword_256A96DC0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A96D98);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A96DC8);
    v2[3] = sub_23BCD09F4();
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = sub_23BCA37E0(&qword_256A96DE8, &qword_256A96DF0, MEMORY[0x24BDF1028]);
    result = MEMORY[0x24260FFB0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256A96DC0);
  }
  return result;
}

unint64_t sub_23BCD09F4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_256A96DD0;
  if (!qword_256A96DD0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A96DC8);
    v2 = sub_23BCA37E0(&qword_256A96DD8, &qword_256A96DE0, MEMORY[0x24BDF0978]);
    v3[0] = MEMORY[0x24BDF40E8];
    v3[1] = v2;
    result = MEMORY[0x24260FFB0](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256A96DD0);
  }
  return result;
}

unint64_t sub_23BCD0A78()
{
  unint64_t result;

  result = qword_256A96DF8[0];
  if (!qword_256A96DF8[0])
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDAAA4, &type metadata for SidebarToolbarLeadItemButtonStyle);
    atomic_store(result, qword_256A96DF8);
  }
  return result;
}

uint64_t sub_23BCD0AC0()
{
  uint64_t v0;

  return sub_23BCD2548((_OWORD *)(v0 + 32), *(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), 3);
}

uint64_t sub_23BCD0AE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
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
  char *v15;
  uint64_t v16;
  char *v17;
  void (*v18)(char *, uint64_t);
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
  _QWORD v32[2];
  _QWORD v33[3];

  v20 = a1;
  v21 = a4;
  v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A96D88);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A96D90);
  v7 = sub_23BCD7BE8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A96D98);
  v8 = sub_23BCD7BE8();
  v9 = sub_23BCA37E0(&qword_256A96DA0, &qword_256A96D88, MEMORY[0x24BDF4700]);
  v33[0] = a3;
  v33[1] = sub_23BCD08C4();
  v10 = MEMORY[0x24BDEF3E0];
  v32[0] = MEMORY[0x24260FFB0](MEMORY[0x24BDEF3E0], v7, v33);
  v32[1] = sub_23BCD0948();
  v28 = v6;
  v29 = v8;
  v30 = v9;
  v31 = MEMORY[0x24260FFB0](v10, v8, v32);
  v11 = sub_23BCD7F48();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v20 - v16;
  v25 = a2;
  v26 = a3;
  v27 = v20;
  v22 = a2;
  v23 = a3;
  v24 = v20;
  sub_23BCD7F3C();
  MEMORY[0x24260FFB0](MEMORY[0x24BDF41A8], v11);
  sub_23BCACF3C((uint64_t)v15, v11, (uint64_t)v17);
  v18 = *(void (**)(char *, uint64_t))(v12 + 8);
  v18(v15, v11);
  sub_23BCAC3E8((uint64_t)v17, v11, v21);
  return ((uint64_t (*)(char *, uint64_t))v18)(v17, v11);
}

uint64_t sub_23BCD0CD8@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_23BCD0AE0(v1[4], v1[2], v1[3], a1);
}

uint64_t sub_23BCD0CE4(uint64_t a1)
{
  sub_23BCAC8C8();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_23BCD0D40@<X0>(__int128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;

  *(_QWORD *)a4 = sub_23BCD7B7C();
  *(_QWORD *)(a4 + 8) = 0;
  *(_BYTE *)(a4 + 16) = 0;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A96EA0);
  return sub_23BCD0DA0(a1, a2, a3, a4 + *(int *)(v8 + 44));
}

uint64_t sub_23BCD0DA0@<X0>(__int128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
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
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(char *, uint64_t, uint64_t);
  uint64_t v38;
  uint64_t v39;
  void (*v40)(char *, uint64_t);
  uint64_t KeyPath;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  char v46;
  char v47;
  int v48;
  int v49;
  uint64_t v50;
  char v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t ObjCClassFromMetadata;
  id v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char v63;
  char v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  char *v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  unsigned __int8 v94;

  v82 = (char *)a3;
  v88 = a4;
  v6 = sub_23BCD7984();
  MEMORY[0x24BDAC7A8](v6);
  v81 = (char *)&v76 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23BCD8134();
  MEMORY[0x24BDAC7A8](v8);
  v80 = (char *)&v76 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v78 = sub_23BCD7D80();
  v10 = *(_QWORD *)(v78 - 8);
  MEMORY[0x24BDAC7A8](v78);
  v12 = (char *)&v76 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_23BCD7990();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v76 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A96EA8);
  MEMORY[0x24BDAC7A8](v83);
  v18 = (char *)&v76 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A96EB0);
  MEMORY[0x24BDAC7A8](v84);
  v20 = (char *)&v76 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A96EB8);
  v21 = MEMORY[0x24BDAC7A8](v85);
  v87 = (uint64_t)&v76 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)&v76 - v24;
  MEMORY[0x24BDAC7A8](v23);
  v86 = (uint64_t)&v76 - v26;
  v27 = a1[3];
  v91 = a1[2];
  v92 = v27;
  v93 = a1[4];
  v28 = a1[1];
  v89 = *a1;
  v90 = v28;
  v79 = type metadata accessor for SignOutView(0, a2, (uint64_t)v82, v29);
  sub_23BCD1444(v79);
  v82 = v16;
  sub_23BCD799C();
  v30 = *((_QWORD *)a1 + 9);
  LOBYTE(v89) = a1[4] & 1;
  *((_QWORD *)&v89 + 1) = v30;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A95698);
  sub_23BCD7F60();
  LODWORD(v16) = v94;
  v31 = sub_23BCD7D8C();
  if ((_DWORD)v16 == 1)
  {
    v32 = *MEMORY[0x24BDF17C8];
    v77 = v20;
    v33 = v25;
    v34 = v14;
    v35 = v13;
    v36 = v10;
    v37 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 104);
    v38 = v78;
    v37(v12, v32, v78);
    v39 = sub_23BCD7D98();
    swift_release();
    v40 = *(void (**)(char *, uint64_t))(v36 + 8);
    v13 = v35;
    v14 = v34;
    v25 = v33;
    v20 = v77;
    v40(v12, v38);
    v31 = v39;
  }
  KeyPath = swift_getKeyPath();
  v42 = (uint64_t)v82;
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v18, v82, v13);
  v43 = (uint64_t *)&v18[*(int *)(v83 + 36)];
  *v43 = KeyPath;
  v43[1] = v31;
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v42, v13);
  v44 = *((_QWORD *)a1 + 6);
  v45 = *((_BYTE *)a1 + 56);
  v46 = *((_BYTE *)a1 + 40) & 1;
  v47 = v45 & 1;
  LOBYTE(v89) = v46;
  *((_QWORD *)&v89 + 1) = v44;
  LOBYTE(v90) = v45 & 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A96728);
  sub_23BCD7A08();
  if (v94 == 1)
    v48 = sub_23BCD7C30();
  else
    v48 = sub_23BCD7C48();
  v49 = v48;
  sub_23BCAD8AC((uint64_t)v18, (uint64_t)v20, &qword_256A96EA8);
  *(_DWORD *)&v20[*(int *)(v84 + 36)] = v49;
  sub_23BCADC80((uint64_t)v18, &qword_256A96EA8);
  v50 = sub_23BCD8020();
  LOBYTE(v89) = v46;
  *((_QWORD *)&v89 + 1) = v44;
  LOBYTE(v90) = v47;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A96728);
  sub_23BCD7A08();
  v51 = v94;
  sub_23BCAD8AC((uint64_t)v20, (uint64_t)v25, &qword_256A96EB0);
  v52 = &v25[*(int *)(v85 + 36)];
  *(_QWORD *)v52 = v50;
  v52[8] = v51;
  sub_23BCADC80((uint64_t)v20, &qword_256A96EB0);
  v53 = v86;
  sub_23BCD2D64((uint64_t)v25, v86, &qword_256A96EB8);
  v54 = *((_QWORD *)a1 + 9);
  LOBYTE(v89) = a1[4] & 1;
  *((_QWORD *)&v89 + 1) = v54;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A95698);
  sub_23BCD7F60();
  if (v94 == 1)
  {
    sub_23BCD8128();
    type metadata accessor for LocalizableBundle();
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v56 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
    v57 = a1[3];
    v91 = a1[2];
    v92 = v57;
    v93 = a1[4];
    v58 = a1[1];
    v89 = *a1;
    v90 = v58;
    sub_23BCCFFEC();
    swift_getKeyPath();
    sub_23BCD80A4();
    swift_release();
    swift_release();
    *(_QWORD *)&v89 = sub_23BCD8170();
    *((_QWORD *)&v89 + 1) = v59;
    sub_23BCB5304();
    v60 = sub_23BCD7DB0();
    v62 = v61;
    v64 = v63 & 1;
    LODWORD(v89) = sub_23BCD7C3C();
    v65 = sub_23BCD7DA4();
    v67 = v66;
    v69 = v68;
    v71 = v70 & 1;
    sub_23BCD2E18(v60, v62, v64);
    swift_bridgeObjectRelease();
  }
  else
  {
    v65 = 0;
    v67 = 0;
    v71 = 0;
    v69 = 0;
  }
  v72 = v87;
  sub_23BCAD8AC(v53, v87, &qword_256A96EB8);
  v73 = v88;
  sub_23BCAD8AC(v72, v88, &qword_256A96EB8);
  v74 = (uint64_t *)(v73 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256A96EC0) + 48));
  *v74 = v65;
  v74[1] = v67;
  v74[2] = v71;
  v74[3] = v69;
  sub_23BCD2DA8(v65, v67, v71, v69);
  sub_23BCADC80(v53, &qword_256A96EB8);
  sub_23BCD2DE8(v65, v67, v71, v69);
  return sub_23BCADC80(v72, &qword_256A96EB8);
}

uint64_t sub_23BCD1444(uint64_t a1)
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  int v25;
  int v26;
  uint64_t v27;
  int EnumCaseMultiPayload;
  uint64_t ObjCClassFromMetadata;
  uint64_t v30;
  uint64_t v31;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  int v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  char v58;
  char v59;
  uint64_t v60;

  v3 = sub_23BCD7984();
  MEMORY[0x24BDAC7A8](v3);
  v50 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23BCD8134();
  MEMORY[0x24BDAC7A8](v5);
  v49 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = sub_23BCD790C();
  v7 = *(_QWORD *)(v36 - 8);
  MEMORY[0x24BDAC7A8](v36);
  v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = sub_23BCD7918();
  v35 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v37);
  v11 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_23BCD793C();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for AccountState();
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v34 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = v1[1];
  v20 = *((unsigned __int8 *)v1 + 16);
  v22 = v1[3];
  v21 = v1[4];
  v23 = *((unsigned __int8 *)v1 + 40);
  v24 = v1[6];
  v25 = *((unsigned __int8 *)v1 + 56);
  v26 = *((unsigned __int8 *)v1 + 64);
  v27 = v1[9];
  v38 = *v1;
  v51 = v38;
  v52 = v19;
  v39 = v19;
  v40 = v20;
  v53 = v20;
  v41 = v22;
  v42 = v21;
  v54 = v22;
  v55 = v21;
  v43 = v23;
  v56 = v23;
  v44 = v24;
  v57 = v24;
  v45 = v25;
  v46 = v26;
  v58 = v25;
  v59 = v26;
  v47 = v27;
  v48 = a1;
  v60 = v27;
  sub_23BCCFFEC();
  swift_getKeyPath();
  sub_23BCD80A4();
  swift_release();
  swift_release();
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
      swift_bridgeObjectRelease();
    sub_23BCD8128();
    type metadata accessor for LocalizableBundle();
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v33 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
    v51 = v38;
    v52 = v39;
    v53 = v40;
    v54 = v41;
    v55 = v42;
    v56 = v43;
    v57 = v44;
    v58 = v45;
    v59 = v46;
    v60 = v47;
    sub_23BCCFFEC();
    swift_getKeyPath();
    sub_23BCD80A4();
    swift_release();
    swift_release();
    return sub_23BCD8170();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v18, v12);
    v30 = v36;
    (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x24BDCCB88], v36);
    MEMORY[0x24260EE10](v9);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v30);
    sub_23BCD2E28();
    v31 = v37;
    sub_23BCD7930();
    (*(void (**)(char *, uint64_t))(v35 + 8))(v11, v31);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    return v51;
  }
}

uint64_t sub_23BCD18A4@<X0>(__int128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  void (*v24)(char *, uint64_t);
  _QWORD v26[2];
  _QWORD v27[2];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A96D90);
  v8 = sub_23BCD7BE8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A96D98);
  v9 = sub_23BCD7BE8();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)v26 - v14;
  v16 = a1[3];
  v30 = a1[2];
  v31 = v16;
  v32 = a1[4];
  v17 = a1[1];
  v28 = *a1;
  v29 = v17;
  v19 = type metadata accessor for SignOutView(0, a2, a3, v18);
  sub_23BCD1A34(v19, (uint64_t)v13);
  v20 = sub_23BCD08C4();
  v27[0] = a3;
  v27[1] = v20;
  v21 = MEMORY[0x24BDEF3E0];
  v22 = MEMORY[0x24260FFB0](MEMORY[0x24BDEF3E0], v8, v27);
  v23 = sub_23BCD0948();
  v26[0] = v22;
  v26[1] = v23;
  MEMORY[0x24260FFB0](v21, v9, v26);
  sub_23BCACF3C((uint64_t)v13, v9, (uint64_t)v15);
  v24 = *(void (**)(char *, uint64_t))(v10 + 8);
  v24(v13, v9);
  sub_23BCAC3E8((uint64_t)v15, v9, a4);
  return ((uint64_t (*)(char *, uint64_t))v24)(v15, v9);
}

uint64_t sub_23BCD1A34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __int128 *v2;
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
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  void (*v29)(void);
  uint64_t v30;
  char v31;
  uint64_t v32;
  char v33;
  char v34;
  uint64_t v35;
  int EnumCaseMultiPayload;
  uint64_t v37;
  uint64_t v38;
  uint64_t KeyPath;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(char *, uint64_t);
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  char *v53;
  char *v54;
  void (*v55)(char *, uint64_t);
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  char *v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  _QWORD v100[2];
  _QWORD v101[2];
  _QWORD v102[2];
  _QWORD v103[2];
  _QWORD v104[2];
  __int128 v105;
  uint64_t v106;
  void (*v107)(void);
  uint64_t v108;
  char v109;
  uint64_t v110;
  char v111;
  char v112;
  uint64_t v113;

  v99 = a2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A96E90);
  MEMORY[0x24BDAC7A8](v4);
  v89 = (char *)&v76 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v83 = sub_23BCD7AF8();
  v81 = *(_QWORD *)(v83 - 8);
  v6 = MEMORY[0x24BDAC7A8](v83);
  v82 = (char *)&v76 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v80 = (char *)&v76 - v8;
  v79 = sub_23BCD7F18();
  v78 = *(_QWORD *)(v79 - 8);
  MEMORY[0x24BDAC7A8](v79);
  v77 = (char *)&v76 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A96E98);
  v86 = *(_QWORD *)(v87 - 8);
  MEMORY[0x24BDAC7A8](v87);
  v85 = (char *)&v76 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A96D98);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v84 = (char *)&v76 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v88 = (uint64_t)&v76 - v14;
  v15 = *(_QWORD *)(a1 + 16);
  v90 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A96D90);
  v16 = sub_23BCD7BE8();
  v92 = *(_QWORD *)(v16 - 8);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v91 = (char *)&v76 - v18;
  v19 = *(_QWORD *)(v15 - 8);
  v20 = MEMORY[0x24BDAC7A8](v17);
  v22 = (char *)&v76 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v76 - v23;
  v25 = type metadata accessor for AccountState();
  MEMORY[0x24BDAC7A8](v25);
  v27 = (char *)&v76 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v98 = v16;
  v95 = v11;
  v97 = sub_23BCD7BE8();
  v96 = *(_QWORD *)(v97 - 8);
  MEMORY[0x24BDAC7A8](v97);
  v94 = (char *)&v76 - v28;
  LOBYTE(v28) = *((_BYTE *)v2 + 16);
  v29 = (void (*)(void))*((_QWORD *)v2 + 3);
  v30 = *((_QWORD *)v2 + 4);
  v31 = *((_BYTE *)v2 + 40);
  v32 = *((_QWORD *)v2 + 6);
  v33 = *((_BYTE *)v2 + 56);
  v34 = *((_BYTE *)v2 + 64);
  v35 = *((_QWORD *)v2 + 9);
  v105 = *v2;
  LOBYTE(v106) = v28;
  v107 = v29;
  v108 = v30;
  v109 = v31;
  v110 = v32;
  v111 = v33;
  v112 = v34;
  v113 = v35;
  v93 = a1;
  sub_23BCCFFEC();
  swift_getKeyPath();
  sub_23BCD80A4();
  swift_release();
  swift_release();
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      v37 = sub_23BCD7F0C();
      v38 = sub_23BCD7D8C();
      KeyPath = swift_getKeyPath();
      *(_QWORD *)&v105 = v37;
      *((_QWORD *)&v105 + 1) = KeyPath;
      v106 = v38;
      v40 = *(_QWORD *)(v93 + 24);
      v41 = sub_23BCD08C4();
      v42 = (uint64_t)v91;
      sub_23BCCFF28((uint64_t)&v105, v15, v90);
      v101[0] = v40;
      v101[1] = v41;
      v43 = v98;
      MEMORY[0x24260FFB0](MEMORY[0x24BDEF3E0], v98, v101);
      sub_23BCD0948();
      v44 = (uint64_t)v94;
      sub_23BCCFE64(v42, v43);
      (*(void (**)(uint64_t, uint64_t))(v92 + 8))(v42, v43);
      swift_release();
      swift_release();
      swift_release();
    }
    else
    {
      sub_23BCD7F0C();
      v48 = v78;
      v49 = v77;
      v50 = v79;
      (*(void (**)(char *, _QWORD, uint64_t))(v78 + 104))(v77, *MEMORY[0x24BDF3FD0], v79);
      v51 = sub_23BCD7F30();
      swift_release();
      (*(void (**)(char *, uint64_t))(v48 + 8))(v49, v50);
      v52 = sub_23BCD7C30();
      *(_QWORD *)&v105 = v51;
      DWORD2(v105) = v52;
      v53 = v80;
      sub_23BCD7AEC();
      v54 = v82;
      sub_23BCD7AE0();
      v55 = *(void (**)(char *, uint64_t))(v81 + 8);
      v56 = v83;
      v55(v53, v83);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256A96DC8);
      sub_23BCD09F4();
      v57 = v85;
      sub_23BCD7E1C();
      v55(v54, v56);
      swift_release();
      v58 = (uint64_t)v89;
      sub_23BCD7BA0();
      v59 = sub_23BCD7BAC();
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v59 - 8) + 56))(v58, 0, 1, v59);
      v60 = swift_getKeyPath();
      v61 = v95;
      v62 = (uint64_t)v84;
      v63 = (uint64_t *)&v84[*(int *)(v95 + 36)];
      v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A96DF0);
      sub_23BCAD8AC(v58, (uint64_t)v63 + *(int *)(v64 + 28), &qword_256A96E90);
      *v63 = v60;
      v65 = v86;
      v66 = v87;
      (*(void (**)(uint64_t, char *, uint64_t))(v86 + 16))(v62, v57, v87);
      sub_23BCADC80(v58, &qword_256A96E90);
      (*(void (**)(char *, uint64_t))(v65 + 8))(v57, v66);
      v67 = v88;
      sub_23BCD2D64(v62, v88, &qword_256A96D98);
      v40 = *(_QWORD *)(v93 + 24);
      v68 = sub_23BCD08C4();
      v104[0] = v40;
      v104[1] = v68;
      v43 = v98;
      MEMORY[0x24260FFB0](MEMORY[0x24BDEF3E0], v98, v104);
      sub_23BCD0948();
      v44 = (uint64_t)v94;
      sub_23BCCFF28(v67, v43, v61);
      sub_23BCADC80(v67, &qword_256A96D98);
    }
  }
  else
  {
    v29();
    v40 = *(_QWORD *)(v93 + 24);
    sub_23BCACF3C((uint64_t)v22, v15, (uint64_t)v24);
    v45 = *(void (**)(char *, uint64_t))(v19 + 8);
    v45(v22, v15);
    sub_23BCAC3E8((uint64_t)v24, v15, (uint64_t)v22);
    v46 = sub_23BCD08C4();
    v47 = (uint64_t)v91;
    sub_23BCCFE64((uint64_t)v22, v15);
    v45(v22, v15);
    v100[0] = v40;
    v100[1] = v46;
    v43 = v98;
    MEMORY[0x24260FFB0](MEMORY[0x24BDEF3E0], v98, v100);
    sub_23BCD0948();
    v44 = (uint64_t)v94;
    sub_23BCCFE64(v47, v43);
    (*(void (**)(uint64_t, uint64_t))(v92 + 8))(v47, v43);
    v45(v24, v15);
    sub_23BCAC3AC((uint64_t)v27, (uint64_t (*)(_QWORD))type metadata accessor for AccountState);
  }
  v69 = sub_23BCD08C4();
  v103[0] = v40;
  v103[1] = v69;
  v70 = MEMORY[0x24BDEF3E0];
  v71 = MEMORY[0x24260FFB0](MEMORY[0x24BDEF3E0], v43, v103);
  v72 = sub_23BCD0948();
  v102[0] = v71;
  v102[1] = v72;
  v73 = v70;
  v74 = v97;
  MEMORY[0x24260FFB0](v73, v97, v102);
  sub_23BCAC3E8(v44, v74, v99);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v96 + 8))(v44, v74);
}

uint64_t sub_23BCD22F8(uint64_t a1, uint64_t a2, _OWORD *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  char v17;
  uint64_t result;
  _OWORD v19[6];

  v8 = type metadata accessor for AccountState();
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)v19 - v12;
  v14 = a3[3];
  v19[3] = a3[2];
  v19[4] = v14;
  v19[5] = a3[4];
  v15 = a3[1];
  v19[1] = *a3;
  v19[2] = v15;
  type metadata accessor for SignOutView(0, a4, a5, v16);
  sub_23BCCFFEC();
  swift_getKeyPath();
  sub_23BCD80A4();
  swift_release();
  swift_release();
  swift_storeEnumTagMultiPayload();
  v17 = _s14FitnessAppRoot12AccountStateO2eeoiySbAC_ACtFZ_0((uint64_t)v13, (uint64_t)v11);
  sub_23BCAC3AC((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for AccountState);
  result = sub_23BCAC3AC((uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for AccountState);
  if ((v17 & 1) == 0)
  {
    MEMORY[0x24BDAC7A8](result);
    *(_QWORD *)&v19[-2] = a4;
    *((_QWORD *)&v19[-2] + 1) = a5;
    *(_QWORD *)&v19[-1] = a3;
    sub_23BCD8020();
    sub_23BCD7AC8();
    return swift_release();
  }
  return result;
}

uint64_t sub_23BCD2498(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_23BCD22F8(a1, a2, (_OWORD *)(v2 + 32), *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

uint64_t sub_23BCD24A4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A96728);
  sub_23BCD7A08();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A95698);
  return sub_23BCD7F6C();
}

uint64_t sub_23BCD2548(_OWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  _OWORD v16[5];

  v8 = type metadata accessor for SignOutAction();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = a1[3];
  v16[2] = a1[2];
  v16[3] = v11;
  v16[4] = a1[4];
  v12 = a1[1];
  v16[0] = *a1;
  v16[1] = v12;
  type metadata accessor for SignOutView(0, a2, a3, v13);
  sub_23BCCFFEC();
  v14 = type metadata accessor for AccountState();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v10, a4, 3, v14);
  sub_23BCD80BC();
  swift_release();
  return sub_23BCAC3AC((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for SignOutAction);
}

uint64_t objectdestroy_2Tm_0()
{
  sub_23BCAC7D0();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23BCD267C()
{
  uint64_t v0;

  return sub_23BCD2548((_OWORD *)(v0 + 32), *(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), 1);
}

uint64_t sub_23BCD269C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23BCD26D4()
{
  sub_23BCAC7D0();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_23BCD2714(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;

  v4 = *a2;
  v5 = a2[1];
  v6 = *((_BYTE *)a2 + 16);
  sub_23BCAC8C8();
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6;
  v7 = a2[4];
  *(_QWORD *)(a1 + 24) = a2[3];
  *(_QWORD *)(a1 + 32) = v7;
  *(_BYTE *)(a1 + 40) = *((_BYTE *)a2 + 40);
  *(_QWORD *)(a1 + 48) = a2[6];
  *(_BYTE *)(a1 + 56) = *((_BYTE *)a2 + 56);
  *(_BYTE *)(a1 + 64) = *((_BYTE *)a2 + 64);
  *(_QWORD *)(a1 + 72) = a2[9];
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_23BCD27AC(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;

  v4 = *a2;
  v5 = a2[1];
  v6 = *((_BYTE *)a2 + 16);
  sub_23BCAC8C8();
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6;
  sub_23BCAC7D0();
  v7 = a2[4];
  *(_QWORD *)(a1 + 24) = a2[3];
  *(_QWORD *)(a1 + 32) = v7;
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 40) = *((_BYTE *)a2 + 40);
  *(_QWORD *)(a1 + 48) = a2[6];
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 56) = *((_BYTE *)a2 + 56);
  *(_BYTE *)(a1 + 64) = *((_BYTE *)a2 + 64);
  *(_QWORD *)(a1 + 72) = a2[9];
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t sub_23BCD2888(uint64_t a1, uint64_t a2)
{
  char v4;

  v4 = *(_BYTE *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v4;
  sub_23BCAC7D0();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_release();
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_release();
  return a1;
}

uint64_t sub_23BCD2914(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 80))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_23BCD295C(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 80) = 1;
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
    *(_BYTE *)(result + 80) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t type metadata accessor for SignOutView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SignOutView);
}

uint64_t sub_23BCD29BC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t OpaqueTypeConformance2;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  ValueMetadata *v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD v19[2];
  uint64_t v20;
  ValueMetadata *v21;
  uint64_t v22;
  unint64_t v23;
  _QWORD v24[2];
  _QWORD v25[2];

  v1 = *(_QWORD *)(a1 + 8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A96D88);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A96D90);
  v2 = sub_23BCD7BE8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A96D98);
  v3 = sub_23BCD7BE8();
  sub_23BCA37E0(&qword_256A96DA0, &qword_256A96D88, MEMORY[0x24BDF4700]);
  v25[0] = v1;
  v25[1] = sub_23BCD08C4();
  v4 = MEMORY[0x24BDEF3E0];
  v24[0] = MEMORY[0x24260FFB0](MEMORY[0x24BDEF3E0], v2, v25);
  v24[1] = sub_23BCD0948();
  MEMORY[0x24260FFB0](v4, v3, v24);
  v5 = sub_23BCD7F48();
  MEMORY[0x24260FFB0](MEMORY[0x24BDF41A8], v5);
  v6 = sub_23BCD7F84();
  v7 = MEMORY[0x24260FFB0](MEMORY[0x24BDF43B0], v6);
  v8 = sub_23BCD0A78();
  v20 = v6;
  v21 = &type metadata for SidebarToolbarLeadItemButtonStyle;
  v22 = v7;
  v23 = v8;
  v9 = MEMORY[0x24260FF74](255, &v20, MEMORY[0x24BDF22E0], 0);
  v20 = v6;
  v21 = &type metadata for SidebarToolbarLeadItemButtonStyle;
  v22 = v7;
  v23 = v8;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v20 = v9;
  v21 = (ValueMetadata *)OpaqueTypeConformance2;
  v11 = MEMORY[0x24260FF74](255, &v20, MEMORY[0x24BE37C20], 0);
  v20 = v9;
  v21 = (ValueMetadata *)OpaqueTypeConformance2;
  v12 = swift_getOpaqueTypeConformance2();
  v20 = v11;
  v21 = (ValueMetadata *)v12;
  v13 = MEMORY[0x24260FF74](255, &v20, MEMORY[0x24BDF3758], 0);
  v20 = v11;
  v21 = (ValueMetadata *)v12;
  v14 = swift_getOpaqueTypeConformance2();
  v15 = (ValueMetadata *)MEMORY[0x24BEE1328];
  v20 = v13;
  v21 = (ValueMetadata *)MEMORY[0x24BEE1328];
  v16 = MEMORY[0x24BEE1340];
  v22 = v14;
  v23 = MEMORY[0x24BEE1340];
  MEMORY[0x24260FF74](255, &v20, MEMORY[0x24BDF38E8], 0);
  v17 = sub_23BCD7B04();
  v20 = v13;
  v21 = v15;
  v22 = v14;
  v23 = v16;
  v19[0] = swift_getOpaqueTypeConformance2();
  v19[1] = MEMORY[0x24BDF0910];
  return MEMORY[0x24260FFB0](MEMORY[0x24BDED308], v17, v19);
}

uint64_t sub_23BCD2C3C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A96E90);
  MEMORY[0x24BDAC7A8](v2);
  sub_23BCAD8AC(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_256A96E90);
  return sub_23BCD7B1C();
}

uint64_t sub_23BCD2CBC()
{
  return sub_23BCD24A4();
}

uint64_t sub_23BCD2CD8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23BCD0D40(*(__int128 **)(v1 + 32), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_23BCD2CE4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23BCD18A4(*(__int128 **)(v1 + 32), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_23BCD2CF0()
{
  return sub_23BCD7B10();
}

uint64_t sub_23BCD2D14@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_23BCD7B28();
  *a1 = result;
  return result;
}

uint64_t sub_23BCD2D3C()
{
  swift_retain();
  return sub_23BCD7B34();
}

uint64_t sub_23BCD2D64(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_23BCD2DA8(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_23BCD2DD8(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_23BCD2DD8(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_23BCD2DE8(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_23BCD2E18(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_23BCD2E18(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

unint64_t sub_23BCD2E28()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256A96EC8;
  if (!qword_256A96EC8)
  {
    v1 = sub_23BCD7918();
    result = MEMORY[0x24260FFB0](MEMORY[0x24BDCCB98], v1);
    atomic_store(result, (unint64_t *)&qword_256A96EC8);
  }
  return result;
}

uint64_t sub_23BCD2E70()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A96F58);
  sub_23BCD34DC();
  return sub_23BCD7A5C();
}

uint64_t AnotherNavigationSplitView.init(store:sidebarViewBuilder:detailViewBuilder:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a1;
  *(_QWORD *)(result + 24) = a2;
  *(_QWORD *)a7 = sub_23BCA3440;
  *(_QWORD *)(a7 + 8) = result;
  *(_BYTE *)(a7 + 16) = 0;
  *(_QWORD *)(a7 + 24) = a3;
  *(_QWORD *)(a7 + 32) = a4;
  *(_QWORD *)(a7 + 40) = a5;
  *(_QWORD *)(a7 + 48) = a6;
  return result;
}

uint64_t sub_23BCD2F3C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t AnotherNavigationSplitView.body.getter@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  __int128 *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t);
  _QWORD v20[2];
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v24 = a2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_256A96ED0);
  MEMORY[0x24BDAC7A8](v4);
  v5 = a1[2];
  v21 = a1[3];
  v22 = v5;
  v6 = a1[4];
  v20[0] = a1[5];
  v20[1] = v6;
  *(_QWORD *)&v25 = v5;
  *((_QWORD *)&v25 + 1) = MEMORY[0x24BDF5158];
  v26 = v21;
  v27 = v6;
  v28 = MEMORY[0x24BDF5138];
  v29 = v20[0];
  v7 = sub_23BCD7B94();
  v23 = *(_QWORD *)(v7 - 8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)v20 - v11;
  v13 = *((_BYTE *)v2 + 16);
  v14 = *((_QWORD *)v2 + 3);
  v15 = *((_QWORD *)v2 + 4);
  v16 = *((_QWORD *)v2 + 5);
  v17 = *((_QWORD *)v2 + 6);
  v25 = *v2;
  LOBYTE(v26) = v13;
  v27 = v14;
  v28 = v15;
  v29 = v16;
  v30 = v17;
  sub_23BCD2E70();
  sub_23BCD7CB4();
  sub_23BCD7FB4();
  sub_23BCD7B88();
  MEMORY[0x24260FFB0](MEMORY[0x24BDEF010], v7);
  sub_23BCACF3C((uint64_t)v10, v7, (uint64_t)v12);
  v18 = *(void (**)(char *, uint64_t))(v23 + 8);
  v18(v10, v7);
  sub_23BCAC3E8((uint64_t)v12, v7, v24);
  return ((uint64_t (*)(char *, uint64_t))v18)(v12, v7);
}

uint64_t sub_23BCD3154()
{
  char v1;

  swift_getKeyPath();
  sub_23BCD80A4();
  swift_release();
  if (v1 == 1)
    return sub_23BCD7CA8();
  else
    return sub_23BCD7C9C();
}

uint64_t sub_23BCD31C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  v4 = sub_23BCD7CB4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
}

uint64_t sub_23BCD3200()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23BCD3238()
{
  sub_23BCAC7D0();
  swift_release();
  return swift_release();
}

uint64_t sub_23BCD3270(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;

  v4 = *a2;
  v5 = a2[1];
  v6 = *((_BYTE *)a2 + 16);
  sub_23BCAC8C8();
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = a2[3];
  v7 = a2[6];
  *(_OWORD *)(a1 + 32) = *((_OWORD *)a2 + 2);
  *(_QWORD *)(a1 + 48) = v7;
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_23BCD32EC(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *a2;
  v5 = a2[1];
  v6 = *((_BYTE *)a2 + 16);
  sub_23BCAC8C8();
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6;
  sub_23BCAC7D0();
  v7 = a2[4];
  *(_QWORD *)(a1 + 24) = a2[3];
  *(_QWORD *)(a1 + 32) = v7;
  swift_retain();
  swift_release();
  v8 = a2[6];
  *(_QWORD *)(a1 + 40) = a2[5];
  *(_QWORD *)(a1 + 48) = v8;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_23BCD337C(uint64_t a1, uint64_t a2)
{
  char v4;

  v4 = *(_BYTE *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v4;
  sub_23BCAC7D0();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  return a1;
}

uint64_t sub_23BCD33E0(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 56))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_23BCD3428(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for AnotherNavigationSplitView()
{
  JUMPOUT(0x24260FF2CLL);
}

uint64_t sub_23BCD3480()
{
  uint64_t v0;

  v0 = sub_23BCD7B94();
  return MEMORY[0x24260FFB0](MEMORY[0x24BDEF010], v0);
}

unint64_t sub_23BCD34DC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256A96F60;
  if (!qword_256A96F60)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A96F58);
    result = MEMORY[0x24260FFB0](MEMORY[0x24BE2B5E8], v1);
    atomic_store(result, (unint64_t *)&qword_256A96F60);
  }
  return result;
}

uint64_t SidebarModalitiesState.modalities.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for SidebarModalitiesState() + 20);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95BF8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t type metadata accessor for SidebarModalitiesState()
{
  uint64_t result;

  result = qword_256A97000;
  if (!qword_256A97000)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t SidebarModalitiesState.isSidebarVisible.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for SidebarModalitiesState() + 24));
}

uint64_t SidebarModalitiesState.isSidebarVisible.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for SidebarModalitiesState();
  *(_BYTE *)(v1 + *(int *)(result + 24)) = a1;
  return result;
}

uint64_t (*SidebarModalitiesState.isSidebarVisible.modify())(_QWORD, _QWORD, _QWORD)
{
  type metadata accessor for SidebarModalitiesState();
  return nullsub_1;
}

uint64_t SidebarModalitiesState.init(locale:modalities:isSidebarVisible:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;

  v8 = sub_23BCD7984();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a4, a1, v8);
  v9 = type metadata accessor for SidebarModalitiesState();
  v10 = a4 + *(int *)(v9 + 20);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95BF8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v10, a2, v11);
  *(_BYTE *)(a4 + *(int *)(v9 + 24)) = a3;
  return result;
}

uint64_t sub_23BCD36BC()
{
  _BYTE *v0;
  unint64_t v1;

  v1 = 0x6974696C61646F6DLL;
  if (*v0 != 1)
    v1 = 0xD000000000000010;
  if (*v0)
    return v1;
  else
    return 0x656C61636F6CLL;
}

uint64_t sub_23BCD371C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23BCD47C8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23BCD3740()
{
  sub_23BCD3940();
  return sub_23BCD8614();
}

uint64_t sub_23BCD3768()
{
  sub_23BCD3940();
  return sub_23BCD8620();
}

uint64_t SidebarModalitiesState.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A96F68);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23BCD3940();
  sub_23BCD8608();
  v8[15] = 0;
  sub_23BCD7984();
  sub_23BC9B4D8(&qword_256A94CC0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], MEMORY[0x24BDCEEC8]);
  sub_23BCD8584();
  if (!v1)
  {
    type metadata accessor for SidebarModalitiesState();
    v8[14] = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A95BF8);
    sub_23BCD3D54(&qword_256A96F78, MEMORY[0x24BE2B3F8]);
    sub_23BCD8584();
    v8[13] = 2;
    sub_23BCD856C();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_23BCD3940()
{
  unint64_t result;

  result = qword_256A96F70;
  if (!qword_256A96F70)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDE054, &type metadata for SidebarModalitiesState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A96F70);
  }
  return result;
}

uint64_t sub_23BCD3984(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A95D20);
    v10 = sub_23BC9B4D8(a2, (uint64_t (*)(uint64_t))type metadata accessor for SidebarModality, a3);
    result = MEMORY[0x24260FFB0](a4, v9, &v10);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t SidebarModalitiesState.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  char *v32;
  char *v33;
  char v34;
  char v35;
  char v36;

  v25 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95BF8);
  v27 = *(_QWORD *)(v3 - 8);
  v28 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v26 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = sub_23BCD7984();
  v5 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v30 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A96F90);
  v7 = *(_QWORD *)(v31 - 8);
  MEMORY[0x24BDAC7A8](v31);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for SidebarModalitiesState();
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23BCD3940();
  v32 = v9;
  v13 = v33;
  sub_23BCD85FC();
  if (v13)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v14 = v7;
  v23 = v10;
  v24 = v5;
  v33 = v12;
  v16 = v26;
  v15 = v27;
  v17 = v28;
  v36 = 0;
  sub_23BC9B4D8(&qword_256A94CD8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], MEMORY[0x24BDCEEE8]);
  v18 = v29;
  sub_23BCD8530();
  (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v33, v30, v18);
  v35 = 1;
  sub_23BCD3D54(&qword_256A96F98, MEMORY[0x24BE2B410]);
  sub_23BCD8530();
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(&v33[*(int *)(v23 + 20)], v16, v17);
  v34 = 2;
  v19 = sub_23BCD8518();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v32, v31);
  v20 = (uint64_t)v33;
  v33[*(int *)(v23 + 24)] = v19 & 1;
  sub_23BCD3E00(v20, v25);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_23BCD3E44(v20);
}

uint64_t sub_23BCD3D54(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  _QWORD v6[2];

  result = *a1;
  if (!result)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A95BF8);
    v6[0] = sub_23BCD3984(&qword_256A96F80, &qword_256A95B10, (uint64_t)&protocol conformance descriptor for SidebarModality, MEMORY[0x24BEE12D0]);
    v6[1] = sub_23BCD3984(&qword_256A96F88, &qword_256A95AE8, (uint64_t)&protocol conformance descriptor for SidebarModality, MEMORY[0x24BEE12A0]);
    result = MEMORY[0x24260FFB0](a2, v5, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23BCD3E00(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SidebarModalitiesState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23BCD3E44(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SidebarModalitiesState();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23BCD3E80@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return SidebarModalitiesState.init(from:)(a1, a2);
}

uint64_t sub_23BCD3E94(_QWORD *a1)
{
  return SidebarModalitiesState.encode(to:)(a1);
}

uint64_t static SidebarModalitiesState.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;

  if ((MEMORY[0x24260EEA0]() & 1) != 0
    && (v4 = type metadata accessor for SidebarModalitiesState(),
        __swift_instantiateConcreteTypeFromMangledName(&qword_256A95D20),
        sub_23BCD3984(&qword_256A96FA0, &qword_256A96360, (uint64_t)&protocol conformance descriptor for SidebarModality, MEMORY[0x24BEE12C0]), (sub_23BCD8050() & 1) != 0))
  {
    v5 = *(_BYTE *)(a1 + *(int *)(v4 + 24)) ^ *(_BYTE *)(a2 + *(int *)(v4 + 24)) ^ 1;
  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

uint64_t sub_23BCD3F6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v6;

  if ((MEMORY[0x24260EEA0]() & 1) != 0
    && (__swift_instantiateConcreteTypeFromMangledName(&qword_256A95D20),
        sub_23BCD3984(&qword_256A96FA0, &qword_256A96360, (uint64_t)&protocol conformance descriptor for SidebarModality, MEMORY[0x24BEE12C0]), (sub_23BCD8050() & 1) != 0))
  {
    v6 = *(_BYTE *)(a1 + *(int *)(a3 + 24)) ^ *(_BYTE *)(a2 + *(int *)(a3 + 24)) ^ 1;
  }
  else
  {
    v6 = 0;
  }
  return v6 & 1;
}

_QWORD *initializeBufferWithCopyOfBuffer for SidebarModalitiesState(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23BCD7984();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95BF8);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    *((_BYTE *)a1 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  }
  return a1;
}

uint64_t destroy for SidebarModalitiesState(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_23BCD7984();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95BF8);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

uint64_t initializeWithCopy for SidebarModalitiesState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_23BCD7984();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95BF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  *(_BYTE *)(a1 + *(int *)(a3 + 24)) = *(_BYTE *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t assignWithCopy for SidebarModalitiesState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_23BCD7984();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95BF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  *(_BYTE *)(a1 + *(int *)(a3 + 24)) = *(_BYTE *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t initializeWithTake for SidebarModalitiesState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_23BCD7984();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95BF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  *(_BYTE *)(a1 + *(int *)(a3 + 24)) = *(_BYTE *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t assignWithTake for SidebarModalitiesState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_23BCD7984();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95BF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  *(_BYTE *)(a1 + *(int *)(a3 + 24)) = *(_BYTE *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t getEnumTagSinglePayload for SidebarModalitiesState()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23BCD43A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v14;

  v6 = sub_23BCD7984();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95BF8);
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  v14 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 24));
  if (v14 >= 2)
    return ((v14 + 2147483646) & 0x7FFFFFFF) + 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SidebarModalitiesState()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23BCD446C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v8 = sub_23BCD7984();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  result = __swift_instantiateConcreteTypeFromMangledName(&qword_256A95BF8);
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  *(_BYTE *)(a1 + *(int *)(a4 + 24)) = a2 + 1;
  return result;
}

void sub_23BCD4514()
{
  unint64_t v0;
  unint64_t v1;

  sub_23BCD7984();
  if (v0 <= 0x3F)
  {
    sub_23BCD45A0();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_23BCD45A0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256A97010)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A95D20);
    sub_23BCD3984(&qword_256A96FA0, &qword_256A96360, (uint64_t)&protocol conformance descriptor for SidebarModality, MEMORY[0x24BEE12C0]);
    v0 = sub_23BCD8068();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256A97010);
  }
}

uint64_t storeEnumTagSinglePayload for SidebarModalitiesState.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23BCD4670 + 4 * byte_23BCDDEC5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23BCD46A4 + 4 * byte_23BCDDEC0[v4]))();
}

uint64_t sub_23BCD46A4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BCD46AC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23BCD46B4);
  return result;
}

uint64_t sub_23BCD46C0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23BCD46C8);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23BCD46CC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BCD46D4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SidebarModalitiesState.CodingKeys()
{
  return &type metadata for SidebarModalitiesState.CodingKeys;
}

unint64_t sub_23BCD46F4()
{
  unint64_t result;

  result = qword_256A97048;
  if (!qword_256A97048)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDE02C, &type metadata for SidebarModalitiesState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A97048);
  }
  return result;
}

unint64_t sub_23BCD473C()
{
  unint64_t result;

  result = qword_256A97050;
  if (!qword_256A97050)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDDF9C, &type metadata for SidebarModalitiesState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A97050);
  }
  return result;
}

unint64_t sub_23BCD4784()
{
  unint64_t result;

  result = qword_256A97058;
  if (!qword_256A97058)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDDFC4, &type metadata for SidebarModalitiesState.CodingKeys);
    atomic_store(result, &qword_256A97058);
  }
  return result;
}

uint64_t sub_23BCD47C8(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x656C61636F6CLL && a2 == 0xE600000000000000;
  if (v2 || (sub_23BCD85A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6974696C61646F6DLL && a2 == 0xEA00000000007365 || (sub_23BCD85A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000023BCE5730)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_23BCD85A8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

__n128 SidebarFeature.init(environment:)@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t SidebarFeature.reduce(localState:sharedState:sideEffects:action:)(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t *v5;
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
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int *v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t result;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;

  v41 = a3;
  v8 = *(_QWORD *)(a5 + 16);
  v9 = *(_QWORD *)(a5 + 24);
  v10 = type metadata accessor for SidebarAction(255, v8, v9, a4);
  v11 = sub_23BCD8074();
  v39 = *(_QWORD *)(v11 - 8);
  v40 = v11;
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v35 - v13;
  v15 = *(_QWORD *)(v8 - 8);
  v16 = MEMORY[0x24BDAC7A8](v12);
  v18 = (char *)&v35 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v35 - v19;
  v21 = v5[1];
  v37 = *v5;
  v38 = v21;
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))((char *)&v35 - v19, a4, v10);
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v18, v20, v8);
  *((_BYTE *)a2 + 16) = 0;
  v42 = *a2;
  v23 = sub_23BCD8200();
  MEMORY[0x24260FFB0](MEMORY[0x24BEE12E0], v23);
  sub_23BCD832C();
  if ((v44 & 1) != 0)
    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v18, v8);
  v24 = v43;
  if (a2[1] == v43)
  {
    v25 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_256A95320);
    v26 = &v14[v25[16]];
    v36 = &v14[v25[20]];
    v27 = &v14[v25[24]];
    v29 = type metadata accessor for SidebarFeature.TaskIdentifier(0, v8, v9, v28);
    MEMORY[0x24260FFB0](&unk_23BCDE1B0, v29);
    sub_23BCD84E8();
    v30 = *MEMORY[0x24BE2B570];
    v31 = sub_23BCD8098();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 104))(v26, v30, v31);
    v32 = (_QWORD *)swift_allocObject();
    v32[2] = v8;
    v32[3] = v9;
    v33 = v38;
    v32[4] = v37;
    v32[5] = v33;
    *(_QWORD *)v27 = &unk_256A97068;
    *((_QWORD *)v27 + 1) = v32;
    swift_retain();
    sub_23BCC89D0();
    sub_23BCC89D4((uint64_t)v36);
    (*(void (**)(char *, _QWORD, uint64_t))(v39 + 104))(v14, *MEMORY[0x24BE2B438], v40);
    sub_23BCD8200();
    sub_23BCD81F4();
    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v18, v8);
  }
  result = (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v18, v8);
  a2[1] = v24;
  return result;
}

uint64_t type metadata accessor for SidebarFeature.TaskIdentifier(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SidebarFeature.TaskIdentifier);
}

uint64_t sub_23BCD4BFC(uint64_t a1, int *a2)
{
  _QWORD *v2;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v2[2] = sub_23BCD8254();
  v2[3] = sub_23BCD8248();
  v6 = (uint64_t (*)(void))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  v2[4] = v4;
  *v4 = v2;
  v4[1] = sub_23BCABCB8;
  return v6();
}

uint64_t sub_23BCD4C78()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23BCD4C9C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 32);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23BCA8C74;
  return sub_23BCD4BFC(a1, v4);
}

uint64_t SidebarFeature.dispose(localState:sharedState:)(uint64_t a1, uint64_t a2)
{
  return nullsub_1(a1, *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24));
}

void sub_23BCD4D20()
{
  JUMPOUT(0x24260FFB0);
}

void sub_23BCD4D30()
{
  JUMPOUT(0x24260FFB0);
}

void sub_23BCD4D40()
{
  JUMPOUT(0x24260FFB0);
}

uint64_t type metadata accessor for SidebarFeature(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SidebarFeature);
}

uint64_t sub_23BCD4D5C(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23BCD4D9C + 4 * asc_23BCDE0B8[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23BCD4DBC + 4 * byte_23BCDE0BD[v4]))();
}

_BYTE *sub_23BCD4D9C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23BCD4DBC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23BCD4DC4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23BCD4DCC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23BCD4DD4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23BCD4DDC(_DWORD *result)
{
  *result = 0;
  return result;
}

void sub_23BCD4DE8()
{
  JUMPOUT(0x24260FFB0);
}

BOOL static SidebarModalityKind.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t SidebarModalityKind.hash(into:)()
{
  return sub_23BCD85CC();
}

uint64_t sub_23BCD4E34(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23BCD4E68 + 4 * byte_23BCDE1F0[a1]))(0x6E776F646C6F6F63, 0xE800000000000000);
}

uint64_t sub_23BCD4E68()
{
  return 1701998435;
}

uint64_t sub_23BCD4E78()
{
  return 0x676E696C637963;
}

uint64_t sub_23BCD4E90()
{
  return 0x65636E6164;
}

uint64_t sub_23BCD4EA4()
{
  return 1953065320;
}

uint64_t sub_23BCD4EB4()
{
  return 0x69786F626B63696BLL;
}

uint64_t sub_23BCD4ED0()
{
  return 0x697461746964656DLL;
}

uint64_t sub_23BCD4EF0()
{
  return 0x736574616C6970;
}

uint64_t sub_23BCD4F08()
{
  return 0x676E69776F72;
}

uint64_t sub_23BCD4F1C()
{
  return 0x6874676E65727473;
}

uint64_t sub_23BCD4F30()
{
  return 0x6C696D6461657274;
}

uint64_t sub_23BCD4F4C()
{
  return 1634168697;
}

uint64_t sub_23BCD4F5C()
{
  unsigned __int8 *v0;

  return sub_23BCD4E34(*v0);
}

uint64_t sub_23BCD4F64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23BCD7434(a1, a2);
  *a3 = result;
  return result;
}

void sub_23BCD4F88(_BYTE *a1@<X8>)
{
  *a1 = 12;
}

uint64_t sub_23BCD4F94()
{
  sub_23BCD5B8C();
  return sub_23BCD8614();
}

uint64_t sub_23BCD4FBC()
{
  sub_23BCD5B8C();
  return sub_23BCD8620();
}

uint64_t sub_23BCD4FE4()
{
  sub_23BCD5EBC();
  return sub_23BCD8614();
}

uint64_t sub_23BCD500C()
{
  sub_23BCD5EBC();
  return sub_23BCD8620();
}

uint64_t sub_23BCD5034()
{
  sub_23BCD5E78();
  return sub_23BCD8614();
}

uint64_t sub_23BCD505C()
{
  sub_23BCD5E78();
  return sub_23BCD8620();
}

uint64_t sub_23BCD5084()
{
  sub_23BCD5E34();
  return sub_23BCD8614();
}

uint64_t sub_23BCD50AC()
{
  sub_23BCD5E34();
  return sub_23BCD8620();
}

uint64_t sub_23BCD50D4()
{
  sub_23BCD5DF0();
  return sub_23BCD8614();
}

uint64_t sub_23BCD50FC()
{
  sub_23BCD5DF0();
  return sub_23BCD8620();
}

uint64_t sub_23BCD5124()
{
  sub_23BCD5DAC();
  return sub_23BCD8614();
}

uint64_t sub_23BCD514C()
{
  sub_23BCD5DAC();
  return sub_23BCD8620();
}

uint64_t sub_23BCD5174()
{
  sub_23BCD5D68();
  return sub_23BCD8614();
}

uint64_t sub_23BCD519C()
{
  sub_23BCD5D68();
  return sub_23BCD8620();
}

uint64_t sub_23BCD51C4()
{
  sub_23BCD5D24();
  return sub_23BCD8614();
}

uint64_t sub_23BCD51EC()
{
  sub_23BCD5D24();
  return sub_23BCD8620();
}

uint64_t sub_23BCD5214()
{
  sub_23BCD5CE0();
  return sub_23BCD8614();
}

uint64_t sub_23BCD523C()
{
  sub_23BCD5CE0();
  return sub_23BCD8620();
}

uint64_t sub_23BCD5264()
{
  sub_23BCD5C9C();
  return sub_23BCD8614();
}

uint64_t sub_23BCD528C()
{
  sub_23BCD5C9C();
  return sub_23BCD8620();
}

uint64_t sub_23BCD52B4()
{
  sub_23BCD5C58();
  return sub_23BCD8614();
}

uint64_t sub_23BCD52DC()
{
  sub_23BCD5C58();
  return sub_23BCD8620();
}

uint64_t sub_23BCD5304()
{
  sub_23BCD5C14();
  return sub_23BCD8614();
}

uint64_t sub_23BCD532C()
{
  sub_23BCD5C14();
  return sub_23BCD8620();
}

uint64_t sub_23BCD5354()
{
  sub_23BCD5BD0();
  return sub_23BCD8614();
}

uint64_t sub_23BCD537C()
{
  sub_23BCD5BD0();
  return sub_23BCD8620();
}

uint64_t SidebarModalityKind.hashValue.getter()
{
  sub_23BCD85C0();
  sub_23BCD85CC();
  return sub_23BCD85F0();
}

void SidebarModalityKind.encode(to:)(_QWORD *a1)
{
  unsigned __int8 *v1;
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
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A97170);
  v52 = *(_QWORD *)(v3 - 8);
  v53 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v51 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A97178);
  v49 = *(_QWORD *)(v5 - 8);
  v50 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v48 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A97180);
  v46 = *(_QWORD *)(v7 - 8);
  v47 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v45 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A97188);
  v43 = *(_QWORD *)(v9 - 8);
  v44 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v42 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A97190);
  v40 = *(_QWORD *)(v11 - 8);
  v41 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v39 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A97198);
  v37 = *(_QWORD *)(v38 - 8);
  MEMORY[0x24BDAC7A8](v38);
  v36 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A971A0);
  v34 = *(_QWORD *)(v35 - 8);
  MEMORY[0x24BDAC7A8](v35);
  v33 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A971A8);
  v31 = *(_QWORD *)(v32 - 8);
  MEMORY[0x24BDAC7A8](v32);
  v30 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A971B0);
  v28 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v27 = (char *)&v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A971B8);
  v25 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v24 = (char *)&v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A971C0);
  v22 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A971C8);
  MEMORY[0x24BDAC7A8](v18);
  v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A971D0);
  v54 = *(_QWORD *)(v56 - 8);
  MEMORY[0x24BDAC7A8](v56);
  v20 = (char *)&v22 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23BCD5B8C();
  v55 = v20;
  sub_23BCD8608();
  __asm { BR              X9 }
}

uint64_t sub_23BCD57F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v3 - 92) = 0;
  sub_23BCD5EBC();
  v5 = *(_QWORD *)(v3 - 112);
  v4 = *(_QWORD *)(v3 - 104);
  sub_23BCD8554();
  (*(void (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 120) + 8))(v5, v4);
}

unint64_t sub_23BCD5B8C()
{
  unint64_t result;

  result = qword_256A971D8;
  if (!qword_256A971D8)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDECAC, &type metadata for SidebarModalityKind.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A971D8);
  }
  return result;
}

unint64_t sub_23BCD5BD0()
{
  unint64_t result;

  result = qword_256A971E0;
  if (!qword_256A971E0)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDEC5C, &type metadata for SidebarModalityKind.YogaCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A971E0);
  }
  return result;
}

unint64_t sub_23BCD5C14()
{
  unint64_t result;

  result = qword_256A971E8;
  if (!qword_256A971E8)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDEC0C, &type metadata for SidebarModalityKind.TreadmillCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A971E8);
  }
  return result;
}

unint64_t sub_23BCD5C58()
{
  unint64_t result;

  result = qword_256A971F0;
  if (!qword_256A971F0)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDEBBC, &type metadata for SidebarModalityKind.StrengthCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A971F0);
  }
  return result;
}

unint64_t sub_23BCD5C9C()
{
  unint64_t result;

  result = qword_256A971F8;
  if (!qword_256A971F8)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDEB6C, &type metadata for SidebarModalityKind.RowingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A971F8);
  }
  return result;
}

unint64_t sub_23BCD5CE0()
{
  unint64_t result;

  result = qword_256A97200;
  if (!qword_256A97200)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDEB1C, &type metadata for SidebarModalityKind.PilatesCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A97200);
  }
  return result;
}

unint64_t sub_23BCD5D24()
{
  unint64_t result;

  result = qword_256A97208;
  if (!qword_256A97208)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDEACC, &type metadata for SidebarModalityKind.MeditationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A97208);
  }
  return result;
}

unint64_t sub_23BCD5D68()
{
  unint64_t result;

  result = qword_256A97210;
  if (!qword_256A97210)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDEA7C, &type metadata for SidebarModalityKind.KickboxingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A97210);
  }
  return result;
}

unint64_t sub_23BCD5DAC()
{
  unint64_t result;

  result = qword_256A97218;
  if (!qword_256A97218)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDEA2C, &type metadata for SidebarModalityKind.HiitCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A97218);
  }
  return result;
}

unint64_t sub_23BCD5DF0()
{
  unint64_t result;

  result = qword_256A97220;
  if (!qword_256A97220)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDE9DC, &type metadata for SidebarModalityKind.DanceCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A97220);
  }
  return result;
}

unint64_t sub_23BCD5E34()
{
  unint64_t result;

  result = qword_256A97228;
  if (!qword_256A97228)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDE98C, &type metadata for SidebarModalityKind.CyclingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A97228);
  }
  return result;
}

unint64_t sub_23BCD5E78()
{
  unint64_t result;

  result = qword_256A97230;
  if (!qword_256A97230)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDE93C, &type metadata for SidebarModalityKind.CoreCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A97230);
  }
  return result;
}

unint64_t sub_23BCD5EBC()
{
  unint64_t result;

  result = qword_256A97238;
  if (!qword_256A97238)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDE8EC, &type metadata for SidebarModalityKind.CooldownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A97238);
  }
  return result;
}

uint64_t SidebarModalityKind.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  char *v31;
  _QWORD v33[4];
  uint64_t v34;
  char *v35;
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
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  char *v58;
  char *v59;
  char *v60;
  char *v61;
  char *v62;
  char *v63;
  char *v64;
  uint64_t v65;
  char *v66;
  char *v67;
  char *v68;
  uint64_t v69;
  _QWORD *v70;
  uint64_t v71;

  v65 = a2;
  v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A97240);
  v56 = *(_QWORD *)(v69 - 8);
  MEMORY[0x24BDAC7A8](v69);
  v64 = (char *)v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A97248);
  v54 = *(_QWORD *)(v4 - 8);
  v55 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v63 = (char *)v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A97250);
  v52 = *(_QWORD *)(v6 - 8);
  v53 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v62 = (char *)v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A97258);
  v36 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v37);
  v61 = (char *)v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A97260);
  v49 = *(_QWORD *)(v51 - 8);
  MEMORY[0x24BDAC7A8](v51);
  v68 = (char *)v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A97268);
  v46 = *(_QWORD *)(v50 - 8);
  MEMORY[0x24BDAC7A8](v50);
  v59 = (char *)v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A97270);
  v47 = *(_QWORD *)(v48 - 8);
  MEMORY[0x24BDAC7A8](v48);
  v67 = (char *)v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A97278);
  v44 = *(_QWORD *)(v45 - 8);
  MEMORY[0x24BDAC7A8](v45);
  v60 = (char *)v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A97280);
  v42 = *(_QWORD *)(v43 - 8);
  MEMORY[0x24BDAC7A8](v43);
  v66 = (char *)v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A97288);
  v40 = *(_QWORD *)(v41 - 8);
  MEMORY[0x24BDAC7A8](v41);
  v58 = (char *)v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A97290);
  v38 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39);
  v57 = (char *)v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A97298);
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)v33 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A972A0);
  v21 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)v33 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = a1[3];
  v70 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v24);
  sub_23BCD5B8C();
  v25 = v71;
  sub_23BCD85FC();
  if (!v25)
  {
    v33[3] = v19;
    v33[1] = v17;
    v33[2] = v16;
    v71 = v21;
    v34 = v20;
    v35 = v23;
    v26 = sub_23BCD853C();
    if (*(_QWORD *)(v26 + 16) == 1)
      __asm { BR              X9 }
    v27 = sub_23BCD8458();
    swift_allocError();
    v29 = v28;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A94A88);
    *v29 = &type metadata for SidebarModalityKind;
    v30 = v34;
    v31 = v35;
    sub_23BCD8500();
    sub_23BCD844C();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v27 - 8) + 104))(v29, *MEMORY[0x24BEE26D0], v27);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v71 + 8))(v31, v30);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v70);
}

unint64_t sub_23BCD69FC()
{
  unint64_t result;

  result = qword_256A972A8;
  if (!qword_256A972A8)
  {
    result = MEMORY[0x24260FFB0](&protocol conformance descriptor for SidebarModalityKind, &type metadata for SidebarModalityKind);
    atomic_store(result, (unint64_t *)&qword_256A972A8);
  }
  return result;
}

uint64_t sub_23BCD6A40@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return SidebarModalityKind.init(from:)(a1, a2);
}

void sub_23BCD6A54(_QWORD *a1)
{
  SidebarModalityKind.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for SidebarModalityKind()
{
  return &type metadata for SidebarModalityKind;
}

uint64_t _s14FitnessAppRoot19SidebarModalityKindOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s14FitnessAppRoot19SidebarModalityKindOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23BCD6B5C + 4 * byte_23BCDE225[v4]))();
  *a1 = a2 + 11;
  return ((uint64_t (*)(void))((char *)sub_23BCD6B90 + 4 * byte_23BCDE220[v4]))();
}

uint64_t sub_23BCD6B90(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BCD6B98(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23BCD6BA0);
  return result;
}

uint64_t sub_23BCD6BAC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23BCD6BB4);
  *(_BYTE *)result = a2 + 11;
  return result;
}

uint64_t sub_23BCD6BB8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BCD6BC0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SidebarModalityKind.CodingKeys()
{
  return &type metadata for SidebarModalityKind.CodingKeys;
}

ValueMetadata *type metadata accessor for SidebarModalityKind.CooldownCodingKeys()
{
  return &type metadata for SidebarModalityKind.CooldownCodingKeys;
}

ValueMetadata *type metadata accessor for SidebarModalityKind.CoreCodingKeys()
{
  return &type metadata for SidebarModalityKind.CoreCodingKeys;
}

ValueMetadata *type metadata accessor for SidebarModalityKind.CyclingCodingKeys()
{
  return &type metadata for SidebarModalityKind.CyclingCodingKeys;
}

ValueMetadata *type metadata accessor for SidebarModalityKind.DanceCodingKeys()
{
  return &type metadata for SidebarModalityKind.DanceCodingKeys;
}

ValueMetadata *type metadata accessor for SidebarModalityKind.HiitCodingKeys()
{
  return &type metadata for SidebarModalityKind.HiitCodingKeys;
}

ValueMetadata *type metadata accessor for SidebarModalityKind.KickboxingCodingKeys()
{
  return &type metadata for SidebarModalityKind.KickboxingCodingKeys;
}

ValueMetadata *type metadata accessor for SidebarModalityKind.MeditationCodingKeys()
{
  return &type metadata for SidebarModalityKind.MeditationCodingKeys;
}

ValueMetadata *type metadata accessor for SidebarModalityKind.PilatesCodingKeys()
{
  return &type metadata for SidebarModalityKind.PilatesCodingKeys;
}

ValueMetadata *type metadata accessor for SidebarModalityKind.RowingCodingKeys()
{
  return &type metadata for SidebarModalityKind.RowingCodingKeys;
}

ValueMetadata *type metadata accessor for SidebarModalityKind.StrengthCodingKeys()
{
  return &type metadata for SidebarModalityKind.StrengthCodingKeys;
}

ValueMetadata *type metadata accessor for SidebarModalityKind.TreadmillCodingKeys()
{
  return &type metadata for SidebarModalityKind.TreadmillCodingKeys;
}

ValueMetadata *type metadata accessor for SidebarModalityKind.YogaCodingKeys()
{
  return &type metadata for SidebarModalityKind.YogaCodingKeys;
}

unint64_t sub_23BCD6CA0()
{
  unint64_t result;

  result = qword_256A972B0;
  if (!qword_256A972B0)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDE8C4, &type metadata for SidebarModalityKind.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A972B0);
  }
  return result;
}

unint64_t sub_23BCD6CE8()
{
  unint64_t result;

  result = qword_256A972B8;
  if (!qword_256A972B8)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDE7E4, &type metadata for SidebarModalityKind.CooldownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A972B8);
  }
  return result;
}

unint64_t sub_23BCD6D30()
{
  unint64_t result;

  result = qword_256A972C0;
  if (!qword_256A972C0)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDE80C, &type metadata for SidebarModalityKind.CooldownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A972C0);
  }
  return result;
}

unint64_t sub_23BCD6D78()
{
  unint64_t result;

  result = qword_256A972C8;
  if (!qword_256A972C8)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDE794, &type metadata for SidebarModalityKind.CoreCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A972C8);
  }
  return result;
}

unint64_t sub_23BCD6DC0()
{
  unint64_t result;

  result = qword_256A972D0;
  if (!qword_256A972D0)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDE7BC, &type metadata for SidebarModalityKind.CoreCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A972D0);
  }
  return result;
}

unint64_t sub_23BCD6E08()
{
  unint64_t result;

  result = qword_256A972D8;
  if (!qword_256A972D8)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDE744, &type metadata for SidebarModalityKind.CyclingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A972D8);
  }
  return result;
}

unint64_t sub_23BCD6E50()
{
  unint64_t result;

  result = qword_256A972E0;
  if (!qword_256A972E0)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDE76C, &type metadata for SidebarModalityKind.CyclingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A972E0);
  }
  return result;
}

unint64_t sub_23BCD6E98()
{
  unint64_t result;

  result = qword_256A972E8;
  if (!qword_256A972E8)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDE6F4, &type metadata for SidebarModalityKind.DanceCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A972E8);
  }
  return result;
}

unint64_t sub_23BCD6EE0()
{
  unint64_t result;

  result = qword_256A972F0;
  if (!qword_256A972F0)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDE71C, &type metadata for SidebarModalityKind.DanceCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A972F0);
  }
  return result;
}

unint64_t sub_23BCD6F28()
{
  unint64_t result;

  result = qword_256A972F8;
  if (!qword_256A972F8)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDE6A4, &type metadata for SidebarModalityKind.HiitCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A972F8);
  }
  return result;
}

unint64_t sub_23BCD6F70()
{
  unint64_t result;

  result = qword_256A97300;
  if (!qword_256A97300)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDE6CC, &type metadata for SidebarModalityKind.HiitCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A97300);
  }
  return result;
}

unint64_t sub_23BCD6FB8()
{
  unint64_t result;

  result = qword_256A97308;
  if (!qword_256A97308)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDE654, &type metadata for SidebarModalityKind.KickboxingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A97308);
  }
  return result;
}

unint64_t sub_23BCD7000()
{
  unint64_t result;

  result = qword_256A97310;
  if (!qword_256A97310)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDE67C, &type metadata for SidebarModalityKind.KickboxingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A97310);
  }
  return result;
}

unint64_t sub_23BCD7048()
{
  unint64_t result;

  result = qword_256A97318;
  if (!qword_256A97318)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDE604, &type metadata for SidebarModalityKind.MeditationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A97318);
  }
  return result;
}

unint64_t sub_23BCD7090()
{
  unint64_t result;

  result = qword_256A97320;
  if (!qword_256A97320)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDE62C, &type metadata for SidebarModalityKind.MeditationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A97320);
  }
  return result;
}

unint64_t sub_23BCD70D8()
{
  unint64_t result;

  result = qword_256A97328;
  if (!qword_256A97328)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDE5B4, &type metadata for SidebarModalityKind.PilatesCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A97328);
  }
  return result;
}

unint64_t sub_23BCD7120()
{
  unint64_t result;

  result = qword_256A97330;
  if (!qword_256A97330)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDE5DC, &type metadata for SidebarModalityKind.PilatesCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A97330);
  }
  return result;
}

unint64_t sub_23BCD7168()
{
  unint64_t result;

  result = qword_256A97338;
  if (!qword_256A97338)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDE564, &type metadata for SidebarModalityKind.RowingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A97338);
  }
  return result;
}

unint64_t sub_23BCD71B0()
{
  unint64_t result;

  result = qword_256A97340;
  if (!qword_256A97340)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDE58C, &type metadata for SidebarModalityKind.RowingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A97340);
  }
  return result;
}

unint64_t sub_23BCD71F8()
{
  unint64_t result;

  result = qword_256A97348;
  if (!qword_256A97348)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDE514, &type metadata for SidebarModalityKind.StrengthCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A97348);
  }
  return result;
}

unint64_t sub_23BCD7240()
{
  unint64_t result;

  result = qword_256A97350;
  if (!qword_256A97350)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDE53C, &type metadata for SidebarModalityKind.StrengthCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A97350);
  }
  return result;
}

unint64_t sub_23BCD7288()
{
  unint64_t result;

  result = qword_256A97358;
  if (!qword_256A97358)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDE4C4, &type metadata for SidebarModalityKind.TreadmillCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A97358);
  }
  return result;
}

unint64_t sub_23BCD72D0()
{
  unint64_t result;

  result = qword_256A97360;
  if (!qword_256A97360)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDE4EC, &type metadata for SidebarModalityKind.TreadmillCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A97360);
  }
  return result;
}

unint64_t sub_23BCD7318()
{
  unint64_t result;

  result = qword_256A97368;
  if (!qword_256A97368)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDE474, &type metadata for SidebarModalityKind.YogaCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A97368);
  }
  return result;
}

unint64_t sub_23BCD7360()
{
  unint64_t result;

  result = qword_256A97370;
  if (!qword_256A97370)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDE49C, &type metadata for SidebarModalityKind.YogaCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A97370);
  }
  return result;
}

unint64_t sub_23BCD73A8()
{
  unint64_t result;

  result = qword_256A97378;
  if (!qword_256A97378)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDE834, &type metadata for SidebarModalityKind.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A97378);
  }
  return result;
}

unint64_t sub_23BCD73F0()
{
  unint64_t result;

  result = qword_256A97380;
  if (!qword_256A97380)
  {
    result = MEMORY[0x24260FFB0](&unk_23BCDE85C, &type metadata for SidebarModalityKind.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A97380);
  }
  return result;
}

uint64_t sub_23BCD7434(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6E776F646C6F6F63 && a2 == 0xE800000000000000;
  if (v2 || (sub_23BCD85A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701998435 && a2 == 0xE400000000000000 || (sub_23BCD85A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x676E696C637963 && a2 == 0xE700000000000000 || (sub_23BCD85A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x65636E6164 && a2 == 0xE500000000000000 || (sub_23BCD85A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 1953065320 && a2 == 0xE400000000000000 || (sub_23BCD85A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x69786F626B63696BLL && a2 == 0xEA0000000000676ELL || (sub_23BCD85A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x697461746964656DLL && a2 == 0xEA00000000006E6FLL || (sub_23BCD85A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x736574616C6970 && a2 == 0xE700000000000000 || (sub_23BCD85A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x676E69776F72 && a2 == 0xE600000000000000 || (sub_23BCD85A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x6874676E65727473 && a2 == 0xE800000000000000 || (sub_23BCD85A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0x6C696D6461657274 && a2 == 0xE90000000000006CLL || (sub_23BCD85A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 1634168697 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else
  {
    v6 = sub_23BCD85A8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 11;
    else
      return 12;
  }
}

uint64_t sub_23BCD78E8()
{
  return MEMORY[0x24BDCB110]();
}

uint64_t sub_23BCD78F4()
{
  return MEMORY[0x24BDCC3F8]();
}

uint64_t sub_23BCD7900()
{
  return MEMORY[0x24BDCC5A8]();
}

uint64_t sub_23BCD790C()
{
  return MEMORY[0x24BDCCB90]();
}

uint64_t sub_23BCD7918()
{
  return MEMORY[0x24BDCCBA0]();
}

uint64_t sub_23BCD7924()
{
  return MEMORY[0x24BDCCBC8]();
}

uint64_t sub_23BCD7930()
{
  return MEMORY[0x24BDCCBF8]();
}

uint64_t sub_23BCD793C()
{
  return MEMORY[0x24BDCCC10]();
}

uint64_t sub_23BCD7948()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_23BCD7954()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_23BCD7960()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_23BCD796C()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_23BCD7978()
{
  return MEMORY[0x24BDCECD8]();
}

uint64_t sub_23BCD7984()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_23BCD7990()
{
  return MEMORY[0x24BE34F20]();
}

uint64_t sub_23BCD799C()
{
  return MEMORY[0x24BE34F38]();
}

uint64_t sub_23BCD79A8()
{
  return MEMORY[0x24BE37BE8]();
}

uint64_t sub_23BCD79B4()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23BCD79C0()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_23BCD79CC()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23BCD79D8()
{
  return MEMORY[0x24BEBBEC8]();
}

uint64_t sub_23BCD79E4()
{
  return MEMORY[0x24BDB9B48]();
}

uint64_t sub_23BCD79F0()
{
  return MEMORY[0x24BDB9D80]();
}

uint64_t sub_23BCD79FC()
{
  return MEMORY[0x24BDBA110]();
}

uint64_t sub_23BCD7A08()
{
  return MEMORY[0x24BDEB0A8]();
}

uint64_t sub_23BCD7A14()
{
  return MEMORY[0x24BDEB0B8]();
}

uint64_t sub_23BCD7A20()
{
  return MEMORY[0x24BDEB0D0]();
}

uint64_t sub_23BCD7A2C()
{
  return MEMORY[0x24BDEB0E0]();
}

uint64_t sub_23BCD7A38()
{
  return MEMORY[0x24BDEB0E8]();
}

uint64_t sub_23BCD7A44()
{
  return MEMORY[0x24BDEB0F0]();
}

uint64_t sub_23BCD7A50()
{
  return MEMORY[0x24BDEB780]();
}

uint64_t sub_23BCD7A5C()
{
  return MEMORY[0x24BDEB790]();
}

uint64_t sub_23BCD7A68()
{
  return MEMORY[0x24BDEB7B8]();
}

uint64_t sub_23BCD7A74()
{
  return MEMORY[0x24BDEB828]();
}

uint64_t sub_23BCD7A80()
{
  return MEMORY[0x24BDEB830]();
}

uint64_t sub_23BCD7A8C()
{
  return MEMORY[0x24BDEB8A8]();
}

uint64_t sub_23BCD7A98()
{
  return MEMORY[0x24BDEBDE0]();
}

uint64_t sub_23BCD7AA4()
{
  return MEMORY[0x24BDEBDF0]();
}

uint64_t sub_23BCD7AB0()
{
  return MEMORY[0x24BDEBE00]();
}

uint64_t sub_23BCD7ABC()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_23BCD7AC8()
{
  return MEMORY[0x24BDEC5A0]();
}

uint64_t sub_23BCD7AD4()
{
  return MEMORY[0x24BDEC7B0]();
}

uint64_t sub_23BCD7AE0()
{
  return MEMORY[0x24BDECB38]();
}

uint64_t sub_23BCD7AEC()
{
  return MEMORY[0x24BDECB58]();
}

uint64_t sub_23BCD7AF8()
{
  return MEMORY[0x24BDECB68]();
}

uint64_t sub_23BCD7B04()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t sub_23BCD7B10()
{
  return MEMORY[0x24BDEE1F0]();
}

uint64_t sub_23BCD7B1C()
{
  return MEMORY[0x24BDEE1F8]();
}

uint64_t sub_23BCD7B28()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_23BCD7B34()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_23BCD7B40()
{
  return MEMORY[0x24BDEE488]();
}

uint64_t sub_23BCD7B4C()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_23BCD7B58()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_23BCD7B64()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_23BCD7B70()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_23BCD7B7C()
{
  return MEMORY[0x24BDEEF78]();
}

uint64_t sub_23BCD7B88()
{
  return MEMORY[0x24BDEEFE0]();
}

uint64_t sub_23BCD7B94()
{
  return MEMORY[0x24BDEF000]();
}

uint64_t sub_23BCD7BA0()
{
  return MEMORY[0x24BDEF0D8]();
}

uint64_t sub_23BCD7BAC()
{
  return MEMORY[0x24BDEF0E8]();
}

uint64_t sub_23BCD7BB8()
{
  return MEMORY[0x24BDEF158]();
}

uint64_t sub_23BCD7BC4()
{
  return MEMORY[0x24BDEF168]();
}

uint64_t sub_23BCD7BD0()
{
  return MEMORY[0x24BDEF380]();
}

uint64_t sub_23BCD7BDC()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_23BCD7BE8()
{
  return MEMORY[0x24BDEF3B8]();
}

uint64_t sub_23BCD7BF4()
{
  return MEMORY[0x24BDEF6D8]();
}

uint64_t sub_23BCD7C00()
{
  return MEMORY[0x24BDEF6E0]();
}

uint64_t sub_23BCD7C0C()
{
  return MEMORY[0x24BDEF740]();
}

uint64_t sub_23BCD7C18()
{
  return MEMORY[0x24BDEFB50]();
}

uint64_t sub_23BCD7C24()
{
  return MEMORY[0x24BDEFBF0]();
}

uint64_t sub_23BCD7C30()
{
  return MEMORY[0x24BDEFCA8]();
}

uint64_t sub_23BCD7C3C()
{
  return MEMORY[0x24BDEFCB8]();
}

uint64_t sub_23BCD7C48()
{
  return MEMORY[0x24BDEFCC8]();
}

uint64_t sub_23BCD7C54()
{
  return MEMORY[0x24BDF0200]();
}

uint64_t sub_23BCD7C60()
{
  return MEMORY[0x24BDF0210]();
}

uint64_t sub_23BCD7C6C()
{
  return MEMORY[0x24BDF0220]();
}

uint64_t sub_23BCD7C78()
{
  return MEMORY[0x24BDF0230]();
}

uint64_t sub_23BCD7C84()
{
  return MEMORY[0x24BDF0440]();
}

uint64_t sub_23BCD7C90()
{
  return MEMORY[0x24BDF0468]();
}

uint64_t sub_23BCD7C9C()
{
  return MEMORY[0x24BDF0E28]();
}

uint64_t sub_23BCD7CA8()
{
  return MEMORY[0x24BDF0E38]();
}

uint64_t sub_23BCD7CB4()
{
  return MEMORY[0x24BDF0E48]();
}

uint64_t sub_23BCD7CC0()
{
  return MEMORY[0x24BDF0EC0]();
}

uint64_t sub_23BCD7CCC()
{
  return MEMORY[0x24BDF0ED0]();
}

uint64_t sub_23BCD7CD8()
{
  return MEMORY[0x24BDF0EE0]();
}

uint64_t sub_23BCD7CE4()
{
  return MEMORY[0x24BDF0EF0]();
}

uint64_t sub_23BCD7CF0()
{
  return MEMORY[0x24BDF0F00]();
}

uint64_t sub_23BCD7CFC()
{
  return MEMORY[0x24BDF0F10]();
}

uint64_t sub_23BCD7D08()
{
  return MEMORY[0x24BDF0F18]();
}

uint64_t sub_23BCD7D14()
{
  return MEMORY[0x24BDF0F28]();
}

uint64_t sub_23BCD7D20()
{
  return MEMORY[0x24BDF0F38]();
}

uint64_t sub_23BCD7D2C()
{
  return MEMORY[0x24BDF0F70]();
}

uint64_t sub_23BCD7D38()
{
  return MEMORY[0x24BDF0F78]();
}

uint64_t sub_23BCD7D44()
{
  return MEMORY[0x24BDF13A0]();
}

uint64_t sub_23BCD7D50()
{
  return MEMORY[0x24BDF13B8]();
}

uint64_t sub_23BCD7D5C()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_23BCD7D68()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_23BCD7D74()
{
  return MEMORY[0x24BDF1510]();
}

uint64_t sub_23BCD7D80()
{
  return MEMORY[0x24BDF17D8]();
}

uint64_t sub_23BCD7D8C()
{
  return MEMORY[0x24BDF17F8]();
}

uint64_t sub_23BCD7D98()
{
  return MEMORY[0x24BDF1818]();
}

uint64_t sub_23BCD7DA4()
{
  return MEMORY[0x24BDF1D18]();
}

uint64_t sub_23BCD7DB0()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_23BCD7DBC()
{
  return MEMORY[0x24BE37C18]();
}

uint64_t sub_23BCD7DC8()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_23BCD7DD4()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_23BCD7DE0()
{
  return MEMORY[0x24BDF2170]();
}

uint64_t sub_23BCD7DEC()
{
  return MEMORY[0x24BDF2228]();
}

uint64_t sub_23BCD7DF8()
{
  return MEMORY[0x24BDF22C8]();
}

uint64_t sub_23BCD7E04()
{
  return MEMORY[0x24BDF23D8]();
}

uint64_t sub_23BCD7E10()
{
  return MEMORY[0x24BDF24C0]();
}

uint64_t sub_23BCD7E1C()
{
  return MEMORY[0x24BDF2678]();
}

uint64_t sub_23BCD7E28()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_23BCD7E34()
{
  return MEMORY[0x24BDF2D60]();
}

uint64_t sub_23BCD7E40()
{
  return MEMORY[0x24BDF3740]();
}

uint64_t sub_23BCD7E4C()
{
  return MEMORY[0x24BDF3750]();
}

uint64_t sub_23BCD7E58()
{
  return MEMORY[0x24BDF37E0]();
}

uint64_t sub_23BCD7E64()
{
  return MEMORY[0x24BDF3840]();
}

uint64_t sub_23BCD7E70()
{
  return MEMORY[0x24BDF38C0]();
}

uint64_t sub_23BCD7E7C()
{
  return MEMORY[0x24BDF38C8]();
}

uint64_t sub_23BCD7E88()
{
  return MEMORY[0x24BDF38E0]();
}

uint64_t sub_23BCD7E94()
{
  return MEMORY[0x24BDF3900]();
}

uint64_t sub_23BCD7EA0()
{
  return MEMORY[0x24BDF3C40]();
}

uint64_t sub_23BCD7EAC()
{
  return MEMORY[0x24BDF3CF0]();
}

uint64_t sub_23BCD7EB8()
{
  return MEMORY[0x24BDF3D10]();
}

uint64_t sub_23BCD7EC4()
{
  return MEMORY[0x24BDF3D30]();
}

uint64_t sub_23BCD7ED0()
{
  return MEMORY[0x24BDF3D78]();
}

uint64_t sub_23BCD7EDC()
{
  return MEMORY[0x24BDF3D88]();
}

uint64_t sub_23BCD7EE8()
{
  return MEMORY[0x24BDF3E70]();
}

uint64_t sub_23BCD7EF4()
{
  return MEMORY[0x24BDF3F18]();
}

uint64_t sub_23BCD7F00()
{
  return MEMORY[0x24BDF3F28]();
}

uint64_t sub_23BCD7F0C()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_23BCD7F18()
{
  return MEMORY[0x24BDF3FE8]();
}

uint64_t sub_23BCD7F24()
{
  return MEMORY[0x24BDF4048]();
}

uint64_t sub_23BCD7F30()
{
  return MEMORY[0x24BDF40D8]();
}

uint64_t sub_23BCD7F3C()
{
  return MEMORY[0x24BDF4150]();
}

uint64_t sub_23BCD7F48()
{
  return MEMORY[0x24BDF4188]();
}

uint64_t sub_23BCD7F54()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_23BCD7F60()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_23BCD7F6C()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_23BCD7F78()
{
  return MEMORY[0x24BDF4340]();
}

uint64_t sub_23BCD7F84()
{
  return MEMORY[0x24BDF4398]();
}

uint64_t sub_23BCD7F90()
{
  return MEMORY[0x24BDF46D8]();
}

uint64_t sub_23BCD7F9C()
{
  return MEMORY[0x24BDF46E0]();
}

uint64_t sub_23BCD7FA8()
{
  return MEMORY[0x24BDF47B0]();
}

uint64_t sub_23BCD7FB4()
{
  return MEMORY[0x24BE2B3B8]();
}

uint64_t sub_23BCD7FC0()
{
  return MEMORY[0x24BDF4870]();
}

uint64_t sub_23BCD7FCC()
{
  return MEMORY[0x24BDF49A0]();
}

uint64_t sub_23BCD7FD8()
{
  return MEMORY[0x24BDF49B8]();
}

uint64_t sub_23BCD7FE4()
{
  return MEMORY[0x24BDF49C8]();
}

uint64_t sub_23BCD7FF0()
{
  return MEMORY[0x24BDF4AA0]();
}

uint64_t sub_23BCD7FFC()
{
  return MEMORY[0x24BDF4D08]();
}

uint64_t sub_23BCD8008()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_23BCD8014()
{
  return MEMORY[0x24BDF4FA8]();
}

uint64_t sub_23BCD8020()
{
  return MEMORY[0x24BDF4FE0]();
}

uint64_t sub_23BCD802C()
{
  return MEMORY[0x24BDF5478]();
}

uint64_t sub_23BCD8038()
{
  return MEMORY[0x24BDF5490]();
}

uint64_t sub_23BCD8044()
{
  return MEMORY[0x24BDF54A0]();
}

uint64_t sub_23BCD8050()
{
  return MEMORY[0x24BE2B3C0]();
}

uint64_t sub_23BCD805C()
{
  return MEMORY[0x24BE2B3D8]();
}

uint64_t sub_23BCD8068()
{
  return MEMORY[0x24BE2B3E8]();
}

uint64_t sub_23BCD8074()
{
  return MEMORY[0x24BE2B450]();
}

uint64_t sub_23BCD8080()
{
  return MEMORY[0x24BE2B460]();
}

uint64_t sub_23BCD808C()
{
  return MEMORY[0x24BE2B560]();
}

uint64_t sub_23BCD8098()
{
  return MEMORY[0x24BE2B588]();
}

uint64_t sub_23BCD80A4()
{
  return MEMORY[0x24BE2B598]();
}

uint64_t sub_23BCD80B0()
{
  return MEMORY[0x24BE2B5A0]();
}

uint64_t sub_23BCD80BC()
{
  return MEMORY[0x24BE2B5A8]();
}

uint64_t sub_23BCD80C8()
{
  return MEMORY[0x24BE2B5D0]();
}

uint64_t sub_23BCD80D4()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_23BCD80E0()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_23BCD80EC()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_23BCD80F8()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_23BCD8104()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_23BCD8110()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_23BCD811C()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_23BCD8128()
{
  return MEMORY[0x24BDCF8D8]();
}

uint64_t sub_23BCD8134()
{
  return MEMORY[0x24BDCF978]();
}

uint64_t sub_23BCD8140()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23BCD814C()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_23BCD8158()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_23BCD8164()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23BCD8170()
{
  return MEMORY[0x24BE37C28]();
}

uint64_t sub_23BCD817C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23BCD8188()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23BCD8194()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23BCD81A0()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_23BCD81AC()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_23BCD81B8()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_23BCD81C4()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_23BCD81D0()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_23BCD81DC()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_23BCD81E8()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_23BCD81F4()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t sub_23BCD8200()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_23BCD820C()
{
  return MEMORY[0x24BEE1268]();
}

uint64_t sub_23BCD8218()
{
  return MEMORY[0x24BEE1278]();
}

uint64_t sub_23BCD8224()
{
  return MEMORY[0x24BEE1308]();
}

uint64_t sub_23BCD8230()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_23BCD823C()
{
  return MEMORY[0x24BEE68D8]();
}

uint64_t sub_23BCD8248()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_23BCD8254()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_23BCD8260()
{
  return MEMORY[0x24BEE6940]();
}

uint64_t sub_23BCD826C()
{
  return MEMORY[0x24BEE6A50]();
}

uint64_t sub_23BCD8278()
{
  return MEMORY[0x24BEE6A58]();
}

uint64_t sub_23BCD8284()
{
  return MEMORY[0x24BEE6C08]();
}

uint64_t sub_23BCD8290()
{
  return MEMORY[0x24BDCFC80]();
}

uint64_t sub_23BCD829C()
{
  return MEMORY[0x24BDCFC90]();
}

uint64_t sub_23BCD82A8()
{
  return MEMORY[0x24BDCFC98]();
}

uint64_t sub_23BCD82B4()
{
  return MEMORY[0x24BDCFCA0]();
}

uint64_t sub_23BCD82C0()
{
  return MEMORY[0x24BEE14D8]();
}

uint64_t sub_23BCD82CC()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_23BCD82D8()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_23BCD82E4()
{
  return MEMORY[0x24BEE1890]();
}

uint64_t sub_23BCD82F0()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_23BCD82FC()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_23BCD8308()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_23BCD8314()
{
  return MEMORY[0x24BEE1930]();
}

uint64_t sub_23BCD8320()
{
  return MEMORY[0x24BEE19B8]();
}

uint64_t sub_23BCD832C()
{
  return MEMORY[0x24BEE1A00]();
}

uint64_t sub_23BCD8338()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_23BCD8344()
{
  return MEMORY[0x24BEE1B50]();
}

uint64_t sub_23BCD8350()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_23BCD835C()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_23BCD8368()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_23BCD8374()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_23BCD8380()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_23BCD838C()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_23BCD8398()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23BCD83A4()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23BCD83B0()
{
  return MEMORY[0x24BEE2150]();
}

uint64_t sub_23BCD83BC()
{
  return MEMORY[0x24BEE2168]();
}

uint64_t sub_23BCD83C8()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_23BCD83D4()
{
  return MEMORY[0x24BEE22F8]();
}

uint64_t sub_23BCD83E0()
{
  return MEMORY[0x24BEE2318]();
}

uint64_t sub_23BCD83EC()
{
  return MEMORY[0x24BEE2320]();
}

uint64_t sub_23BCD83F8()
{
  return MEMORY[0x24BEE2328]();
}

uint64_t sub_23BCD8404()
{
  return MEMORY[0x24BEE2348]();
}

uint64_t sub_23BCD8410()
{
  return MEMORY[0x24BEE2368]();
}

uint64_t sub_23BCD841C()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_23BCD8428()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23BCD8434()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23BCD8440()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_23BCD844C()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_23BCD8458()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_23BCD8464()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23BCD8470()
{
  return MEMORY[0x24BEE2950]();
}

uint64_t sub_23BCD847C()
{
  return MEMORY[0x24BEE29C0]();
}

uint64_t sub_23BCD8488()
{
  return MEMORY[0x24BEE2A00]();
}

uint64_t sub_23BCD8494()
{
  return MEMORY[0x24BEE2A08]();
}

uint64_t sub_23BCD84A0()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23BCD84AC()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_23BCD84B8()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_23BCD84C4()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_23BCD84D0()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23BCD84DC()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_23BCD84E8()
{
  return MEMORY[0x24BEE3288]();
}

uint64_t sub_23BCD84F4()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_23BCD8500()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_23BCD850C()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_23BCD8518()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_23BCD8524()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_23BCD8530()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_23BCD853C()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_23BCD8548()
{
  return MEMORY[0x24BEE33E0]();
}

uint64_t sub_23BCD8554()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_23BCD8560()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_23BCD856C()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_23BCD8578()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_23BCD8584()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_23BCD8590()
{
  return MEMORY[0x24BEE3520]();
}

uint64_t sub_23BCD859C()
{
  return MEMORY[0x24BEE3930]();
}

uint64_t sub_23BCD85A8()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23BCD85B4()
{
  return MEMORY[0x24BEE42C8]();
}

uint64_t sub_23BCD85C0()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23BCD85CC()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23BCD85D8()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_23BCD85E4()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_23BCD85F0()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23BCD85FC()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_23BCD8608()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23BCD8614()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23BCD8620()
{
  return MEMORY[0x24BEE4A10]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB88]();
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
  MEMORY[0x24BDBDDF8](c, gradient, *(_QWORD *)&options, (__n128)startPoint, *(__n128 *)&startPoint.y, (__n128)endPoint, *(__n128 *)&endPoint.y);
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x24BDBE538](space, colors, locations);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x24BDBEFC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x24BED8580]();
}

uint64_t MobileGestalt_get_wapiCapability()
{
  return MEMORY[0x24BED8680]();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
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

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
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

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x24BEE4DC8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
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

uint64_t swift_initEnumMetadataSingleCase()
{
  return MEMORY[0x24BEE4E38]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x24BEE4E40]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
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

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x24BEE4FB0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x24BEE4FD0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x24BEE4FD8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

