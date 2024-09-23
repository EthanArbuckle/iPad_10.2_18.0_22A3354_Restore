uint64_t TrunkStatusSnippet.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_237830DF8(a1, a2);
}

uint64_t sub_237830DF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CarCommandsToggleSnippetModel(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

double TrunkStatusSnippet.body.getter@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double result;
  uint64_t v7;
  uint64_t v8;

  type metadata accessor for CarCommandsToggleSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B08);
  sub_2378516BC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  sub_2378516BC();
  sub_2378516BC();
  sub_2378516BC();
  sub_2378516BC();
  sub_2378516BC();
  sub_2378516BC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  sub_2378516BC();
  sub_237851A7C();
  sub_23783108C();
  v2 = sub_237851770();
  v4 = v3;
  v5 = swift_bridgeObjectRetain();
  result = 3.89653885e233;
  *(_OWORD *)a1 = xmmword_2378520C0;
  *(_OWORD *)(a1 + 16) = xmmword_2378520D0;
  *(_WORD *)(a1 + 32) = 384;
  *(_BYTE *)(a1 + 34) = 0;
  *(_QWORD *)(a1 + 40) = v7;
  *(_QWORD *)(a1 + 48) = v8;
  *(_QWORD *)(a1 + 56) = v7;
  *(_QWORD *)(a1 + 64) = v8;
  *(_QWORD *)(a1 + 72) = v7;
  *(_QWORD *)(a1 + 80) = v8;
  *(_QWORD *)(a1 + 88) = v7;
  *(_QWORD *)(a1 + 96) = v8;
  *(_QWORD *)(a1 + 104) = v7;
  *(_QWORD *)(a1 + 112) = v8;
  *(_QWORD *)(a1 + 120) = 0xD00000000000003DLL;
  *(_QWORD *)(a1 + 128) = 0x8000000237854AE0;
  *(_QWORD *)(a1 + 136) = v7;
  *(_QWORD *)(a1 + 144) = v8;
  *(_QWORD *)(a1 + 152) = v7;
  *(_QWORD *)(a1 + 160) = v8;
  *(_BYTE *)(a1 + 168) = v7;
  *(_QWORD *)(a1 + 176) = 0;
  *(_QWORD *)(a1 + 184) = v7;
  *(_QWORD *)(a1 + 192) = v5;
  *(_QWORD *)(a1 + 200) = 0;
  *(_QWORD *)(a1 + 208) = v2;
  *(_QWORD *)(a1 + 216) = v4;
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B81CBF0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_23783108C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256817B20;
  if (!qword_256817B20)
  {
    v1 = sub_237851A7C();
    result = MEMORY[0x23B81CC08](MEMORY[0x24BEAE520], v1);
    atomic_store(result, (unint64_t *)&qword_256817B20);
  }
  return result;
}

uint64_t sub_2378310D4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2378310EC()
{
  return sub_2378518A8();
}

uint64_t *initializeBufferWithCopyOfBuffer for TrunkStatusSnippet(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  int v5;
  int *v6;
  uint64_t v7;
  void (*v8)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = type metadata accessor for CarCommandsToggleSnippetModel(0);
  v5 = *(_DWORD *)(*(_QWORD *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = (int *)v4;
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
    v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + v6[5]), (uint64_t *)((char *)a2 + v6[5]), v7);
    v8((uint64_t *)((char *)a1 + v6[6]), (uint64_t *)((char *)a2 + v6[6]), v7);
    v8((uint64_t *)((char *)a1 + v6[7]), (uint64_t *)((char *)a2 + v6[7]), v7);
    v8((uint64_t *)((char *)a1 + v6[8]), (uint64_t *)((char *)a2 + v6[8]), v7);
    v9 = v6[9];
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B08);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    v8((uint64_t *)((char *)a1 + v6[10]), (uint64_t *)((char *)a2 + v6[10]), v7);
    v13 = v6[11];
    v14 = (char *)a1 + v13;
    v15 = (char *)a2 + v13;
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
  }
  return a1;
}

uint64_t destroy for TrunkStatusSnippet(uint64_t a1)
{
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v3 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8);
  v3(a1, v2);
  v4 = (int *)type metadata accessor for CarCommandsToggleSnippetModel(0);
  v3(a1 + v4[5], v2);
  v3(a1 + v4[6], v2);
  v3(a1 + v4[7], v2);
  v3(a1 + v4[8], v2);
  v5 = a1 + v4[9];
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B08);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v3(a1 + v4[10], v2);
  v7 = a1 + v4[11];
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
}

uint64_t initializeWithCopy for TrunkStatusSnippet(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16);
  v5(a1, a2, v4);
  v6 = (int *)type metadata accessor for CarCommandsToggleSnippetModel(0);
  v5(a1 + v6[5], a2 + v6[5], v4);
  v5(a1 + v6[6], a2 + v6[6], v4);
  v5(a1 + v6[7], a2 + v6[7], v4);
  v5(a1 + v6[8], a2 + v6[8], v4);
  v7 = v6[9];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  v5(a1 + v6[10], a2 + v6[10], v4);
  v11 = v6[11];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
  return a1;
}

uint64_t assignWithCopy for TrunkStatusSnippet(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24);
  v5(a1, a2, v4);
  v6 = (int *)type metadata accessor for CarCommandsToggleSnippetModel(0);
  v5(a1 + v6[5], a2 + v6[5], v4);
  v5(a1 + v6[6], a2 + v6[6], v4);
  v5(a1 + v6[7], a2 + v6[7], v4);
  v5(a1 + v6[8], a2 + v6[8], v4);
  v7 = v6[9];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  v5(a1 + v6[10], a2 + v6[10], v4);
  v11 = v6[11];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 24))(v12, v13, v14);
  return a1;
}

uint64_t initializeWithTake for TrunkStatusSnippet(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32);
  v5(a1, a2, v4);
  v6 = (int *)type metadata accessor for CarCommandsToggleSnippetModel(0);
  v5(a1 + v6[5], a2 + v6[5], v4);
  v5(a1 + v6[6], a2 + v6[6], v4);
  v5(a1 + v6[7], a2 + v6[7], v4);
  v5(a1 + v6[8], a2 + v6[8], v4);
  v7 = v6[9];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v5(a1 + v6[10], a2 + v6[10], v4);
  v11 = v6[11];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v12, v13, v14);
  return a1;
}

uint64_t assignWithTake for TrunkStatusSnippet(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40);
  v5(a1, a2, v4);
  v6 = (int *)type metadata accessor for CarCommandsToggleSnippetModel(0);
  v5(a1 + v6[5], a2 + v6[5], v4);
  v5(a1 + v6[6], a2 + v6[6], v4);
  v5(a1 + v6[7], a2 + v6[7], v4);
  v5(a1 + v6[8], a2 + v6[8], v4);
  v7 = v6[9];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v5(a1 + v6[10], a2 + v6[10], v4);
  v11 = v6[11];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for TrunkStatusSnippet()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23783183C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CarCommandsToggleSnippetModel(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for TrunkStatusSnippet()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_237831884(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CarCommandsToggleSnippetModel(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for TrunkStatusSnippet()
{
  uint64_t result;

  result = qword_256817B80;
  if (!qword_256817B80)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_237831900()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for CarCommandsToggleSnippetModel(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_23783196C()
{
  unint64_t result;

  result = qword_256817BB8;
  if (!qword_256817BB8)
  {
    result = MEMORY[0x23B81CC08](&protocol conformance descriptor for CarCommandsToggleSnippet, &type metadata for CarCommandsToggleSnippet);
    atomic_store(result, (unint64_t *)&qword_256817BB8);
  }
  return result;
}

void type metadata accessor for VRXVisualResponseLocation()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_256817BC0)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_256817BC0);
  }
}

uint64_t CarCommandsToggleSnippetModel.isOn.getter()
{
  unsigned __int8 v1;

  type metadata accessor for CarCommandsToggleSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B08);
  sub_2378516BC();
  return v1;
}

uint64_t type metadata accessor for CarCommandsToggleSnippetModel(uint64_t a1)
{
  return sub_237835C60(a1, (uint64_t *)&unk_256817EC8);
}

uint64_t CarCommandsToggleSnippetModel.onStateText.getter()
{
  return sub_237831DC0((void (*)(_QWORD))type metadata accessor for CarCommandsToggleSnippetModel);
}

uint64_t CarCommandsToggleSnippetModel.offStateText.getter()
{
  return sub_237836334((void (*)(_QWORD))type metadata accessor for CarCommandsToggleSnippetModel);
}

uint64_t CarCommandsToggleSnippetModel.onTransitionText.getter()
{
  uint64_t v1;

  type metadata accessor for CarCommandsToggleSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  sub_2378516BC();
  return v1;
}

uint64_t CarCommandsToggleSnippetModel.offTransitionText.getter()
{
  uint64_t v1;

  type metadata accessor for CarCommandsToggleSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  sub_2378516BC();
  return v1;
}

uint64_t CarCommandsToggleSnippetModel.appId.getter()
{
  uint64_t v1;

  type metadata accessor for CarCommandsToggleSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  sub_2378516BC();
  return v1;
}

uint64_t CarCommandsToggleSnippetModel.carNameDirectInvocationPayloadValue.getter()
{
  uint64_t v1;

  type metadata accessor for CarCommandsToggleSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  sub_2378516BC();
  return v1;
}

uint64_t CarCommandsToggleSnippetModel.init(carNameText:onStateText:offStateText:onTransitionText:offTransitionText:isOn:appId:carNameDirectInvocationPayloadValue:)()
{
  type metadata accessor for CarCommandsToggleSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817BC8);
  sub_2378516A4();
  sub_2378516A4();
  sub_2378516A4();
  sub_2378516A4();
  sub_2378516A4();
  sub_2378516A4();
  sub_2378516A4();
  sub_2378516A4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  return sub_2378516C8();
}

uint64_t (*CarCommandsConfirmationSnippetModel.confirmText.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v2[4] = sub_2378516B0();
  return sub_237831DB0;
}

uint64_t CarCommandsConfirmationSnippetModel.denyText.getter()
{
  return sub_237831DC0((void (*)(_QWORD))type metadata accessor for CarCommandsConfirmationSnippetModel);
}

uint64_t sub_237831DC0(void (*a1)(_QWORD))
{
  uint64_t v2;

  a1(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  sub_2378516BC();
  return v2;
}

uint64_t CarCommandsConfirmationSnippetModel.denyText.setter(uint64_t a1, uint64_t a2)
{
  return sub_23783212C(a1, a2, (void (*)(_QWORD))type metadata accessor for CarCommandsConfirmationSnippetModel);
}

uint64_t (*CarCommandsConfirmationSnippetModel.denyText.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for CarCommandsConfirmationSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v2[4] = sub_2378516B0();
  return sub_237831DB0;
}

uint64_t CarCommandsConfirmationSnippetModel.init(confirmText:denyText:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2378321EC(a1, a2, a3, a4, (void (*)(_QWORD))type metadata accessor for CarCommandsConfirmationSnippetModel);
}

uint64_t sub_237831E94()
{
  _BYTE *v0;

  if (*v0)
    return 0x74786554796E6564;
  else
    return 0x546D7269666E6F63;
}

uint64_t sub_237831ED8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_237839E30(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_237831EFC()
{
  return 0;
}

void sub_237831F08(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_237831F14()
{
  sub_237833034();
  return sub_237851CF8();
}

uint64_t sub_237831F3C()
{
  sub_237833034();
  return sub_237851D04();
}

uint64_t CarCommandsConfirmationSnippetModel.encode(to:)(_QWORD *a1)
{
  return sub_23783239C(a1, &qword_256817BD0, (void (*)(void))sub_237833034, (uint64_t)&type metadata for CarCommandsConfirmationSnippetModel.CodingKeys, (uint64_t)type metadata accessor for CarCommandsConfirmationSnippetModel);
}

uint64_t CarCommandsConfirmationSnippetModel.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_237832528(a1, &qword_256817BE8, type metadata accessor for CarCommandsConfirmationSnippetModel, (void (*)(void))sub_237833034, a2);
}

uint64_t sub_237831FCC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return CarCommandsConfirmationSnippetModel.init(from:)(a1, a2);
}

uint64_t sub_237831FE0(_QWORD *a1)
{
  return CarCommandsConfirmationSnippetModel.encode(to:)(a1);
}

uint64_t (*CarCommandsAppPunchoutSnippetModel.appNameText.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v2[4] = sub_2378516B0();
  return sub_237831DB0;
}

uint64_t CarCommandsAppPunchoutSnippetModel.appIdentifier.getter()
{
  return sub_237831DC0((void (*)(_QWORD))type metadata accessor for CarCommandsAppPunchoutSnippetModel);
}

uint64_t sub_237832060@<X0>(void (*a1)(_QWORD)@<X3>, _QWORD *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  a1(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  result = sub_2378516BC();
  *a2 = v4;
  a2[1] = v5;
  return result;
}

uint64_t sub_2378320BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(_QWORD))
{
  a5(0);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  return sub_2378516C8();
}

uint64_t CarCommandsAppPunchoutSnippetModel.appIdentifier.setter(uint64_t a1, uint64_t a2)
{
  return sub_23783212C(a1, a2, (void (*)(_QWORD))type metadata accessor for CarCommandsAppPunchoutSnippetModel);
}

uint64_t sub_23783212C(uint64_t a1, uint64_t a2, void (*a3)(_QWORD))
{
  a3(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  return sub_2378516C8();
}

uint64_t (*CarCommandsAppPunchoutSnippetModel.appIdentifier.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for CarCommandsAppPunchoutSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v2[4] = sub_2378516B0();
  return sub_237831DB0;
}

uint64_t CarCommandsAppPunchoutSnippetModel.init(appNameText:appIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2378321EC(a1, a2, a3, a4, (void (*)(_QWORD))type metadata accessor for CarCommandsAppPunchoutSnippetModel);
}

uint64_t sub_2378321EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(_QWORD))
{
  sub_2378516A4();
  a5(0);
  return sub_2378516A4();
}

BOOL sub_237832264(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_23783227C()
{
  return sub_237851CBC();
}

uint64_t sub_2378322A4()
{
  _BYTE *v0;

  if (*v0)
    return 0x746E656449707061;
  else
    return 0x54656D614E707061;
}

uint64_t sub_2378322F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_237839F38(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_237832318()
{
  sub_2378331B8();
  return sub_237851CF8();
}

uint64_t sub_237832340()
{
  sub_2378331B8();
  return sub_237851D04();
}

uint64_t CarCommandsAppPunchoutSnippetModel.encode(to:)(_QWORD *a1)
{
  return sub_23783239C(a1, &qword_256817BF8, (void (*)(void))sub_2378331B8, (uint64_t)&type metadata for CarCommandsAppPunchoutSnippetModel.CodingKeys, (uint64_t)type metadata accessor for CarCommandsAppPunchoutSnippetModel);
}

uint64_t sub_23783239C(_QWORD *a1, uint64_t *a2, void (*a3)(void), uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  _QWORD v13[2];
  char v14;
  char v15;

  v13[0] = a5;
  v7 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  a3();
  sub_237851CEC();
  v15 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  sub_237833078();
  v11 = v13[1];
  sub_237851C74();
  if (!v11)
  {
    ((void (*)(_QWORD))v13[0])(0);
    v14 = 1;
    sub_237851C74();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t CarCommandsAppPunchoutSnippetModel.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_237832528(a1, &qword_256817C08, type metadata accessor for CarCommandsAppPunchoutSnippetModel, (void (*)(void))sub_2378331B8, a2);
}

uint64_t sub_237832528@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X1>, uint64_t (*a3)(_QWORD)@<X2>, void (*a4)(void)@<X3>, uint64_t a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(void);
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  void (*v25)(void);
  void (*v26)(uint64_t, char *, uint64_t);
  char *v27;
  void (*v28)(uint64_t, char *, uint64_t);
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(_QWORD);
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v36)(_QWORD);
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(void);
  _QWORD *v43;
  char v44;
  char v45;

  v42 = a4;
  v35 = a5;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v9 = *(_QWORD *)(v8 - 8);
  v39 = v8;
  v40 = v9;
  v10 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v37 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v38 = (char *)&v34 - v12;
  v41 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v13 = *(_QWORD *)(v41 - 8);
  MEMORY[0x24BDAC7A8](v41);
  v15 = (void (*)(void))((char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  v36 = a3;
  v16 = a3(0);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v34 - v17;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v42();
  v42 = v15;
  v19 = (uint64_t)v43;
  sub_237851CE0();
  if (v19)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v43 = a1;
  v20 = v13;
  v21 = v18;
  v22 = v40;
  v45 = 0;
  sub_237833140();
  v23 = v38;
  v24 = v39;
  v25 = v42;
  sub_237851C38();
  v26 = *(void (**)(uint64_t, char *, uint64_t))(v22 + 32);
  v34 = (uint64_t)v21;
  v27 = v23;
  v28 = v26;
  v26((uint64_t)v21, v27, v24);
  v44 = 1;
  v29 = v37;
  v30 = v41;
  sub_237851C38();
  (*(void (**)(void (*)(void), uint64_t))(v20 + 8))(v25, v30);
  v31 = v34;
  v28(v34 + *(int *)(v16 + 20), v29, v24);
  v32 = v36;
  sub_2378331FC(v31, v35, v36);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v43);
  return sub_237833240(v31, v32);
}

uint64_t sub_2378327C4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return CarCommandsAppPunchoutSnippetModel.init(from:)(a1, a2);
}

uint64_t sub_2378327D8(_QWORD *a1)
{
  return CarCommandsAppPunchoutSnippetModel.encode(to:)(a1);
}

uint64_t (*CarCommandsToggleSnippetModel.carNameText.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v2[4] = sub_2378516B0();
  return sub_237831DB0;
}

uint64_t CarCommandsToggleSnippetModel.onStateText.setter(uint64_t a1, uint64_t a2)
{
  return sub_23783212C(a1, a2, (void (*)(_QWORD))type metadata accessor for CarCommandsToggleSnippetModel);
}

uint64_t (*CarCommandsToggleSnippetModel.onStateText.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for CarCommandsToggleSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v2[4] = sub_2378516B0();
  return sub_237831DB0;
}

uint64_t CarCommandsToggleSnippetModel.offStateText.setter(uint64_t a1, uint64_t a2)
{
  return sub_23783644C(a1, a2, (void (*)(_QWORD))type metadata accessor for CarCommandsToggleSnippetModel);
}

uint64_t (*CarCommandsToggleSnippetModel.offStateText.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for CarCommandsToggleSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v2[4] = sub_2378516B0();
  return sub_237831DB0;
}

uint64_t sub_237832930@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  type metadata accessor for CarCommandsToggleSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  result = sub_2378516BC();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_23783298C()
{
  type metadata accessor for CarCommandsToggleSnippetModel(0);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  return sub_2378516C8();
}

uint64_t CarCommandsToggleSnippetModel.onTransitionText.setter()
{
  type metadata accessor for CarCommandsToggleSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  return sub_2378516C8();
}

uint64_t (*CarCommandsToggleSnippetModel.onTransitionText.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for CarCommandsToggleSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v2[4] = sub_2378516B0();
  return sub_237831DB0;
}

uint64_t sub_237832AA4@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  type metadata accessor for CarCommandsToggleSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  result = sub_2378516BC();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_237832B00()
{
  type metadata accessor for CarCommandsToggleSnippetModel(0);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  return sub_2378516C8();
}

uint64_t CarCommandsToggleSnippetModel.offTransitionText.setter()
{
  type metadata accessor for CarCommandsToggleSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  return sub_2378516C8();
}

uint64_t (*CarCommandsToggleSnippetModel.offTransitionText.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for CarCommandsToggleSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v2[4] = sub_2378516B0();
  return sub_237831DB0;
}

uint64_t sub_237832C18@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  type metadata accessor for CarCommandsToggleSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B08);
  result = sub_2378516BC();
  *a1 = v3;
  return result;
}

uint64_t sub_237832C74()
{
  type metadata accessor for CarCommandsToggleSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B08);
  return sub_2378516C8();
}

uint64_t CarCommandsToggleSnippetModel.isOn.setter()
{
  type metadata accessor for CarCommandsToggleSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B08);
  return sub_2378516C8();
}

uint64_t (*CarCommandsToggleSnippetModel.isOn.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for CarCommandsToggleSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B08);
  v2[4] = sub_2378516B0();
  return sub_237831DB0;
}

uint64_t sub_237832D7C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  type metadata accessor for CarCommandsToggleSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  result = sub_2378516BC();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_237832DD8()
{
  type metadata accessor for CarCommandsToggleSnippetModel(0);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  return sub_2378516C8();
}

uint64_t CarCommandsToggleSnippetModel.appId.setter()
{
  type metadata accessor for CarCommandsToggleSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  return sub_2378516C8();
}

uint64_t (*CarCommandsToggleSnippetModel.appId.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for CarCommandsToggleSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v2[4] = sub_2378516B0();
  return sub_237831DB0;
}

double sub_237832EF0@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;

  type metadata accessor for CarCommandsToggleSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  sub_2378516BC();
  result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_237832F4C()
{
  type metadata accessor for CarCommandsToggleSnippetModel(0);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  return sub_2378516C8();
}

uint64_t CarCommandsToggleSnippetModel.carNameDirectInvocationPayloadValue.setter()
{
  type metadata accessor for CarCommandsToggleSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  return sub_2378516C8();
}

uint64_t type metadata accessor for CarCommandsConfirmationSnippetModel(uint64_t a1)
{
  return sub_237835C60(a1, (uint64_t *)&unk_256817DA0);
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_237833034()
{
  unint64_t result;

  result = qword_256817BD8;
  if (!qword_256817BD8)
  {
    result = MEMORY[0x23B81CC08](&unk_237852B80, &type metadata for CarCommandsConfirmationSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256817BD8);
  }
  return result;
}

unint64_t sub_237833078()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256817BE0;
  if (!qword_256817BE0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256817B10);
    v2[0] = MEMORY[0x24BEE0D38];
    v2[1] = MEMORY[0x24BEE0D08];
    result = MEMORY[0x23B81CC08](MEMORY[0x24BEAD370], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256817BE0);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B81CBFC](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
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

unint64_t sub_237833140()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256817BF0;
  if (!qword_256817BF0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256817B10);
    v2[0] = MEMORY[0x24BEE0D38];
    v2[1] = MEMORY[0x24BEE0D08];
    result = MEMORY[0x23B81CC08](MEMORY[0x24BEAD380], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256817BF0);
  }
  return result;
}

uint64_t type metadata accessor for CarCommandsAppPunchoutSnippetModel(uint64_t a1)
{
  return sub_237835C60(a1, qword_256817E38);
}

unint64_t sub_2378331B8()
{
  unint64_t result;

  result = qword_256817C00;
  if (!qword_256817C00)
  {
    result = MEMORY[0x23B81CC08](&unk_237852B30, &type metadata for CarCommandsAppPunchoutSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256817C00);
  }
  return result;
}

uint64_t sub_2378331FC(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_237833240(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t (*CarCommandsToggleSnippetModel.carNameDirectInvocationPayloadValue.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for CarCommandsToggleSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  v2[4] = sub_2378516B0();
  return sub_237831DB0;
}

uint64_t sub_2378332E4(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_237833320
                                                            + 4 * asc_2378521A0[a1]))(0x54656D614E726163, 0xEB00000000747865);
}

uint64_t sub_237833320()
{
  return 0x5465746174536E6FLL;
}

uint64_t sub_237833334()
{
  return 0x657461745366666FLL;
}

unint64_t sub_237833354()
{
  return 0xD000000000000010;
}

unint64_t sub_237833370()
{
  return 0xD000000000000011;
}

uint64_t sub_2378333CC()
{
  unsigned __int8 *v0;

  return sub_2378332E4(*v0);
}

uint64_t sub_2378333D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23783A064(a1, a2);
  *a3 = result;
  return result;
}

void sub_2378333F8(_BYTE *a1@<X8>)
{
  *a1 = 8;
}

uint64_t sub_237833404()
{
  sub_237833724();
  return sub_237851CF8();
}

uint64_t sub_23783342C()
{
  sub_237833724();
  return sub_237851D04();
}

uint64_t CarCommandsToggleSnippetModel.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD v11[2];
  char v12;
  char v13;
  char v14;
  char v15;
  char v16;
  char v17;
  char v18;
  char v19;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817C10);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_237833724();
  sub_237851CEC();
  v19 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  sub_237833078();
  sub_237851C74();
  if (!v2)
  {
    v9 = type metadata accessor for CarCommandsToggleSnippetModel(0);
    v18 = 1;
    sub_237851C74();
    v17 = 2;
    sub_237851C74();
    v16 = 3;
    sub_237851C74();
    v15 = 4;
    sub_237851C74();
    v11[1] = v3 + *(int *)(v9 + 36);
    v14 = 5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256817B08);
    sub_237833768();
    sub_237851C74();
    v13 = 6;
    sub_237851C74();
    v12 = 7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
    sub_237834074(&qword_256817C28, MEMORY[0x24BEAD370]);
    sub_237851C74();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_237833724()
{
  unint64_t result;

  result = qword_256817C18;
  if (!qword_256817C18)
  {
    result = MEMORY[0x23B81CC08](&unk_237852AE0, &type metadata for CarCommandsToggleSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256817C18);
  }
  return result;
}

unint64_t sub_237833768()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256817C20;
  if (!qword_256817C20)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256817B08);
    v2[0] = MEMORY[0x24BEE1348];
    v2[1] = MEMORY[0x24BEE1330];
    result = MEMORY[0x23B81CC08](MEMORY[0x24BEAD370], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256817C20);
  }
  return result;
}

uint64_t sub_2378337CC(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256817BC8);
    v8 = a2;
    result = MEMORY[0x23B81CC08](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t CarCommandsToggleSnippetModel.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  char *v16;
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
  char *v27;
  char *v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  unint64_t v33;
  char *v34;
  uint64_t v35;
  void (*v36)(char *, char *, uint64_t);
  void (*v37)(char *, char *, uint64_t);
  int *v38;
  uint64_t v39;
  void (*v40)(uint64_t, char *, uint64_t);
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  char *v47;
  char *v48;
  _QWORD v50[2];
  int *v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  char *v55;
  char *v56;
  char *v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  _QWORD *v72;

  v53 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  v66 = *(_QWORD *)(v3 - 8);
  v67 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v54 = (char *)v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B08);
  v59 = *(_QWORD *)(v5 - 8);
  v60 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v56 = (char *)v50 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v62 = *(_QWORD *)(v7 - 8);
  v63 = v7;
  v8 = MEMORY[0x24BDAC7A8](v7);
  v55 = (char *)v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v57 = (char *)v50 - v11;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v58 = (char *)v50 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)v50 - v15;
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)v50 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v61 = (char *)v50 - v20;
  v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817C40);
  v21 = *(_QWORD *)(v65 - 8);
  MEMORY[0x24BDAC7A8](v65);
  v23 = (char *)v50 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = type metadata accessor for CarCommandsToggleSnippetModel(0);
  v25 = MEMORY[0x24BDAC7A8](v24);
  v27 = (char *)v50 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = &v27[*(int *)(v25 + 44)];
  v70 = 0;
  v71 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817BC8);
  v68 = v28;
  sub_2378516A4();
  v29 = a1[3];
  v72 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v29);
  sub_237833724();
  v64 = v23;
  v30 = v69;
  sub_237851CE0();
  if (v30)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v72);
    return (*(uint64_t (**)(char *, uint64_t))(v66 + 8))(v68, v67);
  }
  else
  {
    v31 = v19;
    v51 = (int *)v24;
    v52 = v21;
    v32 = v62;
    v69 = v27;
    LOBYTE(v70) = 0;
    v33 = sub_237833140();
    v34 = v61;
    v35 = v63;
    sub_237851C38();
    v36 = *(void (**)(char *, char *, uint64_t))(v32 + 32);
    v36(v69, v34, v35);
    LOBYTE(v70) = 1;
    sub_237851C38();
    v36(&v69[v51[5]], v31, v35);
    LOBYTE(v70) = 2;
    sub_237851C38();
    v37 = v36;
    v38 = v51;
    v39 = (uint64_t)v69;
    v37(&v69[v51[6]], v16, v35);
    LOBYTE(v70) = 3;
    v40 = (void (*)(uint64_t, char *, uint64_t))v37;
    v41 = v58;
    v50[1] = 0;
    sub_237851C38();
    v42 = (char *)v33;
    v44 = v66;
    v43 = v67;
    v40(v39 + v38[7], v41, v35);
    LOBYTE(v70) = 4;
    sub_237851C38();
    v61 = v42;
    v40(v39 + v38[8], v57, v35);
    LOBYTE(v70) = 5;
    sub_237834010();
    v45 = v56;
    v46 = v60;
    sub_237851C38();
    (*(void (**)(uint64_t, char *, uint64_t))(v59 + 32))(v39 + v51[9], v45, v46);
    LOBYTE(v70) = 6;
    v47 = v55;
    sub_237851C38();
    v40(v39 + v51[10], v47, v35);
    LOBYTE(v70) = 7;
    sub_237834074(&qword_256817C50, MEMORY[0x24BEAD380]);
    v48 = v54;
    sub_237851C38();
    (*(void (**)(char *, uint64_t))(v52 + 8))(v64, v65);
    (*(void (**)(char *, char *, uint64_t))(v44 + 40))(v68, v48, v43);
    sub_2378331FC(v39, v53, type metadata accessor for CarCommandsToggleSnippetModel);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v72);
    return sub_237833240(v39, type metadata accessor for CarCommandsToggleSnippetModel);
  }
}

unint64_t sub_237834010()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256817C48;
  if (!qword_256817C48)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256817B08);
    v2[0] = MEMORY[0x24BEE1348];
    v2[1] = MEMORY[0x24BEE1330];
    result = MEMORY[0x23B81CC08](MEMORY[0x24BEAD380], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256817C48);
  }
  return result;
}

uint64_t sub_237834074(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  _QWORD v6[2];

  result = *a1;
  if (!result)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256817B18);
    v6[0] = sub_2378337CC(&qword_256817C30, MEMORY[0x24BEE0D38], MEMORY[0x24BEE4AC0]);
    v6[1] = sub_2378337CC(&qword_256817C38, MEMORY[0x24BEE0D08], MEMORY[0x24BEE4AA8]);
    result = MEMORY[0x23B81CC08](a2, v5, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_237834110@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return CarCommandsToggleSnippetModel.init(from:)(a1, a2);
}

uint64_t sub_237834124(_QWORD *a1)
{
  return CarCommandsToggleSnippetModel.encode(to:)(a1);
}

uint64_t (*CarCommandsGaugeSnippetModel.carName.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v2[4] = sub_2378516B0();
  return sub_237831DB0;
}

uint64_t CarCommandsGaugeSnippetModel.primaryText.getter()
{
  return sub_237831DC0((void (*)(_QWORD))type metadata accessor for CarCommandsGaugeSnippetModel);
}

uint64_t type metadata accessor for CarCommandsGaugeSnippetModel(uint64_t a1)
{
  return sub_237835C60(a1, (uint64_t *)&unk_256817F80);
}

uint64_t CarCommandsGaugeSnippetModel.primaryText.setter(uint64_t a1, uint64_t a2)
{
  return sub_23783212C(a1, a2, (void (*)(_QWORD))type metadata accessor for CarCommandsGaugeSnippetModel);
}

uint64_t (*CarCommandsGaugeSnippetModel.primaryText.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for CarCommandsGaugeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v2[4] = sub_2378516B0();
  return sub_237831DB0;
}

uint64_t CarCommandsGaugeSnippetModel.secondaryText.getter()
{
  uint64_t v1;

  type metadata accessor for CarCommandsGaugeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  sub_2378516BC();
  return v1;
}

double sub_237834274@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;

  type metadata accessor for CarCommandsGaugeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  sub_2378516BC();
  result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_2378342D0()
{
  type metadata accessor for CarCommandsGaugeSnippetModel(0);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  return sub_2378516C8();
}

uint64_t CarCommandsGaugeSnippetModel.secondaryText.setter()
{
  type metadata accessor for CarCommandsGaugeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  return sub_2378516C8();
}

uint64_t (*CarCommandsGaugeSnippetModel.secondaryText.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for CarCommandsGaugeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  v2[4] = sub_2378516B0();
  return sub_237831DB0;
}

float CarCommandsGaugeSnippetModel.gaugePercentFull.getter()
{
  float v1;

  type metadata accessor for CarCommandsGaugeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817C58);
  sub_2378516BC();
  return v1;
}

float sub_237834430@<S0>(float *a1@<X8>)
{
  float result;
  float v3;

  type metadata accessor for CarCommandsGaugeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817C58);
  sub_2378516BC();
  result = v3;
  *a1 = v3;
  return result;
}

uint64_t sub_23783448C()
{
  type metadata accessor for CarCommandsGaugeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817C58);
  return sub_2378516C8();
}

uint64_t CarCommandsGaugeSnippetModel.gaugePercentFull.setter()
{
  type metadata accessor for CarCommandsGaugeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817C58);
  return sub_2378516C8();
}

uint64_t (*CarCommandsGaugeSnippetModel.gaugePercentFull.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for CarCommandsGaugeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817C58);
  v2[4] = sub_2378516B0();
  return sub_237831DB0;
}

uint64_t CarCommandsGaugeSnippetModel.showGaugeAccessoryView.getter()
{
  unsigned __int8 v1;

  type metadata accessor for CarCommandsGaugeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B08);
  sub_2378516BC();
  return v1;
}

uint64_t sub_2378345DC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  type metadata accessor for CarCommandsGaugeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B08);
  result = sub_2378516BC();
  *a1 = v3;
  return result;
}

uint64_t sub_237834638()
{
  type metadata accessor for CarCommandsGaugeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B08);
  return sub_2378516C8();
}

uint64_t CarCommandsGaugeSnippetModel.showGaugeAccessoryView.setter()
{
  type metadata accessor for CarCommandsGaugeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B08);
  return sub_2378516C8();
}

uint64_t (*CarCommandsGaugeSnippetModel.showGaugeAccessoryView.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for CarCommandsGaugeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B08);
  v2[4] = sub_2378516B0();
  return sub_237831DB0;
}

uint64_t CarCommandsGaugeSnippetModel.appId.getter()
{
  uint64_t v1;

  type metadata accessor for CarCommandsGaugeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  sub_2378516BC();
  return v1;
}

uint64_t sub_237834788@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  type metadata accessor for CarCommandsGaugeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  result = sub_2378516BC();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_2378347E4()
{
  type metadata accessor for CarCommandsGaugeSnippetModel(0);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  return sub_2378516C8();
}

uint64_t CarCommandsGaugeSnippetModel.appId.setter()
{
  type metadata accessor for CarCommandsGaugeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  return sub_2378516C8();
}

uint64_t (*CarCommandsGaugeSnippetModel.appId.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for CarCommandsGaugeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v2[4] = sub_2378516B0();
  return sub_237831DB0;
}

uint64_t CarCommandsGaugeSnippetModel.init(carName:primaryText:secondaryText:gaugePercentFull:showGaugeAccessoryView:appId:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v1 = a1 + *(int *)(type metadata accessor for CarCommandsGaugeSnippetModel(0) + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817BC8);
  sub_2378516A4();
  sub_2378516A4();
  sub_2378516A4();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  sub_2378516A4();
  sub_2378516A4();
  sub_2378516A4();
  return sub_2378516A4();
}

uint64_t sub_237834A70(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_237834AA4 + 4 * byte_2378521A8[a1]))(0x656D614E726163, 0xE700000000000000);
}

uint64_t sub_237834AA4()
{
  return 0x547972616D697270;
}

uint64_t sub_237834AC4()
{
  return 0x7261646E6F636573;
}

unint64_t sub_237834AE8()
{
  return 0xD000000000000010;
}

unint64_t sub_237834B04()
{
  return 0xD000000000000016;
}

uint64_t sub_237834B24()
{
  return 0x6449707061;
}

BOOL sub_237834B38(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_237834B4C()
{
  unsigned __int8 *v0;

  return sub_237834A70(*v0);
}

uint64_t sub_237834B54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23783A3B8(a1, a2);
  *a3 = result;
  return result;
}

void sub_237834B78(_BYTE *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_237834B84()
{
  sub_237834E60();
  return sub_237851CF8();
}

uint64_t sub_237834BAC()
{
  sub_237834E60();
  return sub_237851D04();
}

uint64_t CarCommandsGaugeSnippetModel.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD v9[2];
  char v10;
  char v11;
  char v12;
  char v13;
  char v14;
  char v15;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817C60);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_237834E60();
  sub_237851CEC();
  v15 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  sub_237833078();
  sub_237851C74();
  if (!v1)
  {
    v7 = type metadata accessor for CarCommandsGaugeSnippetModel(0);
    v14 = 1;
    sub_237851C74();
    v9[1] = v7;
    v13 = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
    sub_237834074(&qword_256817C28, MEMORY[0x24BEAD370]);
    sub_237851C74();
    v12 = 3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256817C58);
    sub_237834EA4();
    sub_237851C74();
    v11 = 4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256817B08);
    sub_237833768();
    sub_237851C74();
    v10 = 5;
    sub_237851C74();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_237834E60()
{
  unint64_t result;

  result = qword_256817C68;
  if (!qword_256817C68)
  {
    result = MEMORY[0x23B81CC08](&unk_237852A90, &type metadata for CarCommandsGaugeSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256817C68);
  }
  return result;
}

unint64_t sub_237834EA4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256817C70;
  if (!qword_256817C70)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256817C58);
    v2[0] = MEMORY[0x24BEE1520];
    v2[1] = MEMORY[0x24BEE14F8];
    result = MEMORY[0x23B81CC08](MEMORY[0x24BEAD370], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256817C70);
  }
  return result;
}

uint64_t CarCommandsGaugeSnippetModel.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, char *, uint64_t);
  uint64_t v30;
  char *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  char *v39;
  _QWORD v41[3];
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  char *v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;

  v43 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B08);
  v48 = *(_QWORD *)(v3 - 8);
  v49 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v45 = (char *)v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817C58);
  v50 = *(_QWORD *)(v5 - 8);
  v51 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v46 = (char *)v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  v62 = *(_QWORD *)(v57 - 8);
  MEMORY[0x24BDAC7A8](v57);
  v47 = (char *)v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v52 = *(_QWORD *)(v8 - 8);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v44 = (char *)v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)v41 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v54 = (char *)v41 - v14;
  v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817C78);
  v15 = *(_QWORD *)(v53 - 8);
  MEMORY[0x24BDAC7A8](v53);
  v17 = (char *)v41 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for CarCommandsGaugeSnippetModel(0);
  v19 = MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)v41 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = &v21[*(int *)(v19 + 24)];
  v60 = 0;
  v61 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817BC8);
  v59 = v22;
  sub_2378516A4();
  v23 = a1[3];
  v56 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v23);
  sub_237834E60();
  v55 = v17;
  v24 = v58;
  sub_237851CE0();
  if (v24)
  {
    v27 = v57;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v56);
    return (*(uint64_t (**)(char *, uint64_t))(v62 + 8))(v59, v27);
  }
  else
  {
    v25 = v13;
    v58 = v15;
    v42 = v18;
    LOBYTE(v60) = 0;
    v26 = sub_237833140();
    sub_237851C38();
    v28 = v8;
    v29 = *(void (**)(char *, char *, uint64_t))(v52 + 32);
    v29(v21, v54, v8);
    LOBYTE(v60) = 1;
    sub_237851C38();
    v41[1] = v26;
    v30 = *(int *)(v42 + 20);
    v54 = v21;
    v29(&v21[v30], v25, v8);
    LOBYTE(v60) = 2;
    sub_237834074(&qword_256817C50, MEMORY[0x24BEAD380]);
    v31 = v47;
    v32 = v57;
    v41[2] = 0;
    sub_237851C38();
    v41[0] = v29;
    (*(void (**)(char *, char *, uint64_t))(v62 + 40))(v59, v31, v32);
    LOBYTE(v60) = 3;
    sub_237835594();
    v33 = v46;
    v34 = v51;
    sub_237851C38();
    v35 = v42;
    v36 = (uint64_t)v54;
    (*(void (**)(char *, char *, uint64_t))(v50 + 32))(&v54[*(int *)(v42 + 28)], v33, v34);
    LOBYTE(v60) = 4;
    sub_237834010();
    v37 = v45;
    v38 = v49;
    sub_237851C38();
    (*(void (**)(uint64_t, char *, uint64_t))(v48 + 32))(v36 + *(int *)(v35 + 32), v37, v38);
    LOBYTE(v60) = 5;
    v39 = v44;
    sub_237851C38();
    (*(void (**)(char *, uint64_t))(v58 + 8))(v55, v53);
    ((void (*)(uint64_t, char *, uint64_t))v41[0])(v36 + *(int *)(v35 + 36), v39, v28);
    sub_2378331FC(v36, v43, type metadata accessor for CarCommandsGaugeSnippetModel);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v56);
    return sub_237833240(v36, type metadata accessor for CarCommandsGaugeSnippetModel);
  }
}

unint64_t sub_237835594()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256817C80;
  if (!qword_256817C80)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256817C58);
    v2[0] = MEMORY[0x24BEE1520];
    v2[1] = MEMORY[0x24BEE14F8];
    result = MEMORY[0x23B81CC08](MEMORY[0x24BEAD380], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256817C80);
  }
  return result;
}

uint64_t sub_2378355F8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return CarCommandsGaugeSnippetModel.init(from:)(a1, a2);
}

uint64_t sub_23783560C(_QWORD *a1)
{
  return CarCommandsGaugeSnippetModel.encode(to:)(a1);
}

uint64_t (*CarCommandsDisambiguationSnippetModel.title.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v2[4] = sub_2378516B0();
  return sub_237831DB0;
}

uint64_t CarCommandsDisambiguationSnippetModel.disambiguationOptions.getter()
{
  uint64_t v1;

  type metadata accessor for CarCommandsDisambiguationSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817C88);
  sub_2378516BC();
  return v1;
}

uint64_t type metadata accessor for CarCommandsDisambiguationSnippetModel(uint64_t a1)
{
  return sub_237835C60(a1, (uint64_t *)&unk_256818028);
}

uint64_t sub_2378356DC@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  type metadata accessor for CarCommandsDisambiguationSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817C88);
  result = sub_2378516BC();
  *a1 = v3;
  return result;
}

uint64_t sub_237835738()
{
  type metadata accessor for CarCommandsDisambiguationSnippetModel(0);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817C88);
  return sub_2378516C8();
}

uint64_t CarCommandsDisambiguationSnippetModel.disambiguationOptions.setter()
{
  type metadata accessor for CarCommandsDisambiguationSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817C88);
  return sub_2378516C8();
}

uint64_t (*CarCommandsDisambiguationSnippetModel.disambiguationOptions.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for CarCommandsDisambiguationSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817C88);
  v2[4] = sub_2378516B0();
  return sub_237831DB0;
}

uint64_t CarCommandsDisambiguationSnippetModel.init(title:disambiguationOptions:)()
{
  sub_2378516A4();
  type metadata accessor for CarCommandsDisambiguationSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817C90);
  return sub_2378516A4();
}

uint64_t sub_2378358BC()
{
  sub_237851CB0();
  sub_237851CBC();
  return sub_237851CD4();
}

uint64_t sub_237835900()
{
  sub_237851CB0();
  sub_237851CBC();
  return sub_237851CD4();
}

uint64_t sub_237835940()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000015;
  else
    return 0x656C746974;
}

uint64_t sub_23783597C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23783A660(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2378359A0()
{
  sub_237835B5C();
  return sub_237851CF8();
}

uint64_t sub_2378359C8()
{
  sub_237835B5C();
  return sub_237851D04();
}

uint64_t CarCommandsDisambiguationSnippetModel.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817C98);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_237835B5C();
  sub_237851CEC();
  v8[15] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  sub_237833078();
  sub_237851C74();
  if (!v1)
  {
    type metadata accessor for CarCommandsDisambiguationSnippetModel(0);
    v8[14] = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256817C88);
    sub_237835BA0(&qword_256817CA8, MEMORY[0x24BEAD370]);
    sub_237851C74();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_237835B5C()
{
  unint64_t result;

  result = qword_256817CA0;
  if (!qword_256817CA0)
  {
    result = MEMORY[0x23B81CC08](&unk_237852A40, &type metadata for CarCommandsDisambiguationSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256817CA0);
  }
  return result;
}

uint64_t sub_237835BA0(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  _QWORD v6[2];

  result = *a1;
  if (!result)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256817C88);
    v6[0] = sub_237835C94(&qword_256817CB0, &qword_256817CB8, (uint64_t)&protocol conformance descriptor for CarCommandsDisambiguationSnippetModel.DisambiguationOption, MEMORY[0x24BEE12D0]);
    v6[1] = sub_237835C94(&qword_256817CC0, &qword_256817CC8, (uint64_t)&protocol conformance descriptor for CarCommandsDisambiguationSnippetModel.DisambiguationOption, MEMORY[0x24BEE12A0]);
    result = MEMORY[0x23B81CC08](a2, v5, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for CarCommandsDisambiguationSnippetModel.DisambiguationOption(uint64_t a1)
{
  return sub_237835C60(a1, qword_2568180C0);
}

uint64_t sub_237835C60(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_237835C94(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256817C90);
    v10 = sub_237835D18(a2, type metadata accessor for CarCommandsDisambiguationSnippetModel.DisambiguationOption, a3);
    result = MEMORY[0x23B81CC08](a4, v9, &v10);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_237835D18(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B81CC08](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t CarCommandsDisambiguationSnippetModel.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
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
  char *v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  char v33;

  v25 = a2;
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817C88);
  v24 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v26 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v30 = *(_QWORD *)(v5 - 8);
  v31 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v28 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817CD0);
  v7 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for CarCommandsDisambiguationSnippetModel(0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_237835B5C();
  sub_237851CE0();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v21 = v10;
  v22 = a1;
  v23 = v7;
  v13 = (uint64_t)v12;
  v14 = v30;
  v15 = v26;
  v16 = v27;
  v33 = 0;
  sub_237833140();
  v17 = v28;
  v18 = v29;
  sub_237851C38();
  (*(void (**)(uint64_t, char *, uint64_t))(v14 + 32))(v13, v17, v31);
  v32 = 1;
  sub_237835BA0(&qword_256817CD8, MEMORY[0x24BEAD380]);
  sub_237851C38();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v9, v18);
  (*(void (**)(uint64_t, char *, uint64_t))(v24 + 32))(v13 + *(int *)(v21 + 20), v15, v16);
  sub_2378331FC(v13, v25, type metadata accessor for CarCommandsDisambiguationSnippetModel);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
  return sub_237833240(v13, type metadata accessor for CarCommandsDisambiguationSnippetModel);
}

uint64_t sub_237836038@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return CarCommandsDisambiguationSnippetModel.init(from:)(a1, a2);
}

uint64_t sub_23783604C(_QWORD *a1)
{
  return CarCommandsDisambiguationSnippetModel.encode(to:)(a1);
}

uint64_t _s22CarCommandsUIFramework0aB18ToggleSnippetModelV11carNameTextSSvg_0()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  sub_2378516BC();
  return v1;
}

uint64_t sub_237836094()
{
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  return sub_2378516C8();
}

uint64_t _s22CarCommandsUIFramework0aB24ConfirmationSnippetModelV11confirmTextSSvs_0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  return sub_2378516C8();
}

uint64_t (*CarCommandsDisambiguationSnippetModel.DisambiguationOption.text.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v2[4] = sub_2378516B0();
  return sub_237831DB0;
}

uint64_t CarCommandsDisambiguationSnippetModel.DisambiguationOption.iconImageIdentifier.getter()
{
  uint64_t v1;

  type metadata accessor for CarCommandsDisambiguationSnippetModel.DisambiguationOption(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  sub_2378516BC();
  return v1;
}

double sub_2378361B4@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;

  type metadata accessor for CarCommandsDisambiguationSnippetModel.DisambiguationOption(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  sub_2378516BC();
  result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_237836210()
{
  type metadata accessor for CarCommandsDisambiguationSnippetModel.DisambiguationOption(0);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  return sub_2378516C8();
}

uint64_t CarCommandsDisambiguationSnippetModel.DisambiguationOption.iconImageIdentifier.setter()
{
  type metadata accessor for CarCommandsDisambiguationSnippetModel.DisambiguationOption(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  return sub_2378516C8();
}

uint64_t (*CarCommandsDisambiguationSnippetModel.DisambiguationOption.iconImageIdentifier.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for CarCommandsDisambiguationSnippetModel.DisambiguationOption(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  v2[4] = sub_2378516B0();
  return sub_237831DB0;
}

uint64_t CarCommandsDisambiguationSnippetModel.DisambiguationOption.directInvocationPayloadValue.getter()
{
  return sub_237836334((void (*)(_QWORD))type metadata accessor for CarCommandsDisambiguationSnippetModel.DisambiguationOption);
}

uint64_t sub_237836334(void (*a1)(_QWORD))
{
  uint64_t v2;

  a1(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  sub_2378516BC();
  return v2;
}

uint64_t sub_237836380@<X0>(void (*a1)(_QWORD)@<X3>, _QWORD *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  a1(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  result = sub_2378516BC();
  *a2 = v4;
  a2[1] = v5;
  return result;
}

uint64_t sub_2378363DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(_QWORD))
{
  a5(0);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  return sub_2378516C8();
}

uint64_t CarCommandsDisambiguationSnippetModel.DisambiguationOption.directInvocationPayloadValue.setter(uint64_t a1, uint64_t a2)
{
  return sub_23783644C(a1, a2, (void (*)(_QWORD))type metadata accessor for CarCommandsDisambiguationSnippetModel.DisambiguationOption);
}

uint64_t sub_23783644C(uint64_t a1, uint64_t a2, void (*a3)(_QWORD))
{
  a3(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  return sub_2378516C8();
}

uint64_t (*CarCommandsDisambiguationSnippetModel.DisambiguationOption.directInvocationPayloadValue.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for CarCommandsDisambiguationSnippetModel.DisambiguationOption(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v2[4] = sub_2378516B0();
  return sub_237831DB0;
}

void sub_237836500(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 32))(*a1, 0);
  free(v1);
}

uint64_t CarCommandsDisambiguationSnippetModel.DisambiguationOption.init(text:iconImageIdentifier:directInvocationPayloadValue:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v1 = a1 + *(int *)(type metadata accessor for CarCommandsDisambiguationSnippetModel.DisambiguationOption(0) + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817BC8);
  sub_2378516A4();
  sub_2378516A4();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  sub_2378516A4();
  return sub_2378516A4();
}

uint64_t CarCommandsDisambiguationSnippetModel.DisambiguationOption.init(text:directInvocationPayloadValue:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v1 = a1 + *(int *)(type metadata accessor for CarCommandsDisambiguationSnippetModel.DisambiguationOption(0) + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817BC8);
  sub_2378516A4();
  sub_2378516A4();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  sub_2378516A4();
  return sub_2378516A4();
}

uint64_t sub_237836718()
{
  _BYTE *v0;
  unint64_t v1;

  v1 = 0xD000000000000013;
  if (*v0 != 1)
    v1 = 0xD00000000000001CLL;
  if (*v0)
    return v1;
  else
    return 1954047348;
}

uint64_t sub_237836770@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23783A744(a1, a2);
  *a3 = result;
  return result;
}

void sub_237836794(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_2378367A0()
{
  sub_2378369A4();
  return sub_237851CF8();
}

uint64_t sub_2378367C8()
{
  sub_2378369A4();
  return sub_237851D04();
}

uint64_t CarCommandsDisambiguationSnippetModel.DisambiguationOption.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD v8[2];
  char v9;
  char v10;
  char v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817CE0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2378369A4();
  sub_237851CEC();
  v11 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  sub_237833078();
  sub_237851C74();
  if (!v1)
  {
    v8[1] = type metadata accessor for CarCommandsDisambiguationSnippetModel.DisambiguationOption(0);
    v10 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
    sub_237834074(&qword_256817C28, MEMORY[0x24BEAD370]);
    sub_237851C74();
    v9 = 2;
    sub_237851C74();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_2378369A4()
{
  unint64_t result;

  result = qword_256817CE8;
  if (!qword_256817CE8)
  {
    result = MEMORY[0x23B81CC08](&unk_2378529F0, &type metadata for CarCommandsDisambiguationSnippetModel.DisambiguationOption.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256817CE8);
  }
  return result;
}

uint64_t CarCommandsDisambiguationSnippetModel.DisambiguationOption.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  unint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, char *, uint64_t);
  uint64_t v24;
  char *v25;
  void (*v26)(char *, char *, uint64_t);
  uint64_t v27;
  unint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;

  v33 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  v40 = *(_QWORD *)(v3 - 8);
  v41 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v36 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v35 = *(_QWORD *)(v38 - 8);
  v5 = MEMORY[0x24BDAC7A8](v38);
  v34 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v37 = (char *)&v29 - v7;
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817CF0);
  v8 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for CarCommandsDisambiguationSnippetModel.DisambiguationOption(0);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = &v14[*(int *)(v12 + 20)];
  v43 = 0;
  v44 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817BC8);
  v45 = v15;
  sub_2378516A4();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2378369A4();
  v16 = (uint64_t)v42;
  sub_237851CE0();
  if (v16)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return (*(uint64_t (**)(char *, uint64_t))(v40 + 8))(v45, v41);
  }
  else
  {
    v30 = v11;
    v31 = v14;
    v32 = v8;
    v17 = v35;
    v18 = v36;
    v42 = a1;
    LOBYTE(v43) = 0;
    v19 = sub_237833140();
    v20 = v37;
    v21 = v38;
    v22 = v39;
    sub_237851C38();
    v29 = v19;
    v23 = *(void (**)(char *, char *, uint64_t))(v17 + 32);
    v23(v31, v20, v21);
    LOBYTE(v43) = 1;
    sub_237834074(&qword_256817C50, MEMORY[0x24BEAD380]);
    v24 = v41;
    sub_237851C38();
    (*(void (**)(char *, char *, uint64_t))(v40 + 40))(v45, v18, v24);
    LOBYTE(v43) = 2;
    v25 = v34;
    sub_237851C38();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v10, v22);
    v26 = v23;
    v27 = (uint64_t)v31;
    v26(&v31[*(int *)(v30 + 24)], v25, v21);
    sub_2378331FC(v27, v33, type metadata accessor for CarCommandsDisambiguationSnippetModel.DisambiguationOption);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
    return sub_237833240(v27, type metadata accessor for CarCommandsDisambiguationSnippetModel.DisambiguationOption);
  }
}

uint64_t sub_237836D98()
{
  return sub_237835D18(&qword_256817CF8, type metadata accessor for CarCommandsConfirmationSnippetModel, (uint64_t)&protocol conformance descriptor for CarCommandsConfirmationSnippetModel);
}

uint64_t sub_237836DC4()
{
  return sub_237835D18(&qword_256817D00, type metadata accessor for CarCommandsConfirmationSnippetModel, (uint64_t)&protocol conformance descriptor for CarCommandsConfirmationSnippetModel);
}

uint64_t sub_237836DF0()
{
  return sub_237835D18(&qword_256817D08, type metadata accessor for CarCommandsAppPunchoutSnippetModel, (uint64_t)&protocol conformance descriptor for CarCommandsAppPunchoutSnippetModel);
}

uint64_t sub_237836E1C()
{
  return sub_237835D18(&qword_256817D10, type metadata accessor for CarCommandsAppPunchoutSnippetModel, (uint64_t)&protocol conformance descriptor for CarCommandsAppPunchoutSnippetModel);
}

uint64_t sub_237836E48()
{
  return sub_237835D18(&qword_256817D18, type metadata accessor for CarCommandsToggleSnippetModel, (uint64_t)&protocol conformance descriptor for CarCommandsToggleSnippetModel);
}

uint64_t sub_237836E74()
{
  return sub_237835D18(&qword_256817D20, type metadata accessor for CarCommandsToggleSnippetModel, (uint64_t)&protocol conformance descriptor for CarCommandsToggleSnippetModel);
}

uint64_t sub_237836EA0()
{
  return sub_237835D18(&qword_256817D28, type metadata accessor for CarCommandsGaugeSnippetModel, (uint64_t)&protocol conformance descriptor for CarCommandsGaugeSnippetModel);
}

uint64_t sub_237836ECC()
{
  return sub_237835D18(&qword_256817D30, type metadata accessor for CarCommandsGaugeSnippetModel, (uint64_t)&protocol conformance descriptor for CarCommandsGaugeSnippetModel);
}

uint64_t sub_237836EF8()
{
  return sub_237835D18(&qword_256817D38, type metadata accessor for CarCommandsDisambiguationSnippetModel, (uint64_t)&protocol conformance descriptor for CarCommandsDisambiguationSnippetModel);
}

uint64_t sub_237836F24()
{
  return sub_237835D18(&qword_256817D40, type metadata accessor for CarCommandsDisambiguationSnippetModel, (uint64_t)&protocol conformance descriptor for CarCommandsDisambiguationSnippetModel);
}

uint64_t sub_237836F50@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return CarCommandsDisambiguationSnippetModel.DisambiguationOption.init(from:)(a1, a2);
}

uint64_t sub_237836F64(_QWORD *a1)
{
  return CarCommandsDisambiguationSnippetModel.DisambiguationOption.encode(to:)(a1);
}

uint64_t sub_237836F7C()
{
  return sub_237836094();
}

uint64_t sub_237836F90@<X0>(_QWORD *a1@<X8>)
{
  return sub_237832060((void (*)(_QWORD))type metadata accessor for CarCommandsConfirmationSnippetModel, a1);
}

uint64_t sub_237836FAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2378320BC(a1, a2, a3, a4, (void (*)(_QWORD))type metadata accessor for CarCommandsConfirmationSnippetModel);
}

uint64_t sub_237836FCC()
{
  return sub_237836094();
}

uint64_t sub_237836FE0@<X0>(_QWORD *a1@<X8>)
{
  return sub_237832060((void (*)(_QWORD))type metadata accessor for CarCommandsAppPunchoutSnippetModel, a1);
}

uint64_t sub_237836FFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2378320BC(a1, a2, a3, a4, (void (*)(_QWORD))type metadata accessor for CarCommandsAppPunchoutSnippetModel);
}

uint64_t sub_23783701C()
{
  return sub_237836094();
}

uint64_t sub_237837030@<X0>(_QWORD *a1@<X8>)
{
  return sub_237832060((void (*)(_QWORD))type metadata accessor for CarCommandsToggleSnippetModel, a1);
}

uint64_t sub_23783704C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2378320BC(a1, a2, a3, a4, (void (*)(_QWORD))type metadata accessor for CarCommandsToggleSnippetModel);
}

uint64_t sub_237837068@<X0>(_QWORD *a1@<X8>)
{
  return sub_237836380((void (*)(_QWORD))type metadata accessor for CarCommandsToggleSnippetModel, a1);
}

uint64_t sub_237837084(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2378363DC(a1, a2, a3, a4, (void (*)(_QWORD))type metadata accessor for CarCommandsToggleSnippetModel);
}

uint64_t sub_2378370CC()
{
  return sub_237836094();
}

uint64_t sub_2378370E0@<X0>(_QWORD *a1@<X8>)
{
  return sub_237832060((void (*)(_QWORD))type metadata accessor for CarCommandsGaugeSnippetModel, a1);
}

uint64_t sub_2378370FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2378320BC(a1, a2, a3, a4, (void (*)(_QWORD))type metadata accessor for CarCommandsGaugeSnippetModel);
}

uint64_t sub_23783713C()
{
  return sub_237836094();
}

uint64_t keypath_getTm@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  result = sub_2378516BC();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_2378371A0()
{
  return sub_237836094();
}

uint64_t sub_2378371BC@<X0>(_QWORD *a1@<X8>)
{
  return sub_237836380((void (*)(_QWORD))type metadata accessor for CarCommandsDisambiguationSnippetModel.DisambiguationOption, a1);
}

uint64_t sub_2378371D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2378363DC(a1, a2, a3, a4, (void (*)(_QWORD))type metadata accessor for CarCommandsDisambiguationSnippetModel.DisambiguationOption);
}

uint64_t getEnumTagSinglePayload for CarCommandsConfirmationSnippetModel()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for CarCommandsConfirmationSnippetModel()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t *_s22CarCommandsUIFramework35CarCommandsConfirmationSnippetModelVwCP_0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v9;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
    v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + *(int *)(a3 + 20)), (uint64_t *)((char *)a2 + *(int *)(a3 + 20)), v7);
  }
  return a1;
}

uint64_t _s22CarCommandsUIFramework35CarCommandsConfirmationSnippetModelVwxx_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v6)(uint64_t, uint64_t);

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v6 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v6(a1, v4);
  return ((uint64_t (*)(uint64_t, uint64_t))v6)(a1 + *(int *)(a2 + 20), v4);
}

uint64_t _s22CarCommandsUIFramework35CarCommandsConfirmationSnippetModelVwcp_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t _s22CarCommandsUIFramework35CarCommandsConfirmationSnippetModelVwca_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t _s22CarCommandsUIFramework35CarCommandsConfirmationSnippetModelVwtk_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t _s22CarCommandsUIFramework35CarCommandsConfirmationSnippetModelVwta_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for CarCommandsAppPunchoutSnippetModel()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for CarCommandsAppPunchoutSnippetModel()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t __swift_store_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

void sub_2378375B0()
{
  unint64_t v0;

  sub_2378388D8(319, qword_256817DB0);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t *initializeBufferWithCopyOfBuffer for CarCommandsToggleSnippetModel(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
    v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + a3[5]), (uint64_t *)((char *)a2 + a3[5]), v7);
    v8((uint64_t *)((char *)a1 + a3[6]), (uint64_t *)((char *)a2 + a3[6]), v7);
    v8((uint64_t *)((char *)a1 + a3[7]), (uint64_t *)((char *)a2 + a3[7]), v7);
    v8((uint64_t *)((char *)a1 + a3[8]), (uint64_t *)((char *)a2 + a3[8]), v7);
    v9 = a3[9];
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B08);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    v8((uint64_t *)((char *)a1 + a3[10]), (uint64_t *)((char *)a2 + a3[10]), v7);
    v13 = a3[11];
    v14 = (char *)a1 + v13;
    v15 = (char *)a2 + v13;
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
  }
  return a1;
}

uint64_t destroy for CarCommandsToggleSnippetModel(uint64_t a1, int *a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(a1, v4);
  v5(a1 + a2[5], v4);
  v5(a1 + a2[6], v4);
  v5(a1 + a2[7], v4);
  v5(a1 + a2[8], v4);
  v6 = a1 + a2[9];
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B08);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v5(a1 + a2[10], v4);
  v8 = a1 + a2[11];
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
}

uint64_t initializeWithCopy for CarCommandsToggleSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  v7(a1 + a3[6], a2 + a3[6], v6);
  v7(a1 + a3[7], a2 + a3[7], v6);
  v7(a1 + a3[8], a2 + a3[8], v6);
  v8 = a3[9];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  v7(a1 + a3[10], a2 + a3[10], v6);
  v12 = a3[11];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
  return a1;
}

uint64_t assignWithCopy for CarCommandsToggleSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  v7(a1 + a3[6], a2 + a3[6], v6);
  v7(a1 + a3[7], a2 + a3[7], v6);
  v7(a1 + a3[8], a2 + a3[8], v6);
  v8 = a3[9];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 24))(v9, v10, v11);
  v7(a1 + a3[10], a2 + a3[10], v6);
  v12 = a3[11];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 24))(v13, v14, v15);
  return a1;
}

uint64_t initializeWithTake for CarCommandsToggleSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  v7(a1 + a3[6], a2 + a3[6], v6);
  v7(a1 + a3[7], a2 + a3[7], v6);
  v7(a1 + a3[8], a2 + a3[8], v6);
  v8 = a3[9];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
  v7(a1 + a3[10], a2 + a3[10], v6);
  v12 = a3[11];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v13, v14, v15);
  return a1;
}

uint64_t assignWithTake for CarCommandsToggleSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  v7(a1 + a3[6], a2 + a3[6], v6);
  v7(a1 + a3[7], a2 + a3[7], v6);
  v7(a1 + a3[8], a2 + a3[8], v6);
  v8 = a3[9];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  v7(a1 + a3[10], a2 + a3[10], v6);
  v12 = a3[11];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  return a1;
}

uint64_t getEnumTagSinglePayload for CarCommandsToggleSnippetModel()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_237837D2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B08);
    v12 = *(_QWORD *)(v11 - 8);
    if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
    {
      v8 = v11;
      v13 = *(int *)(a3 + 36);
    }
    else
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
      v12 = *(_QWORD *)(v8 - 8);
      v13 = *(int *)(a3 + 44);
    }
    v10 = a1 + v13;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t storeEnumTagSinglePayload for CarCommandsToggleSnippetModel()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_237837DDC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B08);
    v14 = *(_QWORD *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = v13;
      v15 = *(int *)(a4 + 36);
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
      v14 = *(_QWORD *)(v10 - 8);
      v15 = *(int *)(a4 + 44);
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_237837E88()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_2378388D8(319, qword_256817DB0);
  if (v0 <= 0x3F)
  {
    sub_2378388D8(319, &qword_256817ED8);
    if (v1 <= 0x3F)
    {
      sub_237838D14(319, qword_256817EE0, &qword_256817BC8);
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for CarCommandsGaugeSnippetModel(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v21 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
    v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + a3[5]), (uint64_t *)((char *)a2 + a3[5]), v7);
    v9 = a3[6];
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    v13 = a3[7];
    v14 = (char *)a1 + v13;
    v15 = (char *)a2 + v13;
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817C58);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
    v17 = a3[8];
    v18 = (char *)a1 + v17;
    v19 = (char *)a2 + v17;
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B08);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
    v8((uint64_t *)((char *)a1 + a3[9]), (uint64_t *)((char *)a2 + a3[9]), v7);
  }
  return a1;
}

uint64_t destroy for CarCommandsGaugeSnippetModel(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v12)(uint64_t, uint64_t);

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v12 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v12(a1, v4);
  v12(a1 + a2[5], v4);
  v5 = a1 + a2[6];
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = a1 + a2[7];
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817C58);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  v9 = a1 + a2[8];
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B08);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  return ((uint64_t (*)(uint64_t, uint64_t))v12)(a1 + a2[9], v4);
}

uint64_t initializeWithCopy for CarCommandsGaugeSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
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

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  v8 = a3[6];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  v12 = a3[7];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817C58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
  v16 = a3[8];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v17, v18, v19);
  v7(a1 + a3[9], a2 + a3[9], v6);
  return a1;
}

uint64_t assignWithCopy for CarCommandsGaugeSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
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

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  v8 = a3[6];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 24))(v9, v10, v11);
  v12 = a3[7];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817C58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 24))(v13, v14, v15);
  v16 = a3[8];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 24))(v17, v18, v19);
  v7(a1 + a3[9], a2 + a3[9], v6);
  return a1;
}

uint64_t initializeWithTake for CarCommandsGaugeSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
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

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  v8 = a3[6];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
  v12 = a3[7];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817C58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v13, v14, v15);
  v16 = a3[8];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v17, v18, v19);
  v7(a1 + a3[9], a2 + a3[9], v6);
  return a1;
}

uint64_t assignWithTake for CarCommandsGaugeSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
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

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  v8 = a3[6];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  v12 = a3[7];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817C58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  v16 = a3[8];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 40))(v17, v18, v19);
  v7(a1 + a3[9], a2 + a3[9], v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for CarCommandsGaugeSnippetModel()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_237838630(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
    v12 = *(_QWORD *)(v11 - 8);
    if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
    {
      v8 = v11;
      v13 = a3[6];
    }
    else
    {
      v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817C58);
      v12 = *(_QWORD *)(v14 - 8);
      if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
      {
        v8 = v14;
        v13 = a3[7];
      }
      else
      {
        v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B08);
        v12 = *(_QWORD *)(v8 - 8);
        v13 = a3[8];
      }
    }
    v10 = a1 + v13;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t storeEnumTagSinglePayload for CarCommandsGaugeSnippetModel()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_237838708(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
    v14 = *(_QWORD *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = v13;
      v15 = a4[6];
    }
    else
    {
      v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817C58);
      v14 = *(_QWORD *)(v16 - 8);
      if (*(_DWORD *)(v14 + 84) == a3)
      {
        v10 = v16;
        v15 = a4[7];
      }
      else
      {
        v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B08);
        v14 = *(_QWORD *)(v10 - 8);
        v15 = a4[8];
      }
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_2378387DC()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  sub_2378388D8(319, qword_256817DB0);
  if (v0 <= 0x3F)
  {
    sub_237838D14(319, qword_256817EE0, &qword_256817BC8);
    if (v1 <= 0x3F)
    {
      sub_2378388D8(319, qword_256817F90);
      if (v2 <= 0x3F)
      {
        sub_2378388D8(319, &qword_256817ED8);
        if (v3 <= 0x3F)
          swift_initStructMetadata();
      }
    }
  }
}

void sub_2378388D8(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    v3 = sub_2378516D4();
    if (!v4)
      atomic_store(v3, a2);
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for CarCommandsDisambiguationSnippetModel(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817C88);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t destroy for CarCommandsDisambiguationSnippetModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817C88);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

uint64_t initializeWithCopy for CarCommandsDisambiguationSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817C88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t assignWithCopy for CarCommandsDisambiguationSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817C88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t initializeWithTake for CarCommandsDisambiguationSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817C88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t assignWithTake for CarCommandsDisambiguationSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817C88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for CarCommandsDisambiguationSnippetModel()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_237838C4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_51Tm(a1, a2, a3, &qword_256817C88);
}

uint64_t storeEnumTagSinglePayload for CarCommandsDisambiguationSnippetModel()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_237838C64(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_52Tm(a1, a2, a3, a4, &qword_256817C88);
}

void sub_237838C70()
{
  unint64_t v0;
  unint64_t v1;

  sub_2378388D8(319, qword_256817DB0);
  if (v0 <= 0x3F)
  {
    sub_237838D14(319, qword_256818038, &qword_256817C90);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_237838D14(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    v4 = sub_2378516D4();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for CarCommandsDisambiguationSnippetModel.DisambiguationOption(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v13 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
    v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v9 = *(int *)(a3 + 20);
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    v8((uint64_t *)((char *)a1 + *(int *)(a3 + 24)), (uint64_t *)((char *)a2 + *(int *)(a3 + 24)), v7);
  }
  return a1;
}

uint64_t destroy for CarCommandsDisambiguationSnippetModel.DisambiguationOption(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v8)(uint64_t, uint64_t);

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v8 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v8(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  return ((uint64_t (*)(uint64_t, uint64_t))v8)(a1 + *(int *)(a2 + 24), v4);
}

uint64_t initializeWithCopy for CarCommandsDisambiguationSnippetModel.DisambiguationOption(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v8 = *(int *)(a3 + 20);
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  v7(a1 + *(int *)(a3 + 24), a2 + *(int *)(a3 + 24), v6);
  return a1;
}

uint64_t assignWithCopy for CarCommandsDisambiguationSnippetModel.DisambiguationOption(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v8 = *(int *)(a3 + 20);
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 24))(v9, v10, v11);
  v7(a1 + *(int *)(a3 + 24), a2 + *(int *)(a3 + 24), v6);
  return a1;
}

uint64_t initializeWithTake for CarCommandsDisambiguationSnippetModel.DisambiguationOption(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v8 = *(int *)(a3 + 20);
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
  v7(a1 + *(int *)(a3 + 24), a2 + *(int *)(a3 + 24), v6);
  return a1;
}

uint64_t assignWithTake for CarCommandsDisambiguationSnippetModel.DisambiguationOption(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v8 = *(int *)(a3 + 20);
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  v7(a1 + *(int *)(a3 + 24), a2 + *(int *)(a3 + 24), v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for CarCommandsDisambiguationSnippetModel.DisambiguationOption()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_237839188(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_51Tm(a1, a2, a3, &qword_256817B18);
}

uint64_t __swift_get_extra_inhabitant_index_51Tm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
    v12 = a1;
  }
  else
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(a4);
    v12 = a1 + *(int *)(a3 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 48);
  }
  return v11(v12, a2, v10);
}

uint64_t storeEnumTagSinglePayload for CarCommandsDisambiguationSnippetModel.DisambiguationOption()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23783921C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_52Tm(a1, a2, a3, a4, &qword_256817B18);
}

uint64_t __swift_store_extra_inhabitant_index_52Tm(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v14;

  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v11 = *(_QWORD *)(v10 - 8);
  if (*(_DWORD *)(v11 + 84) == a3)
  {
    v12 = v10;
    v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 56);
    v14 = a1;
  }
  else
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(a5);
    v14 = a1 + *(int *)(a4 + 20);
    v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56);
  }
  return v13(v14, a2, a2, v12);
}

void sub_2378392B4()
{
  unint64_t v0;
  unint64_t v1;

  sub_2378388D8(319, qword_256817DB0);
  if (v0 <= 0x3F)
  {
    sub_237838D14(319, qword_256817EE0, &qword_256817BC8);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CarCommandsDisambiguationSnippetModel.DisambiguationOption.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for CarCommandsDisambiguationSnippetModel.DisambiguationOption.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_237839444 + 4 * byte_2378521B3[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_237839478 + 4 * byte_2378521AE[v4]))();
}

uint64_t sub_237839478(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_237839480(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x237839488);
  return result;
}

uint64_t sub_237839494(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23783949CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2378394A0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2378394A8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CarCommandsDisambiguationSnippetModel.DisambiguationOption.CodingKeys()
{
  return &type metadata for CarCommandsDisambiguationSnippetModel.DisambiguationOption.CodingKeys;
}

ValueMetadata *type metadata accessor for CarCommandsDisambiguationSnippetModel.CodingKeys()
{
  return &type metadata for CarCommandsDisambiguationSnippetModel.CodingKeys;
}

uint64_t getEnumTagSinglePayload for CarCommandsGaugeSnippetModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for CarCommandsGaugeSnippetModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2378395BC + 4 * byte_2378521BD[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_2378395F0 + 4 * byte_2378521B8[v4]))();
}

uint64_t sub_2378395F0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2378395F8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x237839600);
  return result;
}

uint64_t sub_23783960C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x237839614);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_237839618(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_237839620(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23783962C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_237839634(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CarCommandsGaugeSnippetModel.CodingKeys()
{
  return &type metadata for CarCommandsGaugeSnippetModel.CodingKeys;
}

uint64_t getEnumTagSinglePayload for CarCommandsToggleSnippetModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for CarCommandsToggleSnippetModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_237839728 + 4 * byte_2378521C7[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_23783975C + 4 * byte_2378521C2[v4]))();
}

uint64_t sub_23783975C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_237839764(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23783976CLL);
  return result;
}

uint64_t sub_237839778(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x237839780);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_237839784(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23783978C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CarCommandsToggleSnippetModel.CodingKeys()
{
  return &type metadata for CarCommandsToggleSnippetModel.CodingKeys;
}

_BYTE *sub_2378397A8(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CarCommandsAppPunchoutSnippetModel.CodingKeys()
{
  return &type metadata for CarCommandsAppPunchoutSnippetModel.CodingKeys;
}

uint64_t _s22CarCommandsUIFramework37CarCommandsDisambiguationSnippetModelV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s22CarCommandsUIFramework37CarCommandsDisambiguationSnippetModelV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2378398A0 + 4 * byte_2378521D1[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2378398D4 + 4 * byte_2378521CC[v4]))();
}

uint64_t sub_2378398D4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2378398DC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2378398E4);
  return result;
}

uint64_t sub_2378398F0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2378398F8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2378398FC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_237839904(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CarCommandsConfirmationSnippetModel.CodingKeys()
{
  return &type metadata for CarCommandsConfirmationSnippetModel.CodingKeys;
}

unint64_t sub_237839924()
{
  unint64_t result;

  result = qword_256818100;
  if (!qword_256818100)
  {
    result = MEMORY[0x23B81CC08](&unk_237852630, &type metadata for CarCommandsConfirmationSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818100);
  }
  return result;
}

unint64_t sub_23783996C()
{
  unint64_t result;

  result = qword_256818108;
  if (!qword_256818108)
  {
    result = MEMORY[0x23B81CC08](&unk_2378526E8, &type metadata for CarCommandsAppPunchoutSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818108);
  }
  return result;
}

unint64_t sub_2378399B4()
{
  unint64_t result;

  result = qword_256818110;
  if (!qword_256818110)
  {
    result = MEMORY[0x23B81CC08](&unk_2378527A0, &type metadata for CarCommandsToggleSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818110);
  }
  return result;
}

unint64_t sub_2378399FC()
{
  unint64_t result;

  result = qword_256818118;
  if (!qword_256818118)
  {
    result = MEMORY[0x23B81CC08](&unk_237852858, &type metadata for CarCommandsGaugeSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818118);
  }
  return result;
}

unint64_t sub_237839A44()
{
  unint64_t result;

  result = qword_256818120;
  if (!qword_256818120)
  {
    result = MEMORY[0x23B81CC08](&unk_237852910, &type metadata for CarCommandsDisambiguationSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818120);
  }
  return result;
}

unint64_t sub_237839A8C()
{
  unint64_t result;

  result = qword_256818128;
  if (!qword_256818128)
  {
    result = MEMORY[0x23B81CC08](&unk_2378529C8, &type metadata for CarCommandsDisambiguationSnippetModel.DisambiguationOption.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818128);
  }
  return result;
}

unint64_t sub_237839AD4()
{
  unint64_t result;

  result = qword_256818130;
  if (!qword_256818130)
  {
    result = MEMORY[0x23B81CC08](&unk_237852938, &type metadata for CarCommandsDisambiguationSnippetModel.DisambiguationOption.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818130);
  }
  return result;
}

unint64_t sub_237839B1C()
{
  unint64_t result;

  result = qword_256818138;
  if (!qword_256818138)
  {
    result = MEMORY[0x23B81CC08](&unk_237852960, &type metadata for CarCommandsDisambiguationSnippetModel.DisambiguationOption.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818138);
  }
  return result;
}

unint64_t sub_237839B64()
{
  unint64_t result;

  result = qword_256818140;
  if (!qword_256818140)
  {
    result = MEMORY[0x23B81CC08](&unk_237852880, &type metadata for CarCommandsDisambiguationSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818140);
  }
  return result;
}

unint64_t sub_237839BAC()
{
  unint64_t result;

  result = qword_256818148;
  if (!qword_256818148)
  {
    result = MEMORY[0x23B81CC08](&unk_2378528A8, &type metadata for CarCommandsDisambiguationSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818148);
  }
  return result;
}

unint64_t sub_237839BF4()
{
  unint64_t result;

  result = qword_256818150;
  if (!qword_256818150)
  {
    result = MEMORY[0x23B81CC08](&unk_2378527C8, &type metadata for CarCommandsGaugeSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818150);
  }
  return result;
}

unint64_t sub_237839C3C()
{
  unint64_t result;

  result = qword_256818158;
  if (!qword_256818158)
  {
    result = MEMORY[0x23B81CC08](&unk_2378527F0, &type metadata for CarCommandsGaugeSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818158);
  }
  return result;
}

unint64_t sub_237839C84()
{
  unint64_t result;

  result = qword_256818160;
  if (!qword_256818160)
  {
    result = MEMORY[0x23B81CC08](&unk_237852710, &type metadata for CarCommandsToggleSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818160);
  }
  return result;
}

unint64_t sub_237839CCC()
{
  unint64_t result;

  result = qword_256818168;
  if (!qword_256818168)
  {
    result = MEMORY[0x23B81CC08](&unk_237852738, &type metadata for CarCommandsToggleSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818168);
  }
  return result;
}

unint64_t sub_237839D14()
{
  unint64_t result;

  result = qword_256818170;
  if (!qword_256818170)
  {
    result = MEMORY[0x23B81CC08](&unk_237852658, &type metadata for CarCommandsAppPunchoutSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818170);
  }
  return result;
}

unint64_t sub_237839D5C()
{
  unint64_t result;

  result = qword_256818178;
  if (!qword_256818178)
  {
    result = MEMORY[0x23B81CC08](&unk_237852680, &type metadata for CarCommandsAppPunchoutSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818178);
  }
  return result;
}

unint64_t sub_237839DA4()
{
  unint64_t result;

  result = qword_256818180;
  if (!qword_256818180)
  {
    result = MEMORY[0x23B81CC08](&unk_2378525A0, &type metadata for CarCommandsConfirmationSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818180);
  }
  return result;
}

unint64_t sub_237839DEC()
{
  unint64_t result;

  result = qword_256818188;
  if (!qword_256818188)
  {
    result = MEMORY[0x23B81CC08](&unk_2378525C8, &type metadata for CarCommandsConfirmationSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818188);
  }
  return result;
}

uint64_t sub_237839E30(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x546D7269666E6F63 && a2 == 0xEB00000000747865;
  if (v2 || (sub_237851C98() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x74786554796E6564 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_237851C98();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_237839F38(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x54656D614E707061 && a2 == 0xEB00000000747865;
  if (v2 || (sub_237851C98() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x746E656449707061 && a2 == 0xED00007265696669)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_237851C98();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23783A064(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x54656D614E726163 && a2 == 0xEB00000000747865;
  if (v2 || (sub_237851C98() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x5465746174536E6FLL && a2 == 0xEB00000000747865 || (sub_237851C98() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x657461745366666FLL && a2 == 0xEC00000074786554 || (sub_237851C98() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000237854B20 || (sub_237851C98() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000237854B40 || (sub_237851C98() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 1850700649 && a2 == 0xE400000000000000 || (sub_237851C98() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6449707061 && a2 == 0xE500000000000000 || (sub_237851C98() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD000000000000023 && a2 == 0x8000000237854B60)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else
  {
    v6 = sub_237851C98();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 7;
    else
      return 8;
  }
}

uint64_t sub_23783A3B8(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x656D614E726163 && a2 == 0xE700000000000000;
  if (v2 || (sub_237851C98() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x547972616D697270 && a2 == 0xEB00000000747865 || (sub_237851C98() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7261646E6F636573 && a2 == 0xED00007478655479 || (sub_237851C98() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000237854B90 || (sub_237851C98() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x8000000237854BB0 || (sub_237851C98() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6449707061 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    v6 = sub_237851C98();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 5;
    else
      return 6;
  }
}

uint64_t sub_23783A660(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x656C746974 && a2 == 0xE500000000000000;
  if (v2 || (sub_237851C98() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x8000000237854BD0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_237851C98();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23783A744(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 1954047348 && a2 == 0xE400000000000000;
  if (v2 || (sub_237851C98() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x8000000237854BF0 || (sub_237851C98() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD00000000000001CLL && a2 == 0x8000000237854C10)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_237851C98();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t AudibleSignalStatusSnippet.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_237830DF8(a1, a2);
}

double AudibleSignalStatusSnippet.body.getter@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double result;
  uint64_t v7;
  uint64_t v8;

  type metadata accessor for CarCommandsToggleSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B08);
  sub_2378516BC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  sub_2378516BC();
  sub_2378516BC();
  sub_2378516BC();
  sub_2378516BC();
  sub_2378516BC();
  sub_2378516BC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  sub_2378516BC();
  sub_237851A7C();
  sub_23783108C();
  v2 = sub_237851770();
  v4 = v3;
  v5 = swift_bridgeObjectRetain();
  result = 9.07234538e223;
  *(_OWORD *)a1 = xmmword_237852BE0;
  *(_OWORD *)(a1 + 16) = xmmword_237852BF0;
  *(_WORD *)(a1 + 32) = 129;
  *(_BYTE *)(a1 + 34) = 1;
  *(_QWORD *)(a1 + 40) = v7;
  *(_QWORD *)(a1 + 48) = v8;
  *(_QWORD *)(a1 + 56) = v7;
  *(_QWORD *)(a1 + 64) = v8;
  *(_QWORD *)(a1 + 72) = v7;
  *(_QWORD *)(a1 + 80) = v8;
  *(_QWORD *)(a1 + 88) = v7;
  *(_QWORD *)(a1 + 96) = v8;
  *(_QWORD *)(a1 + 104) = v7;
  *(_QWORD *)(a1 + 112) = v8;
  *(_QWORD *)(a1 + 120) = 0xD000000000000045;
  *(_QWORD *)(a1 + 128) = 0x8000000237854C30;
  *(_QWORD *)(a1 + 136) = v7;
  *(_QWORD *)(a1 + 144) = v8;
  *(_QWORD *)(a1 + 152) = v7;
  *(_QWORD *)(a1 + 160) = v8;
  *(_BYTE *)(a1 + 168) = v7;
  *(_QWORD *)(a1 + 176) = 0;
  *(_QWORD *)(a1 + 184) = v7;
  *(_QWORD *)(a1 + 192) = v5;
  *(_QWORD *)(a1 + 200) = 0;
  *(_QWORD *)(a1 + 208) = v2;
  *(_QWORD *)(a1 + 216) = v4;
  return result;
}

uint64_t sub_23783AAB0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t getEnumTagSinglePayload for AudibleSignalStatusSnippet()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23783AAD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CarCommandsToggleSnippetModel(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for AudibleSignalStatusSnippet()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23783AB18(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CarCommandsToggleSnippetModel(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for AudibleSignalStatusSnippet()
{
  uint64_t result;

  result = qword_2568181E8;
  if (!qword_2568181E8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23783AB94(__int128 *a1, _BYTE *a2, char a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  unint64_t v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE v34[4];
  int v35;
  _BYTE *v36;
  void (*v37)(_BYTE *, uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  _QWORD v42[4];
  char v43;

  v6 = sub_237851710();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = &v34[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818220);
  MEMORY[0x24BDAC7A8](v10);
  v12 = &v34[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_23783AF90(a1, (uint64_t)v42);
  v13 = v43;
  if ((v43 & 0x80) == 0)
  {
    swift_bridgeObjectRetain();
    sub_2378518FC();
    v14 = *MEMORY[0x24BDF4068];
    v15 = sub_237851920();
    v16 = *(_QWORD *)(v15 - 8);
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v16 + 104))(v12, v14, v15);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v12, 0, 1, v15);
    v17 = sub_237851914();
    swift_release();
    sub_23783AFA8((uint64_t)a1);
    (*(void (**)(_BYTE *, uint64_t))(v7 + 8))(a2, v6);
LABEL_15:
    sub_23783B004((uint64_t)v12);
    return v17;
  }
  v43 &= ~0x80u;
  if ((a3 & 1) != 0)
  {
    v35 = v13 & 1;
    v18 = v42[0];
    v19 = v42[1];
  }
  else
  {
    v35 = 0;
    v18 = v42[2];
    v19 = v42[3];
  }
  swift_bridgeObjectRetain();
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x24BDEB400], v6);
  v20 = sub_237851704();
  v37 = *(void (**)(_BYTE *, uint64_t))(v7 + 8);
  v37(v9, v6);
  if ((v20 & 1) != 0)
    v21 = 0x746867696C5FLL;
  else
    v21 = 0x6B7261645FLL;
  if ((v20 & 1) != 0)
    v22 = 0xE600000000000000;
  else
    v22 = 0xE500000000000000;
  v23 = objc_allocWithZone(MEMORY[0x24BDD1488]);
  v24 = sub_237851A94();
  v36 = a2;
  v25 = (void *)v24;
  v26 = objc_msgSend(v23, sel_initWithPath_, v24);

  if (!v35)
  {
    v40 = v21;
    v41 = v22;
    v38 = v18;
    v39 = v19;
    swift_bridgeObjectRetain();
    v38 = sub_237851ADC();
    v39 = v28;
    sub_237851AB8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v29 = v26;
    sub_237851938();
    v30 = *MEMORY[0x24BDF4068];
    v31 = sub_237851920();
    v32 = *(_QWORD *)(v31 - 8);
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v32 + 104))(v12, v30, v31);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v32 + 56))(v12, 0, 1, v31);
    v17 = sub_237851914();
    swift_release();
    sub_23783AFA8((uint64_t)a1);

    v37(v36, v6);
    goto LABEL_15;
  }
  v40 = v21;
  v41 = v22;
  v38 = v18;
  v39 = v19;
  swift_bridgeObjectRetain();
  v38 = sub_237851ADC();
  v39 = v27;
  sub_237851AB8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v17 = sub_237851938();
  sub_23783AFA8((uint64_t)a1);
  v37(v36, v6);
  return v17;
}

uint64_t sub_23783AF90(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_BYTE *)(a2 + 32) = *((_BYTE *)a1 + 32);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_23783AFA8(uint64_t a1)
{
  sub_23783AFDC();
  return a1;
}

uint64_t sub_23783AFDC()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23783B004(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818220);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t initializeBufferWithCopyOfBuffer for CarCommandsThumbnail(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_23783B074()
{
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t destroy for CarCommandsThumbnail()
{
  return sub_23783AFDC();
}

uint64_t initializeWithCopy for CarCommandsThumbnail(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v3 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  v6 = a2[3];
  v7 = *((_BYTE *)a2 + 32);
  sub_23783B074();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for CarCommandsThumbnail(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v3 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  v6 = a2[3];
  v7 = *((_BYTE *)a2 + 32);
  sub_23783B074();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  sub_23783AFDC();
  return a1;
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

uint64_t assignWithTake for CarCommandsThumbnail(uint64_t a1, uint64_t a2)
{
  char v3;
  __int128 v4;

  v3 = *(_BYTE *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_BYTE *)(a1 + 32) = v3;
  sub_23783AFDC();
  return a1;
}

uint64_t getEnumTagSinglePayload for CarCommandsThumbnail(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7F && *(_BYTE *)(a1 + 33))
    return (*(_DWORD *)a1 + 127);
  v3 = (*(_BYTE *)(a1 + 32) & 0x7E | (*(unsigned __int8 *)(a1 + 32) >> 7)) ^ 0x7F;
  if (v3 >= 0x7E)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for CarCommandsThumbnail(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7E)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 127;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7F)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0x7F)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
    {
      *(_OWORD *)result = 0u;
      *(_OWORD *)(result + 16) = 0u;
      *(_BYTE *)(result + 32) = 2 * (((-a2 >> 1) & 0x3F) - ((_BYTE)a2 << 6));
    }
  }
  return result;
}

uint64_t sub_23783B288(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32) >> 7;
}

uint64_t sub_23783B294(uint64_t result)
{
  *(_BYTE *)(result + 32) &= ~0x80u;
  return result;
}

uint64_t sub_23783B2A4(uint64_t result, char a2)
{
  *(_BYTE *)(result + 32) = *(_BYTE *)(result + 32) & 1 | (a2 << 7);
  return result;
}

ValueMetadata *type metadata accessor for CarCommandsThumbnail()
{
  return &type metadata for CarCommandsThumbnail;
}

uint64_t CarNameDisambiguationSnippet.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23783B658(a1, a2, type metadata accessor for CarCommandsDisambiguationSnippetModel);
}

uint64_t CarNameDisambiguationSnippet.body.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t result;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v32 = type metadata accessor for CarCommandsDisambiguationSnippetModel.DisambiguationOption(0);
  v2 = *(_QWORD *)(v32 - 8);
  MEMORY[0x24BDAC7A8](v32);
  v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for CarCommandsDisambiguationSnippet.DisambiguationOption();
  v31 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (uint64_t *)((char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  sub_2378516BC();
  v8 = v34;
  v9 = v35;
  type metadata accessor for CarCommandsDisambiguationSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817C88);
  sub_2378516BC();
  v10 = *(_QWORD *)(v34 + 16);
  if (v10)
  {
    v27 = v9;
    v28 = v8;
    v29 = a1;
    v33 = MEMORY[0x24BEE4AF8];
    v11 = v34;
    sub_23783B5BC(0, v10, 0);
    v12 = *(unsigned __int8 *)(v2 + 80);
    v26 = v11;
    v13 = v11 + ((v12 + 32) & ~v12);
    v30 = *(_QWORD *)(v2 + 72);
    do
    {
      sub_23783B5D8(v13, (uint64_t)v4);
      sub_2378516BC();
      v14 = v34;
      v15 = v35;
      v16 = (char *)v7 + *(int *)(v5 + 20);
      v17 = sub_2378519C8();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v16, 1, 1, v17);
      sub_2378516BC();
      v18 = v34;
      v19 = v35;
      *v7 = v14;
      v7[1] = v15;
      v20 = (_QWORD *)((char *)v7 + *(int *)(v5 + 24));
      *v20 = v18;
      v20[1] = v19;
      sub_23783B61C((uint64_t)v4);
      v21 = v33;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_23783B5BC(0, *(_QWORD *)(v21 + 16) + 1, 1);
        v21 = v33;
      }
      v23 = *(_QWORD *)(v21 + 16);
      v22 = *(_QWORD *)(v21 + 24);
      if (v23 >= v22 >> 1)
      {
        sub_23783B5BC(v22 > 1, v23 + 1, 1);
        v21 = v33;
      }
      *(_QWORD *)(v21 + 16) = v23 + 1;
      sub_23783B658((uint64_t)v7, v21+ ((*(unsigned __int8 *)(v31 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80))+ *(_QWORD *)(v31 + 72) * v23, (uint64_t (*)(_QWORD))type metadata accessor for CarCommandsDisambiguationSnippet.DisambiguationOption);
      v13 += v30;
      --v10;
    }
    while (v10);
    swift_bridgeObjectRelease();
    v8 = v28;
    a1 = v29;
    v9 = v27;
  }
  else
  {
    swift_bridgeObjectRelease();
    v21 = MEMORY[0x24BEE4AF8];
  }
  sub_237851A7C();
  sub_23783108C();
  result = sub_237851770();
  *a1 = v8;
  a1[1] = v9;
  a1[2] = v21;
  a1[3] = 0xD00000000000003FLL;
  a1[4] = 0x8000000237854CE0;
  a1[5] = result;
  a1[6] = v25;
  return result;
}

uint64_t sub_23783B5BC(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_23783DF4C(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_23783B5D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CarCommandsDisambiguationSnippetModel.DisambiguationOption(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23783B61C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for CarCommandsDisambiguationSnippetModel.DisambiguationOption(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23783B658(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_23783B69C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for CarNameDisambiguationSnippet(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = type metadata accessor for CarCommandsDisambiguationSnippetModel(0);
  v5 = *(_DWORD *)(*(_QWORD *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = v4;
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(v6 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817C88);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t destroy for CarNameDisambiguationSnippet(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  v3 = a1 + *(int *)(type metadata accessor for CarCommandsDisambiguationSnippetModel(0) + 20);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817C88);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

uint64_t initializeWithCopy for CarNameDisambiguationSnippet(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  v5 = *(int *)(type metadata accessor for CarCommandsDisambiguationSnippetModel(0) + 20);
  v6 = a1 + v5;
  v7 = a2 + v5;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817C88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v6, v7, v8);
  return a1;
}

uint64_t assignWithCopy for CarNameDisambiguationSnippet(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  v5 = *(int *)(type metadata accessor for CarCommandsDisambiguationSnippetModel(0) + 20);
  v6 = a1 + v5;
  v7 = a2 + v5;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817C88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 24))(v6, v7, v8);
  return a1;
}

uint64_t initializeWithTake for CarNameDisambiguationSnippet(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  v5 = *(int *)(type metadata accessor for CarCommandsDisambiguationSnippetModel(0) + 20);
  v6 = a1 + v5;
  v7 = a2 + v5;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817C88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for CarNameDisambiguationSnippet(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  v5 = *(int *)(type metadata accessor for CarCommandsDisambiguationSnippetModel(0) + 20);
  v6 = a1 + v5;
  v7 = a2 + v5;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817C88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 40))(v6, v7, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for CarNameDisambiguationSnippet()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23783B9F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CarCommandsDisambiguationSnippetModel(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for CarNameDisambiguationSnippet()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23783BA40(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CarCommandsDisambiguationSnippetModel(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for CarNameDisambiguationSnippet()
{
  uint64_t result;

  result = qword_256818280;
  if (!qword_256818280)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23783BABC()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for CarCommandsDisambiguationSnippetModel(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_23783BB28()
{
  unint64_t result;

  result = qword_2568182B8;
  if (!qword_2568182B8)
  {
    result = MEMORY[0x23B81CC08](&protocol conformance descriptor for CarCommandsDisambiguationSnippet, &type metadata for CarCommandsDisambiguationSnippet);
    atomic_store(result, (unint64_t *)&qword_2568182B8);
  }
  return result;
}

uint64_t LockStatusSnippet.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_237830DF8(a1, a2);
}

double LockStatusSnippet.body.getter@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double result;
  uint64_t v7;
  uint64_t v8;

  type metadata accessor for CarCommandsToggleSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B08);
  sub_2378516BC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  sub_2378516BC();
  sub_2378516BC();
  sub_2378516BC();
  sub_2378516BC();
  sub_2378516BC();
  sub_2378516BC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  sub_2378516BC();
  sub_237851A7C();
  sub_23783108C();
  v2 = sub_237851770();
  v4 = v3;
  v5 = swift_bridgeObjectRetain();
  *(_QWORD *)&result = 1801678700;
  *(_OWORD *)a1 = xmmword_237852D20;
  *(_OWORD *)(a1 + 16) = xmmword_237852D30;
  *(_WORD *)(a1 + 32) = 128;
  *(_BYTE *)(a1 + 34) = 1;
  *(_QWORD *)(a1 + 40) = v7;
  *(_QWORD *)(a1 + 48) = v8;
  *(_QWORD *)(a1 + 56) = v7;
  *(_QWORD *)(a1 + 64) = v8;
  *(_QWORD *)(a1 + 72) = v7;
  *(_QWORD *)(a1 + 80) = v8;
  *(_QWORD *)(a1 + 88) = v7;
  *(_QWORD *)(a1 + 96) = v8;
  *(_QWORD *)(a1 + 104) = v7;
  *(_QWORD *)(a1 + 112) = v8;
  *(_QWORD *)(a1 + 120) = 0xD00000000000003CLL;
  *(_QWORD *)(a1 + 128) = 0x8000000237854D20;
  *(_QWORD *)(a1 + 136) = v7;
  *(_QWORD *)(a1 + 144) = v8;
  *(_QWORD *)(a1 + 152) = v7;
  *(_QWORD *)(a1 + 160) = v8;
  *(_BYTE *)(a1 + 168) = v7;
  *(_QWORD *)(a1 + 176) = 0;
  *(_QWORD *)(a1 + 184) = v7;
  *(_QWORD *)(a1 + 192) = v5;
  *(_QWORD *)(a1 + 200) = 0;
  *(_QWORD *)(a1 + 208) = v2;
  *(_QWORD *)(a1 + 216) = v4;
  return result;
}

uint64_t sub_23783BD88()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t getEnumTagSinglePayload for LockStatusSnippet()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23783BDA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CarCommandsToggleSnippetModel(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for LockStatusSnippet()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23783BDF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CarCommandsToggleSnippetModel(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for LockStatusSnippet()
{
  uint64_t result;

  result = qword_256818318;
  if (!qword_256818318)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t ClimateStatusSnippet.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_237830DF8(a1, a2);
}

double ClimateStatusSnippet.body.getter@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double result;
  uint64_t v7;
  uint64_t v8;

  type metadata accessor for CarCommandsToggleSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B08);
  sub_2378516BC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  sub_2378516BC();
  sub_2378516BC();
  sub_2378516BC();
  sub_2378516BC();
  sub_2378516BC();
  sub_2378516BC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  sub_2378516BC();
  sub_237851A7C();
  sub_23783108C();
  v2 = sub_237851770();
  v4 = v3;
  v5 = swift_bridgeObjectRetain();
  result = 3.51146621e151;
  *(_OWORD *)a1 = xmmword_237852DC0;
  *(_OWORD *)(a1 + 16) = xmmword_237852DD0;
  *(_WORD *)(a1 + 32) = 128;
  *(_BYTE *)(a1 + 34) = 1;
  *(_QWORD *)(a1 + 40) = v7;
  *(_QWORD *)(a1 + 48) = v8;
  *(_QWORD *)(a1 + 56) = v7;
  *(_QWORD *)(a1 + 64) = v8;
  *(_QWORD *)(a1 + 72) = v7;
  *(_QWORD *)(a1 + 80) = v8;
  *(_QWORD *)(a1 + 88) = v7;
  *(_QWORD *)(a1 + 96) = v8;
  *(_QWORD *)(a1 + 104) = v7;
  *(_QWORD *)(a1 + 112) = v8;
  *(_QWORD *)(a1 + 120) = 0xD00000000000003FLL;
  *(_QWORD *)(a1 + 128) = 0x8000000237854D60;
  *(_QWORD *)(a1 + 136) = v7;
  *(_QWORD *)(a1 + 144) = v8;
  *(_QWORD *)(a1 + 152) = v7;
  *(_QWORD *)(a1 + 160) = v8;
  *(_BYTE *)(a1 + 168) = v7;
  *(_QWORD *)(a1 + 176) = 0;
  *(_QWORD *)(a1 + 184) = v7;
  *(_QWORD *)(a1 + 192) = v5;
  *(_QWORD *)(a1 + 200) = 0;
  *(_QWORD *)(a1 + 208) = v2;
  *(_QWORD *)(a1 + 216) = v4;
  return result;
}

uint64_t sub_23783C088()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t getEnumTagSinglePayload for ClimateStatusSnippet()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23783C0A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CarCommandsToggleSnippetModel(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for ClimateStatusSnippet()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23783C0F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CarCommandsToggleSnippetModel(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for ClimateStatusSnippet()
{
  uint64_t result;

  result = qword_2568183A8;
  if (!qword_2568183A8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23783C16C()
{
  uint64_t result;

  sub_23783FC98();
  result = sub_237851B0C();
  qword_2568183E0 = result;
  return result;
}

uint64_t sub_23783C1D4()
{
  uint64_t v0;
  id v1;

  v0 = sub_2378516EC();
  __swift_allocate_value_buffer(v0, qword_2568183E8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2568183E8);
  if (qword_256817AF0 != -1)
    swift_once();
  v1 = (id)qword_2568183E0;
  return sub_2378516F8();
}

void sub_23783C254()
{
  off_256818400 = (_UNKNOWN *)MEMORY[0x24BEE4B00];
}

uint64_t sub_23783C268(uint64_t a1)
{
  _QWORD *v2;
  unint64_t v3;
  char v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  unint64_t v13;
  unint64_t v14;
  char *v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  char *v21;
  unint64_t v22;
  unint64_t v23;
  char *v24;
  unint64_t v25;
  unint64_t v26;
  char *v27;
  unint64_t v28;
  unint64_t v29;
  _QWORD *v30;
  unint64_t v31;
  unint64_t v32;
  _QWORD *v33;
  unint64_t v34;
  unint64_t v35;
  _QWORD *v36;
  unint64_t v37;
  unint64_t v38;
  _QWORD *v39;
  unint64_t v40;
  unint64_t v41;
  _QWORD *v42;
  unint64_t v43;
  unint64_t v44;
  _QWORD *v45;
  unint64_t v46;
  unint64_t v47;
  _QWORD *v48;
  unint64_t v49;
  unint64_t v50;
  _QWORD *v51;
  unint64_t v52;
  unint64_t v53;
  _QWORD *v54;
  unint64_t v55;
  unint64_t v56;
  char *v57;
  unint64_t v58;
  unint64_t v59;
  _QWORD *v60;
  unint64_t v61;
  unint64_t v62;
  _QWORD *v63;
  unint64_t v64;
  unint64_t v65;
  _QWORD *v66;
  unint64_t v67;
  unint64_t v68;
  _QWORD *v69;
  unint64_t v70;
  unint64_t v71;
  char *v72;
  unint64_t v73;
  unint64_t v74;
  _QWORD *v75;
  unint64_t v76;
  unint64_t v77;
  char *v78;
  unint64_t v79;
  unint64_t v80;
  _QWORD *v81;
  unint64_t v82;
  unint64_t v83;
  _QWORD *v84;
  uint64_t v85;
  uint64_t v86;
  char isUniquelyReferenced_nonNull_native;
  void *v89;
  uint64_t v90[3];

  if (qword_256817B00 != -1)
    swift_once();
  swift_beginAccess();
  v2 = off_256818400;
  if (!*((_QWORD *)off_256818400 + 2) || (v3 = sub_23783E294(a1), (v4 & 1) == 0))
  {
    swift_endAccess();
    if ((a1 & 1) != 0)
    {
      v6 = sub_23783D7C0(0, 1, 1, MEMORY[0x24BEE4AF8]);
      v8 = v6[2];
      v7 = v6[3];
      if (v8 >= v7 >> 1)
        v6 = sub_23783D7C0((_QWORD *)(v7 > 1), v8 + 1, 1, v6);
      v6[2] = v8 + 1;
      v9 = &v6[2 * v8];
      v9[4] = 0x657372617023;
      v9[5] = 0xE600000000000000;
      if ((a1 & 2) == 0)
      {
LABEL_17:
        if ((a1 & 4) != 0)
        {
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v6 = sub_23783D7C0(0, v6[2] + 1, 1, v6);
          v14 = v6[2];
          v13 = v6[3];
          if (v14 >= v13 >> 1)
            v6 = sub_23783D7C0((_QWORD *)(v13 > 1), v14 + 1, 1, v6);
          v6[2] = v14 + 1;
          v15 = (char *)&v6[2 * v14];
          strcpy(v15 + 32, "#appResolution");
          v15[47] = -18;
          if ((a1 & 8) == 0)
          {
LABEL_19:
            if ((a1 & 0x10) == 0)
              goto LABEL_20;
            goto LABEL_35;
          }
        }
        else if ((a1 & 8) == 0)
        {
          goto LABEL_19;
        }
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v6 = sub_23783D7C0(0, v6[2] + 1, 1, v6);
        v17 = v6[2];
        v16 = v6[3];
        if (v17 >= v16 >> 1)
          v6 = sub_23783D7C0((_QWORD *)(v16 > 1), v17 + 1, 1, v6);
        v6[2] = v17 + 1;
        v18 = &v6[2 * v17];
        v18[4] = 0x747865746E6F6323;
        v18[5] = 0xE800000000000000;
        if ((a1 & 0x10) == 0)
        {
LABEL_20:
          if ((a1 & 0x20) == 0)
            goto LABEL_21;
          goto LABEL_40;
        }
LABEL_35:
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v6 = sub_23783D7C0(0, v6[2] + 1, 1, v6);
        v20 = v6[2];
        v19 = v6[3];
        if (v20 >= v19 >> 1)
          v6 = sub_23783D7C0((_QWORD *)(v19 > 1), v20 + 1, 1, v6);
        v6[2] = v20 + 1;
        v21 = (char *)&v6[2 * v20];
        strcpy(v21 + 32, "#getPowerLevel");
        v21[47] = -18;
        if ((a1 & 0x20) == 0)
        {
LABEL_21:
          if ((a1 & 0x40) == 0)
            goto LABEL_22;
          goto LABEL_45;
        }
LABEL_40:
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v6 = sub_23783D7C0(0, v6[2] + 1, 1, v6);
        v23 = v6[2];
        v22 = v6[3];
        if (v23 >= v22 >> 1)
          v6 = sub_23783D7C0((_QWORD *)(v22 > 1), v23 + 1, 1, v6);
        v6[2] = v23 + 1;
        v24 = (char *)&v6[2 * v23];
        strcpy(v24 + 32, "#getLockStatus");
        v24[47] = -18;
        if ((a1 & 0x40) == 0)
        {
LABEL_22:
          if ((a1 & 0x80) == 0)
            goto LABEL_23;
          goto LABEL_50;
        }
LABEL_45:
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v6 = sub_23783D7C0(0, v6[2] + 1, 1, v6);
        v26 = v6[2];
        v25 = v6[3];
        if (v26 >= v25 >> 1)
          v6 = sub_23783D7C0((_QWORD *)(v25 > 1), v26 + 1, 1, v6);
        v6[2] = v26 + 1;
        v27 = (char *)&v6[2 * v26];
        strcpy(v27 + 32, "#setLockStatus");
        v27[47] = -18;
        if ((a1 & 0x80) == 0)
        {
LABEL_23:
          if ((a1 & 0x100) == 0)
            goto LABEL_60;
          goto LABEL_55;
        }
LABEL_50:
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v6 = sub_23783D7C0(0, v6[2] + 1, 1, v6);
        v29 = v6[2];
        v28 = v6[3];
        if (v29 >= v28 >> 1)
          v6 = sub_23783D7C0((_QWORD *)(v28 > 1), v29 + 1, 1, v6);
        v6[2] = v29 + 1;
        v30 = &v6[2 * v29];
        v30[4] = 0x7461766974636123;
        v30[5] = 0xEF6C616E67695365;
        if ((a1 & 0x100) == 0)
        {
LABEL_60:
          if ((a1 & 0x400) != 0)
          {
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v6 = sub_23783D7C0(0, v6[2] + 1, 1, v6);
            v35 = v6[2];
            v34 = v6[3];
            if (v35 >= v34 >> 1)
              v6 = sub_23783D7C0((_QWORD *)(v34 > 1), v35 + 1, 1, v6);
            v6[2] = v35 + 1;
            v36 = &v6[2 * v35];
            v36[4] = 0xD000000000000016;
            v36[5] = 0x8000000237855130;
            if ((a1 & 0x800) == 0)
            {
LABEL_62:
              if ((a1 & 0x4000) == 0)
                goto LABEL_63;
              goto LABEL_89;
            }
          }
          else if ((a1 & 0x800) == 0)
          {
            goto LABEL_62;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v6 = sub_23783D7C0(0, v6[2] + 1, 1, v6);
          v38 = v6[2];
          v37 = v6[3];
          if (v38 >= v37 >> 1)
            v6 = sub_23783D7C0((_QWORD *)(v37 > 1), v38 + 1, 1, v6);
          v6[2] = v38 + 1;
          v39 = &v6[2 * v38];
          v39[4] = 0xD000000000000010;
          v39[5] = 0x8000000237855110;
          if ((a1 & 0x4000) == 0)
          {
LABEL_63:
            if ((a1 & 0x8000) == 0)
              goto LABEL_64;
            goto LABEL_94;
          }
LABEL_89:
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v6 = sub_23783D7C0(0, v6[2] + 1, 1, v6);
          v41 = v6[2];
          v40 = v6[3];
          if (v41 >= v40 >> 1)
            v6 = sub_23783D7C0((_QWORD *)(v40 > 1), v41 + 1, 1, v6);
          v6[2] = v41 + 1;
          v42 = &v6[2 * v41];
          v42[4] = 0xD000000000000011;
          v42[5] = 0x80000002378550F0;
          if ((a1 & 0x8000) == 0)
          {
LABEL_64:
            if ((a1 & 0x10000) == 0)
              goto LABEL_65;
            goto LABEL_99;
          }
LABEL_94:
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v6 = sub_23783D7C0(0, v6[2] + 1, 1, v6);
          v44 = v6[2];
          v43 = v6[3];
          if (v44 >= v43 >> 1)
            v6 = sub_23783D7C0((_QWORD *)(v43 > 1), v44 + 1, 1, v6);
          v6[2] = v44 + 1;
          v45 = &v6[2 * v44];
          v45[4] = 0xD00000000000001ALL;
          v45[5] = 0x80000002378550D0;
          if ((a1 & 0x10000) == 0)
          {
LABEL_65:
            if ((a1 & 0x20000) == 0)
              goto LABEL_66;
            goto LABEL_104;
          }
LABEL_99:
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v6 = sub_23783D7C0(0, v6[2] + 1, 1, v6);
          v47 = v6[2];
          v46 = v6[3];
          if (v47 >= v46 >> 1)
            v6 = sub_23783D7C0((_QWORD *)(v46 > 1), v47 + 1, 1, v6);
          v6[2] = v47 + 1;
          v48 = &v6[2 * v47];
          v48[4] = 0x6E75725474656723;
          v48[5] = 0xEF7375746174536BLL;
          if ((a1 & 0x20000) == 0)
          {
LABEL_66:
            if ((a1 & 0x40000) == 0)
              goto LABEL_67;
            goto LABEL_109;
          }
LABEL_104:
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v6 = sub_23783D7C0(0, v6[2] + 1, 1, v6);
          v50 = v6[2];
          v49 = v6[3];
          if (v50 >= v49 >> 1)
            v6 = sub_23783D7C0((_QWORD *)(v49 > 1), v50 + 1, 1, v6);
          v6[2] = v50 + 1;
          v51 = &v6[2 * v50];
          v51[4] = 0xD00000000000001CLL;
          v51[5] = 0x80000002378550B0;
          if ((a1 & 0x40000) == 0)
          {
LABEL_67:
            if ((a1 & 0x100000) == 0)
              goto LABEL_68;
            goto LABEL_114;
          }
LABEL_109:
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v6 = sub_23783D7C0(0, v6[2] + 1, 1, v6);
          v53 = v6[2];
          v52 = v6[3];
          if (v53 >= v52 >> 1)
            v6 = sub_23783D7C0((_QWORD *)(v52 > 1), v53 + 1, 1, v6);
          v6[2] = v53 + 1;
          v54 = &v6[2 * v53];
          v54[4] = 0xD000000000000011;
          v54[5] = 0x8000000237855090;
          if ((a1 & 0x100000) == 0)
          {
LABEL_68:
            if ((a1 & 0x80000) == 0)
              goto LABEL_69;
            goto LABEL_119;
          }
LABEL_114:
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v6 = sub_23783D7C0(0, v6[2] + 1, 1, v6);
          v56 = v6[2];
          v55 = v6[3];
          if (v56 >= v55 >> 1)
            v6 = sub_23783D7C0((_QWORD *)(v55 > 1), v56 + 1, 1, v6);
          v6[2] = v56 + 1;
          v57 = (char *)&v6[2 * v56];
          strcpy(v57 + 32, "#openCarPlay");
          v57[45] = 0;
          *((_WORD *)v57 + 23) = -5120;
          if ((a1 & 0x80000) == 0)
          {
LABEL_69:
            if ((a1 & 0x200000) == 0)
              goto LABEL_70;
            goto LABEL_124;
          }
LABEL_119:
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v6 = sub_23783D7C0(0, v6[2] + 1, 1, v6);
          v59 = v6[2];
          v58 = v6[3];
          if (v59 >= v58 >> 1)
            v6 = sub_23783D7C0((_QWORD *)(v58 > 1), v59 + 1, 1, v6);
          v6[2] = v59 + 1;
          v60 = &v6[2 * v59];
          v60[4] = 0xD000000000000019;
          v60[5] = 0x8000000237855070;
          if ((a1 & 0x200000) == 0)
          {
LABEL_70:
            if ((a1 & 0x400000) == 0)
              goto LABEL_71;
            goto LABEL_129;
          }
LABEL_124:
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v6 = sub_23783D7C0(0, v6[2] + 1, 1, v6);
          v62 = v6[2];
          v61 = v6[3];
          if (v62 >= v61 >> 1)
            v6 = sub_23783D7C0((_QWORD *)(v61 > 1), v62 + 1, 1, v6);
          v6[2] = v62 + 1;
          v63 = &v6[2 * v62];
          v63[4] = 0xD000000000000010;
          v63[5] = 0x8000000237855050;
          if ((a1 & 0x400000) == 0)
          {
LABEL_71:
            if ((a1 & 0x4000000) == 0)
              goto LABEL_72;
            goto LABEL_134;
          }
LABEL_129:
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v6 = sub_23783D7C0(0, v6[2] + 1, 1, v6);
          v65 = v6[2];
          v64 = v6[3];
          if (v65 >= v64 >> 1)
            v6 = sub_23783D7C0((_QWORD *)(v64 > 1), v65 + 1, 1, v6);
          v6[2] = v65 + 1;
          v66 = &v6[2 * v65];
          v66[4] = 0xD000000000000014;
          v66[5] = 0x8000000237855030;
          if ((a1 & 0x4000000) == 0)
          {
LABEL_72:
            if ((a1 & 0x8000000) == 0)
              goto LABEL_73;
            goto LABEL_139;
          }
LABEL_134:
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v6 = sub_23783D7C0(0, v6[2] + 1, 1, v6);
          v68 = v6[2];
          v67 = v6[3];
          if (v68 >= v67 >> 1)
            v6 = sub_23783D7C0((_QWORD *)(v67 > 1), v68 + 1, 1, v6);
          v6[2] = v68 + 1;
          v69 = &v6[2 * v68];
          v69[4] = 0x536E614674657323;
          v69[5] = 0xEF73676E69747465;
          if ((a1 & 0x8000000) == 0)
          {
LABEL_73:
            if ((a1 & 0x20000000) == 0)
              goto LABEL_74;
            goto LABEL_144;
          }
LABEL_139:
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v6 = sub_23783D7C0(0, v6[2] + 1, 1, v6);
          v71 = v6[2];
          v70 = v6[3];
          if (v71 >= v70 >> 1)
            v6 = sub_23783D7C0((_QWORD *)(v70 > 1), v71 + 1, 1, v6);
          v6[2] = v71 + 1;
          v72 = (char *)&v6[2 * v71];
          strcpy(v72 + 32, "#setAutoMode");
          v72[45] = 0;
          *((_WORD *)v72 + 23) = -5120;
          if ((a1 & 0x20000000) == 0)
          {
LABEL_74:
            if ((a1 & 0x40000000) == 0)
              goto LABEL_75;
            goto LABEL_149;
          }
LABEL_144:
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v6 = sub_23783D7C0(0, v6[2] + 1, 1, v6);
          v74 = v6[2];
          v73 = v6[3];
          if (v74 >= v73 >> 1)
            v6 = sub_23783D7C0((_QWORD *)(v73 > 1), v74 + 1, 1, v6);
          v6[2] = v74 + 1;
          v75 = &v6[2 * v74];
          v75[4] = 0x6D696C4374657323;
          v75[5] = 0xEF636E7953657461;
          if ((a1 & 0x40000000) == 0)
          {
LABEL_75:
            if ((a1 & 0x10000000) == 0)
              goto LABEL_76;
            goto LABEL_154;
          }
LABEL_149:
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v6 = sub_23783D7C0(0, v6[2] + 1, 1, v6);
          v77 = v6[2];
          v76 = v6[3];
          if (v77 >= v76 >> 1)
            v6 = sub_23783D7C0((_QWORD *)(v76 > 1), v77 + 1, 1, v6);
          v6[2] = v77 + 1;
          v78 = (char *)&v6[2 * v77];
          strcpy(v78 + 32, "#setVentMode");
          v78[45] = 0;
          *((_WORD *)v78 + 23) = -5120;
          if ((a1 & 0x10000000) == 0)
          {
LABEL_76:
            if ((a1 & 0x100000000) == 0)
              goto LABEL_77;
            goto LABEL_159;
          }
LABEL_154:
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v6 = sub_23783D7C0(0, v6[2] + 1, 1, v6);
          v80 = v6[2];
          v79 = v6[3];
          if (v80 >= v79 >> 1)
            v6 = sub_23783D7C0((_QWORD *)(v79 > 1), v80 + 1, 1, v6);
          v6[2] = v80 + 1;
          v81 = &v6[2 * v80];
          v81[4] = 0xD000000000000012;
          v81[5] = 0x8000000237855010;
          if ((a1 & 0x100000000) == 0)
          {
LABEL_77:
            if (!v6[2])
            {
              swift_bridgeObjectRelease();
              return 0;
            }
LABEL_164:
            v90[0] = (uint64_t)v6;
            swift_bridgeObjectRetain();
            sub_23783EE88(v90);
            swift_bridgeObjectRelease();
            __swift_instantiateConcreteTypeFromMangledName(&qword_256818418);
            sub_23783EEF0();
            v5 = sub_237851A88();
            v86 = v85;
            swift_release();
            swift_beginAccess();
            swift_bridgeObjectRetain();
            isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            v89 = off_256818400;
            off_256818400 = (_UNKNOWN *)0x8000000000000000;
            sub_23783E960(v5, v86, a1, isUniquelyReferenced_nonNull_native);
            off_256818400 = v89;
            swift_bridgeObjectRelease();
            swift_endAccess();
            return v5;
          }
LABEL_159:
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v6 = sub_23783D7C0(0, v6[2] + 1, 1, v6);
          v83 = v6[2];
          v82 = v6[3];
          if (v83 >= v82 >> 1)
            v6 = sub_23783D7C0((_QWORD *)(v82 > 1), v83 + 1, 1, v6);
          v6[2] = v83 + 1;
          v84 = &v6[2 * v83];
          v84[4] = 0xD000000000000010;
          v84[5] = 0x8000000237854FF0;
          goto LABEL_164;
        }
LABEL_55:
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v6 = sub_23783D7C0(0, v6[2] + 1, 1, v6);
        v32 = v6[2];
        v31 = v6[3];
        if (v32 >= v31 >> 1)
          v6 = sub_23783D7C0((_QWORD *)(v31 > 1), v32 + 1, 1, v6);
        v6[2] = v32 + 1;
        v33 = &v6[2 * v32];
        v33[4] = 1667462179;
        v33[5] = 0xE400000000000000;
        goto LABEL_60;
      }
    }
    else
    {
      v6 = (_QWORD *)MEMORY[0x24BEE4AF8];
      if ((a1 & 2) == 0)
        goto LABEL_17;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v6 = sub_23783D7C0(0, v6[2] + 1, 1, v6);
    v11 = v6[2];
    v10 = v6[3];
    if (v11 >= v10 >> 1)
      v6 = sub_23783D7C0((_QWORD *)(v10 > 1), v11 + 1, 1, v6);
    v6[2] = v11 + 1;
    v12 = &v6[2 * v11];
    v12[4] = 0x776F6C6623;
    v12[5] = 0xE500000000000000;
    goto LABEL_17;
  }
  v5 = *(_QWORD *)(v2[7] + 16 * v3);
  swift_endAccess();
  swift_bridgeObjectRetain();
  return v5;
}

_QWORD *sub_23783D1E0@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_23783D1EC()
{
  sub_237851CB0();
  sub_237851CC8();
  return sub_237851CD4();
}

uint64_t sub_23783D230()
{
  return sub_237851CC8();
}

uint64_t sub_23783D258()
{
  sub_237851CB0();
  sub_237851CC8();
  return sub_237851CD4();
}

void sub_23783D298(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_23783D2A0@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *sub_23783D2B4@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *sub_23783D2C8@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_23783D2DC(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

_QWORD *sub_23783D30C@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & *result;
  if (v3)
    *v2 &= ~*result;
  *(_QWORD *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_23783D338@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *result;
  v4 = *v2;
  *v2 |= *result;
  v5 = v4 & v3;
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v5 == 0;
  return result;
}

_QWORD *sub_23783D35C(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_23783D370(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *sub_23783D384(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *sub_23783D398@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_23783D3AC(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_23783D3C0(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL sub_23783D3D4(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL sub_23783D3E8()
{
  _QWORD *v0;

  return *v0 == 0;
}

uint64_t sub_23783D3F8()
{
  return sub_237851B48();
}

_QWORD *sub_23783D410(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

_QWORD *sub_23783D424@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_23783D434(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

BOOL sub_23783D440(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23783D454@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = sub_23783FE94(a1);
  result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

void sub_23783D490(os_log_type_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;

  v28 = a3;
  v29 = a4;
  v26 = 47;
  v27 = 0xE100000000000000;
  sub_23783D77C();
  v14 = sub_237851B3C();
  v15 = *(_QWORD *)(v14 + 16);
  if (v15)
  {
    v16 = v14 + 16 * v15;
    v17 = *(_QWORD *)(v16 + 16);
    v18 = *(_QWORD *)(v16 + 24);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_237851AC4();
    sub_237851AC4();
    a5 = v17;
    a6 = v18;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
  }
  v28 = a5;
  v29 = a6;
  v26 = 58;
  v27 = 0xE100000000000000;
  sub_237851C8C();
  sub_237851AC4();
  swift_bridgeObjectRelease();
  sub_237851AC4();
  swift_bridgeObjectRelease();
  sub_23783C268(a2);
  if (v19)
  {
    v26 = 32;
    v27 = 0xE100000000000000;
    sub_237851AC4();
    swift_bridgeObjectRelease();
    sub_237851AC4();
    swift_bridgeObjectRelease();
  }
  if (a9)
  {
    v20 = HIBYTE(a9) & 0xF;
    if ((a9 & 0x2000000000000000) == 0)
      v20 = a8 & 0xFFFFFFFFFFFFLL;
    if (v20)
    {
      v26 = 32;
      v27 = 0xE100000000000000;
      sub_237851AC4();
      sub_237851AC4();
      swift_bridgeObjectRelease();
    }
  }
  v22 = v28;
  v21 = v29;
  swift_bridgeObjectRetain();
  v23 = sub_2378516E0();
  if (os_log_type_enabled(v23, a1))
  {
    v24 = (uint8_t *)swift_slowAlloc();
    v25 = swift_slowAlloc();
    v26 = v25;
    *(_DWORD *)v24 = 136315138;
    swift_bridgeObjectRetain();
    sub_23783D8CC(v22, v21, &v26);
    sub_237851B24();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23782F000, v23, a1, "%s", v24, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B81CC80](v25, -1, -1);
    MEMORY[0x23B81CC80](v24, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

}

unint64_t sub_23783D77C()
{
  unint64_t result;

  result = qword_256818408;
  if (!qword_256818408)
  {
    result = MEMORY[0x23B81CC08](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_256818408);
  }
  return result;
}

_QWORD *sub_23783D7C0(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_256818428);
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
    sub_23783FB50(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_23783D8CC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_23783D99C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_23783DF0C((uint64_t)v12, *a3);
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
      sub_23783DF0C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_23783D99C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_237851B30();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_23783DB54(a5, a6);
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
  v8 = sub_237851BA8();
  if (!v8)
  {
    sub_237851BC0();
    __break(1u);
LABEL_17:
    result = sub_237851BFC();
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

uint64_t sub_23783DB54(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23783DBE8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23783DDC0(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_23783DDC0(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23783DBE8(uint64_t a1, unint64_t a2)
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
      v3 = sub_23783DD5C(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_237851B84();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_237851BC0();
      __break(1u);
LABEL_10:
      v2 = sub_237851AD0();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_237851BFC();
    __break(1u);
LABEL_14:
    result = sub_237851BC0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_23783DD5C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256818410);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23783DDC0(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256818410);
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
  result = sub_237851BFC();
  __break(1u);
  return result;
}

uint64_t sub_23783DF0C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23783DF4C(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  unint64_t v22;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256818450);
  v10 = *(_QWORD *)(type metadata accessor for CarCommandsDisambiguationSnippet.DisambiguationOption() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_34;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(type metadata accessor for CarCommandsDisambiguationSnippet.DisambiguationOption() - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (char *)v13 + v17;
  v19 = (char *)a4 + v17;
  if ((a1 & 1) != 0)
  {
    if (v13 < a4 || v18 >= &v19[*(_QWORD *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v20 = *(_QWORD *)(v16 + 72) * v8;
  v21 = &v18[v20];
  v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  result = sub_237851BFC();
  __break(1u);
  return result;
}

uint64_t sub_23783E12C(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256818428);
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
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_237851BFC();
  __break(1u);
  return result;
}

unint64_t sub_23783E294(uint64_t a1)
{
  uint64_t v2;

  sub_237851CB0();
  sub_237851CC8();
  v2 = sub_237851CD4();
  return sub_23783EA9C(a1, v2);
}

unint64_t sub_23783E2EC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_237851B54();
  return sub_23783EB38(a1, v2);
}

unint64_t sub_23783E31C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_237851CB0();
  sub_237851AAC();
  v4 = sub_237851CD4();
  return sub_23783EBFC(a1, a2, v4);
}

uint64_t sub_23783E380(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int64_t v32;
  _QWORD *v33;
  char v34;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256818430);
  v34 = a2;
  result = sub_237851BE4();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 0;
    v33 = (_QWORD *)(v5 + 64);
    v9 = 1 << *(_BYTE *)(v5 + 32);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v32 = (unint64_t)(v9 + 63) >> 6;
    v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v19 = v18 | (v8 << 6);
      }
      else
      {
        v20 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        result = v5 + 64;
        if (v20 >= v32)
          goto LABEL_33;
        v21 = v33[v20];
        ++v8;
        if (!v21)
        {
          v8 = v20 + 1;
          if (v20 + 1 >= v32)
            goto LABEL_33;
          v21 = v33[v8];
          if (!v21)
          {
            v22 = v20 + 2;
            if (v22 >= v32)
            {
LABEL_33:
              if ((v34 & 1) == 0)
              {
                result = swift_release();
                v3 = v2;
                goto LABEL_40;
              }
              v31 = 1 << *(_BYTE *)(v5 + 32);
              if (v31 >= 64)
                bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v33 = -1 << v31;
              v3 = v2;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v21 = v33[v22];
            if (!v21)
            {
              while (1)
              {
                v8 = v22 + 1;
                if (__OFADD__(v22, 1))
                  goto LABEL_42;
                if (v8 >= v32)
                  goto LABEL_33;
                v21 = v33[v8];
                ++v22;
                if (v21)
                  goto LABEL_30;
              }
            }
            v8 = v22;
          }
        }
LABEL_30:
        v11 = (v21 - 1) & v21;
        v19 = __clz(__rbit64(v21)) + (v8 << 6);
      }
      v27 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8 * v19);
      v28 = (uint64_t *)(*(_QWORD *)(v5 + 56) + 16 * v19);
      v29 = *v28;
      v30 = v28[1];
      if ((v34 & 1) == 0)
        swift_bridgeObjectRetain();
      sub_237851CB0();
      sub_237851CC8();
      result = sub_237851CD4();
      v13 = -1 << *(_BYTE *)(v7 + 32);
      v14 = result & ~v13;
      v15 = v14 >> 6;
      if (((-1 << v14) & ~*(_QWORD *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        v16 = __clz(__rbit64((-1 << v14) & ~*(_QWORD *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v23 = 0;
        v24 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v25 = v15 == v24;
          if (v15 == v24)
            v15 = 0;
          v23 |= v25;
          v26 = *(_QWORD *)(v12 + 8 * v15);
        }
        while (v26 == -1);
        v16 = __clz(__rbit64(~v26)) + (v15 << 6);
      }
      *(_QWORD *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v16) = v27;
      v17 = (_QWORD *)(*(_QWORD *)(v7 + 56) + 16 * v16);
      *v17 = v29;
      v17[1] = v30;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_40:
  *v3 = v7;
  return result;
}

uint64_t sub_23783E664(uint64_t a1, char a2)
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
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  _QWORD *v34;
  _OWORD v35[2];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256818448);
  v6 = sub_237851BE4();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v34 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v33 = (unint64_t)(v8 + 63) >> 6;
    v11 = v6 + 64;
    result = swift_retain();
    v13 = 0;
    while (1)
    {
      if (v10)
      {
        v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v17 = v16 | (v13 << 6);
      }
      else
      {
        v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33)
          goto LABEL_34;
        v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          v13 = v18 + 1;
          if (v18 + 1 >= v33)
            goto LABEL_34;
          v19 = v34[v13];
          if (!v19)
          {
            v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              v3 = v2;
              if ((a2 & 1) != 0)
              {
                v32 = 1 << *(_BYTE *)(v5 + 32);
                if (v32 >= 64)
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v34 = -1 << v32;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                v13 = v20 + 1;
                if (__OFADD__(v20, 1))
                  goto LABEL_41;
                if (v13 >= v33)
                  goto LABEL_34;
                v19 = v34[v13];
                ++v20;
                if (v19)
                  goto LABEL_21;
              }
            }
            v13 = v20;
          }
        }
LABEL_21:
        v10 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      v21 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v17);
      v23 = *v21;
      v22 = v21[1];
      v24 = (_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v17);
      if ((a2 & 1) != 0)
      {
        sub_23783FCD4(v24, v35);
      }
      else
      {
        sub_23783DF0C((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_237851CB0();
      sub_237851AAC();
      result = sub_237851CD4();
      v25 = -1 << *(_BYTE *)(v7 + 32);
      v26 = result & ~v25;
      v27 = v26 >> 6;
      if (((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        v14 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v28 = 0;
        v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v30 = v27 == v29;
          if (v27 == v29)
            v27 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      v15 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v14);
      *v15 = v23;
      v15[1] = v22;
      result = (uint64_t)sub_23783FCD4(v35, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v14));
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_23783E960(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t result;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  char v20;
  _QWORD *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v5 = v4;
  v10 = *v4;
  v12 = sub_23783E294(a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= result && (a4 & 1) == 0)
  {
    result = (uint64_t)sub_23783ECDC();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = (_QWORD *)(v18[7] + 16 * v12);
      result = swift_bridgeObjectRelease();
      *v19 = a1;
      v19[1] = a2;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    *(_QWORD *)(v18[6] + 8 * v12) = a3;
    v21 = (_QWORD *)(v18[7] + 16 * v12);
    *v21 = a1;
    v21[1] = a2;
    v22 = v18[2];
    v23 = __OFADD__(v22, 1);
    v24 = v22 + 1;
    if (!v23)
    {
      v18[2] = v24;
      return result;
    }
    goto LABEL_14;
  }
  sub_23783E380(result, a4 & 1);
  result = sub_23783E294(a3);
  if ((v16 & 1) == (v20 & 1))
  {
    v12 = result;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_237851CA4();
  __break(1u);
  return result;
}

unint64_t sub_23783EA9C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(_QWORD *)(v7 + 8 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_QWORD *)(v7 + 8 * result) == a1)
          break;
      }
    }
  }
  return result;
}

unint64_t sub_23783EB38(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_23783FCE4(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x23B81C7AC](v9, a1);
      sub_23783FD20((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_23783EBFC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_237851C98() & 1) == 0)
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
      while (!v14 && (sub_237851C98() & 1) == 0);
    }
  }
  return v6;
}

void *sub_23783ECDC()
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256818430);
  v2 = *v0;
  v3 = sub_237851BD8();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
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
    v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      v9 = v23 + 1;
      if (v23 + 1 >= v13)
        goto LABEL_26;
      v24 = *(_QWORD *)(v6 + 8 * v9);
      if (!v24)
        break;
    }
LABEL_25:
    v12 = (v24 - 1) & v24;
    v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
    v18 = 16 * v15;
    v19 = (uint64_t *)(*(_QWORD *)(v2 + 56) + v18);
    v21 = *v19;
    v20 = v19[1];
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    v22 = (_QWORD *)(*(_QWORD *)(v4 + 56) + v18);
    *v22 = v21;
    v22[1] = v20;
    result = (void *)swift_bridgeObjectRetain();
  }
  v25 = v23 + 2;
  if (v25 >= v13)
    goto LABEL_26;
  v24 = *(_QWORD *)(v6 + 8 * v25);
  if (v24)
  {
    v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v9);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_23783EE88(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23783FB3C(v2);
  v3 = *(_QWORD *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  result = sub_23783EF3C(v5);
  *a1 = v2;
  return result;
}

unint64_t sub_23783EEF0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256818420;
  if (!qword_256818420)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256818418);
    result = MEMORY[0x23B81CC08](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_256818420);
  }
  return result;
}

uint64_t sub_23783EF3C(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  int v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  BOOL v39;
  unint64_t v40;
  unint64_t v41;
  char *v42;
  char *v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  BOOL v55;
  unint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  BOOL v65;
  uint64_t v66;
  char v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  BOOL v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  char *v85;
  char *v86;
  uint64_t v87;
  char *v88;
  unint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  char *v94;
  uint64_t v95;
  unint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  unint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char *__dst;

  v3 = a1[1];
  result = sub_237851C80();
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_152;
    if (v3)
      return sub_23783F624(0, v3, 1, a1);
    return result;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_160;
  v105 = result;
  v102 = a1;
  if (v3 < 2)
  {
    v8 = MEMORY[0x24BEE4AF8];
    __dst = (char *)(MEMORY[0x24BEE4AF8] + 32);
    if (v3 != 1)
    {
      v12 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      v11 = (char *)MEMORY[0x24BEE4AF8];
LABEL_118:
      v94 = v11;
      v104 = v8;
      if (v12 >= 2)
      {
        v95 = *v102;
        do
        {
          v96 = v12 - 2;
          if (v12 < 2)
            goto LABEL_147;
          if (!v95)
            goto LABEL_159;
          v97 = v94;
          v98 = *(_QWORD *)&v94[16 * v96 + 32];
          v99 = *(_QWORD *)&v94[16 * v12 + 24];
          sub_23783F6F0((char *)(v95 + 16 * v98), (char *)(v95 + 16 * *(_QWORD *)&v94[16 * v12 + 16]), v95 + 16 * v99, __dst);
          if (v1)
            break;
          if (v99 < v98)
            goto LABEL_148;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v97 = sub_23783FB28((uint64_t)v97);
          if (v96 >= *((_QWORD *)v97 + 2))
            goto LABEL_149;
          v100 = &v97[16 * v96 + 32];
          *(_QWORD *)v100 = v98;
          *((_QWORD *)v100 + 1) = v99;
          v101 = *((_QWORD *)v97 + 2);
          if (v12 > v101)
            goto LABEL_150;
          memmove(&v97[16 * v12 + 16], &v97[16 * v12 + 32], 16 * (v101 - v12));
          v94 = v97;
          *((_QWORD *)v97 + 2) = v101 - 1;
          v12 = v101 - 1;
        }
        while (v101 > 2);
      }
LABEL_115:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v104 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    v104 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v6 = v5 >> 1;
    v7 = sub_237851AE8();
    *(_QWORD *)(v7 + 16) = v6;
    v104 = v7;
    __dst = (char *)(v7 + 32);
  }
  v9 = 0;
  v10 = *a1;
  v103 = v10 + 8;
  v11 = (char *)MEMORY[0x24BEE4AF8];
  v106 = v3;
  while (1)
  {
    v13 = v9++;
    if (v9 >= v3)
      goto LABEL_46;
    v14 = (uint64_t *)(v10 + 16 * v9);
    v15 = *v14;
    v16 = v14[1];
    v17 = (_QWORD *)(v10 + 16 * v13);
    if (v15 == *v17 && v16 == v17[1])
    {
      v20 = v13 + 2;
      if (v13 + 2 >= v3)
        goto LABEL_45;
      v19 = 0;
    }
    else
    {
      v19 = sub_237851C98();
      v20 = v13 + 2;
      if (v13 + 2 >= v3)
        goto LABEL_36;
    }
    v21 = (_QWORD *)(v103 + 16 * v20);
    do
    {
      v23 = (_QWORD *)(v10 + 16 * v9);
      if (*(v21 - 1) == *v23 && *v21 == v23[1])
      {
        if ((v19 & 1) != 0)
          goto LABEL_37;
      }
      else if (((v19 ^ sub_237851C98()) & 1) != 0)
      {
        goto LABEL_36;
      }
      v21 += 2;
      v22 = v20 + 1;
      v9 = v20;
      v20 = v22;
    }
    while (v22 < v3);
    v20 = v22;
LABEL_36:
    v9 = v20;
    if ((v19 & 1) != 0)
    {
LABEL_37:
      if (v20 < v13)
        goto LABEL_155;
      if (v13 < v20)
      {
        v25 = 16 * v20;
        v26 = 16 * v13;
        v27 = v20;
        v28 = v13;
        do
        {
          if (v28 != --v27)
          {
            if (!v10)
              goto LABEL_158;
            v29 = v10 + v25;
            v30 = *(_QWORD *)(v10 + v26);
            v31 = *(_QWORD *)(v10 + v26 + 8);
            *(_OWORD *)(v10 + v26) = *(_OWORD *)(v10 + v25 - 16);
            *(_QWORD *)(v29 - 16) = v30;
            *(_QWORD *)(v29 - 8) = v31;
          }
          ++v28;
          v25 -= 16;
          v26 += 16;
        }
        while (v28 < v27);
      }
LABEL_45:
      v9 = v20;
    }
LABEL_46:
    if (v9 < v3)
    {
      if (__OFSUB__(v9, v13))
        goto LABEL_151;
      if (v9 - v13 < v105)
        break;
    }
LABEL_67:
    if (v9 < v13)
      goto LABEL_146;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v11 = sub_23783F988(0, *((_QWORD *)v11 + 2) + 1, 1, v11);
    v41 = *((_QWORD *)v11 + 2);
    v40 = *((_QWORD *)v11 + 3);
    v12 = v41 + 1;
    if (v41 >= v40 >> 1)
      v11 = sub_23783F988((char *)(v40 > 1), v41 + 1, 1, v11);
    *((_QWORD *)v11 + 2) = v12;
    v42 = v11 + 32;
    v43 = &v11[16 * v41 + 32];
    *(_QWORD *)v43 = v13;
    *((_QWORD *)v43 + 1) = v9;
    if (v41)
    {
      v107 = v9;
      while (1)
      {
        v44 = v12 - 1;
        if (v12 >= 4)
        {
          v49 = &v42[16 * v12];
          v50 = *((_QWORD *)v49 - 8);
          v51 = *((_QWORD *)v49 - 7);
          v55 = __OFSUB__(v51, v50);
          v52 = v51 - v50;
          if (v55)
            goto LABEL_135;
          v54 = *((_QWORD *)v49 - 6);
          v53 = *((_QWORD *)v49 - 5);
          v55 = __OFSUB__(v53, v54);
          v47 = v53 - v54;
          v48 = v55;
          if (v55)
            goto LABEL_136;
          v56 = v12 - 2;
          v57 = &v42[16 * v12 - 32];
          v59 = *(_QWORD *)v57;
          v58 = *((_QWORD *)v57 + 1);
          v55 = __OFSUB__(v58, v59);
          v60 = v58 - v59;
          if (v55)
            goto LABEL_138;
          v55 = __OFADD__(v47, v60);
          v61 = v47 + v60;
          if (v55)
            goto LABEL_141;
          if (v61 >= v52)
          {
            v79 = &v42[16 * v44];
            v81 = *(_QWORD *)v79;
            v80 = *((_QWORD *)v79 + 1);
            v55 = __OFSUB__(v80, v81);
            v82 = v80 - v81;
            if (v55)
              goto LABEL_145;
            v72 = v47 < v82;
            goto LABEL_105;
          }
        }
        else
        {
          if (v12 != 3)
          {
            v73 = *((_QWORD *)v11 + 4);
            v74 = *((_QWORD *)v11 + 5);
            v55 = __OFSUB__(v74, v73);
            v66 = v74 - v73;
            v67 = v55;
            goto LABEL_99;
          }
          v46 = *((_QWORD *)v11 + 4);
          v45 = *((_QWORD *)v11 + 5);
          v55 = __OFSUB__(v45, v46);
          v47 = v45 - v46;
          v48 = v55;
        }
        if ((v48 & 1) != 0)
          goto LABEL_137;
        v56 = v12 - 2;
        v62 = &v42[16 * v12 - 32];
        v64 = *(_QWORD *)v62;
        v63 = *((_QWORD *)v62 + 1);
        v65 = __OFSUB__(v63, v64);
        v66 = v63 - v64;
        v67 = v65;
        if (v65)
          goto LABEL_140;
        v68 = &v42[16 * v44];
        v70 = *(_QWORD *)v68;
        v69 = *((_QWORD *)v68 + 1);
        v55 = __OFSUB__(v69, v70);
        v71 = v69 - v70;
        if (v55)
          goto LABEL_143;
        if (__OFADD__(v66, v71))
          goto LABEL_144;
        if (v66 + v71 >= v47)
        {
          v72 = v47 < v71;
LABEL_105:
          if (v72)
            v44 = v56;
          goto LABEL_107;
        }
LABEL_99:
        if ((v67 & 1) != 0)
          goto LABEL_139;
        v75 = &v42[16 * v44];
        v77 = *(_QWORD *)v75;
        v76 = *((_QWORD *)v75 + 1);
        v55 = __OFSUB__(v76, v77);
        v78 = v76 - v77;
        if (v55)
          goto LABEL_142;
        if (v78 < v66)
          goto LABEL_15;
LABEL_107:
        v83 = v44 - 1;
        if (v44 - 1 >= v12)
        {
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
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
          goto LABEL_154;
        }
        v84 = v10;
        if (!v10)
          goto LABEL_157;
        v85 = v11;
        v86 = &v42[16 * v83];
        v87 = *(_QWORD *)v86;
        v88 = v42;
        v89 = v44;
        v90 = &v42[16 * v44];
        v91 = *((_QWORD *)v90 + 1);
        v92 = v84;
        sub_23783F6F0((char *)(v84 + 16 * *(_QWORD *)v86), (char *)(v84 + 16 * *(_QWORD *)v90), v84 + 16 * v91, __dst);
        if (v1)
          goto LABEL_115;
        if (v91 < v87)
          goto LABEL_132;
        if (v89 > *((_QWORD *)v85 + 2))
          goto LABEL_133;
        *(_QWORD *)v86 = v87;
        *(_QWORD *)&v88[16 * v83 + 8] = v91;
        v93 = *((_QWORD *)v85 + 2);
        if (v89 >= v93)
          goto LABEL_134;
        v11 = v85;
        v12 = v93 - 1;
        memmove(v90, v90 + 16, 16 * (v93 - 1 - v89));
        v42 = v88;
        *((_QWORD *)v85 + 2) = v93 - 1;
        v10 = v92;
        v9 = v107;
        if (v93 <= 2)
          goto LABEL_15;
      }
    }
    v12 = 1;
LABEL_15:
    v3 = v106;
    if (v9 >= v106)
    {
      v8 = v104;
      goto LABEL_118;
    }
  }
  if (__OFADD__(v13, v105))
    goto LABEL_153;
  if (v13 + v105 >= v3)
    v32 = v3;
  else
    v32 = v13 + v105;
  if (v32 >= v13)
  {
    if (v9 != v32)
    {
      v33 = (_QWORD *)(v10 + 16 * v9);
      do
      {
        v34 = (uint64_t *)(v10 + 16 * v9);
        v35 = *v34;
        v36 = v34[1];
        v37 = v13;
        v38 = v33;
        do
        {
          v39 = v35 == *(v38 - 2) && v36 == *(v38 - 1);
          if (v39 || (sub_237851C98() & 1) == 0)
            break;
          if (!v10)
            goto LABEL_156;
          v35 = *v38;
          v36 = v38[1];
          *(_OWORD *)v38 = *((_OWORD *)v38 - 1);
          *(v38 - 1) = v36;
          *(v38 - 2) = v35;
          v38 -= 2;
          ++v37;
        }
        while (v9 != v37);
        ++v9;
        v33 += 2;
      }
      while (v9 != v32);
      v9 = v32;
    }
    goto LABEL_67;
  }
LABEL_154:
  __break(1u);
LABEL_155:
  __break(1u);
LABEL_156:
  __break(1u);
LABEL_157:
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  __break(1u);
LABEL_160:
  result = sub_237851BC0();
  __break(1u);
  return result;
}

uint64_t sub_23783F624(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  BOOL v13;

  if (a3 != a2)
  {
    v4 = a3;
    v6 = result;
    v7 = *a4;
    v8 = *a4 + 16 * a3;
LABEL_5:
    v9 = (uint64_t *)(v7 + 16 * v4);
    result = *v9;
    v10 = v9[1];
    v11 = v6;
    v12 = (uint64_t *)v8;
    while (1)
    {
      v13 = result == *(v12 - 2) && v10 == *(v12 - 1);
      if (v13 || (result = sub_237851C98(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 16;
        if (v4 == a2)
          return result;
        goto LABEL_5;
      }
      if (!v7)
        break;
      result = *v12;
      v10 = v12[1];
      *(_OWORD *)v12 = *((_OWORD *)v12 - 1);
      *(v12 - 1) = v10;
      *(v12 - 2) = result;
      v12 -= 2;
      if (v4 == ++v11)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_23783F6F0(char *__src, char *a2, unint64_t a3, char *__dst)
{
  char *v4;
  char *v6;
  char *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  BOOL v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t result;
  char *v25;
  char *v26;
  char *v27;

  v4 = __dst;
  v6 = a2;
  v7 = __src;
  v8 = a2 - __src;
  v9 = a2 - __src + 15;
  if (a2 - __src >= 0)
    v9 = a2 - __src;
  v10 = v9 >> 4;
  v11 = a3 - (_QWORD)a2;
  v12 = a3 - (_QWORD)a2 + 15;
  if ((uint64_t)(a3 - (_QWORD)a2) >= 0)
    v12 = a3 - (_QWORD)a2;
  v13 = v12 >> 4;
  v27 = __src;
  v26 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[16 * v13] <= __dst)
        memmove(__dst, a2, 16 * v13);
      v17 = &v4[16 * v13];
      v25 = v17;
      v27 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        v18 = (char *)(a3 - 16);
        v19 = v6;
        while (1)
        {
          v20 = v18 + 16;
          v21 = *((_QWORD *)v19 - 2);
          v22 = *((_QWORD *)v19 - 1);
          v19 -= 16;
          v23 = *((_QWORD *)v17 - 2) == v21 && *((_QWORD *)v17 - 1) == v22;
          if (v23 || (sub_237851C98() & 1) == 0)
          {
            v25 = v17 - 16;
            if (v20 < v17 || v18 >= v17 || v20 != v17)
              *(_OWORD *)v18 = *((_OWORD *)v17 - 1);
            v19 = v6;
            v17 -= 16;
            if (v6 <= v7)
              goto LABEL_50;
          }
          else
          {
            if (v20 != v6 || v18 >= v6)
              *(_OWORD *)v18 = *(_OWORD *)v19;
            v27 = v19;
            if (v19 <= v7)
              goto LABEL_50;
          }
          v18 -= 16;
          v6 = v19;
          if (v17 <= v4)
            goto LABEL_50;
        }
      }
      goto LABEL_50;
    }
  }
  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[16 * v10] <= __dst)
      memmove(__dst, __src, 16 * v10);
    v14 = &v4[16 * v10];
    v25 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      do
      {
        v15 = *(_QWORD *)v6 == *(_QWORD *)v4 && *((_QWORD *)v6 + 1) == *((_QWORD *)v4 + 1);
        if (v15 || (sub_237851C98() & 1) == 0)
        {
          if (v7 != v4)
            *(_OWORD *)v7 = *(_OWORD *)v4;
          v4 += 16;
          v26 = v4;
          v16 = v6;
        }
        else
        {
          v16 = v6 + 16;
          if (v7 < v6 || v7 >= v16 || v7 != v6)
            *(_OWORD *)v7 = *(_OWORD *)v6;
        }
        v7 += 16;
        if (v4 >= v14)
          break;
        v6 = v16;
      }
      while ((unint64_t)v16 < a3);
      v27 = v7;
    }
LABEL_50:
    sub_23783FA80((void **)&v27, (const void **)&v26, &v25);
    return 1;
  }
  result = sub_237851BFC();
  __break(1u);
  return result;
}

char *sub_23783F988(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256818438);
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

char *sub_23783FA80(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *result;
  uint64_t v7;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  v5 = v4 + 15;
  if (v4 >= 0)
    v5 = *a3 - (_QWORD)v3;
  if (v4 <= -16)
  {
    result = (char *)sub_237851BFC();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v7 = v5 >> 4;
    if (result != v3 || result >= &v3[16 * v7])
      return (char *)memmove(result, v3, 16 * v7);
  }
  return result;
}

char *sub_23783FB28(uint64_t a1)
{
  return sub_23783F988(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_23783FB3C(uint64_t a1)
{
  return sub_23783E12C(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_23783FB50(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_237851BFC();
  __break(1u);
  return result;
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

unint64_t sub_23783FC98()
{
  unint64_t result;

  result = qword_256818440;
  if (!qword_256818440)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256818440);
  }
  return result;
}

_OWORD *sub_23783FCD4(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_23783FCE4(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_23783FD20(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

ValueMetadata *type metadata accessor for Log()
{
  return &type metadata for Log;
}

ValueMetadata *type metadata accessor for Log.LogType()
{
  return &type metadata for Log.LogType;
}

unint64_t sub_23783FD78()
{
  unint64_t result;

  result = qword_256818458;
  if (!qword_256818458)
  {
    result = MEMORY[0x23B81CC08](&unk_237852EA4, &type metadata for Log.LogType);
    atomic_store(result, (unint64_t *)&qword_256818458);
  }
  return result;
}

unint64_t sub_23783FDC0()
{
  unint64_t result;

  result = qword_256818460;
  if (!qword_256818460)
  {
    result = MEMORY[0x23B81CC08](&unk_237852E74, &type metadata for Log.LogType);
    atomic_store(result, (unint64_t *)&qword_256818460);
  }
  return result;
}

unint64_t sub_23783FE08()
{
  unint64_t result;

  result = qword_256818468;
  if (!qword_256818468)
  {
    result = MEMORY[0x23B81CC08](&unk_237852ECC, &type metadata for Log.LogType);
    atomic_store(result, (unint64_t *)&qword_256818468);
  }
  return result;
}

unint64_t sub_23783FE50()
{
  unint64_t result;

  result = qword_256818470;
  if (!qword_256818470)
  {
    result = MEMORY[0x23B81CC08](&unk_237852F04, &type metadata for Log.LogType);
    atomic_store(result, (unint64_t *)&qword_256818470);
  }
  return result;
}

uint64_t sub_23783FE94(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return 0;
  result = 0;
  v4 = (uint64_t *)(a1 + 32);
  do
  {
    v6 = *v4++;
    v5 = v6;
    if ((v6 & ~result) == 0)
      v5 = 0;
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

uint64_t sub_23783FED0(uint64_t (*a1)(void), uint64_t (*a2)(uint64_t))
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  int v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v24[3];
  char v25;
  uint64_t v26;

  v5 = v2;
  v6 = type metadata accessor for CarCommandsToggleButton();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_237851710();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2378409F4((uint64_t)v12);
  v13 = (*(uint64_t (**)(char *, uint64_t))(v10 + 88))(v12, v9);
  if (v13 == *MEMORY[0x24BDEB400])
    return a1();
  if (v13 == *MEMORY[0x24BDEB3F0])
  {
    v15 = v2 + *(int *)(v6 + 20);
    v16 = *(_QWORD *)v15;
    v17 = *(_QWORD *)(v15 + 8);
    LOBYTE(v15) = *(_BYTE *)(v15 + 16);
    v24[1] = v16;
    v24[2] = v17;
    v25 = v15;
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818520);
    MEMORY[0x23B81C5D8](&v26, v18);
    v19 = v26;
    sub_237841A20(v5, (uint64_t)v8);
    if (v19 == 1)
    {
      v20 = v8[*(int *)(v6 + 28) + 34];
      v21 = sub_237841A64((uint64_t)v8);
      if ((v20 & 1) != 0)
        return a1();
    }
    else
    {
      v21 = sub_237841A64((uint64_t)v8);
    }
    return a2(v21);
  }
  v22 = sub_2378518D8();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v22;
}

uint64_t CarCommandsToggleButton.body.getter@<X0>(uint64_t a1@<X8>)
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
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  double v14;
  int v15;
  uint64_t v16;
  char v17;
  int v18;
  BOOL v19;
  BOOL v20;
  uint64_t KeyPath;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;

  v29 = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818478);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818480);
  MEMORY[0x24BDAC7A8](v26);
  v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818488);
  MEMORY[0x24BDAC7A8](v27);
  v28 = (uint64_t)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for CarCommandsToggleButton();
  v30 = v1;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256818490);
  sub_237840708();
  sub_237851974();
  v10 = (uint64_t *)(v1 + *(int *)(v9 + 20));
  v11 = v10[1];
  v12 = *((_BYTE *)v10 + 16);
  v31 = *v10;
  v32 = v11;
  v33 = v12;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818520);
  MEMORY[0x23B81C5D8](&v34);
  if ((_BYTE)v34)
    v14 = 1.0;
  else
    v14 = 0.7;
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v7, v5, v2);
  *(double *)&v7[*(int *)(v26 + 36)] = v14;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v15 = *(unsigned __int8 *)(v1 + *(int *)(v9 + 28) + 33);
  v16 = v10[1];
  v17 = *((_BYTE *)v10 + 16);
  v31 = *v10;
  v32 = v16;
  v33 = v17;
  MEMORY[0x23B81C5D8](&v34, v13);
  if (v34 == 1)
  {
    if (v15)
    {
      v18 = 2;
LABEL_10:
      v19 = v18 == v15;
      goto LABEL_11;
    }
  }
  else if (v15)
  {
    v18 = 1;
    goto LABEL_10;
  }
  v19 = 1;
LABEL_11:
  v20 = !v19;
  KeyPath = swift_getKeyPath();
  v22 = swift_allocObject();
  *(_BYTE *)(v22 + 16) = v20;
  v23 = v28;
  sub_237841AA0((uint64_t)v7, v28, &qword_256818480);
  v24 = (uint64_t *)(v23 + *(int *)(v27 + 36));
  *v24 = KeyPath;
  v24[1] = (uint64_t)sub_237840C94;
  v24[2] = v22;
  sub_237841228((uint64_t)v7, &qword_256818480);
  return sub_237840CAC(v23, v29);
}

uint64_t type metadata accessor for CarCommandsToggleButton()
{
  uint64_t result;

  result = qword_256818598;
  if (!qword_256818598)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_237840380@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(void);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  char v23;
  char v24;
  char v25;
  char v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t KeyPath;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48[2];
  _BYTE v49[7];
  char v50;
  _BYTE v51[7];
  char v52;
  _BYTE v53[7];
  char v54;
  _BYTE v55[7];
  char v56;
  int v57;
  __int16 v58;
  char v59;

  v4 = sub_237851908();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_237851710();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for CarCommandsToggleButton();
  sub_23783AF90((__int128 *)(a1 + *(int *)(v11 + 28)), (uint64_t)v48);
  sub_2378419E4((uint64_t)v48);
  sub_2378409F4((uint64_t)v10);
  v12 = (uint64_t *)(a1 + *(int *)(v11 + 20));
  v13 = *v12;
  v14 = v12[1];
  LOBYTE(v12) = *((_BYTE *)v12 + 16);
  v42 = v13;
  v43 = v14;
  LOBYTE(v44) = (_BYTE)v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818520);
  MEMORY[0x23B81C5D8](&v36, v15);
  sub_23783AB94(v48, v10, v36);
  v16 = MEMORY[0x24BDF3D30];
  v17 = sub_23783FED0(MEMORY[0x24BDF3CF0], (uint64_t (*)(uint64_t))MEMORY[0x24BDF3D30]);
  v35 = sub_23783FED0(v16, MEMORY[0x24BDF3E08]);
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BDF3FD0], v4);
  v34 = sub_23785192C();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  KeyPath = swift_getKeyPath();
  swift_retain();
  sub_2378519A4();
  sub_23785174C();
  v32 = v36;
  LOBYTE(v7) = v37;
  v31 = v38;
  LOBYTE(v5) = v39;
  v30 = v40;
  v29 = v41;
  sub_2378519A4();
  sub_23785174C();
  v18 = v42;
  v19 = v44;
  v20 = v46;
  v21 = v47;
  v59 = 1;
  v56 = (char)v7;
  v54 = v5;
  v52 = v43;
  v50 = v45;
  LOBYTE(v7) = sub_237851830();
  swift_release();
  result = swift_release();
  v23 = v59;
  *(_DWORD *)(a2 + 18) = v57;
  *(_WORD *)(a2 + 22) = v58;
  v24 = v56;
  *(_DWORD *)(a2 + 49) = *(_DWORD *)v55;
  *(_DWORD *)(a2 + 52) = *(_DWORD *)&v55[3];
  v25 = v54;
  *(_DWORD *)(a2 + 65) = *(_DWORD *)v53;
  *(_DWORD *)(a2 + 68) = *(_DWORD *)&v53[3];
  v26 = v52;
  v27 = *(_DWORD *)v51;
  *(_DWORD *)(a2 + 100) = *(_DWORD *)&v51[3];
  *(_DWORD *)(a2 + 97) = v27;
  LOBYTE(v27) = v50;
  *(_DWORD *)(a2 + 116) = *(_DWORD *)&v49[3];
  *(_DWORD *)(a2 + 113) = *(_DWORD *)v49;
  *(_QWORD *)a2 = v34;
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = v23;
  *(_BYTE *)(a2 + 17) = 0;
  *(_QWORD *)(a2 + 24) = KeyPath;
  *(_QWORD *)(a2 + 32) = v17;
  *(_QWORD *)(a2 + 40) = v32;
  *(_BYTE *)(a2 + 48) = v24;
  *(_QWORD *)(a2 + 56) = v31;
  *(_BYTE *)(a2 + 64) = v25;
  v28 = v29;
  *(_QWORD *)(a2 + 72) = v30;
  *(_QWORD *)(a2 + 80) = v28;
  *(_QWORD *)(a2 + 88) = v18;
  *(_BYTE *)(a2 + 96) = v26;
  *(_QWORD *)(a2 + 104) = v19;
  *(_BYTE *)(a2 + 112) = v27;
  *(_QWORD *)(a2 + 120) = v20;
  *(_QWORD *)(a2 + 128) = v21;
  *(_QWORD *)(a2 + 136) = v35;
  *(_BYTE *)(a2 + 144) = (_BYTE)v7;
  *(_WORD *)(a2 + 145) = 256;
  return result;
}

uint64_t sub_237840700@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_237840380(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_237840708()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256818498;
  if (!qword_256818498)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256818490);
    v2[0] = sub_23784078C();
    v2[1] = sub_237841788(&qword_256818510, &qword_256818518, MEMORY[0x24BDEB950]);
    result = MEMORY[0x23B81CC08](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256818498);
  }
  return result;
}

unint64_t sub_23784078C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2568184A0;
  if (!qword_2568184A0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568184A8);
    v2[0] = sub_237840844(&qword_2568184B0, &qword_2568184B8, sub_237840828);
    v2[1] = sub_237841788(&qword_256818500, &qword_256818508, MEMORY[0x24BDF06D0]);
    result = MEMORY[0x23B81CC08](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2568184A0);
  }
  return result;
}

uint64_t sub_237840828()
{
  return sub_237840844(&qword_2568184C0, &qword_2568184C8, (uint64_t (*)(void))sub_2378408B0);
}

uint64_t sub_237840844(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t result;
  uint64_t v6;
  _QWORD v7[2];

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7[0] = a3();
    v7[1] = MEMORY[0x24BDEBEE0];
    result = MEMORY[0x23B81CC08](MEMORY[0x24BDED308], v6, v7);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2378408B0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2568184D0;
  if (!qword_2568184D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568184D8);
    v2[0] = sub_237840934();
    v2[1] = sub_237841788(&qword_2568184F0, &qword_2568184F8, MEMORY[0x24BDF1028]);
    result = MEMORY[0x23B81CC08](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2568184D0);
  }
  return result;
}

unint64_t sub_237840934()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2568184E0;
  if (!qword_2568184E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568184E8);
    v2[0] = MEMORY[0x24BDF40E8];
    v2[1] = MEMORY[0x24BDEEC40];
    result = MEMORY[0x23B81CC08](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2568184E0);
  }
  return result;
}

uint64_t CarCommandsToggleButton.asAnyView()()
{
  type metadata accessor for CarCommandsToggleButton();
  sub_237840CF4();
  return sub_237851848();
}

uint64_t sub_2378409CC()
{
  sub_237840CF4();
  return sub_237851848();
}

uint64_t sub_2378409F4@<X0>(uint64_t a1@<X8>)
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
  v4 = sub_237851800();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818530);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_237841AA0(v2, (uint64_t)v10, &qword_256818530);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v11 = sub_237851710();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    v13 = sub_237851B00();
    v14 = sub_237851824();
    v15 = v13;
    if (os_log_type_enabled(v14, v13))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      v17 = swift_slowAlloc();
      v19[1] = a1;
      v18 = v17;
      v20 = v17;
      *(_DWORD *)v16 = 136315138;
      v19[2] = sub_23783D8CC(0x686353726F6C6F43, 0xEB00000000656D65, &v20);
      sub_237851B24();
      _os_log_impl(&dword_23782F000, v14, v15, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B81CC80](v18, -1, -1);
      MEMORY[0x23B81CC80](v16, -1, -1);
    }

    sub_2378517F4();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_237840C34@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2378517C4();
  *a1 = result & 1;
  return result;
}

uint64_t sub_237840C60()
{
  return sub_2378517D0();
}

uint64_t sub_237840C84()
{
  return swift_deallocObject();
}

_BYTE *sub_237840C94(_BYTE *result)
{
  uint64_t v1;

  *result &= ~*(_BYTE *)(v1 + 16) & 1;
  return result;
}

uint64_t sub_237840CAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818488);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_237840CF4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256818528;
  if (!qword_256818528)
  {
    v1 = type metadata accessor for CarCommandsToggleButton();
    result = MEMORY[0x23B81CC08](&protocol conformance descriptor for CarCommandsToggleButton, v1);
    atomic_store(result, (unint64_t *)&qword_256818528);
  }
  return result;
}

uint64_t sub_237840D3C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for CarCommandsToggleButton(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256818530);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_237851710();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v9 = a3[5];
    v10 = a3[6];
    v11 = (char *)a1 + v9;
    v12 = (char *)a2 + v9;
    v13 = *((_QWORD *)v12 + 1);
    *(_QWORD *)v11 = *(_QWORD *)v12;
    *((_QWORD *)v11 + 1) = v13;
    v11[16] = v12[16];
    v14 = (uint64_t *)((char *)a1 + v10);
    v15 = (uint64_t *)((char *)a2 + v10);
    v16 = v15[1];
    *v14 = *v15;
    v14[1] = v16;
    v17 = a3[7];
    v18 = (char *)a1 + v17;
    v19 = (char *)a2 + v17;
    v20 = *(uint64_t *)((char *)a2 + v17);
    v21 = *((_QWORD *)v19 + 1);
    v22 = *((_QWORD *)v19 + 2);
    v23 = *((_QWORD *)v19 + 3);
    v24 = v19[32];
    swift_retain();
    swift_retain();
    swift_retain();
    sub_23783B074();
    *(_QWORD *)v18 = v20;
    *((_QWORD *)v18 + 1) = v21;
    *((_QWORD *)v18 + 2) = v22;
    *((_QWORD *)v18 + 3) = v23;
    v18[32] = v24;
    *(_WORD *)(v18 + 33) = *(_WORD *)(v19 + 33);
  }
  return a1;
}

uint64_t destroy for CarCommandsToggleButton(uint64_t a1)
{
  uint64_t v2;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256818530);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v2 = sub_237851710();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  return sub_23783AFDC();
}

_QWORD *initializeWithCopy for CarCommandsToggleButton(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256818530);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_237851710();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v7 = a3[5];
  v8 = a3[6];
  v9 = (char *)a1 + v7;
  v10 = (char *)a2 + v7;
  v11 = *((_QWORD *)v10 + 1);
  *(_QWORD *)v9 = *(_QWORD *)v10;
  *((_QWORD *)v9 + 1) = v11;
  v9[16] = v10[16];
  v12 = (_QWORD *)((char *)a1 + v8);
  v13 = (_QWORD *)((char *)a2 + v8);
  v14 = v13[1];
  *v12 = *v13;
  v12[1] = v14;
  v15 = a3[7];
  v16 = (char *)a1 + v15;
  v17 = (char *)a2 + v15;
  v18 = *(_QWORD *)((char *)a2 + v15);
  v19 = *((_QWORD *)v17 + 1);
  v20 = *((_QWORD *)v17 + 2);
  v21 = *((_QWORD *)v17 + 3);
  v22 = v17[32];
  swift_retain();
  swift_retain();
  swift_retain();
  sub_23783B074();
  *(_QWORD *)v16 = v18;
  *((_QWORD *)v16 + 1) = v19;
  *((_QWORD *)v16 + 2) = v20;
  *((_QWORD *)v16 + 3) = v21;
  v16[32] = v22;
  *(_WORD *)(v16 + 33) = *(_WORD *)(v17 + 33);
  return a1;
}

_QWORD *assignWithCopy for CarCommandsToggleButton(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  if (a1 != a2)
  {
    sub_237841228((uint64_t)a1, &qword_256818530);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256818530);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_237851710();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  *(_QWORD *)((char *)a1 + v7) = *(_QWORD *)((char *)a2 + v7);
  swift_retain();
  swift_release();
  *((_QWORD *)v8 + 1) = *((_QWORD *)v9 + 1);
  swift_retain();
  swift_release();
  v8[16] = v9[16];
  v10 = a3[6];
  v11 = (_QWORD *)((char *)a1 + v10);
  v12 = (_QWORD *)((char *)a2 + v10);
  v13 = v12[1];
  *v11 = *v12;
  v11[1] = v13;
  swift_retain();
  swift_release();
  v14 = a3[7];
  v15 = (char *)a1 + v14;
  v16 = (char *)a2 + v14;
  v17 = *(_QWORD *)((char *)a2 + v14);
  v18 = *((_QWORD *)v16 + 1);
  v19 = *((_QWORD *)v16 + 2);
  v20 = *((_QWORD *)v16 + 3);
  LOBYTE(v9) = v16[32];
  sub_23783B074();
  *(_QWORD *)v15 = v17;
  *((_QWORD *)v15 + 1) = v18;
  *((_QWORD *)v15 + 2) = v19;
  *((_QWORD *)v15 + 3) = v20;
  v15[32] = (char)v9;
  sub_23783AFDC();
  v15[33] = v16[33];
  v15[34] = v16[34];
  return a1;
}

uint64_t sub_237841228(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

char *initializeWithTake for CarCommandsToggleButton(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  __int128 v12;
  uint64_t v13;
  char *v14;
  char *v15;
  __int128 v16;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818530);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_237851710();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = a3[5];
  v9 = a3[6];
  v10 = &a1[v8];
  v11 = &a2[v8];
  v12 = *(_OWORD *)v11;
  v10[16] = v11[16];
  *(_OWORD *)v10 = v12;
  *(_OWORD *)&a1[v9] = *(_OWORD *)&a2[v9];
  v13 = a3[7];
  v14 = &a1[v13];
  v15 = &a2[v13];
  v16 = *((_OWORD *)v15 + 1);
  *(_OWORD *)v14 = *(_OWORD *)v15;
  *((_OWORD *)v14 + 1) = v16;
  *(_DWORD *)(v14 + 31) = *(_DWORD *)(v15 + 31);
  return a1;
}

char *assignWithTake for CarCommandsToggleButton(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  __int128 v14;

  if (a1 != a2)
  {
    sub_237841228((uint64_t)a1, &qword_256818530);
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818530);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_237851710();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  v8 = a3[5];
  v9 = &a1[v8];
  v10 = &a2[v8];
  *(_QWORD *)&a1[v8] = *(_QWORD *)&a2[v8];
  swift_release();
  *((_QWORD *)v9 + 1) = *((_QWORD *)v10 + 1);
  swift_release();
  v9[16] = v10[16];
  *(_OWORD *)&a1[a3[6]] = *(_OWORD *)&a2[a3[6]];
  swift_release();
  v11 = a3[7];
  v12 = &a1[v11];
  v13 = &a2[v11];
  LOBYTE(v11) = v13[32];
  v14 = *((_OWORD *)v13 + 1);
  *(_OWORD *)v12 = *(_OWORD *)v13;
  *((_OWORD *)v12 + 1) = v14;
  v12[32] = v11;
  sub_23783AFDC();
  v12[33] = v13[33];
  v12[34] = v13[34];
  return a1;
}

uint64_t getEnumTagSinglePayload for CarCommandsToggleButton()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_237841490(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818538);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for CarCommandsToggleButton()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_237841520(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = __swift_instantiateConcreteTypeFromMangledName(&qword_256818538);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  return result;
}

void sub_2378415A0()
{
  unint64_t v0;

  sub_237841628();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_237841628()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2568185A8[0])
  {
    sub_237851710();
    v0 = sub_23785171C();
    if (!v1)
      atomic_store(v0, qword_2568185A8);
  }
}

unint64_t sub_237841680()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2568185E0;
  if (!qword_2568185E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256818488);
    v2[0] = sub_237841704();
    v2[1] = sub_237841788(&qword_2568185F8, &qword_256818600, MEMORY[0x24BDF1248]);
    result = MEMORY[0x23B81CC08](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2568185E0);
  }
  return result;
}

unint64_t sub_237841704()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2568185E8;
  if (!qword_2568185E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256818480);
    v2[0] = sub_237841788(&qword_2568185F0, &qword_256818478, MEMORY[0x24BDF43B0]);
    v2[1] = MEMORY[0x24BDECC38];
    result = MEMORY[0x23B81CC08](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2568185E8);
  }
  return result;
}

uint64_t sub_237841788(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x23B81CC08](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t initializeWithCopy for CarCommandsToggleButton.ButtonConfiguration(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v4 = *a2;
  v5 = a2[1];
  v6 = a2[2];
  v7 = a2[3];
  v8 = *((_BYTE *)a2 + 32);
  sub_23783B074();
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v7;
  *(_BYTE *)(a1 + 32) = v8;
  *(_WORD *)(a1 + 33) = *(_WORD *)((char *)a2 + 33);
  return a1;
}

uint64_t assignWithCopy for CarCommandsToggleButton.ButtonConfiguration(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v4 = *a2;
  v5 = a2[1];
  v6 = a2[2];
  v7 = a2[3];
  v8 = *((_BYTE *)a2 + 32);
  sub_23783B074();
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v7;
  *(_BYTE *)(a1 + 32) = v8;
  sub_23783AFDC();
  *(_BYTE *)(a1 + 33) = *((_BYTE *)a2 + 33);
  *(_BYTE *)(a1 + 34) = *((_BYTE *)a2 + 34);
  return a1;
}

__n128 __swift_memcpy35_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 31) = *(_DWORD *)(a2 + 31);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for CarCommandsToggleButton.ButtonConfiguration(uint64_t a1, uint64_t a2)
{
  char v4;
  __int128 v5;

  v4 = *(_BYTE *)(a2 + 32);
  v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 32) = v4;
  sub_23783AFDC();
  *(_BYTE *)(a1 + 33) = *(_BYTE *)(a2 + 33);
  *(_BYTE *)(a1 + 34) = *(_BYTE *)(a2 + 34);
  return a1;
}

uint64_t getEnumTagSinglePayload for CarCommandsToggleButton.ButtonConfiguration(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 35))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 34);
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for CarCommandsToggleButton.ButtonConfiguration(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 34) = 0;
    *(_WORD *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 35) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 35) = 0;
    if (a2)
      *(_BYTE *)(result + 34) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for CarCommandsToggleButton.ButtonConfiguration()
{
  return &type metadata for CarCommandsToggleButton.ButtonConfiguration;
}

uint64_t sub_2378419E4(uint64_t a1)
{
  sub_23783B074();
  return a1;
}

uint64_t sub_237841A20(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CarCommandsToggleButton();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_237841A64(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for CarCommandsToggleButton();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_237841AA0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t getEnumTagSinglePayload for CarCommandsToggleButton.ToggleBehavior(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for CarCommandsToggleButton.ToggleBehavior(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_237841BC0 + 4 * byte_237853055[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_237841BF4 + 4 * byte_237853050[v4]))();
}

uint64_t sub_237841BF4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_237841BFC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x237841C04);
  return result;
}

uint64_t sub_237841C10(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x237841C18);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_237841C1C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_237841C24(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CarCommandsToggleButton.ToggleBehavior()
{
  return &type metadata for CarCommandsToggleButton.ToggleBehavior;
}

unint64_t sub_237841C44()
{
  unint64_t result;

  result = qword_256818608;
  if (!qword_256818608)
  {
    result = MEMORY[0x23B81CC08](&unk_2378531F8, &type metadata for CarCommandsToggleButton.ToggleBehavior);
    atomic_store(result, (unint64_t *)&qword_256818608);
  }
  return result;
}

uint64_t CarCommandsConfirmationSnippet.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v4;
  uint64_t v5;

  v4 = (uint64_t *)(a2 + *(int *)(type metadata accessor for CarCommandsConfirmationSnippet() + 20));
  sub_237851A7C();
  sub_237835D18((unint64_t *)&qword_256817B20, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE580], MEMORY[0x24BEAE520]);
  *v4 = sub_237851770();
  v4[1] = v5;
  return sub_23783B658(a1, a2, type metadata accessor for CarCommandsConfirmationSnippetModel);
}

uint64_t type metadata accessor for CarCommandsConfirmationSnippet()
{
  uint64_t result;

  result = qword_256818680;
  if (!qword_256818680)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t CarCommandsConfirmationSnippet.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t KeyPath;
  uint64_t *v14;
  uint64_t v16;

  v2 = v1;
  v4 = type metadata accessor for CarCommandsConfirmationSnippet();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818610);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2378420D4(v2, (uint64_t)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v12 = swift_allocObject();
  sub_23783B658((uint64_t)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v12 + v11, (uint64_t (*)(_QWORD))type metadata accessor for CarCommandsConfirmationSnippet);
  sub_2378519F8();
  sub_237835D18(&qword_256818618, (uint64_t (*)(uint64_t))MEMORY[0x24BEADCE0], MEMORY[0x24BEADCC0]);
  sub_2378519E0();
  KeyPath = swift_getKeyPath();
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 16))(a1, v10, v7);
  v14 = (uint64_t *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256818620) + 36));
  *v14 = KeyPath;
  v14[1] = 1;
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_237841ED8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[4];
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18[5];

  v13[1] = a2;
  v3 = type metadata accessor for CarCommandsConfirmationSnippet();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13[0] = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  sub_2378516BC();
  v14 = v18[0];
  v15 = v18[1];
  sub_2378420D4(a1, (uint64_t)v6);
  v7 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v8 = swift_allocObject();
  sub_23783B658((uint64_t)v6, v8 + v7, (uint64_t (*)(_QWORD))type metadata accessor for CarCommandsConfirmationSnippet);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568186D8);
  v18[3] = v9;
  v10 = sub_237841788(&qword_2568186E0, &qword_2568186D8, MEMORY[0x24BEAD930]);
  v18[4] = v10;
  __swift_allocate_boxed_opaque_existential_1(v18);
  sub_23783D77C();
  sub_237851980();
  type metadata accessor for CarCommandsConfirmationSnippetModel(0);
  sub_2378516BC();
  v13[2] = v14;
  v13[3] = v15;
  sub_2378420D4(a1, (uint64_t)v6);
  v11 = swift_allocObject();
  sub_23783B658((uint64_t)v6, v11 + v7, (uint64_t (*)(_QWORD))type metadata accessor for CarCommandsConfirmationSnippet);
  v16 = v9;
  v17 = v10;
  __swift_allocate_boxed_opaque_existential_1(&v14);
  sub_237851980();
  return sub_2378519EC();
}

uint64_t sub_2378420D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CarCommandsConfirmationSnippet();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_237842120(uint64_t a1, uint64_t (*a2)(void))
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;

  v3 = *(void **)(a1 + *(int *)(type metadata accessor for CarCommandsConfirmationSnippet() + 20));
  if (v3)
  {
    v4 = v3;
    v5 = (void *)a2();
    v6 = objc_msgSend(v5, sel_identifier);

    sub_237851AA0();
    v7 = objc_allocWithZone(MEMORY[0x24BE99168]);
    swift_bridgeObjectRetain();
    v8 = (void *)sub_237851A94();
    swift_bridgeObjectRelease();
    v9 = objc_msgSend(v7, sel_initWithIdentifier_, v8);

    v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE99160]), sel_init);
    objc_msgSend(v10, sel_setInputOrigin_, *MEMORY[0x24BE821C0]);
    objc_msgSend(v10, sel_setInteractionType_, *MEMORY[0x24BE82230]);
    v11 = objc_msgSend((id)objc_opt_self(), sel_runSiriKitExecutorCommandWithContext_payload_, v10, v9);
    swift_bridgeObjectRelease();

    sub_237851A70();
  }
  else
  {
    sub_237851A7C();
    sub_237835D18((unint64_t *)&qword_256817B20, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE580], MEMORY[0x24BEAE520]);
    sub_237851764();
    __break(1u);
  }
}

uint64_t sub_2378422D4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_23785177C();
  *a1 = result;
  return result;
}

uint64_t sub_2378422FC()
{
  return sub_237851788();
}

uint64_t sub_237842320()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_237842330@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t KeyPath;
  uint64_t *v14;
  uint64_t v16;

  v3 = v2;
  v5 = *(_QWORD *)(a1 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](a1);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818610);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2378420D4(v3, (uint64_t)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v12 = swift_allocObject();
  sub_23783B658((uint64_t)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v12 + v11, (uint64_t (*)(_QWORD))type metadata accessor for CarCommandsConfirmationSnippet);
  sub_2378519F8();
  sub_237835D18(&qword_256818618, (uint64_t (*)(uint64_t))MEMORY[0x24BEADCE0], MEMORY[0x24BEADCC0]);
  sub_2378519E0();
  KeyPath = swift_getKeyPath();
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 16))(a2, v10, v7);
  v14 = (uint64_t *)(a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256818620) + 36));
  *v14 = KeyPath;
  v14[1] = 1;
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t *initializeBufferWithCopyOfBuffer for CarCommandsConfirmationSnippet(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  char *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
    v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v9 = type metadata accessor for CarCommandsConfirmationSnippetModel(0);
    v8((uint64_t *)((char *)a1 + *(int *)(v9 + 20)), (uint64_t *)((char *)a2 + *(int *)(v9 + 20)), v7);
    v10 = *(int *)(a3 + 20);
    v11 = (uint64_t *)((char *)a1 + v10);
    v12 = (char *)a2 + v10;
    v14 = *(void **)v12;
    v13 = *((_QWORD *)v12 + 1);
    *v11 = v14;
    v11[1] = v13;
    v15 = v14;
  }
  return a1;
}

void destroy for CarCommandsConfirmationSnippet(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(a1, v4);
  v6 = type metadata accessor for CarCommandsConfirmationSnippetModel(0);
  v5(a1 + *(int *)(v6 + 20), v4);

}

uint64_t initializeWithCopy for CarCommandsConfirmationSnippet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v8 = type metadata accessor for CarCommandsConfirmationSnippetModel(0);
  v7(a1 + *(int *)(v8 + 20), a2 + *(int *)(v8 + 20), v6);
  v9 = *(int *)(a3 + 20);
  v10 = (_QWORD *)(a1 + v9);
  v11 = a2 + v9;
  v13 = *(void **)v11;
  v12 = *(_QWORD *)(v11 + 8);
  *v10 = v13;
  v10[1] = v12;
  v14 = v13;
  return a1;
}

uint64_t assignWithCopy for CarCommandsConfirmationSnippet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v8 = type metadata accessor for CarCommandsConfirmationSnippetModel(0);
  v7(a1 + *(int *)(v8 + 20), a2 + *(int *)(v8 + 20), v6);
  v9 = *(int *)(a3 + 20);
  v10 = (_QWORD *)(a1 + v9);
  v11 = a2 + v9;
  v12 = *(void **)(a1 + v9);
  v13 = *(void **)v11;
  *v10 = *(_QWORD *)v11;
  v14 = v13;

  v10[1] = *(_QWORD *)(v11 + 8);
  return a1;
}

uint64_t initializeWithTake for CarCommandsConfirmationSnippet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v8 = type metadata accessor for CarCommandsConfirmationSnippetModel(0);
  v7(a1 + *(int *)(v8 + 20), a2 + *(int *)(v8 + 20), v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for CarCommandsConfirmationSnippet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  void *v12;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v8 = type metadata accessor for CarCommandsConfirmationSnippetModel(0);
  v7(a1 + *(int *)(v8 + 20), a2 + *(int *)(v8 + 20), v6);
  v9 = *(int *)(a3 + 20);
  v10 = (_QWORD *)(a1 + v9);
  v11 = (_QWORD *)(a2 + v9);
  v12 = *(void **)(a1 + v9);
  *v10 = *v11;

  v10[1] = v11[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for CarCommandsConfirmationSnippet()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_237842844(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;
  int v10;

  v6 = type metadata accessor for CarCommandsConfirmationSnippetModel(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  v10 = v9 - 1;
  if (v10 < 0)
    v10 = -1;
  return (v10 + 1);
}

uint64_t storeEnumTagSinglePayload for CarCommandsConfirmationSnippet()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2378428D8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for CarCommandsConfirmationSnippetModel(0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = a2;
  return result;
}

uint64_t sub_237842950()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for CarCommandsConfirmationSnippetModel(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_2378429C4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2568186B8;
  if (!qword_2568186B8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256818620);
    v2[0] = sub_237841788(&qword_2568186C0, &qword_256818610, MEMORY[0x24BEADC00]);
    v2[1] = sub_237841788(&qword_2568186C8, &qword_2568186D0, MEMORY[0x24BDF1028]);
    result = MEMORY[0x23B81CC08](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2568186B8);
  }
  return result;
}

uint64_t sub_237842A64@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for CarCommandsConfirmationSnippet() - 8) + 80);
  return sub_237841ED8(v1 + ((v3 + 16) & ~v3), a1);
}

void sub_237842AA4()
{
  sub_237842BAC(MEMORY[0x24BE97288]);
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

uint64_t objectdestroyTm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;

  v1 = type metadata accessor for CarCommandsConfirmationSnippet();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v6 = type metadata accessor for CarCommandsConfirmationSnippetModel(0);
  v5(v3 + *(int *)(v6 + 20), v4);

  return swift_deallocObject();
}

void sub_237842BA0()
{
  sub_237842BAC(MEMORY[0x24BE97280]);
}

void sub_237842BAC(uint64_t (*a1)(void))
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for CarCommandsConfirmationSnippet() - 8) + 80);
  sub_237842120(v1 + ((v3 + 16) & ~v3), a1);
}

uint64_t CarCommandsDisambiguationSnippet.body.getter()
{
  __int128 *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  _OWORD v10[2];
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v1 = sub_237851A34();
  MEMORY[0x24BDAC7A8](v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568186E8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = v0[1];
  v15 = *v0;
  v16 = v6;
  v17 = v0[2];
  v18 = *((_QWORD *)v0 + 6);
  v13 = MEMORY[0x24BEE0D00];
  v14 = MEMORY[0x24BEAE5B8];
  v12 = v15;
  v11 = 0;
  memset(v10, 0, sizeof(v10));
  swift_bridgeObjectRetain();
  sub_237851A28();
  v7 = swift_allocObject();
  v8 = v16;
  *(_OWORD *)(v7 + 16) = v15;
  *(_OWORD *)(v7 + 32) = v8;
  *(_OWORD *)(v7 + 48) = v17;
  *(_QWORD *)(v7 + 64) = v18;
  sub_237842EE8((uint64_t)&v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568186F0);
  sub_237842F34();
  sub_237851A04();
  sub_237841788(&qword_256818728, &qword_2568186E8, MEMORY[0x24BEADE50]);
  sub_2378518B4();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_237842D9C(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  uint64_t v5;

  v5 = *(_QWORD *)(a1 + 16);
  v2 = swift_allocObject();
  v3 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v2 + 32) = v3;
  *(_OWORD *)(v2 + 48) = *(_OWORD *)(a1 + 32);
  *(_QWORD *)(v2 + 64) = *(_QWORD *)(a1 + 48);
  sub_237844174((uint64_t)&v5);
  sub_237842EE8(a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568187D8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568187E0);
  sub_237841788(&qword_2568187E8, &qword_2568187D8, MEMORY[0x24BEE12D8]);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256818700);
  sub_237842FC0();
  swift_getOpaqueTypeConformance2();
  sub_237835D18(&qword_2568187F0, (uint64_t (*)(uint64_t))type metadata accessor for CarCommandsDisambiguationSnippet.DisambiguationOption, (uint64_t)&unk_2378533C0);
  return sub_237851998();
}

uint64_t sub_237842EE0()
{
  uint64_t v0;

  return sub_237842D9C(v0 + 16);
}

uint64_t sub_237842EE8(uint64_t a1)
{
  id v2;

  v2 = *(id *)(a1 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

unint64_t sub_237842F34()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[3];

  result = qword_2568186F8;
  if (!qword_2568186F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568186F0);
    v2[1] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256818700);
    v2[2] = sub_237842FC0();
    v2[0] = swift_getOpaqueTypeConformance2();
    result = MEMORY[0x23B81CC08](MEMORY[0x24BDF4A08], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2568186F8);
  }
  return result;
}

unint64_t sub_237842FC0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256818708;
  if (!qword_256818708)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256818700);
    v2[0] = sub_237835D18(&qword_256818710, (uint64_t (*)(uint64_t))MEMORY[0x24BEADE90], MEMORY[0x24BEADE70]);
    v2[1] = sub_237841788(&qword_256818718, &qword_256818720, MEMORY[0x24BDEFAD8]);
    result = MEMORY[0x23B81CC08](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256818708);
  }
  return result;
}

uint64_t sub_23784305C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23784306C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  __int128 v27;
  char *v28;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;

  v39 = a3;
  v5 = type metadata accessor for CarCommandsDisambiguationSnippet.DisambiguationOption();
  v36 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v37 = v6;
  v38 = (uint64_t)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818730);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = sub_237851A1C();
  v10 = *(_QWORD *)(v31 - 8);
  MEMORY[0x24BDAC7A8](v31);
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818700);
  MEMORY[0x24BDAC7A8](v35);
  v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568187E0);
  v33 = *(_QWORD *)(v15 - 8);
  v34 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v32 = (char *)&v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = *a1;
  v18 = a1[1];
  v66 = MEMORY[0x24BEE0D00];
  v67 = MEMORY[0x24BEAE5B8];
  v64 = v17;
  v65 = v18;
  v63 = 0;
  v61 = 0u;
  v62 = 0u;
  v60 = 0;
  v58 = 0u;
  v59 = 0u;
  v57 = 0;
  v55 = 0u;
  v56 = 0u;
  v54 = 0;
  v52 = 0u;
  v53 = 0u;
  v51 = 0;
  v49 = 0u;
  v50 = 0u;
  v48 = 0;
  v46 = 0u;
  v47 = 0u;
  v45 = 0;
  v43 = 0u;
  v44 = 0u;
  sub_23784419C((uint64_t)a1 + *(int *)(v5 + 20), (uint64_t)v9);
  v19 = sub_2378519C8();
  v20 = *(_QWORD *)(v19 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v9, 1, v19) == 1)
  {
    swift_bridgeObjectRetain();
    sub_237841228((uint64_t)v9, &qword_256818730);
    v40 = 0u;
    v41 = 0u;
    v42 = 0;
  }
  else
  {
    *((_QWORD *)&v41 + 1) = v19;
    v42 = MEMORY[0x24BEADA30];
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v40);
    (*(void (**)(uint64_t *, char *, uint64_t))(v20 + 32))(boxed_opaque_existential_1, v9, v19);
    swift_bridgeObjectRetain();
  }
  sub_237851A10();
  v22 = v31;
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v14, v12, v31);
  v14[*(int *)(v35 + 36)] = 0;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v22);
  v23 = (uint64_t)a1;
  v24 = v38;
  sub_2378441E4(v23, v38);
  v25 = (*(unsigned __int8 *)(v36 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80);
  v26 = swift_allocObject();
  v27 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v26 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(v26 + 32) = v27;
  *(_OWORD *)(v26 + 48) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(v26 + 64) = *(_QWORD *)(a2 + 48);
  sub_237844310(v24, v26 + v25);
  sub_237842EE8(a2);
  sub_237842FC0();
  v28 = v32;
  sub_23785189C();
  swift_release();
  sub_237841228((uint64_t)v14, &qword_256818700);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v33 + 32))(v39, v28, v34);
}

uint64_t sub_2378433F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  os_log_type_t v5;
  void *v6;
  uint64_t inited;
  id v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;

  if (qword_256817AF8 != -1)
    swift_once();
  v4 = sub_2378516EC();
  __swift_project_value_buffer(v4, (uint64_t)qword_2568183E8);
  v5 = sub_237851AF4();
  sub_23783D490(v5, 8, 0xD0000000000000A2, 0x80000002378552E0, 2036625250, 0xE400000000000000, 43, 0xD000000000000033, 0x8000000237855390);
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568187F8);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_2378532F0;
    v8 = v6;
    v9 = MEMORY[0x24BEE0D00];
    sub_237851B6C();
    v10 = (uint64_t *)(a2
                    + *(int *)(type metadata accessor for CarCommandsDisambiguationSnippet.DisambiguationOption() + 24));
    v12 = *v10;
    v11 = v10[1];
    *(_QWORD *)(inited + 96) = v9;
    *(_QWORD *)(inited + 72) = v12;
    *(_QWORD *)(inited + 80) = v11;
    swift_bridgeObjectRetain();
    sub_237844CF8(inited);
    sub_237851A64();

    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_237842EE8(a1);
    sub_237851A7C();
    sub_237835D18((unint64_t *)&qword_256817B20, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE580], MEMORY[0x24BEAE520]);
    result = sub_237851764();
    __break(1u);
  }
  return result;
}

void destroy for CarCommandsDisambiguationSnippet(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

_QWORD *initializeWithCopy for CarCommandsDisambiguationSnippet(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = (void *)a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v6 = v5;
  return a1;
}

_QWORD *assignWithCopy for CarCommandsDisambiguationSnippet(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (void *)a1[5];
  v5 = (void *)a2[5];
  a1[5] = v5;
  v6 = v5;

  a1[6] = a2[6];
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

uint64_t assignWithTake for CarCommandsDisambiguationSnippet(uint64_t a1, uint64_t a2)
{
  void *v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  v4 = *(void **)(a1 + 40);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);

  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for CarCommandsDisambiguationSnippet(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 56))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CarCommandsDisambiguationSnippet(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CarCommandsDisambiguationSnippet()
{
  return &type metadata for CarCommandsDisambiguationSnippet;
}

uint64_t sub_237843840()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568186E8);
  sub_237841788(&qword_256818728, &qword_2568186E8, MEMORY[0x24BEADE50]);
  return swift_getOpaqueTypeConformance2();
}

uint64_t *sub_2378438A4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;

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
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_2378519C8();
    v12 = *(_QWORD *)(v11 - 8);
    v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818730);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    v16 = *(int *)(a3 + 24);
    v17 = (uint64_t *)((char *)v4 + v16);
    v18 = (uint64_t *)((char *)a2 + v16);
    v19 = v18[1];
    *v17 = *v18;
    v17[1] = v19;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_2378439C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_2378519C8();
  v6 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  return swift_bridgeObjectRelease();
}

_QWORD *sub_237843A48(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(char *, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_2378519C8();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  if (v12(v9, 1, v10))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818730);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v14 = *(int *)(a3 + 24);
  v15 = (_QWORD *)((char *)a1 + v14);
  v16 = (_QWORD *)((char *)a2 + v14);
  v17 = v16[1];
  *v15 = *v16;
  v15[1] = v17;
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *sub_237843B3C(_QWORD *a1, _QWORD *a2, uint64_t a3)
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
  _QWORD *v16;
  _QWORD *v17;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_2378519C8();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818730);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  v15 = *(int *)(a3 + 24);
  v16 = (_QWORD *)((char *)a1 + v15);
  v17 = (_QWORD *)((char *)a2 + v15);
  *v16 = *v17;
  v16[1] = v17[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *sub_237843C98(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_2378519C8();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818730);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

_QWORD *sub_237843D70(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(char *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_2378519C8();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 40))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818730);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  v16 = *(int *)(a3 + 24);
  v17 = (_QWORD *)((char *)a1 + v16);
  v18 = (_QWORD *)((char *)a2 + v16);
  v20 = *v18;
  v19 = v18[1];
  *v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_237843EAC()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_237843EB8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818730);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t sub_237843F38()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_237843F44(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818730);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for CarCommandsDisambiguationSnippet.DisambiguationOption()
{
  uint64_t result;

  result = qword_256818790;
  if (!qword_256818790)
    return swift_getSingletonMetadata();
  return result;
}

void sub_237843FF8()
{
  unint64_t v0;

  sub_23784406C();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_23784406C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2568187A0)
  {
    sub_2378519C8();
    v0 = sub_237851B18();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2568187A0);
  }
}

uint64_t sub_2378440C0()
{
  return MEMORY[0x24BEE0D10];
}

uint64_t sub_2378440CC@<X0>(_QWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v4 = *v1;
  v5 = v1[1];
  swift_bridgeObjectRetain();
  result = sub_237851AC4();
  *a1 = v4;
  a1[1] = v5;
  return result;
}

uint64_t objectdestroyTm_0()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_23784416C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_23784306C(a1, v2 + 16, a2);
}

uint64_t sub_237844174(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_23784419C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818730);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2378441E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CarCommandsDisambiguationSnippet.DisambiguationOption();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_237844228()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for CarCommandsDisambiguationSnippet.DisambiguationOption();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v3 = v0 + ((v2 + 72) & ~v2) + *(int *)(v1 + 20);
  v4 = sub_2378519C8();
  v5 = *(_QWORD *)(v4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4))
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_237844310(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CarCommandsDisambiguationSnippet.DisambiguationOption();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_237844354()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for CarCommandsDisambiguationSnippet.DisambiguationOption()
                                      - 8)
                          + 80);
  return sub_2378433F8(v0 + 16, v0 + ((v1 + 72) & ~v1));
}

uint64_t AppDisambiguationSnippet.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23783B658(a1, a2, type metadata accessor for CarCommandsDisambiguationSnippetModel);
}

uint64_t AppDisambiguationSnippet.body.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  sub_2378516BC();
  type metadata accessor for CarCommandsDisambiguationSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817C88);
  sub_2378516BC();
  v2 = sub_237844478(v5);
  swift_bridgeObjectRelease();
  sub_237851A7C();
  sub_23783108C();
  result = sub_237851770();
  *a1 = v5;
  a1[1] = v6;
  a1[2] = v2;
  a1[3] = 0xD000000000000042;
  a1[4] = 0x8000000237855290;
  a1[5] = result;
  a1[6] = v4;
  return result;
}

uint64_t sub_237844478(uint64_t a1)
{
  uint64_t v2;
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
  _QWORD *v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  unint64_t v26;
  unint64_t v27;
  _QWORD v29[2];
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v2 = sub_237851698();
  MEMORY[0x24BDAC7A8](v2);
  v29[1] = (char *)v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818730);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v29[0] = (char *)v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v29 - v7;
  v32 = type metadata accessor for CarCommandsDisambiguationSnippetModel.DisambiguationOption(0);
  v9 = *(_QWORD *)(v32 - 8);
  MEMORY[0x24BDAC7A8](v32);
  v11 = (char *)v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for CarCommandsDisambiguationSnippet.DisambiguationOption();
  v31 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (_QWORD *)((char *)v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  v15 = *(_QWORD *)(a1 + 16);
  v16 = MEMORY[0x24BEE4AF8];
  if (v15)
  {
    v35 = MEMORY[0x24BEE4AF8];
    sub_23783B5BC(0, v15, 0);
    v17 = a1 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    v30 = *(_QWORD *)(v9 + 72);
    do
    {
      sub_23783B5D8(v17, (uint64_t)v11);
      v18 = sub_2378519C8();
      v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56);
      v19(v8, 1, 1, v18);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
      sub_2378516BC();
      if (v34)
      {
        sub_23785168C();
        swift_bridgeObjectRelease();
        v20 = v29[0];
        sub_2378519D4();
        sub_237844974((uint64_t)v8);
        v19((char *)v20, 0, 1, v18);
        sub_2378449B4(v20, (uint64_t)v8);
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
      sub_2378516BC();
      v22 = v33;
      v21 = v34;
      sub_23784419C((uint64_t)v8, (uint64_t)v14 + *(int *)(v12 + 20));
      sub_2378516BC();
      v23 = v33;
      v24 = v34;
      *v14 = v22;
      v14[1] = v21;
      v25 = (_QWORD *)((char *)v14 + *(int *)(v12 + 24));
      *v25 = v23;
      v25[1] = v24;
      sub_237844974((uint64_t)v8);
      sub_23783B61C((uint64_t)v11);
      v16 = v35;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_23783B5BC(0, *(_QWORD *)(v16 + 16) + 1, 1);
        v16 = v35;
      }
      v27 = *(_QWORD *)(v16 + 16);
      v26 = *(_QWORD *)(v16 + 24);
      if (v27 >= v26 >> 1)
      {
        sub_23783B5BC(v26 > 1, v27 + 1, 1);
        v16 = v35;
      }
      *(_QWORD *)(v16 + 16) = v27 + 1;
      sub_23783B658((uint64_t)v14, v16+ ((*(unsigned __int8 *)(v31 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80))+ *(_QWORD *)(v31 + 72) * v27, (uint64_t (*)(_QWORD))type metadata accessor for CarCommandsDisambiguationSnippet.DisambiguationOption);
      v17 += v30;
      --v15;
    }
    while (v15);
  }
  return v16;
}

uint64_t sub_2378447C0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2378447D0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  sub_2378516BC();
  type metadata accessor for CarCommandsDisambiguationSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817C88);
  sub_2378516BC();
  v2 = sub_237844478(v5);
  swift_bridgeObjectRelease();
  sub_237851A7C();
  sub_23783108C();
  result = sub_237851770();
  *a1 = v5;
  a1[1] = v6;
  a1[2] = v2;
  a1[3] = 0xD000000000000042;
  a1[4] = 0x8000000237855290;
  a1[5] = result;
  a1[6] = v4;
  return result;
}

uint64_t getEnumTagSinglePayload for AppDisambiguationSnippet()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2378448B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CarCommandsDisambiguationSnippetModel(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for AppDisambiguationSnippet()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2378448F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CarCommandsDisambiguationSnippetModel(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for AppDisambiguationSnippet()
{
  uint64_t result;

  result = qword_256818858;
  if (!qword_256818858)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_237844974(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818730);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2378449B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818730);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t VisibleSignalStatusSnippet.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_237830DF8(a1, a2);
}

double VisibleSignalStatusSnippet.body.getter@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double result;
  uint64_t v7;
  uint64_t v8;

  type metadata accessor for CarCommandsToggleSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B08);
  sub_2378516BC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  sub_2378516BC();
  sub_2378516BC();
  sub_2378516BC();
  sub_2378516BC();
  sub_2378516BC();
  sub_2378516BC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  sub_2378516BC();
  sub_237851A7C();
  sub_23783108C();
  v2 = sub_237851770();
  v4 = v3;
  v5 = swift_bridgeObjectRetain();
  result = 2.87963758e214;
  *(_OWORD *)a1 = xmmword_237853480;
  *(_OWORD *)(a1 + 16) = xmmword_237853490;
  *(_WORD *)(a1 + 32) = 768;
  *(_BYTE *)(a1 + 34) = 0;
  *(_QWORD *)(a1 + 40) = v7;
  *(_QWORD *)(a1 + 48) = v8;
  *(_QWORD *)(a1 + 56) = v7;
  *(_QWORD *)(a1 + 64) = v8;
  *(_QWORD *)(a1 + 72) = v7;
  *(_QWORD *)(a1 + 80) = v8;
  *(_QWORD *)(a1 + 88) = v7;
  *(_QWORD *)(a1 + 96) = v8;
  *(_QWORD *)(a1 + 104) = v7;
  *(_QWORD *)(a1 + 112) = v8;
  *(_QWORD *)(a1 + 120) = 0xD000000000000045;
  *(_QWORD *)(a1 + 128) = 0x8000000237855240;
  *(_QWORD *)(a1 + 136) = v7;
  *(_QWORD *)(a1 + 144) = v8;
  *(_QWORD *)(a1 + 152) = v7;
  *(_QWORD *)(a1 + 160) = v8;
  *(_BYTE *)(a1 + 168) = v7;
  *(_QWORD *)(a1 + 176) = 0;
  *(_QWORD *)(a1 + 184) = v7;
  *(_QWORD *)(a1 + 192) = v5;
  *(_QWORD *)(a1 + 200) = 0;
  *(_QWORD *)(a1 + 208) = v2;
  *(_QWORD *)(a1 + 216) = v4;
  return result;
}

uint64_t sub_237844C14()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t getEnumTagSinglePayload for VisibleSignalStatusSnippet()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_237844C34(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CarCommandsToggleSnippetModel(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for VisibleSignalStatusSnippet()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_237844C7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CarCommandsToggleSnippetModel(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for VisibleSignalStatusSnippet()
{
  uint64_t result;

  result = qword_2568188E8;
  if (!qword_2568188E8)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_237844CF8(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  _OWORD v15[2];
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568189F8);
  v2 = sub_237851BF0();
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
    sub_237841AA0(v6, (uint64_t)v15, &qword_256818A28);
    result = sub_23783E2EC((uint64_t)v15);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v9 = v3[6] + 40 * result;
    v10 = v15[0];
    v11 = v15[1];
    *(_QWORD *)(v9 + 32) = v16;
    *(_OWORD *)v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    result = (unint64_t)sub_23783FCD4(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 72;
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

unint64_t sub_237844E38(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256818A18);
  v2 = sub_237851BF0();
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
    sub_237841AA0(v6, (uint64_t)&v15, &qword_256818A20);
    v7 = v15;
    v8 = v16;
    result = sub_23783E31C(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = sub_237848934((uint64_t)&v17, v3[7] + 32 * result);
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
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

uint64_t CarCommandsToggleSnippetUpdateValue.toggleIsOn.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

CarCommandsUIFramework::CarCommandsToggleSnippetUpdateValue __swiftcall CarCommandsToggleSnippetUpdateValue.init(toggleIsOn:)(CarCommandsUIFramework::CarCommandsToggleSnippetUpdateValue toggleIsOn)
{
  CarCommandsUIFramework::CarCommandsToggleSnippetUpdateValue *v1;

  v1->toggleIsOn = toggleIsOn.toggleIsOn;
  return toggleIsOn;
}

uint64_t sub_237844F7C()
{
  return 1;
}

uint64_t sub_237844F88()
{
  return sub_237851CBC();
}

uint64_t sub_237844FB0()
{
  return 0x7349656C67676F74;
}

uint64_t sub_237844FCC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x7349656C67676F74 && a2 == 0xEA00000000006E4FLL)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_237851C98();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

void sub_23784506C(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_237845078()
{
  sub_2378451B0();
  return sub_237851CF8();
}

uint64_t sub_2378450A0()
{
  sub_2378451B0();
  return sub_237851D04();
}

uint64_t CarCommandsToggleSnippetUpdateValue.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818920);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2378451B0();
  sub_237851CEC();
  sub_237851C68();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_2378451B0()
{
  unint64_t result;

  result = qword_256818928;
  if (!qword_256818928)
  {
    result = MEMORY[0x23B81CC08](&unk_237853980, &type metadata for CarCommandsToggleSnippetUpdateValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818928);
  }
  return result;
}

uint64_t CarCommandsToggleSnippetUpdateValue.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v9;
  uint64_t v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818930);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2378451B0();
  sub_237851CE0();
  if (!v2)
  {
    v9 = sub_237851C2C();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9 & 1;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_2378452FC()
{
  sub_2378474E0();
  sub_237847524();
  return sub_237851680();
}

uint64_t sub_237845364()
{
  sub_2378474E0();
  sub_237847524();
  return sub_237851674();
}

uint64_t sub_2378453B4@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return CarCommandsToggleSnippetUpdateValue.init(from:)(a1, a2);
}

uint64_t sub_2378453C8(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818920);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2378451B0();
  sub_237851CEC();
  sub_237851C68();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t CarCommandsToggleSnippetUpdateFailure.failureText.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

CarCommandsUIFramework::CarCommandsToggleSnippetUpdateFailure __swiftcall CarCommandsToggleSnippetUpdateFailure.init(failureText:)(CarCommandsUIFramework::CarCommandsToggleSnippetUpdateFailure failureText)
{
  CarCommandsUIFramework::CarCommandsToggleSnippetUpdateFailure *v1;

  *v1 = failureText;
  return failureText;
}

uint64_t sub_2378454E4()
{
  sub_237851CB0();
  sub_237851CBC();
  return sub_237851CD4();
}

uint64_t sub_237845524()
{
  sub_237851CB0();
  sub_237851CBC();
  return sub_237851CD4();
}

uint64_t sub_237845560()
{
  return 0x546572756C696166;
}

uint64_t sub_237845580@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x546572756C696166 && a2 == 0xEB00000000747865)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_237851C98();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_23784562C()
{
  sub_237845768();
  return sub_237851CF8();
}

uint64_t sub_237845654()
{
  sub_237845768();
  return sub_237851D04();
}

uint64_t CarCommandsToggleSnippetUpdateFailure.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818938);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_237845768();
  sub_237851CEC();
  sub_237851C5C();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_237845768()
{
  unint64_t result;

  result = qword_256818940;
  if (!qword_256818940)
  {
    result = MEMORY[0x23B81CC08](&unk_237853930, &type metadata for CarCommandsToggleSnippetUpdateFailure.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818940);
  }
  return result;
}

uint64_t CarCommandsToggleSnippetUpdateFailure.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
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

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818948);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_237845768();
  sub_237851CE0();
  if (!v2)
  {
    v9 = sub_237851C20();
    v11 = v10;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9;
    a2[1] = v11;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_2378458C8()
{
  sub_237847644();
  sub_237847688();
  return sub_237851680();
}

uint64_t sub_237845930()
{
  sub_237847644();
  sub_237847688();
  return sub_237851674();
}

uint64_t sub_237845980@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return CarCommandsToggleSnippetUpdateFailure.init(from:)(a1, a2);
}

uint64_t sub_237845994(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818938);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_237845768();
  sub_237851CEC();
  sub_237851C5C();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t CarCommandsToggleSnippet.body.getter@<X0>(uint64_t a1@<X8>)
{
  __int128 *v1;
  int *v2;
  uint64_t v3;
  uint64_t *v4;
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
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t (*v22)();
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t *boxed_opaque_existential_1;
  uint64_t (**v34)();
  char *v35;
  char *v36;
  __int128 v37;
  char *v38;
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
  uint64_t *v49;
  _OWORD *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  char *v62;
  _OWORD *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;
  uint64_t v73;
  char *v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  __int128 v85;
  unint64_t v86;
  unint64_t v87;
  unint64_t v88;
  unint64_t v89;
  uint64_t v90[2];
  char v91;
  int *v92;
  uint64_t v93;
  __int128 v94;
  uint64_t v95;
  uint64_t v96;
  __int128 v97;
  __int128 v98;
  uint64_t v99;
  __int128 v100;
  __int128 v101;
  uint64_t v102;
  __int128 v103;
  _OWORD v104[3];
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  _OWORD v111[3];
  __int128 v112;
  __int128 v113;
  _OWORD v114[2];
  __int128 v115;

  v84 = a1;
  v2 = (int *)type metadata accessor for CarCommandsToggleButton();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (uint64_t *)((char *)&v73 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = sub_237851A4C();
  v6 = *(_QWORD *)(v5 - 8);
  v76 = v5;
  v77 = v6;
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v73 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818950);
  v79 = *(_QWORD *)(v9 - 8);
  v80 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v74 = (char *)&v73 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818958);
  MEMORY[0x24BDAC7A8](v78);
  v75 = (char *)&v73 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818960);
  v13 = *(_QWORD *)(v12 - 8);
  v82 = v12;
  v83 = v13;
  MEMORY[0x24BDAC7A8](v12);
  v81 = (char *)&v73 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = v1[11];
  v111[0] = v1[10];
  v111[1] = v15;
  v16 = v1[13];
  v111[2] = v1[12];
  v112 = v16;
  v17 = v1[7];
  v107 = v1[6];
  v108 = v17;
  v18 = v1[9];
  v109 = v1[8];
  v110 = v18;
  v19 = v1[3];
  v104[1] = v1[2];
  v104[2] = v19;
  v20 = v1[5];
  v105 = v1[4];
  v106 = v20;
  v21 = v1[1];
  v103 = *v1;
  v104[0] = v21;
  v85 = *(_OWORD *)((char *)&v111[1] + 8);
  v86 = *((_QWORD *)&v111[2] + 1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256818968);
  sub_237851950();
  v87 = MEMORY[0x24BEE0D00];
  v88 = MEMORY[0x24BEAE5B8];
  v85 = v100;
  v102 = 0;
  v100 = 0u;
  v101 = 0u;
  v99 = 0;
  v97 = 0u;
  v98 = 0u;
  v115 = *(_OWORD *)((char *)&v104[1] + 8);
  v95 = MEMORY[0x24BEE0D00];
  v96 = MEMORY[0x24BEAE5B8];
  v94 = *(_OWORD *)((char *)&v104[1] + 8);
  v22 = (uint64_t (*)())swift_allocObject();
  v23 = v111[1];
  *((_OWORD *)v22 + 11) = v111[0];
  *((_OWORD *)v22 + 12) = v23;
  v24 = v112;
  *((_OWORD *)v22 + 13) = v111[2];
  *((_OWORD *)v22 + 14) = v24;
  v25 = v108;
  *((_OWORD *)v22 + 7) = v107;
  *((_OWORD *)v22 + 8) = v25;
  v26 = v110;
  *((_OWORD *)v22 + 9) = v109;
  *((_OWORD *)v22 + 10) = v26;
  v27 = v104[2];
  *((_OWORD *)v22 + 3) = v104[1];
  *((_OWORD *)v22 + 4) = v27;
  v28 = v106;
  *((_OWORD *)v22 + 5) = v105;
  *((_OWORD *)v22 + 6) = v28;
  v29 = v104[0];
  *((_OWORD *)v22 + 1) = v103;
  *((_OWORD *)v22 + 2) = v29;
  v113 = *(_OWORD *)((char *)v111 + 8);
  sub_23784634C((uint64_t)&v115);
  sub_237846374((uint64_t)&v103);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256818970);
  sub_237851968();
  v30 = v90[0];
  v31 = v90[1];
  v32 = v91;
  v113 = v103;
  v114[0] = v104[0];
  *(_DWORD *)((char *)v114 + 15) = *(_DWORD *)((char *)v104 + 15);
  v92 = v2;
  v93 = sub_237835D18(&qword_256818978, (uint64_t (*)(uint64_t))type metadata accessor for CarCommandsToggleButton, (uint64_t)&protocol conformance descriptor for CarCommandsToggleButton);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v90);
  *v4 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256818530);
  swift_storeEnumTagMultiPayload();
  v34 = (uint64_t (**)())((char *)v4 + v2[6]);
  *v34 = sub_237846344;
  v34[1] = v22;
  v35 = (char *)v4 + v2[5];
  *(_QWORD *)v35 = v30;
  *((_QWORD *)v35 + 1) = v31;
  v35[16] = v32;
  v36 = (char *)v4 + v2[7];
  v37 = v114[0];
  *(_OWORD *)v36 = v113;
  *((_OWORD *)v36 + 1) = v37;
  *(_DWORD *)(v36 + 31) = *(_DWORD *)((char *)v114 + 15);
  sub_237847360((uint64_t)v4, (uint64_t)boxed_opaque_existential_1);
  sub_2378419E4((uint64_t)&v113);
  sub_237851A40();
  sub_237835D18(&qword_256818980, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE228], MEMORY[0x24BEAE208]);
  v38 = v74;
  v39 = v76;
  sub_2378518B4();
  (*(void (**)(char *, uint64_t))(v77 + 8))(v8, v39);
  v41 = *((_QWORD *)&v109 + 1);
  v40 = v110;
  sub_237851A7C();
  sub_237835D18((unint64_t *)&qword_256817B20, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE580], MEMORY[0x24BEAE520]);
  swift_bridgeObjectRetain();
  v42 = sub_237851770();
  v44 = v43;
  v46 = v79;
  v45 = v80;
  v47 = (uint64_t)v75;
  (*(void (**)(char *, char *, uint64_t))(v79 + 16))(v75, v38, v80);
  v48 = v78;
  v49 = (uint64_t *)(v47 + *(int *)(v78 + 36));
  *v49 = v42;
  v49[1] = v44;
  v49[2] = v41;
  v49[3] = v40;
  (*(void (**)(char *, uint64_t))(v46 + 8))(v38, v45);
  v50 = (_OWORD *)swift_allocObject();
  v51 = v111[1];
  v50[11] = v111[0];
  v50[12] = v51;
  v52 = v112;
  v50[13] = v111[2];
  v50[14] = v52;
  v53 = v108;
  v50[7] = v107;
  v50[8] = v53;
  v54 = v110;
  v50[9] = v109;
  v50[10] = v54;
  v55 = v104[2];
  v50[3] = v104[1];
  v50[4] = v55;
  v56 = v106;
  v50[5] = v105;
  v50[6] = v56;
  v57 = v104[0];
  v50[1] = v103;
  v50[2] = v57;
  sub_237846374((uint64_t)&v103);
  v58 = sub_2378473B0();
  v59 = sub_23784749C();
  v60 = sub_2378474E0();
  v61 = sub_237847524();
  v62 = v81;
  sub_237851860();
  swift_release();
  sub_237841228(v47, &qword_256818958);
  v63 = (_OWORD *)swift_allocObject();
  v64 = v111[1];
  v63[11] = v111[0];
  v63[12] = v64;
  v65 = v112;
  v63[13] = v111[2];
  v63[14] = v65;
  v66 = v108;
  v63[7] = v107;
  v63[8] = v66;
  v67 = v110;
  v63[9] = v109;
  v63[10] = v67;
  v68 = v104[2];
  v63[3] = v104[1];
  v63[4] = v68;
  v69 = v106;
  v63[5] = v105;
  v63[6] = v69;
  v70 = v104[0];
  v63[1] = v103;
  v63[2] = v70;
  sub_237846374((uint64_t)&v103);
  *(_QWORD *)&v85 = v48;
  *((_QWORD *)&v85 + 1) = &type metadata for CarCommandsToggleSnippetUpdateValue;
  v86 = v58;
  v87 = v59;
  v88 = v60;
  v89 = v61;
  swift_getOpaqueTypeConformance2();
  sub_237847600();
  sub_237847644();
  sub_237847688();
  v71 = v82;
  sub_237851860();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v83 + 8))(v62, v71);
}

uint64_t sub_2378460A8(uint64_t a1)
{
  uint64_t v2;
  os_log_type_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t result;

  sub_237851B78();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_237851AC4();
  swift_bridgeObjectRelease();
  sub_237851AC4();
  if (qword_256817AF8 != -1)
    swift_once();
  v2 = sub_2378516EC();
  __swift_project_value_buffer(v2, (uint64_t)qword_2568183E8);
  v3 = sub_237851AF4();
  sub_23783D490(v3, 8, 0xD00000000000009ALL, 0x80000002378553D0, 2036625250, 0xE400000000000000, 74, 0x20676E69646E6553, 0xE800000000000000);
  swift_bridgeObjectRelease();
  sub_237846374(a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256818970);
  sub_237851950();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256818968);
  sub_23785195C();
  v4 = *(void **)(a1 + 208);
  if (v4)
  {
    v5 = v4;
    sub_23784883C(a1);
    v6 = sub_237846460();
    sub_2378465E0(v6);
    swift_bridgeObjectRelease();
    sub_237851A64();

    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_237851A7C();
    sub_237835D18((unint64_t *)&qword_256817B20, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE580], MEMORY[0x24BEAE520]);
    result = sub_237851764();
    __break(1u);
  }
  return result;
}

uint64_t sub_237846344()
{
  uint64_t v0;

  return sub_2378460A8(v0 + 16);
}

uint64_t sub_23784634C(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_237846374(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 208);
  sub_23783B074();
  v3 = v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t sub_237846460()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t inited;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  char v13;

  v2 = v0[17];
  v1 = v0[18];
  v4 = v0[19];
  v3 = v0[20];
  __swift_instantiateConcreteTypeFromMangledName(&qword_256818A00);
  inited = swift_initStackObject();
  v6 = inited;
  *(_OWORD *)(inited + 16) = xmmword_237853520;
  *(_QWORD *)(inited + 32) = 0x4449707061;
  *(_QWORD *)(inited + 40) = 0xE500000000000000;
  v7 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 48) = v2;
  *(_QWORD *)(inited + 56) = v1;
  *(_QWORD *)(inited + 72) = v7;
  *(_QWORD *)(inited + 80) = 0x656D614E726163;
  *(_QWORD *)(inited + 88) = 0xE700000000000000;
  if (v3)
  {
    v8 = MEMORY[0x24BEE0D00];
  }
  else
  {
    v4 = 0;
    v8 = 0;
    *(_QWORD *)(inited + 112) = 0;
  }
  *(_QWORD *)(inited + 96) = v4;
  *(_QWORD *)(inited + 104) = v3;
  *(_QWORD *)(inited + 120) = v8;
  *(_QWORD *)(inited + 128) = 0x4974657070696E73;
  *(_QWORD *)(inited + 136) = 0xEB000000006E4F73;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256818970);
  sub_237851950();
  v9 = MEMORY[0x24BEE1328];
  *(_BYTE *)(v6 + 144) = (v13 & 1) == 0;
  *(_QWORD *)(v6 + 168) = v9;
  *(_QWORD *)(v6 + 176) = 0xD00000000000001BLL;
  *(_QWORD *)(v6 + 184) = 0x80000002378554C0;
  *(_QWORD *)(v6 + 216) = v9;
  *(_BYTE *)(v6 + 192) = 1;
  v10 = sub_237844E38(v6);
  v11 = sub_237846E10(v10);
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_2378465E0(uint64_t a1)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568189F8);
    v2 = sub_237851BF0();
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
    sub_23783DF0C(*(_QWORD *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(_QWORD *)&v39 = v19;
    *((_QWORD *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(_QWORD *)&v37[0] = v19;
    *((_QWORD *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_23783FCD4(v38, v32);
    v33 = v29;
    v34 = v30;
    v35 = v31;
    sub_23783FCD4(v32, v36);
    v29 = v33;
    v30 = v34;
    v31 = v35;
    sub_23783FCD4(v36, v37);
    sub_23783FCD4(v37, &v33);
    result = sub_237851B54();
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
    result = (uint64_t)sub_23783FCD4(&v33, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v9));
    ++*(_QWORD *)(v2 + 16);
  }
  v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_23784892C();
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

uint64_t sub_2378469A4()
{
  uint64_t v0;
  os_log_type_t v1;
  uint64_t v2;

  sub_237851B78();
  sub_237851AC4();
  sub_237851BB4();
  if (qword_256817AF8 != -1)
    swift_once();
  v0 = sub_2378516EC();
  __swift_project_value_buffer(v0, (uint64_t)qword_2568183E8);
  v1 = sub_237851AF4();
  sub_23783D490(v1, 8, 0xD00000000000009ALL, 0x80000002378553D0, 2036625250, 0xE400000000000000, 89, 0, 0xE000000000000000);
  swift_bridgeObjectRelease();
  v2 = sub_2378519B0();
  MEMORY[0x24BDAC7A8](v2);
  sub_237851758();
  return swift_release();
}

uint64_t sub_237846B2C(uint64_t a1)
{
  sub_237846374(a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256818970);
  sub_23785195C();
  sub_237851950();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256818968);
  sub_23785195C();
  return sub_23784883C(a1);
}

uint64_t sub_237846C14()
{
  uint64_t v0;
  os_log_type_t v1;
  uint64_t v2;

  sub_237851B78();
  sub_237851AC4();
  sub_237851BB4();
  sub_237851AC4();
  if (qword_256817AF8 != -1)
    swift_once();
  v0 = sub_2378516EC();
  __swift_project_value_buffer(v0, (uint64_t)qword_2568183E8);
  v1 = sub_237851AF4();
  sub_23783D490(v1, 8, 0xD00000000000009ALL, 0x80000002378553D0, 2036625250, 0xE400000000000000, 97, 0, 0xE000000000000000);
  swift_bridgeObjectRelease();
  v2 = sub_2378519B0();
  MEMORY[0x24BDAC7A8](v2);
  sub_237851758();
  return swift_release();
}

uint64_t sub_237846DB0()
{
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256818968);
  return sub_23785195C();
}

uint64_t sub_237846E10(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t result;
  int64_t v7;
  __int128 *v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  int64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  int64_t v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  _OWORD v34[3];
  uint64_t v35;
  _OWORD v36[2];
  __int128 v37;
  _OWORD v38[2];
  __int128 v39;
  _OWORD v40[2];
  uint64_t v41;
  uint64_t *v42;

  v2 = MEMORY[0x24BEE4B00];
  v41 = MEMORY[0x24BEE4B00];
  v31 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v30 = (unint64_t)(63 - v3) >> 6;
  v42 = &v35;
  result = swift_bridgeObjectRetain();
  v7 = 0;
  while (1)
  {
    if (v5)
    {
      v9 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v10 = v9 | (v7 << 6);
      goto LABEL_25;
    }
    v11 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
LABEL_41:
      __break(1u);
      goto LABEL_42;
    }
    if (v11 >= v30)
      goto LABEL_40;
    v12 = *(_QWORD *)(v31 + 8 * v11);
    v13 = v7 + 1;
    if (!v12)
    {
      v13 = v7 + 2;
      if (v7 + 2 >= v30)
        goto LABEL_40;
      v12 = *(_QWORD *)(v31 + 8 * v13);
      if (!v12)
      {
        v13 = v7 + 3;
        if (v7 + 3 >= v30)
          goto LABEL_40;
        v12 = *(_QWORD *)(v31 + 8 * v13);
        if (!v12)
        {
          v13 = v7 + 4;
          if (v7 + 4 >= v30)
            goto LABEL_40;
          v12 = *(_QWORD *)(v31 + 8 * v13);
          if (!v12)
            break;
        }
      }
    }
LABEL_24:
    v5 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v13 << 6);
    v7 = v13;
LABEL_25:
    v15 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v10);
    v17 = *v15;
    v16 = v15[1];
    sub_237841AA0(*(_QWORD *)(a1 + 56) + 32 * v10, (uint64_t)v40, &qword_256818A08);
    *(_QWORD *)&v39 = v17;
    *((_QWORD *)&v39 + 1) = v16;
    v37 = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    sub_237841AA0((uint64_t)v38, (uint64_t)&v32, &qword_256818A08);
    if (v33)
    {
      sub_23783FCD4(&v32, v36);
      v18 = v37;
      v34[2] = v37;
      sub_237848934((uint64_t)v38, (uint64_t)v42);
      sub_23783FCD4(v36, v34);
      v19 = *(_QWORD *)(v2 + 16);
      if (*(_QWORD *)(v2 + 24) <= v19)
      {
        v20 = v19 + 1;
        swift_bridgeObjectRetain();
        sub_23783E664(v20, 1);
        v2 = v41;
      }
      else
      {
        swift_bridgeObjectRetain();
      }
      sub_237851CB0();
      sub_237851AAC();
      result = sub_237851CD4();
      v21 = v2 + 64;
      v22 = -1 << *(_BYTE *)(v2 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v2 + 64 + 8 * (v23 >> 6))) != 0)
      {
        v25 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v2 + 64 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v26 = 0;
        v27 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v28 = v24 == v27;
          if (v24 == v27)
            v24 = 0;
          v26 |= v28;
          v29 = *(_QWORD *)(v21 + 8 * v24);
        }
        while (v29 == -1);
        v25 = __clz(__rbit64(~v29)) + (v24 << 6);
      }
      *(_QWORD *)(v21 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v25;
      *(_OWORD *)(*(_QWORD *)(v2 + 48) + 16 * v25) = v18;
      sub_23783FCD4(v34, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v25));
      ++*(_QWORD *)(v2 + 16);
      v8 = (__int128 *)v42;
    }
    else
    {
      swift_bridgeObjectRetain();
      sub_237841228((uint64_t)&v37, &qword_256818A10);
      v8 = &v32;
    }
    result = sub_237841228((uint64_t)v8, &qword_256818A08);
  }
  v14 = v7 + 5;
  if (v7 + 5 >= v30)
  {
LABEL_40:
    sub_23784892C();
    return v2;
  }
  v12 = *(_QWORD *)(v31 + 8 * v14);
  if (v12)
  {
    v13 = v7 + 5;
    goto LABEL_24;
  }
  while (1)
  {
    v13 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v13 >= v30)
      goto LABEL_40;
    v12 = *(_QWORD *)(v31 + 8 * v13);
    ++v14;
    if (v12)
      goto LABEL_24;
  }
LABEL_42:
  __break(1u);
  return result;
}

uint64_t CarCommandsToggleSnippet.asAnyView()()
{
  sub_23783196C();
  return sub_237851848();
}

uint64_t sub_237847248()
{
  sub_23783196C();
  return sub_237851848();
}

uint64_t sub_2378472C0()
{
  return sub_237851794();
}

uint64_t sub_2378472E0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_237851710();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_2378517A0();
}

uint64_t sub_237847360(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CarCommandsToggleButton();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2378473A8()
{
  return sub_2378469A4();
}

unint64_t sub_2378473B0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_256818988;
  if (!qword_256818988)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256818958);
    v2[2] = sub_237851A4C();
    v2[3] = sub_237835D18(&qword_256818980, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE228], MEMORY[0x24BEAE208]);
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = sub_237847458();
    result = MEMORY[0x23B81CC08](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256818988);
  }
  return result;
}

unint64_t sub_237847458()
{
  unint64_t result;

  result = qword_256818990;
  if (!qword_256818990)
  {
    result = MEMORY[0x23B81CC08](&unk_237854A28, &type metadata for CarCommandsBackgroundPunchoutModifier);
    atomic_store(result, (unint64_t *)&qword_256818990);
  }
  return result;
}

unint64_t sub_23784749C()
{
  unint64_t result;

  result = qword_256818998;
  if (!qword_256818998)
  {
    result = MEMORY[0x23B81CC08](&protocol conformance descriptor for CarCommandsToggleSnippetUpdateValue, &type metadata for CarCommandsToggleSnippetUpdateValue);
    atomic_store(result, (unint64_t *)&qword_256818998);
  }
  return result;
}

unint64_t sub_2378474E0()
{
  unint64_t result;

  result = qword_2568189A0;
  if (!qword_2568189A0)
  {
    result = MEMORY[0x23B81CC08](&protocol conformance descriptor for CarCommandsToggleSnippetUpdateValue, &type metadata for CarCommandsToggleSnippetUpdateValue);
    atomic_store(result, (unint64_t *)&qword_2568189A0);
  }
  return result;
}

unint64_t sub_237847524()
{
  unint64_t result;

  result = qword_2568189A8;
  if (!qword_2568189A8)
  {
    result = MEMORY[0x23B81CC08](&protocol conformance descriptor for CarCommandsToggleSnippetUpdateValue, &type metadata for CarCommandsToggleSnippetUpdateValue);
    atomic_store(result, (unint64_t *)&qword_2568189A8);
  }
  return result;
}

uint64_t objectdestroyTm_1()
{
  uint64_t v0;

  sub_23783AFDC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_2378475F8()
{
  return sub_237846C14();
}

unint64_t sub_237847600()
{
  unint64_t result;

  result = qword_2568189B0;
  if (!qword_2568189B0)
  {
    result = MEMORY[0x23B81CC08](&protocol conformance descriptor for CarCommandsToggleSnippetUpdateFailure, &type metadata for CarCommandsToggleSnippetUpdateFailure);
    atomic_store(result, (unint64_t *)&qword_2568189B0);
  }
  return result;
}

unint64_t sub_237847644()
{
  unint64_t result;

  result = qword_2568189B8;
  if (!qword_2568189B8)
  {
    result = MEMORY[0x23B81CC08](&protocol conformance descriptor for CarCommandsToggleSnippetUpdateFailure, &type metadata for CarCommandsToggleSnippetUpdateFailure);
    atomic_store(result, (unint64_t *)&qword_2568189B8);
  }
  return result;
}

unint64_t sub_237847688()
{
  unint64_t result;

  result = qword_2568189C0;
  if (!qword_2568189C0)
  {
    result = MEMORY[0x23B81CC08](&protocol conformance descriptor for CarCommandsToggleSnippetUpdateFailure, &type metadata for CarCommandsToggleSnippetUpdateFailure);
    atomic_store(result, (unint64_t *)&qword_2568189C0);
  }
  return result;
}

uint64_t sub_2378476CC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t getEnumTagSinglePayload for CarCommandsToggleSnippetUpdateValue(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for CarCommandsToggleSnippetUpdateValue(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2378477C8 + 4 * byte_237853535[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2378477FC + 4 * byte_237853530[v4]))();
}

uint64_t sub_2378477FC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_237847804(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23784780CLL);
  return result;
}

uint64_t sub_237847818(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x237847820);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_237847824(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23784782C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CarCommandsToggleSnippetUpdateValue()
{
  return &type metadata for CarCommandsToggleSnippetUpdateValue;
}

_QWORD *initializeBufferWithCopyOfBuffer for CarCommandsToggleSnippetUpdateFailure(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for CarCommandsToggleSnippetUpdateFailure()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for CarCommandsToggleSnippetUpdateFailure(_QWORD *a1, _QWORD *a2)
{
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

_QWORD *assignWithTake for CarCommandsToggleSnippetUpdateFailure(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CarCommandsToggleSnippetUpdateFailure(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for CarCommandsToggleSnippetUpdateFailure(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for CarCommandsToggleSnippetUpdateFailure()
{
  return &type metadata for CarCommandsToggleSnippetUpdateFailure;
}

void destroy for CarCommandsToggleSnippet(uint64_t a1)
{
  sub_23783AFDC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

}

uint64_t initializeWithCopy for CarCommandsToggleSnippet(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v23;

  v4 = *a2;
  v5 = a2[1];
  v6 = a2[2];
  v7 = a2[3];
  v8 = *((_BYTE *)a2 + 32);
  sub_23783B074();
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v7;
  *(_BYTE *)(a1 + 32) = v8;
  *(_WORD *)(a1 + 33) = *(_WORD *)((char *)a2 + 33);
  v9 = a2[6];
  *(_QWORD *)(a1 + 40) = a2[5];
  *(_QWORD *)(a1 + 48) = v9;
  v10 = a2[8];
  *(_QWORD *)(a1 + 56) = a2[7];
  *(_QWORD *)(a1 + 64) = v10;
  v11 = a2[10];
  *(_QWORD *)(a1 + 72) = a2[9];
  *(_QWORD *)(a1 + 80) = v11;
  v12 = a2[12];
  *(_QWORD *)(a1 + 88) = a2[11];
  *(_QWORD *)(a1 + 96) = v12;
  v13 = a2[14];
  *(_QWORD *)(a1 + 104) = a2[13];
  *(_QWORD *)(a1 + 112) = v13;
  v14 = a2[16];
  *(_QWORD *)(a1 + 120) = a2[15];
  *(_QWORD *)(a1 + 128) = v14;
  v15 = a2[18];
  *(_QWORD *)(a1 + 136) = a2[17];
  *(_QWORD *)(a1 + 144) = v15;
  v16 = a2[20];
  *(_QWORD *)(a1 + 152) = a2[19];
  *(_QWORD *)(a1 + 160) = v16;
  *(_BYTE *)(a1 + 168) = *((_BYTE *)a2 + 168);
  v17 = a2[23];
  *(_QWORD *)(a1 + 176) = a2[22];
  *(_QWORD *)(a1 + 184) = v17;
  v23 = a2[25];
  *(_QWORD *)(a1 + 192) = a2[24];
  *(_QWORD *)(a1 + 200) = v23;
  v19 = (void *)a2[26];
  v18 = a2[27];
  *(_QWORD *)(a1 + 208) = v19;
  *(_QWORD *)(a1 + 216) = v18;
  v20 = v19;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  v21 = v20;
  return a1;
}

uint64_t assignWithCopy for CarCommandsToggleSnippet(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  void *v9;
  void *v10;
  id v11;

  v4 = *a2;
  v5 = a2[1];
  v6 = a2[2];
  v7 = a2[3];
  v8 = *((_BYTE *)a2 + 32);
  sub_23783B074();
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v7;
  *(_BYTE *)(a1 + 32) = v8;
  sub_23783AFDC();
  *(_BYTE *)(a1 + 33) = *((_BYTE *)a2 + 33);
  *(_BYTE *)(a1 + 34) = *((_BYTE *)a2 + 34);
  *(_QWORD *)(a1 + 40) = a2[5];
  *(_QWORD *)(a1 + 48) = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = a2[7];
  *(_QWORD *)(a1 + 64) = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 72) = a2[9];
  *(_QWORD *)(a1 + 80) = a2[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 88) = a2[11];
  *(_QWORD *)(a1 + 96) = a2[12];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 104) = a2[13];
  *(_QWORD *)(a1 + 112) = a2[14];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 120) = a2[15];
  *(_QWORD *)(a1 + 128) = a2[16];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 136) = a2[17];
  *(_QWORD *)(a1 + 144) = a2[18];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 152) = a2[19];
  *(_QWORD *)(a1 + 160) = a2[20];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 168) = *((_BYTE *)a2 + 168);
  *(_QWORD *)(a1 + 176) = a2[22];
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 184) = a2[23];
  *(_QWORD *)(a1 + 192) = a2[24];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 200) = a2[25];
  swift_retain();
  swift_release();
  v9 = *(void **)(a1 + 208);
  v10 = (void *)a2[26];
  *(_QWORD *)(a1 + 208) = v10;
  v11 = v10;

  *(_QWORD *)(a1 + 216) = a2[27];
  return a1;
}

__n128 __swift_memcpy224_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __n128 result;
  __int128 v10;
  __int128 v11;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  v6 = *(_OWORD *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 112);
  v8 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v8;
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  result = *(__n128 *)(a2 + 160);
  v10 = *(_OWORD *)(a2 + 176);
  v11 = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 192) = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 208) = v11;
  *(__n128 *)(a1 + 160) = result;
  *(_OWORD *)(a1 + 176) = v10;
  return result;
}

uint64_t assignWithTake for CarCommandsToggleSnippet(uint64_t a1, uint64_t a2)
{
  char v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v4 = *(_BYTE *)(a2 + 32);
  v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 32) = v4;
  sub_23783AFDC();
  *(_BYTE *)(a1 + 33) = *(_BYTE *)(a2 + 33);
  *(_BYTE *)(a1 + 34) = *(_BYTE *)(a2 + 34);
  v6 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v9;
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = v10;
  swift_bridgeObjectRelease();
  v11 = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = v11;
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 144) = v12;
  swift_bridgeObjectRelease();
  v13 = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 160) = v13;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 168) = *(_BYTE *)(a2 + 168);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  swift_release();
  *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 192) = *(_OWORD *)(a2 + 192);
  swift_release();
  v14 = *(void **)(a1 + 208);
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);

  *(_QWORD *)(a1 + 216) = *(_QWORD *)(a2 + 216);
  return a1;
}

uint64_t getEnumTagSinglePayload for CarCommandsToggleSnippet(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 224))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 48);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CarCommandsToggleSnippet(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 216) = 0;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 224) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 48) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 224) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CarCommandsToggleSnippet()
{
  return &type metadata for CarCommandsToggleSnippet;
}

uint64_t sub_237847F90()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256818960);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256818958);
  sub_2378473B0();
  sub_23784749C();
  sub_2378474E0();
  sub_237847524();
  swift_getOpaqueTypeConformance2();
  sub_237847600();
  sub_237847644();
  sub_237847688();
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for CarCommandsToggleSnippet.DirectInvocationConfiguration()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for CarCommandsToggleSnippet.DirectInvocationConfiguration(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for CarCommandsToggleSnippet.DirectInvocationConfiguration(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithTake for CarCommandsToggleSnippet.DirectInvocationConfiguration(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CarCommandsToggleSnippet.DirectInvocationConfiguration(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CarCommandsToggleSnippet.DirectInvocationConfiguration(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CarCommandsToggleSnippet.DirectInvocationConfiguration()
{
  return &type metadata for CarCommandsToggleSnippet.DirectInvocationConfiguration;
}

uint64_t destroy for CarCommandsToggleSnippet.LabelConfiguration()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for CarCommandsToggleSnippet.LabelConfiguration(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  v7 = a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for CarCommandsToggleSnippet.LabelConfiguration(_QWORD *a1, _QWORD *a2)
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
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

_QWORD *assignWithTake for CarCommandsToggleSnippet.LabelConfiguration(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_bridgeObjectRelease();
  v8 = a2[9];
  a1[8] = a2[8];
  a1[9] = v8;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CarCommandsToggleSnippet.LabelConfiguration(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 80))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CarCommandsToggleSnippet.LabelConfiguration(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 80) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CarCommandsToggleSnippet.LabelConfiguration()
{
  return &type metadata for CarCommandsToggleSnippet.LabelConfiguration;
}

uint64_t sub_237848550()
{
  return 0;
}

ValueMetadata *type metadata accessor for CarCommandsToggleSnippetUpdateFailure.CodingKeys()
{
  return &type metadata for CarCommandsToggleSnippetUpdateFailure.CodingKeys;
}

uint64_t _s22CarCommandsUIFramework37CarCommandsToggleSnippetUpdateFailureV10CodingKeysOwet_0(unsigned int *a1, int a2)
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

uint64_t _s22CarCommandsUIFramework37CarCommandsToggleSnippetUpdateFailureV10CodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2378485F8 + 4 * byte_23785353A[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_237848618 + 4 * byte_23785353F[v4]))();
}

_BYTE *sub_2378485F8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_237848618(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_237848620(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_237848628(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_237848630(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_237848638(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for CarCommandsToggleSnippetUpdateValue.CodingKeys()
{
  return &type metadata for CarCommandsToggleSnippetUpdateValue.CodingKeys;
}

unint64_t sub_237848658()
{
  unint64_t result;

  result = qword_2568189C8;
  if (!qword_2568189C8)
  {
    result = MEMORY[0x23B81CC08](&unk_237853850, &type metadata for CarCommandsToggleSnippetUpdateValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568189C8);
  }
  return result;
}

unint64_t sub_2378486A0()
{
  unint64_t result;

  result = qword_2568189D0;
  if (!qword_2568189D0)
  {
    result = MEMORY[0x23B81CC08](&unk_237853908, &type metadata for CarCommandsToggleSnippetUpdateFailure.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568189D0);
  }
  return result;
}

unint64_t sub_2378486E8()
{
  unint64_t result;

  result = qword_2568189D8;
  if (!qword_2568189D8)
  {
    result = MEMORY[0x23B81CC08](&unk_237853878, &type metadata for CarCommandsToggleSnippetUpdateFailure.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568189D8);
  }
  return result;
}

unint64_t sub_237848730()
{
  unint64_t result;

  result = qword_2568189E0;
  if (!qword_2568189E0)
  {
    result = MEMORY[0x23B81CC08](&unk_2378538A0, &type metadata for CarCommandsToggleSnippetUpdateFailure.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568189E0);
  }
  return result;
}

unint64_t sub_237848778()
{
  unint64_t result;

  result = qword_2568189E8;
  if (!qword_2568189E8)
  {
    result = MEMORY[0x23B81CC08](&unk_2378537C0, &type metadata for CarCommandsToggleSnippetUpdateValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568189E8);
  }
  return result;
}

unint64_t sub_2378487C0()
{
  unint64_t result;

  result = qword_2568189F0;
  if (!qword_2568189F0)
  {
    result = MEMORY[0x23B81CC08](&unk_2378537E8, &type metadata for CarCommandsToggleSnippetUpdateValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568189F0);
  }
  return result;
}

uint64_t sub_237848804()
{
  return sub_237846DB0();
}

uint64_t sub_237848820()
{
  uint64_t v0;

  return sub_237846B2C(*(_QWORD *)(v0 + 16));
}

uint64_t sub_23784883C(uint64_t a1)
{
  void *v3;

  v3 = *(void **)(a1 + 208);
  sub_23783AFDC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return a1;
}

uint64_t sub_23784892C()
{
  return swift_release();
}

uint64_t sub_237848934(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818A08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t static CarCommandsSnippetsPluginModel.bundleName.getter()
{
  return 0xD000000000000013;
}

uint64_t sub_2378489A4(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_2378489E0 + 4 * byte_2378539D0[a1]))(0x616D7269666E6F63, 0xEC0000006E6F6974);
}

uint64_t sub_2378489E0()
{
  return 0x68636E7550707061;
}

uint64_t sub_237848A00()
{
  return 0x746174536B636F6CLL;
}

unint64_t sub_237848A24()
{
  return 0xD000000000000010;
}

uint64_t sub_237848ACC()
{
  return 12383;
}

uint64_t sub_237848ADC()
{
  sub_237849CEC();
  return sub_237851CF8();
}

uint64_t sub_237848B04()
{
  sub_237849CEC();
  return sub_237851D04();
}

uint64_t sub_237848B2C()
{
  sub_237849EC8();
  return sub_237851CF8();
}

uint64_t sub_237848B54()
{
  sub_237849EC8();
  return sub_237851D04();
}

uint64_t sub_237848B7C()
{
  sub_237849DB8();
  return sub_237851CF8();
}

uint64_t sub_237848BA4()
{
  sub_237849DB8();
  return sub_237851D04();
}

uint64_t sub_237848BCC()
{
  sub_237849CA8();
  return sub_237851CF8();
}

uint64_t sub_237848BF4()
{
  sub_237849CA8();
  return sub_237851D04();
}

uint64_t sub_237848C1C()
{
  sub_237849DFC();
  return sub_237851CF8();
}

uint64_t sub_237848C44()
{
  sub_237849DFC();
  return sub_237851D04();
}

uint64_t sub_237848C6C()
{
  unsigned __int8 *v0;

  return sub_2378489A4(*v0);
}

uint64_t sub_237848C74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23784D5B0(a1, a2);
  *a3 = result;
  return result;
}

void sub_237848C98(_BYTE *a1@<X8>)
{
  *a1 = 10;
}

uint64_t sub_237848CA4()
{
  sub_237849C20();
  return sub_237851CF8();
}

uint64_t sub_237848CCC()
{
  sub_237849C20();
  return sub_237851D04();
}

uint64_t sub_237848CF4()
{
  sub_237849F0C();
  return sub_237851CF8();
}

uint64_t sub_237848D1C()
{
  sub_237849F0C();
  return sub_237851D04();
}

uint64_t sub_237848D44()
{
  sub_237849E84();
  return sub_237851CF8();
}

uint64_t sub_237848D6C()
{
  sub_237849E84();
  return sub_237851D04();
}

uint64_t sub_237848D94()
{
  sub_237849D30();
  return sub_237851CF8();
}

uint64_t sub_237848DBC()
{
  sub_237849D30();
  return sub_237851D04();
}

uint64_t sub_237848DE4()
{
  sub_237849E40();
  return sub_237851CF8();
}

uint64_t sub_237848E0C()
{
  sub_237849E40();
  return sub_237851D04();
}

uint64_t sub_237848E34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
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
    v5 = sub_237851C98();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_237848EB0()
{
  sub_237849D74();
  return sub_237851CF8();
}

uint64_t sub_237848ED8()
{
  sub_237849D74();
  return sub_237851D04();
}

void CarCommandsSnippetsPluginModel.encode(to:)(_QWORD *a1)
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
  char *v31;
  uint64_t v32;
  char *v33;
  char *v34;
  _QWORD v35[2];
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  char *v44;
  char *v45;
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  char *v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818A30);
  v73 = *(_QWORD *)(v2 - 8);
  v74 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v72 = (char *)v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818A38);
  v70 = *(_QWORD *)(v4 - 8);
  v71 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v69 = (char *)v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v75 = type metadata accessor for CarCommandsDisambiguationSnippetModel(0);
  v6 = MEMORY[0x24BDAC7A8](v75);
  v68 = (char *)v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v67 = (char *)v35 - v8;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818A40);
  v65 = *(_QWORD *)(v9 - 8);
  v66 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v64 = (char *)v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = type metadata accessor for CarCommandsGaugeSnippetModel(0);
  MEMORY[0x24BDAC7A8](v61);
  v63 = (char *)v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818A48);
  v60 = *(_QWORD *)(v62 - 8);
  MEMORY[0x24BDAC7A8](v62);
  v59 = (char *)v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818A50);
  v57 = *(_QWORD *)(v58 - 8);
  MEMORY[0x24BDAC7A8](v58);
  v56 = (char *)v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818A58);
  v54 = *(_QWORD *)(v55 - 8);
  MEMORY[0x24BDAC7A8](v55);
  v53 = (char *)v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818A60);
  v51 = *(_QWORD *)(v52 - 8);
  MEMORY[0x24BDAC7A8](v52);
  v50 = (char *)v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818A68);
  v48 = *(_QWORD *)(v49 - 8);
  MEMORY[0x24BDAC7A8](v49);
  v46 = (char *)v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v76 = type metadata accessor for CarCommandsToggleSnippetModel(0);
  v17 = MEMORY[0x24BDAC7A8](v76);
  v47 = (char *)v35 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v45 = (char *)v35 - v20;
  v21 = MEMORY[0x24BDAC7A8](v19);
  v44 = (char *)v35 - v22;
  v23 = MEMORY[0x24BDAC7A8](v21);
  v43 = (char *)v35 - v24;
  MEMORY[0x24BDAC7A8](v23);
  v42 = (char *)v35 - v25;
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818A70);
  v40 = *(_QWORD *)(v41 - 8);
  MEMORY[0x24BDAC7A8](v41);
  v39 = (char *)v35 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = type metadata accessor for CarCommandsAppPunchoutSnippetModel(0);
  MEMORY[0x24BDAC7A8](v37);
  v38 = (char *)v35 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818A78);
  v35[1] = *(_QWORD *)(v36 - 8);
  MEMORY[0x24BDAC7A8](v36);
  v28 = type metadata accessor for CarCommandsConfirmationSnippetModel(0);
  MEMORY[0x24BDAC7A8](v28);
  v29 = type metadata accessor for CarCommandsSnippetsPluginModel();
  MEMORY[0x24BDAC7A8](v29);
  v31 = (char *)v35 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818A80);
  v79 = *(_QWORD *)(v78 - 8);
  MEMORY[0x24BDAC7A8](v78);
  v33 = (char *)v35 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_237849C20();
  v77 = v33;
  sub_237851CEC();
  sub_237849C64(v80, (uint64_t)v31);
  v34 = (char *)sub_2378494E0 + 4 * word_2378539DA[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_2378494E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_23783B658(v1, v2, type metadata accessor for CarCommandsConfirmationSnippetModel);
  *(_BYTE *)(v3 - 90) = 0;
  sub_237849F0C();
  v4 = *(_QWORD *)(v3 - 136);
  v5 = *(_QWORD *)(v3 - 128);
  sub_237851C50();
  sub_237835D18(&qword_256817D00, type metadata accessor for CarCommandsConfirmationSnippetModel, (uint64_t)&protocol conformance descriptor for CarCommandsConfirmationSnippetModel);
  v6 = *(_QWORD *)(v3 - 464);
  sub_237851C74();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 472) + 8))(v0, v6);
  sub_237833240(v2, type metadata accessor for CarCommandsConfirmationSnippetModel);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 112) + 8))(v4, v5);
}

uint64_t type metadata accessor for CarCommandsSnippetsPluginModel()
{
  uint64_t result;

  result = qword_256818BC0;
  if (!qword_256818BC0)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_237849C20()
{
  unint64_t result;

  result = qword_256818A88;
  if (!qword_256818A88)
  {
    result = MEMORY[0x23B81CC08](&unk_2378547B8, &type metadata for CarCommandsSnippetsPluginModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818A88);
  }
  return result;
}

uint64_t sub_237849C64(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CarCommandsSnippetsPluginModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_237849CA8()
{
  unint64_t result;

  result = qword_256818A90;
  if (!qword_256818A90)
  {
    result = MEMORY[0x23B81CC08](&unk_237854768, &type metadata for CarCommandsSnippetsPluginModel.CarNameDisambiguationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818A90);
  }
  return result;
}

unint64_t sub_237849CEC()
{
  unint64_t result;

  result = qword_256818A98;
  if (!qword_256818A98)
  {
    result = MEMORY[0x23B81CC08](&unk_237854718, &type metadata for CarCommandsSnippetsPluginModel.AppDisambiguationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818A98);
  }
  return result;
}

unint64_t sub_237849D30()
{
  unint64_t result;

  result = qword_256818AA0;
  if (!qword_256818AA0)
  {
    result = MEMORY[0x23B81CC08](&unk_2378546C8, &type metadata for CarCommandsSnippetsPluginModel.PowerLevelStatusModelCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818AA0);
  }
  return result;
}

unint64_t sub_237849D74()
{
  unint64_t result;

  result = qword_256818AA8;
  if (!qword_256818AA8)
  {
    result = MEMORY[0x23B81CC08](&unk_237854678, &type metadata for CarCommandsSnippetsPluginModel.VisibleSignalStatusModelCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818AA8);
  }
  return result;
}

unint64_t sub_237849DB8()
{
  unint64_t result;

  result = qword_256818AB0;
  if (!qword_256818AB0)
  {
    result = MEMORY[0x23B81CC08](&unk_237854628, &type metadata for CarCommandsSnippetsPluginModel.AudibleSignalStatusModelCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818AB0);
  }
  return result;
}

unint64_t sub_237849DFC()
{
  unint64_t result;

  result = qword_256818AB8;
  if (!qword_256818AB8)
  {
    result = MEMORY[0x23B81CC08](&unk_2378545D8, &type metadata for CarCommandsSnippetsPluginModel.ClimateStatusModelCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818AB8);
  }
  return result;
}

unint64_t sub_237849E40()
{
  unint64_t result;

  result = qword_256818AC0;
  if (!qword_256818AC0)
  {
    result = MEMORY[0x23B81CC08](&unk_237854588, &type metadata for CarCommandsSnippetsPluginModel.TrunkStatusModelCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818AC0);
  }
  return result;
}

unint64_t sub_237849E84()
{
  unint64_t result;

  result = qword_256818AC8;
  if (!qword_256818AC8)
  {
    result = MEMORY[0x23B81CC08](&unk_237854538, &type metadata for CarCommandsSnippetsPluginModel.LockStatusModelCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818AC8);
  }
  return result;
}

unint64_t sub_237849EC8()
{
  unint64_t result;

  result = qword_256818AD0;
  if (!qword_256818AD0)
  {
    result = MEMORY[0x23B81CC08](&unk_2378544E8, &type metadata for CarCommandsSnippetsPluginModel.AppPunchoutCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818AD0);
  }
  return result;
}

unint64_t sub_237849F0C()
{
  unint64_t result;

  result = qword_256818AD8;
  if (!qword_256818AD8)
  {
    result = MEMORY[0x23B81CC08](&unk_237854498, &type metadata for CarCommandsSnippetsPluginModel.ConfirmationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818AD8);
  }
  return result;
}

uint64_t CarCommandsSnippetsPluginModel.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t *v48;
  uint64_t v49;
  _QWORD v51[12];
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
  char *v70;
  char *v71;
  char *v72;
  char *v73;
  char *v74;
  char *v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  char *v82;
  char *v83;
  char *v84;
  uint64_t v85;
  _QWORD *v86;
  uint64_t v87;

  v77 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818AE0);
  v68 = *(_QWORD *)(v3 - 8);
  v69 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v84 = (char *)v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818AE8);
  v66 = *(_QWORD *)(v67 - 8);
  MEMORY[0x24BDAC7A8](v67);
  v76 = (char *)v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818AF0);
  v64 = *(_QWORD *)(v65 - 8);
  MEMORY[0x24BDAC7A8](v65);
  v75 = (char *)v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818AF8);
  v62 = *(_QWORD *)(v63 - 8);
  MEMORY[0x24BDAC7A8](v63);
  v74 = (char *)v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818B00);
  v61 = *(_QWORD *)(v60 - 8);
  MEMORY[0x24BDAC7A8](v60);
  v73 = (char *)v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818B08);
  v58 = *(_QWORD *)(v59 - 8);
  MEMORY[0x24BDAC7A8](v59);
  v82 = (char *)v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818B10);
  v56 = *(_QWORD *)(v57 - 8);
  MEMORY[0x24BDAC7A8](v57);
  v72 = (char *)v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818B18);
  v54 = *(_QWORD *)(v55 - 8);
  MEMORY[0x24BDAC7A8](v55);
  v81 = (char *)v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818B20);
  v80 = *(_QWORD *)(v53 - 8);
  MEMORY[0x24BDAC7A8](v53);
  v71 = (char *)v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818B28);
  v51[11] = *(_QWORD *)(v52 - 8);
  MEMORY[0x24BDAC7A8](v52);
  v70 = (char *)v51 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818B30);
  v79 = *(_QWORD *)(v85 - 8);
  MEMORY[0x24BDAC7A8](v85);
  v15 = (char *)v51 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v78 = type metadata accessor for CarCommandsSnippetsPluginModel();
  v16 = MEMORY[0x24BDAC7A8](v78);
  v51[10] = (char *)v51 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v51[9] = (char *)v51 - v19;
  v20 = MEMORY[0x24BDAC7A8](v18);
  v51[8] = (char *)v51 - v21;
  v22 = MEMORY[0x24BDAC7A8](v20);
  v51[7] = (char *)v51 - v23;
  v24 = MEMORY[0x24BDAC7A8](v22);
  v51[6] = (char *)v51 - v25;
  v26 = MEMORY[0x24BDAC7A8](v24);
  v51[5] = (char *)v51 - v27;
  v28 = MEMORY[0x24BDAC7A8](v26);
  v30 = (char *)v51 - v29;
  v31 = MEMORY[0x24BDAC7A8](v28);
  v33 = (char *)v51 - v32;
  v34 = MEMORY[0x24BDAC7A8](v31);
  v36 = (char *)v51 - v35;
  v37 = MEMORY[0x24BDAC7A8](v34);
  v39 = (char *)v51 - v38;
  MEMORY[0x24BDAC7A8](v37);
  v41 = (char *)v51 - v40;
  v42 = a1[3];
  v86 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v42);
  sub_237849C20();
  v83 = v15;
  v43 = v87;
  sub_237851CE0();
  if (!v43)
  {
    v51[0] = v36;
    v51[1] = v33;
    v51[2] = v30;
    v51[3] = v39;
    v87 = 0;
    v51[4] = v41;
    v44 = v83;
    v45 = sub_237851C44();
    if (*(_QWORD *)(v45 + 16) == 1)
      __asm { BR              X10 }
    v46 = sub_237851B9C();
    swift_allocError();
    v48 = v47;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256818B38);
    *v48 = v78;
    v49 = v85;
    sub_237851C14();
    sub_237851B90();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v46 - 8) + 104))(v48, *MEMORY[0x24BEE26D0], v46);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v79 + 8))(v44, v49);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v86);
}

uint64_t sub_23784B054()
{
  return sub_237835D18(&qword_256818B40, (uint64_t (*)(uint64_t))type metadata accessor for CarCommandsSnippetsPluginModel, (uint64_t)&protocol conformance descriptor for CarCommandsSnippetsPluginModel);
}

uint64_t sub_23784B080()
{
  return sub_237835D18(&qword_256818B48, (uint64_t (*)(uint64_t))type metadata accessor for CarCommandsSnippetsPluginModel, (uint64_t)&protocol conformance descriptor for CarCommandsSnippetsPluginModel);
}

unint64_t sub_23784B0AC()
{
  return 0xD000000000000013;
}

uint64_t sub_23784B0CC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return CarCommandsSnippetsPluginModel.init(from:)(a1, a2);
}

void sub_23784B0E0(_QWORD *a1)
{
  CarCommandsSnippetsPluginModel.encode(to:)(a1);
}

uint64_t initializeBufferWithCopyOfBuffer for CarCommandsSnippetsPluginModel(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) == 0)
  {
    v5 = (char *)&loc_23784B14C + 4 * word_237853A02[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  v6 = *a2;
  *a1 = *a2;
  v7 = v6 + ((v4 + 16) & ~(unint64_t)v4);
  swift_retain();
  return v7;
}

uint64_t destroy for CarCommandsSnippetsPluginModel(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);

  result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
      v22 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8);
      v22(a1, v12);
      v13 = type metadata accessor for CarCommandsConfirmationSnippetModel(0);
      goto LABEL_7;
    case 1:
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
      v22 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8);
      v22(a1, v12);
      v13 = type metadata accessor for CarCommandsAppPunchoutSnippetModel(0);
LABEL_7:
      v14 = *(int *)(v13 + 20);
      goto LABEL_9;
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
      v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
      v4 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8);
      v4(a1, v3);
      v5 = (int *)type metadata accessor for CarCommandsToggleSnippetModel(0);
      v4(a1 + v5[5], v3);
      v4(a1 + v5[6], v3);
      v4(a1 + v5[7], v3);
      v4(a1 + v5[8], v3);
      v6 = a1 + v5[9];
      v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B08);
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
      v4(a1 + v5[10], v3);
      v8 = a1 + v5[11];
      v9 = &qword_256817B18;
      goto LABEL_4;
    case 7:
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
      v22 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8);
      v22(a1, v12);
      v15 = (int *)type metadata accessor for CarCommandsGaugeSnippetModel(0);
      v22(a1 + v15[5], v12);
      v16 = a1 + v15[6];
      v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 8))(v16, v17);
      v18 = a1 + v15[7];
      v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817C58);
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 8))(v18, v19);
      v20 = a1 + v15[8];
      v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B08);
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 8))(v20, v21);
      v14 = v15[9];
LABEL_9:
      result = ((uint64_t (*)(uint64_t, uint64_t))v22)(a1 + v14, v12);
      break;
    case 8:
    case 9:
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(a1, v10);
      v8 = a1 + *(int *)(type metadata accessor for CarCommandsDisambiguationSnippetModel(0) + 20);
      v9 = &qword_256817C88;
LABEL_4:
      v11 = __swift_instantiateConcreteTypeFromMangledName(v9);
      result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v8, v11);
      break;
    default:
      return result;
  }
  return result;
}

void initializeWithCopy for CarCommandsSnippetsPluginModel()
{
  char *v0;

  v0 = (char *)sub_23784BC48 + 4 * byte_237853A20[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23784BC48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t, uint64_t);
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16);
  v3(v0, v1, v2);
  v4 = (int *)type metadata accessor for CarCommandsToggleSnippetModel(0);
  v3(v0 + v4[5], v1 + v4[5], v2);
  v3(v0 + v4[6], v1 + v4[6], v2);
  v3(v0 + v4[7], v1 + v4[7], v2);
  v3(v0 + v4[8], v1 + v4[8], v2);
  v5 = v4[9];
  v6 = v0 + v5;
  v7 = v1 + v5;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v6, v7, v8);
  v3(v0 + v4[10], v1 + v4[10], v2);
  v9 = v4[11];
  v10 = v0 + v9;
  v11 = v1 + v9;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
  swift_storeEnumTagMultiPayload();
  return v0;
}

uint64_t assignWithCopy for CarCommandsSnippetsPluginModel(uint64_t result, uint64_t a2)
{
  char *v2;

  if (result != a2)
  {
    sub_237833240(result, (uint64_t (*)(_QWORD))type metadata accessor for CarCommandsSnippetsPluginModel);
    v2 = (char *)&loc_23784BF8C + 4 * byte_237853A2A[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  return result;
}

void initializeWithTake for CarCommandsSnippetsPluginModel()
{
  char *v0;

  v0 = (char *)sub_23784C2B8 + 4 * byte_237853A34[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23784C2B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t, uint64_t);
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 32);
  v3(v0, v1, v2);
  v4 = (int *)type metadata accessor for CarCommandsToggleSnippetModel(0);
  v3(v0 + v4[5], v1 + v4[5], v2);
  v3(v0 + v4[6], v1 + v4[6], v2);
  v3(v0 + v4[7], v1 + v4[7], v2);
  v3(v0 + v4[8], v1 + v4[8], v2);
  v5 = v4[9];
  v6 = v0 + v5;
  v7 = v1 + v5;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v6, v7, v8);
  v3(v0 + v4[10], v1 + v4[10], v2);
  v9 = v4[11];
  v10 = v0 + v9;
  v11 = v1 + v9;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
  swift_storeEnumTagMultiPayload();
  return v0;
}

uint64_t assignWithTake for CarCommandsSnippetsPluginModel(uint64_t result, uint64_t a2)
{
  char *v2;

  if (result != a2)
  {
    sub_237833240(result, (uint64_t (*)(_QWORD))type metadata accessor for CarCommandsSnippetsPluginModel);
    v2 = (char *)&loc_23784C5FC + 4 * byte_237853A3E[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  return result;
}

uint64_t getEnumTagSinglePayload for CarCommandsSnippetsPluginModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for CarCommandsSnippetsPluginModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_23784C8F0()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_23784C900()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  result = type metadata accessor for CarCommandsConfirmationSnippetModel(319);
  if (v1 <= 0x3F)
  {
    result = type metadata accessor for CarCommandsAppPunchoutSnippetModel(319);
    if (v2 <= 0x3F)
    {
      result = type metadata accessor for CarCommandsToggleSnippetModel(319);
      if (v3 <= 0x3F)
      {
        result = type metadata accessor for CarCommandsGaugeSnippetModel(319);
        if (v4 <= 0x3F)
        {
          result = type metadata accessor for CarCommandsDisambiguationSnippetModel(319);
          if (v5 <= 0x3F)
          {
            swift_initEnumMetadataMultiPayload();
            return 0;
          }
        }
      }
    }
  }
  return result;
}

uint64_t getEnumTagSinglePayload for CarCommandsSnippetsPluginModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF7)
    goto LABEL_17;
  if (a2 + 9 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 9) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 9;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 9;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 9;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xA;
  v8 = v6 - 10;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for CarCommandsSnippetsPluginModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 9 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 9) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF7)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF6)
    return ((uint64_t (*)(void))((char *)&loc_23784CAB8 + 4 * byte_237853A4D[v4]))();
  *a1 = a2 + 9;
  return ((uint64_t (*)(void))((char *)sub_23784CAEC + 4 * byte_237853A48[v4]))();
}

uint64_t sub_23784CAEC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23784CAF4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23784CAFCLL);
  return result;
}

uint64_t sub_23784CB08(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23784CB10);
  *(_BYTE *)result = a2 + 9;
  return result;
}

uint64_t sub_23784CB14(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23784CB1C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CarCommandsSnippetsPluginModel.CodingKeys()
{
  return &type metadata for CarCommandsSnippetsPluginModel.CodingKeys;
}

ValueMetadata *type metadata accessor for CarCommandsSnippetsPluginModel.ConfirmationCodingKeys()
{
  return &type metadata for CarCommandsSnippetsPluginModel.ConfirmationCodingKeys;
}

ValueMetadata *type metadata accessor for CarCommandsSnippetsPluginModel.AppPunchoutCodingKeys()
{
  return &type metadata for CarCommandsSnippetsPluginModel.AppPunchoutCodingKeys;
}

ValueMetadata *type metadata accessor for CarCommandsSnippetsPluginModel.LockStatusModelCodingKeys()
{
  return &type metadata for CarCommandsSnippetsPluginModel.LockStatusModelCodingKeys;
}

ValueMetadata *type metadata accessor for CarCommandsSnippetsPluginModel.TrunkStatusModelCodingKeys()
{
  return &type metadata for CarCommandsSnippetsPluginModel.TrunkStatusModelCodingKeys;
}

ValueMetadata *type metadata accessor for CarCommandsSnippetsPluginModel.ClimateStatusModelCodingKeys()
{
  return &type metadata for CarCommandsSnippetsPluginModel.ClimateStatusModelCodingKeys;
}

ValueMetadata *type metadata accessor for CarCommandsSnippetsPluginModel.AudibleSignalStatusModelCodingKeys()
{
  return &type metadata for CarCommandsSnippetsPluginModel.AudibleSignalStatusModelCodingKeys;
}

ValueMetadata *type metadata accessor for CarCommandsSnippetsPluginModel.VisibleSignalStatusModelCodingKeys()
{
  return &type metadata for CarCommandsSnippetsPluginModel.VisibleSignalStatusModelCodingKeys;
}

ValueMetadata *type metadata accessor for CarCommandsSnippetsPluginModel.PowerLevelStatusModelCodingKeys()
{
  return &type metadata for CarCommandsSnippetsPluginModel.PowerLevelStatusModelCodingKeys;
}

ValueMetadata *type metadata accessor for CarCommandsSnippetsPluginModel.AppDisambiguationCodingKeys()
{
  return &type metadata for CarCommandsSnippetsPluginModel.AppDisambiguationCodingKeys;
}

uint64_t _s22CarCommandsUIFramework30CarCommandsSnippetsPluginModelO22ConfirmationCodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23784CC0C + 4 * byte_237853A52[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23784CC2C + 4 * byte_237853A57[v4]))();
}

_BYTE *sub_23784CC0C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23784CC2C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23784CC34(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23784CC3C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23784CC44(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23784CC4C(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for CarCommandsSnippetsPluginModel.CarNameDisambiguationCodingKeys()
{
  return &type metadata for CarCommandsSnippetsPluginModel.CarNameDisambiguationCodingKeys;
}

unint64_t sub_23784CC6C()
{
  unint64_t result;

  result = qword_256818BF8;
  if (!qword_256818BF8)
  {
    result = MEMORY[0x23B81CC08](&unk_237853D40, &type metadata for CarCommandsSnippetsPluginModel.CarNameDisambiguationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818BF8);
  }
  return result;
}

unint64_t sub_23784CCB4()
{
  unint64_t result;

  result = qword_256818C00;
  if (!qword_256818C00)
  {
    result = MEMORY[0x23B81CC08](&unk_237853DF8, &type metadata for CarCommandsSnippetsPluginModel.AppDisambiguationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818C00);
  }
  return result;
}

unint64_t sub_23784CCFC()
{
  unint64_t result;

  result = qword_256818C08;
  if (!qword_256818C08)
  {
    result = MEMORY[0x23B81CC08](&unk_237853EB0, &type metadata for CarCommandsSnippetsPluginModel.PowerLevelStatusModelCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818C08);
  }
  return result;
}

unint64_t sub_23784CD44()
{
  unint64_t result;

  result = qword_256818C10;
  if (!qword_256818C10)
  {
    result = MEMORY[0x23B81CC08](&unk_237853F68, &type metadata for CarCommandsSnippetsPluginModel.VisibleSignalStatusModelCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818C10);
  }
  return result;
}

unint64_t sub_23784CD8C()
{
  unint64_t result;

  result = qword_256818C18;
  if (!qword_256818C18)
  {
    result = MEMORY[0x23B81CC08](&unk_237854020, &type metadata for CarCommandsSnippetsPluginModel.AudibleSignalStatusModelCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818C18);
  }
  return result;
}

unint64_t sub_23784CDD4()
{
  unint64_t result;

  result = qword_256818C20;
  if (!qword_256818C20)
  {
    result = MEMORY[0x23B81CC08](&unk_2378540D8, &type metadata for CarCommandsSnippetsPluginModel.ClimateStatusModelCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818C20);
  }
  return result;
}

unint64_t sub_23784CE1C()
{
  unint64_t result;

  result = qword_256818C28;
  if (!qword_256818C28)
  {
    result = MEMORY[0x23B81CC08](&unk_237854190, &type metadata for CarCommandsSnippetsPluginModel.TrunkStatusModelCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818C28);
  }
  return result;
}

unint64_t sub_23784CE64()
{
  unint64_t result;

  result = qword_256818C30;
  if (!qword_256818C30)
  {
    result = MEMORY[0x23B81CC08](&unk_237854248, &type metadata for CarCommandsSnippetsPluginModel.LockStatusModelCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818C30);
  }
  return result;
}

unint64_t sub_23784CEAC()
{
  unint64_t result;

  result = qword_256818C38;
  if (!qword_256818C38)
  {
    result = MEMORY[0x23B81CC08](&unk_237854300, &type metadata for CarCommandsSnippetsPluginModel.AppPunchoutCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818C38);
  }
  return result;
}

unint64_t sub_23784CEF4()
{
  unint64_t result;

  result = qword_256818C40;
  if (!qword_256818C40)
  {
    result = MEMORY[0x23B81CC08](&unk_2378543B8, &type metadata for CarCommandsSnippetsPluginModel.ConfirmationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818C40);
  }
  return result;
}

unint64_t sub_23784CF3C()
{
  unint64_t result;

  result = qword_256818C48;
  if (!qword_256818C48)
  {
    result = MEMORY[0x23B81CC08](&unk_237854470, &type metadata for CarCommandsSnippetsPluginModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818C48);
  }
  return result;
}

unint64_t sub_23784CF84()
{
  unint64_t result;

  result = qword_256818C50;
  if (!qword_256818C50)
  {
    result = MEMORY[0x23B81CC08](&unk_237854328, &type metadata for CarCommandsSnippetsPluginModel.ConfirmationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818C50);
  }
  return result;
}

unint64_t sub_23784CFCC()
{
  unint64_t result;

  result = qword_256818C58;
  if (!qword_256818C58)
  {
    result = MEMORY[0x23B81CC08](&unk_237854350, &type metadata for CarCommandsSnippetsPluginModel.ConfirmationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818C58);
  }
  return result;
}

unint64_t sub_23784D014()
{
  unint64_t result;

  result = qword_256818C60;
  if (!qword_256818C60)
  {
    result = MEMORY[0x23B81CC08](&unk_237854270, &type metadata for CarCommandsSnippetsPluginModel.AppPunchoutCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818C60);
  }
  return result;
}

unint64_t sub_23784D05C()
{
  unint64_t result;

  result = qword_256818C68;
  if (!qword_256818C68)
  {
    result = MEMORY[0x23B81CC08](&unk_237854298, &type metadata for CarCommandsSnippetsPluginModel.AppPunchoutCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818C68);
  }
  return result;
}

unint64_t sub_23784D0A4()
{
  unint64_t result;

  result = qword_256818C70;
  if (!qword_256818C70)
  {
    result = MEMORY[0x23B81CC08](&unk_2378541B8, &type metadata for CarCommandsSnippetsPluginModel.LockStatusModelCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818C70);
  }
  return result;
}

unint64_t sub_23784D0EC()
{
  unint64_t result;

  result = qword_256818C78;
  if (!qword_256818C78)
  {
    result = MEMORY[0x23B81CC08](&unk_2378541E0, &type metadata for CarCommandsSnippetsPluginModel.LockStatusModelCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818C78);
  }
  return result;
}

unint64_t sub_23784D134()
{
  unint64_t result;

  result = qword_256818C80;
  if (!qword_256818C80)
  {
    result = MEMORY[0x23B81CC08](&unk_237854100, &type metadata for CarCommandsSnippetsPluginModel.TrunkStatusModelCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818C80);
  }
  return result;
}

unint64_t sub_23784D17C()
{
  unint64_t result;

  result = qword_256818C88;
  if (!qword_256818C88)
  {
    result = MEMORY[0x23B81CC08](&unk_237854128, &type metadata for CarCommandsSnippetsPluginModel.TrunkStatusModelCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818C88);
  }
  return result;
}

unint64_t sub_23784D1C4()
{
  unint64_t result;

  result = qword_256818C90;
  if (!qword_256818C90)
  {
    result = MEMORY[0x23B81CC08](&unk_237854048, &type metadata for CarCommandsSnippetsPluginModel.ClimateStatusModelCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818C90);
  }
  return result;
}

unint64_t sub_23784D20C()
{
  unint64_t result;

  result = qword_256818C98;
  if (!qword_256818C98)
  {
    result = MEMORY[0x23B81CC08](&unk_237854070, &type metadata for CarCommandsSnippetsPluginModel.ClimateStatusModelCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818C98);
  }
  return result;
}

unint64_t sub_23784D254()
{
  unint64_t result;

  result = qword_256818CA0;
  if (!qword_256818CA0)
  {
    result = MEMORY[0x23B81CC08](&unk_237853F90, &type metadata for CarCommandsSnippetsPluginModel.AudibleSignalStatusModelCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818CA0);
  }
  return result;
}

unint64_t sub_23784D29C()
{
  unint64_t result;

  result = qword_256818CA8;
  if (!qword_256818CA8)
  {
    result = MEMORY[0x23B81CC08](&unk_237853FB8, &type metadata for CarCommandsSnippetsPluginModel.AudibleSignalStatusModelCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818CA8);
  }
  return result;
}

unint64_t sub_23784D2E4()
{
  unint64_t result;

  result = qword_256818CB0;
  if (!qword_256818CB0)
  {
    result = MEMORY[0x23B81CC08](&unk_237853ED8, &type metadata for CarCommandsSnippetsPluginModel.VisibleSignalStatusModelCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818CB0);
  }
  return result;
}

unint64_t sub_23784D32C()
{
  unint64_t result;

  result = qword_256818CB8;
  if (!qword_256818CB8)
  {
    result = MEMORY[0x23B81CC08](&unk_237853F00, &type metadata for CarCommandsSnippetsPluginModel.VisibleSignalStatusModelCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818CB8);
  }
  return result;
}

unint64_t sub_23784D374()
{
  unint64_t result;

  result = qword_256818CC0;
  if (!qword_256818CC0)
  {
    result = MEMORY[0x23B81CC08](&unk_237853E20, &type metadata for CarCommandsSnippetsPluginModel.PowerLevelStatusModelCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818CC0);
  }
  return result;
}

unint64_t sub_23784D3BC()
{
  unint64_t result;

  result = qword_256818CC8;
  if (!qword_256818CC8)
  {
    result = MEMORY[0x23B81CC08](&unk_237853E48, &type metadata for CarCommandsSnippetsPluginModel.PowerLevelStatusModelCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818CC8);
  }
  return result;
}

unint64_t sub_23784D404()
{
  unint64_t result;

  result = qword_256818CD0;
  if (!qword_256818CD0)
  {
    result = MEMORY[0x23B81CC08](&unk_237853D68, &type metadata for CarCommandsSnippetsPluginModel.AppDisambiguationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818CD0);
  }
  return result;
}

unint64_t sub_23784D44C()
{
  unint64_t result;

  result = qword_256818CD8;
  if (!qword_256818CD8)
  {
    result = MEMORY[0x23B81CC08](&unk_237853D90, &type metadata for CarCommandsSnippetsPluginModel.AppDisambiguationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818CD8);
  }
  return result;
}

unint64_t sub_23784D494()
{
  unint64_t result;

  result = qword_256818CE0;
  if (!qword_256818CE0)
  {
    result = MEMORY[0x23B81CC08](&unk_237853CB0, &type metadata for CarCommandsSnippetsPluginModel.CarNameDisambiguationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818CE0);
  }
  return result;
}

unint64_t sub_23784D4DC()
{
  unint64_t result;

  result = qword_256818CE8;
  if (!qword_256818CE8)
  {
    result = MEMORY[0x23B81CC08](&unk_237853CD8, &type metadata for CarCommandsSnippetsPluginModel.CarNameDisambiguationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818CE8);
  }
  return result;
}

unint64_t sub_23784D524()
{
  unint64_t result;

  result = qword_256818CF0;
  if (!qword_256818CF0)
  {
    result = MEMORY[0x23B81CC08](&unk_2378543E0, &type metadata for CarCommandsSnippetsPluginModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818CF0);
  }
  return result;
}

unint64_t sub_23784D56C()
{
  unint64_t result;

  result = qword_256818CF8;
  if (!qword_256818CF8)
  {
    result = MEMORY[0x23B81CC08](&unk_237854408, &type metadata for CarCommandsSnippetsPluginModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256818CF8);
  }
  return result;
}

uint64_t sub_23784D5B0(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x616D7269666E6F63 && a2 == 0xEC0000006E6F6974;
  if (v2 || (sub_237851C98() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x68636E7550707061 && a2 == 0xEB0000000074756FLL || (sub_237851C98() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x746174536B636F6CLL && a2 == 0xEF6C65646F4D7375 || (sub_237851C98() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000237855530 || (sub_237851C98() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x8000000237855550 || (sub_237851C98() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x8000000237855570 || (sub_237851C98() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x8000000237855590 || (sub_237851C98() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x80000002378555B0 || (sub_237851C98() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000002378555D0 || (sub_237851C98() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x80000002378555F0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else
  {
    v6 = sub_237851C98();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 9;
    else
      return 10;
  }
}

Swift::String __swiftcall SnippetModel.responseViewId()()
{
  uint64_t v0;
  void *v1;
  Swift::String result;

  v0 = sub_237851BCC();
  __break(1u);
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t CarCommandsGaugeSnippet.body.getter@<X0>(uint64_t a1@<X8>)
{
  __int128 *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
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
  uint64_t *v28;
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
  __int128 v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  __int128 v49;
  uint64_t v50;
  uint64_t v51;
  _OWORD v52[2];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;

  v36 = a1;
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818D00);
  MEMORY[0x24BDAC7A8](v31);
  v3 = (uint64_t *)((char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = sub_237851A4C();
  v32 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818950);
  v34 = *(_QWORD *)(v7 - 8);
  v35 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818958);
  MEMORY[0x24BDAC7A8](v33);
  v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = v1[5];
  v55 = v1[4];
  v56 = v12;
  v57 = v1[6];
  v58 = *((_QWORD *)v1 + 14);
  v13 = v1[1];
  v52[0] = *v1;
  v52[1] = v13;
  v14 = v1[3];
  v53 = v1[2];
  v54 = v14;
  v15 = MEMORY[0x24BEE0D00];
  v16 = MEMORY[0x24BEAE5B8];
  v60 = v13;
  v50 = MEMORY[0x24BEE0D00];
  v51 = MEMORY[0x24BEAE5B8];
  v49 = v13;
  if (!*((_QWORD *)&v53 + 1))
    goto LABEL_6;
  v17 = HIBYTE(*((_QWORD *)&v53 + 1)) & 0xFLL;
  if ((*((_QWORD *)&v53 + 1) & 0x2000000000000000) == 0)
    v17 = v53 & 0xFFFFFFFFFFFFLL;
  if (v17)
  {
    *((_QWORD *)&v47 + 1) = MEMORY[0x24BEE0D00];
    v48 = MEMORY[0x24BEAE5B8];
    v46 = v53;
    swift_bridgeObjectRetain();
  }
  else
  {
LABEL_6:
    v48 = 0;
    v46 = 0u;
    v47 = 0u;
  }
  v45 = 0;
  v43 = 0u;
  v44 = 0u;
  v59 = *v1;
  v41 = v15;
  v42 = v16;
  v40 = v59;
  sub_23784634C((uint64_t)&v60);
  sub_23784634C((uint64_t)&v59);
  *v3 = sub_2378519A4();
  v3[1] = v18;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818D08);
  sub_23784DD78((uint64_t)v52, (uint64_t)v3 + *(int *)(v19 + 44));
  sub_237841788(&qword_256818D10, &qword_256818D00, MEMORY[0x24BDF4750]);
  v20 = sub_237851848();
  sub_237841228((uint64_t)v3, &qword_256818D00);
  v38 = MEMORY[0x24BDF4780];
  v39 = MEMORY[0x24BEAD938];
  v37 = v20;
  sub_237851A40();
  sub_237835D18(&qword_256818980, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE228], MEMORY[0x24BEAE208]);
  sub_2378518B4();
  (*(void (**)(char *, uint64_t))(v32 + 8))(v6, v4);
  v22 = *((_QWORD *)&v56 + 1);
  v21 = v57;
  sub_237851A7C();
  sub_237835D18((unint64_t *)&qword_256817B20, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE580], MEMORY[0x24BEAE520]);
  swift_bridgeObjectRetain();
  v23 = sub_237851770();
  v25 = v24;
  v27 = v34;
  v26 = v35;
  (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v11, v9, v35);
  v28 = (uint64_t *)&v11[*(int *)(v33 + 36)];
  *v28 = v23;
  v28[1] = v25;
  v28[2] = v22;
  v28[3] = v21;
  (*(void (**)(char *, uint64_t))(v27 + 8))(v9, v26);
  return sub_23784E0AC((uint64_t)v11, v36);
}

uint64_t sub_23784DD78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t KeyPath;
  uint64_t *v17;
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
  uint64_t *v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;

  v36 = a2;
  v3 = sub_237851818();
  v35 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818D18);
  v34 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818D20);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818D28);
  MEMORY[0x24BDAC7A8](v33);
  v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = a1;
  v39 = *(_DWORD *)(a1 + 48);
  v38 = 0x3F80000000000000;
  v37 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256818490);
  sub_237840708();
  sub_23784E7E4();
  sub_2378518F0();
  sub_23785180C();
  sub_237841788(&qword_256818D38, &qword_256818D18, MEMORY[0x24BDF3EE8]);
  sub_237835D18(&qword_256818D40, (uint64_t (*)(uint64_t))MEMORY[0x24BDF1360], MEMORY[0x24BDF1350]);
  sub_237851890();
  (*(void (**)(char *, uint64_t))(v35 + 8))(v5, v3);
  (*(void (**)(char *, uint64_t))(v34 + 8))(v8, v6);
  v15 = sub_2378518CC();
  KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v14, v12, v9);
  v17 = (uint64_t *)&v14[*(int *)(v33 + 36)];
  *v17 = KeyPath;
  v17[1] = v15;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v18 = sub_2378519A4();
  v20 = v19;
  v21 = *(_QWORD *)(v32 + 64);
  if (v21)
  {
    swift_bridgeObjectRetain();
    v22 = sub_2378518FC();
    sub_2378519BC();
    v24 = v23;
    v26 = v25;
    v21 = 0x3FE51EB851EB851FLL;
    v27 = 0xC044000000000000;
  }
  else
  {
    v22 = 0;
    v27 = 0;
    v24 = 0;
    v26 = 0;
  }
  v28 = v36;
  sub_23784E8C8((uint64_t)v14, v36);
  v29 = (uint64_t *)(v28 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256818D48) + 36));
  *v29 = v22;
  v29[1] = 0;
  v29[2] = v27;
  v29[3] = v21;
  v29[4] = v21;
  v29[5] = v24;
  v29[6] = v26;
  v29[7] = v18;
  v29[8] = v20;
  return sub_237841228((uint64_t)v14, &qword_256818D28);
}

uint64_t sub_23784E0AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818958);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23784E0F4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23784E104@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;
  char v19;
  char v20;
  char v21;
  char v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t KeyPath;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  _BYTE v44[7];
  char v45;
  _BYTE v46[7];
  char v47;
  _BYTE v48[7];
  char v49;
  _BYTE v50[7];
  char v51;
  int v52;
  __int16 v53;
  char v54;

  v2 = sub_237851908();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818220);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_2378518FC();
  v9 = *MEMORY[0x24BDF4068];
  v10 = sub_237851920();
  v11 = *(_QWORD *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 104))(v8, v9, v10);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  sub_237851914();
  swift_release();
  sub_237841228((uint64_t)v8, &qword_256818220);
  v31 = sub_2378518C0();
  v12 = sub_2378518E4();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BDF3FD0], v2);
  v30 = sub_23785192C();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  KeyPath = swift_getKeyPath();
  swift_retain();
  sub_2378519A4();
  sub_23785174C();
  v28 = v32;
  LOBYTE(v5) = v33;
  v13 = v34;
  LOBYTE(v11) = v35;
  v27 = v36;
  v26 = v37;
  sub_2378519A4();
  sub_23785174C();
  v14 = v38;
  v15 = v40;
  v16 = v42;
  v17 = v43;
  v54 = 1;
  v51 = (char)v5;
  v49 = v11;
  v47 = v39;
  v45 = v41;
  LOBYTE(v5) = sub_237851830();
  swift_release();
  result = swift_release();
  v19 = v54;
  *(_DWORD *)(a1 + 18) = v52;
  *(_WORD *)(a1 + 22) = v53;
  v20 = v51;
  *(_DWORD *)(a1 + 49) = *(_DWORD *)v50;
  *(_DWORD *)(a1 + 52) = *(_DWORD *)&v50[3];
  v21 = v49;
  *(_DWORD *)(a1 + 65) = *(_DWORD *)v48;
  *(_DWORD *)(a1 + 68) = *(_DWORD *)&v48[3];
  v22 = v47;
  v23 = *(_DWORD *)v46;
  *(_DWORD *)(a1 + 100) = *(_DWORD *)&v46[3];
  *(_DWORD *)(a1 + 97) = v23;
  LOBYTE(v23) = v45;
  *(_DWORD *)(a1 + 116) = *(_DWORD *)&v44[3];
  *(_DWORD *)(a1 + 113) = *(_DWORD *)v44;
  *(_QWORD *)a1 = v30;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = v19;
  *(_BYTE *)(a1 + 17) = 0;
  *(_QWORD *)(a1 + 24) = KeyPath;
  *(_QWORD *)(a1 + 32) = v12;
  *(_QWORD *)(a1 + 40) = v28;
  *(_BYTE *)(a1 + 48) = v20;
  *(_QWORD *)(a1 + 56) = v13;
  *(_BYTE *)(a1 + 64) = v21;
  v24 = v26;
  *(_QWORD *)(a1 + 72) = v27;
  *(_QWORD *)(a1 + 80) = v24;
  *(_QWORD *)(a1 + 88) = v14;
  *(_BYTE *)(a1 + 96) = v22;
  *(_QWORD *)(a1 + 104) = v15;
  *(_BYTE *)(a1 + 112) = v23;
  *(_QWORD *)(a1 + 120) = v16;
  *(_QWORD *)(a1 + 128) = v17;
  *(_QWORD *)(a1 + 136) = v31;
  *(_BYTE *)(a1 + 144) = (_BYTE)v5;
  *(_WORD *)(a1 + 145) = 256;
  return result;
}

void destroy for CarCommandsGaugeSnippet(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

uint64_t initializeWithCopy for CarCommandsGaugeSnippet(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  v6 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v6;
  v7 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v7;
  v8 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v8;
  v10 = *(void **)(a2 + 104);
  v9 = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 104) = v10;
  *(_QWORD *)(a1 + 112) = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11 = v10;
  return a1;
}

uint64_t assignWithCopy for CarCommandsGaugeSnippet(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(void **)(a1 + 104);
  v5 = *(void **)(a2 + 104);
  *(_QWORD *)(a1 + 104) = v5;
  v6 = v5;

  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  return a1;
}

__n128 __swift_memcpy120_8(uint64_t a1, __int128 *a2)
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
  v7 = a2[6];
  *(_QWORD *)(a1 + 112) = *((_QWORD *)a2 + 14);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t assignWithTake for CarCommandsGaugeSnippet(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  v7 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v8;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRelease();
  v9 = *(void **)(a1 + 104);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);

  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  return a1;
}

uint64_t getEnumTagSinglePayload for CarCommandsGaugeSnippet(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 120))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CarCommandsGaugeSnippet(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 120) = 1;
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
    *(_BYTE *)(result + 120) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CarCommandsGaugeSnippet()
{
  return &type metadata for CarCommandsGaugeSnippet;
}

uint64_t sub_23784E7DC@<X0>(uint64_t a1@<X8>)
{
  return sub_23784E104(a1);
}

unint64_t sub_23784E7E4()
{
  unint64_t result;

  result = qword_256818D30;
  if (!qword_256818D30)
  {
    result = MEMORY[0x23B81CC08](MEMORY[0x24BEE14F0], MEMORY[0x24BEE14E8]);
    atomic_store(result, (unint64_t *)&qword_256818D30);
  }
  return result;
}

uint64_t sub_23784E828@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2378517AC();
  *a1 = result;
  return result;
}

uint64_t sub_23784E850()
{
  swift_retain();
  return sub_2378517B8();
}

uint64_t sub_23784E878@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2378517DC();
  *a1 = result;
  return result;
}

uint64_t sub_23784E8A0()
{
  swift_retain();
  return sub_2378517E8();
}

uint64_t sub_23784E8C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818D28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23784E910@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2378517AC();
  *a1 = result;
  return result;
}

uint64_t sub_23784E938()
{
  swift_retain();
  return sub_2378517B8();
}

uint64_t CarCommandsAppPunchoutSnippet.init(model:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  sub_237851A7C();
  sub_237835D18((unint64_t *)&qword_256817B20, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE580], MEMORY[0x24BEAE520]);
  v4 = sub_237851770();
  v6 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  sub_2378516BC();
  type metadata accessor for CarCommandsAppPunchoutSnippetModel(0);
  sub_2378516BC();
  result = sub_23784EA30(a1);
  *a2 = v8;
  a2[1] = v9;
  a2[2] = v8;
  a2[3] = v9;
  a2[4] = v4;
  a2[5] = v6;
  return result;
}

uint64_t sub_23784EA30(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for CarCommandsAppPunchoutSnippetModel(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t CarCommandsAppPunchoutSnippet.body.getter()
{
  _OWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  __int128 v5;
  _OWORD *v6;
  __int128 v7;
  _OWORD v9[3];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818D50);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = v0[1];
  v9[0] = *v0;
  v9[1] = v5;
  v9[2] = v0[2];
  v6 = (_OWORD *)swift_allocObject();
  v7 = v0[1];
  v6[1] = *v0;
  v6[2] = v7;
  v6[3] = v0[2];
  sub_23784EC74((uint64_t)v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256818D58);
  sub_237841788(&qword_256818D60, &qword_256818D58, MEMORY[0x24BDF43B0]);
  sub_2378519E0();
  sub_237841788(&qword_256818D68, &qword_256818D50, MEMORY[0x24BEADC00]);
  sub_2378518B4();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_23784EBB0(_OWORD *a1)
{
  _OWORD *v2;
  __int128 v3;

  v2 = (_OWORD *)swift_allocObject();
  v3 = a1[1];
  v2[1] = *a1;
  v2[2] = v3;
  v2[3] = a1[2];
  sub_23784EC74((uint64_t)a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256818D70);
  sub_237841788(&qword_256818D78, &qword_256818D70, MEMORY[0x24BDF41A8]);
  return sub_237851974();
}

uint64_t sub_23784EC6C()
{
  uint64_t v0;

  return sub_23784EBB0((_OWORD *)(v0 + 16));
}

uint64_t sub_23784EC74(uint64_t a1)
{
  id v2;

  v2 = *(id *)(a1 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_23784ECB8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23784ECC8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  id v7;
  uint64_t result;
  uint64_t v9;

  v2 = sub_23785165C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    v7 = v6;
    swift_bridgeObjectRetain();
    sub_237851650();
    sub_237851A58();

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  else
  {
    sub_23784EC74(a1);
    sub_237851A7C();
    sub_237835D18((unint64_t *)&qword_256817B20, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE580], MEMORY[0x24BEAE520]);
    result = sub_237851764();
    __break(1u);
  }
  return result;
}

uint64_t sub_23784EDD8@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  char v4;
  uint64_t v5;

  sub_23783D77C();
  swift_bridgeObjectRetain();
  result = sub_23785183C();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = v4 & 1;
  *(_QWORD *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_23784EE40@<X0>(uint64_t *a1@<X8>)
{
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
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v17 = a1;
  v1 = sub_237851668();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_237851698();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_2378519C8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818D80);
  v16 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23785168C();
  sub_2378519D4();
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BEAAC10], v1);
  v13 = sub_237835D18(&qword_256818D88, (uint64_t (*)(uint64_t))MEMORY[0x24BEADA38], MEMORY[0x24BEADA20]);
  sub_237851854();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v18 = v6;
  v19 = v13;
  swift_getOpaqueTypeConformance2();
  v14 = sub_237851848();
  result = (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v12, v10);
  *v17 = v14;
  return result;
}

uint64_t sub_23784F040()
{
  _OWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  __int128 v5;
  _OWORD *v6;
  __int128 v7;
  _OWORD v9[3];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818D50);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = v0[1];
  v9[0] = *v0;
  v9[1] = v5;
  v9[2] = v0[2];
  v6 = (_OWORD *)swift_allocObject();
  v7 = v0[1];
  v6[1] = *v0;
  v6[2] = v7;
  v6[3] = v0[2];
  sub_23784EC74((uint64_t)v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256818D58);
  sub_237841788(&qword_256818D60, &qword_256818D58, MEMORY[0x24BDF43B0]);
  sub_2378519E0();
  sub_237841788(&qword_256818D68, &qword_256818D50, MEMORY[0x24BEADC00]);
  sub_2378518B4();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

void destroy for CarCommandsAppPunchoutSnippet(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

_QWORD *initializeWithCopy for CarCommandsAppPunchoutSnippet(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v6 = (void *)a2[4];
  v5 = a2[5];
  a1[4] = v6;
  a1[5] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v7 = v6;
  return a1;
}

_QWORD *assignWithCopy for CarCommandsAppPunchoutSnippet(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (void *)a1[4];
  v5 = (void *)a2[4];
  a1[4] = v5;
  v6 = v5;

  a1[5] = a2[5];
  return a1;
}

uint64_t assignWithTake for CarCommandsAppPunchoutSnippet(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  v5 = *(void **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);

  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  return a1;
}

ValueMetadata *type metadata accessor for CarCommandsAppPunchoutSnippet()
{
  return &type metadata for CarCommandsAppPunchoutSnippet;
}

uint64_t sub_23784F2F8()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256818D50);
  sub_237841788(&qword_256818D68, &qword_256818D50, MEMORY[0x24BEADC00]);
  return swift_getOpaqueTypeConformance2();
}

uint64_t objectdestroyTm_2()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_23784F398()
{
  uint64_t v0;

  return sub_23784ECC8(v0 + 16);
}

uint64_t sub_23784F3A0()
{
  return sub_237851944();
}

uint64_t sub_23784F400@<X0>(uint64_t a1@<X8>)
{
  return sub_23784EDD8(a1);
}

uint64_t sub_23784F408@<X0>(uint64_t *a1@<X8>)
{
  return sub_23784EE40(a1);
}

uint64_t CarCommandsUIPlugin.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t CarCommandsUIPlugin.init()()
{
  uint64_t v0;

  return v0;
}

void CarCommandsUIPlugin.snippet(for:mode:idiom:)(uint64_t a1)
{
  sub_23784F49C(a1);
}

uint64_t CarCommandsUIPlugin.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t CarCommandsUIPlugin.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_23784F458@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = swift_allocObject();
  *a1 = result;
  return result;
}

void sub_23784F488(uint64_t a1)
{
  sub_23784F49C(a1);
}

void sub_23784F49C(uint64_t a1)
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
  uint64_t (*v31)(_QWORD);
  char *v32;
  _QWORD v33[5];
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  char *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  char *v76;
  uint64_t v77;

  v77 = a1;
  v73 = type metadata accessor for CarNameDisambiguationSnippet();
  MEMORY[0x24BDAC7A8](v73);
  v70 = (char *)v33 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818D98);
  v72 = *(_QWORD *)(v74 - 8);
  MEMORY[0x24BDAC7A8](v74);
  v71 = (char *)v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v68 = type metadata accessor for AppDisambiguationSnippet();
  MEMORY[0x24BDAC7A8](v68);
  v65 = (char *)v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818DA0);
  v67 = *(_QWORD *)(v69 - 8);
  MEMORY[0x24BDAC7A8](v69);
  v66 = (char *)v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for CarCommandsDisambiguationSnippetModel(0);
  MEMORY[0x24BDAC7A8](v5);
  v75 = (char *)v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v63 = type metadata accessor for PowerLevelSnippet();
  MEMORY[0x24BDAC7A8](v63);
  v60 = (char *)v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818DA8);
  v62 = *(_QWORD *)(v64 - 8);
  MEMORY[0x24BDAC7A8](v64);
  v61 = (char *)v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for CarCommandsGaugeSnippetModel(0);
  MEMORY[0x24BDAC7A8](v9);
  v59 = (char *)v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57 = type metadata accessor for VisibleSignalStatusSnippet();
  MEMORY[0x24BDAC7A8](v57);
  v54 = (char *)v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818DB0);
  v56 = *(_QWORD *)(v58 - 8);
  MEMORY[0x24BDAC7A8](v58);
  v55 = (char *)v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = type metadata accessor for AudibleSignalStatusSnippet();
  MEMORY[0x24BDAC7A8](v52);
  v49 = (char *)v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818DB8);
  v51 = *(_QWORD *)(v53 - 8);
  MEMORY[0x24BDAC7A8](v53);
  v50 = (char *)v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = type metadata accessor for ClimateStatusSnippet();
  MEMORY[0x24BDAC7A8](v47);
  v44 = (char *)v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818DC0);
  v46 = *(_QWORD *)(v48 - 8);
  MEMORY[0x24BDAC7A8](v48);
  v45 = (char *)v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = type metadata accessor for TrunkStatusSnippet();
  MEMORY[0x24BDAC7A8](v42);
  v37 = (char *)v33 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818DC8);
  v41 = *(_QWORD *)(v43 - 8);
  MEMORY[0x24BDAC7A8](v43);
  v40 = (char *)v33 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = type metadata accessor for LockStatusSnippet();
  MEMORY[0x24BDAC7A8](v34);
  v33[1] = (char *)v33 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818DD0);
  v33[4] = *(_QWORD *)(v35 - 8);
  MEMORY[0x24BDAC7A8](v35);
  v33[2] = (char *)v33 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = type metadata accessor for CarCommandsToggleSnippetModel(0);
  MEMORY[0x24BDAC7A8](v21);
  v76 = (char *)v33 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818DD8);
  v38 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39);
  v36 = (char *)v33 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33[0] = type metadata accessor for CarCommandsAppPunchoutSnippetModel(0);
  v24 = MEMORY[0x24BDAC7A8](v33[0]);
  MEMORY[0x24BDAC7A8](v24);
  v33[3] = (char *)v33 - v25;
  v26 = type metadata accessor for CarCommandsConfirmationSnippet();
  MEMORY[0x24BDAC7A8](v26);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818DE0);
  MEMORY[0x24BDAC7A8](v27);
  v28 = type metadata accessor for CarCommandsConfirmationSnippetModel(0);
  MEMORY[0x24BDAC7A8](v28);
  v29 = type metadata accessor for CarCommandsSnippetsPluginModel();
  MEMORY[0x24BDAC7A8](v29);
  sub_2378331FC(v77, (uint64_t)v33 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0), v31);
  v32 = (char *)sub_23784FBAC + 4 * word_237854970[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23784FBAC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_23783B658(v4, v6, type metadata accessor for CarCommandsConfirmationSnippetModel);
  sub_2378331FC(v6, v1, type metadata accessor for CarCommandsConfirmationSnippetModel);
  v8 = (uint64_t *)(v1 + *(int *)(v3 + 20));
  sub_237851A7C();
  sub_237835D18((unint64_t *)&qword_256817B20, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE580], MEMORY[0x24BEAE520]);
  *v8 = sub_237851770();
  v8[1] = v9;
  v10 = sub_237835D18(&qword_256818E30, (uint64_t (*)(uint64_t))type metadata accessor for CarCommandsConfirmationSnippet, (uint64_t)&protocol conformance descriptor for CarCommandsConfirmationSnippet);
  sub_23785186C();
  sub_237833240(v1, (uint64_t (*)(_QWORD))type metadata accessor for CarCommandsConfirmationSnippet);
  *(_QWORD *)(v7 - 136) = v3;
  *(_QWORD *)(v7 - 128) = v10;
  swift_getOpaqueTypeConformance2();
  v11 = sub_237851848();
  (*(void (**)(uint64_t, uint64_t))(v0 + 8))(v2, v5);
  sub_237833240(v6, type metadata accessor for CarCommandsConfirmationSnippetModel);
  return v11;
}

uint64_t sub_2378504D4()
{
  return sub_237835D18(&qword_256818D90, (uint64_t (*)(uint64_t))type metadata accessor for CarCommandsSnippetsPluginModel, (uint64_t)&protocol conformance descriptor for CarCommandsSnippetsPluginModel);
}

uint64_t type metadata accessor for CarCommandsUIPlugin()
{
  return objc_opt_self();
}

uint64_t method lookup function for CarCommandsUIPlugin()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CarCommandsUIPlugin.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

unint64_t sub_237850534()
{
  unint64_t result;

  result = qword_256818E28;
  if (!qword_256818E28)
  {
    result = MEMORY[0x23B81CC08](&protocol conformance descriptor for CarCommandsAppPunchoutSnippet, &type metadata for CarCommandsAppPunchoutSnippet);
    atomic_store(result, (unint64_t *)&qword_256818E28);
  }
  return result;
}

uint64_t destroy for CarCommandsBackgroundPunchoutModifier(id *a1)
{

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for CarCommandsBackgroundPunchoutModifier(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v4 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for CarCommandsBackgroundPunchoutModifier(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a1;
  v5 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v5;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
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

uint64_t assignWithTake for CarCommandsBackgroundPunchoutModifier(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CarCommandsBackgroundPunchoutModifier(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for CarCommandsBackgroundPunchoutModifier(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for CarCommandsBackgroundPunchoutModifier()
{
  return &type metadata for CarCommandsBackgroundPunchoutModifier;
}

uint64_t sub_23785073C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23785074C(void *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  os_log_type_t v10;
  id v11;
  uint64_t result;
  _QWORD v13[2];
  uint64_t v14;
  unint64_t v15;

  v13[1] = a2;
  v3 = sub_23785165C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = 0;
  v15 = 0xE000000000000000;
  sub_237851B78();
  sub_237851AC4();
  swift_bridgeObjectRetain();
  sub_237851AC4();
  swift_bridgeObjectRelease();
  v7 = v14;
  v8 = v15;
  if (qword_256817AF8 != -1)
    swift_once();
  v9 = sub_2378516EC();
  __swift_project_value_buffer(v9, (uint64_t)qword_2568183E8);
  v10 = sub_237851AF4();
  sub_23783D490(v10, 8, 0xD00000000000009BLL, 0x80000002378556D0, 0x6E6F632879646F62, 0xEE00293A746E6574, 14, v7, v8);
  swift_bridgeObjectRelease();
  if (a1)
  {
    swift_bridgeObjectRetain();
    v11 = a1;
    sub_237851650();
    sub_237851A58();

    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  else
  {
    sub_237851A7C();
    sub_23783108C();
    result = sub_237851764();
    __break(1u);
  }
  return result;
}

uint64_t sub_237850950()
{
  return sub_237851740();
}

uint64_t sub_237850968(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  uint64_t v14;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818E38);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(void **)v1;
  v6 = *(_QWORD *)(v1 + 8);
  v9 = *(_QWORD *)(v1 + 16);
  v8 = *(_QWORD *)(v1 + 24);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818E40);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v5, a1, v10);
  v5[*(int *)(v3 + 36)] = 0;
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = v7;
  v11[3] = v6;
  v11[4] = v9;
  v11[5] = v8;
  sub_237850AB4();
  v12 = v7;
  swift_bridgeObjectRetain();
  sub_23785189C();
  swift_release();
  return sub_237850B50((uint64_t)v5);
}

uint64_t sub_237850A7C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_237850AA8()
{
  uint64_t v0;

  return sub_23785074C(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24));
}

unint64_t sub_237850AB4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256818E48;
  if (!qword_256818E48)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256818E38);
    v2[0] = sub_237841788(&qword_256818E50, &qword_256818E40, MEMORY[0x24BDEFB78]);
    v2[1] = sub_237841788(&qword_256818718, &qword_256818720, MEMORY[0x24BDEFAD8]);
    result = MEMORY[0x23B81CC08](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256818E48);
  }
  return result;
}

uint64_t sub_237850B50(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256818E38);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_237850B90()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256818E38);
  sub_237850AB4();
  return swift_getOpaqueTypeConformance2();
}

uint64_t PowerLevelSnippet.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_237850BE4(a1, a2);
}

uint64_t sub_237850BE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CarCommandsGaugeSnippetModel(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t PowerLevelSnippet.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  sub_2378516BC();
  type metadata accessor for CarCommandsGaugeSnippetModel(0);
  sub_2378516BC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  sub_2378516BC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817C58);
  sub_2378516BC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256817B08);
  sub_2378516BC();
  if ((_BYTE)v6)
    v2 = 0x6C69662E746C6F62;
  else
    v2 = 0;
  if ((_BYTE)v6)
    v3 = 0xE90000000000006CLL;
  else
    v3 = 0;
  sub_2378516BC();
  sub_237851A7C();
  sub_23783108C();
  result = sub_237851770();
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v7;
  *(_QWORD *)(a1 + 32) = v6;
  *(_QWORD *)(a1 + 40) = v7;
  *(_DWORD *)(a1 + 48) = v6;
  *(_QWORD *)(a1 + 56) = v2;
  *(_QWORD *)(a1 + 64) = v3;
  *(_QWORD *)(a1 + 72) = 0x6C6C69662E726163;
  *(_QWORD *)(a1 + 80) = 0xE800000000000000;
  *(_QWORD *)(a1 + 88) = v6;
  *(_QWORD *)(a1 + 96) = v7;
  *(_QWORD *)(a1 + 104) = result;
  *(_QWORD *)(a1 + 112) = v5;
  return result;
}

uint64_t sub_237850DBC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for PowerLevelSnippet(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  int v5;
  int *v6;
  uint64_t v7;
  void (*v8)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;

  v4 = type metadata accessor for CarCommandsGaugeSnippetModel(0);
  v5 = *(_DWORD *)(*(_QWORD *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v21 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = (int *)v4;
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
    v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + v6[5]), (uint64_t *)((char *)a2 + v6[5]), v7);
    v9 = v6[6];
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    v13 = v6[7];
    v14 = (char *)a1 + v13;
    v15 = (char *)a2 + v13;
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817C58);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
    v17 = v6[8];
    v18 = (char *)a1 + v17;
    v19 = (char *)a2 + v17;
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B08);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
    v8((uint64_t *)((char *)a1 + v6[9]), (uint64_t *)((char *)a2 + v6[9]), v7);
  }
  return a1;
}

uint64_t destroy for PowerLevelSnippet(uint64_t a1)
{
  uint64_t v2;
  int *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v11)(uint64_t, uint64_t);

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v11 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8);
  v11(a1, v2);
  v3 = (int *)type metadata accessor for CarCommandsGaugeSnippetModel(0);
  v11(a1 + v3[5], v2);
  v4 = a1 + v3[6];
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = a1 + v3[7];
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817C58);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v8 = a1 + v3[8];
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B08);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  return ((uint64_t (*)(uint64_t, uint64_t))v11)(a1 + v3[9], v2);
}

uint64_t initializeWithCopy for PowerLevelSnippet(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  int *v6;
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

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16);
  v5(a1, a2, v4);
  v6 = (int *)type metadata accessor for CarCommandsGaugeSnippetModel(0);
  v5(a1 + v6[5], a2 + v6[5], v4);
  v7 = v6[6];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  v11 = v6[7];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817C58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
  v15 = v6[8];
  v16 = a1 + v15;
  v17 = a2 + v15;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v16, v17, v18);
  v5(a1 + v6[9], a2 + v6[9], v4);
  return a1;
}

uint64_t assignWithCopy for PowerLevelSnippet(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  int *v6;
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

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24);
  v5(a1, a2, v4);
  v6 = (int *)type metadata accessor for CarCommandsGaugeSnippetModel(0);
  v5(a1 + v6[5], a2 + v6[5], v4);
  v7 = v6[6];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  v11 = v6[7];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817C58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 24))(v12, v13, v14);
  v15 = v6[8];
  v16 = a1 + v15;
  v17 = a2 + v15;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 24))(v16, v17, v18);
  v5(a1 + v6[9], a2 + v6[9], v4);
  return a1;
}

uint64_t initializeWithTake for PowerLevelSnippet(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  int *v6;
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

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32);
  v5(a1, a2, v4);
  v6 = (int *)type metadata accessor for CarCommandsGaugeSnippetModel(0);
  v5(a1 + v6[5], a2 + v6[5], v4);
  v7 = v6[6];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = v6[7];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817C58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v12, v13, v14);
  v15 = v6[8];
  v16 = a1 + v15;
  v17 = a2 + v15;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v16, v17, v18);
  v5(a1 + v6[9], a2 + v6[9], v4);
  return a1;
}

uint64_t assignWithTake for PowerLevelSnippet(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  int *v6;
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

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B10);
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40);
  v5(a1, a2, v4);
  v6 = (int *)type metadata accessor for CarCommandsGaugeSnippetModel(0);
  v5(a1 + v6[5], a2 + v6[5], v4);
  v7 = v6[6];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = v6[7];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817C58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 40))(v12, v13, v14);
  v15 = v6[8];
  v16 = a1 + v15;
  v17 = a2 + v15;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256817B08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 40))(v16, v17, v18);
  v5(a1 + v6[9], a2 + v6[9], v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for PowerLevelSnippet()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2378514D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CarCommandsGaugeSnippetModel(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for PowerLevelSnippet()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_237851518(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CarCommandsGaugeSnippetModel(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for PowerLevelSnippet()
{
  uint64_t result;

  result = qword_256818EB0;
  if (!qword_256818EB0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_237851594()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for CarCommandsGaugeSnippetModel(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_237851600()
{
  unint64_t result;

  result = qword_256818EE8;
  if (!qword_256818EE8)
  {
    result = MEMORY[0x23B81CC08](&protocol conformance descriptor for CarCommandsGaugeSnippet, &type metadata for CarCommandsGaugeSnippet);
    atomic_store(result, (unint64_t *)&qword_256818EE8);
  }
  return result;
}

uint64_t sub_237851644()
{
  return MEMORY[0x24BEAA5D8]();
}

uint64_t sub_237851650()
{
  return MEMORY[0x24BEAA6A8]();
}

uint64_t sub_23785165C()
{
  return MEMORY[0x24BEAA6D8]();
}

uint64_t sub_237851668()
{
  return MEMORY[0x24BEAAC48]();
}

uint64_t sub_237851674()
{
  return MEMORY[0x24BEAC738]();
}

uint64_t sub_237851680()
{
  return MEMORY[0x24BEAC740]();
}

uint64_t sub_23785168C()
{
  return MEMORY[0x24BEAD2C8]();
}

uint64_t sub_237851698()
{
  return MEMORY[0x24BEAD2E8]();
}

uint64_t sub_2378516A4()
{
  return MEMORY[0x24BEAD338]();
}

uint64_t sub_2378516B0()
{
  return MEMORY[0x24BEAD340]();
}

uint64_t sub_2378516BC()
{
  return MEMORY[0x24BEAD348]();
}

uint64_t sub_2378516C8()
{
  return MEMORY[0x24BEAD350]();
}

uint64_t sub_2378516D4()
{
  return MEMORY[0x24BEAD360]();
}

uint64_t sub_2378516E0()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2378516EC()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2378516F8()
{
  return MEMORY[0x24BEE78E8]();
}

uint64_t sub_237851704()
{
  return MEMORY[0x24BDEB3E0]();
}

uint64_t sub_237851710()
{
  return MEMORY[0x24BDEB418]();
}

uint64_t sub_23785171C()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t sub_237851728()
{
  return MEMORY[0x24BDEBDE0]();
}

uint64_t sub_237851734()
{
  return MEMORY[0x24BDEBDF0]();
}

uint64_t sub_237851740()
{
  return MEMORY[0x24BDEBE00]();
}

uint64_t sub_23785174C()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_237851758()
{
  return MEMORY[0x24BDEC5A0]();
}

uint64_t sub_237851764()
{
  return MEMORY[0x24BDEDE50]();
}

uint64_t sub_237851770()
{
  return MEMORY[0x24BDEDE60]();
}

uint64_t sub_23785177C()
{
  return MEMORY[0x24BEAD640]();
}

uint64_t sub_237851788()
{
  return MEMORY[0x24BEAD650]();
}

uint64_t sub_237851794()
{
  return MEMORY[0x24BDEDEE8]();
}

uint64_t sub_2378517A0()
{
  return MEMORY[0x24BDEDEF8]();
}

uint64_t sub_2378517AC()
{
  return MEMORY[0x24BDEE038]();
}

uint64_t sub_2378517B8()
{
  return MEMORY[0x24BDEE048]();
}

uint64_t sub_2378517C4()
{
  return MEMORY[0x24BDEE468]();
}

uint64_t sub_2378517D0()
{
  return MEMORY[0x24BDEE478]();
}

uint64_t sub_2378517DC()
{
  return MEMORY[0x24BDEE4C0]();
}

uint64_t sub_2378517E8()
{
  return MEMORY[0x24BDEE4D8]();
}

uint64_t sub_2378517F4()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_237851800()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_23785180C()
{
  return MEMORY[0x24BDF1358]();
}

uint64_t sub_237851818()
{
  return MEMORY[0x24BDF1360]();
}

uint64_t sub_237851824()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_237851830()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_23785183C()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_237851848()
{
  return MEMORY[0x24BEAD6D0]();
}

uint64_t sub_237851854()
{
  return MEMORY[0x24BEAD740]();
}

uint64_t sub_237851860()
{
  return MEMORY[0x24BEAD870]();
}

uint64_t sub_23785186C()
{
  return MEMORY[0x24BEAD900]();
}

uint64_t sub_237851878()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_237851884()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_237851890()
{
  return MEMORY[0x24BDF2158]();
}

uint64_t sub_23785189C()
{
  return MEMORY[0x24BDF2548]();
}

uint64_t sub_2378518A8()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_2378518B4()
{
  return MEMORY[0x24BDF29C8]();
}

uint64_t sub_2378518C0()
{
  return MEMORY[0x24BDF3D10]();
}

uint64_t sub_2378518CC()
{
  return MEMORY[0x24BDF3D18]();
}

uint64_t sub_2378518D8()
{
  return MEMORY[0x24BDF3D30]();
}

uint64_t sub_2378518E4()
{
  return MEMORY[0x24BDF3D88]();
}

uint64_t sub_2378518F0()
{
  return MEMORY[0x24BDF3ED0]();
}

uint64_t sub_2378518FC()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_237851908()
{
  return MEMORY[0x24BDF3FE8]();
}

uint64_t sub_237851914()
{
  return MEMORY[0x24BDF4028]();
}

uint64_t sub_237851920()
{
  return MEMORY[0x24BDF4070]();
}

uint64_t sub_23785192C()
{
  return MEMORY[0x24BDF40D8]();
}

uint64_t sub_237851938()
{
  return MEMORY[0x24BDF4130]();
}

uint64_t sub_237851944()
{
  return MEMORY[0x24BDF4150]();
}

uint64_t sub_237851950()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_23785195C()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_237851968()
{
  return MEMORY[0x24BDF42B0]();
}

uint64_t sub_237851974()
{
  return MEMORY[0x24BDF4340]();
}

uint64_t sub_237851980()
{
  return MEMORY[0x24BDF4380]();
}

uint64_t sub_23785198C()
{
  return MEMORY[0x24BDF47B0]();
}

uint64_t sub_237851998()
{
  return MEMORY[0x24BDF49B8]();
}

uint64_t sub_2378519A4()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_2378519B0()
{
  return MEMORY[0x24BDF5010]();
}

uint64_t sub_2378519BC()
{
  return MEMORY[0x24BDF54A0]();
}

uint64_t sub_2378519C8()
{
  return MEMORY[0x24BEADA38]();
}

uint64_t sub_2378519D4()
{
  return MEMORY[0x24BEADA60]();
}

uint64_t sub_2378519E0()
{
  return MEMORY[0x24BEADBD0]();
}

uint64_t sub_2378519EC()
{
  return MEMORY[0x24BEADCD0]();
}

uint64_t sub_2378519F8()
{
  return MEMORY[0x24BEADCE0]();
}

uint64_t sub_237851A04()
{
  return MEMORY[0x24BEADE28]();
}

uint64_t sub_237851A10()
{
  return MEMORY[0x24BEADE88]();
}

uint64_t sub_237851A1C()
{
  return MEMORY[0x24BEADE90]();
}

uint64_t sub_237851A28()
{
  return MEMORY[0x24BEADF18]();
}

uint64_t sub_237851A34()
{
  return MEMORY[0x24BEADF28]();
}

uint64_t sub_237851A40()
{
  return MEMORY[0x24BEAE220]();
}

uint64_t sub_237851A4C()
{
  return MEMORY[0x24BEAE228]();
}

uint64_t sub_237851A58()
{
  return MEMORY[0x24BEAE550]();
}

uint64_t sub_237851A64()
{
  return MEMORY[0x24BEAE568]();
}

uint64_t sub_237851A70()
{
  return MEMORY[0x24BEAE570]();
}

uint64_t sub_237851A7C()
{
  return MEMORY[0x24BEAE580]();
}

uint64_t sub_237851A88()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_237851A94()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_237851AA0()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_237851AAC()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_237851AB8()
{
  return MEMORY[0x24BEE0BB0]();
}

uint64_t sub_237851AC4()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_237851AD0()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_237851ADC()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_237851AE8()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_237851AF4()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_237851B00()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_237851B0C()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_237851B18()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_237851B24()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_237851B30()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_237851B3C()
{
  return MEMORY[0x24BDD04C8]();
}

uint64_t sub_237851B48()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_237851B54()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_237851B60()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_237851B6C()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_237851B78()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_237851B84()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_237851B90()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_237851B9C()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_237851BA8()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_237851BB4()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_237851BC0()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_237851BCC()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_237851BD8()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_237851BE4()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_237851BF0()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_237851BFC()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_237851C08()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_237851C14()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_237851C20()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_237851C2C()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_237851C38()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_237851C44()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_237851C50()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_237851C5C()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_237851C68()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_237851C74()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_237851C80()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_237851C8C()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_237851C98()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_237851CA4()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_237851CB0()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_237851CBC()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_237851CC8()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_237851CD4()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_237851CE0()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_237851CEC()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_237851CF8()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_237851D04()
{
  return MEMORY[0x24BEE4A10]();
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
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

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

