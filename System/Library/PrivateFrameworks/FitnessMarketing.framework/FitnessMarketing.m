uint64_t MarketingActionItem.action.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23C1B50D4(v1, a1, (uint64_t (*)(_QWORD))type metadata accessor for MarketingAction);
}

uint64_t MarketingActionItem.identifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for MarketingActionItem() + 20));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t type metadata accessor for MarketingActionItem()
{
  uint64_t result;

  result = qword_256B40988;
  if (!qword_256B40988)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t MarketingActionItem.footnote.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for MarketingActionItem() + 24));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MarketingActionItem.style.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for MarketingActionItem();
  *a1 = *(_BYTE *)(v1 + *(int *)(result + 28));
  return result;
}

uint64_t MarketingActionItem.title.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for MarketingActionItem() + 32));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MarketingActionItem.init(identifier:action:footnote:style:title:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char *a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  char v17;
  int *v18;
  _QWORD *v19;
  uint64_t result;
  _QWORD *v21;
  _QWORD *v22;

  v17 = *a6;
  v18 = (int *)type metadata accessor for MarketingActionItem();
  v19 = (_QWORD *)(a9 + v18[5]);
  *v19 = a1;
  v19[1] = a2;
  result = sub_23C1B43AC(a3, a9);
  v21 = (_QWORD *)(a9 + v18[6]);
  *v21 = a4;
  v21[1] = a5;
  *(_BYTE *)(a9 + v18[7]) = v17;
  v22 = (_QWORD *)(a9 + v18[8]);
  *v22 = a7;
  v22[1] = a8;
  return result;
}

uint64_t sub_23C1B43AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MarketingAction();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t MarketingActionItem.init(_:style:)@<X0>(void *a1@<X0>, char *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  char v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int *v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B408E0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for MarketingAction();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v38 - v14;
  v16 = *a2;
  v17 = objc_msgSend(a1, sel_callToActionLabel);
  if (!v17)
  {

    goto LABEL_5;
  }
  v18 = v17;
  v39 = sub_23C1FBCCC();
  v20 = v19;

  v21 = a1;
  sub_23C1C6018(v21, (uint64_t)v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    swift_bridgeObjectRelease();

    sub_23C1B46C4((uint64_t)v8);
LABEL_5:
    v22 = type metadata accessor for MarketingActionItem();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(a3, 1, 1, v22);
  }
  sub_23C1B43AC((uint64_t)v8, (uint64_t)v15);
  v24 = objc_msgSend(v21, sel_offerID);
  if (v24)
  {
    v25 = v24;
    v38 = sub_23C1FBCCC();
    v27 = v26;

  }
  else
  {
    v38 = 0;
    v27 = 0;
  }
  v28 = v16;
  sub_23C1B50D4((uint64_t)v15, (uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for MarketingAction);
  v29 = objc_msgSend(v21, sel_disclaimerText);
  if (v29)
  {
    v30 = v29;
    v31 = sub_23C1FBCCC();
    v33 = v32;

  }
  else
  {

    v31 = 0;
    v33 = 0;
  }
  sub_23C1B5118((uint64_t)v15, (uint64_t (*)(_QWORD))type metadata accessor for MarketingAction);
  v34 = (int *)type metadata accessor for MarketingActionItem();
  v35 = (uint64_t *)(a3 + v34[5]);
  *v35 = v38;
  v35[1] = v27;
  sub_23C1B43AC((uint64_t)v13, a3);
  v36 = (uint64_t *)(a3 + v34[6]);
  *v36 = v31;
  v36[1] = v33;
  *(_BYTE *)(a3 + v34[7]) = v28;
  v37 = (uint64_t *)(a3 + v34[8]);
  *v37 = v39;
  v37[1] = v20;
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, int *))(*((_QWORD *)v34 - 1) + 56))(a3, 0, 1, v34);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x242619AF8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_23C1B46C4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B408E0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

BOOL sub_23C1B4704(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23C1B4718()
{
  sub_23C1FBFCC();
  sub_23C1FBFD8();
  return sub_23C1FBFFC();
}

uint64_t sub_23C1B475C()
{
  return sub_23C1FBFD8();
}

uint64_t sub_23C1B4784()
{
  sub_23C1FBFCC();
  sub_23C1FBFD8();
  return sub_23C1FBFFC();
}

uint64_t sub_23C1B47C4()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23C1B47F0 + 4 * byte_23C1FC780[*v0]))(0x6E6F69746361, 0xE600000000000000);
}

uint64_t sub_23C1B47F0()
{
  return 0x696669746E656469;
}

uint64_t sub_23C1B480C()
{
  return 0x65746F6E746F6F66;
}

uint64_t sub_23C1B4824()
{
  return 0x656C797473;
}

uint64_t sub_23C1B4838()
{
  return 0x656C746974;
}

uint64_t sub_23C1B484C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C1B5360(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C1B4870()
{
  return 0;
}

void sub_23C1B487C(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_23C1B4888()
{
  sub_23C1B4C7C();
  return sub_23C1FC020();
}

uint64_t sub_23C1B48B0()
{
  sub_23C1B4C7C();
  return sub_23C1FC02C();
}

uint64_t MarketingActionItem.id.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v8;

  v1 = sub_23C1FB498();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = (uint64_t *)(v0 + *(int *)(type metadata accessor for MarketingActionItem() + 20));
  if (v5[1])
  {
    v6 = *v5;
  }
  else
  {
    sub_23C1FB48C();
    v6 = sub_23C1FB480();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  swift_bridgeObjectRetain();
  return v6;
}

uint64_t sub_23C1B4998@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v5 = sub_23C1FB498();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (uint64_t *)(v2 + *(int *)(a1 + 20));
  if (v9[1])
  {
    v10 = *v9;
    v11 = v9[1];
  }
  else
  {
    sub_23C1FB48C();
    v10 = sub_23C1FB480();
    v11 = v12;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  *a2 = v10;
  a2[1] = v11;
  return swift_bridgeObjectRetain();
}

uint64_t MarketingActionItem.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  _BYTE v11[16];

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B408E8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C1B4C7C();
  sub_23C1FC014();
  v11[15] = 0;
  type metadata accessor for MarketingAction();
  sub_23C1B56F4(&qword_256B408F8, (uint64_t (*)(uint64_t))type metadata accessor for MarketingAction, (uint64_t)&protocol conformance descriptor for MarketingAction);
  sub_23C1FBF78();
  if (!v2)
  {
    v9 = type metadata accessor for MarketingActionItem();
    v11[14] = 1;
    sub_23C1FBF3C();
    v11[13] = 2;
    sub_23C1FBF3C();
    v11[12] = *(_BYTE *)(v3 + *(int *)(v9 + 28));
    v11[11] = 3;
    sub_23C1B4CC0();
    sub_23C1FBF78();
    v11[10] = 4;
    sub_23C1FBF54();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_23C1B4C7C()
{
  unint64_t result;

  result = qword_256B408F0;
  if (!qword_256B408F0)
  {
    result = MEMORY[0x242619B10](&unk_23C1FCA00, &type metadata for MarketingActionItem.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B408F0);
  }
  return result;
}

unint64_t sub_23C1B4CC0()
{
  unint64_t result;

  result = qword_256B40900;
  if (!qword_256B40900)
  {
    result = MEMORY[0x242619B10](&protocol conformance descriptor for MarketingActionItemStyle, &type metadata for MarketingActionItemStyle);
    atomic_store(result, (unint64_t *)&qword_256B40900);
  }
  return result;
}

uint64_t MarketingActionItem.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  int *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t);
  uint64_t v26;
  uint64_t *v27;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  char v36;
  char v37;
  char v38;
  char v39;
  char v40;

  v30 = a2;
  type metadata accessor for MarketingAction();
  MEMORY[0x24BDAC7A8]();
  v31 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40908);
  v4 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (int *)type metadata accessor for MarketingActionItem();
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C1B4C7C();
  v32 = v6;
  v10 = v34;
  sub_23C1FC008();
  if (v10)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v11 = v4;
  v12 = (uint64_t)v9;
  v40 = 0;
  sub_23C1B56F4(&qword_256B40910, (uint64_t (*)(uint64_t))type metadata accessor for MarketingAction, (uint64_t)&protocol conformance descriptor for MarketingAction);
  v14 = (uint64_t)v31;
  v13 = v32;
  v15 = v33;
  sub_23C1FBF18();
  sub_23C1B43AC(v14, v12);
  v39 = 1;
  v16 = sub_23C1FBEDC();
  v17 = (uint64_t *)(v12 + v7[5]);
  *v17 = v16;
  v17[1] = v18;
  v38 = 2;
  v19 = sub_23C1FBEDC();
  v20 = (uint64_t *)(v12 + v7[6]);
  *v20 = v19;
  v20[1] = v21;
  v36 = 3;
  sub_23C1B5090();
  sub_23C1FBF18();
  *(_BYTE *)(v12 + v7[7]) = v37;
  v35 = 4;
  v22 = sub_23C1FBEF4();
  v24 = v23;
  v25 = *(void (**)(char *, uint64_t))(v11 + 8);
  v26 = v22;
  v25(v13, v15);
  v27 = (uint64_t *)(v12 + v7[8]);
  *v27 = v26;
  v27[1] = v24;
  sub_23C1B50D4(v12, v30, (uint64_t (*)(_QWORD))type metadata accessor for MarketingActionItem);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_23C1B5118(v12, (uint64_t (*)(_QWORD))type metadata accessor for MarketingActionItem);
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

unint64_t sub_23C1B5090()
{
  unint64_t result;

  result = qword_256B40918;
  if (!qword_256B40918)
  {
    result = MEMORY[0x242619B10](&protocol conformance descriptor for MarketingActionItemStyle, &type metadata for MarketingActionItemStyle);
    atomic_store(result, (unint64_t *)&qword_256B40918);
  }
  return result;
}

uint64_t sub_23C1B50D4(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23C1B5118(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23C1B5154@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return MarketingActionItem.init(from:)(a1, a2);
}

uint64_t sub_23C1B5168(_QWORD *a1)
{
  return MarketingActionItem.encode(to:)(a1);
}

uint64_t MarketingActionItem.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;

  MarketingAction.hash(into:)();
  v1 = type metadata accessor for MarketingActionItem();
  if (*(_QWORD *)(v0 + *(int *)(v1 + 20) + 8))
  {
    sub_23C1FBFE4();
    swift_bridgeObjectRetain();
    sub_23C1FBCF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_23C1FBFE4();
  }
  if (*(_QWORD *)(v0 + *(int *)(v1 + 24) + 8))
  {
    sub_23C1FBFE4();
    swift_bridgeObjectRetain();
    sub_23C1FBCF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_23C1FBFE4();
  }
  sub_23C1FBFD8();
  sub_23C1FBFD8();
  swift_bridgeObjectRetain();
  sub_23C1FBCF0();
  return swift_bridgeObjectRelease();
}

uint64_t MarketingActionItem.hashValue.getter()
{
  sub_23C1FBFCC();
  MarketingActionItem.hash(into:)();
  return sub_23C1FBFFC();
}

uint64_t sub_23C1B52E4()
{
  sub_23C1FBFCC();
  MarketingActionItem.hash(into:)();
  return sub_23C1FBFFC();
}

uint64_t sub_23C1B5324()
{
  sub_23C1FBFCC();
  MarketingActionItem.hash(into:)();
  return sub_23C1FBFFC();
}

uint64_t sub_23C1B5360(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6E6F69746361 && a2 == 0xE600000000000000;
  if (v2 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x696669746E656469 && a2 == 0xEA00000000007265 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x65746F6E746F6F66 && a2 == 0xE800000000000000 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x656C797473 && a2 == 0xE500000000000000 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x656C746974 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v6 = sub_23C1FBF90();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

uint64_t _s16FitnessMarketing0B10ActionItemV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  int *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  char v11;
  uint64_t result;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  char v19;
  uint64_t v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;

  if ((_s16FitnessMarketing0B6ActionO2eeoiySbAC_ACtFZ_0(a1, a2) & 1) == 0)
    return 0;
  v4 = (int *)type metadata accessor for MarketingActionItem();
  v5 = v4[5];
  v6 = (_QWORD *)(a1 + v5);
  v7 = *(_QWORD *)(a1 + v5 + 8);
  v8 = (_QWORD *)(a2 + v5);
  v9 = v8[1];
  if (v7)
  {
    if (!v9)
      return 0;
    if (*v6 != *v8 || v7 != v9)
    {
      v11 = sub_23C1FBF90();
      result = 0;
      if ((v11 & 1) == 0)
        return result;
    }
  }
  else if (v9)
  {
    return 0;
  }
  v13 = v4[6];
  v14 = (_QWORD *)(a1 + v13);
  v15 = *(_QWORD *)(a1 + v13 + 8);
  v16 = (_QWORD *)(a2 + v13);
  v17 = v16[1];
  if (v15)
  {
    if (v17)
    {
      if (*v14 != *v16 || v15 != v17)
      {
        v19 = sub_23C1FBF90();
        result = 0;
        if ((v19 & 1) == 0)
          return result;
      }
      goto LABEL_22;
    }
    return 0;
  }
  if (v17)
    return 0;
LABEL_22:
  v20 = v4[7];
  v21 = *(char *)(a1 + v20);
  v22 = *(unsigned __int8 *)(a1 + v20);
  v23 = *(unsigned __int8 *)(a2 + v20);
  result = 0;
  if (v21 < 0)
  {
    if ((v23 & 0x80) == 0 || ((v23 ^ v22) & 0x7F) != 0)
      return result;
  }
  else if ((v23 & 0x80) != 0 || v22 != v23)
  {
    return result;
  }
  v24 = v4[8];
  v25 = *(_QWORD *)(a1 + v24);
  v26 = *(_QWORD *)(a1 + v24 + 8);
  v27 = (_QWORD *)(a2 + v24);
  if (v25 == *v27 && v26 == v27[1])
    return 1;
  else
    return sub_23C1FBF90();
}

uint64_t sub_23C1B56BC()
{
  return MEMORY[0x24BEE0D10];
}

uint64_t sub_23C1B56C8()
{
  return sub_23C1B56F4(&qword_256B40920, (uint64_t (*)(uint64_t))type metadata accessor for MarketingActionItem, (uint64_t)&protocol conformance descriptor for MarketingActionItem);
}

uint64_t sub_23C1B56F4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x242619B10](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for MarketingActionItem(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    type metadata accessor for MarketingAction();
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
      v8 = sub_23C1FB468();
    else
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40928);
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
    swift_storeEnumTagMultiPayload();
    v10 = a3[5];
    v11 = a3[6];
    v12 = (_QWORD *)((char *)a1 + v10);
    v13 = (_QWORD *)((char *)a2 + v10);
    v14 = v13[1];
    *v12 = *v13;
    v12[1] = v14;
    v15 = (_QWORD *)((char *)a1 + v11);
    v16 = (_QWORD *)((char *)a2 + v11);
    v17 = v16[1];
    *v15 = *v16;
    v15[1] = v17;
    v18 = a3[8];
    *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
    v19 = (_QWORD *)((char *)a1 + v18);
    v20 = (_QWORD *)((char *)a2 + v18);
    v21 = v20[1];
    *v19 = *v20;
    v19[1] = v21;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for MarketingActionItem(uint64_t a1)
{
  int EnumCaseMultiPayload;
  uint64_t v3;

  type metadata accessor for MarketingAction();
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
  {
    v3 = sub_23C1FB468();
    goto LABEL_6;
  }
  if (!EnumCaseMultiPayload)
  {
    v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40928);
LABEL_6:
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for MarketingActionItem(uint64_t a1, uint64_t a2, int *a3)
{
  int EnumCaseMultiPayload;
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
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;

  type metadata accessor for MarketingAction();
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    v7 = sub_23C1FB468();
  else
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40928);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
  swift_storeEnumTagMultiPayload();
  v8 = a3[5];
  v9 = a3[6];
  v10 = (_QWORD *)(a1 + v8);
  v11 = (_QWORD *)(a2 + v8);
  v12 = v11[1];
  *v10 = *v11;
  v10[1] = v12;
  v13 = (_QWORD *)(a1 + v9);
  v14 = (_QWORD *)(a2 + v9);
  v15 = v14[1];
  *v13 = *v14;
  v13[1] = v15;
  v16 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  v17 = (_QWORD *)(a1 + v16);
  v18 = (_QWORD *)(a2 + v16);
  v19 = v18[1];
  *v17 = *v18;
  v17[1] = v19;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for MarketingActionItem(uint64_t a1, uint64_t a2, int *a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;

  if (a1 != a2)
  {
    sub_23C1B5118(a1, (uint64_t (*)(_QWORD))type metadata accessor for MarketingAction);
    type metadata accessor for MarketingAction();
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
      v7 = sub_23C1FB468();
    else
      v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40928);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  v8 = a3[5];
  v9 = (_QWORD *)(a1 + v8);
  v10 = (_QWORD *)(a2 + v8);
  *v9 = *v10;
  v9[1] = v10[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v11 = a3[6];
  v12 = (_QWORD *)(a1 + v11);
  v13 = (_QWORD *)(a2 + v11);
  *v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  v14 = a3[8];
  v15 = (_QWORD *)(a1 + v14);
  v16 = (_QWORD *)(a2 + v14);
  *v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for MarketingActionItem(uint64_t a1, uint64_t a2, int *a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  type metadata accessor for MarketingAction();
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    v7 = sub_23C1FB468();
  else
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40928);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
  swift_storeEnumTagMultiPayload();
  v8 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  v9 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  *(_OWORD *)(a1 + v9) = *(_OWORD *)(a2 + v9);
  return a1;
}

uint64_t assignWithTake for MarketingActionItem(uint64_t a1, uint64_t a2, int *a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  if (a1 != a2)
  {
    sub_23C1B5118(a1, (uint64_t (*)(_QWORD))type metadata accessor for MarketingAction);
    type metadata accessor for MarketingAction();
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
      v7 = sub_23C1FB468();
    else
      v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40928);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  v8 = a3[5];
  v9 = (_QWORD *)(a1 + v8);
  v10 = (uint64_t *)(a2 + v8);
  v12 = *v10;
  v11 = v10[1];
  *v9 = v12;
  v9[1] = v11;
  swift_bridgeObjectRelease();
  v13 = a3[6];
  v14 = (_QWORD *)(a1 + v13);
  v15 = (uint64_t *)(a2 + v13);
  v17 = *v15;
  v16 = v15[1];
  *v14 = v17;
  v14[1] = v16;
  swift_bridgeObjectRelease();
  v18 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  v19 = (_QWORD *)(a1 + v18);
  v20 = (uint64_t *)(a2 + v18);
  v22 = *v20;
  v21 = v20[1];
  *v19 = v22;
  v19[1] = v21;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MarketingActionItem()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C1B5D2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = type metadata accessor for MarketingAction();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 32) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for MarketingActionItem()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C1B5DB8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for MarketingAction();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 32) + 8) = (a2 - 1);
  return result;
}

uint64_t sub_23C1B5E34()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for MarketingAction();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_23C1B5ECC(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_23C1B5EEC(uint64_t result, int a2, int a3)
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

  if (!qword_256B409D0)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_256B409D0);
  }
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MarketingActionItem.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for MarketingActionItem.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C1B6050 + 4 * byte_23C1FC78A[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_23C1B6084 + 4 * byte_23C1FC785[v4]))();
}

uint64_t sub_23C1B6084(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1B608C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C1B6094);
  return result;
}

uint64_t sub_23C1B60A0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C1B60A8);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_23C1B60AC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1B60B4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1B60C0(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23C1B60CC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MarketingActionItem.CodingKeys()
{
  return &type metadata for MarketingActionItem.CodingKeys;
}

unint64_t sub_23C1B60E8()
{
  unint64_t result;

  result = qword_256B409D8;
  if (!qword_256B409D8)
  {
    result = MEMORY[0x242619B10](&unk_23C1FC9D8, &type metadata for MarketingActionItem.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B409D8);
  }
  return result;
}

unint64_t sub_23C1B6130()
{
  unint64_t result;

  result = qword_256B409E0;
  if (!qword_256B409E0)
  {
    result = MEMORY[0x242619B10](&unk_23C1FC948, &type metadata for MarketingActionItem.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B409E0);
  }
  return result;
}

unint64_t sub_23C1B6178()
{
  unint64_t result;

  result = qword_256B409E8;
  if (!qword_256B409E8)
  {
    result = MEMORY[0x242619B10](&unk_23C1FC970, &type metadata for MarketingActionItem.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B409E8);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for MarketingPurchaseResult(uint64_t a1, uint64_t a2)
{
  void *v3;
  char v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v4;
  v5 = v3;
  return a1;
}

void destroy for MarketingPurchaseResult(id *a1)
{

}

uint64_t assignWithCopy for MarketingPurchaseResult(uint64_t a1, uint64_t a2)
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  v3 = *(void **)a2;
  v4 = *(_BYTE *)(a2 + 8);
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v4;
  v6 = v3;

  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t assignWithTake for MarketingPurchaseResult(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;

  v3 = *(_BYTE *)(a2 + 8);
  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;

  return a1;
}

uint64_t getEnumTagSinglePayload for MarketingPurchaseResult(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for MarketingPurchaseResult(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t sub_23C1B630C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_23C1B6314(uint64_t result, char a2)
{
  *(_BYTE *)(result + 8) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for MarketingPurchaseResult()
{
  return &type metadata for MarketingPurchaseResult;
}

BOOL sub_23C1B6334(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_23C1B6354()
{
  _BYTE *v0;

  if (*v0)
    return 0x426465646E756F72;
  else
    return 0x7475426E69616C70;
}

uint64_t sub_23C1B63A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C1B70F0(a1, a2);
  *a3 = result;
  return result;
}

void sub_23C1B63C8(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_23C1B63D4()
{
  sub_23C1B683C();
  return sub_23C1FC020();
}

uint64_t sub_23C1B63FC()
{
  sub_23C1B683C();
  return sub_23C1FC02C();
}

uint64_t sub_23C1B6424()
{
  _BYTE *v0;

  if (*v0)
    return 0x746E756F4378616DLL;
  else
    return 0xD000000000000010;
}

uint64_t sub_23C1B6464@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C1B721C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C1B6488()
{
  sub_23C1B694C();
  return sub_23C1FC020();
}

uint64_t sub_23C1B64B0()
{
  sub_23C1B694C();
  return sub_23C1FC02C();
}

uint64_t sub_23C1B64D8()
{
  sub_23C1B6880();
  return sub_23C1FC020();
}

uint64_t sub_23C1B6500()
{
  sub_23C1B6880();
  return sub_23C1FC02C();
}

uint64_t MarketingOfferTemplateItem.encode(to:)(_QWORD *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  char v13;
  _QWORD *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  int v33;
  char v34;

  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B409F0);
  v3 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  v24 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B409F8);
  v27 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40A00);
  v9 = *(_QWORD *)(v8 - 8);
  v29 = v8;
  v30 = v9;
  MEMORY[0x24BDAC7A8](v8);
  v26 = *((_QWORD *)v1 + 1);
  v11 = v1[16];
  v33 = v1[16];
  v12 = a1[3];
  v13 = *v1;
  v14 = a1;
  v15 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(v14, v12);
  sub_23C1B683C();
  sub_23C1FC014();
  if (v11 < 0)
  {
    LOBYTE(v31) = 1;
    sub_23C1B6880();
    v19 = v24;
    v20 = v29;
    sub_23C1FBF30();
    LOBYTE(v31) = v13;
    v34 = 0;
    sub_23C1B68C4();
    v21 = v25;
    v22 = v28;
    sub_23C1FBF78();
    if (!v22)
    {
      v31 = v26;
      v32 = v33 & 1;
      v34 = 1;
      sub_23C1B6908();
      sub_23C1FBF78();
    }
    (*(void (**)(char *, uint64_t))(v3 + 8))(v19, v21);
    return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v15, v20);
  }
  else
  {
    LOBYTE(v31) = 0;
    sub_23C1B694C();
    v16 = v29;
    sub_23C1FBF30();
    LOBYTE(v31) = v13;
    v34 = 0;
    sub_23C1B68C4();
    v17 = v28;
    sub_23C1FBF78();
    if (!v17)
    {
      v31 = v26;
      v32 = v33 & 1;
      v34 = 1;
      sub_23C1B6908();
      sub_23C1FBF78();
    }
    (*(void (**)(char *, uint64_t))(v27 + 8))(v7, v5);
    return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v15, v16);
  }
}

unint64_t sub_23C1B683C()
{
  unint64_t result;

  result = qword_256B40A08;
  if (!qword_256B40A08)
  {
    result = MEMORY[0x242619B10](&unk_23C1FCE80, &type metadata for MarketingOfferTemplateItem.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40A08);
  }
  return result;
}

unint64_t sub_23C1B6880()
{
  unint64_t result;

  result = qword_256B40A10;
  if (!qword_256B40A10)
  {
    result = MEMORY[0x242619B10](&unk_23C1FCE30, &type metadata for MarketingOfferTemplateItem.RoundedButtonCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40A10);
  }
  return result;
}

unint64_t sub_23C1B68C4()
{
  unint64_t result;

  result = qword_256B40A18;
  if (!qword_256B40A18)
  {
    result = MEMORY[0x242619B10](&protocol conformance descriptor for MarketingOfferTemplateFootnotePosition, &type metadata for MarketingOfferTemplateFootnotePosition);
    atomic_store(result, (unint64_t *)&qword_256B40A18);
  }
  return result;
}

unint64_t sub_23C1B6908()
{
  unint64_t result;

  result = qword_256B40A20;
  if (!qword_256B40A20)
  {
    result = MEMORY[0x242619B10](&protocol conformance descriptor for MarketingOfferTemplateItemCount, &type metadata for MarketingOfferTemplateItemCount);
    atomic_store(result, (unint64_t *)&qword_256B40A20);
  }
  return result;
}

unint64_t sub_23C1B694C()
{
  unint64_t result;

  result = qword_256B40A28;
  if (!qword_256B40A28)
  {
    result = MEMORY[0x242619B10](&unk_23C1FCDE0, &type metadata for MarketingOfferTemplateItem.PlainButtonCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40A28);
  }
  return result;
}

uint64_t MarketingOfferTemplateItem.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
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
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  char *v20;
  unsigned int v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  char v37;
  unsigned __int8 v38;

  v29 = a2;
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40A30);
  v30 = *(_QWORD *)(v32 - 8);
  MEMORY[0x24BDAC7A8](v32);
  v31 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40A38);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40A40);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a1[3];
  v33 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v12);
  sub_23C1B683C();
  v13 = v34;
  sub_23C1FC008();
  if (!v13)
  {
    v28 = v5;
    v14 = v31;
    v15 = v32;
    v34 = v9;
    v16 = sub_23C1FBF24();
    if (*(_QWORD *)(v16 + 16) == 1)
    {
      if ((*(_BYTE *)(v16 + 32) & 1) != 0)
      {
        LOBYTE(v35) = 1;
        sub_23C1B6880();
        sub_23C1FBEC4();
        LOBYTE(v35) = 0;
        sub_23C1B6E38();
        sub_23C1FBF18();
        v22 = v38;
        v37 = 1;
        sub_23C1B6E7C();
        sub_23C1FBF18();
        (*(void (**)(char *, uint64_t))(v30 + 8))(v14, v15);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v34 + 8))(v11, v8);
        v23 = v35;
        v24 = v36 | 0x80;
      }
      else
      {
        LOBYTE(v35) = 0;
        sub_23C1B694C();
        v20 = v7;
        sub_23C1FBEC4();
        LOBYTE(v35) = 0;
        sub_23C1B6E38();
        sub_23C1FBF18();
        v22 = v38;
        v37 = 1;
        sub_23C1B6E7C();
        sub_23C1FBF18();
        v25 = v34;
        (*(void (**)(char *, uint64_t))(v28 + 8))(v20, v4);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v25 + 8))(v11, v8);
        v23 = v35;
        v24 = v36;
      }
      v26 = v29;
      *v29 = v22;
      v26[1] = v23;
      *((_BYTE *)v26 + 16) = v24;
    }
    else
    {
      v17 = sub_23C1FBE58();
      swift_allocError();
      v19 = v18;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256B40A48);
      *v19 = &type metadata for MarketingOfferTemplateItem;
      sub_23C1FBED0();
      sub_23C1FBE4C();
      (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v17 - 8) + 104))(v19, *MEMORY[0x24BEE26D0], v17);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v34 + 8))(v11, v8);
    }
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
}

unint64_t sub_23C1B6E38()
{
  unint64_t result;

  result = qword_256B40A50;
  if (!qword_256B40A50)
  {
    result = MEMORY[0x242619B10](&protocol conformance descriptor for MarketingOfferTemplateFootnotePosition, &type metadata for MarketingOfferTemplateFootnotePosition);
    atomic_store(result, (unint64_t *)&qword_256B40A50);
  }
  return result;
}

unint64_t sub_23C1B6E7C()
{
  unint64_t result;

  result = qword_256B40A58;
  if (!qword_256B40A58)
  {
    result = MEMORY[0x242619B10](&protocol conformance descriptor for MarketingOfferTemplateItemCount, &type metadata for MarketingOfferTemplateItemCount);
    atomic_store(result, (unint64_t *)&qword_256B40A58);
  }
  return result;
}

uint64_t sub_23C1B6EC0@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return MarketingOfferTemplateItem.init(from:)(a1, a2);
}

uint64_t sub_23C1B6ED4(_QWORD *a1)
{
  return MarketingOfferTemplateItem.encode(to:)(a1);
}

uint64_t MarketingOfferTemplateItem.hash(into:)()
{
  uint64_t v0;
  char v1;

  v1 = *(_BYTE *)(v0 + 16);
  if ((v1 & 0x80000000) == 0)
  {
    sub_23C1FBFD8();
    sub_23C1FBFD8();
    if ((v1 & 1) != 0)
      return sub_23C1FBFD8();
    goto LABEL_5;
  }
  sub_23C1FBFD8();
  sub_23C1FBFD8();
  if ((v1 & 1) == 0)
LABEL_5:
    sub_23C1FBFD8();
  return sub_23C1FBFD8();
}

uint64_t MarketingOfferTemplateItem.hashValue.getter()
{
  uint64_t v0;
  int v1;

  v1 = *(char *)(v0 + 16);
  sub_23C1FBFCC();
  if ((v1 & 0x80000000) == 0)
  {
    sub_23C1FBFD8();
    sub_23C1FBFD8();
    if ((v1 & 1) != 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  sub_23C1FBFD8();
  sub_23C1FBFD8();
  if ((v1 & 1) == 0)
LABEL_5:
    sub_23C1FBFD8();
LABEL_6:
  sub_23C1FBFD8();
  return sub_23C1FBFFC();
}

uint64_t sub_23C1B7038()
{
  uint64_t v0;
  int v1;

  v1 = *(char *)(v0 + 16);
  sub_23C1FBFCC();
  if ((v1 & 0x80000000) == 0)
  {
    sub_23C1FBFD8();
    sub_23C1FBFD8();
    if ((v1 & 1) != 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  sub_23C1FBFD8();
  sub_23C1FBFD8();
  if ((v1 & 1) == 0)
LABEL_5:
    sub_23C1FBFD8();
LABEL_6:
  sub_23C1FBFD8();
  return sub_23C1FBFFC();
}

uint64_t sub_23C1B70F0(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x7475426E69616C70 && a2 == 0xEB000000006E6F74;
  if (v2 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x426465646E756F72 && a2 == 0xED00006E6F747475)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23C1FBF90();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23C1B721C(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000010 && a2 == 0x800000023C2037A0 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x746E756F4378616DLL && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v5 = sub_23C1FBF90();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

BOOL _s16FitnessMarketing0B17OfferTemplateItemO2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v3 = *a2;
  if ((char)a1[2] < 0)
  {
    if ((a2[2] & 0x80) == 0 || v3 != v2)
      return 0;
    if ((a1[2] & 1) == 0)
      return (a2[2] & 1) == 0 && a1[1] == a2[1];
  }
  else
  {
    if ((a2[2] & 0x80) != 0 || v3 != v2)
      return 0;
    if ((a1[2] & 1) == 0)
      return (a2[2] & 1) == 0 && a1[1] == a2[1];
  }
  return (a2[2] & 1) != 0;
}

unint64_t sub_23C1B7370()
{
  unint64_t result;

  result = qword_256B40A60;
  if (!qword_256B40A60)
  {
    result = MEMORY[0x242619B10](&protocol conformance descriptor for MarketingOfferTemplateItem, &type metadata for MarketingOfferTemplateItem);
    atomic_store(result, (unint64_t *)&qword_256B40A60);
  }
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

uint64_t getEnumTagSinglePayload for MarketingOfferTemplateItem(uint64_t a1, int a2)
{
  uint64_t v2;
  int v3;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 17))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)a1 >> 2;
  if (v2 > 0x80000000)
    v3 = ~(_DWORD)v2;
  else
    v3 = -1;
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for MarketingOfferTemplateItem(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = 4 * -a2;
      *(_QWORD *)(result + 8) = 0;
      *(_BYTE *)(result + 16) = 0;
      return result;
    }
    *(_BYTE *)(result + 17) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t sub_23C1B7460(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16) >> 7;
}

uint64_t sub_23C1B746C(uint64_t result)
{
  *(_BYTE *)(result + 16) &= ~0x80u;
  return result;
}

uint64_t sub_23C1B747C(uint64_t result, char a2)
{
  char v2;

  v2 = *(_BYTE *)(result + 16) & 1 | (a2 << 7);
  *(_QWORD *)result &= 3uLL;
  *(_BYTE *)(result + 16) = v2;
  return result;
}

ValueMetadata *type metadata accessor for MarketingOfferTemplateItem()
{
  return &type metadata for MarketingOfferTemplateItem;
}

_BYTE *sub_23C1B74B4(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for MarketingOfferTemplateItem.CodingKeys()
{
  return &type metadata for MarketingOfferTemplateItem.CodingKeys;
}

ValueMetadata *type metadata accessor for MarketingOfferTemplateItem.PlainButtonCodingKeys()
{
  return &type metadata for MarketingOfferTemplateItem.PlainButtonCodingKeys;
}

uint64_t getEnumTagSinglePayload for MarketingActionItemStyle.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s16FitnessMarketing26MarketingOfferTemplateItemO10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C1B75BC + 4 * byte_23C1FCA85[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C1B75F0 + 4 * byte_23C1FCA80[v4]))();
}

uint64_t sub_23C1B75F0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1B75F8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C1B7600);
  return result;
}

uint64_t sub_23C1B760C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C1B7614);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C1B7618(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1B7620(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MarketingOfferTemplateItem.RoundedButtonCodingKeys()
{
  return &type metadata for MarketingOfferTemplateItem.RoundedButtonCodingKeys;
}

unint64_t sub_23C1B7640()
{
  unint64_t result;

  result = qword_256B40A68;
  if (!qword_256B40A68)
  {
    result = MEMORY[0x242619B10](&unk_23C1FCC48, &type metadata for MarketingOfferTemplateItem.RoundedButtonCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40A68);
  }
  return result;
}

unint64_t sub_23C1B7688()
{
  unint64_t result;

  result = qword_256B40A70;
  if (!qword_256B40A70)
  {
    result = MEMORY[0x242619B10](&unk_23C1FCD00, &type metadata for MarketingOfferTemplateItem.PlainButtonCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40A70);
  }
  return result;
}

unint64_t sub_23C1B76D0()
{
  unint64_t result;

  result = qword_256B40A78;
  if (!qword_256B40A78)
  {
    result = MEMORY[0x242619B10](&unk_23C1FCDB8, &type metadata for MarketingOfferTemplateItem.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40A78);
  }
  return result;
}

unint64_t sub_23C1B7718()
{
  unint64_t result;

  result = qword_256B40A80;
  if (!qword_256B40A80)
  {
    result = MEMORY[0x242619B10](&unk_23C1FCC70, &type metadata for MarketingOfferTemplateItem.PlainButtonCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40A80);
  }
  return result;
}

unint64_t sub_23C1B7760()
{
  unint64_t result;

  result = qword_256B40A88;
  if (!qword_256B40A88)
  {
    result = MEMORY[0x242619B10](&unk_23C1FCC98, &type metadata for MarketingOfferTemplateItem.PlainButtonCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40A88);
  }
  return result;
}

unint64_t sub_23C1B77A8()
{
  unint64_t result;

  result = qword_256B40A90;
  if (!qword_256B40A90)
  {
    result = MEMORY[0x242619B10](&unk_23C1FCBB8, &type metadata for MarketingOfferTemplateItem.RoundedButtonCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40A90);
  }
  return result;
}

unint64_t sub_23C1B77F0()
{
  unint64_t result;

  result = qword_256B40A98;
  if (!qword_256B40A98)
  {
    result = MEMORY[0x242619B10](&unk_23C1FCBE0, &type metadata for MarketingOfferTemplateItem.RoundedButtonCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40A98);
  }
  return result;
}

unint64_t sub_23C1B7838()
{
  unint64_t result;

  result = qword_256B40AA0;
  if (!qword_256B40AA0)
  {
    result = MEMORY[0x242619B10](&unk_23C1FCD28, &type metadata for MarketingOfferTemplateItem.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40AA0);
  }
  return result;
}

unint64_t sub_23C1B7880()
{
  unint64_t result;

  result = qword_256B40AA8;
  if (!qword_256B40AA8)
  {
    result = MEMORY[0x242619B10](&unk_23C1FCD50, &type metadata for MarketingOfferTemplateItem.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40AA8);
  }
  return result;
}

uint64_t static MarketingOfferPlacement.fallbackURL.getter()
{
  sub_23C1FBE1C();
  sub_23C1FBCFC();
  sub_23C1FBCFC();
  sub_23C1FB45C();
  return swift_bridgeObjectRelease();
}

uint64_t MarketingOfferPlacement.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23C1B79B0 + 4 * byte_23C1FCED0[a1]))(0xD000000000000015, 0x800000023C203580);
}

unint64_t sub_23C1B79B0()
{
  return 0xD000000000000014;
}

uint64_t sub_23C1B7A5C()
{
  uint64_t v0;

  return v0 + 2;
}

uint64_t sub_23C1B7A6C()
{
  uint64_t v0;

  return v0 + 14;
}

void sub_23C1B7A7C()
{
  JUMPOUT(0x23C1B7A88);
}

uint64_t sub_23C1B7A98(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *a2;
  v3 = MarketingOfferPlacement.rawValue.getter(*a1);
  v5 = v4;
  if (v3 == MarketingOfferPlacement.rawValue.getter(v2) && v5 == v6)
    v8 = 1;
  else
    v8 = sub_23C1FBF90();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_23C1B7B20@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = _s16FitnessMarketing0B14OfferPlacementO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_23C1B7B4C@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = MarketingOfferPlacement.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_23C1B7B74()
{
  sub_23C1B7F04();
  return sub_23C1FBD20();
}

uint64_t sub_23C1B7BD0()
{
  sub_23C1B7F04();
  return sub_23C1FBD14();
}

uint64_t sub_23C1B7C1C()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_23C1FBFCC();
  MarketingOfferPlacement.rawValue.getter(v1);
  sub_23C1FBCF0();
  swift_bridgeObjectRelease();
  return sub_23C1FBFFC();
}

uint64_t sub_23C1B7C7C()
{
  unsigned __int8 *v0;

  MarketingOfferPlacement.rawValue.getter(*v0);
  sub_23C1FBCF0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C1B7CBC()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_23C1FBFCC();
  MarketingOfferPlacement.rawValue.getter(v1);
  sub_23C1FBCF0();
  swift_bridgeObjectRelease();
  return sub_23C1FBFFC();
}

uint64_t _s16FitnessMarketing0B14OfferPlacementO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0;

  v0 = sub_23C1FBEB8();
  swift_bridgeObjectRelease();
  if (v0 >= 0xD)
    return 13;
  else
    return v0;
}

unint64_t sub_23C1B7D64()
{
  unint64_t result;

  result = qword_256B40AB0;
  if (!qword_256B40AB0)
  {
    result = MEMORY[0x242619B10](&protocol conformance descriptor for MarketingOfferPlacement, &type metadata for MarketingOfferPlacement);
    atomic_store(result, (unint64_t *)&qword_256B40AB0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for MarketingOfferPlacement(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF4)
    goto LABEL_17;
  if (a2 + 12 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 12) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 12;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 12;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 12;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xD;
  v8 = v6 - 13;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for MarketingOfferPlacement(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 12 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 12) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF4)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF3)
    return ((uint64_t (*)(void))((char *)&loc_23C1B7E84 + 4 * byte_23C1FCEE2[v4]))();
  *a1 = a2 + 12;
  return ((uint64_t (*)(void))((char *)sub_23C1B7EB8 + 4 * byte_23C1FCEDD[v4]))();
}

uint64_t sub_23C1B7EB8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1B7EC0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C1B7EC8);
  return result;
}

uint64_t sub_23C1B7ED4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C1B7EDCLL);
  *(_BYTE *)result = a2 + 12;
  return result;
}

uint64_t sub_23C1B7EE0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1B7EE8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MarketingOfferPlacement()
{
  return &type metadata for MarketingOfferPlacement;
}

unint64_t sub_23C1B7F04()
{
  unint64_t result;

  result = qword_256B40AB8;
  if (!qword_256B40AB8)
  {
    result = MEMORY[0x242619B10](&protocol conformance descriptor for MarketingOfferPlacement, &type metadata for MarketingOfferPlacement);
    atomic_store(result, (unint64_t *)&qword_256B40AB8);
  }
  return result;
}

BOOL static MarketingActionItemStyle.== infix(_:_:)(unsigned __int8 *a1, char *a2)
{
  int v2;
  int v3;
  _BOOL4 v4;

  v2 = *a1;
  v3 = *a2;
  if ((v2 & 0x80u) == 0)
    v4 = v3 >= 0;
  else
    v4 = v3 < 0;
  return v2 == v3 && v4;
}

uint64_t sub_23C1B7F74()
{
  _BYTE *v0;

  if (*v0)
    return 0x6465646E756F72;
  else
    return 0x6E69616C70;
}

uint64_t sub_23C1B7FAC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C1B90BC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C1B7FD0()
{
  sub_23C1B8418();
  return sub_23C1FC020();
}

uint64_t sub_23C1B7FF8()
{
  sub_23C1B8418();
  return sub_23C1FC02C();
}

uint64_t sub_23C1B8020()
{
  return 1;
}

uint64_t sub_23C1B802C()
{
  return sub_23C1FBFD8();
}

unint64_t sub_23C1B8054()
{
  return 0xD000000000000010;
}

uint64_t sub_23C1B8070@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C1B91A4(a1, a2);
  *a3 = result & 1;
  return result;
}

void sub_23C1B8098(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_23C1B80A4()
{
  sub_23C1B84A0();
  return sub_23C1FC020();
}

uint64_t sub_23C1B80CC()
{
  sub_23C1B84A0();
  return sub_23C1FC02C();
}

uint64_t sub_23C1B80F4()
{
  sub_23C1FBFCC();
  sub_23C1FBFD8();
  return sub_23C1FBFFC();
}

uint64_t sub_23C1B8134()
{
  sub_23C1FBFCC();
  sub_23C1FBFD8();
  return sub_23C1FBFFC();
}

uint64_t sub_23C1B8170()
{
  sub_23C1B845C();
  return sub_23C1FC020();
}

uint64_t sub_23C1B8198()
{
  sub_23C1B845C();
  return sub_23C1FC02C();
}

void MarketingActionItemStyle.footnotePosition.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1 & 0x7F;
}

uint64_t MarketingActionItemStyle.encode(to:)(_QWORD *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int v11;
  char v12;
  char *v13;
  uint64_t v14;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  char v23;
  char v24;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40AC0);
  v17 = *(_QWORD *)(v3 - 8);
  v18 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v16 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40AC8);
  v19 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40AD0);
  v20 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C1B8418();
  sub_23C1FC014();
  if (v11 < 0)
  {
    v12 = v11 & 0x7F;
    v24 = 1;
    sub_23C1B845C();
    v13 = v16;
    sub_23C1FBF30();
    v23 = v12;
    sub_23C1B68C4();
    v14 = v18;
    sub_23C1FBF78();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v13, v14);
  }
  else
  {
    v22 = 0;
    sub_23C1B84A0();
    sub_23C1FBF30();
    v21 = v11;
    sub_23C1B68C4();
    sub_23C1FBF78();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v7, v5);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v10, v8);
}

unint64_t sub_23C1B8418()
{
  unint64_t result;

  result = qword_256B40AD8;
  if (!qword_256B40AD8)
  {
    result = MEMORY[0x242619B10](&unk_23C1FD3FC, &type metadata for MarketingActionItemStyle.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40AD8);
  }
  return result;
}

unint64_t sub_23C1B845C()
{
  unint64_t result;

  result = qword_256B40AE0;
  if (!qword_256B40AE0)
  {
    result = MEMORY[0x242619B10](&unk_23C1FD3AC, &type metadata for MarketingActionItemStyle.RoundedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40AE0);
  }
  return result;
}

unint64_t sub_23C1B84A0()
{
  unint64_t result;

  result = qword_256B40AE8;
  if (!qword_256B40AE8)
  {
    result = MEMORY[0x242619B10](&unk_23C1FD35C, &type metadata for MarketingActionItemStyle.PlainCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40AE8);
  }
  return result;
}

uint64_t MarketingActionItemStyle.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
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
  uint64_t v16;
  char *v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  char v32;
  char v33;
  char v34;
  char v35;

  v26 = a2;
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40AF0);
  v27 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v28 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40AF8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40B00);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a1[3];
  v30 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v12);
  sub_23C1B8418();
  v13 = v31;
  sub_23C1FC008();
  if (!v13)
  {
    v24 = v4;
    v25 = v5;
    v14 = v28;
    v15 = v29;
    v31 = v9;
    v16 = sub_23C1FBF24();
    if (*(_QWORD *)(v16 + 16) == 1)
    {
      v17 = v11;
      if ((*(_BYTE *)(v16 + 32) & 1) != 0)
      {
        v35 = 1;
        sub_23C1B845C();
        sub_23C1FBEC4();
        sub_23C1B6E38();
        sub_23C1FBF18();
        (*(void (**)(char *, uint64_t))(v27 + 8))(v14, v15);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v31 + 8))(v11, v8);
        v18 = v34 | 0x80;
      }
      else
      {
        v33 = 0;
        sub_23C1B84A0();
        sub_23C1FBEC4();
        sub_23C1B6E38();
        v23 = v24;
        sub_23C1FBF18();
        (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v23);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v31 + 8))(v17, v8);
        v18 = v32;
      }
      *v26 = v18;
    }
    else
    {
      v19 = sub_23C1FBE58();
      swift_allocError();
      v21 = v20;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256B40A48);
      *v21 = &type metadata for MarketingActionItemStyle;
      sub_23C1FBED0();
      sub_23C1FBE4C();
      (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v19 - 8) + 104))(v21, *MEMORY[0x24BEE26D0], v19);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v31 + 8))(v11, v8);
    }
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
}

uint64_t sub_23C1B889C@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return MarketingActionItemStyle.init(from:)(a1, a2);
}

uint64_t sub_23C1B88B0(_QWORD *a1)
{
  return MarketingActionItemStyle.encode(to:)(a1);
}

uint64_t MarketingActionItemStyle.hash(into:)()
{
  sub_23C1FBFD8();
  return sub_23C1FBFD8();
}

uint64_t MarketingActionItemStyle.hashValue.getter()
{
  sub_23C1FBFCC();
  sub_23C1FBFD8();
  sub_23C1FBFD8();
  return sub_23C1FBFFC();
}

uint64_t sub_23C1B8958()
{
  sub_23C1FBFCC();
  sub_23C1FBFD8();
  sub_23C1FBFD8();
  return sub_23C1FBFFC();
}

uint64_t sub_23C1B89AC()
{
  sub_23C1FBFD8();
  return sub_23C1FBFD8();
}

uint64_t sub_23C1B89EC()
{
  sub_23C1FBFCC();
  sub_23C1FBFD8();
  sub_23C1FBFD8();
  return sub_23C1FBFFC();
}

BOOL sub_23C1B8A3C(unsigned __int8 *a1, char *a2)
{
  int v2;
  int v3;
  _BOOL4 v4;

  v2 = *a1;
  v3 = *a2;
  if ((v2 & 0x80u) == 0)
    v4 = v3 >= 0;
  else
    v4 = v3 < 0;
  return v2 == v3 && v4;
}

unint64_t sub_23C1B8A6C()
{
  unint64_t result;

  result = qword_256B40B08;
  if (!qword_256B40B08)
  {
    result = MEMORY[0x242619B10](&protocol conformance descriptor for MarketingActionItemStyle, &type metadata for MarketingActionItemStyle);
    atomic_store(result, (unint64_t *)&qword_256B40B08);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for MarketingActionItemStyle(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;

  if (!a2)
    return 0;
  if (a2 < 0x3F)
    goto LABEL_17;
  if (a2 + 193 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 193) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 193;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 193;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 193;
  }
LABEL_17:
  v6 = ((*a1 >> 1) & 0x3E | (*a1 >> 7)) ^ 0x3F;
  if (v6 >= 0x3E)
    v6 = -1;
  return v6 + 1;
}

uint64_t storeEnumTagSinglePayload for MarketingActionItemStyle(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 193 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 193) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0x3F)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0x3E)
    return ((uint64_t (*)(void))((char *)&loc_23C1B8B9C + 4 * byte_23C1FD005[v4]))();
  *a1 = a2 - 63;
  return ((uint64_t (*)(void))((char *)sub_23C1B8BD0 + 4 * byte_23C1FD000[v4]))();
}

uint64_t sub_23C1B8BD0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1B8BD8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C1B8BE0);
  return result;
}

uint64_t sub_23C1B8BF8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C1B8C00);
  *(_BYTE *)result = 4 * (((-a2 >> 1) & 0x1F) - 32 * a2);
  return result;
}

uint64_t sub_23C1B8C04(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1B8C0C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1B8C18(unsigned __int8 *a1)
{
  return *a1 >> 7;
}

_BYTE *sub_23C1B8C24(_BYTE *result)
{
  *result &= ~0x80u;
  return result;
}

_BYTE *sub_23C1B8C34(_BYTE *result, char a2)
{
  *result = *result & 3 | (a2 << 7);
  return result;
}

ValueMetadata *type metadata accessor for MarketingActionItemStyle()
{
  return &type metadata for MarketingActionItemStyle;
}

uint64_t storeEnumTagSinglePayload for MarketingActionItemStyle.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C1B8CA4 + 4 * byte_23C1FD00F[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C1B8CD8 + 4 * byte_23C1FD00A[v4]))();
}

uint64_t sub_23C1B8CD8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1B8CE0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C1B8CE8);
  return result;
}

uint64_t sub_23C1B8CF4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C1B8CFCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C1B8D00(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1B8D08(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MarketingActionItemStyle.CodingKeys()
{
  return &type metadata for MarketingActionItemStyle.CodingKeys;
}

uint64_t sub_23C1B8D30()
{
  return 0;
}

ValueMetadata *type metadata accessor for MarketingActionItemStyle.PlainCodingKeys()
{
  return &type metadata for MarketingActionItemStyle.PlainCodingKeys;
}

uint64_t getEnumTagSinglePayload for ServiceSubscriptionMonitorLocalState.CodingKeys(unsigned int *a1, int a2)
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

uint64_t _s16FitnessMarketing24MarketingActionItemStyleO15PlainCodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23C1B8DD8 + 4 * byte_23C1FD014[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23C1B8DF8 + 4 * byte_23C1FD019[v4]))();
}

_BYTE *sub_23C1B8DD8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23C1B8DF8(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C1B8E00(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C1B8E08(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C1B8E10(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C1B8E18(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for MarketingActionItemStyle.RoundedCodingKeys()
{
  return &type metadata for MarketingActionItemStyle.RoundedCodingKeys;
}

unint64_t sub_23C1B8E38()
{
  unint64_t result;

  result = qword_256B40B10;
  if (!qword_256B40B10)
  {
    result = MEMORY[0x242619B10](&unk_23C1FD1C4, &type metadata for MarketingActionItemStyle.RoundedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40B10);
  }
  return result;
}

unint64_t sub_23C1B8E80()
{
  unint64_t result;

  result = qword_256B40B18;
  if (!qword_256B40B18)
  {
    result = MEMORY[0x242619B10](&unk_23C1FD27C, &type metadata for MarketingActionItemStyle.PlainCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40B18);
  }
  return result;
}

unint64_t sub_23C1B8EC8()
{
  unint64_t result;

  result = qword_256B40B20;
  if (!qword_256B40B20)
  {
    result = MEMORY[0x242619B10](&unk_23C1FD334, &type metadata for MarketingActionItemStyle.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40B20);
  }
  return result;
}

unint64_t sub_23C1B8F10()
{
  unint64_t result;

  result = qword_256B40B28;
  if (!qword_256B40B28)
  {
    result = MEMORY[0x242619B10](&unk_23C1FD1EC, &type metadata for MarketingActionItemStyle.PlainCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40B28);
  }
  return result;
}

unint64_t sub_23C1B8F58()
{
  unint64_t result;

  result = qword_256B40B30;
  if (!qword_256B40B30)
  {
    result = MEMORY[0x242619B10](&unk_23C1FD214, &type metadata for MarketingActionItemStyle.PlainCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40B30);
  }
  return result;
}

unint64_t sub_23C1B8FA0()
{
  unint64_t result;

  result = qword_256B40B38;
  if (!qword_256B40B38)
  {
    result = MEMORY[0x242619B10](&unk_23C1FD134, &type metadata for MarketingActionItemStyle.RoundedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40B38);
  }
  return result;
}

unint64_t sub_23C1B8FE8()
{
  unint64_t result;

  result = qword_256B40B40;
  if (!qword_256B40B40)
  {
    result = MEMORY[0x242619B10](&unk_23C1FD15C, &type metadata for MarketingActionItemStyle.RoundedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40B40);
  }
  return result;
}

unint64_t sub_23C1B9030()
{
  unint64_t result;

  result = qword_256B40B48;
  if (!qword_256B40B48)
  {
    result = MEMORY[0x242619B10](&unk_23C1FD2A4, &type metadata for MarketingActionItemStyle.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40B48);
  }
  return result;
}

unint64_t sub_23C1B9078()
{
  unint64_t result;

  result = qword_256B40B50;
  if (!qword_256B40B50)
  {
    result = MEMORY[0x242619B10](&unk_23C1FD2CC, &type metadata for MarketingActionItemStyle.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40B50);
  }
  return result;
}

uint64_t sub_23C1B90BC(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6E69616C70 && a2 == 0xE500000000000000;
  if (v2 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6465646E756F72 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23C1FBF90();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23C1B91A4(uint64_t a1, uint64_t a2)
{
  char v2;
  char v3;

  if (a1 == 0xD000000000000010 && a2 == 0x800000023C2037A0)
  {
    swift_bridgeObjectRelease();
    v2 = 0;
  }
  else
  {
    v3 = sub_23C1FBF90();
    swift_bridgeObjectRelease();
    v2 = v3 ^ 1;
  }
  return v2 & 1;
}

uint64_t MarketingOffer.actionItems.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t MarketingOffer.artwork.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for MarketingOffer() + 20);
  return sub_23C1B92A4(v3, a1);
}

uint64_t type metadata accessor for MarketingOffer()
{
  uint64_t result;

  result = qword_256B40C40;
  if (!qword_256B40C40)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23C1B92A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40B58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t MarketingOffer.identifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for MarketingOffer() + 24));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MarketingOffer.subtitle.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for MarketingOffer() + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MarketingOffer.title.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for MarketingOffer() + 32));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MarketingOffer.underlyingMarketingItem.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for MarketingOffer() + 36);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40B60);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t MarketingOffer.init(identifier:title:subtitle:actionItems:artwork:underlyingMarketingItem:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, char *a9@<X8>, uint64_t a10)
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  int *v20;
  char *v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v27 = a6;
  v28 = a7;
  v26 = a5;
  v29 = a10;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40B60);
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v26 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = (int *)type metadata accessor for MarketingOffer();
  v21 = &a9[v20[6]];
  *(_QWORD *)v21 = a1;
  *((_QWORD *)v21 + 1) = a2;
  v22 = &a9[v20[8]];
  *(_QWORD *)v22 = a3;
  *((_QWORD *)v22 + 1) = a4;
  v23 = &a9[v20[7]];
  v24 = v27;
  *(_QWORD *)v23 = v26;
  *((_QWORD *)v23 + 1) = v24;
  *(_QWORD *)a9 = v28;
  sub_23C1B92A4(a8, (uint64_t)&a9[v20[5]]);
  sub_23C1B9520();
  sub_23C1FB51C();
  sub_23C1BC2EC(a8, &qword_256B40B58);
  return (*(uint64_t (**)(char *, char *, uint64_t))(v17 + 32))(&a9[v20[9]], v19, v16);
}

unint64_t sub_23C1B9520()
{
  unint64_t result;

  result = qword_256B40B68;
  if (!qword_256B40B68)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256B40B68);
  }
  return result;
}

uint64_t sub_23C1B955C()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23C1B9594 + 4 * byte_23C1FD450[*v0]))(0x74496E6F69746361, 0xEB00000000736D65);
}

uint64_t sub_23C1B9594()
{
  return 0x6B726F77747261;
}

uint64_t sub_23C1B95AC()
{
  return 0x696669746E656469;
}

uint64_t sub_23C1B95C8()
{
  return 0x656C746974627573;
}

uint64_t sub_23C1B95E0()
{
  return 0x656C746974;
}

unint64_t sub_23C1B95F4()
{
  return 0xD000000000000017;
}

uint64_t sub_23C1B9610@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C1BC054(a1, a2);
  *a3 = result;
  return result;
}

void sub_23C1B9634(_BYTE *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_23C1B9640()
{
  sub_23C1B9920();
  return sub_23C1FC020();
}

uint64_t sub_23C1B9668()
{
  sub_23C1B9920();
  return sub_23C1FC02C();
}

uint64_t MarketingOffer.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE v10[8];
  uint64_t v11;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40B70);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C1B9920();
  sub_23C1FC014();
  v11 = *v3;
  v10[7] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B40B80);
  sub_23C1B9E98(&qword_256B40B88, &qword_256B40B90, (uint64_t)&protocol conformance descriptor for MarketingActionItem, MEMORY[0x24BEE12A0]);
  sub_23C1FBF78();
  if (!v2)
  {
    type metadata accessor for MarketingOffer();
    v10[6] = 1;
    type metadata accessor for MarketingArtwork();
    sub_23C1B56F4(&qword_256B40B98, (uint64_t (*)(uint64_t))type metadata accessor for MarketingArtwork, (uint64_t)&protocol conformance descriptor for MarketingArtwork);
    sub_23C1FBF48();
    v10[5] = 2;
    sub_23C1FBF3C();
    v10[4] = 3;
    sub_23C1FBF3C();
    v10[3] = 4;
    sub_23C1FBF3C();
    v10[2] = 5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B40B60);
    sub_23C1BC328(&qword_256B40BA0, &qword_256B40B60, MEMORY[0x24BE37A28]);
    sub_23C1FBF78();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_23C1B9920()
{
  unint64_t result;

  result = qword_256B40B78;
  if (!qword_256B40B78)
  {
    result = MEMORY[0x242619B10](&unk_23C1FD63C, &type metadata for MarketingOffer.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40B78);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x242619B04](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t MarketingOffer.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char *v30;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  _QWORD *v39;
  uint64_t v40;
  char v41;
  char v42;
  char v43;
  char v44;
  char v45;
  char v46;
  uint64_t v47;

  v35 = a2;
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40B60);
  v34 = *(_QWORD *)(v36 - 8);
  MEMORY[0x24BDAC7A8](v36);
  v4 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40B58);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40BA8);
  v8 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v37);
  v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (int *)type metadata accessor for MarketingOffer();
  MEMORY[0x24BDAC7A8](v11);
  v13 = (uint64_t *)((char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14 = a1[3];
  v39 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v14);
  sub_23C1B9920();
  v38 = v10;
  v15 = v40;
  sub_23C1FC008();
  if (v15)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v39);
  v16 = (uint64_t)v7;
  v40 = v8;
  v33 = v4;
  v17 = v36;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B40B80);
  v46 = 0;
  sub_23C1B9E98(&qword_256B40BB0, &qword_256B40BB8, (uint64_t)&protocol conformance descriptor for MarketingActionItem, MEMORY[0x24BEE12D0]);
  v18 = v37;
  sub_23C1FBF18();
  v19 = (uint64_t)v13;
  *v13 = v47;
  type metadata accessor for MarketingArtwork();
  v45 = 1;
  sub_23C1B56F4(&qword_256B40BC0, (uint64_t (*)(uint64_t))type metadata accessor for MarketingArtwork, (uint64_t)&protocol conformance descriptor for MarketingArtwork);
  sub_23C1FBEE8();
  v20 = v11;
  sub_23C1B9F1C(v16, v19 + v11[5]);
  v44 = 2;
  v21 = sub_23C1FBEDC();
  v22 = (uint64_t *)(v19 + v11[6]);
  *v22 = v21;
  v22[1] = v23;
  v43 = 3;
  v24 = sub_23C1FBEDC();
  v25 = (uint64_t *)(v19 + v11[7]);
  *v25 = v24;
  v25[1] = v26;
  v42 = 4;
  v27 = sub_23C1FBEDC();
  v32 = 0;
  v28 = (uint64_t *)(v19 + v11[8]);
  *v28 = v27;
  v28[1] = v29;
  v41 = 5;
  sub_23C1BC328(&qword_256B40BC8, &qword_256B40B60, MEMORY[0x24BE37A38]);
  v30 = v33;
  sub_23C1FBF18();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v38, v18);
  (*(void (**)(uint64_t, char *, uint64_t))(v34 + 32))(v19 + v20[9], v30, v17);
  sub_23C1B50D4(v19, v35, (uint64_t (*)(_QWORD))type metadata accessor for MarketingOffer);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v39);
  return sub_23C1B5118(v19, (uint64_t (*)(_QWORD))type metadata accessor for MarketingOffer);
}

uint64_t sub_23C1B9E98(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B40B80);
    v10 = sub_23C1B56F4(a2, (uint64_t (*)(uint64_t))type metadata accessor for MarketingActionItem, a3);
    result = MEMORY[0x242619B10](a4, v9, &v10);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23C1B9F1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40B58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23C1B9F64@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return MarketingOffer.init(from:)(a1, a2);
}

uint64_t sub_23C1B9F78(_QWORD *a1)
{
  return MarketingOffer.encode(to:)(a1);
}

uint64_t MarketingOffer.hash(into:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  int *v12;
  uint64_t v14;

  v2 = v1;
  v4 = type metadata accessor for MarketingArtwork();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40B58);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *v2;
  swift_bridgeObjectRetain();
  sub_23C1BA2C4(a1, v11);
  swift_bridgeObjectRelease();
  v12 = (int *)type metadata accessor for MarketingOffer();
  sub_23C1B92A4((uint64_t)v2 + v12[5], (uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4) == 1)
  {
    sub_23C1FBFE4();
  }
  else
  {
    sub_23C1BA678((uint64_t)v10, (uint64_t)v7);
    sub_23C1FBFE4();
    MarketingArtwork.hash(into:)();
    sub_23C1B5118((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for MarketingArtwork);
  }
  if (*(uint64_t *)((char *)v2 + v12[6] + 8))
  {
    sub_23C1FBFE4();
    swift_bridgeObjectRetain();
    sub_23C1FBCF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_23C1FBFE4();
  }
  if (*(uint64_t *)((char *)v2 + v12[7] + 8))
  {
    sub_23C1FBFE4();
    swift_bridgeObjectRetain();
    sub_23C1FBCF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_23C1FBFE4();
  }
  if (*(uint64_t *)((char *)v2 + v12[8] + 8))
  {
    sub_23C1FBFE4();
    swift_bridgeObjectRetain();
    sub_23C1FBCF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_23C1FBFE4();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B40B60);
  sub_23C1BC328(&qword_256B40BD0, &qword_256B40B60, MEMORY[0x24BE37A30]);
  return sub_23C1FBC90();
}

uint64_t MarketingOffer.hashValue.getter()
{
  _BYTE v1[72];

  sub_23C1FBFCC();
  MarketingOffer.hash(into:)((uint64_t)v1);
  return sub_23C1FBFFC();
}

uint64_t sub_23C1BA248()
{
  _BYTE v1[72];

  sub_23C1FBFCC();
  MarketingOffer.hash(into:)((uint64_t)v1);
  return sub_23C1FBFFC();
}

uint64_t sub_23C1BA288()
{
  _BYTE v1[72];

  sub_23C1FBFCC();
  MarketingOffer.hash(into:)((uint64_t)v1);
  return sub_23C1FBFFC();
}

uint64_t sub_23C1BA2C4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v3 = sub_23C1FB468();
  v28 = *(_QWORD *)(v3 - 8);
  v29 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40928);
  v26 = *(_QWORD *)(v6 - 8);
  v27 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v25 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for MarketingAction();
  MEMORY[0x24BDAC7A8](v8);
  v31 = (uint64_t)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for MarketingActionItem();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(_QWORD *)(a2 + 16);
  result = sub_23C1FBFD8();
  if (v14)
  {
    v16 = a2 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
    v30 = *(_QWORD *)(v11 + 72);
    v24 = v8;
    do
    {
      sub_23C1B50D4(v16, (uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for MarketingActionItem);
      sub_23C1B50D4((uint64_t)v13, v31, (uint64_t (*)(_QWORD))type metadata accessor for MarketingAction);
      if (swift_getEnumCaseMultiPayload())
      {
        v18 = v28;
        v17 = v29;
        (*(void (**)(char *, uint64_t, uint64_t))(v28 + 32))(v5, v31, v29);
        sub_23C1FBFD8();
        sub_23C1B56F4(&qword_256B40CB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
        sub_23C1FBC90();
        (*(void (**)(char *, uint64_t))(v18 + 8))(v5, v17);
      }
      else
      {
        v20 = v26;
        v19 = v27;
        v21 = v5;
        v22 = v25;
        (*(void (**)(char *, uint64_t, uint64_t))(v26 + 32))(v25, v31, v27);
        sub_23C1FBFD8();
        sub_23C1BC328(&qword_256B40CC0, &qword_256B40928, MEMORY[0x24BE37A30]);
        sub_23C1FBC90();
        v23 = v22;
        v5 = v21;
        (*(void (**)(char *, uint64_t))(v20 + 8))(v23, v19);
      }
      if (*(_QWORD *)&v13[*(int *)(v10 + 20) + 8])
      {
        sub_23C1FBFE4();
        swift_bridgeObjectRetain();
        sub_23C1FBCF0();
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_23C1FBFE4();
      }
      if (*(_QWORD *)&v13[*(int *)(v10 + 24) + 8])
      {
        sub_23C1FBFE4();
        swift_bridgeObjectRetain();
        sub_23C1FBCF0();
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_23C1FBFE4();
      }
      sub_23C1FBFD8();
      sub_23C1FBFD8();
      swift_bridgeObjectRetain();
      sub_23C1FBCF0();
      swift_bridgeObjectRelease();
      result = sub_23C1B5118((uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for MarketingActionItem);
      v16 += v30;
      --v14;
    }
    while (v14);
  }
  return result;
}

uint64_t sub_23C1BA678(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MarketingArtwork();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23C1BA6BC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;
  char *v5;
  char v6;

  v3 = *(_QWORD *)(a2 + 16);
  result = sub_23C1FBFD8();
  if (v3)
  {
    v5 = (char *)(a2 + 48);
    do
    {
      v6 = *v5;
      if (*v5 < 0)
      {
        sub_23C1FBFD8();
        sub_23C1FBFD8();
        if ((v6 & 1) != 0)
          goto LABEL_4;
      }
      else
      {
        sub_23C1FBFD8();
        sub_23C1FBFD8();
        if ((v6 & 1) != 0)
          goto LABEL_4;
      }
      sub_23C1FBFD8();
LABEL_4:
      v5 += 24;
      result = sub_23C1FBFD8();
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t _s16FitnessMarketing0B5OfferV2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t *a2)
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
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  unsigned int (*v25)(uint64_t, uint64_t, uint64_t);
  char v26;
  BOOL v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t *v50;

  v4 = type metadata accessor for MarketingArtwork();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40CB0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40B58);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&v49 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v49 - v18;
  if ((sub_23C1C2CC4(*a1, *a2) & 1) == 0)
    goto LABEL_8;
  v20 = type metadata accessor for MarketingOffer();
  v50 = a2;
  v21 = v20;
  sub_23C1B92A4((uint64_t)a1 + *(int *)(v20 + 20), (uint64_t)v19);
  v49 = v21;
  v22 = *(int *)(v21 + 20);
  v23 = v50;
  sub_23C1B92A4((uint64_t)v50 + v22, (uint64_t)v17);
  v24 = (uint64_t)&v10[*(int *)(v8 + 48)];
  sub_23C1B92A4((uint64_t)v19, (uint64_t)v10);
  sub_23C1B92A4((uint64_t)v17, v24);
  v25 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (v25((uint64_t)v10, 1, v4) == 1)
  {
    sub_23C1BC2EC((uint64_t)v17, &qword_256B40B58);
    sub_23C1BC2EC((uint64_t)v19, &qword_256B40B58);
    if (v25(v24, 1, v4) == 1)
    {
      sub_23C1BC2EC((uint64_t)v10, &qword_256B40B58);
      goto LABEL_11;
    }
LABEL_7:
    sub_23C1BC2EC((uint64_t)v10, &qword_256B40CB0);
    goto LABEL_8;
  }
  sub_23C1B92A4((uint64_t)v10, (uint64_t)v14);
  if (v25(v24, 1, v4) == 1)
  {
    sub_23C1BC2EC((uint64_t)v17, &qword_256B40B58);
    sub_23C1BC2EC((uint64_t)v19, &qword_256B40B58);
    sub_23C1B5118((uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for MarketingArtwork);
    goto LABEL_7;
  }
  sub_23C1BA678(v24, (uint64_t)v7);
  v28 = _s16FitnessMarketing0B7ArtworkV2eeoiySbAC_ACtFZ_0((uint64_t)v14, (uint64_t)v7);
  sub_23C1B5118((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for MarketingArtwork);
  sub_23C1BC2EC((uint64_t)v17, &qword_256B40B58);
  sub_23C1BC2EC((uint64_t)v19, &qword_256B40B58);
  sub_23C1B5118((uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for MarketingArtwork);
  sub_23C1BC2EC((uint64_t)v10, &qword_256B40B58);
  if (!v28)
    goto LABEL_8;
LABEL_11:
  v29 = v23;
  v30 = v49;
  v31 = *(int *)(v49 + 24);
  v32 = (uint64_t *)((char *)a1 + v31);
  v33 = *(uint64_t *)((char *)a1 + v31 + 8);
  v34 = (uint64_t *)((char *)v29 + v31);
  v35 = v34[1];
  if (v33)
  {
    if (!v35)
      goto LABEL_8;
    if (*v32 != *v34 || v33 != v35)
    {
      v36 = sub_23C1FBF90();
      v26 = 0;
      if ((v36 & 1) == 0)
        return v26 & 1;
    }
  }
  else if (v35)
  {
    goto LABEL_8;
  }
  v37 = *(int *)(v30 + 28);
  v38 = (uint64_t *)((char *)a1 + v37);
  v39 = *(uint64_t *)((char *)a1 + v37 + 8);
  v40 = (uint64_t *)((char *)v50 + v37);
  v41 = v40[1];
  if (v39)
  {
    if (!v41)
      goto LABEL_8;
    if (*v38 != *v40 || v39 != v41)
    {
      v42 = sub_23C1FBF90();
      v26 = 0;
      if ((v42 & 1) == 0)
        return v26 & 1;
    }
  }
  else if (v41)
  {
    goto LABEL_8;
  }
  v43 = *(int *)(v30 + 32);
  v44 = (uint64_t *)((char *)a1 + v43);
  v45 = *(uint64_t *)((char *)a1 + v43 + 8);
  v46 = (uint64_t *)((char *)v50 + v43);
  v47 = v46[1];
  if (!v45)
  {
    if (!v47)
    {
LABEL_32:
      sub_23C1B9520();
      v26 = sub_23C1FB4F8();
      return v26 & 1;
    }
    goto LABEL_8;
  }
  if (!v47)
  {
LABEL_8:
    v26 = 0;
    return v26 & 1;
  }
  if (*v44 == *v46 && v45 == v47)
    goto LABEL_32;
  v48 = sub_23C1FBF90();
  v26 = 0;
  if ((v48 & 1) != 0)
    goto LABEL_32;
  return v26 & 1;
}

uint64_t sub_23C1BAB6C()
{
  return sub_23C1B56F4(&qword_256B40BD8, (uint64_t (*)(uint64_t))type metadata accessor for MarketingOffer, (uint64_t)&protocol conformance descriptor for MarketingOffer);
}

uint64_t *initializeBufferWithCopyOfBuffer for MarketingOffer(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v3;
  uint64_t v4;
  uint64_t *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;

  v3 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    v7 = a1;
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = type metadata accessor for MarketingArtwork();
    v12 = *(_QWORD *)(v11 - 8);
    v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40B58);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      v15 = sub_23C1FB4C8();
      v16 = *(_QWORD *)(v15 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v10, 1, v15))
      {
        v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40BE0);
        memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v9, v10, v15);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v9, 0, 1, v15);
      }
      v18 = *(int *)(v11 + 20);
      v19 = &v9[v18];
      v20 = &v10[v18];
      v21 = sub_23C1FB468();
      v22 = *(_QWORD *)(v21 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
      {
        v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41DA0);
        memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v19, v20, v21);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
      }
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    v24 = a3[6];
    v25 = a3[7];
    v26 = (uint64_t *)((char *)v7 + v24);
    v27 = (uint64_t *)((char *)a2 + v24);
    v28 = v27[1];
    *v26 = *v27;
    v26[1] = v28;
    v29 = (uint64_t *)((char *)v7 + v25);
    v30 = (uint64_t *)((char *)a2 + v25);
    v31 = v30[1];
    *v29 = *v30;
    v29[1] = v31;
    v32 = a3[8];
    v33 = a3[9];
    v34 = (uint64_t *)((char *)v7 + v32);
    v35 = (uint64_t *)((char *)a2 + v32);
    v36 = v35[1];
    *v34 = *v35;
    v34[1] = v36;
    v37 = (char *)v7 + v33;
    v38 = (char *)a2 + v33;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40B60);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v39 - 8) + 16))(v37, v38, v39);
  }
  return v7;
}

uint64_t destroy for MarketingOffer(uint64_t a1, uint64_t a2)
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

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = type metadata accessor for MarketingArtwork();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v4, 1, v5))
  {
    v6 = sub_23C1FB4C8();
    v7 = *(_QWORD *)(v6 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v4, 1, v6))
      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v4, v6);
    v8 = v4 + *(int *)(v5 + 20);
    v9 = sub_23C1FB468();
    v10 = *(_QWORD *)(v9 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v11 = a1 + *(int *)(a2 + 36);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40B60);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
}

_QWORD *initializeWithCopy for MarketingOffer(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int (*v11)(char *, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for MarketingArtwork();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  swift_bridgeObjectRetain();
  if (v11(v8, 1, v9))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40B58);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    v13 = sub_23C1FB4C8();
    v14 = *(_QWORD *)(v13 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v8, 1, v13))
    {
      v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40BE0);
      memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v7, v8, v13);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v7, 0, 1, v13);
    }
    v16 = *(int *)(v9 + 20);
    v17 = &v7[v16];
    v18 = &v8[v16];
    v19 = sub_23C1FB468();
    v20 = *(_QWORD *)(v19 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19))
    {
      v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41DA0);
      memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v17, v18, v19);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
    }
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  v22 = a3[6];
  v23 = a3[7];
  v24 = (_QWORD *)((char *)a1 + v22);
  v25 = (_QWORD *)((char *)a2 + v22);
  v26 = v25[1];
  *v24 = *v25;
  v24[1] = v26;
  v27 = (_QWORD *)((char *)a1 + v23);
  v28 = (_QWORD *)((char *)a2 + v23);
  v29 = v28[1];
  *v27 = *v28;
  v27[1] = v29;
  v30 = a3[8];
  v31 = a3[9];
  v32 = (_QWORD *)((char *)a1 + v30);
  v33 = (_QWORD *)((char *)a2 + v30);
  v34 = v33[1];
  *v32 = *v33;
  v32[1] = v34;
  v35 = (char *)a1 + v31;
  v36 = (char *)a2 + v31;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40B60);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v37 - 8) + 16))(v35, v36, v37);
  return a1;
}

_QWORD *assignWithCopy for MarketingOffer(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(char *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  size_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(char *, uint64_t, uint64_t);
  int v23;
  int v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  _QWORD *v35;
  _QWORD *v36;
  uint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t (*v51)(char *, uint64_t, uint64_t);
  int v52;
  int v53;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for MarketingArtwork();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (v13)
    {
      sub_23C1B5118((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for MarketingArtwork);
      goto LABEL_7;
    }
    v20 = sub_23C1FB4C8();
    v21 = *(_QWORD *)(v20 - 8);
    v22 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v21 + 48);
    v23 = v22(v7, 1, v20);
    v24 = v22(v8, 1, v20);
    if (v23)
    {
      if (!v24)
      {
        (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v7, v8, v20);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v7, 0, 1, v20);
LABEL_21:
        v46 = *(int *)(v9 + 20);
        v47 = &v7[v46];
        v48 = &v8[v46];
        v49 = sub_23C1FB468();
        v50 = *(_QWORD *)(v49 - 8);
        v51 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v50 + 48);
        v52 = v51(v47, 1, v49);
        v53 = v51(v48, 1, v49);
        if (v52)
        {
          if (!v53)
          {
            (*(void (**)(char *, char *, uint64_t))(v50 + 16))(v47, v48, v49);
            (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v50 + 56))(v47, 0, 1, v49);
            goto LABEL_17;
          }
        }
        else
        {
          if (!v53)
          {
            (*(void (**)(char *, char *, uint64_t))(v50 + 24))(v47, v48, v49);
            goto LABEL_17;
          }
          (*(void (**)(char *, uint64_t))(v50 + 8))(v47, v49);
        }
        v17 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256B41DA0) - 8) + 64);
        v18 = v47;
        v19 = v48;
        goto LABEL_8;
      }
    }
    else
    {
      if (!v24)
      {
        (*(void (**)(char *, char *, uint64_t))(v21 + 24))(v7, v8, v20);
        goto LABEL_21;
      }
      (*(void (**)(char *, uint64_t))(v21 + 8))(v7, v20);
    }
    v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40BE0);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v45 - 8) + 64));
    goto LABEL_21;
  }
  if (v13)
  {
LABEL_7:
    v17 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256B40B58) - 8) + 64);
    v18 = v7;
    v19 = v8;
LABEL_8:
    memcpy(v18, v19, v17);
    goto LABEL_17;
  }
  v14 = sub_23C1FB4C8();
  v15 = *(_QWORD *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v8, 1, v14))
  {
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40BE0);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v7, v8, v14);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v7, 0, 1, v14);
  }
  v25 = *(int *)(v9 + 20);
  v26 = &v7[v25];
  v27 = &v8[v25];
  v28 = sub_23C1FB468();
  v29 = *(_QWORD *)(v28 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v27, 1, v28))
  {
    v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41DA0);
    memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v26, v27, v28);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v28);
  }
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_17:
  v31 = a3[6];
  v32 = (_QWORD *)((char *)a1 + v31);
  v33 = (_QWORD *)((char *)a2 + v31);
  *v32 = *v33;
  v32[1] = v33[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v34 = a3[7];
  v35 = (_QWORD *)((char *)a1 + v34);
  v36 = (_QWORD *)((char *)a2 + v34);
  *v35 = *v36;
  v35[1] = v36[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v37 = a3[8];
  v38 = (_QWORD *)((char *)a1 + v37);
  v39 = (_QWORD *)((char *)a2 + v37);
  *v38 = *v39;
  v38[1] = v39[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v40 = a3[9];
  v41 = (char *)a1 + v40;
  v42 = (char *)a2 + v40;
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40B60);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v43 - 8) + 24))(v41, v42, v43);
  return a1;
}

_QWORD *initializeWithTake for MarketingOffer(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for MarketingArtwork();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40B58);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    v12 = sub_23C1FB4C8();
    v13 = *(_QWORD *)(v12 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v8, 1, v12))
    {
      v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40BE0);
      memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v7, v8, v12);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v7, 0, 1, v12);
    }
    v15 = *(int *)(v9 + 20);
    v16 = &v7[v15];
    v17 = &v8[v15];
    v18 = sub_23C1FB468();
    v19 = *(_QWORD *)(v18 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18))
    {
      v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41DA0);
      memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v16, v17, v18);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
    }
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  v21 = a3[7];
  *(_OWORD *)((char *)a1 + a3[6]) = *(_OWORD *)((char *)a2 + a3[6]);
  *(_OWORD *)((char *)a1 + v21) = *(_OWORD *)((char *)a2 + v21);
  v22 = a3[9];
  *(_OWORD *)((char *)a1 + a3[8]) = *(_OWORD *)((char *)a2 + a3[8]);
  v23 = (char *)a1 + v22;
  v24 = (char *)a2 + v22;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40B60);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v25 - 8) + 32))(v23, v24, v25);
  return a1;
}

_QWORD *assignWithTake for MarketingOffer(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(char *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  size_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(char *, uint64_t, uint64_t);
  int v23;
  int v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t (*v57)(char *, uint64_t, uint64_t);
  int v58;
  int v59;

  *a1 = *a2;
  swift_bridgeObjectRelease();
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for MarketingArtwork();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (v13)
    {
      sub_23C1B5118((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for MarketingArtwork);
      goto LABEL_7;
    }
    v20 = sub_23C1FB4C8();
    v21 = *(_QWORD *)(v20 - 8);
    v22 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v21 + 48);
    v23 = v22(v7, 1, v20);
    v24 = v22(v8, 1, v20);
    if (v23)
    {
      if (!v24)
      {
        (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v7, v8, v20);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v7, 0, 1, v20);
LABEL_21:
        v52 = *(int *)(v9 + 20);
        v53 = &v7[v52];
        v54 = &v8[v52];
        v55 = sub_23C1FB468();
        v56 = *(_QWORD *)(v55 - 8);
        v57 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v56 + 48);
        v58 = v57(v53, 1, v55);
        v59 = v57(v54, 1, v55);
        if (v58)
        {
          if (!v59)
          {
            (*(void (**)(char *, char *, uint64_t))(v56 + 32))(v53, v54, v55);
            (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v56 + 56))(v53, 0, 1, v55);
            goto LABEL_17;
          }
        }
        else
        {
          if (!v59)
          {
            (*(void (**)(char *, char *, uint64_t))(v56 + 40))(v53, v54, v55);
            goto LABEL_17;
          }
          (*(void (**)(char *, uint64_t))(v56 + 8))(v53, v55);
        }
        v17 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256B41DA0) - 8) + 64);
        v18 = v53;
        v19 = v54;
        goto LABEL_8;
      }
    }
    else
    {
      if (!v24)
      {
        (*(void (**)(char *, char *, uint64_t))(v21 + 40))(v7, v8, v20);
        goto LABEL_21;
      }
      (*(void (**)(char *, uint64_t))(v21 + 8))(v7, v20);
    }
    v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40BE0);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v51 - 8) + 64));
    goto LABEL_21;
  }
  if (v13)
  {
LABEL_7:
    v17 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256B40B58) - 8) + 64);
    v18 = v7;
    v19 = v8;
LABEL_8:
    memcpy(v18, v19, v17);
    goto LABEL_17;
  }
  v14 = sub_23C1FB4C8();
  v15 = *(_QWORD *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v8, 1, v14))
  {
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40BE0);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v7, v8, v14);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v7, 0, 1, v14);
  }
  v25 = *(int *)(v9 + 20);
  v26 = &v7[v25];
  v27 = &v8[v25];
  v28 = sub_23C1FB468();
  v29 = *(_QWORD *)(v28 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v27, 1, v28))
  {
    v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41DA0);
    memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v26, v27, v28);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v28);
  }
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_17:
  v31 = a3[6];
  v32 = (_QWORD *)((char *)a1 + v31);
  v33 = (_QWORD *)((char *)a2 + v31);
  v35 = *v33;
  v34 = v33[1];
  *v32 = v35;
  v32[1] = v34;
  swift_bridgeObjectRelease();
  v36 = a3[7];
  v37 = (_QWORD *)((char *)a1 + v36);
  v38 = (_QWORD *)((char *)a2 + v36);
  v40 = *v38;
  v39 = v38[1];
  *v37 = v40;
  v37[1] = v39;
  swift_bridgeObjectRelease();
  v41 = a3[8];
  v42 = (_QWORD *)((char *)a1 + v41);
  v43 = (_QWORD *)((char *)a2 + v41);
  v45 = *v43;
  v44 = v43[1];
  *v42 = v45;
  v42[1] = v44;
  swift_bridgeObjectRelease();
  v46 = a3[9];
  v47 = (char *)a1 + v46;
  v48 = (char *)a2 + v46;
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40B60);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v49 - 8) + 40))(v47, v48, v49);
  return a1;
}

uint64_t getEnumTagSinglePayload for MarketingOffer()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C1BBBA0(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40B58);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = *(int *)(a3 + 20);
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40B60);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a3 + 36);
    }
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(&a1[v11], a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for MarketingOffer()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_23C1BBC54(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40B58);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = *(int *)(a4 + 20);
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40B60);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a4 + 36);
    }
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(&v5[v11], a2, a2, v10);
  }
  return result;
}

void sub_23C1BBCF8()
{
  unint64_t v0;
  unint64_t v1;

  sub_23C1BBDC8(319, &qword_256B40C50, (uint64_t (*)(uint64_t))type metadata accessor for MarketingArtwork, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  if (v0 <= 0x3F)
  {
    sub_23C1BBDC8(319, qword_256B40C58, (uint64_t (*)(uint64_t))sub_23C1B9520, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BE37A10]);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_23C1BBDC8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if (!*a2)
  {
    v7 = a3(255);
    v8 = a4(a1, v7);
    if (!v9)
      atomic_store(v8, a2);
  }
}

uint64_t getEnumTagSinglePayload for MarketingOffer.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFB)
    goto LABEL_17;
  if (a2 + 5 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 5) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 5;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 5;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 5;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v8 = v6 - 6;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for MarketingOffer.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_23C1BBEFC + 4 * byte_23C1FD45B[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_23C1BBF30 + 4 * byte_23C1FD456[v4]))();
}

uint64_t sub_23C1BBF30(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1BBF38(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C1BBF40);
  return result;
}

uint64_t sub_23C1BBF4C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C1BBF54);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_23C1BBF58(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1BBF60(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MarketingOffer.CodingKeys()
{
  return &type metadata for MarketingOffer.CodingKeys;
}

unint64_t sub_23C1BBF80()
{
  unint64_t result;

  result = qword_256B40C98;
  if (!qword_256B40C98)
  {
    result = MEMORY[0x242619B10](&unk_23C1FD614, &type metadata for MarketingOffer.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40C98);
  }
  return result;
}

unint64_t sub_23C1BBFC8()
{
  unint64_t result;

  result = qword_256B40CA0;
  if (!qword_256B40CA0)
  {
    result = MEMORY[0x242619B10](&unk_23C1FD584, &type metadata for MarketingOffer.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40CA0);
  }
  return result;
}

unint64_t sub_23C1BC010()
{
  unint64_t result;

  result = qword_256B40CA8;
  if (!qword_256B40CA8)
  {
    result = MEMORY[0x242619B10](&unk_23C1FD5AC, &type metadata for MarketingOffer.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40CA8);
  }
  return result;
}

uint64_t sub_23C1BC054(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x74496E6F69746361 && a2 == 0xEB00000000736D65;
  if (v2 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6B726F77747261 && a2 == 0xE700000000000000 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x696669746E656469 && a2 == 0xEA00000000007265 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x656C746974627573 && a2 == 0xE800000000000000 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x656C746974 && a2 == 0xE500000000000000 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x800000023C203830)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    v6 = sub_23C1FBF90();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 5;
    else
      return 6;
  }
}

uint64_t sub_23C1BC2EC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23C1BC328(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x242619B10](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

BOOL static MarketingPlatform.== infix(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_23C1BC378()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23C1BC3A4 + 4 * byte_23C1FD690[*v0]))(0x656E6F6870, 0xE500000000000000);
}

uint64_t sub_23C1BC3A4()
{
  return 0x74656C626174;
}

uint64_t sub_23C1BC3B8()
{
  return 0x6863746177;
}

uint64_t sub_23C1BC3C8()
{
  return 30324;
}

uint64_t sub_23C1BC3D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C1BCAC8(a1, a2);
  *a3 = result;
  return result;
}

void sub_23C1BC3F8(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_23C1BC404()
{
  sub_23C1BC8B8();
  return sub_23C1FC020();
}

uint64_t sub_23C1BC42C()
{
  sub_23C1BC8B8();
  return sub_23C1FC02C();
}

uint64_t sub_23C1BC454()
{
  return 0;
}

uint64_t sub_23C1BC460()
{
  sub_23C1BC9C8();
  return sub_23C1FC020();
}

uint64_t sub_23C1BC488()
{
  sub_23C1BC9C8();
  return sub_23C1FC02C();
}

uint64_t sub_23C1BC4B0()
{
  sub_23C1BC984();
  return sub_23C1FC020();
}

uint64_t sub_23C1BC4D8()
{
  sub_23C1BC984();
  return sub_23C1FC02C();
}

uint64_t sub_23C1BC500@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_23C1BC52C()
{
  sub_23C1BC8FC();
  return sub_23C1FC020();
}

uint64_t sub_23C1BC554()
{
  sub_23C1BC8FC();
  return sub_23C1FC02C();
}

uint64_t sub_23C1BC57C()
{
  sub_23C1BC940();
  return sub_23C1FC020();
}

uint64_t sub_23C1BC5A4()
{
  sub_23C1BC940();
  return sub_23C1FC02C();
}

void MarketingPlatform.encode(to:)(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[10];
  uint64_t v11;

  v11 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40CC8);
  v10[7] = *(_QWORD *)(v3 - 8);
  v10[8] = v3;
  MEMORY[0x24BDAC7A8](v3);
  v10[6] = (char *)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40CD0);
  v10[4] = *(_QWORD *)(v5 - 8);
  v10[5] = v5;
  MEMORY[0x24BDAC7A8](v5);
  v10[3] = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40CD8);
  v10[1] = *(_QWORD *)(v7 - 8);
  v10[2] = v7;
  MEMORY[0x24BDAC7A8](v7);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40CE0);
  MEMORY[0x24BDAC7A8](v8);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40CE8);
  v10[9] = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C1BC8B8();
  sub_23C1FC014();
  __asm { BR              X10 }
}

uint64_t sub_23C1BC784()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v5 - 68) = 0;
  sub_23C1BC9C8();
  sub_23C1FBF30();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 104) + 8))(v1, v0);
}

unint64_t sub_23C1BC8B8()
{
  unint64_t result;

  result = qword_256B40CF0;
  if (!qword_256B40CF0)
  {
    result = MEMORY[0x242619B10](&unk_23C1FDB08, &type metadata for MarketingPlatform.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40CF0);
  }
  return result;
}

unint64_t sub_23C1BC8FC()
{
  unint64_t result;

  result = qword_256B40CF8;
  if (!qword_256B40CF8)
  {
    result = MEMORY[0x242619B10](&unk_23C1FDAB8, &type metadata for MarketingPlatform.TvCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40CF8);
  }
  return result;
}

unint64_t sub_23C1BC940()
{
  unint64_t result;

  result = qword_256B40D00;
  if (!qword_256B40D00)
  {
    result = MEMORY[0x242619B10](&unk_23C1FDA68, &type metadata for MarketingPlatform.WatchCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40D00);
  }
  return result;
}

unint64_t sub_23C1BC984()
{
  unint64_t result;

  result = qword_256B40D08;
  if (!qword_256B40D08)
  {
    result = MEMORY[0x242619B10](&unk_23C1FDA18, &type metadata for MarketingPlatform.TabletCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40D08);
  }
  return result;
}

unint64_t sub_23C1BC9C8()
{
  unint64_t result;

  result = qword_256B40D10;
  if (!qword_256B40D10)
  {
    result = MEMORY[0x242619B10](&unk_23C1FD9C8, &type metadata for MarketingPlatform.PhoneCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40D10);
  }
  return result;
}

uint64_t MarketingPlatform.init(from:)(_QWORD *a1)
{
  return sub_23C1BCC50(a1);
}

uint64_t sub_23C1BCA20@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = sub_23C1BCC50(a1);
  if (!v2)
    *a2 = result;
  return result;
}

void sub_23C1BCA48(_QWORD *a1)
{
  unsigned __int8 *v1;

  MarketingPlatform.encode(to:)(a1, *v1);
}

uint64_t MarketingPlatform.hash(into:)()
{
  return sub_23C1FBFD8();
}

uint64_t MarketingPlatform.hashValue.getter()
{
  sub_23C1FBFCC();
  sub_23C1FBFD8();
  return sub_23C1FBFFC();
}

uint64_t sub_23C1BCAC8(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x656E6F6870 && a2 == 0xE500000000000000;
  if (v2 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x74656C626174 && a2 == 0xE600000000000000 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6863746177 && a2 == 0xE500000000000000 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 30324 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_23C1FBF90();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_23C1BCC50(_QWORD *a1)
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD v23[12];
  _QWORD *v24;
  uint64_t v25;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40D78);
  v23[10] = *(_QWORD *)(v2 - 8);
  v23[11] = v2;
  MEMORY[0x24BDAC7A8](v2);
  v23[9] = (char *)v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40D80);
  v23[5] = *(_QWORD *)(v4 - 8);
  v23[6] = v4;
  MEMORY[0x24BDAC7A8](v4);
  v23[8] = (char *)v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40D88);
  v23[3] = *(_QWORD *)(v6 - 8);
  v23[4] = v6;
  MEMORY[0x24BDAC7A8](v6);
  v23[7] = (char *)v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40D90);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40D98);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = a1[3];
  v24 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v16);
  sub_23C1BC8B8();
  v17 = v25;
  sub_23C1FC008();
  if (!v17)
  {
    v23[1] = v8;
    v23[2] = v11;
    v23[0] = v9;
    v25 = v13;
    v18 = sub_23C1FBF24();
    if (*(_QWORD *)(v18 + 16) == 1)
      __asm { BR              X9 }
    v19 = sub_23C1FBE58();
    swift_allocError();
    v21 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B40A48);
    *v21 = &type metadata for MarketingPlatform;
    sub_23C1FBED0();
    sub_23C1FBE4C();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v19 - 8) + 104))(v21, *MEMORY[0x24BEE26D0], v19);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v15, v12);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
  return v12;
}

void sub_23C1BCF74()
{
  uint64_t v0;
  uint64_t v1;

  *(_BYTE *)(v1 - 67) = 1;
  sub_23C1BC984();
  sub_23C1FBEC4();
  if (!v0)
    JUMPOUT(0x23C1BD048);
  JUMPOUT(0x23C1BCF28);
}

void sub_23C1BCFB8()
{
  uint64_t v0;
  uint64_t v1;

  *(_BYTE *)(v1 - 66) = 2;
  sub_23C1BC940();
  sub_23C1FBEC4();
  if (!v0)
    JUMPOUT(0x23C1BCFF8);
  JUMPOUT(0x23C1BCF28);
}

void sub_23C1BD004()
{
  uint64_t v0;
  uint64_t v1;

  *(_BYTE *)(v1 - 65) = 3;
  sub_23C1BC8FC();
  sub_23C1FBEC4();
  if (!v0)
    JUMPOUT(0x23C1BD048);
  JUMPOUT(0x23C1BCF28);
}

unint64_t sub_23C1BD078()
{
  unint64_t result;

  result = qword_256B40D18;
  if (!qword_256B40D18)
  {
    result = MEMORY[0x242619B10](&protocol conformance descriptor for MarketingPlatform, &type metadata for MarketingPlatform);
    atomic_store(result, (unint64_t *)&qword_256B40D18);
  }
  return result;
}

ValueMetadata *type metadata accessor for MarketingPlatform()
{
  return &type metadata for MarketingPlatform;
}

uint64_t getEnumTagSinglePayload for MarketingPlainButtonStyle(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s16FitnessMarketing17MarketingPlatformOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C1BD1B0 + 4 * byte_23C1FD6A1[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23C1BD1E4 + 4 * byte_23C1FD69C[v4]))();
}

uint64_t sub_23C1BD1E4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1BD1EC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C1BD1F4);
  return result;
}

uint64_t sub_23C1BD200(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C1BD208);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23C1BD20C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1BD214(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MarketingPlatform.CodingKeys()
{
  return &type metadata for MarketingPlatform.CodingKeys;
}

ValueMetadata *type metadata accessor for MarketingPlatform.PhoneCodingKeys()
{
  return &type metadata for MarketingPlatform.PhoneCodingKeys;
}

ValueMetadata *type metadata accessor for MarketingPlatform.TabletCodingKeys()
{
  return &type metadata for MarketingPlatform.TabletCodingKeys;
}

ValueMetadata *type metadata accessor for MarketingPlatform.WatchCodingKeys()
{
  return &type metadata for MarketingPlatform.WatchCodingKeys;
}

ValueMetadata *type metadata accessor for MarketingPlatform.TvCodingKeys()
{
  return &type metadata for MarketingPlatform.TvCodingKeys;
}

unint64_t sub_23C1BD274()
{
  unint64_t result;

  result = qword_256B40D20;
  if (!qword_256B40D20)
  {
    result = MEMORY[0x242619B10](&unk_23C1FD9A0, &type metadata for MarketingPlatform.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40D20);
  }
  return result;
}

unint64_t sub_23C1BD2BC()
{
  unint64_t result;

  result = qword_256B40D28;
  if (!qword_256B40D28)
  {
    result = MEMORY[0x242619B10](&unk_23C1FD8C0, &type metadata for MarketingPlatform.PhoneCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40D28);
  }
  return result;
}

unint64_t sub_23C1BD304()
{
  unint64_t result;

  result = qword_256B40D30;
  if (!qword_256B40D30)
  {
    result = MEMORY[0x242619B10](&unk_23C1FD8E8, &type metadata for MarketingPlatform.PhoneCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40D30);
  }
  return result;
}

unint64_t sub_23C1BD34C()
{
  unint64_t result;

  result = qword_256B40D38;
  if (!qword_256B40D38)
  {
    result = MEMORY[0x242619B10](&unk_23C1FD870, &type metadata for MarketingPlatform.TabletCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40D38);
  }
  return result;
}

unint64_t sub_23C1BD394()
{
  unint64_t result;

  result = qword_256B40D40;
  if (!qword_256B40D40)
  {
    result = MEMORY[0x242619B10](&unk_23C1FD898, &type metadata for MarketingPlatform.TabletCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40D40);
  }
  return result;
}

unint64_t sub_23C1BD3DC()
{
  unint64_t result;

  result = qword_256B40D48;
  if (!qword_256B40D48)
  {
    result = MEMORY[0x242619B10](&unk_23C1FD820, &type metadata for MarketingPlatform.WatchCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40D48);
  }
  return result;
}

unint64_t sub_23C1BD424()
{
  unint64_t result;

  result = qword_256B40D50;
  if (!qword_256B40D50)
  {
    result = MEMORY[0x242619B10](&unk_23C1FD848, &type metadata for MarketingPlatform.WatchCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40D50);
  }
  return result;
}

unint64_t sub_23C1BD46C()
{
  unint64_t result;

  result = qword_256B40D58;
  if (!qword_256B40D58)
  {
    result = MEMORY[0x242619B10](&unk_23C1FD7D0, &type metadata for MarketingPlatform.TvCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40D58);
  }
  return result;
}

unint64_t sub_23C1BD4B4()
{
  unint64_t result;

  result = qword_256B40D60;
  if (!qword_256B40D60)
  {
    result = MEMORY[0x242619B10](&unk_23C1FD7F8, &type metadata for MarketingPlatform.TvCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40D60);
  }
  return result;
}

unint64_t sub_23C1BD4FC()
{
  unint64_t result;

  result = qword_256B40D68;
  if (!qword_256B40D68)
  {
    result = MEMORY[0x242619B10](&unk_23C1FD910, &type metadata for MarketingPlatform.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40D68);
  }
  return result;
}

unint64_t sub_23C1BD544()
{
  unint64_t result;

  result = qword_256B40D70;
  if (!qword_256B40D70)
  {
    result = MEMORY[0x242619B10](&unk_23C1FD938, &type metadata for MarketingPlatform.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40D70);
  }
  return result;
}

__n128 MarketingButtonEnvironment.init(presentMarketingLink:performPurchase:requestRemoteBrowsingConnection:resolveAppleAccountState:resolveMarketingOffer:resolveSupportedDeviceState:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, unint64_t a4@<X3>, unint64_t a5@<X4>, unint64_t a6@<X5>, unint64_t a7@<X6>, unint64_t a8@<X7>, __n128 *a9@<X8>, __n128 a10, unint64_t a11, unint64_t a12)
{
  uint64_t v20;
  __n128 result;

  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = a1;
  *(_QWORD *)(v20 + 24) = a2;
  a9->n128_u64[0] = (unint64_t)&unk_256B40DA8;
  a9->n128_u64[1] = v20;
  a9[1].n128_u64[0] = a3;
  a9[1].n128_u64[1] = a4;
  a9[2].n128_u64[0] = a5;
  a9[2].n128_u64[1] = a6;
  a9[3].n128_u64[0] = a7;
  a9[3].n128_u64[1] = a8;
  result = a10;
  a9[4] = a10;
  a9[5].n128_u64[0] = a11;
  a9[5].n128_u64[1] = a12;
  return result;
}

uint64_t sub_23C1BD644(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  _QWORD *v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t);

  __swift_instantiateConcreteTypeFromMangledName(&qword_256B40DB0);
  v9 = swift_task_alloc();
  v4[2] = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B40DB8);
  v10 = swift_task_alloc();
  v4[3] = v10;
  sub_23C1B50D4(a2, v10, (uint64_t (*)(_QWORD))type metadata accessor for MarketingOffer);
  v11 = type metadata accessor for MarketingOffer();
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 0, 1, v11);
  sub_23C1B50D4(a3, v9, (uint64_t (*)(_QWORD))type metadata accessor for MarketingActionItem);
  v12 = type metadata accessor for MarketingActionItem();
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 0, 1, v12);
  v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)a4 + *a4);
  v13 = (_QWORD *)swift_task_alloc();
  v4[4] = v13;
  *v13 = v4;
  v13[1] = sub_23C1BD78C;
  return v15(a1, v10, v9);
}

uint64_t sub_23C1BD78C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v1 = *(_QWORD *)(*v0 + 24);
  v2 = *(_QWORD *)(*v0 + 16);
  v4 = *v0;
  swift_task_dealloc();
  sub_23C1BC2EC(v2, &qword_256B40DB0);
  sub_23C1BC2EC(v1, &qword_256B40DB8);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v4 + 8))();
}

uint64_t sub_23C1BD810()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23C1BD834(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int *v8;
  _QWORD *v9;

  v8 = *(int **)(v3 + 16);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_23C1BD8B8;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_256B40DA0 + dword_256B40DA0))(a1, a2, a3, v8);
}

uint64_t sub_23C1BD8B8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t initializeBufferWithCopyOfBuffer for MarketingButtonEnvironment(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for MarketingButtonEnvironment()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for MarketingButtonEnvironment(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  v3 = *(_QWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 88) = v3;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for MarketingButtonEnvironment(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

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
  return a1;
}

__n128 __swift_memcpy96_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __n128 result;
  __int128 v4;
  __int128 v5;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  result = *(__n128 *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

_OWORD *assignWithTake for MarketingButtonEnvironment(_OWORD *a1, _OWORD *a2)
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
  return a1;
}

uint64_t getEnumTagSinglePayload for MarketingButtonEnvironment(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 96))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MarketingButtonEnvironment(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 96) = 1;
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
    *(_BYTE *)(result + 96) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for MarketingButtonEnvironment()
{
  return &type metadata for MarketingButtonEnvironment;
}

BOOL static MarketingInlineLayoutStyle.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_23C1BDC4C()
{
  _BYTE *v0;

  if (*v0)
    return 0x7469617274726F70;
  else
    return 0x70616373646E616CLL;
}

uint64_t sub_23C1BDC8C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C1BE76C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C1BDCB0()
{
  sub_23C1BDF74();
  return sub_23C1FC020();
}

uint64_t sub_23C1BDCD8()
{
  sub_23C1BDF74();
  return sub_23C1FC02C();
}

uint64_t sub_23C1BDD00()
{
  sub_23C1BDFFC();
  return sub_23C1FC020();
}

uint64_t sub_23C1BDD28()
{
  sub_23C1BDFFC();
  return sub_23C1FC02C();
}

uint64_t sub_23C1BDD50()
{
  sub_23C1BDFB8();
  return sub_23C1FC020();
}

uint64_t sub_23C1BDD78()
{
  sub_23C1BDFB8();
  return sub_23C1FC02C();
}

uint64_t MarketingInlineLayoutStyle.encode(to:)(_QWORD *a1)
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

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40DC0);
  v16 = *(_QWORD *)(v3 - 8);
  v17 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40DC8);
  v14 = *(_QWORD *)(v6 - 8);
  v15 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40DD0);
  v18 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C1BDF74();
  sub_23C1FC014();
  if ((v12 & 1) != 0)
  {
    v20 = 1;
    sub_23C1BDFB8();
    sub_23C1FBF30();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v17);
  }
  else
  {
    v19 = 0;
    sub_23C1BDFFC();
    sub_23C1FBF30();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v15);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v11, v9);
}

unint64_t sub_23C1BDF74()
{
  unint64_t result;

  result = qword_256B40DD8;
  if (!qword_256B40DD8)
  {
    result = MEMORY[0x242619B10](&unk_23C1FDEAC, &type metadata for MarketingInlineLayoutStyle.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40DD8);
  }
  return result;
}

unint64_t sub_23C1BDFB8()
{
  unint64_t result;

  result = qword_256B40DE0;
  if (!qword_256B40DE0)
  {
    result = MEMORY[0x242619B10](&unk_23C1FDE5C, &type metadata for MarketingInlineLayoutStyle.PortraitCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40DE0);
  }
  return result;
}

unint64_t sub_23C1BDFFC()
{
  unint64_t result;

  result = qword_256B40DE8;
  if (!qword_256B40DE8)
  {
    result = MEMORY[0x242619B10](&unk_23C1FDE0C, &type metadata for MarketingInlineLayoutStyle.LandscapeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40DE8);
  }
  return result;
}

uint64_t MarketingInlineLayoutStyle.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
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
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40DF0);
  v32 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v31 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40DF8);
  v4 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40E00);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C1BDF74();
  v11 = v33;
  sub_23C1FC008();
  if (v11)
    goto LABEL_7;
  v26 = v4;
  v27 = a1;
  v12 = v31;
  v13 = v32;
  v33 = v8;
  v14 = sub_23C1FBF24();
  v15 = v7;
  if (*(_QWORD *)(v14 + 16) != 1)
  {
    v19 = sub_23C1FBE58();
    swift_allocError();
    v21 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B40A48);
    *v21 = &type metadata for MarketingInlineLayoutStyle;
    sub_23C1FBED0();
    sub_23C1FBE4C();
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
    sub_23C1BDFB8();
    sub_23C1FBEC4();
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
    sub_23C1BDFFC();
    v22 = v6;
    sub_23C1FBEC4();
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

uint64_t sub_23C1BE398@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return MarketingInlineLayoutStyle.init(from:)(a1, a2);
}

uint64_t sub_23C1BE3AC(_QWORD *a1)
{
  return MarketingInlineLayoutStyle.encode(to:)(a1);
}

uint64_t MarketingInlineLayoutStyle.hash(into:)()
{
  return sub_23C1FBFD8();
}

uint64_t MarketingInlineLayoutStyle.hashValue.getter()
{
  sub_23C1FBFCC();
  sub_23C1FBFD8();
  return sub_23C1FBFFC();
}

unint64_t sub_23C1BE430()
{
  unint64_t result;

  result = qword_256B40E08;
  if (!qword_256B40E08)
  {
    result = MEMORY[0x242619B10](&protocol conformance descriptor for MarketingInlineLayoutStyle, &type metadata for MarketingInlineLayoutStyle);
    atomic_store(result, (unint64_t *)&qword_256B40E08);
  }
  return result;
}

ValueMetadata *type metadata accessor for MarketingInlineLayoutStyle()
{
  return &type metadata for MarketingInlineLayoutStyle;
}

uint64_t _s16FitnessMarketing26MarketingInlineLayoutStyleOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C1BE4D4 + 4 * byte_23C1FDB85[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C1BE508 + 4 * asc_23C1FDB80[v4]))();
}

uint64_t sub_23C1BE508(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1BE510(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C1BE518);
  return result;
}

uint64_t sub_23C1BE524(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C1BE52CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C1BE530(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1BE538(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MarketingInlineLayoutStyle.CodingKeys()
{
  return &type metadata for MarketingInlineLayoutStyle.CodingKeys;
}

ValueMetadata *type metadata accessor for MarketingInlineLayoutStyle.LandscapeCodingKeys()
{
  return &type metadata for MarketingInlineLayoutStyle.LandscapeCodingKeys;
}

ValueMetadata *type metadata accessor for MarketingInlineLayoutStyle.PortraitCodingKeys()
{
  return &type metadata for MarketingInlineLayoutStyle.PortraitCodingKeys;
}

unint64_t sub_23C1BE578()
{
  unint64_t result;

  result = qword_256B40E10;
  if (!qword_256B40E10)
  {
    result = MEMORY[0x242619B10](&unk_23C1FDDE4, &type metadata for MarketingInlineLayoutStyle.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40E10);
  }
  return result;
}

unint64_t sub_23C1BE5C0()
{
  unint64_t result;

  result = qword_256B40E18;
  if (!qword_256B40E18)
  {
    result = MEMORY[0x242619B10](&unk_23C1FDD04, &type metadata for MarketingInlineLayoutStyle.LandscapeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40E18);
  }
  return result;
}

unint64_t sub_23C1BE608()
{
  unint64_t result;

  result = qword_256B40E20;
  if (!qword_256B40E20)
  {
    result = MEMORY[0x242619B10](&unk_23C1FDD2C, &type metadata for MarketingInlineLayoutStyle.LandscapeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40E20);
  }
  return result;
}

unint64_t sub_23C1BE650()
{
  unint64_t result;

  result = qword_256B40E28;
  if (!qword_256B40E28)
  {
    result = MEMORY[0x242619B10](&unk_23C1FDCB4, &type metadata for MarketingInlineLayoutStyle.PortraitCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40E28);
  }
  return result;
}

unint64_t sub_23C1BE698()
{
  unint64_t result;

  result = qword_256B40E30;
  if (!qword_256B40E30)
  {
    result = MEMORY[0x242619B10](&unk_23C1FDCDC, &type metadata for MarketingInlineLayoutStyle.PortraitCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40E30);
  }
  return result;
}

unint64_t sub_23C1BE6E0()
{
  unint64_t result;

  result = qword_256B40E38;
  if (!qword_256B40E38)
  {
    result = MEMORY[0x242619B10](&unk_23C1FDD54, &type metadata for MarketingInlineLayoutStyle.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40E38);
  }
  return result;
}

unint64_t sub_23C1BE728()
{
  unint64_t result;

  result = qword_256B40E40;
  if (!qword_256B40E40)
  {
    result = MEMORY[0x242619B10](&unk_23C1FDD7C, &type metadata for MarketingInlineLayoutStyle.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40E40);
  }
  return result;
}

uint64_t sub_23C1BE76C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x70616373646E616CLL && a2 == 0xE900000000000065;
  if (v2 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7469617274726F70 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23C1FBF90();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

BOOL static MarketingInlineAction.== infix(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t MarketingInlineAction.hash(into:)()
{
  return sub_23C1FBFD8();
}

uint64_t sub_23C1BE89C()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000011;
  else
    return 0x6570704177656976;
}

uint64_t sub_23C1BE8E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C1BED34(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C1BE908()
{
  sub_23C1BEC0C();
  return sub_23C1FC020();
}

uint64_t sub_23C1BE930()
{
  sub_23C1BEC0C();
  return sub_23C1FC02C();
}

uint64_t sub_23C1BE958()
{
  sub_23C1BEC50();
  return sub_23C1FC020();
}

uint64_t sub_23C1BE980()
{
  sub_23C1BEC50();
  return sub_23C1FC02C();
}

uint64_t sub_23C1BE9A8()
{
  sub_23C1BEC94();
  return sub_23C1FC020();
}

uint64_t sub_23C1BE9D0()
{
  sub_23C1BEC94();
  return sub_23C1FC02C();
}

uint64_t MarketingInlineAction.hashValue.getter()
{
  sub_23C1FBFCC();
  sub_23C1FBFD8();
  return sub_23C1FBFFC();
}

uint64_t MarketingInlineAction.encode(to:)(_QWORD *a1, int a2)
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
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40E48);
  v15 = *(_QWORD *)(v3 - 8);
  v16 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40E50);
  v6 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40E58);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C1BEC0C();
  sub_23C1FC014();
  if ((v17 & 1) != 0)
  {
    v19 = 1;
    sub_23C1BEC50();
    sub_23C1FBF30();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v5, v16);
  }
  else
  {
    v18 = 0;
    sub_23C1BEC94();
    sub_23C1FBF30();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v14);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

unint64_t sub_23C1BEC0C()
{
  unint64_t result;

  result = qword_256B40E60;
  if (!qword_256B40E60)
  {
    result = MEMORY[0x242619B10](&unk_23C1FE234, &type metadata for MarketingInlineAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40E60);
  }
  return result;
}

unint64_t sub_23C1BEC50()
{
  unint64_t result;

  result = qword_256B40E68;
  if (!qword_256B40E68)
  {
    result = MEMORY[0x242619B10](&unk_23C1FE1E4, &type metadata for MarketingInlineAction.RetryButtonTappedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40E68);
  }
  return result;
}

unint64_t sub_23C1BEC94()
{
  unint64_t result;

  result = qword_256B40E70;
  if (!qword_256B40E70)
  {
    result = MEMORY[0x242619B10](&unk_23C1FE194, &type metadata for MarketingInlineAction.ViewAppearedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40E70);
  }
  return result;
}

uint64_t MarketingInlineAction.init(from:)(_QWORD *a1)
{
  return sub_23C1BEE38(a1) & 1;
}

uint64_t sub_23C1BECF0@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = sub_23C1BEE38(a1);
  if (!v2)
    *a2 = result & 1;
  return result;
}

uint64_t sub_23C1BED1C(_QWORD *a1)
{
  unsigned __int8 *v1;

  return MarketingInlineAction.encode(to:)(a1, *v1);
}

uint64_t sub_23C1BED34(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6570704177656976 && a2 == 0xEC00000064657261;
  if (v2 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000023C203850)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23C1FBF90();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23C1BEE38(_QWORD *a1)
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

  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40EB8);
  v22 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v25 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40EC0);
  v3 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40EC8);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C1BEC0C();
  v10 = v26;
  sub_23C1FC008();
  if (v10)
    goto LABEL_7;
  v11 = v5;
  v12 = v25;
  v21 = a1;
  v26 = v7;
  v13 = sub_23C1FBF24();
  v14 = v6;
  if (*(_QWORD *)(v13 + 16) != 1)
  {
    v16 = sub_23C1FBE58();
    swift_allocError();
    v17 = v9;
    v19 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B40A48);
    *v19 = &type metadata for MarketingInlineAction;
    sub_23C1FBED0();
    sub_23C1FBE4C();
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
    sub_23C1BEC50();
    sub_23C1FBEC4();
    v15 = v26;
    (*(void (**)(char *, uint64_t))(v22 + 8))(v12, v24);
  }
  else
  {
    v27 = 0;
    sub_23C1BEC94();
    sub_23C1FBEC4();
    v15 = v26;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v11, v23);
  }
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v9, v14);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
  return v6;
}

unint64_t sub_23C1BF168()
{
  unint64_t result;

  result = qword_256B40E78;
  if (!qword_256B40E78)
  {
    result = MEMORY[0x242619B10](&protocol conformance descriptor for MarketingInlineAction, &type metadata for MarketingInlineAction);
    atomic_store(result, (unint64_t *)&qword_256B40E78);
  }
  return result;
}

ValueMetadata *type metadata accessor for MarketingInlineAction()
{
  return &type metadata for MarketingInlineAction;
}

uint64_t _s16FitnessMarketing21MarketingInlineActionOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C1BF20C + 4 * byte_23C1FDF05[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C1BF240 + 4 * byte_23C1FDF00[v4]))();
}

uint64_t sub_23C1BF240(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1BF248(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C1BF250);
  return result;
}

uint64_t sub_23C1BF25C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C1BF264);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C1BF268(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1BF270(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MarketingInlineAction.CodingKeys()
{
  return &type metadata for MarketingInlineAction.CodingKeys;
}

ValueMetadata *type metadata accessor for MarketingInlineAction.ViewAppearedCodingKeys()
{
  return &type metadata for MarketingInlineAction.ViewAppearedCodingKeys;
}

ValueMetadata *type metadata accessor for MarketingInlineAction.RetryButtonTappedCodingKeys()
{
  return &type metadata for MarketingInlineAction.RetryButtonTappedCodingKeys;
}

unint64_t sub_23C1BF2B0()
{
  unint64_t result;

  result = qword_256B40E80;
  if (!qword_256B40E80)
  {
    result = MEMORY[0x242619B10](&unk_23C1FE16C, &type metadata for MarketingInlineAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40E80);
  }
  return result;
}

unint64_t sub_23C1BF2F8()
{
  unint64_t result;

  result = qword_256B40E88;
  if (!qword_256B40E88)
  {
    result = MEMORY[0x242619B10](&unk_23C1FE08C, &type metadata for MarketingInlineAction.ViewAppearedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40E88);
  }
  return result;
}

unint64_t sub_23C1BF340()
{
  unint64_t result;

  result = qword_256B40E90;
  if (!qword_256B40E90)
  {
    result = MEMORY[0x242619B10](&unk_23C1FE0B4, &type metadata for MarketingInlineAction.ViewAppearedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40E90);
  }
  return result;
}

unint64_t sub_23C1BF388()
{
  unint64_t result;

  result = qword_256B40E98;
  if (!qword_256B40E98)
  {
    result = MEMORY[0x242619B10](&unk_23C1FE03C, &type metadata for MarketingInlineAction.RetryButtonTappedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40E98);
  }
  return result;
}

unint64_t sub_23C1BF3D0()
{
  unint64_t result;

  result = qword_256B40EA0;
  if (!qword_256B40EA0)
  {
    result = MEMORY[0x242619B10](&unk_23C1FE064, &type metadata for MarketingInlineAction.RetryButtonTappedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40EA0);
  }
  return result;
}

unint64_t sub_23C1BF418()
{
  unint64_t result;

  result = qword_256B40EA8;
  if (!qword_256B40EA8)
  {
    result = MEMORY[0x242619B10](&unk_23C1FE0DC, &type metadata for MarketingInlineAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40EA8);
  }
  return result;
}

unint64_t sub_23C1BF460()
{
  unint64_t result;

  result = qword_256B40EB0;
  if (!qword_256B40EB0)
  {
    result = MEMORY[0x242619B10](&unk_23C1FE104, &type metadata for MarketingInlineAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40EB0);
  }
  return result;
}

uint64_t sub_23C1BF4A4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  unsigned int (*v9)(char *, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v12;

  v2 = sub_23C1FB414();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40ED0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23C1FB42C();
  sub_23C1FB408();
  swift_bridgeObjectRelease();
  v9 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48);
  if (!v9(v8, 1, v2))
    sub_23C1FB3FC();
  if (v9(v8, 1, v2))
  {
    v10 = sub_23C1FB468();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(a1, 1, 1, v10);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v5, v8, v2);
    sub_23C1FB3F0();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return sub_23C1BF608((uint64_t)v8);
}

uint64_t sub_23C1BF608(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40ED0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t MarketingArtwork.backgroundColor.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23C1BF6E4(v1, a1, &qword_256B40BE0);
}

uint64_t MarketingArtwork.templateURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for MarketingArtwork();
  return sub_23C1BF6E4(v1 + *(int *)(v3 + 20), a1, &qword_256B41DA0);
}

uint64_t type metadata accessor for MarketingArtwork()
{
  uint64_t result;

  result = qword_256B40F78;
  if (!qword_256B40F78)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23C1BF6E4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t MarketingArtwork.init(backgroundColor:templateURL:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;

  sub_23C1BF778(a1, a3, &qword_256B40BE0);
  v5 = type metadata accessor for MarketingArtwork();
  return sub_23C1BF778(a2, a3 + *(int *)(v5 + 20), &qword_256B41DA0);
}

uint64_t sub_23C1BF778(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_23C1BF7BC()
{
  _BYTE *v0;

  if (*v0)
    return 0x6574616C706D6574;
  else
    return 0x756F72676B636162;
}

uint64_t sub_23C1BF80C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C1C12BC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C1BF830()
{
  sub_23C1BFA04();
  return sub_23C1FC020();
}

uint64_t sub_23C1BF858()
{
  sub_23C1BFA04();
  return sub_23C1FC02C();
}

uint64_t MarketingArtwork.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40ED8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C1BFA04();
  sub_23C1FC014();
  v8[15] = 0;
  sub_23C1FB4C8();
  sub_23C1B56F4(&qword_256B40EE8, (uint64_t (*)(uint64_t))MEMORY[0x24BE34FA0], MEMORY[0x24BE34FB0]);
  sub_23C1FBF48();
  if (!v1)
  {
    type metadata accessor for MarketingArtwork();
    v8[14] = 1;
    sub_23C1FB468();
    sub_23C1B56F4(&qword_256B40EF0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAE0]);
    sub_23C1FBF48();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_23C1BFA04()
{
  unint64_t result;

  result = qword_256B40EE0;
  if (!qword_256B40EE0)
  {
    result = MEMORY[0x242619B10](&unk_23C1FE444, &type metadata for MarketingArtwork.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40EE0);
  }
  return result;
}

uint64_t MarketingArtwork.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  char v26;
  char v27;

  v22 = a2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41DA0);
  MEMORY[0x24BDAC7A8](v4);
  v23 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40BE0);
  MEMORY[0x24BDAC7A8](v6);
  v24 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40EF8);
  v8 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for MarketingArtwork();
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C1BFA04();
  sub_23C1FC008();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v21 = a1;
  v14 = v8;
  v15 = (uint64_t)v13;
  v16 = (uint64_t)v23;
  sub_23C1FB4C8();
  v27 = 0;
  sub_23C1B56F4(&qword_256B40F00, (uint64_t (*)(uint64_t))MEMORY[0x24BE34FA0], MEMORY[0x24BE34FC8]);
  v18 = (uint64_t)v24;
  v17 = v25;
  sub_23C1FBEE8();
  sub_23C1BF778(v18, v15, &qword_256B40BE0);
  sub_23C1FB468();
  v26 = 1;
  sub_23C1B56F4(&qword_256B40F08, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB10]);
  sub_23C1FBEE8();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v10, v17);
  sub_23C1BF778(v16, v15 + *(int *)(v11 + 20), &qword_256B41DA0);
  sub_23C1BFD24(v15, v22);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
  return sub_23C1BFD68(v15);
}

uint64_t sub_23C1BFD24(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MarketingArtwork();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23C1BFD68(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for MarketingArtwork();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23C1BFDA4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return MarketingArtwork.init(from:)(a1, a2);
}

uint64_t sub_23C1BFDB8(_QWORD *a1)
{
  return MarketingArtwork.encode(to:)(a1);
}

uint64_t MarketingArtwork.hash(into:)()
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
  char *v14;
  uint64_t v15;
  char *v17;
  uint64_t v18;
  char *v19;

  v1 = v0;
  v2 = sub_23C1FB468();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v19 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41DA0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23C1FB4C8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40BE0);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23C1BF6E4(v1, (uint64_t)v14, &qword_256B40BE0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v14, 1, v8) == 1)
  {
    sub_23C1FBFE4();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v14, v8);
    sub_23C1FBFE4();
    sub_23C1B56F4(&qword_256B40F10, (uint64_t (*)(uint64_t))MEMORY[0x24BE34FA0], MEMORY[0x24BE34FB8]);
    sub_23C1FBC90();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  v15 = type metadata accessor for MarketingArtwork();
  sub_23C1BF6E4(v1 + *(int *)(v15 + 20), (uint64_t)v7, &qword_256B41DA0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v7, 1, v2) == 1)
    return sub_23C1FBFE4();
  v17 = v19;
  (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v19, v7, v2);
  sub_23C1FBFE4();
  sub_23C1B56F4(&qword_256B40CB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
  sub_23C1FBC90();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v17, v2);
}

uint64_t MarketingArtwork.hashValue.getter()
{
  sub_23C1FBFCC();
  MarketingArtwork.hash(into:)();
  return sub_23C1FBFFC();
}

uint64_t sub_23C1C0088()
{
  sub_23C1FBFCC();
  MarketingArtwork.hash(into:)();
  return sub_23C1FBFFC();
}

uint64_t sub_23C1C00C8()
{
  sub_23C1FBFCC();
  MarketingArtwork.hash(into:)();
  return sub_23C1FBFFC();
}

BOOL _s16FitnessMarketing0B7ArtworkV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
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
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  unsigned int (*v28)(uint64_t, uint64_t, uint64_t);
  uint64_t *v29;
  uint64_t v30;
  char *v31;
  char v32;
  void (*v33)(char *, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unsigned int (*v40)(uint64_t, uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  char *v44;
  char v45;
  void (*v46)(char *, uint64_t);
  uint64_t v47;
  char *v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;

  v58 = sub_23C1FB468();
  v56 = *(_QWORD *)(v58 - 8);
  MEMORY[0x24BDAC7A8](v58);
  v48 = (char *)&v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40FD8);
  MEMORY[0x24BDAC7A8](v51);
  v57 = (uint64_t)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41DA0);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v49 = (uint64_t)&v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v53 = (uint64_t)&v47 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v55 = (uint64_t)&v47 - v11;
  v12 = sub_23C1FB4C8();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v50 = (char *)&v47 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40FE0);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v47 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40BE0);
  v19 = MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v47 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BDAC7A8](v19);
  v24 = (char *)&v47 - v23;
  MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)&v47 - v25;
  v52 = a1;
  sub_23C1BF6E4(a1, (uint64_t)&v47 - v25, &qword_256B40BE0);
  v54 = a2;
  sub_23C1BF6E4(a2, (uint64_t)v24, &qword_256B40BE0);
  v27 = (uint64_t)&v17[*(int *)(v15 + 48)];
  sub_23C1BF6E4((uint64_t)v26, (uint64_t)v17, &qword_256B40BE0);
  sub_23C1BF6E4((uint64_t)v24, v27, &qword_256B40BE0);
  v28 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48);
  if (v28((uint64_t)v17, 1, v12) != 1)
  {
    sub_23C1BF6E4((uint64_t)v17, (uint64_t)v21, &qword_256B40BE0);
    if (v28(v27, 1, v12) != 1)
    {
      v31 = v50;
      (*(void (**)(char *, uint64_t, uint64_t))(v13 + 32))(v50, v27, v12);
      sub_23C1B56F4(&qword_256B40FF0, (uint64_t (*)(uint64_t))MEMORY[0x24BE34FA0], MEMORY[0x24BE34FC0]);
      v32 = sub_23C1FBC9C();
      v33 = *(void (**)(char *, uint64_t))(v13 + 8);
      v33(v31, v12);
      sub_23C1BC2EC((uint64_t)v24, &qword_256B40BE0);
      sub_23C1BC2EC((uint64_t)v26, &qword_256B40BE0);
      v33(v21, v12);
      sub_23C1BC2EC((uint64_t)v17, &qword_256B40BE0);
      if ((v32 & 1) == 0)
        return 0;
      goto LABEL_8;
    }
    sub_23C1BC2EC((uint64_t)v24, &qword_256B40BE0);
    sub_23C1BC2EC((uint64_t)v26, &qword_256B40BE0);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v21, v12);
LABEL_6:
    v29 = &qword_256B40FE0;
    v30 = (uint64_t)v17;
LABEL_14:
    sub_23C1BC2EC(v30, v29);
    return 0;
  }
  sub_23C1BC2EC((uint64_t)v24, &qword_256B40BE0);
  sub_23C1BC2EC((uint64_t)v26, &qword_256B40BE0);
  if (v28(v27, 1, v12) != 1)
    goto LABEL_6;
  sub_23C1BC2EC((uint64_t)v17, &qword_256B40BE0);
LABEL_8:
  v34 = type metadata accessor for MarketingArtwork();
  v35 = v55;
  sub_23C1BF6E4(v52 + *(int *)(v34 + 20), v55, &qword_256B41DA0);
  v36 = v53;
  sub_23C1BF6E4(v54 + *(int *)(v34 + 20), v53, &qword_256B41DA0);
  v37 = v57;
  v38 = v57 + *(int *)(v51 + 48);
  sub_23C1BF6E4(v35, v57, &qword_256B41DA0);
  sub_23C1BF6E4(v36, v38, &qword_256B41DA0);
  v39 = v56;
  v40 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v56 + 48);
  v41 = v58;
  if (v40(v37, 1, v58) == 1)
  {
    sub_23C1BC2EC(v36, &qword_256B41DA0);
    sub_23C1BC2EC(v35, &qword_256B41DA0);
    if (v40(v38, 1, v41) == 1)
    {
      sub_23C1BC2EC(v37, &qword_256B41DA0);
      return 1;
    }
    goto LABEL_13;
  }
  v42 = v49;
  sub_23C1BF6E4(v37, v49, &qword_256B41DA0);
  if (v40(v38, 1, v41) == 1)
  {
    sub_23C1BC2EC(v36, &qword_256B41DA0);
    sub_23C1BC2EC(v35, &qword_256B41DA0);
    (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v42, v41);
LABEL_13:
    v29 = &qword_256B40FD8;
    v30 = v37;
    goto LABEL_14;
  }
  v44 = v48;
  (*(void (**)(char *, uint64_t, uint64_t))(v39 + 32))(v48, v38, v41);
  sub_23C1B56F4(&qword_256B40FE8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB00]);
  v45 = sub_23C1FBC9C();
  v46 = *(void (**)(char *, uint64_t))(v39 + 8);
  v46(v44, v41);
  sub_23C1BC2EC(v36, &qword_256B41DA0);
  sub_23C1BC2EC(v35, &qword_256B41DA0);
  v46((char *)v42, v41);
  sub_23C1BC2EC(v37, &qword_256B41DA0);
  return (v45 & 1) != 0;
}

uint64_t sub_23C1C06E8()
{
  return sub_23C1B56F4(&qword_256B40F18, (uint64_t (*)(uint64_t))type metadata accessor for MarketingArtwork, (uint64_t)&protocol conformance descriptor for MarketingArtwork);
}

uint64_t *initializeBufferWithCopyOfBuffer for MarketingArtwork(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

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
    v7 = sub_23C1FB4C8();
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40BE0);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    v11 = *(int *)(a3 + 20);
    v12 = (char *)a1 + v11;
    v13 = (char *)a2 + v11;
    v14 = sub_23C1FB468();
    v15 = *(_QWORD *)(v14 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
    {
      v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41DA0);
      memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v12, v13, v14);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
    }
  }
  return a1;
}

uint64_t destroy for MarketingArtwork(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  v4 = sub_23C1FB4C8();
  v5 = *(_QWORD *)(v4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v4))
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  v6 = a1 + *(int *)(a2 + 20);
  v7 = sub_23C1FB468();
  v8 = *(_QWORD *)(v7 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  return result;
}

char *initializeWithCopy for MarketingArtwork(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = sub_23C1FB4C8();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40BE0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  v9 = *(int *)(a3 + 20);
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = sub_23C1FB468();
  v13 = *(_QWORD *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41DA0);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  return a1;
}

char *assignWithCopy for MarketingArtwork(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(char *, uint64_t, uint64_t);
  int v18;
  int v19;
  uint64_t v20;

  v6 = sub_23C1FB4C8();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40BE0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
LABEL_7:
  v12 = *(int *)(a3 + 20);
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = sub_23C1FB468();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  v18 = v17(v13, 1, v15);
  v19 = v17(v14, 1, v15);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 24))(v13, v14, v15);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v15);
    goto LABEL_12;
  }
  if (v19)
  {
LABEL_12:
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41DA0);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v13, v14, v15);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  return a1;
}

char *initializeWithTake for MarketingArtwork(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = sub_23C1FB4C8();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40BE0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  v9 = *(int *)(a3 + 20);
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = sub_23C1FB468();
  v13 = *(_QWORD *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41DA0);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v10, v11, v12);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  return a1;
}

char *assignWithTake for MarketingArtwork(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(char *, uint64_t, uint64_t);
  int v18;
  int v19;
  uint64_t v20;

  v6 = sub_23C1FB4C8();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40BE0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
LABEL_7:
  v12 = *(int *)(a3 + 20);
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = sub_23C1FB468();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  v18 = v17(v13, 1, v15);
  v19 = v17(v14, 1, v15);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 40))(v13, v14, v15);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v15);
    goto LABEL_12;
  }
  if (v19)
  {
LABEL_12:
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41DA0);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v13, v14, v15);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  return a1;
}

uint64_t getEnumTagSinglePayload for MarketingArtwork()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C1C0F1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40BE0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41DA0);
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t storeEnumTagSinglePayload for MarketingArtwork()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C1C0FA4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40BE0);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41DA0);
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_23C1C1028()
{
  unint64_t v0;
  unint64_t v1;

  sub_23C1C10CC(319, &qword_256B40F88, (void (*)(uint64_t))MEMORY[0x24BE34FA0]);
  if (v0 <= 0x3F)
  {
    sub_23C1C10CC(319, qword_256B40F90, (void (*)(uint64_t))MEMORY[0x24BDCDAC0]);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_23C1C10CC(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_23C1FBDE0();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t storeEnumTagSinglePayload for MarketingArtwork.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C1C1164 + 4 * byte_23C1FE295[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C1C1198 + 4 * byte_23C1FE290[v4]))();
}

uint64_t sub_23C1C1198(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1C11A0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C1C11A8);
  return result;
}

uint64_t sub_23C1C11B4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C1C11BCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C1C11C0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1C11C8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MarketingArtwork.CodingKeys()
{
  return &type metadata for MarketingArtwork.CodingKeys;
}

unint64_t sub_23C1C11E8()
{
  unint64_t result;

  result = qword_256B40FC0;
  if (!qword_256B40FC0)
  {
    result = MEMORY[0x242619B10](&unk_23C1FE41C, &type metadata for MarketingArtwork.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40FC0);
  }
  return result;
}

unint64_t sub_23C1C1230()
{
  unint64_t result;

  result = qword_256B40FC8;
  if (!qword_256B40FC8)
  {
    result = MEMORY[0x242619B10](&unk_23C1FE38C, &type metadata for MarketingArtwork.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40FC8);
  }
  return result;
}

unint64_t sub_23C1C1278()
{
  unint64_t result;

  result = qword_256B40FD0;
  if (!qword_256B40FD0)
  {
    result = MEMORY[0x242619B10](&unk_23C1FE3B4, &type metadata for MarketingArtwork.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B40FD0);
  }
  return result;
}

uint64_t sub_23C1C12BC(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x756F72676B636162 && a2 == 0xEF726F6C6F43646ELL;
  if (v2 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6574616C706D6574 && a2 == 0xEB000000004C5255)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23C1FBF90();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

BOOL static MarketingItemError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23C1C13FC(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23C1C142C + 4 * byte_23C1FE4A0[a1]))(0x6D6574496F6ELL, 0xE600000000000000);
}

unint64_t sub_23C1C142C()
{
  return 0xD000000000000010;
}

unint64_t sub_23C1C1488()
{
  return 0xD000000000000013;
}

uint64_t sub_23C1C14B0()
{
  sub_23C1C1BE0();
  return sub_23C1FC020();
}

uint64_t sub_23C1C14D8()
{
  sub_23C1C1BE0();
  return sub_23C1FC02C();
}

uint64_t sub_23C1C1500()
{
  unsigned __int8 *v0;

  return sub_23C1C13FC(*v0);
}

uint64_t sub_23C1C1508@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C1C297C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C1C152C()
{
  sub_23C1C1B14();
  return sub_23C1FC020();
}

uint64_t sub_23C1C1554()
{
  sub_23C1C1B14();
  return sub_23C1FC02C();
}

uint64_t sub_23C1C157C()
{
  sub_23C1C1B9C();
  return sub_23C1FC020();
}

uint64_t sub_23C1C15A4()
{
  sub_23C1C1B9C();
  return sub_23C1FC02C();
}

uint64_t sub_23C1C15CC()
{
  sub_23C1C1B58();
  return sub_23C1FC020();
}

uint64_t sub_23C1C15F4()
{
  sub_23C1C1B58();
  return sub_23C1FC02C();
}

uint64_t sub_23C1C161C()
{
  sub_23C1C1C24();
  return sub_23C1FC020();
}

uint64_t sub_23C1C1644()
{
  sub_23C1C1C24();
  return sub_23C1FC02C();
}

uint64_t sub_23C1C166C()
{
  sub_23C1C1CAC();
  return sub_23C1FC020();
}

uint64_t sub_23C1C1694()
{
  sub_23C1C1CAC();
  return sub_23C1FC02C();
}

uint64_t sub_23C1C16BC()
{
  sub_23C1C1C68();
  return sub_23C1FC020();
}

uint64_t sub_23C1C16E4()
{
  sub_23C1C1C68();
  return sub_23C1FC02C();
}

void MarketingItemError.encode(to:)(_QWORD *a1)
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
  _QWORD v15[17];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40FF8);
  v15[13] = *(_QWORD *)(v3 - 8);
  v15[14] = v3;
  MEMORY[0x24BDAC7A8](v3);
  v15[12] = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41000);
  v15[10] = *(_QWORD *)(v5 - 8);
  v15[11] = v5;
  MEMORY[0x24BDAC7A8](v5);
  v15[9] = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41008);
  v15[7] = *(_QWORD *)(v7 - 8);
  v15[8] = v7;
  MEMORY[0x24BDAC7A8](v7);
  v15[6] = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41010);
  v15[4] = *(_QWORD *)(v9 - 8);
  v15[5] = v9;
  MEMORY[0x24BDAC7A8](v9);
  v15[3] = (char *)v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41018);
  v15[1] = *(_QWORD *)(v11 - 8);
  v15[2] = v11;
  MEMORY[0x24BDAC7A8](v11);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41020);
  MEMORY[0x24BDAC7A8](v12);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41028);
  v15[15] = *(_QWORD *)(v13 - 8);
  v15[16] = v13;
  MEMORY[0x24BDAC7A8](v13);
  v14 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C1C1B14();
  sub_23C1FC014();
  __asm { BR              X9 }
}

uint64_t sub_23C1C1950()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v4 - 70) = 0;
  sub_23C1C1CAC();
  v5 = *(_QWORD *)(v4 - 96);
  sub_23C1FBF30();
  (*(void (**)(uint64_t, uint64_t))(v0 + 8))(v2, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 104) + 8))(v1, v5);
}

unint64_t sub_23C1C1B14()
{
  unint64_t result;

  result = qword_256B41030;
  if (!qword_256B41030)
  {
    result = MEMORY[0x242619B10](&unk_23C1FEB38, &type metadata for MarketingItemError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41030);
  }
  return result;
}

unint64_t sub_23C1C1B58()
{
  unint64_t result;

  result = qword_256B41038;
  if (!qword_256B41038)
  {
    result = MEMORY[0x242619B10](&unk_23C1FEAE8, &type metadata for MarketingItemError.NoChannelCustomerIdCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41038);
  }
  return result;
}

unint64_t sub_23C1C1B9C()
{
  unint64_t result;

  result = qword_256B41040;
  if (!qword_256B41040)
  {
    result = MEMORY[0x242619B10](&unk_23C1FEA98, &type metadata for MarketingItemError.NoCarrierLinkResultCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41040);
  }
  return result;
}

unint64_t sub_23C1C1BE0()
{
  unint64_t result;

  result = qword_256B41048;
  if (!qword_256B41048)
  {
    result = MEMORY[0x242619B10](&unk_23C1FEA48, &type metadata for MarketingItemError.ActiveSubscriptionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41048);
  }
  return result;
}

unint64_t sub_23C1C1C24()
{
  unint64_t result;

  result = qword_256B41050;
  if (!qword_256B41050)
  {
    result = MEMORY[0x242619B10](&unk_23C1FE9F8, &type metadata for MarketingItemError.NoCorrelationIDCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41050);
  }
  return result;
}

unint64_t sub_23C1C1C68()
{
  unint64_t result;

  result = qword_256B41058;
  if (!qword_256B41058)
  {
    result = MEMORY[0x242619B10](&unk_23C1FE9A8, &type metadata for MarketingItemError.NoPurchaseResultCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41058);
  }
  return result;
}

unint64_t sub_23C1C1CAC()
{
  unint64_t result;

  result = qword_256B41060;
  if (!qword_256B41060)
  {
    result = MEMORY[0x242619B10](&unk_23C1FE958, &type metadata for MarketingItemError.NoItemCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41060);
  }
  return result;
}

uint64_t MarketingItemError.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  _QWORD v29[4];
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
  char *v40;
  char *v41;
  char *v42;
  char *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;

  v46 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41068);
  v31 = *(_QWORD *)(v3 - 8);
  v32 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v45 = (char *)v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41070);
  v37 = *(_QWORD *)(v44 - 8);
  MEMORY[0x24BDAC7A8](v44);
  v43 = (char *)v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41078);
  v38 = *(_QWORD *)(v6 - 8);
  v39 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v42 = (char *)v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41080);
  v35 = *(_QWORD *)(v8 - 8);
  v36 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v41 = (char *)v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41088);
  v33 = *(_QWORD *)(v10 - 8);
  v34 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v40 = (char *)v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41090);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41098);
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)v29 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = a1[3];
  v47 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v20);
  sub_23C1C1B14();
  v21 = v48;
  sub_23C1FC008();
  if (!v21)
  {
    v29[3] = v15;
    v29[1] = v13;
    v29[2] = v12;
    v30 = v17;
    v48 = v16;
    v22 = v19;
    v23 = sub_23C1FBF24();
    if (*(_QWORD *)(v23 + 16) == 1)
    {
      v29[0] = v23;
      __asm { BR              X9 }
    }
    v24 = sub_23C1FBE58();
    swift_allocError();
    v26 = v25;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B40A48);
    *v26 = &type metadata for MarketingItemError;
    v27 = v48;
    sub_23C1FBED0();
    sub_23C1FBE4C();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v24 - 8) + 104))(v26, *MEMORY[0x24BEE26D0], v24);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v22, v27);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v47);
}

void sub_23C1C20D8()
{
  char v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;

  v6 = v0;
  *(_BYTE *)(v5 - 69) = 1;
  sub_23C1C1C68();
  v7 = *(_QWORD *)(v5 - 160);
  v8 = *(_QWORD *)(v5 - 96);
  sub_23C1FBEC4();
  if (!v2)
  {
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v5 - 216) + 8))(v7, *(_QWORD *)(v5 - 208));
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v8);
    *v3 = v6;
    JUMPOUT(0x23C1C20B0);
  }
  swift_bridgeObjectRelease();
  JUMPOUT(0x23C1C20A8);
}

uint64_t sub_23C1C2324@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return MarketingItemError.init(from:)(a1, a2);
}

void sub_23C1C2338(_QWORD *a1)
{
  MarketingItemError.encode(to:)(a1);
}

uint64_t MarketingItemError.hash(into:)()
{
  return sub_23C1FBFD8();
}

uint64_t MarketingItemError.hashValue.getter()
{
  sub_23C1FBFCC();
  sub_23C1FBFD8();
  return sub_23C1FBFFC();
}

unint64_t sub_23C1C23BC()
{
  unint64_t result;

  result = qword_256B410A0;
  if (!qword_256B410A0)
  {
    result = MEMORY[0x242619B10](&protocol conformance descriptor for MarketingItemError, &type metadata for MarketingItemError);
    atomic_store(result, (unint64_t *)&qword_256B410A0);
  }
  return result;
}

ValueMetadata *type metadata accessor for MarketingItemError()
{
  return &type metadata for MarketingItemError;
}

uint64_t _s16FitnessMarketing18MarketingItemErrorOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_23C1C2464 + 4 * byte_23C1FE4B7[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_23C1C2498 + 4 * byte_23C1FE4B2[v4]))();
}

uint64_t sub_23C1C2498(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1C24A0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C1C24A8);
  return result;
}

uint64_t sub_23C1C24B4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C1C24BCLL);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_23C1C24C0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1C24C8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MarketingItemError.CodingKeys()
{
  return &type metadata for MarketingItemError.CodingKeys;
}

ValueMetadata *type metadata accessor for MarketingItemError.NoItemCodingKeys()
{
  return &type metadata for MarketingItemError.NoItemCodingKeys;
}

ValueMetadata *type metadata accessor for MarketingItemError.NoPurchaseResultCodingKeys()
{
  return &type metadata for MarketingItemError.NoPurchaseResultCodingKeys;
}

ValueMetadata *type metadata accessor for MarketingItemError.NoCorrelationIDCodingKeys()
{
  return &type metadata for MarketingItemError.NoCorrelationIDCodingKeys;
}

ValueMetadata *type metadata accessor for MarketingItemError.ActiveSubscriptionCodingKeys()
{
  return &type metadata for MarketingItemError.ActiveSubscriptionCodingKeys;
}

ValueMetadata *type metadata accessor for MarketingItemError.NoCarrierLinkResultCodingKeys()
{
  return &type metadata for MarketingItemError.NoCarrierLinkResultCodingKeys;
}

ValueMetadata *type metadata accessor for MarketingItemError.NoChannelCustomerIdCodingKeys()
{
  return &type metadata for MarketingItemError.NoChannelCustomerIdCodingKeys;
}

unint64_t sub_23C1C2548()
{
  unint64_t result;

  result = qword_256B410A8;
  if (!qword_256B410A8)
  {
    result = MEMORY[0x242619B10](&unk_23C1FE930, &type metadata for MarketingItemError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B410A8);
  }
  return result;
}

unint64_t sub_23C1C2590()
{
  unint64_t result;

  result = qword_256B410B0;
  if (!qword_256B410B0)
  {
    result = MEMORY[0x242619B10](&unk_23C1FE850, &type metadata for MarketingItemError.NoItemCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B410B0);
  }
  return result;
}

unint64_t sub_23C1C25D8()
{
  unint64_t result;

  result = qword_256B410B8;
  if (!qword_256B410B8)
  {
    result = MEMORY[0x242619B10](&unk_23C1FE878, &type metadata for MarketingItemError.NoItemCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B410B8);
  }
  return result;
}

unint64_t sub_23C1C2620()
{
  unint64_t result;

  result = qword_256B410C0;
  if (!qword_256B410C0)
  {
    result = MEMORY[0x242619B10](&unk_23C1FE800, &type metadata for MarketingItemError.NoPurchaseResultCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B410C0);
  }
  return result;
}

unint64_t sub_23C1C2668()
{
  unint64_t result;

  result = qword_256B410C8;
  if (!qword_256B410C8)
  {
    result = MEMORY[0x242619B10](&unk_23C1FE828, &type metadata for MarketingItemError.NoPurchaseResultCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B410C8);
  }
  return result;
}

unint64_t sub_23C1C26B0()
{
  unint64_t result;

  result = qword_256B410D0;
  if (!qword_256B410D0)
  {
    result = MEMORY[0x242619B10](&unk_23C1FE7B0, &type metadata for MarketingItemError.NoCorrelationIDCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B410D0);
  }
  return result;
}

unint64_t sub_23C1C26F8()
{
  unint64_t result;

  result = qword_256B410D8;
  if (!qword_256B410D8)
  {
    result = MEMORY[0x242619B10](&unk_23C1FE7D8, &type metadata for MarketingItemError.NoCorrelationIDCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B410D8);
  }
  return result;
}

unint64_t sub_23C1C2740()
{
  unint64_t result;

  result = qword_256B410E0;
  if (!qword_256B410E0)
  {
    result = MEMORY[0x242619B10](&unk_23C1FE760, &type metadata for MarketingItemError.ActiveSubscriptionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B410E0);
  }
  return result;
}

unint64_t sub_23C1C2788()
{
  unint64_t result;

  result = qword_256B410E8;
  if (!qword_256B410E8)
  {
    result = MEMORY[0x242619B10](&unk_23C1FE788, &type metadata for MarketingItemError.ActiveSubscriptionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B410E8);
  }
  return result;
}

unint64_t sub_23C1C27D0()
{
  unint64_t result;

  result = qword_256B410F0;
  if (!qword_256B410F0)
  {
    result = MEMORY[0x242619B10](&unk_23C1FE710, &type metadata for MarketingItemError.NoCarrierLinkResultCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B410F0);
  }
  return result;
}

unint64_t sub_23C1C2818()
{
  unint64_t result;

  result = qword_256B410F8;
  if (!qword_256B410F8)
  {
    result = MEMORY[0x242619B10](&unk_23C1FE738, &type metadata for MarketingItemError.NoCarrierLinkResultCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B410F8);
  }
  return result;
}

unint64_t sub_23C1C2860()
{
  unint64_t result;

  result = qword_256B41100;
  if (!qword_256B41100)
  {
    result = MEMORY[0x242619B10](&unk_23C1FE6C0, &type metadata for MarketingItemError.NoChannelCustomerIdCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41100);
  }
  return result;
}

unint64_t sub_23C1C28A8()
{
  unint64_t result;

  result = qword_256B41108;
  if (!qword_256B41108)
  {
    result = MEMORY[0x242619B10](&unk_23C1FE6E8, &type metadata for MarketingItemError.NoChannelCustomerIdCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41108);
  }
  return result;
}

unint64_t sub_23C1C28F0()
{
  unint64_t result;

  result = qword_256B41110;
  if (!qword_256B41110)
  {
    result = MEMORY[0x242619B10](&unk_23C1FE8A0, &type metadata for MarketingItemError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41110);
  }
  return result;
}

unint64_t sub_23C1C2938()
{
  unint64_t result;

  result = qword_256B41118;
  if (!qword_256B41118)
  {
    result = MEMORY[0x242619B10](&unk_23C1FE8C8, &type metadata for MarketingItemError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41118);
  }
  return result;
}

uint64_t sub_23C1C297C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6D6574496F6ELL && a2 == 0xE600000000000000;
  if (v2 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000023C203870 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6C6572726F436F6ELL && a2 == 0xEF44496E6F697461 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000023C203890 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000023C2038B0 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000023C2038D0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    v6 = sub_23C1FBF90();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 5;
    else
      return 6;
  }
}

uint64_t sub_23C1C2BF4()
{
  uint64_t v0;

  v0 = sub_23C1FB54C();
  __swift_allocate_value_buffer(v0, qword_256B4F8B0);
  __swift_project_value_buffer(v0, (uint64_t)qword_256B4F8B0);
  return sub_23C1FB540();
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

uint64_t sub_23C1C2CC4(uint64_t a1, uint64_t a2)
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
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t result;
  uint64_t v31;
  uint64_t v32;
  int EnumCaseMultiPayload;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char v40;
  void (*v41)(char *, uint64_t);
  uint64_t v42;
  uint64_t v43;
  char *v44;
  void (*v45)(char *, uint64_t);
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  void (*v52)(char *, uint64_t);
  char *v53;
  int *v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  int v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
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

  v4 = sub_23C1FB468();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v82 = (char *)&v73 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v80 = (char *)&v73 - v8;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40928);
  v10 = *(_QWORD *)(v9 - 8);
  v84 = v9;
  v85 = v10;
  MEMORY[0x24BDAC7A8](v9);
  v81 = (char *)&v73 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for MarketingAction();
  v13 = MEMORY[0x24BDAC7A8](v12);
  v86 = (uint64_t)&v73 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v83 = (uint64_t)&v73 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v73 - v17;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41268);
  MEMORY[0x24BDAC7A8](v19);
  v88 = (uint64_t)&v73 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v87 = type metadata accessor for MarketingActionItem();
  v21 = MEMORY[0x24BDAC7A8](v87);
  v23 = (char *)&v73 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v26 = (char *)&v73 - v25;
  v27 = *(_QWORD *)(a1 + 16);
  if (v27 != *(_QWORD *)(a2 + 16))
    return 0;
  if (!v27 || a1 == a2)
    return 1;
  v73 = v18;
  v74 = v5;
  v28 = (*(unsigned __int8 *)(v24 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
  v75 = *(_QWORD *)(v24 + 72);
  v76 = a1;
  v78 = v12;
  v79 = a2;
  v77 = v19;
  while (1)
  {
    sub_23C1B50D4(a1 + v28, (uint64_t)v26, (uint64_t (*)(_QWORD))type metadata accessor for MarketingActionItem);
    sub_23C1B50D4(a2 + v28, (uint64_t)v23, (uint64_t (*)(_QWORD))type metadata accessor for MarketingActionItem);
    v31 = v88;
    v32 = v88 + *(int *)(v19 + 48);
    sub_23C1B50D4((uint64_t)v26, v88, (uint64_t (*)(_QWORD))type metadata accessor for MarketingAction);
    sub_23C1B50D4((uint64_t)v23, v32, (uint64_t (*)(_QWORD))type metadata accessor for MarketingAction);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (!EnumCaseMultiPayload)
    {
      sub_23C1B50D4(v31, (uint64_t)v18, (uint64_t (*)(_QWORD))type metadata accessor for MarketingAction);
      if (swift_getEnumCaseMultiPayload())
      {
        (*(void (**)(char *, uint64_t))(v85 + 8))(v18, v84);
        goto LABEL_44;
      }
      v42 = v84;
      v43 = v85;
      v44 = v81;
      (*(void (**)(char *, uint64_t, uint64_t))(v85 + 32))(v81, v32, v84);
      sub_23C1C5C88(0, (unint64_t *)&qword_256B41270);
      v40 = sub_23C1FB4F8();
      v45 = *(void (**)(char *, uint64_t))(v43 + 8);
      v45(v44, v42);
      v45(v18, v42);
      v46 = v88;
      goto LABEL_15;
    }
    v34 = v86;
    if (EnumCaseMultiPayload != 1)
      break;
    v35 = v88;
    v36 = v83;
    sub_23C1B50D4(v88, v83, (uint64_t (*)(_QWORD))type metadata accessor for MarketingAction);
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      (*(void (**)(uint64_t, uint64_t))(v74 + 8))(v36, v4);
      v31 = v35;
      goto LABEL_44;
    }
    v37 = v36;
    v38 = v74;
    v39 = v80;
    (*(void (**)(char *, uint64_t, uint64_t))(v74 + 32))(v80, v32, v4);
    v40 = MEMORY[0x242618B14](v37, v39);
    v41 = *(void (**)(char *, uint64_t))(v38 + 8);
    v41(v39, v4);
    v41((char *)v37, v4);
    sub_23C1B5118(v35, (uint64_t (*)(_QWORD))type metadata accessor for MarketingAction);
    v18 = v73;
LABEL_16:
    v54 = (int *)v87;
    if ((v40 & 1) == 0)
      goto LABEL_45;
    v55 = *(int *)(v87 + 20);
    v56 = &v26[v55];
    v57 = *(_QWORD *)&v26[v55 + 8];
    v58 = &v23[v55];
    v59 = *((_QWORD *)v58 + 1);
    if (v57)
    {
      if (!v59 || (*(_QWORD *)v56 != *(_QWORD *)v58 || v57 != v59) && (sub_23C1FBF90() & 1) == 0)
        goto LABEL_45;
    }
    else if (v59)
    {
      goto LABEL_45;
    }
    v60 = v54[6];
    v61 = &v26[v60];
    v62 = *(_QWORD *)&v26[v60 + 8];
    v63 = &v23[v60];
    v64 = *((_QWORD *)v63 + 1);
    if (v62)
    {
      if (!v64 || (*(_QWORD *)v61 != *(_QWORD *)v63 || v62 != v64) && (sub_23C1FBF90() & 1) == 0)
        goto LABEL_45;
    }
    else if (v64)
    {
      goto LABEL_45;
    }
    v65 = v54[7];
    v66 = v26[v65];
    v67 = v26[v65];
    v68 = v23[v65];
    if (v66 < 0)
    {
      if ((v68 & 0x80) == 0 || ((v68 ^ v67) & 0x7F) != 0)
        goto LABEL_45;
    }
    else if ((v68 & 0x80) != 0 || v67 != v68)
    {
      goto LABEL_45;
    }
    v69 = v54[8];
    v70 = *(_QWORD *)&v26[v69];
    v71 = *(_QWORD *)&v26[v69 + 8];
    v72 = &v23[v69];
    if (v70 == *(_QWORD *)v72 && v71 == *((_QWORD *)v72 + 1))
    {
      sub_23C1B5118((uint64_t)v23, (uint64_t (*)(_QWORD))type metadata accessor for MarketingActionItem);
      sub_23C1B5118((uint64_t)v26, (uint64_t (*)(_QWORD))type metadata accessor for MarketingActionItem);
      a2 = v79;
      v19 = v77;
    }
    else
    {
      v29 = sub_23C1FBF90();
      sub_23C1B5118((uint64_t)v23, (uint64_t (*)(_QWORD))type metadata accessor for MarketingActionItem);
      sub_23C1B5118((uint64_t)v26, (uint64_t (*)(_QWORD))type metadata accessor for MarketingActionItem);
      a2 = v79;
      v19 = v77;
      if ((v29 & 1) == 0)
        return 0;
    }
    a1 = v76;
    v28 += v75;
    result = 1;
    if (!--v27)
      return result;
  }
  v47 = v88;
  sub_23C1B50D4(v88, v86, (uint64_t (*)(_QWORD))type metadata accessor for MarketingAction);
  if (swift_getEnumCaseMultiPayload() == 2)
  {
    v48 = v34;
    v49 = v74;
    v50 = v4;
    v51 = v82;
    (*(void (**)(char *, uint64_t, uint64_t))(v74 + 32))(v82, v32, v50);
    v40 = MEMORY[0x242618B14](v48, v51);
    v52 = *(void (**)(char *, uint64_t))(v49 + 8);
    v53 = v51;
    v4 = v50;
    v18 = v73;
    v52(v53, v4);
    v52((char *)v48, v4);
    v46 = v47;
LABEL_15:
    sub_23C1B5118(v46, (uint64_t (*)(_QWORD))type metadata accessor for MarketingAction);
    goto LABEL_16;
  }
  (*(void (**)(uint64_t, uint64_t))(v74 + 8))(v34, v4);
  v31 = v47;
LABEL_44:
  sub_23C1BC2EC(v31, &qword_256B41268);
LABEL_45:
  sub_23C1B5118((uint64_t)v23, (uint64_t (*)(_QWORD))type metadata accessor for MarketingActionItem);
  sub_23C1B5118((uint64_t)v26, (uint64_t (*)(_QWORD))type metadata accessor for MarketingActionItem);
  return 0;
}

uint64_t sub_23C1C3304(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _BYTE *v3;
  _BYTE *i;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (v2 && a1 != a2)
  {
    v3 = (_BYTE *)(a2 + 48);
    for (i = (_BYTE *)(a1 + 48); ; i += 24)
    {
      if ((char)*i < 0)
      {
        if ((*v3 & 0x80) == 0)
          return 0;
      }
      else if ((*v3 & 0x80) != 0)
      {
        return 0;
      }
      if (*((_QWORD *)v3 - 2) != *((_QWORD *)i - 2))
        break;
      if ((*i & 1) != 0)
      {
        if ((*v3 & 1) == 0)
          return 0;
      }
      else
      {
        result = 0;
        if ((*v3 & 1) != 0 || *((_QWORD *)i - 1) != *((_QWORD *)v3 - 1))
          return result;
      }
      v3 += 24;
      if (!--v2)
        return 1;
    }
    return 0;
  }
  return 1;
}

uint64_t sub_23C1C3398()
{
  _BYTE *v0;

  if (*v0)
    return 0x726564616568;
  else
    return 0x4163696D616E7964;
}

uint64_t sub_23C1C33DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C1C5810(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C1C3400()
{
  sub_23C1C4CB8();
  return sub_23C1FC020();
}

uint64_t sub_23C1C3428()
{
  sub_23C1C4CB8();
  return sub_23C1FC02C();
}

uint64_t sub_23C1C3450()
{
  return 0x6D726F6674616C70;
}

uint64_t sub_23C1C3468@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x6D726F6674616C70 && a2 == 0xE800000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_23C1FBF90();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_23C1C34FC()
{
  sub_23C1C4D84();
  return sub_23C1FC020();
}

uint64_t sub_23C1C3524()
{
  sub_23C1C4D84();
  return sub_23C1FC02C();
}

uint64_t sub_23C1C354C()
{
  return 0x736D657469;
}

uint64_t sub_23C1C3560@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x736D657469 && a2 == 0xE500000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_23C1FBF90();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_23C1C35EC()
{
  sub_23C1C4CFC();
  return sub_23C1FC020();
}

uint64_t sub_23C1C3614()
{
  sub_23C1C4CFC();
  return sub_23C1FC02C();
}

uint64_t static MarketingOfferTemplate.makeHeaderUpsellTemplate(from:platform:)@<X0>(void *a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  unsigned int v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  id v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t result;
  void *v29;
  id *v30;
  char **p_types;
  unint64_t v32;
  unint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v45;
  uint64_t v46;
  void *v47;
  char **v48;
  id v49;
  id v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char v55;
  unint64_t v56;
  char v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  uint64_t v65;
  __int128 v66;
  __int128 v67;

  v5 = 2 * (a2 == 3);
  v6 = objc_msgSend(a1, sel_rawValues);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B41120);
  v7 = sub_23C1FBC84();

  if (!*(_QWORD *)(v7 + 16) || (v8 = sub_23C1C4B24(0x7475626972747461, 0xEA00000000007365), (v9 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  v10 = *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v8);
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v66 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B41138);
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_8;
  if (*(_QWORD *)(v64 + 16) && (v11 = sub_23C1C4B24(0x79616C70736964, 0xE700000000000000), (v12 & 1) != 0))
  {
    sub_23C1C4C7C(*(_QWORD *)(v64 + 56) + 32 * v11, (uint64_t)&v66);
  }
  else
  {
    v66 = 0u;
    v67 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v67 + 1))
    goto LABEL_60;
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_8;
  if (*(_QWORD *)(v64 + 16) && (v54 = sub_23C1C4B24(0xD000000000000012, 0x800000023C203910), (v55 & 1) != 0))
  {
    sub_23C1C4C7C(*(_QWORD *)(v64 + 56) + 32 * v54, (uint64_t)&v66);
  }
  else
  {
    v66 = 0u;
    v67 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v67 + 1))
    goto LABEL_60;
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_8;
  if (*(_QWORD *)(v64 + 16) && (v56 = sub_23C1C4B24(0xD000000000000010, 0x800000023C203930), (v57 & 1) != 0))
  {
    sub_23C1C4C7C(*(_QWORD *)(v64 + 56) + 32 * v56, (uint64_t)&v66);
  }
  else
  {
    v66 = 0u;
    v67 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v67 + 1))
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      if (v64 == 0x65736C6166 && v65 == 0xE500000000000000)
      {
        swift_bridgeObjectRelease();
        v5 = 1;
      }
      else
      {
        v58 = sub_23C1FBF90();
        swift_bridgeObjectRelease();
        if ((v58 & 1) != 0)
          v5 = 1;
      }
    }
  }
  else
  {
LABEL_60:
    sub_23C1BC2EC((uint64_t)&v66, &qword_256B41140);
  }
LABEL_8:
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B41128);
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_23C1FEB90;
  v62 = v5;
  *(_QWORD *)(v13 + 32) = v5;
  *(_QWORD *)(v13 + 40) = 1;
  *(_BYTE *)(v13 + 48) = 0x80;
  v14 = objc_msgSend(a1, sel_itemActions);
  v61 = a3;
  if (!v14)
  {
    v22 = (_QWORD *)MEMORY[0x24BEE4AF8];
    if ((MEMORY[0x24BEE4AF8] & 0xC000000000000000) != 0)
      goto LABEL_72;
    goto LABEL_21;
  }
  v15 = v14;
  sub_23C1C5C88(0, &qword_256B41130);
  v16 = sub_23C1FBD2C();

  if (!(v16 >> 62))
  {
    v17 = *(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v17 >= 1)
      v18 = 1;
    else
      v18 = *(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v17 >= (unint64_t)v18)
    {
LABEL_14:
      if ((v16 & 0xC000000000000001) != 0 && (unint64_t)v17 >= 2)
      {
        v19 = v18;
        do
        {
          v20 = v19 + 1;
          sub_23C1FBE34();
          v19 = v20;
        }
        while (v17 != v20);
      }
      if (v16 >> 62)
      {
        swift_bridgeObjectRetain();
        sub_23C1FBE94();
        v21 = v23;
        v18 = v24;
        v26 = v25;
        swift_bridgeObjectRelease_n();
        v17 = v26 >> 1;
      }
      else
      {
        v21 = (v16 & 0xFFFFFFFFFFFFFF8) + 32;
      }
      while (1)
      {
        v27 = v17 - v18;
        if (v17 == v18)
        {
LABEL_24:
          result = swift_unknownObjectRelease();
          *(_QWORD *)v61 = v13;
          *(_BYTE *)(v61 + 8) = 1;
          return result;
        }
        if (v17 > v18)
          break;
LABEL_71:
        __break(1u);
LABEL_72:
        v22 = sub_23C1C4B88(MEMORY[0x24BEE4AF8]);
LABEL_21:
        v18 = 0;
        v21 = (uint64_t)(v22 + 4);
        v17 = v22[2];
      }
      v29 = (void *)*MEMORY[0x24BE07E50];
      v30 = (id *)(v21 + 8 * v18);
      p_types = &stru_250D12FF8.types;
      while (1)
      {
        v37 = *v30;
        v38 = objc_msgSend(v37, p_types[224]);
        if (!v38)
          break;
        v39 = v38;
        v40 = sub_23C1FBCCC();
        v42 = v41;
        if (v40 == sub_23C1FBCCC() && v42 == v43)
        {
          v50 = v29;

          swift_bridgeObjectRelease_n();
        }
        else
        {
          v63 = sub_23C1FBF90();
          v45 = v29;
          v46 = v13;
          v47 = v29;
          v48 = p_types;
          v49 = v45;

          p_types = v48;
          v29 = v47;
          v13 = v46;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v63 & 1) == 0)
            break;
        }
        v52 = *(_QWORD *)(v13 + 16);
        v51 = *(_QWORD *)(v13 + 24);
        if (v52 >= v51 >> 1)
          v13 = (uint64_t)sub_23C1C45B4((_QWORD *)(v51 > 1), v52 + 1, 1, (_QWORD *)v13);
        *(_QWORD *)(v13 + 16) = v52 + 1;
        v53 = v13 + 24 * v52;
        *(_QWORD *)(v53 + 32) = v62;
        v36 = v53 + 32;
        v34 = 0x80;
LABEL_30:
        *(_QWORD *)(v36 + 8) = 1;
        *(_BYTE *)(v36 + 16) = v34;

        ++v30;
        if (!--v27)
          goto LABEL_24;
      }
      v33 = *(_QWORD *)(v13 + 16);
      v32 = *(_QWORD *)(v13 + 24);
      if (v33 >= v32 >> 1)
        v13 = (uint64_t)sub_23C1C45B4((_QWORD *)(v32 > 1), v33 + 1, 1, (_QWORD *)v13);
      v34 = 0;
      *(_QWORD *)(v13 + 16) = v33 + 1;
      v35 = v13 + 24 * v33;
      *(_QWORD *)(v35 + 32) = 0;
      v36 = v35 + 32;
      goto LABEL_30;
    }
    goto LABEL_70;
  }
  swift_bridgeObjectRetain();
  v17 = sub_23C1FBE88();
  result = swift_bridgeObjectRelease();
  if ((v17 & 0x8000000000000000) == 0)
  {
    if (v17 >= 1)
      v18 = 1;
    else
      v18 = v17;
    swift_bridgeObjectRetain();
    v59 = sub_23C1FBE88();
    swift_bridgeObjectRelease();
    if (v59 >= v18)
    {
      swift_bridgeObjectRetain();
      v60 = sub_23C1FBE88();
      swift_bridgeObjectRelease();
      if (v60 >= v17)
        goto LABEL_14;
      __break(1u);
    }
LABEL_70:
    __break(1u);
    goto LABEL_71;
  }
  __break(1u);
  return result;
}

uint64_t MarketingOfferTemplate.encode(to:)(_QWORD *a1)
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
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char v24;
  char v25;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41148);
  v17 = *(_QWORD *)(v3 - 8);
  v18 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41150);
  v16 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41158);
  v20 = *(_QWORD *)(v9 - 8);
  v21 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = *v1;
  v12 = *((_BYTE *)v1 + 8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C1C4CB8();
  sub_23C1FC014();
  if ((v12 & 1) != 0)
  {
    v25 = 1;
    sub_23C1C4CFC();
    v13 = v21;
    sub_23C1FBF30();
    v22 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B41170);
    sub_23C1C4E0C(&qword_256B41178, (uint64_t (*)(void))sub_23C1C4D40, MEMORY[0x24BEE12A0]);
    v14 = v18;
    sub_23C1FBF78();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v5, v14);
  }
  else
  {
    v24 = 0;
    sub_23C1C4D84();
    v13 = v21;
    sub_23C1FBF30();
    v23 = v19;
    sub_23C1C4DC8();
    sub_23C1FBF78();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v8, v6);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v11, v13);
}

uint64_t MarketingOfferTemplate.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
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
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  unsigned __int8 v34;
  char v35;
  char v36;

  v27 = a2;
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41198);
  v28 = *(_QWORD *)(v30 - 8);
  MEMORY[0x24BDAC7A8](v30);
  v29 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B411A0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B411A8);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a1[3];
  v31 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v12);
  sub_23C1C4CB8();
  v13 = v32;
  sub_23C1FC008();
  if (!v13)
  {
    v26 = v5;
    v14 = v4;
    v15 = v29;
    v16 = v30;
    v32 = v9;
    v17 = sub_23C1FBF24();
    if (*(_QWORD *)(v17 + 16) == 1)
    {
      if ((*(_BYTE *)(v17 + 32) & 1) != 0)
      {
        LODWORD(v26) = *(unsigned __int8 *)(v17 + 32);
        v36 = 1;
        sub_23C1C4CFC();
        sub_23C1FBEC4();
        __swift_instantiateConcreteTypeFromMangledName(&qword_256B41170);
        sub_23C1C4E0C(&qword_256B411B0, (uint64_t (*)(void))sub_23C1C4E74, MEMORY[0x24BEE12D0]);
        sub_23C1FBF18();
        (*(void (**)(char *, uint64_t))(v28 + 8))(v15, v16);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v32 + 8))(v11, v8);
        v18 = v33;
        v19 = v26;
      }
      else
      {
        v19 = *(_BYTE *)(v17 + 32);
        v35 = 0;
        sub_23C1C4D84();
        sub_23C1FBEC4();
        sub_23C1C4EB8();
        sub_23C1FBF18();
        v24 = v32;
        (*(void (**)(char *, uint64_t))(v26 + 8))(v7, v14);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v24 + 8))(v11, v8);
        v18 = v34;
      }
      v25 = v27;
      *v27 = v18;
      *((_BYTE *)v25 + 8) = v19;
    }
    else
    {
      v20 = sub_23C1FBE58();
      swift_allocError();
      v22 = v21;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256B40A48);
      *v22 = &type metadata for MarketingOfferTemplate;
      sub_23C1FBED0();
      sub_23C1FBE4C();
      (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v20 - 8) + 104))(v22, *MEMORY[0x24BEE26D0], v20);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v32 + 8))(v11, v8);
    }
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
}

uint64_t sub_23C1C435C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return MarketingOfferTemplate.init(from:)(a1, a2);
}

uint64_t sub_23C1C4370(_QWORD *a1)
{
  return MarketingOfferTemplate.encode(to:)(a1);
}

uint64_t MarketingOfferTemplate.hash(into:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)v1;
  if ((*(_BYTE *)(v1 + 8) & 1) != 0)
  {
    sub_23C1FBFD8();
    return sub_23C1BA6BC(a1, v3);
  }
  else
  {
    sub_23C1FBFD8();
    return sub_23C1FBFD8();
  }
}

uint64_t MarketingOfferTemplate.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  _BYTE v4[72];

  v1 = *(_QWORD *)v0;
  v2 = *(_BYTE *)(v0 + 8);
  sub_23C1FBFCC();
  sub_23C1FBFD8();
  if ((v2 & 1) != 0)
    sub_23C1BA6BC((uint64_t)v4, v1);
  else
    sub_23C1FBFD8();
  return sub_23C1FBFFC();
}

uint64_t sub_23C1C4464()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  _BYTE v4[72];

  v1 = *(_QWORD *)v0;
  v2 = *(_BYTE *)(v0 + 8);
  sub_23C1FBFCC();
  sub_23C1FBFD8();
  if ((v2 & 1) != 0)
    sub_23C1BA6BC((uint64_t)v4, v1);
  else
    sub_23C1FBFD8();
  return sub_23C1FBFFC();
}

uint64_t sub_23C1C44D8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)v1;
  if ((*(_BYTE *)(v1 + 8) & 1) != 0)
  {
    sub_23C1FBFD8();
    return sub_23C1BA6BC(a1, v3);
  }
  else
  {
    sub_23C1FBFD8();
    return sub_23C1FBFD8();
  }
}

uint64_t sub_23C1C4540()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  _BYTE v4[72];

  v1 = *(_QWORD *)v0;
  v2 = *(_BYTE *)(v0 + 8);
  sub_23C1FBFCC();
  sub_23C1FBFD8();
  if ((v2 & 1) != 0)
    sub_23C1BA6BC((uint64_t)v4, v1);
  else
    sub_23C1FBFD8();
  return sub_23C1FBFFC();
}

_QWORD *sub_23C1C45B4(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_256B41128);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[3 * v8 + 4])
          memmove(v12, a4 + 4, 24 * v8);
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
    sub_23C1C591C(0, v8, (char *)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_23C1C46D4(char a1, int64_t a2, char a3, unint64_t a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B41218);
  v10 = *(_QWORD *)(type metadata accessor for MarketingActionItem() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_23C1FBE70();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(type metadata accessor for MarketingActionItem() - 8);
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
    sub_23C1C5A08(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_23C1C48DC(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_23C1C4904(a1, a2, a3, a4, &qword_256B41240, &qword_256B41248);
}

uint64_t sub_23C1C48F0(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_23C1C4904(a1, a2, a3, a4, &qword_256B41230, &qword_256B41238);
}

uint64_t sub_23C1C4904(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t *a6)
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
    result = sub_23C1FBE70();
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
    sub_23C1C5B24(0, v11, v21, a4, a6);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v16;
}

uint64_t sub_23C1C4B10(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_23C1C4904(a1, a2, a3, a4, &qword_256B41220, &qword_256B41228);
}

unint64_t sub_23C1C4B24(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23C1FBFCC();
  sub_23C1FBCF0();
  v4 = sub_23C1FBFFC();
  return sub_23C1C4EFC(a1, a2, v4);
}

_QWORD *sub_23C1C4B88(unint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = a1;
  if (a1 >> 62)
    goto LABEL_10;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  while (1)
  {
    if (v2 <= 0)
    {
      v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_256B41250);
      v3 = (_QWORD *)swift_allocObject();
      v4 = _swift_stdlib_malloc_size(v3);
      v5 = v4 - 32;
      if (v4 < 32)
        v5 = v4 - 25;
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_23C1C4FDC((unint64_t)(v3 + 4), v2, v1);
    v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2)
      break;
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    v2 = sub_23C1FBE88();
    swift_bridgeObjectRelease();
    if (!v2)
      return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t sub_23C1C4C7C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_23C1C4CB8()
{
  unint64_t result;

  result = qword_256B41160;
  if (!qword_256B41160)
  {
    result = MEMORY[0x242619B10](&unk_23C1FEFAC, &type metadata for MarketingOfferTemplate.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41160);
  }
  return result;
}

unint64_t sub_23C1C4CFC()
{
  unint64_t result;

  result = qword_256B41168;
  if (!qword_256B41168)
  {
    result = MEMORY[0x242619B10](&unk_23C1FEF5C, &type metadata for MarketingOfferTemplate.HeaderCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41168);
  }
  return result;
}

unint64_t sub_23C1C4D40()
{
  unint64_t result;

  result = qword_256B41180;
  if (!qword_256B41180)
  {
    result = MEMORY[0x242619B10](&protocol conformance descriptor for MarketingOfferTemplateItem, &type metadata for MarketingOfferTemplateItem);
    atomic_store(result, (unint64_t *)&qword_256B41180);
  }
  return result;
}

unint64_t sub_23C1C4D84()
{
  unint64_t result;

  result = qword_256B41188;
  if (!qword_256B41188)
  {
    result = MEMORY[0x242619B10](&unk_23C1FEF0C, &type metadata for MarketingOfferTemplate.DynamicActionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41188);
  }
  return result;
}

unint64_t sub_23C1C4DC8()
{
  unint64_t result;

  result = qword_256B41190;
  if (!qword_256B41190)
  {
    result = MEMORY[0x242619B10](&protocol conformance descriptor for MarketingPlatform, &type metadata for MarketingPlatform);
    atomic_store(result, (unint64_t *)&qword_256B41190);
  }
  return result;
}

uint64_t sub_23C1C4E0C(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41170);
    v8 = a2();
    result = MEMORY[0x242619B10](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23C1C4E74()
{
  unint64_t result;

  result = qword_256B411B8;
  if (!qword_256B411B8)
  {
    result = MEMORY[0x242619B10](&protocol conformance descriptor for MarketingOfferTemplateItem, &type metadata for MarketingOfferTemplateItem);
    atomic_store(result, (unint64_t *)&qword_256B411B8);
  }
  return result;
}

unint64_t sub_23C1C4EB8()
{
  unint64_t result;

  result = qword_256B411C0;
  if (!qword_256B411C0)
  {
    result = MEMORY[0x242619B10](&protocol conformance descriptor for MarketingPlatform, &type metadata for MarketingPlatform);
    atomic_store(result, (unint64_t *)&qword_256B411C0);
  }
  return result;
}

unint64_t sub_23C1C4EFC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_23C1FBF90() & 1) == 0)
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
      while (!v14 && (sub_23C1FBF90() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_23C1C4FDC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  void (*v12)(_QWORD *);
  id *v13;
  id v14;
  uint64_t result;
  void (*v16[4])(id *);

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_23C1FBE88();
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
    v10 = sub_23C1FBE88();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_23C1C5C3C();
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_256B41258);
          v12 = sub_23C1DD974(v16, i, a3);
          v14 = *v13;
          ((void (*)(void (**)(id *), _QWORD))v12)(v16, 0);
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
    sub_23C1C5C88(0, &qword_256B41130);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_23C1FBEAC();
  __break(1u);
  return result;
}

BOOL _s16FitnessMarketing0B13OfferTemplateO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;

  v2 = *(_QWORD *)a1;
  v3 = *(_BYTE *)(a1 + 8);
  v4 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a2 + 8);
  if ((v3 & 1) != 0)
  {
    v6 = *(_QWORD *)a1;
    if ((*(_BYTE *)(a2 + 8) & 1) != 0)
    {
      v7 = sub_23C1C3304(v6, *(_QWORD *)a2);
      sub_23C1C5348(v4, 1);
      sub_23C1C5348(v2, 1);
      sub_23C1C5364(v2, 1);
      sub_23C1C5364(v4, 1);
      return v7 & 1;
    }
    swift_bridgeObjectRetain();
  }
  else if ((*(_BYTE *)(a2 + 8) & 1) == 0)
  {
    sub_23C1C5364(*(_QWORD *)a1, 0);
    sub_23C1C5364(v4, 0);
    return v4 == v2;
  }
  sub_23C1C5348(v4, v5);
  sub_23C1C5364(v2, v3);
  sub_23C1C5364(v4, v5);
  return 0;
}

unint64_t sub_23C1C52C0()
{
  unint64_t result;

  result = qword_256B411C8;
  if (!qword_256B411C8)
  {
    result = MEMORY[0x242619B10](&protocol conformance descriptor for MarketingOfferTemplate, &type metadata for MarketingOfferTemplate);
    atomic_store(result, (unint64_t *)&qword_256B411C8);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for MarketingOfferTemplate(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;

  v3 = *(_QWORD *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  sub_23C1C5348(*(_QWORD *)a2, v4);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  return a1;
}

uint64_t sub_23C1C5348(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) != 0)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t destroy for MarketingOfferTemplate(uint64_t a1)
{
  return sub_23C1C5364(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
}

uint64_t sub_23C1C5364(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t assignWithCopy for MarketingOfferTemplate(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  char v6;

  v3 = *(_QWORD *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  sub_23C1C5348(*(_QWORD *)a2, v4);
  v5 = *(_QWORD *)a1;
  v6 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  sub_23C1C5364(v5, v6);
  return a1;
}

uint64_t assignWithTake for MarketingOfferTemplate(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  char v6;

  v3 = *a2;
  v4 = *((_BYTE *)a2 + 8);
  v5 = *(_QWORD *)a1;
  v6 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  sub_23C1C5364(v5, v6);
  return a1;
}

ValueMetadata *type metadata accessor for MarketingOfferTemplate()
{
  return &type metadata for MarketingOfferTemplate;
}

uint64_t storeEnumTagSinglePayload for MarketingOfferTemplate.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C1C5458 + 4 * byte_23C1FEBA5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C1C548C + 4 * byte_23C1FEBA0[v4]))();
}

uint64_t sub_23C1C548C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1C5494(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C1C549CLL);
  return result;
}

uint64_t sub_23C1C54A8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C1C54B0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C1C54B4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1C54BC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MarketingOfferTemplate.CodingKeys()
{
  return &type metadata for MarketingOfferTemplate.CodingKeys;
}

ValueMetadata *type metadata accessor for MarketingOfferTemplate.DynamicActionCodingKeys()
{
  return &type metadata for MarketingOfferTemplate.DynamicActionCodingKeys;
}

uint64_t _s16FitnessMarketing22MarketingOfferTemplateO23DynamicActionCodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23C1C552C + 4 * byte_23C1FEBAA[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23C1C554C + 4 * byte_23C1FEBAF[v4]))();
}

_BYTE *sub_23C1C552C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23C1C554C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C1C5554(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C1C555C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C1C5564(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C1C556C(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for MarketingOfferTemplate.HeaderCodingKeys()
{
  return &type metadata for MarketingOfferTemplate.HeaderCodingKeys;
}

unint64_t sub_23C1C558C()
{
  unint64_t result;

  result = qword_256B411D0;
  if (!qword_256B411D0)
  {
    result = MEMORY[0x242619B10](&unk_23C1FED74, &type metadata for MarketingOfferTemplate.HeaderCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B411D0);
  }
  return result;
}

unint64_t sub_23C1C55D4()
{
  unint64_t result;

  result = qword_256B411D8;
  if (!qword_256B411D8)
  {
    result = MEMORY[0x242619B10](&unk_23C1FEE2C, &type metadata for MarketingOfferTemplate.DynamicActionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B411D8);
  }
  return result;
}

unint64_t sub_23C1C561C()
{
  unint64_t result;

  result = qword_256B411E0;
  if (!qword_256B411E0)
  {
    result = MEMORY[0x242619B10](&unk_23C1FEEE4, &type metadata for MarketingOfferTemplate.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B411E0);
  }
  return result;
}

unint64_t sub_23C1C5664()
{
  unint64_t result;

  result = qword_256B411E8;
  if (!qword_256B411E8)
  {
    result = MEMORY[0x242619B10](&unk_23C1FED9C, &type metadata for MarketingOfferTemplate.DynamicActionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B411E8);
  }
  return result;
}

unint64_t sub_23C1C56AC()
{
  unint64_t result;

  result = qword_256B411F0;
  if (!qword_256B411F0)
  {
    result = MEMORY[0x242619B10](&unk_23C1FEDC4, &type metadata for MarketingOfferTemplate.DynamicActionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B411F0);
  }
  return result;
}

unint64_t sub_23C1C56F4()
{
  unint64_t result;

  result = qword_256B411F8;
  if (!qword_256B411F8)
  {
    result = MEMORY[0x242619B10](&unk_23C1FECE4, &type metadata for MarketingOfferTemplate.HeaderCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B411F8);
  }
  return result;
}

unint64_t sub_23C1C573C()
{
  unint64_t result;

  result = qword_256B41200;
  if (!qword_256B41200)
  {
    result = MEMORY[0x242619B10](&unk_23C1FED0C, &type metadata for MarketingOfferTemplate.HeaderCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41200);
  }
  return result;
}

unint64_t sub_23C1C5784()
{
  unint64_t result;

  result = qword_256B41208;
  if (!qword_256B41208)
  {
    result = MEMORY[0x242619B10](&unk_23C1FEE54, &type metadata for MarketingOfferTemplate.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41208);
  }
  return result;
}

unint64_t sub_23C1C57CC()
{
  unint64_t result;

  result = qword_256B41210;
  if (!qword_256B41210)
  {
    result = MEMORY[0x242619B10](&unk_23C1FEE7C, &type metadata for MarketingOfferTemplate.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41210);
  }
  return result;
}

uint64_t sub_23C1C5810(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x4163696D616E7964 && a2 == 0xED00006E6F697463;
  if (v2 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x726564616568 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23C1FBF90();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

char *sub_23C1C591C(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
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
    v5 = (char *)(a4 + 24 * a1 + 32);
    v6 = 24 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_23C1FBEAC();
  __break(1u);
  return result;
}

uint64_t sub_23C1C5A08(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v8 = *(_QWORD *)(type metadata accessor for MarketingActionItem() - 8);
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
  result = sub_23C1FBEAC();
  __break(1u);
  return result;
}

uint64_t sub_23C1C5B24(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
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
  result = sub_23C1FBEAC();
  __break(1u);
  return result;
}

unint64_t sub_23C1C5C3C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256B41260;
  if (!qword_256B41260)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41258);
    result = MEMORY[0x242619B10](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_256B41260);
  }
  return result;
}

uint64_t sub_23C1C5C88(uint64_t a1, unint64_t *a2)
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

uint64_t MarketingOfferTemplateParserType.makeParser(template:)(uint64_t a1)
{
  uint64_t v1;
  char v2;
  uint64_t v3;

  v1 = *(_QWORD *)a1;
  v2 = *(_BYTE *)(a1 + 8);
  type metadata accessor for MarketingOfferTemplateDefaultParser();
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = v1;
  *(_BYTE *)(v3 + 24) = v2;
  sub_23C1C5348(v1, v2);
  return v3;
}

unint64_t destroy for MarketingError(uint64_t a1)
{
  unint64_t result;
  int v2;

  result = *(_QWORD *)(a1 + 16);
  v2 = -1;
  if (result < 0xFFFFFFFF)
    v2 = result;
  if (v2 - 1 < 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s16FitnessMarketing14MarketingErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 16);
  LODWORD(v4) = -1;
  if (v3 < 0xFFFFFFFF)
    v4 = *(_QWORD *)(a2 + 16);
  if ((int)v4 - 1 < 0)
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(a1 + 16) = v3;
    swift_bridgeObjectRetain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  }
  return a1;
}

uint64_t assignWithCopy for MarketingError(uint64_t a1, __int128 *a2)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  __int128 v8;

  LODWORD(v4) = -1;
  if (*(_QWORD *)(a1 + 16) >= 0xFFFFFFFFuLL)
    LODWORD(v5) = -1;
  else
    v5 = *(_QWORD *)(a1 + 16);
  v6 = v5 - 1;
  if (*((_QWORD *)a2 + 2) < 0xFFFFFFFFuLL)
    v4 = *((_QWORD *)a2 + 2);
  v7 = v4 - 1;
  if (v6 < 0)
  {
    if (v7 < 0)
    {
      *(_BYTE *)a1 = *(_BYTE *)a2;
      *(_QWORD *)(a1 + 8) = *((_QWORD *)a2 + 1);
      *(_QWORD *)(a1 + 16) = *((_QWORD *)a2 + 2);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      return a1;
    }
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  if ((v7 & 0x80000000) == 0)
  {
LABEL_11:
    v8 = *a2;
    *(_QWORD *)(a1 + 16) = *((_QWORD *)a2 + 2);
    *(_OWORD *)a1 = v8;
    return a1;
  }
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *((_QWORD *)a2 + 1);
  *(_QWORD *)(a1 + 16) = *((_QWORD *)a2 + 2);
  swift_bridgeObjectRetain();
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

uint64_t assignWithTake for MarketingError(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  int v5;
  unint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a1 + 16);
  v5 = -1;
  if (v4 < 0xFFFFFFFF)
    v5 = v4;
  if (v5 - 1 < 0)
  {
    v6 = *(_QWORD *)(a2 + 16);
    LODWORD(v7) = -1;
    if (v6 < 0xFFFFFFFF)
      v7 = *(_QWORD *)(a2 + 16);
    if ((int)v7 - 1 < 0)
    {
      *(_BYTE *)a1 = *(_BYTE *)a2;
      *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
      *(_QWORD *)(a1 + 16) = v6;
      swift_bridgeObjectRelease();
      return a1;
    }
    swift_bridgeObjectRelease();
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for MarketingError(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;
  unsigned int v5;
  unsigned int v6;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFD && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 2147483645);
  v3 = *(_QWORD *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  v5 = v4 + 1;
  v6 = v4 - 1;
  if (v5 >= 3)
    return v6;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for MarketingError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFD)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_DWORD *)result = a2 - 2147483645;
    if (a3 >= 0x7FFFFFFD)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFD)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
      *(_QWORD *)(result + 16) = a2 + 2;
  }
  return result;
}

uint64_t sub_23C1C5FB4(uint64_t a1)
{
  unint64_t v1;
  int v2;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  v2 = v1 - 1;
  if (v2 < 0)
    v2 = -1;
  return (v2 + 1);
}

_QWORD *sub_23C1C5FD8(_QWORD *result, unsigned int a2)
{
  if (a2 > 0x7FFFFFFE)
  {
    result[1] = 0;
    result[2] = 0;
    *result = a2 - 0x7FFFFFFF;
  }
  else if (a2)
  {
    result[2] = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for MarketingError()
{
  return &type metadata for MarketingError;
}

uint64_t sub_23C1C6018@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
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
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(char *, char *, uint64_t);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  id v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(char *, char *, uint64_t);
  uint64_t v52;
  int v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41DA0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v54 = (char *)&v54 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v54 - v7;
  v9 = sub_23C1FB468();
  v55 = *(_QWORD *)(v9 - 8);
  v56 = v9;
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v54 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v54 - v16;
  v18 = type metadata accessor for MarketingAction();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v54 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = objc_msgSend(a1, sel_type);
  if (!v22)
  {

    goto LABEL_11;
  }
  v23 = v22;
  v58 = a2;
  v59 = v19;
  v57 = v18;
  v24 = sub_23C1FBCCC();
  v26 = v25;
  if (v24 == sub_23C1FBCCC() && v26 == v27)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_13;
  }
  v29 = sub_23C1FBF90();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v29 & 1) != 0)
  {
LABEL_13:
    if (objc_msgSend(a1, sel_buyParams))
    {
      sub_23C1C80C0();
      sub_23C1FB51C();

LABEL_15:
      v18 = v57;
      a2 = v58;
      v19 = v59;
LABEL_16:
      swift_storeEnumTagMultiPayload();
      sub_23C1B43AC((uint64_t)v21, a2);
      v34 = 0;
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56))(a2, v34, 1, v18);
    }

LABEL_24:
    v34 = 1;
    v18 = v57;
    a2 = v58;
    v19 = v59;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56))(a2, v34, 1, v18);
  }
  v30 = sub_23C1FBCCC();
  v32 = v31;
  if (v30 == sub_23C1FBCCC() && v32 == v33)
  {
    swift_bridgeObjectRelease_n();
LABEL_19:
    v36 = objc_msgSend(a1, sel_url);
    if (v36)
    {
      v37 = v36;
      sub_23C1FB450();

      v39 = v55;
      v38 = v56;
      v40 = *(void (**)(char *, char *, uint64_t))(v55 + 32);
      v40(v8, v15, v56);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v39 + 56))(v8, 0, 1, v38);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v39 + 48))(v8, 1, v38) != 1)
      {
        v40(v17, v8, v38);
        v40(v21, v17, v38);
        goto LABEL_15;
      }
    }
    else
    {

      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v55 + 56))(v8, 1, 1, v56);
    }
    sub_23C1BC2EC((uint64_t)v8, &qword_256B41DA0);
    goto LABEL_24;
  }
  v35 = sub_23C1FBF90();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v35 & 1) != 0)
    goto LABEL_19;
  v42 = sub_23C1FBCCC();
  v44 = v43;
  if (v42 == sub_23C1FBCCC() && v44 == v45)
  {
    swift_bridgeObjectRelease_n();
    v19 = v59;
  }
  else
  {
    v46 = sub_23C1FBF90();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v19 = v59;
    if ((v46 & 1) == 0)
    {

      v34 = 1;
      v18 = v57;
      a2 = v58;
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56))(a2, v34, 1, v18);
    }
  }
  v47 = objc_msgSend(a1, sel_url);
  if (v47)
  {
    v48 = v47;
    sub_23C1FB450();

    v50 = (uint64_t)v54;
    v49 = v55;
    v51 = *(void (**)(char *, char *, uint64_t))(v55 + 32);
    v52 = v56;
    v51(v54, v15, v56);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v49 + 56))(v50, 0, 1, v52);
    v53 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v49 + 48))(v50, 1, v52);
    v18 = v57;
    a2 = v58;
    if (v53 != 1)
    {
      v51(v12, (char *)v50, v52);
      v51(v21, v12, v52);
      goto LABEL_16;
    }
  }
  else
  {

    v50 = (uint64_t)v54;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v55 + 56))(v54, 1, 1, v56);
    v18 = v57;
    a2 = v58;
  }
  sub_23C1BC2EC(v50, &qword_256B41DA0);
LABEL_11:
  v34 = 1;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56))(a2, v34, 1, v18);
}

uint64_t sub_23C1C6564()
{
  return 0x736D61726170;
}

uint64_t sub_23C1C6578@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x736D61726170 && a2 == 0xE600000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_23C1FBF90();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_23C1C6604()
{
  sub_23C1C7AFC();
  return sub_23C1FC020();
}

uint64_t sub_23C1C662C()
{
  sub_23C1C7AFC();
  return sub_23C1FC02C();
}

uint64_t sub_23C1C6654()
{
  return 12383;
}

uint64_t sub_23C1C6664()
{
  sub_23C1C7AB8();
  return sub_23C1FC020();
}

uint64_t sub_23C1C668C()
{
  sub_23C1C7AB8();
  return sub_23C1FC02C();
}

uint64_t sub_23C1C66B4()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x4C72656972726163;
  if (*v0 != 1)
    v1 = 1802398060;
  if (*v0)
    return v1;
  else
    return 7959906;
}

uint64_t sub_23C1C6708@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C1C8678(a1, a2);
  *a3 = result;
  return result;
}

void sub_23C1C672C(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_23C1C6738()
{
  sub_23C1C79EC();
  return sub_23C1FC020();
}

uint64_t sub_23C1C6760()
{
  sub_23C1C79EC();
  return sub_23C1FC02C();
}

uint64_t sub_23C1C6788@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
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
    v5 = sub_23C1FBF90();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_23C1C6804()
{
  sub_23C1C7A74();
  return sub_23C1FC020();
}

uint64_t sub_23C1C682C()
{
  sub_23C1C7A74();
  return sub_23C1FC02C();
}

uint64_t MarketingAction.encode(to:)(_QWORD *a1)
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  int EnumCaseMultiPayload;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  char v55;
  char v56;

  v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41278);
  v38 = *(_QWORD *)(v50 - 8);
  MEMORY[0x24BDAC7A8](v50);
  v49 = (char *)&v37 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41280);
  v46 = *(_QWORD *)(v48 - 8);
  MEMORY[0x24BDAC7A8](v48);
  v45 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_23C1FB468();
  v51 = *(_QWORD *)(v4 - 8);
  v52 = v4;
  v5 = MEMORY[0x24BDAC7A8](v4);
  v44 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v47 = (char *)&v37 - v7;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41288);
  v42 = *(_QWORD *)(v8 - 8);
  v43 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v41 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40928);
  v39 = *(_QWORD *)(v10 - 8);
  v40 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for MarketingAction();
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41290);
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C1C79EC();
  sub_23C1FC014();
  sub_23C1C7A30(v53, (uint64_t)v15);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    v53 = v17;
    v22 = v51;
    v21 = v52;
    if (EnumCaseMultiPayload == 1)
    {
      v23 = v47;
      (*(void (**)(char *, char *, uint64_t))(v51 + 32))(v47, v15, v52);
      v55 = 1;
      sub_23C1C7AB8();
      v24 = v45;
      v25 = v16;
      v26 = v19;
      sub_23C1FBF30();
      sub_23C1B56F4(&qword_256B40EF0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAE0]);
      v27 = v48;
      sub_23C1FBF78();
      (*(void (**)(char *, uint64_t))(v46 + 8))(v24, v27);
    }
    else
    {
      v33 = v44;
      (*(void (**)(char *, char *, uint64_t))(v51 + 32))(v44, v15, v52);
      v56 = 2;
      sub_23C1C7A74();
      v34 = v49;
      v25 = v16;
      v26 = v19;
      sub_23C1FBF30();
      sub_23C1B56F4(&qword_256B40EF0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAE0]);
      v35 = v50;
      sub_23C1FBF78();
      (*(void (**)(char *, uint64_t))(v38 + 8))(v34, v35);
      v23 = v33;
    }
    v36 = v53;
    (*(void (**)(char *, uint64_t))(v22 + 8))(v23, v21);
    return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v26, v25);
  }
  else
  {
    v29 = v39;
    v28 = v40;
    (*(void (**)(char *, char *, uint64_t))(v39 + 32))(v12, v15, v40);
    v54 = 0;
    sub_23C1C7AFC();
    v30 = v41;
    sub_23C1FBF30();
    sub_23C1C7B40(&qword_256B412B8, MEMORY[0x24BE37A28]);
    v31 = v43;
    sub_23C1FBF78();
    (*(void (**)(char *, uint64_t))(v42 + 8))(v30, v31);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v12, v28);
    return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  }
}

uint64_t MarketingAction.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  char *v49;
  char *v50;
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
  uint64_t v61;
  char *v62;
  char *v63;
  _QWORD *v64;
  char *v65;
  char v66;
  char v67;
  char v68;

  v57 = a2;
  v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B412C0);
  v56 = *(_QWORD *)(v53 - 8);
  MEMORY[0x24BDAC7A8](v53);
  v62 = (char *)&v48 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B412C8);
  v54 = *(_QWORD *)(v4 - 8);
  v55 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v58 = (char *)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B412D0);
  v51 = *(_QWORD *)(v6 - 8);
  v52 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v60 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B412D8);
  v59 = *(_QWORD *)(v61 - 8);
  MEMORY[0x24BDAC7A8](v61);
  v9 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for MarketingAction();
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v48 - v15;
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)&v48 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v48 - v20;
  v22 = a1[3];
  v64 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v22);
  sub_23C1C79EC();
  v63 = v9;
  v23 = (uint64_t)v65;
  sub_23C1FC008();
  if (v23)
    goto LABEL_7;
  v48 = v16;
  v49 = v19;
  v50 = v13;
  v25 = v62;
  v24 = v63;
  v65 = v21;
  v26 = v10;
  v28 = v60;
  v27 = v61;
  v29 = sub_23C1FBF24();
  if (*(_QWORD *)(v29 + 16) != 1)
  {
    v32 = sub_23C1FBE58();
    swift_allocError();
    v34 = v33;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B40A48);
    *v34 = v26;
    sub_23C1FBED0();
    sub_23C1FBE4C();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v32 - 8) + 104))(v34, *MEMORY[0x24BEE26D0], v32);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v59 + 8))(v24, v27);
LABEL_7:
    v40 = (uint64_t)v64;
    return __swift_destroy_boxed_opaque_existential_1(v40);
  }
  v30 = v24;
  if (*(_BYTE *)(v29 + 32))
  {
    if (*(_BYTE *)(v29 + 32) == 1)
    {
      v67 = 1;
      sub_23C1C7AB8();
      v31 = v58;
      sub_23C1FBEC4();
      sub_23C1FB468();
      v37 = v31;
      sub_23C1B56F4(&qword_256B40F08, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB10]);
      v38 = (uint64_t)v48;
      v39 = v55;
      sub_23C1FBF18();
      (*(void (**)(char *, uint64_t))(v54 + 8))(v37, v39);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v59 + 8))(v30, v27);
      v40 = (uint64_t)v64;
      swift_storeEnumTagMultiPayload();
      v41 = v38;
    }
    else
    {
      v68 = 2;
      sub_23C1C7A74();
      sub_23C1FBEC4();
      v43 = v25;
      sub_23C1FB468();
      sub_23C1B56F4(&qword_256B40F08, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB10]);
      v44 = (uint64_t)v50;
      v45 = v53;
      sub_23C1FBF18();
      v46 = v59;
      (*(void (**)(char *, uint64_t))(v56 + 8))(v43, v45);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v46 + 8))(v30, v27);
      swift_storeEnumTagMultiPayload();
      v41 = v44;
      v40 = (uint64_t)v64;
    }
  }
  else
  {
    v66 = 0;
    sub_23C1C7AFC();
    v36 = v27;
    sub_23C1FBEC4();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B40928);
    sub_23C1C7B40(&qword_256B412E0, MEMORY[0x24BE37A38]);
    v41 = (uint64_t)v49;
    v42 = v52;
    sub_23C1FBF18();
    (*(void (**)(char *, uint64_t))(v51 + 8))(v28, v42);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v59 + 8))(v24, v36);
    v40 = (uint64_t)v64;
    swift_storeEnumTagMultiPayload();
  }
  v47 = (uint64_t)v65;
  sub_23C1B43AC(v41, (uint64_t)v65);
  sub_23C1B43AC(v47, v57);
  return __swift_destroy_boxed_opaque_existential_1(v40);
}

uint64_t sub_23C1C73A0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return MarketingAction.init(from:)(a1, a2);
}

uint64_t sub_23C1C73B4(_QWORD *a1)
{
  return MarketingAction.encode(to:)(a1);
}

uint64_t MarketingAction.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v12;

  v1 = sub_23C1FB468();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40928);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MarketingAction();
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23C1C7A30(v0, (uint64_t)v10);
  if (swift_getEnumCaseMultiPayload())
  {
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v4, v10, v1);
    sub_23C1FBFD8();
    sub_23C1B56F4(&qword_256B40CB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
    sub_23C1FBC90();
    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v10, v5);
    sub_23C1FBFD8();
    sub_23C1C7B40(&qword_256B40CC0, MEMORY[0x24BE37A30]);
    sub_23C1FBC90();
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
}

uint64_t MarketingAction.hashValue.getter()
{
  sub_23C1FBFCC();
  MarketingAction.hash(into:)();
  return sub_23C1FBFFC();
}

uint64_t sub_23C1C75E4()
{
  sub_23C1FBFCC();
  MarketingAction.hash(into:)();
  return sub_23C1FBFFC();
}

uint64_t sub_23C1C7624()
{
  sub_23C1FBFCC();
  MarketingAction.hash(into:)();
  return sub_23C1FBFFC();
}

uint64_t _s16FitnessMarketing0B6ActionO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  int EnumCaseMultiPayload;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char v29;
  void (*v30)(char *, uint64_t);
  char *v31;
  uint64_t v32;
  char *v33;
  void (*v34)(char *, uint64_t);
  char *v35;
  void (*v36)(char *, uint64_t);
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v43 = a2;
  v3 = sub_23C1FB468();
  v41 = *(_QWORD *)(v3 - 8);
  v42 = v3;
  v4 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v40 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v39 = (char *)&v38 - v6;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40928);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for MarketingAction();
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&v38 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v38 - v18;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41268);
  v21 = MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)&v38 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = (uint64_t)&v23[*(int *)(v21 + 48)];
  sub_23C1C7A30(a1, (uint64_t)v23);
  sub_23C1C7A30(v43, v24);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      sub_23C1C7A30((uint64_t)v23, (uint64_t)v17);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        v26 = v41;
        v27 = v42;
        v28 = v39;
        (*(void (**)(char *, uint64_t, uint64_t))(v41 + 32))(v39, v24, v42);
        v29 = MEMORY[0x242618B14](v17, v28);
        v30 = *(void (**)(char *, uint64_t))(v26 + 8);
        v30(v28, v27);
        v31 = v17;
LABEL_9:
        v30(v31, v27);
LABEL_15:
        sub_23C1C7E54((uint64_t)v23);
        return v29 & 1;
      }
      v34 = *(void (**)(char *, uint64_t))(v41 + 8);
      v35 = v17;
    }
    else
    {
      sub_23C1C7A30((uint64_t)v23, (uint64_t)v14);
      if (swift_getEnumCaseMultiPayload() == 2)
      {
        v33 = v40;
        v32 = v41;
        v27 = v42;
        (*(void (**)(char *, uint64_t, uint64_t))(v41 + 32))(v40, v24, v42);
        v29 = MEMORY[0x242618B14](v14, v33);
        v30 = *(void (**)(char *, uint64_t))(v32 + 8);
        v30(v33, v27);
        v31 = v14;
        goto LABEL_9;
      }
      v34 = *(void (**)(char *, uint64_t))(v41 + 8);
      v35 = v14;
    }
    v34(v35, v42);
  }
  else
  {
    sub_23C1C7A30((uint64_t)v23, (uint64_t)v19);
    if (!swift_getEnumCaseMultiPayload())
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v8 + 32))(v10, v24, v7);
      sub_23C1C80C0();
      v29 = sub_23C1FB4F8();
      v36 = *(void (**)(char *, uint64_t))(v8 + 8);
      v36(v10, v7);
      v36(v19, v7);
      goto LABEL_15;
    }
    (*(void (**)(char *, uint64_t))(v8 + 8))(v19, v7);
  }
  sub_23C1BC2EC((uint64_t)v23, &qword_256B41268);
  v29 = 0;
  return v29 & 1;
}

uint64_t type metadata accessor for MarketingAction()
{
  uint64_t result;

  result = qword_256B41360;
  if (!qword_256B41360)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_23C1C79EC()
{
  unint64_t result;

  result = qword_256B41298;
  if (!qword_256B41298)
  {
    result = MEMORY[0x242619B10](&unk_23C1FF568, &type metadata for MarketingAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41298);
  }
  return result;
}

uint64_t sub_23C1C7A30(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MarketingAction();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_23C1C7A74()
{
  unint64_t result;

  result = qword_256B412A0;
  if (!qword_256B412A0)
  {
    result = MEMORY[0x242619B10](&unk_23C1FF518, &type metadata for MarketingAction.LinkCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B412A0);
  }
  return result;
}

unint64_t sub_23C1C7AB8()
{
  unint64_t result;

  result = qword_256B412A8;
  if (!qword_256B412A8)
  {
    result = MEMORY[0x242619B10](&unk_23C1FF4C8, &type metadata for MarketingAction.CarrierLinkCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B412A8);
  }
  return result;
}

unint64_t sub_23C1C7AFC()
{
  unint64_t result;

  result = qword_256B412B0;
  if (!qword_256B412B0)
  {
    result = MEMORY[0x242619B10](&unk_23C1FF478, &type metadata for MarketingAction.BuyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B412B0);
  }
  return result;
}

uint64_t sub_23C1C7B40(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B40928);
    result = MEMORY[0x242619B10](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23C1C7B84()
{
  return sub_23C1B56F4(&qword_256B412E8, (uint64_t (*)(uint64_t))type metadata accessor for MarketingAction, (uint64_t)&protocol conformance descriptor for MarketingAction);
}

uint64_t *initializeBufferWithCopyOfBuffer for MarketingAction(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

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
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      v9 = sub_23C1FB468();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(a1, a2, v9);
    }
    else
    {
      if (EnumCaseMultiPayload == 1)
        v7 = sub_23C1FB468();
      else
        v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40928);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for MarketingAction(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 2 || (_DWORD)result == 1)
  {
    v3 = sub_23C1FB468();
  }
  else
  {
    if ((_DWORD)result)
      return result;
    v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40928);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
}

uint64_t initializeWithCopy for MarketingAction(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    v5 = sub_23C1FB468();
  else
    v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40928);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a1, a2, v5);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for MarketingAction(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;

  if (a1 != a2)
  {
    sub_23C1C7E54(a1);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
      v5 = sub_23C1FB468();
    else
      v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40928);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a1, a2, v5);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_23C1C7E54(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for MarketingAction();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t initializeWithTake for MarketingAction(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    v5 = sub_23C1FB468();
  else
    v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40928);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a1, a2, v5);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithTake for MarketingAction(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;

  if (a1 != a2)
  {
    sub_23C1C7E54(a1);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
      v5 = sub_23C1FB468();
    else
      v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40928);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a1, a2, v5);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for MarketingAction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for MarketingAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_23C1C7FDC()
{
  return swift_storeEnumTagMultiPayload();
}

void sub_23C1C7FEC()
{
  unint64_t v0;
  unint64_t v1;

  sub_23C1C806C();
  if (v0 <= 0x3F)
  {
    sub_23C1FB468();
    if (v1 <= 0x3F)
      swift_initEnumMetadataMultiPayload();
  }
}

void sub_23C1C806C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256B41370)
  {
    sub_23C1C80C0();
    v0 = sub_23C1FB510();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256B41370);
  }
}

unint64_t sub_23C1C80C0()
{
  unint64_t result;

  result = qword_256B41270;
  if (!qword_256B41270)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256B41270);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for MarketingAction.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for MarketingAction.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C1C81D8 + 4 * byte_23C1FF065[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23C1C820C + 4 * byte_23C1FF060[v4]))();
}

uint64_t sub_23C1C820C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1C8214(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C1C821CLL);
  return result;
}

uint64_t sub_23C1C8228(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C1C8230);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23C1C8234(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1C823C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MarketingAction.CodingKeys()
{
  return &type metadata for MarketingAction.CodingKeys;
}

ValueMetadata *type metadata accessor for MarketingAction.BuyCodingKeys()
{
  return &type metadata for MarketingAction.BuyCodingKeys;
}

ValueMetadata *type metadata accessor for MarketingAction.CarrierLinkCodingKeys()
{
  return &type metadata for MarketingAction.CarrierLinkCodingKeys;
}

uint64_t _s16FitnessMarketing15MarketingActionO13BuyCodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23C1C82BC + 4 * byte_23C1FF06A[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23C1C82DC + 4 * byte_23C1FF06F[v4]))();
}

_BYTE *sub_23C1C82BC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23C1C82DC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C1C82E4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C1C82EC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C1C82F4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C1C82FC(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for MarketingAction.LinkCodingKeys()
{
  return &type metadata for MarketingAction.LinkCodingKeys;
}

unint64_t sub_23C1C831C()
{
  unint64_t result;

  result = qword_256B413A0;
  if (!qword_256B413A0)
  {
    result = MEMORY[0x242619B10](&unk_23C1FF228, &type metadata for MarketingAction.LinkCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B413A0);
  }
  return result;
}

unint64_t sub_23C1C8364()
{
  unint64_t result;

  result = qword_256B413A8;
  if (!qword_256B413A8)
  {
    result = MEMORY[0x242619B10](&unk_23C1FF2E0, &type metadata for MarketingAction.CarrierLinkCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B413A8);
  }
  return result;
}

unint64_t sub_23C1C83AC()
{
  unint64_t result;

  result = qword_256B413B0;
  if (!qword_256B413B0)
  {
    result = MEMORY[0x242619B10](&unk_23C1FF398, &type metadata for MarketingAction.BuyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B413B0);
  }
  return result;
}

unint64_t sub_23C1C83F4()
{
  unint64_t result;

  result = qword_256B413B8;
  if (!qword_256B413B8)
  {
    result = MEMORY[0x242619B10](&unk_23C1FF450, &type metadata for MarketingAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B413B8);
  }
  return result;
}

unint64_t sub_23C1C843C()
{
  unint64_t result;

  result = qword_256B413C0;
  if (!qword_256B413C0)
  {
    result = MEMORY[0x242619B10](&unk_23C1FF308, &type metadata for MarketingAction.BuyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B413C0);
  }
  return result;
}

unint64_t sub_23C1C8484()
{
  unint64_t result;

  result = qword_256B413C8;
  if (!qword_256B413C8)
  {
    result = MEMORY[0x242619B10](&unk_23C1FF330, &type metadata for MarketingAction.BuyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B413C8);
  }
  return result;
}

unint64_t sub_23C1C84CC()
{
  unint64_t result;

  result = qword_256B413D0;
  if (!qword_256B413D0)
  {
    result = MEMORY[0x242619B10](&unk_23C1FF250, &type metadata for MarketingAction.CarrierLinkCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B413D0);
  }
  return result;
}

unint64_t sub_23C1C8514()
{
  unint64_t result;

  result = qword_256B413D8;
  if (!qword_256B413D8)
  {
    result = MEMORY[0x242619B10](&unk_23C1FF278, &type metadata for MarketingAction.CarrierLinkCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B413D8);
  }
  return result;
}

unint64_t sub_23C1C855C()
{
  unint64_t result;

  result = qword_256B413E0;
  if (!qword_256B413E0)
  {
    result = MEMORY[0x242619B10](&unk_23C1FF198, &type metadata for MarketingAction.LinkCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B413E0);
  }
  return result;
}

unint64_t sub_23C1C85A4()
{
  unint64_t result;

  result = qword_256B413E8;
  if (!qword_256B413E8)
  {
    result = MEMORY[0x242619B10](&unk_23C1FF1C0, &type metadata for MarketingAction.LinkCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B413E8);
  }
  return result;
}

unint64_t sub_23C1C85EC()
{
  unint64_t result;

  result = qword_256B413F0;
  if (!qword_256B413F0)
  {
    result = MEMORY[0x242619B10](&unk_23C1FF3C0, &type metadata for MarketingAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B413F0);
  }
  return result;
}

unint64_t sub_23C1C8634()
{
  unint64_t result;

  result = qword_256B413F8;
  if (!qword_256B413F8)
  {
    result = MEMORY[0x242619B10](&unk_23C1FF3E8, &type metadata for MarketingAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B413F8);
  }
  return result;
}

uint64_t sub_23C1C8678(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 7959906 && a2 == 0xE300000000000000;
  if (v2 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4C72656972726163 && a2 == 0xEB000000006B6E69 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1802398060 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_23C1FBF90();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_23C1C87C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))(a3, a1);
}

uint64_t sub_23C1C87DC()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B414F8);
  sub_23C1BC328(&qword_256B41500, &qword_256B414F8, MEMORY[0x24BE2B5E8]);
  return sub_23C1FB5C4();
}

uint64_t MarketingButton.init(store:style:handoffViewBuilder:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  char v11;
  uint64_t result;

  v11 = *a3;
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a1;
  *(_QWORD *)(result + 24) = a2;
  *(_QWORD *)a6 = sub_23C1C88E0;
  *(_QWORD *)(a6 + 8) = result;
  *(_BYTE *)(a6 + 16) = 0;
  *(_BYTE *)(a6 + 17) = v11;
  *(_QWORD *)(a6 + 24) = a4;
  *(_QWORD *)(a6 + 32) = a5;
  return result;
}

uint64_t sub_23C1C88BC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23C1C88E0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_23C1C8900(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  __int128 v11;
  _BYTE v13[16];
  __int128 v14;
  _OWORD *v15;
  _OWORD v16[2];
  uint64_t v17;

  v3 = sub_23C1FB618();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41410);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = &v13[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = *(_OWORD *)(v1 + 16);
  v16[0] = *(_OWORD *)v1;
  v16[1] = v11;
  v17 = *(_QWORD *)(v1 + 32);
  v14 = *(_OWORD *)(a1 + 16);
  v15 = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B41548);
  sub_23C1BC328(&qword_256B41550, &qword_256B41548, MEMORY[0x24BDF41A8]);
  sub_23C1FBB70();
  sub_23C1FB60C();
  sub_23C1BC328(&qword_256B41420, &qword_256B41410, MEMORY[0x24BDF43B0]);
  sub_23C1FBAEC();
  (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_23C1C8A8C@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
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
  char *v18;
  uint64_t v19;
  char *v20;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  char *v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, char *, uint64_t);
  void (*v30)(char *, uint64_t);
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  __int128 *v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  _QWORD v46[2];
  _QWORD v47[2];
  __int128 v48;
  __int128 v49;
  uint64_t v50;

  v39 = a2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41410);
  v38 = *(_QWORD *)(v4 - 8);
  v5 = v4;
  v36 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v34 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(a1 + 16);
  v8 = sub_23C1FB600();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41418);
  v9 = sub_23C1FB600();
  v10 = sub_23C1BC328(&qword_256B41420, &qword_256B41410, MEMORY[0x24BDF43B0]);
  v35 = v10;
  v47[0] = *(_QWORD *)(a1 + 24);
  v11 = v47[0];
  v47[1] = MEMORY[0x24BDEDBB8];
  v12 = MEMORY[0x24BDED308];
  v13 = MEMORY[0x242619B10](MEMORY[0x24BDED308], v8, v47);
  v14 = sub_23C1BC328(&qword_256B41428, &qword_256B41418, MEMORY[0x24BDF06D0]);
  v46[0] = v13;
  v46[1] = v14;
  v32 = v9;
  v33 = MEMORY[0x242619B10](v12, v9, v46);
  *(_QWORD *)&v48 = v5;
  *((_QWORD *)&v48 + 1) = v9;
  *(_QWORD *)&v49 = v10;
  *((_QWORD *)&v49 + 1) = v33;
  v15 = MEMORY[0x242619ABC](0, &v48, MEMORY[0x24BDF2838], 0);
  v37 = *(_QWORD *)(v15 - 8);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v32 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v32 - v19;
  v21 = v2[1];
  v48 = *v2;
  v49 = v21;
  v50 = *((_QWORD *)v2 + 4);
  v22 = swift_allocObject();
  *(_QWORD *)(v22 + 16) = v7;
  *(_QWORD *)(v22 + 24) = v11;
  v23 = v2[1];
  *(_OWORD *)(v22 + 32) = *v2;
  *(_OWORD *)(v22 + 48) = v23;
  *(_QWORD *)(v22 + 64) = *((_QWORD *)v2 + 4);
  v40 = v7;
  v41 = v11;
  v42 = &v48;
  sub_23C1CC430((uint64_t)&v48);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B41548);
  sub_23C1BC328(&qword_256B41550, &qword_256B41548, MEMORY[0x24BDF41A8]);
  v24 = v34;
  sub_23C1FBB70();
  v43 = v48;
  v44 = v49;
  v45 = v50;
  sub_23C1C87DC();
  swift_getKeyPath();
  sub_23C1FBC6C();
  swift_release();
  swift_release();
  v25 = swift_allocObject();
  *(_QWORD *)(v25 + 16) = v7;
  *(_QWORD *)(v25 + 24) = v11;
  v26 = v49;
  *(_OWORD *)(v25 + 32) = v48;
  *(_OWORD *)(v25 + 48) = v26;
  *(_QWORD *)(v25 + 64) = v50;
  sub_23C1CC430((uint64_t)&v48);
  swift_checkMetadataState();
  v27 = v36;
  sub_23C1FBA74();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v24, v27);
  v28 = v37;
  v29 = *(void (**)(char *, char *, uint64_t))(v37 + 16);
  v29(v20, v18, v15);
  v30 = *(void (**)(char *, uint64_t))(v28 + 8);
  v30(v18, v15);
  v29(v39, v20, v15);
  return ((uint64_t (*)(char *, uint64_t))v30)(v20, v15);
}

uint64_t sub_23C1C8E84@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t (*)(), uint64_t);
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  void (*v25)(char *, char *, uint64_t);
  void (*v26)(char *, uint64_t);
  uint64_t v28;
  char *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  _QWORD v35[2];
  _QWORD v36[3];

  v34 = a4;
  v30 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23C1FB600();
  v33 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v28 - v10;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41418);
  v12 = sub_23C1FB600();
  v32 = *(_QWORD *)(v12 - 8);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v29 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v31 = (char *)&v28 - v15;
  v16 = *(void (**)(uint64_t (*)(), uint64_t))(a1 + 24);
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = a2;
  *(_QWORD *)(v17 + 24) = a3;
  v18 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v17 + 32) = *(_OWORD *)a1;
  *(_OWORD *)(v17 + 48) = v18;
  *(_QWORD *)(v17 + 64) = *(_QWORD *)(a1 + 32);
  sub_23C1CC430(a1);
  v16(sub_23C1CD0E4, v17);
  swift_release();
  sub_23C1FBBC4();
  sub_23C1FBAB0();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v8, a2);
  v36[2] = sub_23C1FBB04();
  sub_23C1FB8E8();
  v36[0] = a3;
  v36[1] = MEMORY[0x24BDEDBB8];
  v19 = MEMORY[0x24BDED308];
  v20 = MEMORY[0x242619B10](MEMORY[0x24BDED308], v9, v36);
  v21 = v29;
  sub_23C1FBA14();
  swift_release();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v11, v9);
  v22 = sub_23C1BC328(&qword_256B41428, &qword_256B41418, MEMORY[0x24BDF06D0]);
  v35[0] = v20;
  v35[1] = v22;
  MEMORY[0x242619B10](v19, v12, v35);
  v24 = v31;
  v23 = v32;
  v25 = *(void (**)(char *, char *, uint64_t))(v32 + 16);
  v25(v31, v21, v12);
  v26 = *(void (**)(char *, uint64_t))(v23 + 8);
  v26(v21, v12);
  v25(v34, v24, v12);
  return ((uint64_t (*)(char *, uint64_t))v26)(v24, v12);
}

uint64_t sub_23C1C9178(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  _OWORD v15[2];
  uint64_t v16;

  v8 = type metadata accessor for MarketingButtonAction();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_OWORD *)(a1 + 16);
  v15[0] = *(_OWORD *)a1;
  v15[1] = v11;
  v16 = *(_QWORD *)(a1 + 32);
  type metadata accessor for MarketingButton(0, a2, a3, v12);
  sub_23C1C87DC();
  v13 = type metadata accessor for MarketingActionItem();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v10, a4, 6, v13);
  sub_23C1FBC60();
  swift_release();
  return sub_23C1B5118((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for MarketingButtonAction);
}

uint64_t sub_23C1C9260@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __int128 *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  _DWORD v24[2];
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 *v32;
  uint64_t v33;
  unsigned __int8 v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;

  v29 = a2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B415F0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23C1FB4B0();
  MEMORY[0x24BDAC7A8](v7);
  v8 = sub_23C1FBCB4();
  MEMORY[0x24BDAC7A8](v8);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41410);
  v27 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  v10 = (char *)v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = v2[1];
  v40 = *v2;
  v41 = v11;
  v42 = *((_QWORD *)v2 + 4);
  v12 = swift_allocObject();
  v13 = *(_QWORD *)(a1 + 16);
  v14 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(v12 + 16) = v13;
  *(_QWORD *)(v12 + 24) = v14;
  v15 = v2[1];
  *(_OWORD *)(v12 + 32) = *v2;
  *(_OWORD *)(v12 + 48) = v15;
  *(_QWORD *)(v12 + 64) = *((_QWORD *)v2 + 4);
  v30 = v13;
  v31 = v14;
  v32 = &v40;
  sub_23C1CC430((uint64_t)&v40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B41548);
  sub_23C1BC328(&qword_256B41550, &qword_256B41548, MEMORY[0x24BDF41A8]);
  v26 = v10;
  sub_23C1FBB70();
  sub_23C1FBCA8();
  if (qword_256B408D8 != -1)
    swift_once();
  v37 = v40;
  v38 = v41;
  v39 = v42;
  v16 = (id)qword_256B4F8C8;
  sub_23C1C87DC();
  swift_getKeyPath();
  sub_23C1FBC54();
  swift_release();
  swift_release();
  v35 = sub_23C1FBCE4();
  v36 = v17;
  v37 = v40;
  v38 = v41;
  v39 = v42;
  sub_23C1C87DC();
  swift_getKeyPath();
  sub_23C1FBC6C();
  swift_release();
  swift_release();
  v25 = v33;
  v24[1] = v34;
  v37 = v40;
  v38 = v41;
  v39 = v42;
  sub_23C1C87DC();
  swift_getKeyPath();
  sub_23C1FBC54();
  swift_release();
  swift_release();
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41440);
  v19 = (*(uint64_t (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v6, 0, 1, v18);
  v20 = MEMORY[0x24BDAC7A8](v19);
  MEMORY[0x24BDAC7A8](v20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B41438);
  sub_23C1BC328(&qword_256B41420, &qword_256B41410, MEMORY[0x24BDF43B0]);
  sub_23C1CA840();
  sub_23C1BC328(&qword_256B41450, &qword_256B41438, MEMORY[0x24BDF5428]);
  v21 = v28;
  v22 = v26;
  sub_23C1FBAA4();
  swift_release();
  swift_release();
  sub_23C1BC2EC((uint64_t)v6, &qword_256B415F0);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v22, v21);
}

uint64_t sub_23C1C975C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
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

  v6 = sub_23C1FB4B0();
  MEMORY[0x24BDAC7A8](v6);
  v7 = sub_23C1FBCB4();
  MEMORY[0x24BDAC7A8](v7);
  sub_23C1FBCA8();
  if (qword_256B408D8 != -1)
    swift_once();
  v9 = (void *)qword_256B4F8C8;
  type metadata accessor for MarketingButton(0, a1, a2, v8);
  v10 = v9;
  sub_23C1C87DC();
  swift_getKeyPath();
  sub_23C1FBC54();
  swift_release();
  swift_release();
  sub_23C1FBCE4();
  sub_23C1CA840();
  result = sub_23C1FB9C0();
  *(_QWORD *)a3 = result;
  *(_QWORD *)(a3 + 8) = v12;
  *(_BYTE *)(a3 + 16) = v13 & 1;
  *(_QWORD *)(a3 + 24) = v14;
  return result;
}

void sub_23C1C9918(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
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
  uint64_t v18;
  __int128 v19;
  char *v20;
  _QWORD v21[6];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v23 = a1;
  v21[5] = a5;
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41508);
  MEMORY[0x24BDAC7A8](v22);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B415F8);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v21[4] = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41600);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41410);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v21[3] = (char *)v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  sub_23C1FB558();
  v17 = sub_23C1FB564();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v13, 0, 1, v17);
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = a3;
  *(_QWORD *)(v18 + 24) = a4;
  v19 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v18 + 32) = *(_OWORD *)a2;
  *(_OWORD *)(v18 + 48) = v19;
  *(_QWORD *)(v18 + 64) = *(_QWORD *)(a2 + 32);
  v21[1] = a3;
  v21[2] = a4;
  v24 = a3;
  v25 = a4;
  v26 = a2;
  sub_23C1CC430(a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B41548);
  sub_23C1BC328(&qword_256B41550, &qword_256B41548, MEMORY[0x24BDF41A8]);
  sub_23C1FBB64();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B41440);
  sub_23C1FBC24();
  v20 = (char *)sub_23C1C9B7C + 4 * byte_23C1FF5C0[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23C1C9B7C()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);

  if ((*v0 & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v8 = swift_allocObject();
    v9 = *(_QWORD *)(v6 - 176);
    *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 - 184);
    *(_QWORD *)(v8 + 24) = v9;
    v10 = *(_OWORD *)(v4 + 16);
    *(_OWORD *)(v8 + 32) = *(_OWORD *)v4;
    *(_OWORD *)(v8 + 48) = v10;
    *(_QWORD *)(v8 + 64) = *(_QWORD *)(v4 + 32);
    MEMORY[0x24BDAC7A8](v8);
    sub_23C1CC430(v4);
    sub_23C1FBB70();
    v7 = 0;
  }
  v12 = *(_QWORD *)(v6 - 160);
  v11 = *(_QWORD *)(v6 - 152);
  v13 = *(_QWORD *)(v6 - 168);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(v1, v7, 1, v2);
  v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v14(v13, v5, v2);
  sub_23C1CD284(v1, v12);
  v14(v11, v13, v2);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41608);
  sub_23C1CD284(v12, v11 + *(int *)(v15 + 48));
  sub_23C1BC2EC(v1, &qword_256B415F8);
  v16 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v16(v5, v2);
  sub_23C1BC2EC(v12, &qword_256B415F8);
  return ((uint64_t (*)(uint64_t, uint64_t))v16)(v13, v2);
}

uint64_t sub_23C1C9D30@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t result;
  uint64_t v12;

  v6 = sub_23C1FB4B0();
  MEMORY[0x24BDAC7A8](v6);
  v7 = sub_23C1FBCB4();
  MEMORY[0x24BDAC7A8](v7);
  sub_23C1FBCA8();
  if (qword_256B408D8 != -1)
    swift_once();
  v9 = (void *)qword_256B4F8C8;
  type metadata accessor for MarketingButton(0, a1, a2, v8);
  v10 = v9;
  sub_23C1C87DC();
  swift_getKeyPath();
  sub_23C1FBC54();
  swift_release();
  swift_release();
  result = sub_23C1FBCE4();
  *(_QWORD *)a3 = result;
  *(_QWORD *)(a3 + 8) = v12;
  *(_BYTE *)(a3 + 16) = 0;
  *(_QWORD *)(a3 + 24) = MEMORY[0x24BEE4AF8];
  return result;
}

uint64_t sub_23C1C9EBC@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t result;
  uint64_t v12;

  v6 = sub_23C1FB4B0();
  MEMORY[0x24BDAC7A8](v6);
  v7 = sub_23C1FBCB4();
  MEMORY[0x24BDAC7A8](v7);
  sub_23C1FBCA8();
  if (qword_256B408D8 != -1)
    swift_once();
  v9 = (void *)qword_256B4F8C8;
  type metadata accessor for MarketingButton(0, a1, a2, v8);
  v10 = v9;
  sub_23C1C87DC();
  swift_getKeyPath();
  sub_23C1FBC54();
  swift_release();
  swift_release();
  result = sub_23C1FBCE4();
  *(_QWORD *)a3 = result;
  *(_QWORD *)(a3 + 8) = v12;
  *(_BYTE *)(a3 + 16) = 0;
  *(_QWORD *)(a3 + 24) = MEMORY[0x24BEE4AF8];
  return result;
}

uint64_t sub_23C1CA05C@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t result;
  uint64_t v12;

  v6 = sub_23C1FB4B0();
  MEMORY[0x24BDAC7A8](v6);
  v7 = sub_23C1FBCB4();
  MEMORY[0x24BDAC7A8](v7);
  sub_23C1FBCA8();
  if (qword_256B408D8 != -1)
    swift_once();
  v9 = (void *)qword_256B4F8C8;
  type metadata accessor for MarketingButton(0, a1, a2, v8);
  v10 = v9;
  sub_23C1C87DC();
  swift_getKeyPath();
  sub_23C1FBC54();
  swift_release();
  swift_release();
  result = sub_23C1FBCE4();
  *(_QWORD *)a3 = result;
  *(_QWORD *)(a3 + 8) = v12;
  *(_BYTE *)(a3 + 16) = 0;
  *(_QWORD *)(a3 + 24) = MEMORY[0x24BEE4AF8];
  return result;
}

BOOL sub_23C1CA1F8()
{
  __int128 *v0;
  __int128 v2;

  v2 = *v0;
  sub_23C1C87DC();
  swift_getKeyPath();
  sub_23C1FBC54();
  swift_release();
  swift_release();
  return v2 > 2u;
}

uint64_t MarketingButton.body.getter@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t OpaqueTypeConformance2;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  void (*v49)(char *, char *, uint64_t);
  void (*v50)(char *, uint64_t);
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  __int128 *v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  __int128 *v66;
  _QWORD v67[4];
  uint64_t v68;
  _QWORD v69[2];
  _QWORD v70[2];
  _QWORD v71[2];
  _QWORD v72[2];
  __int128 v73;
  __int128 v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  _QWORD v80[2];
  _QWORD v81[3];

  v63 = a2;
  v59 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41400);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41408);
  v3 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41410);
  v61 = *(_QWORD *)(a1 + 16);
  v4 = sub_23C1FB600();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41418);
  v5 = sub_23C1FB600();
  v6 = sub_23C1BC328(&qword_256B41420, &qword_256B41410, MEMORY[0x24BDF43B0]);
  v60 = *(_QWORD *)(a1 + 24);
  v81[0] = v60;
  v81[1] = MEMORY[0x24BDEDBB8];
  v7 = MEMORY[0x24BDED308];
  v80[0] = MEMORY[0x242619B10](MEMORY[0x24BDED308], v4, v81);
  v80[1] = sub_23C1BC328(&qword_256B41428, &qword_256B41418, MEMORY[0x24BDF06D0]);
  v8 = MEMORY[0x242619B10](v7, v5, v80);
  *(_QWORD *)&v73 = v3;
  *((_QWORD *)&v73 + 1) = v5;
  *(_QWORD *)&v74 = v6;
  *((_QWORD *)&v74 + 1) = v8;
  MEMORY[0x242619ABC](255, &v73, MEMORY[0x24BDF2838], 0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41430);
  v9 = sub_23C1FB774();
  *(_QWORD *)&v73 = v3;
  *((_QWORD *)&v73 + 1) = v5;
  *(_QWORD *)&v74 = v6;
  *((_QWORD *)&v74 + 1) = v8;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v11 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41438);
  v12 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41440);
  v13 = sub_23C1CA840();
  v14 = sub_23C1BC328(&qword_256B41450, &qword_256B41438, MEMORY[0x24BDF5428]);
  *(_QWORD *)&v73 = v3;
  *((_QWORD *)&v73 + 1) = MEMORY[0x24BEE0D00];
  *(_QWORD *)&v74 = v11;
  *((_QWORD *)&v74 + 1) = MEMORY[0x24BDF1FA8];
  v75 = v12;
  v76 = v6;
  v77 = v13;
  v78 = v14;
  v79 = MEMORY[0x24BDF1F80];
  v72[0] = OpaqueTypeConformance2;
  v72[1] = swift_getOpaqueTypeConformance2();
  v15 = MEMORY[0x242619B10](MEMORY[0x24BDEF3E0], v9, v72);
  v16 = sub_23C1CA884();
  *(_QWORD *)&v73 = v9;
  *((_QWORD *)&v73 + 1) = &type metadata for MarketingPlainButtonStyle;
  *(_QWORD *)&v74 = v15;
  *((_QWORD *)&v74 + 1) = v16;
  MEMORY[0x242619ABC](255, &v73, MEMORY[0x24BDF22B8], 0);
  v17 = sub_23C1FB774();
  v18 = sub_23C1FB774();
  v19 = sub_23C1FB774();
  v20 = sub_23C1FBB40();
  v59 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v58 = (char *)&v52 - v21;
  v22 = sub_23C1CA8C8();
  v23 = sub_23C1BC328(qword_256B41470, &qword_256B41408, MEMORY[0x24BDF4700]);
  *(_QWORD *)&v73 = v9;
  *((_QWORD *)&v73 + 1) = &type metadata for MarketingPlainButtonStyle;
  *(_QWORD *)&v74 = v15;
  *((_QWORD *)&v74 + 1) = v16;
  v24 = swift_getOpaqueTypeConformance2();
  v71[0] = v15;
  v71[1] = v24;
  v25 = MEMORY[0x24BDEF3E0];
  v26 = MEMORY[0x242619B10](MEMORY[0x24BDEF3E0], v17, v71);
  v70[0] = v23;
  v70[1] = v26;
  v27 = MEMORY[0x242619B10](v25, v18, v70);
  v69[0] = v22;
  v69[1] = v27;
  v68 = MEMORY[0x242619B10](v25, v19, v69);
  v28 = v20;
  v53 = MEMORY[0x242619B10](MEMORY[0x24BDF3F50], v20, &v68);
  *(_QWORD *)&v73 = v20;
  *((_QWORD *)&v73 + 1) = v53;
  v29 = MEMORY[0x242619ABC](0, &v73, MEMORY[0x24BE37C20], 0);
  v30 = *(_QWORD *)(v29 - 8);
  v54 = v29;
  v57 = v30;
  MEMORY[0x24BDAC7A8](v29);
  v32 = (char *)&v52 - v31;
  v33 = sub_23C1FB600();
  v56 = *(_QWORD *)(v33 - 8);
  v34 = MEMORY[0x24BDAC7A8](v33);
  v36 = (char *)&v52 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v34);
  v55 = (char *)&v52 - v37;
  v38 = v61;
  v39 = v62[1];
  v73 = *v62;
  v74 = v39;
  v75 = *((_QWORD *)v62 + 4);
  v40 = v60;
  v64 = v61;
  v65 = v60;
  v66 = &v73;
  v41 = v58;
  sub_23C1FBB34();
  v42 = v53;
  sub_23C1FB9E4();
  (*(void (**)(char *, uint64_t))(v59 + 8))(v41, v28);
  v43 = swift_allocObject();
  *(_QWORD *)(v43 + 16) = v38;
  *(_QWORD *)(v43 + 24) = v40;
  v44 = v74;
  *(_OWORD *)(v43 + 32) = v73;
  *(_OWORD *)(v43 + 48) = v44;
  *(_QWORD *)(v43 + 64) = v75;
  sub_23C1CC430((uint64_t)&v73);
  v67[2] = v28;
  v67[3] = v42;
  v45 = swift_getOpaqueTypeConformance2();
  v46 = v54;
  sub_23C1FBAE0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v57 + 8))(v32, v46);
  v67[0] = v45;
  v67[1] = MEMORY[0x24BDF0910];
  MEMORY[0x242619B10](MEMORY[0x24BDED308], v33, v67);
  v47 = v55;
  v48 = v56;
  v49 = *(void (**)(char *, char *, uint64_t))(v56 + 16);
  v49(v55, v36, v33);
  v50 = *(void (**)(char *, uint64_t))(v48 + 8);
  v50(v36, v33);
  v49(v63, v47, v33);
  return ((uint64_t (*)(char *, uint64_t))v50)(v47, v33);
}

unint64_t sub_23C1CA840()
{
  unint64_t result;

  result = qword_256B41448;
  if (!qword_256B41448)
  {
    result = MEMORY[0x242619B10](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_256B41448);
  }
  return result;
}

unint64_t sub_23C1CA884()
{
  unint64_t result;

  result = qword_256B41458;
  if (!qword_256B41458)
  {
    result = MEMORY[0x242619B10](&unk_23C20115C, &type metadata for MarketingPlainButtonStyle);
    atomic_store(result, (unint64_t *)&qword_256B41458);
  }
  return result;
}

unint64_t sub_23C1CA8C8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t OpaqueTypeConformance2;
  _QWORD v3[6];

  result = qword_256B41460;
  if (!qword_256B41460)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41400);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41410);
    sub_23C1BC328(&qword_256B41420, &qword_256B41410, MEMORY[0x24BDF43B0]);
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    v3[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41468);
    v3[3] = &type metadata for MarketingPlainButtonStyle;
    v3[4] = OpaqueTypeConformance2;
    v3[5] = sub_23C1CA884();
    v3[0] = OpaqueTypeConformance2;
    v3[1] = swift_getOpaqueTypeConformance2();
    result = MEMORY[0x242619B10](MEMORY[0x24BDEF3E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256B41460);
  }
  return result;
}

void sub_23C1CA9B0(__int128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t OpaqueTypeConformance2;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
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
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  uint64_t v48;
  char *v49;
  _QWORD v50[6];
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  char *v56;
  uint64_t v57;
  char *v58;
  char *v59;
  char *v60;
  char *v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  _QWORD v74[2];
  __int128 v75;
  __int128 v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  uint64_t v81;
  _QWORD v82[2];
  _QWORD v83[4];

  v71 = a2;
  v72 = a3;
  v68 = a4;
  v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41410);
  v7 = sub_23C1FB600();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41418);
  v8 = sub_23C1FB600();
  v9 = sub_23C1BC328(&qword_256B41420, &qword_256B41410, MEMORY[0x24BDF43B0]);
  v83[0] = a3;
  v83[1] = MEMORY[0x24BDEDBB8];
  v10 = MEMORY[0x24BDED308];
  v82[0] = MEMORY[0x242619B10](MEMORY[0x24BDED308], v7, v83);
  v82[1] = sub_23C1BC328(&qword_256B41428, &qword_256B41418, MEMORY[0x24BDF06D0]);
  v11 = MEMORY[0x242619B10](v10, v8, v82);
  *(_QWORD *)&v75 = v6;
  *((_QWORD *)&v75 + 1) = v8;
  *(_QWORD *)&v76 = v9;
  *((_QWORD *)&v76 + 1) = v11;
  MEMORY[0x242619ABC](255, &v75, MEMORY[0x24BDF2838], 0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41430);
  v12 = sub_23C1FB774();
  *(_QWORD *)&v75 = v6;
  *((_QWORD *)&v75 + 1) = v8;
  *(_QWORD *)&v76 = v9;
  *((_QWORD *)&v76 + 1) = v11;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v14 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41438);
  v15 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41440);
  v16 = sub_23C1CA840();
  v17 = sub_23C1BC328(&qword_256B41450, &qword_256B41438, MEMORY[0x24BDF5428]);
  *(_QWORD *)&v75 = v6;
  *((_QWORD *)&v75 + 1) = MEMORY[0x24BEE0D00];
  *(_QWORD *)&v76 = v14;
  *((_QWORD *)&v76 + 1) = MEMORY[0x24BDF1FA8];
  v77 = v15;
  v78 = v9;
  v79 = v16;
  v80 = v17;
  v81 = MEMORY[0x24BDF1F80];
  v74[0] = OpaqueTypeConformance2;
  v74[1] = swift_getOpaqueTypeConformance2();
  v18 = MEMORY[0x242619B10](MEMORY[0x24BDEF3E0], v12, v74);
  v19 = sub_23C1CA884();
  *(_QWORD *)&v75 = v12;
  *((_QWORD *)&v75 + 1) = &type metadata for MarketingPlainButtonStyle;
  v67 = v18;
  *(_QWORD *)&v76 = v18;
  *((_QWORD *)&v76 + 1) = v19;
  v73 = v19;
  MEMORY[0x242619ABC](255, &v75, MEMORY[0x24BDF22B8], 0);
  v70 = v12;
  v20 = sub_23C1FB774();
  v50[3] = *(_QWORD *)(v20 - 8);
  v21 = MEMORY[0x24BDAC7A8](v20);
  v50[5] = (char *)v50 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v50[4] = (char *)v50 - v23;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41408);
  v25 = MEMORY[0x24BDAC7A8](v24);
  v50[1] = (char *)v50 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v25);
  v50[2] = (char *)v50 - v27;
  v54 = v28;
  v66 = v20;
  v29 = sub_23C1FB774();
  v57 = *(_QWORD *)(v29 - 8);
  v30 = MEMORY[0x24BDAC7A8](v29);
  v56 = (char *)v50 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v30);
  v55 = (char *)v50 - v32;
  v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41508);
  v33 = MEMORY[0x24BDAC7A8](v51);
  v59 = (char *)v50 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = *(_QWORD *)(v15 - 8);
  v53 = v15;
  MEMORY[0x24BDAC7A8](v33);
  v60 = (char *)v50 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41400);
  MEMORY[0x24BDAC7A8](v36);
  v58 = (char *)v50 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41510);
  MEMORY[0x24BDAC7A8](v38);
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41518);
  v40 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39);
  v42 = (char *)v50 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = type metadata accessor for MarketingOffer();
  MEMORY[0x24BDAC7A8](v43);
  v61 = (char *)v50 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  v62 = v36;
  v69 = v29;
  v45 = sub_23C1FB774();
  v64 = *(_QWORD *)(v45 - 8);
  v65 = v45;
  MEMORY[0x24BDAC7A8](v45);
  v63 = (char *)v50 - v46;
  v47 = a1[1];
  v75 = *a1;
  v76 = v47;
  v77 = *((_QWORD *)a1 + 4);
  type metadata accessor for MarketingButton(0, v71, v72, v48);
  sub_23C1C87DC();
  swift_getKeyPath();
  sub_23C1FBC54();
  swift_release();
  swift_release();
  sub_23C1FBC24();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v42, v39);
  v49 = (char *)sub_23C1CAF64 + 4 * byte_23C1FF5C5[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23C1CAF64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  _OWORD *v5;
  int EnumCaseMultiPayload;

  sub_23C1CD008(v1, *(_QWORD *)(v0 + 128), (uint64_t (*)(_QWORD))type metadata accessor for MarketingOffer);
  v4 = *(_OWORD *)(v2 + 16);
  v5 = (_OWORD *)(v3 - 208);
  *v5 = *(_OWORD *)v2;
  v5[1] = v4;
  *(_QWORD *)(v3 - 176) = *(_QWORD *)(v2 + 32);
  sub_23C1C87DC();
  swift_getKeyPath();
  sub_23C1FBC54();
  swift_release();
  swift_release();
  sub_23C1FBC24();
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  return ((uint64_t (*)())((char *)sub_23C1CB060 + 4 * byte_23C1FF5CA[EnumCaseMultiPayload]))();
}

uint64_t sub_23C1CB060()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  __int128 v9;
  _OWORD *v10;
  _OWORD *v11;
  __int128 v12;
  __int128 v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, uint64_t);
  void (*v21)(uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t OpaqueTypeConformance2;
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
  void (*v40)(uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD v54[4];
  char v55;
  uint64_t v56;

  v8 = **(_BYTE **)(v0 + 112);
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(v0 + 56) + 8))(*(_QWORD *)(v0 + 120), v1);
  v9 = *(_OWORD *)(v5 + 16);
  v10 = (_OWORD *)(v7 - 208);
  *v10 = *(_OWORD *)v5;
  v10[1] = v9;
  *(_QWORD *)(v7 - 176) = *(_QWORD *)(v5 + 32);
  sub_23C1C87DC();
  swift_getKeyPath();
  sub_23C1FBC54();
  v11 = (_OWORD *)(v7 - 208);
  swift_release();
  swift_release();
  if (*(_BYTE *)(v7 - 208) == 1
    && ((v8 & 1) != 0
     || (v12 = *(_OWORD *)(v5 + 16),
         *v11 = *(_OWORD *)v5,
         *(_OWORD *)(v7 - 192) = v12,
         *(_QWORD *)(v7 - 176) = *(_QWORD *)(v5 + 32),
         !sub_23C1CA1F8())))
  {
    v24 = *(_OWORD *)(v5 + 16);
    *v11 = *(_OWORD *)v5;
    *(_OWORD *)(v7 - 192) = v24;
    *(_QWORD *)(v7 - 176) = *(_QWORD *)(v5 + 32);
    sub_23C1C87DC();
    swift_getKeyPath();
    sub_23C1FBC54();
    swift_release();
    swift_release();
    if (*(_BYTE *)(v7 - 208))
    {
      if (*(_BYTE *)(v7 - 208) == 1)
        v25 = sub_23C1FB720();
      else
        v25 = sub_23C1FB738();
    }
    else
    {
      v25 = sub_23C1FB72C();
    }
    v26 = *(_QWORD *)(v0 + 8);
    *(_QWORD *)v26 = v25;
    *(_QWORD *)(v26 + 8) = 0;
    *(_BYTE *)(v26 + 16) = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B41520);
    v27 = *(_QWORD *)(v0 + 128);
    sub_23C1CBA90(v27, v5, *(_QWORD *)(v0 + 208), *(_QWORD *)(v0 + 216));
    sub_23C1B5118(v27, (uint64_t (*)(_QWORD))type metadata accessor for MarketingOffer);
    v28 = *(_QWORD *)(v0 + 16);
    sub_23C1CCAC8(v26, v28);
    sub_23C1BC328(qword_256B41470, &qword_256B41408, MEMORY[0x24BDF4700]);
    *(_QWORD *)(v7 - 208) = v4;
    *(_QWORD *)(v7 - 200) = &type metadata for MarketingPlainButtonStyle;
    *(_QWORD *)(v7 - 192) = v6;
    *(_QWORD *)(v7 - 184) = *(_QWORD *)(v0 + 224);
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    *(_QWORD *)(v0 + 264) = v6;
    *(_QWORD *)(v0 + 272) = OpaqueTypeConformance2;
    MEMORY[0x242619B10](MEMORY[0x24BDEF3E0], v3, v0 + 264);
    v22 = *(_QWORD *)(v0 + 80);
    sub_23C1EA404(v28, *(_QWORD *)(v0 + 72));
    sub_23C1BC2EC(v28, &qword_256B41408);
  }
  else
  {
    sub_23C1B5118(*(_QWORD *)(v0 + 128), (uint64_t (*)(_QWORD))type metadata accessor for MarketingOffer);
    *(_BYTE *)(v7 - 225) = *(_BYTE *)(v5 + 17);
    v13 = *(_OWORD *)(v5 + 16);
    *v11 = *(_OWORD *)v5;
    *(_OWORD *)(v7 - 192) = v13;
    *(_QWORD *)(v7 - 176) = *(_QWORD *)(v5 + 32);
    sub_23C1C87DC();
    swift_getKeyPath();
    sub_23C1FBC54();
    swift_release();
    swift_release();
    v14 = MEMORY[0x24BDAC7A8](*(unsigned __int8 *)(v7 - 208));
    v15 = *(_QWORD *)(v0 + 216);
    v54[2] = *(_QWORD *)(v0 + 208);
    v54[3] = v15;
    v55 = v8;
    v56 = v5;
    v16 = *(_QWORD *)(v0 + 40);
    sub_23C1E0BF8(v14, (void (*)(uint64_t))sub_23C1CCAB8, (uint64_t)v54, v4, v6, v16);
    *(_QWORD *)(v7 - 208) = v4;
    *(_QWORD *)(v7 - 200) = &type metadata for MarketingPlainButtonStyle;
    *(_QWORD *)(v7 - 192) = v6;
    *(_QWORD *)(v7 - 184) = *(_QWORD *)(v0 + 224);
    v17 = swift_getOpaqueTypeConformance2();
    *(_QWORD *)(v7 - 248) = v6;
    *(_QWORD *)(v7 - 240) = v17;
    MEMORY[0x242619B10](MEMORY[0x24BDEF3E0], v3, v7 - 248);
    v18 = *(_QWORD *)(v0 + 24);
    v19 = *(_QWORD *)(v0 + 32);
    v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16);
    v20(v19, v16, v3);
    v21 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
    v21(v16, v3);
    v20(v16, v19, v3);
    sub_23C1BC328(qword_256B41470, &qword_256B41408, MEMORY[0x24BDF4700]);
    v22 = *(_QWORD *)(v0 + 80);
    sub_23C1EA4C8(v16, *(_QWORD *)(v0 + 72), v3);
    v23 = v16;
    v2 = *(_QWORD *)(v0 + 192);
    v21(v23, v3);
    v21(v19, v3);
  }
  v30 = *(_QWORD *)(v0 + 144);
  v31 = sub_23C1BC328(qword_256B41470, &qword_256B41408, MEMORY[0x24BDF4700]);
  *(_QWORD *)(v7 - 208) = *(_QWORD *)(v0 + 200);
  *(_QWORD *)(v7 - 200) = &type metadata for MarketingPlainButtonStyle;
  v32 = *(_QWORD *)(v0 + 224);
  *(_QWORD *)(v7 - 192) = v6;
  *(_QWORD *)(v7 - 184) = v32;
  v33 = swift_getOpaqueTypeConformance2();
  *(_QWORD *)(v0 + 344) = v6;
  *(_QWORD *)(v0 + 352) = v33;
  v34 = MEMORY[0x24BDEF3E0];
  v35 = MEMORY[0x242619B10](MEMORY[0x24BDEF3E0], v3, v0 + 344);
  *(_QWORD *)(v0 + 328) = v31;
  *(_QWORD *)(v0 + 336) = v35;
  MEMORY[0x242619B10](v34, v2, v0 + 328);
  v36 = *(_QWORD *)(v0 + 96);
  v37 = v6;
  v38 = v2;
  v39 = *(_QWORD *)(v0 + 88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v36 + 16))(v39, v22, v38);
  sub_23C1CA8C8();
  sub_23C1EA4C8(v39, *(_QWORD *)(v0 + 136), v38);
  v40 = *(void (**)(uint64_t, uint64_t))(v36 + 8);
  v40(v39, v38);
  v41 = v22;
  v42 = *(_QWORD *)(v0 + 200);
  v40(v41, v38);
  v43 = v30;
  v44 = sub_23C1CA8C8();
  v45 = sub_23C1BC328(qword_256B41470, &qword_256B41408, MEMORY[0x24BDF4700]);
  *(_QWORD *)(v7 - 208) = v42;
  *(_QWORD *)(v7 - 200) = &type metadata for MarketingPlainButtonStyle;
  v46 = *(_QWORD *)(v0 + 224);
  *(_QWORD *)(v7 - 192) = v37;
  *(_QWORD *)(v7 - 184) = v46;
  v47 = swift_getOpaqueTypeConformance2();
  *(_QWORD *)(v0 + 312) = v37;
  *(_QWORD *)(v0 + 320) = v47;
  v48 = MEMORY[0x24BDEF3E0];
  v49 = MEMORY[0x242619B10](MEMORY[0x24BDEF3E0], v3, v0 + 312);
  *(_QWORD *)(v0 + 296) = v45;
  *(_QWORD *)(v0 + 304) = v49;
  v50 = MEMORY[0x242619B10](v48, v38, v0 + 296);
  *(_QWORD *)(v0 + 280) = v44;
  *(_QWORD *)(v0 + 288) = v50;
  v51 = *(_QWORD *)(v0 + 160);
  MEMORY[0x242619B10](v48, v51, v0 + 280);
  v52 = *(_QWORD *)(v0 + 152);
  (*(void (**)(_QWORD, uint64_t, uint64_t))(v52 + 16))(*(_QWORD *)(v0 + 184), v43, v51);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v52 + 8))(v43, v51);
}

void sub_23C1CB774(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_23C1CA9B0(*(__int128 **)(v1 + 32), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_23C1CB780@<X0>(int a1@<W0>, void (*a2)(uint64_t)@<X1>, char a3@<W3>, uint64_t a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t OpaqueTypeConformance2;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE v30[12];
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  ValueMetadata *v36;
  uint64_t v37;
  unint64_t v38;
  char v39;

  v31 = a1;
  v33 = a4;
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41538);
  v32 = *(_QWORD *)(v34 - 8);
  v6 = MEMORY[0x24BDAC7A8](v34);
  v8 = &v30[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v6);
  v10 = &v30[-v9];
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41540);
  MEMORY[0x24BDAC7A8](v11);
  v13 = &v30[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41468);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = &v30[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  a2(v16);
  if ((a3 & 1) != 0)
  {
    v39 = v31;
    v24 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41410);
    v25 = sub_23C1BC328(&qword_256B41420, &qword_256B41410, MEMORY[0x24BDF43B0]);
    v35 = v24;
    v36 = (ValueMetadata *)v25;
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    v27 = sub_23C1CA884();
    sub_23C1FBA38();
    (*(void (**)(_BYTE *, uint64_t))(v15 + 8))(v18, v14);
    v28 = v32;
    v29 = v34;
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v32 + 32))(v10, v8, v34);
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v28 + 16))(v13, v10, v29);
    swift_storeEnumTagMultiPayload();
    v35 = v14;
    v36 = &type metadata for MarketingPlainButtonStyle;
    v37 = OpaqueTypeConformance2;
    v38 = v27;
    swift_getOpaqueTypeConformance2();
    sub_23C1FB768();
    return (*(uint64_t (**)(_BYTE *, uint64_t))(v28 + 8))(v10, v29);
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v15 + 16))(v13, v18, v14);
    swift_storeEnumTagMultiPayload();
    v19 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41410);
    v20 = sub_23C1BC328(&qword_256B41420, &qword_256B41410, MEMORY[0x24BDF43B0]);
    v35 = v19;
    v36 = (ValueMetadata *)v20;
    v21 = swift_getOpaqueTypeConformance2();
    v22 = sub_23C1CA884();
    v35 = v14;
    v36 = &type metadata for MarketingPlainButtonStyle;
    v37 = v21;
    v38 = v22;
    swift_getOpaqueTypeConformance2();
    sub_23C1FB768();
    return (*(uint64_t (**)(_BYTE *, uint64_t))(v15 + 8))(v18, v14);
  }
}

uint64_t sub_23C1CBA90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  __int128 v8;

  swift_getKeyPath();
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a3;
  *(_QWORD *)(v7 + 24) = a4;
  v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v7 + 32) = *(_OWORD *)a2;
  *(_OWORD *)(v7 + 48) = v8;
  *(_QWORD *)(v7 + 64) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  sub_23C1CC430(a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B40B80);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B41558);
  sub_23C1BC328(&qword_256B41560, &qword_256B40B80, MEMORY[0x24BEE12D8]);
  sub_23C1CCB84();
  sub_23C1CCBCC();
  return sub_23C1FBB94();
}

uint64_t sub_23C1CBBA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  int v16;
  unint64_t v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v21;
  uint64_t v22;
  _BYTE v23[8];
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  char v36;

  v22 = a5;
  v9 = type metadata accessor for MarketingActionItem();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = *(_BYTE *)(a2 + 17);
  v13 = *(_OWORD *)(a2 + 16);
  v33 = *(_OWORD *)a2;
  v34 = v13;
  v35 = *(_QWORD *)(a2 + 32);
  type metadata accessor for MarketingButton(0, a3, a4, v14);
  sub_23C1C87DC();
  swift_getKeyPath();
  sub_23C1FBC54();
  swift_release();
  swift_release();
  v23[0] = v28;
  v24 = v29;
  v25 = v30;
  v26 = v31;
  v27 = v32;
  v15 = *(_OWORD *)(a2 + 16);
  v33 = *(_OWORD *)a2;
  v34 = v15;
  v35 = *(_QWORD *)(a2 + 32);
  sub_23C1C87DC();
  swift_getKeyPath();
  sub_23C1FBC54();
  swift_release();
  swift_release();
  v16 = v33;
  sub_23C1CCECC(a1, (uint64_t)v12);
  v17 = (*(unsigned __int8 *)(v10 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = a3;
  *(_QWORD *)(v18 + 24) = a4;
  v19 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v18 + 32) = *(_OWORD *)a2;
  *(_OWORD *)(v18 + 48) = v19;
  *(_QWORD *)(v18 + 64) = *(_QWORD *)(a2 + 32);
  sub_23C1CD008((uint64_t)v12, v18 + v17, (uint64_t (*)(_QWORD))type metadata accessor for MarketingActionItem);
  sub_23C1CC430(a2);
  sub_23C1E0F58(a1, (uint64_t)v23, v16, (uint64_t)sub_23C1CD04C, v18, v22);
  return swift_release();
}

uint64_t sub_23C1CBD90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  _OWORD v15[2];
  uint64_t v16;

  v8 = type metadata accessor for MarketingButtonAction();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_OWORD *)(a1 + 16);
  v15[0] = *(_OWORD *)a1;
  v15[1] = v11;
  v16 = *(_QWORD *)(a1 + 32);
  type metadata accessor for MarketingButton(0, a3, a4, v12);
  sub_23C1C87DC();
  sub_23C1CCECC(a2, (uint64_t)v10);
  v13 = type metadata accessor for MarketingActionItem();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v10, 0, 6, v13);
  sub_23C1FBC60();
  swift_release();
  return sub_23C1B5118((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for MarketingButtonAction);
}

uint64_t sub_23C1CBE84@<X0>(int a1@<W0>, __int128 *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
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
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  void (*v33)(char *, char *, uint64_t);
  void (*v34)(char *, uint64_t);
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v54;
  uint64_t v55;
  uint64_t OpaqueTypeConformance2;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD v64[2];
  __int128 v65;
  __int128 v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  _QWORD v72[2];
  _QWORD v73[3];

  LODWORD(v57) = a1;
  v61 = a5;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41430);
  OpaqueTypeConformance2 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v55 = (uint64_t)&v54 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41410);
  v11 = sub_23C1FB600();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41418);
  v12 = sub_23C1FB600();
  v13 = sub_23C1BC328(&qword_256B41420, &qword_256B41410, MEMORY[0x24BDF43B0]);
  v73[0] = a4;
  v73[1] = MEMORY[0x24BDEDBB8];
  v14 = MEMORY[0x24BDED308];
  v15 = MEMORY[0x242619B10](MEMORY[0x24BDED308], v11, v73);
  v16 = v10;
  v17 = sub_23C1BC328(&qword_256B41428, &qword_256B41418, MEMORY[0x24BDF06D0]);
  v72[0] = v15;
  v72[1] = v17;
  v18 = MEMORY[0x242619B10](v14, v12, v72);
  *(_QWORD *)&v65 = v10;
  *((_QWORD *)&v65 + 1) = v12;
  v62 = v18;
  v63 = v12;
  *(_QWORD *)&v66 = v13;
  *((_QWORD *)&v66 + 1) = v18;
  v19 = MEMORY[0x242619ABC](0, &v65, MEMORY[0x24BDF2838], 0);
  v20 = *(_QWORD *)(v19 - 8);
  v21 = MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v54 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)&v54 - v24;
  v60 = v8;
  v26 = sub_23C1FB774();
  v58 = *(_QWORD *)(v26 - 8);
  v59 = v26;
  MEMORY[0x24BDAC7A8](v26);
  v28 = (char *)&v54 - v27;
  v30 = type metadata accessor for MarketingButton(0, a3, a4, v29);
  v31 = MEMORY[0x24BDF1F80];
  v32 = a2[1];
  v65 = *a2;
  v66 = v32;
  v67 = *((_QWORD *)a2 + 4);
  if ((v57 & 1) != 0)
  {
    sub_23C1C8A8C(v30, v23);
    *(_QWORD *)&v65 = v16;
    *((_QWORD *)&v65 + 1) = v63;
    *(_QWORD *)&v66 = v13;
    *((_QWORD *)&v66 + 1) = v62;
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    v33 = *(void (**)(char *, char *, uint64_t))(v20 + 16);
    v33(v25, v23, v19);
    v57 = v16;
    v34 = *(void (**)(char *, uint64_t))(v20 + 8);
    v34(v23, v19);
    v33(v23, v25, v19);
    v35 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41438);
    v36 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41440);
    v37 = sub_23C1CA840();
    v38 = sub_23C1BC328(&qword_256B41450, &qword_256B41438, MEMORY[0x24BDF5428]);
    *(_QWORD *)&v65 = v57;
    *((_QWORD *)&v65 + 1) = MEMORY[0x24BEE0D00];
    *(_QWORD *)&v66 = v35;
    v31 = MEMORY[0x24BDF1F80];
    *((_QWORD *)&v66 + 1) = MEMORY[0x24BDF1FA8];
    v67 = v36;
    v68 = v13;
    v69 = v37;
    v70 = v38;
    v71 = MEMORY[0x24BDF1F80];
    swift_getOpaqueTypeConformance2();
    sub_23C1EA404((uint64_t)v23, v19);
    v34(v23, v19);
    v34(v25, v19);
    v16 = v57;
  }
  else
  {
    v39 = v55;
    sub_23C1C9260(v30, v55);
    *(_QWORD *)&v65 = v16;
    *((_QWORD *)&v65 + 1) = v63;
    *(_QWORD *)&v66 = v13;
    *((_QWORD *)&v66 + 1) = v62;
    v57 = swift_getOpaqueTypeConformance2();
    v40 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41438);
    v41 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41440);
    v42 = sub_23C1CA840();
    v43 = sub_23C1BC328(&qword_256B41450, &qword_256B41438, MEMORY[0x24BDF5428]);
    *(_QWORD *)&v65 = v16;
    *((_QWORD *)&v65 + 1) = MEMORY[0x24BEE0D00];
    *(_QWORD *)&v66 = v40;
    *((_QWORD *)&v66 + 1) = MEMORY[0x24BDF1FA8];
    v67 = v41;
    v68 = v13;
    v69 = v42;
    v70 = v43;
    v71 = v31;
    swift_getOpaqueTypeConformance2();
    v44 = v60;
    sub_23C1EA4C8(v39, v19, v60);
    (*(void (**)(uint64_t, uint64_t))(OpaqueTypeConformance2 + 8))(v39, v44);
  }
  *(_QWORD *)&v65 = v16;
  *((_QWORD *)&v65 + 1) = v63;
  *(_QWORD *)&v66 = v13;
  *((_QWORD *)&v66 + 1) = v62;
  v45 = swift_getOpaqueTypeConformance2();
  v46 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41438);
  v47 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41440);
  v48 = sub_23C1CA840();
  v49 = sub_23C1BC328(&qword_256B41450, &qword_256B41438, MEMORY[0x24BDF5428]);
  *(_QWORD *)&v65 = v16;
  *((_QWORD *)&v65 + 1) = MEMORY[0x24BEE0D00];
  *(_QWORD *)&v66 = v46;
  *((_QWORD *)&v66 + 1) = MEMORY[0x24BDF1FA8];
  v67 = v47;
  v68 = v13;
  v69 = v48;
  v70 = v49;
  v71 = v31;
  v50 = swift_getOpaqueTypeConformance2();
  v64[0] = v45;
  v64[1] = v50;
  v51 = v59;
  MEMORY[0x242619B10](MEMORY[0x24BDEF3E0], v59, v64);
  v52 = v58;
  (*(void (**)(uint64_t, char *, uint64_t))(v58 + 16))(v61, v28, v51);
  return (*(uint64_t (**)(char *, uint64_t))(v52 + 8))(v28, v51);
}

uint64_t sub_23C1CC408()
{
  return swift_release();
}

uint64_t sub_23C1CC410()
{
  uint64_t v0;

  return sub_23C1C9178(v0 + 32, *(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), 1);
}

uint64_t sub_23C1CC430(uint64_t a1)
{
  sub_23C1CC46C();
  swift_retain();
  return a1;
}

uint64_t sub_23C1CC46C()
{
  return swift_retain();
}

uint64_t sub_23C1CC474()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23C1CC4B0()
{
  return sub_23C1FBA5C();
}

uint64_t sub_23C1CC4CC()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_23C1CC4D4()
{
  sub_23C1CC408();
  return swift_release();
}

uint64_t sub_23C1CC504(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;

  v4 = *a2;
  v5 = a2[1];
  v6 = *((_BYTE *)a2 + 16);
  sub_23C1CC46C();
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6;
  *(_BYTE *)(a1 + 17) = *((_BYTE *)a2 + 17);
  v7 = a2[4];
  *(_QWORD *)(a1 + 24) = a2[3];
  *(_QWORD *)(a1 + 32) = v7;
  swift_retain();
  return a1;
}

uint64_t sub_23C1CC56C(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;

  v4 = *a2;
  v5 = a2[1];
  v6 = *((_BYTE *)a2 + 16);
  sub_23C1CC46C();
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6;
  sub_23C1CC408();
  *(_BYTE *)(a1 + 17) = *((_BYTE *)a2 + 17);
  v7 = a2[4];
  *(_QWORD *)(a1 + 24) = a2[3];
  *(_QWORD *)(a1 + 32) = v7;
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

uint64_t sub_23C1CC600(uint64_t a1, uint64_t a2)
{
  char v4;

  v4 = *(_BYTE *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v4;
  sub_23C1CC408();
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  return a1;
}

uint64_t sub_23C1CC65C(uint64_t a1, int a2)
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

uint64_t sub_23C1CC6A4(uint64_t result, int a2, int a3)
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

uint64_t type metadata accessor for MarketingButton(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for MarketingButton);
}

uint64_t sub_23C1CC6F8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t OpaqueTypeConformance2;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v26[2];
  uint64_t v27;
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  uint64_t v32;
  ValueMetadata *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[2];
  _QWORD v42[3];

  v1 = *(_QWORD *)(a1 + 8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41400);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41408);
  v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41410);
  v3 = sub_23C1FB600();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41418);
  v4 = sub_23C1FB600();
  v5 = sub_23C1BC328(&qword_256B41420, &qword_256B41410, MEMORY[0x24BDF43B0]);
  v42[0] = v1;
  v42[1] = MEMORY[0x24BDEDBB8];
  v6 = MEMORY[0x24BDED308];
  v41[0] = MEMORY[0x242619B10](MEMORY[0x24BDED308], v3, v42);
  v41[1] = sub_23C1BC328(&qword_256B41428, &qword_256B41418, MEMORY[0x24BDF06D0]);
  v7 = MEMORY[0x242619B10](v6, v4, v41);
  v32 = v2;
  v33 = (ValueMetadata *)v4;
  v34 = v5;
  v35 = v7;
  MEMORY[0x242619ABC](255, &v32, MEMORY[0x24BDF2838], 0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41430);
  v8 = sub_23C1FB774();
  v32 = v2;
  v33 = (ValueMetadata *)v4;
  v34 = v5;
  v35 = v7;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v10 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41438);
  v11 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41440);
  v12 = sub_23C1CA840();
  v13 = sub_23C1BC328(&qword_256B41450, &qword_256B41438, MEMORY[0x24BDF5428]);
  v32 = v2;
  v33 = (ValueMetadata *)MEMORY[0x24BEE0D00];
  v34 = v10;
  v35 = MEMORY[0x24BDF1FA8];
  v36 = v11;
  v37 = v5;
  v38 = v12;
  v39 = v13;
  v40 = MEMORY[0x24BDF1F80];
  v31[0] = OpaqueTypeConformance2;
  v31[1] = swift_getOpaqueTypeConformance2();
  v14 = MEMORY[0x24BDEF3E0];
  v15 = MEMORY[0x242619B10](MEMORY[0x24BDEF3E0], v8, v31);
  v16 = sub_23C1CA884();
  v32 = v8;
  v33 = &type metadata for MarketingPlainButtonStyle;
  v34 = v15;
  v35 = v16;
  MEMORY[0x242619ABC](255, &v32, MEMORY[0x24BDF22B8], 0);
  v17 = sub_23C1FB774();
  v18 = sub_23C1FB774();
  v19 = sub_23C1FB774();
  v20 = sub_23C1FBB40();
  v21 = sub_23C1CA8C8();
  v22 = sub_23C1BC328(qword_256B41470, &qword_256B41408, MEMORY[0x24BDF4700]);
  v32 = v8;
  v33 = &type metadata for MarketingPlainButtonStyle;
  v34 = v15;
  v35 = v16;
  v30[0] = v15;
  v30[1] = swift_getOpaqueTypeConformance2();
  v29[0] = v22;
  v29[1] = MEMORY[0x242619B10](v14, v17, v30);
  v28[0] = v21;
  v28[1] = MEMORY[0x242619B10](v14, v18, v29);
  v27 = MEMORY[0x242619B10](v14, v19, v28);
  v23 = MEMORY[0x242619B10](MEMORY[0x24BDF3F50], v20, &v27);
  v32 = v20;
  v33 = (ValueMetadata *)v23;
  MEMORY[0x242619ABC](255, &v32, MEMORY[0x24BE37C20], 0);
  v24 = sub_23C1FB600();
  v32 = v20;
  v33 = (ValueMetadata *)v23;
  v26[0] = swift_getOpaqueTypeConformance2();
  v26[1] = MEMORY[0x24BDF0910];
  return MEMORY[0x242619B10](MEMORY[0x24BDED308], v24, v26);
}

uint64_t sub_23C1CCAB8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23C1CBE84(*(unsigned __int8 *)(v1 + 32), *(__int128 **)(v1 + 40), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_23C1CCAC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41408);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23C1CCB10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  v5 = type metadata accessor for MarketingButton(0, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24), a4);
  return sub_23C1C8900(v5);
}

uint64_t sub_23C1CCB60()
{
  return sub_23C1CD22C();
}

uint64_t sub_23C1CCB78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_23C1CBBA8(a1, v2 + 32, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), a2);
}

unint64_t sub_23C1CCB84()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256B41568;
  if (!qword_256B41568)
  {
    v1 = type metadata accessor for MarketingActionItem();
    result = MEMORY[0x242619B10](&protocol conformance descriptor for MarketingActionItem, v1);
    atomic_store(result, (unint64_t *)&qword_256B41568);
  }
  return result;
}

unint64_t sub_23C1CCBCC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256B41570;
  if (!qword_256B41570)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41558);
    v2[0] = sub_23C1BC328(&qword_256B41420, &qword_256B41410, MEMORY[0x24BDF43B0]);
    v2[1] = sub_23C1CCC68(&qword_256B41578, &qword_256B41580, sub_23C1CCCD4);
    result = MEMORY[0x242619B10](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256B41570);
  }
  return result;
}

uint64_t sub_23C1CCC68(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t result;
  uint64_t v6;
  _QWORD v7[2];

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7[0] = a3();
    v7[1] = sub_23C1CCD94();
    result = MEMORY[0x242619B10](MEMORY[0x24BDEF3E0], v6, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23C1CCCD4()
{
  return sub_23C1CCC68(&qword_256B41588, &qword_256B41590, (uint64_t (*)(void))sub_23C1CCCF0);
}

unint64_t sub_23C1CCCF0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_256B41598;
  if (!qword_256B41598)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B415A0);
    v2 = MEMORY[0x24BDF4700];
    v3[0] = sub_23C1BC328(&qword_256B415A8, &qword_256B415B0, MEMORY[0x24BDF4700]);
    v3[1] = sub_23C1BC328(&qword_256B415B8, &qword_256B415C0, v2);
    result = MEMORY[0x242619B10](MEMORY[0x24BDEF3E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256B41598);
  }
  return result;
}

unint64_t sub_23C1CCD94()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t OpaqueTypeConformance2;
  _QWORD v5[6];

  result = qword_256B415C8;
  if (!qword_256B415C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B415D0);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B415D8);
    v3 = sub_23C1BC328(&qword_256B415E0, &qword_256B415D8, MEMORY[0x24BDF43B0]);
    sub_23C1CA884();
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    v5[2] = v2;
    v5[3] = &type metadata for MarketingRoundButtonStyle;
    v5[4] = v3;
    v5[5] = sub_23C1CCE88();
    v5[0] = OpaqueTypeConformance2;
    v5[1] = swift_getOpaqueTypeConformance2();
    result = MEMORY[0x242619B10](MEMORY[0x24BDEF3E0], v1, v5);
    atomic_store(result, (unint64_t *)&qword_256B415C8);
  }
  return result;
}

unint64_t sub_23C1CCE88()
{
  unint64_t result;

  result = qword_256B415E8;
  if (!qword_256B415E8)
  {
    result = MEMORY[0x242619B10](&unk_23C1FF7CC, &type metadata for MarketingRoundButtonStyle);
    atomic_store(result, (unint64_t *)&qword_256B415E8);
  }
  return result;
}

uint64_t sub_23C1CCECC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MarketingActionItem();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23C1CCF10()
{
  uint64_t v0;
  uint64_t v1;
  int EnumCaseMultiPayload;
  uint64_t v3;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for MarketingActionItem() - 8) + 80);
  sub_23C1CC408();
  swift_release();
  type metadata accessor for MarketingAction();
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
  {
    v3 = sub_23C1FB468();
    goto LABEL_6;
  }
  if (!EnumCaseMultiPayload)
  {
    v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40928);
LABEL_6:
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v0 + ((v1 + 72) & ~v1), v3);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23C1CD008(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_23C1CD04C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 24);
  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for MarketingActionItem() - 8) + 80);
  return sub_23C1CBD90(v0 + 32, v0 + ((v3 + 72) & ~v3), v1, v2);
}

uint64_t sub_23C1CD09C()
{
  uint64_t v0;

  return sub_23C1C9178(v0 + 32, *(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), 2);
}

uint64_t sub_23C1CD0BC()
{
  return sub_23C1CD22C();
}

uint64_t sub_23C1CD0D4@<X0>(char *a1@<X8>)
{
  uint64_t v1;

  return sub_23C1C8E84(v1 + 32, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_23C1CD0E4()
{
  uint64_t v0;

  return sub_23C1C9178(v0 + 32, *(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), 4);
}

uint64_t sub_23C1CD104@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23C1C975C(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_23C1CD140()
{
  uint64_t v0;

  return sub_23C1C9178(v0 + 32, *(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), 3);
}

uint64_t sub_23C1CD160()
{
  return sub_23C1CD22C();
}

void sub_23C1CD174(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;

  sub_23C1C9918(a1, v2[4], v2[2], v2[3], a2);
}

uint64_t sub_23C1CD180@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23C1CA05C(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_23C1CD190()
{
  uint64_t v0;

  return sub_23C1C9178(v0 + 32, *(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), 5);
}

uint64_t sub_23C1CD1B0()
{
  return sub_23C1CD22C();
}

uint64_t objectdestroy_2Tm()
{
  sub_23C1CC408();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23C1CD1F8()
{
  uint64_t v0;

  return sub_23C1C9178(v0 + 32, *(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), 6);
}

uint64_t sub_23C1CD218()
{
  return sub_23C1CD22C();
}

uint64_t sub_23C1CD22C()
{
  return sub_23C1FBB58();
}

uint64_t sub_23C1CD284(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B415F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23C1CD2CC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23C1C9EBC(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_23C1CD2D8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23C1C9D30(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_23C1CD2E4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23C1C975C(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x242619A74](a1, v6, a5);
}

uint64_t getEnumTagSinglePayload for MarketingRoundButtonStyle(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && a1[17])
    return (*(_DWORD *)a1 + 253);
  v3 = *a1;
  v4 = v3 >= 4;
  v5 = v3 - 4;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for MarketingRoundButtonStyle(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 253;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 3;
  }
  return result;
}

ValueMetadata *type metadata accessor for MarketingRoundButtonStyle()
{
  return &type metadata for MarketingRoundButtonStyle;
}

uint64_t sub_23C1CD3F0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23C1CD400@<X0>(int a1@<W1>, double a2@<X2>, char a3@<W3>, uint64_t a4@<X8>)
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t);
  char *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  char *v53;
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
  uint64_t v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t KeyPath;
  uint64_t *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t result;
  uint64_t v101;
  char *v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  char *v120;
  char *v121;
  uint64_t v122;
  uint64_t v123;
  int v124;
  double v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;

  v125 = a2;
  LODWORD(v131) = a1;
  v130 = a4;
  v124 = a3 & 1;
  v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B417E8);
  MEMORY[0x24BDAC7A8](v104);
  v103 = (char *)&v101 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v105 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B417D8);
  MEMORY[0x24BDAC7A8](v105);
  v102 = (char *)&v101 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v129 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B417C8);
  v6 = MEMORY[0x24BDAC7A8](v129);
  v106 = (uint64_t)&v101 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v107 = (uint64_t)&v101 - v8;
  v127 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B417F0);
  MEMORY[0x24BDAC7A8](v127);
  v128 = (uint64_t)&v101 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v118 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B417F8);
  MEMORY[0x24BDAC7A8](v118);
  v119 = (uint64_t)&v101 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v126 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B416F0);
  MEMORY[0x24BDAC7A8](v126);
  v120 = (char *)&v101 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_23C1FB96C();
  v122 = *(_QWORD *)(v12 - 8);
  v123 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v121 = (char *)&v101 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41760);
  MEMORY[0x24BDAC7A8](v109);
  v15 = (char *)&v101 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_23C1FB894();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v101 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41758);
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)&v101 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v114 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41800);
  v113 = *(_QWORD *)(v114 - 8);
  MEMORY[0x24BDAC7A8](v114);
  v108 = (char *)&v101 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v110 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41750);
  MEMORY[0x24BDAC7A8](v110);
  v25 = (char *)&v101 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41740);
  MEMORY[0x24BDAC7A8](v111);
  v27 = (char *)&v101 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41730);
  MEMORY[0x24BDAC7A8](v112);
  v29 = (char *)&v101 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41720);
  MEMORY[0x24BDAC7A8](v30);
  v116 = (uint64_t)&v101 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v115 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41710);
  MEMORY[0x24BDAC7A8](v115);
  v117 = (uint64_t)&v101 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41700);
  v34 = MEMORY[0x24BDAC7A8](v33);
  v35 = MEMORY[0x24BDAC7A8](v34);
  if (v131 >= 2u)
  {
    v82 = v20;
    v83 = v104;
    v84 = (uint64_t)v103;
    v85 = (uint64_t)v102;
    if (v131 == 3)
    {
      sub_23C1FB8A0();
      KeyPath = swift_getKeyPath();
      (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v22, v19, v16);
      v87 = (uint64_t *)&v22[*(int *)(v82 + 36)];
      *v87 = KeyPath;
      v87[1] = 0x3FE6666666666666;
      (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
      v88 = swift_getKeyPath();
      sub_23C1BF6E4((uint64_t)v22, v84, &qword_256B41758);
      v89 = v84 + *(int *)(v83 + 36);
      *(_QWORD *)v89 = v88;
      *(_QWORD *)(v89 + 8) = 1;
      *(_BYTE *)(v89 + 16) = 0;
      sub_23C1BC2EC((uint64_t)v22, &qword_256B41758);
      sub_23C1FB924();
      sub_23C1FB93C();
      sub_23C1FB960();
      swift_release();
      v91 = v121;
      v90 = v122;
      v92 = v123;
      (*(void (**)(char *, _QWORD, uint64_t))(v122 + 104))(v121, *MEMORY[0x24BDF17C8], v123);
      v93 = sub_23C1FB984();
      swift_release();
      (*(void (**)(char *, uint64_t))(v90 + 8))(v91, v92);
      v94 = swift_getKeyPath();
      sub_23C1BF6E4(v84, v85, &qword_256B417E8);
      v95 = (uint64_t *)(v85 + *(int *)(v105 + 36));
      *v95 = v94;
      v95[1] = v93;
      sub_23C1BC2EC(v84, &qword_256B417E8);
      v96 = sub_23C1FBBC4();
      v97 = v106;
      sub_23C1DEA70(0.0, 1, 0.0, 1, v125, v124, 0.0, 1, v106, 0.0, 1, 0.0, 1, v96, v98);
      sub_23C1BC2EC(v85, &qword_256B417D8);
      v78 = &qword_256B417C8;
      v99 = v107;
      sub_23C1BF778(v97, v107, &qword_256B417C8);
      sub_23C1BF6E4(v99, v128, &qword_256B417C8);
      swift_storeEnumTagMultiPayload();
      sub_23C1CF1E8();
      sub_23C1CF568();
      sub_23C1FB768();
      v81 = v99;
      return sub_23C1BC2EC(v81, v78);
    }
  }
  else
  {
    v106 = v37;
    v107 = v35;
    v131 = (uint64_t)&v101 - v36;
    sub_23C1FB8A0();
    v38 = swift_getKeyPath();
    (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v22, v19, v16);
    v39 = (uint64_t *)&v22[*(int *)(v20 + 36)];
    *v39 = v38;
    v39[1] = 0x3FE6666666666666;
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
    v40 = *MEMORY[0x24BDECF38];
    v41 = sub_23C1FB5DC();
    v42 = (uint64_t (*)(uint64_t))MEMORY[0x24BDECF50];
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 104))(v15, v40, v41);
    sub_23C1B56F4((unint64_t *)&qword_256B41808, v42, MEMORY[0x24BDECF78]);
    if ((sub_23C1FBC9C() & 1) != 0)
    {
      sub_23C1CF4CC();
      sub_23C1BC328(&qword_256B41788, &qword_256B41760, MEMORY[0x24BEE30C8]);
      v43 = v108;
      sub_23C1FBA68();
      sub_23C1BC2EC((uint64_t)v15, &qword_256B41760);
      sub_23C1BC2EC((uint64_t)v22, &qword_256B41758);
      sub_23C1FB924();
      sub_23C1FB948();
      sub_23C1FB960();
      swift_release();
      v45 = v121;
      v44 = v122;
      v46 = v123;
      (*(void (**)(char *, _QWORD, uint64_t))(v122 + 104))(v121, *MEMORY[0x24BDF17C8], v123);
      v47 = sub_23C1FB984();
      swift_release();
      (*(void (**)(char *, uint64_t))(v44 + 8))(v45, v46);
      v48 = swift_getKeyPath();
      v49 = v113;
      v50 = v114;
      (*(void (**)(char *, char *, uint64_t))(v113 + 16))(v25, v43, v114);
      v51 = (uint64_t *)&v25[*(int *)(v110 + 36)];
      *v51 = v48;
      v51[1] = v47;
      (*(void (**)(char *, uint64_t))(v49 + 8))(v43, v50);
      v52 = swift_getKeyPath();
      sub_23C1BF6E4((uint64_t)v25, (uint64_t)v27, &qword_256B41750);
      v53 = &v27[*(int *)(v111 + 36)];
      *(_QWORD *)v53 = v52;
      *((_QWORD *)v53 + 1) = 2;
      v53[16] = 0;
      sub_23C1BC2EC((uint64_t)v25, &qword_256B41750);
      v54 = sub_23C1FBB04();
      sub_23C1BF6E4((uint64_t)v27, (uint64_t)v29, &qword_256B41740);
      *(_QWORD *)&v29[*(int *)(v112 + 36)] = v54;
      sub_23C1BC2EC((uint64_t)v27, &qword_256B41740);
      v55 = sub_23C1FBBC4();
      v56 = v116;
      sub_23C1DEA18(0.0, 1, 0.0, 1, v125, v124, 0.0, 1, v116, 0.0, 1, 0.0, 1, v55, v57);
      sub_23C1BC2EC((uint64_t)v29, &qword_256B41730);
      LOBYTE(v54) = sub_23C1FB90C();
      sub_23C1FB570();
      v59 = v58;
      v61 = v60;
      v63 = v62;
      v65 = v64;
      v66 = v117;
      sub_23C1BF6E4(v56, v117, &qword_256B41720);
      v67 = v66 + *(int *)(v115 + 36);
      *(_BYTE *)v67 = v54;
      *(_QWORD *)(v67 + 8) = v59;
      *(_QWORD *)(v67 + 16) = v61;
      *(_QWORD *)(v67 + 24) = v63;
      *(_QWORD *)(v67 + 32) = v65;
      *(_BYTE *)(v67 + 40) = 0;
      sub_23C1BC2EC(v56, &qword_256B41720);
      LOBYTE(v54) = sub_23C1FB8DC();
      sub_23C1FB570();
      v69 = v68;
      v71 = v70;
      v73 = v72;
      v75 = v74;
      v76 = v106;
      sub_23C1BF6E4(v66, v106, &qword_256B41710);
      v77 = v76 + *(int *)(v107 + 36);
      *(_BYTE *)v77 = v54;
      *(_QWORD *)(v77 + 8) = v69;
      *(_QWORD *)(v77 + 16) = v71;
      *(_QWORD *)(v77 + 24) = v73;
      *(_QWORD *)(v77 + 32) = v75;
      *(_BYTE *)(v77 + 40) = 0;
      sub_23C1BC2EC(v66, &qword_256B41710);
      v78 = &qword_256B41700;
      v79 = v131;
      sub_23C1BF778(v76, v131, &qword_256B41700);
      sub_23C1BF6E4(v79, v119, &qword_256B41700);
      swift_storeEnumTagMultiPayload();
      sub_23C1CEF0C(&qword_256B416F8, &qword_256B41700, sub_23C1CF274, MEMORY[0x24BDECC60]);
      v80 = (uint64_t)v120;
      sub_23C1FB768();
      sub_23C1BF6E4(v80, v128, &qword_256B416F0);
      swift_storeEnumTagMultiPayload();
      sub_23C1CF1E8();
      sub_23C1CF568();
      sub_23C1FB768();
      sub_23C1BC2EC(v80, &qword_256B416F0);
      v81 = v79;
      return sub_23C1BC2EC(v81, v78);
    }
    __break(1u);
  }
  result = sub_23C1FBE7C();
  __break(1u);
  return result;
}

uint64_t sub_23C1CE054@<X0>(unsigned __int8 a1@<W0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
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
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t KeyPath;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  char *v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  double v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t result;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  int v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;

  v100 = a4;
  v99 = a3;
  v98 = a2;
  v102 = a5;
  v77 = sub_23C1FB708();
  v76 = *(_QWORD *)(v77 - 8);
  MEMORY[0x24BDAC7A8](v77);
  v75 = (char *)&v74 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B416B8);
  v80 = *(_QWORD *)(v81 - 8);
  MEMORY[0x24BDAC7A8](v81);
  v79 = (char *)&v74 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B416A0);
  v8 = MEMORY[0x24BDAC7A8](v106);
  v78 = (uint64_t)&v74 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v82 = (uint64_t)&v74 - v10;
  v103 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B416C0);
  MEMORY[0x24BDAC7A8](v103);
  v104 = (uint64_t)&v74 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B416C8);
  MEMORY[0x24BDAC7A8](v94);
  v95 = (uint64_t)&v74 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v105 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41638);
  MEMORY[0x24BDAC7A8](v105);
  v96 = (char *)&v74 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_23C1FB5AC();
  v93 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v92 = (char *)&v74 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v91 = sub_23C1FB7EC();
  v89 = *(_QWORD *)(v91 - 8);
  MEMORY[0x24BDAC7A8](v91);
  v88 = (char *)&v74 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_23C1FB8B8();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = *(_QWORD *)(v18 + 64);
  MEMORY[0x24BDAC7A8](v17);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41600);
  MEMORY[0x24BDAC7A8](v20);
  v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41670);
  v101 = *(_QWORD *)(v97 - 8);
  MEMORY[0x24BDAC7A8](v97);
  v22 = (char *)&v74 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B416D0);
  v85 = *(_QWORD *)(v86 - 8);
  MEMORY[0x24BDAC7A8](v86);
  v84 = (char *)&v74 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41668);
  MEMORY[0x24BDAC7A8](v83);
  v90 = (char *)&v74 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41658);
  MEMORY[0x24BDAC7A8](v87);
  v26 = (char *)&v74 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41648);
  v28 = MEMORY[0x24BDAC7A8](v27);
  v29 = MEMORY[0x24BDAC7A8](v28);
  if (a1 < 2u)
  {
    v79 = (char *)v14;
    v32 = v100;
    v82 = (uint64_t)&v74 - v30;
    v81 = v29;
    v80 = v31;
    sub_23C1FB888();
    (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))((char *)&v74 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0), v32, v17);
    v33 = (*(unsigned __int8 *)(v18 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
    v34 = swift_allocObject();
    v35 = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v18 + 32))(v34 + v33, (char *)&v74 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0), v17);
    MEMORY[0x24BDAC7A8](v35);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B416D8);
    sub_23C1CF178(&qword_256B416E0, &qword_256B416D8, (uint64_t (*)(void))sub_23C1CF1E8, sub_23C1CF568);
    sub_23C1FBB64();
    v36 = v88;
    sub_23C1FB7E0();
    sub_23C1BC328(&qword_256B41678, &qword_256B41670, MEMORY[0x24BDF43B0]);
    sub_23C1B56F4(&qword_256B41680, (uint64_t (*)(uint64_t))MEMORY[0x24BDF0DA8], MEMORY[0x24BDF0D88]);
    v37 = v84;
    v38 = v97;
    v39 = v91;
    sub_23C1FBA38();
    (*(void (**)(char *, uint64_t))(v89 + 8))(v36, v39);
    (*(void (**)(char *, uint64_t))(v101 + 8))(v22, v38);
    v40 = v93;
    v41 = v92;
    v42 = v79;
    (*(void (**)(char *, _QWORD, char *))(v93 + 104))(v92, *MEMORY[0x24BDEB498], v79);
    KeyPath = swift_getKeyPath();
    v44 = (uint64_t)v90;
    v45 = (uint64_t *)&v90[*(int *)(v83 + 36)];
    v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41690);
    (*(void (**)(char *, char *, char *))(v40 + 16))((char *)v45 + *(int *)(v46 + 28), v41, v42);
    *v45 = KeyPath;
    v47 = v85;
    v48 = v86;
    (*(void (**)(uint64_t, char *, uint64_t))(v85 + 16))(v44, v37, v86);
    (*(void (**)(char *, char *))(v40 + 8))(v41, v42);
    (*(void (**)(char *, uint64_t))(v47 + 8))(v37, v48);
    sub_23C1FBBC4();
    sub_23C1FB630();
    sub_23C1BF6E4(v44, (uint64_t)v26, &qword_256B41668);
    v49 = &v26[*(int *)(v87 + 36)];
    v50 = v112;
    *((_OWORD *)v49 + 4) = v111;
    *((_OWORD *)v49 + 5) = v50;
    *((_OWORD *)v49 + 6) = v113;
    v51 = v108;
    *(_OWORD *)v49 = v107;
    *((_OWORD *)v49 + 1) = v51;
    v52 = v110;
    *((_OWORD *)v49 + 2) = v109;
    *((_OWORD *)v49 + 3) = v52;
    sub_23C1BC2EC(v44, &qword_256B41668);
    v53 = v80;
    sub_23C1BF6E4((uint64_t)v26, v80, &qword_256B41658);
    *(_WORD *)(v53 + *(int *)(v81 + 36)) = 256;
    sub_23C1BC2EC((uint64_t)v26, &qword_256B41658);
    v54 = &qword_256B41648;
    v55 = v82;
    sub_23C1BF778(v53, v82, &qword_256B41648);
    sub_23C1BF6E4(v55, v95, &qword_256B41648);
    swift_storeEnumTagMultiPayload();
    sub_23C1CEF0C(&qword_256B41640, &qword_256B41648, sub_23C1CEEE8, MEMORY[0x24BDEDB80]);
    v56 = (uint64_t)v96;
    sub_23C1FB768();
    sub_23C1BF6E4(v56, v104, &qword_256B41638);
    swift_storeEnumTagMultiPayload();
    sub_23C1CEE5C();
    sub_23C1CF07C();
    sub_23C1FB768();
    sub_23C1BC2EC(v56, &qword_256B41638);
    v57 = v55;
    return sub_23C1BC2EC(v57, v54);
  }
  v96 = v22;
  v58 = v100;
  if (a1 == 3)
  {
    sub_23C1FB888();
    (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))((char *)&v74 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0), v58, v17);
    v59 = (*(unsigned __int8 *)(v18 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
    v60 = swift_allocObject();
    v61 = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v18 + 32))(v60 + v59, (char *)&v74 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0), v17);
    MEMORY[0x24BDAC7A8](v61);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B416D8);
    sub_23C1CF178(&qword_256B416E0, &qword_256B416D8, (uint64_t (*)(void))sub_23C1CF1E8, sub_23C1CF568);
    v62 = v96;
    sub_23C1FBB64();
    v63 = v75;
    sub_23C1FB6FC();
    sub_23C1BC328(&qword_256B41678, &qword_256B41670, MEMORY[0x24BDF43B0]);
    sub_23C1B56F4(&qword_256B416A8, (uint64_t (*)(uint64_t))MEMORY[0x24BDEE8E8], MEMORY[0x24BDEE8D8]);
    v64 = v79;
    v65 = v97;
    v66 = v77;
    sub_23C1FBA38();
    (*(void (**)(char *, uint64_t))(v76 + 8))(v63, v66);
    (*(void (**)(char *, uint64_t))(v101 + 8))(v62, v65);
    v67 = sub_23C1FBBC4();
    v68 = v78;
    v70 = sub_23C1DEC94(0.0, 1, 0.0, 1, 440.0, 0, 0.0, 1, v78, 0.0, 1, 0.0, 1, v67, v69);
    (*(void (**)(char *, uint64_t, double))(v80 + 8))(v64, v81, v70);
    v54 = &qword_256B416A0;
    v71 = v68;
    v72 = v82;
    sub_23C1BF778(v71, v82, &qword_256B416A0);
    sub_23C1BF6E4(v72, v104, &qword_256B416A0);
    swift_storeEnumTagMultiPayload();
    sub_23C1CEE5C();
    sub_23C1CF07C();
    sub_23C1FB768();
    v57 = v72;
    return sub_23C1BC2EC(v57, v54);
  }
  result = sub_23C1FBE7C();
  __break(1u);
  return result;
}

uint64_t sub_23C1CEC98(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v12;

  v3 = sub_23C1FB750();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x24BDEF120];
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41610);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23C1CE054(*(_BYTE *)v1, *(_QWORD *)(v1 + 8), *(unsigned __int8 *)(v1 + 16), a1, (uint64_t)v10);
  sub_23C1FB744();
  sub_23C1CEDD8();
  sub_23C1B56F4(&qword_256B416B0, v4, MEMORY[0x24BDEF108]);
  sub_23C1FBA20();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v3);
  return sub_23C1BC2EC((uint64_t)v10, &qword_256B41610);
}

unint64_t sub_23C1CEDD8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_256B41618;
  if (!qword_256B41618)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41610);
    v2 = sub_23C1CF178(&qword_256B41620, &qword_256B41628, (uint64_t (*)(void))sub_23C1CEE5C, (uint64_t (*)(void))sub_23C1CF07C);
    result = MEMORY[0x242619B10](MEMORY[0x24BDF3F50], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_256B41618);
  }
  return result;
}

unint64_t sub_23C1CEE5C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_256B41630;
  if (!qword_256B41630)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41638);
    v2 = sub_23C1CEF0C(&qword_256B41640, &qword_256B41648, sub_23C1CEEE8, MEMORY[0x24BDEDB80]);
    v3[0] = MEMORY[0x24BDF5560];
    v3[1] = v2;
    result = MEMORY[0x242619B10](MEMORY[0x24BDEF3E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256B41630);
  }
  return result;
}

uint64_t sub_23C1CEEE8()
{
  return sub_23C1CEF0C(&qword_256B41650, &qword_256B41658, (uint64_t (*)(void))sub_23C1CEF74, MEMORY[0x24BDEDBB8]);
}

uint64_t sub_23C1CEF0C(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[0] = a3();
    v9[1] = a4;
    result = MEMORY[0x242619B10](MEMORY[0x24BDED308], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23C1CEF74()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  _QWORD v5[6];

  result = qword_256B41660;
  if (!qword_256B41660)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41668);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41670);
    v3 = sub_23C1FB7EC();
    v4 = (uint64_t (*)(uint64_t))MEMORY[0x24BDF0DA8];
    v5[2] = v2;
    v5[3] = v3;
    v5[4] = sub_23C1BC328(&qword_256B41678, &qword_256B41670, MEMORY[0x24BDF43B0]);
    v5[5] = sub_23C1B56F4(&qword_256B41680, v4, MEMORY[0x24BDF0D88]);
    v5[0] = swift_getOpaqueTypeConformance2();
    v5[1] = sub_23C1BC328(&qword_256B41688, &qword_256B41690, MEMORY[0x24BDF1028]);
    result = MEMORY[0x242619B10](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_256B41660);
  }
  return result;
}

unint64_t sub_23C1CF07C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  _QWORD v5[6];

  result = qword_256B41698;
  if (!qword_256B41698)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B416A0);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41670);
    v3 = sub_23C1FB708();
    v4 = (uint64_t (*)(uint64_t))MEMORY[0x24BDEE8E8];
    v5[2] = v2;
    v5[3] = v3;
    v5[4] = sub_23C1BC328(&qword_256B41678, &qword_256B41670, MEMORY[0x24BDF43B0]);
    v5[5] = sub_23C1B56F4(&qword_256B416A8, v4, MEMORY[0x24BDEE8D8]);
    v5[0] = swift_getOpaqueTypeConformance2();
    v5[1] = MEMORY[0x24BDEDBB8];
    result = MEMORY[0x242619B10](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_256B41698);
  }
  return result;
}

uint64_t sub_23C1CF178(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t (*a4)(void))
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[0] = a3();
    v9[1] = a4();
    result = MEMORY[0x242619B10](MEMORY[0x24BDEF3E0], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23C1CF1E8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_256B416E8;
  if (!qword_256B416E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B416F0);
    v2 = sub_23C1CEF0C(&qword_256B416F8, &qword_256B41700, sub_23C1CF274, MEMORY[0x24BDECC60]);
    v3[0] = MEMORY[0x24BDF5560];
    v3[1] = v2;
    result = MEMORY[0x242619B10](MEMORY[0x24BDEF3E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256B416E8);
  }
  return result;
}

uint64_t sub_23C1CF274()
{
  return sub_23C1CEF0C(&qword_256B41708, &qword_256B41710, sub_23C1CF298, MEMORY[0x24BDECC60]);
}

uint64_t sub_23C1CF298()
{
  return sub_23C1CEF0C(&qword_256B41718, &qword_256B41720, (uint64_t (*)(void))sub_23C1CF2BC, MEMORY[0x24BDEDBB8]);
}

unint64_t sub_23C1CF2BC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256B41728;
  if (!qword_256B41728)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41730);
    v2[0] = sub_23C1CF358(&qword_256B41738, &qword_256B41740, (uint64_t (*)(void))sub_23C1CF3DC);
    v2[1] = sub_23C1BC328(&qword_256B417B0, &qword_256B417B8, MEMORY[0x24BDF0710]);
    result = MEMORY[0x242619B10](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256B41728);
  }
  return result;
}

uint64_t sub_23C1CF358(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t result;
  uint64_t v6;
  _QWORD v7[2];

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7[0] = a3();
    v7[1] = sub_23C1BC328(&qword_256B417A0, &qword_256B417A8, MEMORY[0x24BDF1028]);
    result = MEMORY[0x242619B10](MEMORY[0x24BDED308], v6, v7);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23C1CF3DC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[6];

  result = qword_256B41748;
  if (!qword_256B41748)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41750);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41758);
    v2[3] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41760);
    v2[4] = sub_23C1CF4CC();
    v2[5] = sub_23C1BC328(&qword_256B41788, &qword_256B41760, MEMORY[0x24BEE30C8]);
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = sub_23C1BC328(&qword_256B41790, &qword_256B41798, MEMORY[0x24BDF1028]);
    result = MEMORY[0x242619B10](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256B41748);
  }
  return result;
}

unint64_t sub_23C1CF4CC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256B41768;
  if (!qword_256B41768)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41758);
    v2[0] = sub_23C1B56F4(&qword_256B41770, (uint64_t (*)(uint64_t))MEMORY[0x24BDF12C8], MEMORY[0x24BDF12C0]);
    v2[1] = sub_23C1BC328(&qword_256B41778, &qword_256B41780, MEMORY[0x24BDF1028]);
    result = MEMORY[0x242619B10](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256B41768);
  }
  return result;
}

uint64_t sub_23C1CF568()
{
  return sub_23C1CEF0C(&qword_256B417C0, &qword_256B417C8, (uint64_t (*)(void))sub_23C1CF58C, MEMORY[0x24BDEDBB8]);
}

unint64_t sub_23C1CF58C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256B417D0;
  if (!qword_256B417D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B417D8);
    v2[0] = sub_23C1CF358(&qword_256B417E0, &qword_256B417E8, (uint64_t (*)(void))sub_23C1CF4CC);
    v2[1] = sub_23C1BC328(&qword_256B41790, &qword_256B41798, MEMORY[0x24BDF1028]);
    result = MEMORY[0x242619B10](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256B417D0);
  }
  return result;
}

uint64_t objectdestroyTm()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_23C1FB8B8();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_23C1CF68C()
{
  sub_23C1FB8B8();
  return sub_23C1FB8AC();
}

uint64_t sub_23C1CF6C4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23C1CD400(*(unsigned __int8 *)(v1 + 16), *(double *)(v1 + 24), *(_BYTE *)(v1 + 32), a1);
}

uint64_t sub_23C1CF6D8()
{
  return sub_23C1FB660();
}

uint64_t sub_23C1CF6F8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v7;

  v2 = sub_23C1FB5AC();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v5 + 16))(v4, a1);
  return MEMORY[0x242618D3C](v4);
}

uint64_t sub_23C1CF790()
{
  uint64_t (*v0)(uint64_t);

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41610);
  sub_23C1FB750();
  v0 = (uint64_t (*)(uint64_t))MEMORY[0x24BDEF120];
  sub_23C1CEDD8();
  sub_23C1B56F4(&qword_256B416B0, v0, MEMORY[0x24BDEF108]);
  return swift_getOpaqueTypeConformance2();
}

id MarketingDynamicViewController.coordinator.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC16FitnessMarketing30MarketingDynamicViewController_coordinator);
}

uint64_t sub_23C1CF828@<X0>(_QWORD *a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)();

  v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC16FitnessMarketing30MarketingDynamicViewController_onPop);
  swift_beginAccess();
  v4 = *v3;
  v5 = v3[1];
  if (v4)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_23C1D13D4;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)())v6;
  return sub_23C1CF980(v4);
}

uint64_t sub_23C1CF8BC(uint64_t *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();
  uint64_t *v7;
  uint64_t v8;

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_23C1D13D4;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC16FitnessMarketing30MarketingDynamicViewController_onPop);
  swift_beginAccess();
  v8 = *v7;
  *v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_23C1CF980(v3);
  return sub_23C1CF99C(v8);
}

uint64_t MarketingDynamicViewController.onPop.getter()
{
  return sub_23C1D0B68(&OBJC_IVAR____TtC16FitnessMarketing30MarketingDynamicViewController_onPop);
}

uint64_t sub_23C1CF980(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t MarketingDynamicViewController.onPop.setter(uint64_t a1, uint64_t a2)
{
  return sub_23C1D0BC8(a1, a2, &OBJC_IVAR____TtC16FitnessMarketing30MarketingDynamicViewController_onPop);
}

uint64_t sub_23C1CF99C(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t (*MarketingDynamicViewController.onPop.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id MarketingDynamicViewController.__allocating_init(bag:url:)(uint64_t a1, uint64_t a2)
{
  return sub_23C1D088C(a1, a2, (SEL *)&selRef_initWithBag_URL_);
}

char *MarketingDynamicViewController.init(bag:url:)(uint64_t a1, uint64_t a2)
{
  char *v2;

  v2 = sub_23C1D1080(a1, a2);
  swift_unknownObjectRelease();
  return v2;
}

Swift::Void __swiftcall MarketingDynamicViewController.willMove(toParent:)(UIViewController_optional *toParent)
{
  sub_23C1D0EE8((uint64_t)toParent, &OBJC_IVAR____TtC16FitnessMarketing30MarketingDynamicViewController_onPop);
}

id MarketingDynamicViewController.__allocating_init(bag:bagValue:)(uint64_t a1, void *a2)
{
  return sub_23C1D0774(a1, a2, (SEL *)&selRef_initWithBag_bagValue_);
}

void MarketingDynamicViewController.init(bag:bagValue:)()
{
  sub_23C1D07F0();
}

id MarketingDynamicViewController.__allocating_init(bag:javaScriptBagValue:)(uint64_t a1, void *a2)
{
  return sub_23C1D0774(a1, a2, (SEL *)&selRef_initWithBag_javaScriptBagValue_);
}

void MarketingDynamicViewController.init(bag:javaScriptBagValue:)()
{
  sub_23C1D07F0();
}

id MarketingDynamicViewController.__allocating_init(bag:javaScriptURL:)(uint64_t a1, uint64_t a2)
{
  return sub_23C1D088C(a1, a2, (SEL *)&selRef_initWithBag_javaScriptURL_);
}

void MarketingDynamicViewController.init(bag:javaScriptURL:)()
{
  sub_23C1D07F0();
}

void MarketingDynamicViewController.init(nibName:bundle:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id MarketingItemViewController.coordinator.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC16FitnessMarketing27MarketingItemViewController_coordinator);
}

uint64_t sub_23C1CFCA4@<X0>(_QWORD *a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)();

  v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC16FitnessMarketing27MarketingItemViewController_onPop);
  swift_beginAccess();
  v4 = *v3;
  v5 = v3[1];
  if (v4)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_23C1D13D4;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)())v6;
  return sub_23C1CF980(v4);
}

uint64_t sub_23C1CFD38(uint64_t *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();
  uint64_t *v7;
  uint64_t v8;

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_23C1D13D4;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC16FitnessMarketing27MarketingItemViewController_onPop);
  swift_beginAccess();
  v8 = *v7;
  *v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_23C1CF980(v3);
  return sub_23C1CF99C(v8);
}

uint64_t MarketingItemViewController.onPop.getter()
{
  return sub_23C1D0B68(&OBJC_IVAR____TtC16FitnessMarketing27MarketingItemViewController_onPop);
}

uint64_t MarketingItemViewController.onPop.setter(uint64_t a1, uint64_t a2)
{
  return sub_23C1D0BC8(a1, a2, &OBJC_IVAR____TtC16FitnessMarketing27MarketingItemViewController_onPop);
}

uint64_t (*MarketingItemViewController.onPop.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id MarketingItemViewController.__allocating_init(serviceType:placement:bag:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_class *v5;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v7 = objc_allocWithZone(v5);
  v8 = (void *)sub_23C1FBCC0();
  swift_bridgeObjectRelease();
  v9 = (void *)sub_23C1FBCC0();
  swift_bridgeObjectRelease();
  v10 = objc_msgSend(v7, sel_initWithServiceType_placement_bag_, v8, v9, a5);

  swift_unknownObjectRelease();
  return v10;
}

char *MarketingItemViewController.init(serviceType:placement:bag:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char *v5;
  objc_class *v6;
  char *v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void *v17;
  void *v18;
  char *v19;
  void *v20;
  char *v21;
  id v22;
  uint64_t v24;
  objc_class *ObjectType;
  objc_super v27;
  objc_super v28;

  ObjectType = (objc_class *)swift_getObjectType();
  v24 = OBJC_IVAR____TtC16FitnessMarketing27MarketingItemViewController_coordinator;
  v6 = (objc_class *)type metadata accessor for MarketingDynamicViewCoordinator();
  v7 = (char *)objc_allocWithZone(v6);
  v8 = (uint64_t *)&v7[OBJC_IVAR____TtC16FitnessMarketing31MarketingDynamicViewCoordinator_onDismiss];
  *v8 = 0;
  v8[1] = 0;
  v9 = (uint64_t *)&v7[OBJC_IVAR____TtC16FitnessMarketing31MarketingDynamicViewCoordinator_onPurchase];
  *v9 = 0;
  v9[1] = 0;
  v10 = (uint64_t *)&v7[OBJC_IVAR____TtC16FitnessMarketing31MarketingDynamicViewCoordinator_onCarrierLink];
  *v10 = 0;
  v10[1] = 0;
  swift_beginAccess();
  v11 = *v8;
  *v8 = 0;
  v8[1] = 0;
  v12 = v5;
  v13 = v7;
  sub_23C1CF99C(v11);
  swift_beginAccess();
  v14 = *v9;
  *v9 = 0;
  v9[1] = 0;
  sub_23C1CF99C(v14);
  swift_beginAccess();
  v15 = *v10;
  *v10 = 0;
  v10[1] = 0;
  sub_23C1CF99C(v15);

  v28.receiver = v13;
  v28.super_class = v6;
  *(_QWORD *)&v5[v24] = objc_msgSendSuper2(&v28, sel_init);
  v16 = &v12[OBJC_IVAR____TtC16FitnessMarketing27MarketingItemViewController_onPop];
  *(_QWORD *)v16 = 0;
  *((_QWORD *)v16 + 1) = 0;

  v17 = (void *)sub_23C1FBCC0();
  swift_bridgeObjectRelease();
  v18 = (void *)sub_23C1FBCC0();
  swift_bridgeObjectRelease();
  v27.receiver = v12;
  v27.super_class = ObjectType;
  v19 = (char *)objc_msgSendSuper2(&v27, sel_initWithServiceType_placement_bag_, v17, v18, a5);

  v20 = *(void **)&v19[OBJC_IVAR____TtC16FitnessMarketing27MarketingItemViewController_coordinator];
  v21 = v19;
  v22 = v20;
  objc_msgSend(v21, sel_setDelegate_, v22);

  swift_unknownObjectRelease();
  return v21;
}

id _s16FitnessMarketing0B21DynamicViewControllerC7nibName6bundleACSSSg_So8NSBundleCSgtcfC_0(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_23C1FBCC0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

char *MarketingItemViewController.init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  uint64_t v5;
  objc_class *v6;
  char *v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void *v17;
  char *v18;
  void *v19;
  char *v20;
  id v21;
  objc_class *ObjectType;
  objc_super v26;
  objc_super v27;

  ObjectType = (objc_class *)swift_getObjectType();
  v5 = OBJC_IVAR____TtC16FitnessMarketing27MarketingItemViewController_coordinator;
  v6 = (objc_class *)type metadata accessor for MarketingDynamicViewCoordinator();
  v7 = (char *)objc_allocWithZone(v6);
  v8 = (uint64_t *)&v7[OBJC_IVAR____TtC16FitnessMarketing31MarketingDynamicViewCoordinator_onDismiss];
  *v8 = 0;
  v8[1] = 0;
  v9 = (uint64_t *)&v7[OBJC_IVAR____TtC16FitnessMarketing31MarketingDynamicViewCoordinator_onPurchase];
  *v9 = 0;
  v9[1] = 0;
  v10 = (uint64_t *)&v7[OBJC_IVAR____TtC16FitnessMarketing31MarketingDynamicViewCoordinator_onCarrierLink];
  *v10 = 0;
  v10[1] = 0;
  swift_beginAccess();
  v11 = *v8;
  *v8 = 0;
  v8[1] = 0;
  v12 = v3;
  v13 = v7;
  sub_23C1CF99C(v11);
  swift_beginAccess();
  v14 = *v9;
  *v9 = 0;
  v9[1] = 0;
  sub_23C1CF99C(v14);
  swift_beginAccess();
  v15 = *v10;
  *v10 = 0;
  v10[1] = 0;
  sub_23C1CF99C(v15);

  v27.receiver = v13;
  v27.super_class = v6;
  *(_QWORD *)&v3[v5] = objc_msgSendSuper2(&v27, sel_init);
  v16 = &v12[OBJC_IVAR____TtC16FitnessMarketing27MarketingItemViewController_onPop];
  *(_QWORD *)v16 = 0;
  *((_QWORD *)v16 + 1) = 0;

  if (a2)
  {
    v17 = (void *)sub_23C1FBCC0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v17 = 0;
  }
  v26.receiver = v12;
  v26.super_class = ObjectType;
  v18 = (char *)objc_msgSendSuper2(&v26, sel_initWithNibName_bundle_, v17, a3, a1);

  v19 = *(void **)&v18[OBJC_IVAR____TtC16FitnessMarketing27MarketingItemViewController_coordinator];
  v20 = v18;
  v21 = v19;
  objc_msgSend(v20, sel_setDelegate_, v21);

  return v20;
}

void sub_23C1D0460(char *a1, uint64_t a2, void *a3, uint64_t *a4, _QWORD *a5)
{
  uint64_t v8;
  id v9;
  char *v10;

  v8 = *a4;
  objc_allocWithZone((Class)type metadata accessor for MarketingDynamicViewCoordinator());
  v9 = a3;
  *(_QWORD *)&a1[v8] = sub_23C1D61D4(0, 0, 0, 0, 0, 0);
  v10 = &a1[*a5];
  *(_QWORD *)v10 = 0;
  *((_QWORD *)v10 + 1) = 0;

  sub_23C1FBE7C();
  __break(1u);
}

Swift::Void __swiftcall MarketingItemViewController.willMove(toParent:)(UIViewController_optional *toParent)
{
  sub_23C1D0EE8((uint64_t)toParent, &OBJC_IVAR____TtC16FitnessMarketing27MarketingItemViewController_onPop);
}

id MarketingItemViewController.__allocating_init(marketingItem:bag:)(void *a1, uint64_t a2)
{
  objc_class *v2;
  id v4;

  v4 = objc_msgSend(objc_allocWithZone(v2), sel_initWithMarketingItem_bag_, a1, a2);

  swift_unknownObjectRelease();
  return v4;
}

void MarketingItemViewController.init(marketingItem:bag:)()
{
  sub_23C1D07F0();
}

id MarketingItemViewController.__allocating_init(serviceType:placement:account:bag:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  objc_class *v6;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v9 = objc_allocWithZone(v6);
  v10 = (void *)sub_23C1FBCC0();
  swift_bridgeObjectRelease();
  v11 = (void *)sub_23C1FBCC0();
  swift_bridgeObjectRelease();
  v12 = objc_msgSend(v9, sel_initWithServiceType_placement_account_bag_, v10, v11, a5, a6);

  swift_unknownObjectRelease();
  return v12;
}

void MarketingItemViewController.init(serviceType:placement:account:bag:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id MarketingItemViewController.__allocating_init(bag:bagValue:)(uint64_t a1, void *a2)
{
  return sub_23C1D0774(a1, a2, (SEL *)&selRef_initWithBag_bagValue_);
}

id sub_23C1D0774(uint64_t a1, void *a2, SEL *a3)
{
  objc_class *v3;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v3), *a3, a1, a2);
  swift_unknownObjectRelease();

  return v5;
}

void MarketingItemViewController.init(bag:bagValue:)()
{
  sub_23C1D07F0();
}

void sub_23C1D07F0()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_23C1D0830(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;

  swift_unknownObjectRetain();
  v5 = a4;
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id MarketingItemViewController.__allocating_init(bag:url:)(uint64_t a1, uint64_t a2)
{
  return sub_23C1D088C(a1, a2, (SEL *)&selRef_initWithBag_URL_);
}

id sub_23C1D088C(uint64_t a1, uint64_t a2, SEL *a3)
{
  objc_class *v3;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;

  v7 = objc_allocWithZone(v3);
  v8 = (void *)sub_23C1FB438();
  v9 = objc_msgSend(v7, *a3, a1, v8);
  swift_unknownObjectRelease();

  v10 = sub_23C1FB468();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(a2, v10);
  return v9;
}

void MarketingItemViewController.init(bag:url:)()
{
  sub_23C1D07F0();
}

void sub_23C1D095C()
{
  uint64_t v0;

  v0 = sub_23C1FB468();
  MEMORY[0x24BDAC7A8](v0);
  sub_23C1FB450();
  swift_unknownObjectRetain();
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id MarketingWebViewController.coordinator.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC16FitnessMarketing26MarketingWebViewController_coordinator);
}

uint64_t sub_23C1D0A10@<X0>(_QWORD *a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)();

  v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC16FitnessMarketing26MarketingWebViewController_onPop);
  swift_beginAccess();
  v4 = *v3;
  v5 = v3[1];
  if (v4)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_23C1C88E0;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)())v6;
  return sub_23C1CF980(v4);
}

uint64_t sub_23C1D0AA4(uint64_t *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();
  uint64_t *v7;
  uint64_t v8;

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_23C1C88E0;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC16FitnessMarketing26MarketingWebViewController_onPop);
  swift_beginAccess();
  v8 = *v7;
  *v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_23C1CF980(v3);
  return sub_23C1CF99C(v8);
}

uint64_t MarketingWebViewController.onPop.getter()
{
  return sub_23C1D0B68(&OBJC_IVAR____TtC16FitnessMarketing26MarketingWebViewController_onPop);
}

uint64_t sub_23C1D0B68(_QWORD *a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)(v1 + *a1);
  swift_beginAccess();
  v3 = *v2;
  sub_23C1CF980(*v2);
  return v3;
}

uint64_t MarketingWebViewController.onPop.setter(uint64_t a1, uint64_t a2)
{
  return sub_23C1D0BC8(a1, a2, &OBJC_IVAR____TtC16FitnessMarketing26MarketingWebViewController_onPop);
}

uint64_t sub_23C1D0BC8(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t *v6;
  uint64_t v7;

  v6 = (uint64_t *)(v3 + *a3);
  swift_beginAccess();
  v7 = *v6;
  *v6 = a1;
  v6[1] = a2;
  return sub_23C1CF99C(v7);
}

uint64_t (*MarketingWebViewController.onPop.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id MarketingWebViewController.__allocating_init(bag:account:clientInfo:)(uint64_t a1, void *a2, void *a3)
{
  objc_class *v3;
  id v6;

  v6 = objc_msgSend(objc_allocWithZone(v3), sel_initWithBag_account_clientInfo_, a1, a2, a3);
  swift_unknownObjectRelease();

  return v6;
}

char *MarketingWebViewController.init(bag:account:clientInfo:)(uint64_t a1, void *a2, void *a3)
{
  char *v3;
  char *v4;
  objc_class *ObjectType;
  uint64_t v8;
  objc_class *v9;
  char *v10;
  uint64_t *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  void *v16;
  char *v17;
  id v18;
  objc_super v21;
  objc_super v22;

  v4 = v3;
  ObjectType = (objc_class *)swift_getObjectType();
  v8 = OBJC_IVAR____TtC16FitnessMarketing26MarketingWebViewController_coordinator;
  v9 = (objc_class *)type metadata accessor for MarketingWebViewCoordinator();
  v10 = (char *)objc_allocWithZone(v9);
  v11 = (uint64_t *)&v10[OBJC_IVAR____TtC16FitnessMarketing27MarketingWebViewCoordinator_onPurchase];
  *v11 = 0;
  v11[1] = 0;
  swift_unknownObjectWeakInit();
  swift_beginAccess();
  v12 = *v11;
  *v11 = 0;
  v11[1] = 0;
  v13 = v4;
  sub_23C1CF99C(v12);
  v22.receiver = v10;
  v22.super_class = v9;
  *(_QWORD *)&v4[v8] = objc_msgSendSuper2(&v22, sel_init);
  v14 = &v13[OBJC_IVAR____TtC16FitnessMarketing26MarketingWebViewController_onPop];
  *(_QWORD *)v14 = 0;
  *((_QWORD *)v14 + 1) = 0;

  v21.receiver = v13;
  v21.super_class = ObjectType;
  v15 = (char *)objc_msgSendSuper2(&v21, sel_initWithBag_account_clientInfo_, a1, a2, a3);
  v16 = *(void **)&v15[OBJC_IVAR____TtC16FitnessMarketing26MarketingWebViewController_coordinator];
  v17 = v15;
  v18 = v16;
  objc_msgSend(v17, sel_setDelegate_, v18);

  swift_unknownObjectRelease();
  swift_unknownObjectWeakAssign();
  return v17;
}

Swift::Void __swiftcall MarketingWebViewController.willMove(toParent:)(UIViewController_optional *toParent)
{
  sub_23C1D0EE8((uint64_t)toParent, &OBJC_IVAR____TtC16FitnessMarketing26MarketingWebViewController_onPop);
}

void sub_23C1D0EE8(uint64_t a1, _QWORD *a2)
{
  char *v2;
  id v5;
  BOOL v6;
  char *v7;
  void (*v8)(uint64_t);
  uint64_t v9;
  objc_super v10;

  v10.receiver = v2;
  v10.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v10, sel_willMoveToParentViewController_, a1);
  v5 = objc_msgSend(v2, sel_parentViewController);

  if (v5)
    v6 = a1 == 0;
  else
    v6 = 0;
  if (v6)
  {
    v7 = &v2[*a2];
    swift_beginAccess();
    v8 = *(void (**)(uint64_t))v7;
    if (*(_QWORD *)v7)
    {
      v9 = swift_retain();
      v8(v9);
      sub_23C1CF99C((uint64_t)v8);
    }
  }
}

id _s16FitnessMarketing0B21DynamicViewControllerCfD_0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23C1D1048(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{

  return sub_23C1CF99C(*(_QWORD *)(a1 + *a4));
}

char *sub_23C1D1080(uint64_t a1, uint64_t a2)
{
  char *v2;
  char *v3;
  uint64_t v5;
  objc_class *v6;
  char *v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void *v17;
  char *v18;
  uint64_t v19;
  objc_class *ObjectType;
  objc_super v23;
  objc_super v24;

  v3 = v2;
  ObjectType = (objc_class *)swift_getObjectType();
  v5 = OBJC_IVAR____TtC16FitnessMarketing30MarketingDynamicViewController_coordinator;
  v6 = (objc_class *)type metadata accessor for MarketingDynamicViewCoordinator();
  v7 = (char *)objc_allocWithZone(v6);
  v8 = (uint64_t *)&v7[OBJC_IVAR____TtC16FitnessMarketing31MarketingDynamicViewCoordinator_onDismiss];
  *v8 = 0;
  v8[1] = 0;
  v9 = (uint64_t *)&v7[OBJC_IVAR____TtC16FitnessMarketing31MarketingDynamicViewCoordinator_onPurchase];
  *v9 = 0;
  v9[1] = 0;
  v10 = (uint64_t *)&v7[OBJC_IVAR____TtC16FitnessMarketing31MarketingDynamicViewCoordinator_onCarrierLink];
  *v10 = 0;
  v10[1] = 0;
  swift_beginAccess();
  v11 = *v8;
  *v8 = 0;
  v8[1] = 0;
  v12 = v3;
  v13 = v7;
  sub_23C1CF99C(v11);
  swift_beginAccess();
  v14 = *v9;
  *v9 = 0;
  v9[1] = 0;
  sub_23C1CF99C(v14);
  swift_beginAccess();
  v15 = *v10;
  *v10 = 0;
  v10[1] = 0;
  sub_23C1CF99C(v15);

  v24.receiver = v13;
  v24.super_class = v6;
  *(_QWORD *)&v3[v5] = objc_msgSendSuper2(&v24, sel_init);
  v16 = &v12[OBJC_IVAR____TtC16FitnessMarketing30MarketingDynamicViewController_onPop];
  *(_QWORD *)v16 = 0;
  *((_QWORD *)v16 + 1) = 0;

  v17 = (void *)sub_23C1FB438();
  v23.receiver = v12;
  v23.super_class = ObjectType;
  v18 = (char *)objc_msgSendSuper2(&v23, sel_initWithBag_URL_, a1, v17);

  objc_msgSend(v18, sel_setDelegate_, *(_QWORD *)&v18[OBJC_IVAR____TtC16FitnessMarketing30MarketingDynamicViewController_coordinator]);
  v19 = sub_23C1FB468();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 8))(a2, v19);
  return v18;
}

uint64_t type metadata accessor for MarketingDynamicViewController()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for MarketingItemViewController()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for MarketingWebViewController()
{
  return objc_opt_self();
}

void sub_23C1D12B8()
{
  char *v0;
  uint64_t v1;
  objc_class *v2;
  char *v3;
  uint64_t *v4;
  uint64_t v5;
  char *v6;
  objc_super v7;

  v1 = OBJC_IVAR____TtC16FitnessMarketing26MarketingWebViewController_coordinator;
  v2 = (objc_class *)type metadata accessor for MarketingWebViewCoordinator();
  v3 = (char *)objc_allocWithZone(v2);
  v4 = (uint64_t *)&v3[OBJC_IVAR____TtC16FitnessMarketing27MarketingWebViewCoordinator_onPurchase];
  *v4 = 0;
  v4[1] = 0;
  swift_unknownObjectWeakInit();
  swift_beginAccess();
  v5 = *v4;
  *v4 = 0;
  v4[1] = 0;
  sub_23C1CF99C(v5);
  v7.receiver = v3;
  v7.super_class = v2;
  *(_QWORD *)&v0[v1] = objc_msgSendSuper2(&v7, sel_init);
  v6 = &v0[OBJC_IVAR____TtC16FitnessMarketing26MarketingWebViewController_onPop];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;

  sub_23C1FBE7C();
  __break(1u);
}

uint64_t sub_23C1D13B0()
{
  swift_release();
  return swift_deallocObject();
}

void ServiceSubscriptionMonitorLocalState.activationState.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

_BYTE *ServiceSubscriptionMonitorLocalState.activationState.setter(_BYTE *result)
{
  _BYTE *v1;

  *v1 = *result;
  return result;
}

uint64_t (*ServiceSubscriptionMonitorLocalState.activationState.modify())()
{
  return nullsub_1;
}

FitnessMarketing::ServiceSubscriptionMonitorLocalState __swiftcall ServiceSubscriptionMonitorLocalState.init(activationState:)(FitnessMarketing::ServiceSubscriptionMonitorLocalState activationState)
{
  _BYTE *v1;

  *v1 = *(_BYTE *)activationState.activationState;
  return activationState;
}

uint64_t sub_23C1D1424()
{
  return 0x6974617669746361;
}

uint64_t sub_23C1D1448@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x6974617669746361 && a2 == 0xEF65746174536E6FLL)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_23C1FBF90();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_23C1D1500()
{
  sub_23C1D164C();
  return sub_23C1FC020();
}

uint64_t sub_23C1D1528()
{
  sub_23C1D164C();
  return sub_23C1FC02C();
}

uint64_t ServiceSubscriptionMonitorLocalState.encode(to:)(_QWORD *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char v7;
  uint64_t v9;
  char v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B418B8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C1D164C();
  sub_23C1FC014();
  v10 = v7;
  sub_23C1D1690();
  sub_23C1FBF78();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_23C1D164C()
{
  unint64_t result;

  result = qword_256B418C0;
  if (!qword_256B418C0)
  {
    result = MEMORY[0x242619B10](&unk_23C1FFAD8, &type metadata for ServiceSubscriptionMonitorLocalState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B418C0);
  }
  return result;
}

unint64_t sub_23C1D1690()
{
  unint64_t result;

  result = qword_256B418C8;
  if (!qword_256B418C8)
  {
    result = MEMORY[0x242619B10](&protocol conformance descriptor for ServiceSubscriptionMonitorActivationState, &type metadata for ServiceSubscriptionMonitorActivationState);
    atomic_store(result, (unint64_t *)&qword_256B418C8);
  }
  return result;
}

uint64_t ServiceSubscriptionMonitorLocalState.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;
  char v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B418D0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C1D164C();
  sub_23C1FC008();
  if (!v2)
  {
    sub_23C1D17F0();
    sub_23C1FBF18();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v11;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_23C1D17F0()
{
  unint64_t result;

  result = qword_256B418D8;
  if (!qword_256B418D8)
  {
    result = MEMORY[0x242619B10](&protocol conformance descriptor for ServiceSubscriptionMonitorActivationState, &type metadata for ServiceSubscriptionMonitorActivationState);
    atomic_store(result, (unint64_t *)&qword_256B418D8);
  }
  return result;
}

uint64_t sub_23C1D1834@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return ServiceSubscriptionMonitorLocalState.init(from:)(a1, a2);
}

uint64_t sub_23C1D1848(_QWORD *a1)
{
  return ServiceSubscriptionMonitorLocalState.encode(to:)(a1);
}

BOOL static ServiceSubscriptionMonitorLocalState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t storeEnumTagSinglePayload for ServiceSubscriptionMonitorLocalState(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C1D18C0 + 4 * byte_23C1FF965[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C1D18F4 + 4 * byte_23C1FF960[v4]))();
}

uint64_t sub_23C1D18F4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1D18FC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C1D1904);
  return result;
}

uint64_t sub_23C1D1910(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C1D1918);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C1D191C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1D1924(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ServiceSubscriptionMonitorLocalState()
{
  return &type metadata for ServiceSubscriptionMonitorLocalState;
}

uint64_t storeEnumTagSinglePayload for ServiceSubscriptionMonitorLocalState.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23C1D1980 + 4 * byte_23C1FF96A[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23C1D19A0 + 4 * byte_23C1FF96F[v4]))();
}

_BYTE *sub_23C1D1980(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23C1D19A0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C1D19A8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C1D19B0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C1D19B8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C1D19C0(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for ServiceSubscriptionMonitorLocalState.CodingKeys()
{
  return &type metadata for ServiceSubscriptionMonitorLocalState.CodingKeys;
}

unint64_t sub_23C1D19E0()
{
  unint64_t result;

  result = qword_256B418E0;
  if (!qword_256B418E0)
  {
    result = MEMORY[0x242619B10](&unk_23C1FFAB0, &type metadata for ServiceSubscriptionMonitorLocalState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B418E0);
  }
  return result;
}

unint64_t sub_23C1D1A28()
{
  unint64_t result;

  result = qword_256B418E8;
  if (!qword_256B418E8)
  {
    result = MEMORY[0x242619B10](&unk_23C1FFA20, &type metadata for ServiceSubscriptionMonitorLocalState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B418E8);
  }
  return result;
}

unint64_t sub_23C1D1A70()
{
  unint64_t result;

  result = qword_256B418F0;
  if (!qword_256B418F0)
  {
    result = MEMORY[0x242619B10](&unk_23C1FFA48, &type metadata for ServiceSubscriptionMonitorLocalState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B418F0);
  }
  return result;
}

uint64_t sub_23C1D1AB4(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23C1D1AF0 + 4 * byte_23C1FFB30[a1]))(0x6570704177656976, 0xEC00000064657261);
}

unint64_t sub_23C1D1AF0()
{
  return 0xD000000000000019;
}

uint64_t sub_23C1D1B98()
{
  unsigned __int8 *v0;

  return sub_23C1D1AB4(*v0);
}

uint64_t sub_23C1D1BA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C1D433C(a1, a2);
  *a3 = result;
  return result;
}

void sub_23C1D1BC4(_BYTE *a1@<X8>)
{
  *a1 = 7;
}

uint64_t sub_23C1D1BD0()
{
  sub_23C1D2434();
  return sub_23C1FC020();
}

uint64_t sub_23C1D1BF8()
{
  sub_23C1D2434();
  return sub_23C1FC02C();
}

uint64_t sub_23C1D1C20()
{
  sub_23C1D2544();
  return sub_23C1FC020();
}

uint64_t sub_23C1D1C48()
{
  sub_23C1D2544();
  return sub_23C1FC02C();
}

uint64_t sub_23C1D1C70()
{
  sub_23C1D2500();
  return sub_23C1FC020();
}

uint64_t sub_23C1D1C98()
{
  sub_23C1D2500();
  return sub_23C1FC02C();
}

uint64_t sub_23C1D1CC0()
{
  sub_23C1D2610();
  return sub_23C1FC020();
}

uint64_t sub_23C1D1CE8()
{
  sub_23C1D2610();
  return sub_23C1FC02C();
}

uint64_t sub_23C1D1D10()
{
  sub_23C1D24BC();
  return sub_23C1FC020();
}

uint64_t sub_23C1D1D38()
{
  sub_23C1D24BC();
  return sub_23C1FC02C();
}

uint64_t sub_23C1D1D60()
{
  sub_23C1D2588();
  return sub_23C1FC020();
}

uint64_t sub_23C1D1D88()
{
  sub_23C1D2588();
  return sub_23C1FC02C();
}

uint64_t sub_23C1D1DB0()
{
  sub_23C1D25CC();
  return sub_23C1FC020();
}

uint64_t sub_23C1D1DD8()
{
  sub_23C1D25CC();
  return sub_23C1FC02C();
}

uint64_t sub_23C1D1E00()
{
  sub_23C1D2654();
  return sub_23C1FC020();
}

uint64_t sub_23C1D1E28()
{
  sub_23C1D2654();
  return sub_23C1FC02C();
}

void MarketingButtonAction.encode(to:)(_QWORD *a1)
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
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B418F8);
  v41 = *(_QWORD *)(v2 - 8);
  v42 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v40 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41900);
  v38 = *(_QWORD *)(v4 - 8);
  v39 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v37 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41908);
  v35 = *(_QWORD *)(v6 - 8);
  v36 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v34 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41910);
  v32 = *(_QWORD *)(v8 - 8);
  v33 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v31 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41918);
  v27 = *(_QWORD *)(v10 - 8);
  v28 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v25 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41920);
  v29 = *(_QWORD *)(v12 - 8);
  v30 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v26 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for MarketingActionItem();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v24 = (char *)&v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41928);
  MEMORY[0x24BDAC7A8](v23);
  v17 = type metadata accessor for MarketingButtonAction();
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v22 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41930);
  v44 = *(_QWORD *)(v20 - 8);
  v45 = v20;
  MEMORY[0x24BDAC7A8](v20);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C1D2434();
  sub_23C1FC014();
  sub_23C1D2478(v43, (uint64_t)v19);
  v21 = (char *)sub_23C1D2164
      + 4 * byte_23C1FFB37[(*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v19, 6, v14)];
  __asm { BR              X10 }
}

uint64_t sub_23C1D2164()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(v2 - 272);
  sub_23C1CD008(v1, v3, (uint64_t (*)(_QWORD))type metadata accessor for MarketingActionItem);
  *(_BYTE *)(v2 - 70) = 1;
  sub_23C1D2610();
  v4 = *(_QWORD *)(v2 - 256);
  v5 = *(_QWORD *)(v2 - 104);
  sub_23C1FBF30();
  sub_23C1D3014(&qword_256B40B90, (uint64_t)&protocol conformance descriptor for MarketingActionItem);
  v6 = *(_QWORD *)(v2 - 224);
  sub_23C1FBF78();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 232) + 8))(v4, v6);
  sub_23C1B5118(v3, (uint64_t (*)(_QWORD))type metadata accessor for MarketingActionItem);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 112) + 8))(v0, v5);
}

uint64_t type metadata accessor for MarketingButtonAction()
{
  uint64_t result;

  result = qword_256B41A28;
  if (!qword_256B41A28)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_23C1D2434()
{
  unint64_t result;

  result = qword_256B41938;
  if (!qword_256B41938)
  {
    result = MEMORY[0x242619B10](&unk_23C200280, &type metadata for MarketingButtonAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41938);
  }
  return result;
}

uint64_t sub_23C1D2478(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MarketingButtonAction();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_23C1D24BC()
{
  unint64_t result;

  result = qword_256B41940;
  if (!qword_256B41940)
  {
    result = MEMORY[0x242619B10](&unk_23C200230, &type metadata for MarketingButtonAction.RequestRemoteBrowsingConnectionTappedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41940);
  }
  return result;
}

unint64_t sub_23C1D2500()
{
  unint64_t result;

  result = qword_256B41948;
  if (!qword_256B41948)
  {
    result = MEMORY[0x242619B10](&unk_23C2001E0, &type metadata for MarketingButtonAction.DismissSupportDeviceRequirementAlertCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41948);
  }
  return result;
}

unint64_t sub_23C1D2544()
{
  unint64_t result;

  result = qword_256B41950;
  if (!qword_256B41950)
  {
    result = MEMORY[0x242619B10](&unk_23C200190, &type metadata for MarketingButtonAction.DismissHandoffCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41950);
  }
  return result;
}

unint64_t sub_23C1D2588()
{
  unint64_t result;

  result = qword_256B41958;
  if (!qword_256B41958)
  {
    result = MEMORY[0x242619B10](&unk_23C200140, &type metadata for MarketingButtonAction.ShowDeviceRequirementAlertTappedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41958);
  }
  return result;
}

unint64_t sub_23C1D25CC()
{
  unint64_t result;

  result = qword_256B41960;
  if (!qword_256B41960)
  {
    result = MEMORY[0x242619B10](&unk_23C2000F0, &type metadata for MarketingButtonAction.ShowHandoffTappedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41960);
  }
  return result;
}

unint64_t sub_23C1D2610()
{
  unint64_t result;

  result = qword_256B41968;
  if (!qword_256B41968)
  {
    result = MEMORY[0x242619B10](&unk_23C2000A0, &type metadata for MarketingButtonAction.MarketingActionItemTappedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41968);
  }
  return result;
}

unint64_t sub_23C1D2654()
{
  unint64_t result;

  result = qword_256B41970;
  if (!qword_256B41970)
  {
    result = MEMORY[0x242619B10](&unk_23C200050, &type metadata for MarketingButtonAction.ViewAppearedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41970);
  }
  return result;
}

uint64_t MarketingButtonAction.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t *v30;
  _QWORD v32[3];
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
  char *v46;
  char *v47;
  char *v48;
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  _QWORD *v55;
  uint64_t v56;

  v51 = a2;
  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41978);
  v45 = *(_QWORD *)(v54 - 8);
  MEMORY[0x24BDAC7A8](v54);
  v50 = (char *)v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41980);
  v43 = *(_QWORD *)(v4 - 8);
  v44 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v53 = (char *)v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41988);
  v41 = *(_QWORD *)(v6 - 8);
  v42 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v49 = (char *)v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41990);
  v39 = *(_QWORD *)(v8 - 8);
  v40 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v48 = (char *)v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41998);
  v35 = *(_QWORD *)(v36 - 8);
  MEMORY[0x24BDAC7A8](v36);
  v46 = (char *)v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B419A0);
  v37 = *(_QWORD *)(v11 - 8);
  v38 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v47 = (char *)v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B419A8);
  v34 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B419B0);
  v13 = *(_QWORD *)(v52 - 8);
  MEMORY[0x24BDAC7A8](v52);
  v15 = (char *)v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for MarketingButtonAction();
  v17 = MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)v32 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)v32 - v20;
  v22 = a1[3];
  v55 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v22);
  sub_23C1D2434();
  v23 = v56;
  sub_23C1FC008();
  if (!v23)
  {
    v32[2] = 0;
    v24 = v16;
    v32[0] = v19;
    v56 = v13;
    v32[1] = v21;
    v25 = v52;
    v26 = sub_23C1FBF24();
    if (*(_QWORD *)(v26 + 16) == 1)
      __asm { BR              X10 }
    v27 = v15;
    v28 = sub_23C1FBE58();
    swift_allocError();
    v30 = v29;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B40A48);
    *v30 = v24;
    sub_23C1FBED0();
    sub_23C1FBE4C();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v28 - 8) + 104))(v30, *MEMORY[0x24BEE26D0], v28);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v56 + 8))(v27, v25);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v55);
}

void sub_23C1D2E5C(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = v3;
  *(_BYTE *)(v4 - 65) = 6;
  sub_23C1D24BC();
  v7 = *(_QWORD *)(v4 - 144);
  v8 = *(_QWORD *)(v4 - 288);
  sub_23C1FBEC4();
  if (v8)
  {
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(a1 + 8))(v1, v2);
    JUMPOUT(0x23C1D2E30);
  }
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 184) + 8))(v7, v5);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(a1 + 8))(v1, v2);
  v9 = type metadata accessor for MarketingActionItem();
  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(*(_QWORD *)(v4 - 296), 6, 6, v9);
  JUMPOUT(0x23C1D2F98);
}

uint64_t sub_23C1D3014(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for MarketingActionItem();
    result = MEMORY[0x242619B10](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23C1D3054@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return MarketingButtonAction.init(from:)(a1, a2);
}

void sub_23C1D3068(_QWORD *a1)
{
  MarketingButtonAction.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for MarketingButtonAction(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  int EnumCaseMultiPayload;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  void (*v24)(uint64_t *, _QWORD, uint64_t, int *);

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
    v7 = (int *)type metadata accessor for MarketingActionItem();
    v8 = *((_QWORD *)v7 - 1);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, int *))(v8 + 48))(a2, 6, v7))
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      type metadata accessor for MarketingAction();
      EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
        v11 = sub_23C1FB468();
      else
        v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40928);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(a1, a2, v11);
      swift_storeEnumTagMultiPayload();
      v12 = v7[5];
      v13 = (uint64_t *)((char *)a1 + v12);
      v14 = (uint64_t *)((char *)a2 + v12);
      v15 = v14[1];
      *v13 = *v14;
      v13[1] = v15;
      v16 = v7[6];
      v17 = (uint64_t *)((char *)a1 + v16);
      v18 = (uint64_t *)((char *)a2 + v16);
      v19 = v18[1];
      *v17 = *v18;
      v17[1] = v19;
      *((_BYTE *)a1 + v7[7]) = *((_BYTE *)a2 + v7[7]);
      v20 = v7[8];
      v21 = (uint64_t *)((char *)a1 + v20);
      v22 = (uint64_t *)((char *)a2 + v20);
      v23 = v22[1];
      *v21 = *v22;
      v21[1] = v23;
      v24 = *(void (**)(uint64_t *, _QWORD, uint64_t, int *))(v8 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v24(a1, 0, 6, v7);
    }
  }
  return a1;
}

uint64_t destroy for MarketingButtonAction(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int EnumCaseMultiPayload;
  uint64_t v5;

  v2 = type metadata accessor for MarketingActionItem();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 6, v2);
  if (!(_DWORD)result)
  {
    type metadata accessor for MarketingAction();
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    {
      v5 = sub_23C1FB468();
    }
    else
    {
      if (EnumCaseMultiPayload)
      {
LABEL_8:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return swift_bridgeObjectRelease();
      }
      v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40928);
    }
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
    goto LABEL_8;
  }
  return result;
}

char *initializeWithCopy for MarketingButtonAction(char *a1, char *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  int EnumCaseMultiPayload;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  void (*v22)(char *, _QWORD, uint64_t, int *);

  v6 = (int *)type metadata accessor for MarketingActionItem();
  v7 = *((_QWORD *)v6 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v7 + 48))(a2, 6, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    type metadata accessor for MarketingAction();
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
      v9 = sub_23C1FB468();
    else
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40928);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(a1, a2, v9);
    swift_storeEnumTagMultiPayload();
    v10 = v6[5];
    v11 = &a1[v10];
    v12 = &a2[v10];
    v13 = *((_QWORD *)v12 + 1);
    *(_QWORD *)v11 = *(_QWORD *)v12;
    *((_QWORD *)v11 + 1) = v13;
    v14 = v6[6];
    v15 = &a1[v14];
    v16 = &a2[v14];
    v17 = *((_QWORD *)v16 + 1);
    *(_QWORD *)v15 = *(_QWORD *)v16;
    *((_QWORD *)v15 + 1) = v17;
    a1[v6[7]] = a2[v6[7]];
    v18 = v6[8];
    v19 = &a1[v18];
    v20 = &a2[v18];
    v21 = *((_QWORD *)v20 + 1);
    *(_QWORD *)v19 = *(_QWORD *)v20;
    *((_QWORD *)v19 + 1) = v21;
    v22 = *(void (**)(char *, _QWORD, uint64_t, int *))(v7 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v22(a1, 0, 6, v6);
  }
  return a1;
}

_BYTE *assignWithCopy for MarketingButtonAction(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  uint64_t (*v8)(_BYTE *, uint64_t, int *);
  int v9;
  int v10;
  int EnumCaseMultiPayload;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  void (*v24)(_BYTE *, _QWORD, uint64_t, int *);
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;

  v6 = (int *)type metadata accessor for MarketingActionItem();
  v7 = *((_QWORD *)v6 - 1);
  v8 = *(uint64_t (**)(_BYTE *, uint64_t, int *))(v7 + 48);
  v9 = v8(a1, 6, v6);
  v10 = v8(a2, 6, v6);
  if (v9)
  {
    if (!v10)
    {
      type metadata accessor for MarketingAction();
      EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
        v12 = sub_23C1FB468();
      else
        v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40928);
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(a1, a2, v12);
      swift_storeEnumTagMultiPayload();
      v15 = v6[5];
      v16 = &a1[v15];
      v17 = &a2[v15];
      *v16 = *v17;
      v16[1] = v17[1];
      v18 = v6[6];
      v19 = &a1[v18];
      v20 = &a2[v18];
      *v19 = *v20;
      v19[1] = v20[1];
      a1[v6[7]] = a2[v6[7]];
      v21 = v6[8];
      v22 = &a1[v21];
      v23 = &a2[v21];
      *v22 = *v23;
      v22[1] = v23[1];
      v24 = *(void (**)(_BYTE *, _QWORD, uint64_t, int *))(v7 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v24(a1, 0, 6, v6);
      return a1;
    }
LABEL_8:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  if (v10)
  {
    sub_23C1B5118((uint64_t)a1, (uint64_t (*)(_QWORD))type metadata accessor for MarketingActionItem);
    goto LABEL_8;
  }
  if (a1 != a2)
  {
    sub_23C1B5118((uint64_t)a1, (uint64_t (*)(_QWORD))type metadata accessor for MarketingAction);
    type metadata accessor for MarketingAction();
    v13 = swift_getEnumCaseMultiPayload();
    if (v13 == 2 || v13 == 1)
      v14 = sub_23C1FB468();
    else
      v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40928);
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(a1, a2, v14);
    swift_storeEnumTagMultiPayload();
  }
  v25 = v6[5];
  v26 = &a1[v25];
  v27 = &a2[v25];
  *v26 = *v27;
  v26[1] = v27[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v28 = v6[6];
  v29 = &a1[v28];
  v30 = &a2[v28];
  *v29 = *v30;
  v29[1] = v30[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[v6[7]] = a2[v6[7]];
  v31 = v6[8];
  v32 = &a1[v31];
  v33 = &a2[v31];
  *v32 = *v33;
  v32[1] = v33[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *initializeWithTake for MarketingButtonAction(char *a1, char *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  int EnumCaseMultiPayload;
  uint64_t v9;

  v6 = (int *)type metadata accessor for MarketingActionItem();
  v7 = *((_QWORD *)v6 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v7 + 48))(a2, 6, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    type metadata accessor for MarketingAction();
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
      v9 = sub_23C1FB468();
    else
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40928);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(a1, a2, v9);
    swift_storeEnumTagMultiPayload();
    *(_OWORD *)&a1[v6[5]] = *(_OWORD *)&a2[v6[5]];
    *(_OWORD *)&a1[v6[6]] = *(_OWORD *)&a2[v6[6]];
    a1[v6[7]] = a2[v6[7]];
    *(_OWORD *)&a1[v6[8]] = *(_OWORD *)&a2[v6[8]];
    (*(void (**)(char *, _QWORD, uint64_t, int *))(v7 + 56))(a1, 0, 6, v6);
  }
  return a1;
}

_BYTE *assignWithTake for MarketingButtonAction(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  uint64_t (*v8)(_BYTE *, uint64_t, int *);
  int v9;
  int v10;
  int EnumCaseMultiPayload;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v6 = (int *)type metadata accessor for MarketingActionItem();
  v7 = *((_QWORD *)v6 - 1);
  v8 = *(uint64_t (**)(_BYTE *, uint64_t, int *))(v7 + 48);
  v9 = v8(a1, 6, v6);
  v10 = v8(a2, 6, v6);
  if (v9)
  {
    if (!v10)
    {
      type metadata accessor for MarketingAction();
      EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
        v12 = sub_23C1FB468();
      else
        v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40928);
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(a1, a2, v12);
      swift_storeEnumTagMultiPayload();
      *(_OWORD *)&a1[v6[5]] = *(_OWORD *)&a2[v6[5]];
      *(_OWORD *)&a1[v6[6]] = *(_OWORD *)&a2[v6[6]];
      a1[v6[7]] = a2[v6[7]];
      *(_OWORD *)&a1[v6[8]] = *(_OWORD *)&a2[v6[8]];
      (*(void (**)(_BYTE *, _QWORD, uint64_t, int *))(v7 + 56))(a1, 0, 6, v6);
      return a1;
    }
LABEL_8:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  if (v10)
  {
    sub_23C1B5118((uint64_t)a1, (uint64_t (*)(_QWORD))type metadata accessor for MarketingActionItem);
    goto LABEL_8;
  }
  if (a1 != a2)
  {
    sub_23C1B5118((uint64_t)a1, (uint64_t (*)(_QWORD))type metadata accessor for MarketingAction);
    type metadata accessor for MarketingAction();
    v13 = swift_getEnumCaseMultiPayload();
    if (v13 == 2 || v13 == 1)
      v14 = sub_23C1FB468();
    else
      v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40928);
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(a1, a2, v14);
    swift_storeEnumTagMultiPayload();
  }
  v15 = v6[5];
  v16 = &a1[v15];
  v17 = (uint64_t *)&a2[v15];
  v19 = *v17;
  v18 = v17[1];
  *v16 = v19;
  v16[1] = v18;
  swift_bridgeObjectRelease();
  v20 = v6[6];
  v21 = &a1[v20];
  v22 = (uint64_t *)&a2[v20];
  v24 = *v22;
  v23 = v22[1];
  *v21 = v24;
  v21[1] = v23;
  swift_bridgeObjectRelease();
  a1[v6[7]] = a2[v6[7]];
  v25 = v6[8];
  v26 = &a1[v25];
  v27 = (uint64_t *)&a2[v25];
  v29 = *v27;
  v28 = v27[1];
  *v26 = v29;
  v26[1] = v28;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MarketingButtonAction()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C1D3A5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int v5;

  v4 = type metadata accessor for MarketingActionItem();
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 7)
    return v5 - 6;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for MarketingButtonAction()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C1D3AB4(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  if (a2)
    v5 = (a2 + 6);
  else
    v5 = 0;
  v6 = type metadata accessor for MarketingActionItem();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a1, v5, a3, v6);
}

uint64_t sub_23C1D3B08(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for MarketingActionItem();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 6, v2);
}

uint64_t sub_23C1D3B40(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MarketingActionItem();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, 6, v4);
}

uint64_t sub_23C1D3B80()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for MarketingActionItem();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for MarketingButtonAction.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for MarketingButtonAction.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C1D3CB0 + 4 * byte_23C1FFB51[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_23C1D3CE4 + 4 * byte_23C1FFB4C[v4]))();
}

uint64_t sub_23C1D3CE4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1D3CEC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C1D3CF4);
  return result;
}

uint64_t sub_23C1D3D00(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C1D3D08);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_23C1D3D0C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1D3D14(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MarketingButtonAction.CodingKeys()
{
  return &type metadata for MarketingButtonAction.CodingKeys;
}

ValueMetadata *type metadata accessor for MarketingButtonAction.ViewAppearedCodingKeys()
{
  return &type metadata for MarketingButtonAction.ViewAppearedCodingKeys;
}

uint64_t storeEnumTagSinglePayload for MarketingButtonAction.MarketingActionItemTappedCodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23C1D3D80 + 4 * byte_23C1FFB56[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23C1D3DA0 + 4 * byte_23C1FFB5B[v4]))();
}

_BYTE *sub_23C1D3D80(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23C1D3DA0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C1D3DA8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C1D3DB0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C1D3DB8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C1D3DC0(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for MarketingButtonAction.MarketingActionItemTappedCodingKeys()
{
  return &type metadata for MarketingButtonAction.MarketingActionItemTappedCodingKeys;
}

ValueMetadata *type metadata accessor for MarketingButtonAction.ShowHandoffTappedCodingKeys()
{
  return &type metadata for MarketingButtonAction.ShowHandoffTappedCodingKeys;
}

ValueMetadata *type metadata accessor for MarketingButtonAction.ShowDeviceRequirementAlertTappedCodingKeys()
{
  return &type metadata for MarketingButtonAction.ShowDeviceRequirementAlertTappedCodingKeys;
}

ValueMetadata *type metadata accessor for MarketingButtonAction.DismissHandoffCodingKeys()
{
  return &type metadata for MarketingButtonAction.DismissHandoffCodingKeys;
}

ValueMetadata *type metadata accessor for MarketingButtonAction.DismissSupportDeviceRequirementAlertCodingKeys()
{
  return &type metadata for MarketingButtonAction.DismissSupportDeviceRequirementAlertCodingKeys;
}

ValueMetadata *type metadata accessor for MarketingButtonAction.RequestRemoteBrowsingConnectionTappedCodingKeys()
{
  return &type metadata for MarketingButtonAction.RequestRemoteBrowsingConnectionTappedCodingKeys;
}

unint64_t sub_23C1D3E30()
{
  unint64_t result;

  result = qword_256B41A38;
  if (!qword_256B41A38)
  {
    result = MEMORY[0x242619B10](&unk_23C1FFF20, &type metadata for MarketingButtonAction.MarketingActionItemTappedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41A38);
  }
  return result;
}

unint64_t sub_23C1D3E78()
{
  unint64_t result;

  result = qword_256B41A40;
  if (!qword_256B41A40)
  {
    result = MEMORY[0x242619B10](&unk_23C200028, &type metadata for MarketingButtonAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41A40);
  }
  return result;
}

unint64_t sub_23C1D3EC0()
{
  unint64_t result;

  result = qword_256B41A48;
  if (!qword_256B41A48)
  {
    result = MEMORY[0x242619B10](&unk_23C1FFF48, &type metadata for MarketingButtonAction.ViewAppearedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41A48);
  }
  return result;
}

unint64_t sub_23C1D3F08()
{
  unint64_t result;

  result = qword_256B41A50;
  if (!qword_256B41A50)
  {
    result = MEMORY[0x242619B10](&unk_23C1FFF70, &type metadata for MarketingButtonAction.ViewAppearedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41A50);
  }
  return result;
}

unint64_t sub_23C1D3F50()
{
  unint64_t result;

  result = qword_256B41A58;
  if (!qword_256B41A58)
  {
    result = MEMORY[0x242619B10](&unk_23C1FFE90, &type metadata for MarketingButtonAction.MarketingActionItemTappedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41A58);
  }
  return result;
}

unint64_t sub_23C1D3F98()
{
  unint64_t result;

  result = qword_256B41A60;
  if (!qword_256B41A60)
  {
    result = MEMORY[0x242619B10](&unk_23C1FFEB8, &type metadata for MarketingButtonAction.MarketingActionItemTappedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41A60);
  }
  return result;
}

unint64_t sub_23C1D3FE0()
{
  unint64_t result;

  result = qword_256B41A68;
  if (!qword_256B41A68)
  {
    result = MEMORY[0x242619B10](&unk_23C1FFE40, &type metadata for MarketingButtonAction.ShowHandoffTappedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41A68);
  }
  return result;
}

unint64_t sub_23C1D4028()
{
  unint64_t result;

  result = qword_256B41A70;
  if (!qword_256B41A70)
  {
    result = MEMORY[0x242619B10](&unk_23C1FFE68, &type metadata for MarketingButtonAction.ShowHandoffTappedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41A70);
  }
  return result;
}

unint64_t sub_23C1D4070()
{
  unint64_t result;

  result = qword_256B41A78;
  if (!qword_256B41A78)
  {
    result = MEMORY[0x242619B10](&unk_23C1FFDF0, &type metadata for MarketingButtonAction.ShowDeviceRequirementAlertTappedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41A78);
  }
  return result;
}

unint64_t sub_23C1D40B8()
{
  unint64_t result;

  result = qword_256B41A80;
  if (!qword_256B41A80)
  {
    result = MEMORY[0x242619B10](&unk_23C1FFE18, &type metadata for MarketingButtonAction.ShowDeviceRequirementAlertTappedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41A80);
  }
  return result;
}

unint64_t sub_23C1D4100()
{
  unint64_t result;

  result = qword_256B41A88;
  if (!qword_256B41A88)
  {
    result = MEMORY[0x242619B10](&unk_23C1FFDA0, &type metadata for MarketingButtonAction.DismissHandoffCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41A88);
  }
  return result;
}

unint64_t sub_23C1D4148()
{
  unint64_t result;

  result = qword_256B41A90;
  if (!qword_256B41A90)
  {
    result = MEMORY[0x242619B10](&unk_23C1FFDC8, &type metadata for MarketingButtonAction.DismissHandoffCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41A90);
  }
  return result;
}

unint64_t sub_23C1D4190()
{
  unint64_t result;

  result = qword_256B41A98;
  if (!qword_256B41A98)
  {
    result = MEMORY[0x242619B10](&unk_23C1FFD50, &type metadata for MarketingButtonAction.DismissSupportDeviceRequirementAlertCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41A98);
  }
  return result;
}

unint64_t sub_23C1D41D8()
{
  unint64_t result;

  result = qword_256B41AA0;
  if (!qword_256B41AA0)
  {
    result = MEMORY[0x242619B10](&unk_23C1FFD78, &type metadata for MarketingButtonAction.DismissSupportDeviceRequirementAlertCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41AA0);
  }
  return result;
}

unint64_t sub_23C1D4220()
{
  unint64_t result;

  result = qword_256B41AA8;
  if (!qword_256B41AA8)
  {
    result = MEMORY[0x242619B10](&unk_23C1FFD00, &type metadata for MarketingButtonAction.RequestRemoteBrowsingConnectionTappedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41AA8);
  }
  return result;
}

unint64_t sub_23C1D4268()
{
  unint64_t result;

  result = qword_256B41AB0;
  if (!qword_256B41AB0)
  {
    result = MEMORY[0x242619B10](&unk_23C1FFD28, &type metadata for MarketingButtonAction.RequestRemoteBrowsingConnectionTappedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41AB0);
  }
  return result;
}

unint64_t sub_23C1D42B0()
{
  unint64_t result;

  result = qword_256B41AB8;
  if (!qword_256B41AB8)
  {
    result = MEMORY[0x242619B10](&unk_23C1FFF98, &type metadata for MarketingButtonAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41AB8);
  }
  return result;
}

unint64_t sub_23C1D42F8()
{
  unint64_t result;

  result = qword_256B41AC0;
  if (!qword_256B41AC0)
  {
    result = MEMORY[0x242619B10](&unk_23C1FFFC0, &type metadata for MarketingButtonAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41AC0);
  }
  return result;
}

uint64_t sub_23C1D433C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6570704177656976 && a2 == 0xEC00000064657261;
  if (v2 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000019 && a2 == 0x800000023C203F30 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000023C203F50 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000020 && a2 == 0x800000023C203F70 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x487373696D736964 && a2 == 0xEE0066666F646E61 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000024 && a2 == 0x800000023C203FA0 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000025 && a2 == 0x800000023C203FD0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    v6 = sub_23C1FBF90();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 6;
    else
      return 7;
  }
}

int *MarketingDynamicView.init(url:account:bag:shouldAnonymizeMetrics:metricsOverlay:onDismiss:onPurchase:onCarrierLink:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v20;
  int *result;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;

  v20 = sub_23C1FB468();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(a9, a1, v20);
  result = (int *)type metadata accessor for MarketingDynamicView();
  *(_QWORD *)(a9 + result[6]) = a3;
  *(_QWORD *)(a9 + result[5]) = a2;
  *(_BYTE *)(a9 + result[7]) = a4;
  *(_QWORD *)(a9 + result[8]) = a5;
  v22 = (_QWORD *)(a9 + result[9]);
  *v22 = a6;
  v22[1] = a7;
  v23 = (_QWORD *)(a9 + result[10]);
  *v23 = a8;
  v23[1] = a10;
  v24 = (_QWORD *)(a9 + result[11]);
  *v24 = a11;
  v24[1] = a12;
  return result;
}

uint64_t type metadata accessor for MarketingDynamicView()
{
  uint64_t result;

  result = qword_256B41B30;
  if (!qword_256B41B30)
    return swift_getSingletonMetadata();
  return result;
}

char *MarketingDynamicView.makeUIViewController(context:)()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  char *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;

  v1 = (int *)type metadata accessor for MarketingDynamicView();
  v2 = *(_QWORD *)(v0 + v1[6]);
  v3 = objc_allocWithZone((Class)type metadata accessor for MarketingDynamicViewController());
  swift_unknownObjectRetain();
  v4 = (void *)sub_23C1FB438();
  v5 = objc_msgSend(v3, sel_initWithBag_URL_, v2, v4);
  swift_unknownObjectRelease();

  objc_msgSend(v5, sel_setAccount_, *(_QWORD *)(v0 + v1[5]));
  objc_msgSend(v5, sel_setAnonymousMetrics_, *(unsigned __int8 *)(v0 + v1[7]));
  v6 = *(void **)(v0 + v1[8]);
  v7 = v5;
  if (v6)
  {
    sub_23C1D4A48((uint64_t)v6);
    v6 = (void *)sub_23C1FBC78();
    swift_bridgeObjectRelease();
  }
  objc_msgSend(v5, sel_setMetricsOverlay_, v6);

  v8 = (void *)sub_23C1FBCC0();
  objc_msgSend(v5, sel_setMediaClientIdentifier_, v8);

  v9 = (void *)objc_opt_self();
  v10 = (char *)v5;
  v11 = objc_msgSend(v9, sel_currentProcess);
  v12 = (void *)sub_23C1FBCC0();
  objc_msgSend(v11, sel_setTreatmentNamespace_, v12);

  objc_msgSend(v10, sel_setClientInfo_, v11);
  v13 = OBJC_IVAR____TtC16FitnessMarketing30MarketingDynamicViewController_coordinator;
  v14 = (uint64_t *)(v0 + v1[10]);
  v15 = *v14;
  v16 = v14[1];
  v17 = (uint64_t *)(*(_QWORD *)&v10[OBJC_IVAR____TtC16FitnessMarketing30MarketingDynamicViewController_coordinator]
                  + OBJC_IVAR____TtC16FitnessMarketing31MarketingDynamicViewCoordinator_onPurchase);
  swift_beginAccess();
  v18 = *v17;
  *v17 = v15;
  v17[1] = v16;
  sub_23C1CF980(v15);
  sub_23C1CF99C(v18);
  v19 = (uint64_t *)(v0 + v1[11]);
  v20 = *v19;
  v21 = v19[1];
  v22 = (uint64_t *)(*(_QWORD *)&v10[v13]
                  + OBJC_IVAR____TtC16FitnessMarketing31MarketingDynamicViewCoordinator_onCarrierLink);
  swift_beginAccess();
  v23 = *v22;
  *v22 = v20;
  v22[1] = v21;
  sub_23C1CF980(v20);
  sub_23C1CF99C(v23);
  v24 = (uint64_t *)(v0 + v1[9]);
  v25 = *v24;
  v26 = v24[1];
  v27 = (uint64_t *)(*(_QWORD *)&v10[v13] + OBJC_IVAR____TtC16FitnessMarketing31MarketingDynamicViewCoordinator_onDismiss);
  swift_beginAccess();
  v28 = *v27;
  *v27 = v25;
  v27[1] = v26;
  sub_23C1CF980(v25);
  sub_23C1CF99C(v28);
  return v10;
}

uint64_t sub_23C1D4A48(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  int64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  int64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  _OWORD v32[2];
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  _OWORD v36[2];
  _OWORD v37[3];
  _OWORD v38[2];
  __int128 v39;
  _OWORD v40[2];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B41BE8);
    v2 = sub_23C1FBEA0();
  }
  else
  {
    v2 = MEMORY[0x24BEE4B00];
  }
  v28 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v27 = (unint64_t)(63 - v3) >> 6;
  v6 = v2 + 64;
  swift_bridgeObjectRetain();
  result = swift_retain();
  v8 = 0;
  while (1)
  {
    if (v5)
    {
      v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27)
      goto LABEL_37;
    v14 = *(_QWORD *)(v28 + 8 * v13);
    v15 = v8 + 1;
    if (!v14)
    {
      v15 = v8 + 2;
      if (v8 + 2 >= v27)
        goto LABEL_37;
      v14 = *(_QWORD *)(v28 + 8 * v15);
      if (!v14)
      {
        v15 = v8 + 3;
        if (v8 + 3 >= v27)
          goto LABEL_37;
        v14 = *(_QWORD *)(v28 + 8 * v15);
        if (!v14)
        {
          v15 = v8 + 4;
          if (v8 + 4 >= v27)
            goto LABEL_37;
          v14 = *(_QWORD *)(v28 + 8 * v15);
          if (!v14)
            break;
        }
      }
    }
LABEL_27:
    v5 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v15 << 6);
    v8 = v15;
LABEL_28:
    v17 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v12);
    v19 = *v17;
    v18 = v17[1];
    sub_23C1C4C7C(*(_QWORD *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(_QWORD *)&v39 = v19;
    *((_QWORD *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(_QWORD *)&v37[0] = v19;
    *((_QWORD *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_23C1D58BC(v38, v32);
    v33 = v29;
    v34 = v30;
    v35 = v31;
    sub_23C1D58BC(v32, v36);
    v29 = v33;
    v30 = v34;
    v31 = v35;
    sub_23C1D58BC(v36, v37);
    sub_23C1D58BC(v37, &v33);
    result = sub_23C1FBE04();
    v20 = -1 << *(_BYTE *)(v2 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v6 + 8 * (v21 >> 6))) != 0)
    {
      v9 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v6 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
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
        v26 = *(_QWORD *)(v6 + 8 * v22);
      }
      while (v26 == -1);
      v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(_QWORD *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    v10 = *(_QWORD *)(v2 + 48) + 40 * v9;
    *(_OWORD *)v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(_QWORD *)(v10 + 32) = v31;
    result = (uint64_t)sub_23C1D58BC(&v33, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v9));
    ++*(_QWORD *)(v2 + 16);
  }
  v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_23C1D58CC();
    return v2;
  }
  v14 = *(_QWORD *)(v28 + 8 * v16);
  if (v14)
  {
    v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v15 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v15 >= v27)
      goto LABEL_37;
    v14 = *(_QWORD *)(v28 + 8 * v15);
    ++v16;
    if (v14)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_23C1D4E10()
{
  return sub_23C1D587C(&qword_256B41AD0, (uint64_t)&protocol conformance descriptor for MarketingDynamicView);
}

uint64_t sub_23C1D4E44()
{
  return sub_23C1FB810();
}

uint64_t sub_23C1D4E7C()
{
  return MEMORY[0x24BDF5560];
}

uint64_t sub_23C1D4E88()
{
  sub_23C1D587C(&qword_256B41BE0, (uint64_t)&protocol conformance descriptor for MarketingDynamicView);
  return sub_23C1FB84C();
}

uint64_t sub_23C1D4EE8()
{
  sub_23C1D587C(&qword_256B41BE0, (uint64_t)&protocol conformance descriptor for MarketingDynamicView);
  return sub_23C1FB81C();
}

void sub_23C1D4F48()
{
  sub_23C1D587C(&qword_256B41BE0, (uint64_t)&protocol conformance descriptor for MarketingDynamicView);
  sub_23C1FB840();
  __break(1u);
}

_QWORD *initializeBufferWithCopyOfBuffer for MarketingDynamicView(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  char *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v18 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23C1FB468();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = a3[6];
    v10 = *(void **)((char *)a2 + v8);
    *(_QWORD *)((char *)a1 + v8) = v10;
    *(_QWORD *)((char *)a1 + v9) = *(_QWORD *)((char *)a2 + v9);
    v11 = a3[8];
    *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
    *(_QWORD *)((char *)a1 + v11) = *(_QWORD *)((char *)a2 + v11);
    v12 = a3[9];
    v13 = (_QWORD *)((char *)a1 + v12);
    v14 = (char *)a2 + v12;
    v15 = *(_QWORD *)((char *)a2 + v12);
    v16 = v10;
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    if (v15)
    {
      v17 = *((_QWORD *)v14 + 1);
      *v13 = v15;
      v13[1] = v17;
      swift_retain();
    }
    else
    {
      *(_OWORD *)v13 = *(_OWORD *)v14;
    }
    v19 = a3[10];
    v20 = (_QWORD *)((char *)a1 + v19);
    v21 = (_QWORD *)((char *)a2 + v19);
    if (*v21)
    {
      v22 = v21[1];
      *v20 = *v21;
      v20[1] = v22;
      swift_retain();
    }
    else
    {
      *(_OWORD *)v20 = *(_OWORD *)v21;
    }
    v23 = a3[11];
    v24 = (_QWORD *)((char *)a1 + v23);
    v25 = (_QWORD *)((char *)a2 + v23);
    if (*v25)
    {
      v26 = v25[1];
      *v24 = *v25;
      v24[1] = v26;
      swift_retain();
    }
    else
    {
      *(_OWORD *)v24 = *(_OWORD *)v25;
    }
  }
  return a1;
}

uint64_t destroy for MarketingDynamicView(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t result;

  v4 = sub_23C1FB468();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);

  swift_unknownObjectRelease();
  result = swift_bridgeObjectRelease();
  if (*(_QWORD *)(a1 + a2[9]))
    result = swift_release();
  if (*(_QWORD *)(a1 + a2[10]))
    result = swift_release();
  if (*(_QWORD *)(a1 + a2[11]))
    return swift_release();
  return result;
}

uint64_t initializeWithCopy for MarketingDynamicView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;

  v6 = sub_23C1FB468();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a3[6];
  v9 = *(void **)(a2 + v7);
  *(_QWORD *)(a1 + v7) = v9;
  *(_QWORD *)(a1 + v8) = *(_QWORD *)(a2 + v8);
  v10 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  *(_QWORD *)(a1 + v10) = *(_QWORD *)(a2 + v10);
  v11 = a3[9];
  v12 = (_QWORD *)(a1 + v11);
  v13 = a2 + v11;
  v14 = *(_QWORD *)(a2 + v11);
  v15 = v9;
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  if (v14)
  {
    v16 = *(_QWORD *)(v13 + 8);
    *v12 = v14;
    v12[1] = v16;
    swift_retain();
  }
  else
  {
    *(_OWORD *)v12 = *(_OWORD *)v13;
  }
  v17 = a3[10];
  v18 = (_QWORD *)(a1 + v17);
  v19 = (_QWORD *)(a2 + v17);
  if (*v19)
  {
    v20 = v19[1];
    *v18 = *v19;
    v18[1] = v20;
    swift_retain();
  }
  else
  {
    *(_OWORD *)v18 = *(_OWORD *)v19;
  }
  v21 = a3[11];
  v22 = (_QWORD *)(a1 + v21);
  v23 = (_QWORD *)(a2 + v21);
  if (*v23)
  {
    v24 = v23[1];
    *v22 = *v23;
    v22[1] = v24;
    swift_retain();
  }
  else
  {
    *(_OWORD *)v22 = *(_OWORD *)v23;
  }
  return a1;
}

uint64_t assignWithCopy for MarketingDynamicView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v6 = sub_23C1FB468();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = *(void **)(a1 + v7);
  v9 = *(void **)(a2 + v7);
  *(_QWORD *)(a1 + v7) = v9;
  v10 = v9;

  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v11 = a3[9];
  v12 = (_QWORD *)(a1 + v11);
  v13 = a2 + v11;
  v14 = *(_QWORD *)(a1 + v11);
  v15 = *(_QWORD *)(a2 + v11);
  if (v14)
  {
    if (v15)
    {
      v16 = *(_QWORD *)(v13 + 8);
      *v12 = v15;
      v12[1] = v16;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v15)
  {
    v17 = *(_QWORD *)(v13 + 8);
    *v12 = v15;
    v12[1] = v17;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)v12 = *(_OWORD *)v13;
LABEL_8:
  v18 = a3[10];
  v19 = (_QWORD *)(a1 + v18);
  v20 = a2 + v18;
  v21 = *(_QWORD *)(a1 + v18);
  v22 = *(_QWORD *)(a2 + v18);
  if (v21)
  {
    if (v22)
    {
      v23 = *(_QWORD *)(v20 + 8);
      *v19 = v22;
      v19[1] = v23;
      swift_retain();
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v22)
  {
    v24 = *(_QWORD *)(v20 + 8);
    *v19 = v22;
    v19[1] = v24;
    swift_retain();
    goto LABEL_15;
  }
  *(_OWORD *)v19 = *(_OWORD *)v20;
LABEL_15:
  v25 = a3[11];
  v26 = (_QWORD *)(a1 + v25);
  v27 = (uint64_t *)(a2 + v25);
  v28 = *(_QWORD *)(a1 + v25);
  v29 = *v27;
  if (!v28)
  {
    if (v29)
    {
      v31 = v27[1];
      *v26 = v29;
      v26[1] = v31;
      swift_retain();
      return a1;
    }
LABEL_21:
    *(_OWORD *)v26 = *(_OWORD *)v27;
    return a1;
  }
  if (!v29)
  {
    swift_release();
    goto LABEL_21;
  }
  v30 = v27[1];
  *v26 = v29;
  v26[1] = v30;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for MarketingDynamicView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v6 = sub_23C1FB468();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  v8 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  *(_QWORD *)(a1 + v8) = *(_QWORD *)(a2 + v8);
  v9 = a3[9];
  v10 = (_QWORD *)(a1 + v9);
  v11 = (uint64_t *)(a2 + v9);
  v12 = *v11;
  if (*v11)
  {
    v13 = v11[1];
    *v10 = v12;
    v10[1] = v13;
  }
  else
  {
    *(_OWORD *)v10 = *(_OWORD *)v11;
  }
  v14 = a3[10];
  v15 = (_QWORD *)(a1 + v14);
  v16 = (uint64_t *)(a2 + v14);
  v17 = *v16;
  if (*v16)
  {
    v18 = v16[1];
    *v15 = v17;
    v15[1] = v18;
  }
  else
  {
    *(_OWORD *)v15 = *(_OWORD *)v16;
  }
  v19 = a3[11];
  v20 = (_QWORD *)(a1 + v19);
  v21 = (uint64_t *)(a2 + v19);
  v22 = *v21;
  if (*v21)
  {
    v23 = v21[1];
    *v20 = v22;
    v20[1] = v23;
  }
  else
  {
    *(_OWORD *)v20 = *(_OWORD *)v21;
  }
  return a1;
}

uint64_t assignWithTake for MarketingDynamicView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v6 = sub_23C1FB468();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = *(void **)(a1 + v7);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);

  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  swift_unknownObjectRelease();
  v9 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  *(_QWORD *)(a1 + v9) = *(_QWORD *)(a2 + v9);
  swift_bridgeObjectRelease();
  v10 = a3[9];
  v11 = (_QWORD *)(a1 + v10);
  v12 = a2 + v10;
  v13 = *(_QWORD *)(a1 + v10);
  v14 = *(_QWORD *)(a2 + v10);
  if (v13)
  {
    if (v14)
    {
      v15 = *(_QWORD *)(v12 + 8);
      *v11 = v14;
      v11[1] = v15;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v14)
  {
    v16 = *(_QWORD *)(v12 + 8);
    *v11 = v14;
    v11[1] = v16;
    goto LABEL_8;
  }
  *(_OWORD *)v11 = *(_OWORD *)v12;
LABEL_8:
  v17 = a3[10];
  v18 = (_QWORD *)(a1 + v17);
  v19 = a2 + v17;
  v20 = *(_QWORD *)(a1 + v17);
  v21 = *(_QWORD *)(a2 + v17);
  if (v20)
  {
    if (v21)
    {
      v22 = *(_QWORD *)(v19 + 8);
      *v18 = v21;
      v18[1] = v22;
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v21)
  {
    v23 = *(_QWORD *)(v19 + 8);
    *v18 = v21;
    v18[1] = v23;
    goto LABEL_15;
  }
  *(_OWORD *)v18 = *(_OWORD *)v19;
LABEL_15:
  v24 = a3[11];
  v25 = (_QWORD *)(a1 + v24);
  v26 = (uint64_t *)(a2 + v24);
  v27 = *(_QWORD *)(a1 + v24);
  v28 = *v26;
  if (!v27)
  {
    if (v28)
    {
      v30 = v26[1];
      *v25 = v28;
      v25[1] = v30;
      return a1;
    }
LABEL_21:
    *(_OWORD *)v25 = *(_OWORD *)v26;
    return a1;
  }
  if (!v28)
  {
    swift_release();
    goto LABEL_21;
  }
  v29 = v26[1];
  *v25 = v28;
  v25[1] = v29;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for MarketingDynamicView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C1D56E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_23C1FB468();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for MarketingDynamicView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C1D5770(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_23C1FB468();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  return result;
}

uint64_t sub_23C1D57E8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23C1FB468();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23C1D587C(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for MarketingDynamicView();
    result = MEMORY[0x242619B10](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

_OWORD *sub_23C1D58BC(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_23C1D58CC()
{
  return swift_release();
}

uint64_t sub_23C1D58D4()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for LocalizationBundle()
{
  return objc_opt_self();
}

id sub_23C1D5904()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  type metadata accessor for LocalizationBundle();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  qword_256B4F8C8 = (uint64_t)result;
  return result;
}

uint64_t sub_23C1D5958@<X0>(_QWORD *a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)();

  v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC16FitnessMarketing31MarketingDynamicViewCoordinator_onDismiss);
  swift_beginAccess();
  v4 = *v3;
  v5 = v3[1];
  if (v4)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_23C1D659C;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)())v6;
  return sub_23C1CF980(v4);
}

uint64_t sub_23C1D59EC(uint64_t *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();
  uint64_t *v7;
  uint64_t v8;

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_23C1D65A0;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC16FitnessMarketing31MarketingDynamicViewCoordinator_onDismiss);
  swift_beginAccess();
  v8 = *v7;
  *v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_23C1CF980(v3);
  return sub_23C1CF99C(v8);
}

uint64_t MarketingDynamicViewCoordinator.onDismiss.getter()
{
  return sub_23C1D5E28(&OBJC_IVAR____TtC16FitnessMarketing31MarketingDynamicViewCoordinator_onDismiss, (void (*)(_QWORD, _QWORD))sub_23C1CF980);
}

uint64_t MarketingDynamicViewCoordinator.onDismiss.setter(uint64_t a1, uint64_t a2)
{
  return sub_23C1D5E9C(a1, a2, &OBJC_IVAR____TtC16FitnessMarketing31MarketingDynamicViewCoordinator_onDismiss, (uint64_t (*)(uint64_t, uint64_t))sub_23C1CF99C);
}

uint64_t (*MarketingDynamicViewCoordinator.onDismiss.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_23C1D5B10@<X0>(_QWORD *a1@<X0>, uint64_t (**a2)(uint64_t a1)@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);

  v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC16FitnessMarketing31MarketingDynamicViewCoordinator_onPurchase);
  swift_beginAccess();
  v4 = *v3;
  v5 = v3[1];
  if (v4)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_23C1D6534;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)(uint64_t))v6;
  return sub_23C1CF980(v4);
}

uint64_t sub_23C1D5BA4(uint64_t *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, char);
  uint64_t *v7;
  uint64_t v8;

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_23C1D6528;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC16FitnessMarketing31MarketingDynamicViewCoordinator_onPurchase);
  swift_beginAccess();
  v8 = *v7;
  *v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_23C1CF980(v3);
  return sub_23C1CF99C(v8);
}

uint64_t MarketingDynamicViewCoordinator.onPurchase.getter()
{
  return sub_23C1D5E28(&OBJC_IVAR____TtC16FitnessMarketing31MarketingDynamicViewCoordinator_onPurchase, (void (*)(_QWORD, _QWORD))sub_23C1CF980);
}

uint64_t MarketingDynamicViewCoordinator.onPurchase.setter(uint64_t a1, uint64_t a2)
{
  return sub_23C1D5E9C(a1, a2, &OBJC_IVAR____TtC16FitnessMarketing31MarketingDynamicViewCoordinator_onPurchase, (uint64_t (*)(uint64_t, uint64_t))sub_23C1CF99C);
}

uint64_t (*MarketingDynamicViewCoordinator.onPurchase.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_23C1D5CC8@<X0>(_QWORD *a1@<X0>, uint64_t (**a2)(uint64_t a1)@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);

  v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC16FitnessMarketing31MarketingDynamicViewCoordinator_onCarrierLink);
  swift_beginAccess();
  v4 = *v3;
  v5 = v3[1];
  if (v4)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_23C1D64FC;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)(uint64_t))v6;
  return sub_23C1CF980(v4);
}

uint64_t sub_23C1D5D5C(uint64_t *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, char);
  uint64_t *v7;
  uint64_t v8;

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_23C1D64C4;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC16FitnessMarketing31MarketingDynamicViewCoordinator_onCarrierLink);
  swift_beginAccess();
  v8 = *v7;
  *v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_23C1CF980(v3);
  return sub_23C1CF99C(v8);
}

uint64_t MarketingDynamicViewCoordinator.onCarrierLink.getter()
{
  return sub_23C1D5E28(&OBJC_IVAR____TtC16FitnessMarketing31MarketingDynamicViewCoordinator_onCarrierLink, (void (*)(_QWORD, _QWORD))sub_23C1D6580);
}

uint64_t sub_23C1D5E28(_QWORD *a1, void (*a2)(_QWORD, _QWORD))
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;

  v4 = (_QWORD *)(v2 + *a1);
  swift_beginAccess();
  v5 = *v4;
  a2(*v4, v4[1]);
  return v5;
}

uint64_t MarketingDynamicViewCoordinator.onCarrierLink.setter(uint64_t a1, uint64_t a2)
{
  return sub_23C1D5E9C(a1, a2, &OBJC_IVAR____TtC16FitnessMarketing31MarketingDynamicViewCoordinator_onCarrierLink, (uint64_t (*)(uint64_t, uint64_t))sub_23C1D6584);
}

uint64_t sub_23C1D5E9C(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v8 = (uint64_t *)(v4 + *a3);
  swift_beginAccess();
  v9 = *v8;
  v10 = v8[1];
  *v8 = a1;
  v8[1] = a2;
  return a4(v9, v10);
}

uint64_t (*MarketingDynamicViewCoordinator.onCarrierLink.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id MarketingDynamicViewCoordinator.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void MarketingDynamicViewCoordinator.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id MarketingDynamicViewCoordinator.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void MarketingDynamicViewCoordinator.dynamicViewController(_:didFinishWith:error:)(uint64_t a1, void *a2, void *a3)
{
  sub_23C1D6324(a2, a3, &OBJC_IVAR____TtC16FitnessMarketing31MarketingDynamicViewCoordinator_onDismiss, (void (*)(_QWORD, uint64_t))sub_23C1CF980, (void (*)(_QWORD, uint64_t))sub_23C1CF99C);
}

void MarketingDynamicViewCoordinator.dynamicViewController(_:didFinishPurchaseWith:error:)(uint64_t a1, void *a2, void *a3)
{
  sub_23C1D6324(a2, a3, &OBJC_IVAR____TtC16FitnessMarketing31MarketingDynamicViewCoordinator_onPurchase, (void (*)(_QWORD, uint64_t))sub_23C1CF980, (void (*)(_QWORD, uint64_t))sub_23C1CF99C);
}

void sub_23C1D60E4(void *a1, uint64_t a2, void *a3, void *a4, void *a5, _QWORD *a6, void (*a7)(_QWORD, uint64_t), void (*a8)(_QWORD, uint64_t))
{
  id v14;
  id v15;
  id v16;
  id v17;

  v14 = a3;
  v15 = a4;
  v16 = a1;
  v17 = a5;
  sub_23C1D6324(a4, a5, a6, a7, a8);

}

void MarketingDynamicViewCoordinator.dynamicViewController(_:didFinishCarrierLinkingWith:error:)(uint64_t a1, void *a2, void *a3)
{
  sub_23C1D6324(a2, a3, &OBJC_IVAR____TtC16FitnessMarketing31MarketingDynamicViewCoordinator_onCarrierLink, (void (*)(_QWORD, uint64_t))sub_23C1D6580, (void (*)(_QWORD, uint64_t))sub_23C1D6584);
}

id sub_23C1D61D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  char *v6;
  void *v7;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  objc_class *ObjectType;
  objc_super v23;

  v7 = v6;
  ObjectType = (objc_class *)swift_getObjectType();
  v12 = (uint64_t *)&v6[OBJC_IVAR____TtC16FitnessMarketing31MarketingDynamicViewCoordinator_onDismiss];
  *v12 = 0;
  v12[1] = 0;
  v13 = (uint64_t *)&v6[OBJC_IVAR____TtC16FitnessMarketing31MarketingDynamicViewCoordinator_onPurchase];
  *v13 = 0;
  v13[1] = 0;
  v14 = (uint64_t *)&v6[OBJC_IVAR____TtC16FitnessMarketing31MarketingDynamicViewCoordinator_onCarrierLink];
  *v14 = 0;
  v14[1] = 0;
  swift_beginAccess();
  v15 = *v12;
  *v12 = a1;
  v12[1] = a2;
  v16 = v7;
  sub_23C1CF980(a1);
  sub_23C1CF99C(v15);
  swift_beginAccess();
  v17 = *v13;
  *v13 = a3;
  v13[1] = a4;
  sub_23C1CF980(a3);
  sub_23C1CF99C(v17);
  swift_beginAccess();
  v18 = *v14;
  *v14 = a5;
  v14[1] = a6;
  sub_23C1CF980(a5);
  sub_23C1CF99C(v18);

  v23.receiver = v16;
  v23.super_class = ObjectType;
  return objc_msgSendSuper2(&v23, sel_init);
}

void sub_23C1D6324(void *a1, void *a2, _QWORD *a3, void (*a4)(_QWORD, uint64_t), void (*a5)(_QWORD, uint64_t))
{
  uint64_t v5;
  uint64_t v8;
  void (*v10)(void *, uint64_t);
  uint64_t v11;
  id v12;
  void (*v14)(void *, uint64_t);
  uint64_t v15;
  void *v16;
  _QWORD *v17;
  id v18;

  v8 = v5 + *a3;
  if (a1)
  {
    swift_beginAccess();
    v10 = *(void (**)(void *, uint64_t))v8;
    if (*(_QWORD *)v8)
    {
      v11 = *(_QWORD *)(v8 + 8);
      v12 = a1;
      a4(v10, v11);
      v10(a1, 0);
      a5(v10, v11);

    }
  }
  else
  {
    swift_beginAccess();
    v14 = *(void (**)(void *, uint64_t))v8;
    if (*(_QWORD *)v8)
    {
      v15 = *(_QWORD *)(v8 + 8);
      if (a2)
      {
        v16 = a2;
      }
      else
      {
        sub_23C1D653C();
        v16 = (void *)swift_allocError();
        *v17 = 0;
        v17[1] = 0;
        v17[2] = 2;
      }
      a4(v14, v15);
      v18 = a2;
      v14(v16, 1);
      a5(v14, v15);

    }
  }
}

uint64_t type metadata accessor for MarketingDynamicViewCoordinator()
{
  return objc_opt_self();
}

uint64_t method lookup function for MarketingDynamicViewCoordinator()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_23C1D64A0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23C1D64C4(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t *);
  uint64_t v5;
  char v6;

  v3 = *(uint64_t (**)(uint64_t *))(v2 + 16);
  v5 = a1;
  v6 = a2 & 1;
  return v3(&v5);
}

uint64_t sub_23C1D64FC(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v1 + 16))(*(_QWORD *)a1, *(unsigned __int8 *)(a1 + 8));
}

uint64_t sub_23C1D6528(uint64_t a1, char a2)
{
  uint64_t v2;

  return sub_23C1F36D0(a1, a2 & 1, *(uint64_t (**)(uint64_t *))(v2 + 16));
}

uint64_t sub_23C1D6534(uint64_t a1)
{
  uint64_t v1;

  return sub_23C1F36A0(a1, *(uint64_t (**)(_QWORD, _QWORD))(v1 + 16));
}

unint64_t sub_23C1D653C()
{
  unint64_t result;

  result = qword_256B41D90;
  if (!qword_256B41D90)
  {
    result = MEMORY[0x242619B10](&protocol conformance descriptor for MarketingError, &type metadata for MarketingError);
    atomic_store(result, (unint64_t *)&qword_256B41D90);
  }
  return result;
}

int *MarketingWebView.init(url:account:bag:metricsOverlay:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  int *result;

  v10 = sub_23C1FB468();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(a5, a1, v10);
  result = (int *)type metadata accessor for MarketingWebView();
  *(_QWORD *)(a5 + result[5]) = a2;
  *(_QWORD *)(a5 + result[6]) = a3;
  *(_QWORD *)(a5 + result[7]) = a4;
  return result;
}

uint64_t type metadata accessor for MarketingWebView()
{
  uint64_t result;

  result = qword_256B41E08;
  if (!qword_256B41E08)
    return swift_getSingletonMetadata();
  return result;
}

id MarketingWebView.makeUIViewController(context:)()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  char *v20;
  void *v21;
  id v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  char *v27;
  uint64_t v28;
  _QWORD aBlock[6];

  v1 = (int *)type metadata accessor for MarketingWebView();
  MEMORY[0x24BDAC7A8](v1);
  v28 = (uint64_t)&v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41DA0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23C1FB468();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v27 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v27 - v10;
  v12 = objc_msgSend((id)objc_opt_self(), sel_currentProcess);
  v13 = (void *)sub_23C1FBCC0();
  objc_msgSend(v12, sel_setTreatmentNamespace_, v13);

  v14 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for MarketingWebViewController()), sel_initWithBag_account_clientInfo_, *(_QWORD *)(v0 + v1[6]), *(_QWORD *)(v0 + v1[5]), v12);
  v15 = *(void **)(v0 + v1[7]);
  v16 = v14;
  if (v15)
    v15 = (void *)sub_23C1FBC78();
  objc_msgSend(v14, sel_setMetricsOverlay_, v15);

  sub_23C1BF4A4((uint64_t)v5);
  v17 = v0;
  v18 = v28;
  sub_23C1D69D4(v17, v28);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v11, v18, v6);
    sub_23C1D6A18(v18);
    sub_23C1D6A54((uint64_t)v5);
  }
  else
  {
    sub_23C1D6A18(v18);
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v11, v5, v6);
  }
  v19 = v12;
  v20 = v27;
  v21 = (void *)sub_23C1FB438();
  v22 = objc_msgSend(v14, sel_loadURL_, v21);

  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v20, v11, v6);
  v23 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v24 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v24 + v23, v20, v6);
  aBlock[4] = sub_23C1D6DDC;
  aBlock[5] = v24;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23C1D6E28;
  aBlock[3] = &block_descriptor;
  v25 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v22, sel_addFinishBlock_, v25);
  _Block_release(v25);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v11, v6);
  return v14;
}

uint64_t sub_23C1D69D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MarketingWebView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23C1D6A18(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for MarketingWebView();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23C1D6A54(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41DA0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_23C1D6A94(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v5 = sub_23C1FB468();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    v9 = a2;
    if (qword_256B408D0 != -1)
      swift_once();
    v10 = sub_23C1FB54C();
    __swift_project_value_buffer(v10, (uint64_t)qword_256B4F8B0);
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a3, v5);
    v11 = a2;
    v12 = a2;
    v13 = sub_23C1FB534();
    v14 = sub_23C1FBDA4();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = swift_slowAlloc();
      v16 = swift_slowAlloc();
      v24 = v16;
      *(_DWORD *)v15 = 141558530;
      v25 = 1752392040;
      v26 = v16;
      sub_23C1FBDEC();
      *(_WORD *)(v15 + 12) = 2080;
      sub_23C1B56F4(&qword_256B41E50, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
      v17 = sub_23C1FBF84();
      v25 = sub_23C1EF224(v17, v18, &v26);
      sub_23C1FBDEC();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      *(_WORD *)(v15 + 22) = 2082;
      v25 = (uint64_t)a2;
      v19 = a2;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256B41E58);
      v20 = sub_23C1FBCD8();
      v25 = sub_23C1EF224(v20, v21, &v26);
      sub_23C1FBDEC();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_23C1B2000, v13, v14, "Failed to load %{mask.hash}s: %{public}s", (uint8_t *)v15, 0x20u);
      v22 = v24;
      swift_arrayDestroy();
      MEMORY[0x242619BC4](v22, -1, -1);
      MEMORY[0x242619BC4](v15, -1, -1);

    }
    else
    {

      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    }
  }
}

uint64_t sub_23C1D6D7C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_23C1FB468();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

void sub_23C1D6DDC(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(sub_23C1FB468() - 8) + 80);
  sub_23C1D6A94(a1, a2, v2 + ((v5 + 16) & ~v5));
}

void sub_23C1D6E28(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

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

uint64_t sub_23C1D6EA4()
{
  return sub_23C1B56F4(&qword_256B41DA8, (uint64_t (*)(uint64_t))type metadata accessor for MarketingWebView, (uint64_t)&protocol conformance descriptor for MarketingWebView);
}

uint64_t sub_23C1D6ED4()
{
  sub_23C1B56F4(&qword_256B41E48, (uint64_t (*)(uint64_t))type metadata accessor for MarketingWebView, (uint64_t)&protocol conformance descriptor for MarketingWebView);
  return sub_23C1FB84C();
}

uint64_t sub_23C1D6F3C()
{
  sub_23C1B56F4(&qword_256B41E48, (uint64_t (*)(uint64_t))type metadata accessor for MarketingWebView, (uint64_t)&protocol conformance descriptor for MarketingWebView);
  return sub_23C1FB81C();
}

void sub_23C1D6FA4()
{
  sub_23C1B56F4(&qword_256B41E48, (uint64_t (*)(uint64_t))type metadata accessor for MarketingWebView, (uint64_t)&protocol conformance descriptor for MarketingWebView);
  sub_23C1FB840();
  __break(1u);
}

uint64_t *initializeBufferWithCopyOfBuffer for MarketingWebView(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23C1FB468();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = a3[6];
    v10 = *(void **)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = (uint64_t)v10;
    *(uint64_t *)((char *)a1 + v9) = *(uint64_t *)((char *)a2 + v9);
    *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    v11 = v10;
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for MarketingWebView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23C1FB468();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);

  swift_unknownObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for MarketingWebView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v6 = sub_23C1FB468();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a3[6];
  v9 = *(void **)(a2 + v7);
  *(_QWORD *)(a1 + v7) = v9;
  *(_QWORD *)(a1 + v8) = *(_QWORD *)(a2 + v8);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  v10 = v9;
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for MarketingWebView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v6 = sub_23C1FB468();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = *(void **)(a1 + v7);
  v9 = *(void **)(a2 + v7);
  *(_QWORD *)(a1 + v7) = v9;
  v10 = v9;

  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for MarketingWebView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_23C1FB468();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t assignWithTake for MarketingWebView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v6 = sub_23C1FB468();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = *(void **)(a1 + v7);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);

  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  swift_unknownObjectRelease();
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MarketingWebView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C1D7318(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_23C1FB468();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for MarketingWebView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C1D73A0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_23C1FB468();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  return result;
}

uint64_t sub_23C1D7418()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23C1FB468();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for ReversedTitleIconLabelStyle()
{
  return &type metadata for ReversedTitleIconLabelStyle;
}

uint64_t sub_23C1D74A4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23C1D74B4@<X0>(char *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  void (*v15)(char *, char *, uint64_t);
  void (*v16)(char *, char *, uint64_t);
  char *v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t);
  void (*v20)(char *, uint64_t);
  uint64_t v22;
  char *v23;

  v23 = a1;
  v1 = sub_23C1FB7B0();
  v22 = *(_QWORD *)(v1 - 8);
  v2 = v22;
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v22 - v6;
  v8 = sub_23C1FB7C8();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v22 - v13;
  sub_23C1FB7D4();
  sub_23C1FB7BC();
  v15 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  v15(v12, v14, v8);
  v16 = *(void (**)(char *, char *, uint64_t))(v2 + 16);
  v16(v5, v7, v1);
  v17 = v23;
  v15(v23, v12, v8);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41E68);
  v16(&v17[*(int *)(v18 + 48)], v5, v1);
  v19 = *(void (**)(char *, uint64_t))(v22 + 8);
  v19(v7, v1);
  v20 = *(void (**)(char *, uint64_t))(v9 + 8);
  v20(v14, v8);
  v19(v5, v1);
  return ((uint64_t (*)(char *, uint64_t))v20)(v12, v8);
}

uint64_t sub_23C1D7654@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *v1;
  *(_QWORD *)a1 = sub_23C1FB6F0();
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = 0;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41E60);
  return sub_23C1D74B4((char *)(a1 + *(int *)(v4 + 44)));
}

unint64_t sub_23C1D76AC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256B41E70;
  if (!qword_256B41E70)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41E78);
    result = MEMORY[0x242619B10](MEMORY[0x24BDF4498], v1);
    atomic_store(result, (unint64_t *)&qword_256B41E70);
  }
  return result;
}

uint64_t sub_23C1D76F8(uint64_t *a1, unint64_t a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t TupleTypeMetadata;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  __int128 *v12;
  _OWORD *v13;
  unint64_t v14;
  __int128 v15;
  unint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;

  v4 = a1;
  v5 = (uint64_t *)(a3 & 0xFFFFFFFFFFFFFFFELL);
  if (a2 == 1)
  {
    TupleTypeMetadata = *v5;
    MEMORY[0x24BDAC7A8](a1);
    v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
LABEL_12:
    v22 = 32;
    v23 = a2;
    do
    {
      if (a2 == 1)
        v24 = 0;
      else
        v24 = *(_DWORD *)(TupleTypeMetadata + v22);
      v26 = *v5++;
      v25 = v26;
      v27 = *v4++;
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(v25 - 8) + 16))(&v8[v24], v27);
      v22 += 16;
      --v23;
    }
    while (v23);
    return sub_23C1FBBF4();
  }
  MEMORY[0x24BDAC7A8](a1);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    v11 = 0;
    if (a2 < 4)
      goto LABEL_9;
    if ((unint64_t)(v10 - (char *)v5) < 0x20)
      goto LABEL_9;
    v11 = a2 & 0xFFFFFFFFFFFFFFFCLL;
    v12 = (__int128 *)(v5 + 2);
    v13 = v10 + 16;
    v14 = a2 & 0xFFFFFFFFFFFFFFFCLL;
    do
    {
      v15 = *v12;
      *(v13 - 1) = *(v12 - 1);
      *v13 = v15;
      v12 += 2;
      v13 += 2;
      v14 -= 4;
    }
    while (v14);
    if (v11 != a2)
    {
LABEL_9:
      v16 = a2 - v11;
      v17 = v11;
      v18 = &v10[8 * v11];
      v19 = &v5[v17];
      do
      {
        v20 = *v19++;
        *(_QWORD *)v18 = v20;
        v18 += 8;
        --v16;
      }
      while (v16);
    }
  }
  TupleTypeMetadata = swift_getTupleTypeMetadata();
  MEMORY[0x24BDAC7A8](TupleTypeMetadata);
  v8 = (char *)&v29 - v21;
  if (a2)
    goto LABEL_12;
  return sub_23C1FBBF4();
}

void sub_23C1D78AC(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, _QWORD *a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE v17[24];
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v38 = a9;
  v34 = a6;
  v35 = a7;
  v32 = a4;
  v33 = a5;
  v31 = a3;
  v28 = a1;
  v29 = a2;
  v37 = sub_23C1FB624();
  MEMORY[0x24BDAC7A8](v37);
  v36 = &v17[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = a8[3];
  sub_23C1FB87C();
  v22 = v13;
  v18 = sub_23C1FB600();
  v30 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v25 = &v17[-v14];
  v27 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41E80);
  v39 = a10;
  v40 = a11;
  v19 = a10;
  v20 = a11;
  MEMORY[0x242619ABC](255, &v39, MEMORY[0x24BDF3110], 0);
  sub_23C1FB600();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41E88);
  sub_23C1FB600();
  v26 = a8;
  v16 = a8[4];
  v15 = a8[5];
  v23 = a8[2];
  v24 = v16;
  v21 = v15;
  v39 = v23;
  v40 = v13;
  v41 = v16;
  v42 = v15;
  type metadata accessor for MarketingInlineView.FocusedButton();
}

uint64_t sub_23C1D7A20(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t OpaqueTypeConformance2;
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
  _BYTE *v23;
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
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  char *v46;
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
  uint64_t v65;
  void (*v66)(uint64_t, uint64_t);
  _BYTE v68[112];

  v9 = sub_23C1FBDE0();
  *(_QWORD *)(v7 - 256) = v4;
  *(_QWORD *)(v7 - 248) = v2;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v11 = MEMORY[0x24BDECC60];
  *(_QWORD *)(v7 - 120) = OpaqueTypeConformance2;
  *(_QWORD *)(v7 - 112) = v11;
  v12 = MEMORY[0x24BDED308];
  v13 = MEMORY[0x242619B10](MEMORY[0x24BDED308], v6, v7 - 120);
  v14 = sub_23C1BC328(&qword_256B41E90, v5, MEMORY[0x24BDF1028]);
  *(_QWORD *)(v7 - 136) = v13;
  *(_QWORD *)(v7 - 128) = v14;
  v15 = MEMORY[0x242619B10](v12, v3, v7 - 136);
  *(_QWORD *)(v7 - 144) = MEMORY[0x242619B10](&unk_23C202760, a1);
  v16 = MEMORY[0x242619B10](MEMORY[0x24BEE4AB0], v9, v7 - 144);
  *(_QWORD *)(v7 - 256) = v3;
  *(_QWORD *)(v7 - 248) = v9;
  *(_QWORD *)(v7 - 240) = v15;
  *(_QWORD *)(v7 - 232) = v16;
  MEMORY[0x242619ABC](255, v7 - 256, MEMORY[0x24BDF3748], 0);
  swift_getTupleTypeMetadata2();
  v17 = sub_23C1FBBE8();
  MEMORY[0x242619B10](MEMORY[0x24BDF5428], v17);
  v18 = sub_23C1FBB88();
  v19 = sub_23C1FB600();
  *(_QWORD *)(v7 - 160) = MEMORY[0x242619B10](MEMORY[0x24BDF4700], v18);
  *(_QWORD *)(v7 - 152) = v11;
  *v1 = MEMORY[0x242619B10](v12, v19, v7 - 160);
  v1[2] = sub_23C1FB63C();
  v20 = v1[3];
  v21 = sub_23C1FB600();
  v1[5] = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v23 = &v68[-v22];
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41E98);
  v24 = sub_23C1FB600();
  v25 = *(_QWORD *)(v24 - 8);
  v1[4] = v24;
  v1[13] = v25;
  MEMORY[0x24BDAC7A8](v24);
  v1[1] = &v68[-v26];
  v27 = sub_23C1FB600();
  v28 = *(_QWORD *)(v27 - 8);
  v1[16] = v27;
  v1[20] = v28;
  MEMORY[0x24BDAC7A8](v27);
  v1[7] = &v68[-v29];
  v30 = sub_23C1FB600();
  v1[19] = v30;
  v1[21] = *(_QWORD *)(v30 - 8);
  v31 = MEMORY[0x24BDAC7A8](v30);
  v1[14] = &v68[-((v32 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v31);
  v1[17] = &v68[-v33];
  v34 = v1[15];
  v36 = v1[9];
  v35 = v1[10];
  sub_23C1FBA80();
  sub_23C1FBBD0();
  v1[36] = v1[11];
  v1[37] = v35;
  v37 = v1[12];
  v1[38] = v1[6];
  v1[39] = v37;
  v38 = v1[8];
  v1[40] = v36;
  v1[41] = v38;
  v39 = v1[25];
  v1[42] = v1[23];
  v1[43] = v39;
  v40 = v1[26];
  v1[44] = v1[33];
  v1[45] = v40;
  v41 = v1[28];
  v1[46] = v1[27];
  v1[47] = v41;
  v1[48] = v1[29];
  v42 = sub_23C1B56F4((unint64_t *)&qword_256B41EA0, (uint64_t (*)(uint64_t))MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
  *(_QWORD *)(v7 - 176) = v36;
  *(_QWORD *)(v7 - 168) = v42;
  v43 = MEMORY[0x242619B10](MEMORY[0x24BDED308], v20, v7 - 176);
  sub_23C1FBAC8();
  (*(void (**)(uint64_t, uint64_t))(v1[24] + 8))(v34, v20);
  sub_23C1EA38C();
  swift_getKeyPath();
  sub_23C1FBC54();
  swift_release();
  swift_release();
  v44 = *(_QWORD *)(v7 - 216);
  v45 = (_QWORD *)v1[30];
  v46 = (char *)v45 + *(int *)(v1[31] + 20);
  v47 = *MEMORY[0x24BDEEB68];
  v48 = sub_23C1FB714();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v48 - 8) + 104))(v46, v47, v48);
  *v45 = v44;
  v45[1] = v44;
  v49 = MEMORY[0x242619B10](MEMORY[0x24BDEDC10], v1[2]);
  v1[56] = v43;
  v1[57] = v49;
  v50 = MEMORY[0x24BDED308];
  v51 = MEMORY[0x242619B10](MEMORY[0x24BDED308], v21, v1 + 56);
  sub_23C1B56F4(&qword_256B41EA8, (uint64_t (*)(uint64_t))MEMORY[0x24BDED998], MEMORY[0x24BDED990]);
  v52 = v1[1];
  sub_23C1FBAF8();
  sub_23C1DA1D0((uint64_t)v45);
  (*(void (**)(_BYTE *, uint64_t))(v1[5] + 8))(v23, v21);
  sub_23C1EA38C();
  swift_getKeyPath();
  sub_23C1FBC54();
  swift_release();
  swift_release();
  v53 = sub_23C1BC328(&qword_256B41EB0, &qword_256B41E98, MEMORY[0x24BDEB950]);
  v1[54] = v51;
  v1[55] = v53;
  v54 = v50;
  v55 = v1[4];
  v56 = MEMORY[0x242619B10](v50, v55, v1 + 54);
  v57 = v1[7];
  sub_23C1FBA2C();
  (*(void (**)(uint64_t, uint64_t))(v1[13] + 8))(v52, v55);
  sub_23C1FB8DC();
  sub_23C1EA38C();
  swift_getKeyPath();
  sub_23C1FBC54();
  swift_release();
  swift_release();
  v58 = MEMORY[0x24BDEEC40];
  v1[52] = v56;
  v1[53] = v58;
  v59 = v54;
  v60 = v1[16];
  v61 = MEMORY[0x242619B10](v54, v60, v1 + 52);
  v62 = v1[14];
  sub_23C1FBAD4();
  (*(void (**)(uint64_t, uint64_t))(v1[20] + 8))(v57, v60);
  v1[50] = v61;
  v1[51] = MEMORY[0x24BDECC60];
  v63 = v59;
  v64 = v1[19];
  MEMORY[0x242619B10](v63, v64, v1 + 50);
  v65 = v1[17];
  sub_23C1CD350(v62, v64, v65);
  v66 = *(void (**)(uint64_t, uint64_t))(v1[21] + 8);
  v66(v62, v64);
  sub_23C1C87C4(v65, v64, v1[32]);
  return ((uint64_t (*)(uint64_t, uint64_t))v66)(v65, v64);
}

void sub_23C1D80C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41E80);
  v14 = a10;
  v15 = a13;
  MEMORY[0x242619ABC](255, &v14, MEMORY[0x24BDF3110], 0);
  sub_23C1FB600();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41E88);
  sub_23C1FB600();
  v14 = a8;
  v15 = a9;
  v16 = a11;
  v17 = a12;
  type metadata accessor for MarketingInlineView.FocusedButton();
}

void sub_23C1D819C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t OpaqueTypeConformance2;
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
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v16 = sub_23C1FBDE0();
  *(_QWORD *)(v14 - 208) = v10;
  *(_QWORD *)(v14 - 200) = v11;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v18 = MEMORY[0x24BDECC60];
  *(_QWORD *)(v14 - 104) = OpaqueTypeConformance2;
  *(_QWORD *)(v14 - 96) = v18;
  v19 = MEMORY[0x24BDED308];
  v20 = MEMORY[0x242619B10](MEMORY[0x24BDED308], v13, v14 - 104);
  v21 = sub_23C1BC328(&qword_256B41E90, &qword_256B41E88, MEMORY[0x24BDF1028]);
  *(_QWORD *)(v14 - 120) = v20;
  *(_QWORD *)(v14 - 112) = v21;
  v22 = MEMORY[0x242619B10](v19, v12, v14 - 120);
  *(_QWORD *)(v14 - 128) = MEMORY[0x242619B10](&unk_23C202760, a1);
  v23 = MEMORY[0x242619B10](MEMORY[0x24BEE4AB0], v16, v14 - 128);
  *(_QWORD *)(v14 - 208) = v12;
  *(_QWORD *)(v14 - 200) = v16;
  *(_QWORD *)(v14 - 192) = v22;
  *(_QWORD *)(v14 - 184) = v23;
  MEMORY[0x242619ABC](255, v14 - 208, MEMORY[0x24BDF3748], 0);
  swift_getTupleTypeMetadata2();
  v24 = sub_23C1FBBE8();
  *v9 = MEMORY[0x242619B10](MEMORY[0x24BDF5428], v24);
  v25 = sub_23C1FBB88();
  v9[3] = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  v26 = sub_23C1FB600();
  v9[4] = *(_QWORD *)(v26 - 8);
  v27 = MEMORY[0x24BDAC7A8](v26);
  v9[1] = (char *)&a9 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v27);
  v9[2] = (char *)&a9 - v29;
  sub_23C1FB72C();
  v31 = v9[6];
  v30 = v9[7];
  v9[20] = v30;
  v9[21] = v31;
  v33 = v9[8];
  v32 = v9[9];
  v9[22] = v10;
  v9[23] = v33;
  v34 = v9[5];
  v9[24] = v32;
  v9[25] = v34;
  v35 = v9[11];
  v36 = v9[12];
  v9[26] = v9[10];
  v9[27] = v35;
  v37 = v9[13];
  v9[28] = v36;
  v9[29] = v37;
  v38 = v9[15];
  v9[30] = v9[14];
  v9[31] = v38;
  v9[32] = v9[16];
  sub_23C1FBB7C();
  sub_23C1FB8DC();
  *(_QWORD *)(v14 - 208) = v30;
  *(_QWORD *)(v14 - 200) = v31;
  *(_QWORD *)(v14 - 192) = v33;
  *(_QWORD *)(v14 - 184) = v32;
  type metadata accessor for MarketingInlineView();
}

uint64_t sub_23C1D83D4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);

  sub_23C1EA38C();
  swift_getKeyPath();
  sub_23C1FBC54();
  swift_release();
  swift_release();
  v5 = MEMORY[0x242619B10](MEMORY[0x24BDF4700], v2);
  v6 = v0[1];
  sub_23C1FBAD4();
  (*(void (**)(uint64_t, uint64_t))(v0[3] + 8))(v3, v2);
  *(_QWORD *)(v4 - 224) = v5;
  *(_QWORD *)(v4 - 216) = MEMORY[0x24BDECC60];
  MEMORY[0x242619B10](MEMORY[0x24BDED308], v1, v4 - 224);
  v7 = v0[2];
  v8 = v6;
  sub_23C1CD350(v6, v1, v7);
  v9 = *(void (**)(uint64_t, uint64_t))(v0[4] + 8);
  v9(v8, v1);
  sub_23C1C87C4(v7, v1, v0[17]);
  return ((uint64_t (*)(uint64_t, uint64_t))v9)(v7, v1);
}

void sub_23C1D84EC()
{
  sub_23C1DA218((void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23C1D80C0);
}

void sub_23C1D84F8(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[60];
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v22[48] = a8;
  v22[23] = a7;
  v22[24] = a6;
  v22[16] = a5;
  v22[15] = a4;
  v22[57] = a3;
  v22[14] = a2;
  v22[13] = a1;
  v22[43] = a9;
  v22[47] = a12;
  v22[46] = a10;
  v22[34] = *(_QWORD *)(a11 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v22[20] = (char *)v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = a11;
  v24 = v15;
  v22[53] = a11;
  v16 = MEMORY[0x242619ABC](0, &v23, MEMORY[0x24BDF3110], 0);
  v22[40] = *(_QWORD *)(v16 - 8);
  v22[35] = v16;
  MEMORY[0x24BDAC7A8](v16);
  v22[22] = (char *)v22 - v17;
  v18 = sub_23C1FB600();
  v22[41] = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v22[33] = (char *)v22 - v19;
  v22[17] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41E88);
  v22[28] = v18;
  v20 = sub_23C1FB600();
  v22[42] = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v22[39] = (char *)v22 - v21;
  v23 = a8;
  v24 = a10;
  v25 = a12;
  v26 = a13;
  type metadata accessor for MarketingInlineView.FocusedButton();
}

void sub_23C1D86F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t OpaqueTypeConformance2;
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
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v17 = sub_23C1FBDE0();
  *(_QWORD *)(v15 - 120) = v13;
  *(_QWORD *)(v15 - 112) = v14;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  *(_QWORD *)(v15 - 488) = OpaqueTypeConformance2;
  v19 = MEMORY[0x24BDECC60];
  *(_QWORD *)(v15 - 136) = OpaqueTypeConformance2;
  *(_QWORD *)(v15 - 128) = v19;
  v20 = MEMORY[0x24BDED308];
  v21 = MEMORY[0x242619B10](MEMORY[0x24BDED308], v11, v15 - 136);
  *(_QWORD *)(v15 - 448) = v21;
  v22 = sub_23C1BC328(&qword_256B41E90, v9, MEMORY[0x24BDF1028]);
  *(_QWORD *)(v15 - 152) = v21;
  *(_QWORD *)(v15 - 144) = v22;
  *(_QWORD *)(v15 - 400) = v10;
  v23 = MEMORY[0x242619B10](v20, v10, v15 - 152);
  *(_QWORD *)(v15 - 408) = v23;
  *(_QWORD *)(v15 - 160) = MEMORY[0x242619B10](&unk_23C202760, a1);
  v24 = MEMORY[0x24BEE4AB0];
  *(_QWORD *)(v15 - 440) = v17;
  v25 = MEMORY[0x242619B10](v24, v17, v15 - 160);
  *(_QWORD *)(v15 - 416) = v25;
  *(_QWORD *)(v15 - 120) = v10;
  *(_QWORD *)(v15 - 112) = v17;
  *(_QWORD *)(v15 - 104) = v23;
  *(_QWORD *)(v15 - 96) = v25;
  v26 = MEMORY[0x242619ABC](0, v15 - 120, MEMORY[0x24BDF3748], 0);
  *(_QWORD *)(v15 - 368) = v26;
  *(_QWORD *)(v15 - 360) = *(_QWORD *)(v26 - 8);
  v27 = MEMORY[0x24BDAC7A8](v26);
  *(_QWORD *)(v15 - 352) = (char *)&a9 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = MEMORY[0x24BDAC7A8](v27);
  *(_QWORD *)(v15 - 456) = (char *)&a9 - v30;
  MEMORY[0x24BDAC7A8](v29);
  *(_QWORD *)(v15 - 424) = (char *)&a9 - v31;
  v32 = sub_23C1FB5F4();
  *(_QWORD *)(v15 - 240) = v32;
  *(_QWORD *)(v15 - 560) = *(_QWORD *)(v32 - 8);
  v33 = MEMORY[0x24BDAC7A8](v32);
  *(_QWORD *)(v15 - 512) = (char *)&a9 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = MEMORY[0x24BDAC7A8](v33);
  *(_QWORD *)(v15 - 248) = (char *)&a9 - v36;
  v37 = MEMORY[0x24BDAC7A8](v35);
  *(_QWORD *)(v15 - 256) = (char *)&a9 - v38;
  MEMORY[0x24BDAC7A8](v37);
  *(_QWORD *)(v15 - 568) = (char *)&a9 - v39;
  v40 = *(_QWORD *)(v15 - 288);
  *(_QWORD *)(v15 - 120) = *(_QWORD *)(v15 - 272);
  *(_QWORD *)(v15 - 112) = v40;
  *(_QWORD *)(v15 - 104) = *(_QWORD *)(v15 - 280);
  *(_QWORD *)(v15 - 96) = v12;
  *(_QWORD *)(v15 - 296) = v12;
  type metadata accessor for MarketingInlineView();
}

void sub_23C1D895C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
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
  void (*v36)(uint64_t, uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  void (*v43)(char *, uint64_t, uint64_t);
  uint64_t v44;
  uint64_t KeyPath;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(uint64_t);
  uint64_t v50;
  unsigned int v51;
  uint64_t v52;
  char v53;
  void (*v54)(uint64_t, uint64_t);
  unsigned int v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
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
  unsigned int v83;
  void (*v84)(uint64_t, uint64_t, uint64_t);
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;

  *(_QWORD *)(v14 - 208) = a1;
  v15 = *(_QWORD *)(*(_QWORD *)(a1 - 8) + 64);
  v16 = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](a1);
  *(_QWORD *)(v14 - 304) = (char *)&a9 - v17;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41EB8);
  *(_QWORD *)(v14 - 640) = v18;
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&a9 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v14 - 648) = v20;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41EC0);
  *(_QWORD *)(v14 - 576) = v21;
  *(_QWORD *)(v14 - 584) = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  *(_QWORD *)(v14 - 264) = (char *)&a9 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41E80);
  *(_QWORD *)(v14 - 216) = v23;
  v24 = MEMORY[0x24BDAC7A8](v23);
  *(_QWORD *)(v14 - 504) = (char *)&a9 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = MEMORY[0x24BDAC7A8](v24);
  *(_QWORD *)(v14 - 632) = (char *)&a9 - v27;
  MEMORY[0x24BDAC7A8](v26);
  *(_QWORD *)(v14 - 224) = (char *)&a9 - v28;
  v29 = v10;
  *(_QWORD *)(v14 - 592) = v10;
  v89 = v12;
  v30 = (uint64_t)v20;
  v31 = *(_QWORD *)(v14 - 200);
  v32 = v13;
  v33 = v13;
  v34 = *(_QWORD *)(v14 - 232);
  sub_23C1D920C(*(_QWORD *)(v14 - 552), *(_QWORD *)(v14 - 544), v31, *(_QWORD *)(v14 - 536), *(_QWORD *)(v14 - 528), v33, v11, v30, v9, v89);
  *(_DWORD *)(v14 - 528) = sub_23C1FB8D0();
  *(_QWORD *)(v14 - 536) = sub_23C1FBBD0();
  *(_QWORD *)(v14 - 544) = v35;
  v36 = *(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16);
  *(_QWORD *)(v14 - 552) = v36;
  v37 = *(_QWORD *)(v14 - 304);
  v38 = *(_QWORD *)(v14 - 208);
  v36(v37, v31, v38);
  v39 = *(unsigned __int8 *)(v16 + 80);
  v40 = v16;
  v41 = (v39 + 64) & ~v39;
  *(_QWORD *)(v14 - 608) = v41 + v15;
  *(_QWORD *)(v14 - 600) = v41;
  *(_QWORD *)(v14 - 616) = v39 | 7;
  v42 = (char *)swift_allocObject();
  *((_QWORD *)v42 + 2) = v32;
  *((_QWORD *)v42 + 3) = v11;
  *((_QWORD *)v42 + 4) = v34;
  *((_QWORD *)v42 + 5) = v9;
  *((_QWORD *)v42 + 6) = *(_QWORD *)(v14 - 296);
  *((_QWORD *)v42 + 7) = v29;
  v43 = *(void (**)(char *, uint64_t, uint64_t))(v40 + 32);
  *(_QWORD *)(v14 - 624) = v43;
  v43(&v42[v41], v37, v38);
  sub_23C1DA264();
  v44 = *(_QWORD *)(v14 - 648);
  sub_23C1FBA8C();
  swift_release();
  sub_23C1BC2EC(v44, &qword_256B41EB8);
  KeyPath = swift_getKeyPath();
  v46 = *(_QWORD *)(v14 - 256);
  v47 = *(_QWORD *)(v14 - 200);
  sub_23C1EA628(v38);
  v48 = *(_QWORD *)(v14 - 560);
  v49 = *(void (**)(uint64_t))(v48 + 104);
  v50 = *(_QWORD *)(v14 - 248);
  v51 = *MEMORY[0x24BDED100];
  *(_DWORD *)(v14 - 536) = *MEMORY[0x24BDED100];
  v52 = *(_QWORD *)(v14 - 240);
  v49(v50);
  *(_QWORD *)(v14 - 544) = v49;
  v53 = sub_23C1FB5E8();
  v54 = *(void (**)(uint64_t, uint64_t))(v48 + 8);
  v54(v50, v52);
  v54(v46, v52);
  v55 = *MEMORY[0x24BDED118];
  *(_DWORD *)(v14 - 528) = *MEMORY[0x24BDED118];
  if ((v53 & 1) != 0)
    v56 = v51;
  else
    v56 = v55;
  v57 = *(_QWORD *)(v14 - 568);
  ((void (*)(uint64_t, uint64_t, uint64_t))v49)(v57, v56, v52);
  v58 = *(_QWORD *)(v14 - 632);
  v59 = (uint64_t *)(v58 + *(int *)(*(_QWORD *)(v14 - 216) + 36));
  (*(void (**)(char *, uint64_t, uint64_t))(v48 + 16))((char *)v59 + *(int *)(*(_QWORD *)(v14 - 520) + 28), v57, v52);
  *v59 = KeyPath;
  v60 = *(_QWORD *)(v14 - 584);
  v61 = v58;
  v62 = v58;
  v63 = *(_QWORD *)(v14 - 264);
  v64 = *(_QWORD *)(v14 - 576);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v60 + 16))(v61, v63, v64);
  v54(v57, v52);
  (*(void (**)(uint64_t, uint64_t))(v60 + 8))(v63, v64);
  v65 = sub_23C1BF778(v62, *(_QWORD *)(v14 - 224), &qword_256B41E80);
  v66 = *(_QWORD *)(v14 - 496);
  (*(void (**)(uint64_t))(v14 - 464))(v65);
  sub_23C1FB8D0();
  sub_23C1FBBD0();
  v67 = *(_QWORD *)(v14 - 304);
  v68 = *(_QWORD *)(v14 - 208);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 - 552))(v67, v47, v68);
  v69 = (_QWORD *)swift_allocObject();
  v70 = *(_QWORD *)(v14 - 288);
  v69[2] = *(_QWORD *)(v14 - 272);
  v69[3] = v70;
  v71 = *(_QWORD *)(v14 - 232);
  v72 = *(_QWORD *)(v14 - 280);
  v69[4] = v71;
  v69[5] = v72;
  v73 = (char *)v69 + *(_QWORD *)(v14 - 600);
  v74 = *(_QWORD *)(v14 - 592);
  v69[6] = *(_QWORD *)(v14 - 296);
  v69[7] = v74;
  v75 = v67;
  v76 = v68;
  (*(void (**)(char *, uint64_t, uint64_t))(v14 - 624))(v73, v75, v68);
  v77 = *(_QWORD *)(v14 - 480);
  sub_23C1FBA8C();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 384) + 8))(v66, v71);
  sub_23C1FB8F4();
  sub_23C1EA38C();
  swift_getKeyPath();
  sub_23C1FBC54();
  swift_release();
  swift_release();
  v78 = *(_QWORD *)(v14 - 392);
  v79 = *(_QWORD *)(v14 - 376);
  sub_23C1FBAD4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 336) + 8))(v77, v79);
  swift_getKeyPath();
  v80 = *(_QWORD *)(v14 - 256);
  sub_23C1EA628(v76);
  v82 = *(_QWORD *)(v14 - 248);
  v81 = *(_QWORD *)(v14 - 240);
  v83 = *(_DWORD *)(v14 - 536);
  v84 = *(void (**)(uint64_t, uint64_t, uint64_t))(v14 - 544);
  v84(v82, v83, v81);
  LOBYTE(v64) = sub_23C1FB5E8();
  v54(v82, v81);
  v54(v80, v81);
  if ((v64 & 1) != 0)
    v85 = v83;
  else
    v85 = *(unsigned int *)(v14 - 528);
  v86 = *(_QWORD *)(v14 - 512);
  v87 = v81;
  v84(v86, v85, v81);
  v88 = *(_QWORD *)(v14 - 432);
  sub_23C1FBA44();
  swift_release();
  v54(v86, v87);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 328) + 8))(v78, v88);
  sub_23C1EA62C();
}

uint64_t sub_23C1D9058(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t OpaqueTypeConformance2;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t);
  uint64_t v18;

  *(_QWORD *)(v4 - 120) = a1;
  *(_QWORD *)(v4 - 112) = a2;
  *(_BYTE *)(v4 - 104) = a3;
  *(_BYTE *)(v4 - 176) = 0;
  v5 = swift_checkMetadataState();
  v6 = *(_QWORD *)(v4 - 456);
  v7 = *(_QWORD *)(v4 - 400);
  v8 = *(_QWORD *)(v4 - 408);
  v9 = *(_QWORD *)(v4 - 416);
  sub_23C1FBABC();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 320) + 8))(v3, v7);
  *(_QWORD *)(v4 - 120) = v7;
  *(_QWORD *)(v4 - 112) = v5;
  *(_QWORD *)(v4 - 104) = v8;
  *(_QWORD *)(v4 - 96) = v9;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v11 = *(_QWORD *)(v4 - 424);
  v12 = *(_QWORD *)(v4 - 368);
  sub_23C1CD350(v6, v12, v11);
  v13 = *(_QWORD *)(v4 - 360);
  v14 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
  v14(v6, v12);
  v15 = *(_QWORD *)(v4 - 224);
  v16 = *(_QWORD *)(v4 - 504);
  sub_23C1BF6E4(v15, v16, &qword_256B41E80);
  *(_QWORD *)(v4 - 120) = v16;
  v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16);
  v18 = *(_QWORD *)(v4 - 352);
  v17(v18, v11, v12);
  *(_QWORD *)(v4 - 112) = v18;
  *(_QWORD *)(v4 - 176) = *(_QWORD *)(v4 - 216);
  *(_QWORD *)(v4 - 168) = v12;
  *(_QWORD *)(v4 - 192) = sub_23C1DA494();
  *(_QWORD *)(v4 - 184) = OpaqueTypeConformance2;
  sub_23C1D76F8((uint64_t *)(v4 - 120), 2uLL, v4 - 176);
  v14(v11, v12);
  sub_23C1BC2EC(v15, &qword_256B41E80);
  v14(v18, v12);
  return sub_23C1BC2EC(v16, &qword_256B41E80);
}

uint64_t sub_23C1D920C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>, uint64_t a9, uint64_t a10)
{
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
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unsigned int *v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t);
  uint64_t result;
  uint64_t v55;
  unsigned int *v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t);
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD v66[5];
  uint64_t v67;
  char *v68;
  char *v69;
  char *v70;
  char *v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;

  v98 = a7;
  v93 = a6;
  v99 = a5;
  v73 = a4;
  v100 = a3;
  v74 = a1;
  v91 = a10;
  v90 = a9;
  v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41EF0);
  MEMORY[0x24BDAC7A8](v67);
  v70 = (char *)v66 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41EF8);
  v76 = *(_QWORD *)(v77 - 8);
  v13 = MEMORY[0x24BDAC7A8](v77);
  v69 = (char *)v66 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v68 = (char *)v66 - v15;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41F00);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)v66 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v78 = (char *)v66 - v20;
  v94 = sub_23C1FB96C();
  v92 = *(_QWORD *)(v94 - 8);
  MEMORY[0x24BDAC7A8](v94);
  v89 = (char *)v66 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41760);
  MEMORY[0x24BDAC7A8](v83);
  v23 = (char *)v66 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41F08);
  v87 = *(_QWORD *)(v88 - 8);
  v24 = MEMORY[0x24BDAC7A8](v88);
  v81 = (char *)v66 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v24);
  v97 = (char *)v66 - v26;
  v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41F10);
  v27 = MEMORY[0x24BDAC7A8](v85);
  v29 = (char *)v66 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v27);
  v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41F18);
  v30 = MEMORY[0x24BDAC7A8](v84);
  v66[2] = (char *)v66 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v30);
  v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41F20);
  v32 = MEMORY[0x24BDAC7A8](v86);
  v66[3] = (char *)v66 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v32);
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41F28);
  v35 = MEMORY[0x24BDAC7A8](v34);
  v66[4] = (char *)v66 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v35);
  v38 = (char *)v66 - v37;
  v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41F30);
  v79 = *(_QWORD *)(v80 - 8);
  v39 = MEMORY[0x24BDAC7A8](v80);
  v72 = (char *)v66 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v39);
  v71 = (char *)v66 - v41;
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41F38);
  v43 = MEMORY[0x24BDAC7A8](v42);
  v75 = (uint64_t)v66 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v43);
  v82 = (char *)v66 - v45;
  v46 = (unsigned int *)MEMORY[0x24BDECF38];
  v95 = v19;
  v96 = a8;
  v66[1] = v29;
  if (a2)
  {
    v66[0] = v38;
    v47 = v98;
    v101 = v74;
    v102 = a2;
    sub_23C1CA840();
    swift_bridgeObjectRetain();
    v101 = sub_23C1FB9C0();
    v102 = v48;
    LOBYTE(v103) = v49 & 1;
    v104 = v50;
    v51 = *v46;
    v52 = sub_23C1FB5DC();
    v53 = (uint64_t (*)(uint64_t))MEMORY[0x24BDECF50];
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v52 - 8) + 104))(v23, v51, v52);
    sub_23C1B56F4((unint64_t *)&qword_256B41808, v53, MEMORY[0x24BDECF78]);
    result = sub_23C1FBC9C();
    if ((result & 1) != 0)
    {
      sub_23C1BC328(&qword_256B41788, &qword_256B41760, MEMORY[0x24BEE30C8]);
      sub_23C1FBA68();
      sub_23C1BC2EC((uint64_t)v23, &qword_256B41760);
      sub_23C1DA540(v101, v102, v103);
      swift_bridgeObjectRelease();
      v101 = v93;
      v102 = v47;
      v103 = v90;
      v104 = v91;
      type metadata accessor for MarketingInlineView();
    }
    __break(1u);
  }
  else
  {
    v55 = (uint64_t)v82;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v79 + 56))(v82, 1, 1, v80);
    v56 = (unsigned int *)MEMORY[0x24BDECF38];
    if (!v99)
    {
      v63 = (uint64_t)v78;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v76 + 56))(v78, 1, 1, v77);
      v64 = v75;
      sub_23C1BF6E4(v55, v75, &qword_256B41F38);
      sub_23C1BF6E4(v63, (uint64_t)v19, &qword_256B41F00);
      sub_23C1BF6E4(v64, a8, &qword_256B41F38);
      v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41F40);
      sub_23C1BF6E4((uint64_t)v19, a8 + *(int *)(v65 + 48), &qword_256B41F00);
      sub_23C1BC2EC(v63, &qword_256B41F00);
      sub_23C1BC2EC(v55, &qword_256B41F38);
      sub_23C1BC2EC((uint64_t)v19, &qword_256B41F00);
      return sub_23C1BC2EC(v64, &qword_256B41F38);
    }
    v101 = v73;
    v102 = v99;
    sub_23C1CA840();
    swift_bridgeObjectRetain();
    v101 = sub_23C1FB9C0();
    v102 = v57;
    LOBYTE(v103) = v58 & 1;
    v104 = v59;
    v60 = *v56;
    v61 = sub_23C1FB5DC();
    v62 = (uint64_t (*)(uint64_t))MEMORY[0x24BDECF50];
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v61 - 8) + 104))(v23, v60, v61);
    sub_23C1B56F4((unint64_t *)&qword_256B41808, v62, MEMORY[0x24BDECF78]);
    result = sub_23C1FBC9C();
    if ((result & 1) != 0)
    {
      sub_23C1BC328(&qword_256B41788, &qword_256B41760, MEMORY[0x24BEE30C8]);
      sub_23C1FBA68();
      sub_23C1BC2EC((uint64_t)v23, &qword_256B41760);
      sub_23C1DA540(v101, v102, v103);
      swift_bridgeObjectRelease();
      v101 = v93;
      v102 = v98;
      v103 = v90;
      v104 = v91;
      type metadata accessor for MarketingInlineView();
    }
  }
  __break(1u);
  return result;
}

void sub_23C1DA13C()
{
  type metadata accessor for MarketingInlineView();
}

uint64_t sub_23C1DA16C()
{
  sub_23C1EA38C();
  swift_getKeyPath();
  sub_23C1FBC54();
  swift_release();
  return swift_release();
}

uint64_t sub_23C1DA1D0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23C1FB624();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_23C1DA20C()
{
  sub_23C1DA218((void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23C1D84F8);
}

void sub_23C1DA218(void (*a1)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v1;

  a1(v1[8], v1[9], v1[10], v1[11], v1[12], v1[13], v1[14], v1[2], v1[3], v1[4], v1[5], v1[6], v1[7]);
  JUMPOUT(0x23C1DA250);
}

unint64_t sub_23C1DA264()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_256B41ED0;
  if (!qword_256B41ED0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41EB8);
    v2 = sub_23C1BC328(&qword_256B41ED8, &qword_256B41EE0, MEMORY[0x24BDF5428]);
    result = MEMORY[0x242619B10](MEMORY[0x24BDF3F50], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_256B41ED0);
  }
  return result;
}

void objectdestroyTm_0()
{
  type metadata accessor for MarketingInlineView();
}

uint64_t sub_23C1DA31C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(a1 - 8) + 80);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B41EC8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v3 = sub_23C1FB5F4();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v1 + ((v2 + 64) & ~v2), v3);
  }
  else
  {
    swift_release();
  }
  sub_23C1CC408();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_23C1DA3F4()
{
  type metadata accessor for MarketingInlineView();
}

void sub_23C1DA43C()
{
  sub_23C1DA13C();
}

unint64_t sub_23C1DA494()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_256B41EE8;
  if (!qword_256B41EE8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41E80);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41EB8);
    v2[3] = sub_23C1DA264();
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = sub_23C1BC328(&qword_256B41E90, &qword_256B41E88, MEMORY[0x24BDF1028]);
    result = MEMORY[0x242619B10](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256B41EE8);
  }
  return result;
}

uint64_t sub_23C1DA540(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

BOOL static MarketingOfferTemplateItemCount.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(a1 + 8) & 1) != 0)
    return (*(_BYTE *)(a2 + 8) & 1) != 0;
  if ((*(_BYTE *)(a2 + 8) & 1) != 0)
    return 0;
  return *(_QWORD *)a1 == *(_QWORD *)a2;
}

uint64_t sub_23C1DA5A0()
{
  _BYTE *v0;

  if (*v0)
    return 0x6574696D696C6E75;
  else
    return 0x6465786966;
}

uint64_t sub_23C1DA5DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C1DB3D8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C1DA600()
{
  sub_23C1DA90C();
  return sub_23C1FC020();
}

uint64_t sub_23C1DA628()
{
  sub_23C1DA90C();
  return sub_23C1FC02C();
}

uint64_t sub_23C1DA650()
{
  sub_23C1DA994();
  return sub_23C1FC020();
}

uint64_t sub_23C1DA678()
{
  sub_23C1DA994();
  return sub_23C1FC02C();
}

uint64_t sub_23C1DA6A0()
{
  sub_23C1DA950();
  return sub_23C1FC020();
}

uint64_t sub_23C1DA6C8()
{
  sub_23C1DA950();
  return sub_23C1FC02C();
}

uint64_t MarketingOfferTemplateItemCount.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41F48);
  v17 = *(_QWORD *)(v4 - 8);
  v18 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41F50);
  v16 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41F58);
  v19 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *v2;
  v13 = *((_BYTE *)v2 + 8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C1DA90C();
  sub_23C1FC014();
  if ((v13 & 1) != 0)
  {
    v21 = 1;
    sub_23C1DA950();
    sub_23C1FBF30();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v6, v18);
  }
  else
  {
    v20 = 0;
    sub_23C1DA994();
    sub_23C1FBF30();
    sub_23C1FBF6C();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v9, v7);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v12, v10);
}

unint64_t sub_23C1DA90C()
{
  unint64_t result;

  result = qword_256B41F60;
  if (!qword_256B41F60)
  {
    result = MEMORY[0x242619B10](&unk_23C200AB4, &type metadata for MarketingOfferTemplateItemCount.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41F60);
  }
  return result;
}

unint64_t sub_23C1DA950()
{
  unint64_t result;

  result = qword_256B41F68;
  if (!qword_256B41F68)
  {
    result = MEMORY[0x242619B10](&unk_23C200A64, &type metadata for MarketingOfferTemplateItemCount.UnlimitedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41F68);
  }
  return result;
}

unint64_t sub_23C1DA994()
{
  unint64_t result;

  result = qword_256B41F70;
  if (!qword_256B41F70)
  {
    result = MEMORY[0x242619B10](&unk_23C200A14, &type metadata for MarketingOfferTemplateItemCount.FixedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41F70);
  }
  return result;
}

uint64_t MarketingOfferTemplateItemCount.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
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
  char *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  char *v29;
  _QWORD *v30;
  char v31;
  char v32;

  v28 = a2;
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41F78);
  v25 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v29 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41F80);
  v4 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41F88);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C1DA90C();
  v11 = v30;
  sub_23C1FC008();
  if (v11)
    goto LABEL_7;
  v12 = v29;
  v23 = v4;
  v24 = v8;
  v30 = a1;
  v13 = sub_23C1FBF24();
  if (*(_QWORD *)(v13 + 16) != 1)
  {
    v16 = sub_23C1FBE58();
    swift_allocError();
    v18 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B40A48);
    *v18 = &type metadata for MarketingOfferTemplateItemCount;
    sub_23C1FBED0();
    sub_23C1FBE4C();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v16 - 8) + 104))(v18, *MEMORY[0x24BEE26D0], v16);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v10, v7);
    a1 = v30;
LABEL_7:
    v19 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v19);
  }
  v14 = *(_BYTE *)(v13 + 32);
  if ((v14 & 1) != 0)
  {
    v32 = 1;
    sub_23C1DA950();
    sub_23C1FBEC4();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v12, v27);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v10, v7);
    v15 = 0;
  }
  else
  {
    v31 = 0;
    sub_23C1DA994();
    sub_23C1FBEC4();
    v21 = v26;
    v15 = sub_23C1FBF0C();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v6, v21);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v10, v7);
  }
  v22 = v28;
  *v28 = v15;
  *((_BYTE *)v22 + 8) = v14;
  v19 = (uint64_t)v30;
  return __swift_destroy_boxed_opaque_existential_1(v19);
}

uint64_t sub_23C1DAD48@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return MarketingOfferTemplateItemCount.init(from:)(a1, a2);
}

uint64_t sub_23C1DAD5C(_QWORD *a1)
{
  return MarketingOfferTemplateItemCount.encode(to:)(a1);
}

uint64_t MarketingOfferTemplateItemCount.hash(into:)()
{
  uint64_t v0;

  if ((*(_BYTE *)(v0 + 8) & 1) == 0)
    sub_23C1FBFD8();
  return sub_23C1FBFD8();
}

uint64_t MarketingOfferTemplateItemCount.hashValue.getter()
{
  uint64_t v0;
  char v1;

  v1 = *(_BYTE *)(v0 + 8);
  sub_23C1FBFCC();
  if ((v1 & 1) == 0)
    sub_23C1FBFD8();
  sub_23C1FBFD8();
  return sub_23C1FBFFC();
}

uint64_t sub_23C1DAE14()
{
  uint64_t v0;
  char v1;

  v1 = *(_BYTE *)(v0 + 8);
  sub_23C1FBFCC();
  if ((v1 & 1) == 0)
    sub_23C1FBFD8();
  sub_23C1FBFD8();
  return sub_23C1FBFFC();
}

uint64_t sub_23C1DAE74()
{
  uint64_t v0;

  if ((*(_BYTE *)(v0 + 8) & 1) == 0)
    sub_23C1FBFD8();
  return sub_23C1FBFD8();
}

uint64_t sub_23C1DAEB8()
{
  uint64_t v0;
  char v1;

  v1 = *(_BYTE *)(v0 + 8);
  sub_23C1FBFCC();
  if ((v1 & 1) == 0)
    sub_23C1FBFD8();
  sub_23C1FBFD8();
  return sub_23C1FBFFC();
}

unint64_t sub_23C1DAF18()
{
  unint64_t result;

  result = qword_256B41F90;
  if (!qword_256B41F90)
  {
    result = MEMORY[0x242619B10](&protocol conformance descriptor for MarketingOfferTemplateItemCount, &type metadata for MarketingOfferTemplateItemCount);
    atomic_store(result, (unint64_t *)&qword_256B41F90);
  }
  return result;
}

uint64_t sub_23C1DAF5C(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t result;

  v3 = *(_BYTE *)(a1 + 8);
  result = *(unsigned __int8 *)(a2 + 8);
  if ((v3 & 1) == 0)
    return (*(_QWORD *)a1 == *(_QWORD *)a2) & ~(_DWORD)result;
  return result;
}

uint64_t getEnumTagSinglePayload for MarketingOfferTemplateItemCount(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for MarketingOfferTemplateItemCount(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = 0;
    *(_BYTE *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 1;
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
  *(_BYTE *)(result + 9) = v3;
  return result;
}

uint64_t sub_23C1DAFD4(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_23C1DAFF0(uint64_t result, int a2)
{
  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    *(_BYTE *)(result + 8) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for MarketingOfferTemplateItemCount()
{
  return &type metadata for MarketingOfferTemplateItemCount;
}

uint64_t storeEnumTagSinglePayload for MarketingOfferTemplateItemCount.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C1DB06C + 4 * byte_23C200725[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C1DB0A0 + 4 * byte_23C200720[v4]))();
}

uint64_t sub_23C1DB0A0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1DB0A8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C1DB0B0);
  return result;
}

uint64_t sub_23C1DB0BC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C1DB0C4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C1DB0C8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1DB0D0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MarketingOfferTemplateItemCount.CodingKeys()
{
  return &type metadata for MarketingOfferTemplateItemCount.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for MarketingOfferTemplateItemCount.FixedCodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23C1DB12C + 4 * byte_23C20072A[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23C1DB14C + 4 * byte_23C20072F[v4]))();
}

_BYTE *sub_23C1DB12C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23C1DB14C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C1DB154(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C1DB15C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C1DB164(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C1DB16C(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for MarketingOfferTemplateItemCount.FixedCodingKeys()
{
  return &type metadata for MarketingOfferTemplateItemCount.FixedCodingKeys;
}

ValueMetadata *type metadata accessor for MarketingOfferTemplateItemCount.UnlimitedCodingKeys()
{
  return &type metadata for MarketingOfferTemplateItemCount.UnlimitedCodingKeys;
}

unint64_t sub_23C1DB19C()
{
  unint64_t result;

  result = qword_256B41F98;
  if (!qword_256B41F98)
  {
    result = MEMORY[0x242619B10](&unk_23C200934, &type metadata for MarketingOfferTemplateItemCount.FixedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41F98);
  }
  return result;
}

unint64_t sub_23C1DB1E4()
{
  unint64_t result;

  result = qword_256B41FA0;
  if (!qword_256B41FA0)
  {
    result = MEMORY[0x242619B10](&unk_23C2009EC, &type metadata for MarketingOfferTemplateItemCount.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41FA0);
  }
  return result;
}

unint64_t sub_23C1DB22C()
{
  unint64_t result;

  result = qword_256B41FA8;
  if (!qword_256B41FA8)
  {
    result = MEMORY[0x242619B10](&unk_23C2008A4, &type metadata for MarketingOfferTemplateItemCount.FixedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41FA8);
  }
  return result;
}

unint64_t sub_23C1DB274()
{
  unint64_t result;

  result = qword_256B41FB0;
  if (!qword_256B41FB0)
  {
    result = MEMORY[0x242619B10](&unk_23C2008CC, &type metadata for MarketingOfferTemplateItemCount.FixedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41FB0);
  }
  return result;
}

unint64_t sub_23C1DB2BC()
{
  unint64_t result;

  result = qword_256B41FB8;
  if (!qword_256B41FB8)
  {
    result = MEMORY[0x242619B10](&unk_23C200854, &type metadata for MarketingOfferTemplateItemCount.UnlimitedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41FB8);
  }
  return result;
}

unint64_t sub_23C1DB304()
{
  unint64_t result;

  result = qword_256B41FC0;
  if (!qword_256B41FC0)
  {
    result = MEMORY[0x242619B10](&unk_23C20087C, &type metadata for MarketingOfferTemplateItemCount.UnlimitedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41FC0);
  }
  return result;
}

unint64_t sub_23C1DB34C()
{
  unint64_t result;

  result = qword_256B41FC8;
  if (!qword_256B41FC8)
  {
    result = MEMORY[0x242619B10](&unk_23C20095C, &type metadata for MarketingOfferTemplateItemCount.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41FC8);
  }
  return result;
}

unint64_t sub_23C1DB394()
{
  unint64_t result;

  result = qword_256B41FD0;
  if (!qword_256B41FD0)
  {
    result = MEMORY[0x242619B10](&unk_23C200984, &type metadata for MarketingOfferTemplateItemCount.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41FD0);
  }
  return result;
}

uint64_t sub_23C1DB3D8(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6465786966 && a2 == 0xE500000000000000;
  if (v2 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6574696D696C6E75 && a2 == 0xE900000000000064)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23C1FBF90();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t static MarketingOfferTemplateParserType.== infix(_:_:)()
{
  return 1;
}

uint64_t sub_23C1DB4D4()
{
  return 0x746C7561666564;
}

uint64_t sub_23C1DB4EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x746C7561666564 && a2 == 0xE700000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_23C1FBF90();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_23C1DB580()
{
  sub_23C1DB75C();
  return sub_23C1FC020();
}

uint64_t sub_23C1DB5A8()
{
  sub_23C1DB75C();
  return sub_23C1FC02C();
}

uint64_t sub_23C1DB5D0()
{
  sub_23C1DB7A0();
  return sub_23C1FC020();
}

uint64_t sub_23C1DB5F8()
{
  sub_23C1DB7A0();
  return sub_23C1FC02C();
}

uint64_t MarketingOfferTemplateParserType.encode(to:)(_QWORD *a1)
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

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41FD8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41FE0);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C1DB75C();
  sub_23C1FC014();
  sub_23C1DB7A0();
  sub_23C1FBF30();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

unint64_t sub_23C1DB75C()
{
  unint64_t result;

  result = qword_256B41FE8;
  if (!qword_256B41FE8)
  {
    result = MEMORY[0x242619B10](&unk_23C200D8C, &type metadata for MarketingOfferTemplateParserType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41FE8);
  }
  return result;
}

unint64_t sub_23C1DB7A0()
{
  unint64_t result;

  result = qword_256B41FF0;
  if (!qword_256B41FF0)
  {
    result = MEMORY[0x242619B10](&unk_23C200D3C, &type metadata for MarketingOfferTemplateParserType.DefaultCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B41FF0);
  }
  return result;
}

uint64_t MarketingOfferTemplateParserType.init(from:)(_QWORD *a1)
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

  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41FF8);
  v2 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42000);
  v5 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C1DB75C();
  v8 = v23;
  sub_23C1FC008();
  if (v8)
    goto LABEL_7;
  v20 = a1;
  v23 = v5;
  v10 = v21;
  v9 = v22;
  if (*(_QWORD *)(sub_23C1FBF24() + 16) != 1)
  {
    v14 = sub_23C1FBE58();
    swift_allocError();
    v16 = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B40A48);
    *v16 = &type metadata for MarketingOfferTemplateParserType;
    sub_23C1FBED0();
    sub_23C1FBE4C();
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
  sub_23C1DB7A0();
  v11 = v4;
  sub_23C1FBEC4();
  v12 = v23;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v11, v10);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v9);
  v13 = (uint64_t)v20;
  return __swift_destroy_boxed_opaque_existential_1(v13);
}

uint64_t sub_23C1DBA40(_QWORD *a1)
{
  return MarketingOfferTemplateParserType.init(from:)(a1);
}

uint64_t sub_23C1DBA54(_QWORD *a1)
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

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41FD8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41FE0);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C1DB75C();
  sub_23C1FC014();
  sub_23C1DB7A0();
  sub_23C1FBF30();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t MarketingOfferTemplateParserType.hash(into:)()
{
  return sub_23C1FBFD8();
}

uint64_t MarketingOfferTemplateParserType.hashValue.getter()
{
  sub_23C1FBFCC();
  sub_23C1FBFD8();
  return sub_23C1FBFFC();
}

unint64_t sub_23C1DBBF8()
{
  unint64_t result;

  result = qword_256B42008;
  if (!qword_256B42008)
  {
    result = MEMORY[0x242619B10](&protocol conformance descriptor for MarketingOfferTemplateParserType, &type metadata for MarketingOfferTemplateParserType);
    atomic_store(result, (unint64_t *)&qword_256B42008);
  }
  return result;
}

ValueMetadata *type metadata accessor for MarketingOfferTemplateParserType()
{
  return &type metadata for MarketingOfferTemplateParserType;
}

uint64_t _s16FitnessMarketing32MarketingOfferTemplateParserTypeOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23C1DBC90 + 4 * byte_23C200B10[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23C1DBCB0 + 4 * byte_23C200B15[v4]))();
}

_BYTE *sub_23C1DBC90(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23C1DBCB0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C1DBCB8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C1DBCC0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C1DBCC8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C1DBCD0(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for MarketingOfferTemplateParserType.CodingKeys()
{
  return &type metadata for MarketingOfferTemplateParserType.CodingKeys;
}

ValueMetadata *type metadata accessor for MarketingOfferTemplateParserType.DefaultCodingKeys()
{
  return &type metadata for MarketingOfferTemplateParserType.DefaultCodingKeys;
}

unint64_t sub_23C1DBD00()
{
  unint64_t result;

  result = qword_256B42010;
  if (!qword_256B42010)
  {
    result = MEMORY[0x242619B10](&unk_23C200D14, &type metadata for MarketingOfferTemplateParserType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B42010);
  }
  return result;
}

unint64_t sub_23C1DBD48()
{
  unint64_t result;

  result = qword_256B42018;
  if (!qword_256B42018)
  {
    result = MEMORY[0x242619B10](&unk_23C200C34, &type metadata for MarketingOfferTemplateParserType.DefaultCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B42018);
  }
  return result;
}

unint64_t sub_23C1DBD90()
{
  unint64_t result;

  result = qword_256B42020;
  if (!qword_256B42020)
  {
    result = MEMORY[0x242619B10](&unk_23C200C5C, &type metadata for MarketingOfferTemplateParserType.DefaultCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B42020);
  }
  return result;
}

unint64_t sub_23C1DBDD8()
{
  unint64_t result;

  result = qword_256B42028;
  if (!qword_256B42028)
  {
    result = MEMORY[0x242619B10](&unk_23C200C84, &type metadata for MarketingOfferTemplateParserType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B42028);
  }
  return result;
}

unint64_t sub_23C1DBE20()
{
  unint64_t result;

  result = qword_256B42030;
  if (!qword_256B42030)
  {
    result = MEMORY[0x242619B10](&unk_23C200CAC, &type metadata for MarketingOfferTemplateParserType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B42030);
  }
  return result;
}

uint64_t MarketingPlacement.placement.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t MarketingPlacement.offerHint.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

FitnessMarketing::MarketingPlacement __swiftcall MarketingPlacement.init(placement:offerHint:)(FitnessMarketing::MarketingOfferPlacement placement, Swift::String_optional offerHint)
{
  uint64_t v2;
  FitnessMarketing::MarketingPlacement result;

  *(_BYTE *)v2 = placement;
  *(Swift::String_optional *)(v2 + 8) = offerHint;
  result.offerHint = offerHint;
  result.placement = placement;
  return result;
}

uint64_t sub_23C1DBEA4()
{
  _BYTE *v0;

  if (*v0)
    return 0x6E6948726566666FLL;
  else
    return 0x6E656D6563616C70;
}

uint64_t sub_23C1DBEDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C1DCA6C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C1DBF00()
{
  sub_23C1DC08C();
  return sub_23C1FC020();
}

uint64_t sub_23C1DBF28()
{
  sub_23C1DC08C();
  return sub_23C1FC02C();
}

uint64_t MarketingPlacement.encode(to:)(_QWORD *a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char v8;
  uint64_t v9;
  _QWORD v11[2];
  char v12;
  char v13;
  char v14;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42038);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v9 = *((_QWORD *)v1 + 1);
  v11[0] = *((_QWORD *)v1 + 2);
  v11[1] = v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C1DC08C();
  sub_23C1FC014();
  v14 = v8;
  v13 = 0;
  sub_23C1DC0D0();
  sub_23C1FBF78();
  if (!v2)
  {
    v12 = 1;
    sub_23C1FBF3C();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_23C1DC08C()
{
  unint64_t result;

  result = qword_256B42040;
  if (!qword_256B42040)
  {
    result = MEMORY[0x242619B10](&unk_23C200F88, &type metadata for MarketingPlacement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B42040);
  }
  return result;
}

unint64_t sub_23C1DC0D0()
{
  unint64_t result;

  result = qword_256B42048;
  if (!qword_256B42048)
  {
    result = MEMORY[0x242619B10](&protocol conformance descriptor for MarketingOfferPlacement, &type metadata for MarketingOfferPlacement);
    atomic_store(result, (unint64_t *)&qword_256B42048);
  }
  return result;
}

uint64_t MarketingPlacement.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  char v17;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42050);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C1DC08C();
  sub_23C1FC008();
  if (!v2)
  {
    v16 = 0;
    sub_23C1DC27C();
    sub_23C1FBF18();
    v9 = v17;
    v15 = 1;
    v11 = sub_23C1FBEDC();
    v13 = v12;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *(_BYTE *)a2 = v9;
    *(_QWORD *)(a2 + 8) = v11;
    *(_QWORD *)(a2 + 16) = v13;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_23C1DC27C()
{
  unint64_t result;

  result = qword_256B42058;
  if (!qword_256B42058)
  {
    result = MEMORY[0x242619B10](&protocol conformance descriptor for MarketingOfferPlacement, &type metadata for MarketingOfferPlacement);
    atomic_store(result, (unint64_t *)&qword_256B42058);
  }
  return result;
}

uint64_t sub_23C1DC2C0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return MarketingPlacement.init(from:)(a1, a2);
}

uint64_t sub_23C1DC2D4(_QWORD *a1)
{
  return MarketingPlacement.encode(to:)(a1);
}

uint64_t MarketingPlacement.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  MarketingOfferPlacement.rawValue.getter(*(_BYTE *)v0);
  sub_23C1FBCF0();
  swift_bridgeObjectRelease();
  if (!v1)
    return sub_23C1FBFE4();
  sub_23C1FBFE4();
  swift_bridgeObjectRetain();
  sub_23C1FBCF0();
  return swift_bridgeObjectRelease();
}

uint64_t MarketingPlacement.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  unsigned __int8 v2;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_BYTE *)v0;
  sub_23C1FBFCC();
  MarketingOfferPlacement.rawValue.getter(v2);
  sub_23C1FBCF0();
  swift_bridgeObjectRelease();
  sub_23C1FBFE4();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_23C1FBCF0();
    swift_bridgeObjectRelease();
  }
  return sub_23C1FBFFC();
}

uint64_t sub_23C1DC42C()
{
  uint64_t v0;
  uint64_t v1;
  unsigned __int8 v2;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_BYTE *)v0;
  sub_23C1FBFCC();
  MarketingOfferPlacement.rawValue.getter(v2);
  sub_23C1FBCF0();
  swift_bridgeObjectRelease();
  sub_23C1FBFE4();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_23C1FBCF0();
    swift_bridgeObjectRelease();
  }
  return sub_23C1FBFFC();
}

uint64_t sub_23C1DC4D4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  MarketingOfferPlacement.rawValue.getter(*(_BYTE *)v0);
  sub_23C1FBCF0();
  swift_bridgeObjectRelease();
  if (!v1)
    return sub_23C1FBFE4();
  sub_23C1FBFE4();
  swift_bridgeObjectRetain();
  sub_23C1FBCF0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C1DC56C()
{
  uint64_t v0;
  uint64_t v1;
  unsigned __int8 v2;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_BYTE *)v0;
  sub_23C1FBFCC();
  MarketingOfferPlacement.rawValue.getter(v2);
  sub_23C1FBCF0();
  swift_bridgeObjectRelease();
  sub_23C1FBFE4();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_23C1FBCF0();
    swift_bridgeObjectRelease();
  }
  return sub_23C1FBFFC();
}

BOOL _s16FitnessMarketing0B9PlacementV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v12;
  _BOOL8 result;

  v3 = *(_QWORD *)(a1 + 8);
  v2 = *(_QWORD *)(a1 + 16);
  v5 = *(_QWORD *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 16);
  v6 = *(_BYTE *)a2;
  v7 = MarketingOfferPlacement.rawValue.getter(*(_BYTE *)a1);
  v9 = v8;
  if (v7 == MarketingOfferPlacement.rawValue.getter(v6) && v9 == v10)
  {
    swift_bridgeObjectRelease_n();
    if (v2)
      return v4 && (v3 == v5 && v2 == v4 || (sub_23C1FBF90() & 1) != 0);
  }
  else
  {
    v12 = sub_23C1FBF90();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = 0;
    if ((v12 & 1) == 0)
      return result;
    if (v2)
      return v4 && (v3 == v5 && v2 == v4 || (sub_23C1FBF90() & 1) != 0);
  }
  return !v4;
}

unint64_t sub_23C1DC704()
{
  unint64_t result;

  result = qword_256B42060;
  if (!qword_256B42060)
  {
    result = MEMORY[0x242619B10](&protocol conformance descriptor for MarketingPlacement, &type metadata for MarketingPlacement);
    atomic_store(result, (unint64_t *)&qword_256B42060);
  }
  return result;
}

uint64_t destroy for MarketingPlacement()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s16FitnessMarketing18MarketingPlacementVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for MarketingPlacement(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for MarketingPlacement(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MarketingPlacement(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for MarketingPlacement(uint64_t result, unsigned int a2, unsigned int a3)
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

ValueMetadata *type metadata accessor for MarketingPlacement()
{
  return &type metadata for MarketingPlacement;
}

uint64_t storeEnumTagSinglePayload for MarketingPlacement.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C1DC914 + 4 * byte_23C200DE5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C1DC948 + 4 * byte_23C200DE0[v4]))();
}

uint64_t sub_23C1DC948(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1DC950(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C1DC958);
  return result;
}

uint64_t sub_23C1DC964(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C1DC96CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C1DC970(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1DC978(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MarketingPlacement.CodingKeys()
{
  return &type metadata for MarketingPlacement.CodingKeys;
}

unint64_t sub_23C1DC998()
{
  unint64_t result;

  result = qword_256B42068;
  if (!qword_256B42068)
  {
    result = MEMORY[0x242619B10](&unk_23C200F60, &type metadata for MarketingPlacement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B42068);
  }
  return result;
}

unint64_t sub_23C1DC9E0()
{
  unint64_t result;

  result = qword_256B42070;
  if (!qword_256B42070)
  {
    result = MEMORY[0x242619B10](&unk_23C200ED0, &type metadata for MarketingPlacement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B42070);
  }
  return result;
}

unint64_t sub_23C1DCA28()
{
  unint64_t result;

  result = qword_256B42078;
  if (!qword_256B42078)
  {
    result = MEMORY[0x242619B10](&unk_23C200EF8, &type metadata for MarketingPlacement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B42078);
  }
  return result;
}

uint64_t sub_23C1DCA6C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6E656D6563616C70 && a2 == 0xE900000000000074;
  if (v2 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E6948726566666FLL && a2 == 0xE900000000000074)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23C1FBF90();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23C1DCB74()
{
  uint64_t v0;

  sub_23C1C5364(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for MarketingOfferTemplateDefaultParser()
{
  return objc_opt_self();
}

uint64_t sub_23C1DCBBC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t *v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;

  v60 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40B60);
  v58 = *(_QWORD *)(v3 - 8);
  v59 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (int *)type metadata accessor for MarketingOffer();
  v7 = *((_QWORD *)v6 - 1);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40B58);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v52 - v14;
  v16 = objc_msgSend(a1, sel_rawValues);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B41120);
  v17 = sub_23C1FBC84();

  if (!*(_QWORD *)(v17 + 16) || (v18 = sub_23C1C4B24(0x7475626972747461, 0xEA00000000007365), (v19 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  v20 = *(_QWORD *)(*(_QWORD *)(v17 + 56) + 8 * v18);
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  v62 = v20;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B41138);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_9:
    v29 = 1;
    v30 = v60;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *))(v7 + 56))(v30, v29, 1, v6);
  }
  v21 = v61;
  v22 = objc_msgSend(a1, sel_itemActions);
  if (!v22)
    goto LABEL_11;
  v23 = v22;
  sub_23C1C5C88(0, &qword_256B41130);
  v24 = sub_23C1FBD2C();

  if (v24 >> 62)
  {
    v56 = v21;
    swift_bridgeObjectRetain();
    v51 = sub_23C1FBE88();
    swift_bridgeObjectRelease();
    if (v51)
    {
      swift_bridgeObjectRetain();
      v25 = sub_23C1FBE88();
      swift_bridgeObjectRelease();
      v21 = v56;
      goto LABEL_7;
    }
    v21 = v56;
LABEL_11:
    swift_bridgeObjectRelease();
    v57 = MEMORY[0x24BEE4AF8];
    goto LABEL_12;
  }
  v25 = *(_QWORD *)((v24 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v25)
    goto LABEL_11;
LABEL_7:
  v56 = v21;
  v26 = sub_23C1DD644(v25);
  v55 = &v52;
  *(&v52 - 2) = MEMORY[0x24BDAC7A8](v26);
  v27 = swift_bridgeObjectRetain();
  v28 = sub_23C1DDC48(v27, (void (*)(uint64_t, id *))sub_23C1DDEF8);
  v21 = v56;
  v57 = v28;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
LABEL_12:
  sub_23C1DD1BC(v21, 0x666C656853706F74, 0xE800000000000000, a1, (uint64_t)v15);
  swift_bridgeObjectRelease();
  v32 = objc_msgSend(a1, sel_itemID);
  if (v32)
  {
    v33 = v32;
    v34 = sub_23C1FBCCC();
    v55 = v35;
    v56 = v34;

  }
  else
  {
    v55 = 0;
    v56 = 0;
  }
  v36 = objc_msgSend(a1, sel_title);
  if (v36)
  {
    v37 = v36;
    v38 = sub_23C1FBCCC();
    v53 = v39;
    v54 = v38;

  }
  else
  {
    v53 = 0;
    v54 = 0;
  }
  v40 = objc_msgSend(a1, sel_subtitle);
  if (v40)
  {
    v41 = v40;
    v42 = sub_23C1FBCCC();
    v44 = v43;

  }
  else
  {
    v42 = 0;
    v44 = 0;
  }
  sub_23C1B92A4((uint64_t)v15, (uint64_t)v13);
  v45 = (uint64_t *)&v9[v6[6]];
  v46 = v55;
  *v45 = v56;
  v45[1] = (uint64_t)v46;
  v47 = (uint64_t *)&v9[v6[8]];
  v48 = v53;
  *v47 = v54;
  v47[1] = v48;
  v49 = (uint64_t *)&v9[v6[7]];
  *v49 = v42;
  v49[1] = v44;
  *(_QWORD *)v9 = v57;
  sub_23C1B92A4((uint64_t)v13, (uint64_t)&v9[v6[5]]);
  sub_23C1C5C88(0, (unint64_t *)&qword_256B40B68);
  v50 = a1;
  sub_23C1FB51C();
  sub_23C1BC2EC((uint64_t)v13, &qword_256B40B58);
  (*(void (**)(char *, char *, uint64_t))(v58 + 32))(&v9[v6[9]], v5, v59);
  v30 = v60;
  sub_23C1CD008((uint64_t)v9, v60, (uint64_t (*)(_QWORD))type metadata accessor for MarketingOffer);
  sub_23C1BC2EC((uint64_t)v15, &qword_256B40B58);
  v29 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *))(v7 + 56))(v30, v29, 1, v6);
}

unint64_t sub_23C1DD0B4(unint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;

  if (!a1)
    return MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_23C1FBE88();
    swift_bridgeObjectRelease();
    if (v5)
    {
      swift_bridgeObjectRetain();
      v1 = sub_23C1FBE88();
      swift_bridgeObjectRelease();
      goto LABEL_4;
    }
    return MEMORY[0x24BEE4AF8];
  }
  v1 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v1)
    return MEMORY[0x24BEE4AF8];
LABEL_4:
  v2 = sub_23C1DD644(v1);
  MEMORY[0x24BDAC7A8](v2);
  v3 = swift_bridgeObjectRetain();
  v4 = sub_23C1DDC48(v3, (void (*)(uint64_t, id *))sub_23C1DD96C);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_23C1DD1BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t *v25;
  char *v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  _QWORD *v32;
  NSObject *v33;
  uint64_t v34;
  void (*v36)(char *, char *, uint64_t);
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;

  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41DA0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_23C1FB468();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
    goto LABEL_22;
  v17 = sub_23C1C4B24(0xD000000000000010, 0x800000023C204200);
  if ((v18 & 1) == 0)
    goto LABEL_22;
  sub_23C1C4C7C(*(_QWORD *)(a1 + 56) + 32 * v17, (uint64_t)&v41);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B41138);
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_22;
  v19 = v40;
  if (*(_QWORD *)(v40 + 16))
  {
    swift_bridgeObjectRetain();
    v20 = sub_23C1C4B24(a2, a3);
    if ((v21 & 1) != 0)
    {
      sub_23C1C4C7C(*(_QWORD *)(v19 + 56) + 32 * v20, (uint64_t)&v41);
    }
    else
    {
      v41 = 0u;
      v42 = 0u;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    v41 = 0u;
    v42 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v42 + 1))
    goto LABEL_20;
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_22;
  v22 = v40;
  if (*(_QWORD *)(v40 + 16) && (v23 = sub_23C1C4B24(7107189, 0xE300000000000000), (v24 & 1) != 0))
  {
    sub_23C1C4C7C(*(_QWORD *)(v22 + 56) + 32 * v23, (uint64_t)&v41);
  }
  else
  {
    v41 = 0u;
    v42 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v42 + 1))
  {
LABEL_20:
    v25 = &qword_256B41140;
    v26 = (char *)&v41;
LABEL_21:
    sub_23C1BC2EC((uint64_t)v26, v25);
    goto LABEL_22;
  }
  if ((swift_dynamicCast() & 1) != 0)
  {
    sub_23C1FB45C();
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) != 1)
    {
      v36 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
      v36(v16, v12, v13);
      sub_23C1FB4BC();
      v37 = sub_23C1FB4C8();
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v37 - 8) + 56))(a5, 0, 1, v37);
      v38 = type metadata accessor for MarketingArtwork();
      v39 = (char *)(a5 + *(int *)(v38 + 20));
      v36(v39, v16, v13);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v39, 0, 1, v13);
      return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 56))(a5, 0, 1, v38);
    }
    v25 = &qword_256B41DA0;
    v26 = v12;
    goto LABEL_21;
  }
LABEL_22:
  if (qword_256B408D0 != -1)
    swift_once();
  v27 = sub_23C1FB54C();
  __swift_project_value_buffer(v27, (uint64_t)qword_256B4F8B0);
  v28 = a4;
  v29 = sub_23C1FB534();
  v30 = sub_23C1FBDBC();
  if (os_log_type_enabled(v29, v30))
  {
    v31 = (uint8_t *)swift_slowAlloc();
    v32 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v31 = 138412290;
    *(_QWORD *)&v41 = v28;
    v33 = v28;
    sub_23C1FBDEC();
    *v32 = v28;

    _os_log_impl(&dword_23C1B2000, v29, v30, "Failed to fetch marketing artwork for offer: %@", v31, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B42138);
    swift_arrayDestroy();
    MEMORY[0x242619BC4](v32, -1, -1);
    MEMORY[0x242619BC4](v31, -1, -1);
  }
  else
  {

    v29 = v28;
  }

  v34 = type metadata accessor for MarketingArtwork();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56))(a5, 1, 1, v34);
}

uint64_t sub_23C1DD644(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  size_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t inited;
  uint64_t v14;
  _QWORD *v15;

  if ((*(_BYTE *)(v1 + 24) & 1) != 0)
  {
    v3 = *(_QWORD *)(swift_bridgeObjectRetain() + 16);
    if (v3)
      goto LABEL_3;
LABEL_21:
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
  if (*(_QWORD *)(v1 + 16) == 3)
    v15 = &unk_250D0DD58;
  else
    v15 = &unk_250D0DD90;
  v3 = v15[2];
  if (!v3)
    goto LABEL_21;
LABEL_3:
  v4 = (_BYTE *)(swift_bridgeObjectRetain() + 48);
  v5 = MEMORY[0x24BEE4AF8];
  do
  {
    v6 = *(_QWORD *)(v5 + 16);
    v7 = __OFSUB__(a1, v6);
    v8 = a1 - v6;
    if (!((v8 < 0) ^ v7 | (v8 == 0)))
    {
      if ((*v4 & 1) != 0)
        v9 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v9 = *((_QWORD *)v4 - 1);
      if (v8 >= v9)
        v10 = v9;
      else
        v10 = v8;
      if ((char)*v4 >= 0)
        v11 = *(v4 - 16);
      else
        v11 = *(v4 - 16) | 0xFFFFFF80;
      v12 = sub_23C1DD85C(v11, v10);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256B42120);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_23C200FE0;
      *(_QWORD *)(inited + 32) = v5;
      *(_QWORD *)(inited + 40) = v12;
      swift_bridgeObjectRetain();
      v14 = sub_23C1DDA60(inited);
      swift_setDeallocating();
      __swift_instantiateConcreteTypeFromMangledName(&qword_256B42128);
      swift_arrayDestroy();
      swift_bridgeObjectRelease();
      v5 = v14;
    }
    v4 += 24;
    --v3;
  }
  while (v3);
  swift_bridgeObjectRelease_n();
  return v5;
}

uint64_t sub_23C1DD7D8@<X0>(uint64_t result@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5;
  char v6;

  if (*(_QWORD *)(a3 + 16) <= result)
  {
    v5 = type metadata accessor for MarketingActionItem();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(a4, 1, 1, v5);
  }
  else if (result < 0)
  {
    __break(1u);
  }
  else
  {
    v6 = *(_BYTE *)(a3 + result + 32);
    return MarketingActionItem.init(_:style:)(a2, &v6, a4);
  }
  return result;
}

uint64_t sub_23C1DD85C(int a1, size_t a2)
{
  uint64_t v4;
  uint64_t result;

  if ((a2 & 0x8000000000000000) != 0)
  {
    result = sub_23C1FBE70();
    __break(1u);
  }
  else
  {
    if (!a2)
      return MEMORY[0x24BEE4AF8];
    v4 = sub_23C1FBD44();
    *(_QWORD *)(v4 + 16) = a2;
    memset((void *)(v4 + 32), a1, a2);
    return v4;
  }
  return result;
}

uint64_t sub_23C1DD914@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  v2 = *(_QWORD *)(v1 + 16);
  v3 = *(_BYTE *)(v1 + 24);
  *(_QWORD *)a1 = v2;
  *(_BYTE *)(a1 + 8) = v3;
  return sub_23C1C5348(v2, v3);
}

uint64_t sub_23C1DD928(uint64_t a1)
{
  uint64_t result;
  char v3;

  result = swift_allocObject();
  v3 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)(result + 16) = *(_QWORD *)a1;
  *(_BYTE *)(result + 24) = v3;
  return result;
}

uint64_t sub_23C1DD96C@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  return sub_23C1DD7D8(a1, a2, *(_QWORD *)(v3 + 16), a3);
}

void (*sub_23C1DD974(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_23C1DD9F4(v6, a2, a3);
  return sub_23C1DD9C8;
}

void sub_23C1DD9C8(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_23C1DD9F4(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x242619510](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return destroy for MarketingPurchaseResult;
  }
  __break(1u);
  return result;
}

uint64_t sub_23C1DDA60(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  size_t v4;
  unint64_t v5;
  char *v6;
  char *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;
  char *v17;
  size_t v18;
  char *v19;
  size_t v20;
  char *v21;
  size_t v22;
  BOOL v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;

  v2 = a1 + 32;
  result = swift_bridgeObjectRetain();
  v4 = 0;
  v5 = 0;
  v6 = (char *)MEMORY[0x24BEE4AF8];
  v7 = (char *)(MEMORY[0x24BEE4AF8] + 32);
LABEL_3:
  v9 = *(_QWORD *)(a1 + 16);
  if (v5 != v9)
  {
    if (v5 >= v9)
    {
LABEL_29:
      __break(1u);
    }
    else
    {
      while (1)
      {
        v10 = *(_QWORD *)(v2 + 8 * v5);
        swift_bridgeObjectRetain();
        result = swift_bridgeObjectRelease();
        if (v10)
        {
          v8 = *(_QWORD *)(v10 + 16);
          if (v8)
            break;
        }
        ++v5;
        v11 = *(_QWORD *)(a1 + 16);
        if (v5 == v11)
          goto LABEL_25;
        if (v5 >= v11)
          goto LABEL_29;
      }
      v12 = 0;
      ++v5;
      while (v12 < v8)
      {
        v13 = *(_BYTE *)(v10 + v12 + 32);
        if (!v4)
        {
          v14 = *((_QWORD *)v6 + 3);
          if ((uint64_t)((v14 >> 1) + 0x4000000000000000) < 0)
            goto LABEL_32;
          v27 = *(_BYTE *)(v10 + v12 + 32);
          v15 = v14 & 0xFFFFFFFFFFFFFFFELL;
          if (v15 <= 1)
            v16 = 1;
          else
            v16 = v15;
          __swift_instantiateConcreteTypeFromMangledName(&qword_256B42130);
          v17 = (char *)swift_allocObject();
          v18 = 2 * _swift_stdlib_malloc_size(v17) - 64;
          *((_QWORD *)v17 + 2) = v16;
          *((_QWORD *)v17 + 3) = v18;
          v19 = v17 + 32;
          v20 = *((_QWORD *)v6 + 3) >> 1;
          if (*((_QWORD *)v6 + 2))
          {
            v21 = v6 + 32;
            if (v17 != v6 || v19 >= &v21[v20])
            {
              v22 = v18;
              memmove(v17 + 32, v21, v20);
              v18 = v22;
            }
            *((_QWORD *)v6 + 2) = 0;
          }
          v7 = &v19[v20];
          v4 = (v18 >> 1) - v20;
          result = swift_release();
          v6 = v17;
          v13 = v27;
        }
        v23 = __OFSUB__(v4--, 1);
        if (v23)
          goto LABEL_31;
        ++v12;
        *v7++ = v13;
        v8 = *(_QWORD *)(v10 + 16);
        if (v12 == v8)
          goto LABEL_3;
      }
    }
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
LABEL_25:
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  v24 = *((_QWORD *)v6 + 3);
  if (v24 < 2)
    return (uint64_t)v6;
  v25 = v24 >> 1;
  v23 = __OFSUB__(v25, v4);
  v26 = v25 - v4;
  if (!v23)
  {
    *((_QWORD *)v6 + 2) = v26;
    return (uint64_t)v6;
  }
LABEL_33:
  __break(1u);
  return result;
}

unint64_t sub_23C1DDC48(unint64_t a1, void (*a2)(uint64_t, id *))
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t i;
  id *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v21;
  uint64_t v22;
  id *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, id *);

  v3 = v2;
  v27 = a2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40DB0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = type metadata accessor for MarketingActionItem();
  v8 = *(_QWORD *)(v26 - 8);
  v9 = MEMORY[0x24BDAC7A8](v26);
  v25 = (uint64_t)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v22 = (uint64_t)&v21 - v11;
  if (a1 >> 62)
    goto LABEL_18;
  v12 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v12; v12 = sub_23C1FBE88())
  {
    v21 = v3;
    v13 = MEMORY[0x24BEE4AF8];
    v23 = (id *)a1;
    v24 = a1 & 0xC000000000000001;
    for (i = 4; ; ++i)
    {
      v3 = v12;
      v15 = v24 ? (id *)MEMORY[0x242619510](i - 4, a1) : (id *)*(id *)(a1 + 8 * i);
      a1 = (unint64_t)v15;
      v16 = i - 3;
      if (__OFADD__(i - 4, 1))
        break;
      v27(i - 4, v15);

      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v7, 1, v26) == 1)
      {
        sub_23C1BC2EC((uint64_t)v7, &qword_256B40DB0);
      }
      else
      {
        v17 = v22;
        sub_23C1CD008((uint64_t)v7, v22, (uint64_t (*)(_QWORD))type metadata accessor for MarketingActionItem);
        sub_23C1CD008(v17, v25, (uint64_t (*)(_QWORD))type metadata accessor for MarketingActionItem);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v13 = sub_23C1C46D4(0, *(_QWORD *)(v13 + 16) + 1, 1, v13);
        v19 = *(_QWORD *)(v13 + 16);
        v18 = *(_QWORD *)(v13 + 24);
        if (v19 >= v18 >> 1)
          v13 = sub_23C1C46D4(v18 > 1, v19 + 1, 1, v13);
        *(_QWORD *)(v13 + 16) = v19 + 1;
        sub_23C1CD008(v25, v13+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(_QWORD *)(v8 + 72) * v19, (uint64_t (*)(_QWORD))type metadata accessor for MarketingActionItem);
      }
      a1 = (unint64_t)v23;
      if (v16 == v12)
      {
        swift_bridgeObjectRelease();
        return v13;
      }
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x24BEE4AF8];
}

__n128 MarketingItemView.init(placement:account:bag:shouldAnonymizeMetrics:metricsOverlay:onDismiss:onPurchase:onCarrierLink:)@<Q0>(uint64_t a1@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, unsigned __int8 a4@<W3>, unint64_t a5@<X4>, unint64_t a6@<X5>, unint64_t a7@<X6>, unint64_t a8@<X7>, __n128 *a9@<X8>, unint64_t a10, unint64_t a11, unint64_t a12)
{
  unsigned __int8 v12;
  __n128 result;

  v12 = *(_BYTE *)a1;
  a9->n128_u64[0] = a2;
  a9->n128_u64[1] = a3;
  a9[1].n128_u64[0] = a5;
  a9[1].n128_u8[8] = v12;
  result = *(__n128 *)(a1 + 8);
  a9[2] = result;
  a9[3].n128_u8[0] = a4;
  a9[3].n128_u64[1] = a11;
  a9[4].n128_u64[0] = a12;
  a9[4].n128_u64[1] = a6;
  a9[5].n128_u64[0] = a7;
  a9[5].n128_u64[1] = a8;
  a9[6].n128_u64[0] = a10;
  return result;
}

char *MarketingItemView.makeUIViewController(context:)()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  char *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v2 = *v0;
  v1 = v0[1];
  v3 = v0[2];
  v4 = (void *)v0[5];
  v5 = *((unsigned __int8 *)v0 + 48);
  v28 = v0[8];
  v29 = v0[7];
  v30 = v0[10];
  v31 = v0[9];
  v26 = v0[12];
  v27 = v0[11];
  MarketingOfferPlacement.rawValue.getter(*((_BYTE *)v0 + 24));
  v6 = objc_allocWithZone((Class)type metadata accessor for MarketingItemViewController());
  swift_unknownObjectRetain();
  v7 = (void *)sub_23C1FBCC0();
  v8 = (void *)sub_23C1FBCC0();
  swift_bridgeObjectRelease();
  v9 = objc_msgSend(v6, sel_initWithServiceType_placement_bag_, v7, v8, v1);

  swift_unknownObjectRelease();
  objc_msgSend(v9, sel_setAccount_, v2);
  v10 = v9;
  if (v4)
    v4 = (void *)sub_23C1FBCC0();
  objc_msgSend(v9, sel_setOfferHints_, v4);

  objc_msgSend(v9, sel_setAnonymousMetrics_, v5);
  v11 = v9;
  if (v3)
  {
    sub_23C1D4A48(v3);
    v12 = (void *)sub_23C1FBC78();
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v9, sel_setMetricsOverlay_, v12);

  v13 = (void *)sub_23C1FBCC0();
  objc_msgSend(v9, sel_setMediaClientIdentifier_, v13);

  v14 = (void *)objc_opt_self();
  v15 = (char *)v9;
  v16 = objc_msgSend(v14, sel_currentProcess);
  v17 = (void *)sub_23C1FBCC0();
  objc_msgSend(v16, sel_setTreatmentNamespace_, v17);

  objc_msgSend(v15, sel_setClientInfo_, v16);
  v18 = OBJC_IVAR____TtC16FitnessMarketing27MarketingItemViewController_coordinator;
  v19 = (uint64_t *)(*(_QWORD *)&v15[OBJC_IVAR____TtC16FitnessMarketing27MarketingItemViewController_coordinator]
                  + OBJC_IVAR____TtC16FitnessMarketing31MarketingDynamicViewCoordinator_onPurchase);
  swift_beginAccess();
  v20 = *v19;
  *v19 = v27;
  v19[1] = v26;
  sub_23C1CF980(v27);
  sub_23C1CF99C(v20);
  v21 = (uint64_t *)(*(_QWORD *)&v15[v18]
                  + OBJC_IVAR____TtC16FitnessMarketing31MarketingDynamicViewCoordinator_onCarrierLink);
  swift_beginAccess();
  v22 = *v21;
  *v21 = v29;
  v21[1] = v28;
  sub_23C1CF980(v29);
  sub_23C1CF99C(v22);
  v23 = (uint64_t *)(*(_QWORD *)&v15[v18] + OBJC_IVAR____TtC16FitnessMarketing31MarketingDynamicViewCoordinator_onDismiss);
  swift_beginAccess();
  v24 = *v23;
  *v23 = v31;
  v23[1] = v30;
  sub_23C1CF980(v31);
  sub_23C1CF99C(v24);
  return v15;
}

unint64_t sub_23C1DE2A4()
{
  unint64_t result;

  result = qword_256B42140;
  if (!qword_256B42140)
  {
    result = MEMORY[0x242619B10](&protocol conformance descriptor for MarketingItemView, &type metadata for MarketingItemView);
    atomic_store(result, (unint64_t *)&qword_256B42140);
  }
  return result;
}

uint64_t sub_23C1DE2EC()
{
  sub_23C1DE8F8();
  return sub_23C1FB84C();
}

uint64_t sub_23C1DE33C()
{
  sub_23C1DE8F8();
  return sub_23C1FB81C();
}

void sub_23C1DE38C()
{
  sub_23C1DE8F8();
  sub_23C1FB840();
  __break(1u);
}

uint64_t destroy for MarketingItemView(uint64_t a1)
{
  uint64_t result;

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  if (*(_QWORD *)(a1 + 56))
    result = swift_release();
  if (*(_QWORD *)(a1 + 72))
    result = swift_release();
  if (*(_QWORD *)(a1 + 88))
    return swift_release();
  return result;
}

uint64_t initializeWithCopy for MarketingItemView(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _OWORD *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = *(void **)a2;
  v5 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  v8 = (_OWORD *)(a2 + 56);
  v7 = *(_QWORD *)(a2 + 56);
  v9 = v4;
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v7)
  {
    v10 = *(_QWORD *)(a2 + 64);
    *(_QWORD *)(a1 + 56) = v7;
    *(_QWORD *)(a1 + 64) = v10;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 56) = *v8;
  }
  v11 = *(_QWORD *)(a2 + 72);
  if (v11)
  {
    v12 = *(_QWORD *)(a2 + 80);
    *(_QWORD *)(a1 + 72) = v11;
    *(_QWORD *)(a1 + 80) = v12;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  }
  v13 = *(_QWORD *)(a2 + 88);
  if (v13)
  {
    v14 = *(_QWORD *)(a2 + 96);
    *(_QWORD *)(a1 + 88) = v13;
    *(_QWORD *)(a1 + 96) = v14;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  }
  return a1;
}

uint64_t assignWithCopy for MarketingItemView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
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

  v4 = *(void **)a1;
  v5 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v5;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a1 + 56);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  v8 = *(_QWORD *)(a2 + 56);
  if (v7)
  {
    if (v8)
    {
      v9 = *(_QWORD *)(a2 + 64);
      *(_QWORD *)(a1 + 56) = v8;
      *(_QWORD *)(a1 + 64) = v9;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v8)
  {
    v10 = *(_QWORD *)(a2 + 64);
    *(_QWORD *)(a1 + 56) = v8;
    *(_QWORD *)(a1 + 64) = v10;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
LABEL_8:
  v11 = *(_QWORD *)(a2 + 72);
  if (*(_QWORD *)(a1 + 72))
  {
    if (v11)
    {
      v12 = *(_QWORD *)(a2 + 80);
      *(_QWORD *)(a1 + 72) = v11;
      *(_QWORD *)(a1 + 80) = v12;
      swift_retain();
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v11)
  {
    v13 = *(_QWORD *)(a2 + 80);
    *(_QWORD *)(a1 + 72) = v11;
    *(_QWORD *)(a1 + 80) = v13;
    swift_retain();
    goto LABEL_15;
  }
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
LABEL_15:
  v14 = *(_QWORD *)(a2 + 88);
  if (!*(_QWORD *)(a1 + 88))
  {
    if (v14)
    {
      v16 = *(_QWORD *)(a2 + 96);
      *(_QWORD *)(a1 + 88) = v14;
      *(_QWORD *)(a1 + 96) = v16;
      swift_retain();
      return a1;
    }
LABEL_21:
    *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
    return a1;
  }
  if (!v14)
  {
    swift_release();
    goto LABEL_21;
  }
  v15 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = v14;
  *(_QWORD *)(a1 + 96) = v15;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy104_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __n128 result;
  __int128 v5;
  __int128 v6;

  v2 = *a2;
  v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  result = (__n128)a2[3];
  v5 = a2[4];
  v6 = a2[5];
  *(_QWORD *)(a1 + 96) = *((_QWORD *)a2 + 12);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t assignWithTake for MarketingItemView(uint64_t a1, uint64_t a2)
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

  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_unknownObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 56);
  v6 = *(_QWORD *)(a1 + 56);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  if (v6)
  {
    if (v5)
    {
      v7 = *(_QWORD *)(a2 + 64);
      *(_QWORD *)(a1 + 56) = v5;
      *(_QWORD *)(a1 + 64) = v7;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v5)
  {
    v8 = *(_QWORD *)(a2 + 64);
    *(_QWORD *)(a1 + 56) = v5;
    *(_QWORD *)(a1 + 64) = v8;
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
LABEL_8:
  v9 = *(_QWORD *)(a2 + 72);
  if (*(_QWORD *)(a1 + 72))
  {
    if (v9)
    {
      v10 = *(_QWORD *)(a2 + 80);
      *(_QWORD *)(a1 + 72) = v9;
      *(_QWORD *)(a1 + 80) = v10;
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v9)
  {
    v11 = *(_QWORD *)(a2 + 80);
    *(_QWORD *)(a1 + 72) = v9;
    *(_QWORD *)(a1 + 80) = v11;
    goto LABEL_15;
  }
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
LABEL_15:
  v12 = *(_QWORD *)(a2 + 88);
  if (!*(_QWORD *)(a1 + 88))
  {
    if (v12)
    {
      v14 = *(_QWORD *)(a2 + 96);
      *(_QWORD *)(a1 + 88) = v12;
      *(_QWORD *)(a1 + 96) = v14;
      return a1;
    }
LABEL_21:
    *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
    return a1;
  }
  if (!v12)
  {
    swift_release();
    goto LABEL_21;
  }
  v13 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = v12;
  *(_QWORD *)(a1 + 96) = v13;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for MarketingItemView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 104))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MarketingItemView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 104) = 1;
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
    *(_BYTE *)(result + 104) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for MarketingItemView()
{
  return &type metadata for MarketingItemView;
}

unint64_t sub_23C1DE8F8()
{
  unint64_t result;

  result = qword_256B42148;
  if (!qword_256B42148)
  {
    result = MEMORY[0x242619B10](&protocol conformance descriptor for MarketingItemView, &type metadata for MarketingItemView);
    atomic_store(result, (unint64_t *)&qword_256B42148);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for MarketingPlainButtonStyle(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C1DE988 + 4 * byte_23C201135[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23C1DE9BC + 4 * asc_23C201130[v4]))();
}

uint64_t sub_23C1DE9BC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1DE9C4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C1DE9CCLL);
  return result;
}

uint64_t sub_23C1DE9D8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C1DE9E0);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23C1DE9E4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1DE9EC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MarketingPlainButtonStyle()
{
  return &type metadata for MarketingPlainButtonStyle;
}

uint64_t sub_23C1DEA08()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_23C1DEA18@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  double result;

  *(_QWORD *)&result = sub_23C1DEAC8(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_256B41730, &qword_256B41720).n128_u64[0];
  return result;
}

double sub_23C1DEA70@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  double result;

  *(_QWORD *)&result = sub_23C1DEAC8(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_256B417D8, &qword_256B417C8).n128_u64[0];
  return result;
}

__n128 sub_23C1DEAC8@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t *a16, uint64_t *a17)
{
  uint64_t v17;
  uint64_t *v19;
  void *v28;
  _OWORD *v29;
  __n128 result;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __n128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;

  v19 = a17;
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
    sub_23C1FBDB0();
    v28 = (void *)sub_23C1FB8C4();
    sub_23C1FB528();

    v19 = a17;
  }
  sub_23C1FB630();
  sub_23C1BF6E4(v17, a9, a16);
  v29 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(v19) + 36));
  v29[4] = v35;
  v29[5] = v36;
  v29[6] = v37;
  *v29 = v31;
  v29[1] = v32;
  result = v34;
  v29[2] = v33;
  v29[3] = v34;
  return result;
}

double sub_23C1DEC94@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  double result;

  *(_QWORD *)&result = sub_23C1DED44(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_256B416B8, &qword_256B416A0).n128_u64[0];
  return result;
}

double sub_23C1DECEC@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  double result;

  *(_QWORD *)&result = sub_23C1DEAC8(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_256B41F20, &qword_256B41F28).n128_u64[0];
  return result;
}

__n128 sub_23C1DED44@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t *a16, uint64_t *a17)
{
  uint64_t v17;
  uint64_t *v19;
  void *v28;
  uint64_t v29;
  _OWORD *v30;
  __n128 result;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __n128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;

  v19 = a16;
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
    sub_23C1FBDB0();
    v28 = (void *)sub_23C1FB8C4();
    sub_23C1FB528();

    v19 = a16;
  }
  sub_23C1FB630();
  v29 = __swift_instantiateConcreteTypeFromMangledName(v19);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 16))(a9, v17, v29);
  v30 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(a17) + 36));
  v30[4] = v36;
  v30[5] = v37;
  v30[6] = v38;
  *v30 = v32;
  v30[1] = v33;
  result = v35;
  v30[2] = v34;
  v30[3] = v35;
  return result;
}

double sub_23C1DEF20@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  double result;

  *(_QWORD *)&result = sub_23C1DEAC8(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_256B42240, &qword_256B42248).n128_u64[0];
  return result;
}

uint64_t sub_23C1DEF78@<X0>(int a1@<W1>, uint64_t a2@<X8>)
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t KeyPath;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t);
  char *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  char *v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t result;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t *v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  ValueMetadata *v91;
  char *v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  char *v97;
  char *v98;
  uint64_t v99;
  char *v100;
  char *v101;
  uint64_t v102;
  char *v103;
  char *v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  char *v113;
  char *v114;
  char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  ValueMetadata *v127;
  uint64_t v128;
  unint64_t v129;

  LODWORD(v125) = a1;
  v124 = a2;
  v123 = sub_23C1FB750();
  v102 = *(_QWORD *)(v123 - 8);
  MEMORY[0x24BDAC7A8](v123);
  v100 = (char *)&v95 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42200);
  MEMORY[0x24BDAC7A8](v99);
  v98 = (char *)&v95 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B421F0);
  MEMORY[0x24BDAC7A8](v4);
  v97 = (char *)&v95 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v121 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B421D8);
  MEMORY[0x24BDAC7A8](v121);
  v96 = (char *)&v95 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v122 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42220);
  v103 = *(char **)(v122 - 8);
  v7 = MEMORY[0x24BDAC7A8](v122);
  v101 = (char *)&v95 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v104 = (char *)&v95 - v9;
  v118 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42228);
  MEMORY[0x24BDAC7A8](v118);
  v120 = (uint64_t)&v95 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42230);
  MEMORY[0x24BDAC7A8](v112);
  v113 = (char *)&v95 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v119 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B421A8);
  MEMORY[0x24BDAC7A8](v119);
  v114 = (char *)&v95 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_23C1FB96C();
  v116 = *(_QWORD *)(v13 - 8);
  v117 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v115 = (char *)&v95 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41760);
  MEMORY[0x24BDAC7A8](v106);
  v16 = (char *)&v95 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_23C1FB894();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v95 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41758);
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)&v95 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41800);
  v109 = *(_QWORD *)(v24 - 8);
  v110 = v24;
  MEMORY[0x24BDAC7A8](v24);
  v105 = (char *)&v95 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v107 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41750);
  MEMORY[0x24BDAC7A8](v107);
  v27 = (char *)&v95 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v108 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B421C8);
  MEMORY[0x24BDAC7A8](v108);
  v29 = (char *)&v95 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B421B0);
  MEMORY[0x24BDAC7A8](v111);
  v31 = (char *)&v95 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42238);
  v33 = MEMORY[0x24BDAC7A8](v32);
  v34 = MEMORY[0x24BDAC7A8](v33);
  if (v125 < 2u)
  {
    v102 = v37;
    v103 = (char *)&v95 - v35;
    v104 = v36;
    v125 = v34;
    sub_23C1FB8A0();
    KeyPath = swift_getKeyPath();
    (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v23, v20, v17);
    v39 = (uint64_t *)&v23[*(int *)(v21 + 36)];
    *v39 = KeyPath;
    v39[1] = 0x3FE6666666666666;
    (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
    v40 = *MEMORY[0x24BDECF38];
    v41 = sub_23C1FB5DC();
    v42 = (uint64_t (*)(uint64_t))MEMORY[0x24BDECF50];
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 104))(v16, v40, v41);
    sub_23C1B56F4((unint64_t *)&qword_256B41808, v42, MEMORY[0x24BDECF78]);
    if ((sub_23C1FBC9C() & 1) != 0)
    {
      sub_23C1CF4CC();
      sub_23C1BC328(&qword_256B41788, &qword_256B41760, MEMORY[0x24BEE30C8]);
      v43 = v105;
      sub_23C1FBA68();
      sub_23C1BC2EC((uint64_t)v16, &qword_256B41760);
      sub_23C1BC2EC((uint64_t)v23, &qword_256B41758);
      sub_23C1FB99C();
      sub_23C1FB93C();
      sub_23C1FB960();
      swift_release();
      v45 = v115;
      v44 = v116;
      v46 = v117;
      (*(void (**)(char *, _QWORD, uint64_t))(v116 + 104))(v115, *MEMORY[0x24BDF17C8], v117);
      v47 = sub_23C1FB984();
      swift_release();
      (*(void (**)(char *, uint64_t))(v44 + 8))(v45, v46);
      v48 = swift_getKeyPath();
      v50 = v109;
      v49 = v110;
      (*(void (**)(char *, char *, uint64_t))(v109 + 16))(v27, v43, v110);
      v51 = (uint64_t *)&v27[*(int *)(v107 + 36)];
      *v51 = v48;
      v51[1] = v47;
      (*(void (**)(char *, uint64_t))(v50 + 8))(v43, v49);
      v52 = sub_23C1FBB1C();
      sub_23C1BF6E4((uint64_t)v27, (uint64_t)v29, &qword_256B41750);
      *(_QWORD *)&v29[*(int *)(v108 + 36)] = v52;
      sub_23C1BC2EC((uint64_t)v27, &qword_256B41750);
      v53 = swift_getKeyPath();
      sub_23C1BF6E4((uint64_t)v29, (uint64_t)v31, &qword_256B421C8);
      v54 = v111;
      v55 = &v31[*(int *)(v111 + 36)];
      *(_QWORD *)v55 = v53;
      *((_QWORD *)v55 + 1) = 1;
      v55[16] = 0;
      sub_23C1BC2EC((uint64_t)v29, &qword_256B421C8);
      v126 = 0x4000000000000000;
      v56 = sub_23C1CF358(&qword_256B421B8, &qword_256B421B0, (uint64_t (*)(void))sub_23C1E05C4);
      v57 = sub_23C1E0648();
      v58 = v102;
      sub_23C1FBA20();
      sub_23C1BC2EC((uint64_t)v31, &qword_256B421B0);
      v59 = v104;
      v60 = v103;
      v61 = v58;
      v62 = v125;
      (*((void (**)(char *, uint64_t, uint64_t))v104 + 4))(v103, v61, v125);
      (*((void (**)(char *, char *, uint64_t))v59 + 2))(v113, v60, v62);
      swift_storeEnumTagMultiPayload();
      v126 = v54;
      v127 = &type metadata for ReversedTitleIconLabelStyle;
      v128 = v56;
      v129 = v57;
      swift_getOpaqueTypeConformance2();
      v63 = (uint64_t)v114;
      sub_23C1FB768();
      sub_23C1BF6E4(v63, v120, &qword_256B421A8);
      swift_storeEnumTagMultiPayload();
      sub_23C1E04FC();
      v64 = sub_23C1CF358(&qword_256B421E0, &qword_256B421D8, sub_23C1E068C);
      v65 = sub_23C1B56F4(&qword_256B416B0, (uint64_t (*)(uint64_t))MEMORY[0x24BDEF120], MEMORY[0x24BDEF108]);
      v126 = v121;
      v127 = (ValueMetadata *)v123;
      v128 = v64;
      v129 = v65;
      swift_getOpaqueTypeConformance2();
      sub_23C1FB768();
      sub_23C1BC2EC(v63, &qword_256B421A8);
      return (*((uint64_t (**)(char *, uint64_t))v59 + 1))(v60, v62);
    }
    __break(1u);
    goto LABEL_8;
  }
  v67 = v21;
  v68 = v99;
  v69 = (uint64_t)v98;
  v70 = (uint64_t)v97;
  v71 = (uint64_t)v96;
  if (v125 != 3)
  {
LABEL_8:
    result = sub_23C1FBE7C();
    __break(1u);
    return result;
  }
  sub_23C1FB8A0();
  v72 = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v23, v20, v17);
  v73 = (uint64_t *)&v23[*(int *)(v67 + 36)];
  *v73 = v72;
  v73[1] = 0x3FE6666666666666;
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  sub_23C1FB924();
  sub_23C1FB93C();
  sub_23C1FB960();
  swift_release();
  v74 = v115;
  v75 = v116;
  v76 = v117;
  (*(void (**)(char *, _QWORD, uint64_t))(v116 + 104))(v115, *MEMORY[0x24BDF17C8], v117);
  v77 = sub_23C1FB984();
  swift_release();
  (*(void (**)(char *, uint64_t))(v75 + 8))(v74, v76);
  v78 = swift_getKeyPath();
  sub_23C1BF6E4((uint64_t)v23, v69, &qword_256B41758);
  v79 = (uint64_t *)(v69 + *(int *)(v68 + 36));
  *v79 = v78;
  v79[1] = v77;
  sub_23C1BC2EC((uint64_t)v23, &qword_256B41758);
  v80 = sub_23C1FBBC4();
  v81 = v70;
  sub_23C1DEAC8(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v70, 0.0, 1, 0.0, 1, v80, v82, &qword_256B42200, &qword_256B421F0);
  sub_23C1BC2EC(v69, &qword_256B42200);
  v83 = swift_getKeyPath();
  v84 = v71;
  sub_23C1BF6E4(v70, v71, &qword_256B421F0);
  v85 = v121;
  v86 = v71 + *(int *)(v121 + 36);
  *(_QWORD *)v86 = v83;
  *(_QWORD *)(v86 + 8) = 1;
  *(_BYTE *)(v86 + 16) = 0;
  sub_23C1BC2EC(v81, &qword_256B421F0);
  v87 = v100;
  sub_23C1FB744();
  v88 = sub_23C1CF358(&qword_256B421E0, &qword_256B421D8, sub_23C1E068C);
  v89 = sub_23C1B56F4(&qword_256B416B0, (uint64_t (*)(uint64_t))MEMORY[0x24BDEF120], MEMORY[0x24BDEF108]);
  v90 = v101;
  v91 = (ValueMetadata *)v123;
  sub_23C1FBA20();
  (*(void (**)(char *, ValueMetadata *))(v102 + 8))(v87, v91);
  sub_23C1BC2EC(v84, &qword_256B421D8);
  v92 = v103;
  v93 = v104;
  v94 = v122;
  (*((void (**)(char *, char *, uint64_t))v103 + 4))(v104, v90, v122);
  (*((void (**)(uint64_t, char *, uint64_t))v92 + 2))(v120, v93, v94);
  swift_storeEnumTagMultiPayload();
  sub_23C1E04FC();
  v126 = v85;
  v127 = v91;
  v128 = v88;
  v129 = v89;
  swift_getOpaqueTypeConformance2();
  sub_23C1FB768();
  return (*((uint64_t (**)(char *, uint64_t))v92 + 1))(v93, v94);
}

uint64_t sub_23C1DFC2C@<X0>(unsigned __int8 a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t result;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  __n128 v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;

  v57 = a2;
  v62 = a3;
  v51 = sub_23C1FB708();
  v49 = *(_QWORD *)(v51 - 8);
  MEMORY[0x24BDAC7A8](v51);
  v48 = (char *)&v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42160);
  v53 = *(_QWORD *)(v5 - 8);
  v54 = (char *)v5;
  MEMORY[0x24BDAC7A8](v5);
  v50 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42168);
  v7 = MEMORY[0x24BDAC7A8](v63);
  v52 = (uint64_t)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v48 - v9;
  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42170);
  MEMORY[0x24BDAC7A8](v60);
  v56 = (uint64_t)&v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = (char *)__swift_instantiateConcreteTypeFromMangledName(&qword_256B42178);
  MEMORY[0x24BDAC7A8](v55);
  v13 = (char *)&v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42180);
  MEMORY[0x24BDAC7A8](v61);
  v15 = (char *)&v48 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_23C1FB8B8();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = *(_QWORD *)(v17 + 64);
  MEMORY[0x24BDAC7A8](v16);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41600);
  MEMORY[0x24BDAC7A8](v19);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42188);
  v21 = MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)&v48 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = a1;
  v58 = v25;
  v59 = v21;
  if (a1 >= 2u)
  {
    v34 = v56;
    v35 = v57;
    v55 = v10;
    if (v24 == 3)
    {
      sub_23C1FB888();
      (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))((char *)&v48 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0), v35, v16);
      v36 = (*(unsigned __int8 *)(v17 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
      v37 = swift_allocObject();
      v38 = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v17 + 32))(v37 + v36, (char *)&v48 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0), v16);
      MEMORY[0x24BDAC7A8](v38);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256B42190);
      sub_23C1E040C();
      sub_23C1FBB64();
      v39 = v48;
      sub_23C1FB6FC();
      sub_23C1BC328(&qword_256B42208, &qword_256B42188, MEMORY[0x24BDF43B0]);
      sub_23C1B56F4(&qword_256B416A8, (uint64_t (*)(uint64_t))MEMORY[0x24BDEE8E8], MEMORY[0x24BDEE8D8]);
      v40 = v50;
      v41 = v51;
      v42 = v59;
      sub_23C1FBA38();
      (*(void (**)(char *, uint64_t))(v49 + 8))(v39, v41);
      (*(void (**)(char *, uint64_t))(v58 + 8))(v23, v42);
      v43 = sub_23C1FBBC4();
      v44 = v52;
      v46 = sub_23C1DED44(0.0, 1, 0.0, 1, 440.0, 0, 0.0, 1, v52, 0.0, 1, 0.0, 1, v43, v45, &qword_256B42160, &qword_256B42168);
      (*(void (**)(char *, char *, __n128))(v53 + 8))(v40, v54, v46);
      v47 = (uint64_t)v55;
      sub_23C1E0734(v44, (uint64_t)v55);
      sub_23C1BF6E4(v47, v34, &qword_256B42168);
      swift_storeEnumTagMultiPayload();
      sub_23C1E077C();
      sub_23C1E0800();
      sub_23C1FB768();
      return sub_23C1BC2EC(v47, &qword_256B42168);
    }
    else
    {
      result = sub_23C1FBE7C();
      __break(1u);
    }
  }
  else
  {
    v54 = v23;
    v26 = v57;
    sub_23C1FB888();
    (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))((char *)&v48 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0), v26, v16);
    v27 = (*(unsigned __int8 *)(v17 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
    v28 = swift_allocObject();
    v29 = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v17 + 32))(v28 + v27, (char *)&v48 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0), v16);
    MEMORY[0x24BDAC7A8](v29);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B42190);
    sub_23C1E040C();
    v30 = v54;
    sub_23C1FBB64();
    v32 = v58;
    v31 = v59;
    (*(void (**)(char *, char *, uint64_t))(v58 + 16))(v13, v30, v59);
    swift_storeEnumTagMultiPayload();
    sub_23C1BC328(&qword_256B42208, &qword_256B42188, MEMORY[0x24BDF43B0]);
    sub_23C1FB768();
    sub_23C1BF6E4((uint64_t)v15, v56, &qword_256B42180);
    swift_storeEnumTagMultiPayload();
    sub_23C1E077C();
    sub_23C1E0800();
    sub_23C1FB768();
    sub_23C1BC2EC((uint64_t)v15, &qword_256B42180);
    return (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v30, v31);
  }
  return result;
}

uint64_t sub_23C1E0318@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unsigned __int8 *v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42150);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23C1DFC2C(*v2, a1, (uint64_t)v7);
  v8 = sub_23C1FB8F4();
  sub_23C1FB570();
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  sub_23C1BF6E4((uint64_t)v7, a2, &qword_256B42150);
  v17 = a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256B42158) + 36);
  *(_BYTE *)v17 = v8;
  *(_QWORD *)(v17 + 8) = v10;
  *(_QWORD *)(v17 + 16) = v12;
  *(_QWORD *)(v17 + 24) = v14;
  *(_QWORD *)(v17 + 32) = v16;
  *(_BYTE *)(v17 + 40) = 0;
  return sub_23C1BC2EC((uint64_t)v7, &qword_256B42150);
}

unint64_t sub_23C1E040C()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  _QWORD v6[6];

  result = qword_256B42198;
  if (!qword_256B42198)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B42190);
    v2 = sub_23C1E04FC();
    v3 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B421D8);
    v4 = sub_23C1FB750();
    v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BDEF120];
    v6[2] = v3;
    v6[3] = v4;
    v6[4] = sub_23C1CF358(&qword_256B421E0, &qword_256B421D8, sub_23C1E068C);
    v6[5] = sub_23C1B56F4(&qword_256B416B0, v5, MEMORY[0x24BDEF108]);
    v6[0] = v2;
    v6[1] = swift_getOpaqueTypeConformance2();
    result = MEMORY[0x242619B10](MEMORY[0x24BDEF3E0], v1, v6);
    atomic_store(result, (unint64_t *)&qword_256B42198);
  }
  return result;
}

unint64_t sub_23C1E04FC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t OpaqueTypeConformance2;
  _QWORD v3[6];

  result = qword_256B421A0;
  if (!qword_256B421A0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B421A8);
    v3[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B421B0);
    v3[3] = &type metadata for ReversedTitleIconLabelStyle;
    v3[4] = sub_23C1CF358(&qword_256B421B8, &qword_256B421B0, (uint64_t (*)(void))sub_23C1E05C4);
    v3[5] = sub_23C1E0648();
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    v3[0] = MEMORY[0x24BDF5560];
    v3[1] = OpaqueTypeConformance2;
    result = MEMORY[0x242619B10](MEMORY[0x24BDEF3E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256B421A0);
  }
  return result;
}

unint64_t sub_23C1E05C4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256B421C0;
  if (!qword_256B421C0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B421C8);
    v2[0] = sub_23C1CF3DC();
    v2[1] = sub_23C1BC328(&qword_256B417B0, &qword_256B417B8, MEMORY[0x24BDF0710]);
    result = MEMORY[0x242619B10](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256B421C0);
  }
  return result;
}

unint64_t sub_23C1E0648()
{
  unint64_t result;

  result = qword_256B421D0;
  if (!qword_256B421D0)
  {
    result = MEMORY[0x242619B10](&unk_23C2005DC, &type metadata for ReversedTitleIconLabelStyle);
    atomic_store(result, (unint64_t *)&qword_256B421D0);
  }
  return result;
}

uint64_t sub_23C1E068C()
{
  return sub_23C1CEF0C(&qword_256B421E8, &qword_256B421F0, (uint64_t (*)(void))sub_23C1E06B0, MEMORY[0x24BDEDBB8]);
}

unint64_t sub_23C1E06B0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256B421F8;
  if (!qword_256B421F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B42200);
    v2[0] = sub_23C1CF4CC();
    v2[1] = sub_23C1BC328(&qword_256B41790, &qword_256B41798, MEMORY[0x24BDF1028]);
    result = MEMORY[0x242619B10](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256B421F8);
  }
  return result;
}

uint64_t sub_23C1E0734(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42168);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_23C1E077C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_256B42210;
  if (!qword_256B42210)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B42180);
    v2 = sub_23C1BC328(&qword_256B42208, &qword_256B42188, MEMORY[0x24BDF43B0]);
    v3[0] = MEMORY[0x24BDF5560];
    v3[1] = v2;
    result = MEMORY[0x242619B10](MEMORY[0x24BDEF3E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256B42210);
  }
  return result;
}

unint64_t sub_23C1E0800()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  _QWORD v5[6];

  result = qword_256B42218;
  if (!qword_256B42218)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B42168);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B42188);
    v3 = sub_23C1FB708();
    v4 = (uint64_t (*)(uint64_t))MEMORY[0x24BDEE8E8];
    v5[2] = v2;
    v5[3] = v3;
    v5[4] = sub_23C1BC328(&qword_256B42208, &qword_256B42188, MEMORY[0x24BDF43B0]);
    v5[5] = sub_23C1B56F4(&qword_256B416A8, v4, MEMORY[0x24BDEE8D8]);
    v5[0] = swift_getOpaqueTypeConformance2();
    v5[1] = MEMORY[0x24BDEDBB8];
    result = MEMORY[0x242619B10](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_256B42218);
  }
  return result;
}

uint64_t sub_23C1E08F4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23C1DEF78(*(unsigned __int8 *)(v1 + 16), a1);
}

uint64_t sub_23C1E0900@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_23C1FB6C0();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_23C1E0930()
{
  return sub_23C1FB6CC();
}

uint64_t sub_23C1E095C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_23C1FB690();
  *a1 = v3;
  return result;
}

uint64_t sub_23C1E0984@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_23C1FB690();
  *a1 = v3;
  return result;
}

uint64_t sub_23C1E09AC()
{
  return sub_23C1FB69C();
}

uint64_t sub_23C1E09D0()
{
  return sub_23C1FB69C();
}

uint64_t sub_23C1E09F4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_23C1FB6A8();
  *a1 = result;
  return result;
}

uint64_t sub_23C1E0A1C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_23C1FB6A8();
  *a1 = result;
  return result;
}

uint64_t sub_23C1E0A44()
{
  swift_retain();
  return sub_23C1FB6B4();
}

uint64_t sub_23C1E0A6C()
{
  swift_retain();
  return sub_23C1FB6B4();
}

uint64_t sub_23C1E0A94@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_23C1FB6C0();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_23C1E0AC4()
{
  return sub_23C1FB6CC();
}

uint64_t sub_23C1E0AF0()
{
  return sub_23C1CEF0C(&qword_256B42250, &qword_256B42158, (uint64_t (*)(void))sub_23C1E0B24, MEMORY[0x24BDECC60]);
}

unint64_t sub_23C1E0B24()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_256B42258;
  if (!qword_256B42258)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B42150);
    v2 = sub_23C1E0B88();
    result = MEMORY[0x242619B10](MEMORY[0x24BDF3F50], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_256B42258);
  }
  return result;
}

unint64_t sub_23C1E0B88()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256B42260;
  if (!qword_256B42260)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B42268);
    v2[0] = sub_23C1E077C();
    v2[1] = sub_23C1E0800();
    result = MEMORY[0x242619B10](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256B42260);
  }
  return result;
}

uint64_t sub_23C1E0BF8@<X0>(int a1@<W0>, void (*a2)(uint64_t)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  _BYTE *v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE *v25;
  unint64_t v26;
  void (*v27)(_BYTE *, uint64_t);
  unint64_t v28;
  void (*v29)(_BYTE *, uint64_t);
  void (*v30)(_BYTE *, uint64_t);
  uint64_t OpaqueTypeConformance2;
  uint64_t v32;
  _BYTE v34[4];
  int v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t);
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  _QWORD v43[2];
  uint64_t v44;
  ValueMetadata *v45;
  uint64_t v46;
  unint64_t v47;

  v37 = a3;
  v38 = a2;
  v35 = a1;
  v42 = a6;
  v44 = a4;
  v45 = &type metadata for MarketingPlainButtonStyle;
  v46 = a5;
  v47 = sub_23C1CA884();
  v41 = v47;
  v9 = MEMORY[0x242619ABC](0, &v44, MEMORY[0x24BDF22B8], 0);
  v36 = *(_QWORD *)(v9 - 8);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = &v34[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = &v34[-v14];
  v16 = *(_QWORD *)(a4 - 8);
  v17 = MEMORY[0x24BDAC7A8](v13);
  v19 = &v34[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v17);
  v21 = &v34[-v20];
  v22 = sub_23C1FB774();
  v39 = *(_QWORD *)(v22 - 8);
  v40 = v22;
  v23 = MEMORY[0x24BDAC7A8](v22);
  v25 = &v34[-v24];
  if ((*v6 & 1) != 0)
  {
    v38(v23);
    LOBYTE(v44) = v35;
    v26 = v41;
    sub_23C1FBA38();
    v27 = *(void (**)(_BYTE *, uint64_t))(v16 + 8);
    v28 = v26;
    v27(v21, a4);
    v44 = a4;
    v45 = &type metadata for MarketingPlainButtonStyle;
    v46 = a5;
    v47 = v26;
    swift_getOpaqueTypeConformance2();
    sub_23C1CD350((uint64_t)v12, v9, (uint64_t)v15);
    v29 = *(void (**)(_BYTE *, uint64_t))(v36 + 8);
    v29(v12, v9);
    sub_23C1C87C4((uint64_t)v15, v9, (uint64_t)v12);
    sub_23C1EA4C8((uint64_t)v12, a4, v9);
    v29(v12, v9);
    v29(v15, v9);
  }
  else
  {
    v38(v23);
    sub_23C1CD350((uint64_t)v19, a4, (uint64_t)v21);
    v30 = *(void (**)(_BYTE *, uint64_t))(v16 + 8);
    v30(v19, a4);
    sub_23C1C87C4((uint64_t)v21, a4, (uint64_t)v19);
    v44 = a4;
    v45 = &type metadata for MarketingPlainButtonStyle;
    v46 = a5;
    v28 = v41;
    v47 = v41;
    swift_getOpaqueTypeConformance2();
    sub_23C1EA404((uint64_t)v19, a4);
    v30(v19, a4);
    v30(v21, a4);
  }
  v44 = a4;
  v45 = &type metadata for MarketingPlainButtonStyle;
  v46 = a5;
  v47 = v28;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v43[0] = a5;
  v43[1] = OpaqueTypeConformance2;
  v32 = v40;
  MEMORY[0x242619B10](MEMORY[0x24BDEF3E0], v40, v43);
  sub_23C1C87C4((uint64_t)v25, v32, v42);
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v39 + 8))(v25, v32);
}

uint64_t sub_23C1E0F58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  _BYTE *v6;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  __int128 v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _OWORD v26[2];
  char v27;

  LODWORD(v22) = a3;
  v23 = a1;
  v24 = a6;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41580);
  MEMORY[0x24BDAC7A8](v25);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42278);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41410);
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = *(_OWORD *)(a2 + 16);
  v26[0] = *(_OWORD *)a2;
  v26[1] = v19;
  v27 = *(_BYTE *)(a2 + 32);
  if ((*v6 & 1) != 0)
  {
    swift_retain();
    sub_23C1E1258(v23, (unsigned __int8 *)v26, v22, a4, a5, (uint64_t)v11);
    sub_23C1BF6E4((uint64_t)v11, (uint64_t)v14, &qword_256B41580);
    swift_storeEnumTagMultiPayload();
    sub_23C1BC328(&qword_256B41420, &qword_256B41410, MEMORY[0x24BDF43B0]);
    sub_23C1CCC68(&qword_256B41578, &qword_256B41580, sub_23C1CCCD4);
    sub_23C1FB768();
    return sub_23C1BC2EC((uint64_t)v11, &qword_256B41580);
  }
  else
  {
    v21 = swift_allocObject();
    v22 = (uint64_t)&v22;
    *(_QWORD *)(v21 + 16) = a4;
    *(_QWORD *)(v21 + 24) = a5;
    MEMORY[0x24BDAC7A8](v21);
    *(&v22 - 2) = v23;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B41548);
    sub_23C1BC328(&qword_256B41550, &qword_256B41548, MEMORY[0x24BDF41A8]);
    sub_23C1FBB70();
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v14, v18, v15);
    swift_storeEnumTagMultiPayload();
    sub_23C1BC328(&qword_256B41420, &qword_256B41410, MEMORY[0x24BDF43B0]);
    sub_23C1CCC68(&qword_256B41578, &qword_256B41580, sub_23C1CCCD4);
    sub_23C1FB768();
    return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  }
}

uint64_t sub_23C1E1258@<X0>(uint64_t a1@<X0>, unsigned __int8 *a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
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
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
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
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  int v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  __int128 v81;
  __int128 v82;
  unsigned __int8 v83;

  v79 = a5;
  v80 = a4;
  v77 = a3;
  v78 = a6;
  v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42280);
  MEMORY[0x24BDAC7A8](v69);
  v71 = (uint64_t)&v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B415A0);
  MEMORY[0x24BDAC7A8](v76);
  v72 = (char *)&v61 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42288);
  MEMORY[0x24BDAC7A8](v74);
  v75 = (uint64_t)&v61 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B415C0);
  v11 = MEMORY[0x24BDAC7A8](v70);
  v13 = (char *)&v61 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v63 = (uint64_t)&v61 - v14;
  v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B415B0);
  v15 = MEMORY[0x24BDAC7A8](v68);
  v17 = (char *)&v61 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v62 = (uint64_t)&v61 - v18;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42290);
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)&v61 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B415D0);
  MEMORY[0x24BDAC7A8](v22);
  v24 = (char *)&v61 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41590);
  MEMORY[0x24BDAC7A8](v25);
  v73 = (char *)&v61 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41580);
  MEMORY[0x24BDAC7A8](v27);
  v29 = (char *)&v61 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = type metadata accessor for MarketingActionItem();
  v31 = (uint64_t *)(a1 + *(int *)(v30 + 24));
  v32 = v31[1];
  if (v32)
  {
    v67 = v29;
    v64 = v25;
    v65 = v21;
    v66 = v19;
    v33 = v79;
    v34 = *v31;
    if ((*(_BYTE *)(a1 + *(int *)(v30 + 28)) & 0x7F) != 0)
    {
      v35 = v80;
      if ((*(_BYTE *)(a1 + *(int *)(v30 + 28)) & 0x7F) != 1)
      {
        v45 = *a2;
        v46 = v79;
        v61 = v32;
        v47 = v34;
        if (v45)
        {
          if (v45 == 1)
          {
            swift_retain_n();
            v48 = sub_23C1FB720();
          }
          else
          {
            swift_retain_n();
            v48 = sub_23C1FB738();
          }
        }
        else
        {
          swift_retain_n();
          v48 = sub_23C1FB72C();
        }
        v54 = (uint64_t)v65;
        v55 = *((_QWORD *)a2 + 2);
        *(_QWORD *)v13 = v48;
        *((_QWORD *)v13 + 1) = v55;
        v13[16] = 0;
        v56 = (uint64_t)&v13[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256B42298) + 44)];
        swift_retain();
        sub_23C1E20F8(v77, v47, v61, (uint64_t)a2, a1, v35, v46, v56);
        v57 = v63;
        sub_23C1BF778((uint64_t)v13, v63, &qword_256B415C0);
        sub_23C1BF6E4(v57, v71, &qword_256B415C0);
        swift_storeEnumTagMultiPayload();
        v58 = MEMORY[0x24BDF4700];
        sub_23C1BC328(&qword_256B415A8, &qword_256B415B0, MEMORY[0x24BDF4700]);
        sub_23C1BC328(&qword_256B415B8, &qword_256B415C0, v58);
        v59 = (uint64_t)v72;
        sub_23C1FB768();
        sub_23C1BF6E4(v59, v75, &qword_256B415A0);
        swift_storeEnumTagMultiPayload();
        sub_23C1CCCF0();
        sub_23C1CCD94();
        v37 = (uint64_t)v73;
        sub_23C1FB768();
        sub_23C1BC2EC(v59, &qword_256B415A0);
        sub_23C1BC2EC(v57, &qword_256B415C0);
        goto LABEL_19;
      }
      v36 = *((_OWORD *)a2 + 1);
      v81 = *(_OWORD *)a2;
      v82 = v36;
      v83 = a2[32];
      swift_retain_n();
      sub_23C1E2B70(a1, (uint64_t)&v81, v77, v35, v33, (uint64_t)v24);
      sub_23C1BF6E4((uint64_t)v24, v75, &qword_256B415D0);
      swift_storeEnumTagMultiPayload();
      sub_23C1CCCF0();
      sub_23C1CCD94();
      v37 = (uint64_t)v73;
      sub_23C1FB768();
      sub_23C1BC2EC((uint64_t)v24, &qword_256B415D0);
    }
    else
    {
      if (*a2)
      {
        v41 = v32;
        v37 = (uint64_t)v73;
        v42 = v77;
        v43 = v79;
        if (*a2 == 1)
        {
          swift_retain_n();
          v44 = sub_23C1FB720();
        }
        else
        {
          swift_retain_n();
          v44 = sub_23C1FB738();
        }
      }
      else
      {
        v41 = v32;
        v43 = v79;
        swift_retain_n();
        v44 = sub_23C1FB72C();
        v37 = (uint64_t)v73;
        v42 = v77;
      }
      v49 = *((_QWORD *)a2 + 2);
      *(_QWORD *)v17 = v44;
      *((_QWORD *)v17 + 1) = v49;
      v17[16] = 0;
      v50 = (uint64_t)&v17[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256B422A0) + 44)];
      swift_retain();
      sub_23C1E1AC8(a1, (__int128 *)a2, v42, v34, v41, v80, v43, v50);
      v51 = v62;
      sub_23C1BF778((uint64_t)v17, v62, &qword_256B415B0);
      sub_23C1BF6E4(v51, v71, &qword_256B415B0);
      swift_storeEnumTagMultiPayload();
      v52 = MEMORY[0x24BDF4700];
      sub_23C1BC328(&qword_256B415A8, &qword_256B415B0, MEMORY[0x24BDF4700]);
      sub_23C1BC328(&qword_256B415B8, &qword_256B415C0, v52);
      v53 = (uint64_t)v72;
      sub_23C1FB768();
      sub_23C1BF6E4(v53, v75, &qword_256B415A0);
      swift_storeEnumTagMultiPayload();
      sub_23C1CCCF0();
      sub_23C1CCD94();
      sub_23C1FB768();
      sub_23C1BC2EC(v53, &qword_256B415A0);
      sub_23C1BC2EC(v51, &qword_256B415B0);
    }
    v54 = (uint64_t)v65;
LABEL_19:
    sub_23C1BF6E4(v37, v54, &qword_256B41590);
    swift_storeEnumTagMultiPayload();
    sub_23C1CCCD4();
    sub_23C1CCD94();
    v40 = (uint64_t)v67;
    sub_23C1FB768();
    sub_23C1BC2EC(v37, &qword_256B41590);
    goto LABEL_20;
  }
  v38 = *((_OWORD *)a2 + 1);
  v81 = *(_OWORD *)a2;
  v82 = v38;
  v83 = a2[32];
  v39 = v79;
  swift_retain_n();
  sub_23C1E2B70(a1, (uint64_t)&v81, v77, v80, v39, (uint64_t)v24);
  sub_23C1BF6E4((uint64_t)v24, (uint64_t)v21, &qword_256B415D0);
  swift_storeEnumTagMultiPayload();
  sub_23C1CCCD4();
  sub_23C1CCD94();
  sub_23C1FB768();
  sub_23C1BC2EC((uint64_t)v24, &qword_256B415D0);
  v40 = (uint64_t)v29;
LABEL_20:
  sub_23C1BF778(v40, v78, &qword_256B41580);
  return swift_release_n();
}

uint64_t sub_23C1E1AC8@<X0>(uint64_t a1@<X0>, __int128 *a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t KeyPath;
  uint64_t v41;
  uint64_t v42;
  uint64_t result;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
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
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  __int128 *v73;
  uint64_t v74;
  uint64_t v75;
  int v76;
  uint64_t v77;
  __int128 v78;
  __int128 v79;
  uint64_t v80;
  uint64_t v81;

  v77 = a6;
  v76 = a3;
  v74 = a8;
  v75 = a1;
  v12 = sub_23C1FB96C();
  v69 = *(_QWORD *)(v12 - 8);
  v70 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v68 = (char *)&v60 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41760);
  MEMORY[0x24BDAC7A8](v60);
  v15 = (char *)&v60 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B422A8);
  v65 = *(_QWORD *)(v67 - 8);
  MEMORY[0x24BDAC7A8](v67);
  v17 = (char *)&v60 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B422B0);
  MEMORY[0x24BDAC7A8](v61);
  v19 = (char *)&v60 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B422B8);
  MEMORY[0x24BDAC7A8](v62);
  v21 = (char *)&v60 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B422C0);
  MEMORY[0x24BDAC7A8](v63);
  v23 = (char *)&v60 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B422C8);
  v24 = MEMORY[0x24BDAC7A8](v64);
  v26 = (char *)&v60 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v24);
  v72 = (uint64_t)&v60 - v27;
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B415D0);
  v29 = MEMORY[0x24BDAC7A8](v28);
  v71 = (uint64_t)&v60 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v29);
  v31 = a2[1];
  v78 = *a2;
  v79 = v31;
  v73 = a2;
  LOBYTE(v80) = *((_BYTE *)a2 + 32);
  v66 = (uint64_t)&v60 - v32;
  v33 = v77;
  v77 = a7;
  sub_23C1E2B70(v75, (uint64_t)&v78, v76, v33, a7, (uint64_t)&v60 - v32);
  *(_QWORD *)&v78 = a4;
  *((_QWORD *)&v78 + 1) = a5;
  sub_23C1CA840();
  swift_bridgeObjectRetain();
  v34 = sub_23C1FB9C0();
  v36 = v35;
  LOBYTE(a4) = v37;
  v39 = v38;
  KeyPath = swift_getKeyPath();
  *(_QWORD *)&v78 = v34;
  *((_QWORD *)&v78 + 1) = v36;
  LOBYTE(v79) = a4 & 1;
  *((_QWORD *)&v79 + 1) = v39;
  v80 = KeyPath;
  v81 = 0x3FE6666666666666;
  v41 = *MEMORY[0x24BDECF38];
  v42 = sub_23C1FB5DC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v42 - 8) + 104))(v15, v41, v42);
  sub_23C1E3398();
  result = sub_23C1FBC9C();
  if ((result & 1) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B422D0);
    sub_23C1E33E0();
    sub_23C1BC328(&qword_256B41788, &qword_256B41760, MEMORY[0x24BEE30C8]);
    sub_23C1FBA68();
    sub_23C1BC2EC((uint64_t)v15, &qword_256B41760);
    sub_23C1DA540(v78, *((uint64_t *)&v78 + 1), v79);
    swift_bridgeObjectRelease();
    swift_release();
    sub_23C1FB978();
    sub_23C1FB93C();
    sub_23C1FB960();
    swift_release();
    v45 = v68;
    v44 = v69;
    v46 = v70;
    (*(void (**)(char *, _QWORD, uint64_t))(v69 + 104))(v68, *MEMORY[0x24BDF17C8], v70);
    v47 = sub_23C1FB984();
    swift_release();
    (*(void (**)(char *, uint64_t))(v44 + 8))(v45, v46);
    v48 = swift_getKeyPath();
    v49 = v65;
    v50 = v67;
    (*(void (**)(char *, char *, uint64_t))(v65 + 16))(v19, v17, v67);
    v51 = (uint64_t *)&v19[*(int *)(v61 + 36)];
    *v51 = v48;
    v51[1] = v47;
    (*(void (**)(char *, uint64_t))(v49 + 8))(v17, v50);
    LODWORD(v47) = sub_23C1FB7A4();
    sub_23C1BF6E4((uint64_t)v19, (uint64_t)v21, &qword_256B422B0);
    *(_DWORD *)&v21[*(int *)(v62 + 36)] = v47;
    sub_23C1BC2EC((uint64_t)v19, &qword_256B422B0);
    v52 = *((_QWORD *)v73 + 1);
    v53 = swift_getKeyPath();
    sub_23C1BF6E4((uint64_t)v21, (uint64_t)v23, &qword_256B422B8);
    v54 = &v23[*(int *)(v63 + 36)];
    *(_QWORD *)v54 = v53;
    *((_QWORD *)v54 + 1) = v52;
    v54[16] = 0;
    sub_23C1BC2EC((uint64_t)v21, &qword_256B422B8);
    sub_23C1BF6E4((uint64_t)v23, (uint64_t)v26, &qword_256B422C0);
    *(_WORD *)&v26[*(int *)(v64 + 36)] = 256;
    sub_23C1BC2EC((uint64_t)v23, &qword_256B422C0);
    v55 = v72;
    sub_23C1BF778((uint64_t)v26, v72, &qword_256B422C8);
    v56 = v66;
    v57 = v71;
    sub_23C1BF6E4(v66, v71, &qword_256B415D0);
    sub_23C1BF6E4(v55, (uint64_t)v26, &qword_256B422C8);
    v58 = v74;
    sub_23C1BF6E4(v57, v74, &qword_256B415D0);
    v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B422E0);
    sub_23C1BF6E4((uint64_t)v26, v58 + *(int *)(v59 + 48), &qword_256B422C8);
    sub_23C1BC2EC(v55, &qword_256B422C8);
    sub_23C1BC2EC(v56, &qword_256B415D0);
    sub_23C1BC2EC((uint64_t)v26, &qword_256B422C8);
    sub_23C1BC2EC(v57, &qword_256B415D0);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_23C1E20F8@<X0>(int a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE *v25;
  uint64_t v26;
  _BYTE *v27;
  uint64_t KeyPath;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE *v33;
  __int128 v34;
  _BYTE *v35;
  _BYTE *v36;
  uint64_t v37;
  uint64_t v38;
  _BYTE v40[4];
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _BYTE *v45;
  _BYTE *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _OWORD v51[2];
  char v52;

  v48 = a6;
  v49 = a7;
  v47 = a5;
  v42 = a4;
  v43 = a2;
  v44 = a3;
  v41 = a1;
  v50 = a8;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B415D0);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v46 = &v40[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v10);
  v45 = &v40[-v12];
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B422E8);
  MEMORY[0x24BDAC7A8](v13);
  v15 = &v40[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B422F0);
  MEMORY[0x24BDAC7A8](v16);
  v18 = &v40[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B422F8);
  MEMORY[0x24BDAC7A8](v19);
  v21 = &v40[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42300);
  v23 = MEMORY[0x24BDAC7A8](v22);
  v25 = &v40[-((v24 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v23);
  v27 = &v40[-v26];
  sub_23C1E2468(a1, v43, v44, (uint64_t)v15);
  KeyPath = swift_getKeyPath();
  sub_23C1BF6E4((uint64_t)v15, (uint64_t)v18, &qword_256B422E8);
  v29 = (uint64_t *)&v18[*(int *)(v16 + 36)];
  *v29 = KeyPath;
  v29[1] = 0x3FE6666666666666;
  sub_23C1BC2EC((uint64_t)v15, &qword_256B422E8);
  v30 = v42;
  v31 = *(_QWORD *)(v42 + 8);
  v32 = swift_getKeyPath();
  sub_23C1BF6E4((uint64_t)v18, (uint64_t)v21, &qword_256B422F0);
  v33 = &v21[*(int *)(v19 + 36)];
  *(_QWORD *)v33 = v32;
  *((_QWORD *)v33 + 1) = v31;
  v33[16] = 0;
  sub_23C1BC2EC((uint64_t)v18, &qword_256B422F0);
  sub_23C1BF6E4((uint64_t)v21, (uint64_t)v25, &qword_256B422F8);
  *(_WORD *)&v25[*(int *)(v22 + 36)] = 256;
  sub_23C1BC2EC((uint64_t)v21, &qword_256B422F8);
  sub_23C1BF778((uint64_t)v25, (uint64_t)v27, &qword_256B42300);
  v34 = *(_OWORD *)(v30 + 16);
  v51[0] = *(_OWORD *)v30;
  v51[1] = v34;
  v52 = *(_BYTE *)(v30 + 32);
  v35 = v45;
  sub_23C1E2B70(v47, (uint64_t)v51, v41, v48, v49, (uint64_t)v45);
  sub_23C1BF6E4((uint64_t)v27, (uint64_t)v25, &qword_256B42300);
  v36 = v46;
  sub_23C1BF6E4((uint64_t)v35, (uint64_t)v46, &qword_256B415D0);
  v37 = v50;
  sub_23C1BF6E4((uint64_t)v25, v50, &qword_256B42300);
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42308);
  sub_23C1BF6E4((uint64_t)v36, v37 + *(int *)(v38 + 48), &qword_256B415D0);
  sub_23C1BC2EC((uint64_t)v35, &qword_256B415D0);
  sub_23C1BC2EC((uint64_t)v27, &qword_256B42300);
  sub_23C1BC2EC((uint64_t)v36, &qword_256B415D0);
  sub_23C1BC2EC((uint64_t)v25, &qword_256B42300);
  return swift_release();
}

uint64_t sub_23C1E2468@<X0>(int a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
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
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t KeyPath;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t result;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char v73;
  uint64_t v74;

  v70 = a2;
  LODWORD(v69) = a1;
  v68 = a4;
  v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42310);
  MEMORY[0x24BDAC7A8](v66);
  v67 = (uint64_t *)((char *)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42318);
  MEMORY[0x24BDAC7A8](v61);
  v62 = (uint64_t)&v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42320);
  MEMORY[0x24BDAC7A8](v65);
  v8 = (char *)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23C1FB96C();
  v63 = *(_QWORD *)(v9 - 8);
  v64 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41760);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v58 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41F08);
  v15 = *(_QWORD *)(v60 - 8);
  MEMORY[0x24BDAC7A8](v60);
  v17 = (char *)&v58 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41F10);
  MEMORY[0x24BDAC7A8](v59);
  v19 = (char *)&v58 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41F18);
  v21 = MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)&v58 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = MEMORY[0x24BDAC7A8](v21);
  v26 = (char *)&v58 - v25;
  if (v69 < 2u)
  {
    v58 = v24;
    v69 = v8;
    v71 = v70;
    v72 = a3;
    sub_23C1CA840();
    swift_bridgeObjectRetain();
    v71 = sub_23C1FB9C0();
    v72 = v27;
    v73 = v28 & 1;
    v74 = v29;
    v30 = *MEMORY[0x24BDECF38];
    v31 = sub_23C1FB5DC();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 104))(v14, v30, v31);
    sub_23C1E3398();
    if ((sub_23C1FBC9C() & 1) != 0)
    {
      sub_23C1BC328(&qword_256B41788, &qword_256B41760, MEMORY[0x24BEE30C8]);
      sub_23C1FBA68();
      sub_23C1BC2EC((uint64_t)v14, &qword_256B41760);
      sub_23C1DA540(v71, v72, v73);
      swift_bridgeObjectRelease();
      sub_23C1FB978();
      sub_23C1FB93C();
      sub_23C1FB960();
      swift_release();
      v33 = v63;
      v32 = v64;
      (*(void (**)(char *, _QWORD, uint64_t))(v63 + 104))(v11, *MEMORY[0x24BDF17C8], v64);
      v34 = sub_23C1FB984();
      swift_release();
      (*(void (**)(char *, uint64_t))(v33 + 8))(v11, v32);
      KeyPath = swift_getKeyPath();
      v36 = v60;
      (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v19, v17, v60);
      v37 = (uint64_t *)&v19[*(int *)(v59 + 36)];
      *v37 = KeyPath;
      v37[1] = v34;
      (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v36);
      LODWORD(v34) = sub_23C1FB7A4();
      sub_23C1BF6E4((uint64_t)v19, (uint64_t)v23, &qword_256B41F10);
      *(_DWORD *)&v23[*(int *)(v58 + 36)] = v34;
      sub_23C1BC2EC((uint64_t)v19, &qword_256B41F10);
      sub_23C1BF778((uint64_t)v23, (uint64_t)v26, &qword_256B41F18);
      sub_23C1BF6E4((uint64_t)v26, v62, &qword_256B41F18);
      swift_storeEnumTagMultiPayload();
      sub_23C1E34E0();
      v38 = (uint64_t)v69;
      sub_23C1FB768();
      sub_23C1BF6E4(v38, (uint64_t)v67, &qword_256B42320);
      swift_storeEnumTagMultiPayload();
      sub_23C1E3474();
      sub_23C1FB768();
      sub_23C1BC2EC(v38, &qword_256B42320);
      return sub_23C1BC2EC((uint64_t)v26, &qword_256B41F18);
    }
    __break(1u);
    goto LABEL_8;
  }
  if (v69 != 3)
  {
LABEL_8:
    result = sub_23C1FBE7C();
    __break(1u);
    return result;
  }
  v71 = v70;
  v72 = a3;
  sub_23C1CA840();
  swift_bridgeObjectRetain();
  v40 = sub_23C1FB9C0();
  v42 = v41;
  v44 = v43 & 1;
  sub_23C1FB990();
  sub_23C1FB93C();
  sub_23C1FB960();
  swift_release();
  v46 = v63;
  v45 = v64;
  (*(void (**)(char *, _QWORD, uint64_t))(v63 + 104))(v11, *MEMORY[0x24BDF17C8], v64);
  sub_23C1FB984();
  swift_release();
  (*(void (**)(char *, uint64_t))(v46 + 8))(v11, v45);
  v47 = sub_23C1FB9B4();
  v49 = v48;
  LOBYTE(v46) = v50;
  swift_release();
  sub_23C1DA540(v40, v42, v44);
  swift_bridgeObjectRelease();
  LODWORD(v71) = sub_23C1FB798();
  v51 = sub_23C1FB9A8();
  v53 = v52;
  LOBYTE(v42) = v54;
  v56 = v55;
  sub_23C1DA540(v47, v49, v46 & 1);
  swift_bridgeObjectRelease();
  v57 = v67;
  *v67 = v51;
  v57[1] = v53;
  *((_BYTE *)v57 + 16) = v42 & 1;
  v57[3] = v56;
  swift_storeEnumTagMultiPayload();
  sub_23C1E3474();
  return sub_23C1FB768();
}

uint64_t sub_23C1E2B70@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  _BYTE *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  _BYTE *v27;
  uint64_t v28;
  unint64_t v29;
  ValueMetadata *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  _BYTE *v35;
  uint64_t v36;
  unint64_t v37;
  _BYTE v38[4];
  int v39;
  _BYTE *v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _BYTE *v47;
  uint64_t v48;
  uint64_t v49;
  ValueMetadata *v50;
  uint64_t v51;
  unint64_t v52;

  v42 = a4;
  v43 = a3;
  v48 = a6;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42350);
  v41 = *(_QWORD *)(v9 - 8);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = &v38[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v10);
  v40 = &v38[-v13];
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42358);
  MEMORY[0x24BDAC7A8](v45);
  v47 = &v38[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B415D8);
  v44 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v17 = &v38[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42360);
  v18 = *(_QWORD *)(v46 - 8);
  v19 = MEMORY[0x24BDAC7A8](v46);
  v21 = &v38[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v19);
  v23 = &v38[-v22];
  if (*(char *)(a1 + *(int *)(type metadata accessor for MarketingActionItem() + 28)) < 0)
  {
    v39 = *(unsigned __int8 *)(a2 + 32);
    v31 = *(ValueMetadata **)(a2 + 24);
    v32 = swift_allocObject();
    *(_QWORD *)(v32 + 16) = v42;
    *(_QWORD *)(v32 + 24) = a5;
    MEMORY[0x24BDAC7A8](v32);
    *(_QWORD *)&v38[-16] = a1;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B42368);
    sub_23C1BC328(&qword_256B42370, &qword_256B42368, MEMORY[0x24BDF41A8]);
    sub_23C1FBB70();
    LOBYTE(v49) = v43;
    v50 = v31;
    LOBYTE(v51) = v39;
    v33 = sub_23C1BC328(&qword_256B415E0, &qword_256B415D8, MEMORY[0x24BDF43B0]);
    v34 = sub_23C1CCE88();
    sub_23C1FBA38();
    (*(void (**)(_BYTE *, uint64_t))(v44 + 8))(v17, v15);
    v35 = v40;
    v36 = v41;
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v41 + 32))(v40, v12, v9);
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v36 + 16))(v47, v35, v9);
    swift_storeEnumTagMultiPayload();
    v37 = sub_23C1CA884();
    v49 = v15;
    v50 = &type metadata for MarketingPlainButtonStyle;
    v51 = v33;
    v52 = v37;
    swift_getOpaqueTypeConformance2();
    v49 = v15;
    v50 = &type metadata for MarketingRoundButtonStyle;
    v51 = v33;
    v52 = v34;
    swift_getOpaqueTypeConformance2();
    sub_23C1FB768();
    return (*(uint64_t (**)(_BYTE *, uint64_t))(v36 + 8))(v35, v9);
  }
  else
  {
    v24 = swift_allocObject();
    v41 = v9;
    *(_QWORD *)(v24 + 16) = v42;
    *(_QWORD *)(v24 + 24) = a5;
    MEMORY[0x24BDAC7A8](v24);
    *(_QWORD *)&v38[-16] = a1;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B42368);
    sub_23C1BC328(&qword_256B42370, &qword_256B42368, MEMORY[0x24BDF41A8]);
    sub_23C1FBB70();
    LOBYTE(v49) = v43;
    v25 = sub_23C1BC328(&qword_256B415E0, &qword_256B415D8, MEMORY[0x24BDF43B0]);
    v26 = sub_23C1CA884();
    sub_23C1FBA38();
    (*(void (**)(_BYTE *, uint64_t))(v44 + 8))(v17, v15);
    v27 = v21;
    v28 = v46;
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v18 + 32))(v23, v27, v46);
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v18 + 16))(v47, v23, v28);
    swift_storeEnumTagMultiPayload();
    v49 = v15;
    v50 = &type metadata for MarketingPlainButtonStyle;
    v51 = v25;
    v52 = v26;
    swift_getOpaqueTypeConformance2();
    v29 = sub_23C1CCE88();
    v49 = v15;
    v50 = &type metadata for MarketingRoundButtonStyle;
    v51 = v25;
    v52 = v29;
    swift_getOpaqueTypeConformance2();
    sub_23C1FB768();
    return (*(uint64_t (**)(_BYTE *, uint64_t))(v18 + 8))(v23, v28);
  }
}

uint64_t sub_23C1E30C0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_23C1FBB4C();
  *a1 = result;
  return result;
}

uint64_t sub_23C1E30FC@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  char v4;
  uint64_t v5;

  type metadata accessor for MarketingActionItem();
  sub_23C1CA840();
  swift_bridgeObjectRetain();
  result = sub_23C1FB9C0();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = v4 & 1;
  *(_QWORD *)(a1 + 24) = v5;
  return result;
}

BOOL static MarketingButtonStyle.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t MarketingButtonStyle.hash(into:)()
{
  return sub_23C1FBFD8();
}

uint64_t MarketingButtonStyle.hashValue.getter()
{
  sub_23C1FBFCC();
  sub_23C1FBFD8();
  return sub_23C1FBFFC();
}

unint64_t sub_23C1E3200()
{
  unint64_t result;

  result = qword_256B42270;
  if (!qword_256B42270)
  {
    result = MEMORY[0x242619B10](&protocol conformance descriptor for MarketingButtonStyle, &type metadata for MarketingButtonStyle);
    atomic_store(result, (unint64_t *)&qword_256B42270);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for MarketingButtonStyle(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C1E3290 + 4 * byte_23C201235[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C1E32C4 + 4 * byte_23C201230[v4]))();
}

uint64_t sub_23C1E32C4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1E32CC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C1E32D4);
  return result;
}

uint64_t sub_23C1E32E0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C1E32E8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C1E32EC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1E32F4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MarketingButtonStyle()
{
  return &type metadata for MarketingButtonStyle;
}

uint64_t sub_23C1E3310()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23C1E3334()
{
  return sub_23C1FBB58();
}

unint64_t sub_23C1E3398()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256B41808;
  if (!qword_256B41808)
  {
    v1 = sub_23C1FB5DC();
    result = MEMORY[0x242619B10](MEMORY[0x24BDECF78], v1);
    atomic_store(result, (unint64_t *)&qword_256B41808);
  }
  return result;
}

unint64_t sub_23C1E33E0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_256B422D8;
  if (!qword_256B422D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B422D0);
    v2 = sub_23C1BC328(&qword_256B41778, &qword_256B41780, MEMORY[0x24BDF1028]);
    v3[0] = MEMORY[0x24BDF1F80];
    v3[1] = v2;
    result = MEMORY[0x242619B10](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256B422D8);
  }
  return result;
}

unint64_t sub_23C1E3474()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[2];

  result = qword_256B42328;
  if (!qword_256B42328)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B42320);
    v2 = sub_23C1E34E0();
    v3[0] = MEMORY[0x24BDF5560];
    v3[1] = v2;
    result = MEMORY[0x242619B10](MEMORY[0x24BDEF3E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256B42328);
  }
  return result;
}

unint64_t sub_23C1E34E0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256B42330;
  if (!qword_256B42330)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41F18);
    v2[0] = sub_23C1E3564();
    v2[1] = sub_23C1BC328(&qword_256B42340, &qword_256B42348, MEMORY[0x24BDF0710]);
    result = MEMORY[0x242619B10](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256B42330);
  }
  return result;
}

unint64_t sub_23C1E3564()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[6];

  result = qword_256B42338;
  if (!qword_256B42338)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41F10);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41760);
    v3 = sub_23C1BC328(&qword_256B41788, &qword_256B41760, MEMORY[0x24BEE30C8]);
    v4[2] = MEMORY[0x24BDF1FA8];
    v4[3] = v2;
    v4[4] = MEMORY[0x24BDF1F80];
    v4[5] = v3;
    v4[0] = swift_getOpaqueTypeConformance2();
    v4[1] = sub_23C1BC328(&qword_256B41790, &qword_256B41798, MEMORY[0x24BDF1028]);
    result = MEMORY[0x242619B10](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_256B42338);
  }
  return result;
}

uint64_t sub_23C1E3644()
{
  return sub_23C1FBB58();
}

uint64_t sub_23C1E36A0()
{
  return sub_23C1FBB58();
}

uint64_t sub_23C1E36FC@<X0>(uint64_t a1@<X8>)
{
  return sub_23C1E30FC(a1);
}

BOOL static MarketingButtonLayout.HorizontalAlignment.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t MarketingButtonLayout.HorizontalAlignment.hash(into:)()
{
  return sub_23C1FBFD8();
}

uint64_t sub_23C1E3760()
{
  sub_23C1E3C08();
  return sub_23C1FC020();
}

uint64_t sub_23C1E3788()
{
  sub_23C1E3C08();
  return sub_23C1FC02C();
}

uint64_t sub_23C1E37B0()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x7265746E6563;
  if (*v0 != 1)
    v1 = 0x676E696C69617274;
  if (*v0)
    return v1;
  else
    return 0x676E696461656CLL;
}

uint64_t sub_23C1E3808@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C1E7CF0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C1E382C()
{
  sub_23C1E3B80();
  return sub_23C1FC020();
}

uint64_t sub_23C1E3854()
{
  sub_23C1E3B80();
  return sub_23C1FC02C();
}

uint64_t sub_23C1E387C()
{
  sub_23C1E3C4C();
  return sub_23C1FC020();
}

uint64_t sub_23C1E38A4()
{
  sub_23C1E3C4C();
  return sub_23C1FC02C();
}

uint64_t sub_23C1E38CC()
{
  sub_23C1E3BC4();
  return sub_23C1FC020();
}

uint64_t sub_23C1E38F4()
{
  sub_23C1E3BC4();
  return sub_23C1FC02C();
}

uint64_t MarketingButtonLayout.HorizontalAlignment.encode(to:)(_QWORD *a1)
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
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42378);
  v22 = *(_QWORD *)(v4 - 8);
  v23 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v21 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42380);
  v19 = *(_QWORD *)(v6 - 8);
  v20 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42388);
  v9 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42390);
  v24 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *v2;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C1E3B80();
  sub_23C1FC014();
  if (v15)
  {
    if (v15 == 1)
    {
      v26 = 1;
      sub_23C1E3C08();
      sub_23C1FBF30();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v8, v20);
    }
    else
    {
      v27 = 2;
      sub_23C1E3BC4();
      v16 = v21;
      sub_23C1FBF30();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v16, v23);
    }
  }
  else
  {
    v25 = 0;
    sub_23C1E3C4C();
    sub_23C1FBF30();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v18);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v14, v12);
}

unint64_t sub_23C1E3B80()
{
  unint64_t result;

  result = qword_256B42398;
  if (!qword_256B42398)
  {
    result = MEMORY[0x242619B10](&unk_23C201D84, &type metadata for MarketingButtonLayout.HorizontalAlignment.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B42398);
  }
  return result;
}

unint64_t sub_23C1E3BC4()
{
  unint64_t result;

  result = qword_256B423A0;
  if (!qword_256B423A0)
  {
    result = MEMORY[0x242619B10](&unk_23C201D34, &type metadata for MarketingButtonLayout.HorizontalAlignment.TrailingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B423A0);
  }
  return result;
}

unint64_t sub_23C1E3C08()
{
  unint64_t result;

  result = qword_256B423A8;
  if (!qword_256B423A8)
  {
    result = MEMORY[0x242619B10](&unk_23C201CE4, &type metadata for MarketingButtonLayout.HorizontalAlignment.CenterCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B423A8);
  }
  return result;
}

unint64_t sub_23C1E3C4C()
{
  unint64_t result;

  result = qword_256B423B0;
  if (!qword_256B423B0)
  {
    result = MEMORY[0x242619B10](&unk_23C201C94, &type metadata for MarketingButtonLayout.HorizontalAlignment.LeadingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B423B0);
  }
  return result;
}

uint64_t MarketingButtonLayout.HorizontalAlignment.hashValue.getter()
{
  sub_23C1FBFCC();
  sub_23C1FBFD8();
  return sub_23C1FBFFC();
}

uint64_t MarketingButtonLayout.HorizontalAlignment.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
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
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B423B8);
  v34 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v37);
  v40 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B423C0);
  v35 = *(_QWORD *)(v4 - 8);
  v36 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v39 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B423C8);
  v6 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B423D0);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C1E3B80();
  v13 = v41;
  sub_23C1FC008();
  if (v13)
    goto LABEL_7;
  v31 = v6;
  v32 = v10;
  v14 = v39;
  v15 = v40;
  v41 = a1;
  v16 = v12;
  v17 = sub_23C1FBF24();
  v18 = v9;
  if (*(_QWORD *)(v17 + 16) != 1)
  {
    v23 = sub_23C1FBE58();
    swift_allocError();
    v25 = v24;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B40A48);
    *v25 = &type metadata for MarketingButtonLayout.HorizontalAlignment;
    sub_23C1FBED0();
    sub_23C1FBE4C();
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
      sub_23C1E3C08();
      v20 = v9;
      sub_23C1FBEC4();
      v21 = v38;
      v22 = v32;
      (*(void (**)(char *, uint64_t))(v35 + 8))(v14, v36);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v16, v20);
    }
    else
    {
      v44 = 2;
      sub_23C1E3BC4();
      v28 = v15;
      sub_23C1FBEC4();
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
    sub_23C1E3C4C();
    sub_23C1FBEC4();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v8, v33);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v16, v9);
    v21 = v38;
  }
  *v21 = v19;
  v26 = (uint64_t)v41;
  return __swift_destroy_boxed_opaque_existential_1(v26);
}

uint64_t sub_23C1E4118@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return MarketingButtonLayout.HorizontalAlignment.init(from:)(a1, a2);
}

uint64_t sub_23C1E412C(_QWORD *a1)
{
  return MarketingButtonLayout.HorizontalAlignment.encode(to:)(a1);
}

_BYTE *MarketingButtonLayout.init(buttonAlignment:footnoteLineLimit:footnoteOffset:labelMaxWidth:)@<X0>(_BYTE *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>, double a6@<D0>)
{
  *(_BYTE *)a5 = *result;
  *(_QWORD *)(a5 + 8) = a2;
  *(double *)(a5 + 16) = a6;
  *(_QWORD *)(a5 + 24) = a3;
  *(_BYTE *)(a5 + 32) = a4 & 1;
  return result;
}

void static MarketingButtonLayout.default.getter(uint64_t a1@<X8>)
{
  *(_BYTE *)a1 = 1;
  *(_QWORD *)(a1 + 8) = 2;
  *(_QWORD *)(a1 + 16) = 0x4024000000000000;
  *(_QWORD *)(a1 + 24) = 0x7FF0000000000000;
  *(_BYTE *)(a1 + 32) = 0;
}

uint64_t MarketingButtonLayout.hash(into:)()
{
  uint64_t v0;
  int v1;

  v1 = *(unsigned __int8 *)(v0 + 32);
  sub_23C1FBFD8();
  sub_23C1FBFD8();
  sub_23C1FBFF0();
  if (v1 == 1)
    return sub_23C1FBFE4();
  sub_23C1FBFE4();
  return sub_23C1FBFF0();
}

uint64_t sub_23C1E4208()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23C1E4244 + 4 * byte_23C201360[*v0]))(0x6C416E6F74747562, 0xEF746E656D6E6769);
}

unint64_t sub_23C1E4244()
{
  return 0xD000000000000011;
}

uint64_t sub_23C1E4260()
{
  return 0x65746F6E746F6F66;
}

uint64_t sub_23C1E4284()
{
  return 0x78614D6C6562616CLL;
}

uint64_t sub_23C1E42A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C1E7E3C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C1E42CC()
{
  sub_23C1E5E0C();
  return sub_23C1FC020();
}

uint64_t sub_23C1E42F4()
{
  sub_23C1E5E0C();
  return sub_23C1FC02C();
}

uint64_t MarketingButtonLayout.encode(to:)(_QWORD *a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B423D8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v9 = *((_QWORD *)v1 + 1);
  v10 = *((_QWORD *)v1 + 2);
  v17 = *((_QWORD *)v1 + 3);
  v18 = v9;
  v16 = v1[32];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C1E5E0C();
  sub_23C1FC014();
  LOBYTE(v19) = v8;
  v21 = 0;
  sub_23C1E5E50();
  sub_23C1FBF78();
  if (v2)
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v12 = v16;
  v13 = v5;
  v14 = v17;
  LOBYTE(v19) = 1;
  sub_23C1FBF6C();
  v19 = v10;
  v21 = 2;
  sub_23C1E5E94();
  sub_23C1FBF78();
  v19 = v14;
  v20 = v12;
  v21 = 3;
  sub_23C1FBF48();
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v7, v4);
}

uint64_t MarketingButtonLayout.hashValue.getter()
{
  sub_23C1FBFCC();
  MarketingButtonLayout.hash(into:)();
  return sub_23C1FBFFC();
}

uint64_t MarketingButtonLayout.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  char v18;
  char v19;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B423F8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C1E5E0C();
  sub_23C1FC008();
  if (!v2)
  {
    v19 = 0;
    sub_23C1E5ED8();
    sub_23C1FBF18();
    v9 = v17;
    LOBYTE(v17) = 1;
    v10 = sub_23C1FBF0C();
    v16 = v9;
    v19 = 2;
    sub_23C1E5F1C();
    sub_23C1FBF18();
    v12 = v17;
    v19 = 3;
    sub_23C1FBEE8();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v13 = v17;
    v14 = v18;
    *(_BYTE *)a2 = v16;
    *(_QWORD *)(a2 + 8) = v10;
    *(_QWORD *)(a2 + 16) = v12;
    *(_QWORD *)(a2 + 24) = v13;
    *(_BYTE *)(a2 + 32) = v14;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_23C1E4768@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return MarketingButtonLayout.init(from:)(a1, a2);
}

uint64_t sub_23C1E477C(_QWORD *a1)
{
  return MarketingButtonLayout.encode(to:)(a1);
}

uint64_t sub_23C1E4790()
{
  sub_23C1FBFCC();
  MarketingButtonLayout.hash(into:)();
  return sub_23C1FBFFC();
}

uint64_t sub_23C1E47FC()
{
  sub_23C1FBFCC();
  MarketingButtonLayout.hash(into:)();
  return sub_23C1FBFFC();
}

uint64_t MarketingButtonState.loadState.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for MarketingButtonState() + 44);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41518);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t MarketingButtonState.loadState.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for MarketingButtonState() + 44);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41518);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
}

uint64_t (*MarketingButtonState.loadState.modify())()
{
  type metadata accessor for MarketingButtonState();
  return nullsub_1;
}

uint64_t MarketingButtonState.init(layout:locale:placement:platform:isLocalAccount:isAppleAccountAvailable:isSupportedDeviceOwner:loadState:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, char a4@<W3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  int *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;

  v14 = *(_QWORD *)(a1 + 8);
  v15 = *(_QWORD *)(a1 + 16);
  v16 = *(_QWORD *)(a1 + 24);
  v17 = *(_BYTE *)(a1 + 32);
  v18 = *a3;
  v19 = *((_QWORD *)a3 + 1);
  v20 = *((_QWORD *)a3 + 2);
  *(_BYTE *)a9 = *(_BYTE *)a1;
  *(_QWORD *)(a9 + 8) = v14;
  *(_QWORD *)(a9 + 16) = v15;
  *(_QWORD *)(a9 + 24) = v16;
  *(_BYTE *)(a9 + 32) = v17;
  v21 = (int *)type metadata accessor for MarketingButtonState();
  v22 = a9 + v21[5];
  v23 = sub_23C1FB4B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 32))(v22, a2, v23);
  v24 = a9 + v21[6];
  *(_BYTE *)v24 = v18;
  *(_QWORD *)(v24 + 8) = v19;
  *(_QWORD *)(v24 + 16) = v20;
  *(_BYTE *)(a9 + v21[7]) = a4;
  v25 = a9 + v21[9];
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41440);
  v27 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 32);
  v27(v25, a6, v26);
  *(_BYTE *)(a9 + v21[8]) = a5;
  v27(a9 + v21[10], a7, v26);
  v28 = a9 + v21[11];
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41518);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 32))(v28, a8, v29);
}

uint64_t MarketingButtonState.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  MarketingButtonLayout.hash(into:)();
  v1 = type metadata accessor for MarketingButtonState();
  sub_23C1FB4B0();
  sub_23C1B56F4(&qword_256B42410, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], MEMORY[0x24BDCEED0]);
  sub_23C1FBC90();
  v2 = v0 + *(int *)(v1 + 24);
  v3 = *(_QWORD *)(v2 + 16);
  MarketingOfferPlacement.rawValue.getter(*(_BYTE *)v2);
  swift_bridgeObjectRetain();
  sub_23C1FBCF0();
  swift_bridgeObjectRelease();
  sub_23C1FBFE4();
  if (v3)
  {
    swift_bridgeObjectRetain();
    sub_23C1FBCF0();
    swift_bridgeObjectRelease_n();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  sub_23C1FBFD8();
  sub_23C1FBFE4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B41440);
  sub_23C1E5F9C();
  sub_23C1FBC90();
  sub_23C1FBC90();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B41518);
  sub_23C1E5FF8();
  return sub_23C1FBC90();
}

uint64_t sub_23C1E4C44(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23C1E4C74 + 4 * byte_23C201364[a1]))(0x74756F79616CLL, 0xE600000000000000);
}

uint64_t sub_23C1E4C74()
{
  return 0x656C61636F6CLL;
}

uint64_t sub_23C1E4C84()
{
  return 0x6E656D6563616C70;
}

uint64_t sub_23C1E4CA4()
{
  return 0x6D726F6674616C70;
}

uint64_t sub_23C1E4CBC()
{
  return 0x416C61636F4C7369;
}

unint64_t sub_23C1E4CE0()
{
  return 0xD000000000000017;
}

unint64_t sub_23C1E4D00()
{
  return 0xD000000000000016;
}

uint64_t sub_23C1E4D1C()
{
  return 0x7461745364616F6CLL;
}

uint64_t sub_23C1E4D38()
{
  unsigned __int8 *v0;

  return sub_23C1E4C44(*v0);
}

uint64_t sub_23C1E4D40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C1E8058(a1, a2);
  *a3 = result;
  return result;
}

void sub_23C1E4D64(_BYTE *a1@<X8>)
{
  *a1 = 8;
}

uint64_t sub_23C1E4D70()
{
  sub_23C1E6330();
  return sub_23C1FC020();
}

uint64_t sub_23C1E4D98()
{
  sub_23C1E6330();
  return sub_23C1FC02C();
}

uint64_t MarketingButtonState.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  char v17;
  __int128 v18;
  uint64_t v19;
  char v20;
  char v21;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42430);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C1E6330();
  sub_23C1FC014();
  v9 = *(_QWORD *)(v3 + 8);
  v10 = *(_QWORD *)(v3 + 16);
  v11 = *(_QWORD *)(v3 + 24);
  v12 = *(_BYTE *)(v3 + 32);
  v17 = *(_BYTE *)v3;
  *(_QWORD *)&v18 = v9;
  *((_QWORD *)&v18 + 1) = v10;
  v19 = v11;
  v20 = v12;
  v21 = 0;
  sub_23C1E6374();
  sub_23C1FBF78();
  if (!v2)
  {
    v13 = type metadata accessor for MarketingButtonState();
    v17 = 1;
    sub_23C1FB4B0();
    sub_23C1B56F4(&qword_256B42448, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], MEMORY[0x24BDCEEC8]);
    sub_23C1FBF78();
    v14 = v3 + *(int *)(v13 + 24);
    v17 = *(_BYTE *)v14;
    v18 = *(_OWORD *)(v14 + 8);
    v21 = 2;
    sub_23C1E63B8();
    sub_23C1FBF78();
    v17 = *(_BYTE *)(v3 + *(int *)(v13 + 28));
    v21 = 3;
    sub_23C1C4DC8();
    sub_23C1FBF78();
    v17 = 4;
    sub_23C1FBF60();
    v17 = 5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B41440);
    sub_23C1E6484(&qword_256B42458, MEMORY[0x24BE2B3F8]);
    sub_23C1FBF78();
    v17 = 6;
    sub_23C1FBF78();
    v17 = 7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B41518);
    sub_23C1E64E8(&qword_256B42460, MEMORY[0x24BE2B3F8]);
    sub_23C1FBF78();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t MarketingButtonState.hashValue.getter()
{
  sub_23C1FBFCC();
  MarketingButtonState.hash(into:)();
  return sub_23C1FBFFC();
}

uint64_t MarketingButtonState.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  char v22;
  char *v23;
  uint64_t v24;
  int *v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  char *v30;
  void (*v31)(uint64_t, char *, uint64_t);
  char *v32;
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  char *v52;
  int *v53;
  char v54;
  __int128 v55;
  uint64_t v56;
  char v57;
  char v58;

  v42 = a2;
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41518);
  v41 = *(_QWORD *)(v43 - 8);
  MEMORY[0x24BDAC7A8](v43);
  v44 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41440);
  v47 = *(_QWORD *)(v50 - 8);
  v4 = MEMORY[0x24BDAC7A8](v50);
  v6 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v38 - v7;
  v9 = sub_23C1FB4B0();
  v48 = *(_QWORD *)(v9 - 8);
  v49 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42478);
  v12 = *(_QWORD *)(v45 - 8);
  MEMORY[0x24BDAC7A8](v45);
  v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = (int *)type metadata accessor for MarketingButtonState();
  MEMORY[0x24BDAC7A8](v53);
  v16 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = a1[3];
  v51 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v17);
  sub_23C1E6330();
  v46 = v14;
  v18 = v52;
  sub_23C1FC008();
  if (v18)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
  v52 = v8;
  v40 = v6;
  v58 = 0;
  sub_23C1E63FC();
  v19 = v45;
  sub_23C1FBF18();
  v20 = v55;
  v21 = v56;
  v22 = v57;
  v23 = v16;
  *v16 = v54;
  *(_OWORD *)(v16 + 8) = v20;
  *((_QWORD *)v16 + 3) = v21;
  v16[32] = v22;
  v54 = 1;
  sub_23C1B56F4(&qword_256B42488, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], MEMORY[0x24BDCEEE8]);
  v24 = v49;
  sub_23C1FBF18();
  v25 = v53;
  (*(void (**)(char *, char *, uint64_t))(v48 + 32))(&v23[v53[5]], v11, v24);
  v58 = 2;
  sub_23C1E6440();
  sub_23C1FBF18();
  v26 = (uint64_t)v51;
  v27 = &v23[v25[6]];
  *v27 = v54;
  *(_OWORD *)(v27 + 8) = v55;
  v58 = 3;
  sub_23C1C4EB8();
  sub_23C1FBF18();
  v23[v25[7]] = v54;
  v54 = 4;
  v23[v25[8]] = sub_23C1FBF00() & 1;
  v54 = 5;
  sub_23C1E6484(&qword_256B42498, MEMORY[0x24BE2B410]);
  v28 = v52;
  v39 = (uint64_t)v23;
  v29 = v50;
  sub_23C1FBF18();
  v30 = v28;
  v31 = *(void (**)(uint64_t, char *, uint64_t))(v47 + 32);
  v31(v39 + v25[9], v30, v29);
  v54 = 6;
  v32 = v40;
  v33 = v46;
  sub_23C1FBF18();
  v31(v39 + v53[10], v32, v29);
  v54 = 7;
  sub_23C1E64E8(&qword_256B424A0, MEMORY[0x24BE2B410]);
  v34 = v43;
  v35 = v44;
  sub_23C1FBF18();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v33, v19);
  v36 = v39;
  (*(void (**)(uint64_t, char *, uint64_t))(v41 + 32))(v39 + v53[11], v35, v34);
  sub_23C1E658C(v36, v42);
  __swift_destroy_boxed_opaque_existential_1(v26);
  return sub_23C1E65D0(v36);
}

uint64_t sub_23C1E57D8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return MarketingButtonState.init(from:)(a1, a2);
}

uint64_t sub_23C1E57EC(_QWORD *a1)
{
  return MarketingButtonState.encode(to:)(a1);
}

uint64_t sub_23C1E5800()
{
  sub_23C1FBFCC();
  MarketingButtonState.hash(into:)();
  return sub_23C1FBFFC();
}

uint64_t sub_23C1E5840()
{
  sub_23C1FBFCC();
  MarketingButtonState.hash(into:)();
  return sub_23C1FBFFC();
}

FitnessMarketing::MarketingActionButtonLocalState __swiftcall MarketingActionButtonLocalState.init(isShowingServiceSubscriptionHandoff:isShowingNoSupportedDeviceAlert:)(Swift::Bool isShowingServiceSubscriptionHandoff, Swift::Bool isShowingNoSupportedDeviceAlert)
{
  Swift::Bool *v2;
  FitnessMarketing::MarketingActionButtonLocalState result;

  *v2 = isShowingServiceSubscriptionHandoff;
  v2[1] = isShowingNoSupportedDeviceAlert;
  result.isShowingServiceSubscriptionHandoff = isShowingServiceSubscriptionHandoff;
  return result;
}

uint64_t MarketingActionButtonLocalState.hash(into:)()
{
  sub_23C1FBFE4();
  return sub_23C1FBFE4();
}

BOOL static MarketingActionButtonLocalState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2 | a2[1] ^ a1[1]) & 1) == 0;
}

unint64_t sub_23C1E58EC()
{
  _BYTE *v0;

  if (*v0)
    return 0xD00000000000001FLL;
  else
    return 0xD000000000000023;
}

uint64_t sub_23C1E592C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C1E83AC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C1E5950()
{
  sub_23C1E660C();
  return sub_23C1FC020();
}

uint64_t sub_23C1E5978()
{
  sub_23C1E660C();
  return sub_23C1FC02C();
}

uint64_t MarketingActionButtonLocalState.encode(to:)(_QWORD *a1)
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

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B424A8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(unsigned __int8 *)(v1 + 1);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C1E660C();
  sub_23C1FC014();
  v12 = 0;
  sub_23C1FBF60();
  if (!v2)
  {
    v11 = 1;
    sub_23C1FBF60();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t MarketingActionButtonLocalState.hashValue.getter()
{
  sub_23C1FBFCC();
  sub_23C1FBFE4();
  sub_23C1FBFE4();
  return sub_23C1FBFFC();
}

uint64_t MarketingActionButtonLocalState.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
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

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B424B8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C1E660C();
  sub_23C1FC008();
  if (!v2)
  {
    v14 = 0;
    v9 = sub_23C1FBF00();
    v13 = 1;
    v10 = sub_23C1FBF00();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9 & 1;
    a2[1] = v10 & 1;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_23C1E5C70@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return MarketingActionButtonLocalState.init(from:)(a1, a2);
}

uint64_t sub_23C1E5C84(_QWORD *a1)
{
  return MarketingActionButtonLocalState.encode(to:)(a1);
}

uint64_t sub_23C1E5C98()
{
  sub_23C1FBFCC();
  sub_23C1FBFE4();
  sub_23C1FBFE4();
  return sub_23C1FBFFC();
}

uint64_t sub_23C1E5CF4()
{
  sub_23C1FBFE4();
  return sub_23C1FBFE4();
}

uint64_t sub_23C1E5D30()
{
  sub_23C1FBFCC();
  sub_23C1FBFE4();
  sub_23C1FBFE4();
  return sub_23C1FBFFC();
}

BOOL sub_23C1E5D88(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2 | a2[1] ^ a1[1]) & 1) == 0;
}

uint64_t _s16FitnessMarketing0B12ButtonLayoutV2eeoiySbAC_ACtFZ_0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  char v4;

  if (*a1 != *a2 || *((_QWORD *)a1 + 1) != *((_QWORD *)a2 + 1) || *((double *)a1 + 2) != *((double *)a2 + 2))
    return 0;
  v4 = a2[32];
  if ((a1[32] & 1) != 0)
  {
    if ((a2[32] & 1) == 0)
      return 0;
  }
  else
  {
    if (*((double *)a1 + 3) != *((double *)a2 + 3))
      v4 = 1;
    if ((v4 & 1) != 0)
      return 0;
  }
  return 1;
}

unint64_t sub_23C1E5E0C()
{
  unint64_t result;

  result = qword_256B423E0;
  if (!qword_256B423E0)
  {
    result = MEMORY[0x242619B10](&unk_23C201C44, &type metadata for MarketingButtonLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B423E0);
  }
  return result;
}

unint64_t sub_23C1E5E50()
{
  unint64_t result;

  result = qword_256B423E8;
  if (!qword_256B423E8)
  {
    result = MEMORY[0x242619B10](&protocol conformance descriptor for MarketingButtonLayout.HorizontalAlignment, &type metadata for MarketingButtonLayout.HorizontalAlignment);
    atomic_store(result, (unint64_t *)&qword_256B423E8);
  }
  return result;
}

unint64_t sub_23C1E5E94()
{
  unint64_t result;

  result = qword_256B423F0;
  if (!qword_256B423F0)
  {
    result = MEMORY[0x242619B10](MEMORY[0x24BEE50C0], MEMORY[0x24BEE50B0]);
    atomic_store(result, (unint64_t *)&qword_256B423F0);
  }
  return result;
}

unint64_t sub_23C1E5ED8()
{
  unint64_t result;

  result = qword_256B42400;
  if (!qword_256B42400)
  {
    result = MEMORY[0x242619B10](&protocol conformance descriptor for MarketingButtonLayout.HorizontalAlignment, &type metadata for MarketingButtonLayout.HorizontalAlignment);
    atomic_store(result, (unint64_t *)&qword_256B42400);
  }
  return result;
}

unint64_t sub_23C1E5F1C()
{
  unint64_t result;

  result = qword_256B42408;
  if (!qword_256B42408)
  {
    result = MEMORY[0x242619B10](MEMORY[0x24BEE50E8], MEMORY[0x24BEE50B0]);
    atomic_store(result, (unint64_t *)&qword_256B42408);
  }
  return result;
}

uint64_t type metadata accessor for MarketingButtonState()
{
  uint64_t result;

  result = qword_256B42538;
  if (!qword_256B42538)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_23C1E5F9C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_256B42418;
  if (!qword_256B42418)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41440);
    v2 = MEMORY[0x24BEE1338];
    result = MEMORY[0x242619B10](MEMORY[0x24BE2B400], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_256B42418);
  }
  return result;
}

unint64_t sub_23C1E5FF8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_256B42420;
  if (!qword_256B42420)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41518);
    v2 = sub_23C1B56F4(&qword_256B42428, (uint64_t (*)(uint64_t))type metadata accessor for MarketingOffer, (uint64_t)&protocol conformance descriptor for MarketingOffer);
    result = MEMORY[0x242619B10](MEMORY[0x24BE2B400], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_256B42420);
  }
  return result;
}

uint64_t _s16FitnessMarketing0B11ButtonStateV2eeoiySbAC_ACtFZ_0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  char v6;
  int *v7;
  uint64_t v8;
  unsigned __int8 *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v21;
  char v22;

  if (*a1 != *a2 || *((_QWORD *)a1 + 1) != *((_QWORD *)a2 + 1) || *((double *)a1 + 2) != *((double *)a2 + 2))
    return 0;
  v6 = a2[32];
  if ((a1[32] & 1) != 0)
  {
    if (!a2[32])
      return 0;
  }
  else
  {
    if (*((double *)a1 + 3) != *((double *)a2 + 3))
      v6 = 1;
    if ((v6 & 1) != 0)
      return 0;
  }
  v7 = (int *)type metadata accessor for MarketingButtonState();
  if ((MEMORY[0x242618B74](&a1[v7[5]], &a2[v7[5]]) & 1) != 0)
  {
    v8 = v7[6];
    v9 = &a1[v8];
    v11 = *(_QWORD *)&a1[v8 + 8];
    v10 = *(_QWORD *)&a1[v8 + 16];
    v12 = &a2[v8];
    v14 = *((_QWORD *)v12 + 1);
    v13 = *((_QWORD *)v12 + 2);
    v15 = *v12;
    v16 = MarketingOfferPlacement.rawValue.getter(*v9);
    v18 = v17;
    if (v16 == MarketingOfferPlacement.rawValue.getter(v15) && v18 == v19)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease_n();
    }
    else
    {
      v21 = sub_23C1FBF90();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v21 & 1) == 0)
      {
        swift_bridgeObjectRelease();
LABEL_29:
        swift_bridgeObjectRelease();
        return 0;
      }
    }
    if (v10)
    {
      if (!v13)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return 0;
      }
      if (v11 != v14 || v10 != v13)
      {
        v22 = sub_23C1FBF90();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v22 & 1) == 0)
          return 0;
        goto LABEL_34;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      if (v13)
        goto LABEL_29;
    }
    swift_bridgeObjectRelease();
LABEL_34:
    if (a1[v7[7]] == a2[v7[7]] && a1[v7[8]] == a2[v7[8]] && (sub_23C1FBC18() & 1) != 0 && (sub_23C1FBC18() & 1) != 0)
    {
      type metadata accessor for MarketingOffer();
      sub_23C1B56F4(&qword_256B40BD8, (uint64_t (*)(uint64_t))type metadata accessor for MarketingOffer, (uint64_t)&protocol conformance descriptor for MarketingOffer);
      return sub_23C1FBC18();
    }
  }
  return 0;
}

unint64_t sub_23C1E6330()
{
  unint64_t result;

  result = qword_256B42438;
  if (!qword_256B42438)
  {
    result = MEMORY[0x242619B10](&unk_23C201BF4, &type metadata for MarketingButtonState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B42438);
  }
  return result;
}

unint64_t sub_23C1E6374()
{
  unint64_t result;

  result = qword_256B42440;
  if (!qword_256B42440)
  {
    result = MEMORY[0x242619B10](&protocol conformance descriptor for MarketingButtonLayout, &type metadata for MarketingButtonLayout);
    atomic_store(result, (unint64_t *)&qword_256B42440);
  }
  return result;
}

unint64_t sub_23C1E63B8()
{
  unint64_t result;

  result = qword_256B42450;
  if (!qword_256B42450)
  {
    result = MEMORY[0x242619B10](&protocol conformance descriptor for MarketingPlacement, &type metadata for MarketingPlacement);
    atomic_store(result, (unint64_t *)&qword_256B42450);
  }
  return result;
}

unint64_t sub_23C1E63FC()
{
  unint64_t result;

  result = qword_256B42480;
  if (!qword_256B42480)
  {
    result = MEMORY[0x242619B10](&protocol conformance descriptor for MarketingButtonLayout, &type metadata for MarketingButtonLayout);
    atomic_store(result, (unint64_t *)&qword_256B42480);
  }
  return result;
}

unint64_t sub_23C1E6440()
{
  unint64_t result;

  result = qword_256B42490;
  if (!qword_256B42490)
  {
    result = MEMORY[0x242619B10](&protocol conformance descriptor for MarketingPlacement, &type metadata for MarketingPlacement);
    atomic_store(result, (unint64_t *)&qword_256B42490);
  }
  return result;
}

uint64_t sub_23C1E6484(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  _QWORD v6[2];

  result = *a1;
  if (!result)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41440);
    v6[0] = MEMORY[0x24BEE1348];
    v6[1] = MEMORY[0x24BEE1330];
    result = MEMORY[0x242619B10](a2, v5, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23C1E64E8(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  _QWORD v6[2];

  result = *a1;
  if (!result)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41518);
    v6[0] = sub_23C1B56F4(&qword_256B42468, (uint64_t (*)(uint64_t))type metadata accessor for MarketingOffer, (uint64_t)&protocol conformance descriptor for MarketingOffer);
    v6[1] = sub_23C1B56F4(&qword_256B42470, (uint64_t (*)(uint64_t))type metadata accessor for MarketingOffer, (uint64_t)&protocol conformance descriptor for MarketingOffer);
    result = MEMORY[0x242619B10](a2, v5, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23C1E658C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MarketingButtonState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23C1E65D0(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for MarketingButtonState();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23C1E660C()
{
  unint64_t result;

  result = qword_256B424B0;
  if (!qword_256B424B0)
  {
    result = MEMORY[0x242619B10](&unk_23C201BA4, &type metadata for MarketingActionButtonLocalState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B424B0);
  }
  return result;
}

unint64_t sub_23C1E6654()
{
  unint64_t result;

  result = qword_256B424C0;
  if (!qword_256B424C0)
  {
    result = MEMORY[0x242619B10](&protocol conformance descriptor for MarketingButtonLayout.HorizontalAlignment, &type metadata for MarketingButtonLayout.HorizontalAlignment);
    atomic_store(result, (unint64_t *)&qword_256B424C0);
  }
  return result;
}

unint64_t sub_23C1E669C()
{
  unint64_t result;

  result = qword_256B424C8;
  if (!qword_256B424C8)
  {
    result = MEMORY[0x242619B10](&protocol conformance descriptor for MarketingButtonLayout, &type metadata for MarketingButtonLayout);
    atomic_store(result, (unint64_t *)&qword_256B424C8);
  }
  return result;
}

uint64_t sub_23C1E66E0()
{
  return sub_23C1B56F4(&qword_256B424D0, (uint64_t (*)(uint64_t))type metadata accessor for MarketingButtonState, (uint64_t)&protocol conformance descriptor for MarketingButtonState);
}

unint64_t sub_23C1E6710()
{
  unint64_t result;

  result = qword_256B424D8;
  if (!qword_256B424D8)
  {
    result = MEMORY[0x242619B10](&protocol conformance descriptor for MarketingActionButtonLocalState, &type metadata for MarketingActionButtonLocalState);
    atomic_store(result, (unint64_t *)&qword_256B424D8);
  }
  return result;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for MarketingButtonLayout(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && a1[33])
    return (*(_DWORD *)a1 + 254);
  v3 = *a1;
  v4 = v3 >= 3;
  v5 = v3 - 3;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for MarketingButtonLayout(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 254;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 2;
  }
  return result;
}

ValueMetadata *type metadata accessor for MarketingButtonLayout()
{
  return &type metadata for MarketingButtonLayout;
}

ValueMetadata *type metadata accessor for MarketingButtonLayout.HorizontalAlignment()
{
  return &type metadata for MarketingButtonLayout.HorizontalAlignment;
}

_QWORD *initializeBufferWithCopyOfBuffer for MarketingButtonState(uint64_t a1, uint64_t *a2, int *a3)
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
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t, uint64_t);
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v26 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v26 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v7;
    *(_BYTE *)(a1 + 32) = *((_BYTE *)a2 + 32);
    v8 = a3[5];
    v9 = a1 + v8;
    v10 = (uint64_t)a2 + v8;
    v11 = sub_23C1FB4B0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    v12 = a3[6];
    v13 = a3[7];
    v14 = (char *)v4 + v12;
    v15 = (char *)a2 + v12;
    *v14 = *v15;
    v16 = *((_QWORD *)v15 + 2);
    *((_QWORD *)v14 + 1) = *((_QWORD *)v15 + 1);
    *((_QWORD *)v14 + 2) = v16;
    *((_BYTE *)v4 + v13) = *((_BYTE *)a2 + v13);
    v17 = a3[9];
    *((_BYTE *)v4 + a3[8]) = *((_BYTE *)a2 + a3[8]);
    v18 = (char *)v4 + v17;
    v19 = (uint64_t)a2 + v17;
    swift_bridgeObjectRetain();
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41440);
    v21 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 16);
    v21(v18, v19, v20);
    v21((char *)v4 + a3[10], (uint64_t)a2 + a3[10], v20);
    v22 = a3[11];
    v23 = (char *)v4 + v22;
    v24 = (uint64_t)a2 + v22;
    v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41518);
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 16))(v23, v24, v25);
  }
  return v4;
}

uint64_t destroy for MarketingButtonState(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;

  v4 = a1 + a2[5];
  v5 = sub_23C1FB4B0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  v6 = a1 + a2[9];
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41440);
  v8 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8);
  v8(v6, v7);
  v8(a1 + a2[10], v7);
  v9 = a1 + a2[11];
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41518);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
}

uint64_t initializeWithCopy for MarketingButtonState(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
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
  void (*v20)(uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23C1FB4B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  v11 = a3[6];
  v12 = a3[7];
  v13 = a1 + v11;
  v14 = a2 + v11;
  *(_BYTE *)v13 = *(_BYTE *)v14;
  v15 = *(_QWORD *)(v14 + 16);
  *(_QWORD *)(v13 + 8) = *(_QWORD *)(v14 + 8);
  *(_QWORD *)(v13 + 16) = v15;
  *(_BYTE *)(a1 + v12) = *(_BYTE *)(a2 + v12);
  v16 = a3[9];
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  v17 = a1 + v16;
  v18 = a2 + v16;
  swift_bridgeObjectRetain();
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41440);
  v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 16);
  v20(v17, v18, v19);
  v20(a1 + a3[10], a2 + a3[10], v19);
  v21 = a3[11];
  v22 = a1 + v21;
  v23 = a2 + v21;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41518);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(v22, v23, v24);
  return a1;
}

uint64_t assignWithCopy for MarketingButtonState(uint64_t a1, uint64_t a2, int *a3)
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
  void (*v18)(uint64_t, uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = v6;
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23C1FB4B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  v11 = a3[6];
  v12 = a1 + v11;
  v13 = a2 + v11;
  *(_BYTE *)v12 = *(_BYTE *)v13;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v13 + 8);
  *(_QWORD *)(v12 + 16) = *(_QWORD *)(v13 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  v14 = a3[9];
  v15 = a1 + v14;
  v16 = a2 + v14;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41440);
  v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 24);
  v18(v15, v16, v17);
  v18(a1 + a3[10], a2 + a3[10], v17);
  v19 = a3[11];
  v20 = a1 + v19;
  v21 = a2 + v19;
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41518);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 24))(v20, v21, v22);
  return a1;
}

uint64_t initializeWithTake for MarketingButtonState(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
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
  void (*v19)(uint64_t, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23C1FB4B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = a3[6];
  v12 = a3[7];
  v13 = a1 + v11;
  v14 = a2 + v11;
  *(_OWORD *)v13 = *(_OWORD *)v14;
  *(_QWORD *)(v13 + 16) = *(_QWORD *)(v14 + 16);
  *(_BYTE *)(a1 + v12) = *(_BYTE *)(a2 + v12);
  v15 = a3[9];
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  v16 = a1 + v15;
  v17 = a2 + v15;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41440);
  v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 32);
  v19(v16, v17, v18);
  v19(a1 + a3[10], a2 + a3[10], v18);
  v20 = a3[11];
  v21 = a1 + v20;
  v22 = a2 + v20;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41518);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 32))(v21, v22, v23);
  return a1;
}

uint64_t assignWithTake for MarketingButtonState(uint64_t a1, uint64_t a2, int *a3)
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
  void (*v20)(uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v6 = a3[5];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_23C1FB4B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  v10 = a3[6];
  v11 = a1 + v10;
  v12 = a2 + v10;
  *(_BYTE *)v11 = *(_BYTE *)v12;
  v14 = *(_QWORD *)(v12 + 8);
  v13 = *(_QWORD *)(v12 + 16);
  *(_QWORD *)(v11 + 8) = v14;
  *(_QWORD *)(v11 + 16) = v13;
  swift_bridgeObjectRelease();
  v15 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  *(_BYTE *)(a1 + v15) = *(_BYTE *)(a2 + v15);
  v16 = a3[9];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41440);
  v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 40);
  v20(v17, v18, v19);
  v20(a1 + a3[10], a2 + a3[10], v19);
  v21 = a3[11];
  v22 = a1 + v21;
  v23 = a2 + v21;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41518);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 40))(v22, v23, v24);
  return a1;
}

uint64_t getEnumTagSinglePayload for MarketingButtonState()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C1E6F1C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int v11;
  uint64_t v13;

  v6 = sub_23C1FB4B0();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = a3[5];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + v9, a2, v8);
  }
  if ((_DWORD)a2 != 2147483646)
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41440);
    v7 = *(_QWORD *)(v13 - 8);
    if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    {
      v8 = v13;
      v9 = a3[9];
    }
    else
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41518);
      v7 = *(_QWORD *)(v8 - 8);
      v9 = a3[11];
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + v9, a2, v8);
  }
  v10 = *(_QWORD *)(a1 + a3[6] + 16);
  if (v10 >= 0xFFFFFFFF)
    LODWORD(v10) = -1;
  v11 = v10 - 1;
  if (v11 < 0)
    v11 = -1;
  return (v11 + 1);
}

uint64_t storeEnumTagSinglePayload for MarketingButtonState()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C1E7008(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  result = sub_23C1FB4B0();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = a4[5];
  }
  else
  {
    if (a3 == 2147483646)
    {
      *(_QWORD *)(a1 + a4[6] + 16) = a2;
      return result;
    }
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41440);
    v9 = *(_QWORD *)(v12 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v12;
      v11 = a4[9];
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41518);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = a4[11];
    }
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + v11, a2, a2, v10);
}

void sub_23C1E70D8()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_23C1FB4B0();
  if (v0 <= 0x3F)
  {
    sub_23C1E71A0();
    if (v1 <= 0x3F)
    {
      sub_23C1E71FC();
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

void sub_23C1E71A0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256B42548)
  {
    v0 = sub_23C1FBC30();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256B42548);
  }
}

void sub_23C1E71FC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256B42550)
  {
    type metadata accessor for MarketingOffer();
    sub_23C1B56F4(&qword_256B40BD8, (uint64_t (*)(uint64_t))type metadata accessor for MarketingOffer, (uint64_t)&protocol conformance descriptor for MarketingOffer);
    v0 = sub_23C1FBC30();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256B42550);
  }
}

_WORD *__swift_memcpy2_1(_WORD *result, _WORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MarketingActionButtonLocalState(unsigned __int16 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for MarketingActionButtonLocalState(_WORD *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C1E7370 + 4 * byte_23C201371[v4]))();
  *a1 = a2 - 255;
  return ((uint64_t (*)(void))((char *)sub_23C1E73A4 + 4 * byte_23C20136C[v4]))();
}

uint64_t sub_23C1E73A4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 2) = v1;
  return result;
}

uint64_t sub_23C1E73AC(uint64_t result, int a2)
{
  *(_WORD *)(result + 2) = 0;
  if (a2)
    JUMPOUT(0x23C1E73B4);
  return result;
}

uint64_t sub_23C1E73C0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 2) = 0;
  if (!a2)
    JUMPOUT(0x23C1E73C8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C1E73CC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 2) = v1;
  return result;
}

uint64_t sub_23C1E73D4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 2) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MarketingActionButtonLocalState()
{
  return &type metadata for MarketingActionButtonLocalState;
}

uint64_t storeEnumTagSinglePayload for MarketingActionButtonLocalState.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C1E743C + 4 * byte_23C20137B[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C1E7470 + 4 * byte_23C201376[v4]))();
}

uint64_t sub_23C1E7470(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1E7478(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C1E7480);
  return result;
}

uint64_t sub_23C1E748C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C1E7494);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C1E7498(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1E74A0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MarketingActionButtonLocalState.CodingKeys()
{
  return &type metadata for MarketingActionButtonLocalState.CodingKeys;
}

uint64_t getEnumTagSinglePayload for MarketingButtonState.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for MarketingButtonState.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C1E7598 + 4 * byte_23C201385[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_23C1E75CC + 4 * byte_23C201380[v4]))();
}

uint64_t sub_23C1E75CC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1E75D4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C1E75DCLL);
  return result;
}

uint64_t sub_23C1E75E8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C1E75F0);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_23C1E75F4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1E75FC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MarketingButtonState.CodingKeys()
{
  return &type metadata for MarketingButtonState.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for MarketingButtonLayout.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C1E7664 + 4 * byte_23C20138F[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23C1E7698 + 4 * byte_23C20138A[v4]))();
}

uint64_t sub_23C1E7698(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1E76A0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C1E76A8);
  return result;
}

uint64_t sub_23C1E76B4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C1E76BCLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23C1E76C0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1E76C8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MarketingButtonLayout.CodingKeys()
{
  return &type metadata for MarketingButtonLayout.CodingKeys;
}

uint64_t _s16FitnessMarketing21MarketingButtonLayoutV19HorizontalAlignmentOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C1E7730 + 4 * byte_23C201399[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23C1E7764 + 4 * byte_23C201394[v4]))();
}

uint64_t sub_23C1E7764(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1E776C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C1E7774);
  return result;
}

uint64_t sub_23C1E7780(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C1E7788);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23C1E778C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1E7794(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MarketingButtonLayout.HorizontalAlignment.CodingKeys()
{
  return &type metadata for MarketingButtonLayout.HorizontalAlignment.CodingKeys;
}

ValueMetadata *type metadata accessor for MarketingButtonLayout.HorizontalAlignment.LeadingCodingKeys()
{
  return &type metadata for MarketingButtonLayout.HorizontalAlignment.LeadingCodingKeys;
}

ValueMetadata *type metadata accessor for MarketingButtonLayout.HorizontalAlignment.CenterCodingKeys()
{
  return &type metadata for MarketingButtonLayout.HorizontalAlignment.CenterCodingKeys;
}

ValueMetadata *type metadata accessor for MarketingButtonLayout.HorizontalAlignment.TrailingCodingKeys()
{
  return &type metadata for MarketingButtonLayout.HorizontalAlignment.TrailingCodingKeys;
}

unint64_t sub_23C1E77E4()
{
  unint64_t result;

  result = qword_256B42598;
  if (!qword_256B42598)
  {
    result = MEMORY[0x242619B10](&unk_23C201954, &type metadata for MarketingButtonLayout.HorizontalAlignment.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B42598);
  }
  return result;
}

unint64_t sub_23C1E782C()
{
  unint64_t result;

  result = qword_256B425A0;
  if (!qword_256B425A0)
  {
    result = MEMORY[0x242619B10](&unk_23C201A0C, &type metadata for MarketingButtonLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B425A0);
  }
  return result;
}

unint64_t sub_23C1E7874()
{
  unint64_t result;

  result = qword_256B425A8;
  if (!qword_256B425A8)
  {
    result = MEMORY[0x242619B10](&unk_23C201AC4, &type metadata for MarketingButtonState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B425A8);
  }
  return result;
}

unint64_t sub_23C1E78BC()
{
  unint64_t result;

  result = qword_256B425B0;
  if (!qword_256B425B0)
  {
    result = MEMORY[0x242619B10](&unk_23C201B7C, &type metadata for MarketingActionButtonLocalState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B425B0);
  }
  return result;
}

unint64_t sub_23C1E7904()
{
  unint64_t result;

  result = qword_256B425B8;
  if (!qword_256B425B8)
  {
    result = MEMORY[0x242619B10](&unk_23C201AEC, &type metadata for MarketingActionButtonLocalState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B425B8);
  }
  return result;
}

unint64_t sub_23C1E794C()
{
  unint64_t result;

  result = qword_256B425C0;
  if (!qword_256B425C0)
  {
    result = MEMORY[0x242619B10](&unk_23C201B14, &type metadata for MarketingActionButtonLocalState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B425C0);
  }
  return result;
}

unint64_t sub_23C1E7994()
{
  unint64_t result;

  result = qword_256B425C8;
  if (!qword_256B425C8)
  {
    result = MEMORY[0x242619B10](&unk_23C201A34, &type metadata for MarketingButtonState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B425C8);
  }
  return result;
}

unint64_t sub_23C1E79DC()
{
  unint64_t result;

  result = qword_256B425D0;
  if (!qword_256B425D0)
  {
    result = MEMORY[0x242619B10](&unk_23C201A5C, &type metadata for MarketingButtonState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B425D0);
  }
  return result;
}

unint64_t sub_23C1E7A24()
{
  unint64_t result;

  result = qword_256B425D8;
  if (!qword_256B425D8)
  {
    result = MEMORY[0x242619B10](&unk_23C20197C, &type metadata for MarketingButtonLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B425D8);
  }
  return result;
}

unint64_t sub_23C1E7A6C()
{
  unint64_t result;

  result = qword_256B425E0;
  if (!qword_256B425E0)
  {
    result = MEMORY[0x242619B10](&unk_23C2019A4, &type metadata for MarketingButtonLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B425E0);
  }
  return result;
}

unint64_t sub_23C1E7AB4()
{
  unint64_t result;

  result = qword_256B425E8;
  if (!qword_256B425E8)
  {
    result = MEMORY[0x242619B10](&unk_23C201874, &type metadata for MarketingButtonLayout.HorizontalAlignment.LeadingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B425E8);
  }
  return result;
}

unint64_t sub_23C1E7AFC()
{
  unint64_t result;

  result = qword_256B425F0;
  if (!qword_256B425F0)
  {
    result = MEMORY[0x242619B10](&unk_23C20189C, &type metadata for MarketingButtonLayout.HorizontalAlignment.LeadingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B425F0);
  }
  return result;
}

unint64_t sub_23C1E7B44()
{
  unint64_t result;

  result = qword_256B425F8;
  if (!qword_256B425F8)
  {
    result = MEMORY[0x242619B10](&unk_23C201824, &type metadata for MarketingButtonLayout.HorizontalAlignment.CenterCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B425F8);
  }
  return result;
}

unint64_t sub_23C1E7B8C()
{
  unint64_t result;

  result = qword_256B42600;
  if (!qword_256B42600)
  {
    result = MEMORY[0x242619B10](&unk_23C20184C, &type metadata for MarketingButtonLayout.HorizontalAlignment.CenterCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B42600);
  }
  return result;
}

unint64_t sub_23C1E7BD4()
{
  unint64_t result;

  result = qword_256B42608;
  if (!qword_256B42608)
  {
    result = MEMORY[0x242619B10](&unk_23C2017D4, &type metadata for MarketingButtonLayout.HorizontalAlignment.TrailingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B42608);
  }
  return result;
}

unint64_t sub_23C1E7C1C()
{
  unint64_t result;

  result = qword_256B42610;
  if (!qword_256B42610)
  {
    result = MEMORY[0x242619B10](&unk_23C2017FC, &type metadata for MarketingButtonLayout.HorizontalAlignment.TrailingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B42610);
  }
  return result;
}

unint64_t sub_23C1E7C64()
{
  unint64_t result;

  result = qword_256B42618;
  if (!qword_256B42618)
  {
    result = MEMORY[0x242619B10](&unk_23C2018C4, &type metadata for MarketingButtonLayout.HorizontalAlignment.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B42618);
  }
  return result;
}

unint64_t sub_23C1E7CAC()
{
  unint64_t result;

  result = qword_256B42620;
  if (!qword_256B42620)
  {
    result = MEMORY[0x242619B10](&unk_23C2018EC, &type metadata for MarketingButtonLayout.HorizontalAlignment.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B42620);
  }
  return result;
}

uint64_t sub_23C1E7CF0(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x676E696461656CLL && a2 == 0xE700000000000000;
  if (v2 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7265746E6563 && a2 == 0xE600000000000000 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x676E696C69617274 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_23C1FBF90();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_23C1E7E3C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6C416E6F74747562 && a2 == 0xEF746E656D6E6769;
  if (v2 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000023C2042F0 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x65746F6E746F6F66 && a2 == 0xEE0074657366664FLL || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x78614D6C6562616CLL && a2 == 0xED00006874646957)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_23C1FBF90();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_23C1E8058(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x74756F79616CLL && a2 == 0xE600000000000000;
  if (v2 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656C61636F6CLL && a2 == 0xE600000000000000 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E656D6563616C70 && a2 == 0xE900000000000074 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6D726F6674616C70 && a2 == 0xE800000000000000 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x416C61636F4C7369 && a2 == 0xEE00746E756F6363 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x800000023C204310 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x800000023C204330 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x7461745364616F6CLL && a2 == 0xE900000000000065)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else
  {
    v6 = sub_23C1FBF90();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 7;
    else
      return 8;
  }
}

uint64_t sub_23C1E83AC(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000023 && a2 == 0x800000023C204350 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD00000000000001FLL && a2 == 0x800000023C204380)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v5 = sub_23C1FBF90();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

BOOL static ServiceSubscriptionMonitorActivationState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t ServiceSubscriptionMonitorActivationState.hash(into:)()
{
  return sub_23C1FBFD8();
}

uint64_t sub_23C1E84D8()
{
  sub_23C1E8880();
  return sub_23C1FC020();
}

uint64_t sub_23C1E8500()
{
  sub_23C1E8880();
  return sub_23C1FC02C();
}

uint64_t sub_23C1E8528()
{
  _BYTE *v0;

  if (*v0)
    return 0x657669746361;
  else
    return 0x6576697463616E69;
}

uint64_t sub_23C1E8560@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C1E8FC8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C1E8584()
{
  sub_23C1E883C();
  return sub_23C1FC020();
}

uint64_t sub_23C1E85AC()
{
  sub_23C1E883C();
  return sub_23C1FC02C();
}

uint64_t sub_23C1E85D4()
{
  sub_23C1E88C4();
  return sub_23C1FC020();
}

uint64_t sub_23C1E85FC()
{
  sub_23C1E88C4();
  return sub_23C1FC02C();
}

uint64_t ServiceSubscriptionMonitorActivationState.hashValue.getter()
{
  sub_23C1FBFCC();
  sub_23C1FBFD8();
  return sub_23C1FBFFC();
}

uint64_t ServiceSubscriptionMonitorActivationState.encode(to:)(_QWORD *a1)
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

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42628);
  v16 = *(_QWORD *)(v3 - 8);
  v17 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42630);
  v14 = *(_QWORD *)(v6 - 8);
  v15 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42638);
  v18 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C1E883C();
  sub_23C1FC014();
  if ((v12 & 1) != 0)
  {
    v20 = 1;
    sub_23C1E8880();
    sub_23C1FBF30();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v17);
  }
  else
  {
    v19 = 0;
    sub_23C1E88C4();
    sub_23C1FBF30();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v15);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v11, v9);
}

unint64_t sub_23C1E883C()
{
  unint64_t result;

  result = qword_256B42640;
  if (!qword_256B42640)
  {
    result = MEMORY[0x242619B10](&unk_23C20211C, &type metadata for ServiceSubscriptionMonitorActivationState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B42640);
  }
  return result;
}

unint64_t sub_23C1E8880()
{
  unint64_t result;

  result = qword_256B42648;
  if (!qword_256B42648)
  {
    result = MEMORY[0x242619B10](&unk_23C2020CC, &type metadata for ServiceSubscriptionMonitorActivationState.ActiveCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B42648);
  }
  return result;
}

unint64_t sub_23C1E88C4()
{
  unint64_t result;

  result = qword_256B42650;
  if (!qword_256B42650)
  {
    result = MEMORY[0x242619B10](&unk_23C20207C, &type metadata for ServiceSubscriptionMonitorActivationState.InactiveCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B42650);
  }
  return result;
}

uint64_t ServiceSubscriptionMonitorActivationState.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
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
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42658);
  v32 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v31 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42660);
  v4 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42668);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C1E883C();
  v11 = v33;
  sub_23C1FC008();
  if (v11)
    goto LABEL_7;
  v26 = v4;
  v27 = a1;
  v12 = v31;
  v13 = v32;
  v33 = v8;
  v14 = sub_23C1FBF24();
  v15 = v7;
  if (*(_QWORD *)(v14 + 16) != 1)
  {
    v19 = sub_23C1FBE58();
    swift_allocError();
    v21 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B40A48);
    *v21 = &type metadata for ServiceSubscriptionMonitorActivationState;
    sub_23C1FBED0();
    sub_23C1FBE4C();
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
    sub_23C1E8880();
    sub_23C1FBEC4();
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
    sub_23C1E88C4();
    v22 = v6;
    sub_23C1FBEC4();
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

unint64_t sub_23C1E8C64()
{
  unint64_t result;

  result = qword_256B42670;
  if (!qword_256B42670)
  {
    result = MEMORY[0x242619B10](&protocol conformance descriptor for ServiceSubscriptionMonitorActivationState, &type metadata for ServiceSubscriptionMonitorActivationState);
    atomic_store(result, (unint64_t *)&qword_256B42670);
  }
  return result;
}

uint64_t sub_23C1E8CA8@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return ServiceSubscriptionMonitorActivationState.init(from:)(a1, a2);
}

uint64_t sub_23C1E8CBC(_QWORD *a1)
{
  return ServiceSubscriptionMonitorActivationState.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for ServiceSubscriptionMonitorActivationState()
{
  return &type metadata for ServiceSubscriptionMonitorActivationState;
}

uint64_t _s16FitnessMarketing41ServiceSubscriptionMonitorActivationStateOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C1E8D30 + 4 * byte_23C201DE5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C1E8D64 + 4 * byte_23C201DE0[v4]))();
}

uint64_t sub_23C1E8D64(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1E8D6C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C1E8D74);
  return result;
}

uint64_t sub_23C1E8D80(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C1E8D88);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C1E8D8C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1E8D94(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ServiceSubscriptionMonitorActivationState.CodingKeys()
{
  return &type metadata for ServiceSubscriptionMonitorActivationState.CodingKeys;
}

ValueMetadata *type metadata accessor for ServiceSubscriptionMonitorActivationState.InactiveCodingKeys()
{
  return &type metadata for ServiceSubscriptionMonitorActivationState.InactiveCodingKeys;
}

ValueMetadata *type metadata accessor for ServiceSubscriptionMonitorActivationState.ActiveCodingKeys()
{
  return &type metadata for ServiceSubscriptionMonitorActivationState.ActiveCodingKeys;
}

unint64_t sub_23C1E8DD4()
{
  unint64_t result;

  result = qword_256B42678;
  if (!qword_256B42678)
  {
    result = MEMORY[0x242619B10](&unk_23C202054, &type metadata for ServiceSubscriptionMonitorActivationState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B42678);
  }
  return result;
}

unint64_t sub_23C1E8E1C()
{
  unint64_t result;

  result = qword_256B42680;
  if (!qword_256B42680)
  {
    result = MEMORY[0x242619B10](&unk_23C201F74, &type metadata for ServiceSubscriptionMonitorActivationState.InactiveCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B42680);
  }
  return result;
}

unint64_t sub_23C1E8E64()
{
  unint64_t result;

  result = qword_256B42688;
  if (!qword_256B42688)
  {
    result = MEMORY[0x242619B10](&unk_23C201F9C, &type metadata for ServiceSubscriptionMonitorActivationState.InactiveCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B42688);
  }
  return result;
}

unint64_t sub_23C1E8EAC()
{
  unint64_t result;

  result = qword_256B42690;
  if (!qword_256B42690)
  {
    result = MEMORY[0x242619B10](&unk_23C201F24, &type metadata for ServiceSubscriptionMonitorActivationState.ActiveCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B42690);
  }
  return result;
}

unint64_t sub_23C1E8EF4()
{
  unint64_t result;

  result = qword_256B42698;
  if (!qword_256B42698)
  {
    result = MEMORY[0x242619B10](&unk_23C201F4C, &type metadata for ServiceSubscriptionMonitorActivationState.ActiveCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B42698);
  }
  return result;
}

unint64_t sub_23C1E8F3C()
{
  unint64_t result;

  result = qword_256B426A0;
  if (!qword_256B426A0)
  {
    result = MEMORY[0x242619B10](&unk_23C201FC4, &type metadata for ServiceSubscriptionMonitorActivationState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B426A0);
  }
  return result;
}

unint64_t sub_23C1E8F84()
{
  unint64_t result;

  result = qword_256B426A8;
  if (!qword_256B426A8)
  {
    result = MEMORY[0x242619B10](&unk_23C201FEC, &type metadata for ServiceSubscriptionMonitorActivationState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B426A8);
  }
  return result;
}

uint64_t sub_23C1E8FC8(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6576697463616E69 && a2 == 0xE800000000000000;
  if (v2 || (sub_23C1FBF90() & 1) != 0)
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
    v6 = sub_23C1FBF90();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

BOOL static MarketingOfferTemplateFootnotePosition.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23C1E90C4()
{
  sub_23C1E95B4();
  return sub_23C1FC020();
}

uint64_t sub_23C1E90EC()
{
  sub_23C1E95B4();
  return sub_23C1FC02C();
}

uint64_t sub_23C1E9114()
{
  sub_23C1E9570();
  return sub_23C1FC020();
}

uint64_t sub_23C1E913C()
{
  sub_23C1E9570();
  return sub_23C1FC02C();
}

uint64_t sub_23C1E9164()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x75536E6F74747562;
  if (*v0 != 1)
    v1 = 7368564;
  if (*v0)
    return v1;
  else
    return 0x6D6F74746F62;
}

uint64_t sub_23C1E91C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C1E9EB0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C1E91E4()
{
  sub_23C1E94E8();
  return sub_23C1FC020();
}

uint64_t sub_23C1E920C()
{
  sub_23C1E94E8();
  return sub_23C1FC02C();
}

uint64_t sub_23C1E9234()
{
  sub_23C1E952C();
  return sub_23C1FC020();
}

uint64_t sub_23C1E925C()
{
  sub_23C1E952C();
  return sub_23C1FC02C();
}

uint64_t MarketingOfferTemplateFootnotePosition.encode(to:)(_QWORD *a1)
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
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B426B0);
  v22 = *(_QWORD *)(v4 - 8);
  v23 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v21 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B426B8);
  v19 = *(_QWORD *)(v6 - 8);
  v20 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B426C0);
  v9 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B426C8);
  v24 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *v2;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C1E94E8();
  sub_23C1FC014();
  if (v15)
  {
    if (v15 == 1)
    {
      v26 = 1;
      sub_23C1E9570();
      sub_23C1FBF30();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v8, v20);
    }
    else
    {
      v27 = 2;
      sub_23C1E952C();
      v16 = v21;
      sub_23C1FBF30();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v16, v23);
    }
  }
  else
  {
    v25 = 0;
    sub_23C1E95B4();
    sub_23C1FBF30();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v18);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v14, v12);
}

unint64_t sub_23C1E94E8()
{
  unint64_t result;

  result = qword_256B426D0;
  if (!qword_256B426D0)
  {
    result = MEMORY[0x242619B10](&unk_23C202560, &type metadata for MarketingOfferTemplateFootnotePosition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B426D0);
  }
  return result;
}

unint64_t sub_23C1E952C()
{
  unint64_t result;

  result = qword_256B426D8;
  if (!qword_256B426D8)
  {
    result = MEMORY[0x242619B10](&unk_23C202510, &type metadata for MarketingOfferTemplateFootnotePosition.TopCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B426D8);
  }
  return result;
}

unint64_t sub_23C1E9570()
{
  unint64_t result;

  result = qword_256B426E0;
  if (!qword_256B426E0)
  {
    result = MEMORY[0x242619B10](&unk_23C2024C0, &type metadata for MarketingOfferTemplateFootnotePosition.ButtonSubtitleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B426E0);
  }
  return result;
}

unint64_t sub_23C1E95B4()
{
  unint64_t result;

  result = qword_256B426E8;
  if (!qword_256B426E8)
  {
    result = MEMORY[0x242619B10](&unk_23C202470, &type metadata for MarketingOfferTemplateFootnotePosition.BottomCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B426E8);
  }
  return result;
}

uint64_t MarketingOfferTemplateFootnotePosition.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
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
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B426F0);
  v34 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v37);
  v40 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B426F8);
  v35 = *(_QWORD *)(v4 - 8);
  v36 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v39 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42700);
  v6 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42708);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C1E94E8();
  v13 = v41;
  sub_23C1FC008();
  if (v13)
    goto LABEL_7;
  v31 = v6;
  v32 = v10;
  v14 = v39;
  v15 = v40;
  v41 = a1;
  v16 = v12;
  v17 = sub_23C1FBF24();
  v18 = v9;
  if (*(_QWORD *)(v17 + 16) != 1)
  {
    v23 = sub_23C1FBE58();
    swift_allocError();
    v25 = v24;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B40A48);
    *v25 = &type metadata for MarketingOfferTemplateFootnotePosition;
    sub_23C1FBED0();
    sub_23C1FBE4C();
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
      sub_23C1E9570();
      v20 = v9;
      sub_23C1FBEC4();
      v21 = v38;
      v22 = v32;
      (*(void (**)(char *, uint64_t))(v35 + 8))(v14, v36);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v16, v20);
    }
    else
    {
      v44 = 2;
      sub_23C1E952C();
      v28 = v15;
      sub_23C1FBEC4();
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
    sub_23C1E95B4();
    sub_23C1FBEC4();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v8, v33);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v16, v9);
    v21 = v38;
  }
  *v21 = v19;
  v26 = (uint64_t)v41;
  return __swift_destroy_boxed_opaque_existential_1(v26);
}

uint64_t sub_23C1E9A3C@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return MarketingOfferTemplateFootnotePosition.init(from:)(a1, a2);
}

uint64_t sub_23C1E9A50(_QWORD *a1)
{
  return MarketingOfferTemplateFootnotePosition.encode(to:)(a1);
}

uint64_t MarketingOfferTemplateFootnotePosition.hash(into:)()
{
  return sub_23C1FBFD8();
}

uint64_t MarketingOfferTemplateFootnotePosition.hashValue.getter()
{
  sub_23C1FBFCC();
  sub_23C1FBFD8();
  return sub_23C1FBFFC();
}

unint64_t sub_23C1E9AD4()
{
  unint64_t result;

  result = qword_256B42710;
  if (!qword_256B42710)
  {
    result = MEMORY[0x242619B10](&protocol conformance descriptor for MarketingOfferTemplateFootnotePosition, &type metadata for MarketingOfferTemplateFootnotePosition);
    atomic_store(result, (unint64_t *)&qword_256B42710);
  }
  return result;
}

ValueMetadata *type metadata accessor for MarketingOfferTemplateFootnotePosition()
{
  return &type metadata for MarketingOfferTemplateFootnotePosition;
}

uint64_t _s16FitnessMarketing38MarketingOfferTemplateFootnotePositionOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C1E9B78 + 4 * byte_23C202175[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23C1E9BAC + 4 * byte_23C202170[v4]))();
}

uint64_t sub_23C1E9BAC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1E9BB4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C1E9BBCLL);
  return result;
}

uint64_t sub_23C1E9BC8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C1E9BD0);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23C1E9BD4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1E9BDC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MarketingOfferTemplateFootnotePosition.CodingKeys()
{
  return &type metadata for MarketingOfferTemplateFootnotePosition.CodingKeys;
}

ValueMetadata *type metadata accessor for MarketingOfferTemplateFootnotePosition.BottomCodingKeys()
{
  return &type metadata for MarketingOfferTemplateFootnotePosition.BottomCodingKeys;
}

ValueMetadata *type metadata accessor for MarketingOfferTemplateFootnotePosition.ButtonSubtitleCodingKeys()
{
  return &type metadata for MarketingOfferTemplateFootnotePosition.ButtonSubtitleCodingKeys;
}

ValueMetadata *type metadata accessor for MarketingOfferTemplateFootnotePosition.TopCodingKeys()
{
  return &type metadata for MarketingOfferTemplateFootnotePosition.TopCodingKeys;
}

unint64_t sub_23C1E9C2C()
{
  unint64_t result;

  result = qword_256B42718;
  if (!qword_256B42718)
  {
    result = MEMORY[0x242619B10](&unk_23C202448, &type metadata for MarketingOfferTemplateFootnotePosition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B42718);
  }
  return result;
}

unint64_t sub_23C1E9C74()
{
  unint64_t result;

  result = qword_256B42720;
  if (!qword_256B42720)
  {
    result = MEMORY[0x242619B10](&unk_23C202368, &type metadata for MarketingOfferTemplateFootnotePosition.BottomCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B42720);
  }
  return result;
}

unint64_t sub_23C1E9CBC()
{
  unint64_t result;

  result = qword_256B42728;
  if (!qword_256B42728)
  {
    result = MEMORY[0x242619B10](&unk_23C202390, &type metadata for MarketingOfferTemplateFootnotePosition.BottomCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B42728);
  }
  return result;
}

unint64_t sub_23C1E9D04()
{
  unint64_t result;

  result = qword_256B42730;
  if (!qword_256B42730)
  {
    result = MEMORY[0x242619B10](&unk_23C202318, &type metadata for MarketingOfferTemplateFootnotePosition.ButtonSubtitleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B42730);
  }
  return result;
}

unint64_t sub_23C1E9D4C()
{
  unint64_t result;

  result = qword_256B42738;
  if (!qword_256B42738)
  {
    result = MEMORY[0x242619B10](&unk_23C202340, &type metadata for MarketingOfferTemplateFootnotePosition.ButtonSubtitleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B42738);
  }
  return result;
}

unint64_t sub_23C1E9D94()
{
  unint64_t result;

  result = qword_256B42740;
  if (!qword_256B42740)
  {
    result = MEMORY[0x242619B10](&unk_23C2022C8, &type metadata for MarketingOfferTemplateFootnotePosition.TopCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B42740);
  }
  return result;
}

unint64_t sub_23C1E9DDC()
{
  unint64_t result;

  result = qword_256B42748;
  if (!qword_256B42748)
  {
    result = MEMORY[0x242619B10](&unk_23C2022F0, &type metadata for MarketingOfferTemplateFootnotePosition.TopCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B42748);
  }
  return result;
}

unint64_t sub_23C1E9E24()
{
  unint64_t result;

  result = qword_256B42750;
  if (!qword_256B42750)
  {
    result = MEMORY[0x242619B10](&unk_23C2023B8, &type metadata for MarketingOfferTemplateFootnotePosition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B42750);
  }
  return result;
}

unint64_t sub_23C1E9E6C()
{
  unint64_t result;

  result = qword_256B42758;
  if (!qword_256B42758)
  {
    result = MEMORY[0x242619B10](&unk_23C2023E0, &type metadata for MarketingOfferTemplateFootnotePosition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B42758);
  }
  return result;
}

uint64_t sub_23C1E9EB0(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6D6F74746F62 && a2 == 0xE600000000000000;
  if (v2 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x75536E6F74747562 && a2 == 0xEE00656C74697462 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 7368564 && a2 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_23C1FBF90();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

__n128 MarketingEnvironment.init(fetchCurrentAccount:fetchMarketingItem:makeAccountChangedStream:presentMarketingLink:publishMarketingOperationEnded:publishServiceSubscriptionPurchased:performPurchase:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, __int128 a10, __n128 a11, uint64_t a12, uint64_t a13)
{
  __n128 result;

  result = a11;
  *(_QWORD *)a9 = a1;
  *(_QWORD *)(a9 + 8) = a2;
  *(_QWORD *)(a9 + 16) = a3;
  *(_QWORD *)(a9 + 24) = a4;
  *(_QWORD *)(a9 + 32) = a5;
  *(_QWORD *)(a9 + 40) = a6;
  *(_QWORD *)(a9 + 48) = a7;
  *(_QWORD *)(a9 + 56) = a8;
  *(_OWORD *)(a9 + 64) = a10;
  *(__n128 *)(a9 + 80) = a11;
  *(_QWORD *)(a9 + 96) = a12;
  *(_QWORD *)(a9 + 104) = a13;
  return result;
}

uint64_t destroy for MarketingEnvironment()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for MarketingEnvironment(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  v3 = *(_QWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 104) = v3;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for MarketingEnvironment(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

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
  return a1;
}

__n128 __swift_memcpy112_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __n128 result;
  __int128 v5;
  __int128 v6;

  v2 = *a2;
  v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  result = (__n128)a2[3];
  v5 = a2[4];
  v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v5;
  return result;
}

_OWORD *assignWithTake for MarketingEnvironment(_OWORD *a1, _OWORD *a2)
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
  return a1;
}

uint64_t getEnumTagSinglePayload for MarketingEnvironment(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 112))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MarketingEnvironment(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 112) = 1;
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
    *(_BYTE *)(result + 112) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for MarketingEnvironment()
{
  return &type metadata for MarketingEnvironment;
}

uint64_t sub_23C1EA38C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B428B8);
  sub_23C1BC328(&qword_256B428C0, &qword_256B428B8, MEMORY[0x24BE2B5E8]);
  return sub_23C1FB5C4();
}

uint64_t sub_23C1EA404(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v4 = sub_23C1FB75C();
  MEMORY[0x24BDAC7A8](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))((char *)&v7 - v5, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_23C1FB768();
}

uint64_t sub_23C1EA4C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v5 = sub_23C1FB75C();
  MEMORY[0x24BDAC7A8](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 16))((char *)&v8 - v6, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_23C1FB768();
}

uint64_t sub_23C1EA58C()
{
  return sub_23C1FB678();
}

uint64_t sub_23C1EA5AC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_23C1FB5F4();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_23C1FB684();
}

void sub_23C1EA62C()
{
  type metadata accessor for MarketingInlineView.FocusedButton();
}

uint64_t sub_23C1EA670(uint64_t a1)
{
  uint64_t v2;
  _QWORD v4[13];

  v2 = sub_23C1FBDE0();
  v4[0] = MEMORY[0x242619B10](&unk_23C202760, a1);
  MEMORY[0x242619B10](MEMORY[0x24BEE4AB0], v2, v4);
  sub_23C1FB594();
  sub_23C1FB57C();
  return v4[1];
}

uint64_t sub_23C1EA6E0@<X0>(uint64_t a1@<X8>)
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
  v4 = sub_23C1FB6E4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41EC8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23C1BF6E4(v2, (uint64_t)v10, &qword_256B41EC8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v11 = sub_23C1FB5F4();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    v13 = sub_23C1FBDB0();
    v14 = sub_23C1FB8C4();
    v15 = v13;
    if (os_log_type_enabled(v14, v13))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      v17 = swift_slowAlloc();
      v19[1] = a1;
      v18 = v17;
      v20 = v17;
      *(_DWORD *)v16 = 136315138;
      v19[2] = sub_23C1EF224(0x694474756F79614CLL, 0xEF6E6F6974636572, &v20);
      sub_23C1FBDEC();
      _os_log_impl(&dword_23C1B2000, v14, v15, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x242619BC4](v18, -1, -1);
      MEMORY[0x242619BC4](v16, -1, -1);
    }

    sub_23C1FB6D8();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

BOOL sub_23C1EA924(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_23C1EA934()
{
  return sub_23C1FBFD8();
}

uint64_t sub_23C1EA958()
{
  sub_23C1FBFCC();
  sub_23C1FBFD8();
  return sub_23C1FBFFC();
}

BOOL sub_23C1EA99C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_23C1EA924(*a1, *a2);
}

uint64_t sub_23C1EA9A8()
{
  return sub_23C1EA958();
}

uint64_t sub_23C1EA9B0()
{
  return sub_23C1EA934();
}

uint64_t sub_23C1EA9B8()
{
  sub_23C1FBFCC();
  sub_23C1EA934();
  return sub_23C1FBFFC();
}

void MarketingInlineView.init(store:actionViewBuilder:artworkViewBuilder:)(uint64_t *a1@<X8>)
{
  *a1 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B41EC8);
  swift_storeEnumTagMultiPayload();
  type metadata accessor for MarketingInlineView();
}

void sub_23C1EAA78()
{
  type metadata accessor for MarketingInlineView.FocusedButton();
}

uint64_t sub_23C1EAA98(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  uint64_t result;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;

  MEMORY[0x242619B10](&unk_23C202760, a1);
  sub_23C1FB588();
  *(_BYTE *)v1 = v14;
  *(_QWORD *)(v1 + 8) = v15;
  *(_BYTE *)(v1 + 16) = v16;
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = v5;
  *(_QWORD *)(result + 24) = v4;
  v8 = v2 + v6[13];
  *(_QWORD *)v8 = sub_23C1C88E0;
  *(_QWORD *)(v8 + 8) = result;
  *(_BYTE *)(v8 + 16) = 0;
  v9 = (_QWORD *)(v2 + v6[15]);
  *v9 = v3;
  v9[1] = v11;
  v10 = (_QWORD *)(v2 + v6[16]);
  *v10 = v12;
  v10[1] = v13;
  return result;
}

uint64_t sub_23C1EAB48()
{
  return sub_23C1FB678();
}

void type metadata accessor for MarketingInlineView()
{
  JUMPOUT(0x242619A74);
}

void type metadata accessor for MarketingInlineView.FocusedButton()
{
  JUMPOUT(0x242619A74);
}

uint64_t sub_23C1EAB84()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23C1EABA8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B428D8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B428E0);
  sub_23C1BC328(&qword_256B428E8, &qword_256B428D8, MEMORY[0x24BDF5428]);
  sub_23C1BC328(&qword_256B428F0, &qword_256B428E0, MEMORY[0x24BDF43B0]);
  return sub_23C1FB780();
}

void sub_23C1EACB4()
{
  uint64_t v0;
  uint64_t v1;
  id v2;

  v0 = sub_23C1FB4B0();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_23C1FBCB4();
  MEMORY[0x24BDAC7A8](v1);
  sub_23C1FBCA8();
  if (qword_256B408D8 != -1)
    swift_once();
  v2 = (id)qword_256B4F8C8;
  type metadata accessor for MarketingInlineView();
}

void sub_23C1EAF64()
{
  type metadata accessor for MarketingInlineView();
}

uint64_t sub_23C1EAFB0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  unint64_t v11;
  char *v12;
  _BYTE v14[96];

  v8 = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v10 = &v14[-v9];
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v8 + 16))(&v14[-v9], v3, a1);
  v11 = (*(unsigned __int8 *)(v8 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v12 = (char *)swift_allocObject();
  *((_QWORD *)v12 + 2) = v5;
  *((_QWORD *)v12 + 3) = v4;
  *((_QWORD *)v12 + 4) = v2;
  *((_QWORD *)v12 + 5) = v1;
  (*(void (**)(char *, _BYTE *, uint64_t))(v8 + 32))(&v12[v11], v10, a1);
  *(_QWORD *)(v6 - 160) = v5;
  *(_QWORD *)(v6 - 152) = v4;
  *(_QWORD *)(v6 - 144) = v2;
  *(_QWORD *)(v6 - 136) = v1;
  *(_QWORD *)(v6 - 128) = v3;
  return sub_23C1FBB70();
}

void sub_23C1EB090()
{
  uint64_t v0;
  uint64_t v1;
  id v2;

  v0 = sub_23C1FB4B0();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_23C1FBCB4();
  MEMORY[0x24BDAC7A8](v1);
  sub_23C1FBCA8();
  if (qword_256B408D8 != -1)
    swift_once();
  v2 = (id)qword_256B4F8C8;
  type metadata accessor for MarketingInlineView();
}

void MarketingInlineView.body.getter(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[33];
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v14[25] = a2;
  v3 = *(_QWORD *)(*(a1 - 1) + 64);
  v14[23] = *(a1 - 1);
  v14[24] = v3;
  MEMORY[0x24BDAC7A8](a1);
  v14[22] = (char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23C1FB870();
  v14[20] = *(_QWORD *)(v5 - 8);
  v14[21] = v5;
  MEMORY[0x24BDAC7A8](v5);
  v14[19] = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14[26] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B42760);
  v7 = a1[3];
  sub_23C1FB87C();
  v8 = v7;
  v14[32] = v7;
  v14[27] = sub_23C1FB600();
  v14[15] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41E80);
  v9 = a1;
  v10 = a1[2];
  v11 = a1[4];
  v14[17] = a1;
  v16 = v10;
  v17 = v11;
  v12 = v10;
  v13 = v11;
  v14[31] = v11;
  MEMORY[0x242619ABC](255, &v16, MEMORY[0x24BDF3110], 0);
  sub_23C1FB600();
  v14[12] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41E88);
  sub_23C1FB600();
  v15 = v9[5];
  v16 = v12;
  v17 = v8;
  v18 = v13;
  v19 = v15;
  type metadata accessor for MarketingInlineView.FocusedButton();
}

void sub_23C1EB3B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t OpaqueTypeConformance2;
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
  unint64_t v51;
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

  v17 = sub_23C1FBDE0();
  *(_QWORD *)(v15 - 120) = v11;
  *(_QWORD *)(v15 - 112) = v10;
  v9[30] = v11;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v19 = MEMORY[0x24BDECC60];
  *(_QWORD *)(v15 - 136) = OpaqueTypeConformance2;
  *(_QWORD *)(v15 - 128) = v19;
  v20 = v19;
  v21 = MEMORY[0x24BDED308];
  v22 = MEMORY[0x242619B10](MEMORY[0x24BDED308], v14, v15 - 136);
  v23 = sub_23C1BC328(&qword_256B41E90, v13, MEMORY[0x24BDF1028]);
  v9[16] = v23;
  *(_QWORD *)(v15 - 152) = v22;
  *(_QWORD *)(v15 - 144) = v23;
  v24 = MEMORY[0x242619B10](v21, v12, v15 - 152);
  *(_QWORD *)(v15 - 160) = MEMORY[0x242619B10](&unk_23C202760, a1);
  v25 = MEMORY[0x24BEE4AB0];
  v9[28] = v17;
  v26 = MEMORY[0x242619B10](v25, v17, v15 - 160);
  v9[29] = v26;
  *(_QWORD *)(v15 - 120) = v12;
  *(_QWORD *)(v15 - 112) = v17;
  *(_QWORD *)(v15 - 104) = v24;
  *(_QWORD *)(v15 - 96) = v26;
  MEMORY[0x242619ABC](255, v15 - 120, MEMORY[0x24BDF3748], 0);
  swift_getTupleTypeMetadata2();
  v27 = sub_23C1FBBE8();
  v28 = MEMORY[0x24BDF5428];
  MEMORY[0x242619B10](MEMORY[0x24BDF5428], v27);
  v29 = sub_23C1FBB88();
  v30 = sub_23C1FB600();
  *(_QWORD *)(v15 - 176) = MEMORY[0x242619B10](MEMORY[0x24BDF4700], v29);
  *(_QWORD *)(v15 - 168) = v20;
  MEMORY[0x242619B10](v21, v30, v15 - 176);
  v9[9] = sub_23C1FB63C();
  v9[8] = sub_23C1FB600();
  v9[15] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41E98);
  v9[10] = sub_23C1FB600();
  v9[11] = sub_23C1FB600();
  v9[13] = sub_23C1FB600();
  v9[14] = sub_23C1FB600();
  v9[7] = sub_23C1FB600();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41F00);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B42768);
  sub_23C1FB600();
  swift_getTupleTypeMetadata3();
  v31 = sub_23C1FBBE8();
  MEMORY[0x242619B10](v28, v31);
  v32 = sub_23C1FBB88();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B42770);
  v33 = sub_23C1FB600();
  v34 = sub_23C1FB600();
  v35 = sub_23C1FB600();
  v36 = sub_23C1FB600();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B42778);
  v37 = sub_23C1FB600();
  v38 = MEMORY[0x242619B10](MEMORY[0x24BDF4700], v32);
  v39 = sub_23C1BC328(&qword_256B42780, &qword_256B42770, MEMORY[0x24BDF1028]);
  *(_QWORD *)(v15 - 192) = v38;
  *(_QWORD *)(v15 - 184) = v39;
  v40 = MEMORY[0x24BDED308];
  *(_QWORD *)(v15 - 208) = MEMORY[0x242619B10](MEMORY[0x24BDED308], v33, v15 - 192);
  v41 = MEMORY[0x24BDECC60];
  *(_QWORD *)(v15 - 200) = MEMORY[0x24BDECC60];
  *(_QWORD *)(v15 - 224) = MEMORY[0x242619B10](v40, v34, v15 - 208);
  *(_QWORD *)(v15 - 216) = v41;
  *(_QWORD *)(v15 - 240) = MEMORY[0x242619B10](v40, v35, v15 - 224);
  *(_QWORD *)(v15 - 232) = v41;
  v42 = MEMORY[0x242619B10](v40, v36, v15 - 240);
  v43 = sub_23C1BC328(&qword_256B42788, &qword_256B42778, MEMORY[0x24BDEF370]);
  *(_QWORD *)(v15 - 256) = v42;
  *(_QWORD *)(v15 - 248) = v43;
  MEMORY[0x242619B10](v40, v37, v15 - 256);
  v44 = sub_23C1FB63C();
  v45 = v9[27];
  v46 = sub_23C1FB600();
  v47 = sub_23C1FB600();
  v9[3] = sub_23C1FB600();
  v9[4] = sub_23C1FB600();
  v48 = v9[7];
  v9[5] = sub_23C1FB774();
  v9[26] = sub_23C1FB774();
  v49 = sub_23C1FBB40();
  v9[6] = v49;
  v9[15] = *(_QWORD *)(v49 - 8);
  MEMORY[0x24BDAC7A8](v49);
  v9[12] = (uint64_t)&a9 - v50;
  v9[2] = sub_23C1EBE74();
  v51 = sub_23C1EBEF8();
  v9[70] = v9[33];
  v9[71] = v51;
  v52 = MEMORY[0x242619B10](v40, v45, v9 + 70);
  v53 = MEMORY[0x242619B10](MEMORY[0x24BDEDC10], v9[9]);
  v9[68] = v52;
  v9[69] = v53;
  v54 = MEMORY[0x242619B10](v40, v9[8], v9 + 68);
  v55 = sub_23C1BC328(&qword_256B41EB0, &qword_256B41E98, MEMORY[0x24BDEB950]);
  v9[66] = v54;
  v9[67] = v55;
  v56 = MEMORY[0x242619B10](v40, v9[10], v9 + 66);
  v57 = MEMORY[0x24BDEEC40];
  v9[64] = v56;
  v9[65] = v57;
  v9[62] = MEMORY[0x242619B10](v40, v9[11], v9 + 64);
  v9[63] = v41;
  v58 = MEMORY[0x242619B10](v40, v9[13], v9 + 62);
  v59 = MEMORY[0x24BDEDBB8];
  v9[60] = v58;
  v9[61] = v59;
  v60 = MEMORY[0x242619B10](v40, v9[14], v9 + 60);
  v61 = v9[16];
  v9[58] = v60;
  v9[59] = v61;
  v62 = MEMORY[0x242619B10](v40, v48, v9 + 58);
  v63 = MEMORY[0x242619B10](MEMORY[0x24BDEDC10], v44);
  v9[56] = v52;
  v9[57] = v63;
  v9[54] = MEMORY[0x242619B10](v40, v46, v9 + 56);
  v9[55] = v55;
  v9[52] = MEMORY[0x242619B10](v40, v47, v9 + 54);
  v9[53] = MEMORY[0x24BDEEC40];
  v9[50] = MEMORY[0x242619B10](v40, v9[3], v9 + 52);
  v9[51] = v41;
  v64 = MEMORY[0x242619B10](v40, v9[4], v9 + 50);
  v9[48] = v62;
  v9[49] = v64;
  v65 = MEMORY[0x24BDEF3E0];
  v66 = MEMORY[0x242619B10](MEMORY[0x24BDEF3E0], v9[5], v9 + 48);
  v9[46] = v9[2];
  v9[47] = v66;
  v67 = MEMORY[0x242619B10](v65, v9[26], v9 + 46);
  v9[5] = v67;
  v9[45] = v67;
  v68 = v9[6];
  v69 = MEMORY[0x242619B10](MEMORY[0x24BDF3F50], v68, v9 + 45);
  *(_QWORD *)(v15 - 120) = v68;
  *(_QWORD *)(v15 - 112) = v69;
  v70 = v69;
  v9[1] = v69;
  v71 = MEMORY[0x242619ABC](0, v15 - 120, MEMORY[0x24BE351A0], 0);
  v9[14] = *(_QWORD *)(v71 - 8);
  MEMORY[0x24BDAC7A8](v71);
  v9[2] = (uint64_t)&a9 - v72;
  *(_QWORD *)(v15 - 120) = v68;
  *(_QWORD *)(v15 - 112) = v70;
  v73 = swift_getOpaqueTypeConformance2();
  v75 = v9[28];
  v74 = v9[29];
  *(_QWORD *)(v15 - 120) = v71;
  *(_QWORD *)(v15 - 112) = v75;
  *(_QWORD *)(v15 - 104) = v73;
  *(_QWORD *)(v15 - 96) = v74;
  v76 = v73;
  *v9 = v73;
  v77 = MEMORY[0x242619ABC](0, v15 - 120, MEMORY[0x24BDF24C8], 0);
  v9[27] = *(_QWORD *)(v77 - 8);
  v9[13] = v77;
  MEMORY[0x24BDAC7A8](v77);
  v9[3] = (uint64_t)&a9 - v78;
  v79 = sub_23C1FB600();
  v9[16] = *(_QWORD *)(v79 - 8);
  MEMORY[0x24BDAC7A8](v79);
  v9[10] = (uint64_t)&a9 - v80;
  *(_QWORD *)(v15 - 120) = v71;
  *(_QWORD *)(v15 - 112) = v75;
  *(_QWORD *)(v15 - 104) = v76;
  *(_QWORD *)(v15 - 96) = v74;
  v81 = swift_getOpaqueTypeConformance2();
  v9[7] = v81;
  v82 = MEMORY[0x24BDF0910];
  v9[43] = v81;
  v9[44] = v82;
  v83 = MEMORY[0x242619B10](v40, v79, v9 + 43);
  v9[9] = v83;
  *(_QWORD *)(v15 - 120) = v79;
  *(_QWORD *)(v15 - 112) = v83;
  v84 = MEMORY[0x242619ABC](0, v15 - 120, MEMORY[0x24BE37C10], 0);
  v9[11] = *(_QWORD *)(v84 - 8);
  v85 = MEMORY[0x24BDAC7A8](v84);
  v9[4] = (uint64_t)&a9 - ((v86 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v85);
  v9[8] = (uint64_t)&a9 - v87;
  v88 = v9[32];
  v9[36] = v9[30];
  v9[37] = v88;
  v89 = v9[33];
  v9[38] = v9[31];
  v9[39] = v89;
  v9[40] = v9[18];
  v90 = v9[12];
  sub_23C1FBB34();
  sub_23C1FB9CC();
  (*(void (**)(uint64_t, uint64_t))(v9[15] + 8))(v90, v68);
  sub_23C1EA62C();
}

uint64_t sub_23C1EBC78(uint64_t a1, uint64_t a2, char a3)
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
  unint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);

  *(_QWORD *)(v10 - 120) = a1;
  *(_QWORD *)(v10 - 112) = a2;
  *(_BYTE *)(v10 - 104) = a3;
  *(_BYTE *)(v3 + 343) = 0;
  v11 = *(_QWORD *)(v3 + 152);
  sub_23C1FB864();
  v12 = swift_checkMetadataState();
  v13 = *(_QWORD *)(v3 + 24);
  MEMORY[0x242619120](v10 - 120, v3 + 343, v11, v4, v12, *(_QWORD *)v3, *(_QWORD *)(v3 + 232));
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v3 + 160) + 8))(v11, *(_QWORD *)(v3 + 168));
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 + 112) + 8))(v6, v4);
  v15 = *(_QWORD *)(v3 + 176);
  v14 = *(_QWORD *)(v3 + 184);
  v16 = v9;
  v17 = v8;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v15, v16, v8);
  v18 = v14;
  v19 = (*(unsigned __int8 *)(v14 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  v20 = (char *)swift_allocObject();
  v21 = *(_QWORD *)(v3 + 256);
  *((_QWORD *)v20 + 2) = *(_QWORD *)(v3 + 240);
  *((_QWORD *)v20 + 3) = v21;
  v22 = *(_QWORD *)(v3 + 264);
  *((_QWORD *)v20 + 4) = *(_QWORD *)(v3 + 248);
  *((_QWORD *)v20 + 5) = v22;
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 32))(&v20[v19], v15, v17);
  v23 = *(_QWORD *)(v3 + 80);
  v24 = *(_QWORD *)(v3 + 104);
  sub_23C1FBAE0();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 + 216) + 8))(v13, v24);
  v25 = *(_QWORD *)(v3 + 32);
  v26 = *(_QWORD *)(v3 + 72);
  sub_23C1FB9D8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 + 128) + 8))(v23, v7);
  *(_QWORD *)(v10 - 120) = v7;
  *(_QWORD *)(v10 - 112) = v26;
  swift_getOpaqueTypeConformance2();
  v27 = *(_QWORD *)(v3 + 64);
  sub_23C1CD350(v25, v5, v27);
  v28 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 + 88) + 8);
  v28(v25, v5);
  sub_23C1C87C4(v27, v5, *(_QWORD *)(v3 + 200));
  return ((uint64_t (*)(uint64_t, uint64_t))v28)(v27, v5);
}

unint64_t sub_23C1EBE74()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_256B42790;
  if (!qword_256B42790)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B42760);
    v2 = sub_23C1BC328(&qword_256B42798, &qword_256B427A0, MEMORY[0x24BDEFC28]);
    v3[0] = MEMORY[0x24BDF3E20];
    v3[1] = v2;
    result = MEMORY[0x242619B10](MEMORY[0x24BDEF3E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256B42790);
  }
  return result;
}

unint64_t sub_23C1EBEF8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256B41EA0;
  if (!qword_256B41EA0)
  {
    v1 = sub_23C1FB87C();
    result = MEMORY[0x242619B10](MEMORY[0x24BDF1078], v1);
    atomic_store(result, (unint64_t *)&qword_256B41EA0);
  }
  return result;
}

void sub_23C1EBF40(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
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
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[49];
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
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[2];
  _QWORD v46[2];
  _QWORD v47[3];

  v38 = a5;
  v33 = a4;
  v34 = a2;
  v35 = a3;
  v32[39] = a1;
  v32[35] = a6;
  sub_23C1FB87C();
  v37 = sub_23C1FB600();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41F00);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B42768);
  sub_23C1FB600();
  swift_getTupleTypeMetadata3();
  v6 = sub_23C1FBBE8();
  MEMORY[0x242619B10](MEMORY[0x24BDF5428], v6);
  v7 = sub_23C1FBB88();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B42770);
  v8 = sub_23C1FB600();
  v9 = sub_23C1FB600();
  v10 = sub_23C1FB600();
  v11 = sub_23C1FB600();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B42778);
  v12 = sub_23C1FB600();
  v47[0] = MEMORY[0x242619B10](MEMORY[0x24BDF4700], v7);
  v47[1] = sub_23C1BC328(&qword_256B42780, &qword_256B42770, MEMORY[0x24BDF1028]);
  v13 = MEMORY[0x24BDED308];
  v46[0] = MEMORY[0x242619B10](MEMORY[0x24BDED308], v8, v47);
  v46[1] = MEMORY[0x24BDECC60];
  v14 = MEMORY[0x24BDECC60];
  v45[0] = MEMORY[0x242619B10](v13, v9, v46);
  v45[1] = v14;
  v44[0] = MEMORY[0x242619B10](v13, v10, v45);
  v44[1] = v14;
  v43[0] = MEMORY[0x242619B10](v13, v11, v44);
  v43[1] = sub_23C1BC328(&qword_256B42788, &qword_256B42778, MEMORY[0x24BDEF370]);
  MEMORY[0x242619B10](v13, v12, v43);
  v32[40] = sub_23C1FB63C();
  v15 = sub_23C1FB600();
  v32[44] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41E98);
  v32[48] = v15;
  v32[46] = sub_23C1FB600();
  v32[47] = sub_23C1FB600();
  v36 = sub_23C1FB600();
  v32[10] = *(_QWORD *)(v36 - 8);
  v16 = MEMORY[0x24BDAC7A8](v36);
  v32[12] = (char *)v32 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v32[11] = (char *)v32 - v18;
  v19 = sub_23C1FB5F4();
  v32[14] = *(_QWORD *)(v19 - 8);
  v32[15] = v19;
  MEMORY[0x24BDAC7A8](v19);
  v32[13] = (char *)v32 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B428C8);
  MEMORY[0x24BDAC7A8](v21);
  v32[18] = (char *)v32 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40B58);
  v24 = MEMORY[0x24BDAC7A8](v23);
  v32[17] = (char *)v32 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = v35;
  v32[19] = *(_QWORD *)(v35 - 8);
  v27 = MEMORY[0x24BDAC7A8](v24);
  v32[7] = (char *)v32 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v27);
  v32[6] = (char *)v32 - v29;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41E80);
  v30 = v33;
  v31 = v34;
  v39 = v34;
  v40 = v33;
  MEMORY[0x242619ABC](255, &v39, MEMORY[0x24BDF3110], 0);
  sub_23C1FB600();
  v32[41] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41E88);
  sub_23C1FB600();
  v39 = v31;
  v40 = v26;
  v41 = v30;
  v42 = v38;
  type metadata accessor for MarketingInlineView.FocusedButton();
}

void sub_23C1EC3E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _QWORD *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
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

  v17 = sub_23C1FBDE0();
  v9[198] = v13;
  v9[199] = v14;
  *(_QWORD *)(v15 - 184) = swift_getOpaqueTypeConformance2();
  v18 = MEMORY[0x24BDECC60];
  *(_QWORD *)(v15 - 176) = MEMORY[0x24BDECC60];
  v19 = MEMORY[0x24BDED308];
  v20 = MEMORY[0x242619B10](MEMORY[0x24BDED308], v11, v15 - 184);
  v21 = sub_23C1BC328(&qword_256B41E90, v10, MEMORY[0x24BDF1028]);
  *(_QWORD *)(v15 - 200) = v20;
  *(_QWORD *)(v15 - 192) = v21;
  v9[45] = v21;
  v22 = MEMORY[0x242619B10](v19, v12, v15 - 200);
  *(_QWORD *)(v15 - 208) = MEMORY[0x242619B10](&unk_23C202760, a1);
  v23 = MEMORY[0x242619B10](MEMORY[0x24BEE4AB0], v17, v15 - 208);
  v9[198] = v12;
  v9[199] = v17;
  v9[200] = v22;
  v9[201] = v23;
  MEMORY[0x242619ABC](255, v9 + 198, MEMORY[0x24BDF3748], 0);
  swift_getTupleTypeMetadata2();
  v24 = sub_23C1FBBE8();
  MEMORY[0x242619B10](MEMORY[0x24BDF5428], v24);
  v25 = sub_23C1FBB88();
  v26 = sub_23C1FB600();
  *(_QWORD *)(v15 - 224) = MEMORY[0x242619B10](MEMORY[0x24BDF4700], v25);
  *(_QWORD *)(v15 - 216) = v18;
  MEMORY[0x242619B10](v19, v26, v15 - 224);
  v9[38] = sub_23C1FB63C();
  v9[37] = sub_23C1FB600();
  v9[36] = sub_23C1FB600();
  v9[43] = sub_23C1FB600();
  v27 = sub_23C1FB600();
  v9[1] = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v9[16] = (char *)&a9 - v28;
  v9[44] = v29;
  v30 = sub_23C1FB600();
  v9[4] = *(_QWORD *)(v30 - 8);
  MEMORY[0x24BDAC7A8](v30);
  v9[3] = (char *)&a9 - v31;
  v9[42] = v32;
  v33 = sub_23C1FB600();
  v9[5] = *(_QWORD *)(v33 - 8);
  v34 = MEMORY[0x24BDAC7A8](v33);
  v9[9] = (char *)&a9 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = MEMORY[0x24BDAC7A8](v34);
  v9[2] = (char *)&a9 - v37;
  MEMORY[0x24BDAC7A8](v36);
  v9[8] = (char *)&a9 - v38;
  v9[41] = v39;
  v40 = sub_23C1FB774();
  v9[22] = *(_QWORD *)(v40 - 8);
  v41 = MEMORY[0x24BDAC7A8](v40);
  v9[21] = (char *)&a9 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v41);
  v9[27] = (char *)&a9 - v43;
  v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B427A0);
  v9[28] = v44;
  v9[24] = *(_QWORD *)(v44 - 8);
  MEMORY[0x24BDAC7A8](v44);
  v9[23] = (char *)&a9 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B428D0);
  v9[25] = v46;
  MEMORY[0x24BDAC7A8](v46);
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42760);
  MEMORY[0x24BDAC7A8](v47);
  v9[29] = (char *)&a9 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41510);
  MEMORY[0x24BDAC7A8](v49);
  v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41518);
  MEMORY[0x24BDAC7A8](v50);
  v51 = type metadata accessor for MarketingOffer();
  v9[20] = v51;
  MEMORY[0x24BDAC7A8](v51);
  v9[30] = v47;
  v9[32] = v40;
  v52 = sub_23C1FB774();
  v9[33] = *(_QWORD *)(v52 - 8);
  v9[34] = v52;
  MEMORY[0x24BDAC7A8](v52);
  v9[31] = (char *)&a9 - v53;
  v9[198] = v9[50];
  v9[199] = v9[51];
  v9[200] = v9[49];
  v9[201] = v9[54];
  type metadata accessor for MarketingInlineView();
}

uint64_t sub_23C1EC900(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int EnumCaseMultiPayload;

  *(_QWORD *)(v1 + 208) = a1;
  sub_23C1EA38C();
  swift_getKeyPath();
  sub_23C1FBC54();
  swift_release();
  swift_release();
  sub_23C1FBC24();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v3, v4);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  return ((uint64_t (*)())((char *)sub_23C1EC988 + 4 * word_23C202610[EnumCaseMultiPayload]))();
}

uint64_t sub_23C1EC988()
{
  _QWORD *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
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
  unint64_t v24;
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

  v3 = sub_23C1FBB10();
  *v1 = v3;
  v0[51] = v3;
  swift_storeEnumTagMultiPayload();
  sub_23C1BC328(&qword_256B42798, &qword_256B427A0, MEMORY[0x24BDEFC28]);
  swift_retain();
  v4 = v0[29];
  sub_23C1FB768();
  v0[50] = sub_23C1EBE74();
  v5 = sub_23C1EBEF8();
  v6 = v0[53];
  v0[77] = v0[54];
  v0[78] = v5;
  v7 = MEMORY[0x24BDED308];
  v8 = MEMORY[0x242619B10](MEMORY[0x24BDED308], v6, v0 + 77);
  v9 = v0[38];
  v10 = MEMORY[0x242619B10](MEMORY[0x24BDEDC10], v9);
  v0[75] = v8;
  v0[76] = v10;
  v11 = v0[37];
  v12 = MEMORY[0x242619B10](v7, v11, v0 + 75);
  v13 = sub_23C1BC328(&qword_256B41EB0, &qword_256B41E98, MEMORY[0x24BDEB950]);
  v0[73] = v12;
  v0[74] = v13;
  v14 = v0[36];
  v0[71] = MEMORY[0x242619B10](v7, v14, v0 + 73);
  v0[72] = v2;
  v0[69] = MEMORY[0x242619B10](v7, v0[43], v0 + 71);
  v15 = MEMORY[0x24BDECC60];
  v0[70] = MEMORY[0x24BDECC60];
  v0[67] = MEMORY[0x242619B10](v7, v0[44], v0 + 69);
  v0[68] = MEMORY[0x24BDEDBB8];
  v0[65] = MEMORY[0x242619B10](v7, v0[42], v0 + 67);
  v0[66] = v0[45];
  v16 = MEMORY[0x242619B10](v7, v0[41], v0 + 65);
  v17 = MEMORY[0x242619B10](MEMORY[0x24BDEDC10], v0[40]);
  v0[63] = v8;
  v0[64] = v17;
  v0[61] = MEMORY[0x242619B10](v7, v0[48], v0 + 63);
  v0[62] = v13;
  v18 = v9;
  v0[59] = MEMORY[0x242619B10](v7, v0[46], v0 + 61);
  v0[60] = MEMORY[0x24BDEEC40];
  v0[57] = MEMORY[0x242619B10](v7, v0[47], v0 + 59);
  v0[58] = v15;
  v19 = MEMORY[0x242619B10](v7, v0[52], v0 + 57);
  v0[55] = v16;
  v0[56] = v19;
  v21 = v0[53];
  v20 = v0[54];
  v22 = v0[32];
  MEMORY[0x242619B10](MEMORY[0x24BDEF3E0], v22, v0 + 55);
  v23 = v0[31];
  sub_23C1EA404(v4, v0[30]);
  sub_23C1BC2EC(v4, &qword_256B42760);
  swift_release();
  v0[53] = sub_23C1EBE74();
  v24 = sub_23C1EBEF8();
  v0[150] = v20;
  v0[151] = v24;
  v25 = MEMORY[0x24BDED308];
  v26 = MEMORY[0x242619B10](MEMORY[0x24BDED308], v21, v0 + 150);
  v27 = MEMORY[0x24BDEDC10];
  v28 = MEMORY[0x242619B10](MEMORY[0x24BDEDC10], v18);
  v0[148] = v26;
  v0[149] = v28;
  v29 = MEMORY[0x242619B10](v25, v11, v0 + 148);
  v30 = sub_23C1BC328(&qword_256B41EB0, &qword_256B41E98, MEMORY[0x24BDEB950]);
  v0[146] = v29;
  v0[147] = v30;
  v0[144] = MEMORY[0x242619B10](v25, v14, v0 + 146);
  v31 = MEMORY[0x24BDEEC40];
  v0[145] = MEMORY[0x24BDEEC40];
  v0[142] = MEMORY[0x242619B10](v25, v0[43], v0 + 144);
  v32 = MEMORY[0x24BDECC60];
  v0[143] = MEMORY[0x24BDECC60];
  v0[140] = MEMORY[0x242619B10](v25, v0[44], v0 + 142);
  v0[141] = MEMORY[0x24BDEDBB8];
  v0[138] = MEMORY[0x242619B10](v25, v0[42], v0 + 140);
  v0[139] = v0[45];
  v33 = MEMORY[0x242619B10](v25, v0[41], v0 + 138);
  v34 = MEMORY[0x242619B10](v27, v0[40]);
  v0[136] = v26;
  v0[137] = v34;
  v0[134] = MEMORY[0x242619B10](v25, v0[48], v0 + 136);
  v0[135] = v30;
  v0[132] = MEMORY[0x242619B10](v25, v0[46], v0 + 134);
  v0[133] = v31;
  v0[130] = MEMORY[0x242619B10](v25, v0[47], v0 + 132);
  v0[131] = v32;
  v35 = MEMORY[0x242619B10](v25, v0[52], v0 + 130);
  v0[128] = v33;
  v0[129] = v35;
  v36 = MEMORY[0x24BDEF3E0];
  v37 = MEMORY[0x242619B10](MEMORY[0x24BDEF3E0], v22, v0 + 128);
  v0[126] = v0[53];
  v0[127] = v37;
  v38 = v0[34];
  MEMORY[0x242619B10](v36, v38, v0 + 126);
  sub_23C1C87C4(v23, v38, v0[35]);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0[33] + 8))(v23, v38);
}

uint64_t sub_23C1EDB48()
{
  return sub_23C1EEFD0((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23C1EBF40);
}

void sub_23C1EDB54(uint64_t a1)
{
  uint64_t v1;

  v1 = MEMORY[0x24BDAC7A8](a1);
  MEMORY[0x24BDAC7A8](v1);
  type metadata accessor for MarketingInlineView();
}

uint64_t sub_23C1EDBE0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);

  v8 = *(void (**)(uint64_t))(v2 + *(int *)(a1 + 60));
  sub_23C1EA38C();
  swift_getKeyPath();
  sub_23C1FBC54();
  swift_release();
  swift_release();
  v9 = *(_QWORD *)(v7 - 104);
  v10 = *(_QWORD *)(v7 - 96);
  *(_BYTE *)(v7 - 136) = *(_BYTE *)(v7 - 112);
  *(_QWORD *)(v7 - 128) = v9;
  *(_QWORD *)(v7 - 120) = v10;
  v8(v7 - 136);
  swift_bridgeObjectRelease();
  sub_23C1CD350(v5, v1, v4);
  v11 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v11(v5, v1);
  sub_23C1C87C4(v4, v1, v3);
  return ((uint64_t (*)(uint64_t, uint64_t))v11)(v4, v1);
}

void sub_23C1EDCA8()
{
  type metadata accessor for MarketingInlineView();
}

uint64_t sub_23C1EDCD4()
{
  sub_23C1EA38C();
  sub_23C1FBC60();
  return swift_release();
}

void sub_23C1EDD04()
{
  sub_23C1EF0F4();
}

uint64_t sub_23C1EDD0C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23C1EDD44()
{
  return swift_allocateGenericValueMetadata();
}

void sub_23C1EDD4C()
{
  unint64_t v0;

  sub_23C1EE5CC();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t *sub_23C1EDDD8(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    v4 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B41EC8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_23C1FB5F4();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v4, a2, v7);
    }
    else
    {
      *v4 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v9 = a3[13];
    v10 = (char *)v4 + v9;
    v11 = (char *)a2 + v9;
    v12 = *(_QWORD *)v11;
    v13 = *((_QWORD *)v11 + 1);
    v14 = v11[16];
    sub_23C1CC46C();
    *(_QWORD *)v10 = v12;
    *((_QWORD *)v10 + 1) = v13;
    v10[16] = v14;
    v15 = a3[14];
    v16 = a3[15];
    v17 = (char *)v4 + v15;
    v18 = (char *)a2 + v15;
    *v17 = *v18;
    *((_QWORD *)v17 + 1) = *((_QWORD *)v18 + 1);
    v17[16] = v18[16];
    v19 = (uint64_t *)((char *)v4 + v16);
    v20 = (uint64_t *)((char *)a2 + v16);
    v21 = v20[1];
    *v19 = *v20;
    v19[1] = v21;
    v22 = a3[16];
    v23 = (uint64_t *)((char *)v4 + v22);
    v24 = (uint64_t *)((char *)a2 + v22);
    v25 = v24[1];
    *v23 = *v24;
    v23[1] = v25;
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_23C1EDF38(uint64_t a1)
{
  uint64_t v2;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256B41EC8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v2 = sub_23C1FB5F4();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  }
  else
  {
    swift_release();
  }
  sub_23C1CC408();
  swift_release();
  swift_release();
  return swift_release();
}

_QWORD *sub_23C1EDFE0(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256B41EC8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_23C1FB5F4();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v7 = a3[13];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = *(_QWORD *)v9;
  v11 = *((_QWORD *)v9 + 1);
  v12 = v9[16];
  sub_23C1CC46C();
  *(_QWORD *)v8 = v10;
  *((_QWORD *)v8 + 1) = v11;
  v8[16] = v12;
  v13 = a3[14];
  v14 = a3[15];
  v15 = (char *)a1 + v13;
  v16 = (char *)a2 + v13;
  *v15 = *v16;
  *((_QWORD *)v15 + 1) = *((_QWORD *)v16 + 1);
  v15[16] = v16[16];
  v17 = (_QWORD *)((char *)a1 + v14);
  v18 = (_QWORD *)((char *)a2 + v14);
  v19 = v18[1];
  *v17 = *v18;
  v17[1] = v19;
  v20 = a3[16];
  v21 = (_QWORD *)((char *)a1 + v20);
  v22 = (_QWORD *)((char *)a2 + v20);
  v23 = v22[1];
  *v21 = *v22;
  v21[1] = v23;
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *sub_23C1EE118(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;

  if (a1 != a2)
  {
    sub_23C1BC2EC((uint64_t)a1, &qword_256B41EC8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B41EC8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_23C1FB5F4();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v7 = a3[13];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = *(_QWORD *)v9;
  v11 = *((_QWORD *)v9 + 1);
  v12 = v9[16];
  sub_23C1CC46C();
  *(_QWORD *)v8 = v10;
  *((_QWORD *)v8 + 1) = v11;
  v8[16] = v12;
  sub_23C1CC408();
  v13 = a3[14];
  v14 = (char *)a1 + v13;
  v15 = (char *)a2 + v13;
  *v14 = *((_BYTE *)a2 + v13);
  *((_QWORD *)v14 + 1) = *(_QWORD *)((char *)a2 + v13 + 8);
  swift_retain();
  swift_release();
  v14[16] = v15[16];
  v16 = a3[15];
  v17 = (_QWORD *)((char *)a1 + v16);
  v18 = (_QWORD *)((char *)a2 + v16);
  v19 = v18[1];
  *v17 = *v18;
  v17[1] = v19;
  swift_retain();
  swift_release();
  v20 = a3[16];
  v21 = (_QWORD *)((char *)a1 + v20);
  v22 = (_QWORD *)((char *)a2 + v20);
  v23 = v22[1];
  *v21 = *v22;
  v21[1] = v23;
  swift_retain();
  swift_release();
  return a1;
}

char *sub_23C1EE294(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  __int128 v12;
  char *v13;
  char *v14;
  uint64_t v15;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41EC8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_23C1FB5F4();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = a3[13];
  v9 = a3[14];
  v10 = &a1[v8];
  v11 = &a2[v8];
  v12 = *(_OWORD *)v11;
  v10[16] = v11[16];
  *(_OWORD *)v10 = v12;
  v13 = &a1[v9];
  v14 = &a2[v9];
  *(_OWORD *)v13 = *(_OWORD *)v14;
  v13[16] = v14[16];
  v15 = a3[16];
  *(_OWORD *)&a1[a3[15]] = *(_OWORD *)&a2[a3[15]];
  *(_OWORD *)&a1[v15] = *(_OWORD *)&a2[v15];
  return a1;
}

char *sub_23C1EE378(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char v11;
  uint64_t v12;
  char *v13;
  char *v14;

  if (a1 != a2)
  {
    sub_23C1BC2EC((uint64_t)a1, &qword_256B41EC8);
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41EC8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_23C1FB5F4();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  v8 = a3[13];
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = v10[16];
  *(_OWORD *)v9 = *(_OWORD *)v10;
  v9[16] = v11;
  sub_23C1CC408();
  v12 = a3[14];
  v13 = &a1[v12];
  v14 = &a2[v12];
  *v13 = a2[v12];
  *((_QWORD *)v13 + 1) = *(_QWORD *)&a2[v12 + 8];
  swift_release();
  v13[16] = v14[16];
  *(_OWORD *)&a1[a3[15]] = *(_OWORD *)&a2[a3[15]];
  swift_release();
  *(_OWORD *)&a1[a3[16]] = *(_OWORD *)&a2[a3[16]];
  swift_release();
  return a1;
}

uint64_t sub_23C1EE4B8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C1EE4C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_256B427A8);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 60));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_23C1EE544()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C1EE550(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = __swift_instantiateConcreteTypeFromMangledName(qword_256B427A8);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 60)) = (a2 - 1);
  return result;
}

void sub_23C1EE5CC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256B42830[0])
  {
    sub_23C1FB5F4();
    v0 = sub_23C1FB5B8();
    if (!v1)
      atomic_store(v0, qword_256B42830);
  }
}

void sub_23C1EE620(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *a1;
  v1 = a1[1];
  v3 = a1[2];
  v4 = a1[3];
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B42760);
  sub_23C1FB87C();
  sub_23C1FB600();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41E80);
  v5 = v2;
  v6 = v3;
  MEMORY[0x242619ABC](255, &v5, MEMORY[0x24BDF3110], 0);
  sub_23C1FB600();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41E88);
  sub_23C1FB600();
  v5 = v2;
  v6 = v1;
  v7 = v3;
  v8 = v4;
  type metadata accessor for MarketingInlineView.FocusedButton();
}

uint64_t sub_23C1EE700(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t OpaqueTypeConformance2;
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
  unint64_t v47;
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
  _QWORD v62[2];
  uint64_t v63;
  _QWORD v64[2];
  _QWORD v65[2];
  _QWORD v66[2];
  _QWORD v67[2];
  _QWORD v68[2];
  _QWORD v69[2];
  _QWORD v70[2];
  _QWORD v71[2];
  _QWORD v72[2];
  _QWORD v73[2];
  _QWORD v74[2];
  _QWORD v75[2];
  _QWORD v76[36];

  v8 = sub_23C1FBDE0();
  *(_QWORD *)(v6 - 120) = v2;
  *(_QWORD *)(v6 - 112) = v4;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v10 = MEMORY[0x24BDECC60];
  *(_QWORD *)(v6 - 136) = OpaqueTypeConformance2;
  *(_QWORD *)(v6 - 128) = v10;
  v11 = v10;
  v12 = MEMORY[0x24BDED308];
  v13 = MEMORY[0x242619B10](MEMORY[0x24BDED308], v3, v6 - 136);
  v59 = sub_23C1BC328(&qword_256B41E90, v5, MEMORY[0x24BDF1028]);
  *(_QWORD *)(v6 - 152) = v13;
  *(_QWORD *)(v6 - 144) = v59;
  v14 = MEMORY[0x242619B10](v12, v1, v6 - 152);
  *(_QWORD *)(v6 - 160) = MEMORY[0x242619B10](&unk_23C202760, a1);
  v61 = MEMORY[0x242619B10](MEMORY[0x24BEE4AB0], v8, v6 - 160);
  *(_QWORD *)(v6 - 120) = v1;
  *(_QWORD *)(v6 - 112) = v8;
  *(_QWORD *)(v6 - 104) = v14;
  *(_QWORD *)(v6 - 96) = v61;
  MEMORY[0x242619ABC](255, v6 - 120, MEMORY[0x24BDF3748], 0);
  swift_getTupleTypeMetadata2();
  v15 = sub_23C1FBBE8();
  v16 = MEMORY[0x24BDF5428];
  MEMORY[0x242619B10](MEMORY[0x24BDF5428], v15);
  v17 = sub_23C1FBB88();
  v18 = sub_23C1FB600();
  *(_QWORD *)(v6 - 176) = MEMORY[0x242619B10](MEMORY[0x24BDF4700], v17);
  *(_QWORD *)(v6 - 168) = v11;
  MEMORY[0x242619B10](v12, v18, v6 - 176);
  v53 = sub_23C1FB63C();
  v52 = sub_23C1FB600();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41E98);
  v54 = sub_23C1FB600();
  v55 = sub_23C1FB600();
  v56 = sub_23C1FB600();
  v57 = sub_23C1FB600();
  v50 = sub_23C1FB600();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41F00);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B42768);
  sub_23C1FB600();
  swift_getTupleTypeMetadata3();
  v19 = sub_23C1FBBE8();
  MEMORY[0x242619B10](v16, v19);
  v20 = sub_23C1FBB88();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B42770);
  v21 = sub_23C1FB600();
  v22 = sub_23C1FB600();
  v23 = sub_23C1FB600();
  v24 = sub_23C1FB600();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B42778);
  v25 = sub_23C1FB600();
  v26 = MEMORY[0x242619B10](MEMORY[0x24BDF4700], v20);
  v27 = sub_23C1BC328(&qword_256B42780, &qword_256B42770, MEMORY[0x24BDF1028]);
  *(_QWORD *)(v6 - 192) = v26;
  *(_QWORD *)(v6 - 184) = v27;
  *(_QWORD *)(v6 - 208) = MEMORY[0x242619B10](v12, v21, v6 - 192);
  v28 = MEMORY[0x24BDECC60];
  *(_QWORD *)(v6 - 200) = MEMORY[0x24BDECC60];
  *(_QWORD *)(v6 - 224) = MEMORY[0x242619B10](v12, v22, v6 - 208);
  *(_QWORD *)(v6 - 216) = v28;
  *(_QWORD *)(v6 - 240) = MEMORY[0x242619B10](v12, v23, v6 - 224);
  *(_QWORD *)(v6 - 232) = v28;
  v29 = MEMORY[0x242619B10](v12, v24, v6 - 240);
  v30 = sub_23C1BC328(&qword_256B42788, &qword_256B42778, MEMORY[0x24BDEF370]);
  *(_QWORD *)(v6 - 256) = v29;
  *(_QWORD *)(v6 - 248) = v30;
  MEMORY[0x242619B10](v12, v25, v6 - 256);
  v31 = sub_23C1FB63C();
  v32 = sub_23C1FB600();
  v33 = sub_23C1FB600();
  v34 = sub_23C1FB600();
  v48 = sub_23C1FB600();
  v49 = sub_23C1FB774();
  v60 = sub_23C1FB774();
  v35 = sub_23C1FBB40();
  v47 = sub_23C1EBE74();
  v76[0] = v58;
  v76[1] = sub_23C1EBEF8();
  v36 = MEMORY[0x242619B10](v12, v51, v76);
  v75[0] = v36;
  v75[1] = MEMORY[0x242619B10](MEMORY[0x24BDEDC10], v53);
  v37 = MEMORY[0x242619B10](v12, v52, v75);
  v38 = sub_23C1BC328(&qword_256B41EB0, &qword_256B41E98, MEMORY[0x24BDEB950]);
  v74[0] = v37;
  v74[1] = v38;
  v73[0] = MEMORY[0x242619B10](v12, v54, v74);
  v73[1] = MEMORY[0x24BDEEC40];
  v72[0] = MEMORY[0x242619B10](v12, v55, v73);
  v72[1] = MEMORY[0x24BDECC60];
  v71[0] = MEMORY[0x242619B10](v12, v56, v72);
  v71[1] = MEMORY[0x24BDEDBB8];
  v70[0] = MEMORY[0x242619B10](v12, v57, v71);
  v70[1] = v59;
  v39 = MEMORY[0x242619B10](v12, v50, v70);
  v69[0] = v36;
  v69[1] = MEMORY[0x242619B10](MEMORY[0x24BDEDC10], v31);
  v68[0] = MEMORY[0x242619B10](v12, v32, v69);
  v68[1] = v38;
  v67[0] = MEMORY[0x242619B10](v12, v33, v68);
  v67[1] = MEMORY[0x24BDEEC40];
  v66[0] = MEMORY[0x242619B10](v12, v34, v67);
  v66[1] = MEMORY[0x24BDECC60];
  v65[0] = v39;
  v65[1] = MEMORY[0x242619B10](v12, v48, v66);
  v40 = MEMORY[0x24BDEF3E0];
  v64[0] = v47;
  v64[1] = MEMORY[0x242619B10](MEMORY[0x24BDEF3E0], v49, v65);
  v63 = MEMORY[0x242619B10](v40, v60, v64);
  v41 = MEMORY[0x242619B10](MEMORY[0x24BDF3F50], v35, &v63);
  *(_QWORD *)(v6 - 120) = v35;
  *(_QWORD *)(v6 - 112) = v41;
  v42 = MEMORY[0x242619ABC](255, v6 - 120, MEMORY[0x24BE351A0], 0);
  *(_QWORD *)(v6 - 120) = v35;
  *(_QWORD *)(v6 - 112) = v41;
  v43 = swift_getOpaqueTypeConformance2();
  *(_QWORD *)(v6 - 120) = v42;
  *(_QWORD *)(v6 - 112) = v8;
  *(_QWORD *)(v6 - 104) = v43;
  *(_QWORD *)(v6 - 96) = v61;
  MEMORY[0x242619ABC](255, v6 - 120, MEMORY[0x24BDF24C8], 0);
  v44 = sub_23C1FB600();
  *(_QWORD *)(v6 - 120) = v42;
  *(_QWORD *)(v6 - 112) = v8;
  *(_QWORD *)(v6 - 104) = v43;
  *(_QWORD *)(v6 - 96) = v61;
  v62[0] = swift_getOpaqueTypeConformance2();
  v62[1] = MEMORY[0x24BDF0910];
  v45 = MEMORY[0x242619B10](v12, v44, v62);
  *(_QWORD *)(v6 - 120) = v44;
  *(_QWORD *)(v6 - 112) = v45;
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23C1EEE24(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C1EEE70 + 4 * byte_23C20261F[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C1EEEA4 + 4 * byte_23C20261A[v4]))();
}

uint64_t sub_23C1EEEA4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1EEEAC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C1EEEB4);
  return result;
}

uint64_t sub_23C1EEEC0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C1EEEC8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C1EEECC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1EEED4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void sub_23C1EEEE0()
{
  JUMPOUT(0x242619B10);
}

uint64_t sub_23C1EEEF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MarketingOffer();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23C1EEF34(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for MarketingOffer();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_23C1EEF74()
{
  uint64_t v0;

  sub_23C1EDB54(*(_QWORD *)(v0 + 48));
}

void sub_23C1EEF94()
{
  sub_23C1EF18C();
}

void sub_23C1EEFB0()
{
  sub_23C1EACB4();
}

uint64_t sub_23C1EEFC4()
{
  return sub_23C1EEFD0((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23C1EAF64);
}

uint64_t sub_23C1EEFD0(uint64_t (*a1)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v1;

  return a1(v1[6], v1[2], v1[3], v1[4], v1[5]);
}

void objectdestroy_2Tm_0()
{
  type metadata accessor for MarketingInlineView();
}

uint64_t sub_23C1EF014(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(a1 - 8) + 80);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B41EC8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v3 = sub_23C1FB5F4();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v1 + ((v2 + 48) & ~v2), v3);
  }
  else
  {
    swift_release();
  }
  sub_23C1CC408();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_23C1EF0EC()
{
  sub_23C1EF0F4();
}

void sub_23C1EF0F4()
{
  type metadata accessor for MarketingInlineView();
}

void sub_23C1EF12C()
{
  sub_23C1EDCA8();
}

void sub_23C1EF170()
{
  sub_23C1EF18C();
}

void sub_23C1EF18C()
{
  sub_23C1EB090();
}

uint64_t sub_23C1EF1B4(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_23C1EF1C4(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_23C1EF1B4(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_23C1EF1F4(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_23C1DA540(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_23C1EF224(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_23C1EF2F4(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_23C1C4C7C((uint64_t)v12, *a3);
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
      sub_23C1C4C7C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_23C1EF2F4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_23C1FBDF8();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_23C1EF4AC(a5, a6);
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
  v8 = sub_23C1FBE64();
  if (!v8)
  {
    sub_23C1FBE70();
    __break(1u);
LABEL_17:
    result = sub_23C1FBEAC();
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

uint64_t sub_23C1EF4AC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23C1EF540(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23C1EF718(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_23C1EF718(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23C1EF540(uint64_t a1, unint64_t a2)
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
      v3 = sub_23C1EF6B4(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_23C1FBE28();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_23C1FBE70();
      __break(1u);
LABEL_10:
      v2 = sub_23C1FBD08();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_23C1FBEAC();
    __break(1u);
LABEL_14:
    result = sub_23C1FBE70();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_23C1EF6B4(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B428F8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23C1EF718(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B428F8);
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
  result = sub_23C1FBEAC();
  __break(1u);
  return result;
}

uint64_t ServiceSubscriptionMonitorFeature.environment.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + 24);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v1 + 8);
  *(_QWORD *)(a1 + 24) = v2;
  swift_retain();
  return swift_retain();
}

__n128 ServiceSubscriptionMonitorFeature.init(environment:)@<Q0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 16);
  *a2 = *(_OWORD *)a1;
  a2[1] = v3;
  return result;
}

uint64_t ServiceSubscriptionMonitorFeature.reduce(localState:sharedState:sideEffects:action:)(_BYTE *a1, uint64_t a2, unint64_t *a3)
{
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  int *v12;
  char *v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t, uint64_t);
  char *v19;
  unint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41248);
  v7 = *(_QWORD *)(v6 - 8);
  result = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*a1 & 1) == 0)
  {
    v11 = v3[3];
    v28 = *v3;
    *a1 = 1;
    v12 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_256B42900);
    v13 = &v10[v12[16]];
    v14 = &v10[v12[20]];
    v15 = &v10[v12[24]];
    sub_23C1EFAF4();
    sub_23C1FBE10();
    sub_23C1FBD8C();
    v16 = *MEMORY[0x24BE2B580];
    v17 = sub_23C1FBC48();
    v18 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 104);
    v29 = *(_OWORD *)(v3 + 1);
    v19 = v13;
    v20 = a3;
    v18(v19, v16, v17);
    v21 = *MEMORY[0x24BE2B550];
    v22 = sub_23C1FBC3C();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 104))(v14, v21, v22);
    v23 = swift_allocObject();
    *(_QWORD *)(v23 + 16) = v28;
    *(_OWORD *)(v23 + 24) = v29;
    *(_QWORD *)(v23 + 40) = v11;
    *(_QWORD *)v15 = &unk_256B42918;
    *((_QWORD *)v15 + 1) = v23;
    (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v10, *MEMORY[0x24BE2B438], v6);
    v24 = *a3;
    swift_retain();
    swift_retain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v24 = sub_23C1C48DC(0, *(_QWORD *)(v24 + 16) + 1, 1, v24);
    v26 = *(_QWORD *)(v24 + 16);
    v25 = *(_QWORD *)(v24 + 24);
    if (v26 >= v25 >> 1)
      v24 = sub_23C1C48DC(v25 > 1, v26 + 1, 1, v24);
    *(_QWORD *)(v24 + 16) = v26 + 1;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v7 + 32))(v24+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(_QWORD *)(v7 + 72) * v26, v10, v6);
    *v20 = v24;
  }
  return result;
}

unint64_t sub_23C1EFAF4()
{
  unint64_t result;

  result = qword_256B42908;
  if (!qword_256B42908)
  {
    result = MEMORY[0x242619B10](&unk_23C20295C, &type metadata for ServiceSubscriptionMonitorFeature.TaskIdentifier);
    atomic_store(result, &qword_256B42908);
  }
  return result;
}

uint64_t sub_23C1EFB38(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  _QWORD *v7;
  uint64_t (*v9)(_QWORD *);

  v5[12] = a4;
  v5[13] = a5;
  v5[14] = sub_23C1FBD74();
  v5[15] = sub_23C1FBD68();
  v9 = (uint64_t (*)(_QWORD *))((char *)a2 + *a2);
  v7 = (_QWORD *)swift_task_alloc();
  v5[16] = v7;
  *v7 = v5;
  v7[1] = sub_23C1EFBC8;
  return v9(v5 + 7);
}

uint64_t sub_23C1EFBC8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v1;
  *(_QWORD *)(*v1 + 136) = v0;
  swift_task_dealloc();
  *(_QWORD *)(v2 + 144) = sub_23C1FBD50();
  *(_QWORD *)(v2 + 152) = v3;
  return swift_task_switch();
}

uint64_t sub_23C1EFC54()
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
  sub_23C1FBD98();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
  v0[20] = sub_23C1FBD68();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v0[5]);
  v5 = (_QWORD *)swift_task_alloc();
  v0[21] = (uint64_t)v5;
  *v5 = v0;
  v5[1] = sub_23C1EFDB4;
  return sub_23C1FBD5C();
}

uint64_t sub_23C1EFDB4()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_23C1EFE08()
{
  uint64_t v0;
  uint64_t (*v1)(void);
  _QWORD *v2;
  uint64_t (*v4)(void);

  if (*(_BYTE *)(v0 + 192) == 1)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    v1 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    v4 = (uint64_t (*)(void))(**(int **)(v0 + 96) + *(_QWORD *)(v0 + 96));
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 176) = v2;
    *v2 = v0;
    v2[1] = sub_23C1EFE8C;
    v1 = v4;
  }
  return v1();
}

uint64_t sub_23C1EFE8C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 184) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23C1EFEEC()
{
  uint64_t *v0;
  _QWORD *v1;

  v0[20] = sub_23C1FBD68();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v0[5]);
  v1 = (_QWORD *)swift_task_alloc();
  v0[21] = (uint64_t)v1;
  *v1 = v0;
  v1[1] = sub_23C1EFDB4;
  return sub_23C1FBD5C();
}

uint64_t sub_23C1EFF90()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C1EFFC4()
{
  uint64_t v0;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C1F0004()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23C1F0030(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = (int *)v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_23C1BD8B8;
  return sub_23C1EFB38(a1, v4, v5, v7, v6);
}

unint64_t sub_23C1F00B0()
{
  unint64_t result;

  result = qword_256B42920;
  if (!qword_256B42920)
  {
    result = MEMORY[0x242619B10](&protocol conformance descriptor for ServiceSubscriptionMonitorAction, &type metadata for ServiceSubscriptionMonitorAction);
    atomic_store(result, (unint64_t *)&qword_256B42920);
  }
  return result;
}

unint64_t sub_23C1F00F8()
{
  unint64_t result;

  result = qword_256B42928;
  if (!qword_256B42928)
  {
    result = MEMORY[0x242619B10](&protocol conformance descriptor for ServiceSubscriptionMonitorAction, &type metadata for ServiceSubscriptionMonitorAction);
    atomic_store(result, (unint64_t *)&qword_256B42928);
  }
  return result;
}

unint64_t sub_23C1F0140()
{
  unint64_t result;

  result = qword_256B42930;
  if (!qword_256B42930)
  {
    result = MEMORY[0x242619B10](&protocol conformance descriptor for ServiceSubscriptionMonitorLocalState, &type metadata for ServiceSubscriptionMonitorLocalState);
    atomic_store(result, (unint64_t *)&qword_256B42930);
  }
  return result;
}

unint64_t sub_23C1F0188()
{
  unint64_t result;

  result = qword_256B42938;
  if (!qword_256B42938)
  {
    result = MEMORY[0x242619B10](MEMORY[0x24BE2B430], MEMORY[0x24BE2B428]);
    atomic_store(result, (unint64_t *)&qword_256B42938);
  }
  return result;
}

uint64_t destroy for ServiceSubscriptionMonitorEnvironment()
{
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for ServiceSubscriptionMonitorEnvironment(uint64_t a1, uint64_t a2)
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

_QWORD *assignWithCopy for ServiceSubscriptionMonitorEnvironment(_QWORD *a1, _QWORD *a2)
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

_OWORD *assignWithTake for ServiceSubscriptionMonitorEnvironment(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ServiceSubscriptionMonitorEnvironment(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ServiceSubscriptionMonitorEnvironment(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ServiceSubscriptionMonitorFeature()
{
  return &type metadata for ServiceSubscriptionMonitorFeature;
}

uint64_t storeEnumTagSinglePayload for ServiceSubscriptionMonitorFeature.TaskIdentifier(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23C1F03C0 + 4 * byte_23C202880[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23C1F03E0 + 4 * byte_23C202885[v4]))();
}

_BYTE *sub_23C1F03C0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23C1F03E0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C1F03E8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C1F03F0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C1F03F8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C1F0400(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for ServiceSubscriptionMonitorFeature.TaskIdentifier()
{
  return &type metadata for ServiceSubscriptionMonitorFeature.TaskIdentifier;
}

unint64_t sub_23C1F0420()
{
  unint64_t result;

  result = qword_256B42940;
  if (!qword_256B42940)
  {
    result = MEMORY[0x242619B10](&unk_23C202934, &type metadata for ServiceSubscriptionMonitorFeature.TaskIdentifier);
    atomic_store(result, (unint64_t *)&qword_256B42940);
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

uint64_t dispatch thunk of MarketingOfferTemplateParsing.template.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of MarketingOfferTemplateParsing.init(template:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of MarketingOfferTemplateParsing.marketingOffer(from:platform:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of MarketingOfferTemplateParsing.actionItems(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

void sub_23C1F04E8()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41510);
  MEMORY[0x24BDAC7A8](v0);
  v1 = type metadata accessor for MarketingOffer();
  MEMORY[0x24BDAC7A8](v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B41518);
  sub_23C1FBC24();
  v2 = (char *)sub_23C1F05B8 + 4 * byte_23C2029C0[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23C1F05B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_23C1CD008(v3, v2, (uint64_t (*)(_QWORD))type metadata accessor for MarketingOffer);
  sub_23C1CD008(v2, v0, (uint64_t (*)(_QWORD))type metadata accessor for MarketingOffer);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v4 + 56))(v0, 0, 1, v1);
}

void sub_23C1F0674()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(_QWORD);
  char *v5;
  uint64_t v6;

  v1 = sub_23C1FB468();
  MEMORY[0x24BDAC7A8](v1);
  v2 = type metadata accessor for MarketingButtonFeature.TaskIdentifier();
  MEMORY[0x24BDAC7A8](v2);
  sub_23C1B50D4(v0, (uint64_t)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  v5 = (char *)sub_23C1F0740 + 4 * byte_23C2029C5[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23C1F0740()
{
  uint64_t v0;
  uint64_t v1;
  unsigned __int8 v2;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_BYTE *)v0;
  sub_23C1FBFD8();
  MarketingOfferPlacement.rawValue.getter(v2);
  sub_23C1FBCF0();
  swift_bridgeObjectRelease();
  sub_23C1FBFE4();
  if (!v1)
    return swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23C1FBCF0();
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_23C1F086C()
{
  sub_23C1FBFCC();
  sub_23C1F0674();
  return sub_23C1FBFFC();
}

uint64_t sub_23C1F08AC()
{
  sub_23C1FBFCC();
  sub_23C1F0674();
  return sub_23C1FBFFC();
}

__n128 MarketingButtonFeature.init(environment:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __int128 v2;
  __int128 v3;
  __n128 result;
  __int128 v5;

  v2 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v2;
  v3 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 48) = v3;
  result = *(__n128 *)(a1 + 64);
  v5 = *(_OWORD *)(a1 + 80);
  *(__n128 *)(a2 + 64) = result;
  *(_OWORD *)(a2 + 80) = v5;
  return result;
}

void MarketingButtonFeature.reduce(localState:sharedState:sideEffects:action:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
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
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t (*v44)(_QWORD);
  char *v45;
  _QWORD v46[6];
  uint64_t v47;
  char *v48;
  char *v49;
  char *v50;
  char *v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  char *v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  char *v61;
  char *v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;

  v73 = a1;
  v74 = a4;
  v72 = a3;
  v67 = a2;
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40928);
  v46[5] = *(_QWORD *)(v47 - 8);
  MEMORY[0x24BDAC7A8](v47);
  v61 = (char *)v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v54 = type metadata accessor for MarketingAction();
  MEMORY[0x24BDAC7A8](v54);
  v55 = (char *)v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = sub_23C1FB468();
  v57 = *(_QWORD *)(v58 - 8);
  v7 = MEMORY[0x24BDAC7A8](v58);
  v53 = (char *)v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = v8;
  MEMORY[0x24BDAC7A8](v7);
  v50 = (char *)v46 - v9;
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41508);
  MEMORY[0x24BDAC7A8](v59);
  v60 = (char *)v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40DB8);
  MEMORY[0x24BDAC7A8](v11);
  v64 = (char *)v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v63 = type metadata accessor for MarketingOffer();
  v65 = *(_QWORD *)(v63 - 8);
  v13 = *(_QWORD *)(v65 + 64);
  v14 = MEMORY[0x24BDAC7A8](v63);
  v46[3] = (char *)v46 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v51 = (char *)v46 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v62 = (char *)v46 - v17;
  v18 = type metadata accessor for MarketingActionItem();
  v19 = *(_QWORD *)(v18 - 8);
  v20 = *(_QWORD *)(v19 + 64);
  v21 = MEMORY[0x24BDAC7A8](v18);
  v46[2] = (char *)v46 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BDAC7A8](v21);
  v49 = (char *)v46 - v23;
  MEMORY[0x24BDAC7A8](v22);
  v66 = (char *)v46 - v24;
  v69 = type metadata accessor for MarketingButtonFeature.TaskIdentifier();
  v25 = MEMORY[0x24BDAC7A8](v69);
  v26 = MEMORY[0x24BDAC7A8](v25);
  v46[1] = (char *)v46 - v27;
  v28 = MEMORY[0x24BDAC7A8](v26);
  v48 = (char *)v46 - v29;
  v30 = MEMORY[0x24BDAC7A8](v28);
  v68 = (char *)v46 - v31;
  MEMORY[0x24BDAC7A8](v30);
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41238);
  v70 = *(_QWORD *)(v32 - 8);
  v71 = v32;
  v33 = MEMORY[0x24BDAC7A8](v32);
  v34 = MEMORY[0x24BDAC7A8](v33);
  v46[4] = (char *)v46 - v35;
  v36 = MEMORY[0x24BDAC7A8](v34);
  v56 = (char *)v46 - v37;
  MEMORY[0x24BDAC7A8](v36);
  v38 = type metadata accessor for MarketingButtonAction();
  MEMORY[0x24BDAC7A8](v38);
  v40 = (char *)v46 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = v4[3];
  v77 = v4[2];
  v78 = v41;
  v42 = v4[5];
  v79 = v4[4];
  v80 = v42;
  v43 = v4[1];
  v75 = *v4;
  v76 = v43;
  sub_23C1B50D4(v74, (uint64_t)v40, v44);
  v74 = v19;
  v45 = (char *)sub_23C1F0DD0
      + 4 * byte_23C2029CA[(*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v40, 6, v18)];
  __asm { BR              X10 }
}

uint64_t sub_23C1F0DD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  char *v9;

  v2 = v0;
  v3 = *(_QWORD *)(v1 - 264);
  sub_23C1CD008(v2, v3, (uint64_t (*)(_QWORD))type metadata accessor for MarketingActionItem);
  v4 = type metadata accessor for MarketingButtonState();
  v5 = *(_QWORD *)(v1 - 256);
  v6 = *(_QWORD *)(v1 - 280);
  sub_23C1F04E8();
  if ((*(unsigned int (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v1 - 272) + 48))(v6, 1, *(_QWORD *)(v1 - 288)) == 1)
  {
    sub_23C1B5118(v3, (uint64_t (*)(_QWORD))type metadata accessor for MarketingActionItem);
    return sub_23C1BC2EC(v6, &qword_256B40DB8);
  }
  else
  {
    v8 = *(_QWORD *)(v1 - 296);
    sub_23C1CD008(v6, v8, (uint64_t (*)(_QWORD))type metadata accessor for MarketingOffer);
    if (*(_BYTE *)(v5 + *(int *)(v4 + 32)) == 1)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_256B41440);
      sub_23C1FBC24();
      v9 = (char *)&loc_23C1F12C8 + 4 * byte_23C2029D1[swift_getEnumCaseMultiPayload()];
      __asm { BR              X10 }
    }
    sub_23C1B5118(v8, (uint64_t (*)(_QWORD))type metadata accessor for MarketingOffer);
    return sub_23C1B5118(v3, (uint64_t (*)(_QWORD))type metadata accessor for MarketingActionItem);
  }
}

uint64_t type metadata accessor for MarketingButtonFeature.TaskIdentifier()
{
  uint64_t result;

  result = qword_256B42A10;
  if (!qword_256B42A10)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23C1F1B28(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  int *v10;
  __int128 v11;
  _QWORD *v12;
  uint64_t (*v14)(uint64_t);

  *(_QWORD *)(v5 + 40) = sub_23C1FBD74();
  *(_QWORD *)(v5 + 48) = sub_23C1FBD68();
  *(_OWORD *)(v5 + 56) = *(_OWORD *)(a2 + 48);
  v10 = *(int **)(a2 + 64);
  v11 = *(_OWORD *)(a2 + 80);
  *(_BYTE *)(v5 + 16) = a3;
  *(_OWORD *)(v5 + 72) = v11;
  *(_QWORD *)(v5 + 24) = a4;
  *(_QWORD *)(v5 + 32) = a5;
  v14 = (uint64_t (*)(uint64_t))((char *)v10 + *v10);
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 88) = v12;
  *v12 = v5;
  v12[1] = sub_23C1F1BD4;
  return v14(v5 + 16);
}

uint64_t sub_23C1F1BD4()
{
  uint64_t *v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  uint64_t (*v5)(void);
  uint64_t v6;

  v1 = *v0;
  v2 = *(int **)(*v0 + 56);
  v6 = *v0;
  swift_task_dealloc();
  v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 96) = v3;
  *v3 = v6;
  v3[1] = sub_23C1F1C4C;
  return v5();
}

uint64_t sub_23C1F1C4C()
{
  uint64_t *v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  uint64_t (*v5)(void);
  uint64_t v6;

  v1 = *v0;
  v2 = *(int **)(*v0 + 72);
  v6 = *v0;
  swift_task_dealloc();
  v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 104) = v3;
  *v3 = v6;
  v3[1] = sub_23C1F1CC4;
  return v5();
}

uint64_t sub_23C1F1CC4()
{
  swift_task_dealloc();
  sub_23C1FBD50();
  return swift_task_switch();
}

uint64_t sub_23C1F1D34()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C1F1D68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  _QWORD *v10;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t);

  v5[3] = sub_23C1FBD74();
  v5[4] = sub_23C1FBD68();
  v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a2 + 16) + *(_QWORD *)(a2 + 16));
  v10 = (_QWORD *)swift_task_alloc();
  v5[5] = v10;
  *v10 = v5;
  v10[1] = sub_23C1F1E00;
  return v12(a3, a4, a5);
}

uint64_t sub_23C1F1E00(void *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(*(_QWORD *)v2 + 48) = v1;
  swift_task_dealloc();
  if (!v1)

  sub_23C1FBD50();
  return swift_task_switch();
}

uint64_t sub_23C1F1EAC()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C1F1EE0()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  BOOL v7;
  void *v8;
  uint8_t *v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;

  swift_release();
  if (qword_256B408D0 != -1)
    swift_once();
  v1 = *(void **)(v0 + 48);
  v2 = sub_23C1FB54C();
  __swift_project_value_buffer(v2, (uint64_t)qword_256B4F8B0);
  v3 = v1;
  v4 = v1;
  v5 = sub_23C1FB534();
  v6 = sub_23C1FBDA4();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(void **)(v0 + 48);
  if (v7)
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v9 = 138412290;
    v11 = v8;
    v12 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 16) = v12;
    sub_23C1FBDEC();
    *v10 = v12;

    _os_log_impl(&dword_23C1B2000, v5, v6, "purchase failed: %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B42138);
    swift_arrayDestroy();
    MEMORY[0x242619BC4](v10, -1, -1);
    MEMORY[0x242619BC4](v9, -1, -1);

  }
  else
  {

  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C1F20B8(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  _QWORD *v10;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t);

  v5[2] = sub_23C1FBD74();
  v5[3] = sub_23C1FBD68();
  v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(int *)*a2 + *a2);
  v10 = (_QWORD *)swift_task_alloc();
  v5[4] = v10;
  *v10 = v5;
  v10[1] = sub_23C1F2150;
  return v12(a3, a4, a5);
}

uint64_t sub_23C1F2150()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 40) = v0;
  swift_task_dealloc();
  sub_23C1FBD50();
  return swift_task_switch();
}

uint64_t sub_23C1F21D8()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C1F220C()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C1F2240(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v2[2] = sub_23C1FBD74();
  v2[3] = sub_23C1FBD68();
  v6 = (uint64_t (*)(void))(**(int **)(a2 + 32) + *(_QWORD *)(a2 + 32));
  v4 = (_QWORD *)swift_task_alloc();
  v2[4] = v4;
  *v4 = v2;
  v4[1] = sub_23C1F22B4;
  return v6();
}

uint64_t sub_23C1F22B4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 40) = v0;
  swift_task_dealloc();
  sub_23C1FBD50();
  return swift_task_switch();
}

uint64_t sub_23C1F233C()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23C1F2388(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23C1F352C;
  return sub_23C1F2240(a1, v1 + 16);
}

uint64_t sub_23C1F23DC(uint64_t a1)
{
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_23C1F2458()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int EnumCaseMultiPayload;
  uint64_t v18;
  unint64_t v20;

  v1 = type metadata accessor for MarketingOffer();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 120) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = *(_QWORD *)(type metadata accessor for MarketingActionItem() - 8);
  v6 = (v3 + v4 + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  v7 = v0 + v3;
  swift_bridgeObjectRelease();
  v8 = v0 + v3 + *(int *)(v1 + 20);
  v9 = type metadata accessor for MarketingArtwork();
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(v8, 1, v9))
  {
    v20 = v6;
    v10 = sub_23C1FB4C8();
    v11 = *(_QWORD *)(v10 - 8);
    if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10))
      (*(void (**)(unint64_t, uint64_t))(v11 + 8))(v8, v10);
    v12 = v8 + *(int *)(v9 + 20);
    v13 = sub_23C1FB468();
    v14 = *(_QWORD *)(v13 - 8);
    v6 = v20;
    if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
      (*(void (**)(unint64_t, uint64_t))(v14 + 8))(v12, v13);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v15 = v7 + *(int *)(v1 + 36);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40B60);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(v15, v16);
  type metadata accessor for MarketingAction();
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
  {
    v18 = sub_23C1FB468();
    goto LABEL_11;
  }
  if (!EnumCaseMultiPayload)
  {
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40928);
LABEL_11:
    (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 8))(v0 + v6, v18);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23C1F26D0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v4 = *(_QWORD *)(type metadata accessor for MarketingOffer() - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 120) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v4 + 64);
  v7 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for MarketingActionItem() - 8) + 80);
  v8 = v5 + v6 + v7;
  v9 = v1 + 16;
  v10 = *(_QWORD *)(v1 + 112);
  v11 = v1 + v5;
  v12 = v1 + (v8 & ~v7);
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v13;
  *v13 = v2;
  v13[1] = sub_23C1F352C;
  return sub_23C1F1D68(a1, v9, v10, v11, v12);
}

uint64_t sub_23C1F2784()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  int EnumCaseMultiPayload;
  uint64_t v20;
  void (*v22)(unint64_t, uint64_t);
  unint64_t v23;

  v1 = sub_23C1FB468();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 112) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = type metadata accessor for MarketingOffer();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (v3 + v4 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for MarketingActionItem() - 8) + 80);
  v23 = (v7 + v8 + v9) & ~v9;
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v22 = *(void (**)(unint64_t, uint64_t))(v2 + 8);
  v22(v0 + v3, v1);
  v10 = v0 + v7;
  swift_bridgeObjectRelease();
  v11 = v0 + v7 + *(int *)(v5 + 20);
  v12 = type metadata accessor for MarketingArtwork();
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 48))(v11, 1, v12))
  {
    v13 = sub_23C1FB4C8();
    v14 = *(_QWORD *)(v13 - 8);
    if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v14 + 48))(v11, 1, v13))
      (*(void (**)(unint64_t, uint64_t))(v14 + 8))(v11, v13);
    v15 = v11 + *(int *)(v12 + 20);
    if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v2 + 48))(v15, 1, v1))
      v22(v15, v1);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v16 = v10 + *(int *)(v5 + 36);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40B60);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 8))(v16, v17);
  v18 = v0 + v23;
  type metadata accessor for MarketingAction();
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
  {
    v22(v18, v1);
  }
  else if (!EnumCaseMultiPayload)
  {
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B40928);
    (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 8))(v18, v20);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23C1F2A34(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;

  v4 = *(_QWORD *)(sub_23C1FB468() - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 112) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v4 + 64);
  v7 = *(_QWORD *)(type metadata accessor for MarketingOffer() - 8);
  v8 = (v5 + v6 + *(unsigned __int8 *)(v7 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v7 + 64);
  v10 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for MarketingActionItem() - 8) + 80);
  v11 = v8 + v9 + v10;
  v12 = (_QWORD *)(v1 + 16);
  v13 = v1 + v5;
  v14 = v1 + v8;
  v15 = v1 + (v11 & ~v10);
  v16 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v16;
  *v16 = v2;
  v16[1] = sub_23C1BD8B8;
  return sub_23C1F20B8(a1, v12, v13, v14, v15);
}

uint64_t sub_23C1F2B08()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23C1F2B5C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  _QWORD *v8;

  v4 = v1 + 16;
  v5 = *(_QWORD *)(v1 + 120);
  v6 = *(_QWORD *)(v1 + 128);
  v7 = *(_BYTE *)(v1 + 112);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_23C1F352C;
  return sub_23C1F1B28(a1, v4, v7, v5, v6);
}

uint64_t sub_23C1F2BD4()
{
  return sub_23C1B56F4(&qword_256B42990, (uint64_t (*)(uint64_t))type metadata accessor for MarketingButtonAction, (uint64_t)&protocol conformance descriptor for MarketingButtonAction);
}

uint64_t sub_23C1F2C00()
{
  return sub_23C1B56F4(qword_256B42998, (uint64_t (*)(uint64_t))type metadata accessor for MarketingButtonAction, (uint64_t)&protocol conformance descriptor for MarketingButtonAction);
}

uint64_t sub_23C1F2C30()
{
  return sub_23C1B56F4(&qword_256B424D0, (uint64_t (*)(uint64_t))type metadata accessor for MarketingButtonState, (uint64_t)&protocol conformance descriptor for MarketingButtonState);
}

ValueMetadata *type metadata accessor for MarketingButtonFeature()
{
  return &type metadata for MarketingButtonFeature;
}

char *sub_23C1F2C6C(char *a1, char **a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  int EnumCaseMultiPayload;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  uint64_t v12;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v9 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = &v9[(v6 + 16) & ~(unint64_t)v6];
    swift_retain();
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      v10 = *a2;
      *(_QWORD *)a1 = *a2;
      v11 = v10;
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload == 1)
    {
      v12 = sub_23C1FB468();
      (*(void (**)(char *, char **, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(a1, a2, v12);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      *a1 = *(_BYTE *)a2;
      v8 = a2[2];
      *((_QWORD *)a1 + 1) = a2[1];
      *((_QWORD *)a1 + 2) = v8;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

void sub_23C1F2D74(id *a1)
{
  int EnumCaseMultiPayload;
  uint64_t v3;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 2:

      break;
    case 1:
      v3 = sub_23C1FB468();
      (*(void (**)(id *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
      break;
    case 0:
      swift_bridgeObjectRelease();
      break;
  }
}

void **sub_23C1F2DEC(void **a1, void **a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    v8 = *a2;
    *a1 = *a2;
    v9 = v8;
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload == 1)
  {
    v10 = sub_23C1FB468();
    (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(a1, a2, v10);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    v7 = a2[2];
    a1[1] = a2[1];
    a1[2] = v7;
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void **sub_23C1F2ECC(void **a1, void **a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  void *v7;
  id v8;
  uint64_t v9;

  if (a1 != a2)
  {
    sub_23C1B5118((uint64_t)a1, (uint64_t (*)(_QWORD))type metadata accessor for MarketingButtonFeature.TaskIdentifier);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      v7 = *a2;
      *a1 = *a2;
      v8 = v7;
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload == 1)
    {
      v9 = sub_23C1FB468();
      (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(a1, a2, v9);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      *(_BYTE *)a1 = *(_BYTE *)a2;
      a1[1] = a2[1];
      a1[2] = a2[2];
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

void *sub_23C1F2FCC(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_23C1FB468();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

void *sub_23C1F3058(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_23C1B5118((uint64_t)a1, (uint64_t (*)(_QWORD))type metadata accessor for MarketingButtonFeature.TaskIdentifier);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_23C1FB468();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_23C1F30FC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23C1FB468();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_23C1F3178()
{
  return sub_23C1B56F4(&qword_256B42A48, (uint64_t (*)(uint64_t))type metadata accessor for MarketingButtonFeature.TaskIdentifier, (uint64_t)&unk_23C202A90);
}

void sub_23C1F31A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  _QWORD v13[8];

  v4 = sub_23C1FB468();
  v13[0] = *(_QWORD *)(v4 - 8);
  v13[1] = v4;
  MEMORY[0x24BDAC7A8](v4);
  v5 = type metadata accessor for MarketingButtonFeature.TaskIdentifier();
  v6 = MEMORY[0x24BDAC7A8](v5);
  v7 = MEMORY[0x24BDAC7A8](v6);
  MEMORY[0x24BDAC7A8](v7);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42A50);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v13 + *(int *)(v9 + 48) - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23C1B50D4(a1, (uint64_t)v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for MarketingButtonFeature.TaskIdentifier);
  sub_23C1B50D4(a2, (uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for MarketingButtonFeature.TaskIdentifier);
  v12 = (char *)sub_23C1F3304 + 4 * byte_23C2029D6[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

BOOL sub_23C1F3304()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;

  sub_23C1B50D4(v0, v2, (uint64_t (*)(_QWORD))type metadata accessor for MarketingButtonFeature.TaskIdentifier);
  v4 = *(_QWORD *)(v2 + 16);
  if (swift_getEnumCaseMultiPayload())
  {
    swift_bridgeObjectRelease();
    sub_23C1BC2EC(v0, &qword_256B42A50);
    return 0;
  }
  else
  {
    v6 = *(_QWORD *)(v2 + 8);
    v7 = *v1;
    v8 = *((_QWORD *)v1 + 1);
    v9 = *((_QWORD *)v1 + 2);
    *(_BYTE *)(v3 - 104) = *(_BYTE *)v2;
    *(_QWORD *)(v3 - 96) = v6;
    *(_QWORD *)(v3 - 88) = v4;
    *(_BYTE *)(v3 - 128) = v7;
    *(_QWORD *)(v3 - 120) = v8;
    *(_QWORD *)(v3 - 112) = v9;
    v5 = _s16FitnessMarketing0B9PlacementV2eeoiySbAC_ACtFZ_0(v3 - 104, v3 - 128);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_23C1B5118(v0, (uint64_t (*)(_QWORD))type metadata accessor for MarketingButtonFeature.TaskIdentifier);
  }
  return v5;
}

unint64_t sub_23C1F34EC()
{
  unint64_t result;

  result = qword_256B42A58;
  if (!qword_256B42A58)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256B42A58);
  }
  return result;
}

uint64_t static MarketingArtworkPosition.== infix(_:_:)()
{
  return 1;
}

uint64_t MarketingArtworkPosition.hash(into:)()
{
  return sub_23C1FBFD8();
}

uint64_t MarketingArtworkPosition.hashValue.getter()
{
  sub_23C1FBFCC();
  sub_23C1FBFD8();
  return sub_23C1FBFFC();
}

unint64_t sub_23C1F35A4()
{
  unint64_t result;

  result = qword_256B42A60;
  if (!qword_256B42A60)
  {
    result = MEMORY[0x242619B10](&protocol conformance descriptor for MarketingArtworkPosition, &type metadata for MarketingArtworkPosition);
    atomic_store(result, (unint64_t *)&qword_256B42A60);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for MarketingArtworkPosition(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23C1F3628 + 4 * byte_23C202B00[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23C1F3648 + 4 * byte_23C202B05[v4]))();
}

_BYTE *sub_23C1F3628(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23C1F3648(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C1F3650(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C1F3658(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C1F3660(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C1F3668(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for MarketingArtworkPosition()
{
  return &type metadata for MarketingArtworkPosition;
}

uint64_t MarketingInlineEnvironment.init(resolveMarketingOffer:refreshMarketingOffer:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

ValueMetadata *type metadata accessor for MarketingInlineEnvironment()
{
  return &type metadata for MarketingInlineEnvironment;
}

uint64_t sub_23C1F36A0(uint64_t a1, uint64_t (*a2)(_QWORD, _QWORD))
{
  return a2(*(_QWORD *)a1, *(unsigned __int8 *)(a1 + 8));
}

uint64_t sub_23C1F36D0(uint64_t a1, char a2, uint64_t (*a3)(uint64_t *))
{
  uint64_t v4;
  char v5;

  v4 = a1;
  v5 = a2 & 1;
  return a3(&v4);
}

uint64_t sub_23C1F3708@<X0>(_QWORD *a1@<X0>, uint64_t (**a2)(uint64_t a1)@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);

  v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC16FitnessMarketing27MarketingWebViewCoordinator_onPurchase);
  swift_beginAccess();
  v4 = *v3;
  v5 = v3[1];
  if (v4)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_23C1D64FC;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)(uint64_t))v6;
  return sub_23C1CF980(v4);
}

uint64_t sub_23C1F379C(uint64_t *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, char);
  uint64_t *v7;
  uint64_t v8;

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_23C1D64C4;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC16FitnessMarketing27MarketingWebViewCoordinator_onPurchase);
  swift_beginAccess();
  v8 = *v7;
  *v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_23C1CF980(v3);
  return sub_23C1CF99C(v8);
}

uint64_t MarketingWebViewCoordinator.onPurchase.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC16FitnessMarketing27MarketingWebViewCoordinator_onPurchase);
  swift_beginAccess();
  v2 = *v1;
  sub_23C1CF980(*v1);
  return v2;
}

uint64_t MarketingWebViewCoordinator.onPurchase.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t v6;

  v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC16FitnessMarketing27MarketingWebViewCoordinator_onPurchase);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a1;
  v5[1] = a2;
  return sub_23C1CF99C(v6);
}

uint64_t (*MarketingWebViewCoordinator.onPurchase.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id MarketingWebViewCoordinator.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void MarketingWebViewCoordinator.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id MarketingWebViewCoordinator.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void MarketingWebViewCoordinator.webViewController(_:handle:completion:)(uint64_t a1, uint64_t a2, void (*a3)(_QWORD, void *), uint64_t a4)
{
  sub_23C1F3AA4(a1, a2, a3, a4, (Class *)0x24BE08618, (SEL *)&selRef_performAuthentication, (uint64_t)sub_23C1F3A58, (uint64_t)&block_descriptor_0);
}

{
  sub_23C1F3AA4(a1, a2, a3, a4, (Class *)0x24BE08610, (SEL *)&selRef_present, (uint64_t)sub_23C1F3A58, (uint64_t)&block_descriptor_3);
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

void sub_23C1F3AA4(uint64_t a1, uint64_t a2, void (*a3)(_QWORD, void *), uint64_t a4, Class *a5, SEL *a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD *v22;
  _QWORD v23[6];

  v16 = MEMORY[0x242619C48](v8 + OBJC_IVAR____TtC16FitnessMarketing27MarketingWebViewCoordinator_presentingViewController);
  if (v16)
  {
    v17 = (void *)v16;
    v18 = objc_msgSend(objc_allocWithZone(*a5), sel_initWithRequest_presentingViewController_, a2, v16);
    v19 = objc_msgSend(v18, *a6);
    v23[4] = a3;
    v23[5] = a4;
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 1107296256;
    v23[2] = a7;
    v23[3] = a8;
    v20 = _Block_copy(v23);
    swift_retain();
    swift_release();
    objc_msgSend(v19, sel_addFinishBlock_, v20);
    _Block_release(v20);

  }
  else
  {
    sub_23C1D653C();
    v21 = (void *)swift_allocError();
    *v22 = 0;
    v22[1] = 0;
    v22[2] = 1;
    a3(0, v21);

  }
}

void sub_23C1F3C14(uint64_t a1, void *a2, void *a3)
{
  void (*v5)(void *, void *);
  id v6;
  id v7;

  v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  v7 = a2;
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

void sub_23C1F3C94(void *a1, int a2, void *a3, void *a4, void *aBlock, void (*a6)(id, id, void *))
{
  void *v10;
  id v11;
  id v12;
  id v13;

  v10 = _Block_copy(aBlock);
  _Block_copy(v10);
  v11 = a3;
  v12 = a4;
  v13 = a1;
  a6(v12, v13, v10);
  _Block_release(v10);
  _Block_release(v10);

}

void sub_23C1F3D28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  if (a2)
    v5 = sub_23C1FB420();
  else
    v5 = 0;
  v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);

}

uint64_t MarketingWebViewCoordinator.webViewController(_:handleDelegateAction:completion:)()
{
  return 0;
}

void MarketingWebViewCoordinator.webViewController(_:didFinishPurchaseWith:error:)(uint64_t a1, void *a2, void *a3)
{
  sub_23C1F41B0(a2, a3);
}

void sub_23C1F3E30(uint64_t a1, uint64_t a2, void (**a3)(_QWORD, _QWORD, _QWORD))
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  _QWORD v16[6];

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a3;
  v7 = MEMORY[0x242619C48](a2 + OBJC_IVAR____TtC16FitnessMarketing27MarketingWebViewCoordinator_presentingViewController);
  if (v7)
  {
    v8 = (void *)v7;
    v9 = objc_allocWithZone(MEMORY[0x24BE08618]);
    _Block_copy(a3);
    v10 = objc_msgSend(v9, sel_initWithRequest_presentingViewController_, a1, v8);
    v11 = objc_msgSend(v10, sel_performAuthentication);
    v16[4] = sub_23C1F4364;
    v16[5] = v6;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 1107296256;
    v16[2] = sub_23C1F3A58;
    v16[3] = &block_descriptor_12;
    v12 = _Block_copy(v16);
    swift_retain();
    swift_release();
    objc_msgSend(v11, sel_addFinishBlock_, v12);
    _Block_release(v12);
    swift_release();

  }
  else
  {
    sub_23C1D653C();
    v13 = (void *)swift_allocError();
    *v14 = 0;
    v14[1] = 0;
    v14[2] = 1;
    _Block_copy(a3);
    v15 = (void *)sub_23C1FB420();
    ((void (**)(_QWORD, _QWORD, void *))a3)[2](a3, 0, v15);

    swift_release();
  }
}

void sub_23C1F3FF0(uint64_t a1, uint64_t a2, void (**a3)(_QWORD, _QWORD, _QWORD))
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  _QWORD v16[6];

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a3;
  v7 = MEMORY[0x242619C48](a2 + OBJC_IVAR____TtC16FitnessMarketing27MarketingWebViewCoordinator_presentingViewController);
  if (v7)
  {
    v8 = (void *)v7;
    v9 = objc_allocWithZone(MEMORY[0x24BE08610]);
    _Block_copy(a3);
    v10 = objc_msgSend(v9, sel_initWithRequest_presentingViewController_, a1, v8);
    v11 = objc_msgSend(v10, sel_present);
    v16[4] = sub_23C1F4328;
    v16[5] = v6;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 1107296256;
    v16[2] = sub_23C1F3A58;
    v16[3] = &block_descriptor_6;
    v12 = _Block_copy(v16);
    swift_retain();
    swift_release();
    objc_msgSend(v11, sel_addFinishBlock_, v12);
    _Block_release(v12);
    swift_release();

  }
  else
  {
    sub_23C1D653C();
    v13 = (void *)swift_allocError();
    *v14 = 0;
    v14[1] = 0;
    v14[2] = 1;
    _Block_copy(a3);
    v15 = (void *)sub_23C1FB420();
    ((void (**)(_QWORD, _QWORD, void *))a3)[2](a3, 0, v15);

    swift_release();
  }
}

void sub_23C1F41B0(void *a1, void *a2)
{
  uint64_t v2;
  void (**v3)(void *, uint64_t);
  void (*v5)(void *, uint64_t);
  id v6;
  void (*v8)(void *, uint64_t);
  void *v9;
  _QWORD *v10;
  id v11;

  v3 = (void (**)(void *, uint64_t))(v2
                                             + OBJC_IVAR____TtC16FitnessMarketing27MarketingWebViewCoordinator_onPurchase);
  if (a1)
  {
    swift_beginAccess();
    v5 = *v3;
    if (*v3)
    {
      v6 = a1;
      sub_23C1CF980((uint64_t)v5);
      v5(a1, 0);
      sub_23C1CF99C((uint64_t)v5);

    }
  }
  else
  {
    swift_beginAccess();
    v8 = *v3;
    if (*v3)
    {
      if (a2)
      {
        v9 = a2;
      }
      else
      {
        sub_23C1D653C();
        v9 = (void *)swift_allocError();
        *v10 = 0;
        v10[1] = 0;
        v10[2] = 2;
      }
      sub_23C1CF980((uint64_t)v8);
      v11 = a2;
      v8(v9, 1);
      sub_23C1CF99C((uint64_t)v8);

    }
  }
}

uint64_t type metadata accessor for MarketingWebViewCoordinator()
{
  return objc_opt_self();
}

uint64_t method lookup function for MarketingWebViewCoordinator()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_23C1F4304()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_23C1F4328(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_23C1F3D28(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_23C1F4340()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23C1F4388@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11)
{
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
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
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
  _QWORD *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void (*v65)(uint64_t, uint64_t);
  _QWORD v67[2];
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
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
  char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  _QWORD v111[2];
  _QWORD v112[2];
  _QWORD v113[2];
  _QWORD v114[12];
  _QWORD v115[2];
  _QWORD v116[2];
  _QWORD v117[2];
  _QWORD v118[2];
  _QWORD v119[2];
  _QWORD v120[3];

  v71 = a8;
  v91 = a6;
  v92 = a7;
  v89 = a4;
  v90 = a5;
  v88 = a3;
  v86 = a2;
  v84 = a1;
  v95 = a9;
  v85 = a11;
  v75 = a10;
  v94 = sub_23C1FB624();
  MEMORY[0x24BDAC7A8](v94);
  v93 = (char *)v67 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v78 = *(_QWORD *)(a8 + 24);
  sub_23C1FB87C();
  v96 = sub_23C1FB600();
  v87 = *(_QWORD *)(v96 - 8);
  MEMORY[0x24BDAC7A8](v96);
  v74 = (char *)v67 - v13;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41F00);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B42768);
  sub_23C1FB600();
  swift_getTupleTypeMetadata3();
  v14 = sub_23C1FBBE8();
  MEMORY[0x242619B10](MEMORY[0x24BDF5428], v14);
  v15 = sub_23C1FBB88();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B42770);
  v16 = sub_23C1FB600();
  v17 = sub_23C1FB600();
  v18 = sub_23C1FB600();
  v19 = sub_23C1FB600();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B42778);
  v20 = sub_23C1FB600();
  v21 = MEMORY[0x242619B10](MEMORY[0x24BDF4700], v15);
  v22 = sub_23C1BC328(&qword_256B42780, &qword_256B42770, MEMORY[0x24BDF1028]);
  v120[0] = v21;
  v120[1] = v22;
  v23 = MEMORY[0x24BDED308];
  v119[0] = MEMORY[0x242619B10](MEMORY[0x24BDED308], v16, v120);
  v119[1] = MEMORY[0x24BDECC60];
  v24 = MEMORY[0x24BDECC60];
  v118[0] = MEMORY[0x242619B10](v23, v17, v119);
  v118[1] = v24;
  v117[0] = MEMORY[0x242619B10](v23, v18, v118);
  v117[1] = v24;
  v25 = MEMORY[0x242619B10](v23, v19, v117);
  v26 = sub_23C1BC328(&qword_256B42788, &qword_256B42778, MEMORY[0x24BDEF370]);
  v116[0] = v25;
  v116[1] = v26;
  v67[1] = v20;
  v67[0] = MEMORY[0x242619B10](v23, v20, v116);
  v70 = sub_23C1FB63C();
  v27 = sub_23C1FB600();
  v72 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v29 = (char *)v67 - v28;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41E98);
  v30 = sub_23C1FB600();
  v31 = *(_QWORD *)(v30 - 8);
  v68 = v30;
  v76 = v31;
  MEMORY[0x24BDAC7A8](v30);
  v69 = (char *)v67 - v32;
  v33 = sub_23C1FB600();
  v34 = *(_QWORD *)(v33 - 8);
  v79 = v33;
  v82 = v34;
  MEMORY[0x24BDAC7A8](v33);
  v73 = (char *)v67 - v35;
  v81 = sub_23C1FB600();
  v83 = *(_QWORD *)(v81 - 8);
  v36 = MEMORY[0x24BDAC7A8](v81);
  v77 = (char *)v67 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v36);
  v80 = (uint64_t)v67 - v38;
  v39 = v71;
  v40 = *(_QWORD *)(v71 + 40);
  v41 = v74;
  v42 = v78;
  sub_23C1FBA80();
  sub_23C1FBBB8();
  v98 = *(_QWORD *)(v39 + 16);
  v99 = v42;
  v43 = *(_QWORD *)(v39 + 32);
  v100 = v75;
  v101 = v43;
  v102 = v40;
  v103 = v85;
  v104 = v86;
  v105 = v88;
  v106 = v97;
  v107 = v89;
  v108 = v90;
  v109 = v91;
  v110 = v92;
  v44 = sub_23C1B56F4((unint64_t *)&qword_256B41EA0, (uint64_t (*)(uint64_t))MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
  v115[0] = v40;
  v115[1] = v44;
  v45 = v96;
  v46 = MEMORY[0x242619B10](MEMORY[0x24BDED308], v96, v115);
  sub_23C1FBAC8();
  (*(void (**)(char *, uint64_t))(v87 + 8))(v41, v45);
  sub_23C1EA38C();
  swift_getKeyPath();
  sub_23C1FBC54();
  swift_release();
  swift_release();
  v47 = v114[7];
  v48 = v93;
  v49 = &v93[*(int *)(v94 + 20)];
  v50 = *MEMORY[0x24BDEEB68];
  v51 = sub_23C1FB714();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v51 - 8) + 104))(v49, v50, v51);
  *v48 = v47;
  v48[1] = v47;
  v52 = MEMORY[0x242619B10](MEMORY[0x24BDEDC10], v70);
  v114[0] = v46;
  v114[1] = v52;
  v53 = MEMORY[0x24BDED308];
  v54 = MEMORY[0x242619B10](MEMORY[0x24BDED308], v27, v114);
  sub_23C1B56F4(&qword_256B41EA8, (uint64_t (*)(uint64_t))MEMORY[0x24BDED998], MEMORY[0x24BDED990]);
  v55 = v69;
  sub_23C1FBAF8();
  sub_23C1DA1D0((uint64_t)v48);
  (*(void (**)(char *, uint64_t))(v72 + 8))(v29, v27);
  sub_23C1EA38C();
  swift_getKeyPath();
  sub_23C1FBC54();
  swift_release();
  swift_release();
  v56 = sub_23C1BC328(&qword_256B41EB0, &qword_256B41E98, MEMORY[0x24BDEB950]);
  v113[0] = v54;
  v113[1] = v56;
  v57 = v68;
  v58 = MEMORY[0x242619B10](v53, v68, v113);
  v59 = v73;
  sub_23C1FBA2C();
  (*(void (**)(char *, uint64_t))(v76 + 8))(v55, v57);
  sub_23C1FB8DC();
  sub_23C1EA38C();
  swift_getKeyPath();
  sub_23C1FBC54();
  swift_release();
  swift_release();
  v112[0] = v58;
  v112[1] = MEMORY[0x24BDEEC40];
  v60 = v79;
  v61 = MEMORY[0x242619B10](v53, v79, v112);
  v62 = (uint64_t)v77;
  sub_23C1FBAD4();
  (*(void (**)(char *, uint64_t))(v82 + 8))(v59, v60);
  v111[0] = v61;
  v111[1] = MEMORY[0x24BDECC60];
  v63 = v81;
  MEMORY[0x242619B10](v53, v81, v111);
  v64 = v80;
  sub_23C1CD350(v62, v63, v80);
  v65 = *(void (**)(uint64_t, uint64_t))(v83 + 8);
  v65(v62, v63);
  sub_23C1C87C4(v64, v63, v95);
  return ((uint64_t (*)(uint64_t, uint64_t))v65)(v64, v63);
}

void sub_23C1F4B88(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
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
  char *v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
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
  uint64_t v76;

  v35 = a7;
  v43 = a5;
  v44 = a6;
  v42 = a4;
  v39 = a2;
  v40 = a3;
  v38 = a1;
  v58 = a9;
  v37 = a14;
  v33 = a13;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41F00);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B42768);
  sub_23C1FB600();
  swift_getTupleTypeMetadata3();
  v15 = sub_23C1FBBE8();
  MEMORY[0x242619B10](MEMORY[0x24BDF5428], v15);
  v16 = sub_23C1FBB88();
  v34 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v32 - v17;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B42770);
  v19 = sub_23C1FB600();
  v45 = *(_QWORD *)(v19 - 8);
  v41 = v19;
  MEMORY[0x24BDAC7A8](v19);
  v59 = (char *)&v32 - v20;
  v21 = sub_23C1FB600();
  v22 = *(_QWORD *)(v21 - 8);
  v47 = v21;
  v51 = v22;
  MEMORY[0x24BDAC7A8](v21);
  v36 = (char *)&v32 - v23;
  v24 = sub_23C1FB600();
  v53 = *(_QWORD *)(v24 - 8);
  v49 = v24;
  MEMORY[0x24BDAC7A8](v24);
  v46 = (char *)&v32 - v25;
  v26 = sub_23C1FB600();
  v56 = *(_QWORD *)(v26 - 8);
  v52 = v26;
  MEMORY[0x24BDAC7A8](v26);
  v48 = (char *)&v32 - v27;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B42778);
  v55 = sub_23C1FB600();
  v57 = *(_QWORD *)(v55 - 8);
  v28 = MEMORY[0x24BDAC7A8](v55);
  v50 = (char *)&v32 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v28);
  v54 = (char *)&v32 - v30;
  sub_23C1FB720();
  v60 = a8;
  v61 = a10;
  v62 = a11;
  v63 = a12;
  v31 = v33;
  v64 = v33;
  v65 = v37;
  v66 = v38;
  v67 = v39;
  v68 = v40;
  v69 = v42;
  v70 = v43;
  v71 = v44;
  v72 = v35;
  sub_23C1FBB7C();
  MEMORY[0x242619B10](MEMORY[0x24BDF4700], v16);
  sub_23C1FBA98();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v18, v16);
  LODWORD(v44) = sub_23C1FB8DC();
  v73 = a8;
  v74 = a10;
  v75 = a12;
  v76 = v31;
  type metadata accessor for MarketingInlineView();
}

uint64_t sub_23C1F4EE8()
{
  _QWORD *v0;
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);

  sub_23C1EA38C();
  swift_getKeyPath();
  sub_23C1FBC54();
  swift_release();
  swift_release();
  v3 = sub_23C1BC328(&qword_256B42780, &qword_256B42770, MEMORY[0x24BDF1028]);
  *(_QWORD *)(v2 - 184) = v1;
  *(_QWORD *)(v2 - 176) = v3;
  v4 = MEMORY[0x24BDED308];
  v5 = v0[9];
  v6 = MEMORY[0x242619B10](MEMORY[0x24BDED308], v5, v2 - 184);
  v7 = v0[4];
  v8 = v0[27];
  sub_23C1FBAD4();
  (*(void (**)(uint64_t, uint64_t))(v0[13] + 8))(v8, v5);
  sub_23C1FB900();
  sub_23C1EA38C();
  swift_getKeyPath();
  sub_23C1FBC54();
  swift_release();
  swift_release();
  v9 = MEMORY[0x24BDECC60];
  *(_QWORD *)(v2 - 200) = v6;
  *(_QWORD *)(v2 - 192) = v9;
  v10 = v0[15];
  v11 = MEMORY[0x242619B10](v4, v10, v2 - 200);
  v12 = v0[14];
  sub_23C1FBAD4();
  (*(void (**)(uint64_t, uint64_t))(v0[19] + 8))(v7, v10);
  sub_23C1FB8F4();
  *(_QWORD *)(v2 - 216) = v11;
  *(_QWORD *)(v2 - 208) = v9;
  v13 = v0[17];
  v14 = MEMORY[0x242619B10](v4, v13, v2 - 216);
  v15 = v0[16];
  sub_23C1FBAD4();
  (*(void (**)(uint64_t, uint64_t))(v0[21] + 8))(v12, v13);
  sub_23C1FBBC4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B42B10);
  *(_QWORD *)(v2 - 232) = v14;
  *(_QWORD *)(v2 - 224) = v9;
  v16 = v0[20];
  v17 = MEMORY[0x242619B10](v4, v16, v2 - 232);
  sub_23C1F652C();
  v18 = v0[18];
  sub_23C1FBA08();
  (*(void (**)(uint64_t, uint64_t))(v0[24] + 8))(v15, v16);
  v19 = sub_23C1BC328(&qword_256B42788, &qword_256B42778, MEMORY[0x24BDEF370]);
  *(_QWORD *)(v2 - 248) = v17;
  *(_QWORD *)(v2 - 240) = v19;
  v20 = v0[23];
  MEMORY[0x242619B10](v4, v20, v2 - 248);
  v21 = v0[22];
  sub_23C1CD350(v18, v20, v21);
  v22 = *(void (**)(uint64_t, uint64_t))(v0[25] + 8);
  v22(v18, v20);
  sub_23C1C87C4(v21, v20, v0[26]);
  return ((uint64_t (*)(uint64_t, uint64_t))v22)(v21, v20);
}

void sub_23C1F51C0()
{
  sub_23C1DA218((void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23C1F4B88);
}

uint64_t sub_23C1F51CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void (*a6)(uint64_t)@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
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
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unsigned int *v47;
  unsigned int *v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t);
  uint64_t result;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t KeyPath;
  uint64_t v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  unsigned int *v68;
  uint64_t v69;
  char v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t (*v74)(uint64_t);
  char *v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void (*v97)(uint64_t, uint64_t);
  uint64_t v98;
  uint64_t v99;
  _QWORD v100[3];
  uint64_t v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  char *v107;
  char *v108;
  char *v109;
  uint64_t v110;
  uint64_t v111;
  char *v112;
  char *v113;
  char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  char *v122;
  uint64_t v123;
  uint64_t v124;
  void (*v125)(uint64_t);
  char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  _QWORD v156[3];
  _QWORD v157[2];

  v146 = a8;
  v124 = a7;
  v125 = a6;
  v115 = a4;
  v147 = a3;
  v116 = a1;
  v133 = a9;
  v145 = a13;
  v144 = a12;
  v143 = a10;
  v127 = *(_QWORD *)(a11 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v126 = (char *)v100 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v128 = v17;
  v132 = sub_23C1FB600();
  v129 = *(_QWORD *)(v132 - 8);
  v18 = MEMORY[0x24BDAC7A8](v132);
  v131 = (char *)v100 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v130 = (uint64_t)v100 - v20;
  v104 = sub_23C1FBBDC();
  v103 = *(_QWORD *)(v104 - 8);
  MEMORY[0x24BDAC7A8](v104);
  v102 = (char *)v100 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42B40);
  MEMORY[0x24BDAC7A8](v101);
  v106 = (char *)v100 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v105 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42240);
  MEMORY[0x24BDAC7A8](v105);
  v108 = (char *)v100 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42248);
  MEMORY[0x24BDAC7A8](v24);
  v109 = (char *)v100 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v120 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42B48);
  v119 = *(_QWORD *)(v120 - 8);
  MEMORY[0x24BDAC7A8](v120);
  v107 = (char *)v100 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v121 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42768);
  v27 = MEMORY[0x24BDAC7A8](v121);
  v123 = (uint64_t)v100 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v27);
  v122 = (char *)v100 - v29;
  v142 = sub_23C1FB96C();
  v141 = *(_QWORD *)(v142 - 8);
  MEMORY[0x24BDAC7A8](v142);
  v140 = (char *)v100 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41760);
  MEMORY[0x24BDAC7A8](v31);
  v33 = (char *)v100 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v139 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41F08);
  v138 = *(_QWORD *)(v139 - 8);
  MEMORY[0x24BDAC7A8](v139);
  v35 = (char *)v100 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  v136 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41F10);
  MEMORY[0x24BDAC7A8](v136);
  v37 = (char *)v100 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  v137 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41F18);
  MEMORY[0x24BDAC7A8](v137);
  v39 = (char *)v100 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  v110 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41F20);
  MEMORY[0x24BDAC7A8](v110);
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41F28);
  MEMORY[0x24BDAC7A8](v40);
  v113 = (char *)v100 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41EF0);
  MEMORY[0x24BDAC7A8](v111);
  v114 = (char *)v100 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  v135 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41EF8);
  v134 = *(_QWORD *)(v135 - 8);
  MEMORY[0x24BDAC7A8](v135);
  v112 = (char *)v100 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  v117 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41F00);
  v44 = MEMORY[0x24BDAC7A8](v117);
  v118 = (uint64_t)v100 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v44);
  v148 = (uint64_t)v100 - v46;
  v47 = (unsigned int *)MEMORY[0x24BDECF38];
  v48 = (unsigned int *)MEMORY[0x24BDF17C8];
  v100[2] = v31;
  if (a2)
  {
    v100[1] = a5;
    v149 = v116;
    v150 = a2;
    sub_23C1CA840();
    swift_bridgeObjectRetain();
    v149 = sub_23C1FB9C0();
    v150 = v49;
    LOBYTE(v151) = v50 & 1;
    v152 = v51;
    v52 = *v47;
    v53 = sub_23C1FB5DC();
    v54 = (uint64_t (*)(uint64_t))MEMORY[0x24BDECF50];
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v53 - 8) + 104))(v33, v52, v53);
    sub_23C1B56F4((unint64_t *)&qword_256B41808, v54, MEMORY[0x24BDECF78]);
    result = sub_23C1FBC9C();
    if ((result & 1) != 0)
    {
      sub_23C1BC328(&qword_256B41788, &qword_256B41760, MEMORY[0x24BEE30C8]);
      sub_23C1FBA68();
      sub_23C1BC2EC((uint64_t)v33, &qword_256B41760);
      sub_23C1DA540(v149, v150, v151);
      swift_bridgeObjectRelease();
      sub_23C1FB930();
      sub_23C1FB93C();
      sub_23C1FB960();
      swift_release();
      v56 = *v48;
      v57 = (uint64_t)v39;
      v58 = v35;
      v59 = v141;
      v60 = v140;
      v61 = v142;
      (*(void (**)(char *, uint64_t, uint64_t))(v141 + 104))(v140, v56, v142);
      v62 = sub_23C1FB984();
      swift_release();
      (*(void (**)(char *, uint64_t))(v59 + 8))(v60, v61);
      KeyPath = swift_getKeyPath();
      v64 = v138;
      v65 = v139;
      (*(void (**)(char *, char *, uint64_t))(v138 + 16))(v37, v58, v139);
      v66 = (uint64_t *)&v37[*(int *)(v136 + 36)];
      *v66 = KeyPath;
      v66[1] = v62;
      (*(void (**)(char *, uint64_t))(v64 + 8))(v58, v65);
      LODWORD(v62) = sub_23C1FB78C();
      sub_23C1BF6E4((uint64_t)v37, v57, &qword_256B41F10);
      *(_DWORD *)(v57 + *(int *)(v137 + 36)) = v62;
      sub_23C1BC2EC((uint64_t)v37, &qword_256B41F10);
      v149 = v146;
      v150 = v143;
      v151 = v144;
      v152 = v145;
      type metadata accessor for MarketingInlineView();
    }
    __break(1u);
  }
  else
  {
    v67 = v148;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v134 + 56))(v148, 1, 1, v135);
    v68 = (unsigned int *)MEMORY[0x24BDECF38];
    if (!a5)
    {
      v88 = (uint64_t)v122;
      v89 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v119 + 56))(v122, 1, 1, v120);
      v90 = v126;
      v125(v89);
      sub_23C1FB8F4();
      v91 = (uint64_t)v131;
      v92 = v128;
      sub_23C1FBAD4();
      (*(void (**)(char *, uint64_t))(v127 + 8))(v90, v92);
      v157[0] = a14;
      v157[1] = MEMORY[0x24BDECC60];
      v93 = v132;
      v94 = MEMORY[0x242619B10](MEMORY[0x24BDED308], v132, v157);
      v95 = v130;
      sub_23C1CD350(v91, v93, v130);
      v96 = v129;
      v97 = *(void (**)(uint64_t, uint64_t))(v129 + 8);
      v97(v91, v93);
      v98 = v118;
      sub_23C1BF6E4(v67, v118, &qword_256B41F00);
      v149 = v98;
      v99 = v123;
      sub_23C1BF6E4(v88, v123, &qword_256B42768);
      v150 = v99;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v96 + 16))(v91, v95, v93);
      v151 = v91;
      v156[0] = v117;
      v156[1] = v121;
      v156[2] = v93;
      v153 = sub_23C1F6808(&qword_256B42B50, &qword_256B41F00, (uint64_t (*)(void))sub_23C1F66BC);
      v154 = sub_23C1F6808(&qword_256B42B78, &qword_256B42768, (uint64_t (*)(void))sub_23C1F686C);
      v155 = v94;
      sub_23C1D76F8(&v149, 3uLL, (uint64_t)v156);
      v97(v95, v93);
      sub_23C1BC2EC(v88, &qword_256B42768);
      sub_23C1BC2EC(v148, &qword_256B41F00);
      v97(v91, v93);
      sub_23C1BC2EC(v99, &qword_256B42768);
      return sub_23C1BC2EC(v98, &qword_256B41F00);
    }
    v149 = v115;
    v150 = a5;
    sub_23C1CA840();
    swift_bridgeObjectRetain();
    v149 = sub_23C1FB9C0();
    v150 = v69;
    LOBYTE(v151) = v70 & 1;
    v152 = v71;
    v72 = *v68;
    v73 = sub_23C1FB5DC();
    v74 = (uint64_t (*)(uint64_t))MEMORY[0x24BDECF50];
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v73 - 8) + 104))(v33, v72, v73);
    sub_23C1B56F4((unint64_t *)&qword_256B41808, v74, MEMORY[0x24BDECF78]);
    result = sub_23C1FBC9C();
    if ((result & 1) != 0)
    {
      sub_23C1BC328(&qword_256B41788, &qword_256B41760, MEMORY[0x24BEE30C8]);
      sub_23C1FBA68();
      sub_23C1BC2EC((uint64_t)v33, &qword_256B41760);
      sub_23C1DA540(v149, v150, v151);
      swift_bridgeObjectRelease();
      sub_23C1FB918();
      v75 = v35;
      v76 = v141;
      v77 = v140;
      v78 = v142;
      (*(void (**)(char *, _QWORD, uint64_t))(v141 + 104))(v140, *MEMORY[0x24BDF17C8], v142);
      v79 = sub_23C1FB984();
      swift_release();
      (*(void (**)(char *, uint64_t))(v76 + 8))(v77, v78);
      v80 = swift_getKeyPath();
      v81 = v138;
      v82 = v139;
      (*(void (**)(char *, char *, uint64_t))(v138 + 16))(v37, v75, v139);
      v83 = (uint64_t *)&v37[*(int *)(v136 + 36)];
      *v83 = v80;
      v83[1] = v79;
      (*(void (**)(char *, uint64_t))(v81 + 8))(v75, v82);
      LODWORD(v80) = sub_23C1FB7A4();
      sub_23C1BF6E4((uint64_t)v37, (uint64_t)v39, &qword_256B41F10);
      *(_DWORD *)&v39[*(int *)(v137 + 36)] = v80;
      sub_23C1BC2EC((uint64_t)v37, &qword_256B41F10);
      v84 = v103;
      v85 = v102;
      v86 = v104;
      (*(void (**)(char *, _QWORD, uint64_t))(v103 + 104))(v102, *MEMORY[0x24BDF5098], v104);
      v87 = (uint64_t)v106;
      (*(void (**)(char *, char *, uint64_t))(v84 + 16))(&v106[*(int *)(v101 + 36)], v85, v86);
      sub_23C1BF6E4((uint64_t)v39, v87, &qword_256B41F18);
      (*(void (**)(char *, uint64_t))(v84 + 8))(v85, v86);
      sub_23C1BC2EC((uint64_t)v39, &qword_256B41F18);
      v149 = v146;
      v150 = v143;
      v151 = v144;
      v152 = v145;
      type metadata accessor for MarketingInlineView();
    }
  }
  __break(1u);
  return result;
}

void sub_23C1F6320()
{
  sub_23C1DA218((void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23C1F51CC);
}

uint64_t sub_23C1F632C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  id v10;
  uint64_t KeyPath;
  uint64_t v12;
  __int128 v13;
  uint64_t v15;
  _OWORD v16[2];
  uint64_t v17;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42B30);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (uint64_t *)((char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = sub_23C1FB5A0();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B42B38);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_23C200FE0;
  v10 = objc_msgSend((id)objc_opt_self(), sel_secondarySystemBackgroundColor);
  *(_QWORD *)(v9 + 32) = MEMORY[0x2426191F8](v10);
  *(_QWORD *)(v9 + 40) = sub_23C1FBB10();
  *(_QWORD *)&v16[0] = v9;
  sub_23C1FBD38();
  MEMORY[0x242619270](*(_QWORD *)&v16[0]);
  sub_23C1FBC0C();
  sub_23C1FBC00();
  sub_23C1FB5D0();
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x24BDEB3F0], v5);
  KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))((char *)v4 + *(int *)(v2 + 28), v8, v5);
  *v4 = KeyPath;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42B10);
  sub_23C1BF6E4((uint64_t)v4, a1 + *(int *)(v12 + 36), &qword_256B42B30);
  v13 = v16[1];
  *(_OWORD *)a1 = v16[0];
  *(_OWORD *)(a1 + 16) = v13;
  *(_QWORD *)(a1 + 32) = v17;
  swift_bridgeObjectRetain();
  sub_23C1BC2EC((uint64_t)v4, &qword_256B42B30);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return sub_23C1F6694((uint64_t)v16);
}

unint64_t sub_23C1F652C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256B42B18;
  if (!qword_256B42B18)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B42B10);
    v2[0] = sub_23C1F65B0();
    v2[1] = sub_23C1BC328(&qword_256B42B28, &qword_256B42B30, MEMORY[0x24BDF1028]);
    result = MEMORY[0x242619B10](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256B42B18);
  }
  return result;
}

unint64_t sub_23C1F65B0()
{
  unint64_t result;

  result = qword_256B42B20;
  if (!qword_256B42B20)
  {
    result = MEMORY[0x242619B10](MEMORY[0x24BDEC7C0], MEMORY[0x24BDEC7D0]);
    atomic_store(result, (unint64_t *)&qword_256B42B20);
  }
  return result;
}

uint64_t sub_23C1F65F4()
{
  return sub_23C1FB648();
}

uint64_t sub_23C1F6614(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_23C1FB5A0();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_23C1FB654();
}

uint64_t sub_23C1F6694(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

unint64_t sub_23C1F66BC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256B42B58;
  if (!qword_256B42B58)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41EF8);
    v2[0] = sub_23C1CEF0C(&qword_256B42B60, &qword_256B41EF0, sub_23C1F6760, MEMORY[0x24BDECC60]);
    v2[1] = sub_23C1BC328(&qword_256B41778, &qword_256B41780, MEMORY[0x24BDF1028]);
    result = MEMORY[0x242619B10](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256B42B58);
  }
  return result;
}

uint64_t sub_23C1F6760()
{
  return sub_23C1CEF0C(&qword_256B42B68, &qword_256B41F28, (uint64_t (*)(void))sub_23C1F6784, MEMORY[0x24BDEDBB8]);
}

unint64_t sub_23C1F6784()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256B42B70;
  if (!qword_256B42B70)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B41F20);
    v2[0] = sub_23C1E34E0();
    v2[1] = sub_23C1BC328(&qword_256B417A0, &qword_256B417A8, MEMORY[0x24BDF1028]);
    result = MEMORY[0x242619B10](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256B42B70);
  }
  return result;
}

uint64_t sub_23C1F6808(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7 = a3();
    result = MEMORY[0x242619B10](MEMORY[0x24BDF5578], v6, &v7);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23C1F686C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256B42B80;
  if (!qword_256B42B80)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B42B48);
    v2[0] = sub_23C1CEF0C(&qword_256B42B88, &qword_256B42248, (uint64_t (*)(void))sub_23C1F6910, MEMORY[0x24BDEDBB8]);
    v2[1] = sub_23C1BC328(&qword_256B41778, &qword_256B41780, MEMORY[0x24BDF1028]);
    result = MEMORY[0x242619B10](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256B42B80);
  }
  return result;
}

unint64_t sub_23C1F6910()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256B42B90;
  if (!qword_256B42B90)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B42240);
    v2[0] = sub_23C1CEF0C(&qword_256B42B98, &qword_256B42B40, (uint64_t (*)(void))sub_23C1E34E0, MEMORY[0x24BDEDB58]);
    v2[1] = sub_23C1BC328(&qword_256B417A0, &qword_256B417A8, MEMORY[0x24BDF1028]);
    result = MEMORY[0x242619B10](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256B42B90);
  }
  return result;
}

uint64_t MarketingInlineState.activeStorefrontLocale.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_23C1FB4B0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t MarketingInlineState.artworkCropCode.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for MarketingInlineState() + 20);
  return sub_23C1F6A70(v3, a1);
}

uint64_t type metadata accessor for MarketingInlineState()
{
  uint64_t result;

  result = qword_256B42C40;
  if (!qword_256B42C40)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23C1F6A70(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B428C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t MarketingInlineState.isInternalBuild.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for MarketingInlineState() + 24));
}

__n128 MarketingInlineState.layout.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  __n128 result;

  v3 = v1 + *(int *)(type metadata accessor for MarketingInlineState() + 28);
  v4 = *(_QWORD *)(v3 + 56);
  *(_BYTE *)a1 = *(_BYTE *)v3;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v3 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(v3 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(v3 + 40);
  *(_QWORD *)(a1 + 56) = v4;
  result = *(__n128 *)(v3 + 64);
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t MarketingInlineState.placement.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = v1 + *(int *)(type metadata accessor for MarketingInlineState() + 32);
  v5 = *(_QWORD *)(v3 + 8);
  v4 = *(_QWORD *)(v3 + 16);
  *(_BYTE *)a1 = *(_BYTE *)v3;
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = v4;
  return swift_bridgeObjectRetain();
}

uint64_t MarketingInlineState.platform.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for MarketingInlineState() + 36));
}

uint64_t MarketingInlineState.loadState.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for MarketingInlineState() + 40);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41518);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t MarketingInlineState.loadState.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for MarketingInlineState() + 40);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41518);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
}

uint64_t (*MarketingInlineState.loadState.modify())()
{
  type metadata accessor for MarketingInlineState();
  return nullsub_1;
}

__n128 MarketingInlineState.init(activeStorefrontLocale:artworkCropCode:isInternalBuild:layout:placement:platform:loadState:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, char *a4@<X3>, char *a5@<X4>, char a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __n128 result;
  __n128 v26;
  __int128 v27;
  __int128 v28;
  char v29;

  v29 = *a4;
  v27 = *(_OWORD *)(a4 + 24);
  v28 = *(_OWORD *)(a4 + 8);
  v26 = *(__n128 *)(a4 + 40);
  v13 = *((_QWORD *)a4 + 7);
  v14 = *((_QWORD *)a4 + 8);
  v15 = *((_QWORD *)a4 + 9);
  v16 = *a5;
  v17 = *((_QWORD *)a5 + 1);
  v18 = *((_QWORD *)a5 + 2);
  v19 = sub_23C1FB4B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(a8, a1, v19);
  v20 = (int *)type metadata accessor for MarketingInlineState();
  sub_23C1F6D94(a2, a8 + v20[5]);
  *(_BYTE *)(a8 + v20[6]) = a3;
  v21 = a8 + v20[8];
  *(_BYTE *)v21 = v16;
  *(_QWORD *)(v21 + 8) = v17;
  *(_QWORD *)(v21 + 16) = v18;
  *(_BYTE *)(a8 + v20[9]) = a6;
  v22 = a8 + v20[10];
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41518);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 32))(v22, a7, v23);
  v24 = a8 + v20[7];
  *(_BYTE *)v24 = v29;
  *(_OWORD *)(v24 + 8) = v28;
  *(_OWORD *)(v24 + 24) = v27;
  result = v26;
  *(__n128 *)(v24 + 40) = v26;
  *(_QWORD *)(v24 + 56) = v13;
  *(_QWORD *)(v24 + 64) = v14;
  *(_QWORD *)(v24 + 72) = v15;
  return result;
}

uint64_t sub_23C1F6D94(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B428C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23C1F6DDC(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23C1F6E14 + 4 * byte_23C202CF0[a1]))(0xD000000000000016, 0x800000023C204720);
}

uint64_t sub_23C1F6E14()
{
  return 0x436B726F77747261;
}

uint64_t sub_23C1F6E38()
{
  return 0x6E7265746E497369;
}

uint64_t sub_23C1F6E5C()
{
  return 0x74756F79616CLL;
}

uint64_t sub_23C1F6E70()
{
  return 0x6E656D6563616C70;
}

uint64_t sub_23C1F6E90()
{
  return 0x6D726F6674616C70;
}

uint64_t sub_23C1F6EA8()
{
  return 0x7461745364616F6CLL;
}

uint64_t sub_23C1F6EC4()
{
  unsigned __int8 *v0;

  return sub_23C1F6DDC(*v0);
}

uint64_t sub_23C1F6ECC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C1F8910(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C1F6EF0()
{
  sub_23C1F7250();
  return sub_23C1FC020();
}

uint64_t sub_23C1F6F18()
{
  sub_23C1F7250();
  return sub_23C1FC02C();
}

uint64_t MarketingInlineState.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  char v15;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  __int128 v21;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42BA0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C1F7250();
  sub_23C1FC014();
  v16 = 0;
  sub_23C1FB4B0();
  sub_23C1B56F4(&qword_256B42448, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], MEMORY[0x24BDCEEC8]);
  sub_23C1FBF78();
  if (!v2)
  {
    v9 = (int *)type metadata accessor for MarketingInlineState();
    v16 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B428C8);
    sub_23C1F7864(&qword_256B42BB0, MEMORY[0x24BE379F0]);
    sub_23C1FBF78();
    v16 = 2;
    sub_23C1FBF60();
    v10 = v3 + v9[7];
    v11 = *(_QWORD *)(v10 + 56);
    v16 = *(_BYTE *)v10;
    v17 = *(_OWORD *)(v10 + 8);
    v18 = *(_OWORD *)(v10 + 24);
    v19 = *(_OWORD *)(v10 + 40);
    v20 = v11;
    v21 = *(_OWORD *)(v10 + 64);
    v15 = 3;
    sub_23C1F7294();
    sub_23C1FBF78();
    v12 = v3 + v9[8];
    v16 = *(_BYTE *)v12;
    v17 = *(_OWORD *)(v12 + 8);
    v15 = 4;
    sub_23C1E63B8();
    sub_23C1FBF78();
    v16 = *(_BYTE *)(v3 + v9[9]);
    v15 = 5;
    sub_23C1C4DC8();
    sub_23C1FBF78();
    v16 = 6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B41518);
    sub_23C1E64E8(&qword_256B42460, MEMORY[0x24BE2B3F8]);
    sub_23C1FBF78();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_23C1F7250()
{
  unint64_t result;

  result = qword_256B42BA8;
  if (!qword_256B42BA8)
  {
    result = MEMORY[0x242619B10](&unk_23C202EFC, &type metadata for MarketingInlineState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B42BA8);
  }
  return result;
}

unint64_t sub_23C1F7294()
{
  unint64_t result;

  result = qword_256B42BC8;
  if (!qword_256B42BC8)
  {
    result = MEMORY[0x242619B10](&protocol conformance descriptor for MarketingInlineLayout, &type metadata for MarketingInlineLayout);
    atomic_store(result, (unint64_t *)&qword_256B42BC8);
  }
  return result;
}

uint64_t MarketingInlineState.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  int *v10;
  uint64_t v11;
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
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  __int128 v39;
  char v40;

  v24 = a2;
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41518);
  v23 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v25 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B428C8);
  MEMORY[0x24BDAC7A8](v27);
  v28 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = sub_23C1FB4B0();
  v5 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v30 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42BD0);
  v7 = *(_QWORD *)(v31 - 8);
  MEMORY[0x24BDAC7A8](v31);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (int *)type metadata accessor for MarketingInlineState();
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C1F7250();
  v32 = v9;
  v13 = v33;
  sub_23C1FC008();
  if (v13)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v33 = v7;
  v14 = (uint64_t)v12;
  v34 = 0;
  sub_23C1B56F4(&qword_256B42488, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], MEMORY[0x24BDCEEE8]);
  v15 = v29;
  sub_23C1FBF18();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v14, v30, v15);
  v34 = 1;
  sub_23C1F7864(&qword_256B42BD8, MEMORY[0x24BE379F8]);
  v16 = (uint64_t)v28;
  sub_23C1FBF18();
  sub_23C1F6D94(v16, v14 + v10[5]);
  v34 = 2;
  *(_BYTE *)(v14 + v10[6]) = sub_23C1FBF00() & 1;
  v40 = 3;
  sub_23C1F791C();
  sub_23C1FBF18();
  v17 = v38;
  v18 = v14 + v10[7];
  *(_BYTE *)v18 = v34;
  *(_OWORD *)(v18 + 8) = v35;
  *(_OWORD *)(v18 + 24) = v36;
  *(_OWORD *)(v18 + 40) = v37;
  *(_QWORD *)(v18 + 56) = v17;
  *(_OWORD *)(v18 + 64) = v39;
  v40 = 4;
  sub_23C1E6440();
  sub_23C1FBF18();
  v19 = v14 + v10[8];
  *(_BYTE *)v19 = v34;
  *(_OWORD *)(v19 + 8) = v35;
  v40 = 5;
  sub_23C1C4EB8();
  sub_23C1FBF18();
  *(_BYTE *)(v14 + v10[9]) = v34;
  v34 = 6;
  sub_23C1E64E8(&qword_256B424A0, MEMORY[0x24BE2B410]);
  v20 = v25;
  v21 = v26;
  sub_23C1FBF18();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v32, v31);
  (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(v14 + v10[10], v20, v21);
  sub_23C1F7960(v14, v24);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_23C1F79A4(v14);
}

uint64_t sub_23C1F7824(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B428C8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23C1F7864(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  _QWORD v7[4];

  result = *a1;
  if (!result)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B428C8);
    v6 = (uint64_t (*)(uint64_t))MEMORY[0x24BE35120];
    v7[0] = sub_23C1B56F4(&qword_256B42BB8, (uint64_t (*)(uint64_t))MEMORY[0x24BE35120], MEMORY[0x24BE35150]);
    v7[1] = sub_23C1B56F4(&qword_256B42BC0, v6, MEMORY[0x24BE35130]);
    v7[2] = MEMORY[0x24BEE0D38];
    v7[3] = MEMORY[0x24BEE0D08];
    result = MEMORY[0x242619B10](a2, v5, v7);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23C1F791C()
{
  unint64_t result;

  result = qword_256B42BE0;
  if (!qword_256B42BE0)
  {
    result = MEMORY[0x242619B10](&protocol conformance descriptor for MarketingInlineLayout, &type metadata for MarketingInlineLayout);
    atomic_store(result, (unint64_t *)&qword_256B42BE0);
  }
  return result;
}

uint64_t sub_23C1F7960(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MarketingInlineState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23C1F79A4(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for MarketingInlineState();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23C1F79E0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return MarketingInlineState.init(from:)(a1, a2);
}

uint64_t sub_23C1F79F4(_QWORD *a1)
{
  return MarketingInlineState.encode(to:)(a1);
}

uint64_t _s16FitnessMarketing0B11InlineStateV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  int *v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 v13[8];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  unsigned __int8 v19[8];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  __int128 v24;

  if ((MEMORY[0x242618B74]() & 1) == 0)
    return 0;
  v4 = (int *)type metadata accessor for MarketingInlineState();
  sub_23C1FB4D4();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BE35120];
  sub_23C1B56F4(&qword_256B42CB8, (uint64_t (*)(uint64_t))MEMORY[0x24BE35120], MEMORY[0x24BE35140]);
  sub_23C1B56F4(qword_256B42C58, v5, MEMORY[0x24BE35148]);
  if ((sub_23C1FB4E0() & 1) == 0)
    return 0;
  if (*(unsigned __int8 *)(a1 + v4[6]) != *(unsigned __int8 *)(a2 + v4[6]))
    return 0;
  v6 = a1 + v4[7];
  v7 = *(_QWORD *)(v6 + 56);
  v19[0] = *(_BYTE *)v6;
  v20 = *(_OWORD *)(v6 + 8);
  v21 = *(_OWORD *)(v6 + 24);
  v22 = *(_OWORD *)(v6 + 40);
  v23 = v7;
  v24 = *(_OWORD *)(v6 + 64);
  v8 = a2 + v4[7];
  v9 = *(_QWORD *)(v8 + 56);
  v13[0] = *(_BYTE *)v8;
  v14 = *(_OWORD *)(v8 + 8);
  v15 = *(_OWORD *)(v8 + 24);
  v16 = *(_OWORD *)(v8 + 40);
  v17 = v9;
  v18 = *(_OWORD *)(v8 + 64);
  if (!_s16FitnessMarketing0B12InlineLayoutV2eeoiySbAC_ACtFZ_0(v19, v13))
    return 0;
  v10 = v4[8];
  v19[0] = *(_BYTE *)(a1 + v10);
  v20 = *(_OWORD *)(a1 + v10 + 8);
  v11 = a2 + v10;
  v13[0] = *(_BYTE *)v11;
  v14 = *(_OWORD *)(v11 + 8);
  if (!_s16FitnessMarketing0B9PlacementV2eeoiySbAC_ACtFZ_0((uint64_t)v19, (uint64_t)v13)
    || *(unsigned __int8 *)(a1 + v4[9]) != *(unsigned __int8 *)(a2 + v4[9]))
  {
    return 0;
  }
  type metadata accessor for MarketingOffer();
  sub_23C1B56F4(&qword_256B40BD8, (uint64_t (*)(uint64_t))type metadata accessor for MarketingOffer, (uint64_t)&protocol conformance descriptor for MarketingOffer);
  return sub_23C1FBC18();
}

_QWORD *initializeBufferWithCopyOfBuffer for MarketingInlineState(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _OWORD *v15;
  _OWORD *v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23C1FB4B0();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = (_QWORD *)((char *)a1 + v8);
    v10 = (_QWORD *)((char *)a2 + v8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B428C8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v11 = sub_23C1FB4D4();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    }
    else
    {
      v13 = v10[1];
      *v9 = *v10;
      v9[1] = v13;
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
    v14 = a3[7];
    *((_BYTE *)a1 + a3[6]) = *((_BYTE *)a2 + a3[6]);
    v15 = (_OWORD *)((char *)a1 + v14);
    v16 = (_OWORD *)((char *)a2 + v14);
    v17 = v16[3];
    v15[2] = v16[2];
    v15[3] = v17;
    v15[4] = v16[4];
    v18 = v16[1];
    *v15 = *v16;
    v15[1] = v18;
    v19 = a3[8];
    v20 = a3[9];
    v21 = (char *)a1 + v19;
    v22 = (char *)a2 + v19;
    *v21 = *v22;
    v23 = *((_QWORD *)v22 + 2);
    *((_QWORD *)v21 + 1) = *((_QWORD *)v22 + 1);
    *((_QWORD *)v21 + 2) = v23;
    v24 = a3[10];
    v25 = (char *)a1 + v24;
    v26 = (char *)a2 + v24;
    *((_BYTE *)a1 + v20) = *((_BYTE *)a2 + v20);
    swift_bridgeObjectRetain();
    v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41518);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v27 - 8) + 16))(v25, v26, v27);
  }
  return a1;
}

uint64_t destroy for MarketingInlineState(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = sub_23C1FB4B0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B428C8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_23C1FB4D4();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  v7 = a1 + *(int *)(a2 + 40);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41518);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
}

uint64_t initializeWithCopy for MarketingInlineState(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  _OWORD *v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v6 = sub_23C1FB4B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B428C8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_23C1FB4D4();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    v11 = v9[1];
    *v8 = *v9;
    v8[1] = v11;
    swift_bridgeObjectRetain();
  }
  swift_storeEnumTagMultiPayload();
  v12 = a3[7];
  *(_BYTE *)(a1 + a3[6]) = *(_BYTE *)(a2 + a3[6]);
  v13 = (_OWORD *)(a1 + v12);
  v14 = (_OWORD *)(a2 + v12);
  v15 = v14[3];
  v13[2] = v14[2];
  v13[3] = v15;
  v13[4] = v14[4];
  v16 = v14[1];
  *v13 = *v14;
  v13[1] = v16;
  v17 = a3[8];
  v18 = a3[9];
  v19 = a1 + v17;
  v20 = a2 + v17;
  *(_BYTE *)v19 = *(_BYTE *)v20;
  v21 = *(_QWORD *)(v20 + 16);
  *(_QWORD *)(v19 + 8) = *(_QWORD *)(v20 + 8);
  *(_QWORD *)(v19 + 16) = v21;
  v22 = a3[10];
  v23 = a1 + v22;
  v24 = a2 + v22;
  *(_BYTE *)(a1 + v18) = *(_BYTE *)(a2 + v18);
  swift_bridgeObjectRetain();
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41518);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 16))(v23, v24, v25);
  return a1;
}

uint64_t assignWithCopy for MarketingInlineState(uint64_t a1, uint64_t a2, int *a3)
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v6 = sub_23C1FB4B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  if (a1 != a2)
  {
    v7 = a3[5];
    v8 = (_QWORD *)(a1 + v7);
    v9 = (_QWORD *)(a2 + v7);
    sub_23C1F7824(a1 + v7);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B428C8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v10 = sub_23C1FB4D4();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      *v8 = *v9;
      v8[1] = v9[1];
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  *(_BYTE *)(a1 + a3[6]) = *(_BYTE *)(a2 + a3[6]);
  v11 = a3[7];
  v12 = a1 + v11;
  v13 = a2 + v11;
  *(_BYTE *)v12 = *(_BYTE *)v13;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v13 + 8);
  *(_QWORD *)(v12 + 16) = *(_QWORD *)(v13 + 16);
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v13 + 24);
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v13 + 32);
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v13 + 40);
  *(_QWORD *)(v12 + 48) = *(_QWORD *)(v13 + 48);
  *(_QWORD *)(v12 + 56) = *(_QWORD *)(v13 + 56);
  *(_QWORD *)(v12 + 64) = *(_QWORD *)(v13 + 64);
  *(_QWORD *)(v12 + 72) = *(_QWORD *)(v13 + 72);
  v14 = a3[8];
  v15 = a1 + v14;
  v16 = a2 + v14;
  *(_BYTE *)v15 = *(_BYTE *)v16;
  *(_QWORD *)(v15 + 8) = *(_QWORD *)(v16 + 8);
  *(_QWORD *)(v15 + 16) = *(_QWORD *)(v16 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + a3[9]) = *(_BYTE *)(a2 + a3[9]);
  v17 = a3[10];
  v18 = a1 + v17;
  v19 = a2 + v17;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41518);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 24))(v18, v19, v20);
  return a1;
}

uint64_t initializeWithTake for MarketingInlineState(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  _OWORD *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 *v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v6 = sub_23C1FB4B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[5];
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B428C8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v11 = sub_23C1FB4D4();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v8, v9, v11);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
  }
  v12 = a3[7];
  *(_BYTE *)(a1 + a3[6]) = *(_BYTE *)(a2 + a3[6]);
  v13 = (_OWORD *)(a1 + v12);
  v14 = (_OWORD *)(a2 + v12);
  v15 = v14[4];
  v16 = v14[2];
  v13[3] = v14[3];
  v13[4] = v15;
  v17 = v14[1];
  *v13 = *v14;
  v13[1] = v17;
  v13[2] = v16;
  v18 = a3[8];
  v19 = a3[9];
  v20 = a1 + v18;
  v21 = (__int128 *)(a2 + v18);
  v22 = *v21;
  *(_QWORD *)(v20 + 16) = *((_QWORD *)v21 + 2);
  *(_OWORD *)v20 = v22;
  v23 = a3[10];
  v24 = a1 + v23;
  v25 = a2 + v23;
  *(_BYTE *)(a1 + v19) = *(_BYTE *)(a2 + v19);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41518);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 32))(v24, v25, v26);
  return a1;
}

uint64_t assignWithTake for MarketingInlineState(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
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

  v6 = sub_23C1FB4B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  if (a1 != a2)
  {
    v7 = a3[5];
    v8 = (void *)(a1 + v7);
    v9 = (const void *)(a2 + v7);
    sub_23C1F7824(a1 + v7);
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B428C8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v11 = sub_23C1FB4D4();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v8, v9, v11);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
  }
  v12 = a3[7];
  *(_BYTE *)(a1 + a3[6]) = *(_BYTE *)(a2 + a3[6]);
  v13 = a1 + v12;
  v14 = a2 + v12;
  *(_BYTE *)v13 = *(_BYTE *)v14;
  *(_OWORD *)(v13 + 8) = *(_OWORD *)(v14 + 8);
  *(_OWORD *)(v13 + 24) = *(_OWORD *)(v14 + 24);
  *(_OWORD *)(v13 + 40) = *(_OWORD *)(v14 + 40);
  *(_QWORD *)(v13 + 56) = *(_QWORD *)(v14 + 56);
  *(_OWORD *)(v13 + 64) = *(_OWORD *)(v14 + 64);
  v15 = a3[8];
  v16 = a1 + v15;
  v17 = a2 + v15;
  *(_BYTE *)v16 = *(_BYTE *)v17;
  v19 = *(_QWORD *)(v17 + 8);
  v18 = *(_QWORD *)(v17 + 16);
  *(_QWORD *)(v16 + 8) = v19;
  *(_QWORD *)(v16 + 16) = v18;
  swift_bridgeObjectRelease();
  v20 = a3[10];
  *(_BYTE *)(a1 + a3[9]) = *(_BYTE *)(a2 + a3[9]);
  v21 = a1 + v20;
  v22 = a2 + v20;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41518);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 40))(v21, v22, v23);
  return a1;
}

uint64_t getEnumTagSinglePayload for MarketingInlineState()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C1F8468(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int v14;

  v6 = sub_23C1FB4B0();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B428C8);
  v10 = *(_QWORD *)(v9 - 8);
  if (*(_DWORD *)(v10 + 84) == (_DWORD)a2)
  {
    v11 = v9;
    v12 = a3[5];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1 + v12, a2, v11);
  }
  if ((_DWORD)a2 != 2147483646)
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41518);
    v10 = *(_QWORD *)(v11 - 8);
    v12 = a3[10];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1 + v12, a2, v11);
  }
  v13 = *(_QWORD *)(a1 + a3[8] + 16);
  if (v13 >= 0xFFFFFFFF)
    LODWORD(v13) = -1;
  v14 = v13 - 1;
  if (v14 < 0)
    v14 = -1;
  return (v14 + 1);
}

uint64_t storeEnumTagSinglePayload for MarketingInlineState()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C1F8558(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;

  v8 = sub_23C1FB4B0();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    result = __swift_instantiateConcreteTypeFromMangledName(&qword_256B428C8);
    v14 = *(_QWORD *)(result - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = result;
      v15 = a4[5];
    }
    else
    {
      if (a3 == 2147483646)
      {
        *(_QWORD *)(a1 + a4[8] + 16) = a2;
        return result;
      }
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41518);
      v14 = *(_QWORD *)(v10 - 8);
      v15 = a4[10];
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_23C1F862C()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_23C1FB4B0();
  if (v0 <= 0x3F)
  {
    sub_23C1F86F4();
    if (v1 <= 0x3F)
    {
      sub_23C1E71FC();
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

void sub_23C1F86F4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256B42C50)
  {
    sub_23C1FB4D4();
    sub_23C1B56F4(qword_256B42C58, (uint64_t (*)(uint64_t))MEMORY[0x24BE35120], MEMORY[0x24BE35148]);
    v0 = sub_23C1FB4EC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256B42C50);
  }
}

uint64_t storeEnumTagSinglePayload for MarketingInlineState.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C1F87B8 + 4 * byte_23C202CFC[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_23C1F87EC + 4 * byte_23C202CF7[v4]))();
}

uint64_t sub_23C1F87EC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1F87F4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C1F87FCLL);
  return result;
}

uint64_t sub_23C1F8808(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C1F8810);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_23C1F8814(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1F881C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MarketingInlineState.CodingKeys()
{
  return &type metadata for MarketingInlineState.CodingKeys;
}

unint64_t sub_23C1F883C()
{
  unint64_t result;

  result = qword_256B42CA0;
  if (!qword_256B42CA0)
  {
    result = MEMORY[0x242619B10](&unk_23C202ED4, &type metadata for MarketingInlineState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B42CA0);
  }
  return result;
}

unint64_t sub_23C1F8884()
{
  unint64_t result;

  result = qword_256B42CA8;
  if (!qword_256B42CA8)
  {
    result = MEMORY[0x242619B10](&unk_23C202E44, &type metadata for MarketingInlineState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B42CA8);
  }
  return result;
}

unint64_t sub_23C1F88CC()
{
  unint64_t result;

  result = qword_256B42CB0;
  if (!qword_256B42CB0)
  {
    result = MEMORY[0x242619B10](&unk_23C202E6C, &type metadata for MarketingInlineState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B42CB0);
  }
  return result;
}

uint64_t sub_23C1F8910(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000016 && a2 == 0x800000023C204720 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x436B726F77747261 && a2 == 0xEF65646F43706F72 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E7265746E497369 && a2 == 0xEF646C6975426C61 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x74756F79616CLL && a2 == 0xE600000000000000 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6E656D6563616C70 && a2 == 0xE900000000000074 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6D726F6674616C70 && a2 == 0xE800000000000000 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x7461745364616F6CLL && a2 == 0xE900000000000065)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    v5 = sub_23C1FBF90();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 6;
    else
      return 7;
  }
}

uint64_t ServiceSubscriptionMonitorEnvironment.makeServiceSubscriptionPurchasedStream.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_retain();
  return v1;
}

uint64_t ServiceSubscriptionMonitorEnvironment.navigateToForYou.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_retain();
  return v1;
}

uint64_t ServiceSubscriptionMonitorEnvironment.init(makeServiceSubscriptionPurchasedStream:navigateToForYou:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

ValueMetadata *type metadata accessor for ServiceSubscriptionMonitorEnvironment()
{
  return &type metadata for ServiceSubscriptionMonitorEnvironment;
}

_BYTE *MarketingInlineLayout.init(style:aspectRatio:bottomPadding:topPadding:cornerRadius:horizontalMargins:horizontalPadding:titleLineLimit:subtitleLineLimit:)@<X0>(_BYTE *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>, double a6@<D1>, double a7@<D2>, double a8@<D3>, double a9@<D4>, double a10@<D5>, double a11@<D6>)
{
  *(_BYTE *)a4 = *result;
  *(double *)(a4 + 8) = a5;
  *(double *)(a4 + 16) = a6;
  *(double *)(a4 + 24) = a7;
  *(double *)(a4 + 32) = a8;
  *(double *)(a4 + 40) = a9;
  *(double *)(a4 + 48) = a10;
  *(double *)(a4 + 56) = a11;
  *(_QWORD *)(a4 + 64) = a2;
  *(_QWORD *)(a4 + 72) = a3;
  return result;
}

void MarketingInlineLayout.style.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

double MarketingInlineLayout.aspectRatio.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 8);
}

double MarketingInlineLayout.bottomPadding.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 24);
}

double MarketingInlineLayout.topPadding.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 32);
}

double MarketingInlineLayout.cornerRadius.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 40);
}

double MarketingInlineLayout.horizontalMargins.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 48);
}

double MarketingInlineLayout.horizontalPadding.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 56);
}

uint64_t MarketingInlineLayout.titleLineLimit.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 64);
}

uint64_t MarketingInlineLayout.subtitleLineLimit.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 72);
}

uint64_t sub_23C1F8D24(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23C1F8D54 + 4 * a5[a1]))(0x656C797473, 0xE500000000000000);
}

uint64_t sub_23C1F8D54()
{
  return 0x6152746365707361;
}

uint64_t sub_23C1F8D74()
{
  return 0x61506D6F74746F62;
}

uint64_t sub_23C1F8D98()
{
  return 0x6964646150706F74;
}

uint64_t sub_23C1F8DB4()
{
  return 0x615272656E726F63;
}

unint64_t sub_23C1F8DD4()
{
  return 0xD000000000000011;
}

uint64_t sub_23C1F8E2C()
{
  unsigned __int8 *v0;

  return sub_23C1F8D24(*v0);
}

uint64_t sub_23C1F8E34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C1F9C40(a1, a2);
  *a3 = result;
  return result;
}

void sub_23C1F8E58(_BYTE *a1@<X8>)
{
  *a1 = 9;
}

uint64_t sub_23C1F8E64()
{
  sub_23C1F97F0();
  return sub_23C1FC020();
}

uint64_t sub_23C1F8E8C()
{
  sub_23C1F97F0();
  return sub_23C1FC02C();
}

uint64_t MarketingInlineLayout.encode(to:)(_QWORD *a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[3];
  uint64_t v19;
  uint64_t v20;
  char v21;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42CC0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v9 = *((_QWORD *)v1 + 1);
  v10 = *((_QWORD *)v1 + 2);
  v12 = *((_QWORD *)v1 + 3);
  v11 = *((_QWORD *)v1 + 4);
  v14 = *((_QWORD *)v1 + 5);
  v13 = *((_QWORD *)v1 + 6);
  v15 = *((_QWORD *)v1 + 7);
  v16 = *((_QWORD *)v1 + 8);
  v18[1] = *((_QWORD *)v1 + 9);
  v18[2] = v16;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C1F97F0();
  sub_23C1FC014();
  LOBYTE(v19) = v8;
  v21 = 0;
  sub_23C1F9834();
  sub_23C1FBF78();
  if (!v2)
  {
    v19 = v9;
    v20 = v10;
    v21 = 1;
    type metadata accessor for CGSize();
    sub_23C1F98BC(&qword_256B42CD8, MEMORY[0x24BDBD848]);
    sub_23C1FBF78();
    v19 = v12;
    v21 = 2;
    sub_23C1E5E94();
    sub_23C1FBF78();
    v19 = v11;
    v21 = 3;
    sub_23C1FBF78();
    v19 = v14;
    v21 = 4;
    sub_23C1FBF78();
    v19 = v13;
    v21 = 5;
    sub_23C1FBF78();
    v19 = v15;
    v21 = 6;
    sub_23C1FBF78();
    LOBYTE(v19) = 7;
    sub_23C1FBF6C();
    LOBYTE(v19) = 8;
    sub_23C1FBF6C();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t MarketingInlineLayout.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
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
  char v23;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42CE0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C1F97F0();
  sub_23C1FC008();
  if (!v2)
  {
    v23 = 0;
    sub_23C1F9878();
    sub_23C1FBF18();
    v9 = v21;
    type metadata accessor for CGSize();
    v23 = 1;
    sub_23C1F98BC(&qword_256B42CF0, MEMORY[0x24BDBD860]);
    sub_23C1FBF18();
    v10 = v21;
    v11 = v22;
    v23 = 2;
    sub_23C1E5F1C();
    sub_23C1FBF18();
    v12 = v21;
    v23 = 3;
    sub_23C1FBF18();
    v13 = v21;
    v23 = 4;
    sub_23C1FBF18();
    v14 = v21;
    v23 = 5;
    sub_23C1FBF18();
    v15 = v21;
    v23 = 6;
    sub_23C1FBF18();
    v16 = v21;
    LOBYTE(v21) = 7;
    v18 = sub_23C1FBF0C();
    LOBYTE(v21) = 8;
    v19 = sub_23C1FBF0C();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *(_BYTE *)a2 = v9;
    *(_QWORD *)(a2 + 8) = v10;
    *(_QWORD *)(a2 + 16) = v11;
    *(_QWORD *)(a2 + 24) = v12;
    *(_QWORD *)(a2 + 32) = v13;
    *(_QWORD *)(a2 + 40) = v14;
    *(_QWORD *)(a2 + 48) = v15;
    *(_QWORD *)(a2 + 56) = v16;
    *(_QWORD *)(a2 + 64) = v18;
    *(_QWORD *)(a2 + 72) = v19;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_23C1F9510@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return MarketingInlineLayout.init(from:)(a1, a2);
}

uint64_t sub_23C1F9524(_QWORD *a1)
{
  return MarketingInlineLayout.encode(to:)(a1);
}

uint64_t MarketingInlineLayout.hash(into:)()
{
  sub_23C1FBFD8();
  sub_23C1FBFF0();
  sub_23C1FBFF0();
  sub_23C1FBFF0();
  sub_23C1FBFF0();
  sub_23C1FBFF0();
  sub_23C1FBFF0();
  sub_23C1FBFF0();
  sub_23C1FBFD8();
  return sub_23C1FBFD8();
}

uint64_t MarketingInlineLayout.hashValue.getter()
{
  sub_23C1FBFCC();
  MarketingInlineLayout.hash(into:)();
  return sub_23C1FBFFC();
}

uint64_t sub_23C1F9668()
{
  sub_23C1FBFCC();
  MarketingInlineLayout.hash(into:)();
  return sub_23C1FBFFC();
}

uint64_t sub_23C1F96DC()
{
  sub_23C1FBFCC();
  MarketingInlineLayout.hash(into:)();
  return sub_23C1FBFFC();
}

BOOL _s16FitnessMarketing0B12InlineLayoutV2eeoiySbAC_ACtFZ_0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  _BOOL8 result;

  result = 0;
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 8), *(float64x2_t *)(a2 + 8)), (int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 24), *(float64x2_t *)(a2 + 24)))), 0xFuLL))) & 1) != 0&& *((double *)a1 + 5) == *((double *)a2 + 5)&& *((double *)a1 + 6) == *((double *)a2 + 6)&& *((double *)a1 + 7) == *((double *)a2 + 7)&& ((*a1 ^ *a2) & 1) == 0&& *((_QWORD *)a1 + 8) == *((_QWORD *)a2 + 8))
  {
    return *((_QWORD *)a1 + 9) == *((_QWORD *)a2 + 9);
  }
  return result;
}

unint64_t sub_23C1F97F0()
{
  unint64_t result;

  result = qword_256B42CC8;
  if (!qword_256B42CC8)
  {
    result = MEMORY[0x242619B10](&unk_23C20316C, &type metadata for MarketingInlineLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B42CC8);
  }
  return result;
}

unint64_t sub_23C1F9834()
{
  unint64_t result;

  result = qword_256B42CD0;
  if (!qword_256B42CD0)
  {
    result = MEMORY[0x242619B10](&protocol conformance descriptor for MarketingInlineLayoutStyle, &type metadata for MarketingInlineLayoutStyle);
    atomic_store(result, (unint64_t *)&qword_256B42CD0);
  }
  return result;
}

unint64_t sub_23C1F9878()
{
  unint64_t result;

  result = qword_256B42CE8;
  if (!qword_256B42CE8)
  {
    result = MEMORY[0x242619B10](&protocol conformance descriptor for MarketingInlineLayoutStyle, &type metadata for MarketingInlineLayoutStyle);
    atomic_store(result, (unint64_t *)&qword_256B42CE8);
  }
  return result;
}

uint64_t sub_23C1F98BC(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for CGSize();
    result = MEMORY[0x242619B10](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23C1F9900()
{
  unint64_t result;

  result = qword_256B42CF8;
  if (!qword_256B42CF8)
  {
    result = MEMORY[0x242619B10](&protocol conformance descriptor for MarketingInlineLayout, &type metadata for MarketingInlineLayout);
    atomic_store(result, (unint64_t *)&qword_256B42CF8);
  }
  return result;
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

uint64_t getEnumTagSinglePayload for MarketingInlineLayout(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && a1[80])
    return (*(_DWORD *)a1 + 255);
  v3 = *a1;
  v4 = v3 >= 2;
  v5 = v3 - 2;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for MarketingInlineLayout(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 80) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 80) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for MarketingInlineLayout()
{
  return &type metadata for MarketingInlineLayout;
}

uint64_t getEnumTagSinglePayload for MarketingInlineLayout.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for MarketingInlineLayout.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C1F9AE8 + 4 * byte_23C202F9E[v4]))();
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_23C1F9B1C + 4 * byte_23C202F99[v4]))();
}

uint64_t sub_23C1F9B1C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1F9B24(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C1F9B2CLL);
  return result;
}

uint64_t sub_23C1F9B38(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C1F9B40);
  *(_BYTE *)result = a2 + 8;
  return result;
}

uint64_t sub_23C1F9B44(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1F9B4C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MarketingInlineLayout.CodingKeys()
{
  return &type metadata for MarketingInlineLayout.CodingKeys;
}

unint64_t sub_23C1F9B6C()
{
  unint64_t result;

  result = qword_256B42D00;
  if (!qword_256B42D00)
  {
    result = MEMORY[0x242619B10](&unk_23C203144, &type metadata for MarketingInlineLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B42D00);
  }
  return result;
}

unint64_t sub_23C1F9BB4()
{
  unint64_t result;

  result = qword_256B42D08;
  if (!qword_256B42D08)
  {
    result = MEMORY[0x242619B10](&unk_23C2030B4, &type metadata for MarketingInlineLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B42D08);
  }
  return result;
}

unint64_t sub_23C1F9BFC()
{
  unint64_t result;

  result = qword_256B42D10;
  if (!qword_256B42D10)
  {
    result = MEMORY[0x242619B10](&unk_23C2030DC, &type metadata for MarketingInlineLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B42D10);
  }
  return result;
}

uint64_t sub_23C1F9C40(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x656C797473 && a2 == 0xE500000000000000;
  if (v2 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6152746365707361 && a2 == 0xEB000000006F6974 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x61506D6F74746F62 && a2 == 0xED0000676E696464 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6964646150706F74 && a2 == 0xEA0000000000676ELL || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x615272656E726F63 && a2 == 0xEC00000073756964 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000023C204740 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000023C204760 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x6E694C656C746974 && a2 == 0xEE0074696D694C65 || (sub_23C1FBF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000023C204780)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else
  {
    v6 = sub_23C1FBF90();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 8;
    else
      return 9;
  }
}

__n128 MarketingInlineFeature.init(environment:)@<Q0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 16);
  *a2 = *(_OWORD *)a1;
  a2[1] = v3;
  return result;
}

uint64_t MarketingInlineFeature.reduce(localState:sharedState:sideEffects:action:)(uint64_t a1, uint64_t a2, unint64_t *a3, char a4)
{
  uint64_t *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned __int8 *v17;
  uint64_t v18;
  int *v19;
  uint64_t v20;
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
  uint64_t v31;
  unint64_t *v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  char *v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t result;
  uint64_t v47;
  char *v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t *v53;
  char v54;
  char v55;

  v53 = a3;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B41228);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v47 - v12;
  v14 = v4[1];
  v15 = v4[2];
  v16 = v4[3];
  v51 = *v4;
  v52 = v15;
  v17 = (unsigned __int8 *)(a2 + *(int *)(type metadata accessor for MarketingInlineState() + 32));
  v49 = *v17;
  v18 = *((_QWORD *)v17 + 2);
  v50 = *((_QWORD *)v17 + 1);
  v19 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_256B42900);
  v20 = v19[12];
  v21 = v19[16];
  v22 = v19[20];
  v23 = v19[24];
  if ((a4 & 1) != 0)
  {
    v48 = &v11[v20];
    v37 = &v11[v21];
    v38 = &v11[v22];
    v39 = &v11[v23];
    v55 = 1;
    sub_23C1FA460();
    swift_bridgeObjectRetain();
    sub_23C1FBE10();
    v40 = *MEMORY[0x24BE2B570];
    v41 = sub_23C1FBC48();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 104))(v37, v40, v41);
    v42 = *MEMORY[0x24BE2B550];
    v43 = sub_23C1FBC3C();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 104))(v38, v42, v43);
    v44 = swift_allocObject();
    *(_QWORD *)(v44 + 16) = v51;
    *(_QWORD *)(v44 + 24) = v14;
    *(_QWORD *)(v44 + 32) = v52;
    *(_QWORD *)(v44 + 40) = v16;
    *(_BYTE *)(v44 + 48) = v49;
    *(_QWORD *)(v44 + 56) = v50;
    *(_QWORD *)(v44 + 64) = v18;
    *(_QWORD *)v39 = &unk_256B42D28;
    *((_QWORD *)v39 + 1) = v44;
    swift_retain();
    swift_retain();
    sub_23C1FBD80();
    (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v11, *MEMORY[0x24BE2B438], v7);
    v32 = v53;
    v33 = *v53;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v33 = sub_23C1C4B10(0, *(_QWORD *)(v33 + 16) + 1, 1, v33);
    v35 = *(_QWORD *)(v33 + 16);
    v45 = *(_QWORD *)(v33 + 24);
    v36 = v35 + 1;
    if (v35 >= v45 >> 1)
      v33 = sub_23C1C4B10(v45 > 1, v35 + 1, 1, v33);
    v13 = v11;
  }
  else
  {
    v48 = &v13[v20];
    v24 = &v13[v21];
    v25 = &v13[v22];
    v26 = &v13[v23];
    v54 = 0;
    sub_23C1FA460();
    swift_bridgeObjectRetain();
    sub_23C1FBE10();
    v27 = *MEMORY[0x24BE2B570];
    v28 = sub_23C1FBC48();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 104))(v24, v27, v28);
    v29 = *MEMORY[0x24BE2B550];
    v30 = sub_23C1FBC3C();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 104))(v25, v29, v30);
    v31 = swift_allocObject();
    *(_QWORD *)(v31 + 16) = v51;
    *(_QWORD *)(v31 + 24) = v14;
    *(_QWORD *)(v31 + 32) = v52;
    *(_QWORD *)(v31 + 40) = v16;
    *(_BYTE *)(v31 + 48) = v49;
    *(_QWORD *)(v31 + 56) = v50;
    *(_QWORD *)(v31 + 64) = v18;
    *(_QWORD *)v26 = &unk_256B42D38;
    *((_QWORD *)v26 + 1) = v31;
    swift_retain();
    swift_retain();
    sub_23C1FBD80();
    (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v13, *MEMORY[0x24BE2B438], v7);
    v32 = v53;
    v33 = *v53;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v33 = sub_23C1C4B10(0, *(_QWORD *)(v33 + 16) + 1, 1, v33);
    v35 = *(_QWORD *)(v33 + 16);
    v34 = *(_QWORD *)(v33 + 24);
    v36 = v35 + 1;
    if (v35 >= v34 >> 1)
      v33 = sub_23C1C4B10(v34 > 1, v35 + 1, 1, v33);
  }
  *(_QWORD *)(v33 + 16) = v36;
  result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v8 + 32))(v33+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(_QWORD *)(v8 + 72) * v35, v13, v7);
  *v32 = v33;
  return result;
}

unint64_t sub_23C1FA460()
{
  unint64_t result;

  result = qword_256B42D18;
  if (!qword_256B42D18)
  {
    result = MEMORY[0x242619B10](&unk_23C203290, &type metadata for MarketingInlineFeature.TaskIdentifier);
    atomic_store(result, &qword_256B42D18);
  }
  return result;
}

uint64_t sub_23C1FA4A4(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v13;
  _QWORD *v14;
  uint64_t (*v16)(uint64_t);

  *(_QWORD *)(v8 + 40) = sub_23C1FBD74();
  v13 = sub_23C1FBD68();
  *(_BYTE *)(v8 + 16) = a6;
  *(_QWORD *)(v8 + 48) = v13;
  *(_QWORD *)(v8 + 24) = a7;
  *(_QWORD *)(v8 + 32) = a8;
  v16 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v14 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v8 + 56) = v14;
  *v14 = v8;
  v14[1] = sub_23C1FA548;
  return v16(v8 + 16);
}

uint64_t sub_23C1FA548()
{
  swift_task_dealloc();
  sub_23C1FBD50();
  return swift_task_switch();
}

uint64_t sub_23C1FA5B8(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v13;
  _QWORD *v14;
  uint64_t (*v16)(uint64_t);

  *(_QWORD *)(v8 + 40) = sub_23C1FBD74();
  v13 = sub_23C1FBD68();
  *(_BYTE *)(v8 + 16) = a6;
  *(_QWORD *)(v8 + 48) = v13;
  *(_QWORD *)(v8 + 24) = a7;
  *(_QWORD *)(v8 + 32) = a8;
  v16 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  v14 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v8 + 56) = v14;
  *v14 = v8;
  v14[1] = sub_23C1FA65C;
  return v16(v8 + 16);
}

uint64_t sub_23C1FA65C()
{
  swift_task_dealloc();
  sub_23C1FBD50();
  return swift_task_switch();
}

uint64_t sub_23C1FA6D0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  _QWORD *v11;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(int **)(v1 + 32);
  v7 = *(_QWORD *)(v1 + 40);
  v8 = *(_QWORD *)(v1 + 56);
  v9 = *(_QWORD *)(v1 + 64);
  v10 = *(_BYTE *)(v1 + 48);
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_23C1BD8B8;
  return sub_23C1FA5B8(a1, v4, v5, v6, v7, v10, v8, v9);
}

uint64_t sub_23C1FA764(uint64_t a1, uint64_t a2, unint64_t *a3, char *a4)
{
  return MarketingInlineFeature.reduce(localState:sharedState:sideEffects:action:)(a1, a2, a3, *a4);
}

uint64_t objectdestroyTm_1()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23C1FA7A4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  _QWORD *v11;

  v4 = *(int **)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_QWORD *)(v1 + 40);
  v8 = *(_QWORD *)(v1 + 56);
  v9 = *(_QWORD *)(v1 + 64);
  v10 = *(_BYTE *)(v1 + 48);
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_23C1F352C;
  return sub_23C1FA4A4(a1, v4, v5, v6, v7, v10, v8, v9);
}

unint64_t sub_23C1FA838()
{
  unint64_t result;

  result = qword_256B42D40;
  if (!qword_256B42D40)
  {
    result = MEMORY[0x242619B10](&protocol conformance descriptor for MarketingInlineAction, &type metadata for MarketingInlineAction);
    atomic_store(result, (unint64_t *)&qword_256B42D40);
  }
  return result;
}

unint64_t sub_23C1FA880()
{
  unint64_t result;

  result = qword_256B42D48;
  if (!qword_256B42D48)
  {
    result = MEMORY[0x242619B10](&protocol conformance descriptor for MarketingInlineAction, &type metadata for MarketingInlineAction);
    atomic_store(result, (unint64_t *)&qword_256B42D48);
  }
  return result;
}

unint64_t sub_23C1FA8C8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256B42D50;
  if (!qword_256B42D50)
  {
    v1 = type metadata accessor for MarketingInlineState();
    result = MEMORY[0x242619B10](&protocol conformance descriptor for MarketingInlineState, v1);
    atomic_store(result, (unint64_t *)&qword_256B42D50);
  }
  return result;
}

ValueMetadata *type metadata accessor for MarketingInlineFeature()
{
  return &type metadata for MarketingInlineFeature;
}

uint64_t storeEnumTagSinglePayload for MarketingInlineFeature.TaskIdentifier(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C1FA96C + 4 * byte_23C2031C5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C1FA9A0 + 4 * byte_23C2031C0[v4]))();
}

uint64_t sub_23C1FA9A0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1FA9A8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C1FA9B0);
  return result;
}

uint64_t sub_23C1FA9BC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C1FA9C4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C1FA9C8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C1FA9D0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MarketingInlineFeature.TaskIdentifier()
{
  return &type metadata for MarketingInlineFeature.TaskIdentifier;
}

unint64_t sub_23C1FA9F0()
{
  unint64_t result;

  result = qword_256B42D58;
  if (!qword_256B42D58)
  {
    result = MEMORY[0x242619B10](&unk_23C203268, &type metadata for MarketingInlineFeature.TaskIdentifier);
    atomic_store(result, (unint64_t *)&qword_256B42D58);
  }
  return result;
}

uint64_t static ServiceSubscriptionMonitorAction.== infix(_:_:)()
{
  return 1;
}

uint64_t ServiceSubscriptionMonitorAction.hash(into:)()
{
  return sub_23C1FBFD8();
}

uint64_t sub_23C1FAA64()
{
  return 0x6570704177656976;
}

uint64_t sub_23C1FAA84@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x6570704177656976 && a2 == 0xEC00000064657261)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_23C1FBF90();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_23C1FAB30()
{
  sub_23C1FAD4C();
  return sub_23C1FC020();
}

uint64_t sub_23C1FAB58()
{
  sub_23C1FAD4C();
  return sub_23C1FC02C();
}

uint64_t sub_23C1FAB80()
{
  sub_23C1FAD90();
  return sub_23C1FC020();
}

uint64_t sub_23C1FABA8()
{
  sub_23C1FAD90();
  return sub_23C1FC02C();
}

uint64_t ServiceSubscriptionMonitorAction.hashValue.getter()
{
  sub_23C1FBFCC();
  sub_23C1FBFD8();
  return sub_23C1FBFFC();
}

uint64_t ServiceSubscriptionMonitorAction.encode(to:)(_QWORD *a1)
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

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42D60);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42D68);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C1FAD4C();
  sub_23C1FC014();
  sub_23C1FAD90();
  sub_23C1FBF30();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

unint64_t sub_23C1FAD4C()
{
  unint64_t result;

  result = qword_256B42D70;
  if (!qword_256B42D70)
  {
    result = MEMORY[0x242619B10](&unk_23C203550, &type metadata for ServiceSubscriptionMonitorAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B42D70);
  }
  return result;
}

unint64_t sub_23C1FAD90()
{
  unint64_t result;

  result = qword_256B42D78;
  if (!qword_256B42D78)
  {
    result = MEMORY[0x242619B10](&unk_23C203500, &type metadata for ServiceSubscriptionMonitorAction.ViewAppearedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B42D78);
  }
  return result;
}

uint64_t ServiceSubscriptionMonitorAction.init(from:)(_QWORD *a1)
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

  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42D80);
  v2 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42D88);
  v5 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C1FAD4C();
  v8 = v23;
  sub_23C1FC008();
  if (v8)
    goto LABEL_7;
  v20 = a1;
  v23 = v5;
  v10 = v21;
  v9 = v22;
  if (*(_QWORD *)(sub_23C1FBF24() + 16) != 1)
  {
    v14 = sub_23C1FBE58();
    swift_allocError();
    v16 = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B40A48);
    *v16 = &type metadata for ServiceSubscriptionMonitorAction;
    sub_23C1FBED0();
    sub_23C1FBE4C();
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
  sub_23C1FAD90();
  v11 = v4;
  sub_23C1FBEC4();
  v12 = v23;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v11, v10);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v9);
  v13 = (uint64_t)v20;
  return __swift_destroy_boxed_opaque_existential_1(v13);
}

unint64_t sub_23C1FB034()
{
  unint64_t result;

  result = qword_256B42D90;
  if (!qword_256B42D90)
  {
    result = MEMORY[0x242619B10](&protocol conformance descriptor for ServiceSubscriptionMonitorAction, &type metadata for ServiceSubscriptionMonitorAction);
    atomic_store(result, (unint64_t *)&qword_256B42D90);
  }
  return result;
}

uint64_t sub_23C1FB078(_QWORD *a1)
{
  return ServiceSubscriptionMonitorAction.init(from:)(a1);
}

uint64_t sub_23C1FB08C(_QWORD *a1)
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

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42D60);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B42D68);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C1FAD4C();
  sub_23C1FC014();
  sub_23C1FAD90();
  sub_23C1FBF30();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

ValueMetadata *type metadata accessor for ServiceSubscriptionMonitorAction()
{
  return &type metadata for ServiceSubscriptionMonitorAction;
}

uint64_t _s16FitnessMarketing32ServiceSubscriptionMonitorActionOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23C1FB21C + 4 * byte_23C2032D0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23C1FB23C + 4 * byte_23C2032D5[v4]))();
}

_BYTE *sub_23C1FB21C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23C1FB23C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C1FB244(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C1FB24C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C1FB254(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C1FB25C(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for ServiceSubscriptionMonitorAction.CodingKeys()
{
  return &type metadata for ServiceSubscriptionMonitorAction.CodingKeys;
}

ValueMetadata *type metadata accessor for ServiceSubscriptionMonitorAction.ViewAppearedCodingKeys()
{
  return &type metadata for ServiceSubscriptionMonitorAction.ViewAppearedCodingKeys;
}

unint64_t sub_23C1FB28C()
{
  unint64_t result;

  result = qword_256B42D98;
  if (!qword_256B42D98)
  {
    result = MEMORY[0x242619B10](&unk_23C2034D8, &type metadata for ServiceSubscriptionMonitorAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B42D98);
  }
  return result;
}

unint64_t sub_23C1FB2D4()
{
  unint64_t result;

  result = qword_256B42DA0;
  if (!qword_256B42DA0)
  {
    result = MEMORY[0x242619B10](&unk_23C2033F8, &type metadata for ServiceSubscriptionMonitorAction.ViewAppearedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B42DA0);
  }
  return result;
}

unint64_t sub_23C1FB31C()
{
  unint64_t result;

  result = qword_256B42DA8;
  if (!qword_256B42DA8)
  {
    result = MEMORY[0x242619B10](&unk_23C203420, &type metadata for ServiceSubscriptionMonitorAction.ViewAppearedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B42DA8);
  }
  return result;
}

unint64_t sub_23C1FB364()
{
  unint64_t result;

  result = qword_256B42DB0;
  if (!qword_256B42DB0)
  {
    result = MEMORY[0x242619B10](&unk_23C203448, &type metadata for ServiceSubscriptionMonitorAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B42DB0);
  }
  return result;
}

unint64_t sub_23C1FB3AC()
{
  unint64_t result;

  result = qword_256B42DB8;
  if (!qword_256B42DB8)
  {
    result = MEMORY[0x242619B10](&unk_23C203470, &type metadata for ServiceSubscriptionMonitorAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B42DB8);
  }
  return result;
}

uint64_t sub_23C1FB3F0()
{
  return MEMORY[0x24BDCBAC0]();
}

uint64_t sub_23C1FB3FC()
{
  return MEMORY[0x24BDCBB28]();
}

uint64_t sub_23C1FB408()
{
  return MEMORY[0x24BDCBB30]();
}

uint64_t sub_23C1FB414()
{
  return MEMORY[0x24BDCBB78]();
}

uint64_t sub_23C1FB420()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_23C1FB42C()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_23C1FB438()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_23C1FB444()
{
  return MEMORY[0x24BDCD988]();
}

uint64_t sub_23C1FB450()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_23C1FB45C()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_23C1FB468()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_23C1FB474()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_23C1FB480()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_23C1FB48C()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_23C1FB498()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_23C1FB4A4()
{
  return MEMORY[0x24BDCECD8]();
}

uint64_t sub_23C1FB4B0()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_23C1FB4BC()
{
  return MEMORY[0x24BE34F98]();
}

uint64_t sub_23C1FB4C8()
{
  return MEMORY[0x24BE34FA0]();
}

uint64_t sub_23C1FB4D4()
{
  return MEMORY[0x24BE35120]();
}

uint64_t sub_23C1FB4E0()
{
  return MEMORY[0x24BE379D8]();
}

uint64_t sub_23C1FB4EC()
{
  return MEMORY[0x24BE379E0]();
}

uint64_t sub_23C1FB4F8()
{
  return MEMORY[0x24BE37A00]();
}

uint64_t sub_23C1FB504()
{
  return MEMORY[0x24BE37A08]();
}

uint64_t sub_23C1FB510()
{
  return MEMORY[0x24BE37A10]();
}

uint64_t sub_23C1FB51C()
{
  return MEMORY[0x24BE37A20]();
}

uint64_t sub_23C1FB528()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_23C1FB534()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23C1FB540()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_23C1FB54C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23C1FB558()
{
  return MEMORY[0x24BDEAF98]();
}

uint64_t sub_23C1FB564()
{
  return MEMORY[0x24BDEAFA8]();
}

uint64_t sub_23C1FB570()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_23C1FB57C()
{
  return MEMORY[0x24BDEB0B8]();
}

uint64_t sub_23C1FB588()
{
  return MEMORY[0x24BDEB0E8]();
}

uint64_t sub_23C1FB594()
{
  return MEMORY[0x24BDEB0F0]();
}

uint64_t sub_23C1FB5A0()
{
  return MEMORY[0x24BDEB418]();
}

uint64_t sub_23C1FB5AC()
{
  return MEMORY[0x24BDEB4A0]();
}

uint64_t sub_23C1FB5B8()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t sub_23C1FB5C4()
{
  return MEMORY[0x24BDEB790]();
}

uint64_t sub_23C1FB5D0()
{
  return MEMORY[0x24BDEC7B0]();
}

uint64_t sub_23C1FB5DC()
{
  return MEMORY[0x24BDECF50]();
}

uint64_t sub_23C1FB5E8()
{
  return MEMORY[0x24BDED128]();
}

uint64_t sub_23C1FB5F4()
{
  return MEMORY[0x24BDED130]();
}

uint64_t sub_23C1FB600()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t sub_23C1FB60C()
{
  return MEMORY[0x24BDED918]();
}

uint64_t sub_23C1FB618()
{
  return MEMORY[0x24BDED930]();
}

uint64_t sub_23C1FB624()
{
  return MEMORY[0x24BDED998]();
}

uint64_t sub_23C1FB630()
{
  return MEMORY[0x24BDEDBA8]();
}

uint64_t sub_23C1FB63C()
{
  return MEMORY[0x24BDEDBF0]();
}

uint64_t sub_23C1FB648()
{
  return MEMORY[0x24BDEDEE8]();
}

uint64_t sub_23C1FB654()
{
  return MEMORY[0x24BDEDEF8]();
}

uint64_t sub_23C1FB660()
{
  return MEMORY[0x24BDEDF08]();
}

uint64_t sub_23C1FB66C()
{
  return MEMORY[0x24BDEDF10]();
}

uint64_t sub_23C1FB678()
{
  return MEMORY[0x24BDEE070]();
}

uint64_t sub_23C1FB684()
{
  return MEMORY[0x24BDEE080]();
}

uint64_t sub_23C1FB690()
{
  return MEMORY[0x24BDEE190]();
}

uint64_t sub_23C1FB69C()
{
  return MEMORY[0x24BDEE198]();
}

uint64_t sub_23C1FB6A8()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_23C1FB6B4()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_23C1FB6C0()
{
  return MEMORY[0x24BDEE490]();
}

uint64_t sub_23C1FB6CC()
{
  return MEMORY[0x24BDEE4A0]();
}

uint64_t sub_23C1FB6D8()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_23C1FB6E4()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_23C1FB6F0()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_23C1FB6FC()
{
  return MEMORY[0x24BDEE8E0]();
}

uint64_t sub_23C1FB708()
{
  return MEMORY[0x24BDEE8E8]();
}

uint64_t sub_23C1FB714()
{
  return MEMORY[0x24BDEEB88]();
}

uint64_t sub_23C1FB720()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_23C1FB72C()
{
  return MEMORY[0x24BDEEF78]();
}

uint64_t sub_23C1FB738()
{
  return MEMORY[0x24BDEEF80]();
}

uint64_t sub_23C1FB744()
{
  return MEMORY[0x24BDEF110]();
}

uint64_t sub_23C1FB750()
{
  return MEMORY[0x24BDEF120]();
}

uint64_t sub_23C1FB75C()
{
  return MEMORY[0x24BDEF380]();
}

uint64_t sub_23C1FB768()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_23C1FB774()
{
  return MEMORY[0x24BDEF3B8]();
}

uint64_t sub_23C1FB780()
{
  return MEMORY[0x24BDEFBF0]();
}

uint64_t sub_23C1FB78C()
{
  return MEMORY[0x24BDEFCA8]();
}

uint64_t sub_23C1FB798()
{
  return MEMORY[0x24BDEFCB8]();
}

uint64_t sub_23C1FB7A4()
{
  return MEMORY[0x24BDEFCC8]();
}

uint64_t sub_23C1FB7B0()
{
  return MEMORY[0x24BDF0200]();
}

uint64_t sub_23C1FB7BC()
{
  return MEMORY[0x24BDF0210]();
}

uint64_t sub_23C1FB7C8()
{
  return MEMORY[0x24BDF0220]();
}

uint64_t sub_23C1FB7D4()
{
  return MEMORY[0x24BDF0230]();
}

uint64_t sub_23C1FB7E0()
{
  return MEMORY[0x24BDF0D98]();
}

uint64_t sub_23C1FB7EC()
{
  return MEMORY[0x24BDF0DA8]();
}

uint64_t sub_23C1FB7F8()
{
  return MEMORY[0x24BDF0EC0]();
}

uint64_t sub_23C1FB804()
{
  return MEMORY[0x24BDF0ED0]();
}

uint64_t sub_23C1FB810()
{
  return MEMORY[0x24BDF0EE0]();
}

uint64_t sub_23C1FB81C()
{
  return MEMORY[0x24BDF0EF0]();
}

uint64_t sub_23C1FB828()
{
  return MEMORY[0x24BDF0F00]();
}

uint64_t sub_23C1FB834()
{
  return MEMORY[0x24BDF0F10]();
}

uint64_t sub_23C1FB840()
{
  return MEMORY[0x24BDF0F18]();
}

uint64_t sub_23C1FB84C()
{
  return MEMORY[0x24BDF0F28]();
}

uint64_t sub_23C1FB858()
{
  return MEMORY[0x24BDF0F38]();
}

uint64_t sub_23C1FB864()
{
  return MEMORY[0x24BDF0F68]();
}

uint64_t sub_23C1FB870()
{
  return MEMORY[0x24BDF0F78]();
}

uint64_t sub_23C1FB87C()
{
  return MEMORY[0x24BDF1088]();
}

uint64_t sub_23C1FB888()
{
  return MEMORY[0x24BDF12B8]();
}

uint64_t sub_23C1FB894()
{
  return MEMORY[0x24BDF12C8]();
}

uint64_t sub_23C1FB8A0()
{
  return MEMORY[0x24BDF12D8]();
}

uint64_t sub_23C1FB8AC()
{
  return MEMORY[0x24BDF12E0]();
}

uint64_t sub_23C1FB8B8()
{
  return MEMORY[0x24BDF12E8]();
}

uint64_t sub_23C1FB8C4()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_23C1FB8D0()
{
  return MEMORY[0x24BDF1450]();
}

uint64_t sub_23C1FB8DC()
{
  return MEMORY[0x24BDF14A0]();
}

uint64_t sub_23C1FB8E8()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_23C1FB8F4()
{
  return MEMORY[0x24BDF14C0]();
}

uint64_t sub_23C1FB900()
{
  return MEMORY[0x24BDF14C8]();
}

uint64_t sub_23C1FB90C()
{
  return MEMORY[0x24BDF1510]();
}

uint64_t sub_23C1FB918()
{
  return MEMORY[0x24BDF1580]();
}

uint64_t sub_23C1FB924()
{
  return MEMORY[0x24BDF15F8]();
}

uint64_t sub_23C1FB930()
{
  return MEMORY[0x24BDF1640]();
}

uint64_t sub_23C1FB93C()
{
  return MEMORY[0x24BDF16A8]();
}

uint64_t sub_23C1FB948()
{
  return MEMORY[0x24BDF1700]();
}

uint64_t sub_23C1FB954()
{
  return MEMORY[0x24BDF1778]();
}

uint64_t sub_23C1FB960()
{
  return MEMORY[0x24BDF1798]();
}

uint64_t sub_23C1FB96C()
{
  return MEMORY[0x24BDF17D8]();
}

uint64_t sub_23C1FB978()
{
  return MEMORY[0x24BDF17F8]();
}

uint64_t sub_23C1FB984()
{
  return MEMORY[0x24BDF1818]();
}

uint64_t sub_23C1FB990()
{
  return MEMORY[0x24BDF1820]();
}

uint64_t sub_23C1FB99C()
{
  return MEMORY[0x24BDF1828]();
}

uint64_t sub_23C1FB9A8()
{
  return MEMORY[0x24BDF1D18]();
}

uint64_t sub_23C1FB9B4()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_23C1FB9C0()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_23C1FB9CC()
{
  return MEMORY[0x24BE35198]();
}

uint64_t sub_23C1FB9D8()
{
  return MEMORY[0x24BE37C08]();
}

uint64_t sub_23C1FB9E4()
{
  return MEMORY[0x24BE37C18]();
}

uint64_t sub_23C1FB9F0()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_23C1FB9FC()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_23C1FBA08()
{
  return MEMORY[0x24BDF20D8]();
}

uint64_t sub_23C1FBA14()
{
  return MEMORY[0x24BDF20E8]();
}

uint64_t sub_23C1FBA20()
{
  return MEMORY[0x24BDF2170]();
}

uint64_t sub_23C1FBA2C()
{
  return MEMORY[0x24BDF22A0]();
}

uint64_t sub_23C1FBA38()
{
  return MEMORY[0x24BDF22B0]();
}

uint64_t sub_23C1FBA44()
{
  return MEMORY[0x24BDF2370]();
}

uint64_t sub_23C1FBA50()
{
  return MEMORY[0x24BDF24C0]();
}

uint64_t sub_23C1FBA5C()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_23C1FBA68()
{
  return MEMORY[0x24BDF27F0]();
}

uint64_t sub_23C1FBA74()
{
  return MEMORY[0x24BDF2830]();
}

uint64_t sub_23C1FBA80()
{
  return MEMORY[0x24BDF2DB8]();
}

uint64_t sub_23C1FBA8C()
{
  return MEMORY[0x24BDF3108]();
}

uint64_t sub_23C1FBA98()
{
  return MEMORY[0x24BDF3118]();
}

uint64_t sub_23C1FBAA4()
{
  return MEMORY[0x24BDF3550]();
}

uint64_t sub_23C1FBAB0()
{
  return MEMORY[0x24BDF3630]();
}

uint64_t sub_23C1FBABC()
{
  return MEMORY[0x24BDF3740]();
}

uint64_t sub_23C1FBAC8()
{
  return MEMORY[0x24BDF37B0]();
}

uint64_t sub_23C1FBAD4()
{
  return MEMORY[0x24BDF37E0]();
}

uint64_t sub_23C1FBAE0()
{
  return MEMORY[0x24BDF38C8]();
}

uint64_t sub_23C1FBAEC()
{
  return MEMORY[0x24BDF3940]();
}

uint64_t sub_23C1FBAF8()
{
  return MEMORY[0x24BDF3980]();
}

uint64_t sub_23C1FBB04()
{
  return MEMORY[0x24BDF3CF0]();
}

uint64_t sub_23C1FBB10()
{
  return MEMORY[0x24BDF3D10]();
}

uint64_t sub_23C1FBB1C()
{
  return MEMORY[0x24BDF3D30]();
}

uint64_t sub_23C1FBB28()
{
  return MEMORY[0x24BDF3EB0]();
}

uint64_t sub_23C1FBB34()
{
  return MEMORY[0x24BDF3F18]();
}

uint64_t sub_23C1FBB40()
{
  return MEMORY[0x24BDF3F28]();
}

uint64_t sub_23C1FBB4C()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_23C1FBB58()
{
  return MEMORY[0x24BDF4150]();
}

uint64_t sub_23C1FBB64()
{
  return MEMORY[0x24BDF4330]();
}

uint64_t sub_23C1FBB70()
{
  return MEMORY[0x24BDF4340]();
}

uint64_t sub_23C1FBB7C()
{
  return MEMORY[0x24BDF46D8]();
}

uint64_t sub_23C1FBB88()
{
  return MEMORY[0x24BDF46E0]();
}

uint64_t sub_23C1FBB94()
{
  return MEMORY[0x24BDF49A0]();
}

uint64_t sub_23C1FBBA0()
{
  return MEMORY[0x24BDF4D08]();
}

uint64_t sub_23C1FBBAC()
{
  return MEMORY[0x24BDF4EF0]();
}

uint64_t sub_23C1FBBB8()
{
  return MEMORY[0x24BDF4F00]();
}

uint64_t sub_23C1FBBC4()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_23C1FBBD0()
{
  return MEMORY[0x24BDF4F20]();
}

uint64_t sub_23C1FBBDC()
{
  return MEMORY[0x24BDF5118]();
}

uint64_t sub_23C1FBBE8()
{
  return MEMORY[0x24BDF53F0]();
}

uint64_t sub_23C1FBBF4()
{
  return MEMORY[0x24BDF5418]();
}

uint64_t sub_23C1FBC00()
{
  return MEMORY[0x24BDF5478]();
}

uint64_t sub_23C1FBC0C()
{
  return MEMORY[0x24BDF5490]();
}

uint64_t sub_23C1FBC18()
{
  return MEMORY[0x24BE2B3C0]();
}

uint64_t sub_23C1FBC24()
{
  return MEMORY[0x24BE2B3D8]();
}

uint64_t sub_23C1FBC30()
{
  return MEMORY[0x24BE2B3E8]();
}

uint64_t sub_23C1FBC3C()
{
  return MEMORY[0x24BE2B560]();
}

uint64_t sub_23C1FBC48()
{
  return MEMORY[0x24BE2B588]();
}

uint64_t sub_23C1FBC54()
{
  return MEMORY[0x24BE2B598]();
}

uint64_t sub_23C1FBC60()
{
  return MEMORY[0x24BE2B5A8]();
}

uint64_t sub_23C1FBC6C()
{
  return MEMORY[0x24BE2B5B0]();
}

uint64_t sub_23C1FBC78()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_23C1FBC84()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_23C1FBC90()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_23C1FBC9C()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_23C1FBCA8()
{
  return MEMORY[0x24BDCF8D8]();
}

uint64_t sub_23C1FBCB4()
{
  return MEMORY[0x24BDCF978]();
}

uint64_t sub_23C1FBCC0()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23C1FBCCC()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23C1FBCD8()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_23C1FBCE4()
{
  return MEMORY[0x24BE37C28]();
}

uint64_t sub_23C1FBCF0()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23C1FBCFC()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23C1FBD08()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23C1FBD14()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_23C1FBD20()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_23C1FBD2C()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_23C1FBD38()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_23C1FBD44()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_23C1FBD50()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_23C1FBD5C()
{
  return MEMORY[0x24BEE68D8]();
}

uint64_t sub_23C1FBD68()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_23C1FBD74()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_23C1FBD80()
{
  return MEMORY[0x24BEE6940]();
}

uint64_t sub_23C1FBD8C()
{
  return MEMORY[0x24BEE6980]();
}

uint64_t sub_23C1FBD98()
{
  return MEMORY[0x24BEE6C08]();
}

uint64_t sub_23C1FBDA4()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23C1FBDB0()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_23C1FBDBC()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_23C1FBDC8()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_23C1FBDD4()
{
  return MEMORY[0x24BEE5BC8]();
}

uint64_t sub_23C1FBDE0()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23C1FBDEC()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23C1FBDF8()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23C1FBE04()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_23C1FBE10()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_23C1FBE1C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23C1FBE28()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23C1FBE34()
{
  return MEMORY[0x24BEE2648]();
}

uint64_t sub_23C1FBE40()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_23C1FBE4C()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_23C1FBE58()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_23C1FBE64()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23C1FBE70()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23C1FBE7C()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_23C1FBE88()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_23C1FBE94()
{
  return MEMORY[0x24BEE3070]();
}

uint64_t sub_23C1FBEA0()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_23C1FBEAC()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23C1FBEB8()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_23C1FBEC4()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_23C1FBED0()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_23C1FBEDC()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_23C1FBEE8()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_23C1FBEF4()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_23C1FBF00()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_23C1FBF0C()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_23C1FBF18()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_23C1FBF24()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_23C1FBF30()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_23C1FBF3C()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_23C1FBF48()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_23C1FBF54()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_23C1FBF60()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_23C1FBF6C()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_23C1FBF78()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_23C1FBF84()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23C1FBF90()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23C1FBF9C()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_23C1FBFA8()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_23C1FBFB4()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_23C1FBFC0()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_23C1FBFCC()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23C1FBFD8()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23C1FBFE4()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_23C1FBFF0()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_23C1FBFFC()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23C1FC008()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_23C1FC014()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23C1FC020()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23C1FC02C()
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
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

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x24BEE4DF0]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x24BEE4E00]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
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

