unint64_t sub_1A611544C()
{
  unint64_t result;

  result = qword_1EE817990;
  if (!qword_1EE817990)
  {
    result = MEMORY[0x1A85BB36C](&protocol conformance descriptor for TideEvent.EventType, &type metadata for TideEvent.EventType);
    atomic_store(result, (unint64_t *)&qword_1EE817990);
  }
  return result;
}

uint64_t sub_1A6115488(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TideEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1A61154CC(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for TideEvent();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1A6115508(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  TideEvent.init(from:)(a1, a2);
}

uint64_t sub_1A611551C(_QWORD *a1)
{
  return TideEvent.encode(to:)(a1);
}

void TideEvent.EventType.hash(into:)()
{
  sub_1A6123D70();
  OUTLINED_FUNCTION_51();
}

uint64_t sub_1A6115558(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v7;

  v2 = a1 == 7827308 && a2 == 0xE300000000000000;
  if (v2 || (sub_1A6123CF8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1751607656 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_1A6123CF8();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1A6115624(char a1)
{
  if ((a1 & 1) != 0)
    return 1751607656;
  else
    return 7827308;
}

uint64_t sub_1A611564C()
{
  char *v0;

  return sub_1A6115624(*v0);
}

uint64_t sub_1A6115654@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1A6115558(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A6115678()
{
  sub_1A61158E4();
  return sub_1A6123DE8();
}

uint64_t sub_1A61156A0()
{
  sub_1A61158E4();
  return sub_1A6123DF4();
}

uint64_t sub_1A61156C8()
{
  sub_1A6115920();
  return sub_1A6123DE8();
}

uint64_t sub_1A61156F0()
{
  sub_1A6115920();
  return sub_1A6123DF4();
}

uint64_t sub_1A6115718()
{
  sub_1A611595C();
  return sub_1A6123DE8();
}

uint64_t sub_1A6115740()
{
  sub_1A611595C();
  return sub_1A6123DF4();
}

void TideEvent.EventType.encode(to:)(_QWORD *a1)
{
  char *v1;
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
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE817998);
  v21 = *(_QWORD *)(v3 - 8);
  v22 = v3;
  OUTLINED_FUNCTION_41();
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_0();
  v7 = v6 - v5;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE8179A0);
  v19 = *(_QWORD *)(v8 - 8);
  v20 = v8;
  OUTLINED_FUNCTION_41();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_0();
  v12 = v11 - v10;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE8179A8);
  v23 = *(_QWORD *)(v13 - 8);
  OUTLINED_FUNCTION_41();
  MEMORY[0x1E0C80A78](v14);
  OUTLINED_FUNCTION_0();
  v17 = v16 - v15;
  v18 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A61158E4();
  sub_1A6123DD0();
  if ((v18 & 1) != 0)
  {
    OUTLINED_FUNCTION_20_22();
    OUTLINED_FUNCTION_13_11();
    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v7, v22);
  }
  else
  {
    sub_1A611595C();
    OUTLINED_FUNCTION_13_11();
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v12, v20);
  }
  (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v17, v13);
  OUTLINED_FUNCTION_20();
}

unint64_t sub_1A61158E4()
{
  unint64_t result;

  result = qword_1EE8179B0;
  if (!qword_1EE8179B0)
  {
    result = MEMORY[0x1A85BB36C](&unk_1A61401EC, &type metadata for TideEvent.EventType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE8179B0);
  }
  return result;
}

unint64_t sub_1A6115920()
{
  unint64_t result;

  result = qword_1EE8179B8;
  if (!qword_1EE8179B8)
  {
    result = MEMORY[0x1A85BB36C](&unk_1A614019C, &type metadata for TideEvent.EventType.HighCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE8179B8);
  }
  return result;
}

unint64_t sub_1A611595C()
{
  unint64_t result;

  result = qword_1EE8179C0;
  if (!qword_1EE8179C0)
  {
    result = MEMORY[0x1A85BB36C](&unk_1A614014C, &type metadata for TideEvent.EventType.LowCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE8179C0);
  }
  return result;
}

void TideEvent.EventType.hashValue.getter()
{
  sub_1A6123D64();
  OUTLINED_FUNCTION_17_5();
  sub_1A6123D88();
  OUTLINED_FUNCTION_16();
}

void TideEvent.EventType.init(from:)(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
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
  char v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  _BYTE *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE8179C8);
  v33 = *(_QWORD *)(v29 - 8);
  OUTLINED_FUNCTION_41();
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_4_8(v5, v26);
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE8179D0);
  v6 = *(_QWORD *)(v30 - 8);
  MEMORY[0x1E0C80A78](v30);
  OUTLINED_FUNCTION_0();
  v9 = v8 - v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE8179D8);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_12();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A61158E4();
  sub_1A6123DC4();
  if (v34)
    goto LABEL_9;
  v27 = v9;
  v28 = a1;
  v12 = sub_1A6123C50();
  v13 = *(_QWORD *)(v12 + 16);
  v14 = v10;
  if (!v13)
  {
    v21 = v2;
LABEL_8:
    v22 = sub_1A6123B48();
    swift_allocError();
    v24 = v23;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE8134C8);
    *v24 = &type metadata for TideEvent.EventType;
    sub_1A6123BCC();
    sub_1A6123B3C();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v22 - 8) + 104))(v24, *MEMORY[0x1E0DEC450], v22);
    swift_willThrow();
    OUTLINED_FUNCTION_8_9();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v21, v14);
    a1 = v28;
LABEL_9:
    v25 = (uint64_t)a1;
    goto LABEL_10;
  }
  v15 = *(_BYTE *)(v12 + 32);
  sub_1A5FF62F0(1, v13, v12, v12 + 32, 0, (2 * v13) | 1);
  v17 = v16;
  v19 = v18;
  swift_bridgeObjectRelease();
  if (v17 != v19 >> 1)
  {
    v21 = v2;
    v14 = v10;
    goto LABEL_8;
  }
  if ((v15 & 1) != 0)
  {
    OUTLINED_FUNCTION_20_22();
    sub_1A6123BC0();
    v20 = a2;
    (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v32, v29);
  }
  else
  {
    sub_1A611595C();
    sub_1A6123BC0();
    v20 = a2;
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v27, v30);
  }
  OUTLINED_FUNCTION_8_9();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v2, v10);
  *v20 = v15;
  v25 = (uint64_t)v28;
LABEL_10:
  __swift_destroy_boxed_opaque_existential_1(v25);
  OUTLINED_FUNCTION_20();
}

void sub_1A6115D40(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  TideEvent.EventType.init(from:)(a1, a2);
}

void sub_1A6115D54(_QWORD *a1)
{
  TideEvent.EventType.encode(to:)(a1);
}

unint64_t sub_1A6115D70()
{
  unint64_t result;

  result = qword_1EE8179E0;
  if (!qword_1EE8179E0)
  {
    result = MEMORY[0x1A85BB36C](&protocol conformance descriptor for TideEvent.EventType, &type metadata for TideEvent.EventType);
    atomic_store(result, (unint64_t *)&qword_1EE8179E0);
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for TideEvent(_QWORD *a1, _QWORD *a2, uint64_t a3)
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
    v7 = sub_1A6121F58();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 24);
    *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192980);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t destroy for TideEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_1A6121F58();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 24);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192980);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

uint64_t initializeWithCopy for TideEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_1A6121F58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192980);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t assignWithCopy for TideEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_1A6121F58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  v7 = *(int *)(a3 + 24);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192980);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t initializeWithTake for TideEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_1A6121F58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192980);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t assignWithTake for TideEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_1A6121F58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192980);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for TideEvent()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1A61160F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;

  v6 = OUTLINED_FUNCTION_6();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v6;
    v8 = a1;
    return __swift_getEnumTagSinglePayload(v8, a2, v7);
  }
  if ((_DWORD)a2 != 254)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192980);
    v8 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v8, a2, v7);
  }
  v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 2)
    return v9 - 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for TideEvent()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1A6116190(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = OUTLINED_FUNCTION_6();
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
  {
    v9 = result;
    v10 = a1;
  }
  else
  {
    if (a3 == 254)
    {
      *(_BYTE *)(a1 + *(int *)(a4 + 20)) = a2 + 1;
      return result;
    }
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192980);
    v10 = a1 + *(int *)(a4 + 24);
  }
  return __swift_storeEnumTagSinglePayload(v10, a2, a2, v9);
}

void sub_1A6116224()
{
  unint64_t v0;
  unint64_t v1;

  sub_1A6121F58();
  if (v0 <= 0x3F)
  {
    sub_1A5FC64B8();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

ValueMetadata *type metadata accessor for TideEvent.EventType()
{
  return &type metadata for TideEvent.EventType;
}

uint64_t _s10WeatherKit9TideEventV9EventTypeOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1A6116310 + 4 * byte_1A613FD7D[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1A6116344 + 4 * byte_1A613FD78[v4]))();
}

uint64_t sub_1A6116344(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A611634C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1A6116354);
  return result;
}

uint64_t sub_1A6116360(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1A6116368);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1A611636C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A6116374(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TideEvent.EventType.CodingKeys()
{
  return &type metadata for TideEvent.EventType.CodingKeys;
}

ValueMetadata *type metadata accessor for TideEvent.EventType.LowCodingKeys()
{
  return &type metadata for TideEvent.EventType.LowCodingKeys;
}

ValueMetadata *type metadata accessor for TideEvent.EventType.HighCodingKeys()
{
  return &type metadata for TideEvent.EventType.HighCodingKeys;
}

uint64_t storeEnumTagSinglePayload for TideEvent.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1A61163FC + 4 * byte_1A613FD87[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1A6116430 + 4 * byte_1A613FD82[v4]))();
}

uint64_t sub_1A6116430(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A6116438(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1A6116440);
  return result;
}

uint64_t sub_1A611644C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1A6116454);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1A6116458(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A6116460(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TideEvent.CodingKeys()
{
  return &type metadata for TideEvent.CodingKeys;
}

unint64_t sub_1A6116480()
{
  unint64_t result;

  result = qword_1EE817A80;
  if (!qword_1EE817A80)
  {
    result = MEMORY[0x1A85BB36C](&unk_1A613FFCC, &type metadata for TideEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE817A80);
  }
  return result;
}

unint64_t sub_1A61164C0()
{
  unint64_t result;

  result = qword_1EE817A88;
  if (!qword_1EE817A88)
  {
    result = MEMORY[0x1A85BB36C](&unk_1A6140124, &type metadata for TideEvent.EventType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE817A88);
  }
  return result;
}

unint64_t sub_1A6116500()
{
  unint64_t result;

  result = qword_1EE817A90;
  if (!qword_1EE817A90)
  {
    result = MEMORY[0x1A85BB36C](&unk_1A6140044, &type metadata for TideEvent.EventType.LowCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE817A90);
  }
  return result;
}

unint64_t sub_1A6116540()
{
  unint64_t result;

  result = qword_1EE817A98;
  if (!qword_1EE817A98)
  {
    result = MEMORY[0x1A85BB36C](&unk_1A614006C, &type metadata for TideEvent.EventType.LowCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE817A98);
  }
  return result;
}

unint64_t sub_1A6116580()
{
  unint64_t result;

  result = qword_1EE817AA0;
  if (!qword_1EE817AA0)
  {
    result = MEMORY[0x1A85BB36C](&unk_1A613FFF4, &type metadata for TideEvent.EventType.HighCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE817AA0);
  }
  return result;
}

unint64_t sub_1A61165C0()
{
  unint64_t result;

  result = qword_1EE817AA8;
  if (!qword_1EE817AA8)
  {
    result = MEMORY[0x1A85BB36C](&unk_1A614001C, &type metadata for TideEvent.EventType.HighCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE817AA8);
  }
  return result;
}

unint64_t sub_1A6116600()
{
  unint64_t result;

  result = qword_1EE817AB0;
  if (!qword_1EE817AB0)
  {
    result = MEMORY[0x1A85BB36C](&unk_1A6140094, &type metadata for TideEvent.EventType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE817AB0);
  }
  return result;
}

unint64_t sub_1A6116640()
{
  unint64_t result;

  result = qword_1EE817AB8;
  if (!qword_1EE817AB8)
  {
    result = MEMORY[0x1A85BB36C](&unk_1A61400BC, &type metadata for TideEvent.EventType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE817AB8);
  }
  return result;
}

unint64_t sub_1A6116680()
{
  unint64_t result;

  result = qword_1EE817AC0;
  if (!qword_1EE817AC0)
  {
    result = MEMORY[0x1A85BB36C](&unk_1A613FF3C, &type metadata for TideEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE817AC0);
  }
  return result;
}

unint64_t sub_1A61166C0()
{
  unint64_t result;

  result = qword_1EE817AC8;
  if (!qword_1EE817AC8)
  {
    result = MEMORY[0x1A85BB36C](&unk_1A613FF64, &type metadata for TideEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE817AC8);
  }
  return result;
}

uint64_t HourMarineWeather.init(date:primarySwell:waterTemperature:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v8 = OUTLINED_FUNCTION_6();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a4, a1, v8);
  v9 = OUTLINED_FUNCTION_1_51();
  sub_1A603E058(a2, a4 + *(int *)(v9 + 20));
  v10 = a4 + *(int *)(v9 + 24);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192880);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v10, a3, v11);
}

uint64_t type metadata accessor for HourMarineWeather()
{
  uint64_t result;

  result = qword_1ED193FD0;
  if (!qword_1ED193FD0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t HourMarineWeather.date.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_6();
  v0 = OUTLINED_FUNCTION_10();
  return OUTLINED_FUNCTION_30(v0, v1, v2, v3);
}

uint64_t HourMarineWeather.date.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_6();
  v0 = OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_30(v0, v1, v2, v3);
}

uint64_t (*HourMarineWeather.date.modify())()
{
  return GEOLocationCoordinate2DMake;
}

void HourMarineWeather.primarySwell.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_1_51();
  sub_1A5FEF468(v1 + *(int *)(v3 + 20), a1, (uint64_t (*)(_QWORD))type metadata accessor for Swell);
}

uint64_t HourMarineWeather.primarySwell.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(OUTLINED_FUNCTION_1_51() + 20);
  return sub_1A6116874(a1, v3);
}

uint64_t sub_1A6116874(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Swell();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

double (*HourMarineWeather.primarySwell.modify())(double, double)
{
  OUTLINED_FUNCTION_1_51();
  return GEOLocationCoordinate2DMake;
}

uint64_t HourMarineWeather.waterTemperature.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_1_51();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192880);
  v0 = OUTLINED_FUNCTION_10();
  return OUTLINED_FUNCTION_30(v0, v1, v2, v3);
}

uint64_t HourMarineWeather.waterTemperature.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_1_51();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192880);
  v0 = OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_30(v0, v1, v2, v3);
}

double (*HourMarineWeather.waterTemperature.modify())(double, double)
{
  OUTLINED_FUNCTION_1_51();
  return GEOLocationCoordinate2DMake;
}

uint64_t sub_1A6116968(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  char v7;

  v2 = a1 == 1702125924 && a2 == 0xE400000000000000;
  if (v2 || (sub_1A6123CF8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x537972616D697270 && a2 == 0xEC0000006C6C6577;
    if (v6 || (sub_1A6123CF8() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD000000000000010 && a2 == 0x80000001A61528C0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      v7 = sub_1A6123CF8();
      swift_bridgeObjectRelease();
      if ((v7 & 1) != 0)
        return 2;
      else
        return 3;
    }
  }
}

uint64_t sub_1A6116ABC(char a1)
{
  if (!a1)
    return 1702125924;
  if (a1 == 1)
    return 0x537972616D697270;
  return 0xD000000000000010;
}

uint64_t sub_1A6116B18()
{
  char *v0;

  return sub_1A6116ABC(*v0);
}

uint64_t sub_1A6116B20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1A6116968(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A6116B44()
{
  sub_1A6116D50();
  return sub_1A6123DE8();
}

uint64_t sub_1A6116B6C()
{
  sub_1A6116D50();
  return sub_1A6123DF4();
}

uint64_t HourMarineWeather.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE817AD0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_12();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A6116D50();
  sub_1A6123DD0();
  sub_1A6121F58();
  sub_1A5FAF4C0(&qword_1ED191698, (void (*)(uint64_t))MEMORY[0x1E0CB0870]);
  OUTLINED_FUNCTION_4();
  if (!v1)
  {
    type metadata accessor for HourMarineWeather();
    type metadata accessor for Swell();
    sub_1A5FAF4C0(&qword_1EE817AE0, (void (*)(uint64_t))type metadata accessor for Swell);
    OUTLINED_FUNCTION_4();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192880);
    sub_1A61170DC(&qword_1ED191688);
    OUTLINED_FUNCTION_4();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);
}

unint64_t sub_1A6116D50()
{
  unint64_t result;

  result = qword_1EE817AD8;
  if (!qword_1EE817AD8)
  {
    result = MEMORY[0x1A85BB36C](&unk_1A6140408, &type metadata for HourMarineWeather.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE817AD8);
  }
  return result;
}

void HourMarineWeather.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  char *v26;
  uint64_t v27;
  char v28;
  char v29;
  char v30;

  v18 = a2;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192880);
  v17 = *(_QWORD *)(v20 - 8);
  MEMORY[0x1E0C80A78](v20);
  OUTLINED_FUNCTION_11_0();
  v19 = v4;
  v21 = type metadata accessor for Swell();
  MEMORY[0x1E0C80A78](v21);
  OUTLINED_FUNCTION_11_0();
  v22 = v5;
  v24 = sub_1A6121F58();
  v6 = *(_QWORD *)(v24 - 8);
  MEMORY[0x1E0C80A78](v24);
  OUTLINED_FUNCTION_11_0();
  v23 = v7;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE817AE8);
  v8 = *(_QWORD *)(v25 - 8);
  MEMORY[0x1E0C80A78](v25);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for HourMarineWeather();
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_12();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A6116D50();
  v26 = v10;
  v12 = v27;
  sub_1A6123DC4();
  if (v12)
  {
    OUTLINED_FUNCTION_11_40();
  }
  else
  {
    v13 = v22;
    v27 = v8;
    v16 = v2;
    v30 = 0;
    sub_1A5FAF4C0(&qword_1EE812DF0, (void (*)(uint64_t))MEMORY[0x1E0CB0870]);
    sub_1A6123C44();
    OUTLINED_FUNCTION_10_46(v16, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 32));
    v29 = 1;
    sub_1A5FAF4C0(&qword_1EE817AF0, (void (*)(uint64_t))type metadata accessor for Swell);
    v14 = v13;
    sub_1A6123C44();
    v15 = v16;
    sub_1A603E058(v14, v16 + *(int *)(v11 + 20));
    v28 = 2;
    sub_1A61170DC(&qword_1EE812F28);
    sub_1A6123C44();
    OUTLINED_FUNCTION_2_55();
    OUTLINED_FUNCTION_10_46(v15 + *(int *)(v11 + 24), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v17 + 32));
    sub_1A5FEF468(v15, v18, (uint64_t (*)(_QWORD))type metadata accessor for HourMarineWeather);
    OUTLINED_FUNCTION_11_40();
    sub_1A5FAD104(v15, (uint64_t (*)(_QWORD))type metadata accessor for HourMarineWeather);
  }
}

void sub_1A61170DC(_QWORD *a1)
{
  if (!*a1)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED192880);
    OUTLINED_FUNCTION_11_2();
  }
  OUTLINED_FUNCTION_51();
}

void sub_1A6117114(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  HourMarineWeather.init(from:)(a1, a2);
}

uint64_t sub_1A6117128(_QWORD *a1)
{
  return HourMarineWeather.encode(to:)(a1);
}

uint64_t static HourMarineWeather.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if ((sub_1A6121F1C() & 1) == 0)
    return 0;
  v4 = OUTLINED_FUNCTION_1_51();
  if (!static Swell.== infix(_:_:)(a1 + *(int *)(v4 + 20), a2 + *(int *)(v4 + 20)))
    return 0;
  sub_1A5FBFFD0();
  return sub_1A6121CDC();
}

uint64_t *initializeBufferWithCopyOfBuffer for HourMarineWeather(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
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

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v21 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_1A6121F58();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192980);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    v12 = type metadata accessor for Swell();
    v13 = *(int *)(v12 + 20);
    v14 = &v9[v13];
    v15 = &v10[v13];
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192950);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
    *(_QWORD *)&v9[*(int *)(v12 + 24)] = *(_QWORD *)&v10[*(int *)(v12 + 24)];
    v17 = *(int *)(a3 + 24);
    v18 = (char *)a1 + v17;
    v19 = (char *)a2 + v17;
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192880);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
  }
  return a1;
}

uint64_t destroy for HourMarineWeather(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = sub_1A6121F58();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192980);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = v5 + *(int *)(type metadata accessor for Swell() + 20);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192950);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  v9 = a1 + *(int *)(a2 + 24);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192880);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
}

uint64_t initializeWithCopy for HourMarineWeather(uint64_t a1, uint64_t a2, uint64_t a3)
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

  v6 = sub_1A6121F58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192980);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  v11 = type metadata accessor for Swell();
  v12 = *(int *)(v11 + 20);
  v13 = v8 + v12;
  v14 = v9 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192950);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
  *(_QWORD *)(v8 + *(int *)(v11 + 24)) = *(_QWORD *)(v9 + *(int *)(v11 + 24));
  v16 = *(int *)(a3 + 24);
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192880);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v17, v18, v19);
  return a1;
}

uint64_t assignWithCopy for HourMarineWeather(uint64_t a1, uint64_t a2, uint64_t a3)
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

  v6 = sub_1A6121F58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192980);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  v11 = type metadata accessor for Swell();
  v12 = *(int *)(v11 + 20);
  v13 = v8 + v12;
  v14 = v9 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192950);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 24))(v13, v14, v15);
  *(_QWORD *)(v8 + *(int *)(v11 + 24)) = *(_QWORD *)(v9 + *(int *)(v11 + 24));
  v16 = *(int *)(a3 + 24);
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192880);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 24))(v17, v18, v19);
  return a1;
}

uint64_t initializeWithTake for HourMarineWeather(uint64_t a1, uint64_t a2, uint64_t a3)
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

  v6 = sub_1A6121F58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192980);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = type metadata accessor for Swell();
  v12 = *(int *)(v11 + 20);
  v13 = v8 + v12;
  v14 = v9 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192950);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v13, v14, v15);
  *(_QWORD *)(v8 + *(int *)(v11 + 24)) = *(_QWORD *)(v9 + *(int *)(v11 + 24));
  v16 = *(int *)(a3 + 24);
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192880);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v17, v18, v19);
  return a1;
}

uint64_t assignWithTake for HourMarineWeather(uint64_t a1, uint64_t a2, uint64_t a3)
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

  v6 = sub_1A6121F58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192980);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = type metadata accessor for Swell();
  v12 = *(int *)(v11 + 20);
  v13 = v8 + v12;
  v14 = v9 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192950);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  *(_QWORD *)(v8 + *(int *)(v11 + 24)) = *(_QWORD *)(v9 + *(int *)(v11 + 24));
  v16 = *(int *)(a3 + 24);
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192880);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 40))(v17, v18, v19);
  return a1;
}

uint64_t getEnumTagSinglePayload for HourMarineWeather()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1A61177E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = OUTLINED_FUNCTION_6();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v6;
    v8 = a1;
  }
  else
  {
    v9 = type metadata accessor for Swell();
    if (*(_DWORD *)(*(_QWORD *)(v9 - 8) + 84) == (_DWORD)a2)
    {
      v7 = v9;
      v10 = *(int *)(a3 + 20);
    }
    else
    {
      v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192880);
      v10 = *(int *)(a3 + 24);
    }
    v8 = a1 + v10;
  }
  return __swift_getEnumTagSinglePayload(v8, a2, v7);
}

uint64_t storeEnumTagSinglePayload for HourMarineWeather()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1A6117880(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v8 = OUTLINED_FUNCTION_6();
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    v9 = v8;
    v10 = a1;
  }
  else
  {
    v11 = type metadata accessor for Swell();
    if (*(_DWORD *)(*(_QWORD *)(v11 - 8) + 84) == a3)
    {
      v9 = v11;
      v12 = *(int *)(a4 + 20);
    }
    else
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192880);
      v12 = *(int *)(a4 + 24);
    }
    v10 = a1 + v12;
  }
  return __swift_storeEnumTagSinglePayload(v10, a2, a2, v9);
}

void sub_1A6117914()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_1A6121F58();
  if (v0 <= 0x3F)
  {
    type metadata accessor for Swell();
    if (v1 <= 0x3F)
    {
      sub_1A5FC6464();
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

uint64_t storeEnumTagSinglePayload for HourMarineWeather.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1A6117A00 + 4 * byte_1A6140295[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1A6117A34 + 4 * byte_1A6140290[v4]))();
}

uint64_t sub_1A6117A34(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A6117A3C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1A6117A44);
  return result;
}

uint64_t sub_1A6117A50(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1A6117A58);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1A6117A5C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A6117A64(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HourMarineWeather.CodingKeys()
{
  return &type metadata for HourMarineWeather.CodingKeys;
}

unint64_t sub_1A6117A84()
{
  unint64_t result;

  result = qword_1EE817AF8;
  if (!qword_1EE817AF8)
  {
    result = MEMORY[0x1A85BB36C](&unk_1A61403E0, &type metadata for HourMarineWeather.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE817AF8);
  }
  return result;
}

unint64_t sub_1A6117AC4()
{
  unint64_t result;

  result = qword_1EE817B00;
  if (!qword_1EE817B00)
  {
    result = MEMORY[0x1A85BB36C](&unk_1A6140350, &type metadata for HourMarineWeather.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE817B00);
  }
  return result;
}

unint64_t sub_1A6117B04()
{
  unint64_t result;

  result = qword_1EE817B08;
  if (!qword_1EE817B08)
  {
    result = MEMORY[0x1A85BB36C](&unk_1A6140378, &type metadata for HourMarineWeather.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE817B08);
  }
  return result;
}

uint64_t sub_1A6117B40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t, uint64_t);
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29[2];

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192878);
  OUTLINED_FUNCTION_41();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_0();
  v9 = v8 - v7;
  v10 = sub_1A6122F30();
  v27 = *(_QWORD *)(v10 - 8);
  OUTLINED_FUNCTION_41();
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_0();
  v28 = v13 - v12;
  v26 = a1;
  v29[0] = a1;
  v29[1] = a2;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_6_40();
  sub_1A61226FC();
  sub_1A6123848();
  swift_bridgeObjectRelease();
  v14 = a1;
  if (qword_1ED193BE8 != -1)
    swift_once();
  v15 = sub_1A612356C();
  v16 = __swift_project_value_buffer(v15, (uint64_t)qword_1ED19DB18);
  OUTLINED_FUNCTION_26_3();
  sub_1A6123554();
  v17 = OUTLINED_FUNCTION_10_3();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)OUTLINED_FUNCTION_26();
    v29[0] = OUTLINED_FUNCTION_26();
    *(_DWORD *)v18 = 136446210;
    OUTLINED_FUNCTION_14_35();
    v19 = sub_1A5FBE7E0(a1, a2, v29);
    OUTLINED_FUNCTION_4_45(v19);
    sub_1A6123A88();
    OUTLINED_FUNCTION_28();
    OUTLINED_FUNCTION_16_4(&dword_1A5F87000, v16, v17, "Attempting to retrieve air quality scale with cache key: %{public}s from cache", v18);
    OUTLINED_FUNCTION_49_0();
    OUTLINED_FUNCTION_8();
  }

  OUTLINED_FUNCTION_18();
  sub_1A5FAB5C4(a1, a2, v9);
  if (__swift_getEnumTagSinglePayload(v9, 1, v10) == 1)
  {
    swift_bridgeObjectRelease();
    sub_1A6118268(v9);
    v20 = 1;
  }
  else
  {
    v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 32);
    v21(v28, v9, v10);
    OUTLINED_FUNCTION_26_3();
    OUTLINED_FUNCTION_14_35();
    v22 = sub_1A6123554();
    v23 = sub_1A6123A4C();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = OUTLINED_FUNCTION_26();
      v29[0] = OUTLINED_FUNCTION_26();
      *(_DWORD *)v24 = 136446466;
      swift_bridgeObjectRetain();
      sub_1A5FBE7E0(v26, a2, v29);
      sub_1A6123A88();
      OUTLINED_FUNCTION_28();
      *(_WORD *)(v24 + 12) = 2082;
      OUTLINED_FUNCTION_14_35();
      sub_1A5FBE7E0(v14, a2, v29);
      sub_1A6123A88();
      OUTLINED_FUNCTION_28();
      _os_log_impl(&dword_1A5F87000, v22, v23, "Successfully retrieved air quality scale: %{public}s with cache key:  %{public}s from cache", (uint8_t *)v24, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_8();
    }

    OUTLINED_FUNCTION_18();
    OUTLINED_FUNCTION_18();
    v21(a3, v28, v10);
    v20 = 0;
  }
  return __swift_storeEnumTagSinglePayload(a3, v20, 1, v10);
}

uint64_t sub_1A6117F40(uint64_t a1)
{
  __swift_project_boxed_opaque_existential_1((_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 48));
  return sub_1A61226A8();
}

uint64_t sub_1A6117FB0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v8 = sub_1A6122F30();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A60865FC(a1, a3, a4);
  if (qword_1ED193BE8 != -1)
    swift_once();
  v12 = sub_1A612356C();
  __swift_project_value_buffer(v12, (uint64_t)qword_1ED19DB18);
  swift_bridgeObjectRetain_n();
  v13 = sub_1A6123554();
  v14 = sub_1A6123A4C();
  if (os_log_type_enabled(v13, v14))
  {
    v21 = v8;
    v15 = swift_slowAlloc();
    v22 = a1;
    v16 = (uint8_t *)v15;
    v17 = swift_slowAlloc();
    v23 = v4;
    v18 = v17;
    v25 = v17;
    *(_DWORD *)v16 = 136446210;
    swift_bridgeObjectRetain();
    v24 = sub_1A5FBE7E0(a3, a4, &v25);
    v8 = v21;
    sub_1A6123A88();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A5F87000, v13, v14, "Successfully fetched air quality scale with key: %{public}s and updated the scale cache", v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1A85BB42C](v18, -1, -1);
    v19 = v16;
    a1 = v22;
    MEMORY[0x1A85BB42C](v19, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192428);
  swift_allocObject();
  return sub_1A6122228();
}

uint64_t sub_1A611820C()
{
  uint64_t v0;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  return swift_deallocClassInstance();
}

uint64_t sub_1A6118238()
{
  return sub_1A612212C();
}

uint64_t sub_1A6118244()
{
  return sub_1A6122120();
}

uint64_t sub_1A6118250()
{
  return sub_1A6122138();
}

uint64_t sub_1A611825C()
{
  return sub_1A6122114();
}

uint64_t sub_1A6118268(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192878);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1A61182A8()
{
  uint64_t v0;

  return sub_1A6117F40(*(_QWORD *)(v0 + 16));
}

uint64_t sub_1A61182C4()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1A61182E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1A6117FB0(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

void sub_1A6118304(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = 0;
    v5 = (uint64_t *)(a1 + 32);
    do
    {
      v7 = *v5++;
      v6 = v7;
      if ((v7 & ~v4) == 0)
        v6 = 0;
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }
  swift_bridgeObjectRelease();
  *a2 = v4;
  OUTLINED_FUNCTION_51();
}

uint64_t sub_1A6118354@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 | result;
  return result;
}

uint64_t sub_1A6118360@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 & result;
  return result;
}

uint64_t sub_1A611836C@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 ^ result;
  return result;
}

void sub_1A611837C(uint64_t a1@<X8>, uint64_t a2@<X0>)
{
  _QWORD *v2;

  if ((*v2 & a2) != 0)
    *v2 &= ~a2;
  OUTLINED_FUNCTION_2_56(a1);
}

void sub_1A61183A0(uint64_t a1@<X8>, uint64_t a2@<X0>)
{
  _QWORD *v2;

  *v2 |= a2;
  OUTLINED_FUNCTION_2_56(a1);
}

uint64_t sub_1A61183B8(uint64_t result)
{
  _QWORD *v1;

  *v1 &= result;
  return result;
}

uint64_t sub_1A61183C8(uint64_t result)
{
  _QWORD *v1;

  *v1 ^= result;
  return result;
}

uint64_t sub_1A61183D8@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 & ~result;
  return result;
}

BOOL sub_1A61183E4(uint64_t a1, uint64_t a2)
{
  return (a2 & ~a1) == 0;
}

BOOL sub_1A61183F0(uint64_t a1, uint64_t a2)
{
  return (a2 & a1) == 0;
}

BOOL sub_1A61183FC(uint64_t a1, uint64_t a2)
{
  return (a1 & ~a2) == 0;
}

BOOL sub_1A6118408(uint64_t a1)
{
  return a1 == 0;
}

uint64_t sub_1A6118414(uint64_t result)
{
  _QWORD *v1;

  *v1 &= ~result;
  return result;
}

WeatherKit::WeatherServiceCaching::Options __swiftcall WeatherServiceCaching.Options.init(rawValue:)(WeatherKit::WeatherServiceCaching::Options rawValue)
{
  WeatherKit::WeatherServiceCaching::Options *v1;

  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void static WeatherServiceCaching.Options.allowsExpiredData.getter(_QWORD *a1@<X8>)
{
  *a1 = 1;
}

void static WeatherServiceCaching.Options.none.getter(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

uint64_t WeatherServiceCaching.Options.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

WeatherKit::WeatherServiceCaching::Options sub_1A6118448(Swift::Int *a1)
{
  return WeatherServiceCaching.Options.init(rawValue:)(*a1);
}

uint64_t sub_1A6118450@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;

  return sub_1A6118354(*a1, *v2, a2);
}

uint64_t sub_1A611845C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;

  return sub_1A6118360(*a1, *v2, a2);
}

uint64_t sub_1A6118468@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;

  return sub_1A611836C(*a1, *v2, a2);
}

BOOL sub_1A6118474(_QWORD *a1, uint64_t *a2)
{
  return sub_1A60DA29C(a1, *a2);
}

void sub_1A611847C(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  sub_1A611837C(a2, *a1);
}

void sub_1A6118494(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  sub_1A61183A0(a2, *a1);
}

uint64_t sub_1A61184AC(uint64_t *a1)
{
  return sub_1A60DA4C0(*a1);
}

uint64_t sub_1A61184B4(uint64_t *a1)
{
  return sub_1A61183B8(*a1);
}

uint64_t sub_1A61184BC(uint64_t *a1)
{
  return sub_1A61183C8(*a1);
}

uint64_t sub_1A61184C4@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;

  return sub_1A61183D8(*a1, *v2, a2);
}

BOOL sub_1A61184D0(uint64_t *a1)
{
  uint64_t *v1;

  return sub_1A61183E4(*a1, *v1);
}

BOOL sub_1A61184DC(uint64_t *a1)
{
  uint64_t *v1;

  return sub_1A61183F0(*a1, *v1);
}

BOOL sub_1A61184E8(uint64_t *a1)
{
  uint64_t *v1;

  return sub_1A61183FC(*a1, *v1);
}

uint64_t sub_1A61184F4(uint64_t *a1)
{
  return sub_1A6118414(*a1);
}

WeatherKit::WeatherServiceCaching::Options sub_1A61184FC@<X0>(Swift::Int *a1@<X0>, uint64_t a2@<X8>)
{
  WeatherKit::WeatherServiceCaching::Options result;

  result.rawValue = WeatherServiceCaching.Options.init(rawValue:)(*a1).rawValue;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_1A6118524(uint64_t *a1@<X8>)
{
  *a1 = WeatherServiceCaching.Options.rawValue.getter();
  OUTLINED_FUNCTION_51();
}

void sub_1A6118544(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  sub_1A6118304(a1, a2);
}

BOOL static WeatherServiceCaching.EnablementStatus.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void WeatherServiceCaching.EnablementStatus.hash(into:)()
{
  sub_1A6123D70();
  OUTLINED_FUNCTION_51();
}

uint64_t WeatherServiceCaching.EnablementStatus.hashValue.getter()
{
  sub_1A6123D64();
  sub_1A6123D70();
  return sub_1A6123D88();
}

WeatherKit::WeatherServiceCaching __swiftcall WeatherServiceCaching.init(weatherDataCaching:availableDataSetCaching:statisticsCaching:)(WeatherKit::WeatherServiceCaching::EnablementStatus weatherDataCaching, WeatherKit::WeatherServiceCaching::EnablementStatus availableDataSetCaching, WeatherKit::WeatherServiceCaching::EnablementStatus statisticsCaching)
{
  _BYTE *v3;
  char v4;
  char v5;
  WeatherKit::WeatherServiceCaching result;

  v4 = *(_BYTE *)weatherDataCaching;
  v5 = *(_BYTE *)statisticsCaching;
  *v3 = *(_BYTE *)availableDataSetCaching;
  v3[1] = v5;
  v3[2] = v4;
  result.availableDataSetCaching = weatherDataCaching;
  return result;
}

void static WeatherServiceCaching.enabled.getter(uint64_t a1@<X8>)
{
  *(_WORD *)a1 = 257;
  *(_BYTE *)(a1 + 2) = 1;
}

unint64_t sub_1A6118618()
{
  unint64_t result;

  result = qword_1EE817B10;
  if (!qword_1EE817B10)
  {
    result = MEMORY[0x1A85BB36C](&protocol conformance descriptor for WeatherServiceCaching.Options, &type metadata for WeatherServiceCaching.Options);
    atomic_store(result, (unint64_t *)&qword_1EE817B10);
  }
  return result;
}

unint64_t sub_1A6118658()
{
  unint64_t result;

  result = qword_1EE817B18;
  if (!qword_1EE817B18)
  {
    result = MEMORY[0x1A85BB36C](&protocol conformance descriptor for WeatherServiceCaching.Options, &type metadata for WeatherServiceCaching.Options);
    atomic_store(result, (unint64_t *)&qword_1EE817B18);
  }
  return result;
}

unint64_t sub_1A6118698()
{
  unint64_t result;

  result = qword_1EE817B20;
  if (!qword_1EE817B20)
  {
    result = MEMORY[0x1A85BB36C](&protocol conformance descriptor for WeatherServiceCaching.EnablementStatus, &type metadata for WeatherServiceCaching.EnablementStatus);
    atomic_store(result, (unint64_t *)&qword_1EE817B20);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for WeatherServiceCaching(unsigned __int16 *a1, unsigned int a2)
{
  int v2;
  int v3;
  unsigned int v4;
  BOOL v5;

  if (!a2)
  {
    v3 = -1;
    return (v3 + 1);
  }
  if (a2 >= 0xFF)
  {
    if ((a2 + 33554177) >> 24)
    {
      v2 = *((unsigned __int8 *)a1 + 3);
      if (*((_BYTE *)a1 + 3))
        goto LABEL_5;
    }
    else
    {
      v2 = *(unsigned __int16 *)((char *)a1 + 3);
      if (*(unsigned __int16 *)((char *)a1 + 3))
      {
LABEL_5:
        v3 = (*a1 | (*((unsigned __int8 *)a1 + 2) << 16) | (v2 << 24)) - 16776962;
        return (v3 + 1);
      }
    }
  }
  v4 = *(unsigned __int8 *)a1;
  v5 = v4 >= 2;
  v3 = v4 - 2;
  if (!v5)
    v3 = -1;
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for WeatherServiceCaching(uint64_t result, unsigned int a2, unsigned int a3)
{
  int v3;
  unsigned int v4;

  if ((a3 + 33554177) >> 24)
    v3 = 1;
  else
    v3 = 2;
  if (a3 <= 0xFE)
    v3 = 0;
  if (a2 > 0xFE)
  {
    *(_WORD *)result = a2 - 255;
    *(_BYTE *)(result + 2) = (a2 - 255) >> 16;
    if (v3)
    {
      v4 = ((a2 - 255) >> 24) + 1;
      if (v3 == 2)
        *(_WORD *)(result + 3) = v4;
      else
        *(_BYTE *)(result + 3) = v4;
    }
  }
  else
  {
    if (!v3)
      goto LABEL_10;
    if (v3 == 2)
    {
      *(_WORD *)(result + 3) = 0;
LABEL_10:
      if (!a2)
        return result;
LABEL_16:
      *(_BYTE *)result = a2 + 1;
      return result;
    }
    *(_BYTE *)(result + 3) = 0;
    if (a2)
      goto LABEL_16;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for WeatherServiceCaching.EnablementStatus(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1A6118814 + 4 * byte_1A61404D5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1A6118848 + 4 * byte_1A61404D0[v4]))();
}

uint64_t sub_1A6118848(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A6118850(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1A6118858);
  return result;
}

uint64_t sub_1A6118864(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1A611886CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1A6118870(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A6118878(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for WeatherServiceCaching.EnablementStatus()
{
  OUTLINED_FUNCTION_62();
}

uint64_t sub_1A61188BC(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  BOOL v3;
  uint64_t v4;

  v2 = result + a2;
  if (__OFADD__(result, a2))
  {
    __break(1u);
  }
  else
  {
    if (v2 > 0)
      return OUTLINED_FUNCTION_0_50(v2 - 1);
    v3 = __OFSUB__(0, v2);
    v4 = -v2;
    if (!v3)
      return 8784 * (v4 / 8784) - v4 + 8784;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A6118900(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  BOOL v3;
  uint64_t v4;

  v2 = result + a2;
  if (__OFADD__(result, a2))
  {
    __break(1u);
  }
  else
  {
    if (v2 > 0)
      return OUTLINED_FUNCTION_0_50(v2 - 1);
    v3 = __OFSUB__(0, v2);
    v4 = -v2;
    if (!v3)
      return 366 * (v4 / 366) - v4 + 366;
  }
  __break(1u);
  return result;
}

WeatherKit::NextHourPerceivedIntensity __swiftcall NextHourPerceivedIntensity.init(value:category:)(Swift::Double value, WeatherKit::NextHourPerceivedIntensityScale category)
{
  uint64_t v2;
  char v3;
  WeatherKit::NextHourPerceivedIntensity result;

  v3 = *(_BYTE *)category;
  *(Swift::Double *)v2 = value;
  *(_BYTE *)(v2 + 8) = v3;
  result.value = value;
  result.category = category;
  return result;
}

uint64_t static NextHourPerceivedIntensity.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if (*(double *)a1 == *(double *)a2)
    return sub_1A5FCF238(*(unsigned __int8 *)(a1 + 8), *(unsigned __int8 *)(a2 + 8), *(double *)a1);
  else
    return 0;
}

double NextHourPerceivedIntensity.value.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

void NextHourPerceivedIntensity.value.setter(double a1)
{
  double *v1;

  *v1 = a1;
}

uint64_t (*NextHourPerceivedIntensity.value.modify())()
{
  return GEOLocationCoordinate2DMake;
}

void NextHourPerceivedIntensity.category.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 8);
}

_BYTE *NextHourPerceivedIntensity.category.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 8) = *result;
  return result;
}

uint64_t (*NextHourPerceivedIntensity.category.modify())()
{
  return GEOLocationCoordinate2DMake;
}

uint64_t sub_1A61189C0()
{
  sub_1A6118CB8();
  return sub_1A6123DE8();
}

uint64_t sub_1A61189E8()
{
  sub_1A6118CB8();
  return sub_1A6123DF4();
}

WeatherKit::NextHourPerceivedIntensityScale_optional __swiftcall NextHourPerceivedIntensityScale.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  WeatherKit::NextHourPerceivedIntensityScale_optional result;
  char v5;

  v2 = v1;
  v3 = sub_1A6123BB4();
  result.value = swift_bridgeObjectRelease();
  v5 = 3;
  if (v3 < 3)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t NextHourPerceivedIntensityScale.rawValue.getter()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x6D756964656DLL;
  if (*v0 != 1)
    v1 = 0x7976616568;
  if (*v0)
    return v1;
  else
    return 0x746867696CLL;
}

WeatherKit::NextHourPerceivedIntensityScale_optional sub_1A6118AB8(Swift::String *a1)
{
  return NextHourPerceivedIntensityScale.init(rawValue:)(*a1);
}

uint64_t sub_1A6118AC4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = NextHourPerceivedIntensityScale.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1A6118AE8()
{
  sub_1A611917C();
  return sub_1A61238B4();
}

uint64_t sub_1A6118B44()
{
  sub_1A611917C();
  return sub_1A612389C();
}

void NextHourPerceivedIntensity.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  char v8;
  _BYTE v9[16];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE817B28);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = &v9[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = *(_BYTE *)(v1 + 8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A6118CB8();
  sub_1A6123DD0();
  v9[15] = 0;
  sub_1A6123CA4();
  if (!v2)
  {
    v9[14] = v8;
    v9[13] = 1;
    sub_1A6118CF4();
    sub_1A6123CC8();
  }
  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
  OUTLINED_FUNCTION_0_12();
}

unint64_t sub_1A6118CB8()
{
  unint64_t result;

  result = qword_1EE817B30;
  if (!qword_1EE817B30)
  {
    result = MEMORY[0x1A85BB36C](&unk_1A61409C0, &type metadata for NextHourPerceivedIntensity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE817B30);
  }
  return result;
}

unint64_t sub_1A6118CF4()
{
  unint64_t result;

  result = qword_1EE817B38;
  if (!qword_1EE817B38)
  {
    result = MEMORY[0x1A85BB36C](&protocol conformance descriptor for NextHourPerceivedIntensityScale, &type metadata for NextHourPerceivedIntensityScale);
    atomic_store(result, (unint64_t *)&qword_1EE817B38);
  }
  return result;
}

void NextHourPerceivedIntensity.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE817B40);
  MEMORY[0x1E0C80A78](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A6118CB8();
  sub_1A6123DC4();
  if (!v2)
  {
    sub_1A6123C20();
    v7 = v6;
    sub_1A6118E70();
    sub_1A6123C44();
    OUTLINED_FUNCTION_17();
    *(_QWORD *)a2 = v7;
    *(_BYTE *)(a2 + 8) = v8;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  OUTLINED_FUNCTION_0_12();
}

unint64_t sub_1A6118E70()
{
  unint64_t result;

  result = qword_1EE817B48;
  if (!qword_1EE817B48)
  {
    result = MEMORY[0x1A85BB36C](&protocol conformance descriptor for NextHourPerceivedIntensityScale, &type metadata for NextHourPerceivedIntensityScale);
    atomic_store(result, (unint64_t *)&qword_1EE817B48);
  }
  return result;
}

unint64_t sub_1A6118EB0()
{
  unint64_t result;

  result = qword_1EE817B50;
  if (!qword_1EE817B50)
  {
    result = MEMORY[0x1A85BB36C](&protocol conformance descriptor for NextHourPerceivedIntensityScale, &type metadata for NextHourPerceivedIntensityScale);
    atomic_store(result, (unint64_t *)&qword_1EE817B50);
  }
  return result;
}

void sub_1A6118EEC(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  NextHourPerceivedIntensity.init(from:)(a1, a2);
}

void sub_1A6118F00(_QWORD *a1)
{
  NextHourPerceivedIntensity.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for NextHourPerceivedIntensity()
{
  return &type metadata for NextHourPerceivedIntensity;
}

uint64_t storeEnumTagSinglePayload for NextHourPerceivedIntensityScale(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1A6118F70 + 4 * byte_1A6140725[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1A6118FA4 + 4 * byte_1A6140720[v4]))();
}

uint64_t sub_1A6118FA4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A6118FAC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1A6118FB4);
  return result;
}

uint64_t sub_1A6118FC0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1A6118FC8);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1A6118FCC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A6118FD4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for NextHourPerceivedIntensityScale()
{
  return &type metadata for NextHourPerceivedIntensityScale;
}

uint64_t storeEnumTagSinglePayload for NextHourPerceivedIntensity.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1A611903C + 4 * byte_1A614072F[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1A6119070 + 4 * byte_1A614072A[v4]))();
}

uint64_t sub_1A6119070(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A6119078(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1A6119080);
  return result;
}

uint64_t sub_1A611908C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1A6119094);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1A6119098(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A61190A0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for NextHourPerceivedIntensity.CodingKeys()
{
  return &type metadata for NextHourPerceivedIntensity.CodingKeys;
}

unint64_t sub_1A61190C0()
{
  unint64_t result;

  result = qword_1EE817B58;
  if (!qword_1EE817B58)
  {
    result = MEMORY[0x1A85BB36C](&unk_1A6140998, &type metadata for NextHourPerceivedIntensity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE817B58);
  }
  return result;
}

unint64_t sub_1A6119100()
{
  unint64_t result;

  result = qword_1EE817B60;
  if (!qword_1EE817B60)
  {
    result = MEMORY[0x1A85BB36C](&unk_1A6140908, &type metadata for NextHourPerceivedIntensity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE817B60);
  }
  return result;
}

unint64_t sub_1A6119140()
{
  unint64_t result;

  result = qword_1EE817B68;
  if (!qword_1EE817B68)
  {
    result = MEMORY[0x1A85BB36C](&unk_1A6140930, &type metadata for NextHourPerceivedIntensity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE817B68);
  }
  return result;
}

unint64_t sub_1A611917C()
{
  unint64_t result;

  result = qword_1EE817B70;
  if (!qword_1EE817B70)
  {
    result = MEMORY[0x1A85BB36C](&protocol conformance descriptor for NextHourPerceivedIntensityScale, &type metadata for NextHourPerceivedIntensityScale);
    atomic_store(result, (unint64_t *)&qword_1EE817B70);
  }
  return result;
}

uint64_t ReverseGeocodeResult.name.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ReverseGeocodeResult.timeZone.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for ReverseGeocodeResult() + 20);
  v4 = OUTLINED_FUNCTION_114();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t type metadata accessor for ReverseGeocodeResult()
{
  uint64_t result;

  result = qword_1ED192350;
  if (!qword_1ED192350)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t ReverseGeocodeResult.countryCode.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for ReverseGeocodeResult() + 24));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1A611929C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  char v8;

  v2 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v2 || (sub_1A6123CF8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x656E6F5A656D6974 && a2 == 0xE800000000000000;
    if (v6 || (sub_1A6123CF8() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x437972746E756F63 && a2 == 0xEB0000000065646FLL)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      v8 = sub_1A6123CF8();
      swift_bridgeObjectRelease();
      if ((v8 & 1) != 0)
        return 2;
      else
        return 3;
    }
  }
}

uint64_t sub_1A61193F0(char a1)
{
  if (!a1)
    return 1701667182;
  if (a1 == 1)
    return 0x656E6F5A656D6974;
  return 0x437972746E756F63;
}

uint64_t sub_1A6119448()
{
  char *v0;

  return sub_1A61193F0(*v0);
}

uint64_t sub_1A6119450@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1A611929C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A6119474()
{
  sub_1A611963C();
  return sub_1A6123DE8();
}

uint64_t sub_1A611949C()
{
  sub_1A611963C();
  return sub_1A6123DF4();
}

uint64_t ReverseGeocodeResult.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED191EE8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_0();
  v7 = v6 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A611963C();
  sub_1A6123DD0();
  sub_1A6123C8C();
  if (!v1)
  {
    type metadata accessor for ReverseGeocodeResult();
    sub_1A61220A8();
    sub_1A6119914(&qword_1ED191EA0, MEMORY[0x1E0CB1488]);
    sub_1A6123CC8();
    sub_1A6123C74();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v7, v3);
}

unint64_t sub_1A611963C()
{
  unint64_t result;

  result = qword_1ED192338;
  if (!qword_1ED192338)
  {
    result = MEMORY[0x1A85BB36C](&unk_1A6140B8C, &type metadata for ReverseGeocodeResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED192338);
  }
  return result;
}

uint64_t ReverseGeocodeResult.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v3 = sub_1A61220A8();
  v18 = *(_QWORD *)(v3 - 8);
  v19 = v3;
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_0();
  v6 = v5 - v4;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED191EE0);
  MEMORY[0x1E0C80A78](v20);
  OUTLINED_FUNCTION_0();
  v7 = type metadata accessor for ReverseGeocodeResult();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_0();
  v10 = (uint64_t *)(v9 - v8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A611963C();
  sub_1A6123DC4();
  if (v21)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  *v10 = sub_1A6123C08();
  v10[1] = v11;
  sub_1A6119914(&qword_1ED191EA8, MEMORY[0x1E0CB14A0]);
  sub_1A6123C44();
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 32))((char *)v10 + *(int *)(v7 + 20), v6, v19);
  v12 = sub_1A6123BF0();
  v14 = v13;
  OUTLINED_FUNCTION_0_51();
  v15 = (uint64_t *)((char *)v10 + *(int *)(v7 + 24));
  *v15 = v12;
  v15[1] = v14;
  sub_1A5FEA1D0((uint64_t)v10, a2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_1A601D604((uint64_t)v10);
}

uint64_t sub_1A6119914(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_1A61220A8();
    result = MEMORY[0x1A85BB36C](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1A6119954@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return ReverseGeocodeResult.init(from:)(a1, a2);
}

uint64_t sub_1A6119968(_QWORD *a1)
{
  return ReverseGeocodeResult.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for ReverseGeocodeResult(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v17 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
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
    v11 = sub_1A61220A8();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v13 = *(int *)(a3 + 24);
    v14 = (uint64_t *)((char *)v4 + v13);
    v15 = (uint64_t *)((char *)a2 + v13);
    v16 = v15[1];
    *v14 = *v15;
    v14[1] = v16;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for ReverseGeocodeResult(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_1A61220A8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for ReverseGeocodeResult(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_1A61220A8();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  v12 = *(int *)(a3 + 24);
  v13 = (_QWORD *)((char *)a1 + v12);
  v14 = (_QWORD *)((char *)a2 + v12);
  v15 = v14[1];
  *v13 = *v14;
  v13[1] = v15;
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for ReverseGeocodeResult(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_1A61220A8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = *(int *)(a3 + 24);
  v11 = (_QWORD *)((char *)a1 + v10);
  v12 = (_QWORD *)((char *)a2 + v10);
  *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *initializeWithTake for ReverseGeocodeResult(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_1A61220A8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

_QWORD *assignWithTake for ReverseGeocodeResult(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_1A61220A8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = *(int *)(a3 + 24);
  v12 = (_QWORD *)((char *)a1 + v11);
  v13 = (_QWORD *)((char *)a2 + v11);
  v15 = *v13;
  v14 = v13[1];
  *v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ReverseGeocodeResult()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1A6119CFC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = OUTLINED_FUNCTION_114();
    return __swift_getEnumTagSinglePayload(a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for ReverseGeocodeResult()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1A6119D78(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = OUTLINED_FUNCTION_114();
    return __swift_storeEnumTagSinglePayload(v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

uint64_t sub_1A6119DE0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1A61220A8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for ReverseGeocodeResult.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1A6119EA8 + 4 * byte_1A6140A15[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1A6119EDC + 4 * byte_1A6140A10[v4]))();
}

uint64_t sub_1A6119EDC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A6119EE4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1A6119EECLL);
  return result;
}

uint64_t sub_1A6119EF8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1A6119F00);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1A6119F04(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A6119F0C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ReverseGeocodeResult.CodingKeys()
{
  return &type metadata for ReverseGeocodeResult.CodingKeys;
}

unint64_t sub_1A6119F2C()
{
  unint64_t result;

  result = qword_1EE817B78;
  if (!qword_1EE817B78)
  {
    result = MEMORY[0x1A85BB36C](&unk_1A6140B64, &type metadata for ReverseGeocodeResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE817B78);
  }
  return result;
}

unint64_t sub_1A6119F6C()
{
  unint64_t result;

  result = qword_1ED192348;
  if (!qword_1ED192348)
  {
    result = MEMORY[0x1A85BB36C](&unk_1A6140AD4, &type metadata for ReverseGeocodeResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED192348);
  }
  return result;
}

unint64_t sub_1A6119FAC()
{
  unint64_t result;

  result = qword_1ED192340;
  if (!qword_1ED192340)
  {
    result = MEMORY[0x1A85BB36C](&unk_1A6140AFC, &type metadata for ReverseGeocodeResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED192340);
  }
  return result;
}

uint64_t static HistoricalComparisons.mock(comparisons:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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
  void (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;

  v4 = sub_1A6121F58();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v17 - v9;
  v11 = qword_1EE812C10;
  swift_bridgeObjectRetain();
  if (v11 != -1)
    swift_once();
  v12 = __swift_project_value_buffer(v4, (uint64_t)qword_1EE844F50);
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v13(v10, v12, v4);
  if (qword_1EE812C18 != -1)
    swift_once();
  v14 = __swift_project_value_buffer(v4, (uint64_t)qword_1EE844F68);
  v13(v7, v14, v4);
  v15 = type metadata accessor for HistoricalComparisons();
  result = WeatherMetadata.init(date:expirationDate:latitude:longitude:)((uint64_t)v10, (uint64_t)v7, (uint64_t)a2 + *(int *)(v15 + 20), 37.323, -122.0);
  *a2 = a1;
  return result;
}

uint64_t DayPartForecast.init(cloudCover:cloudCoverByAltitude:condition:highTemperature:lowTemperature:precipitation:precipitationAmountByType:precipitationChance:maximumHumidity:minimumHumidity:maximumVisibility:minimumVisibility:wind:highWindSpeed:)@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, double a10@<D0>, double a11@<D1>, double a12@<D2>, double a13@<D3>, uint64_t a14, uint64_t a15)
{
  uint64_t v23;
  char v24;
  char v25;
  int *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;

  v23 = *(_QWORD *)(a1 + 16);
  v24 = *a2;
  v25 = *a5;
  *(double *)a9 = a10;
  *(_OWORD *)(a9 + 8) = *(_OWORD *)a1;
  *(_QWORD *)(a9 + 24) = v23;
  *(_BYTE *)(a9 + 32) = v24;
  v26 = (int *)OUTLINED_FUNCTION_1_52();
  v27 = a9 + v26[7];
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192880);
  v29 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 32);
  v29(v27, a3, v28);
  v29(a9 + v26[8], a4, v28);
  *(_BYTE *)(a9 + v26[9]) = v25;
  sub_1A611A2EC(a6, a9 + v26[10], (uint64_t (*)(_QWORD))type metadata accessor for PrecipitationAmountByType);
  *(double *)(a9 + v26[11]) = a11;
  *(double *)(a9 + v26[12]) = a12;
  *(double *)(a9 + v26[13]) = a13;
  v30 = a9 + v26[14];
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192980);
  v32 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 32);
  v32(v30, a7, v31);
  v32(a9 + v26[15], a8, v31);
  sub_1A611A2EC(a14, a9 + v26[16], (uint64_t (*)(_QWORD))type metadata accessor for Wind);
  v33 = a9 + v26[17];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192960);
  OUTLINED_FUNCTION_47();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v34 + 32))(v33, a15);
}

void sub_1A611A2EC(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  OUTLINED_FUNCTION_34(a1, a2, a3);
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_14(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 32));
  OUTLINED_FUNCTION_51();
}

double DayPartForecast.cloudCover.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

void DayPartForecast.cloudCover.setter(double a1)
{
  double *v1;

  *v1 = a1;
}

uint64_t (*DayPartForecast.cloudCover.modify())()
{
  return GEOLocationCoordinate2DMake;
}

double DayPartForecast.cloudCoverByAltitude.getter@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  double result;

  result = *(double *)(v1 + 24);
  *(_OWORD *)a1 = *(_OWORD *)(v1 + 8);
  *(double *)(a1 + 16) = result;
  return result;
}

double DayPartForecast.cloudCoverByAltitude.setter(uint64_t a1)
{
  uint64_t v1;
  double result;

  result = *(double *)(a1 + 16);
  *(_OWORD *)(v1 + 8) = *(_OWORD *)a1;
  *(double *)(v1 + 24) = result;
  return result;
}

uint64_t (*DayPartForecast.cloudCoverByAltitude.modify())()
{
  return GEOLocationCoordinate2DMake;
}

_BYTE *DayPartForecast.condition.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 32) = *result;
  return result;
}

uint64_t (*DayPartForecast.condition.modify())()
{
  return GEOLocationCoordinate2DMake;
}

uint64_t DayPartForecast.highTemperature.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_1_52();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192880);
  v0 = OUTLINED_FUNCTION_10();
  return OUTLINED_FUNCTION_30(v0, v1, v2, v3);
}

uint64_t DayPartForecast.highTemperature.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_1_52();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192880);
  v0 = OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_30(v0, v1, v2, v3);
}

double (*DayPartForecast.highTemperature.modify())(double, double)
{
  OUTLINED_FUNCTION_1_52();
  return GEOLocationCoordinate2DMake;
}

uint64_t DayPartForecast.lowTemperature.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_1_52();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192880);
  v0 = OUTLINED_FUNCTION_10();
  return OUTLINED_FUNCTION_30(v0, v1, v2, v3);
}

uint64_t DayPartForecast.lowTemperature.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_1_52();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192880);
  v0 = OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_30(v0, v1, v2, v3);
}

double (*DayPartForecast.lowTemperature.modify())(double, double)
{
  OUTLINED_FUNCTION_1_52();
  return GEOLocationCoordinate2DMake;
}

void DayPartForecast.precipitation.setter(char *a1)
{
  uint64_t v1;
  char v2;

  v2 = *a1;
  *(_BYTE *)(v1 + *(int *)(OUTLINED_FUNCTION_1_52() + 36)) = v2;
  OUTLINED_FUNCTION_51();
}

double (*DayPartForecast.precipitation.modify())(double, double)
{
  OUTLINED_FUNCTION_1_52();
  return GEOLocationCoordinate2DMake;
}

void DayPartForecast.precipitationAmountByType.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_1_52();
  sub_1A611BD50(v1 + *(int *)(v3 + 40), a1, (uint64_t (*)(_QWORD))type metadata accessor for PrecipitationAmountByType);
  OUTLINED_FUNCTION_51();
}

void DayPartForecast.precipitationAmountByType.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_1_52();
  sub_1A611A804(a1, v1 + *(int *)(v3 + 40), (uint64_t (*)(_QWORD))type metadata accessor for PrecipitationAmountByType);
  OUTLINED_FUNCTION_51();
}

double (*DayPartForecast.precipitationAmountByType.modify())(double, double)
{
  OUTLINED_FUNCTION_1_52();
  return GEOLocationCoordinate2DMake;
}

void DayPartForecast.precipitationChance.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + *(int *)(OUTLINED_FUNCTION_1_52() + 44)) = a1;
  OUTLINED_FUNCTION_24_4();
}

double (*DayPartForecast.precipitationChance.modify())(double, double)
{
  OUTLINED_FUNCTION_1_52();
  return GEOLocationCoordinate2DMake;
}

double DayPartForecast.maximumHumidity.getter()
{
  uint64_t v0;

  return *(double *)(v0 + *(int *)(OUTLINED_FUNCTION_1_52() + 48));
}

void DayPartForecast.maximumHumidity.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + *(int *)(OUTLINED_FUNCTION_1_52() + 48)) = a1;
  OUTLINED_FUNCTION_24_4();
}

double (*DayPartForecast.maximumHumidity.modify())(double, double)
{
  OUTLINED_FUNCTION_1_52();
  return GEOLocationCoordinate2DMake;
}

double DayPartForecast.minimumHumidity.getter()
{
  uint64_t v0;

  return *(double *)(v0 + *(int *)(OUTLINED_FUNCTION_1_52() + 52));
}

void DayPartForecast.minimumHumidity.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + *(int *)(OUTLINED_FUNCTION_1_52() + 52)) = a1;
  OUTLINED_FUNCTION_24_4();
}

double (*DayPartForecast.minimumHumidity.modify())(double, double)
{
  OUTLINED_FUNCTION_1_52();
  return GEOLocationCoordinate2DMake;
}

uint64_t DayPartForecast.maximumVisibility.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_1_52();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192980);
  v0 = OUTLINED_FUNCTION_10();
  return OUTLINED_FUNCTION_30(v0, v1, v2, v3);
}

uint64_t DayPartForecast.maximumVisibility.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_1_52();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192980);
  v0 = OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_30(v0, v1, v2, v3);
}

double (*DayPartForecast.maximumVisibility.modify())(double, double)
{
  OUTLINED_FUNCTION_1_52();
  return GEOLocationCoordinate2DMake;
}

uint64_t DayPartForecast.minimumVisibility.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_1_52();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192980);
  v0 = OUTLINED_FUNCTION_10();
  return OUTLINED_FUNCTION_30(v0, v1, v2, v3);
}

uint64_t DayPartForecast.minimumVisibility.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_1_52();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192980);
  v0 = OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_30(v0, v1, v2, v3);
}

double (*DayPartForecast.minimumVisibility.modify())(double, double)
{
  OUTLINED_FUNCTION_1_52();
  return GEOLocationCoordinate2DMake;
}

void DayPartForecast.wind.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_1_52();
  sub_1A611BD50(v1 + *(int *)(v3 + 64), a1, (uint64_t (*)(_QWORD))type metadata accessor for Wind);
  OUTLINED_FUNCTION_51();
}

void DayPartForecast.wind.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_1_52();
  sub_1A611A804(a1, v1 + *(int *)(v3 + 64), (uint64_t (*)(_QWORD))type metadata accessor for Wind);
  OUTLINED_FUNCTION_51();
}

void sub_1A611A804(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  OUTLINED_FUNCTION_34(a1, a2, a3);
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_14(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 40));
  OUTLINED_FUNCTION_51();
}

double (*DayPartForecast.wind.modify())(double, double)
{
  OUTLINED_FUNCTION_1_52();
  return GEOLocationCoordinate2DMake;
}

uint64_t DayPartForecast.highWindSpeed.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_1_52();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192960);
  v0 = OUTLINED_FUNCTION_10();
  return OUTLINED_FUNCTION_30(v0, v1, v2, v3);
}

uint64_t DayPartForecast.highWindSpeed.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_1_52();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192960);
  v0 = OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_30(v0, v1, v2, v3);
}

double (*DayPartForecast.highWindSpeed.modify())(double, double)
{
  OUTLINED_FUNCTION_1_52();
  return GEOLocationCoordinate2DMake;
}

uint64_t sub_1A611A8DC(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  BOOL v12;
  char v14;

  v2 = a1 == 0x766F4364756F6C63 && a2 == 0xEA00000000007265;
  if (v2 || (sub_1A6123CF8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x80000001A6143370 || (sub_1A6123CF8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = a1 == 0x6F697469646E6F63 && a2 == 0xE90000000000006ELL;
    if (v6 || (sub_1A6123CF8() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      v7 = a1 == 0x706D655468676968 && a2 == 0xEF65727574617265;
      if (v7 || (sub_1A6123CF8() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        v8 = a1 == 0x65706D6554776F6CLL && a2 == 0xEE00657275746172;
        if (v8 || (sub_1A6123CF8() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else
        {
          v9 = a1 == 0x7469706963657270 && a2 == 0xED00006E6F697461;
          if (v9 || (sub_1A6123CF8() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else if (a1 == 0xD000000000000019 && a2 == 0x80000001A6142010 || (sub_1A6123CF8() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 6;
          }
          else if (a1 == 0xD000000000000013 && a2 == 0x80000001A6141F70 || (sub_1A6123CF8() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 7;
          }
          else
          {
            v10 = a1 == 0x486D756D6978616DLL && a2 == 0xEF79746964696D75;
            if (v10 || (sub_1A6123CF8() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 8;
            }
            else
            {
              v11 = a1 == 0x486D756D696E696DLL && a2 == 0xEF79746964696D75;
              if (v11 || (sub_1A6123CF8() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 9;
              }
              else if (a1 == 0xD000000000000011 && a2 == 0x80000001A6142030 || (sub_1A6123CF8() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 10;
              }
              else if (a1 == 0xD000000000000011 && a2 == 0x80000001A6142050 || (sub_1A6123CF8() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 11;
              }
              else
              {
                v12 = a1 == 1684957559 && a2 == 0xE400000000000000;
                if (v12 || (sub_1A6123CF8() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 12;
                }
                else if (a1 == 0x646E695768676968 && a2 == 0xED00006465657053)
                {
                  swift_bridgeObjectRelease();
                  return 13;
                }
                else
                {
                  v14 = sub_1A6123CF8();
                  swift_bridgeObjectRelease();
                  if ((v14 & 1) != 0)
                    return 13;
                  else
                    return 14;
                }
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_1A611AEF8(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1A611AF30 + 4 * byte_1A6140BE0[a1]))(0x766F4364756F6C63, 0xEA00000000007265);
}

unint64_t sub_1A611AF30()
{
  return 0xD000000000000014;
}

uint64_t sub_1A611B008()
{
  return 0x486D756D6978616DLL;
}

unint64_t sub_1A611B038()
{
  return 0xD000000000000011;
}

uint64_t sub_1A611B060()
{
  return 1684957559;
}

uint64_t sub_1A611B070()
{
  return 0x646E695768676968;
}

uint64_t sub_1A611B094()
{
  unsigned __int8 *v0;

  return sub_1A611AEF8(*v0);
}

uint64_t sub_1A611B09C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1A611A8DC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A611B0C0()
{
  sub_1A611B514();
  return sub_1A6123DE8();
}

uint64_t sub_1A611B0E8()
{
  sub_1A611B514();
  return sub_1A6123DF4();
}

void DayPartForecast.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE817B80);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_0();
  v7 = v6 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A611B514();
  sub_1A6123DD0();
  OUTLINED_FUNCTION_5_48();
  if (!v1)
  {
    sub_1A5FFF610();
    OUTLINED_FUNCTION_2_15();
    sub_1A5FD701C();
    OUTLINED_FUNCTION_2_15();
    type metadata accessor for DayPartForecast();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192880);
    sub_1A5FA3DEC(&qword_1ED191688, &qword_1ED192880);
    OUTLINED_FUNCTION_2_15();
    OUTLINED_FUNCTION_2_15();
    sub_1A5FD25B0();
    OUTLINED_FUNCTION_2_15();
    type metadata accessor for PrecipitationAmountByType();
    sub_1A5FAF4C0(&qword_1EE812F08, (void (*)(uint64_t))type metadata accessor for PrecipitationAmountByType);
    OUTLINED_FUNCTION_2_15();
    OUTLINED_FUNCTION_5_48();
    OUTLINED_FUNCTION_5_48();
    OUTLINED_FUNCTION_5_48();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192980);
    sub_1A5FA3DEC(&qword_1ED191678, &qword_1ED192980);
    OUTLINED_FUNCTION_2_15();
    OUTLINED_FUNCTION_2_15();
    type metadata accessor for Wind();
    sub_1A5FAF4C0(&qword_1ED191780, (void (*)(uint64_t))type metadata accessor for Wind);
    OUTLINED_FUNCTION_2_15();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192960);
    sub_1A5FA3DEC(&qword_1ED191670, &qword_1ED192960);
    OUTLINED_FUNCTION_2_15();
  }
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v7, v3);
  OUTLINED_FUNCTION_20();
}

unint64_t sub_1A611B514()
{
  unint64_t result;

  result = qword_1EE817B88;
  if (!qword_1EE817B88)
  {
    result = MEMORY[0x1A85BB36C](&unk_1A6140DF4, &type metadata for DayPartForecast.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE817B88);
  }
  return result;
}

void DayPartForecast.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  unsigned int v33;
  uint64_t v34;
  int *v35;
  uint64_t v36;
  void (*v37)(char *, uint64_t);
  void (*v38)(char *, uint64_t);
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  int *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(char *, char *, uint64_t);
  uint64_t v53;
  void (*v54)(char *, char *, uint64_t);
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  _QWORD *v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD *v73;
  int *v74;
  __int128 v75;
  uint64_t v76;
  char v77;

  v58 = a2;
  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192960);
  v57 = *(_QWORD *)(v60 - 8);
  OUTLINED_FUNCTION_41();
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_11_0();
  v59 = v4;
  v61 = type metadata accessor for Wind();
  OUTLINED_FUNCTION_41();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_11_0();
  v62 = v6;
  v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192980);
  v67 = *(_QWORD *)(v72 - 8);
  OUTLINED_FUNCTION_41();
  MEMORY[0x1E0C80A78](v7);
  v63 = (char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v64 = (char *)&v54 - v10;
  v11 = type metadata accessor for PrecipitationAmountByType();
  OUTLINED_FUNCTION_41();
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_0();
  v15 = v14 - v13;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192880);
  v68 = *(_QWORD *)(v16 - 8);
  v69 = v16;
  OUTLINED_FUNCTION_41();
  MEMORY[0x1E0C80A78](v17);
  v19 = (char *)&v54 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v20);
  v22 = (char *)&v54 - v21;
  v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE817B90);
  v23 = *(_QWORD *)(v66 - 8);
  MEMORY[0x1E0C80A78](v66);
  OUTLINED_FUNCTION_0();
  v26 = v25 - v24;
  v74 = (int *)type metadata accessor for DayPartForecast();
  OUTLINED_FUNCTION_41();
  MEMORY[0x1E0C80A78](v27);
  OUTLINED_FUNCTION_11_0();
  v73 = v28;
  v29 = a1[3];
  v70 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v29);
  sub_1A611B514();
  v65 = v26;
  v30 = v71;
  sub_1A6123DC4();
  if (v30)
  {
    LODWORD(v71) = 0;
    v33 = 0;
    v40 = v73;
    v34 = (uint64_t)v70;
  }
  else
  {
    v31 = v19;
    v71 = v11;
    v32 = v15;
    LOBYTE(v75) = 0;
    sub_1A6123C20();
    v40 = v73;
    *v73 = v41;
    v77 = 1;
    sub_1A60000FC();
    OUTLINED_FUNCTION_10_47();
    v42 = v76;
    *(_OWORD *)(v40 + 1) = v75;
    v40[3] = v42;
    v77 = 2;
    sub_1A5FD7094();
    OUTLINED_FUNCTION_10_47();
    v56 = v23;
    *((_BYTE *)v40 + 32) = v75;
    LOBYTE(v75) = 3;
    sub_1A5FA3DEC(&qword_1EE812F28, &qword_1ED192880);
    OUTLINED_FUNCTION_13_4();
    v43 = v69;
    OUTLINED_FUNCTION_26_21();
    *(_QWORD *)(v45 - 256) = v44;
    OUTLINED_FUNCTION_11_41();
    v46 = (char *)v40 + v74[7];
    v55 = 0;
    v54 = *(void (**)(char *, char *, uint64_t))(v68 + 32);
    v54(v46, v22, v43);
    LOBYTE(v75) = 4;
    OUTLINED_FUNCTION_26_21();
    v47 = v55;
    sub_1A6123C44();
    if (!v47)
    {
      v48 = v74;
      v54((char *)v40 + v74[8], v31, v43);
      v77 = 5;
      sub_1A5FD29B8();
      sub_1A6123C44();
      *((_BYTE *)v40 + v48[9]) = v75;
      LOBYTE(v75) = 6;
      sub_1A5FAF4C0(&qword_1EE812F30, (void (*)(uint64_t))type metadata accessor for PrecipitationAmountByType);
      OUTLINED_FUNCTION_13_4();
      OUTLINED_FUNCTION_10_47();
      sub_1A611A2EC(v32, (uint64_t)v40 + v48[10], (uint64_t (*)(_QWORD))type metadata accessor for PrecipitationAmountByType);
      OUTLINED_FUNCTION_7_45(7);
      *(_QWORD *)((char *)v40 + v74[11]) = v49;
      OUTLINED_FUNCTION_7_45(8);
      *(_QWORD *)((char *)v40 + v74[12]) = v50;
      OUTLINED_FUNCTION_7_45(9);
      *(_QWORD *)((char *)v73 + v74[13]) = v51;
      LOBYTE(v75) = 10;
      sub_1A5FA3DEC(&qword_1EE812E58, &qword_1ED192980);
      OUTLINED_FUNCTION_11_41();
      v52 = *(void (**)(char *, char *, uint64_t))(v67 + 32);
      v52((char *)v73 + v74[14], v64, v72);
      LOBYTE(v75) = 11;
      OUTLINED_FUNCTION_11_41();
      v52((char *)v73 + v74[15], v63, v72);
      LOBYTE(v75) = 12;
      sub_1A5FAF4C0(&qword_1EE812F50, (void (*)(uint64_t))type metadata accessor for Wind);
      OUTLINED_FUNCTION_13_4();
      OUTLINED_FUNCTION_10_47();
      sub_1A611A2EC(v62, (uint64_t)v73 + v74[16], (uint64_t (*)(_QWORD))type metadata accessor for Wind);
      LOBYTE(v75) = 13;
      sub_1A5FA3DEC(&qword_1EE812EE0, &qword_1ED192960);
      OUTLINED_FUNCTION_13_4();
      OUTLINED_FUNCTION_10_47();
      OUTLINED_FUNCTION_8_43();
      v53 = (uint64_t)v73;
      (*(void (**)(char *, uint64_t, uint64_t))(v57 + 32))((char *)v73 + v74[17], v59, v60);
      sub_1A611BD50(v53, v58, (uint64_t (*)(_QWORD))type metadata accessor for DayPartForecast);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v70);
      sub_1A5FAD104(v53, (uint64_t (*)(_QWORD))type metadata accessor for DayPartForecast);
      goto LABEL_15;
    }
    OUTLINED_FUNCTION_9_38(*(uint64_t (**)(uint64_t, uint64_t))(v56 + 8));
    LODWORD(v71) = 0;
    v33 = 8;
    v34 = (uint64_t)v70;
  }
  __swift_destroy_boxed_opaque_existential_1(v34);
  v35 = v74;
  if ((v33 & 8) != 0
    && (v36 = v69,
        v37 = *(void (**)(char *, uint64_t))(v68 + 8),
        v37((char *)v40 + v74[7], v69),
        ((v33 >> 4) & 1) != 0))
  {
    v37((char *)v40 + v35[8], v36);
    if (((v33 >> 6) & 1) == 0)
      goto LABEL_7;
  }
  else if (((v33 >> 6) & 1) == 0)
  {
LABEL_7:
    if (((v33 >> 10) & 1) != 0)
      goto LABEL_8;
    goto LABEL_12;
  }
  sub_1A5FAD104((uint64_t)v40 + v35[10], (uint64_t (*)(_QWORD))type metadata accessor for PrecipitationAmountByType);
  if (((v33 >> 10) & 1) != 0)
  {
LABEL_8:
    v38 = *(void (**)(char *, uint64_t))(v67 + 8);
    v39 = v72;
    v38((char *)v40 + v35[14], v72);
    if ((v71 & 1) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_12:
  v39 = v72;
  if ((_DWORD)v71)
  {
    v38 = *(void (**)(char *, uint64_t))(v67 + 8);
LABEL_14:
    v38((char *)v40 + v35[15], v39);
  }
LABEL_15:
  OUTLINED_FUNCTION_20();
}

void sub_1A611BD50(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  OUTLINED_FUNCTION_34(a1, a2, a3);
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_14(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16));
  OUTLINED_FUNCTION_51();
}

void sub_1A611BD78(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  DayPartForecast.init(from:)(a1, a2);
}

void sub_1A611BD8C(_QWORD *a1)
{
  DayPartForecast.encode(to:)(a1);
}

_QWORD *initializeBufferWithCopyOfBuffer for DayPartForecast(uint64_t a1, uint64_t *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t, uint64_t);
  int *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  int *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  int *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(char *, uint64_t, uint64_t);
  uint64_t v37;
  char *v38;
  const void *v39;
  uint64_t v40;
  uint64_t v41;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v41 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v41 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_QWORD *)a1 = *a2;
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 1);
    *(_QWORD *)(a1 + 24) = a2[3];
    *(_BYTE *)(a1 + 32) = *((_BYTE *)a2 + 32);
    v7 = a3[7];
    v8 = a1 + v7;
    v9 = (uint64_t)a2 + v7;
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192880);
    v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
    v11(v8, v9, v10);
    v11((uint64_t)v4 + a3[8], (uint64_t)a2 + a3[8], v10);
    v12 = a3[10];
    *((_BYTE *)v4 + a3[9]) = *((_BYTE *)a2 + a3[9]);
    v13 = (char *)v4 + v12;
    v14 = (uint64_t)a2 + v12;
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192980);
    v16 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16);
    v16(v13, v14, v15);
    v17 = (int *)type metadata accessor for PrecipitationAmountByType();
    v16(&v13[v17[5]], v14 + v17[5], v15);
    v16(&v13[v17[6]], v14 + v17[6], v15);
    v16(&v13[v17[7]], v14 + v17[7], v15);
    v16(&v13[v17[8]], v14 + v17[8], v15);
    v18 = v17[9];
    v19 = &v13[v18];
    v20 = v14 + v18;
    v16(v19, v20, v15);
    v21 = (int *)type metadata accessor for SnowfallAmount();
    v16(&v19[v21[5]], v20 + v21[5], v15);
    v16(&v19[v21[6]], v20 + v21[6], v15);
    v16(&v19[v21[7]], v20 + v21[7], v15);
    v16(&v19[v21[8]], v20 + v21[8], v15);
    v16(&v19[v21[9]], v20 + v21[9], v15);
    v22 = a3[12];
    *(_QWORD *)((char *)v4 + a3[11]) = *(uint64_t *)((char *)a2 + a3[11]);
    *(_QWORD *)((char *)v4 + v22) = *(uint64_t *)((char *)a2 + v22);
    v23 = a3[14];
    *(_QWORD *)((char *)v4 + a3[13]) = *(uint64_t *)((char *)a2 + a3[13]);
    v16((char *)v4 + v23, (uint64_t)a2 + v23, v15);
    v16((char *)v4 + a3[15], (uint64_t)a2 + a3[15], v15);
    v24 = a3[16];
    v25 = (char *)v4 + v24;
    v26 = (uint64_t)a2 + v24;
    *((_BYTE *)v4 + v24) = *((_BYTE *)a2 + v24);
    v27 = (int *)type metadata accessor for Wind();
    v28 = v27[5];
    v29 = &v25[v28];
    v30 = v26 + v28;
    v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192950);
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 16))(v29, v30, v31);
    v32 = v27[6];
    v33 = &v25[v32];
    v34 = v26 + v32;
    v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192960);
    v36 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 16);
    v36(v33, v34, v35);
    v37 = v27[7];
    v38 = &v25[v37];
    v39 = (const void *)(v26 + v37);
    if (__swift_getEnumTagSinglePayload(v26 + v37, 1, v35))
    {
      v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192970);
      memcpy(v38, v39, *(_QWORD *)(*(_QWORD *)(v40 - 8) + 64));
    }
    else
    {
      v36(v38, (uint64_t)v39, v35);
      __swift_storeEnumTagSinglePayload((uint64_t)v38, 0, 1, v35);
    }
    v36((char *)v4 + a3[17], (uint64_t)a2 + a3[17], v35);
  }
  return v4;
}

uint64_t assignWithCopy for DayPartForecast(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);
  int *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int *v24;
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
  void *v35;
  const void *v36;
  int EnumTagSinglePayload;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t, uint64_t);
  uint64_t v41;
  void (*v42)(uint64_t, uint64_t, uint64_t);

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v6 = a3[7];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192880);
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 24);
  v10(v7, v8, v9);
  v10(a1 + a3[8], a2 + a3[8], v9);
  *(_BYTE *)(a1 + a3[9]) = *(_BYTE *)(a2 + a3[9]);
  v11 = a3[10];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192980);
  v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 24);
  v15(v12, v13, v14);
  v16 = (int *)type metadata accessor for PrecipitationAmountByType();
  v15(v12 + v16[5], v13 + v16[5], v14);
  v15(v12 + v16[6], v13 + v16[6], v14);
  v15(v12 + v16[7], v13 + v16[7], v14);
  v15(v12 + v16[8], v13 + v16[8], v14);
  v17 = v16[9];
  v18 = v12 + v17;
  v19 = v13 + v17;
  v15(v18, v19, v14);
  v20 = (int *)type metadata accessor for SnowfallAmount();
  v15(v18 + v20[5], v19 + v20[5], v14);
  v15(v18 + v20[6], v19 + v20[6], v14);
  v15(v18 + v20[7], v19 + v20[7], v14);
  v15(v18 + v20[8], v19 + v20[8], v14);
  v15(v18 + v20[9], v19 + v20[9], v14);
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  *(_QWORD *)(a1 + a3[12]) = *(_QWORD *)(a2 + a3[12]);
  *(_QWORD *)(a1 + a3[13]) = *(_QWORD *)(a2 + a3[13]);
  v15(a1 + a3[14], a2 + a3[14], v14);
  v15(a1 + a3[15], a2 + a3[15], v14);
  v21 = a3[16];
  v22 = a1 + v21;
  v23 = a2 + v21;
  *(_BYTE *)(a1 + v21) = *(_BYTE *)(a2 + v21);
  v24 = (int *)type metadata accessor for Wind();
  v25 = v24[5];
  v26 = v22 + v25;
  v27 = v23 + v25;
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192950);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 24))(v26, v27, v28);
  v29 = v24[6];
  v30 = v22 + v29;
  v31 = v23 + v29;
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192960);
  v33 = *(_QWORD *)(v32 - 8);
  v42 = *(void (**)(uint64_t, uint64_t, uint64_t))(v33 + 24);
  v42(v30, v31, v32);
  v34 = v24[7];
  v35 = (void *)(v22 + v34);
  v36 = (const void *)(v23 + v34);
  LODWORD(v31) = __swift_getEnumTagSinglePayload(v22 + v34, 1, v32);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v36, 1, v32);
  if (!(_DWORD)v31)
  {
    if (!EnumTagSinglePayload)
    {
      v41 = (uint64_t)v35;
      v39 = v42;
      v42(v41, (uint64_t)v36, v32);
      goto LABEL_8;
    }
    (*(void (**)(void *, uint64_t))(v33 + 8))(v35, v32);
    goto LABEL_6;
  }
  if (EnumTagSinglePayload)
  {
LABEL_6:
    v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192970);
    memcpy(v35, v36, *(_QWORD *)(*(_QWORD *)(v38 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(v33 + 16))(v35, v36, v32);
  __swift_storeEnumTagSinglePayload((uint64_t)v35, 0, 1, v32);
LABEL_7:
  v39 = v42;
LABEL_8:
  v39(a1 + a3[17], a2 + a3[17], v32);
  return a1;
}

uint64_t initializeWithTake for DayPartForecast(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);
  int *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const void *v33;
  uint64_t v34;
  void (*v35)(void *, const void *, uint64_t);
  uint64_t v36;
  void *v37;
  const void *v38;
  uint64_t v39;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v6 = a3[7];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192880);
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  v10(a1 + a3[8], a2 + a3[8], v9);
  v11 = a3[10];
  *(_BYTE *)(a1 + a3[9]) = *(_BYTE *)(a2 + a3[9]);
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192980);
  v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 32);
  v15(v12, v13, v14);
  v16 = (int *)type metadata accessor for PrecipitationAmountByType();
  v15(v12 + v16[5], v13 + v16[5], v14);
  v15(v12 + v16[6], v13 + v16[6], v14);
  v15(v12 + v16[7], v13 + v16[7], v14);
  v15(v12 + v16[8], v13 + v16[8], v14);
  v17 = v16[9];
  v18 = v12 + v17;
  v19 = v13 + v17;
  v15(v18, v19, v14);
  v20 = (int *)type metadata accessor for SnowfallAmount();
  v15(v18 + v20[5], v19 + v20[5], v14);
  v15(v18 + v20[6], v19 + v20[6], v14);
  v15(v18 + v20[7], v19 + v20[7], v14);
  v15(v18 + v20[8], v19 + v20[8], v14);
  v15(v18 + v20[9], v19 + v20[9], v14);
  v21 = a3[12];
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  *(_QWORD *)(a1 + v21) = *(_QWORD *)(a2 + v21);
  v22 = a3[14];
  *(_QWORD *)(a1 + a3[13]) = *(_QWORD *)(a2 + a3[13]);
  v15(a1 + v22, a2 + v22, v14);
  v15(a1 + a3[15], a2 + a3[15], v14);
  v23 = a3[16];
  v24 = a1 + v23;
  v25 = a2 + v23;
  *(_BYTE *)(a1 + v23) = *(_BYTE *)(a2 + v23);
  v26 = (int *)type metadata accessor for Wind();
  v27 = v26[5];
  v28 = v24 + v27;
  v29 = v25 + v27;
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192950);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 32))(v28, v29, v30);
  v31 = v26[6];
  v32 = (void *)(v24 + v31);
  v33 = (const void *)(v25 + v31);
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192960);
  v35 = *(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v34 - 8) + 32);
  v35(v32, v33, v34);
  v36 = v26[7];
  v37 = (void *)(v24 + v36);
  v38 = (const void *)(v25 + v36);
  if (__swift_getEnumTagSinglePayload(v25 + v36, 1, v34))
  {
    v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192970);
    memcpy(v37, v38, *(_QWORD *)(*(_QWORD *)(v39 - 8) + 64));
  }
  else
  {
    v35(v37, v38, v34);
    __swift_storeEnumTagSinglePayload((uint64_t)v37, 0, 1, v34);
  }
  v35((void *)(a1 + a3[17]), (const void *)(a2 + a3[17]), v34);
  return a1;
}

uint64_t assignWithTake for DayPartForecast(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t);
  int *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int *v27;
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
  void *v38;
  const void *v39;
  int EnumTagSinglePayload;
  uint64_t v41;
  void (*v42)(uint64_t, uint64_t, uint64_t);
  uint64_t v44;
  void (*v45)(uint64_t, uint64_t, uint64_t);

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v7 = a3[7];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192880);
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40);
  v11(v8, v9, v10);
  v11(a1 + a3[8], a2 + a3[8], v10);
  v12 = a3[10];
  *(_BYTE *)(a1 + a3[9]) = *(_BYTE *)(a2 + a3[9]);
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192980);
  v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 40);
  v16(v13, v14, v15);
  v17 = (int *)type metadata accessor for PrecipitationAmountByType();
  v16(v13 + v17[5], v14 + v17[5], v15);
  v16(v13 + v17[6], v14 + v17[6], v15);
  v16(v13 + v17[7], v14 + v17[7], v15);
  v16(v13 + v17[8], v14 + v17[8], v15);
  v18 = v17[9];
  v19 = v13 + v18;
  v20 = v14 + v18;
  v16(v19, v20, v15);
  v21 = (int *)type metadata accessor for SnowfallAmount();
  v16(v19 + v21[5], v20 + v21[5], v15);
  v16(v19 + v21[6], v20 + v21[6], v15);
  v16(v19 + v21[7], v20 + v21[7], v15);
  v16(v19 + v21[8], v20 + v21[8], v15);
  v16(v19 + v21[9], v20 + v21[9], v15);
  v22 = a3[12];
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  *(_QWORD *)(a1 + v22) = *(_QWORD *)(a2 + v22);
  v23 = a3[14];
  *(_QWORD *)(a1 + a3[13]) = *(_QWORD *)(a2 + a3[13]);
  v16(a1 + v23, a2 + v23, v15);
  v16(a1 + a3[15], a2 + a3[15], v15);
  v24 = a3[16];
  v25 = a1 + v24;
  v26 = a2 + v24;
  *(_BYTE *)(a1 + v24) = *(_BYTE *)(a2 + v24);
  v27 = (int *)type metadata accessor for Wind();
  v28 = v27[5];
  v29 = v25 + v28;
  v30 = v26 + v28;
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192950);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 40))(v29, v30, v31);
  v32 = v27[6];
  v33 = v25 + v32;
  v34 = v26 + v32;
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192960);
  v36 = *(_QWORD *)(v35 - 8);
  v45 = *(void (**)(uint64_t, uint64_t, uint64_t))(v36 + 40);
  v45(v33, v34, v35);
  v37 = v27[7];
  v38 = (void *)(v25 + v37);
  v39 = (const void *)(v26 + v37);
  LODWORD(v34) = __swift_getEnumTagSinglePayload(v25 + v37, 1, v35);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v39, 1, v35);
  if (!(_DWORD)v34)
  {
    if (!EnumTagSinglePayload)
    {
      v44 = (uint64_t)v38;
      v42 = v45;
      v45(v44, (uint64_t)v39, v35);
      goto LABEL_8;
    }
    (*(void (**)(void *, uint64_t))(v36 + 8))(v38, v35);
    goto LABEL_6;
  }
  if (EnumTagSinglePayload)
  {
LABEL_6:
    v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192970);
    memcpy(v38, v39, *(_QWORD *)(*(_QWORD *)(v41 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(v36 + 32))(v38, v39, v35);
  __swift_storeEnumTagSinglePayload((uint64_t)v38, 0, 1, v35);
LABEL_7:
  v42 = v45;
LABEL_8:
  v42(a1 + a3[17], a2 + a3[17], v35);
  return a1;
}

uint64_t sub_1A611CAE0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char v14;
  uint64_t v15;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192880);
  OUTLINED_FUNCTION_14_0();
  if (v12)
  {
    v7 = v6;
    v8 = a3[7];
    return __swift_getEnumTagSinglePayload(a1 + v8, a2, v7);
  }
  if ((_DWORD)a2 != 250)
  {
    type metadata accessor for PrecipitationAmountByType();
    OUTLINED_FUNCTION_14_0();
    if (v12)
    {
      v7 = v11;
      v8 = a3[10];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192980);
      OUTLINED_FUNCTION_14_0();
      if (v12)
      {
        v7 = v13;
        v8 = a3[14];
      }
      else
      {
        type metadata accessor for Wind();
        OUTLINED_FUNCTION_14_0();
        if (v14)
        {
          v7 = v15;
          v8 = a3[16];
        }
        else
        {
          v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192960);
          v8 = a3[17];
        }
      }
    }
    return __swift_getEnumTagSinglePayload(a1 + v8, a2, v7);
  }
  v9 = *(unsigned __int8 *)(a1 + a3[9]);
  if (v9 >= 6)
    return v9 - 5;
  else
    return 0;
}

void sub_1A611CBCC(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char v14;
  uint64_t v15;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192880);
  OUTLINED_FUNCTION_13();
  if (v12)
  {
    v9 = v8;
    v10 = a4[7];
  }
  else
  {
    if (a3 == 250)
    {
      *(_BYTE *)(a1 + a4[9]) = a2 + 5;
      return;
    }
    type metadata accessor for PrecipitationAmountByType();
    OUTLINED_FUNCTION_13();
    if (v12)
    {
      v9 = v11;
      v10 = a4[10];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192980);
      OUTLINED_FUNCTION_13();
      if (v12)
      {
        v9 = v13;
        v10 = a4[14];
      }
      else
      {
        type metadata accessor for Wind();
        OUTLINED_FUNCTION_13();
        if (v14)
        {
          v9 = v15;
          v10 = a4[16];
        }
        else
        {
          v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED192960);
          v10 = a4[17];
        }
      }
    }
  }
  __swift_storeEnumTagSinglePayload(a1 + v10, a2, a2, v9);
}

uint64_t storeEnumTagSinglePayload for DayPartForecast.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 13 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 13) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF3)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF2)
    return ((uint64_t (*)(void))((char *)&loc_1A611CD04 + 4 * byte_1A6140BF3[v4]))();
  *a1 = a2 + 13;
  return ((uint64_t (*)(void))((char *)sub_1A611CD38 + 4 * byte_1A6140BEE[v4]))();
}

uint64_t sub_1A611CD38(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A611CD40(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1A611CD48);
  return result;
}

uint64_t sub_1A611CD54(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1A611CD5CLL);
  *(_BYTE *)result = a2 + 13;
  return result;
}

uint64_t sub_1A611CD60(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A611CD68(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DayPartForecast.CodingKeys()
{
  return &type metadata for DayPartForecast.CodingKeys;
}

unint64_t sub_1A611CD88()
{
  unint64_t result;

  result = qword_1EE817B98;
  if (!qword_1EE817B98)
  {
    result = MEMORY[0x1A85BB36C](&unk_1A6140DCC, &type metadata for DayPartForecast.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE817B98);
  }
  return result;
}

unint64_t sub_1A611CDC8()
{
  unint64_t result;

  result = qword_1EE817BA0;
  if (!qword_1EE817BA0)
  {
    result = MEMORY[0x1A85BB36C](&unk_1A6140D3C, &type metadata for DayPartForecast.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE817BA0);
  }
  return result;
}

unint64_t sub_1A611CE08()
{
  unint64_t result;

  result = qword_1EE817BA8;
  if (!qword_1EE817BA8)
  {
    result = MEMORY[0x1A85BB36C](&unk_1A6140D64, &type metadata for DayPartForecast.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE817BA8);
  }
  return result;
}

double static Coordinate.mock()@<D0>(_OWORD *a1@<X8>)
{
  double result;

  if (qword_1EE812C78 != -1)
    swift_once();
  result = *(double *)&xmmword_1EE844FC0;
  *a1 = xmmword_1EE844FC0;
  return result;
}

double sub_1A611CE94()
{
  double result;

  result = 36.97;
  xmmword_1EE844FC0 = xmmword_1A6140E50;
  return result;
}

uint64_t WeatherAlert.init(detailsURL:source:expirationDate:issuedDate:onsetTime:endDate:summary:region:severity:importance:metadata:id:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, char *a13, char *a14, uint64_t a15, uint64_t a16)
{
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v34;
  char v38;
  char v39;
  uint64_t v42;

  v18 = OUTLINED_FUNCTION_6();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x1E0C80A78](v18);
  OUTLINED_FUNCTION_25_1(v20, a1);
  v38 = *a13;
  v39 = *a14;
  v21 = (int *)OUTLINED_FUNCTION_0_52();
  v22 = a9 + v21[9];
  OUTLINED_FUNCTION_57_0(v22);
  v23 = a9 + v21[10];
  OUTLINED_FUNCTION_57_0(v23);
  v24 = a9 + v21[13];
  v25 = OUTLINED_FUNCTION_267();
  OUTLINED_FUNCTION_20_23(v24);
  v26 = (_QWORD *)(a9 + v21[14]);
  *v26 = 0;
  v26[1] = 0;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 32))(a9, v34, v25);
  v27 = (_QWORD *)(a9 + v21[5]);
  *v27 = a2;
  v27[1] = a3;
  OUTLINED_FUNCTION_55_8(a9 + v21[7], a4);
  OUTLINED_FUNCTION_55_8(a9 + v21[8], a5);
  sub_1A5FBEFDC(a6, v22, &qword_1ED1929C8);
  sub_1A5FBEFDC(a7, v23, &qword_1ED1929C8);
  v28 = (_QWORD *)(a9 + v21[11]);
  *v28 = a8;
  v28[1] = a10;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *v26 = a11;
  v26[1] = a12;
  *(_BYTE *)(a9 + v21[15]) = v38;
  *(_BYTE *)(a9 + v21[16]) = v39;
  sub_1A5FBA570(a15, a9 + v21[17], (uint64_t (*)(_QWORD))type metadata accessor for WeatherMetadata);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v42, a15, v18);
  sub_1A5FA1740(a15, (uint64_t (*)(_QWORD))type metadata accessor for WeatherMetadata);
  OUTLINED_FUNCTION_55_8(a9 + v21[6], v42);
  v29 = (_QWORD *)(a9 + v21[12]);
  *v29 = a8;
  v29[1] = a10;
  sub_1A5FAFD58(v24, &qword_1ED1940B8);
  OUTLINED_FUNCTION_20_23(v24);
  v30 = a9 + v21[18];
  v31 = OUTLINED_FUNCTION_27_15();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 32))(v30, a16, v31);
}

void Array<A>.isExpired.getter(uint64_t a1)
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

  v2 = OUTLINED_FUNCTION_6();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  OUTLINED_FUNCTION_0();
  v6 = v5 - v4;
  v7 = OUTLINED_FUNCTION_0_52();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_0();
  v11 = v10 - v9;
  if (*(_QWORD *)(a1 + 16))
  {
    sub_1A5FBA570(a1 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80)), v11, (uint64_t (*)(_QWORD))type metadata accessor for WeatherAlert);
    sub_1A6121F4C();
    OUTLINED_FUNCTION_49();
    sub_1A5FAF484((unint64_t *)&qword_1ED191E98, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08B0]);
    sub_1A61237AC();
    OUTLINED_FUNCTION_149(v6, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
    sub_1A5FA1740(v11, (uint64_t (*)(_QWORD))type metadata accessor for WeatherAlert);
  }
  OUTLINED_FUNCTION_3_8();
}

uint64_t WeatherAlert.detailsURL.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_267();
  v0 = OUTLINED_FUNCTION_10();
  return OUTLINED_FUNCTION_30(v0, v1, v2, v3);
}

uint64_t WeatherAlert.detailsURL.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_267();
  v0 = OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_30(v0, v1, v2, v3);
}

uint64_t (*WeatherAlert.detailsURL.modify())()
{
  return GEOLocationCoordinate2DMake;
}

void WeatherAlert.source.getter()
{
  OUTLINED_FUNCTION_0_52();
  OUTLINED_FUNCTION_26_0();
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_51();
}

void WeatherAlert.source.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  OUTLINED_FUNCTION_0_52();
  OUTLINED_FUNCTION_31_0();
  *v2 = a1;
  v2[1] = a2;
  OUTLINED_FUNCTION_9();
}

double (*WeatherAlert.source.modify())(double, double)
{
  OUTLINED_FUNCTION_0_52();
  return GEOLocationCoordinate2DMake;
}

uint64_t WeatherAlert.date.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_0_52();
  OUTLINED_FUNCTION_6();
  v0 = OUTLINED_FUNCTION_10();
  return OUTLINED_FUNCTION_30(v0, v1, v2, v3);
}

uint64_t WeatherAlert.date.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_0_52();
  OUTLINED_FUNCTION_6();
  v0 = OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_30(v0, v1, v2, v3);
}

double (*WeatherAlert.date.modify())(double, double)
{
  OUTLINED_FUNCTION_0_52();
  return GEOLocationCoordinate2DMake;
}

uint64_t WeatherAlert.expirationDate.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_0_52();
  OUTLINED_FUNCTION_6();
  v0 = OUTLINED_FUNCTION_10();
  return OUTLINED_FUNCTION_30(v0, v1, v2, v3);
}

uint64_t WeatherAlert.expirationDate.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_0_52();
  OUTLINED_FUNCTION_6();
  v0 = OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_30(v0, v1, v2, v3);
}

double (*WeatherAlert.expirationDate.modify())(double, double)
{
  OUTLINED_FUNCTION_0_52();
  return GEOLocationCoordinate2DMake;
}

uint64_t WeatherAlert.issuedDate.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_0_52();
  OUTLINED_FUNCTION_6();
  v0 = OUTLINED_FUNCTION_10();
  return OUTLINED_FUNCTION_30(v0, v1, v2, v3);
}

uint64_t WeatherAlert.issuedDate.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_0_52();
  OUTLINED_FUNCTION_6();
  v0 = OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_30(v0, v1, v2, v3);
}

double (*WeatherAlert.issuedDate.modify())(double, double)
{
  OUTLINED_FUNCTION_0_52();
  return GEOLocationCoordinate2DMake;
}

void WeatherAlert.onsetTime.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = OUTLINED_FUNCTION_0_52();
  OUTLINED_FUNCTION_23_11(v0 + *(int *)(v1 + 36), v2, &qword_1ED1929C8);
  OUTLINED_FUNCTION_51();
}

void WeatherAlert.onsetTime.setter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_0_52();
  OUTLINED_FUNCTION_62_8(v1, v0 + *(int *)(v1 + 36), &qword_1ED1929C8);
  OUTLINED_FUNCTION_51();
}

double (*WeatherAlert.onsetTime.modify())(double, double)
{
  OUTLINED_FUNCTION_0_52();
  return GEOLocationCoordinate2DMake;
}

void WeatherAlert.endDate.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = OUTLINED_FUNCTION_0_52();
  OUTLINED_FUNCTION_23_11(v0 + *(int *)(v1 + 40), v2, &qword_1ED1929C8);
  OUTLINED_FUNCTION_51();
}

void WeatherAlert.endDate.setter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_0_52();
  OUTLINED_FUNCTION_62_8(v1, v0 + *(int *)(v1 + 40), &qword_1ED1929C8);
  OUTLINED_FUNCTION_51();
}

double (*WeatherAlert.endDate.modify())(double, double)
{
  OUTLINED_FUNCTION_0_52();
  return GEOLocationCoordinate2DMake;
}

void WeatherAlert.summary.getter()
{
  OUTLINED_FUNCTION_0_52();
  OUTLINED_FUNCTION_26_0();
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_51();
}

void WeatherAlert.summary.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  OUTLINED_FUNCTION_0_52();
  OUTLINED_FUNCTION_31_0();
  *v2 = a1;
  v2[1] = a2;
  OUTLINED_FUNCTION_9();
}

double (*WeatherAlert.summary.modify())(double, double)
{
  OUTLINED_FUNCTION_0_52();
  return GEOLocationCoordinate2DMake;
}

void WeatherAlert.description.getter()
{
  OUTLINED_FUNCTION_0_52();
  OUTLINED_FUNCTION_26_0();
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_51();
}

void WeatherAlert.description.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  OUTLINED_FUNCTION_0_52();
  OUTLINED_FUNCTION_31_0();
  *v2 = a1;
  v2[1] = a2;
  OUTLINED_FUNCTION_9();
}

double (*WeatherAlert.description.modify())(double, double)
{
  OUTLINED_FUNCTION_0_52();
  return GEOLocationCoordinate2DMake;
}

void WeatherAlert.details.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = OUTLINED_FUNCTION_0_52();
  OUTLINED_FUNCTION_23_11(v0 + *(int *)(v1 + 52), v2, &qword_1ED1940B8);
  OUTLINED_FUNCTION_51();
}

void WeatherAlert.details.setter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_0_52();
  OUTLINED_FUNCTION_62_8(v1, v0 + *(int *)(v1 + 52), &qword_1ED1940B8);
  OUTLINED_FUNCTION_51();
}

double (*WeatherAlert.details.modify())(double, double)
{
  OUTLINED_FUNCTION_0_52();
  return GEOLocationCoordinate2DMake;
}

void WeatherAlert.region.getter()
{
  OUTLINED_FUNCTION_0_52();
  OUTLINED_FUNCTION_26_0();
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_51();
}

void WeatherAlert.region.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  OUTLINED_FUNCTION_0_52();
  OUTLINED_FUNCTION_31_0();
  *v2 = a1;
  v2[1] = a2;
  OUTLINED_FUNCTION_9();
}

double (*WeatherAlert.region.modify())(double, double)
{
  OUTLINED_FUNCTION_0_52();
  return GEOLocationCoordinate2DMake;
}

void WeatherAlert.severity.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + *(int *)(OUTLINED_FUNCTION_0_52() + 60));
  OUTLINED_FUNCTION_51();
}

void WeatherAlert.severity.setter(char *a1)
{
  uint64_t v1;
  char v2;

  v2 = *a1;
  *(_BYTE *)(v1 + *(int *)(OUTLINED_FUNCTION_0_52() + 60)) = v2;
  OUTLINED_FUNCTION_51();
}

double (*WeatherAlert.severity.modify())(double, double)
{
  OUTLINED_FUNCTION_0_52();
  return GEOLocationCoordinate2DMake;
}

void WeatherAlert.importance.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + *(int *)(OUTLINED_FUNCTION_0_52() + 64));
  OUTLINED_FUNCTION_51();
}

void WeatherAlert.importance.setter(char *a1)
{
  uint64_t v1;
  char v2;

  v2 = *a1;
  *(_BYTE *)(v1 + *(int *)(OUTLINED_FUNCTION_0_52() + 64)) = v2;
  OUTLINED_FUNCTION_51();
}

double (*WeatherAlert.importance.modify())(double, double)
{
  OUTLINED_FUNCTION_0_52();
  return GEOLocationCoordinate2DMake;
}

void WeatherAlert.metadata.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_0_52();
  sub_1A5FBA570(v1 + *(int *)(v3 + 68), a1, (uint64_t (*)(_QWORD))type metadata accessor for WeatherMetadata);
  OUTLINED_FUNCTION_51();
}

uint64_t WeatherAlert.metadata.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(OUTLINED_FUNCTION_0_52() + 68);
  return sub_1A5FF2038(a1, v3);
}

double (*WeatherAlert.metadata.modify())(double, double)
{
  OUTLINED_FUNCTION_0_52();
  return GEOLocationCoordinate2DMake;
}

uint64_t WeatherAlert.id.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_0_52();
  OUTLINED_FUNCTION_27_15();
  v0 = OUTLINED_FUNCTION_10();
  return OUTLINED_FUNCTION_30(v0, v1, v2, v3);
}

uint64_t WeatherAlert.id.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_0_52();
  OUTLINED_FUNCTION_27_15();
  v0 = OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_30(v0, v1, v2, v3);
}

double (*WeatherAlert.id.modify())(double, double)
{
  OUTLINED_FUNCTION_0_52();
  return GEOLocationCoordinate2DMake;
}

uint64_t WeatherAlert.init(detailsURL:source:date:expirationDate:issuedDate:onsetTime:endDate:summary:description:details:region:severity:importance:metadata:id:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char *a17, char *a18, uint64_t a19, uint64_t a20)
{
  int *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  char v41;
  char v42;

  v42 = *a17;
  v41 = *a18;
  v23 = (int *)OUTLINED_FUNCTION_0_52();
  v24 = a9 + v23[9];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7_0(v24);
  v25 = a9 + v23[10];
  OUTLINED_FUNCTION_7_0(v25);
  v26 = a9 + v23[13];
  v27 = OUTLINED_FUNCTION_267();
  OUTLINED_FUNCTION_20_23(v26);
  v28 = (_QWORD *)(a9 + v23[14]);
  *v28 = 0;
  v28[1] = 0;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 32))(a9, a1, v27);
  v29 = (_QWORD *)(a9 + v23[5]);
  *v29 = a2;
  v29[1] = a3;
  OUTLINED_FUNCTION_52_7(a9 + v23[6], a4);
  OUTLINED_FUNCTION_52_7(a9 + v23[7], a5);
  OUTLINED_FUNCTION_52_7(a9 + v23[8], a6);
  sub_1A5FBEFDC(a7, v24, &qword_1ED1929C8);
  sub_1A5FBEFDC(a8, v25, &qword_1ED1929C8);
  v30 = (_QWORD *)(a9 + v23[12]);
  *v30 = a12;
  v30[1] = a13;
  sub_1A5FBEFDC(a14, v26, &qword_1ED1940B8);
  swift_bridgeObjectRelease();
  *v28 = a15;
  v28[1] = a16;
  *(_BYTE *)(a9 + v23[16]) = v41;
  *(_BYTE *)(a9 + v23[15]) = v42;
  v31 = (_QWORD *)(a9 + v23[11]);
  *v31 = a10;
  v31[1] = a11;
  sub_1A5FA7D50(a19, a9 + v23[17]);
  v32 = a9 + v23[18];
  v33 = OUTLINED_FUNCTION_27_15();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 32))(v32, a20, v33);
}

uint64_t sub_1A611DB4C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  BOOL v12;
  BOOL v13;
  BOOL v14;
  BOOL v15;
  BOOL v16;
  BOOL v17;
  BOOL v18;
  char v20;

  v2 = a1 == 0x55736C6961746564 && a2 == 0xEA00000000004C52;
  if (v2 || (sub_1A6123CF8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x656372756F73 && a2 == 0xE600000000000000;
    if (v6 || (sub_1A6123CF8() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 1702125924 && a2 == 0xE400000000000000;
      if (v7 || (sub_1A6123CF8() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        v8 = a1 == 0x6974617269707865 && a2 == 0xEE00657461446E6FLL;
        if (v8 || (sub_1A6123CF8() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          v9 = a1 == 0x6144646575737369 && a2 == 0xEA00000000006574;
          if (v9 || (sub_1A6123CF8() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else
          {
            v10 = a1 == 0x6D69547465736E6FLL && a2 == 0xE900000000000065;
            if (v10 || (sub_1A6123CF8() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 5;
            }
            else
            {
              v11 = a1 == 0x65746144646E65 && a2 == 0xE700000000000000;
              if (v11 || (sub_1A6123CF8() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 6;
              }
              else
              {
                v12 = a1 == 0x7972616D6D7573 && a2 == 0xE700000000000000;
                if (v12 || (sub_1A6123CF8() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 7;
                }
                else
                {
                  v13 = a1 == 0x7470697263736564 && a2 == 0xEB000000006E6F69;
                  if (v13 || (sub_1A6123CF8() & 1) != 0)
                  {
                    swift_bridgeObjectRelease();
                    return 8;
                  }
                  else
                  {
                    v14 = a1 == 0x736C6961746564 && a2 == 0xE700000000000000;
                    if (v14 || (sub_1A6123CF8() & 1) != 0)
                    {
                      swift_bridgeObjectRelease();
                      return 9;
                    }
                    else
                    {
                      v15 = a1 == 0x6E6F69676572 && a2 == 0xE600000000000000;
                      if (v15 || (sub_1A6123CF8() & 1) != 0)
                      {
                        swift_bridgeObjectRelease();
                        return 10;
                      }
                      else
                      {
                        v16 = a1 == 0x7974697265766573 && a2 == 0xE800000000000000;
                        if (v16 || (sub_1A6123CF8() & 1) != 0)
                        {
                          swift_bridgeObjectRelease();
                          return 11;
                        }
                        else
                        {
                          v17 = a1 == 0x6E6174726F706D69 && a2 == 0xEA00000000006563;
                          if (v17 || (sub_1A6123CF8() & 1) != 0)
                          {
                            swift_bridgeObjectRelease();
                            return 12;
                          }
                          else
                          {
                            v18 = a1 == 0x617461646174656DLL && a2 == 0xE800000000000000;
                            if (v18 || (sub_1A6123CF8() & 1) != 0)
                            {
                              swift_bridgeObjectRelease();
                              return 13;
                            }
                            else if (a1 == 25705 && a2 == 0xE200000000000000)
                            {
                              swift_bridgeObjectRelease();
                              return 14;
                            }
                            else
                            {
                              v20 = sub_1A6123CF8();
                              swift_bridgeObjectRelease();
                              if ((v20 & 1) != 0)
                                return 14;
                              else
                                return 15;
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_1A611E144(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1A611E17C + 4 * byte_1A6140E60[a1]))(0x55736C6961746564, 0xEA00000000004C52);
}

uint64_t sub_1A611E17C()
{
  return 0x656372756F73;
}

uint64_t sub_1A611E190()
{
  return 1702125924;
}

uint64_t sub_1A611E1A0()
{
  return 0x6974617269707865;
}

uint64_t sub_1A611E1C4()
{
  return 0x6144646575737369;
}

uint64_t sub_1A611E1E4()
{
  return 0x6D69547465736E6FLL;
}

uint64_t sub_1A611E200()
{
  return 0x65746144646E65;
}

uint64_t sub_1A611E218()
{
  return 0x7972616D6D7573;
}

uint64_t sub_1A611E230()
{
  return 0x7470697263736564;
}

uint64_t sub_1A611E250()
{
  return 0x736C6961746564;
}

uint64_t sub_1A611E268()
{
  return 0x6E6F69676572;
}

uint64_t sub_1A611E27C()
{
  return 0x7974697265766573;
}

uint64_t sub_1A611E294()
{
  return 0x6E6174726F706D69;
}

uint64_t sub_1A611E2B0()
{
  return 0x617461646174656DLL;
}

uint64_t sub_1A611E2C8()
{
  return 25705;
}

uint64_t sub_1A611E2D4()
{
  unsigned __int8 *v0;

  return sub_1A611E144(*v0);
}

uint64_t sub_1A611E2DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1A611DB4C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A611E300()
{
  sub_1A611F9A0();
  return sub_1A6123DE8();
}

uint64_t sub_1A611E328()
{
  sub_1A611F9A0();
  return sub_1A6123DF4();
}

uint64_t static WeatherAlert.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
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
  uint64_t v18;
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
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  BOOL v45;
  char v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void (*v58)(uint64_t, uint64_t);
  uint64_t v59;
  int *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char v64;
  uint64_t v66;
  uint64_t v67;
  char v68;
  void (*v69)(uint64_t, uint64_t);
  uint64_t v70;
  int *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  _QWORD *v76;
  char v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  _QWORD *v82;
  char v84;
  uint64_t v85;
  uint64_t v86;
  int *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char v95;
  void (*v96)(uint64_t, uint64_t);
  uint64_t v97;
  int *v98;
  uint64_t v99;
  _QWORD *v100;
  uint64_t v101;
  uint64_t v102;
  _QWORD *v103;
  uint64_t v104;
  BOOL v105;
  char v106;
  uint64_t v107;
  int *v108;
  char v109;
  char v110;
  uint64_t v111;
  int v112;
  int *v113;
  uint64_t v114;
  uint64_t v115;
  char *v116;
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
  uint64_t v127;
  uint64_t v128;

  v123 = OUTLINED_FUNCTION_267();
  v118 = *(_QWORD *)(v123 - 8);
  OUTLINED_FUNCTION_41();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_11_0();
  v117 = v6;
  v120 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED190B70);
  OUTLINED_FUNCTION_2();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_25_1(v8, v111);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1940B8);
  OUTLINED_FUNCTION_2();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_151();
  v119 = v10;
  OUTLINED_FUNCTION_3_5();
  v12 = MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v111 - v13;
  MEMORY[0x1E0C80A78](v12);
  v121 = (uint64_t)&v111 - v15;
  v16 = OUTLINED_FUNCTION_6();
  v127 = *(_QWORD *)(v16 - 8);
  v128 = v16;
  OUTLINED_FUNCTION_41();
  MEMORY[0x1E0C80A78](v17);
  OUTLINED_FUNCTION_11_0();
  v125 = v18;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED191C98);
  OUTLINED_FUNCTION_2();
  MEMORY[0x1E0C80A78](v20);
  OUTLINED_FUNCTION_151();
  v126 = v21;
  OUTLINED_FUNCTION_3_5();
  MEMORY[0x1E0C80A78](v22);
  v24 = (char *)&v111 - v23;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1929C8);
  OUTLINED_FUNCTION_2();
  MEMORY[0x1E0C80A78](v25);
  OUTLINED_FUNCTION_151();
  v124 = v26;
  OUTLINED_FUNCTION_3_5();
  v28 = MEMORY[0x1E0C80A78](v27);
  v30 = (char *)&v111 - v29;
  v31 = MEMORY[0x1E0C80A78](v28);
  v33 = (char *)&v111 - v32;
  MEMORY[0x1E0C80A78](v31);
  OUTLINED_FUNCTION_325();
  v35 = MEMORY[0x1E0C80A78](v34);
  v37 = (char *)&v111 - v36;
  MEMORY[0x1E0C80A78](v35);
  v39 = (char *)&v111 - v38;
  if ((MEMORY[0x1A85B8F78](a1, a2) & 1) == 0)
    goto LABEL_29;
  v116 = v14;
  v40 = OUTLINED_FUNCTION_0_52();
  v41 = *(int *)(v40 + 20);
  v42 = *(_QWORD *)(a1 + v41);
  v43 = *(_QWORD *)(a1 + v41 + 8);
  v44 = (_QWORD *)(a2 + v41);
  v45 = v42 == *v44 && v43 == v44[1];
  if (!v45)
  {
    OUTLINED_FUNCTION_3();
    v46 = OUTLINED_FUNCTION_24_17();
    if ((v47 & 1) == 0)
      return v46 & 1;
  }
  if ((OUTLINED_FUNCTION_36_17() & 1) == 0
    || (OUTLINED_FUNCTION_36_17() & 1) == 0
    || (OUTLINED_FUNCTION_36_17() & 1) == 0)
  {
    goto LABEL_29;
  }
  v48 = *(int *)(v40 + 36);
  v114 = a1;
  sub_1A5FB14D4(a1 + v48, (uint64_t)v39, &qword_1ED1929C8);
  v113 = (int *)v40;
  v49 = *(int *)(v40 + 36);
  v115 = a2;
  sub_1A5FB14D4(a2 + v49, (uint64_t)v37, &qword_1ED1929C8);
  v50 = (uint64_t)&v24[*(int *)(v19 + 48)];
  OUTLINED_FUNCTION_39_13((uint64_t)v39, (uint64_t)v24);
  OUTLINED_FUNCTION_39_13((uint64_t)v37, v50);
  v51 = v128;
  if (__swift_getEnumTagSinglePayload((uint64_t)v24, 1, v128) == 1)
  {
    OUTLINED_FUNCTION_40_0((uint64_t)v37);
    OUTLINED_FUNCTION_40_0((uint64_t)v39);
    OUTLINED_FUNCTION_2_17(v50);
    if (!v45)
      goto LABEL_17;
    sub_1A5FAFD58((uint64_t)v24, &qword_1ED1929C8);
  }
  else
  {
    OUTLINED_FUNCTION_23_11((uint64_t)v24, v52, &qword_1ED1929C8);
    OUTLINED_FUNCTION_2_17(v50);
    if (v45)
    {
      OUTLINED_FUNCTION_33_3((uint64_t)v37);
      OUTLINED_FUNCTION_33_3((uint64_t)v39);
      OUTLINED_FUNCTION_149(v2, *(uint64_t (**)(uint64_t, uint64_t))(v127 + 8));
LABEL_17:
      v53 = &qword_1ED191C98;
      v54 = (uint64_t)v24;
LABEL_28:
      sub_1A5FAFD58(v54, v53);
LABEL_29:
      v46 = 0;
      return v46 & 1;
    }
    v55 = v127;
    v56 = v50;
    v57 = v125;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v127 + 32))(v125, v56, v51);
    sub_1A5FAF484(&qword_1ED191CA8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08B8]);
    v112 = OUTLINED_FUNCTION_61_6();
    v58 = *(void (**)(uint64_t, uint64_t))(v55 + 8);
    v58(v57, v51);
    OUTLINED_FUNCTION_33_3((uint64_t)v37);
    OUTLINED_FUNCTION_33_3((uint64_t)v39);
    v59 = OUTLINED_FUNCTION_31();
    ((void (*)(uint64_t))v58)(v59);
    OUTLINED_FUNCTION_33_3((uint64_t)v24);
    if ((v112 & 1) == 0)
      goto LABEL_29;
  }
  v60 = v113;
  OUTLINED_FUNCTION_51_11(v114 + v113[10], (uint64_t)v33);
  OUTLINED_FUNCTION_51_11(v115 + v60[10], (uint64_t)v30);
  v61 = v126;
  v62 = v126 + *(int *)(v19 + 48);
  OUTLINED_FUNCTION_51_11((uint64_t)v33, v126);
  OUTLINED_FUNCTION_51_11((uint64_t)v30, v62);
  OUTLINED_FUNCTION_2_17(v61);
  if (v45)
  {
    OUTLINED_FUNCTION_77((uint64_t)v30);
    OUTLINED_FUNCTION_77((uint64_t)v33);
    OUTLINED_FUNCTION_2_17(v62);
    if (v45)
    {
      sub_1A5FAFD58(v61, &qword_1ED1929C8);
      goto LABEL_32;
    }
LABEL_27:
    v53 = &qword_1ED191C98;
    v54 = v61;
    goto LABEL_28;
  }
  v63 = v124;
  sub_1A5FB14D4(v61, v124, &qword_1ED1929C8);
  OUTLINED_FUNCTION_2_17(v62);
  if (v64)
  {
    OUTLINED_FUNCTION_40_0((uint64_t)v30);
    OUTLINED_FUNCTION_40_0((uint64_t)v33);
    OUTLINED_FUNCTION_149(v63, *(uint64_t (**)(uint64_t, uint64_t))(v127 + 8));
    goto LABEL_27;
  }
  v66 = v127;
  v67 = v125;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v127 + 32))(v125, v62, v51);
  sub_1A5FAF484(&qword_1ED191CA8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08B8]);
  v68 = OUTLINED_FUNCTION_61_6();
  v69 = *(void (**)(uint64_t, uint64_t))(v66 + 8);
  v69(v67, v51);
  OUTLINED_FUNCTION_77((uint64_t)v30);
  OUTLINED_FUNCTION_77((uint64_t)v33);
  v69(v63, v51);
  OUTLINED_FUNCTION_77(v61);
  if ((v68 & 1) == 0)
    goto LABEL_29;
LABEL_32:
  v71 = v113;
  v70 = v114;
  v72 = v113[11];
  v73 = *(_QWORD *)(v114 + v72);
  v74 = *(_QWORD *)(v114 + v72 + 8);
  v75 = v115;
  v76 = (_QWORD *)(v115 + v72);
  if (v73 != *v76 || v74 != v76[1])
  {
    OUTLINED_FUNCTION_3();
    v46 = OUTLINED_FUNCTION_24_17();
    if ((v78 & 1) == 0)
      return v46 & 1;
  }
  v79 = v71[12];
  v80 = *(_QWORD *)(v70 + v79);
  v81 = *(_QWORD *)(v70 + v79 + 8);
  v82 = (_QWORD *)(v75 + v79);
  if (v80 != *v82 || v81 != v82[1])
  {
    OUTLINED_FUNCTION_3();
    v46 = OUTLINED_FUNCTION_24_17();
    if ((v84 & 1) == 0)
      return v46 & 1;
  }
  v85 = v121;
  v86 = v75;
  v87 = v71;
  sub_1A5FB14D4(v70 + v71[13], v121, &qword_1ED1940B8);
  v88 = (uint64_t)v116;
  OUTLINED_FUNCTION_39_13(v86 + v87[13], (uint64_t)v116);
  v89 = v122;
  v90 = v122 + *(int *)(v120 + 48);
  OUTLINED_FUNCTION_39_13(v85, v122);
  OUTLINED_FUNCTION_39_13(v88, v90);
  v91 = v123;
  if (__swift_getEnumTagSinglePayload(v89, 1, v123) != 1)
  {
    v92 = v119;
    sub_1A5FB14D4(v89, v119, &qword_1ED1940B8);
    if (__swift_getEnumTagSinglePayload(v90, 1, v91) != 1)
    {
      v94 = v117;
      v93 = v118;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v118 + 32))(v117, v90, v91);
      sub_1A5FAF484(&qword_1ED190B68, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0028]);
      v95 = sub_1A61237B8();
      v96 = *(void (**)(uint64_t, uint64_t))(v93 + 8);
      v96(v94, v91);
      OUTLINED_FUNCTION_18_0(v88);
      OUTLINED_FUNCTION_18_0(v85);
      v96(v92, v91);
      OUTLINED_FUNCTION_18_0(v89);
      if ((v95 & 1) == 0)
        goto LABEL_29;
      goto LABEL_49;
    }
    OUTLINED_FUNCTION_40_0(v88);
    OUTLINED_FUNCTION_40_0(v85);
    (*(void (**)(uint64_t, uint64_t))(v118 + 8))(v92, v91);
LABEL_47:
    v53 = &qword_1ED190B70;
    v54 = v89;
    goto LABEL_28;
  }
  OUTLINED_FUNCTION_18_0(v88);
  OUTLINED_FUNCTION_18_0(v85);
  if (__swift_getEnumTagSinglePayload(v90, 1, v91) != 1)
    goto LABEL_47;
  sub_1A5FAFD58(v89, &qword_1ED1940B8);
LABEL_49:
  v98 = v113;
  v97 = v114;
  v99 = v113[14];
  v100 = (_QWORD *)(v114 + v99);
  v101 = *(_QWORD *)(v114 + v99 + 8);
  v102 = v115;
  v103 = (_QWORD *)(v115 + v99);
  v104 = v103[1];
  if (!v101)
  {
    if (v104)
      goto LABEL_29;
    goto LABEL_58;
  }
  if (!v104)
    goto LABEL_29;
  v105 = *v100 == *v103 && v101 == v104;
  if (v105 || (OUTLINED_FUNCTION_3(), v102 = v115, v46 = OUTLINED_FUNCTION_24_17(), (v106 & 1) != 0))
  {
LABEL_58:
    v107 = v97;
    v108 = v98;
    if ((sub_1A5FCF65C(*(unsigned __int8 *)(v97 + v98[15]), *(unsigned __int8 *)(v102 + v98[15])) & 1) != 0)
    {
      sub_1A5FCF660(*(_BYTE *)(v107 + v108[16]), *(_BYTE *)(v102 + v108[16]));
      if ((v109 & 1) != 0)
      {
        static WeatherMetadata.== infix(_:_:)(v107 + v108[17], v102 + v108[17]);
        if ((v110 & 1) != 0)
        {
          v46 = sub_1A6121F70();
          return v46 & 1;
        }
      }
    }
    goto LABEL_29;
  }
  return v46 & 1;
}

void WeatherAlert.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE817BB0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_12();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A611F9A0();
  sub_1A6123DD0();
  sub_1A6121DF0();
  sub_1A5FAF484(&qword_1ED191690, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0010]);
  OUTLINED_FUNCTION_13_0();
  if (!v1)
  {
    v6 = (int *)type metadata accessor for WeatherAlert();
    OUTLINED_FUNCTION_16_32(v6[5]);
    OUTLINED_FUNCTION_12_36(1);
    sub_1A6121F58();
    sub_1A5FAF484(&qword_1ED191698, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB0890]);
    OUTLINED_FUNCTION_26_22();
    OUTLINED_FUNCTION_13_0();
    OUTLINED_FUNCTION_13_0();
    OUTLINED_FUNCTION_13_0();
    OUTLINED_FUNCTION_23_27(5);
    OUTLINED_FUNCTION_23_27(6);
    OUTLINED_FUNCTION_16_32(v6[11]);
    OUTLINED_FUNCTION_12_36(7);
    OUTLINED_FUNCTION_16_32(v6[12]);
    OUTLINED_FUNCTION_12_36(8);
    sub_1A6123C80();
    OUTLINED_FUNCTION_16_32(v6[14]);
    sub_1A6123C74();
    sub_1A611F9DC();
    OUTLINED_FUNCTION_13_0();
    sub_1A611FA18();
    OUTLINED_FUNCTION_13_0();
    type metadata accessor for WeatherMetadata();
    sub_1A5FAF484(&qword_1ED191718, (uint64_t (*)(uint64_t))type metadata accessor for WeatherMetadata, (uint64_t)&protocol conformance descriptor for WeatherMetadata);
    OUTLINED_FUNCTION_26_22();
    OUTLINED_FUNCTION_13_0();
    sub_1A6121F88();
    sub_1A5FAF484(&qword_1EE812D38, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09B8]);
    OUTLINED_FUNCTION_26_22();
    OUTLINED_FUNCTION_13_0();
  }
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);
  OUTLINED_FUNCTION_20();
}

void WeatherAlert.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
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
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unsigned int v40;
  uint64_t v41;
  int *v42;
  uint64_t v43;
  uint64_t v44;
  int *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t (*v67)(_QWORD);
  _QWORD v68[2];
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  _QWORD *v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t v87;
  int *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char v94;
  char v95;
  uint64_t v96;

  v70 = a2;
  v72 = sub_1A6121F88();
  v69 = *(_QWORD *)(v72 - 8);
  OUTLINED_FUNCTION_41();
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_11_0();
  v71 = v5;
  v73 = type metadata accessor for WeatherMetadata();
  OUTLINED_FUNCTION_2();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_11_0();
  v74 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1940B8);
  OUTLINED_FUNCTION_2();
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_11_0();
  v75 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1929C8);
  OUTLINED_FUNCTION_2();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_151();
  v76 = v11;
  OUTLINED_FUNCTION_3_5();
  MEMORY[0x1E0C80A78](v12);
  v77 = (char *)v68 - v13;
  v14 = sub_1A6121F58();
  v92 = *(_QWORD *)(v14 - 8);
  OUTLINED_FUNCTION_41();
  MEMORY[0x1E0C80A78](v15);
  OUTLINED_FUNCTION_151();
  v78 = v16;
  OUTLINED_FUNCTION_3_5();
  MEMORY[0x1E0C80A78](v17);
  OUTLINED_FUNCTION_325();
  MEMORY[0x1E0C80A78](v18);
  v20 = (char *)v68 - v19;
  v21 = sub_1A6121DF0();
  v83 = *(_QWORD *)(v21 - 8);
  OUTLINED_FUNCTION_41();
  MEMORY[0x1E0C80A78](v22);
  OUTLINED_FUNCTION_11_0();
  v79 = v23;
  v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE817BD0);
  v24 = *(_QWORD *)(v80 - 8);
  MEMORY[0x1E0C80A78](v80);
  OUTLINED_FUNCTION_0();
  v27 = v26 - v25;
  v28 = (int *)type metadata accessor for WeatherAlert();
  OUTLINED_FUNCTION_2();
  MEMORY[0x1E0C80A78](v29);
  OUTLINED_FUNCTION_0();
  v32 = v31 - v30;
  v91 = v31 - v30 + *(int *)(v33 + 36);
  __swift_storeEnumTagSinglePayload(v91, 1, 1, v14);
  v90 = v32 + v28[10];
  v93 = v14;
  __swift_storeEnumTagSinglePayload(v90, 1, 1, v14);
  v86 = v32 + v28[13];
  __swift_storeEnumTagSinglePayload(v86, 1, 1, v21);
  v87 = v32;
  v88 = v28;
  v34 = (uint64_t *)(v32 + v28[14]);
  *v34 = 0;
  v34[1] = 0;
  v84 = a1;
  v85 = v34;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A611F9A0();
  v82 = v27;
  v35 = v89;
  sub_1A6123DC4();
  v81 = v21;
  if (v35)
  {
    v89 = v35;
    v40 = 1632;
  }
  else
  {
    v36 = v2;
    v68[1] = v24;
    v95 = 0;
    sub_1A5FAF484(&qword_1EE813A18, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0038]);
    v38 = v37;
    v39 = v79;
    sub_1A6123C44();
    v68[0] = v38;
    v43 = v87;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v83 + 32))(v87, v39, v21);
    OUTLINED_FUNCTION_56_8(1);
    v44 = sub_1A6123C08();
    v45 = v88;
    v46 = (uint64_t *)(v43 + v88[5]);
    *v46 = v44;
    v46[1] = v47;
    v95 = 2;
    sub_1A5FAF484(&qword_1EE812DF0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08C0]);
    v89 = v48;
    sub_1A6123C44();
    OUTLINED_FUNCTION_53_12(v43 + v45[6], (uint64_t)v20);
    OUTLINED_FUNCTION_48_10(3);
    sub_1A6123C44();
    OUTLINED_FUNCTION_53_12(v43 + v45[7], v36);
    OUTLINED_FUNCTION_48_10(4);
    v49 = v78;
    OUTLINED_FUNCTION_30_18();
    sub_1A6123C44();
    OUTLINED_FUNCTION_53_12(v43 + v45[8], v49);
    OUTLINED_FUNCTION_48_10(5);
    v50 = (uint64_t)v77;
    OUTLINED_FUNCTION_30_18();
    sub_1A6123BFC();
    sub_1A5FBEFDC(v50, v91, &qword_1ED1929C8);
    OUTLINED_FUNCTION_48_10(6);
    v51 = v76;
    sub_1A6123BFC();
    sub_1A5FBEFDC(v51, v90, &qword_1ED1929C8);
    OUTLINED_FUNCTION_56_8(7);
    v52 = sub_1A6123C08();
    v53 = (uint64_t *)(v43 + v45[11]);
    *v53 = v52;
    v53[1] = v54;
    OUTLINED_FUNCTION_56_8(8);
    v55 = sub_1A6123C08();
    v89 = 0;
    v57 = (uint64_t *)(v43 + v45[12]);
    *v57 = v55;
    v57[1] = v56;
    OUTLINED_FUNCTION_48_10(9);
    v58 = v89;
    sub_1A6123BFC();
    v89 = v58;
    if (!v58)
    {
      sub_1A5FBEFDC(v75, v86, &qword_1ED1940B8);
      OUTLINED_FUNCTION_56_8(10);
      v59 = v89;
      v60 = sub_1A6123BF0();
      v89 = v59;
      if (!v59)
      {
        v62 = v60;
        v63 = v61;
        v64 = v85;
        swift_bridgeObjectRelease();
        *v64 = v62;
        v64[1] = v63;
        v94 = 11;
        sub_1A611FA54();
        OUTLINED_FUNCTION_9_39();
        v89 = 0;
        *(_BYTE *)(v87 + v88[15]) = v95;
        v94 = 12;
        sub_1A611FA90();
        OUTLINED_FUNCTION_9_39();
        v89 = 0;
        *(_BYTE *)(v87 + v88[16]) = v95;
        v95 = 13;
        sub_1A5FAF484(&qword_1EE813300, (uint64_t (*)(uint64_t))type metadata accessor for WeatherMetadata, (uint64_t)&protocol conformance descriptor for WeatherMetadata);
        OUTLINED_FUNCTION_9_39();
        v89 = 0;
        sub_1A5FA7D50(v74, v87 + v88[17]);
        v95 = 14;
        sub_1A5FAF484(&qword_1EE812D60, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09E0]);
        OUTLINED_FUNCTION_9_39();
        v89 = 0;
        OUTLINED_FUNCTION_2_57((uint64_t)&v96);
        v65 = v87;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v69 + 32))(v87 + v88[18], v71, v72);
        sub_1A5FBA570(v65, v70, (uint64_t (*)(_QWORD))type metadata accessor for WeatherAlert);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v84);
        v66 = OUTLINED_FUNCTION_31();
        sub_1A5FA1740(v66, v67);
        goto LABEL_21;
      }
    }
    OUTLINED_FUNCTION_2_57((uint64_t)&v96);
    v40 = 2047;
  }
  v41 = v87;
  v42 = v88;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v84);
  if ((v40 & 1) != 0)
  {
    (*(void (**)(uint64_t, uint64_t))(v83 + 8))(v41, v81);
    if (((v40 >> 1) & 1) == 0)
    {
LABEL_6:
      if (((v40 >> 2) & 1) != 0)
        goto LABEL_7;
LABEL_11:
      if (((v40 >> 3) & 1) == 0)
        goto LABEL_14;
LABEL_12:
      OUTLINED_FUNCTION_115(v41 + v42[7]);
      if (((v40 >> 4) & 1) == 0)
        goto LABEL_16;
      goto LABEL_15;
    }
  }
  else if ((v40 & 2) == 0)
  {
    goto LABEL_6;
  }
  OUTLINED_FUNCTION_33_13();
  if (((v40 >> 2) & 1) == 0)
    goto LABEL_11;
LABEL_7:
  OUTLINED_FUNCTION_115(v41 + v42[6]);
  if (((v40 >> 3) & 1) != 0)
    goto LABEL_12;
LABEL_14:
  if (((v40 >> 4) & 1) != 0)
LABEL_15:
    OUTLINED_FUNCTION_115(v41 + v42[8]);
LABEL_16:
  sub_1A5FAFD58(v91, &qword_1ED1929C8);
  sub_1A5FAFD58(v90, &qword_1ED1929C8);
  if (((v40 >> 7) & 1) != 0)
    OUTLINED_FUNCTION_33_13();
  if (((v40 >> 8) & 1) != 0)
    OUTLINED_FUNCTION_33_13();
  sub_1A5FAFD58(v86, &qword_1ED1940B8);
  swift_bridgeObjectRelease();
LABEL_21:
  OUTLINED_FUNCTION_20();
}

void sub_1A611F8C0(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  WeatherAlert.init(from:)(a1, a2);
}

void sub_1A611F8D4(_QWORD *a1)
{
  WeatherAlert.encode(to:)(a1);
}

void WeatherAlert.isExpired.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_6();
  v2 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870];
  v3 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_12();
  sub_1A6121F4C();
  OUTLINED_FUNCTION_0_52();
  OUTLINED_FUNCTION_49();
  sub_1A5FAF484((unint64_t *)&qword_1ED191E98, v2, MEMORY[0x1E0CB08B0]);
  sub_1A61237AC();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0, v1);
  OUTLINED_FUNCTION_3_8();
}

unint64_t sub_1A611F9A0()
{
  unint64_t result;

  result = qword_1EE817BB8;
  if (!qword_1EE817BB8)
  {
    result = MEMORY[0x1A85BB36C](&unk_1A61410A4, &type metadata for WeatherAlert.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE817BB8);
  }
  return result;
}

unint64_t sub_1A611F9DC()
{
  unint64_t result;

  result = qword_1EE817BC0;
  if (!qword_1EE817BC0)
  {
    result = MEMORY[0x1A85BB36C](&protocol conformance descriptor for WeatherSeverity, &type metadata for WeatherSeverity);
    atomic_store(result, (unint64_t *)&qword_1EE817BC0);
  }
  return result;
}

unint64_t sub_1A611FA18()
{
  unint64_t result;

  result = qword_1EE817BC8;
  if (!qword_1EE817BC8)
  {
    result = MEMORY[0x1A85BB36C](&protocol conformance descriptor for WeatherImportance, &type metadata for WeatherImportance);
    atomic_store(result, (unint64_t *)&qword_1EE817BC8);
  }
  return result;
}

unint64_t sub_1A611FA54()
{
  unint64_t result;

  result = qword_1EE817BD8;
  if (!qword_1EE817BD8)
  {
    result = MEMORY[0x1A85BB36C](&protocol conformance descriptor for WeatherSeverity, &type metadata for WeatherSeverity);
    atomic_store(result, (unint64_t *)&qword_1EE817BD8);
  }
  return result;
}

unint64_t sub_1A611FA90()
{
  unint64_t result;

  result = qword_1EE817BE0;
  if (!qword_1EE817BE0)
  {
    result = MEMORY[0x1A85BB36C](&protocol conformance descriptor for WeatherImportance, &type metadata for WeatherImportance);
    atomic_store(result, (unint64_t *)&qword_1EE817BE0);
  }
  return result;
}

char *initializeBufferWithCopyOfBuffer for WeatherAlert(char *a1, char *a2, int *a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(char *, char *, uint64_t);
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, char *, uint64_t);
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  int *v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  void (*v52)(char *, char *, uint64_t);

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v22 = *(_QWORD *)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1 = (char *)(v22 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_1A6121DF0();
    v8 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v9 = a3[5];
    v10 = a3[6];
    v11 = &a1[v9];
    v12 = &a2[v9];
    v13 = *((_QWORD *)v12 + 1);
    *(_QWORD *)v11 = *(_QWORD *)v12;
    *((_QWORD *)v11 + 1) = v13;
    v14 = &a1[v10];
    v15 = &a2[v10];
    v16 = sub_1A6121F58();
    v17 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16);
    swift_bridgeObjectRetain();
    v17(v14, v15, v16);
    v17(&a1[a3[7]], &a2[a3[7]], v16);
    v17(&a1[a3[8]], &a2[a3[8]], v16);
    v18 = a3[9];
    v19 = &a1[v18];
    v20 = &a2[v18];
    if (__swift_getEnumTagSinglePayload((uint64_t)&a2[v18], 1, v16))
    {
      v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1929C8);
      memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    }
    else
    {
      v17(v19, v20, v16);
      __swift_storeEnumTagSinglePayload((uint64_t)v19, 0, 1, v16);
    }
    v23 = a3[10];
    v24 = &a1[v23];
    v25 = &a2[v23];
    if (__swift_getEnumTagSinglePayload((uint64_t)&a2[v23], 1, v16))
    {
      v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1929C8);
      memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
    }
    else
    {
      v17(v24, v25, v16);
      __swift_storeEnumTagSinglePayload((uint64_t)v24, 0, 1, v16);
    }
    v27 = a3[11];
    v28 = a3[12];
    v29 = &a1[v27];
    v30 = &a2[v27];
    v31 = *((_QWORD *)v30 + 1);
    *(_QWORD *)v29 = *(_QWORD *)v30;
    *((_QWORD *)v29 + 1) = v31;
    v32 = &a1[v28];
    v33 = &a2[v28];
    v34 = *((_QWORD *)v33 + 1);
    *(_QWORD *)v32 = *(_QWORD *)v33;
    *((_QWORD *)v32 + 1) = v34;
    v35 = a3[13];
    v36 = &a1[v35];
    v37 = &a2[v35];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v37, 1, v7))
    {
      v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1940B8);
      memcpy(v36, v37, *(_QWORD *)(*(_QWORD *)(v38 - 8) + 64));
    }
    else
    {
      v8(v36, v37, v7);
      __swift_storeEnumTagSinglePayload((uint64_t)v36, 0, 1, v7);
    }
    v39 = a3[14];
    v40 = a3[15];
    v41 = &a1[v39];
    v42 = &a2[v39];
    v43 = *((_QWORD *)v42 + 1);
    *(_QWORD *)v41 = *(_QWORD *)v42;
    *((_QWORD *)v41 + 1) = v43;
    a1[v40] = a2[v40];
    v44 = a3[17];
    a1[a3[16]] = a2[a3[16]];
    v45 = &a1[v44];
    v46 = &a2[v44];
    swift_bridgeObjectRetain();
    v17(v45, v46, v16);
    v47 = (int *)type metadata accessor for WeatherMetadata();
    v17(&v45[v47[5]], &v46[v47[5]], v16);
    *(_QWORD *)&v45[v47[6]] = *(_QWORD *)&v46[v47[6]];
    *(_QWORD *)&v45[v47[7]] = *(_QWORD *)&v46[v47[7]];
    *(_QWORD *)&v45[v47[8]] = *(_QWORD *)&v46[v47[8]];
    v48 = a3[18];
    v49 = &a1[v48];
    v50 = &a2[v48];
    v51 = sub_1A6121F88();
    v52 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v51 - 8) + 16);
    swift_retain();
    v52(v49, v50, v51);
  }
  return a1;
}

uint64_t destroy for WeatherAlert(uint64_t a1, int *a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = sub_1A6121DF0();
  v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(a1, v4);
  swift_bridgeObjectRelease();
  v6 = a1 + a2[6];
  v7 = sub_1A6121F58();
  v8 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8);
  v8(v6, v7);
  v8(a1 + a2[7], v7);
  v8(a1 + a2[8], v7);
  v9 = a1 + a2[9];
  if (!__swift_getEnumTagSinglePayload(v9, 1, v7))
    v8(v9, v7);
  v10 = a1 + a2[10];
  if (!__swift_getEnumTagSinglePayload(v10, 1, v7))
    v8(v10, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v11 = a1 + a2[13];
  if (!__swift_getEnumTagSinglePayload(v11, 1, v4))
    v5(v11, v4);
  swift_bridgeObjectRelease();
  v12 = a1 + a2[17];
  v8(v12, v7);
  v13 = type metadata accessor for WeatherMetadata();
  v8(v12 + *(int *)(v13 + 20), v7);
  swift_release();
  v14 = a1 + a2[18];
  v15 = sub_1A6121F88();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(v14, v15);
}

char *initializeWithCopy for WeatherAlert(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  void (*v7)(void *, const void *, uint64_t);
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  void (*v16)(void *, const void *, uint64_t);
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
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
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  int *v45;
  uint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  void (*v50)(char *, char *, uint64_t);

  v6 = sub_1A6121DF0();
  v7 = *(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v8 = a3[5];
  v9 = a3[6];
  v10 = &a1[v8];
  v11 = &a2[v8];
  v12 = *((_QWORD *)v11 + 1);
  *(_QWORD *)v10 = *(_QWORD *)v11;
  *((_QWORD *)v10 + 1) = v12;
  v13 = &a1[v9];
  v14 = &a2[v9];
  v15 = sub_1A6121F58();
  v16 = *(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v15 - 8) + 16);
  swift_bridgeObjectRetain();
  v16(v13, v14, v15);
  v16(&a1[a3[7]], &a2[a3[7]], v15);
  v16(&a1[a3[8]], &a2[a3[8]], v15);
  v17 = a3[9];
  v18 = &a1[v17];
  v19 = &a2[v17];
  if (__swift_getEnumTagSinglePayload((uint64_t)&a2[v17], 1, v15))
  {
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1929C8);
    memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
  }
  else
  {
    v16(v18, v19, v15);
    __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v15);
  }
  v21 = a3[10];
  v22 = &a1[v21];
  v23 = &a2[v21];
  if (__swift_getEnumTagSinglePayload((uint64_t)&a2[v21], 1, v15))
  {
    v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1929C8);
    memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
  }
  else
  {
    v16(v22, v23, v15);
    __swift_storeEnumTagSinglePayload((uint64_t)v22, 0, 1, v15);
  }
  v25 = a3[11];
  v26 = a3[12];
  v27 = &a1[v25];
  v28 = &a2[v25];
  v29 = *((_QWORD *)v28 + 1);
  *(_QWORD *)v27 = *(_QWORD *)v28;
  *((_QWORD *)v27 + 1) = v29;
  v30 = &a1[v26];
  v31 = &a2[v26];
  v32 = *((_QWORD *)v31 + 1);
  *(_QWORD *)v30 = *(_QWORD *)v31;
  *((_QWORD *)v30 + 1) = v32;
  v33 = a3[13];
  v34 = &a1[v33];
  v35 = &a2[v33];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v35, 1, v6))
  {
    v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1940B8);
    memcpy(v34, v35, *(_QWORD *)(*(_QWORD *)(v36 - 8) + 64));
  }
  else
  {
    v7(v34, v35, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)v34, 0, 1, v6);
  }
  v37 = a3[14];
  v38 = a3[15];
  v39 = &a1[v37];
  v40 = &a2[v37];
  v41 = *((_QWORD *)v40 + 1);
  *(_QWORD *)v39 = *(_QWORD *)v40;
  *((_QWORD *)v39 + 1) = v41;
  a1[v38] = a2[v38];
  v42 = a3[17];
  a1[a3[16]] = a2[a3[16]];
  v43 = &a1[v42];
  v44 = &a2[v42];
  swift_bridgeObjectRetain();
  v16(v43, v44, v15);
  v45 = (int *)type metadata accessor for WeatherMetadata();
  v16(&v43[v45[5]], &v44[v45[5]], v15);
  *(_QWORD *)&v43[v45[6]] = *(_QWORD *)&v44[v45[6]];
  *(_QWORD *)&v43[v45[7]] = *(_QWORD *)&v44[v45[7]];
  *(_QWORD *)&v43[v45[8]] = *(_QWORD *)&v44[v45[8]];
  v46 = a3[18];
  v47 = &a1[v46];
  v48 = &a2[v46];
  v49 = sub_1A6121F88();
  v50 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v49 - 8) + 16);
  swift_retain();
  v50(v47, v48, v49);
  return a1;
}

char *assignWithCopy for WeatherAlert(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(void *, const void *, uint64_t);
  uint64_t v16;
  char *v17;
  char *v18;
  int EnumTagSinglePayload;
  int v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  char *v35;
  char *v36;
  int v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  char *v44;
  char *v45;
  int *v46;
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  void (*v52)(void *, const void *, uint64_t);
  uint64_t v53;

  v6 = sub_1A6121DF0();
  v53 = *(_QWORD *)(v6 - 8);
  v52 = *(void (**)(void *, const void *, uint64_t))(v53 + 24);
  v52(a1, a2, v6);
  v7 = a3[5];
  v8 = &a1[v7];
  v9 = &a2[v7];
  *(_QWORD *)v8 = *(_QWORD *)v9;
  *((_QWORD *)v8 + 1) = *((_QWORD *)v9 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = a3[6];
  v11 = &a1[v10];
  v12 = &a2[v10];
  v13 = sub_1A6121F58();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(void (**)(void *, const void *, uint64_t))(v14 + 24);
  v15(v11, v12, v13);
  v15(&a1[a3[7]], &a2[a3[7]], v13);
  v15(&a1[a3[8]], &a2[a3[8]], v13);
  v16 = a3[9];
  v17 = &a1[v16];
  v18 = &a2[v16];
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)&a1[v16], 1, v13);
  v20 = __swift_getEnumTagSinglePayload((uint64_t)v18, 1, v13);
  if (EnumTagSinglePayload)
  {
    if (!v20)
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v17, v18, v13);
      __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, v13);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v20)
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
LABEL_6:
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1929C8);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    goto LABEL_7;
  }
  v15(v17, v18, v13);
LABEL_7:
  v22 = a3[10];
  v23 = &a1[v22];
  v24 = &a2[v22];
  v25 = __swift_getEnumTagSinglePayload((uint64_t)&a1[v22], 1, v13);
  v26 = __swift_getEnumTagSinglePayload((uint64_t)v24, 1, v13);
  if (v25)
  {
    if (!v26)
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v23, v24, v13);
      __swift_storeEnumTagSinglePayload((uint64_t)v23, 0, 1, v13);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v26)
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v23, v13);
LABEL_12:
    v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1929C8);
    memcpy(v23, v24, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
    goto LABEL_13;
  }
  v15(v23, v24, v13);
LABEL_13:
  v28 = a3[11];
  v29 = &a1[v28];
  v30 = &a2[v28];
  *(_QWORD *)v29 = *(_QWORD *)v30;
  *((_QWORD *)v29 + 1) = *((_QWORD *)v30 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v31 = a3[12];
  v32 = &a1[v31];
  v33 = &a2[v31];
  *(_QWORD *)v32 = *(_QWORD *)v33;
  *((_QWORD *)v32 + 1) = *((_QWORD *)v33 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v34 = a3[13];
  v35 = &a1[v34];
  v36 = &a2[v34];
  v37 = __swift_getEnumTagSinglePayload((uint64_t)&a1[v34], 1, v6);
  v38 = __swift_getEnumTagSinglePayload((uint64_t)v36, 1, v6);
  if (!v37)
  {
    if (!v38)
    {
      v52(v35, v36, v6);
      goto LABEL_19;
    }
    (*(void (**)(char *, uint64_t))(v53 + 8))(v35, v6);
    goto LABEL_18;
  }
  if (v38)
  {
LABEL_18:
    v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1940B8);
    memcpy(v35, v36, *(_QWORD *)(*(_QWORD *)(v39 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(char *, char *, uint64_t))(v53 + 16))(v35, v36, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)v35, 0, 1, v6);
LABEL_19:
  v40 = a3[14];
  v41 = &a1[v40];
  v42 = &a2[v40];
  *(_QWORD *)v41 = *(_QWORD *)v42;
  *((_QWORD *)v41 + 1) = *((_QWORD *)v42 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[a3[15]] = a2[a3[15]];
  a1[a3[16]] = a2[a3[16]];
  v43 = a3[17];
  v44 = &a1[v43];
  v45 = &a2[v43];
  v15(&a1[v43], &a2[v43], v13);
  v46 = (int *)type metadata accessor for WeatherMetadata();
  v15(&v44[v46[5]], &v45[v46[5]], v13);
  *(_QWORD *)&v44[v46[6]] = *(_QWORD *)&v45[v46[6]];
  *(_QWORD *)&v44[v46[7]] = *(_QWORD *)&v45[v46[7]];
  *(_QWORD *)&v44[v46[8]] = *(_QWORD *)&v45[v46[8]];
  swift_retain();
  swift_release();
  v47 = a3[18];
  v48 = &a1[v47];
  v49 = &a2[v47];
  v50 = sub_1A6121F88();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v50 - 8) + 24))(v48, v49, v50);
  return a1;
}

char *initializeWithTake for WeatherAlert(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  void (*v7)(void *, const void *, uint64_t);
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(void *, const void *, uint64_t);
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  int *v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;

  v6 = sub_1A6121DF0();
  v7 = *(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v8 = a3[6];
  *(_OWORD *)&a1[a3[5]] = *(_OWORD *)&a2[a3[5]];
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = sub_1A6121F58();
  v12 = *(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v11 - 8) + 32);
  v12(v9, v10, v11);
  v12(&a1[a3[7]], &a2[a3[7]], v11);
  v12(&a1[a3[8]], &a2[a3[8]], v11);
  v13 = a3[9];
  v14 = &a1[v13];
  v15 = &a2[v13];
  if (__swift_getEnumTagSinglePayload((uint64_t)&a2[v13], 1, v11))
  {
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1929C8);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    v12(v14, v15, v11);
    __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v11);
  }
  v17 = a3[10];
  v18 = &a1[v17];
  v19 = &a2[v17];
  if (__swift_getEnumTagSinglePayload((uint64_t)&a2[v17], 1, v11))
  {
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1929C8);
    memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
  }
  else
  {
    v12(v18, v19, v11);
    __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v11);
  }
  v21 = a3[12];
  *(_OWORD *)&a1[a3[11]] = *(_OWORD *)&a2[a3[11]];
  *(_OWORD *)&a1[v21] = *(_OWORD *)&a2[v21];
  v22 = a3[13];
  v23 = &a1[v22];
  v24 = &a2[v22];
  if (__swift_getEnumTagSinglePayload((uint64_t)&a2[v22], 1, v6))
  {
    v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1940B8);
    memcpy(v23, v24, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
  }
  else
  {
    v7(v23, v24, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)v23, 0, 1, v6);
  }
  v26 = a3[15];
  *(_OWORD *)&a1[a3[14]] = *(_OWORD *)&a2[a3[14]];
  a1[v26] = a2[v26];
  v27 = a3[17];
  a1[a3[16]] = a2[a3[16]];
  v28 = &a1[v27];
  v29 = &a2[v27];
  v12(&a1[v27], &a2[v27], v11);
  v30 = (int *)type metadata accessor for WeatherMetadata();
  v12(&v28[v30[5]], &v29[v30[5]], v11);
  *(_QWORD *)&v28[v30[6]] = *(_QWORD *)&v29[v30[6]];
  *(_QWORD *)&v28[v30[7]] = *(_QWORD *)&v29[v30[7]];
  *(_QWORD *)&v28[v30[8]] = *(_QWORD *)&v29[v30[8]];
  v31 = a3[18];
  v32 = &a1[v31];
  v33 = &a2[v31];
  v34 = sub_1A6121F88();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v34 - 8) + 32))(v32, v33, v34);
  return a1;
}

char *assignWithTake for WeatherAlert(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(void *, const void *, uint64_t);
  uint64_t v18;
  char *v19;
  char *v20;
  int EnumTagSinglePayload;
  int v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  int v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  int v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  char *v54;
  int *v55;
  uint64_t v56;
  char *v57;
  char *v58;
  uint64_t v59;
  void (*v61)(void *, const void *, uint64_t);
  uint64_t v62;

  v6 = sub_1A6121DF0();
  v62 = *(_QWORD *)(v6 - 8);
  v61 = *(void (**)(void *, const void *, uint64_t))(v62 + 40);
  v61(a1, a2, v6);
  v7 = a3[5];
  v8 = &a1[v7];
  v9 = (uint64_t *)&a2[v7];
  v11 = *v9;
  v10 = v9[1];
  *(_QWORD *)v8 = v11;
  *((_QWORD *)v8 + 1) = v10;
  swift_bridgeObjectRelease();
  v12 = a3[6];
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = sub_1A6121F58();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(void (**)(void *, const void *, uint64_t))(v16 + 40);
  v17(v13, v14, v15);
  v17(&a1[a3[7]], &a2[a3[7]], v15);
  v17(&a1[a3[8]], &a2[a3[8]], v15);
  v18 = a3[9];
  v19 = &a1[v18];
  v20 = &a2[v18];
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)&a1[v18], 1, v15);
  v22 = __swift_getEnumTagSinglePayload((uint64_t)v20, 1, v15);
  if (EnumTagSinglePayload)
  {
    if (!v22)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v19, v20, v15);
      __swift_storeEnumTagSinglePayload((uint64_t)v19, 0, 1, v15);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v22)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v19, v15);
LABEL_6:
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1929C8);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    goto LABEL_7;
  }
  v17(v19, v20, v15);
LABEL_7:
  v24 = a3[10];
  v25 = &a1[v24];
  v26 = &a2[v24];
  v27 = __swift_getEnumTagSinglePayload((uint64_t)&a1[v24], 1, v15);
  v28 = __swift_getEnumTagSinglePayload((uint64_t)v26, 1, v15);
  if (v27)
  {
    if (!v28)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v25, v26, v15);
      __swift_storeEnumTagSinglePayload((uint64_t)v25, 0, 1, v15);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v28)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v25, v15);
LABEL_12:
    v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1929C8);
    memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
    goto LABEL_13;
  }
  v17(v25, v26, v15);
LABEL_13:
  v30 = a3[11];
  v31 = &a1[v30];
  v32 = (uint64_t *)&a2[v30];
  v34 = *v32;
  v33 = v32[1];
  *(_QWORD *)v31 = v34;
  *((_QWORD *)v31 + 1) = v33;
  swift_bridgeObjectRelease();
  v35 = a3[12];
  v36 = &a1[v35];
  v37 = (uint64_t *)&a2[v35];
  v39 = *v37;
  v38 = v37[1];
  *(_QWORD *)v36 = v39;
  *((_QWORD *)v36 + 1) = v38;
  swift_bridgeObjectRelease();
  v40 = a3[13];
  v41 = &a1[v40];
  v42 = &a2[v40];
  v43 = __swift_getEnumTagSinglePayload((uint64_t)&a1[v40], 1, v6);
  v44 = __swift_getEnumTagSinglePayload((uint64_t)v42, 1, v6);
  if (!v43)
  {
    if (!v44)
    {
      v61(v41, v42, v6);
      goto LABEL_19;
    }
    (*(void (**)(char *, uint64_t))(v62 + 8))(v41, v6);
    goto LABEL_18;
  }
  if (v44)
  {
LABEL_18:
    v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1940B8);
    memcpy(v41, v42, *(_QWORD *)(*(_QWORD *)(v45 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(char *, char *, uint64_t))(v62 + 32))(v41, v42, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)v41, 0, 1, v6);
LABEL_19:
  v46 = a3[14];
  v47 = &a1[v46];
  v48 = (uint64_t *)&a2[v46];
  v50 = *v48;
  v49 = v48[1];
  *(_QWORD *)v47 = v50;
  *((_QWORD *)v47 + 1) = v49;
  swift_bridgeObjectRelease();
  v51 = a3[16];
  a1[a3[15]] = a2[a3[15]];
  a1[v51] = a2[v51];
  v52 = a3[17];
  v53 = &a1[v52];
  v54 = &a2[v52];
  v17(&a1[v52], &a2[v52], v15);
  v55 = (int *)type metadata accessor for WeatherMetadata();
  v17(&v53[v55[5]], &v54[v55[5]], v15);
  *(_QWORD *)&v53[v55[6]] = *(_QWORD *)&v54[v55[6]];
  *(_QWORD *)&v53[v55[7]] = *(_QWORD *)&v54[v55[7]];
  *(_QWORD *)&v53[v55[8]] = *(_QWORD *)&v54[v55[8]];
  swift_release();
  v56 = a3[18];
  v57 = &a1[v56];
  v58 = &a2[v56];
  v59 = sub_1A6121F88();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v59 - 8) + 40))(v57, v58, v59);
  return a1;
}

uint64_t sub_1A6120DB8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  uint64_t v18;

  OUTLINED_FUNCTION_267();
  OUTLINED_FUNCTION_14_0();
  if (v13)
  {
    v7 = v6;
    v8 = a1;
    return __swift_getEnumTagSinglePayload(v8, a2, v7);
  }
  if ((_DWORD)a2 != 0x7FFFFFFF)
  {
    OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_14_0();
    if (v13)
    {
      v7 = v11;
      v12 = a3[6];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1929C8);
      OUTLINED_FUNCTION_14_0();
      if (v13)
      {
        v7 = v14;
        v12 = a3[9];
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1940B8);
        OUTLINED_FUNCTION_14_0();
        if (v15)
        {
          v7 = v16;
          v12 = a3[13];
        }
        else
        {
          OUTLINED_FUNCTION_49();
          OUTLINED_FUNCTION_14_0();
          if (v17)
          {
            v7 = v18;
            v12 = a3[17];
          }
          else
          {
            v7 = OUTLINED_FUNCTION_27_15();
            v12 = a3[18];
          }
        }
      }
    }
    v8 = a1 + v12;
    return __swift_getEnumTagSinglePayload(v8, a2, v7);
  }
  v9 = *(_QWORD *)(a1 + a3[5] + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

void sub_1A6120EB8(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  uint64_t v18;

  OUTLINED_FUNCTION_267();
  OUTLINED_FUNCTION_13();
  if (v13)
  {
    v9 = v8;
    v10 = a1;
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(_QWORD *)(a1 + a4[5] + 8) = (a2 - 1);
      OUTLINED_FUNCTION_9();
      return;
    }
    OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_13();
    if (v13)
    {
      v9 = v11;
      v12 = a4[6];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1929C8);
      OUTLINED_FUNCTION_13();
      if (v13)
      {
        v9 = v14;
        v12 = a4[9];
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1940B8);
        OUTLINED_FUNCTION_13();
        if (v15)
        {
          v9 = v16;
          v12 = a4[13];
        }
        else
        {
          OUTLINED_FUNCTION_49();
          OUTLINED_FUNCTION_13();
          if (v17)
          {
            v9 = v18;
            v12 = a4[17];
          }
          else
          {
            v9 = OUTLINED_FUNCTION_27_15();
            v12 = a4[18];
          }
        }
      }
    }
    v10 = a1 + v12;
  }
  __swift_storeEnumTagSinglePayload(v10, a2, a2, v9);
}

uint64_t storeEnumTagSinglePayload for WeatherAlert.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 14 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 14) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF2)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF1)
    return ((uint64_t (*)(void))((char *)&loc_1A6120FF8 + 4 * byte_1A6140E74[v4]))();
  *a1 = a2 + 14;
  return ((uint64_t (*)(void))((char *)sub_1A612102C + 4 * byte_1A6140E6F[v4]))();
}

uint64_t sub_1A612102C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A6121034(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1A612103CLL);
  return result;
}

uint64_t sub_1A6121048(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1A6121050);
  *(_BYTE *)result = a2 + 14;
  return result;
}

uint64_t sub_1A6121054(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A612105C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for WeatherAlert.CodingKeys()
{
  return &type metadata for WeatherAlert.CodingKeys;
}

unint64_t sub_1A612107C()
{
  unint64_t result;

  result = qword_1EE817BE8;
  if (!qword_1EE817BE8)
  {
    result = MEMORY[0x1A85BB36C](&unk_1A614107C, &type metadata for WeatherAlert.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE817BE8);
  }
  return result;
}

unint64_t sub_1A61210BC()
{
  unint64_t result;

  result = qword_1EE817BF0;
  if (!qword_1EE817BF0)
  {
    result = MEMORY[0x1A85BB36C](&unk_1A6140FEC, &type metadata for WeatherAlert.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE817BF0);
  }
  return result;
}

unint64_t sub_1A61210FC()
{
  unint64_t result;

  result = qword_1EE817BF8;
  if (!qword_1EE817BF8)
  {
    result = MEMORY[0x1A85BB36C](&unk_1A6141014, &type metadata for WeatherAlert.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE817BF8);
  }
  return result;
}

WeatherKit::AirQualityScaleGradientStop __swiftcall AirQualityScaleGradientStop.init(location:color:)(Swift::Float location, Swift::String color)
{
  uint64_t v2;
  WeatherKit::AirQualityScaleGradientStop result;

  *(Swift::Float *)v2 = location;
  *(Swift::String *)(v2 + 8) = color;
  result.color = color;
  result.location = location;
  return result;
}

void AirQualityScaleGradientStop.location.setter(float a1)
{
  float *v1;

  *v1 = a1;
}

uint64_t (*AirQualityScaleGradientStop.location.modify())()
{
  return GEOLocationCoordinate2DMake;
}

uint64_t AirQualityScaleGradientStop.color.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 8) = a1;
  *(_QWORD *)(v2 + 16) = a2;
  return result;
}

uint64_t (*AirQualityScaleGradientStop.color.modify())()
{
  return GEOLocationCoordinate2DMake;
}

uint64_t sub_1A61211A0(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v7;

  v2 = a1 == 0x6E6F697461636F6CLL && a2 == 0xE800000000000000;
  if (v2 || (sub_1A6123CF8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x726F6C6F63 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_1A6123CF8();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1A6121284(char a1)
{
  if ((a1 & 1) != 0)
    return 0x726F6C6F63;
  else
    return 0x6E6F697461636F6CLL;
}

uint64_t sub_1A61212B8()
{
  char *v0;

  return sub_1A6121284(*v0);
}

uint64_t sub_1A61212C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1A61211A0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A61212E4()
{
  sub_1A6121498();
  return sub_1A6123DE8();
}

uint64_t sub_1A612130C()
{
  sub_1A6121498();
  return sub_1A6123DF4();
}

uint64_t static AirQualityScaleGradientStop.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if (*(float *)a1 != *(float *)a2)
    return 0;
  if (*(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8) && *(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16))
    return 1;
  else
    return sub_1A6123CF8();
}

void AirQualityScaleGradientStop.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char v9;
  char v10;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED191620);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(v1 + 8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A6121498();
  sub_1A6123DD0();
  v10 = 0;
  sub_1A6123CB0();
  if (!v2)
  {
    v9 = 1;
    sub_1A6123C8C();
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  OUTLINED_FUNCTION_0_12();
}

unint64_t sub_1A6121498()
{
  unint64_t result;

  result = qword_1ED191360;
  if (!qword_1ED191360)
  {
    result = MEMORY[0x1A85BB36C](&unk_1A6141270, &type metadata for AirQualityScaleGradientStop.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED191360);
  }
  return result;
}

void AirQualityScaleGradientStop.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE817C00);
  MEMORY[0x1E0C80A78](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A6121498();
  sub_1A6123DC4();
  if (!v2)
  {
    sub_1A6123C2C();
    v7 = v6;
    v8 = sub_1A6123C08();
    v10 = v9;
    OUTLINED_FUNCTION_2_8();
    *(_DWORD *)a2 = v7;
    *(_QWORD *)(a2 + 8) = v8;
    *(_QWORD *)(a2 + 16) = v10;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  OUTLINED_FUNCTION_0_12();
}

void sub_1A6121600(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  AirQualityScaleGradientStop.init(from:)(a1, a2);
}

void sub_1A6121614(_QWORD *a1)
{
  AirQualityScaleGradientStop.encode(to:)(a1);
}

uint64_t sub_1A612162C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AirQualityScaleGradientStop(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for AirQualityScaleGradientStop(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t storeEnumTagSinglePayload for AirQualityScaleGradientStop.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1A612172C + 4 * byte_1A6141105[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1A6121760 + 4 * byte_1A6141100[v4]))();
}

uint64_t sub_1A6121760(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A6121768(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1A6121770);
  return result;
}

uint64_t sub_1A612177C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1A6121784);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1A6121788(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A6121790(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AirQualityScaleGradientStop.CodingKeys()
{
  return &type metadata for AirQualityScaleGradientStop.CodingKeys;
}

unint64_t sub_1A61217B0()
{
  unint64_t result;

  result = qword_1EE817C08;
  if (!qword_1EE817C08)
  {
    result = MEMORY[0x1A85BB36C](&unk_1A6141248, &type metadata for AirQualityScaleGradientStop.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE817C08);
  }
  return result;
}

unint64_t sub_1A61217F0()
{
  unint64_t result;

  result = qword_1ED191370;
  if (!qword_1ED191370)
  {
    result = MEMORY[0x1A85BB36C](&unk_1A61411B8, &type metadata for AirQualityScaleGradientStop.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED191370);
  }
  return result;
}

unint64_t sub_1A6121830()
{
  unint64_t result;

  result = qword_1ED191368;
  if (!qword_1ED191368)
  {
    result = MEMORY[0x1A85BB36C](&unk_1A61411E0, &type metadata for AirQualityScaleGradientStop.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED191368);
  }
  return result;
}

uint64_t sub_1A612186C(_BYTE *a1, uint64_t a2, double a3, double a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v13;
  unsigned __int8 v14;

  v8 = type metadata accessor for CLLocationCoordinate2D.SolarEvents();
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(a1) = *a1;
  CLLocationCoordinate2D.solarEvents(referenceDate:timeZone:)(a2, (uint64_t)v10, a3, a4);
  v14 = a1;
  v11 = sub_1A6121938(&v14);
  sub_1A610BF70((uint64_t)v10);
  return v11;
}

uint64_t sub_1A6121938(unsigned __int8 *a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1A6121978 + 4 * byte_1A61412C0[*a1]))(0x6C616369706F7274, 0xED00006D726F7473);
}

uint64_t sub_1A6121978@<X0>(char a1@<W8>)
{
  if ((a1 & 1) != 0)
    return 0x2E78616D2E6E7573;
  else
    return 0x6174732E6E6F6F6DLL;
}

uint64_t sub_1A6121B44()
{
  return 0x6F662E64756F6C63;
}

unint64_t sub_1A6121B68()
{
  return 0xD000000000000012;
}

unint64_t sub_1A6121B80()
{
  return 0xD000000000000015;
}

uint64_t sub_1A6121B98()
{
  return 0x61682E64756F6C63;
}

uint64_t sub_1A6121BDC()
{
  return 0x6E61636972727568;
}

void sub_1A6121BF8()
{
  JUMPOUT(0x1A6121C48);
}

uint64_t sub_1A6121C50()
{
  return 0x61722E64756F6C63;
}

void sub_1A6121C78()
{
  JUMPOUT(0x1A6121C8CLL);
}

uint64_t type metadata accessor for WeatherConditionSymbolMapper()
{
  return objc_opt_self();
}

uint64_t sub_1A6121CB8()
{
  return MEMORY[0x1E0CAE070]();
}

uint64_t sub_1A6121CC4()
{
  return MEMORY[0x1E0CAE0A8]();
}

uint64_t sub_1A6121CD0()
{
  return MEMORY[0x1E0CAE0B8]();
}

uint64_t sub_1A6121CDC()
{
  return MEMORY[0x1E0CAE228]();
}

uint64_t sub_1A6121CE8()
{
  return MEMORY[0x1E0CAE248]();
}

uint64_t sub_1A6121CF4()
{
  return MEMORY[0x1E0CAE328]();
}

uint64_t sub_1A6121D00()
{
  return MEMORY[0x1E0CAE580]();
}

uint64_t sub_1A6121D0C()
{
  return MEMORY[0x1E0CAE590]();
}

uint64_t sub_1A6121D18()
{
  return MEMORY[0x1E0CAE5A0]();
}

uint64_t sub_1A6121D24()
{
  return MEMORY[0x1E0CAE5D0]();
}

uint64_t sub_1A6121D30()
{
  return MEMORY[0x1E0CAE7C8]();
}

uint64_t sub_1A6121D3C()
{
  return MEMORY[0x1E0CAE7D0]();
}

uint64_t sub_1A6121D48()
{
  return MEMORY[0x1E0CAE818]();
}

uint64_t sub_1A6121D54()
{
  return MEMORY[0x1E0CAE890]();
}

uint64_t sub_1A6121D60()
{
  return MEMORY[0x1E0CAE8B8]();
}

uint64_t sub_1A6121D6C()
{
  return MEMORY[0x1E0CAE910]();
}

uint64_t sub_1A6121D78()
{
  return MEMORY[0x1E0CAE9C8]();
}

uint64_t sub_1A6121D84()
{
  return MEMORY[0x1E0CAE9F8]();
}

uint64_t sub_1A6121D90()
{
  return MEMORY[0x1E0CAEA38]();
}

uint64_t sub_1A6121D9C()
{
  return MEMORY[0x1E0CAEAB0]();
}

uint64_t sub_1A6121DA8()
{
  return MEMORY[0x1E0CAF328]();
}

uint64_t sub_1A6121DB4()
{
  return MEMORY[0x1E0CAFD90]();
}

uint64_t sub_1A6121DC0()
{
  return MEMORY[0x1E0CAFED8]();
}

uint64_t sub_1A6121DCC()
{
  return MEMORY[0x1E0CAFF90]();
}

uint64_t sub_1A6121DD8()
{
  return MEMORY[0x1E0CAFF98]();
}

uint64_t sub_1A6121DE4()
{
  return MEMORY[0x1E0CAFFD0]();
}

uint64_t sub_1A6121DF0()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1A6121DFC()
{
  return MEMORY[0x1E0CB01F8]();
}

uint64_t sub_1A6121E08()
{
  return MEMORY[0x1E0CB0248]();
}

uint64_t sub_1A6121E14()
{
  return MEMORY[0x1E0CB03B8]();
}

uint64_t sub_1A6121E20()
{
  return MEMORY[0x1E0CB03C0]();
}

uint64_t sub_1A6121E2C()
{
  return MEMORY[0x1E0CB0588]();
}

uint64_t sub_1A6121E38()
{
  return MEMORY[0x1E0DC9398]();
}

uint64_t sub_1A6121E44()
{
  return MEMORY[0x1E0DC93A0]();
}

uint64_t sub_1A6121E50()
{
  return MEMORY[0x1E0DC93A8]();
}

uint64_t sub_1A6121E5C()
{
  return MEMORY[0x1E0CB05D8]();
}

uint64_t sub_1A6121E68()
{
  return MEMORY[0x1E0CB05E8]();
}

uint64_t sub_1A6121E74()
{
  return MEMORY[0x1E0CB05F8]();
}

uint64_t sub_1A6121E80()
{
  return MEMORY[0x1E0CB0608]();
}

uint64_t sub_1A6121E8C()
{
  return MEMORY[0x1E0CB0610]();
}

uint64_t sub_1A6121E98()
{
  return MEMORY[0x1E0CB0618]();
}

uint64_t sub_1A6121EA4()
{
  return MEMORY[0x1E0CB0630]();
}

uint64_t sub_1A6121EB0()
{
  return MEMORY[0x1E0CB0638]();
}

uint64_t sub_1A6121EBC()
{
  return MEMORY[0x1E0CB0640]();
}

uint64_t sub_1A6121EC8()
{
  return MEMORY[0x1E0CB0648]();
}

uint64_t sub_1A6121ED4()
{
  return MEMORY[0x1E0CB0658]();
}

uint64_t sub_1A6121EE0()
{
  return MEMORY[0x1E0CB0670]();
}

uint64_t sub_1A6121EEC()
{
  return MEMORY[0x1E0CB0680]();
}

uint64_t sub_1A6121EF8()
{
  return MEMORY[0x1E0CB06D0]();
}

uint64_t sub_1A6121F04()
{
  return MEMORY[0x1E0CB06D8]();
}

uint64_t sub_1A6121F10()
{
  return MEMORY[0x1E0CB0708]();
}

uint64_t sub_1A6121F1C()
{
  return MEMORY[0x1E0CB07C8]();
}

uint64_t sub_1A6121F28()
{
  return MEMORY[0x1E0CB07F8]();
}

uint64_t sub_1A6121F34()
{
  return MEMORY[0x1E0CB0830]();
}

uint64_t sub_1A6121F40()
{
  return MEMORY[0x1E0CB0848]();
}

uint64_t sub_1A6121F4C()
{
  return MEMORY[0x1E0CB0860]();
}

uint64_t sub_1A6121F58()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1A6121F64()
{
  return MEMORY[0x1E0CB0900]();
}

uint64_t sub_1A6121F70()
{
  return MEMORY[0x1E0CB0948]();
}

uint64_t sub_1A6121F7C()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1A6121F88()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1A6121F94()
{
  return MEMORY[0x1E0CB0A80]();
}

uint64_t sub_1A6121FA0()
{
  return MEMORY[0x1E0DC93B8]();
}

uint64_t sub_1A6121FAC()
{
  return MEMORY[0x1E0CB0BD8]();
}

uint64_t sub_1A6121FB8()
{
  return MEMORY[0x1E0CB0BE0]();
}

uint64_t sub_1A6121FC4()
{
  return MEMORY[0x1E0CB0C20]();
}

uint64_t sub_1A6121FD0()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t sub_1A6121FDC()
{
  return MEMORY[0x1E0CB0F30]();
}

uint64_t sub_1A6121FE8()
{
  return MEMORY[0x1E0CB0F38]();
}

uint64_t sub_1A6121FF4()
{
  return MEMORY[0x1E0DC93C0]();
}

uint64_t sub_1A6122000()
{
  return MEMORY[0x1E0DC93C8]();
}

uint64_t sub_1A612200C()
{
  return MEMORY[0x1E0CB0FB0]();
}

uint64_t sub_1A6122018()
{
  return MEMORY[0x1E0CB1070]();
}

uint64_t sub_1A6122024()
{
  return MEMORY[0x1E0CB1098]();
}

uint64_t sub_1A6122030()
{
  return MEMORY[0x1E0CB10C8]();
}

uint64_t sub_1A612203C()
{
  return MEMORY[0x1E0CB10D8]();
}

uint64_t sub_1A6122048()
{
  return MEMORY[0x1E0CB11B8]();
}

uint64_t sub_1A6122054()
{
  return MEMORY[0x1E0CB11E0]();
}

uint64_t sub_1A6122060()
{
  return MEMORY[0x1E0CB11F0]();
}

uint64_t sub_1A612206C()
{
  return MEMORY[0x1E0CB1430]();
}

uint64_t sub_1A6122078()
{
  return MEMORY[0x1E0CB1438]();
}

uint64_t sub_1A6122084()
{
  return MEMORY[0x1E0CB1440]();
}

uint64_t sub_1A6122090()
{
  return MEMORY[0x1E0CB1458]();
}

uint64_t sub_1A612209C()
{
  return MEMORY[0x1E0CB1460]();
}

uint64_t sub_1A61220A8()
{
  return MEMORY[0x1E0CB1470]();
}

uint64_t sub_1A61220B4()
{
  return MEMORY[0x1E0DC93D0]();
}

uint64_t sub_1A61220C0()
{
  return MEMORY[0x1E0DC93D8]();
}

uint64_t sub_1A61220CC()
{
  return MEMORY[0x1E0DC93E0]();
}

uint64_t sub_1A61220D8()
{
  return MEMORY[0x1E0DC93E8]();
}

uint64_t sub_1A61220E4()
{
  return MEMORY[0x1E0DC93F0]();
}

uint64_t sub_1A61220F0()
{
  return MEMORY[0x1E0DC93F8]();
}

uint64_t sub_1A61220FC()
{
  return MEMORY[0x1E0DC9400]();
}

uint64_t sub_1A6122108()
{
  return MEMORY[0x1E0DC9408]();
}

uint64_t sub_1A6122114()
{
  return MEMORY[0x1E0DB54B0]();
}

uint64_t sub_1A6122120()
{
  return MEMORY[0x1E0DB54B8]();
}

uint64_t sub_1A612212C()
{
  return MEMORY[0x1E0DB54C0]();
}

uint64_t sub_1A6122138()
{
  return MEMORY[0x1E0DB54C8]();
}

uint64_t sub_1A6122144()
{
  return MEMORY[0x1E0DB55D0]();
}

uint64_t sub_1A6122150()
{
  return MEMORY[0x1E0DB55D8]();
}

uint64_t sub_1A612215C()
{
  return MEMORY[0x1E0DB55E8]();
}

uint64_t sub_1A6122168()
{
  return MEMORY[0x1E0DB31E0]();
}

uint64_t sub_1A6122174()
{
  return MEMORY[0x1E0DB31E8]();
}

uint64_t sub_1A6122180()
{
  return MEMORY[0x1E0DB31F0]();
}

uint64_t sub_1A612218C()
{
  return MEMORY[0x1E0DB31F8]();
}

uint64_t sub_1A6122198()
{
  return MEMORY[0x1E0DB3210]();
}

uint64_t sub_1A61221A4()
{
  return MEMORY[0x1E0DB3220]();
}

uint64_t sub_1A61221B0()
{
  return MEMORY[0x1E0DB33C8]();
}

uint64_t sub_1A61221BC()
{
  return MEMORY[0x1E0DB3828]();
}

uint64_t sub_1A61221C8()
{
  return MEMORY[0x1E0DB48F8]();
}

uint64_t sub_1A61221D4()
{
  return MEMORY[0x1E0DB4910]();
}

uint64_t sub_1A61221E0()
{
  return MEMORY[0x1E0DB4AB8]();
}

uint64_t sub_1A61221EC()
{
  return MEMORY[0x1E0DB4BF0]();
}

uint64_t sub_1A61221F8()
{
  return MEMORY[0x1E0DB4C00]();
}

uint64_t sub_1A6122204()
{
  return MEMORY[0x1E0DB4C08]();
}

uint64_t sub_1A6122210()
{
  return MEMORY[0x1E0DB4C10]();
}

uint64_t sub_1A612221C()
{
  return MEMORY[0x1E0DB4C30]();
}

uint64_t sub_1A6122228()
{
  return MEMORY[0x1E0DB4C58]();
}

uint64_t sub_1A6122234()
{
  return MEMORY[0x1E0DB4C78]();
}

uint64_t sub_1A6122240()
{
  return MEMORY[0x1E0DB4E50]();
}

uint64_t sub_1A612224C()
{
  return MEMORY[0x1E0DB4E88]();
}

uint64_t sub_1A6122258()
{
  return MEMORY[0x1E0DC9418]();
}

uint64_t sub_1A6122264()
{
  return MEMORY[0x1E0DC9420]();
}

uint64_t sub_1A6122270()
{
  return MEMORY[0x1E0DC9428]();
}

uint64_t sub_1A612227C()
{
  return MEMORY[0x1E0DC9430]();
}

uint64_t sub_1A6122288()
{
  return MEMORY[0x1E0DC9438]();
}

uint64_t sub_1A6122294()
{
  return MEMORY[0x1E0DC9440]();
}

uint64_t sub_1A61222A0()
{
  return MEMORY[0x1E0DC9448]();
}

uint64_t sub_1A61222AC()
{
  return MEMORY[0x1E0DC9450]();
}

uint64_t sub_1A61222B8()
{
  return MEMORY[0x1E0DC9458]();
}

uint64_t sub_1A61222C4()
{
  return MEMORY[0x1E0DC9460]();
}

uint64_t sub_1A61222D0()
{
  return MEMORY[0x1E0DC9468]();
}

uint64_t sub_1A61222DC()
{
  return MEMORY[0x1E0DC9470]();
}

uint64_t sub_1A61222E8()
{
  return MEMORY[0x1E0DC9480]();
}

uint64_t sub_1A61222F4()
{
  return MEMORY[0x1E0DC9488]();
}

uint64_t sub_1A6122300()
{
  return MEMORY[0x1E0DC9490]();
}

uint64_t sub_1A612230C()
{
  return MEMORY[0x1E0DC9498]();
}

uint64_t sub_1A6122318()
{
  return MEMORY[0x1E0DC94A0]();
}

uint64_t sub_1A6122324()
{
  return MEMORY[0x1E0DC94A8]();
}

uint64_t sub_1A6122330()
{
  return MEMORY[0x1E0DC94B0]();
}

uint64_t sub_1A612233C()
{
  return MEMORY[0x1E0DC94B8]();
}

uint64_t sub_1A6122348()
{
  return MEMORY[0x1E0DC94C0]();
}

uint64_t sub_1A6122354()
{
  return MEMORY[0x1E0DC94D0]();
}

uint64_t sub_1A6122360()
{
  return MEMORY[0x1E0DC94D8]();
}

uint64_t sub_1A612236C()
{
  return MEMORY[0x1E0DC94E0]();
}

uint64_t sub_1A6122378()
{
  return MEMORY[0x1E0DC94E8]();
}

uint64_t sub_1A6122384()
{
  return MEMORY[0x1E0DC94F0]();
}

uint64_t sub_1A6122390()
{
  return MEMORY[0x1E0DC94F8]();
}

uint64_t sub_1A612239C()
{
  return MEMORY[0x1E0DC9500]();
}

uint64_t sub_1A61223A8()
{
  return MEMORY[0x1E0DC9508]();
}

uint64_t sub_1A61223B4()
{
  return MEMORY[0x1E0DC9510]();
}

uint64_t sub_1A61223C0()
{
  return MEMORY[0x1E0DC9518]();
}

uint64_t sub_1A61223CC()
{
  return MEMORY[0x1E0DC9520]();
}

uint64_t sub_1A61223D8()
{
  return MEMORY[0x1E0DC9528]();
}

uint64_t sub_1A61223E4()
{
  return MEMORY[0x1E0DC9530]();
}

uint64_t sub_1A61223F0()
{
  return MEMORY[0x1E0DC9548]();
}

uint64_t sub_1A61223FC()
{
  return MEMORY[0x1E0DC9550]();
}

uint64_t sub_1A6122408()
{
  return MEMORY[0x1E0DC9558]();
}

uint64_t sub_1A6122414()
{
  return MEMORY[0x1E0DC9560]();
}

uint64_t sub_1A6122420()
{
  return MEMORY[0x1E0DC9568]();
}

uint64_t sub_1A612242C()
{
  return MEMORY[0x1E0DC9570]();
}

uint64_t sub_1A6122438()
{
  return MEMORY[0x1E0DC9578]();
}

uint64_t sub_1A6122444()
{
  return MEMORY[0x1E0DC9580]();
}

uint64_t sub_1A6122450()
{
  return MEMORY[0x1E0DC9588]();
}

uint64_t sub_1A612245C()
{
  return MEMORY[0x1E0DC9590]();
}

uint64_t sub_1A6122468()
{
  return MEMORY[0x1E0DC9598]();
}

uint64_t sub_1A6122474()
{
  return MEMORY[0x1E0DC95A0]();
}

uint64_t sub_1A6122480()
{
  return MEMORY[0x1E0DC95A8]();
}

uint64_t sub_1A612248C()
{
  return MEMORY[0x1E0DC95B0]();
}

uint64_t sub_1A6122498()
{
  return MEMORY[0x1E0DC95B8]();
}

uint64_t sub_1A61224A4()
{
  return MEMORY[0x1E0DC95C0]();
}

uint64_t sub_1A61224B0()
{
  return MEMORY[0x1E0DC95C8]();
}

uint64_t sub_1A61224BC()
{
  return MEMORY[0x1E0DC95D0]();
}

uint64_t sub_1A61224C8()
{
  return MEMORY[0x1E0DC95D8]();
}

uint64_t sub_1A61224D4()
{
  return MEMORY[0x1E0DC95E0]();
}

uint64_t sub_1A61224E0()
{
  return MEMORY[0x1E0DC95E8]();
}

uint64_t sub_1A61224EC()
{
  return MEMORY[0x1E0DC95F0]();
}

uint64_t sub_1A61224F8()
{
  return MEMORY[0x1E0DC95F8]();
}

uint64_t sub_1A6122504()
{
  return MEMORY[0x1E0DC9600]();
}

uint64_t sub_1A6122510()
{
  return MEMORY[0x1E0DC9610]();
}

uint64_t sub_1A612251C()
{
  return MEMORY[0x1E0DC9618]();
}

uint64_t sub_1A6122528()
{
  return MEMORY[0x1E0DC9620]();
}

uint64_t sub_1A6122534()
{
  return MEMORY[0x1E0DC9628]();
}

uint64_t sub_1A6122540()
{
  return MEMORY[0x1E0DC9630]();
}

uint64_t sub_1A612254C()
{
  return MEMORY[0x1E0DC9660]();
}

uint64_t sub_1A6122558()
{
  return MEMORY[0x1E0DC9668]();
}

uint64_t sub_1A6122564()
{
  return MEMORY[0x1E0DC9670]();
}

uint64_t sub_1A6122570()
{
  return MEMORY[0x1E0DC9678]();
}

uint64_t sub_1A612257C()
{
  return MEMORY[0x1E0DC96F0]();
}

uint64_t sub_1A6122588()
{
  return MEMORY[0x1E0DC96F8]();
}

uint64_t sub_1A6122594()
{
  return MEMORY[0x1E0DC9700]();
}

uint64_t sub_1A61225A0()
{
  return MEMORY[0x1E0DC9708]();
}

uint64_t sub_1A61225AC()
{
  return MEMORY[0x1E0DC9710]();
}

uint64_t sub_1A61225B8()
{
  return MEMORY[0x1E0DC9738]();
}

uint64_t sub_1A61225C4()
{
  return MEMORY[0x1E0DC9740]();
}

uint64_t sub_1A61225D0()
{
  return MEMORY[0x1E0DC9748]();
}

uint64_t sub_1A61225DC()
{
  return MEMORY[0x1E0DC9750]();
}

uint64_t sub_1A61225E8()
{
  return MEMORY[0x1E0DC9758]();
}

uint64_t sub_1A61225F4()
{
  return MEMORY[0x1E0DC9760]();
}

uint64_t sub_1A6122600()
{
  return MEMORY[0x1E0DC9768]();
}

uint64_t sub_1A612260C()
{
  return MEMORY[0x1E0DC9778]();
}

uint64_t sub_1A6122618()
{
  return MEMORY[0x1E0DC9780]();
}

uint64_t sub_1A6122624()
{
  return MEMORY[0x1E0DC97B0]();
}

uint64_t sub_1A6122630()
{
  return MEMORY[0x1E0DC97B8]();
}

uint64_t sub_1A612263C()
{
  return MEMORY[0x1E0DC97D0]();
}

uint64_t sub_1A6122648()
{
  return MEMORY[0x1E0DC97D8]();
}

uint64_t sub_1A6122654()
{
  return MEMORY[0x1E0DC97E0]();
}

uint64_t sub_1A6122660()
{
  return MEMORY[0x1E0DC9800]();
}

uint64_t sub_1A612266C()
{
  return MEMORY[0x1E0DC9810]();
}

uint64_t sub_1A6122678()
{
  return MEMORY[0x1E0DC9818]();
}

uint64_t sub_1A6122684()
{
  return MEMORY[0x1E0DC9820]();
}

uint64_t sub_1A6122690()
{
  return MEMORY[0x1E0DC9828]();
}

uint64_t sub_1A612269C()
{
  return MEMORY[0x1E0DC9830]();
}

uint64_t sub_1A61226A8()
{
  return MEMORY[0x1E0DC9838]();
}

uint64_t sub_1A61226B4()
{
  return MEMORY[0x1E0DC9858]();
}

uint64_t sub_1A61226C0()
{
  return MEMORY[0x1E0DC9860]();
}

uint64_t sub_1A61226CC()
{
  return MEMORY[0x1E0DC9868]();
}

uint64_t sub_1A61226D8()
{
  return MEMORY[0x1E0DC9878]();
}

uint64_t sub_1A61226E4()
{
  return MEMORY[0x1E0DC9890]();
}

uint64_t sub_1A61226F0()
{
  return MEMORY[0x1E0DC9898]();
}

uint64_t sub_1A61226FC()
{
  return MEMORY[0x1E0DC98A0]();
}

uint64_t sub_1A6122708()
{
  return MEMORY[0x1E0DC98A8]();
}

uint64_t sub_1A6122714()
{
  return MEMORY[0x1E0DC98C8]();
}

uint64_t sub_1A6122720()
{
  return MEMORY[0x1E0DC98E0]();
}

uint64_t sub_1A612272C()
{
  return MEMORY[0x1E0DC98E8]();
}

uint64_t sub_1A6122738()
{
  return MEMORY[0x1E0DC98F0]();
}

uint64_t sub_1A6122744()
{
  return MEMORY[0x1E0DC9908]();
}

uint64_t sub_1A6122750()
{
  return MEMORY[0x1E0DC9910]();
}

uint64_t sub_1A612275C()
{
  return MEMORY[0x1E0DC9918]();
}

uint64_t sub_1A6122768()
{
  return MEMORY[0x1E0DC9948]();
}

uint64_t sub_1A6122774()
{
  return MEMORY[0x1E0DC9978]();
}

uint64_t sub_1A6122780()
{
  return MEMORY[0x1E0DC9988]();
}

uint64_t sub_1A612278C()
{
  return MEMORY[0x1E0DC9990]();
}

uint64_t sub_1A6122798()
{
  return MEMORY[0x1E0DC9998]();
}

uint64_t sub_1A61227A4()
{
  return MEMORY[0x1E0DC99A0]();
}

uint64_t sub_1A61227B0()
{
  return MEMORY[0x1E0DC99A8]();
}

uint64_t sub_1A61227BC()
{
  return MEMORY[0x1E0DC99B0]();
}

uint64_t sub_1A61227C8()
{
  return MEMORY[0x1E0DC99B8]();
}

uint64_t sub_1A61227D4()
{
  return MEMORY[0x1E0DC99C0]();
}

uint64_t sub_1A61227E0()
{
  return MEMORY[0x1E0DC99C8]();
}

uint64_t sub_1A61227EC()
{
  return MEMORY[0x1E0DC99D0]();
}

uint64_t sub_1A61227F8()
{
  return MEMORY[0x1E0DC99D8]();
}

uint64_t sub_1A6122804()
{
  return MEMORY[0x1E0DC99E8]();
}

uint64_t sub_1A6122810()
{
  return MEMORY[0x1E0DC99F0]();
}

uint64_t sub_1A612281C()
{
  return MEMORY[0x1E0DC99F8]();
}

uint64_t sub_1A6122828()
{
  return MEMORY[0x1E0DC9A00]();
}

uint64_t sub_1A6122834()
{
  return MEMORY[0x1E0DC9A10]();
}

uint64_t sub_1A6122840()
{
  return MEMORY[0x1E0DC9A20]();
}

uint64_t sub_1A612284C()
{
  return MEMORY[0x1E0DC9A28]();
}

uint64_t sub_1A6122858()
{
  return MEMORY[0x1E0DC9AB0]();
}

uint64_t sub_1A6122864()
{
  return MEMORY[0x1E0DC9AC0]();
}

uint64_t sub_1A6122870()
{
  return MEMORY[0x1E0DC9AC8]();
}

uint64_t sub_1A612287C()
{
  return MEMORY[0x1E0DC9AD0]();
}

uint64_t sub_1A6122888()
{
  return MEMORY[0x1E0DC9AD8]();
}

uint64_t sub_1A6122894()
{
  return MEMORY[0x1E0DC9AE0]();
}

uint64_t sub_1A61228A0()
{
  return MEMORY[0x1E0DC9AE8]();
}

uint64_t sub_1A61228AC()
{
  return MEMORY[0x1E0DC9AF0]();
}

uint64_t sub_1A61228B8()
{
  return MEMORY[0x1E0DC9AF8]();
}

uint64_t sub_1A61228C4()
{
  return MEMORY[0x1E0DC9B00]();
}

uint64_t sub_1A61228D0()
{
  return MEMORY[0x1E0DC9B10]();
}

uint64_t sub_1A61228DC()
{
  return MEMORY[0x1E0DC9B18]();
}

uint64_t sub_1A61228E8()
{
  return MEMORY[0x1E0DC9B28]();
}

uint64_t sub_1A61228F4()
{
  return MEMORY[0x1E0DC9B30]();
}

uint64_t sub_1A6122900()
{
  return MEMORY[0x1E0DC9B38]();
}

uint64_t sub_1A612290C()
{
  return MEMORY[0x1E0DC9B40]();
}

uint64_t sub_1A6122918()
{
  return MEMORY[0x1E0DC9B48]();
}

uint64_t sub_1A6122924()
{
  return MEMORY[0x1E0DC9B50]();
}

uint64_t sub_1A6122930()
{
  return MEMORY[0x1E0DC9B58]();
}

uint64_t sub_1A612293C()
{
  return MEMORY[0x1E0DC9B60]();
}

uint64_t sub_1A6122948()
{
  return MEMORY[0x1E0DC9B88]();
}

uint64_t sub_1A6122954()
{
  return MEMORY[0x1E0DC9B98]();
}

uint64_t sub_1A6122960()
{
  return MEMORY[0x1E0DC9BA0]();
}

uint64_t sub_1A612296C()
{
  return MEMORY[0x1E0DC9BA8]();
}

uint64_t sub_1A6122978()
{
  return MEMORY[0x1E0DC9BB0]();
}

uint64_t sub_1A6122984()
{
  return MEMORY[0x1E0DC9BB8]();
}

uint64_t sub_1A6122990()
{
  return MEMORY[0x1E0DC9BC8]();
}

uint64_t sub_1A612299C()
{
  return MEMORY[0x1E0DC9BD0]();
}

uint64_t sub_1A61229A8()
{
  return MEMORY[0x1E0DC9BD8]();
}

uint64_t sub_1A61229B4()
{
  return MEMORY[0x1E0DC9BE0]();
}

uint64_t sub_1A61229C0()
{
  return MEMORY[0x1E0DC9BE8]();
}

uint64_t sub_1A61229CC()
{
  return MEMORY[0x1E0DC9BF0]();
}

uint64_t sub_1A61229D8()
{
  return MEMORY[0x1E0DC9BF8]();
}

uint64_t sub_1A61229E4()
{
  return MEMORY[0x1E0DC9C00]();
}

uint64_t sub_1A61229F0()
{
  return MEMORY[0x1E0DC9C08]();
}

uint64_t sub_1A61229FC()
{
  return MEMORY[0x1E0DC9C10]();
}

uint64_t sub_1A6122A08()
{
  return MEMORY[0x1E0DC9C18]();
}

uint64_t sub_1A6122A14()
{
  return MEMORY[0x1E0DC9C20]();
}

uint64_t sub_1A6122A20()
{
  return MEMORY[0x1E0DC9C30]();
}

uint64_t sub_1A6122A2C()
{
  return MEMORY[0x1E0DC9C38]();
}

uint64_t sub_1A6122A38()
{
  return MEMORY[0x1E0DC9C40]();
}

uint64_t sub_1A6122A44()
{
  return MEMORY[0x1E0DC9C48]();
}

uint64_t sub_1A6122A50()
{
  return MEMORY[0x1E0DC9C50]();
}

uint64_t sub_1A6122A5C()
{
  return MEMORY[0x1E0DC9C58]();
}

uint64_t sub_1A6122A68()
{
  return MEMORY[0x1E0DC9C60]();
}

uint64_t sub_1A6122A74()
{
  return MEMORY[0x1E0DC9C68]();
}

uint64_t sub_1A6122A80()
{
  return MEMORY[0x1E0DC9C70]();
}

uint64_t sub_1A6122A8C()
{
  return MEMORY[0x1E0DC9C78]();
}

uint64_t sub_1A6122A98()
{
  return MEMORY[0x1E0DC9C80]();
}

uint64_t sub_1A6122AA4()
{
  return MEMORY[0x1E0DC9C88]();
}

uint64_t sub_1A6122AB0()
{
  return MEMORY[0x1E0DC9C90]();
}

uint64_t sub_1A6122ABC()
{
  return MEMORY[0x1E0DC9C98]();
}

uint64_t sub_1A6122AC8()
{
  return MEMORY[0x1E0DC9CA0]();
}

uint64_t sub_1A6122AD4()
{
  return MEMORY[0x1E0DC9CA8]();
}

uint64_t sub_1A6122AE0()
{
  return MEMORY[0x1E0DC9CB0]();
}

uint64_t sub_1A6122AEC()
{
  return MEMORY[0x1E0DC9CB8]();
}

uint64_t sub_1A6122AF8()
{
  return MEMORY[0x1E0DC9CC0]();
}

uint64_t sub_1A6122B04()
{
  return MEMORY[0x1E0DC9CC8]();
}

uint64_t sub_1A6122B10()
{
  return MEMORY[0x1E0DC9CD0]();
}

uint64_t sub_1A6122B1C()
{
  return MEMORY[0x1E0DC9CD8]();
}

uint64_t sub_1A6122B28()
{
  return MEMORY[0x1E0DC9CE0]();
}

uint64_t sub_1A6122B34()
{
  return MEMORY[0x1E0DC9CE8]();
}

uint64_t sub_1A6122B40()
{
  return MEMORY[0x1E0DC9D18]();
}

uint64_t sub_1A6122B4C()
{
  return MEMORY[0x1E0DC9D20]();
}

uint64_t sub_1A6122B58()
{
  return MEMORY[0x1E0DC9D38]();
}

uint64_t sub_1A6122B64()
{
  return MEMORY[0x1E0DC9D40]();
}

uint64_t sub_1A6122B70()
{
  return MEMORY[0x1E0DC9D48]();
}

uint64_t sub_1A6122B7C()
{
  return MEMORY[0x1E0DC9D58]();
}

uint64_t sub_1A6122B88()
{
  return MEMORY[0x1E0DC9D60]();
}

uint64_t sub_1A6122B94()
{
  return MEMORY[0x1E0DC9D68]();
}

uint64_t sub_1A6122BA0()
{
  return MEMORY[0x1E0DC9D70]();
}

uint64_t sub_1A6122BAC()
{
  return MEMORY[0x1E0DC9D78]();
}

uint64_t sub_1A6122BB8()
{
  return MEMORY[0x1E0DC9D88]();
}

uint64_t sub_1A6122BC4()
{
  return MEMORY[0x1E0DC9D90]();
}

uint64_t sub_1A6122BD0()
{
  return MEMORY[0x1E0DC9D98]();
}

uint64_t sub_1A6122BDC()
{
  return MEMORY[0x1E0DC9DA0]();
}

uint64_t sub_1A6122BE8()
{
  return MEMORY[0x1E0DC9DA8]();
}

uint64_t sub_1A6122BF4()
{
  return MEMORY[0x1E0DC9DB0]();
}

uint64_t sub_1A6122C00()
{
  return MEMORY[0x1E0DC9DB8]();
}

uint64_t sub_1A6122C0C()
{
  return MEMORY[0x1E0DC9DC0]();
}

uint64_t sub_1A6122C18()
{
  return MEMORY[0x1E0DC9DC8]();
}

uint64_t sub_1A6122C24()
{
  return MEMORY[0x1E0DC9DD0]();
}

uint64_t sub_1A6122C30()
{
  return MEMORY[0x1E0DC9DD8]();
}

uint64_t sub_1A6122C3C()
{
  return MEMORY[0x1E0DC9DE0]();
}

uint64_t sub_1A6122C48()
{
  return MEMORY[0x1E0DC9DE8]();
}

uint64_t sub_1A6122C54()
{
  return MEMORY[0x1E0DC9DF0]();
}

uint64_t sub_1A6122C60()
{
  return MEMORY[0x1E0DC9DF8]();
}

uint64_t sub_1A6122C6C()
{
  return MEMORY[0x1E0DC9E00]();
}

uint64_t sub_1A6122C78()
{
  return MEMORY[0x1E0DC9E08]();
}

uint64_t sub_1A6122C84()
{
  return MEMORY[0x1E0DC9E10]();
}

uint64_t sub_1A6122C90()
{
  return MEMORY[0x1E0DC9E18]();
}

uint64_t sub_1A6122C9C()
{
  return MEMORY[0x1E0DC9E28]();
}

uint64_t sub_1A6122CA8()
{
  return MEMORY[0x1E0DC9E30]();
}

uint64_t sub_1A6122CB4()
{
  return MEMORY[0x1E0DC9E38]();
}

uint64_t sub_1A6122CC0()
{
  return MEMORY[0x1E0DC9E40]();
}

uint64_t sub_1A6122CCC()
{
  return MEMORY[0x1E0DC9E50]();
}

uint64_t sub_1A6122CD8()
{
  return MEMORY[0x1E0DC9E58]();
}

uint64_t sub_1A6122CE4()
{
  return MEMORY[0x1E0DC9E60]();
}

uint64_t sub_1A6122CF0()
{
  return MEMORY[0x1E0DC9FA8]();
}

uint64_t sub_1A6122CFC()
{
  return MEMORY[0x1E0DC9FB8]();
}

uint64_t sub_1A6122D08()
{
  return MEMORY[0x1E0DC9FC8]();
}

uint64_t sub_1A6122D14()
{
  return MEMORY[0x1E0DC9FD0]();
}

uint64_t sub_1A6122D20()
{
  return MEMORY[0x1E0DC9FF8]();
}

uint64_t sub_1A6122D2C()
{
  return MEMORY[0x1E0DCA020]();
}

uint64_t sub_1A6122D38()
{
  return MEMORY[0x1E0DCA028]();
}

uint64_t sub_1A6122D44()
{
  return MEMORY[0x1E0DCA030]();
}

uint64_t sub_1A6122D50()
{
  return MEMORY[0x1E0DCA038]();
}

uint64_t sub_1A6122D5C()
{
  return MEMORY[0x1E0DCA048]();
}

uint64_t sub_1A6122D68()
{
  return MEMORY[0x1E0DCA058]();
}

uint64_t sub_1A6122D74()
{
  return MEMORY[0x1E0DCA060]();
}

uint64_t sub_1A6122D80()
{
  return MEMORY[0x1E0DCA068]();
}

uint64_t sub_1A6122D8C()
{
  return MEMORY[0x1E0DCA070]();
}

uint64_t sub_1A6122D98()
{
  return MEMORY[0x1E0DCA078]();
}

uint64_t sub_1A6122DA4()
{
  return MEMORY[0x1E0DCA080]();
}

uint64_t sub_1A6122DB0()
{
  return MEMORY[0x1E0DCA088]();
}

uint64_t sub_1A6122DBC()
{
  return MEMORY[0x1E0DCA090]();
}

uint64_t sub_1A6122DC8()
{
  return MEMORY[0x1E0DCA098]();
}

uint64_t sub_1A6122DD4()
{
  return MEMORY[0x1E0DCA0A0]();
}

uint64_t sub_1A6122DE0()
{
  return MEMORY[0x1E0DCA0A8]();
}

uint64_t sub_1A6122DEC()
{
  return MEMORY[0x1E0DCA0B0]();
}

uint64_t sub_1A6122DF8()
{
  return MEMORY[0x1E0DCA0B8]();
}

uint64_t sub_1A6122E04()
{
  return MEMORY[0x1E0DCA0C0]();
}

uint64_t sub_1A6122E10()
{
  return MEMORY[0x1E0DCA0C8]();
}

uint64_t sub_1A6122E1C()
{
  return MEMORY[0x1E0DCA0D0]();
}

uint64_t sub_1A6122E28()
{
  return MEMORY[0x1E0DCA0D8]();
}

uint64_t sub_1A6122E34()
{
  return MEMORY[0x1E0DCA0E8]();
}

uint64_t sub_1A6122E40()
{
  return MEMORY[0x1E0DCA0F0]();
}

uint64_t sub_1A6122E4C()
{
  return MEMORY[0x1E0DCA100]();
}

uint64_t sub_1A6122E58()
{
  return MEMORY[0x1E0DCA108]();
}

uint64_t sub_1A6122E64()
{
  return MEMORY[0x1E0DCA110]();
}

uint64_t sub_1A6122E70()
{
  return MEMORY[0x1E0DCA118]();
}

uint64_t sub_1A6122E7C()
{
  return MEMORY[0x1E0DCA128]();
}

uint64_t sub_1A6122E88()
{
  return MEMORY[0x1E0DCA130]();
}

uint64_t sub_1A6122E94()
{
  return MEMORY[0x1E0DCA148]();
}

uint64_t sub_1A6122EA0()
{
  return MEMORY[0x1E0DCA150]();
}

uint64_t sub_1A6122EAC()
{
  return MEMORY[0x1E0DCA158]();
}

uint64_t sub_1A6122EB8()
{
  return MEMORY[0x1E0DCA160]();
}

uint64_t sub_1A6122EC4()
{
  return MEMORY[0x1E0DCA168]();
}

uint64_t sub_1A6122ED0()
{
  return MEMORY[0x1E0DCA170]();
}

uint64_t sub_1A6122EDC()
{
  return MEMORY[0x1E0DCA178]();
}

uint64_t sub_1A6122EE8()
{
  return MEMORY[0x1E0DCA180]();
}

uint64_t sub_1A6122EF4()
{
  return MEMORY[0x1E0DCA188]();
}

uint64_t sub_1A6122F00()
{
  return MEMORY[0x1E0DCA190]();
}

uint64_t sub_1A6122F0C()
{
  return MEMORY[0x1E0DCA198]();
}

uint64_t sub_1A6122F18()
{
  return MEMORY[0x1E0DCA1A0]();
}

uint64_t sub_1A6122F24()
{
  return MEMORY[0x1E0DCA1B0]();
}

uint64_t sub_1A6122F30()
{
  return MEMORY[0x1E0DCA1B8]();
}

uint64_t sub_1A6122F3C()
{
  return MEMORY[0x1E0DCA1F0]();
}

uint64_t sub_1A6122F48()
{
  return MEMORY[0x1E0DCA200]();
}

uint64_t sub_1A6122F54()
{
  return MEMORY[0x1E0DCA208]();
}

uint64_t sub_1A6122F60()
{
  return MEMORY[0x1E0DCA210]();
}

uint64_t sub_1A6122F6C()
{
  return MEMORY[0x1E0DCA218]();
}

uint64_t sub_1A6122F78()
{
  return MEMORY[0x1E0DCA220]();
}

uint64_t sub_1A6122F84()
{
  return MEMORY[0x1E0DCA228]();
}

uint64_t sub_1A6122F90()
{
  return MEMORY[0x1E0DCA230]();
}

uint64_t sub_1A6122F9C()
{
  return MEMORY[0x1E0DCA238]();
}

uint64_t sub_1A6122FA8()
{
  return MEMORY[0x1E0DCA240]();
}

uint64_t sub_1A6122FB4()
{
  return MEMORY[0x1E0DCA248]();
}

uint64_t sub_1A6122FC0()
{
  return MEMORY[0x1E0DCA250]();
}

uint64_t sub_1A6122FCC()
{
  return MEMORY[0x1E0DCA258]();
}

uint64_t sub_1A6122FD8()
{
  return MEMORY[0x1E0DCA260]();
}

uint64_t sub_1A6122FE4()
{
  return MEMORY[0x1E0DCA268]();
}

uint64_t sub_1A6122FF0()
{
  return MEMORY[0x1E0DCA270]();
}

uint64_t sub_1A6122FFC()
{
  return MEMORY[0x1E0DCA278]();
}

uint64_t sub_1A6123008()
{
  return MEMORY[0x1E0DCA280]();
}

uint64_t sub_1A6123014()
{
  return MEMORY[0x1E0DCA288]();
}

uint64_t sub_1A6123020()
{
  return MEMORY[0x1E0DCA298]();
}

uint64_t sub_1A612302C()
{
  return MEMORY[0x1E0DCA2A0]();
}

uint64_t sub_1A6123038()
{
  return MEMORY[0x1E0DCA2B0]();
}

uint64_t sub_1A6123044()
{
  return MEMORY[0x1E0DCA2B8]();
}

uint64_t sub_1A6123050()
{
  return MEMORY[0x1E0DCA2E8]();
}

uint64_t sub_1A612305C()
{
  return MEMORY[0x1E0DCA338]();
}

uint64_t sub_1A6123068()
{
  return MEMORY[0x1E0DCA348]();
}

uint64_t sub_1A6123074()
{
  return MEMORY[0x1E0DCA350]();
}

uint64_t sub_1A6123080()
{
  return MEMORY[0x1E0DCA370]();
}

uint64_t sub_1A612308C()
{
  return MEMORY[0x1E0DCA378]();
}

uint64_t sub_1A6123098()
{
  return MEMORY[0x1E0DCA398]();
}

uint64_t sub_1A61230A4()
{
  return MEMORY[0x1E0DCA3A8]();
}

uint64_t sub_1A61230B0()
{
  return MEMORY[0x1E0DCA3B0]();
}

uint64_t sub_1A61230BC()
{
  return MEMORY[0x1E0DCA3C0]();
}

uint64_t sub_1A61230C8()
{
  return MEMORY[0x1E0DCA3C8]();
}

uint64_t sub_1A61230D4()
{
  return MEMORY[0x1E0DCA3D0]();
}

uint64_t sub_1A61230E0()
{
  return MEMORY[0x1E0DCA3F0]();
}

uint64_t sub_1A61230EC()
{
  return MEMORY[0x1E0DCA3F8]();
}

uint64_t sub_1A61230F8()
{
  return MEMORY[0x1E0DCA400]();
}

uint64_t sub_1A6123104()
{
  return MEMORY[0x1E0DCA430]();
}

uint64_t sub_1A6123110()
{
  return MEMORY[0x1E0DCA438]();
}

uint64_t sub_1A612311C()
{
  return MEMORY[0x1E0DCA440]();
}

uint64_t sub_1A6123128()
{
  return MEMORY[0x1E0DCA450]();
}

uint64_t sub_1A6123134()
{
  return MEMORY[0x1E0DCA4E8]();
}

uint64_t sub_1A6123140()
{
  return MEMORY[0x1E0DCA530]();
}

uint64_t sub_1A612314C()
{
  return MEMORY[0x1E0DCA560]();
}

uint64_t sub_1A6123158()
{
  return MEMORY[0x1E0DCA600]();
}

uint64_t sub_1A6123164()
{
  return MEMORY[0x1E0DCA608]();
}

uint64_t sub_1A6123170()
{
  return MEMORY[0x1E0DCA610]();
}

uint64_t sub_1A612317C()
{
  return MEMORY[0x1E0DCA618]();
}

uint64_t sub_1A6123188()
{
  return MEMORY[0x1E0DCA638]();
}

uint64_t sub_1A6123194()
{
  return MEMORY[0x1E0DCA640]();
}

uint64_t sub_1A61231A0()
{
  return MEMORY[0x1E0DCA650]();
}

uint64_t sub_1A61231AC()
{
  return MEMORY[0x1E0DCA658]();
}

uint64_t sub_1A61231B8()
{
  return MEMORY[0x1E0DCA660]();
}

uint64_t sub_1A61231C4()
{
  return MEMORY[0x1E0DCA668]();
}

uint64_t sub_1A61231D0()
{
  return MEMORY[0x1E0DCA6A0]();
}

uint64_t sub_1A61231DC()
{
  return MEMORY[0x1E0DCA6F0]();
}

uint64_t sub_1A61231E8()
{
  return MEMORY[0x1E0DCA6F8]();
}

uint64_t sub_1A61231F4()
{
  return MEMORY[0x1E0DCA700]();
}

uint64_t sub_1A6123200()
{
  return MEMORY[0x1E0DCA718]();
}

uint64_t sub_1A612320C()
{
  return MEMORY[0x1E0DCA720]();
}

uint64_t sub_1A6123218()
{
  return MEMORY[0x1E0DCA728]();
}

uint64_t sub_1A6123224()
{
  return MEMORY[0x1E0DCA730]();
}

uint64_t sub_1A6123230()
{
  return MEMORY[0x1E0DCA738]();
}

uint64_t sub_1A612323C()
{
  return MEMORY[0x1E0DCA740]();
}

uint64_t sub_1A6123248()
{
  return MEMORY[0x1E0DCA748]();
}

uint64_t sub_1A6123254()
{
  return MEMORY[0x1E0DCA758]();
}

uint64_t sub_1A6123260()
{
  return MEMORY[0x1E0DCA760]();
}

uint64_t sub_1A612326C()
{
  return MEMORY[0x1E0DCA778]();
}

uint64_t sub_1A6123278()
{
  return MEMORY[0x1E0DCA780]();
}

uint64_t sub_1A6123284()
{
  return MEMORY[0x1E0DCA788]();
}

uint64_t sub_1A6123290()
{
  return MEMORY[0x1E0DCA798]();
}

uint64_t sub_1A612329C()
{
  return MEMORY[0x1E0DCA7A0]();
}

uint64_t sub_1A61232A8()
{
  return MEMORY[0x1E0DCA7D8]();
}

uint64_t sub_1A61232B4()
{
  return MEMORY[0x1E0DCA7E8]();
}

uint64_t sub_1A61232C0()
{
  return MEMORY[0x1E0DCA7F0]();
}

uint64_t sub_1A61232CC()
{
  return MEMORY[0x1E0DCA7F8]();
}

uint64_t sub_1A61232D8()
{
  return MEMORY[0x1E0DCA800]();
}

uint64_t sub_1A61232E4()
{
  return MEMORY[0x1E0DCA808]();
}

uint64_t sub_1A61232F0()
{
  return MEMORY[0x1E0DCA810]();
}

uint64_t sub_1A61232FC()
{
  return MEMORY[0x1E0DCA828]();
}

uint64_t sub_1A6123308()
{
  return MEMORY[0x1E0DCA830]();
}

uint64_t sub_1A6123314()
{
  return MEMORY[0x1E0DCA840]();
}

uint64_t sub_1A6123320()
{
  return MEMORY[0x1E0DCA850]();
}

uint64_t sub_1A612332C()
{
  return MEMORY[0x1E0DCA858]();
}

uint64_t sub_1A6123338()
{
  return MEMORY[0x1E0DCA878]();
}

uint64_t sub_1A6123344()
{
  return MEMORY[0x1E0DCA880]();
}

uint64_t sub_1A6123350()
{
  return MEMORY[0x1E0DCA890]();
}

uint64_t sub_1A612335C()
{
  return MEMORY[0x1E0DCA898]();
}

uint64_t sub_1A6123368()
{
  return MEMORY[0x1E0DCA8A0]();
}

uint64_t sub_1A6123374()
{
  return MEMORY[0x1E0DCA8A8]();
}

uint64_t sub_1A6123380()
{
  return MEMORY[0x1E0DCA8B8]();
}

uint64_t sub_1A612338C()
{
  return MEMORY[0x1E0DCA8C0]();
}

uint64_t sub_1A6123398()
{
  return MEMORY[0x1E0DCA8C8]();
}

uint64_t sub_1A61233A4()
{
  return MEMORY[0x1E0DCA8D0]();
}

uint64_t sub_1A61233B0()
{
  return MEMORY[0x1E0DCA8D8]();
}

uint64_t sub_1A61233BC()
{
  return MEMORY[0x1E0DCA8E0]();
}

uint64_t sub_1A61233C8()
{
  return MEMORY[0x1E0DCA8E8]();
}

uint64_t sub_1A61233D4()
{
  return MEMORY[0x1E0DCA8F0]();
}

uint64_t sub_1A61233E0()
{
  return MEMORY[0x1E0DCA948]();
}

uint64_t sub_1A61233EC()
{
  return MEMORY[0x1E0DCA9C8]();
}

uint64_t sub_1A61233F8()
{
  return MEMORY[0x1E0DCA9D0]();
}

uint64_t sub_1A6123404()
{
  return MEMORY[0x1E0DCA9D8]();
}

uint64_t sub_1A6123410()
{
  return MEMORY[0x1E0DCA9E0]();
}

uint64_t sub_1A612341C()
{
  return MEMORY[0x1E0DCA9E8]();
}

uint64_t sub_1A6123428()
{
  return MEMORY[0x1E0DCA9F0]();
}

uint64_t sub_1A6123434()
{
  return MEMORY[0x1E0DCA9F8]();
}

uint64_t sub_1A6123440()
{
  return MEMORY[0x1E0DCAA00]();
}

uint64_t sub_1A612344C()
{
  return MEMORY[0x1E0DCAA20]();
}

uint64_t sub_1A6123458()
{
  return MEMORY[0x1E0DCAA30]();
}

uint64_t sub_1A6123464()
{
  return MEMORY[0x1E0DCAA38]();
}

uint64_t sub_1A6123470()
{
  return MEMORY[0x1E0DCAA40]();
}

uint64_t sub_1A612347C()
{
  return MEMORY[0x1E0DCAA70]();
}

uint64_t sub_1A6123488()
{
  return MEMORY[0x1E0DCAAA8]();
}

uint64_t sub_1A6123494()
{
  return MEMORY[0x1E0DCAAF0]();
}

uint64_t sub_1A61234A0()
{
  return MEMORY[0x1E0DCAB00]();
}

uint64_t sub_1A61234AC()
{
  return MEMORY[0x1E0DCAB08]();
}

uint64_t sub_1A61234B8()
{
  return MEMORY[0x1E0DCAB10]();
}

uint64_t sub_1A61234C4()
{
  return MEMORY[0x1E0DCAB20]();
}

uint64_t sub_1A61234D0()
{
  return MEMORY[0x1E0DCAB28]();
}

uint64_t sub_1A61234DC()
{
  return MEMORY[0x1E0DCAB30]();
}

uint64_t sub_1A61234E8()
{
  return MEMORY[0x1E0DCAB38]();
}

uint64_t sub_1A61234F4()
{
  return MEMORY[0x1E0DCAB48]();
}

uint64_t sub_1A6123500()
{
  return MEMORY[0x1E0DCAB50]();
}

uint64_t sub_1A612350C()
{
  return MEMORY[0x1E0DCAB58]();
}

uint64_t sub_1A6123518()
{
  return MEMORY[0x1E0DCAB60]();
}

uint64_t sub_1A6123524()
{
  return MEMORY[0x1E0DCAB70]();
}

uint64_t sub_1A6123530()
{
  return MEMORY[0x1E0DCAB78]();
}

uint64_t sub_1A612353C()
{
  return MEMORY[0x1E0DCAB80]();
}

uint64_t sub_1A6123548()
{
  return MEMORY[0x1E0DCAB88]();
}

uint64_t sub_1A6123554()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1A6123560()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1A612356C()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1A6123578()
{
  return MEMORY[0x1E0DB2920]();
}

uint64_t sub_1A6123584()
{
  return MEMORY[0x1E0DB2928]();
}

uint64_t sub_1A6123590()
{
  return MEMORY[0x1E0DB2930]();
}

uint64_t sub_1A612359C()
{
  return MEMORY[0x1E0DB2938]();
}

uint64_t sub_1A61235A8()
{
  return MEMORY[0x1E0DB2940]();
}

uint64_t sub_1A61235B4()
{
  return MEMORY[0x1E0DB2948]();
}

uint64_t sub_1A61235C0()
{
  return MEMORY[0x1E0DB2958]();
}

uint64_t sub_1A61235CC()
{
  return MEMORY[0x1E0DCAB90]();
}

uint64_t sub_1A61235D8()
{
  return MEMORY[0x1E0DB2B10]();
}

uint64_t sub_1A61235E4()
{
  return MEMORY[0x1E0DB2B98]();
}

uint64_t sub_1A61235F0()
{
  return MEMORY[0x1E0DB2BB0]();
}

uint64_t sub_1A61235FC()
{
  return MEMORY[0x1E0DB2BD8]();
}

uint64_t sub_1A6123608()
{
  return MEMORY[0x1E0DB2BE0]();
}

uint64_t sub_1A6123614()
{
  return MEMORY[0x1E0DB2BF0]();
}

uint64_t sub_1A6123620()
{
  return MEMORY[0x1E0DB2BF8]();
}

uint64_t sub_1A612362C()
{
  return MEMORY[0x1E0DB2C08]();
}

uint64_t sub_1A6123638()
{
  return MEMORY[0x1E0DB2C48]();
}

uint64_t sub_1A6123644()
{
  return MEMORY[0x1E0DB2C50]();
}

uint64_t sub_1A6123650()
{
  return MEMORY[0x1E0DB2C58]();
}

uint64_t sub_1A612365C()
{
  return MEMORY[0x1E0DB2C60]();
}

uint64_t sub_1A6123668()
{
  return MEMORY[0x1E0DB2C78]();
}

uint64_t sub_1A6123674()
{
  return MEMORY[0x1E0DB2C98]();
}

uint64_t sub_1A6123680()
{
  return MEMORY[0x1E0DB2CA0]();
}

uint64_t sub_1A612368C()
{
  return MEMORY[0x1E0DB2CD8]();
}

uint64_t sub_1A6123698()
{
  return MEMORY[0x1E0DB2D08]();
}

uint64_t sub_1A61236A4()
{
  return MEMORY[0x1E0DB2D28]();
}

uint64_t sub_1A61236B0()
{
  return MEMORY[0x1E0DB2D60]();
}

uint64_t sub_1A61236BC()
{
  return MEMORY[0x1E0DB2D90]();
}

uint64_t sub_1A61236C8()
{
  return MEMORY[0x1E0DCAB98]();
}

uint64_t sub_1A61236D4()
{
  return MEMORY[0x1E0DB2DB8]();
}

uint64_t sub_1A61236E0()
{
  return MEMORY[0x1E0DB2DE0]();
}

uint64_t sub_1A61236EC()
{
  return MEMORY[0x1E0DCABA0]();
}

uint64_t sub_1A61236F8()
{
  return MEMORY[0x1E0DCABA8]();
}

uint64_t sub_1A6123704()
{
  return MEMORY[0x1E0DB2E08]();
}

uint64_t sub_1A6123710()
{
  return MEMORY[0x1E0DB2E30]();
}

uint64_t sub_1A612371C()
{
  return MEMORY[0x1E0DB2E40]();
}

uint64_t sub_1A6123728()
{
  return MEMORY[0x1E0DB2E88]();
}

uint64_t sub_1A6123734()
{
  return MEMORY[0x1E0DB2EB8]();
}

uint64_t sub_1A6123740()
{
  return MEMORY[0x1E0CCE188]();
}

uint64_t sub_1A612374C()
{
  return MEMORY[0x1E0CCE1C0]();
}

uint64_t sub_1A6123758()
{
  return MEMORY[0x1E0CCE1D0]();
}

uint64_t sub_1A6123764()
{
  return MEMORY[0x1E0CCE1E8]();
}

uint64_t sub_1A6123770()
{
  return MEMORY[0x1E0DE9E78]();
}

uint64_t sub_1A612377C()
{
  return MEMORY[0x1E0DE9FF8]();
}

uint64_t sub_1A6123788()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_1A6123794()
{
  return MEMORY[0x1E0DEA1C0]();
}

uint64_t sub_1A61237A0()
{
  return MEMORY[0x1E0DEA360]();
}

uint64_t sub_1A61237AC()
{
  return MEMORY[0x1E0DEA3C0]();
}

uint64_t sub_1A61237B8()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1A61237C4()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1A61237D0()
{
  return MEMORY[0x1E0CB1950]();
}

uint64_t sub_1A61237DC()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1A61237E8()
{
  return MEMORY[0x1E0CB19C0]();
}

uint64_t sub_1A61237F4()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1A6123800()
{
  return MEMORY[0x1E0DEA610]();
}

uint64_t sub_1A612380C()
{
  return MEMORY[0x1E0DEA618]();
}

uint64_t sub_1A6123818()
{
  return MEMORY[0x1E0DEA658]();
}

uint64_t sub_1A6123824()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1A6123830()
{
  return MEMORY[0x1E0DEA7B8]();
}

uint64_t sub_1A612383C()
{
  return MEMORY[0x1E0DEA7D0]();
}

uint64_t sub_1A6123848()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1A6123854()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1A6123860()
{
  return MEMORY[0x1E0DEA940]();
}

uint64_t sub_1A612386C()
{
  return MEMORY[0x1E0DEAA40]();
}

uint64_t sub_1A6123878()
{
  return MEMORY[0x1E0DEAA50]();
}

uint64_t sub_1A6123884()
{
  return MEMORY[0x1E0DEAAB8]();
}

uint64_t sub_1A6123890()
{
  return MEMORY[0x1E0DEAAD8]();
}

uint64_t sub_1A612389C()
{
  return MEMORY[0x1E0DEACA0]();
}

uint64_t sub_1A61238A8()
{
  return MEMORY[0x1E0DEACB8]();
}

uint64_t sub_1A61238B4()
{
  return MEMORY[0x1E0DEAD18]();
}

uint64_t sub_1A61238C0()
{
  return MEMORY[0x1E0DEAD30]();
}

uint64_t sub_1A61238CC()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1A61238D8()
{
  return MEMORY[0x1E0DEADA8]();
}

uint64_t sub_1A61238E4()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_1A61238F0()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t sub_1A61238FC()
{
  return MEMORY[0x1E0DEAE98]();
}

uint64_t sub_1A6123908()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_1A6123914()
{
  return MEMORY[0x1E0DEAEF0]();
}

uint64_t sub_1A6123920()
{
  return MEMORY[0x1E0DEAF78]();
}

uint64_t sub_1A612392C()
{
  return MEMORY[0x1E0DF05C8]();
}

uint64_t sub_1A6123938()
{
  return MEMORY[0x1E0DF05D0]();
}

uint64_t sub_1A6123944()
{
  return MEMORY[0x1E0DF05D8]();
}

uint64_t sub_1A6123950()
{
  return MEMORY[0x1E0DEB4F8]();
}

uint64_t sub_1A612395C()
{
  return MEMORY[0x1E0DEB500]();
}

uint64_t sub_1A6123968()
{
  return MEMORY[0x1E0DEB508]();
}

uint64_t sub_1A6123974()
{
  return MEMORY[0x1E0DEB510]();
}

uint64_t sub_1A6123980()
{
  return MEMORY[0x1E0DEB518]();
}

uint64_t sub_1A612398C()
{
  return MEMORY[0x1E0DEB520]();
}

uint64_t sub_1A6123998()
{
  return MEMORY[0x1E0DEB5C8]();
}

uint64_t sub_1A61239A4()
{
  return MEMORY[0x1E0DEB5E8]();
}

uint64_t sub_1A61239B0()
{
  return MEMORY[0x1E0DEB5F0]();
}

uint64_t sub_1A61239BC()
{
  return MEMORY[0x1E0DEB5F8]();
}

uint64_t sub_1A61239C8()
{
  return MEMORY[0x1E0DEB600]();
}

uint64_t sub_1A61239D4()
{
  return MEMORY[0x1E0DEB608]();
}

uint64_t sub_1A61239E0()
{
  return MEMORY[0x1E0DEB618]();
}

uint64_t sub_1A61239EC()
{
  return MEMORY[0x1E0DEB620]();
}

uint64_t sub_1A61239F8()
{
  return MEMORY[0x1E0DEB660]();
}

uint64_t sub_1A6123A04()
{
  return MEMORY[0x1E0DEB6C0]();
}

uint64_t sub_1A6123A10()
{
  return MEMORY[0x1E0DEB700]();
}

uint64_t sub_1A6123A1C()
{
  return MEMORY[0x1E0DCABC0]();
}

uint64_t sub_1A6123A28()
{
  return MEMORY[0x1E0CB1D80]();
}

uint64_t sub_1A6123A34()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1A6123A40()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1A6123A4C()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1A6123A58()
{
  return MEMORY[0x1E0DCABF8]();
}

uint64_t sub_1A6123A64()
{
  return MEMORY[0x1E0DCAC00]();
}

uint64_t sub_1A6123A70()
{
  return MEMORY[0x1E0DCAC38]();
}

uint64_t sub_1A6123A7C()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1A6123A88()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1A6123A94()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1A6123AA0()
{
  return MEMORY[0x1E0CB2420]();
}

uint64_t sub_1A6123AAC()
{
  return MEMORY[0x1E0CB24A8]();
}

uint64_t sub_1A6123AB8()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1A6123AC4()
{
  return MEMORY[0x1E0DEBF30]();
}

uint64_t sub_1A6123AD0()
{
  return MEMORY[0x1E0DEBF58]();
}

uint64_t sub_1A6123ADC()
{
  return MEMORY[0x1E0DEBFC8]();
}

uint64_t sub_1A6123AE8()
{
  return MEMORY[0x1E0DEC010]();
}

uint64_t sub_1A6123AF4()
{
  return MEMORY[0x1E0DEC050]();
}

uint64_t sub_1A6123B00()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1A6123B0C()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_1A6123B18()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1A6123B24()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1A6123B30()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1A6123B3C()
{
  return MEMORY[0x1E0DEC470]();
}

uint64_t sub_1A6123B48()
{
  return MEMORY[0x1E0DEC498]();
}

uint64_t sub_1A6123B54()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1A6123B60()
{
  return MEMORY[0x1E0DEC8F8]();
}

uint64_t sub_1A6123B6C()
{
  return MEMORY[0x1E0DECAE0]();
}

uint64_t sub_1A6123B78()
{
  return MEMORY[0x1E0DECB00]();
}

uint64_t sub_1A6123B84()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1A6123B90()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1A6123B9C()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1A6123BA8()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1A6123BB4()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1A6123BC0()
{
  return MEMORY[0x1E0DECF38]();
}

uint64_t sub_1A6123BCC()
{
  return MEMORY[0x1E0DECF40]();
}

uint64_t sub_1A6123BD8()
{
  return MEMORY[0x1E0DB53C0]();
}

uint64_t sub_1A6123BE4()
{
  return MEMORY[0x1E0DB53C8]();
}

uint64_t sub_1A6123BF0()
{
  return MEMORY[0x1E0DECF58]();
}

uint64_t sub_1A6123BFC()
{
  return MEMORY[0x1E0DECF88]();
}

uint64_t sub_1A6123C08()
{
  return MEMORY[0x1E0DECFC0]();
}

uint64_t sub_1A6123C14()
{
  return MEMORY[0x1E0DECFC8]();
}

uint64_t sub_1A6123C20()
{
  return MEMORY[0x1E0DECFD0]();
}

uint64_t sub_1A6123C2C()
{
  return MEMORY[0x1E0DECFD8]();
}

uint64_t sub_1A6123C38()
{
  return MEMORY[0x1E0DECFE0]();
}

uint64_t sub_1A6123C44()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t sub_1A6123C50()
{
  return MEMORY[0x1E0DED038]();
}

uint64_t sub_1A6123C5C()
{
  return MEMORY[0x1E0DED048]();
}

uint64_t sub_1A6123C68()
{
  return MEMORY[0x1E0DED070]();
}

uint64_t sub_1A6123C74()
{
  return MEMORY[0x1E0DED090]();
}

uint64_t sub_1A6123C80()
{
  return MEMORY[0x1E0DED0C0]();
}

uint64_t sub_1A6123C8C()
{
  return MEMORY[0x1E0DED0F0]();
}

uint64_t sub_1A6123C98()
{
  return MEMORY[0x1E0DED0F8]();
}

uint64_t sub_1A6123CA4()
{
  return MEMORY[0x1E0DED100]();
}

uint64_t sub_1A6123CB0()
{
  return MEMORY[0x1E0DED108]();
}

uint64_t sub_1A6123CBC()
{
  return MEMORY[0x1E0DED110]();
}

uint64_t sub_1A6123CC8()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_1A6123CD4()
{
  return MEMORY[0x1E0DED170]();
}

uint64_t sub_1A6123CE0()
{
  return MEMORY[0x1E0DED1B0]();
}

uint64_t sub_1A6123CEC()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1A6123CF8()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1A6123D04()
{
  return MEMORY[0x1E0DED998]();
}

uint64_t sub_1A6123D10()
{
  return MEMORY[0x1E0DF0EC0]();
}

uint64_t sub_1A6123D1C()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1A6123D28()
{
  return MEMORY[0x1E0DCAC40]();
}

uint64_t sub_1A6123D34()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1A6123D40()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1A6123D4C()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1A6123D58()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1A6123D64()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1A6123D70()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1A6123D7C()
{
  return MEMORY[0x1E0DEDF18]();
}

uint64_t sub_1A6123D88()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1A6123D94()
{
  return MEMORY[0x1E0DEDFC8]();
}

uint64_t sub_1A6123DA0()
{
  return MEMORY[0x1E0DEDFF0]();
}

uint64_t sub_1A6123DAC()
{
  return MEMORY[0x1E0DEE020]();
}

uint64_t sub_1A6123DB8()
{
  return MEMORY[0x1E0DEE030]();
}

uint64_t sub_1A6123DC4()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_1A6123DD0()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_1A6123DDC()
{
  return MEMORY[0x1E0DEE7C0]();
}

uint64_t sub_1A6123DE8()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_1A6123DF4()
{
  return MEMORY[0x1E0DEE8E8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

uint64_t geo_isDayLightForLocation()
{
  return MEMORY[0x1E0D278F8]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x1E0DEEAC0]();
}

uint64_t swift_allocateMetadataPack()
{
  return MEMORY[0x1E0DEEAC8]();
}

uint64_t swift_allocateWitnessTablePack()
{
  return MEMORY[0x1E0DEEAD0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1E0DEEAE8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1E0DEEAF0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1E0DEEB28]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1E0DEEB68]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1E0DEEC40]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1E0DEEC50]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1E0DEED08]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x1E0DEED18]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1E0DEED20]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x1E0DEED28]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1E0DEED60]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x1E0DEED70]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStaticObject()
{
  return MEMORY[0x1E0DEED80]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1E0DEEDE8]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1E0DEEE70]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x1E0DEEE90]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

